Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793396075;
	b=qV6WutKIj2mXvddy4R4PTIDqCrUSWKIsL2nE0FbM6/s/19PWpR6grBU4SxnTbTU/tQpd
	 1pARFLH+bFo6vnc2WgLH6Ht1oAfIVBMJBbAqLdrTeBgx8rHgMUm9Bz3V9AYcBckpc5APu
	 mzGzMtk4ZLY/qykT+1UStqBkOQE3UT6DPpO0wHd6W02/m1USJntqSJ7B8Ju1mCFqiuICP
	 UacxKwyxF7viDb1rW8vxC11ub9BJb++X48kzfAsK5EyV1ujE2mMqpqvC1gAyXfst6TUUX
	 MRwTVXmjBLmEG+84BmCPgN5XWb+9W7tSBWbMRrmNocaVLwSkEdxRK/4obosSKJB5GlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793396075;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=pfyuaHVWliYihnuN7VxgyTXmn4J3zXZExhdUzMnnin4=;
	b=1P6HK5hL7DqdxeRlgrm+JteCBtadQVaC+ZbYn7mGCK9YmrDjY4kAMOHjhSXqLwU92rX4
	 0q9OxQj6oGX2G9PMeNR5YavkF0JsaD0Tw/pSr6NRp0S+vtmxv7DhioLbq0Owt7D/AFUsR
	 dTHDSzbCFqH77cE/DkzXulgHry/+SGD+bmW8Yhll2QdUdPg9xVnHRyYTeGKZubvuUNKFj
	 SW9e+IfDMdi59L4ivH1et/hL1Rov98B/2qJbryn5cmlm7BD0t2zU1aL0vkibA11OzT5fJ
	 DE4hfDuVHALT6SuB3JtMKgMDFksq6zs4D9oT13RvCeeNrJzF8aa5nL9dt3xuIH5wA7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Us1b9MPK;
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36798606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36798606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Us1b9MPK
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc7e0321ec1so1365182a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793396073; x=1794000873; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pfyuaHVWliYihnuN7VxgyTXmn4J3zXZExhdUzMnnin4=;
        b=Us1b9MPK2UkdFkcu8FM3bwwt0idTT53OhPJL2rsEaQj/4F/vgFNF26WjmBSFnyq4v4
         MpfN1SoSaQygsuMoDR5WtCIWphUmN86VvhGEQCkY+DFQiKoildphuWY85vKqM0Dh4yqG
         1DUTmVa2NxREgzm0rXCanf/YexfUlUokBAEyyzLnUmW1NWbgpdFhuRsSkOp98zAu9XT9
         KXj3Vy0l1Msk7esBJDjWmYWdx239d7IZYG7ds/Pt4hcfhwy91zZCvpryWM1X6kynDvjF
         jAiJ8j5AJTf17Sa7OntEuJ2E0VXmTzYTru6vIGA8l9h1q755yD+m7vbUtewBmXNo20LM
         Ay/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793396073; x=1794000873;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pfyuaHVWliYihnuN7VxgyTXmn4J3zXZExhdUzMnnin4=;
        b=tna7p90DkdP4x9UnapBUVMQ/apsrI6MBsI13Gu0if7ntCbwt9IevkbnKHkVJclmJAK
         IUajnQnblbpagQlTpL4OXEd67Z9nbOxlQClrfWcD3p1STh0RxggC8I6sdCJsjKPiJpvb
         oPBXwvLNttV0WByrVS6u6472MhLATXwRtkrPEbbyvtw1innsF+jUfSxHIGGd7+5OkQeh
         0Ph90o1XuQEwAM1bhgM8kPTGcFA/sED3RjNzcVkvkM+6qWZN0H89SGo/3/BMax7VxMuS
         KW69rTntaLs/R5F7oNpUbdpMNwGD8ObzHrDvl9nXdiFBjWomK6JUgZbsAY1HkQSAClgx
         oCXw==
X-Forwarded-Encrypted: i=1; AKwUvBxuKVjxb7u02q/iZfBD2sfeQTGPhwJcToTr0JFx5EgrUdlieKvfbYIHg9l0bc64nGDhda2aFrytECaDHq4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDQ32F//ZDH8ArLxIBpkT0bwKS+pd3y3qEzM1tnbyWa8f1WLge
	IYcOhvXqIh/Jj5b7sKeccIvK7fOTskVfr1qo9uWp9x7MUxvPO4qnAQ7u1tzpPjyOKZhGGYJYIPy
	xEWmHmKQcgw==
X-Received: from pfbfo7.prod.google.com ([2002:a05:6a00:6007:b0:89e:861c:6b1f])
 (user=nkapron job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:2583:b0:3e2:86b6:9be1
 with SMTP id adf61e73a8af0-3e928ac6de9mr3264932637.70.1793396073279; Fri, 30
 Oct 2026 14:34:33 -0700 (PDT)
Date: Fri, 30 Oct 2026 21:34:28 +0000
In-Reply-To: <20261020051446.92179-1-yuz08559@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020051446.92179-1-yuz08559@gmail.com>
X-Mailer: b4 0.17-dev
Message-ID: <179339606875.2659781.13239690891562364438.b4-review@b4>
Subject: Re: [PATCH] usb: gadget: f_hid: avoid copy_from_user() under get_report_spinlock
From: Neill Kapron <nkapron@google.com>
To: Yu Zhang <yuz08559@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

> f_hidg_get_report() copies the userspace report into a freshly allocated
> 'entry' before taking get_report_spinlock.  When the report id is already
> present in the list it then copies the same userspace buffer a second
> time into the existing entry, this time while holding get_report_spinlock
> (acquired with spin_lock_irqsave()):
> 
> 	spin_lock_irqsave(&hidg->get_report_spinlock, flags);
> 	ptr = f_hidg_search_for_report(hidg, report_id);
> 	if (ptr) {
> 		if (copy_from_user(&ptr->report_data, buffer,
> 				sizeof(struct usb_hidg_report))) {
> 
> copy_from_user() may fault and sleep, which is not allowed while holding
> a spinlock with interrupts disabled:
> 
> 	BUG: sleeping function called from invalid context at ./include/linux/uaccess.h:169
> 	in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 3481, name: hidg_getreport
> 	 __might_fault+0x4d/0x60
> 	 f_hidg_get_report+0x155/0x310
> 	 f_hidg_ioctl+0xbd/0xe0
> 	 __x64_sys_ioctl+0x120/0x170
> 	 do_syscall_64+0xf9/0x540
> 
> This is reached by issuing GADGET_HID_WRITE_GET_REPORT twice for the same
> report id (the first call inserts the entry, the second takes the update
> path).  On a non-debug kernel a userspace buffer crafted to fault (e.g.
> via userfaultfd) would sleep with the spinlock held and interrupts
> disabled.
> 
> The data has already been copied into 'entry' before the lock is taken,
> so reuse it instead of copying from userspace again under the lock.  This
> also drops a redundant second read of the user buffer.
> 
> Fixes: a139c98f760e ("USB: gadget: f_hid: Add GET_REPORT via userspace IOCTL")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yu Zhang <yuz08559@gmail.com>
> ---
>  drivers/usb/gadget/function/f_hid.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
> index 3c6b43d06a6d..520892bbfbef 100644
> --- a/drivers/usb/gadget/function/f_hid.c
> +++ b/drivers/usb/gadget/function/f_hid.c
> @@ -668,13 +668,7 @@ static int f_hidg_get_report(struct file *file, struct usb_hidg_report __user *b
>  
>  	if (ptr) {
>  		/* Report already exists in list - update it */
> -		if (copy_from_user(&ptr->report_data, buffer,
> -				sizeof(struct usb_hidg_report))) {
> -			spin_unlock_irqrestore(&hidg->get_report_spinlock, flags);
> -			ERROR(cdev, "copy_from_user error\n");
> -			kfree(entry);
> -			return -EINVAL;
> -		}
> +		ptr->report_data = entry->report_data;
>  		kfree(entry);
>  	} else {
>  		/* Report does not exist in list - add it */
LGTM, thanks!

Reviewed-by: Neill Kapron <nkapron@google.com>

-- 
Neill Kapron <nkapron@google.com>
