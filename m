Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793897783;
	b=C8LA56oByYJCvERd+ieZWpVdTKqCi+pi+DMiGxyRxPIhO3XzoCr0+zxDVJL9/Vfgc9Do
	 S/+0e0aaioXQyoRJc8tARfW8386s4Bbyo5K90xOy9ORoQnAnbk3Yves5G347gwiQhXx3s
	 DCOwcpJ9LTRCTYxcNu2EYhiNEM1ExJA4oRBvi6iR7ZCZfQLvGiWaqZKLk2fZSgwRKCFki
	 dZbIOV3MiSDb4fg9JDnLMwhXpmmHe9i6ivacnC0KOPp4y7qsRM62ViQWiKAzBxB+jykjF
	 QBhQJXjfaDBr4yxMbUouXHZ1irexmma3V9qgfAkXLMaE5skr1IN12V/WkOTmeMeYSFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793897783;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=sXd2orHtvS28hhtBKOplUBavOCjio3xkwlj67EhnJWU=;
	b=b7biQjNt9CDgfl4Koq9XrVpbKVGI51bN2w9Hzsk/dAjJXYiqGpv+D3JVaW80yDOMJg8f
	 SjEIMv20twAqOn0iO4tfigpiL6OUszruRcSlDAmJQjjZ0Rd18XSoacWQntl6E/uKc+K1O
	 eiWPRpaSIfrx7Kk3bhxQ1msOfsIzzn+1+g7FjyK7g4Me00sHWM55s3f55WbShiAb+5ZEQ
	 hfUUY1om42p2eG8zcLSwlaX5goRg5+trE94beRqm6jC9EVknI68x8S05VciBs9U/rhYiG
	 JKW68JlUu6ZNv72pWrRWLBEIfg/aL5HvbyX5JjR5Pgs+BuEhG96sbWL+pQeFtfMW8Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Ogmv7BG4;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37D9606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:56:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C37D9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Ogmv7BG4
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ed408b0d9dso418255ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793897782; x=1794502582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sXd2orHtvS28hhtBKOplUBavOCjio3xkwlj67EhnJWU=;
        b=Ogmv7BG4r7uuYCYpQN4niqDJbGkvLKQFENVq0R4ZDqv8WEJDpk9oXeQLiFTF0VDwVh
         ZW3dRsM8vxcktUqR8BLPtebX//inW1Bfn+BdikoT2ufnSbeXAlawBDAqYnbaT3ve01DM
         3G8UuPv4JjwWiGSABW/YQ7BK3i6IWEMQ9LScK6uM0QnBbM5NUX9L6hePyG/VFQGhGVwp
         yrutnEdo+lMbKqhRElOL/guTxtCUcJSmflLE54qW0EGDnf7gaUt6sZCWETWxTFMS2xBC
         qsOyvOrwd2F/C+7CAIc8Ue3hnsor2FaZUI+4GfsKHJuF0Q/sB7GfEwgbcbMAkxaqgHXu
         eEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793897782; x=1794502582;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sXd2orHtvS28hhtBKOplUBavOCjio3xkwlj67EhnJWU=;
        b=2RIpFPJpFa2zep2QPe+aQksBZi+zUPOqSNHQH0XIXGEd6HgWjQgwo8uwpKrISp+PXz
         6JcoUfujprRcX3gZUHliGiAMD5CMOKO00oMKZgvt2rNJcOEepptHMRM1Oj3yDh3U7/ox
         LdWN5U8aCT8dSbmcC3/JuNidEC9W3ivveu7WTfWlGrsHj5SbfGMlLDSSXD1+KRVHzzSI
         xDAEs/eXWw+DZ8vcGIEfuXxpkiV7BUyoFe/ZbkyK/K4Q9Wxijqms7gNduC8fQI63ncm4
         B5ybYlAumLnrtwjEo7FwcV75QX7mdt+WIiYekEoBnDyLlNTcdcZFjlq+iUJVGbvsNXFD
         e3ow==
X-Forwarded-Encrypted: i=1; AKwUvByAqU7RIgH8F+8UV1lwBRcxL7k7qR3iOLpWKdMzh5thZ1f1VmLMgGuWU5BIVX5exThfaG06gWZvSBxCd6o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/N1HBSDbV5QyGbPqY71ZMo6Ylwh/2sPqgQGFV/Wzrzxs+AJ8bK
	7K3XJ2+7Vd4QJlHdyJSb/JEhR3tB5xwyhfcZUTS368CjA2VwOPnEyUs+uGMjm7BNzy8=
X-Gm-Gg: AYBFou0DIEsPcEtL6YYw4UgInoSJPvWEULbS4ZWMdIHwOJ9sYkDhUWfQI8Dn1j4gir6
	iMFOvzdpsoEzsq/AKK29ZkBR6rd7i/EL8WqhMsZHftoghEID9BA8nj72T+3Wtikpbo1KhAK+tnU
	1HZ3wJk04GIlAOu07DDa/Dvkn6a1X/gnRCx70+o1cC1pFenYccFe4fPeSUEY0kTub4dYJvaC/Vl
	nVxW53RW11m5Zx6ifO1sBsjbGPR/vs+i6FIw4g8fa+174zXM2SncryIPiRJ3qkaq7pdug/HpFvC
	JfunxZx3ZetSeGWSycwTNNr4DanY5L4bAmcHulsBbrytWcnR/LT3FCzRabzgrbUQhvPEoNSYPXK
	xUh/mKSCRl0x+u214wsnDt+CZnKmDlhmf+QMB9cEIRm576Ql0GnlKZqEb3F54YDThD7PBV7ZVgU
	AcxBn8yQBnBjRHLDJ/mPWSUcrA21R/ti/Z76gavYtShqtZo38lpKVxYK24WAURbxZ1f4n5pHaW2
	PWwoBgzdR0ue4EnNbSmgkgC1VoTo1vvezA4GQs0NaeLQxeRU2ml5vNd2VQbuE4eSDlgIVYTC9Sl
	C07lflw48sieks6WiuHlVgwpphh40T0=
X-Received: by 2002:a17:903:2290:b0:2e8:3d48:4d8d with SMTP id d9443c01a7336-2ed40ee5387mr1933055ad.0.1793897781997;
        Thu, 05 Nov 2026 08:56:21 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:c7a9:fa1d:b267:7419])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed09127905sm20286145ad.48.2026.11.05.08.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:56:21 -0800 (PST)
Date: Thu, 5 Nov 2026 10:56:19 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Yu Zhang <yuz08559@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] rpmsg: char: take ept_lock in the
 SET_INCOMING_FLOWCONTROL ioctl
Message-ID: <auy1M1b4-ymv0OyD@p14s>
References: <20261026100306.68019-1-yuz08559@gmail.com>
 <20261031090650.23701-1-yuz08559@gmail.com>
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
In-Reply-To: <20261031090650.23701-1-yuz08559@gmail.com>

On Sat, Oct 31, 2026 at 07:06:50PM +1000, Yu Zhang wrote:
> rpmsg_eptdev_ioctl() handles RPMSG_SET_INCOMING_FLOWCONTROL by calling
> rpmsg_set_flow_control(eptdev->ept, ...) without holding eptdev->ept_lock
> and without checking eptdev->ept for NULL. rpmsg_set_flow_control()
> dereferences ept->ops, so this is the only eptdev->ept user that does not
> honour the ept_lock discipline.
> 
> eptdev->ept is torn down under ept_lock: rpmsg_chrdev_eptdev_destroy()
> (reached via RPMSG_DESTROY_EPT_IOCTL on a second fd, or when the rpmsg
> device is removed) and rpmsg_eptdev_release() both do
> 
> 	mutex_lock(&eptdev->ept_lock);
> 	rpmsg_destroy_ept(eptdev->ept);
> 	eptdev->ept = NULL;
> 	mutex_unlock(&eptdev->ept_lock);
> 
> and rpmsg_destroy_ept() drops the endpoint's last reference and frees it.
> A SET_INCOMING_FLOWCONTROL ioctl running concurrently can therefore read
> eptdev->ept just as it is freed and dereference ept->ops -> use-after-free
> (or a NULL dereference once ept has been cleared).
> 
> Fixes: 5550201c0fe2 ("rpmsg: char: Add RPMSG GET/SET FLOWCONTROL IOCTL support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yu Zhang <yuz08559@gmail.com>
> ---
> v2:
>  - Drop the paragraph about the other ept_lock users from the commit
>    message (Mathieu).
>  - Bail out early when the endpoint is already gone instead of an
>    if/else around the call (Mathieu).
> v1: https://lore.kernel.org/all/20261026100306.68019-1-yuz08559@gmail.com/
> ---
>  drivers/rpmsg/rpmsg_char.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>

Applied.

Thanks,
Mathieu
 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 550fda2..d8868fa 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -343,7 +343,20 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
>  			break;
>  		}
>  		set = !!arg;
> -		ret = rpmsg_set_flow_control(eptdev->ept, set, eptdev->chinfo.dst);
> +
> +		ret = mutex_lock_interruptible(&eptdev->ept_lock);
> +		if (ret)
> +			break;
> +
> +		if (!eptdev->ept) {
> +			mutex_unlock(&eptdev->ept_lock);
> +			ret = -EPIPE;
> +			break;
> +		}
> +
> +		ret = rpmsg_set_flow_control(eptdev->ept, set,
> +					     eptdev->chinfo.dst);
> +		mutex_unlock(&eptdev->ept_lock);
>  		break;
>  	case RPMSG_DESTROY_EPT_IOCTL:
>  		/* Don't allow to destroy a default endpoint. */
> -- 
> 2.43.0
> 
