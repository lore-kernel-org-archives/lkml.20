Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793675242;
	b=pIB+ZpJktNhp6kV63vNVXscZEBI1xwyn+vg5YN+i61TP/5rt3Huoesp7uX6bSWxaW8ll
	 wzpqiOy9kYpCXg3Bhu4SqyfIl16iyqaPASRxE7/0SNqxp9oaZ475/dqbSvHJG0RBPLxRR
	 4tvpSzADdGmcIyeqqV6LINum6iazovbYI5mefIYSO6sLS2H/9VbvSFNl6wz1q+Q2iJcnk
	 yOPtkIUaP3xDnHngfN3Hkf/xyYcac3Yz68eg2ods9SHMUG/6XdRjbLX6ACh3iQCVtdfpL
	 zCDIjYqkdvaspu7TPAPE5E6J97E8wSz70Dg0p+Lod1sf35Ky9t3yLWsIxFQ2HDy8DDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793675242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Content-Type;
	bh=he3xvNHF+hWEae01fq/goQe46EZGAHoNyi6iFnm3wLg=;
	b=kCAJIVBtugybCD+CW6hOLEYInEFRLkYyHxqbbnSLF2DtxMyx4AOZiVeLjKgmm+RuCEzY
	 Nx7kbsRpa4zi0bwvjBzs/vgcGEgKkTiazdFhjikvcMDjwh4kuUJixygpcygWD97DQ53ix
	 lZ3z8eahKBa8dJrsN0yXtDLH3FHjecsp1MitCz7336g3Z3OE8APZp5juOKATyedB7CXVp
	 oDlDn5CYc/EhKVZTUa0GF1uzLBjPThH1a5QawuDp3S3MHl9+pAJFxmJOc4sttRyh1D3gg
	 LIdRHcUfCUenWRnxrTV2VDoa1HXJrBvCv9d+3klj6ZCqcxrKtBGCiu1Ppb7viQQ5ETw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pz7xMRIu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4939B606A33D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 03:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4939B606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pz7xMRIu
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b3dc272dcfso4891344a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 19:07:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793675241; cv=none;
        d=google.com; s=arc-20260327;
        b=QtME79uUiIValcmy7G7w6NHnCXtP71Wn7ZgHmxFIs1QAeNYQk35Ep5xABZXYI1CIQU
         yOq0tTBXApCfp63Gb3iBZ4vBIVoWhxS9mtjjkEpjA3FhPR8jGynKkKlSPuKcb/702Giq
         lie52E8Pjm2eMSO+9FECWVNXlUJzuXImL3g0WucU3uaxjMHiDAT50NTlnJ0K1KRNv0Hx
         Pcs5R1w4iEv8XmrReASOS1DX6PqPdrmFhae1h8JTPP7wTwSShB8g+5x9DFAjHlXrNMxY
         Gpd5zuAh0/U5s/jftd/+6NRMD4SVpIzUbSdxqfyD2339ER9bXPoDTmi4VJtXKfeS/q0L
         9SGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=he3xvNHF+hWEae01fq/goQe46EZGAHoNyi6iFnm3wLg=;
        fh=JoE1s+3R1i3Wy0tt7qjJ7+oh8LpASkjVSrBw6Y4FwO8=;
        b=Bi1k0LLnPVoZU5iQT+1osdn8bI1JPA81pgBVy2etPZ/2iTPTWZjJVlDy17HQpkNRE/
         HYcbwoGb+XuGPLF3e/m3VnKxTLXejjKSCkS20ctAp2RCQ35LyYAl+ubzMa6Ca4zYSqfX
         od3Dt9xo693RWraUHJH+QS/F2O9WQlmU9j+JAxjyxKEnqtt+T3HePwjbDMK1Us2O4NZc
         lCjtPqQlXMjEmBDCSjCsEYBFoU7bxm763sPAhA7EB0y/T7NCf1mimHwLbqydX64zlKCd
         DtEImMfdw1UAESTwz5QtIWOCep9MYdQ4GCnGMoKYk6PThiZfwVYz49fxJg6GWTbV/1Qw
         qeEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793675241; x=1794280041; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=he3xvNHF+hWEae01fq/goQe46EZGAHoNyi6iFnm3wLg=;
        b=Pz7xMRIudQ11ZLXBQOjOfNrX1WZhWkTURqst0kjAFv013so9A4cM0ORukSiBvSTi8y
         CE3Xed3sMrPhJtJTk9PMAZjVac+lcmx5tGnPPDSDrDd9lT5FkCwAofAZkNgXdEI3KMRr
         bo9oxWZ1jkEZuiQ5Q8vvbpw1w2w7kxM3BLO764L4h8Kz7j7q2AsH7xXUHya4na/bdZoq
         JF9Uz/zpF/F96zukqgo9S5Q0VWpSb7A9oN11X6W/RoGDlOilVPw99yF/Mt/xvZTX9l0n
         wnxWSUhUneeGFEyy6Y6TxH1qLEoFtrsbfa+PKsroAWo1p3uFPYAylcMBlLc7gvrRWuDu
         +itQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793675241; x=1794280041;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=he3xvNHF+hWEae01fq/goQe46EZGAHoNyi6iFnm3wLg=;
        b=VtRS4DodqkzmcyxlACEc8T4s5r5K8tLeRYVB0Z7oJF30xFXZYdTyRmOgBc1h+nSrWg
         jTLz0gZCshr6/l47hQKIYnrtA+CVtitb7cwVXczXm1drCHdksP7BHMm3YlH/mjvcoplh
         E8QiLWjj+EW2WyzGp96J7vSTusCGCl3qyW7hJWrR6LWD4wE5wPrR8En29JgryGn6KzJa
         pvzdLmb2YXgDXw1izQmhoB7umUBpaU1Qbi5F+66DTqosUEc3J8GvV2SdfpaNMTfL5v4W
         wC9WcRGiC2Pid98Xe5sqjPnffuLZIBwVT7oMrK8gBJwiRPSfLtzGANwGAwJZ9A81G/Oe
         Z5Ww==
X-Forwarded-Encrypted: i=1; AKwUvBwlIEv48MaN29DncwvahLKedrsOvYn50tw9kjoJVD7eUJ5qzwxp9Z81OdxVR/8e/40Eam9NIF3oGHzKvzM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TJA4zjWj04lOojF1jEyrDgUuYO/BwOYU5mHNgjSPmGFrw8gV8
	E5CqN18K9yssR9x4FN9O/sMtYyKUpCaBkqkz2xvWBcJCb/I0HzllGy6vOS5m+3YYxnOLMVI6bSz
	knpvLaIu812o0pntYUy3wef8DJb207sLqZiPiP+VbcQ==
X-Gm-Gg: AYBFou3fewt+U36EWFrillhTnNaiF9xbZa2KSQS2DWJ5fpnXyQXL9+uXsZ6zibBDBGn
	LNWHODyR5F5zWT7LDYsGAJQjJPZElaA2Jg2Y6I9GTmbqqCINJVSlzhD7mQ5usz6XDlWmU0hCMaT
	Od+VWhBinb5s+Y5HImv0ljQuNe5W6lr5yFZaA88DdlbokSdVX/fVnUmOovKgMnpC28zPpFiETCE
	hhbYFNT+Cgws3V0IMK4DlDR88i2KC+QS05fB8yDIhkapvmGYUQEv6wkEaY+bwGuKLJ96FjRbyjo
	gkYxRN5rI9PcBqKB+NDhlsU4B5zINdfswERLTyEpsPd1Rhq1ibqTaDq6/cthsc0Dya67FNb5k+P
	WXUicOy15WJilm1BlKpljBFFRV8DHuyOpHKlZHVDfBlPFR2IdVkgi8679VnK5cQXf8e1arS/AtO
	kl9vT7LF9REs+8
X-Received: by 2002:a05:6402:4287:b0:6ac:87bc:8b16 with SMTP id
 4fb4d7f45d1cf-6b4d62c30f8mr8173527a12.44.1793675240491; Mon, 02 Nov 2026
 19:07:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Herman Semenoff <germanaizek0@gmail.com>
Date: Tue, 3 Nov 2026 06:07:31 +0300
X-Gm-Features: AclHuK9tGz_HxYylUGCzXxevP4a_c9XKcSj7qzRRWb_S3SOZRhjTz2tj6KT4xcA
Message-ID: <CAMnMt5ZQe6HvLBWuc4fcF=pcatqUD4bZff6QSj2FxaKjpGWXiQ@mail.gmail.com>
Subject: [PATCH] usb-storage: add US_FL_MAX_SECTORS_2048 and quirk for USB
 Disk 2.0 (346d:5678)
To: Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In drivers/usb/storage/scsiglue.c, the host template sets
.max_sectors = 240 (120 KB) for USB Mass Storage devices. While USB3
devices are granted up to 2048 sectors (1024 KB), USB 2.0 devices
unconditionally inherit the conservative 240 sectors limit dating back
to early IDE bridge quirks.

For modern high-speed USB 2.0 flash drives such as 346d:5678
(USB Disk 2.0), this 120 KB ceiling unnecessarily fragments I/O
requests. For example, a 1 MB sequential transfer is broken into 9
separate SCSI commands and URBs, incurring excessive interrupt overhead
and preventing flash controllers from utilizing larger erase/page write
buffers.

Introduce the US_FL_MAX_SECTORS_2048 quirk flag (and quirk character 'z')
which allows setting max_hw_sectors to 2048 (1024 KB) on verified
capable devices. Add an unusual_devs entry for ID 346d:5678.

Non-quirked USB 2.0 devices continue to use their default 240 sectors
limit, and USB 3.0 devices continue to receive 2048 sectors via their
speed check, ensuring no performance impact or regression on other
devices.

Im tested on very common cheap USB 2.0 128GB (chipset FC2279 BA7 - price 4$)

Benchmark fio results on actual device (346d:5678) on Linux kernel:
- Sequential write (1M bs): 10.2 MiB/s -> 13.2 MiB/s (+29.4% improvement)
- Sequential read  (1M bs): 24.4 MiB/s -> 26.4 MiB/s (+8.2% improvement)
- Average write latency:    97.8 ms   -> 75.9 ms   (-22.4% reduction)
- I/O requests / interrupts: 556       -> 60        (~89% reduction)
- 4K random read / write:   unaffected, zero regression

Signed-off-by: Herman Semenoff <GermanAizek@aizekgroup.ru>
Signed-off-by: Herman Semenoff <GermanAizek@yandex.ru>
---
 drivers/usb/storage/scsiglue.c     | 6 ++++--
 drivers/usb/storage/unusual_devs.h | 7 +++++++
 drivers/usb/storage/usb.c          | 6 +++++-
 include/linux/usb_usual.h          | 2 ++
 4 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/storage/scsiglue.c b/drivers/usb/storage/scsiglue.c
index 97de28e85562..2a732e6354e5 100644
--- a/drivers/usb/storage/scsiglue.c
+++ b/drivers/usb/storage/scsiglue.c
@@ -111,10 +111,12 @@ static int sdev_configure(struct scsi_device
*sdev, struct queue_limits *lim)
  * let the queue segment size sort out the real limit.
  */
  lim->max_hw_sectors = 0x7FFFFF;
- } else if (us->pusb_dev->speed >= USB_SPEED_SUPER) {
+ } else if (us->pusb_dev->speed >= USB_SPEED_SUPER ||
+   (us->fflags & US_FL_MAX_SECTORS_2048)) {
  /*
  * USB3 devices will be limited to 2048 sectors. This gives us
- * better throughput on most devices.
+ * better throughput on most devices. High-speed devices with
+ * the MAX_SECTORS_2048 quirk also use 2048 sectors.
  */
  lim->max_hw_sectors = 2048;
  }
diff --git a/drivers/usb/storage/unusual_devs.h
b/drivers/usb/storage/unusual_devs.h
index ac22fa318734..b3ff758d4e9c 100644
--- a/drivers/usb/storage/unusual_devs.h
+++ b/drivers/usb/storage/unusual_devs.h
@@ -2418,6 +2418,13 @@ UNUSUAL_DEV(  0x3340, 0xffff, 0x0000, 0x0000,
  USB_SC_DEVICE,USB_PR_DEVICE,NULL,
  US_FL_MAX_SECTORS_64 ),

+/* Reported by Herman Semenoff <GermanAizek@aizekgroup.ru>
<GermanAizek@yandex.ru> */
+UNUSUAL_DEV(0x346d, 0x5678, 0x0000, 0x9999,
+ "USB",
+ "Disk 2.0",
+ USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+ US_FL_MAX_SECTORS_2048),
+
 /* Reported by Cyril Roelandt <tipecaml@gmail.com> */
 UNUSUAL_DEV(  0x357d, 0x7788, 0x0114, 0x0114,
  "JMicron",
diff --git a/drivers/usb/storage/usb.c b/drivers/usb/storage/usb.c
index 823a4b2e9033..2577db523208 100644
--- a/drivers/usb/storage/usb.c
+++ b/drivers/usb/storage/usb.c
@@ -570,7 +570,8 @@ void usb_stor_adjust_quirks(struct usb_device
*udev, u64 *fflags)
  US_FL_INITIAL_READ10 | US_FL_WRITE_CACHE |
  US_FL_NO_ATA_1X | US_FL_NO_REPORT_OPCODES |
  US_FL_MAX_SECTORS_240 | US_FL_NO_REPORT_LUNS |
- US_FL_ALWAYS_SYNC | US_FL_NO_SAME);
+ US_FL_ALWAYS_SYNC | US_FL_NO_SAME |
+ US_FL_MAX_SECTORS_2048);

  p = quirks;
  while (*p) {
@@ -659,6 +660,9 @@ void usb_stor_adjust_quirks(struct usb_device
*udev, u64 *fflags)
  case 'y':
  f |= US_FL_ALWAYS_SYNC;
  break;
+ case 'z':
+ f |= US_FL_MAX_SECTORS_2048;
+ break;
  /* Ignore unrecognized flag characters */
  }
  }
diff --git a/include/linux/usb_usual.h b/include/linux/usb_usual.h
index 712363c7a2e8..cd246a42e603 100644
--- a/include/linux/usb_usual.h
+++ b/include/linux/usb_usual.h
@@ -88,6 +88,8 @@
  /* Cannot handle WRITE_SAME */ \
  US_FLAG(SENSE_AFTER_SYNC, 0x80000000) \
  /* Do REQUEST_SENSE after SYNCHRONIZE_CACHE */ \
+ US_FLAG(MAX_SECTORS_2048, 0x0000000100000000ULL) \
+ /* Sets max_sectors to 2048 */ \

 #define US_FLAG(name, value) US_FL_##name = value ,
 enum { US_DO_ALL_FLAGS };
-- 
2.55.0

base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
