Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794689085;
	b=R7CGVqejeci23+UHxUDMoCmbkwM/VINfaiGf1tfWeBYomI1BRzEq0l9tUp2CqcPH0dZc
	 ZKTuDeQ25iQ3MI3qvSiAtYM8Ruq6B09WiHwiqMwKwGsh2mf5WE1JSGmq/F9GtZgf/yQv2
	 YB8b3MU82wo0sPy6etjZ03HRdZk/vNlyJVq7fchGh1gCYRKk79/jzhytfQS+U26gbuaKD
	 nRgKMT6UrBePjHPajkQdEWad23ZmEKjjoygcMjoX4StnhKQMg5ifIqvHM7uW0+2kie1xy
	 XXhWW6rytQdBbGGCX5m2XME2xAPGhJl0wOmVF+Jgk6H8NI4B2sdVSQj+V5GkQC7fGrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794689085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=RF5riISKB3U2P5GXHOTUJqXWoYoCQ7YYxFY6WjpFX3Y=;
	b=r/0Jn9SiJegMaQjOByEpNFkGvLAgff/xUovxMdlxhl8cVf5C721o2IxKLa+B9EFyJAmi
	 s9qfDTs3pe8iqc3dOKl+gzHofJ/uOAgwqKhEYzV49q1rPSa6TEpp7DdJOSAkCFWwbRCYF
	 FCctHpTqiagmjGdnDAuzoZwEmv+ERKTTRXtrh0hyXig4+fQYNszpJeRbpyJMX7c+8XxE0
	 fFsfDSrHjs3KkT67TZLlfcCkiiehjwoRkJ+sTvJi5OJk6rm1iDB2hZ7h2DQh4Qhr7QOrv
	 I0Sv1rk/3ww7OJxWQT3eqty0J1cel7/axfiwlLdTojBHT1freUpD3iVZxLj0ppxiifw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=MrBgLup5;
	arc=none smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307AC606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 20:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 307AC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=MrBgLup5
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-536717a4d83so26831351cf.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794689084; x=1795293884; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RF5riISKB3U2P5GXHOTUJqXWoYoCQ7YYxFY6WjpFX3Y=;
        b=MrBgLup5MVsN3BKP8C0z+OVZ4AjO2TH2ZPH5xlez9jhjeZpX9UXub5mCMkTrMdPx/y
         +DRYo1Dw1+zgxDcEgZB/ed7ojmwqhTqme4fs8WqqcNLyvdzHNMBJGjBggWsvayK2Hzdk
         JupTLHLdZpbk6q2De53Yrf4PzrPyctXPSO2Dbz+UOOtQgxYH6rlqVz0LRcUIxeNGhmTG
         v+5PporayHbaGRcABpguFhQzVdsM82CfVG0oJbCf4SqC1avy1620oqVuRWTLgiaOQok2
         wZPXhG7BNeLaTzlt+QwWVmZqITI2O5GtzrvGZt7xspQKt6cipCRmmtK1bzE005KJoEbl
         dJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794689084; x=1795293884;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RF5riISKB3U2P5GXHOTUJqXWoYoCQ7YYxFY6WjpFX3Y=;
        b=w3ztCFpH5B81L6ags+KmTOiC5oUf7H5NWKstXYwovcwt1NSYZM2riczuEvWsTaD19r
         z+Bb1otFCQj6Ch8YXNdehloMsjCqvS3Z9VvFJ+Ala4lHnKbvGrg6e4YB1BzNP/mnfTis
         o6Fa765iX41QhZxoyet4P4Pyg1YuTHvKOYyzXa70MCWbdFRohSKVx+zQBAXjL7N+3Cpr
         wxucehQQu9aAZkdgBJtWwV7QQPfC87vp36HYrYxYaIgG3UYJj/PluQDlZWx6ALx7qYrk
         Z+Ul+Gldi+EiAMCMM3KlTtJ80EWNXMimPyBfIK3rap+od2gxOdsud8XBNZRd5ST7MsjT
         DmRA==
X-Forwarded-Encrypted: i=1; AL+hErGXm7SInmmVC9MtfLr4IppuBOocQfiV0a2jiynmUuvHkBkIj7QSxbcg2uZiXGrrZjddkq9FN5z2z6MHND0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/g+pSnJLD+fpBZHIhcNQPSVInlT0meeWPiG5UGZBB7FUBeTxjt
	kpDEeGonlJe60QYOPXgrgunS1WrqdUvEQjMrcEvsyb3IXL6sjRQKwghkYS4EnvKq4g==
X-Gm-Gg: AYBFou0dY3QihfZiPVtUeH65GCISR7kYgv/Q7c3Zqu/Eh7FjocsNtA83ghtvD4tgiA0
	hbWehhfKPlFLg7gWiYoXj5Y3CDnBUWibgl8MTyKoDg7sDDdovbIjNR4ykL1l+NlHq0zi3umqmKn
	gt5VrGhRP76giP4MCqjJ/revCm4pY0qgYqQ3wNWtRSyA1fKw9vS2OKOuec7ddDxn2ABlDIkyvOv
	YW3P4ElXGN6QzkrmTrWonDQvcj3ezv4zhRNRZswJe4cBU0mt5LumWVmhed1rkAnMKY63ZcpHCRY
	FeisMOuyXqQMiy82gYwbBQ1ZpXX+QUP6/EaHE37BeZ3QZy941/wSaotnUmQkmPNBiQU8Jx60mHN
	F4C/wqXYwotawCMYbL7x8dsUpwJHjUz3argnY/jZ/KqcmsgyX5bqsTNEzA6rxIppAua7thGnIJR
	l7sOWnbNMjy0wgp/BYnIRjXRZLVxW6cGZk0swWhxpuATgn1c7JNjU/LHFvVRB/6dAMe/1x/lnxr
	0dll8HX9Mla1gKT61y4Q1E9Z9TITyLrPpRtLWbcbLAKRt4CGxUgapp/SVlPvh3yoC1AvwBq5vAA
	c9A51FMZv1DBW9CyuuabGzd8CT+P5g==
X-Received: by 2002:a05:622a:250a:b0:535:70b5:806 with SMTP id d75a77b69052e-55ac977d7b3mr99745041cf.62.1794689084098;
        Sat, 14 Nov 2026 12:44:44 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::d398])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad0534196sm47228031cf.9.2026.11.14.12.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 12:44:43 -0800 (PST)
Date: Sat, 14 Nov 2026 15:44:40 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Hongyu Xie <xiehongyu1@kylinos.cn>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	usb-storage@lists.one-eyed-alien.net,
	syzbot+30552b4cbe99d6d91306@syzkaller.appspotmail.com,
	Liu Qi <liuqi@longcheer.com>, stable@vger.kernel.org
Subject: Re: [usb-storage] [PATCH v5 0/2] usb-storage: bound the ene_ub6250
 probe-time card-type query
Message-ID: <9b81c4c1-998a-4dd9-a998-1605f4781dd8@rowland.harvard.edu>
References: <b07b5f5b-4722-4f1c-84b9-205ba9b8943f@rowland.harvard.edu>
 <20261113073638.1225998-1-xiehongyu1@kylinos.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113073638.1225998-1-xiehongyu1@kylinos.cn>

On Fri, Nov 13, 2026 at 03:36:36PM +0800, Hongyu Xie wrote:
> This is v5 of the fix for the ene_ub6250 card-type probe hang.  Changes
> since v4, following Alan's review:
> 
>  - Split the series: the transport helper comes first, the driver change
>    second.
>  - Drop the shared 10-second budget.  Each transfer now gets the full
>    timeout; a timeout at any stage fails the query immediately and the
>    query is bounded to about 50 seconds at most (five transfers),
>    without the remaining-time bookkeeping.
>  - Shorten the comment above ENE_PROBE_TIMEOUT, as the reasoning is in
>    ene_ub6250_init().
>  - Drop the unused initializer of the bulk pipe variable.
> 
> The transport helper is recorded as a stable prerequisite, so the
> dependency is available when the fix is backported.
> 
> The forward declaration of ene_ub6250_init() is still needed: the
> unusual-device table is generated by including unusual_ene_ub6250.h
> before the function definition and takes its address, so removing the
> declaration breaks the build ("'ene_ub6250_init' undeclared here").
> realtek_cr.c uses the same declaration for init_realtek_cr().
> 
> Testing: with the syzbot C reproducer, the unpatched kernel blocks in
> the probe for more than 143 seconds and the shutdown hangs; with the fix
> the probe fails after about 10 seconds with -EIO, before the SCSI host
> and the scan work exist, and the system shuts down cleanly.
> 
> Hongyu Xie (2):
>   usb-storage: add usb_stor_bulk_transfer_buf_timeout()
>   usb-storage: ene_ub6250: don't let the card-type probe hang forever
> 
>  drivers/usb/storage/ene_ub6250.c         | 110 +++++++++++++++--------
>  drivers/usb/storage/transport.c          |  31 +++++--
>  drivers/usb/storage/transport.h          |   5 ++
>  drivers/usb/storage/unusual_ene_ub6250.h |   2 +-
>  4 files changed, 102 insertions(+), 46 deletions(-)
> 
> -- 

For both patches:

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
