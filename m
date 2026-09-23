Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D0642E8DC
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161864; cv=none; b=m4jyPD1zr8vcqI2KZfjCcngs8fDXxRem+P87R1tIWQR9TO904EEE8lRDcgWNY5kzZ5vzLqnqJH/QDoDHu0laa3zroNb/I6Vi6pOe22GPDLCVnvvPE1RYyglbvajzhYqMxTWg1kuCO2q0uFtIGOuk9gYNu+lZTzW1cPciC2W+820=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161864; c=relaxed/simple;
	bh=Y1MeJjIUqtIcD45CjDERSrfL5qZNM44AZrKbswPZd44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cAgASxpS3UgKB73AMT7SpMNnWiXstKDDDc4LkUd15CtgMsR5RtaXMkmWkhEDqPD6v/lO5jZnQdkR8/XoiK+Mbd14bdBWHJW7ILXQUvte87m2Qf24qVV1xCBiMISEJofzwkW58cyJ1YDyukYZ4qspey6RbjVdmNIc6NQ68+kJ+Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com; spf=none smtp.mailfrom=anyfinetworks.com; dkim=pass (2048-bit key) header.d=anyfinetworks-com.20251104.gappssmtp.com header.i=@anyfinetworks-com.20251104.gappssmtp.com header.b=kQnWQvwV; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=anyfinetworks-com.20251104.gappssmtp.com header.i=@anyfinetworks-com.20251104.gappssmtp.com header.b="kQnWQvwV"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8d879752fso537651e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anyfinetworks-com.20251104.gappssmtp.com; s=20251104; t=1790161858; x=1790766658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6F6IrMVbkAxuPsXSBU2GCL4E74W3Y9sNczvVD9Ex120=;
        b=kQnWQvwVasq7adqWT9Slkc7J5ZkUUv3mCOWZ2r4wpRIgh2pxTcG9W4NsX+Sv5cu8iY
         c2gbdKY/4/78qcUAHWsVYKmUAKlPcjBjVQUwRQn3KKT1aXTGqVBod9Ky3tlX0B71WY/P
         UE2Zv0FkFJMS9D71T04+MqQeTktiSgEzlu3Ewme40FIDQpLwb9Lv0BsKSuPqOaCEMV2W
         YcJboTJB1bZzjicaUZNnJ5EX2At5mwC7R1XQQTA6rLKEB8GXneG6wdjz+7US/Jp92AV+
         e+qb/l8purEmF+266z4RkQGyIw4vUZ9DIS0FprE2ZQ7ACi4qvQUCYhFG4t+WvC9sKiiw
         TorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161858; x=1790766658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6F6IrMVbkAxuPsXSBU2GCL4E74W3Y9sNczvVD9Ex120=;
        b=Cn+NfQsBhJpusnzmzbGnysrvoob9tL3O3C3d0m31m9yd8Pj4x5JT7fNXutFIqZPn/8
         3HzVjSKz6NJuRPgUk0OQUU5CcO02zgIFq+lyFdS6zG6Hvj/vMeZUoE7qWJ86hO/m8Drk
         Mj8p59YgMw8/E/9l7PEXPqjC98GE2dbYCa/pJWUZw+2aGt548fxYBQaQDlnFXD66HsqY
         UKswTTeIp2VWtdwezmLR4bWJWtytiwdMxMJwcTUiGE/zHrkKJFD+z8vxXFVQ9mhHBULu
         4guC4nHnh7tHMY7K2X3V64nceVJQ+Er0MCAETFG1pmnYZuvXAPp4d+nyw7s8uqLVn1z6
         Z1mw==
X-Forwarded-Encrypted: i=1; AKwUvBxdfIt67TehTz/lEsBqB+DW7MxCzCJ8plV5ObsCj5KCl8iYiTs1+izo3mZ5hme3ahGXVDpmtfSbPZRvCGs=@vger.kernel.org
X-Gm-Message-State: AFuF++lBua2MTNLCrYnECHHpW9fukP/ExRqbHanLx99YA4cNgDzWO3iV
	bYiKZ8vlrjfNmPH4d3hX+veLuDG9vc97Z5TmTJjJhC+d2DrCTPFe0QqEP5IohRHG5uA=
X-Gm-Gg: AYBFou0iY/Xd1YYwi2fq6z9c0yJPegUpLN0RoMruddI9NIEl5CcHoFhOk/SaQAGGXLQ
	a7DBBgAI/aun8E7bZD2lPNtNEHwpsYGBf1BX7dT92Pw5TwP2SP1beRKhbxlXdgQEbC+x44xruJR
	Uj9cI+5pWklEKpOK0dvrVcL5vUMzXnGHb+HQXJPZBkbijzpE6fBkZFgTmHWDeeHT5dn4BnI14Df
	0FdbfbC/csTq+YcB90Gz/9uifs2462seuRbGf+pCc3npEPaP1PjrVR1cRvk/54yy6Z8dKJsOFi0
	43JsQPJnfaYw71kfRg/xcG3jlz51lQGT6OVDoqEwPDknIZTJQzJ0v2ib/az4HBnkfS8i2kCfuZ4
	pVmKAZ6JLlfg+GCaQ4JUovzO6/dSAnQ5cjmiyIpugXsc0yLpsoDDRlu/UBE/gy9WHikusvj+QA/
	7+9BQweozlxln+ajd0BiEVTPzcmDrerBjKpz4T3AGOj92hC6omoxaCWs0uK1jQhfEmcTHNBdeQh
	DvYBoEcoQJkpyE7YRDWj8/ESG/X5TdovRtfkLwagrk=
X-Received: by 2002:a05:6512:3f26:b0:5b6:4ae:5b83 with SMTP id 2adb3069b0e04-5b8d89b6f07mr733196e87.33.1790161858572;
        Wed, 23 Sep 2026 04:10:58 -0700 (PDT)
Received: from nuc.. (78-69-188-101-no600.tbcn.telia.com. [78.69.188.101])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d8589783sm507873e87.51.2026.09.23.04.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:10:58 -0700 (PDT)
From: Johan Almbladh <johan.almbladh@anyfinetworks.com>
To: tsbogend@alpha.franken.de,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	paulburton@kernel.org,
	main.kalliope@gmail.com
Cc: martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	philmd@oss.qualcomm.com,
	Johan Almbladh <johan.almbladh@anyfinetworks.com>
Subject: [PATCH bpf 2/2] bpf, mips: Fix BSWAP 32 and 16 on MIPS64
Date: Wed, 23 Sep 2026 12:51:58 +0200
Message-ID: <20260923105158.3514342-2-johan.almbladh@anyfinetworks.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923105158.3514342-1-johan.almbladh@anyfinetworks.com>
References: <20260923105158.3514342-1-johan.almbladh@anyfinetworks.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 16/32-bit byteswap implementations for MIPS64r1 and earlier do
not have an explicit zero extension afterwards. The input is first
sign-extended to 64 bits, and the byteswap sequence can then leave
the result sign-extended depending on the value of the low bits.

Add the missing zero-extension.

Found with test_bpf on MIPS64r1 emulated by QEMU.

Fixes: fbc802de6b10 ("mips, bpf: Add new eBPF JIT for 64-bit MIPS")
Signed-off-by: Johan Almbladh <johan.almbladh@anyfinetworks.com>
---
 arch/mips/net/bpf_jit_comp64.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/mips/net/bpf_jit_comp64.c b/arch/mips/net/bpf_jit_comp64.c
index fa7e9aa37f49..6681ccac9dd9 100644
--- a/arch/mips/net/bpf_jit_comp64.c
+++ b/arch/mips/net/bpf_jit_comp64.c
@@ -305,8 +305,7 @@ static void emit_bswap_r64(struct jit_context *ctx, u8 dst, u32 width)
 	case 16:
 		emit_sext(ctx, dst, dst);
 		emit_bswap_r(ctx, dst, width);
-		if (cpu_has_mips64r2 || cpu_has_mips64r6)
-			emit_zext(ctx, dst);
+		emit_zext(ctx, dst);
 		break;
 	}
 	clobber_reg(ctx, dst);
-- 
2.43.0

