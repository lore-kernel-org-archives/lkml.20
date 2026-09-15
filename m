Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC244078F5
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789494394; cv=none; b=p7hIDgyTrXMFtuFs2UQCrRGUsava0pCpv6cQe6gxTOMcT0KLKRb92yfkbT9Ti4SQUtTDW/q78XRgjzrVa8yEuNUdGZqjAnxAlFCz6fq9aRcMQGvAK83fNc9Fyi8uhpC/z/rnSBlDU9fiZvg/4kYP+L3i+Wk3pz8QOMvOjX2+R/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789494394; c=relaxed/simple;
	bh=WlQBNU+LBHOTy12vRSd1ePrcpVEBbXkmEd6JKJ3g0u0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mFGbj3TGXMakytebpkn0xix0zG0a+YulpKwvh7vcHl8PkQ+V9snjCyMukYa4DIWHAHHn7SqgSC0skI2s7MD8DlNlP0ys7t20xBInzp+0ZZjUJj67V4rNl+FWna4hbEoEPDtNj3+poRhruiTkO0RUjZ8eUMAMp3TfdHJLMLdaq0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NCDBC/8O; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NCDBC/8O"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b965f447cso740405e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789494389; x=1790099189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4kHhQGy3vIUJSO4i7ji0MZ5Fg5auge9rgj23eZwGEys=;
        b=NCDBC/8OzeEsXDsKqGiYKWY0M67SdVEOP+jHaM+EbBm4wpV5Uh0p31rg3UE/NJMnpJ
         pRIETjBmOdgrRnE4YwBvc2JcenbXic6PPLBF9HWhg5x8eIlRYxEFXUyj/3CBvQ/Jr0n4
         cMPWrrFBfHFDOCDLh2b+fx1E1FmcEh15YzTLuTwFitosgm5dspjAm9wD4dM9pbt2hRBq
         f2bZ4yeRK/ZQZf5re6AJX3+pcU4btcfnLf6Rt0zxy5jVWfMoiwOR07fwPhtScDxdnA4r
         eDITvnakX74wbLOcoT3AEqGJzsA5GHqMqkzltG7meBoE7DWdE66Gsjf1wCDN+YUiOMjM
         hdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789494389; x=1790099189;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4kHhQGy3vIUJSO4i7ji0MZ5Fg5auge9rgj23eZwGEys=;
        b=epD7L9RbB+BE1AUBWiP2qkqgMXl5TKEfTB4P72rFIDOPk9B86RqyZRirSjR3jNsjcZ
         +trmvRgDLD3rXE4nprJrhg+mlXRrKZEd0xFaqcwDb5E7gW8b5+kNbSkqNSxqTD1AEq6l
         9GoZuKqBP1lde0lAptIHRuqpjaTw5rNqBCeMHDoTn3V+gHQHUL8I/R4TLyGKlCct5fKc
         PJwbic2lVRrzRObVFxPuexSrGiuayMX6vHQ/7GqqjsGu34doSnUvxFkF5JO0ipj30fsU
         dTidLQaXMewEPDj785B8q0r0BLx/icJxsUXqvdcRAlKOq20r7E0SYB9DwpPw/s+B0fhR
         AykA==
X-Forwarded-Encrypted: i=1; AKwUvBxctzVVQMJ64NF9Ry+DmzJBMau6zzhB8mG864Uvwd/wvG6bHaucdn99O7bWK3KM0755DMfCdhGHgr7Nd+M=@vger.kernel.org
X-Gm-Message-State: AFuF++kF2oGe1NZVEE1VPyqXniGw/cdMgZTc28nWJhZXrjt7LNQEez4f
	thbK/lF6EBJf2VllVYSzBpw3K+AULgKz0fzH8stTuYpNqarYDy+EWEUY
X-Gm-Gg: AYBFou1ymK9AulwlvK8gfaKQx7f0mG/eQvM49jqgT0oDDeToqN03hNjyu+AUyyMmv1U
	ZOOkHeo6r+tBkhC+bqPHEdUVt3XLVP0OjUVEMSrWo3JXhpjtZIAYOY9j4NGWr206bS0y4HQIqUd
	e788p26zLpQsK0QvDgy+9VjzxczbSL3WZiN+GK3Tz29+LysjAM/YwEXI07H3x+VXpBkWQa3MzbI
	O2/fUEizWi4QkYxysY6o/RBQ3R/S2v6K9G0eg5NF9oyBcHTxN/2c6z7LjVmbY4/2iDYqMBQf+wp
	4vnjupuNK2p6EPeZQijkCxMcskPNNzi2iw56Hr4EX/LB0ouuNXtlySmkWTVlqPdy0CPGbSX4lJd
	EjSWjL3AILauvBIpU8vDnoSBrRJ56hOF/knCTkr2b6AzI8byUqRqzwqlK2aH8sr1ey9vDZ8thNW
	hfQpGdul1llqIKup0tu2Pb/VYTnK9N+qio9rfXWUW3K0cPcbK5wNsZpiRd/frAEkYxWM553OFr7
	n2smsGvF0FfzEPWm/SwSGfDmaw4qmXJGQHs0KtqXt8nLesU6C++
X-Received: by 2002:a05:600c:860b:b0:49c:fea1:f792 with SMTP id 5b1f17b1804b1-49e7a64889amr101393015e9.12.1789494389380;
        Tue, 15 Sep 2026 10:46:29 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83fc3da0sm3415955e9.1.2026.09.15.10.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:46:28 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] platform/x86: hp-bioscfg: fix slab-out-of-bounds write in hp_convert_hexstr_to_str
Date: Tue, 15 Sep 2026 22:46:15 +0500
Message-ID: <20260915174615.63924-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

hp_convert_hexstr_to_str() decodes an ACPI string made up of
space-separated ASCII hex-byte tokens of the form "0xHH". For
example, the four-byte input "0x41" decodes to the single
character 'A', and the nine-byte input "0x09 0x41" decodes to
"\tA": each token is read in a five-byte step (four characters for
the token, one for the trailing delimiter), and produces one output
byte, or two if that byte is '\\', '\r', '\n', or '\t', which are
written back out as a backslash followed by the matching letter.

The output buffer is sized with kmalloc(input_len, GFP_KERNEL), the
raw encoded length of the input, not the decoded length. For
well-formed input this is generous, since five input bytes never
decode to more than two output bytes. But input_len comes directly
from the ACPI string length reported by firmware and isn't
guaranteed to respect the five-byte encoding, so a short input_len
can undersize the allocation. With input_len == 1, only one byte is
allocated, yet decoding still produces at least one output byte
plus the NUL terminator written unconditionally afterwards, so two
bytes are needed. That terminator write then lands one byte past
the end of the allocation.

KASAN caught exactly this during BIOS attribute enumeration on
boot, triggered by a one-byte encoded input value:

BUG: KASAN: slab-out-of-bounds in hp_convert_hexstr_to_str+0x6d8/0x710 [hp_bioscfg]
Write of size 1 at addr ffff8881032e5d81 by task (udev-worker)/520
The buggy address is located 0 bytes to the right of
allocated 1-byte region [ffff8881032e5d80, ffff8881032e5d81)

Size the allocation to the worst-case decoded length instead of the
raw input length: two output bytes for every five-byte input chunk
(DIV_ROUND_UP(input_len, 5)), plus one byte for the terminator.

Fixes: a34fc329b189 ("platform/x86: hp-bioscfg: bioscfg")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
v2: Expand the commit message to spell out the hex-token input
    format and decoded output with a worked example, and explain
    exactly how a short input_len undersizes the allocation, per
    Ilpo Järvinen's review. No code change from v1.

 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index 22c198680903..42331cf90581 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -442,7 +442,7 @@ int hp_convert_hexstr_to_str(const char *input, u32 input_len, char **str, int *
 	*len = 0;
 	*str = NULL;
 
-	new_str = kmalloc(input_len, GFP_KERNEL);
+	new_str = kmalloc(2 * DIV_ROUND_UP(input_len, 5) + 1, GFP_KERNEL);
 	if (!new_str)
 		return -ENOMEM;
 
-- 
2.55.0

