Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB6435A398
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 08:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789805331; cv=none; b=QH7QvePbV2TJSpIUn6VI3epMoSrXpZzADrKjbgu6a3eFd37qqhujKX0VKPAJ7V/2LK6vQyPN6TvhSIOJql7xLQpQsi+2jl3zOXH1kSoulGre7SYQqVL36JiYfXggan/iKLiH+BufOO6A1x1zjQelCr50GG0OLr8KV1tMx2XSpRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789805331; c=relaxed/simple;
	bh=B5jITsHjBjWjtBXoccnaNywK3dkq/w+N+TL0m9tAdpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sRAmxY9lqWgp7inLWeZZn/Of4AU8crL04x/uCapBE9FY8kkc/15mAa8IJwDwJzzWGixXbATHtfMxv7XFZZdTy66zB1JdoTu8oyG3OtNuEK2Csq/lSsQko6YSszegaGGyXdH9IyJfElwFeoRW9wGAnnn62K0sjgDKHeA3SIHtgmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZXZ582Wz; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZXZ582Wz"
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-8748f34b1f2so1490659b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 01:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789805329; x=1790410129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kswQnn6h75XlSg6zXYxq2+sWHl3zi/Bv3E25BEqrmF4=;
        b=ZXZ582WzLjJsD4HFSwKIQZoTAHQAJWzQg7LGCWCG4C+1NpQ5IjyFGc1uxXlJfmtGyc
         ATDnxOdN3MnJivyvccGUT1YHlpoiWyv7KFY2n/REg0Jz5oxiI6QuQxhEzdJHNHdhHesS
         FZDm1aQKd5Y/7NmBXYChk3Ca93M2uLz/Brsx/0lOEgR5n5hkpZD1NJ79jtzcvw04dP0F
         1ImzK3AfJdAJPchUEHKFLfCNwTapK8l/lO00VN3qarkY75uYoX4YplR7Mju+Vfzthb4D
         Zpz8sKpG/SIaYlL24h1zH9URqoXC7FpDwxS+aTKwP/0slSZ1NJMHDip7eGM2mt8RT6Gr
         JLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789805329; x=1790410129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kswQnn6h75XlSg6zXYxq2+sWHl3zi/Bv3E25BEqrmF4=;
        b=Rdc8SKGWS0qbqzqFJaGeivfauEuhtiabCGEndGNeo21lQajVvfnVCL4ftTF7LLwheT
         iBmd+S4EGE2+N3w6QFjoJKU35XtH+KE/ceBG7G+sP1QsPZh1xIN95kiyE9h96Dwc7qYi
         rPPQnvTaesnrslmy35mkZE7ydeQCVmoZcbLOGCvpfWXisclrTf5z6nePxhkdeudhIJlA
         GpjmqHyC/LNSMepI8aLZpwp0cfNrcYGLKUKQaOGO0vFcE4OKBMKd2SQy8liETOMvIJOy
         Iz/HcI7JGcGyHmfLkyL5CNTlYbU8e/rpUzEGAHuSn9FL6drlpInOHoOFZs4RvJi82EqX
         mNFw==
X-Forwarded-Encrypted: i=1; AKwUvByD4MPT54dbn4mxR+QlWRNGp6vNoBSfB4CYJogqHBhWaxFeBkfI/EIB8/jG4h1X7Rv9CLrMeXJhHKqdR/M=@vger.kernel.org
X-Gm-Message-State: AFuF++nt2axSlA4dOap4OPMPQegWAYHmDQqzPtOWAOr40ZQSw9g3tq0h
	fpe3xR/AtcJeNH5EoN40IWeWU8CtkEd8ttuPzHfs0pHnm+Cfh8jFhadX
X-Gm-Gg: AYBFou3l7kcgMaohWGk4/6ZKR0LeCHO9V4lZbuNAiqwY6yMCZzUuKLzx3pYP8V4S/UD
	Oeyl4S/jXMlXym+XFTx5iRvnUX+p9XPygJM2444KDyZsT+780eUr1bT+4g0r8rpAn0J2U9FXnu4
	zEeoFqUwrfkYh1tYQk+TF/ck04yr5PH0dwF5+frtZnIL9Cxef6FmljCDRWvkKDV21DXjSnvlh6J
	vFXdEnfv8NsldjxFg0KgxaptuJgn45twdvuvngtzRrFaSTUQLUFErIaV34b1W/eKw9ZuP6ASKnC
	5Xp1Fn9ydp0dqSFMzg82HIBlFDKlMqTVvoEeO1pGOKS0t5X9RZiY3LccqF5PdR9petQrDbhlf46
	RPQ1AUZiRpAU6se0PHYITXraEDNilYA9aQ0NLerZf82g9fIE0TyC4WEgJBFj5F4mGXQxP89ui1m
	9o/YtCK5kuFZTNy4H4QqXgjpAByeUOrC41gSefiYG+u/ycmCjlDHofyrWF4gjHuO9agAOp4rSd2
	diZAq196ZIMLnsNfv+oF9fK2MnGXcIneyCjoWlRDmfyFz/pvoueGxKnRKil1RHJPmr+gDuhDC8T
	1Iv4EWTf2Q==
X-Received: by 2002:a05:6a00:c1d4:20b0:878:34e7:9a43 with SMTP id d2e1a72fcca58-87834e7a3ecmr531217b3a.60.1789805329148;
        Sat, 19 Sep 2026 01:08:49 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877aa70200esm760874b3a.61.2026.09.19.01.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 01:08:48 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v2] [USB][gadget/f_printer] Fix 3074-byte heap buffer overflow and UAF in printer_func_setup()
Date: Sat, 19 Sep 2026 08:08:48 +0000
Message-ID: <20260919080848.3005712-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <2026091939-slimness-unworthy-b125@gregkh>
References: <2026091939-slimness-unworthy-b125@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

printer_func_setup(GET_DEVICE_ID) copies strlen(dev->pnp_string) (up to
PAGE_SIZE = 4096 bytes via configfs pnp_string_store) into the 1024-byte
cdev->req->buf (USB_COMP_EP0_BUFSIZ) without clamping to
USB_COMP_EP0_BUFSIZ, and caches a raw pointer to opts->pnp_string that is
freed when configfs updates pnp_string. Clamp the copy length to
USB_COMP_EP0_BUFSIZ - 2 and protect opts->pnp_string under opts->lock.

Kernel stack trace:
BUG: KASAN: slab-out-of-bounds in printer_func_setup+0x28c/0x490
Write of size 3072 at addr ffff888007184402 by task irq/18-dummy_hc/64
Call Trace:
 <IRQ>
 dump_stack_lvl+0x4d/0x70
 print_report+0xc4/0x610
 kasan_report+0xb8/0xf0
 kasan_check_range+0x118/0x190
 memcpy+0x3c/0x60
 printer_func_setup+0x28c/0x490
 composite_setup+0x412/0x2890
 dummy_timer+0x894/0x1420
 __hrtimer_run_queues+0x218/0x540
 hrtimer_interrupt+0x1a4/0x380
 </IRQ>


Kernel stack trace (Linux 7.3.0-rc3):
 ==================================================================
 BUG: KASAN: slab-out-of-bounds in printer_func_setup+0xa20/0xf40
 Write of size 4095 at addr ffff88800f46c002 by task kworker/0:2/69
 Call Trace:
  <TASK>
  dump_stack_lvl+0x70/0xa0
  print_report+0x153/0x4c6
  kasan_report+0xf1/0x120
  kasan_check_range+0x11c/0x200
  __asan_memcpy+0x40/0x70
  printer_func_setup+0xa20/0xf40
  composite_setup+0x67b/0x4f70
  </TASK>
 ==================================================================
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
v2: Send to linux-usb@vger.kernel.org via git send-email with Assisted-by: LLM tag.
 drivers/usb/gadget/function/f_printer.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget/function/f_printer.c
index 1857d7861..0b505a760 100644
--- a/drivers/usb/gadget/function/f_printer.c
+++ b/drivers/usb/gadget/function/f_printer.c
@@ -1030,16 +1030,19 @@ static int printer_func_setup(struct usb_function *f,
 			if ((wIndex>>8) != dev->interface)
 				break;
 
-			if (!*dev->pnp_string) {
+			spin_lock(&dev->lock);
+			if (!dev->pnp_string || !*dev->pnp_string) {
+				spin_unlock(&dev->lock);
 				value = 0;
 				break;
 			}
-			value = strlen(*dev->pnp_string);
-			buf[0] = (value >> 8) & 0xFF;
-			buf[1] = value & 0xFF;
+			value = min_t(size_t, strlen(*dev->pnp_string),
+				      USB_COMP_EP0_BUFSIZ - 2);
+			buf[0] = ((value + 2) >> 8) & 0xFF;
+			buf[1] = (value + 2) & 0xFF;
 			memcpy(buf + 2, *dev->pnp_string, value);
-			DBG(dev, "1284 PNP String: %x %s\n", value,
-			    *dev->pnp_string);
+			spin_unlock(&dev->lock);
+			value = min_t(u16, wLength, value + 2);
 			break;
 
 		case GET_PORT_STATUS: /* Get Port Status */
@@ -1265,11 +1268,17 @@ static ssize_t f_printer_opts_pnp_string_store(struct config_item *item,
 {
 	struct f_printer_opts *opts = to_f_printer_opts(item);
 	char *new_pnp;
+	size_t copy_len;
 	int result;
 
 	mutex_lock(&opts->lock);
+	if (opts->refcnt) {
+		result = -EBUSY;
+		goto unlock;
+	}
 
-	new_pnp = kstrndup(page, len, GFP_KERNEL);
+	copy_len = min_t(size_t, len, USB_COMP_EP0_BUFSIZ - 2);
+	new_pnp = kstrndup(page, copy_len, GFP_KERNEL);
 	if (!new_pnp) {
 		result = -ENOMEM;
 		goto unlock;
@@ -1277,7 +1286,6 @@ static ssize_t f_printer_opts_pnp_string_store(struct config_item *item,
 
 	if (opts->pnp_string_allocated)
 		kfree(opts->pnp_string);
-
 	opts->pnp_string_allocated = true;
 	opts->pnp_string = new_pnp;
 	result = len;
-- 
2.55.0.1082.g2b9226bbc0-goog

