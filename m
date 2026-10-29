Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793314667;
	b=Gm0GC2OZ7s4QUg90a3KzfhU8N5Cnk6hLs5Nso3KMoOhR3JEvwTjmjsxQZns/s6YnMAiM
	 iOt8tIn4T0p4INOHLqU4a4GG7swbHCXQFEtXiEmRMavj7T14EFBFbqmJFlH90qadBr9Sx
	 hWFNUZpcpWSxQhETD5RD8hEPFJ8kP9vD4TRqWsU/56ReFRn2ulhOXe6D+bmMFZPgkzmO1
	 Dz19yCTAFPQcJoFc9B+kHgayyl+18vbuHNJpCvA8Lfjjqx1nUWMulP2TlulUnPc4aIhVX
	 sOMa+R4/O0iLE6/cXJWOq/BwvZwz0BFyaKRKiRsTVAkQN1Ig3jML+4FikbWY4PYZENw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793314667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=h5Hpaazv/PJJXvnma3M/buleF7hZLhW/TVfnybhiNnk=;
	b=o3WdUc65d8wgYmf1oFFwl7+H/uRGyGJj6dRWQnoqGLNKqrhWUX3zjtSrg8VgYbie5vGK
	 z0g2oZy2IXPHGmTyN7pQ/k9LNP0QHWzKmQUaWxYXWee2JencABdmcMxyxgxtMKGkE79Xn
	 4EJu9k6RIPEmjv+KcZwSLXgqO10+G9mGdv4e7YVKCVrDrL8GOGbqvYrNBCdMfszvEjZhO
	 w6W5p+5CGEvBQFEZXFBWVd+MMywwc1AmLd+0n1MwqOtBS76GfRg/O7c3X9PT2UmxBy0rx
	 odyOVMIHh5DhrLiNIs1QwPtUJSvnRQGHCHxMZLjbhiZNDfr+s3yDy/WbzlKXQnOg8Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q4Pk0bGY;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DB4606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:57:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64DB4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q4Pk0bGY
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5363c236a2dso134931cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793314666; x=1793919466; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=h5Hpaazv/PJJXvnma3M/buleF7hZLhW/TVfnybhiNnk=;
        b=q4Pk0bGYejC80Vlg67vDiA4cVoyVezrRwL/1kfbcJktkHfwldceCME3k48jqzEdkVH
         BIZf3TJ+vT12mmlyXb5TU34cFd1GCX5uM6+LYC6SSZKz4TTNPrreQhoKNz68yjxq5KGv
         iuG8X0cBW5FiFjH4wK6SY6XQpOsGGIVJbkJiLeGRFq8ny81jQHabr0xmesjdzbUzzCDk
         nd9lQzo6sBGPzRNeuG6Ua+or8vKb5lX0QBP6GkMcBNVzfEo43rbhlpfLWr0/5AYscHm4
         9FvWolXD8PRa6YTChCqHvPFIoK8UMbJN7JdAKwi0rm/yjbctju6tyJ0GtpXLkUtB/+nI
         +agA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793314666; x=1793919466;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=h5Hpaazv/PJJXvnma3M/buleF7hZLhW/TVfnybhiNnk=;
        b=bwnBod57Doy9clncfhorQbbSUBMrszSnRFTBeTe0vBz96UTbN+JudNGUdCwHvMaFHI
         nPTw0fiBCjKK3FwHId9j5dnGubc7MBiD2v0hicOTCKenu/76+8EgGrFFUyQsb2Ow5BcR
         BHF6+v7tH+udURS1VaocqTsa45YIz5oz2KzKzB9ArEJIDBX7/zBCoIzUeSLDGGCircIv
         9dIm1J/MbPFaG0Izy4cTFO/MyalRN7YvouTQop127G79bh4EdKNdgLL/etpczSxHW7cP
         VDzrjx5jo16CF1Uk+PDwb641SlwORy4s0LfnwnWqAfNgEadaSk9MUju8YnSpvdgC2yxH
         pg2w==
X-Forwarded-Encrypted: i=1; AKwUvBzmXLgAMggjcu3ASbBJZgI0P2RxVpM3SQ0EtwZ0Ns+xSYcKx1BAMc5j+moNlm5fzuEHfMuTFL+KfNj8vx8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDx9pJIpvmUWwxYzt0/dquxXOENwl2Xb+D8igi+kDe3YFCOpfo
	0L6g8cskFJc45UUv2SY4+WuFTg+gln/1CDonQY/nhyGJQu2etepbr2aV
X-Gm-Gg: AYBFou38j0qv1Qw8iXvXTOIg5Jx96pBXE6v4wSlCXnuo7N9NwWkR8ueW+vwqe340zw5
	Wfnl9eMunNP3QDDEPuhjBzmVUYEsxlXT4Kv6MnaQh1zPmpnndMr7GCdoWT5WfrG4F/Y016aVlQG
	4ZrLLy0c6YVb4alpd0ZJ6Lv9K3LkKYIUkxZVfzZgyvTvTZcAT28txLaBIdHrB/FaaB9OvyvVFD2
	rddvGfpEvm7n/+wrzxucnBUjIFbupAdIxTEYFG5zgEx9/+HltZd7uYPr5mlAl1uANZ4T/IUDfVg
	83QdExvGLjHoQE9HQ9yZk25OFuOM3jM/nEpsmmY+s+FyiYjXrRqgtT5KLzwrJzj0FtWgWdnsGab
	2N2xhWdMmMfqCBfFiQ0GCtgdse0kUc7LeCG2IvuWpU/K+GskgmevV7MskHR4U1CJwd8Hb3ROqim
	6mHkNs04WRUmhu9sAV5xSwLeV/7Ifw8IZlh9eYAkNhlCwuM/9qChMLhXs2s9LocLOJ91Xz5xbDh
	cSFxIbTFc//y20QELUhqwoHgZqv+1r6AjBL8ZJkZqDBiRTYdhFhEMOR73nVGY7+nvh6JtZ8I/Zq
	YrlvkegO1/dDv3pYUV3La1/Hb2Qo5A0lJMgmGI++R8GG/eGf7ZMGj0ywiqmYea9sxQ==
X-Received: by 2002:ad4:5cc6:0:b0:91c:7b53:8007 with SMTP id 6a1803df08f44-91ca4b3a873mr10249726d6.4.1793314666398;
        Thu, 29 Oct 2026 15:57:46 -0700 (PDT)
Received: from [192.168.50.231] ([142.255.23.46])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca68c1578sm928146d6.40.2026.10.29.15.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:57:46 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 29 Oct 2026 18:57:37 -0400
Subject: [PATCH] drm/msm: Fix GMEM_BASE on a8xx
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-drm-msm-gmem-base-fix-v1-1-347642c5670c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2M0QpAQBBFf0XzbGp3k/Ar8rC4mIdBOyUl/27ze
 E6d85AhCYy64qGES0yOPYMvC5q2uK9gmTNTcKH2LrQ8J2U15VWhPEYDL3Iz/Bhc5ZuIuqHcngl
 Z/99+eN8PXlurUmcAAAA=
X-Change-ID: 20261029-drm-msm-gmem-base-fix-e1b20418ae68
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.3

This was missed during initial bringup because GMEM_BASE is not used
anymore for textures on a8xx. However other things such as mesh shading
still use the GMEM aperture. Fix it to match the value programmed into
the registers.

Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 5832dc25d6bf..aba2f0d6934e 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -382,7 +382,9 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		*value = adreno_gpu->info->gmem;
 		return 0;
 	case MSM_PARAM_GMEM_BASE:
-		if (adreno_gpu->info->family >= ADRENO_6XX_GEN3)
+		if (adreno_gpu->info->family >= ADRENO_8XX)
+			*value = SZ_64M;
+		else if (adreno_gpu->info->family >= ADRENO_6XX_GEN3)
 			*value = 0;
 		else
 			*value = 0x100000;

---
base-commit: 9c31496a57579d0a46e1eabb8f53ec735b72d180
change-id: 20261029-drm-msm-gmem-base-fix-e1b20418ae68

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>

