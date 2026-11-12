Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794469714;
	b=WKJB7quCuZS07hSZHsjoG243+LnoQpBXsqhFkkjZHuY6dTEn7bbwNyn3FKMrebsE1X5j
	 fiOr1pwxI3RklLaELki9xl3IxqM8Gemcy/ZkromGZGrgBCCa4T8wyvTNUF4tMghSURS+/
	 +GCx2Cw9JW3DOU+oWw04X7/+cIMjiQqNJHceltLIvm43mIIIPmh0ALuD5Nb9ecK+RaPYe
	 2i7271rHJN++T8OgSo7L1IFnfm6Ej7EIy7jH4+DN634nwYQnujmg5FQN4VSwjO/0slbLc
	 qQnvdRqU+HNc9A0jsnusiASG+IYx9fReFxNVaYucN41uyy4gJ21BzsyvvukTVaDjzlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794469714;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=QaPXcArbvE3oB3HQyuSz0RmjZUR+UUVtQyy4pHQGEe0=;
	b=cvhY7XdIwHy5OPIM+7y1SUnjUpeCJMHdim2+um3HBfGDFdcij8wtoS98HceH1quB3IwL
	 jmgRAro8xnJ01JDunhc0hc8cHQh8GHU6AZIY/hdUaiccGRL8F5gMo4nTe80tpyURm5Me/
	 sYcEcIJaolnfZgJLHC9BN8+J114PzQhYo0BR5GxZqzystL/E1f0J8KGEk+gLX0IjJi/9v
	 6xCzo8fezLwC2c7ls1ybpK/+7SVTzffFciXPw5rjllMs3fLTnUiGNKhDiSGnj7aUg1xcp
	 vda/wmNDpysO9s5rGNc+bs33EVvTwtVnyo+silX67/gIY8B52uNvAuN4MZI+DKnXKsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685E0606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:48:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 685E0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4c7f887ac6bso6435235b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:48:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794469713; x=1795074513;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QaPXcArbvE3oB3HQyuSz0RmjZUR+UUVtQyy4pHQGEe0=;
        b=cWl+4Bc1yVvVNLMdYCOJzsi9RkEiWnUCtAsVFJPqPT//Cz6cWLFOA6Nc6bT2LtSZo1
         3LJvzXlN3OJVWjm3mSj8zLC3yW0gGCkKqMcfLfdxqX2CaZeyk1HVjIG2+TfpHuPoeVCO
         RBeANj4dH/s9aI2+UkMwyD/FtlQBdU1o94A+Ctu8FjB4J/AVbkigOSSWk58IBc9yx30/
         pQnDVs9NGqYZbuJuSMCgUhSg978pcghSXCzudcais2pyYByb06XBZcJaIJSzbqrxfjFt
         wW6UHkBQd4xaVFv8J6zeYBCh0nlPniUyr/0AhTiu+TKRWA1xVTsjFPWJrabHVv0cEXRJ
         u6CA==
X-Forwarded-Encrypted: i=1; AL+hErFdxwTMG/mILzaM5W8IAL5JuegMYuUnQIMGWLfvrbL5Bz9i4Zj2kQGl+9pyXOT9sJEysoZLs+OMfG01Hic=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Tso6ELmcUfSHLEDTuPXOFhRgUllL+0zh6vRGVUqyBJuuQnpDw
	LD4d3QKpo1K664bJR0vTRdlMTjKHY687tQtsETgsZ2rAge0NDJF9Y1i38fcroSqSNWaIiX1vV/M
	wR2g1lhFh1m3MH4VBQndx9M5gZhmS1wQwK5B+y1xxGNecn0PBcdiWynKSbT0=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:bc1:b0:4f3:e98f:fa0b with SMTP id
 5614622812f47-56b93551bb1mr4975017b6e.5.1794469713499; Wed, 11 Nov 2026
 23:48:33 -0800 (PST)
Date: Wed, 11 Nov 2026 23:48:33 -0800
In-Reply-To: <20261112074822.317701-1-timo.joannin@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af56f51.6d8d289a.8382.0006.GAE@google.com>
Subject: Re: [PATCH] nbd: test cpu_hotplug_lock deadlock fix
From: syzbot <syzbot+72fceb8393e04ce876d9@syzkaller.appspotmail.com>
To: timo.joannin@gmail.com
Cc: timo.joannin@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

Patch testing via #syz test is temporarily disabled.
See https://github.com/google/syzkaller/issues/8122 for details.

> ---
>  drivers/block/nbd.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 5112e3a03027..ebd4b5a7969a 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -1357,6 +1357,8 @@ static int nbd_genl_reconnect_sock_cb(struct nbd_device *nbd, unsigned long arg)
>  	if (!sock)
>  		return err;
>  
> +	nbd_reclassify_socket(sock);
> +
>  	args = kzalloc_obj(*args);
>  	if (!args) {
>  		sockfd_put(sock);
> -- 
> 2.56.0
>
