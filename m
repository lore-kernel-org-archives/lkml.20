Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793628865;
	b=RJkyg54b+OgrFR74J4mHxr3E3qizM4hNoFCOI8aYGBMH+mCeFJq7a2uiCjPdoLDaqLlG
	 BJy/Ql/LmT0y3f3Mo8zMspRW36rAq5A+OrKmLsJlKywjQFF8dQTsa+He1TdYJzFno+iR8
	 00fBwLElxz9ldfscvZSF3QTDj0KYzj66MGDZ01P6xFPDCr5OtLhGrrTOWZFjoy1mqwxPN
	 u04DLh8ua1xcj3JhrCfzt54eNBHmNVM2lVhXY/1uLUN3GGBTOUVtr3Un5T8Bvoe7qhXMr
	 xGDNzdIm+jOGglEHtDlGMiuM5QzQ3iXrUp5LV2DZPAMkvY0mn5XGD3hit/V8YUJ+W/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=Z9u7rLBjFfObwxr3Bnidh1W488MKnwPxv7XdCiOlz3k=;
	b=KnTb3by0FmHh1SbcdxkrsjU3X+APYascGoWhFTenko0AwlfGDldIVGoM6udKIQ24dlHx
	 gGVqRPhRBBz/PFRuwtNxXPWSGCZYhKRgFvekcnWSTugMEC6owPO8IJX5s8J9VCeV38+hI
	 Pm/4pVhzzxEl2KhLSFihfsA2a1LbwjoEWin+bDGbBrepnzxsJBUJAJtucOindkElL7vSC
	 jRFrUBu4dYkm0qAp/SEDkgrWjXN3ZLtIlHDCH0P5eBA1iAOX7gscCE+gT7DaswLoXVERo
	 EIM+akFIdiDvdCbFpqifBY/kZBSResxe3uwbYCb9r5brUH+qNZNEmrugjrmGAvzUyGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bitmesra.ac.in;
	spf=pass smtp.mailfrom=bitmesra.ac.in;
	dkim=pass header.d=bitmesra.ac.in header.i=@bitmesra.ac.in header.a=rsa-sha256 header.s=google header.b=O+kIgJin;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1195560A2619
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:14:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1195560A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitmesra.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bitmesra.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bitmesra.ac.in header.i=@bitmesra.ac.in header.a=rsa-sha256 header.s=google header.b=O+kIgJin
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ab07d956f2so21982691fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:14:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793628861; cv=none;
        d=google.com; s=arc-20260327;
        b=YT5JyHP3smQtG6hjfm4DQlBf/KjQMxjRREkSPzHQ77KMfw84AcHMC1IeFIazZHk6LT
         TuJI3GhhZT80m11ew9d6X/opa2YKXMGUjXZ4TcMhql5VnfjM5RVUllhDmeWByraSBfR0
         waPQXQwq74h5+Ho0xks0u6ko0N+/pILsM4gQGodQQ7Qbp2fxlIt92zrfhnlTNFxBnXtT
         P2Bu8n4xWa55mPYYKMn7gCO8t3E7Wsb2UycsRd5jUy3FpRCQNUn4laFJ2TTaVBmsdK0h
         +OPhwGJ72TEDHDZgU3Wpct3gLiq6qxmFo50CSXP/NSfLZdO/b4Gu7ugVyMOanH3YZW37
         OWEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Z9u7rLBjFfObwxr3Bnidh1W488MKnwPxv7XdCiOlz3k=;
        fh=hiiRS3xmsAj9MB7oOiGWRu9S350xiLAXP2Xs3PiQAWY=;
        b=UfZC5lb7qZZ8F2YZaRYxfht5ogO/NAWl8Xi/QQCnjcjxj2SRopLUKw04BlDBENYgoU
         bWmLLsi/+cjLjeWTvGcx+PCCGmwU8Rn+WYF+HcO8t2vz3OMm6qjFbxyloju6CobEfCMw
         ITT0elzs2/1w69imtlhT9POq+pCC7w+/9aGE2IdRkG3M9hJRKfF+JvgujGKE/cluarWH
         8m+NXUTAleKUW88HLJZnUVx+T2JmqBK+MSSDlPva/8C4BYKaSLy6b4c9AejonSWj0dfj
         DwMZbcVm/y0+m+I5Onc2OpMKIDy/vEwuBXdVBjEN/ubuT94GPLph8X2D1J9prPTzmWlR
         2a9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bitmesra.ac.in; s=google; t=1793628861; x=1794233661; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z9u7rLBjFfObwxr3Bnidh1W488MKnwPxv7XdCiOlz3k=;
        b=O+kIgJinKo+WxJsS4Yfmu8X3fYsgkPuWv6hAX0wA+aU+uKCbKZpe4jFss/uVOLvTQl
         ojijn7vJlKjSAAsyQQy4N84v4+hKzwkTBDQZZC8duFF9TouBhg3jMbDAdKNFBTMcrmmJ
         j0rKwG6bSN7dC1xe2DGtt7n3V2DYghhRlR8bw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793628861; x=1794233661;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z9u7rLBjFfObwxr3Bnidh1W488MKnwPxv7XdCiOlz3k=;
        b=VXl97Fq+WwYP7KNq+IH4SGh82iRIiy/Gig4xFxt+D7jLGl1GEcG8wa4YJXGTwpW6MZ
         7lZ9zuXzso3UBnUbGawcoaADgBC9R9FnCQq9/iqIxboKE3ubswsknfW0cuOEhPpmvmtN
         8WB7kBSjnudcvqaRKCrlpBbAJtrzJ4f4i3GgZFsOH4fwKz+r+MK9s7a88Lqe/6R2s6D6
         tEocBp6I1j5YcISrMt9AV3umvzZmPiwpZ3Dpfd/O6cgX7phf6i8Gf8PIz3iSz3xklViv
         YkJih6Llt1yK0x32Hr/Q/L+fwadTR0ho6DvW5SDze2sUocZchhpiLRd38pzSoRcTNUrC
         6qqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzrauv+z0P0c87Y5vuBOf6kzB58kNzVaf+/kR/w+9phkdVWJBqqdqbc1wuGqWnD+j37YMHd2ic1DyhJjvU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/q8rRMHD7xF9EQ/QewXTd8ZWsNbhaQykX74p57ACUM/o5bzAMb
	dg8kP6M2qMg0o+PshTCB8eVqMIoGr6P+2h98PSloAHHNx1d089XM/6mS55cNBbU4jHWMEc/jZn2
	hBDABkrSvKP/UhYipvlxBLtyKGlNvP2WqxPoGY1eWeoafdRniJfkq0gvJ
X-Gm-Gg: AYBFou3lsZ8E2hiPfgV2Pv+MJGBw8RSyDXSOpa8enApTN3RSCPWCDUcWTiAosAzMnJH
	9/ezpOkkfIOKmtbiBmFLVyeJewKPTt/0GDK94lig+ew+VS4c1GCwvqKYWeUxOlosO41TEo9itBt
	K2gnnD4XCIzGa2X9/3bGd4zrHbzn14A89rHOl+19pwAqSuGQewoLhX9A4q3yigR7zTHUvDpmZRG
	ZBoGh/4ZtJtYiL7thvqcISqae76aAUnIGreJP5PYGvIhWIhuvzJui8OLqvoFP+mqJOxWyfVoqK1
	yuX0syMxLZkt39muqk9pdcAV021T3Luc02wt3MMTa1iO0o4/xgt9gdNlmptVby0JdLkp/SJtOAM
	26hkIuBGs29zhMPXsABcK4sTK8AGHha9PZxwzkoyysi5/OFh31xVljY8nVZE=
X-Received: by 2002:a05:651c:43c7:20b0:3ac:d178:4f97 with SMTP id
 38308e7fff4ca-3acd178522dmr3648971fa.14.1793628861275; Mon, 02 Nov 2026
 06:14:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Kurmapu Sai Devansh Prasad <btech10487.26@bitmesra.ac.in>
Date: Mon, 2 Nov 2026 19:44:09 +0530
X-Gm-Features: AclHuK8zvAC6NLaJerLR74Nj2Z7Ax0Couwh_5yLGD3UqJh-lFBH5T1ZF2R1C2DU
Message-ID: <CAPwSj7XvbTR3qtSev-xEtZeewwvSWFXPhK5F12VGzSiQoNudNg@mail.gmail.com>
Subject: [PATCH] staging: greybus: fix string termination in firmware sample
To: johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From 9114eb9d60f2c4a52f05e3a33b0d6b8ca4856cac Mon Sep 17 00:00:00 2001
From: Kurmapu Sai Devansh Prasad <btech10487.26@bitmesra.ac.in>
Date: Mon, 2 Nov 2026 19:11:09 +0530
Subject: [PATCH] staging: greybus: fix string termination in firmware sample

The firmware_tag string copied via strncpy() is not guaranteed to be
NUL-terminated if the source string is exactly the size of the destination
buffer. This can lead to a buffer over-read.

 Since alternatives like strscpy_pad cannot be used in user space
sample code, we can make it  safer by limiting the copy size to
MAX_SIZE - 1 and explicitly assigning the last byte to be a NUL
terminator. This ensures the string is always
safely terminated before being passed to the ioctl.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings

This is my very first patch to the Linux kernel! I've been learning the
process and would deeply appreciate any feedback from the maintainers.

Signed-off-by: Kurmapu Sai Devansh Prasad <btech10487.26@bitmesra.ac.in>
---
 .../greybus/Documentation/firmware/firmware.c        | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c
b/drivers/staging/greybus/Documentation/firmware/firmware.c
index 3b35ef6d4adb..a6a0988ad6fe 100644
--- a/drivers/staging/greybus/Documentation/firmware/firmware.c
+++ b/drivers/staging/greybus/Documentation/firmware/firmware.c
@@ -64,7 +64,9 @@ static int update_intf_firmware(int fd)
        intf_load.minor = 0;

        strncpy((char *)&intf_load.firmware_tag, firmware_tag,
-               GB_FIRMWARE_U_TAG_MAX_SIZE);
+               GB_FIRMWARE_U_TAG_MAX_SIZE - 1);
+       ((char *)&intf_load.firmware_tag)[GB_FIRMWARE_U_TAG_MAX_SIZE - 1] =
+               '\0';

        ret = ioctl(fd, FW_MGMT_IOC_INTF_LOAD_AND_VALIDATE, &intf_load);
        if (ret < 0) {
@@ -102,7 +104,9 @@ static int update_backend_firmware(int fd)
        printf("Getting Backend Firmware Version\n");

        strncpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
-               GB_FIRMWARE_U_TAG_MAX_SIZE);
+               GB_FIRMWARE_U_TAG_MAX_SIZE - 1);
+       ((char *)&backend_fw_info.firmware_tag)[GB_FIRMWARE_U_TAG_MAX_SIZE
- 1] =
+               '\0';

 retry_fw_version:
        ret = ioctl(fd, FW_MGMT_IOC_GET_BACKEND_FW, &backend_fw_info);
@@ -130,7 +134,9 @@ static int update_backend_firmware(int fd)
        printf("Updating Backend Firmware\n");

        strncpy((char *)&backend_update.firmware_tag, firmware_tag,
-               GB_FIRMWARE_U_TAG_MAX_SIZE);
+               GB_FIRMWARE_U_TAG_MAX_SIZE - 1);
+       ((char *)&backend_update.firmware_tag)[GB_FIRMWARE_U_TAG_MAX_SIZE - 1] =
+               '\0';

 retry_fw_update:
        backend_update.status = 0;
-- 
2.56.0
