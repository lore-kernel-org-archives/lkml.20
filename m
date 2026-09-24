Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6173B3A7F79
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790226445; cv=none; b=Q2fiDi3ZJfT2wkKi3jql8yIzHKI052JhwL4bMLOe+REjAiz9X2iv7rrrUIMbQgzzSHl0GBXOObGPpgu6cReC59q/k7E8Oolivq9FGguGpoRHshIUZgGnO5sSVYUxS6eAMByq9y9dnCxlD2fulAkazDJF8/xK80ivNmjNG1J70MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790226445; c=relaxed/simple;
	bh=RvN9tr7OMSHjhSPPDl4QRVwPNOQ621tRsWxmvVvpx70=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gmFogJ2HNp5zFYsMPeAd78SgG5lsJRYSfpGNKkSG1XSHb43/N9V3rgzwg6ne2K8BG8XCyIXDW9k5xglCpT9uZR7raiQ4ZQeKsrAflU1lAkbfnEMac/BE3GAwvwW40j8eixthSrToH3GjqVh7GcISTLzysUyuyyrGsm1u32mLB6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VUFKHl6x; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VUFKHl6x"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633ece3so1291984f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790226440; x=1790831240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hAiejLrEozrEZ8WjZRhX5Jq/prYDWf06MJHYnvfVrr4=;
        b=VUFKHl6x+BYZUQl45FQlDzv+KJoGQOZzuRwADS+os4hNlF4tNPoFfbI6k+sRmzsH2F
         S/n75OgaptPOdl9vNooYjPfiSDCtIwTPmGSLoDuIeqWXGm9I0HfZIRMevhHDNNzThqQy
         Ltvi7ZnVSfVNbyjeF+h3XERurhdscX2L3IiK3HUHbidQylUMS0rVx00ZcvokIzagtxZW
         ePKAeb11bG3gDOB9cdGo27O+jsPuisdS6REgVhM1Dt0EVtbIL2GlEIx8ucFJY3piKEFi
         /WMRruckjDrNAoMFU8OBynCMQm1yCp8PqwSUpcDCBXejU+55FQiheDRmMnCJ4+IhTMN7
         tq1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790226440; x=1790831240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hAiejLrEozrEZ8WjZRhX5Jq/prYDWf06MJHYnvfVrr4=;
        b=xafpKObrVPRpLF1r74Qnl8LfYMkmBu7GISu00PpsEAobUaZu7PPOnRRrmINiQ3lZ5Q
         xC0Oqw6vrqnCbH2KNWUP+H3eUXeRHG0WVN6ml1A9bNXGvii7vK9Ddfvl3k7rv7lZ1WUL
         pU/6QlB1IwmeshP7+q0aYFmRMwbo68B/BJcE8hGTJmKveJaq5ztaxJ7k7zm8LXp6zK6B
         eLypeucgrbClaIaG2yIqV2Ruui1EcjFTvmXj332DKVjdKvsk9QptSd+H3cAea0qUuv6Q
         EyhMbtHoa4n+mB9N4AEmgEEmiWGK78eji6UNH0WAZ6EGCjcEusqgfP6jT8VNa2BFHC0E
         UBPA==
X-Forwarded-Encrypted: i=1; AKwUvBykGi4FcawUW9F0+QNTzpAVeU5Wx9CLuTjFS/TblSLgRgwOsVYsRVKlYyNnCeNb6LIkj75oDv7zM6KEq5w=@vger.kernel.org
X-Gm-Message-State: AFuF++mM3ziI6eebgoEL2Ebi+NGlRPHG3shdevmwrl6XVeJxSIVCe0+x
	CyQSgh4y0CfvtG5wCcYqcuyr4SNbmz28jLjLoC68mckt2xov9NQ7ZQkK
X-Gm-Gg: AYBFou2rL6TbeSxRj1qZMbnSlBj2WFuoN2ye7JODBOyjNcmwsCFdVuABf5hTAt3Ptcj
	61fEjqVt664iyG6ofonQ5NcXsGHEIMf6w77SyHH9hN+G9qMyScne0DE1es8GQDsgygM2tsR+3i4
	+LUe2CMKAZzMtgNRf0XVhqrTtj2wSmRgkQQcqYlh6DNq3xY07PhL4WzL7X78vQFwWHc4zhflEZj
	DPOP5Ypk+qDr0mqEvGJrlm7fpIbFDY51uoMLGd2c24g5Uq1qhSE0wmlIUOFteuqh7toEn4F/UFw
	qusnajEy+c8ialkwwycyNvrIwq2+LgNC47TDX6CsRuuZq3m2Qnm+LSvpNIaOpfljcZhezck9W0a
	KdYE1n1mcmTN5gg2bR49c/BdEjnT4LHXaQqU9B2bC5zSrb7L5i52oSQJAeYjwblD0g11SwHXFGD
	h7l9iIJXk/51G0ncYjxdT+bLTXqKPGhaD5uJVqJG62XEKZUyfhEXkjmUbUfsxLz4qi1w9U
X-Received: by 2002:a05:6000:2510:b0:487:c99:9020 with SMTP id ffacd0b85a97d-48871714226mr2176971f8f.2.1790226439478;
        Wed, 23 Sep 2026 22:07:19 -0700 (PDT)
Received: from archlinux ([188.163.27.108])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868889926sm15720202f8f.36.2026.09.23.22.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 22:07:18 -0700 (PDT)
From: Matvey Valigura <valigurasm@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chas Williams <3chas3@gmail.com>,
	Duncan Sands <duncan.sands@free.fr>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	syzbot+9ca2c9f85bd8b5e46516@syzkaller.appspotmail.com,
	Matvey Valigura <valigurasm@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] usb: atm: use request_firmware_direct() for firmware probing
Date: Thu, 24 Sep 2026 08:06:54 +0300
Message-ID: <20260924050654.15347-1-valigurasm@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When disconnecting a device while firmware is not present on the system,
usbatm_usb_disconnect() waits for the heavy_init thread to finish:
    wait_for_completion(&instance->thread_exited);

If CONFIG_FW_LOADER_USER_HELPER_FALLBACK is enabled, missing firmware
causes request_firmware() to fall back to sysfs/udevd. This creates a
circular dependency during disconnect:
1. usb_disconnect() holds device_lock(&udev->dev).
2. usbatm_usb_disconnect() waits for instance->thread to exit.
3. instance->thread waits for request_firmware() sysfs fallback.
4. udevd receives the firmware uevent and attempts to read sysfs
   attributes (e.g. serial), blocking on device_lock(&udev->dev).

Furthermore, the fallback wait uses wait_for_completion_killable_timeout(),
which ignores the non-fatal SIGTERM signal sent by usbatm_usb_disconnect().
Because speedtch and cxacru probe multiple candidate firmware files
sequentially, each file stalls for the 60-second fallback timeout,
triggering hung task timeouts (>120s) reported by syzbot.

Switch to request_firmware_direct() to probe firmware files directly from
the filesystem without falling back to user-mode helper.

Reported-by: syzbot+9ca2c9f85bd8b5e46516@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=9ca2c9f85bd8b5e46516
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Matvey Valigura <valigurasm@gmail.com>
---
 drivers/usb/atm/cxacru.c   | 2 +-
 drivers/usb/atm/speedtch.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/atm/cxacru.c b/drivers/usb/atm/cxacru.c
index 636f7886f..7d1944487 100644
--- a/drivers/usb/atm/cxacru.c
+++ b/drivers/usb/atm/cxacru.c
@@ -993,7 +993,7 @@ static int cxacru_find_firmware(struct cxacru_data *instance,
 	sprintf(buf, "cxacru-%s.bin", phase);
 	usb_dbg(usbatm, "cxacru_find_firmware: looking for %s\n", buf);
 
-	if (request_firmware(fw_p, buf, dev)) {
+	if (request_firmware_direct(fw_p, buf, dev)) {
 		usb_dbg(usbatm, "no stage %s firmware found\n", phase);
 		return -ENOENT;
 	}
diff --git a/drivers/usb/atm/speedtch.c b/drivers/usb/atm/speedtch.c
index 9d28c652b..c82db2f7a 100644
--- a/drivers/usb/atm/speedtch.c
+++ b/drivers/usb/atm/speedtch.c
@@ -357,15 +357,15 @@ static int speedtch_find_firmware(struct usbatm_data *usbatm, struct usb_interfa
 	sprintf(buf, "speedtch-%d.bin.%x.%02x", phase, major_revision, minor_revision);
 	usb_dbg(usbatm, "%s: looking for %s\n", __func__, buf);
 
-	if (request_firmware(fw_p, buf, dev)) {
+	if (request_firmware_direct(fw_p, buf, dev)) {
 		sprintf(buf, "speedtch-%d.bin.%x", phase, major_revision);
 		usb_dbg(usbatm, "%s: looking for %s\n", __func__, buf);
 
-		if (request_firmware(fw_p, buf, dev)) {
+		if (request_firmware_direct(fw_p, buf, dev)) {
 			sprintf(buf, "speedtch-%d.bin", phase);
 			usb_dbg(usbatm, "%s: looking for %s\n", __func__, buf);
 
-			if (request_firmware(fw_p, buf, dev)) {
+			if (request_firmware_direct(fw_p, buf, dev)) {
 				usb_err(usbatm, "%s: no stage %d firmware found!\n", __func__, phase);
 				return -ENOENT;
 			}
-- 
2.55.0

