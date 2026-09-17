Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526044349B2
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789675724; cv=none; b=ArFDDKJxoNY824A0lRcb7CIHk85zCEtqof7UMnebEFihYwWD0iQW7F/8jr0/vwjw0VrccduTBOdxHB7mBDEd7q1A55Jgpu1VlLItPVCCprPdOMEzlpvVeCdpq+yYfujfO8eirewbmbSBG3Gg5JJs+h+DK6oymX3kcYInKNBXLzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789675724; c=relaxed/simple;
	bh=c3HGRrbnWOWFQra+UhT4B1+Acx3bI7Nw6k8KeWp9BS8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YgRR08042ljN3I3SKjqZT60GWh25hMxlCScY4qf1HxJFx4nctkRJUUArgvb97ZQfH9uFwjOxPUyBnTifPsVEjex4LNeuXZ7LJ33kk72fwEjrMU/U1IRmVJtfPckIthb48wr3sc1thkgvuML6m7dtqfwIeP3EWEP8z4T8NGZ2VPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jen6q8ym; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jen6q8ym"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f0135fso391035ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789675723; x=1790280523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uxeSOe3mpO7CBa/xPERrffZOLH3W4cgq9X5vRuIxJTQ=;
        b=jen6q8ymJASpncWVXVmPn46vw7aI+VLYZASMpnX1Vkq4SxTuimukIAoLc+KHMIftUK
         f4YZdBIc5yEtahTyca+iwKJCqeKZX0TVR3n+T/U94iJKL5blp+6zzZ/xGnHSMEvWE9go
         BnH9EnYa1eArbzw4TU6gi7vlu4Labi/Yoe4S00RPu4XnNCDMcRQrQ7teI1z1msNTrVBr
         N61v6s6M+CVYxE9HE7HniccQV961hIOiBV1FcS8EEo/mt5c/rxsK0D9qP2ZcqCC/VqCE
         qKXWvAB9FPUBJkywv4g+yfQhdUtXYywsFbut65gY95T9POuSvudbCUr1K0CeRlSDYtjF
         0m9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789675723; x=1790280523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uxeSOe3mpO7CBa/xPERrffZOLH3W4cgq9X5vRuIxJTQ=;
        b=YnmDrk+WJqxNB+FHskoUaljhzvfluMfvWUzFfFZnL3kEASw8n7pYqgNcjoxe6PbNIx
         i/dJeWV5k0Ft0wSNDWgE7bulszw6dxboZUDZPNtnlBqtgL3Yl7X0Wo4Ka/tERNmVqgt2
         QKIxb0D/mk1bgVl6ST0IsqXv7r0vtiQKAGAMKK2RyaoyH7yKh1V+9I1vGMPcN2cVsGqk
         /a5n8L8uWyMDIO0afOrnDPoxNme4cGjhXtf1EZ4M0AZ4PXAcXi0SIivNweo0ey3ZYz+2
         GoRdsCXS+7OxqroLRDMdlZfx09OuwFdRR2MkzCIJhUq3jBc5n1DFaGJ7Zohuo+lMs1NL
         JTgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwlXHjWwp4HoP4ryZT1LTIXD3IJtm2uPH+NuAx97CbgF31dESAvAkuqcHba/xx5SgtQTeYTA/O+EL+58Aw=@vger.kernel.org
X-Gm-Message-State: AFuF++kLrZfOKAs8cOntC/9zS3ydALwKPT5ze8FoWbyItjsqIw2OHwbn
	UxPOLdZhwGPT2FSpIdRuAVTV910k7zfSCduHtnvDrIl4M/HWTbffYXl5eDb/V61X
X-Gm-Gg: AYBFou27P+rk2JW5Y6anRcZAIbhbr27JQb5fkfBLR9Exw9VVLQaBK7O8HUwIzDvkhMJ
	PETGh+GIDjSRel45iuT8djXX+0QfAY4YlVQ1NYvehO5hYAZLR71CXJKB4unaqssGIBiVvJ9g4k0
	hM8GoxvIFsrffmFXAI0YUnzjLIlEmVk2Q5Z6f3fS1jMxWqgAbnFnKeWiVMcogV27ahekvj4cRA7
	64p5DHidF/APP+nSpmsjwg8gYsPSDbtLHNKuws8J9fLSjvLvMH8BH1ZlAKR5eGE7sn4UM5myhmd
	Jeu3nHbY/YKa4hDcHd6TcBCaDe2n8Z5W8oRj1d/qfVhfxlKA+jJR+Bw83rjVewQl2iF7I4nnvpe
	SpbTVVAVJrc3iPU18SQ7DldX8e/WD3omhW/kLY6s2XxQ2kSStbxa79GB27Kfb4p6vcG7lkvDvxB
	VO+kri/pPyV8qLFX1qDIE7v4dkaz391Rbdeuogmq7OMLLk1b9ZAXcFgf7yebrhd2j/RJZQKudfh
	g==
X-Received: by 2002:a17:90b:35d0:b0:398:9c00:29ec with SMTP id 98e67ed59e1d1-39e54d365a8mr510352a91.20.1789675722693;
        Thu, 17 Sep 2026 13:08:42 -0700 (PDT)
Received: from G15-5520 ([103.246.195.44])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b2753csm33881159eec.31.2026.09.17.13.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 13:08:42 -0700 (PDT)
From: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
To: Carlos Maiolino <cem@kernel.org>,
	linux-xfs@vger.kernel.org (open list:XFS FILESYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
Subject: [PATCH] xfs: replace kvmalloc_array with kvzalloc_objs
Date: Thu, 17 Sep 2026 20:08:35 +0000
Message-ID: <20260917200835.31027-1-lalitshankarch@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace kvmalloc_array() with the more concise kvzalloc_objs()
implementation.

Signed-off-by: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
---
 fs/xfs/xfs_zone_alloc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/xfs/xfs_zone_alloc.c b/fs/xfs/xfs_zone_alloc.c
index 28c1e48909fa..82615045aa4c 100644
--- a/fs/xfs/xfs_zone_alloc.c
+++ b/fs/xfs/xfs_zone_alloc.c
@@ -1238,8 +1238,7 @@ static unsigned long *
 xfs_alloc_bucket_bitmap(
 	struct xfs_mount	*mp)
 {
-	return kvmalloc_array(BITS_TO_LONGS(mp->m_sb.sb_rgcount),
-			sizeof(unsigned long), GFP_KERNEL | __GFP_ZERO);
+	return kvzalloc_objs(unsigned long, BITS_TO_LONGS(mp->m_sb.sb_rgcount));
 }
 
 static struct xfs_zone_info *
-- 
2.53.0

