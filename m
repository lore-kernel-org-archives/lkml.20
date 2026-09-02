Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F16257855
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 06:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788330301; cv=none; b=Yn2ReRu528jMEg5iRZOsKpfN8GmlKJ/0ATFS9XhU/SrKTpZEUr0AzWC3M9bni/cmyMeTTgFzOQ3N+i7/e2vmY3jPWCKpJZkgDC+H/cHAohlnMJjTx/8GH/lsD0/KaEuSxnwYrxJt178ngIaRtGv3x0CrxusUJDt/f47ju/i84Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788330301; c=relaxed/simple;
	bh=+9WVtePxyc1YGLLA0sPGLdbtBaT6Ojt4x5bVpPLtDXo=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=sTeAL/Puaprze7JzVRzYzX0Rp3bjfoTtua4fdKDBlccbMQcUGhH0uMBOZ17kltG+CDytNoPywBgusxCxLIldGu8ZVk2jLC2/j6gYyVZLWqk9O0SQRzGh7gzac969ORiMGMvCHy7D3Ki1KlZMAuL72oDhO29ubz5Q/lqMwdsb6HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oyfboyT5; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oyfboyT5"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so7052095e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 23:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788330298; x=1788935098; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tWJyN3i/V1hy+bh8hawCPCJ0S6kVzHf5TYVU3e2rRUc=;
        b=oyfboyT5oo4wv5ZVuJFhklRgfLC15EmSsQJAw/BEr73kVQLgfzNqlOSKo3vYFxWN21
         d94w7LDMgDu8lqRIqcMSLyLkE5Q7jyuoqupsns+8uf4Y+WTdkcgI14xi4ivxgA5VneM7
         QKWO0Ah+FLfeyIwAsgE5fGFOf8HVy28su9G/0IxCoFqERO8P2toZa/T9EcnyJj8rUWpL
         wvCmA4UGtxWgrpvR6JDgHBDGxk4t6EoY9oW6WHgVQ2p5DsWFy8CMwj+PR6ZDVZot2ToD
         1s2o85jzOhAZYoZjlJu+V66uUh/SNv7mxEG9IZnrEcge4cAOeCHcaTjYUHS2YbFNS15W
         OYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788330298; x=1788935098;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tWJyN3i/V1hy+bh8hawCPCJ0S6kVzHf5TYVU3e2rRUc=;
        b=cm+SHTMGJ081W92UlhncXEzALczhnoqc5TfB8wJ9bLUDU3alQjlZtOdikPhpM1APvu
         O2Vu1oxnDYUJUvcewarm+wci/C5V+INeWhFvAwNrkqPTsngnwy0mD3qsB2DXZCSJBimf
         9cj4WQ/E9rMCpSsj2U5kCL2xLu3+JRnGLrClTlZ7532dgCV0jZgSCXcYfGKigtFWrbLN
         0s1mXwdXBAOqrVsI9AW0H+r/BLHtqYk2kDeUV1zKJGSdoPzZ99KhxOns508slYm5erx/
         /5s9EHNstdiexDWJZVBwKNdzv7LnYsmuAHv9l/JTNDUZQQG9sps3aU45J4iQCfnx1xaW
         go+g==
X-Forwarded-Encrypted: i=1; AHgh+Rok2AHAFVrx5dtSDeic/L1Vgr2pM809lTxU6z0wY/lfYeemKMNfmCDyIA8tph1uzRxHGbc6DcZGAdSUCpA=@vger.kernel.org
X-Gm-Message-State: AFuF++lUydcLT1w/Ax0tVY7mN0M0SpJASr7UMH2/UWKnOLhHWkkpedyU
	A6E0agnNCm2fo7itxjOt0OIUL2v3tdNQUIMXsFrnqIRbegs2qcRpmHYy
X-Gm-Gg: AR+sD12rtJaZMDgcZXhN+RvOmrM2MSzbJ5mHwlIB3vbUH+/lbs85vEkl1XaZZAembLE
	r+srWP78DXvX8+EW76kHU9Co+UmVpayLhQvwoBwCZg2u1m0I6xhRJGzxmkOM0Pp6iHySYgqc3nH
	NHIfo/VlxRoczyWjkXdVagHJ5GfLFFrdCn1N+cQ11JZ1qA5mkUZlP4v0mnQuB7O/rMLOpNYLgf0
	H7nZvVH78ShdtAe98Gu5WnaDnvUNxoozM+Qp3ezrZUVUjYaT/fgGgWfRNRiKuKayTJhqxoXqEv4
	qN/UXsDSQbNFya5mHPQwjT71psr/ig3DVrpasvAU3UISBAM4OYrCghLOjFiIHBR8m2hVayD/CrJ
	ftUigtpewxMPt2TxbnU70OWZ431P3d/NNW2YWG3h+BL08s/rq7bfzFaWSsda7DodKkkfIJz21ON
	ZZP7nXLCLwRlNY4SsW/EWHgNCGKIWLuMpRezV21NK5kycYNXS37VEOk4B0pewQ9ds3A+h5S16fv
	3PHWepMrokdfvkNDZ529OLJ06D0g5zd7A==
X-Received: by 2002:a05:600c:4ed0:b0:499:726a:a017 with SMTP id 5b1f17b1804b1-49ce57ec163mr42888105e9.1.1788330298294;
        Tue, 01 Sep 2026 23:24:58 -0700 (PDT)
Received: from valmpani.valmpani ([2a02:587:f24:b00:967a:9200:4108:5b68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce47820e2sm44777905e9.13.2026.09.01.23.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 23:24:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] usb: gadget: pch_udc: don't call pch_udc_remove() from
 the probe error path
From: Vasileios Almpanis <vasilisalmpanis@gmail.com>
To: Vasileios Almpanis <vasilisalmpanis@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Felipe Balbi <balbi@ti.com>, Mike Frysinger <vapier@gentoo.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Greg Kroah-Hartman <gregkh@suse.de>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 syzbot+3e2e533aa1b2a75525e7@syzkaller.appspotmail.com
In-Reply-To: <20260811-pch-v1-1-f79801c1cd91@gmail.com>
References: <20260811-pch-v1-1-f79801c1cd91@gmail.com>
Date: Wed, 02 Sep 2026 08:24:52 +0200
Message-Id: <178833029261.756768.6158388330855906762.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788330294; l=1074;
 i=vasilisalmpanis@gmail.com; s=20260731; h=from:subject:message-id;
 bh=+9WVtePxyc1YGLLA0sPGLdbtBaT6Ojt4x5bVpPLtDXo=;
 b=QMuDtdCXLmQa4xf202Kki0S9AqujJXwQ93dllJw6Q6bu+WYGtU1msskCdtIwpfhdQsMShJ6N5
 qivCyMinjqlBxJoy0ChnEI3tHkMywjUn3DMNimjy5Ljak2sDvkUWaV3
X-Developer-Key: i=vasilisalmpanis@gmail.com; a=ed25519;
 pk=gn5Uo6yL8Tlpq5uATxA3nqoq+U8eWLRbjD+bOk0qSpU=

> Probe error paths go to finished label which calls phc_udc_remove. It in
> turn starts with an unconditional usb_del_gadget_udc(). If probe fails
> before the gadget is added then we put a non-initialized kobject
> (gadget.dev) and a WARN is triggered in kobject_put().
> 
>   WARNING: lib/kobject.c:734 at kobject_put+0x252/0x640 lib/kobject.c:734
>   Call Trace:
>    put_device+0x1f/0x30 drivers/base/core.c:3880
>    pch_udc_remove+0x47/0x510 drivers/usb/gadget/udc/pch_udc.c:2986
>    pch_udc_probe+0xcc6/0x1130 drivers/usb/gadget/udc/pch_udc.c:3109
> 
> If usb_add_gadget_udc() in turn fails, it has already dropped the gadget
> reference, so the extra usb_del_gadget_udc() is a double put.
> 
> Split the hardware/DMA teardown out into pch_udc_cleanup() and call
> only that from the probe error path.
> 
Hi everyone!

A gentle ping on this patch. It's already tested by syzbot so it
should be good to go. Please let me know if there is something
I could do differently.

Kind regards,

-- 
Vasileios Almpanis <vasilisalmpanis@gmail.com>
