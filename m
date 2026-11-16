Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853051;
	b=JwIGGdU8cVKfX2lEHDxwBZCXZODQsHmmwa9hIdpvFHebA4GLuaor+3OBjU9+ffO5zXZG
	 Akq2zVo2nDTJOf9JulOB+lct23JNz7lpQsD40KmHioU/xBkS09skzr8dUhE2HmD1JGa9Y
	 rWt/jLabJ9Z0XVWg4+rgovQFckRqXXxdQutFt31PauGuO5UdI8o6KrfMxYiHw/urRMtGm
	 JuqBBdNrv3aw2JYN819tERB7lJq7fHRZHpitzhxB1E4x5hzY/zguhaApinWTlwmee+uvN
	 Q7GPrMPG1cxjYRr7dq+eAfqLEZzUxMdTPJtZdCIMmB8PB1vDa7Ie7beI+aObe01sPTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=RScUmkvDYyZGQ7cdGuOwgEgkZcBLN0w6tko6/je2Xu4=;
	b=z80mD0JhAKWCFdrB8l152p+t5UkZWcnFKN6Iozu348giDNJ4WBoIYRbUj6o/PzoxGQVL
	 SF8dQi5jaOjHn7KHDJffaQgf5bc9Zf6UnYSbZhfLkyw5yQ+Pqyvszo6ZV6BZnH2c27gy3
	 LEgsdDygbENlXnKyRyM8VE49JOJyQiSAl7606v6mggoEbRzk2xl2h5eQr664zlUgRhUzw
	 S2qqvREeTG3t58nbmRIUAxOw5KzU32qk7HQOKmn9RmL62BeoY2vIJUIidXg3cdyaayQcp
	 hHGHkLJIdJsreqKOuf+Pkv+xhVDF32DPvU9vsSFFIJp4iG5RrQZxs9pbYWuHooXi3yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=Da6Kge7S;
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BC2606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55BC2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=Da6Kge7S
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91e8a05ec5aso58296356d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794853050; x=1795457850; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RScUmkvDYyZGQ7cdGuOwgEgkZcBLN0w6tko6/je2Xu4=;
        b=Da6Kge7Si0XQaqs0hLt29Ig5onh6sX47qlUBFimNdQ/J74R/61zY67zbSrQu0666nt
         RVijZ3cH2s4QtLeNLMXbDm2RCg8zxckjjerL1hkUkJMKsPCo+xQaJIot4VeNmHiL9mio
         VRp6I8ZZKTtPrikhXSyL2B5tcASHt3RwJZmdww/6j0Agnve6auIKZSt9HxWX4lq7VF0T
         vBNDFE6jyul2VfD0Gvyjyi/1lhKGCPTfEXBWTpf94yaAO1DK7BoYPckgFLRhKPuI9+O6
         xMnU/pRVGVXQ8mEScIldR2+3p+ATz4vEAfhztEA19435CbPc3kTD9EDCouP7X5Dw+K/M
         Dz/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853050; x=1795457850;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RScUmkvDYyZGQ7cdGuOwgEgkZcBLN0w6tko6/je2Xu4=;
        b=iIzyuaco4sNirdRGGLg3KLnzVXcPfjB6MoVTH8BBERL8yEyEONfX9zQ275gbG68f7g
         YNVcCAlxvAchncRyvyNN+5wfyH6ao8OsbBatM96NuuELjvNXiAsm0jzfH2wj7NtI3JcF
         lnrf38Hrx3aGTDlGtdRqmp097cr6XtliGzLyqRNtTWgJpRyBYwmGxgBC043/UI0UC0aw
         CMTqY2gxHwN4MJS+pILTe63kSNoI5/epgSw7FQgmTogDwVFxgo51Y9zz+LhySQ4bRYaV
         Rx/ABB5pCbIF0z0N7SSsbGgkbYxvDFLDvKw39NU2Yocd7eg8KpJATumB/hOmkO53od5g
         5bIA==
X-Forwarded-Encrypted: i=1; AL+hErGhQerCdXCXWpPvVYj8Ce2d1zSRW9+mMXon8yfURBcQxB+uv5TWULAGQXjpsk2QHBR0m6uGb8qaVRXaZbY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TdWylUJZGnvYOkqAMq/m1YDLsNp+SvIEK1HdkstWqDF83bPPh
	kkbCLX97XmSl8yL9Ii0kqXjm/1AlKx9VmF10hHFO1uGnolJ8roPocM3Rwz8qCaKi5g==
X-Gm-Gg: AZFdTZdt0H+s51X+oUgvdnUbwXdxQVeQNkXuX3fV3+L6fPaKsaoNYahqZ9ShwwPTlx1
	sEJ74pzvrMXmM8o8t9TRztJp1+NC0hshYtzoHHdlNTfRXRTJlavRja9tkEoPkiwSyOMLsGhsM08
	LpBCg12X7ulqWhiGg/CQgj9cpGja/53B7gksgueaLrNTZG9pWrWqCK6cZUfoZT+bS32tkNAnCMe
	BRdbEy13/nOeJ0DsDAYjZAcKQZrQ6tmEIPy3cSh7PYxvMVuOGnv9mRN5SmrpwbYiGzOWsVlxTJQ
	zSTOrajOHa6wtGpltFzNWEgherTv0PT/0Eu93lS7ySZDfCqreTRXYI9+hFeZT41CR6TasHe6hz+
	+uYy3+asEq83SBISsy7MERhjX/bgkj0jnEFt5Ou/hulUXgGpHaDvPTs3nLIzAsmNHxQudoYYNXs
	uBQE30ArnMXVRioEcZ1W1oeZ6gzBFhtFZrguJTtpSnnAP67jnxzRTuvG9Ff4NdGLHPK8XI5JUq/
	tTVOCnRf0kLV7dgMen+Z9q2LXC3qpbt14spYxorV4tfnpyy9iBhGZ2Ll7zqdmKzWxY2kGNCGw/l
	4ysHAI60sKroJVZcTnPL7WO14u1wotCOmwV0piDkDEdZx7Gz01Q=
X-Received: by 2002:a05:6214:226f:b0:91e:a46f:a58c with SMTP id 6a1803df08f44-91f24015f47mr185903906d6.8.1794853050082;
        Mon, 16 Nov 2026 10:17:30 -0800 (PST)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-920ee3ccf23sm21285836d6.7.2026.11.16.10.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:17:29 -0800 (PST)
Date: Mon, 16 Nov 2026 13:17:27 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Cheng Yongkang <teel4res@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: usbfs: reject SETINTERFACE while suspend is allowed
Message-ID: <a7e6b6f9-9926-404a-b185-c9fcab5c9d10@rowland.harvard.edu>
References: <20261115163709.226641-1-teel4res@gmail.com>
 <36240a2c-0ecb-4b26-824d-84d782dc706e@rowland.harvard.edu>
 <20261116060549.370140-1-teel4res@gmail.com>
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
In-Reply-To: <20261116060549.370140-1-teel4res@gmail.com>

On Sun, Nov 15, 2026 at 10:05:49PM -0800, Cheng Yongkang wrote:
> After USBDEVFS_ALLOW_SUSPEND, a usbfs file no longer holds a runtime PM
> reference and the device can be runtime suspended. When it is resumed
> through reset-resume, finish_port_resume() sets USB_STATE_CONFIGURED
> before usb_reset_and_verify_device() restores the altsettings. The
> restore loop also runs when a driver bound to another interface calls
> usb_reset_device() from its resume handler. The resume path does not
> take the device lock, so a SETINTERFACE issued in that window passes
> checkintf() and its usb_set_interface() runs concurrently with the
> usb_set_interface() calls of the restore loop.
> 
> Fail SETINTERFACE with -EHOSTUNREACH while suspend is allowed. A
> program has to call USBDEVFS_FORBID_SUSPEND or USBDEVFS_WAIT_FOR_RESUME
> first, which resumes the device and keeps it from suspending until the
> file allows suspend again.
> 
> Fixes: 7794f486ed0b ("usbfs: Add ioctls for runtime power management")
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
> ---
> I used -EHOSTUNREACH, the same error checkintf() returns for a device
> that is not configured. Please tell me if another error is preferred.

-EHOSTUNREACH is fine, as far as I know.

>  drivers/usb/core/devio.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
> index 101cb9425480..6463ad2b1fc5 100644
> --- a/drivers/usb/core/devio.c
> +++ b/drivers/usb/core/devio.c
> @@ -1533,6 +1533,8 @@ static int proc_setintf(struct usb_dev_state *ps, void __user *arg)
>  
>  	if (copy_from_user(&setintf, arg, sizeof(setintf)))
>  		return -EFAULT;
> +	if (ps->suspend_allowed)
> +		return -EHOSTUNREACH;

How about putting this before the copy_from_user(), and adding a comment 
about avoiding possible races against an unlocked reset occurring 
during a device resume?

Alan Stern

>  	ret = checkintf(ps, setintf.interface);
>  	if (ret)
>  		return ret;
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> -- 
> 2.34.1
> 
