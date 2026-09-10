Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBD55427EA
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789060249; cv=none; b=t6c9tYTGPSp4rFZaMrXC/Qyu7CXwG4TCIO6MSBhuPfr7CwGJRyP1i+Y4ImfOuKaFUigUMR1RfdNJcGu0z02cVrwvomCukHGX2XLvUPK1D1clb00BiFY29QpOy7wcUxKwCRqJVAlFfyYgfJGSfoCze0uFfs1M86znpyLd7sfaRu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789060249; c=relaxed/simple;
	bh=AwlQr01gOaB0513mqpwbFOstgch6p4TPUaapjmXe+RY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BJACBRFrRkQ9N3kOL+3D9yMVkXpO+yyi/OkNT/CCAXII6cK3owQ4KX9ih9Kiv6fGlOG+gR/DkWfwszHt+Q4fB1C94dnc8MuOhsZQ8HG/BT1HU86mQrnOkT7w6zNu4aNONgK+3nP5fJjI3oVzXSkHFrfjpGj5Wc8tjZSj6RDOmzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OCZlT8j0; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OCZlT8j0"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7f64ea07036so6770061a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789060233; x=1789665033; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SKblG7QGgHAKfTpoP5V52jptdTaAh+yb1fvW/oZI/IE=;
        b=OCZlT8j0W2JHYXYuFrVsfFyBxVmmuswYK2evkd+cQVjm4wogqIAXwfkXYm3TDRigyU
         LrWNq+tV3Iq/Mk4R0UZZTxQIm0HW3z4H2EvIyMbz3dp9AtxADgl/oBAdclNEq4cKKmi1
         INzVHWPGQDzygJc+grrGVlDqrCyNTfoZamId2UOaDTVXUZvCoxvIrT76q4kGNsbUbMKz
         xsVR84gssQUocZLpWf1/QED5StTp7baWw3NlrmL0Vcr0opFYtqj3rGthmsixO4HGQsP9
         5ULnT2jrYy0EiPIms6jJC+DK6RCezYFZe7CfOY0uoxfiw5n4osqL31IMjeO0UAVD+5/j
         Zi3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789060233; x=1789665033;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKblG7QGgHAKfTpoP5V52jptdTaAh+yb1fvW/oZI/IE=;
        b=aTIAlvicbWYRJIuzhxZ0kQbPuvsQho/O8P/FiLmmpXVIfDjzI/EQmK4EuBb343mhU3
         bc1Yxq0faR5IPY++qAWrtUhsR2V1DBcnWi1pWWqfwfqG4QWjhgouLHmhMuquwgw1vTmK
         BtBpPVhmMuH4qoVSj4RYiGlVbV5Sht1SLxfj9BQ0an69LRRRiSPrb8uSuY30YS+Sn8pC
         K+fuEhsKYyLuuDbBVP8Dn2fOzOLrzbh1JtGJnAwZm4Aa7Qtpj6L/YpgqvyZMSqTBNmrs
         8mvwjMuIewUig3+nJFYKRVuSqvGuubjAxuJ8VY89+2gfmRSCi0aUj91BHF3yqgRheciC
         oPBA==
X-Forwarded-Encrypted: i=1; AKwUvByshzWH0sjx0we2SqywfSVQFmhqaptVGt4CuBrUYqASFZa1qI6SDb7og5MFZcLA+29z/4qmKWRixw23QRM=@vger.kernel.org
X-Gm-Message-State: AFuF++nvPoyWgokPN729Y4MLF+WZznCSfNarjoGI0ijcTfjbdcusfRXc
	l/dHolz/W+SUS7xLfTqqlb2zW2lBKCL/WmAWaZUzBt/knjki4kMQ+GPBfzitCygj
X-Gm-Gg: AYBFou34+AOpqrgT6p6x3LiVWXbltUBzQLKAcBTkSK9TkhAhfgg/oP6AN4e2/+iGnGZ
	7Zy/K2w41kfFyuJlD5U5+RDtNjvUZQefYMW0VJS8e1W7PC5tNdNJSNKx4SrxwPvUvdIJZuPAsY6
	SMj/AURj5ib/Wd1uhz/RppGjzuYPSkx4+hiVS8s/X3X94X7yLYqTT34W1EdgsS/H5azgvcloY8M
	OQ87gf4QaTidZWUVqSu4o5YvPxQNL+iH3O9Hwb9tEuwYOXpvGe9ApvEpzngSBDKISWVCBbY/ngi
	oz0V5IpZc5LFWccemi/n+DtV36YH5E9Qc9gvpcTp6XAg3UjBQIoGG+zkMTJn+IByclLPhVFcgwf
	3pl+IXwEdZye4KuD5xrzbjdz4X8XYuC+/CvaSxjKI21sFXWD1ABjCItfn8Gb+XfCW7gtASOp48/
	JXVgclBzuozqO5JXFiIeSwkpMUqr6Pg5/7thyEiLxDaM5Ah34k3u1kUSg4elc7498PXaV2knGB6
	y2X5+7MmYDOEyL8BruDYjcbDHeHag==
X-Received: by 2002:a05:6830:258d:b0:7f6:6618:e506 with SMTP id 46e09a7af769-7fa207af645mr26042050a34.14.1789060233518;
        Thu, 10 Sep 2026 10:10:33 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:8::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7fcc45d7852sm14860896a34.20.2026.09.10.10.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 10:10:32 -0700 (PDT)
Date: Thu, 10 Sep 2026 10:10:29 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: "Maxime Chevallier (Netdev Foundation)" <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	matttbe@kernel.org, Stanislav Fomichev <sdf@fomichev.me>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next] tools: ynl: Fix out-of-tree build for ynltool
Message-ID: <aqLkhcMb8uSKhQZl@devvm29614.prn0.facebook.com>
References: <20260909071155.1234922-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909071155.1234922-1-maxime.chevallier@bootlin.com>

On Wed, Sep 09, 2026 at 09:11:54AM +0200, Maxime Chevallier (Netdev Foundation) wrote:
> After the blamed commit, running a out-of-tree build for ynltool fails :
> 
>   # make -C tools/net/ynl/ynltool O=/tmp/o1
>   make: Entering directory 'tools/net/ynl/ynltool'
>   make: *** No rule to make target '/tmp/o1/json_writer.o', needed by '/tmp/o1/ynltool'.  Stop.
> 
> ynltool's Makefile correctly accounts for $(OUTPUT) to get the list of
> object files to generate :
> 
> OBJS := $(patsubst %.c,$(OUTPUT)%.o,$(SRCS))
> 
> but it never actually set $(OUTPUT) before the blamed commit, meaning
> that out-of-tree buils of ynltool were always actually in-tree.
> 
> Now, the O= parameter is correctly accounted for, and the %o: %c rule fails.
> 
> Let's update the %o: %c rule to also use $(OUTPUT).
> 
> Reported-by: Bobby Eshleman <bobbyeshleman@gmail.com>
> Closes: https://lore.kernel.org/all/aqCyWQxqKDuQnZYR@devvm29614.prn0.facebook.com/
> Fixes: 917f713b4ec4 ("tools: ynl: Allow cross-compiling ynl and associated tools")
> Signed-off-by: Maxime Chevallier (Netdev Foundation) <maxime.chevallier@bootlin.com>
> ---
> Targetting net-next, as the blamed commit lives there.
> 
>  tools/net/ynl/ynltool/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/net/ynl/ynltool/Makefile b/tools/net/ynl/ynltool/Makefile
> index b8c67cdb4fdf..1053e7606c86 100644
> --- a/tools/net/ynl/ynltool/Makefile
> +++ b/tools/net/ynl/ynltool/Makefile
> @@ -31,7 +31,7 @@ $(YNLTOOL): ../libynl.a $(OBJS)
>  	$(Q)echo -e "\tLINK $@"
>  	$(Q)$(CC) $(CFLAGS) -o $@ $(OBJS) ../libynl.a -lm
>  
> -%.o: %.c ../libynl.a
> +$(OUTPUT)%.o: %.c ../libynl.a
>  	$(Q)echo -e "\tCC $@"
>  	$(Q)$(COMPILE.c) -MMD -c -o $@ $<
>  
> -- 
> 2.55.0
> 

Reviewed-by: Bobby Eshleman <bobbyeshleman@meta.com>
