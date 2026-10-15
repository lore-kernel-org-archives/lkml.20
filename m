Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F566515880
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059853; cv=none; b=Ai9j2u1r3zWee5T3nsfuYOnz88O9k2JQrNR05MNjI+cxWS8ubcA17OlgNrr0MWu69eiT+Imbt1FC5QicFqeUALPJREH5gfyixRpeRAsYaZUCCbpJaHJAW9Uv6o5coM6nPP1qKaUoHw3SZ0kl9HJyx3jn+0hxCcNxXGd9o1VvLhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059853; c=relaxed/simple;
	bh=pGvPZxYQqsPDT0NieGlqMGA1j1B4VhkvXqUEbOfXDks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nu9BMu76+hWasfDeXRXQ2ZAnsXRIk14+/rfuJ9alr4i35BBmq+P4kIrmS7jpAM+Nea8oMwyWvHD3dsM8aSjrQ/+ekL2CVKkV1guRxckU17M3M/Ru8itCJ7ho6UaFVA5OCqPPFNU26srbOgvgQU1C8Gb7L17k2Ts4Iho+iDW6lhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LpxKabw0; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LpxKabw0"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c3f5e5e4c1dso48187866b.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792059850; x=1792664650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ED82b6L34mz4qhKpVZQtr88/BQW1IKL21JdDQLu4khk=;
        b=LpxKabw0qPmFJKl1+ST4agaLcAkK2YZ5c1iz4GakhNp6VBConLgnqf0SVDG5RDAbAa
         1NoumD4XG5nmijOoqxtzCKDAIaFW+vUn8v5CxDxybI2f5Rm1id2HdxLuE+kA2Bfu2ZCs
         BeVNE3hDMjMU3k3305ZsNER2a2p8LD8OwE3SUpCltdC6usJsKxJZpXhUICs8tzS/qC8M
         46D/zMfc4NArdjxSnY6i0uYm5n29w70+nsuXm5j1qa6VMWbA826tySAN2G1Qx9hc6Q7o
         lRWgmZbgIy65ESRvhFOQCUz+5dAHd/61AALJGgl2ZRglS/gSTUrryKJsmWQky54DoBCh
         j83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059850; x=1792664650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ED82b6L34mz4qhKpVZQtr88/BQW1IKL21JdDQLu4khk=;
        b=dj2DymjSFk9ogM1UVqmXAA2fqo/eC2BMRXCpVdKXFXDGtk148YCRlwn2nNkxMCM8uQ
         x4MEyUPSppqL0T7ORzSPSaq+JhTuSkJlec+kFQMwLGleCRyjsTGUGR+8x2vEwIpuSxdb
         smcnlLQuVdjn8wdLE/4x+3y7q5Nunk7ifPYKcYiBIchM85IrNzKsrOkL4d2tMPv+V3fz
         eEMsPwXMgM74B5h5iT5EZpBHv8bR2YHw3ekJkUY3iPuaCKizYXmbtDlp63W8Nvfym+eY
         16O1t/LVt7yoyeQRefoHrv4rWmXuh9hmCxAVvjDRE6CG+4doMGDaUXRNOIqfuuo6ShcO
         CNoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMHzTvCadLkFveIO2VD9y78KU2deY3Il9ZsVqu7cptkBCNac65+fU0upZ9m7fHGtLOpz6oG7W7K6/6WY0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHfbuWi/oyQ8pp35O+BwbFMghDUNMmFr3fEhUn6Qol6T5xzmEv
	PbMpfLyqZ1MpdmEZRoBC0afVk3RW+lTdea30XDxkLXb4zEf+KvsX+s0B
X-Gm-Gg: AYBFou34elnip0Y4HxTS9Vi0Cvej39RM/BVRnCAcyTOLSqFtQsMaIi72SuJyAsl7/CS
	Gy0WefXNVLcYDRQY3zIY7/3b6ZSgAMfYg8fwhvfpBKOv/CX4Jd5ZfkRvy2yHn8iWDPZQFBvco3w
	SaipOfmjOV68WGvzWWd1b343EJkoClow1n/leisrg9wqycTFp+mbnPACeI/1/OK+8kr1v1ZHS7U
	K8h8TT2Q149kkirewq7Hg0MgIJ6xfPCK5re8kbEbr4XSRp4yl8bfVJgiWuNe0uZtMmhAqdYlHl7
	aAak+3a7CTYULRyS0vydPnB/s5e1HaGOQ2D2cHsvLK0k0y75fcrgk0SyYzDYGLupxfD2o1yD4y8
	tJpJPIHPXZ46GKMNL+gA6dsh47ljDIQuTogd0xb56xahLTdkH8yMypDouV2oa8eiPE6V1rU/+yb
	hIrGS7rKOw93a1V8g60XZ6BTxEffYzEl0bqSDHQ1FaYJRPLTNSLY+5/JM7gfnsvcsL8v2U3SFVb
	/+IoIlut01u5sCalcZ7Ogbgemj6Eb0LrIMmIHv6VA==
X-Received: by 2002:a17:907:e916:b0:c3f:84aa:af0d with SMTP id a640c23a62f3a-c3f84ba35f3mr84289166b.18.1792059850126;
        Thu, 15 Oct 2026 03:24:10 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3edab13f4esm108371766b.87.2026.10.15.03.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:24:07 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v8 2/6] alpha: describe the Tsunami system machine check frame
Date: Thu, 15 Oct 2026 12:22:51 +0200
Message-ID: <20261015102353.999695-3-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015102353.999695-1-linmag7@gmail.com>
References: <20261015102353.999695-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the five system-specific quadwords in the SRM logout frame,
as documented in the AlphaServer ES40 Service Guide, Table D-19.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/core_tsunami.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/alpha/include/asm/core_tsunami.h b/arch/alpha/include/asm/core_tsunami.h
index 3391e95754f2..fe3fd4570fac 100644
--- a/arch/alpha/include/asm/core_tsunami.h
+++ b/arch/alpha/include/asm/core_tsunami.h
@@ -283,6 +283,11 @@ union TPchipPERRMASK {
  * Data structure for handling TSUNAMI machine checks:
  */
 struct el_TSUNAMI_sysdata_mcheck {
+	u64 sesf;
+	u64 dir;
+	u64 misc;
+	u64 p0_perror;
+	u64 p1_perror;
 };
 
 
-- 
2.43.0

