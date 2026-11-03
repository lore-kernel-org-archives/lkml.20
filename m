Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716914;
	b=wiMGZ4XIu/qHE5Dkcfzm/rW9kamSOKDaX7PuAKTJ6phEE0OuasUb63rQIIfYwhgCXr8h
	 YjK0dpJYdmhOodP/OWB+3XvpawRoRk3gEotoh+oDfFO/888Pm9QwPwQg0He6p7wDQQFMm
	 Mef97uFmmMhdzwrAs5toI9PJ7luJGqr0NYkOk8fCixXCcmTvS9pb2TwIsFHRTgbt0jRSt
	 7wGU0sWedocPrIbylArtqC9RB/u6TYd2ggSrJK5DXrrNA9wrdmf6wYWPI/QdzggcTqdyQ
	 yoxuBWZ2LRNBVdeGjpOizyuvPCNR+ZfQnyEckcsXVhicTae/4f5EQYUF9fFnH9Df18w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=wAZrtUg1BsyNyokf7QV/XjN8JssSgTHPtRi+FaZ4x5k=;
	b=wuvoxNomH+fuQ7o6RC79hSeJu1oTRTkwOx0yJOXaLRGGtajSbcuaeBlbBRRVj8v+N70y
	 2qLd/4Vy4BvCCNuJybp74n1lJ2/MssBvcBzI71uTDpMCYTQBiOV3qm/IKijyKDjO2JkFx
	 x5XiIGvgtHx6XYpdApss9KmHMgIldecKRmIGesMs7TwipKE9zMRYLcmJE0C6TlCRfixwM
	 41CdvqYatorvxOeKMyJsO/WFpQ1S+ok2x1OFYAT8mAjnoIXhN+VEmW0wSlLtU8GtTr1vB
	 7ppxpINxK1rtzBrVM52iFfitRmPHrdmiJjFOC14swcdFcCwlZQnIMEFNizgIPCw723w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EcmgInj2;
	arc=none smtp.remote-ip=74.125.227.129
Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C90E606A33C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:41:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C90E606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EcmgInj2
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-3ab37ea4798so111213a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793716913; x=1794321713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wAZrtUg1BsyNyokf7QV/XjN8JssSgTHPtRi+FaZ4x5k=;
        b=EcmgInj28Z/xNpXnXxOAon2wrmz0QcoPVbtbQ+dQ/l1NrXqh4Jt+hVHNv/Tq10DxEa
         0rs6/T+PYEbYVQ/O/13R8nO2zv7Ta3OCcaXdg0sH/i8rWZDINWSu0X5oXNl39Mx4TJXQ
         As+s+MyHC4cr6xfWL/B6dVsNW48MlIqxaa0sJlXoKkj1cspZTkMiPSJv73sF1bRx2L/8
         hAct1/B3l2XjJgTIgnfdCxzQcHrlXDe6VAlY+JKXxtU1LZ/IFRTOQ8uxVlQj6mbKCK+V
         wP7cBPxIeuvcP7XK09bxQK/2VbivpumqkWm+gg8r5UcZdiElfM8Bpi43DVGmD6USUxvh
         2BRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716913; x=1794321713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wAZrtUg1BsyNyokf7QV/XjN8JssSgTHPtRi+FaZ4x5k=;
        b=neCPBctnJOrkI6iyCdLw6FE2q491bJepVwgaKULIBBfexX4eKc/v3CmhgSMGD+ReSw
         3ynsUXydcWG9YJIGjIs810OPGV+YVygggZoFwjSkC2rZpVNCT9Hx6MXOpQ7p9VKl3KYd
         DN5KvaownmcdQ8djobyc7pvuwXMR1s3X/P+vOGCKD5d4pfzuwckzx5Xk7VJfa/xyNyAW
         eREC03gaL2j14WoL9O6K4pTQxt60A+875vVPxhkEkslls0EBG7pi6ASnSwBKlwRgXMWm
         m2ubN6cB8nq8ytgxxlRoIugnxtvJBB5inBqqWiNlsvqQRrqKLnpvSRusAPIHDvahne05
         iA7A==
X-Gm-Message-State: APuU4Z8vBKwo9NSO3yG6/6eCmHFwfMSzfNLPVesRFv+uYdKIgxd/N/kQ
	cSvs6puaZ1QC1o26RDyDwm/oop9rInTKdhC2yLCsGThCmfmeIVdxfTaSJHIxUmvnVd0XZ2hw
X-Gm-Gg: AYBFou2GtKhC22tnPdju3Vk9Jdka0wSm4tkfyGgnvb4gw4AEyOzuVizzl7VKE74tZtu
	vI853IUPXhVa/S9K6Th0Z3XXOqOwl4lgiNOGfi80e/hfBEGamSalwV1a5UgWGtofnCaeerj6Dx+
	7TGs4pZ8Q4ZNWuTQyklprLXdwhWyHL5qRTAXpzXKfEeRXUeW3kPEJNd2M9ksRr1nhxvnvkCm7cm
	q5IjewY0lKti4ivHpZUa7btWnGAeSKnyzkOq8IQnxoSU+BI5Q/Rd+LgZ4a1RrLvfp2LPXYH27ii
	o03msyb0vu4FmE+hqKArZmerz1q0QclKWOHp5oHb7N7WeKvZzKDCVPpNq10Mv8YHv6Gg3XATEVD
	RFQUWKx/2DfCMqVgcFr39WYkw78BTUbZLirMHwDnjyMlvYMCJaOfJCHrwa8YW0uNXxM0yYnsVaf
	nef5bb/rxHu4Fnlv2suZ1X284mpKePktyAtpuiLiAKb/nKe9L0A+3zf9YbA2UE8JVxygdjAD2WU
	XpHdpIouDOZ/wFvnPa1KXp1zwjhamsazGZsY+m/i9JJslSyTFHsFOWXGCksdAaZmvGDY97Rjk/Q
	Ka4VVm5O/6glUF4Tl/ACPwh0Jyuo44hSLkX7bAzLkqrkop/9A+s7YhkLC6AvTzSlluVBNyuBhJ9
	tQmpDX2RLtzpU8uEcbh5uJi61tp04Ne3giREDvpbLYF1VxBmivG86Xlzh+kKYaKgCNQ==
X-Received: by 2002:a17:90b:1c87:b0:3a8:195f:186 with SMTP id 98e67ed59e1d1-3ae897ee656mr9705547a91.42.1793716912532;
        Tue, 03 Nov 2026 06:41:52 -0800 (PST)
Received: from localhost (ec2-18-182-19-4.ap-northeast-1.compute.amazonaws.com. [18.182.19.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae87f99899sm11006962a91.2.2026.11.03.06.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:41:51 -0800 (PST)
From: jianyungao89@gmail.com
To: linux-kernel@vger.kernel.org
Cc: Jianyun Gao <jianyungao89@gmail.com>,
	stable@vger.kernel.org,
	Carlos Maiolino <cem@kernel.org>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Eric Sandeen <sandeen@redhat.com>,
	Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>,
	Yuzuki Ishiyama <ishiyama@hpc.is.uec.ac.jp>,
	Dave Chinner <dchinner@redhat.com>,
	linux-xfs@vger.kernel.org (open list:XFS FILESYSTEM)
Subject: [PATCH] xfs: fix spurious len double-counting in rmap three-way merge check
Date: Tue,  3 Nov 2026 22:41:44 +0800
Message-Id: <20261103144148.14430-1-jianyungao89@gmail.com>
X-Mailer: git-send-email 2.34.1
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

From: Jianyun Gao <jianyungao89@gmail.com>

In xfs_rmap_map, the left-edge merge path already executes
ltrec.rm_blockcount += len at line 1119 before checking whether the
right record is also contiguous and can be merged.  The subsequent
overflow guard therefore must compare the already-incremented
ltrec.rm_blockcount plus gtrec.rm_blockcount against XFS_RMAP_LEN_MAX,
but it incorrectly adds len a second time:

(unsigned long)ltrec.rm_blockcount + len +
   gtrec.rm_blockcount <= XFS_RMAP_LEN_MAX

The extra len makes the check too strict: when the real merged length
does not overflow but the inflated value exceeds XFS_RMAP_LEN_MAX, the
three-way merge is rejected and the code falls back to a two-way merge,
leaving the right record unmerged.  This produces rmap btree
fragmentation but does not corrupt on-disk metadata.

Remove the spurious len from the overflow check.

Fixes: 0a1b0b3855cf7 ("xfs: add an extent to the rmap btree")
Cc: <stable@vger.kernel.org>
Signed-off-by: Jianyun Gao <jianyungao89@gmail.com>
---
 fs/xfs/libxfs/xfs_rmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/xfs/libxfs/xfs_rmap.c b/fs/xfs/libxfs/xfs_rmap.c
index 14aef87837a9..c2b2f8e7502d 100644
--- a/fs/xfs/libxfs/xfs_rmap.c
+++ b/fs/xfs/libxfs/xfs_rmap.c
@@ -1120,7 +1120,7 @@ xfs_rmap_map(
 		if (have_gt &&
 		    bno + len == gtrec.rm_startblock &&
 		    (ignore_off || offset + len == gtrec.rm_offset) &&
-		    (unsigned long)ltrec.rm_blockcount + len +
+		    (unsigned long)ltrec.rm_blockcount +
 				gtrec.rm_blockcount <= XFS_RMAP_LEN_MAX) {
 			/*
 			 * right edge also contiguous, delete right record
-- 
2.34.1

