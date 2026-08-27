Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B159247D928
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 14:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787842476; cv=none; b=Z0m/tkgp1RE+f8fzNGMxzetirNbd23ojeiLghlpOyjNeL3acFlUim3ms44RWZOFBBg+iixVg3WZ3831cMXYAYs0Luo6ZytDYEnvuLpHhu2w+AmgodFzbmcnH5f9MWeSCRsA4okNtGbLYGjlyYF/oBhRLNNLEJ1TuajHsfIrjN24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787842476; c=relaxed/simple;
	bh=46PIGq8d5dwq/EGir6iLD2RNxpqj6wwko8aqxCWSuuY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aEvmTyXLtCbNUS3ehyYE9wlPTd+cgCBGcz+hGhuzdmk5NXFSuo4i+WTxaHVSc3Roggc3jYNf/e9no4TL44K/3ytj992rKphv9BUizwf8mvslD7EzQGSE2dTSf3KcWMsbuxKEO+mJOEFUVJFGqsiHGHzTbUwh5mQ8aQAFUyCyquw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W6kixxGV; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W6kixxGV"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2caea3f742bso13113435ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787842464; x=1788447264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ytNuY5itueOcMNx/yecsK3/dJNAcHv6yZcEkmSvCgfA=;
        b=W6kixxGVtuy9rd/YZHjG0zeCD8vPjxv80+6YRFofSY+L4PVc2aHsEnGOSEtbsqpWaw
         QkkM4Ki14fvBLZkWn9K7vilfS2JN4MpPQi4cdfesF2i9CdFM2u7DiyeVHVHbMpqc8Otk
         flN4hRJA754/E91X5Nl98ISmx4yBfnub97/qwEhTmjEMy5x0/9IDxB0vE80vpsaneycW
         VxtQ32JRkh/DMXWfdSV/bhAJxYf1LNpEDNIAaddsjpOIeQ7XygEi3GfZvCmof0b4KavT
         vOqVo1+9gaZwZ2kgG8j1xUhLmjkbx99YyXCWWs9KB6hYUYCz2wK5WJiQufj5tTMNHGbz
         nuyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787842464; x=1788447264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ytNuY5itueOcMNx/yecsK3/dJNAcHv6yZcEkmSvCgfA=;
        b=n/SAIAho5/wOOVSwpu3GhOQ/RP5bo54fChLVK3Wx24eNwVCOb/ho+ZcjEaOWPYxrRW
         TlBmesZnapnJ1AqmC0ZPhYK9IXwJsiXgKNGfAUykRg+xqtW6FYb6NYD5zlUTotlzVrW6
         ReYYWaBVkFQLxrcxo/OV+ExpOunammKPDqJPWK9i7iSEQcGyH08PM7F4/laYmjYZalWF
         lDLNMK5FgwMWwIk36PJgHEugQHEsNrdtRtTulLPjj4QqHuxenQvI8eXsvnpXfCYl9/LF
         UXc0yamtjn444X7RxZ1NRWY5cxh0vfOElJRd6wC5O8ZyPUnXSCMDLfA8gz/op2Asm8ga
         52AQ==
X-Forwarded-Encrypted: i=1; AHgh+RqotwHfPOlCsPqmw0X4FIzZ/20TNdNZDEu9g6yfFGsdtnBS+KInmCcPQvnxrQX2oplLTvVeLJaUq8H5irM=@vger.kernel.org
X-Gm-Message-State: AFuF++nHz9fCU+8ShHDc2K8AfEXT0/Fvj3GLvHbTgqzzYNqge51JU6nw
	T4drPCr1WwGgFmAlpbh6e364XKb/uwv16U2MYGNPMe1ph79vhYaBNTLfPJgM7w==
X-Gm-Gg: AR+sD10yQzKfQLw06dDPN0aZuDZJQTk28r1CAzPI4U+7xSrJodUGSJpH3A6MZcAGvjW
	gy9f2plkoj0nWQkHfPArxJIyYbIWpAxoPQfUh5SnI66nDA28YBS8Go3IxSIW8PYEnkwjDEM9lwa
	ZuJwpF4SdnrAaBrOKpw4YOve53WNjpBeNc7etYuAqGKGyl9QW9kbBiZDkysvgQIEKUg6aPQzQGT
	v8RVTw1iizQsuXiiU72hjzqXSvWCfj2BJRoyHPESxIesNY5zNjC+lkIXhfVKSEN3TFRYXR7Ipox
	er/zlc3J9PbAG1Wg/uL3DnHreixfU9esAj5/DA/+Rf9G8jCY9vOm63vNGG02FWSf3HP5Kzvo2nP
	/9Roa+HzO257iUdT0U0GJ2c8D2tEylA+ettpJJdRMfsRAMenF3cFwK3Av+z6PgegTnU6qg5zCsM
	gwtdESah5BgjPGLkovCUT/mVsBMLHZNvlpADIXwdfhVtFb4A5kg//skOc=
X-Received: by 2002:a17:903:f90:b0:2d7:344f:4a6f with SMTP id d9443c01a7336-2d7344f4c60mr125456715ad.8.1787842463525;
        Thu, 27 Aug 2026 07:54:23 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d70493dfcbsm17828695ad.9.2026.08.27.07.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 07:54:22 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH] x86/platform/olpc: Remove redundant memset in prom_early_alloc()
Date: Thu, 27 Aug 2026 23:53:02 +0900
Message-ID: <20260827145304.490217-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

memblock_alloc_or_panic() returns zeroed memory, so the memset after
the allocation is redundant.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 arch/x86/platform/olpc/olpc_dt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/platform/olpc/olpc_dt.c b/arch/x86/platform/olpc/olpc_dt.c
index e108ce7dad6a..b98f1fe70ce9 100644
--- a/arch/x86/platform/olpc/olpc_dt.c
+++ b/arch/x86/platform/olpc/olpc_dt.c
@@ -138,7 +138,6 @@ void * __init prom_early_alloc(unsigned long size)
 		 */
 		res = memblock_alloc_or_panic(chunk_size, SMP_CACHE_BYTES);
 		prom_early_allocated += chunk_size;
-		memset(res, 0, chunk_size);
 		free_mem = chunk_size;
 		mem = res;
 	}
-- 
2.43.0

