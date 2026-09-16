Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF60296BC8
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789519589; cv=none; b=GBNrKgKai9Y+DOaqYYLTcyuGgmQeupN9L1hTwfFYldiFZ/dk0rK0Vm3+1Be9PcOnxVahvyXoMIChwvEic9EmvC94w3c/rLVPjLAGVRiVkiawpr2Q/eL6R7AbESYS1RIW1wBrNbt4ycXMPyaWKU5KGOoWGa6gcFfTrG0NTHHVtQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789519589; c=relaxed/simple;
	bh=DjjWl9UCxcW5dIspAr2nZpFDlJ5BtCju7U8vWE3VYXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GN14NOOu5cbCkDFlFCIc9c3Vb5NC3Hm8qBsgfeDYldt6XCmEBzCOYwsx2GeliYH+aYKbZ7ffaicZigwiXOMN2NvawYqNFsnjXTMIRn0ffsxdldWLP970KkfnV2C2gdPRJI77TppQ9SpYHkadiED5qxfoYmejW20nO3adcZftK1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BAhHAFfk; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BAhHAFfk"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so2343725e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789519581; x=1790124381; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NUmiXSwhD3hvwXOFubhBLJiWD29cOMNSoetQwSyMxY4=;
        b=BAhHAFfkmi6ECPsA2wCc5WlMwIripLI+efgB7CDuTRgT0QyGSCsUW3dPxTt91foxX7
         qBdWeYZsvj+3I7zNTSUaZJLVfEAxwiXM4G7fvSH2n+Tx2iCXaloh0026m+pbW9RLPA7s
         9fBMTSAoLlJ0ETpJlEpauDJmtu16nuucGXxwnLlDL2E1BFCdXLTZjQaYXAk3JrJtlylo
         Ge6KG9pBmGytoHEf52iZDFdK/C5LgtOkVsu7v5ARzL2HLmmeyf28qnFiJuNNagQNO/+k
         /3EHRrxG0OzwuZl/UxD08YO11LLIiybW3ObvrO9PdH9I4Lu/CccSem0itKoVCDhimYjr
         gkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789519581; x=1790124381;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NUmiXSwhD3hvwXOFubhBLJiWD29cOMNSoetQwSyMxY4=;
        b=mukoRFMy4HWcV+6VgZi39n60y8Jjgvw8mq33gA4HtI63fkoWPmoprFyp7rHolzyb8K
         FDn6dhcVCmtbreKhW1saHzVzTzOp2Cu8hNM2c3+1robU6t+g/xADl0bKfWSn828BWp36
         kGZAygtspP+8oT7YEZSLDofn2VRmtZMxeqCB31Q/TKl4Cc7M+d1Rx+Gwhyzddza+7812
         8d4vSPedPsmOmhhNZctFq7hdeQKtM1VG92GT9dV0Bttd7H9x4FlwOvJCGpD/pRP92F2B
         jcPvTEnhb4d0E5dUnfr7tncHQpaua/zeKJMf/wLWfWxyQjumLG9qnljELJOiPaTPMQkB
         etbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkDSepCgF3ecGodAiindNs24oM5vxz2hPZKjI/rsQXqsfI3x8GXPNWF7XFLiO3sglv9eL1nr13DvDSy4o=@vger.kernel.org
X-Gm-Message-State: AFuF++kUSZJX0HDoohkbr53qa8fb6s/WEHbWna7quPPlFmNb2c9hGZ5T
	kBAbVU0a6rNCGuBgxkfz5aVoiVXx4fAUoi26+k1hhNkHiXDPj7SxdcE7
X-Gm-Gg: AYBFou3rvGYl+qk0j8Z33xci4RiZC/Fs243FJ+rp9d686shFuSdU/VLrjDSRL7oNRbt
	rQJyS7kMDu6saHsRQjHyjUX86t/kcWfoSPTiddPh4ZKL0E3luBZR8qBlgqj0uNDj2qUwChHWced
	U0z8ffzb90v+HwNM8qBY9uDxs7JZw3SNd111xpbK0G9zBHgn8IVdson0ZmoC++PNc9zuEklVCuR
	g8ifKQzevN/35GMO7BFTdH9QfpDOB35pHRN4caq/bd+o6RccYiCii6CElEA3j5+lc6Mr0AOsp7x
	Cqf6zhLEo2d/p7/RnsGU1jLWC+uVXQyQTdgunNtk025wEkWS3SwdCDjp7+7++xOsfddJ6X9OewT
	OGueS6DYzg4t8/b4KHPVdwnzblUHpJGxmB9FLuEef6WUAft3k4dlGMehE2qIdCa2c0ZfuP4gkKI
	PxIDs2EToJhRMTXXM6YdBTYwTTvM/pAkFzYmtDtbJkDOxYnrjS6uAAoXZlXfbGIzJK1hYU/P4yK
	Uh4VsEQ/LUhg6O2g7SRvBOK2NetuqafjVxwRjs+Mny15Uhw72N0mbGcW/cARw==
X-Received: by 2002:a05:600c:620d:b0:49e:6692:27fd with SMTP id 5b1f17b1804b1-49eac46430amr9151835e9.2.1789519581001;
        Tue, 15 Sep 2026 17:46:21 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf418dcsm2692163f8f.35.2026.09.15.17.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 17:46:20 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH] platform/x86: hp-bioscfg: zero the hex-string decode buffer in hp_convert_hexstr_to_str
Date: Wed, 16 Sep 2026 05:46:06 +0500
Message-ID: <20260916004606.165065-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <0380b8d6-cff5-383f-b47f-700d1d17fefa@linux.intel.com>
References: <0380b8d6-cff5-383f-b47f-700d1d17fefa@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

hp_convert_hexstr_to_str() allocates its output buffer for the
worst-case decoded length, then fills in only as many bytes as the
input actually decodes to before shrinking the allocation down to
that length with krealloc(). Well-formed input can decode to
noticeably fewer bytes than the worst case, so the buffer is
frequently only partially written by the time it is realloc'd and
returned to the caller.

Use kzalloc() instead of kmalloc() for the initial allocation, so
any unused capacity starts out zeroed instead of holding leftover
heap contents, rather than relying on every current and future
caller and code path to fill the buffer exactly.

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Applies on top of "platform/x86: hp-bioscfg: fix slab-out-of-bounds
write in hp_convert_hexstr_to_str" (the DIV_ROUND_UP sizing fix),
which Ilpo has applied to review-ilpo-next but is not yet in
mainline. Sent as its own patch rather than a v3 of that one, since
the sizing fix itself was applied as-is; this is the separate change
requested on top of it.
---
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index ff28db7..2dab9c0 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -442,7 +442,7 @@ int hp_convert_hexstr_to_str(const char *input, u32 input_len, char **str, int *
 	*len = 0;
 	*str = NULL;
 
-	new_str = kmalloc(2 * DIV_ROUND_UP(input_len, 5) + 1, GFP_KERNEL);
+	new_str = kzalloc(2 * DIV_ROUND_UP(input_len, 5) + 1, GFP_KERNEL);
 	if (!new_str)
 		return -ENOMEM;
 
-- 
2.43.0

