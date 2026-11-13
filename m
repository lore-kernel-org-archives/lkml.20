Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794539991;
	b=a/seH2x3Sdg99k82yqRpDRYwvlGRQHVoB1VRXVTj2KB3lAXdVhOjqbnk5IuL9bQL5Kwe
	 W88vvdtJxhwt5Kk3Prlk6yWQl6KrpjrdNx7zCvZ4J7t901qkbHFHD9Xb6qaB9IthbQ2fJ
	 lB6x5kHfwnZhiJogV6rv5Pr1lH5jpejedrVlAqgFsZiGBLQ2Umb60Se3Fez8UjXbljzSz
	 4rToP/BZEOn88DQOd6zCav028MPdVFRxRY0Aj3n0dp6wo9jeYULKdKh3OPLKhtfyZRNNh
	 gG69QhVW4nQWfFxzigV/gYv3vDE7jgEkPfzoKwqf53gvsknXs4vAfLUsit14QFNpyHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794539991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=voIys8EwQkhUIwCPX9c3iOQmu5IoCkbo4OFDmG1MZKU=;
	b=oyoqCJX/xobERDt0VjgCMxIUX5QBThFeFqS0F/LhCE3SLbaMvyTUyGuN9HFiY5GvwfRE
	 fMKAdG71TDX7miAg+NzPr0r/QE7tc6muPYYr948lteexsiuAVdeQCUWL23tVUZw3hlaF0
	 ZAGRdR0d8OiIgd5fSpfT7HYhKDqSeHzn+GGQQ/VYWKirZPISRHVlel7vr+ZoRI6FrK8Fp
	 xyOEfk1YfUskfD7vuuSxAeoYumwGJJCcTOz/skhDknwQ6gwlhGg1nynahY8f9lNng0etO
	 UxiKhIgoH5/2P24MzHLEnuH533otXQDA4dWQi/odMq/p7Q5gkw1hCmdKb6NADk9EQiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=inbDH7TG;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE4F606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:19:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AE4F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=inbDH7TG
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a070781f63so184500b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794539991; x=1795144791; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=voIys8EwQkhUIwCPX9c3iOQmu5IoCkbo4OFDmG1MZKU=;
        b=inbDH7TGQaS8YIhofdyopjaj2vvIPI0MTAVjELPvx6T6yv1rExDdkos8qLpXEzBV8s
         rxjjuabXt9Yk1UQfzs/6nVzU8OqKotcTOuwtPs6quzFFqFvd3g26xehO7hCtbIFbEHvG
         XzrnV0CaAiiDqw5y2bz09mWyTLLB4NlNw5oW3Uat+GXEqGRxgb0M2Z2FLdgXGNsKljLH
         10Uf8DjwaXdkPK93j0BNkU2N/w3iGR3O+45l97ydQCR6qVMOqmYat9Sd6tFFdycaJT1n
         sFDsiOm51XoRPLfzQWd5DVgadoQCH+7WGh+zac5y6UpmlEMd2ZANkGOEff2vVS9TWX0u
         R75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794539991; x=1795144791;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=voIys8EwQkhUIwCPX9c3iOQmu5IoCkbo4OFDmG1MZKU=;
        b=y/DBTuiLSLMknYhRhvyRwSnXM1ARdcaMXk+t+TNwlETxtlcc2RFLbb9cajtNIgsXt3
         GCdVLi+Ep7hBlTAuDyh3xBDmy+b97uRKTBNWCbmRugcuuxBY/zkzcHgXWVqPyhUolxae
         pKH9PK637ykCdSA3J8kHexp2/xKpSUZf+GjRJQ0+nup7sVMbN079VI9wTXMH1PTp9nSC
         Nwj6df7Y4FjLKRNBZJF2grdKQdNyH3fjWi1cXyACpB1S+QHsJLkyhnA5JbSzjsseMFLg
         MZbbgRJPV6senyBViINLKqxZ9Q+4jqlkNuvbk4N0MbEgO7qKyemSXmgGQHJujSTylgS/
         7TRg==
X-Forwarded-Encrypted: i=1; AL+hErGust2KrZs0uGJ4d+4+5EkwCC7R/wVDnnnvDnFWz51stMtT5AjKJfOy/TiKrE3i9Z5yihPoffOWclQ7JIM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vQBVKx+QFnqxglVdcJ7ZlYQCeR4IiPKoP6V5kTe7mvyHRm5Vs
	I10WSKlswk5QhqCIGnFc3OtOhwteP17i9FJIod26kLx8RRLRti8/N0zh
X-Gm-Gg: AYBFou1xwLQxAI24axirhdpPupqb6ywf4YGn3staxdW3ibF5QLpNWHwWm73aX46aX3/
	k/JTdngNqikar+LCn9uFbQSke3CE8dGPeo+5dKrMTjYjEQ16Jw2iM/sRF+5+idSD6/4L5rl8CBe
	zCer+5YTHB6fx7fYPSJ5CmAsak3EFbUNBzf7k7fTYXLfqdCFTgf3R/0h26tJnJUCgzUaa5sUKjo
	fxpXVTq4zzcaggxhwDTl/RVRwH2V+ncTBy7FW8BrV9e/AkbA+iCbeZgExkTRtGiMp4DRlK1J8I2
	uBavsgDCIvClmXnc4FdkhXO8llGK/iyCsrORJDzM2NXTH52dEyAJvR7gXzIcya92dBWi4LeArKR
	a97WTz1IiVzeUGP9oaKq4kn3TBNFB2RFgHxRuVBCGkJfNf4gVl0Pf1cnfIvQR7IRSUDgTW1QPZT
	cD/lJRLep53MDg8YEFnhjO10O5G9SwdWRQdqRLsljWCdGc7raCe1Zc2DJBMw3aC7FmKgwC0Z+Rg
	0ysyfUrjl38zzM1Uh3hPUug4SJnjbQ3SW7Jtq2F8DM/kbptBup/9lTR2U076I8wZRhsXtMVWMSh
	ivLTQROyt4kJgadMj2ccuUZHtIaAws/ez0lLQr5z8TCuAdJ1
X-Received: by 2002:a05:6a00:1989:b0:89e:33ba:54ce with SMTP id d2e1a72fcca58-8beb753d177mr1447093b3a.46.1794539990691;
        Thu, 12 Nov 2026 19:19:50 -0800 (PST)
Received: from rigel (106-68-220-184.tpgi.com.au. [106.68.220.184])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed243e643sm388162b3a.42.2026.11.12.19.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 19:19:50 -0800 (PST)
Date: Fri, 13 Nov 2026 11:19:43 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Adrian Ambrozewicz <aambrozewicz@nvidia.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 5/5] gpio: cdev: don't overwrite the whole flags field
 when configuring lines
Message-ID: <20261113031943.GA39484@rigel>
References: <20261110-gpio-desc-flags-atomic-v3-0-2f463bce8086@oss.qualcomm.com>
 <20261110-gpio-desc-flags-atomic-v3-5-2f463bce8086@oss.qualcomm.com>
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
In-Reply-To: <20261110-gpio-desc-flags-atomic-v3-5-2f463bce8086@oss.qualcomm.com>

On Tue, Nov 10, 2026 at 02:47:05PM +0100, Bartosz Golaszewski wrote:
> linehandle_flags_to_desc_flags() and
> gpio_v2_line_config_flags_to_desc_flags() read the flags word with
> READ_ONCE(), modify the local copy and write it back with WRITE_ONCE().
> 
> The per-request config_mutex does not exclude sysfs, the irq core or
> drivers touching the same descriptor, so bits they set or clear
> concurrently can be lost.
> 
> Build the mask of bits owned by the line configuration and their new
> values locally and apply them with gpiod_update_flags(). The whole
> group changes in a single atomic step.
> 
> While at it: rename the functions whose semantics changed from
> "conversion" to "flags update" accordingly.
> 
> Cc: stable@vger.kernel.org
> Fixes: b7adfb6076ff ("gpio: cdev: update flags at once when reconfiguring from user-space")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Kent Gibson <warthog618@gmail.com>

for the series.

Cheers,
Kent.
