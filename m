Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6608D381E97
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 06:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788849212; cv=none; b=aoLfan3Y3nZv/z4ToEYFhtPTtZTIj2O1KGdR8PfgSztuqQRnD/Ky5x3yUeuORjecMmvvSN8SguMNcNpiMsKQc2Dmi6ffobO3MoJybCrBIIPtOB1jMyhOeWiAbQZ+jQwt6SGG5EKUERPHLdTYRxDQiJbnjx6kdL4iTRVfFwbO2iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788849212; c=relaxed/simple;
	bh=lJv6eJR5mkEr9k0dTv4+CwWjD8kgzNxhcrNjm73iZCs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=sHwXoMKSDsbKBHz0hxo/J0tP0KodXuQ5/nYqV+y11rLgl/OdcuVIrAK9UY05Q2swjqG3cOksS8QoM17LLKRWsIAs3fVN4ET9TJWRh4nGmtucjmyZCuh7Ldfjd4aLcS+AzhgPEDkWhhUwmMxRUtXzGnN1WRWLf16+1HIdag9voM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-45952ce9ee0so6305222fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 23:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788849210; x=1789454010;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gwTb2fLHdqodpBhDIyQcNRVw+1rurXDj6sSS2N2m1n0=;
        b=DKpS6Qke0sjwEvpc7Y2gy6jtPgHUQ/dMszAvcRZnMuJwgu/wYTMJ/YYuhzvUpPBcFL
         /knxHcP5tweUoVbsiXxjsBPE1CozSIQTv3qUOQD4mXz0WevsPkiakAr/FlVcDjSXGqe9
         eZ3Ffht1FqFPCwADpYvZnTJb4ukhLDp5aCJV6oR3cZEPMu/f1mpjVkBaApg+n306ID1M
         dA81IpPuoB7XS8YqmM8gzL1poQG104z/P2PPyPB4bsS6Y5zpBhU96oUDHkJns0F7vt/K
         Am2QA3GcCzm5kaU7/DP1Nleb9/JxMdcp200p47CBEOlwKMMHhwgobw1gN0erY/7KOGPb
         jAMw==
X-Gm-Message-State: AFuF++l1V8gbLMX0T+WBsHYQGvUW3nZgEROFijNpGpRVEiQJlukqDoCc
	gcnw3TZfdj/kuz8WN4HsvWjdxAAKjUr2EBy1PzUsf6VJtz1o5UWBEkxYIzOjN5uipaPaAOXYTuc
	6+luHPBxI5W3g+ZzQbMUnqiau82E0WsUXGU1jDuLAscxLTJL5ztXnG7P7t/M=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1997:b0:6ae:4d93:cdc2 with SMTP id
 006d021491bc7-6b6fa8dd522mr16191303eaf.5.1788849210283; Mon, 07 Sep 2026
 23:33:30 -0700 (PDT)
Date: Mon, 07 Sep 2026 23:33:30 -0700
In-Reply-To: <6a81dc49.dbb3a75c.20434b.0037.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9fac3a.6e6c5f9e.28f11f.0008.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [usb?] general protection fault in adsl_state_store
From: syzbot <syzbot+9b195c4f412ea5c4e56a@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [usb?] general protection fault in adsl_state_store
Author: jie.wang@intel.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

diff --git a/drivers/usb/atm/cxacru.c b/drivers/usb/atm/cxacru.c
index 75d87c31e81f4..4322553f2902c 100644
--- a/drivers/usb/atm/cxacru.c
+++ b/drivers/usb/atm/cxacru.c
@@ -356,7 +356,7 @@ static ssize_t adsl_state_store(struct device *dev,
 	if (!strcmp(str_cmd, "stop") || !strcmp(str_cmd, "restart")) {
 		ret = cxacru_cm(instance, CM_REQUEST_CHIP_ADSL_LINE_STOP, NULL, 0, NULL, 0);
 		if (ret < 0) {
-			atm_err(instance->usbatm, "change adsl state:"
+			usb_err(instance->usbatm, "change adsl state:"
 				" CHIP_ADSL_LINE_STOP returned %d\n", ret);
 
 			ret = -EIO;
@@ -376,7 +376,7 @@ static ssize_t adsl_state_store(struct device *dev,
 	if (!strcmp(str_cmd, "start") || !strcmp(str_cmd, "restart")) {
 		ret = cxacru_cm(instance, CM_REQUEST_CHIP_ADSL_LINE_START, NULL, 0, NULL, 0);
 		if (ret < 0) {
-			atm_err(instance->usbatm, "change adsl state:"
+			usb_err(instance->usbatm, "change adsl state:"
 				" CHIP_ADSL_LINE_START returned %d\n", ret);
 
 			ret = -EIO;
@@ -481,7 +481,7 @@ static ssize_t adsl_config_store(struct device *dev,
 			ret = cxacru_cm(instance, CM_REQUEST_CARD_DATA_SET,
 				(u8 *) data, 4 + num * 8, NULL, 0);
 			if (ret < 0) {
-				atm_err(instance->usbatm,
+				usb_err(instance->usbatm,
 					"set card data returned %d\n", ret);
 				return -EIO;
 			}
@@ -490,7 +490,7 @@ static ssize_t adsl_config_store(struct device *dev,
 				snprintf(log + tmp*12, 13, " %02x=%08x",
 					le32_to_cpu(data[tmp * 2 + 1]),
 					le32_to_cpu(data[tmp * 2 + 2]));
-			atm_info(instance->usbatm, "config%s\n", log);
+			usb_info(instance->usbatm, "config%s\n", log);
 			num = 0;
 		}
 	}
@@ -827,6 +827,12 @@ static void cxacru_poll_status(struct work_struct *work)
 	int keep_polling = 1;
 	int ret;
 
+	/* adsl_state_store() calls this directly, before the heavy-init thread
+	 * has set up atm_dev; bail out rather than dereference NULL below.
+	 */
+	if (!atm_dev)
+		return;
+
 	ret = cxacru_cm_get_array(instance, CM_REQUEST_CARD_INFO_GET, buf, CXINF_MAX);
 	if (ret < 0) {
 		if (ret != -ESHUTDOWN)
