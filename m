Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F8D48F854
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461885; cv=none; b=fu0HqnGlYIYCnkfOjYRHcOnpUdlc+G/o0b752WuChU2/aJgahWUnlE4GSSuJCnbsaV0qi2I2UrQC8WRXdYv80nlmnAQBLfxKbHvzFJZ5KssuEX8Acgo6pxsA+wH91BFjkNa2VbOrYURnITQdN76SISsLziusJ9YcFnFiEEJGVu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461885; c=relaxed/simple;
	bh=smtLoJu19ETJOp/Y/sLlhHENYirZdw2ORnRTQyyrSTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QTQrNgj9EKJd2xY4Cir6+WZqciy1IvxM7HwEwadf0EG1ekRYwh2sF0ZZ0HBmUU4ddxL9GrXqRTOLftZ4Cd8enaRTeDJvBsb/5rsMDFAtuiox9PwpCrEAXI42n8ymXaMpf6QtwDeAApszcWIOOl5qxFHAc0v5ugIsVIzDIrJQUuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W5I7F8bh; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W5I7F8bh"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f0135fso26788745ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461882; x=1790066682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5BHjMuJMoMYFD23nqg/tI9zUAc/rmyhpkTd9W93sZe8=;
        b=W5I7F8bh5lpjejlNMChqcRGrzgs5nR5EqnpzDVheyq7DSe1VslPMyv0YMwAsffUGce
         LPYcOeV78HJvou37l7d4loT8wU7iF2SjlgV/UEKOKrdQGFsIMPdHL9erdfUvxU8x3b1o
         bub4XzAwx0GpKySAvQpU7vZb/AQWtqQMSf8iCyY1GkWrWlAyGRQQPGxHxkU4RIIQ0BXv
         3/DKByzqhj5H08jDLZVx/KlYpxjveksUzQAXZMI0zx6CEBppvf3MHqnpQt7bxsRoNgFL
         4TDlAn7Xnpj4FHrhjHrcz6jq0C4m/r01vn1/LaHh/fB08RxiyMZ833gG1ATGqkKv7e9g
         aXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461882; x=1790066682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5BHjMuJMoMYFD23nqg/tI9zUAc/rmyhpkTd9W93sZe8=;
        b=LH2FYbLQFhwxbHnVC5oq8cxCaNYFtNJ+SE2qdSZ4d8T/Qu+97i4m0RJF32c604TMjy
         6D8lVuOgZyXAs2902Ft+XIeexwWhitJzRcGFPaFrYLOM9I9h5Hmqyt0lZpAwIhoFnrAp
         NiP7FWdHx1d0nNoMBld09iez6Pb9yD3Anujzcdy9LIWbne4m1o8+s9yJAoC+Tp/t5tkp
         1OSkA4fnMv6260kuIRn5lrFJ5WipYrSZvybO3kUedCNvbuieSWFVoOMeJRmzrggG/fVO
         oRy34BSIEcbRyLZUEBXgDQEdeQoWPjKuS1bt1tv+nWRKGxpYbrEQPFiMpS0boHqYylqN
         qoqQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+fqfUNYBKLKA9zBYaruao+qX22BNR+2GNzVL03cPzacdn1RzVmoY3+NhXwvK1Uc8V4DOYFc0yRxAi/Gk=@vger.kernel.org
X-Gm-Message-State: AFuF++mVupU42FhFvCSnfYuNPCTVqd5/x2S28z6H2MN7gUX8uupOMuAx
	h4xaMScIVlieW8e+G2HYbGdzr+pNsuGDJUQIxz58CfknmVhKJaBKWV+F
X-Gm-Gg: AYBFou3KQS0qWxl0XDAQm+N+KswtRSmfLhyN+HwAgvtSINNIx+uk70yQ7hLxFokV2pe
	CaxiLMwmRkzL3FlUPqxM7S60BiL+YQgeXaiE1RneTxW2kb5YOiLh1yODaRKBpim3UzsMgXxSQYB
	YMg7MImGXLlBWYPpcrnbCLhR3a8+udEGlczeWluKgmSKL+Utbi8JNg6GgZCmrqEdAinP0k9vNFu
	+aPUxxzBAw/hMci9Du2nhbobOkDawkYd01FLgSdEiiwIheULjTJRM2yDVZlyoFuGZJBahaqfDJu
	PxKqLF7rKEIzHLNa3xPEAwPORTOwCySGcLzhQ+C4PbcPFGO2SswjSMQVkaNPg76hYON6OCtw7sS
	aZm8w3acSzvz1KdaUSpRW4NTFiHqBpeAYTVTkuGKDjEal4NsKaB/7yblpGLv9feX5EIZHqecyPG
	uxzvy7oYLX2kxGwlqvtabKLMw6BkRv2PEAoQNtDJksSo5D0kAFte/Ni0ULVAtDjYlnU95b4E0Do
	SwXncQIj9Go
X-Received: by 2002:a17:90b:164d:b0:398:9c00:29ec with SMTP id 98e67ed59e1d1-39dec0a8e92mr11181359a91.20.1789461882378;
        Tue, 15 Sep 2026 01:44:42 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1439110be78sm2421527c88.4.2026.09.15.01.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:44:41 -0700 (PDT)
From: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Kees Cook <kees@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+28cf08dec5895bd562e6@syzkaller.appspotmail.com,
	Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Subject: [PATCH v2] usb: gadget: f_loopback: fix descriptor leak on unbind
Date: Tue, 15 Sep 2026 08:44:17 +0000
Message-ID: <20260915084417.131614-1-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260808181504.462492-1-nagachaithanya9911@gmail.com>
References: <20260808181504.462492-1-nagachaithanya9911@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

loopback_bind() allocates descriptor copies through
usb_assign_descriptors(), but f_loopback does not release them during
the unbind path. On every bind/unbind cycle of the gadget (for example
by repeatedly writing the UDC attribute through configfs) a new set of
descriptors is allocated while the previous ones are leaked. syzbot
reported this via kmemleak:

  BUG: memory leak
  unreferenced object 0xffff888016b8f180 (size 64):
    comm "repro", pid 5613
    backtrace:
      __kmalloc_noprof+0x3bf/0x550
      usb_copy_descriptors+0x6c/0x160
      usb_assign_descriptors+0x48/0x180
      loopback_bind+0xff/0x120
      usb_add_function+0xca/0x270
      configfs_composite_bind+0x667/0x9b0
      gadget_bind_driver+0xed/0x390

Move descriptor cleanup to a new loopback_unbind() callback that frees
them with usb_free_all_descriptors(), matching the lifecycle used by
other gadget functions such as f_acm. With descriptors released during
unbind, the usb_free_all_descriptors() call in lb_free_func() becomes
redundant and can be removed.

Tested with CONFIG_DEBUG_KMEMLEAK=y, CONFIG_USB_CONFIGFS_F_LB_SS=y and
CONFIG_USBIP_VUDC=y by running the syzbot reproducer in QEMU with
kmemleak=on. The patched and unpatched kernels were built from the same
tree, config and compiler, so this patch is the only difference between
them. Without it, five reproducer iterations produce three leak reports,
every one of them through loopback_bind(). With it applied, 25
iterations produce none and kmemleak stays silent.

Fixes: 10287baec761 ("usb: gadget: always update HS/SS descriptors and create a copy of them")
Reported-by: syzbot+28cf08dec5895bd562e6@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=28cf08dec5895bd562e6
Tested-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Assisted-by: Cursor:claude-opus-5
Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
---
v2:
 - Add the Assisted-by: tag that should have been in v1 (Greg KH).
 - Describe the kmemleak testing in the commit message (Greg KH).
 - No change to the code; the diff is identical to v1.

Link to v1:
https://lore.kernel.org/all/20260808181504.462492-1-nagachaithanya9911@gmail.com/

 drivers/usb/gadget/function/f_loopback.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_loopback.c b/drivers/usb/gadget/function/f_loopback.c
index d2d07fb49e70..40aaf2eb00f2 100644
--- a/drivers/usb/gadget/function/f_loopback.c
+++ b/drivers/usb/gadget/function/f_loopback.c
@@ -216,6 +216,11 @@ static int loopback_bind(struct usb_configuration *c, struct usb_function *f)
 	return 0;
 }
 
+static void loopback_unbind(struct usb_configuration *c, struct usb_function *f)
+{
+	usb_free_all_descriptors(f);
+}
+
 static void lb_free_func(struct usb_function *f)
 {
 	struct f_lb_opts *opts;
@@ -226,7 +231,6 @@ static void lb_free_func(struct usb_function *f)
 	opts->refcnt--;
 	mutex_unlock(&opts->lock);
 
-	usb_free_all_descriptors(f);
 	kfree(func_to_loop(f));
 }
 
@@ -442,6 +446,7 @@ static struct usb_function *loopback_alloc(struct usb_function_instance *fi)
 
 	loop->function.name = "loopback";
 	loop->function.bind = loopback_bind;
+	loop->function.unbind = loopback_unbind;
 	loop->function.set_alt = loopback_set_alt;
 	loop->function.disable = loopback_disable;
 	loop->function.strings = loopback_strings;
-- 
2.43.0

