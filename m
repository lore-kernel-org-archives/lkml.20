Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E756D3D410C
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887235; cv=pass; b=UWNOejF9Wnt7y4l/Z0jc/LvbK72phC4zX1HFyYJ9KYnYPTA3yuJNUUc/yu/0iL2GyCNC0Sp2WfRvkT+/feA+stICPy/MQEMi8cZiAGeLyc51D0/GuZekf0e0nFjUTkssfS4JssEhjKKjOThRQ+cRG6807Seuld7StpoI1qcKQSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887235; c=relaxed/simple;
	bh=EvYg/nZFolqpHH6bGHm5NPD/0IrXIoVtlIW4jSDafKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DbzKj3qrPcq21+2Uszij3MXJVKjlXQ+qpj0Cyu8a83wT1L23baOMmusk1XtxUMU9LofWFOcuNMKQOYuwjwwD5KS6Zq1/WLCj6YX19xfSo6a3xFvmLpbSXkMyAd8MCQ9dgsszFTXe6CXXupH75lul7Sp1G/prP7lD3R40FIouaOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SfIxWMiJ; arc=pass smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SfIxWMiJ"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6df93f00f4dso1169310eaf.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:27:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791887233; cv=none;
        d=google.com; s=arc-20260327;
        b=jZVyZl/n50G/JODQsK3PEDRZz2+rhzurFVzFK5/3O2EpeEFwMwT5/0Tj7iqsH7LTrG
         b5et+XkgbLwk6XzW4qEPcav2JgVc2ZHQxHXQvy1hSnpAcDTIsu9QrjLroXzBfqBavC1Y
         YIVu//L9qPksEIwm92Nr+WN8WOtoDpOxHcO2g9IehtlKfU24OSJteAabjgCatFF8LvdU
         WCs+KJbVjJ21YnnaLokq9u2mmrYpgMhNSlvvhbHIwI80133vZcpcQ8FGIoLk8tWlnpFY
         TTMImwbVkQf0jK7M49xEtN6jzOBLzsI9B075y+YFXnPAvPf4A0KsHP8lID870isw0I3V
         7IWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EvYg/nZFolqpHH6bGHm5NPD/0IrXIoVtlIW4jSDafKQ=;
        fh=dGAuVIyX2+BqpdsW5kaZl6iSXIdHVaL0UWOkfjc1h4U=;
        b=Vx64to3QM+iUbcxUnbPtHpIjnx4w8ZvNApL3H57HUknOS8sxsUFfaIjsHGhuzAvSca
         lGdrOo/C5qITGCLFS+5rGPl35PGQ5qe57Jx6MQUbVE5etfNEYIdNaLdIz+rWjJIjZknr
         VJDr2XA9TC8Sg23EC3DzYYF3mYd69AdOrsMxoj/UQpxhYrgp2iYPQtHOJgbfREGwb+/P
         KqQaGPdO0uQK9z29LnSuz2xx630TFuk87d10BK7ZqYP6+vkGwnJvD5G5Ri1qrna/xCIl
         uW/VO2CifxKc/S04Hc+z8ChSm/oVYPprh69QIduiSUUSvouGTg7slojFSDAEK8/CP2ae
         lkAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791887233; x=1792492033; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EvYg/nZFolqpHH6bGHm5NPD/0IrXIoVtlIW4jSDafKQ=;
        b=SfIxWMiJkqp6kmt48++eyAfDJaR9KlsXFMETo/S8Bsf2Ds/L3W/HTgT/kiAy245Hrm
         Md/pEww+uTrpeCm1Bnm3b08NwMILnVUQr0WO6ZQSXv9b9BJsmL/V3+2iRnV/4Zd0s4gT
         0nSfvvqsoY3Nb2TYBJ0Y8hJfB1w9KfgDNYN+nKGokqVG7cFluCYDrtsliIB1sS6Eo+dg
         jfch+Rcgah4YwfQ1aufIrdBANrw5bQIaMJr4w2VKlOsviHtIsjicIpmdR2fLTTxF2Olc
         zCQiW7Mz0fDgcVqTD1ChhKgKwwQbfWO/bPHrK+4Gjh0TI2J4kVGY8rODwXbKJ37KcLoD
         scRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887233; x=1792492033;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EvYg/nZFolqpHH6bGHm5NPD/0IrXIoVtlIW4jSDafKQ=;
        b=Ntl4blX+JLJfVZVPlQtZ64w3f/b9QZQ/e4sj5f/lBYMR0WnTCUFp6Zyx6ArBktVWPN
         PL+8xQd+7DAAfr/H4dRM+/1Cl65zgG53MBKgAjCtLXXUFJPAiubSlqBoycO9GxZ6kC3y
         4QqTus+1Ee+mdBX61aKRleJQ4k5uA0rWyYjaRtMC02/X8lQ4Ijj61d0rY3pPVdLu56Lu
         n4TKtMNqtDoZIEdMcKafnsG58B6HW+Cixz84lQvPZvzJsMCjUF3uwXsMIALh95njmLK1
         wKcZkpsFEUhV3HsWImoUDq6bV24X493nPPs+ECBu+RXVBx+VIUev7Y2vmrh9rjvtHaGh
         EVaw==
X-Forwarded-Encrypted: i=1; AKwUvBzHElNdjMnk/cDD62iknxiJPOFr1O2ST0Y0hrI93pCNRjg4i28mzyCpzRr6Rb+SpNOjvGGTPgkin1DphGo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJT5uMHEf2JCmwY3mkGfwK80k77O8ZDJbKmzrsfQ1EjOI4Qb8eL
	h/ZmYIrVjlrp6sEmDvnRd0dKLv1MfMseT3XmjsrGDu7XiyZlj5V/B+T3d2FJCOfYOV8Z5N3LYma
	fioE5RcdnFLUdU6TxOElYYZc8dEpQu7Q=
X-Gm-Gg: AYBFou1DDzNCsv9ZvtFGuowb3/P1qThs3Ory5vqP4x2PRG105XTMVQqTdec1AGz0GeR
	FKDJL1C3ENQFsPwPpKm5/HD1+fHhkkNUcp+OCW17HTBbC7DF0IN8hBFGVpC1kbzOwH9iXKyt6Dy
	wUB6hTspduYMdgBVK6bGobKvO++Nu8xid2iG4+f9pVslVENPyagRlFflXlp4fP0drfcKsHX9CpH
	GPrhGlRU7RyfGKknx7ldsGRFwr1gUuXrM9xPlzoF9Nqzde5oq8aPEtimOVFqA6Bsq5gFFk9zZUm
	S3GCywiRGInczT0tffGwneFgz61IRaPfSrny4atnpOJlMdlf0ME73S3tMD/sYnXoqyuNBrc8ej/
	gjHUKVxqxB80=
X-Received: by 2002:a05:6820:4b0d:b0:6ba:3635:800f with SMTP id
 006d021491bc7-6ef12202b9emr8317434eaf.69.1791887232748; Tue, 13 Oct 2026
 03:27:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012011707.3378-5-sigefriedhyy@gmail.com> <179185710223.434549.6133926948819737320@kernel.org>
In-Reply-To: <179185710223.434549.6133926948819737320@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Tue, 13 Oct 2026 19:27:01 +0900
X-Gm-Features: AclHuK8JAnqsEY2qHAL_CL6PzjdPWfJwCgFSVzJgmZ53WVtZSl4NqYxxzMIIVrs
Message-ID: <CA+7S2vK5iSraGLz2BP_akbYMHAtjV1FKE6KNx46wZNmuy1TCew@mail.gmail.com>
Subject: Re: [PATCH net-next v11 4/6] net: add AF_PACKET multicast dumps
To: netdev-bot+sashiko@kernel.org
Cc: ajay.kathat@microchip.com, aleksandr.loktionov@intel.com, 
	andrew+netdev@lunn.ch, claudiu.beznea@tuxon.dev, davem@davemloft.net, 
	dsahern@kernel.org, donald.hunter@gmail.com, edumazet@google.com, 
	idosch@nvidia.com, jacob.e.keller@intel.com, kuba@kernel.org, 
	johannes@sipsolutions.net, kees@kernel.org, kory.maincent@bootlin.com, 
	kuniyu@google.com, nicolas.dichtel@6wind.com, nickgarlis@gmail.com, 
	pabeni@redhat.com, sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, 
	sdf.kernel@gmail.com, vadim.fedorenko@linux.dev, willemb@google.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> - [Medium] dev_mc_dump() is registered with RTNL_FLAG_DUMP_UNLOCKED.

This was raised on v9 too, already replied in a previous thread.
