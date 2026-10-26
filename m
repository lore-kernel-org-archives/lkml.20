Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032935;
	b=rU4K4BrYZSPufY3AWDVzZL8dcYAz6jxyYKbDhMPD+gfhnnQz9Mr5ZEoHePkTB7optSJ9
	 p/7/tdAOzyjeKcjMWdyO0q1Sm43Q4qv1Vj+FlqWKWz0ZxXTASCkzeBhEu0Zuy2dB57clJ
	 uwKFW+Jv0M3211IPdo/6F9c9E7dEOv6l2hH6pTraR8xczgQ1F9D5hTioFSCFkSmXPdDnu
	 /ddoBc0natTSX/PsMoAynV9f3NleyzMGZPmz1/mEQwXoDMQQthQFe/gwhvVUWyAmsF1QY
	 jk6Fe60j4txZ8RNRHUMmTOu2Yu+Mw+AzH2i2BFrntRO7tlIgw+erHkehVaSLCjztQgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=IZdnB36TYkFpUyJUmp0mF4p0xDjkPFbcHCtRdEkoFgk=;
	b=pBRib3VyzTl1ACAe5sX+NkBpoYzoibBoVAgG3Vrx7xWgyIFw8upRL2NLaLU0D4JAshbR
	 yNOJXegFdeLsMEr93rbEduysNMwzE0cXNipcPRSqBB4hDRbmZKeVmSvsqB3VBjXFbSDAJ
	 rWFCkxUEWCGm9lveN1FvHPTu7jNE9c4bkH0Fa2dT1BPud2Tjr3p2rdvIybtSUzCP69n7I
	 q6qOWjnhFbztKVjFLfKTs0D2xmt6S2HR+ogiEB91FUPELxt2D+x/i+g1P97I5HB4MRFOZ
	 3Tzk2Vrq+KyruUbQLWSikwMXpjCFq649nfbsJuZs2ILkklJhMbDjOHA9CrQerVfacIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kvxhfPHE;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BEB606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95BEB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kvxhfPHE
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so2806393f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793032933; x=1793637733; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IZdnB36TYkFpUyJUmp0mF4p0xDjkPFbcHCtRdEkoFgk=;
        b=kvxhfPHE820gI1UUM7RXsrnNDxX4JrU74bUFOfmSep4/3gAeNvshA/8Bq03VHIFLED
         B2DnvrQ5EKlS4kyfFqCYZK+i9/+z3Qq7dxQiuOrBW9QxNjrZLaJhKr/bk3lnGctZaVPN
         giZlBVnKR53ravR3lGTnElS6al/3sOTSa1FX+Dqj5LGsLENIFYq2lu+Z8h447XRywzz/
         9RmD79V+yeHq+iId1UD1Aw8nBTCX/JwaE22BV2w8BSZo0zZl/OQ8LmdA+zl8f9THLcwS
         0fEL0p/HYeQjUUiY4wpLyMmaAt5eace+ZnHI1Ypp3WStbBPcIo5blod+7a8tOh85t51Z
         MxNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032933; x=1793637733;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IZdnB36TYkFpUyJUmp0mF4p0xDjkPFbcHCtRdEkoFgk=;
        b=r5aiJvoOh+ZqgyYMA5xqv2Lor2oxbKKd25XnMOhWB45L171r6uEVvOSWIK6jhml9Q/
         sS9HnRwO82CPEiVjjyd90/fe8jtPA6td1Hv3PEQMjrcPvqOv7HBrE04rlLdTtKYI05XL
         hKLwUTEC4e0Ctk9k6+v17Ax+ThGNQyg7qOz1iDkhOksSFF94tkYlZf+q0fSgE8FYeC4T
         Je1Tpri4IfqRWqXhEr8w+vl+q2vfZ2WMUnyUTcQIEljdvYvauAVgzzHjqPgRYp0Lscm5
         R0Fj5DBXYsdJAY4rDIru6qWcD1BGNUPMPyZUok1gPpfMeoZOo1iAr2hbwfsgmUL8QK53
         UkPg==
X-Forwarded-Encrypted: i=1; AKwUvBw6Nj1Jtb0VqfSCq/GdHD2+1kRDESttNQQJorMOgZr+R0yh/Tzh200n/qIRyKwMeaTla3JYLtxo1Sxz+GY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ22000lS9VpcXSOCZCBJkygOvzdSlXTauBFtswGqrPUnMElepl
	NE7nhi/oACyMDqycKpF7+igCJoYO4clvvyIep+CnUd5kN1PsnUD7GynL
X-Gm-Gg: AYBFou0xCx6N+SqSWMmlaVFXiDsDyPvbtyQyOE6eTABpnz33aNdXAcZaXZvjhz86H+w
	2t8KrvPm1OlTst4txiiU4h+vCbB7JEmtDf/zB6pqRU1sAwBkevotcB7Bm8BumBuqLc0nru74eDL
	ih8qNsYLFZrsjogY59473LB6jk79BAWxBQrkBasT/vdcKksbiZkibCoYwVWsm4cQ84eZDVK4zF0
	DtOVc150b0VIub+jLHDirX6QtdMPYgelR7WOi5BEDpyvgMrJld+ZlGAhSjVxo0/+7hvh3L42LtQ
	xcVWDDYovICkLsMOsnb/yiHXSP4rQv/xqFfX2wb7YWFf0HjlcP3i4gRk5yel3Xyu+XsFrsIoV+z
	bn7ustWKTc05LS5XV0Advv9H7v2CPVl39Ih2jQEIDhYRr6V0WAGPuMYOXLMXjvgK94egnixHGMU
	HU8ratDLRhaRjuAC2439tFSazJhLXUJMY9MmnT0W44d0OJ6hr9+1W2rnSEzaNs4znBMBTOhLsb1
	+5A0OYqIlmXqQUmpm3hRsjhIEWHu/lArIFN3KTQ5480SAE5HCJG
X-Received: by 2002:a05:6000:24c8:b0:48d:f831:2681 with SMTP id ffacd0b85a97d-48e3eb922a2mr13567728f8f.38.1793032932768;
        Mon, 26 Oct 2026 09:42:12 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ece14a1sm17879800f8f.57.2026.10.26.09.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:42:11 -0700 (PDT)
Date: Mon, 26 Oct 2026 19:42:07 +0300
From: Dan Carpenter <error27@gmail.com>
To: Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/staging/media/atomisp: Initialize curr_rules in
 atomisp_freq_scaling
Message-ID: <at-C33IuUEms74EL@stanley.mountain>
References: <20261026161058.25031-1-sifat.yt.2.0c@gmail.com>
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
In-Reply-To: <20261026161058.25031-1-sifat.yt.2.0c@gmail.com>

On Mon, Oct 26, 2026 at 04:10:58PM +0000, Abdullah Mohammd Sifat wrote:
> The local structure 'curr_rules' is declared on the stack but is
> not initialized. Initialize it to zero using empty brackets '{}'
> to prevent potential information leakage of stack garbage values.
> 
> Signed-off-by: Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>

The commit message says it fixes a bug but there is no fixes tag.

> ---
>  drivers/staging/media/atomisp/pci/atomisp_cmd.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> index e66a7d1c7a0e..d4de2bd9a0a5 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -170,7 +170,6 @@ static int write_target_freq_to_hw(struct atomisp_device *isp,
>  		dev_err(isp->dev, "DFS target freq is rejected by HW.\n");
>  		return -EINVAL;
>  	}
> -

Deleting this blank line is unrelated and wrong.

>  	return 0;
>  }
>  
> @@ -180,7 +179,8 @@ int atomisp_freq_scaling(struct atomisp_device *isp,
>  {
>  	const struct atomisp_dfs_config *dfs;
>  	unsigned int new_freq;
> -	struct atomisp_freq_scaling_rule curr_rules;
> +	struct atomisp_freq_scaling_rule curr_rules = {};

I reviewed this and the original code is fine.

.isp_freq is never initialized but also never used so that might be
the confusion?

regards,
dan carpenter

> +
>  	int i, ret;
>  	unsigned short fps = 0;
>  
> -- 
> 2.53.0
> 
