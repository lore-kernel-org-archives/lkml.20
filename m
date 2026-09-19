Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789772C3255
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 11:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789817300; cv=none; b=rSv3iLxHigYgiWVl+dzlzBDHjdHaM0hcio+j+R3nEDvQp3hNSbyFMh3RyjBqg6gWicJhS1QI1E2Tv1lLYhv4iZinknxRyiplufyGFOQ3WIJZuIqk9Gflj6UtXyX3Nb1n2BddDZ2BypcpPB+5kB+mPcYZv/0egUsr6Or7Ig0x/N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789817300; c=relaxed/simple;
	bh=KwS38VQMl+M2ovzFOIcuEhf/7je/VrqKaStxsunuaLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r+KTKG7+i1cZDwimv+vfqbvPUP1a3JVmzS0HOF/XY2797zXiGxOUWTKeX6znQAgEjSv+r8cTjW4l+VcphJ8ujXkeX0ibL8uCjoGTrsmHy9cF0I+Ib9Ew9NHtUzpZGDUFxgtN5/phdjDP2KDK5ZoQZtN+qdCu/ZM4G6kAxoK2Z7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hDWQwopl; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hDWQwopl"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8686f46e4adso1382145b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 04:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789817299; x=1790422099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ILBWsNQB9tB/faYYelS01V7QqF8bSpkBdWQwkiyttNc=;
        b=hDWQwoplb77XHik2CTUn+88MLbpF5eB03gtL8pgNN0W1JHqXrtY2HefeRZsbQ6hjXm
         KNI15ttBXp8tWA53KJHcy6QgtNZz6PT/zAeRJjkSE2gdlO+iFzX1KbrSuchsJlWxxsic
         JQKid7rKUZGotNYeii2xJaE4DTLyjhr9cCR0Q0oays/8JgHbGrxRuF3Pe2jCbpmaO1W2
         CXXnGRoUHNh5dSJCINuvFQYqCmZDZxHR81+zikxKZb2oJDQ2GTYgHPsQXziI16luJ5Fy
         sRt7M+Lx0YV3OCpfZWumNyMnTWxjPbhNyq4ifWZgjPROmbiSyUiuXQETHW0JERBIuoR7
         QCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789817299; x=1790422099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ILBWsNQB9tB/faYYelS01V7QqF8bSpkBdWQwkiyttNc=;
        b=uLfPsWAqa7FvAlQLdKd7riruNJu7qPzeE0u6s977gadbLBQMlgte02LwGXgf7Y3gHF
         yE3b2Bzs29aOMfQWl1Fq+aDOC1605sjCvjRArYrxLxbDI1KNXhXnto+8tcHOFrHenN0J
         6o6Bfq1IVyqKmIqAdbzZTI51hhHvitjQ0gyvQFGGlUmmvIz+3yzd1cvQyu+q7pYJdLuY
         Q3eR3yBPMgUWOIbJmui8FEScPCv9iIbGJpV23I2aaSkoYXUW5NfVHb9TguES4SmnFwmi
         M6SODC4cAgahW4st3YM3NFCPp+C71Oyh7NsJS7sHPao46d1W3Qh+2br8OyMdmQeR4IwG
         zQIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAWfn6fdFe+OEETQ9EtUUe0fZkr4A0nP4JaX01QRnT9QuOmXrQp9Y+vGPn9oBvYsf8AVpaVQ1Gnetbork=@vger.kernel.org
X-Gm-Message-State: AFuF++nuRe5liHse1E9uKnwv7LA9jNUmk/FBFQ9NLvu03OHF7d4tWCSB
	e61LIXiMiSAg0Uu5TYqMqBoW10gVKE5sBSptGovC1DAUbUTn0P/68937
X-Gm-Gg: AYBFou0LQq27o4pUTNHdm5CCbB/RzQVw7w+/jNI8jtYn+SdZlsP1GJMKVanbSqQx4UZ
	cOYuYoYJdaOa+scdm1eIvcsUeteLycYyHagwZViiTFjEp5b4J6vwi0HA6Hsbwfpt+vSNBU4mLq4
	aD9/6k2Fi4qemZGuYwK1Yoi9tnPRHlRA1Q5y3zelFw/TS7EtSn/+HS9btvUTN/8dSmeXymaMyMt
	YzYSTyi1bhE0uiE+lr0/3EYRIKdt8pnHVeFo9qwN3dt8luBI4QwuL8a9mDOxSS6Ttc32AUJP64q
	0iTlz6hbpa1sDXnWY27iu2yRxGJ0eI51frsgGVYVwnZ2ijSSbF76rN9TIcLjRM2LUCcEuVm92Q9
	7PqCcPzT1Mt3zmQOT8PxnE396GDd5WoDl4abfkF5Dw90UKYOTrLdlqwxdh/L2Bu/C2BhhC3FwjH
	yEeoiuTA19QH0s6fuVkJzX8vmuBdRm9Zmv5gSsmBDYwQ4n4RYdJjELOhsxmYm5Qy6wS3OzhAuGW
	UByx6wLSr2pIGaTwNwfb43fc1/93E1+Ps6gErx4JGedXVjTvmGnHKfG/7SBmA24COWqdZWJkNb4
	XffCj3FPbw==
X-Received: by 2002:a05:6a00:2192:b0:874:706d:856e with SMTP id d2e1a72fcca58-874de8fec6bmr8664389b3a.31.1789817298781;
        Sat, 19 Sep 2026 04:28:18 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a9b0d4adsm951753b3a.36.2026.09.19.04.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 04:28:18 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] usb: gadget: f_printer: fix OOB write and UAF of pnp_string in printer_func_setup()
Date: Sat, 19 Sep 2026 11:28:16 +0000
Message-ID: <20260919112816.3885630-1-benquike@gmail.com>
In-Reply-To: <20260919080848.3005712-1-benquike@gmail.com>
References: <20260919080848.3005712-1-benquike@gmail.com>
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
Fixes: fdc01cc286be ("usb: gadget: printer: Remove pnp_string static buffer")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
v3: Add a Fixes: tag, fix the subject prefix, correct the overflow size
in the subject, and - importantly - flag a problem with my own patch
that I would like guidance on before you take it.

Fixes: tag. fdc01cc286be ("usb: gadget: printer: Remove pnp_string
static buffer") is where both halves of this start. Before it, value
came from the two on-wire length bytes and the string lived in a static
1024-byte buffer, so neither the unbounded copy nor the
free-while-in-use was possible. That commit replaced the length bytes
with strlen(), dropped the w_length <= PNP_STRING_LEN test, and made
the string a kstrndup()'d allocation owned by configfs. 24b7ba2f88e0
("usb: gadget: function: fix dangling pnp_string in f_printer.c") only
converted char * to char **, and itself carries Fixes: fdc01cc286be.

Subject. v1/v2 said "3074-byte heap buffer overflow", which is wrong
for current mainline and I should not have left it there.
ed769520727e ("usb: gadget: composite Allow for larger configuration
descriptors") raised USB_COMP_EP0_BUFSIZ from 1024 to 4096 in v4.17, so
on 7.3.0-rc3 the overflow is only 1-2 bytes past req->buf. 3074 bytes
is the worst case on v4.11..v4.16, which is where my first trace came
from.

Now the problem with the patch. The spin_lock(&dev->lock) I added
around the pnp_string access does NOT actually serialise against the
free: opts->pnp_string is kfree()d in
f_printer_opts_pnp_string_store() under the opts->lock mutex, and
dev->lock is a different (spin) lock entirely. So the locking hunk is
decorative with respect to the use-after-free. What really closes the
UAF in this patch is the opts->refcnt -> -EBUSY check in the store
path - but that contradicts the intent stated in 24b7ba2f88e0, namely
that "the ieee 1284 id string should be allowed to change while the
device is connected".

So there is a real design choice here that is yours to make, not mine:

  a) keep -EBUSY and accept that the ID string becomes immutable once
     the function is bound (simple, but a behaviour regression), or
  b) drop -EBUSY, take dev->lock in the store path as well, and
     free the old string outside the spinlock, or
  c) snapshot the string into the f_printer_dev at gprinter_alloc()
     time so setup() never touches configfs-owned memory at all.

I would lean towards (c), but I did not want to send a larger rework
under a Fixes: tag without asking. Tell me which you want and I will
send a v4. The bounds-check half of the patch is independent of this
and correct either way.

Backporting: this hunk is written against the post-v6.1 form where
dev->pnp_string is a char ** (24b7ba2f88e0). Older stable trees still
have a plain char * and need the extra dereference dropped; they are
affected too, and more severely, per the buffer-size note above.

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

