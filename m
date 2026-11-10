Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333545;
	b=pJ5juovs1fHyZjy07hjaXPmlGJGq+wygYfcnqf058KuPH7hfBJwVSmlgDr2IZSIPFlBV
	 y1nIHNzx+7H1fDxUitSO4bilcLDMQTvto5umNH88CfY+ulBs6OHlULJOqXG+nLNgfx9bn
	 B/hLb/FIv3rVXVKSd88Bn0RsZC38EvmhO1T234giOhvnrWLVjtLN0iA4FwcotlkVG9QwY
	 zJr14EdRUlUZAIY/0abL0+7Wo/kgvx83HSZhgIvG6+whR23Hb13KJKaGROh/UFEopOylU
	 qaiHArIcFmVJ7aLtMuZB/5kcqKz0frUo48NH3Z3cfH7Q6tKaon1OD9UDDq29iGe+QSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333545;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UdWoH3rxAMjJSmiMO2Z1kLng6PSZrZDHaGMrDeYLQBM=;
	b=bjaKPxyZ9sHaEIJc0jNQQued3WBP6fDJtmZKPJJHUnBAcajUMHj48ebKruEnb7reC0XR
	 0jC7rKCqatW4S/PUMT8cpdfE8YYtWkHP6P28S/sPzivCeaC51lV+6HOq/s0/SX1sYXLn1
	 LOgE2wWoFzWeWyaDlf5L46IiVFRUQguTV8rhqCKH/VWiSYxBVQCX4uX0fYvpbiUaCFpMx
	 MhX0ClWeXuw93rSRvAg8zexlQ1/gmqFc7PtwTXhO8aoweuW1w/+wa7omurf3fJlvFb4n7
	 KifC6WxjcH9IfsQ9NeZEOuoK99qlAH1WtDrMuZNL5PH5z9yaHYuuLEECj0rZqMupOAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T6KcfDPv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CFF606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T6KcfDPv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4101E1F0089F;
	Tue, 10 Nov 2026 17:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794333544;
	bh=UdWoH3rxAMjJSmiMO2Z1kLng6PSZrZDHaGMrDeYLQBM=;
	h=From:To:Cc:Subject:Date;
	b=T6KcfDPvuvhcTh5izdDR0sRVp1z64wkzniIfscq3Bjhm8Xpamtaq1jCi92FDfB945
	 U9Fn9MGufVqP1b3mA5j4TaX3UcqvQVa+PmVM/elB57keiEcmVGrmFPefDWP8V/My/+
	 LNqjiNLKRInYv5ofbJ8G4HO5WgsGAAKoN0HsixJRw1zSfWthS5OEojSb7BOOwXRoYZ
	 QU7QMW11vn7ZPWqk39nQqauKgvlzzoD3p92E73oVIq1Hds6Z9C5kdsRaBDTT1hJh8D
	 AZHDC4uUgeZbI4K2M0OmYN+5wyVW3NwVI8oGHCgGa5ZETSEpNij4PTIR3RDPYY8iiJ
	 PvFbFJ2F8krxA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Samiullah Khawaja <skhawaja@google.com>
Cc: kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v2 0/2] memfd_luo: keep memfd frozen until finish
Date: Tue, 10 Nov 2026 18:58:51 +0100
Message-ID: <20261110175855.2437084-1-pratyush@kernel.org>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Pratyush Yadav (Google)" <pratyush@kernel.org>

Hi,

This series keeps a retrieved memfd frozen until finish. The main
motivation is to let dependents like iommufd have a chance to acquire a
reference. It also fits conceptually: finish is the point when the file
should be back to "normal".

Patch 1 allows keeping private_data from retrieve to finish. This is
needed by memfd to keep hold of folios_ser, which it uses to give up its
pins.

Patch 2 does the main change.

The series is based on
https://lore.kernel.org/kexec/20261103172251.2348370-1-pratyush@kernel.org/T/#u.

Changes in v2:
- Replace the stale reference to the 'data' field in the struct
liveupdate_file_op_args kerneldoc with 'file', 'serialized_data' and
'private_data'. (Pasha)
- Collect Reviewed-by tags from Pasha.
- Rebase on the latest liveupdate/next.

v1: https://lore.kernel.org/all/20261103181916.2462825-1-pratyush@kernel.org/

Regards,
Pratyush Yadav

Pratyush Yadav (Google) (2):
  liveupdate: luo_file: allow keeping private_data from retrieve until
    finish
  mm/memfd_luo: keep memfd frozen until finish

 include/linux/liveupdate.h   | 11 +++--
 kernel/liveupdate/luo_file.c | 11 +++--
 mm/memfd_luo.c               | 87 ++++++++++++++++++++++++++++--------
 3 files changed, 83 insertions(+), 26 deletions(-)

-- 
2.56.0.542.g3ef89b7020-goog

