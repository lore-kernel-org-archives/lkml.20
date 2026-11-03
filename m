Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793729968;
	b=GDraxKsWUMv4WQodQAdCzGF4OTwKkLoxI0KMQa9axjyFE38EVKUXi32KN616iOVoVXPT
	 WUjMdm2mJNmjag9mL0Ndxvo1SS8SD8j9PF7bsIM6QYABLT59E2Fx+mc2UaDg5S/a9QBLX
	 NTazvuThyZSd/9tc/BHFlapRrORxXjLxdtLxyWC+OZWJguSQMoY+Cs5v8/ZJb1T8Qnhfh
	 Ne36jXWcROJBuZRypEBe20iZC531wB9FvaEJttJna6rv/xaeLIKB4wPyID+TaiLK5guX3
	 PWTPx7gesce+OnL3QEo13meq11R5RstSosKL2jaEn5iZGuLF9dwdAlHp3wUIPgTEyyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793729968;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=311d7n2dqnSPEAnLl6q87tl5I8DFqOkQSr5KKtyq8g8=;
	b=mLgLo1WaHwYuATU1pAOFe+LJZ0NGKUtd5i5b0E7T6E0LawVkM7Yw8VrN0F/Joo/VdVgd
	 XoP4HcBKdxLoBo9a8YbRxrsVv4y6WYvMbczi+yIS3XCvDCgWun28FJY3R1mj81tVipcVJ
	 0P73CVI0Q0UQsICAVlgzLyrtG5c54oc3fVB3sDbymXG926yWgsn5B8nRIdbgRGJocBQSx
	 1fsSaic/yftEX0cdz2hgOsmnbxScXptsXfKL1Yz/o4Xf12q7fJ7qTAbuf+9CIu934XXWt
	 nrU3fNpxwx0C2kMJiqvZVh6Q9oY14aMA+xjJUqOs6bH9Vp6t3TCxcGC1flxDGy+SzvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fq1rfYgK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214E5606EE92
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fq1rfYgK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60C0E1F00A22;
	Tue,  3 Nov 2026 18:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793729967;
	bh=311d7n2dqnSPEAnLl6q87tl5I8DFqOkQSr5KKtyq8g8=;
	h=From:To:Cc:Subject:Date;
	b=fq1rfYgKXk42I9ToJEzH73Q9X1IWBI2kJKuMUvrEQ77nSva0xnf9nltI88RY3onHu
	 K7iTQ/pcQotwqKX+7eB0AZvkGVaT3W0tjqSbV3FTb4Jt7iDPVp1GaHjPjOmSVXazRT
	 C+jVBJ++MckWwU4WdjJn1dxNX8WRr7TArZ027tWwy2SsBA4oOPMKHtsOoc8D5WYUhz
	 qHAKOWBsViGGU4HsnJKHMIyNaIlJNkLendDJJZE9U5OcNxan2CFopA3mLqgMUa7Kqz
	 G6FVmtWAeKYlO/H6YyJYIRAwQyFMwNvn/DkYO55naShWgbwsLnbCIEB9gfPUtMaR6w
	 g59g4NhKrEQlw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Samiullah Khawaja <skhawaja@google.com>
Cc: kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 0/2] memfd_luo: keep memfd frozen until finish
Date: Tue,  3 Nov 2026 19:19:12 +0100
Message-ID: <20261103181916.2462825-1-pratyush@kernel.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
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

Regards,
Pratyush Yadav

Pratyush Yadav (Google) (2):
  liveupdate: luo_file: allow keeping private_data from retrieve until
    finish
  mm/memfd_luo: keep memfd frozen until finish

 include/linux/liveupdate.h   |  8 ++--
 kernel/liveupdate/luo_file.c | 11 +++--
 mm/memfd_luo.c               | 87 ++++++++++++++++++++++++++++--------
 3 files changed, 81 insertions(+), 25 deletions(-)

-- 
2.56.0.385.gac671c819a-goog

