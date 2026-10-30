Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793382501;
	b=CjYMW4/t+c6fEFonAEiEu1GmWwxRj8a7BcMYWqmHWgGXjnriLIa5s7ezmbaTLnOHmnuk
	 r3Wh51x3WLBv+kum84sq4UBtnqxq7JSdqUtBG/KnQkYjOTBfDHjAgwv/4zSm6Kyt9Rnm3
	 nCP0Zk00p8t0AkrfdBUev3qm3uGGXzHV+H+zIprwRou0i/hXgRRNhHHDSE2/ujBaXATTT
	 4Fogko0wBzxfZOAI6bogqab+FtjQX3vXsPnVUmxHthPoj15canJFHzf8iaBcl97cRVbqG
	 DYdI0R2UStE1PQed643KQOkHRpBcEBa26qgKpXtNGIr8t2J4RykfOt9cC2XUbThOaZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793382501;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=0FM1eyvAUwK+fLhgDxNFYZgoPZUDzKxnOOEbqswS2Es=;
	b=wJnatuM+CLJHlyXzK58rqalEOKXTOyVRem9EGELB/E2nIHww5uro7t+u5A7yxoedOhs/
	 jsKL9crJHGo1GWUvJkrw5HRX3gO8PLRMetvIi42VBd1Q1wCok6RphifUdiNFZXitsCE4K
	 gNYMyjfyG0D5CSKk8DGl2Fn8l+BWnnl6OeeZLYHbnhidN1Gf12UDWph9P5jRKu25ebWH9
	 6K3FjDDxypn+aHo8FypMocFmYdX6zOsHf+uG6bw2cC4ky9pPRNQstL0IkHgrkJDcKjLY5
	 kFsWE5nRC7k9hXMGsFgthEYZvxLg5YCZohfQ3i2ClUoApzDgjYgR8GZJr5T6ob1neHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xhYnTDgb;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520AD606A322
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:48:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 520AD606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xhYnTDgb
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso389842a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793382500; x=1793987300; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0FM1eyvAUwK+fLhgDxNFYZgoPZUDzKxnOOEbqswS2Es=;
        b=xhYnTDgbjHVEDgLd9FeTne28vMcHSOYTrn9emqGQjUbi7VmzKD7Bc3veKg4GaTkhxb
         VH578t4aonLwErix+BvTS4CePJD6pz1x4JpizuSozYDRPGHMY0WqL1rzG8hAX10QfxoN
         slsC8eOO9A/HGY2jOtEnWgnLRLCZwUgb2HBm0U+r8guFc8VpvPzV63mSwxXhL43SN56h
         3ui3PTG8AFMemE4L+RblJZsAzaC3w3GogKUBai0JMDElGxOzKQUSD8Kov3jjZWi4UaZy
         sYq4U0AiE/9jbJ03K47UF/vDxwyTtcxD5RNl9IwwYWTBENpeyJzrZfmu2M43YFicc9Gb
         0Riw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793382500; x=1793987300;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0FM1eyvAUwK+fLhgDxNFYZgoPZUDzKxnOOEbqswS2Es=;
        b=DbEt1Y7SLICWD2u3B4ALtjwbPXXUd4TFaOc8qbDD3WTP6K6JOnbi1N0n8Bf1fLmEQR
         j+KJi1G1vT8CMB8oVBI6k7xwXXvRsP0x6sxf23YYOYqkFSc5UlgE2QQ2HEyS6tx7wm0T
         4CEgpvNaBGeSECiuVcSkOl/mfPk8beMGANWvCqIQQ+/hnYc8aoaYvvUWa+4f68/PWFt+
         cJLibL9lgmkgYpPHtU47GLPTLq8/hkv+U7ShLC8iR7ABGS1UL7AsnNAA7OoWCLjL+crx
         MCzHGKFJ6vp8OFCkA10Fgp8lsWA/Nq3rrFmiTq7G+wfyklrL86ri9Xv5PC3Z88CM3iPr
         Fa3g==
X-Forwarded-Encrypted: i=1; AKwUvBxTYKfl7BzqNxIgOXQPdweFVwQeJAVQPHdqgVmZtQXcl6+owu4hw9M9EDxrdGhcSgzyxAjEBirdPpK50CE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPb7iLdWIaXs/9aBsLPskHxEVmLF6s3wUA+ipckSUmhfd7NtRR
	N0cmRhofCYpom07qOhR6hKcqnXJt6er0INl44zN1qrAjmC2sVntwI419F9paKR20SKU=
X-Gm-Gg: AYBFou1zpV7MmpdkptmvNrOhFMoHFXvaW6oT2oHEiUh7KXPLglbrREiEHdu2EI41Ep5
	HskqV4WxI7jTy6UheGxYI2av+9MPMST1GBalrcJLEYmOlDiSAog+nJQfdwV53Cv57bgaIusZOuO
	ng5iLbNNESYFH1slbSesfQ8tObeTbK5I1t57FGiBB37SkDqH9zjO9PDEfUKs+LpkqYVOoqHhaO1
	dlo7hj1vDfwcHa7892DlNDNWnPtPjsMQdygDwOCHpqDfo+Qv/AWNfwAJjvnJfZouFJ/cT7p+Zdm
	dfROqEGAcgBPygmKOcRQdK2wOycBdTCS5NrwUz9wtTqjCTABg0Whwy/F0RuRYiyFici+YyNz+bG
	dYQsjv3CwVXdTrwE8R4iOSKkfeFqckyDykVFXP8UTe9k0AJxvwdSPsvQd1AZ5GlkRvq40ZNUR9y
	x2wO3Mzh9RKuOP9Nv2VotvgpOvBg8WTDNLXog3FkhZEypO7XjmI3kPvLR33zbkZlgcREnD27uMr
	28ZCTsiowOPEaMegXew4Jjxmg9hhDUsmG/Hjy0PX0eFkHLd/CIAezjH8dL4SqaasGPyEF1Smw4n
	r/sFGbBrKU4KIs9ng8JumXyI/4S0sRg=
X-Received: by 2002:a05:6a21:a247:b0:3c3:7a0a:18a6 with SMTP id adf61e73a8af0-3e928ca2358mr2811333637.18.1793382499460;
        Fri, 30 Oct 2026 10:48:19 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:1341:f404:be4:486c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada9ab752sm297668b3a.45.2026.10.30.10.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:48:18 -0700 (PDT)
Date: Fri, 30 Oct 2026 11:48:16 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Yu Zhang <yuz08559@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] rpmsg: char: take ept_lock in the
 SET_INCOMING_FLOWCONTROL ioctl
Message-ID: <auTYYGFsSqPalG_y@p14s>
References: <20261026100306.68019-1-yuz08559@gmail.com>
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
In-Reply-To: <20261026100306.68019-1-yuz08559@gmail.com>

Hi,

On Mon, Oct 26, 2026 at 08:03:06PM +1000, Yu Zhang wrote:
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
> The other eptdev->ept users get this right: rpmsg_eptdev_write_iter() and
> rpmsg_eptdev_poll() take ept_lock and re-check eptdev->ept before use. Do
> the same in the ioctl. Lock only this case: RPMSG_DESTROY_EPT_IOCTL calls
> rpmsg_chrdev_eptdev_destroy(), which takes ept_lock itself, so the switch
> as a whole must not hold it.

Please get rid of the above paragraph.

> 
> Fixes: 5550201c0fe2 ("rpmsg: char: Add RPMSG GET/SET FLOWCONTROL IOCTL support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yu Zhang <yuz08559@gmail.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 550fda2..49c0784 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -343,7 +343,15 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
>  			break;
>  		}
>  		set = !!arg;
> -		ret = rpmsg_set_flow_control(eptdev->ept, set, eptdev->chinfo.dst);
> +		ret = mutex_lock_interruptible(&eptdev->ept_lock);
> +		if (ret)
> +			break;
> +		if (eptdev->ept)
> +			ret = rpmsg_set_flow_control(eptdev->ept, set,
> +						     eptdev->chinfo.dst);
> +		else
> +			ret = -EPIPE;
> +		mutex_unlock(&eptdev->ept_lock);


                ret = mutex_lock_interruptible(&eptdev->ept_lock);
		if (ret)
 			break;

                if (!eptdev->ept) {
                        ret = -EPIEP;
                        break;
                }
		ret = rpmsg_set_flow_control(eptdev->ept, set,
                                             eptdev->chinfo.dst);
		mutex_unlock(&eptdev->ept_lock);


Thanks,
Mathieu

>  		break;
>  	case RPMSG_DESTROY_EPT_IOCTL:
>  		/* Don't allow to destroy a default endpoint. */
> -- 
> 2.43.0
> 
