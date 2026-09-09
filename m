Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F19A27603A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 01:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788918564; cv=none; b=Pww9HbHKjjugCASvX3rrRo1rOTLAFuE06xDBP/ZHYBu4yqtuKWoBWYZMadH5YSd4gKDIe5DJTTRu+/n/pMAhNz+Zk88hkuL8eu2nhONYdByC4YNhftopJQ5gaf66zlF8Oo22YWIWP2MaGkYVVV0KI5ViWx+kYjn7OPTDV5T0qrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788918564; c=relaxed/simple;
	bh=YMmwzaxRrA837R5fF50BpVqDyg67m23LCvRt9BRx7XA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KnQ7tEhaezlP/TYtWPUDj+as8vAN3Set/i9KWVduYbyBQ9DHrVA46PnbnG4G4Xd1aw1Au6au5H4oMOkRyRIPUFOQbkLbtoARQHqF19K2Hjrqg5HWD0ksOsm+q6vryFMGdXWVzIMaezVcMS5Jx1pX8fUR/ej9Dw8Xmd0/3d9ZPF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ZKVpW2mL; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ZKVpW2mL"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfbd148aso5946966d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 18:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788918562; x=1789523362; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P3EsztsSAZiHFdWKJp9lms32NG0DgzcMlpDdtevPa+4=;
        b=ZKVpW2mLZsEJcYO7BjwMPlvKA389wakUC4wE2D81hozdmwBwfzyFv+nZvfVpXmgaOG
         t3gcecWN1J+PkchEIvYeLasy/+2M4KdWlvqhfrlGMAt/ukjiKkX6OxIma1C0IC4X05YR
         gUN6HMmJlV2rnvaGYJYWzPRaRSe6ZVEA9auH5wiTe+K9yjhLMHlrqbB0LiTlrAzyLME+
         nbOmHvSv0s5U+m0RMTApf17HuZKygAdtmsYhvw6ty70u3XcOzRdFSqez5NznBv81XQ8/
         dIZdB9WVrqlhy2suHF6m82mYh3AhJ5NAp/P+pq/MmG5Ls4xfTlyJj/rm2YjIOo6gd9Wh
         DTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788918562; x=1789523362;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P3EsztsSAZiHFdWKJp9lms32NG0DgzcMlpDdtevPa+4=;
        b=Yc/CareF0p77DTZysCIHhhn9IWPkb8hHplVsoEnKbOXfeqbZx6CzNDKmOB4Oo5EFw+
         sWDVsSAXmfe28nSFFj8tFHdAxy7o3cpMTqLJ3a7XJOb9zPvLbOEQ7kdwxwpCOeS1hpzz
         QMh1CTGXiDglcsM1zOJVrpt/EyynAJ4WZLzIvZSaliS7zVpEuWT+X9BE5/pmwggdglpP
         H5psUeXkI1w4YT2IpXv3osT2oQiT2v3g0aqEqObS0+YcCCQExw06CvOQs48/B7zU4eWn
         JoA8r94ZjMTCAFDwdIrfxkBtq+f5mrjSiXL10zcSnEVzul3r9HIdjQ1PRUVxUyepNZE+
         tGzw==
X-Forwarded-Encrypted: i=1; AKwUvBxsOcH40CWlDNbqcoNXaunQHq0KvE4FBtU64bM15IXKKeBpYHA9xrRyZFW0Ynibbf57OoqwxB7b8KSgWsM=@vger.kernel.org
X-Gm-Message-State: AFuF++loR4YFShD9dphQ0ke3uqpIaM7T1+lyIgYGnRUAaR7O03n4gsIM
	gf1h4m95/Cj+HhYVry7JLerB+kWRgXF3cjtliEGiYikzDGfAy73snWoF8glBIfA9bcSvjatz0xe
	Hhht0Ww==
X-Gm-Gg: AYBFou2WLweAZpi/QwNMpSbD+CtFeOz8X9LWnveajM6NhWE40s5HZ53Nj3Skh0092HN
	04299woLT0O9PhHUtTcr6Hlg9QojGrc9kho2xBvyl07Jghh7ST6k2Z7NDuySZFE8Y3KhIq0a5Au
	Mrf+ARF1GGxmYS/jb27fD8tRVVosjgtxwX+dqXG3TtMNP4qzFxJEGerU0F3WJQ00vQnhpNpGgYQ
	5arVOnyTrdS444iSKxRZInwawikVVoQHo6RJR/iPCiXF1MvzaMs2+5UUk0bBuefi2ngyi5gOsv6
	QdQGeP7smqkXnornyo0ohMU920PAOxWIEalGxBvwodIRJQ7iSbCP6aJO5HqAGXUkTSuC/y2EIFF
	NKnyN+OrH9XLlYqEdoApInEVZ7VMgFUmzPO03lWK+1vzMp5IM8+RbWT49VkZzaqmzXoMYWXBEJb
	pVXER8V/AhrnNvCf5mkgLTNZfWsdLmAoSZTOVHO5LtBMImKkjAjVEl4doHDPFGPOi06qGb2rwy
X-Received: by 2002:a05:6214:d07:b0:910:2ffa:efe6 with SMTP id 6a1803df08f44-9106b424fd8mr49490386d6.30.1788918561974;
        Tue, 08 Sep 2026 18:49:21 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-910406475f5sm129440796d6.9.2026.09.08.18.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 18:49:21 -0700 (PDT)
Date: Tue, 8 Sep 2026 21:49:19 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Keisuke Tsukuda <catnyaaan@outlook.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"syzbot+a83a5a1ba9ff57935171@syzkaller.appspotmail.com" <syzbot+a83a5a1ba9ff57935171@syzkaller.appspotmail.com>,
	"syzbot+d31109047baed8f3b590@syzkaller.appspotmail.com" <syzbot+d31109047baed8f3b590@syzkaller.appspotmail.com>
Subject: Re: [PATCH v2 2/2] usb: gadget: f_mass_storage: ignore class
 requests while inactive
Message-ID: <9aa4086a-dfdf-4226-aabe-c05a42cf2a83@rowland.harvard.edu>
References: <20260908203348.95825-1-tkdkei@outlook.jp>
 <20260908203348.95825-3-tkdkei@outlook.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908203348.95825-3-tkdkei@outlook.jp>

On Tue, Sep 08, 2026 at 08:33:54PM +0000, Keisuke Tsukuda wrote:
> SET_CONFIGURATION is handled asynchronously by the mass-storage thread.
> A class request can arrive after the composite core selects the function
> but before the thread installs common->fsg, or while the function is being
> disabled.
> 
> fsg_setup() already rejects this state with -EOPNOTSUPP, but checking it
> through fsg_is_set() also emits a warning. Check the active function
> directly so normal requests during a configuration transition are rejected
> without hiding fsg_is_set() warnings from other internal paths.
> 
> Fixes: 8876f5e7d3b2 ("USB: gadget: f_mass_storage: added eject callback")
> Reported-by: syzbot+d31109047baed8f3b590@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=d31109047baed8f3b590
> Signed-off-by: Keisuke Tsukuda <tkdkei@outlook.jp>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/gadget/function/f_mass_storage.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
> index a50743c..e80ff0b 100644
> --- a/drivers/usb/gadget/function/f_mass_storage.c
> +++ b/drivers/usb/gadget/function/f_mass_storage.c
> @@ -463,7 +463,12 @@ static int fsg_setup(struct usb_function *f,
>  	u16			w_value = le16_to_cpu(ctrl->wValue);
>  	u16			w_length = le16_to_cpu(ctrl->wLength);
>  
> -	if (!fsg_is_set(fsg->common))
> +	/*
> +	 * fsg_is_set() warns when common->fsg is NULL, but that can happen
> +	 * normally while a configuration change installs or removes the active
> +	 * function.
> +	 */
> +	if (!fsg->common->fsg)
>  		return -EOPNOTSUPP;
>  
>  	++fsg->common->ep0_req_tag;	/* Record arrival of a new request */
> -- 
> 2.50.1 (Apple Git-155)
> 
