Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7313EB0F0
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 23:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791588542; cv=none; b=VeGRA7oyXMeG/+WupuVIdR6qHX4fvu2C402eu9q78wns2df9zzJy6nI5R9YG+Gt8WdBBO/0qaQjUjH3uUQftaSTAucqc17pCQ6u9WZoZucXRYysYfvNb+i0lTtiJuLiHY1tsD/LWtQWkwpsOwvDNA9OWKLUvaq+YogwqvdAfObc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791588542; c=relaxed/simple;
	bh=mLqMNkEfqZixT18rfTh2xaYltQQWNBAMspvKIAef3Ec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J6li+NIh2Gppq0q61DKkuHr4XQe2jK6/r9wTC1S8np7+PAJerRCl/uzJ/RZpQ4wA2NisLBA+MU/K6n8E9f/n3QTT47p84H634CyZn+bBenf5Dy4GqxkQ/HPVSSjDrbKAYnxtMLvvgLgQBWM0Y0f5wXHluMxL+GR83oXdSpgvH0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FbvQNKkX; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FbvQNKkX"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so129855a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 16:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791588541; x=1792193341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oSlxszekxGveYsrL4DF7hT5F5fsZN6SpIJIkMN18hKw=;
        b=FbvQNKkXzmSYmPwgz0nfBH7l6Vyijn9rPhhHkYSzxwVScyRSFB67Au61e2aIvNKFAe
         4AM1IBYQQXOkAaqHENleI8isR2UfqesEwBt5qRikP0WNcU8ePVpPgBWvrGSczB96MhWO
         qEgwt4UWL2O+GYLoR6w0B4xOpjTQH38nX879KSlvzZ4/Y8y/b8JMWRyL1RZfGv+3AbZe
         lxKaKHfK+MdN9VQOuGqlbovSGoXEfvv+VCTXT8AUCZToPdU6duzPEncECfYTMhtDCsAO
         4G75B9Dd0aQT+VTn0vocnmEFZutL3i5N11vFih2NBogDFH+LKVaUUxTvmH10WYFAWAgE
         bt8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791588541; x=1792193341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oSlxszekxGveYsrL4DF7hT5F5fsZN6SpIJIkMN18hKw=;
        b=mJvoM2c8yajQAVtZPinDCMAjnDCqs875vEV7PX5v6o+U4qdBAy7oXGHMJQnBiDx1yk
         Yr/gBE8NX1cMtt4qJvlIp/eSgdGYP7MunprJPYkBQ4KcgkGAbFu9BGsEekHscoSF5BJt
         g9Mf7c2uzeP5MLW5Hus2sPvkICBdXRMceTSsJuOk5ArY6AZEeZP0vL04LYqXw49gOtPD
         QU95v8Iu4jAwYvZPrMjPWFi6oqmzbxQd4VyH2izvNsJe+6FQ8ayYWwbRhq7WBDyiyMOn
         3A/gif2b4ayDGsI3/sbzsgKzB7vayeFRsk5KqZZKHpSEATzotCZJliTnWHlxKn2qGYo6
         X82Q==
X-Forwarded-Encrypted: i=1; AKwUvBxGJsIxfznSuALUi+mNBNUPg6ffiUFX/GoznoimoWD835pvsFfxGTxdPhmagXCEab5kb7CoNHYERqs5nSI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIEe7wOHgSF4VRvOBeySyzO1xoH+56RDu1bIN/0yn73zKhe6eKC
	E67BQMVEmSZEWhFOcsGUyYw8/CFtbMT47et6DxweSL03QAAlbl9QSGgK
X-Gm-Gg: AYBFou10Fw+psLjWeboV2T09EfU1kqCdEBp7qapI5UvxTLqQhIKDfEaqnEMCxbKlLD2
	yeC7hkEOFTukgQzvodqhOvQ3t2Yj7jNEUwLKFp4N+m1r/zxzjSqGeVXLOBK7FmUbY0HXNxfph56
	ERcFYA2BNSp0mG5T7B6SOUeGVctDRSj55jtY6BM//6df0vMhEKqJWktAYaRTYgbOz7Qj+idIfZI
	85yHobE4z1+CIzDLQTDA9rSCrpz9cK9XSCh0yHosw+S4odJZoYizLPLWd9Kr1sgXCgr76vQTmjw
	qYfxSI+Ghmsty2kbHhWlwAzildfBSKwDO1EaBVRkp1rVmwu23wRcpdbQhxjInJ4Ohvle3C3JrrW
	hSnJMn/FyvmPk+PQewLUE1wLOM/TFI8vBSiVX6HJJ26jKyFNpcWlvnbEaFyF7dWWd4eJQ5Ot39E
	mAvt44sWve3IHX9/FW0UVEeuJ/sGcPbj2lj9HtvSwvAxdrO7+SGHlrJlm61V6uMcqrvygxycxoD
	28QKX2wJtloKajq45Ed3ji/TsQR/P/fAogYknD0dF8l+ge0z8yxKg/NcsDFqtM1Yaj2/8Z+61Kr
	Szhs4i2U25gFE1fujbZzn3xet3XIK1Nfrf3tfml9GaLXLhm0lxdSblk/+AE=
X-Received: by 2002:a17:90b:2645:b0:3a8:10e2:ad08 with SMTP id 98e67ed59e1d1-3ab3ace48edmr3043646a91.48.1791588540601;
        Fri, 09 Oct 2026 16:29:00 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab39533ee7sm3396362a91.4.2026.10.09.16.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 16:29:00 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] MIPS: boot: compressed: place .rodata.* and discard .MIPS.abiflags
Date: Fri,  9 Oct 2026 16:28:57 -0700
Message-ID: <20261009232857.655265-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The decompressor linker script only collects .rodata. Clang emits the
decompressor's strings in .rodata.str1.1 and also produces a
.MIPS.abiflags section. GNU ld places such orphans next to similar
sections, but ld.lld puts them after .bss:

  [ 5] .bss            NOBITS   809246c0 5346b8 402010
  [ 6] .MIPS.abiflags  ...      80d266d0 9366d0 000018
  [ 7] .rodata.str1.1  PROGBITS 80d266e8 9366e8 000164

This pulls the 4 MB of .bss (mostly the boot heap) into the file and
leaves the strings beyond _end. For BCM47XX vmlinuz grows from 5.4 MB
to 9.6 MB.

Collect .rodata.* with .rodata, and discard .MIPS.abiflags and
.gnu.attributes as arch/mips/kernel/vmlinux.lds.S does.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/boot/compressed/ld.script | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/mips/boot/compressed/ld.script b/arch/mips/boot/compressed/ld.script
index 0ebb667274d6..c45be18c6f0d 100644
--- a/arch/mips/boot/compressed/ld.script
+++ b/arch/mips/boot/compressed/ld.script
@@ -17,7 +17,7 @@ SECTIONS
 	/* . = VMLINUZ_LOAD_ADDRESS; */
 	.text : {
 		*(.text)
-		*(.rodata)
+		*(.rodata .rodata.*)
 	}: text
 	/* End of text section */
 
@@ -50,7 +50,9 @@ SECTIONS
 
 	/* Sections to be discarded */
 	/DISCARD/ : {
+		*(.MIPS.abiflags)
 		*(.MIPS.options)
+		*(.gnu.attributes)
 		*(.options)
 		*(.pdr)
 		*(.reginfo)
-- 
2.56.0

