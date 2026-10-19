Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421851;
	b=0fZQBcxobdAbRvOLdTOmpQyxbMAa7WWwMnMVEbn1vPH6talT9J/K66+FoalsU7JHXOxO
	 EvlV3+QMdOqJCAyQdLeZzRHM+j2sMKP/ppXdAJLATXRFD+heoD4oy1xacNgcN2ZnjAltN
	 eCkGe7FTCBfhs8Hw+cwWSYsPodh+GiTc0GC2QXxTvj5zFeO786vWOr0BZU+6xLQbgLTG+
	 EMhE6kyQrOV4u2MZpPzj4dOTicGqCE4ijNnLe1BlpA7DdSNMbnCerIotaiy3SGUnUrDyY
	 a/xwZnfENtgekcnMcnqIsc75Tr/+xb5wx3aYVxAg9yL75WcAeuGqHEovj3WaJRLOttA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421851;
	h=Received:Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=CC9KOYdH8iipSn0DMAkiuxxsVI+upeJ/ejzJwpUoiSI=;
	b=XeE4KiEHWJICSyNB16l+sc4NU4ClnBbaCaYDrt2J3NRUckQcLInZPgJkND74a2POy9e5
	 fGvSEetkvFuLvDhkkdpXoshcM2T7o5J/HEkd+dYzZyry6HQUoU90Yw9NiVZvrObV+4/4d
	 qbxBWKu8DIi6xYt6PR3Z1EG1A59Tw2oCaOcqvwD8bnUsaVyhWDutkiL4GFdje/b45lYnw
	 5FRxk+GVA2pqcUnuYUI0KFbCm9dQ98+EY18mF28wVoNBZKVDWtgQUBh6XqRJ0pDJQxnd+
	 mPldxgtz7B3VNQSIkZcYSBH7u52XYskq+l5JD9pNevOD73bAhPr+826uwTU9ZsgfWfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f972M3PB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D387A60740B2
	for <linux-kernel.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f972M3PB
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6EA6513F3
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421851; cv=none; b=gV8kXyZQdCitXTQyRwe8j9Hu4iCRUYjk8FyKWNiZyogaZbPOdQTsHtDwMCsBFhe6PunjayUiSc2OTagg1jORKjB8j5MAHyiauNW+Pxo3Vcg0k21K+EoNJh7hAO25SblTb6EKx5UviKEYPNr8spP/7/hXaST7S4kFdNoBaGFF2oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421851; c=relaxed/simple;
	bh=h46JYwZL+29g5uUJsUhXDYs4fuoB9mGkH+A6SooeuuA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Y1+oprenrKHbsKKLwWLDMpO8E/uq2VTEm9VcPdVLsrbx0MxxhtNEUn7Bi9ARyw/MAKCQOqnWhpg8Q2FlIfZ3QpCIZyZqazm1xrAJXDZJ40dNg1lmljHX3d7ESQd9poTpn7V3rCbLFO2l9DbQtzFpHsWwxNm2vyObtvoOLQOwoyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f972M3PB; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 366041F000C4;
	Mon, 19 Oct 2026 14:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792421850;
	bh=CC9KOYdH8iipSn0DMAkiuxxsVI+upeJ/ejzJwpUoiSI=;
	h=From:To:Cc:Subject:Date;
	b=f972M3PBK9ekots40MMWEY5ROIY2rhSMd/l94jc3k0g1i5VxdouGTo5354POAC4vk
	 lXNROnuTJldCeq+2zLMrY1+lvz5e2yFfEDEatMsp90DfAPcKTp9WP3GfDl86G3ygdH
	 pZKnolE2NN0vgC19WAzRMvvOW2cee/nO4khqnPBxRsMLHgC8Ohfh9e/sAJREH27XuG
	 pTMKU74q5kj9Ef5IPpdLMM44D/zog4WpwJ4CHFGiV8ebjW7vxeVc+mdFgRsFwKR9En
	 +fxr7zjbVgkZRUP4RDyF984+7XM9VWLjAuHrRN8Omz+Z2oceH1iMT63vbh/o2KOkbk
	 Y04BNk6DB+Wtw==
From: Dinh Nguyen <dinguyen@kernel.org>
To: torvalds@linux-foundation.org
Cc: dinguyen@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] NIOS2: update for v7.4 part 2
Date: Mon, 19 Oct 2026 09:57:21 -0500
Message-ID: <20261019145729.2619867-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit b963f2345fa20417401c51a69dedb6a58eea33a9:

  nios2: fix __wsum type degradation in csum_fold() (2026-10-13 18:37:54 -0500)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/nios2_update_for_v7.4_part_2

for you to fetch changes up to 2180d11e06fb56fd13643ae59964f144896870be:

  nios2: ksyms: Declare __mulsi3 export (2026-10-19 09:24:54 -0500)

----------------------------------------------------------------
NIOS2: update for v7.4, part 2
- Declare __mulsi3 export

----------------------------------------------------------------
Thomas Weißschuh (1):
      nios2: ksyms: Declare __mulsi3 export

 arch/nios2/kernel/nios2_ksyms.c | 1 +
 1 file changed, 1 insertion(+)
