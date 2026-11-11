Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.81.71.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794396910;
	b=3P8hbQoQPK//XHAl4q2UDbyz+5/eU+5mwcu0LE8Utv/00G4UioUfCpXDm8eMRMoKV/fQ
	 A7t7h/LhCqj/umPGXHabpS4xisXNUbUpJVJ7oK1/yqkOSF5p2dlBZeuCrl+Cc0Ewgo1jp
	 nBvhyQ1PMYsbYYtpJMhQ+gGXwygFOkwu6K8xxnsqLRg/nTwYRhSct/gO1+jL1KrFimg/D
	 UsPeS+8oi+ei3vZozt5ORyIgvHAeb6ku0nsIAHtefdyYsLxP9jomRK1iFQ1OntmAOIStm
	 6OaOTxav8djQZN3zmQq7xOga/MzWKyK5VgAPPX7GqD2YFgu393UjWX22SCImUnY9GxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794396910;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:From:
	 x-ms-reactions:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Developer-Signature:X-Developer-Key;
	bh=6VRlRGj6K6JEINUEFGOSW7SlQDEDIC26Ju9SSAJCmBc=;
	b=MKF8fEqtApmoi+L7vSoxGGcU5z3wo1O71VlS0HkzhIGXoijanlmfE5POta1069mv9ELJ
	 UG+9pbIdS8+8TfYxC4f2avEMuc7NDt3GUfQGgdm9IX2vZoShPbU6k655MwDMuGLHYG5aM
	 ZH/Mv/u+51FGnMopl+fE5KFMjYSvhNiczwjcErMELwoRicClE4Zmz+kl+P3C/FNOzBhG+
	 o6uiF0fbw5ZyONXYY1AQqKHS8tPumIdMo0RusbwFB5xKCWH7Q4gwMUgJuSebwF+38sX+k
	 RIzIlEq0NWOJI7pA41I0EbG6tR9pdtGUzKp4z1WIBu/H5xjRzOgOS/Kx7FPBHyeQeuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=puzzle.ch;
	spf=pass smtp.mailfrom=puzzle.ch;
	dkim=pass header.d=puzzle.ch header.i=@puzzle.ch header.a=rsa-sha256 header.s=20211230 header.b=UTwERfHn;
	dkim=pass header.d=puzzle.ch header.i=@puzzle.ch header.a=rsa-sha256 header.s=20211209 header.b="XtGe/DMu";
	arc=none smtp.remote-ip=45.81.71.239
Received: from mx04.puzzle.ch (mx04.puzzle.ch [45.81.71.239])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EA2606A326;
	Wed, 11 Nov 2026 11:35:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5EA2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=puzzle.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=puzzle.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=puzzle.ch header.i=@puzzle.ch header.a=rsa-sha256 header.s=20211230 header.b=UTwERfHn;
	dkim=pass (2048-bit key, unprotected) header.d=puzzle.ch header.i=@puzzle.ch header.a=rsa-sha256 header.s=20211209 header.b=XtGe/DMu
Received: from mailstore02.cloud.puzzle.ch (mail.puzzle.ch [IPv6:2a06:c00::5086])
	by mx04.puzzle.ch (Postfix) with ESMTPS id E193E104;
	Wed, 11 Nov 2026 12:35:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=puzzle.ch; s=20211230;
	t=1794396901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6VRlRGj6K6JEINUEFGOSW7SlQDEDIC26Ju9SSAJCmBc=;
	b=UTwERfHnmIzPlOIEN7bmQyrqwPmpL91qpLi90ACSUaVY5mlTjCU3CvTT+cJn9geVRGsvvB
	pS5Ij1ndcxvn2nEacv8Q/QvmRDkTGHexIfy4c/VT7ChzHdAQPTKEVy6ATHYFRZsT3IxWo7
	lXsKYdC101YQHL0rQncAQG99/9ht52NScczUz2yFiUwzEib/u48DH4mj3u54pd54raX8j3
	KcCPExvBwvwFUAsut4GWhcFlzghkLZW30t0GC857rjIROv3jfLTwt+FPwsg803PCBgOPRS
	iu2hWcUJFkAYvpRvIWdmjsELW3vymPsjkB2A3DOQOAomyPdlluoEt2lwCDnqDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=puzzle.ch; s=20211209;
	t=1794396901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6VRlRGj6K6JEINUEFGOSW7SlQDEDIC26Ju9SSAJCmBc=;
	b=XtGe/DMueqBeRt6Bji1TfT698ElMYOp0zPlN6FbBet63oEVjUW0b1SZgDoxFrOqm/hy3RH
	rCXR/81+Z4XH1aGTdp7xZtejDjWQxZ4xYFIGg2eYQTix24QOhFd3u+y3mFAcQwfYsslg8I
	daVRCv0Hv4gulYBoP2E0m0BZJYg4rw3y6l1yU+8jcqAdxOc5taQ9NgEh9KYu9JsVSVK8ym
	b07UnVNXOLenPEASInhraBMRXchMiptbXm4af1BqCybmn5H2evPLZ2nlSBE2n8hkXayYUQ
	pHSrVRwNh0J2yYS5oyG8wMCw/dWFfmzTLF2x5IHVaIxd2x/CFpCvEJnxFQPqDg==
From: Michael Grzeschik <grzeschik@puzzle.ch>
x-ms-reactions: disallow
Date: Wed, 11 Nov 2026 12:34:54 +0100
Subject: [PATCH 2/2] usbip: identify the event handler with current_work()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-usbip-v1-2-da5217ac71d7@puzzle.ch>
References: <20261111-usbip-v1-0-da5217ac71d7@puzzle.ch>
In-Reply-To: <20261111-usbip-v1-0-da5217ac71d7@puzzle.ch>
To: Valentina Manea <valentina.manea.m@gmail.com>, 
 Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Michael Grzeschik <grzeschik@puzzle.ch>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1641; i=grzeschik@puzzle.ch;
 h=from:subject:message-id; bh=wkKlVjQai+vEb7fVdaCCjzQfEn5vwaaPEVsaP9Nb4oU=;
 b=owEBbQKS/ZANAwAKAb9pWET5cfSrAcsmYgBq9FLkM4To6o+H8S+8hmDUaRZzmKxnMyyo5SrXM
 Wro1ndZ87iJAjMEAAEKAB0WIQQV2+2Fpbqd6fvv0Gi/aVhE+XH0qwUCavRS5AAKCRC/aVhE+XH0
 q3LrD/91Gnuf2xzHAsbGEFPl4liPoRmem+G5JGOa3JzIho3beZUuKFT7YYegMnWy/K8gN4VQjvQ
 p5pQsXOQIlUGK+Q01VDc94u01oScLFosp9W6k99lpO0WQDvImQl7SVwQbzd5oMp5UKXxsITD8jd
 aSwiEWrV8gOCQ0mN0zMJr68GegqhF2a8SvEcrMvicm7tpNsZSyhhFEg5/VOAQyIFi4mt5waxZhy
 TV8uB9IsRVs/gSEFrH7RUJwaQfxeoh3UwpX0yw7YGp2G+pN7LrYN9tIQ1b6G3ho524+mx7DCOLl
 Rsei0cluOJtvE8eCgY0XBcaCaHwsTuiF7qjf9j3yCVm0shxAp3sarozY6b3xAtD1ibhF0hxMFfH
 YJALS9AULU/BEo+orP4b0pQ9CKbTNsnch2X75T0Gq34jSZgxBF0gfg/ZoDG6I2ML7sY191REFIw
 DhJIdRTfotWX9Gb0I0/9fQMFM8D27jv6f5u9i8+QX2Pl6qVwl7xMEh9agcHjwmEgPyWnKS6mDZk
 fZr0p/ejYbU8/4CnjdNvSafu7PlsLpuwMRND3IN4+5QO68lZZM5Q6tJKknY2XZUF6nTLjkebu9n
 HJt1UakZv4RVhkG62OwtuwFs1dsqw/K7Riobr93Hxit+rDUv6SOqco3OlzU6lwnyoiC/hBO0ZX7
 FjbXeTtkf5x6LHA==
X-Developer-Key: i=grzeschik@puzzle.ch; a=openpgp;
 fpr=957BC452CE953D7EA60CF4FC0BE9E3157A1E2C64

usbip_in_eh() compares the task with worker_context, the first worker
that ever ran the event handler. Workers of the unbound usbip_event
workqueue are reaped when idle and new ones run the handler later, so the
check fails inside the event handler, and the remembered task_struct may
be reused by any other task, which then wrongly counts as the event
handler. stub_disconnect() relies on it to skip the shutdown of a device
reset from the event handler.

Ask the workqueue which work item the current task executes instead.

Signed-off-by: Michael Grzeschik <grzeschik@puzzle.ch>
---
 drivers/usb/usbip/usbip_event.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/usbip/usbip_event.c b/drivers/usb/usbip/usbip_event.c
index eea9a71f0eac..e00bc535a822 100644
--- a/drivers/usb/usbip/usbip_event.c
+++ b/drivers/usb/usbip/usbip_event.c
@@ -57,16 +57,11 @@ static struct usbip_device *get_event(void)
 	return ud;
 }
 
-static struct task_struct *worker_context;
 
 static void event_handler(struct work_struct *work)
 {
 	struct usbip_device *ud;
 
-	if (worker_context == NULL) {
-		worker_context = current;
-	}
-
 	while ((ud = get_event()) != NULL) {
 		usbip_dbg_eh("pending event %lx\n", ud->event);
 
@@ -194,9 +189,7 @@ EXPORT_SYMBOL_GPL(usbip_event_happened);
 
 int usbip_in_eh(struct task_struct *task)
 {
-	if (task == worker_context)
-		return 1;
-
-	return 0;
+	/* only the worker running usbip_work is the event handler */
+	return task == current && current_work() == &usbip_work;
 }
 EXPORT_SYMBOL_GPL(usbip_in_eh);

-- 
2.53.0

