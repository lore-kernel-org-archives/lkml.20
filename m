Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DDA472796
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788346351; cv=none; b=FWaFiISY7pqWRdkl8EMAcD6VI7kAZjuAlQLIW2rwf+4CpmJ50HSSrBlxIqPPwx+v2qWk+H0VzPUruze3JSVMqMbrPL1JxfCyJNg6pLrR+AZtveVfkbqqcz5LIzgUx6pjj49Xv5C3UorMrshOr8qPrFjoBU+uUESvEhB8C5pmXPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788346351; c=relaxed/simple;
	bh=g0xls3eVTYsNQ1+wlJEEKO1atz15pqk+FUgc6sw9KzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KgQx8rqfRIbOdCHwA8AwUkFLQk/8mHylLHNzgNDVKIKi1ORlRZqZkNfqrkgz/Uz1JHIY8j6pX/64yJWeC8KAOSt1lGZubxW3uR1o3sdF12p8Z00ed2RUPJ+CcO5ggmFKEClLCQUTTXn24mh7k7mGj+BNvvNN9BoWvAuq+1LAAVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q6vgBvoD; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q6vgBvoD"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d91518a63fso7547545ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788346329; x=1788951129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bMwJAjsEOYUPm6orTWOWcoAqbi2fMU0sJXMe0aIoTIk=;
        b=q6vgBvoDnaLdtqW4HY78q2XukPkjhQnojcl7vlx6aGbwwqEyFaG2JPINr6uJiuz90v
         MfShCdLn2fjaA2A4hBP4odme0H7ePdkSC6yUpPs4rdRRlvmuGh923q3464JBpbvTYH1M
         gn9aTo9yr8BIIJrxnLbbu34KbRyrqdv3+favw0sd2Wur0pxXa45VppxIWT7c0D5t0d67
         nedMgZldEL5fgvwMy76w0I9gSAdvzhQKXd+pPtwEVenku5buAJA3p5ISETheSvS2OkO8
         jFVKGDBXK15APaEQQWmQKmR+TTLHUepaOl7ObMp0CTPOCUwkIJnHCA09kiTZxPpr9OWP
         7oSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788346329; x=1788951129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bMwJAjsEOYUPm6orTWOWcoAqbi2fMU0sJXMe0aIoTIk=;
        b=FMPR+83+Ytt7tLKEzghNC2926VnA6v1m1jNDqvwqEwo8cvXC859eZapcFixE8iRrrX
         x+9PhpZx8VLvp2QSJOIFZfC6zV4ZuiDw9R8fWBMDynjbeOibFxtdKFuFMDVZ7e6D947q
         M/TIlYxSf1cnmUX0ZpCcUWxPf3s1sRlFuFMJJGXTn1OOVVH9rePJbjWNv+js9IlTRAv0
         UKlk/9+xnTviLXYv+Z0DxFC2zyGYURXVHrYVALZzeGXZqI6i1Ftz5hROYrJ3OuxvJ28A
         Y1Nq1sYapslEDsMNpmd/gF430yDKCgocxp+TMBa0wiCn0USggSOMe9F+kT8RWB9+HlLn
         29IQ==
X-Forwarded-Encrypted: i=1; AKwUvBwoTYrbLtMcpNPA6TmOltTJkR/Oo09k/2YdlsNbwo/4446gohof4qZf3IoUebas4SZgGY2sOJPwb+DdRys=@vger.kernel.org
X-Gm-Message-State: AFuF++nsLiq/xc9d0fF/xc7Eo/No8t4Q/l1ZYnKU1kD0FLkaEPk7MJ/p
	Aby6xO5gT+6MIW240om8V0r8EJNHx3S7nP1r9eXUp+LSp06Yad2LQJE7
X-Gm-Gg: AYBFou0LGDfQ2eOc8RVVQDXCVz3ho+bQBsLlsoePjp/NaYn5Y1PgkKZfwiskctb18Re
	WrM6Umb+m4Kjno79+UikRzr7uM3ObA3GTZ3NE9+f97xToqo0oW9Di3YayRHNj66RixEyQS9fCdS
	qCrH/DBWWxm5HV2K6tcfr+hRkMr4zXOW3lbibVzTaoyHHg+GN0Ase1TMinsro08VaTp/JEO/g2/
	w9q0sT37amr8nn/ig+zSnANY3jeIbsv1gbG70hjZsUzZ8xHeFWEdwJabfugw6Wnelbjc1FZuE5g
	R8Cs4AGyzlwBUqHJ9ODLyyUEVtLoMRyyrqAAjF0dw3vY1m+OoihsSKnjvk5/H+hzi0JXnoXhjke
	pieFEDttBWEUWCtJIe2OPEBLGEm5ZDW0orpOC0SphFjtPFmALo9KGvZinCOI6zbMNlSxj8+xlOQ
	VciejrJbHRbuxvy/Dhpc4TrxQgj/RymHRLPkFXOz/9CkFddJnZY07fqx883QejQWIhEKlkL7Oou
	g==
X-Received: by 2002:a17:90b:2b8b:b0:398:e86b:ce14 with SMTP id 98e67ed59e1d1-39aee1237a7mr6198549a91.20.1788346328775;
        Wed, 02 Sep 2026 03:52:08 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3318bc19129sm3042754eec.16.2026.09.02.03.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:52:08 -0700 (PDT)
From: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
To: gregkh@linuxfoundation.org
Cc: christophe.jaillet@wanadoo.fr,
	kees@kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+28cf08dec5895bd562e6@syzkaller.appspotmail.com,
	Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Subject: [PATCH RESEND] usb: gadget: f_loopback: fix descriptor leak on unbind
Date: Wed,  2 Sep 2026 10:51:53 +0000
Message-ID: <20260902105153.3516793-1-nagachaithanya9911@gmail.com>
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

Fixes: 10287baec761 ("usb: gadget: always update HS/SS descriptors and create a copy of them")
Reported-by: syzbot+28cf08dec5895bd562e6@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=28cf08dec5895bd562e6
Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
---
Resend after the merge window. Unmodified from the original posting, and
still applies cleanly to current mainline (45c13f3f9e3b).

Original posting:
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

