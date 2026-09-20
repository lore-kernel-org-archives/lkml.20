Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E221D3D8903
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 06:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789885774; cv=none; b=G3BUGokcB91plxj0IgUZ/X6Z3ZyyNYMAmHe0Mf8uKFYcI7MZ1PXCW2KqQnS/V5rnFLVYNeoZ7Gs17X5teV9jErkeIhF0Y6bSOdbn33CTMI1mPrxIbC29NRdHg+MoH81XQs6ev8YMCF3uCgjjaainRvIDMg1kUmKeAiXr3u9gJqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789885774; c=relaxed/simple;
	bh=4hr10EZqiVj8sdY4fkfjMxrsxAscLbbiMoyFWclCXSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PeddICD27fAzRlwxqYtAulDWYtC4Uol8E1LVp11YxPV5Q77xrsr6+JffqSq+hk9gpNcomZOMKCj/BijG5drgEXm0R3OCYDVpkcxbzBAf8aeaoj7kxaHha09dckxYfTVE2RY33hKzMtSJ8rQoidY5IBrvwprZ/XZILxxFFeWkzec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eixCU0Wv; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eixCU0Wv"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469b355ffso1207133b3a.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 23:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789885772; x=1790490572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QHNmLChQ03Jylrey1s6uB1+cZpgIToxddQ5DX4SEzpM=;
        b=eixCU0Wvt6Wm9PyxkutVBVwZF5/Px7IA8ObVHnPXSBPdybyWywUk93+qFLCqNOSNzq
         N1rhgFtyIrUhvZZsrwQpAg5OPyf8LtQ+2F8t+Hzl6kAeXOgakohAWmAYpAZL/fBNkchE
         dETe7W2R9a/BADXASYQ6Sk76UM/Q2jGEg6iUWtw766D2SKkG2ewRnQeupfC6Gvn0zTtF
         OOAkPVWDwqfnOy8A3rX4aoB70uW8R6tY0Mc16WqMWXJ/QVYVKUOl+8sJg0WYmrx//82i
         8Jef0M8dMNCPLS4bTd8zm7buZYW320//IF28zXJDWE8gpVn+Cmx6EVqYqR8RXnLEA+G5
         +DcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789885772; x=1790490572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QHNmLChQ03Jylrey1s6uB1+cZpgIToxddQ5DX4SEzpM=;
        b=FBVaOKQyiny7axKTpyhdUeY6R43nhLDeY2s3Jc3x1KzFaALSj5PRS7IGUYVB+0aJCZ
         H0haVy7eyo4LUui1PECpk8gCw7nDb8UOcZtpXspycoUs6jEgj6VVbU9aSF5Si30OokvD
         +wSX6AiNAy9zSxXhhd9DoyuEponpmRm0vd3GRHooWUMzCsfzvdG80z/tRzXA8PQUsVIv
         BGqvMQ/vMsYWEn5nBc/w9rXzH0Qr+vvcRy1rDyuggckipgP7qyJeTuiKjDJheY31QT/2
         RuACwshft5ANsCNl2MDuz6jlsi+11PGO09SZ+qnq3hNsK1DVUdLTVBGlfBzGwtFqWiBF
         3Z0Q==
X-Forwarded-Encrypted: i=1; AKwUvByiiFq1uGnxOI6PfpdGvqAXjyufmXqf234yVa56rhJybh29rh7noff3WlsyDOnAgUkVroCdSNHHFDaS67A=@vger.kernel.org
X-Gm-Message-State: AFuF++maSjNq9/0yyD3DSqq/TEQ/PgWco9NvLUX56w7qAe7XP+/dckkd
	oY/NoalQx7fDXGg9+ymjNBhJ+2nRc/RTIkes9xqMYycK02NxYJJrpERI
X-Gm-Gg: AYBFou2F3xQMbsnFAFsCIAcSb/4Z1bFu10ANJVf0zzEzgtB14vJt0flasfOEH3nKfyf
	lRlGyLG9d+K+CXWmazORMO3Imzo++iBdng5MnNJh98DVx7xBbwFXh1LRIJ5Phk2FSBSrRHwysmJ
	FRVc8udwvtEgLO1X29l6MT+5xiw07HxUNcdcn6DMyCLt7HgU8Dkv0wwDnuO296zpGfX+gm1lb9i
	Oy5Tli/4WYAuzJ21G3nCD7+ztSBop+cY0UbbbKD7vCYh+Vvh0WXHZYkJ89abc9aP0f3R6jxfYIX
	Zl0uhvZfxa6EOuOKQZkoymJLRTjFkXQRlw+BJxIoxa6+vf+BDN8KhpozBOnvssWWl40VeSR6+o3
	CaF/+G9aJFcVV2OGyG+jdjm+Po8z2bnJyJ7ahydSZC/4NhK56fi819bPfPbHWjzgtXCQ3/fgXOY
	vagE4SUML7CJw2KRoRX2ClzuxQgzogcTkEtBkdSFNmIsa+mefKV+2f8a+AdsPzXlHX
X-Received: by 2002:a05:6a00:3697:b0:878:34d7:699f with SMTP id d2e1a72fcca58-87834d76ea1mr3232891b3a.47.1789885772036;
        Sat, 19 Sep 2026 23:29:32 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::c570])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a95f2abesm1642361b3a.26.2026.09.19.23.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 23:29:31 -0700 (PDT)
From: ivy lopez <skunkolee@gmail.com>
To: gregkh@linuxfoundation.org
Cc: khtsai@google.com,
	kees@kernel.org,
	sigmaepsilon92@gmail.com,
	peter@korsgaard.com,
	jkeeping@inmusicbrands.com,
	lgs201920130244@gmail.com,
	marco.crivellari@suse.com,
	christophe.jaillet@wanadoo.fr,
	ethantidmore06@gmail.com,
	peter.chen@kernel.org,
	mlbnkm1@gmail.com,
	raoxu@uniontech.com,
	jiashengjiangcool@gmail.com,
	zzzccc427@gmail.com,
	yun.zhou@windriver.com,
	shuangpeng.kernel@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: fix f_printer ep0 overflow/list race and f_hid/f_tcm/f_eem bounds
Date: Sun, 20 Sep 2026 00:29:28 -0600
Message-ID: <20260920062928.42260-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260919223521.3890508-1-benquike@gmail.com>
References: <20260919223521.3890508-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Sep 19, 2026 at 10:35 PM UTC, Hui Peng wrote:
> Fix multiple memory corruption bugs in USB gadget function drivers:
>
> 1. In printer_func_setup() and printer_reset_interface()
>    (drivers/usb/gadget/function/f_printer.c), bound GET_DEVICE_ID copies
>    to USB_COMP_EP0_BUFSIZ (1024 bytes) under lock, and dequeue from
>    dev->rx_reqs_active instead of dev->rx_buffers in
>    printer_reset_interface().
> 2. In drivers/usb/gadget/function/f_hid.c, f_tcm.c, and f_eem.c,
>    validate setup wLength, command lengths, and skb bounds.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Assisted-by: LLM
> Signed-off-by: Hui Peng <benquike@gmail.com>

This touches four unrelated drivers (f_printer, f_hid, f_tcm, f_eem) 
under one Fixes tag, and 1da177e4c3f4 isn't a real Fixes tag for any
of it, it's what you get when nobody runs git blame per hunk.
Please split this into one patch per driver, each with its own
actual introducing commit.

> -		while (likely(!(list_empty(&dev->rx_reqs_active)))) {
> -			req = container_of(dev->rx_buffers.next, struct usb_request,
> +			req = container_of(dev->rx_reqs_active.next, struct usb_request,

This is genuinely bad. After the loop above it drains rx_buffers,
rx_buffers.next points back to rx_buffers itself, so this second loop
computes a fake usb_request via container_of on a list_head embedded
in printer_dev, then writes through it via list_del_init/list_add.
It also never drains rx_reqs_active since it's dequeuing from the
wrong list, so this spins corrupting memory each iteration.

git blame puts the actual introducing commit at b185f01a9ab7a ("usb: gadget:
Restructure printer gadget", 2015-03-03), not 1da177e4c3f4. Please
use that as the Fixes tag when you split this out.

> -			value = strlen(*dev->pnp_string);
> -			buf[0] = (value >> 8) & 0xFF;
> -			buf[1] = value & 0xFF;
> +			value = min_t(size_t, strlen(*dev->pnp_string),
> +				      USB_COMP_EP0_BUFSIZ - 2);
> +			buf[0] = ((value + 2) >> 8) & 0xFF;
> +			buf[1] = (value + 2) & 0xFF;

Nothing bounds strlen(*dev->pnp_string) against buf's
capacity before the memcpy below it, and pnp_string is configfs
settable with no length cap in f_printer_opts_pnp_string_store either,
so this is a genuine overflow path.

Separately from the overflow, the length prefix per IEEE 1284.3 is supposed to
include the two length bytes themselves, which the original strlen()
value doesn't. Probably worth its own patch too.

Separately, in f_hid.c:

> +	if (!hidg->func.config || !hidg->func.config->cdev)
> +		return -ENODEV;
>
>  	if (hidg->use_out_ep)
>  		return f_hidg_intout_read(file, buffer, count, ptr);

This hunk (and the matching ones in f_hidg_write() and
f_hidg_get_report()) doesn't close the race it's aimed at.
hidg_unbind() does:

> +	usb_free_all_descriptors(f);
> +	hidg->func.config = NULL;

with no lock shared with the checks above, so this is an
unsynchronized check followed by an unsynchronized use, racing an
unsynchronized write. It shrinks the window, it doesn't close it. If
this is worth fixing, it needs whatever synchronization already
coordinates unbind against the fops paths elsewhere in the driver, not
a bare pointer check with no lock behind it.

And:

> 	if (ptr) {
> 		/* Report already exists in list - update it */
> -		if (copy_from_user(&ptr->report_data, buffer,
> -				sizeof(struct usb_hidg_report))) {
> -			spin_unlock_irqrestore(&hidg->get_report_spinlock, flags);
> -			ERROR(cdev, "copy_from_user error\n");
> -			kfree(entry);
> -			return -EINVAL;
> -		}
> +		ptr->report_data = entry->report_data;

This one looks good to me and worth keeping. The existing code does
two copy_from_user() calls against the same user buffer for no reason
(once into entry->report_data unconditionally at the top of the
function, again into ptr->report_data if an entry already existed),
and this removes the redundant, racy second read. That one's real,
keep it.

Also please skip the func.config hunk unless you're going to actually
synchronize it against unbind.

ivy
