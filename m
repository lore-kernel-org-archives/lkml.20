Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794665807;
	b=M00Mx7WQLdEo0H+18JRwCZ17NL5anc1a9vSDMu/Vvdugm34W+CvgkRNSxlpLAPQoOot3
	 R9R8fYQGYwEpOESpBkjkX2Z8+ScAkmCMEl1mbGavSYxqjTa5iL2l+VE9XKOvPXyB89gJZ
	 YsV8RytNvYqHNNqfhBE7wyCDPB+PAMDmq7QLpaYj+kHrg/Q7paE6ZP3er0REULZEZ17wM
	 h9Xh7YMK6F2TYLaBtKiz84xdAypPpc3H9RIZnG6260CjqssSXrK5z/nkYXN6qqGMYH/Y1
	 IpgdzpMi9euYZXpBtoiuJHTLWz83lJ9GSD3ftXW4zZW7FeCiDSTEvpQr6BADcPuZg4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794665807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Rsh3PSgy5EeLZfkj2Ume/HSuLoP9g7O08oXc9D5ZzEE=;
	b=pHMPYJDRaUHsO+sxh/Ah9B63KJkEb1n/S357Pmc9MO6t9d+hR96I6cuxLPR91/nMIHcx
	 cEQU06EjdNrF97dTY+/pQjd2+ijf0Y2rkK1zJa9h2UekPcG7dE0HeTIVyDHI2+nuNOa9R
	 FCTS95qjStNtCq9+eFpNTnpzoTmRn1D6ZaG4w2KShwo/3nHtUqlv22RFdg65jWVFPAaQD
	 9OCh60F7sbAdhLY0Beg0sW0lTjpoDStGON4EPsp0/cRWPfrkA0KrmYKEgGtVOe6Rytfz4
	 +/jV8C8InXzcZczWCJLDWWXGYaagwLCzN0ktWpUcMKR8ThLK1Y5HTycZiRSjLLM51mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0c5nFMdk;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23A1606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B23A1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0c5nFMdk
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b18717a193so1063555a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794665806; x=1795270606; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rsh3PSgy5EeLZfkj2Ume/HSuLoP9g7O08oXc9D5ZzEE=;
        b=0c5nFMdk+yWbf+C71VnSAz6BsODM7dxwkDZmx2JZm5IkItwZpYWzZfIvg6VsN8404b
         HTmIIYJuqYP2sCa26kYtaDGmw6/fSO7ma0s4eNBzdDrUw3NI2mgBJn6HxyZACOODKRbJ
         bBZJb8UzWt3pXG97XUG3hFsbegZjKtfiU5HgKEYcOGj1LdurgttVu+PCFtUoacel/GXa
         zKWYHFe572C1e/q2OkehmmkkAFBLAmY6X/Qu0lQGzE+2FU6SrMxsAsjFV+jPxQNxVGMJ
         kxtKQovgbBec4A8Y6J4uilYZFLQB1yzzBSyO3jfoToPvImCHJOga22LziUdcDaYNuwu1
         5aCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794665806; x=1795270606;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rsh3PSgy5EeLZfkj2Ume/HSuLoP9g7O08oXc9D5ZzEE=;
        b=0Aggc51/2bwsfT9QuRMVUQTsxdqMsaxP6NanK0dxkSMCrrtSSe7mVdVnBh+e3HRe6H
         gmJaNhWfGyfr+SE7G7+j+6Iz2AT0uXn1MN9Tjd/Bfpt3wIk/epZqYiF+4KNful9QYJD7
         ZtlQLzsgs6rkL4bet/dinvBDZb09cwbhimHozNqaIrpW+MUg1Tf4462r+Gh4YRieAehe
         B5HfDq9yHYa4affVAakrAR6o4jbdw7buWsR3lq9eSE07MAEQ2KL+ynqhJ4yn5heQq1HB
         42ZhFkNG7skb1FazA3yqNBasPCOMHmn6ffgObYt8obuIlfLJppivsHXg1FFo2zmbx2Wn
         bEqQ==
X-Forwarded-Encrypted: i=1; AL+hErGCobqIVOIzPLRFn4whyOrrwvZmjeS0BQddsN79mrjLYQ/MZGAWKc7LeYkePpmYyApCqCfL/Tyv1866yOA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8h0AKqojbbmEirLd3ZjgNVQfSHwCqEt5s/1L4W2APl7Xz6gzIp
	rmfOfv2DNOw/USNFxC3RV0VmnnVAy8tAJoixpx9y8JFIDsT33IXRWahHByopaIXZ
X-Gm-Gg: AYBFou29/2cMRzQnSObgeDxZdLdhxE+t5/q/aAgYKL6k95DG55n8azJhQc9Q7pYToET
	Jp8T1v1zV0fJX10GVb0iLF90ZUJ7tlcF7ylQwHnGBaulG3PBeqi7wUTSJdQ9r2lsYxlMYaz9pcw
	F0yx+vOE6WCbse5uO+Jd0LBR42BRMECkgwVJ3jBpS/V8AAr5BI1QrLxXHQm7x55FprZJs2ytCD5
	hjonP/hw0aYTku3ppZ+YgV9RaRLc2ajeVAYVs/q5k/sAfO/rhTAnz+sgkWc7PTLLgJXrQZ/GrSp
	WGPMpVkDw5q1kZFq5qf8HKM04AVM+RLfl3GLhtQoiVLA/6B1HG5Q6LJCpDr4E8UX4rdNF2s9NjX
	sDOjr8X9k2fNs4R8Z6Vhn8GNvmF5h/ea2Fy4IJ023y0n3fXCGHU7sdsumLIw+isiKel5SQmviTD
	zzVeERLHaKDfT5q3OwF2HQ8hRoyxX6xha5mpFkPHUGsMkZ9YaUtF/8Zz0B+SPnSlhHLHjM9XV2D
	ty3mrieUvNqkKR2fT3BPg6i4grg5ekCSTPp6ZcLhjwboQow20ymxRmZnd07ZKPAdL9oIyKaXR/2
	KjkH5gl5Au30mOKZKLyY3bce7qKtt5r6tCyrtegJ0CdQJH/heTq2NhE+tx4TvjVw9xc=
X-Received: by 2002:a17:90b:440b:b0:3ac:adce:60a8 with SMTP id 98e67ed59e1d1-3b1b07ef8bbmr5367145a91.5.1794665805884;
        Sat, 14 Nov 2026 06:16:45 -0800 (PST)
Received: from [192.168.35.40] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b245f0c3sm4377768a91.0.2026.11.14.06.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 06:16:45 -0800 (PST)
Message-ID: <94a65d65-e81f-4942-b119-51b71e8eabb4@gmail.com>
Date: Sat, 14 Nov 2026 23:16:41 +0900
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] PM / devfreq: governor_userspace: Guard against NULL
 governor_data during switch
Content-Language: ko
To: Finley Xiao <finley.xiao@rock-chips.com>, heiko@sntech.de,
 linux-pm@vger.kernel.org
Cc: cw00.choi@samsung.com, myungjoo.ham@samsung.com, kant@allwinnertech.com,
 kyungmin.park@samsung.com, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, tony.xie@rock-chips.com,
 huangtao@rock-chips.com, stable@vger.kernel.org
References: <20261022022109.642339-1-finley.xiao@rock-chips.com>
From: Choi Chanwoo <cwchoi00@gmail.com>
In-Reply-To: <20261022022109.642339-1-finley.xiao@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/22/2026 11:21 AM, Finley Xiao wrote:
> The userspace governor is the only one that uses devfreq->governor_data,
> allocated in its DEVFREQ_GOV_START handler (userspace_init()) and freed
> in its DEVFREQ_GOV_STOP handler (userspace_exit()).
> 
> When switching governors via sysfs (governor_store in devfreq.c), the
> sequence is:
> 
> STOP(old) -> df->governor = userspace -> START(userspace) -> userspace_init
> 
> Between the df->governor assignment and userspace_init() completing,
> governor_data is still NULL (the previous governor never touched it,
> and the core does not clear or pre-allocate it). During that window,
> asynchronous paths that call update_devfreq() outside of the driver's
> control -- the OPP notifier (devfreq.c:686) and the pm_qos notifier
> (devfreq.c:707) -- run devfreq_update_target() under df->lock and reach
> devfreq_userspace_func(), which dereferences governor_data without a
> NULL check, causing:
> 
>   Unable to handle kernel access to user memory outside uaccess routines
>   pc : devfreq_userspace_func+0xc/0x28
>   lr : devfreq_update_target+0x58/0x158
> 
> Add a NULL check in devfreq_userspace_func() and fall back to
> previous_freq, which is the same behaviour as the existing "no user
> frequency specified yet" branch. This closes the race for all callers
> since every path ultimately goes through get_target_freq.
> 
> Additionally, take devfreq->lock around the kfree()/NULL assignment in
> userspace_exit(). Without it, a concurrent OPP/pm_qos notifier running
> under devfreq->lock could read governor_data after it is freed but
> before it is set to NULL, constituting a use-after-free.
> 
> Fixes: 5fdded844892 ("PM/devfreq: governor: Add a private governor_data for governor")
> Cc: stable@vger.kernel.org
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> 
> Link: https://lore.kernel.org/linux-pm/20260723080806.1451-1-finley.xiao@rock-chips.com/
> ---
> Changes in v2:
> - Add Fixes: tag and Cc: stable@vger.kernel.org
> 
>  drivers/devfreq/governor_userspace.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/devfreq/governor_userspace.c b/drivers/devfreq/governor_userspace.c
> index 3906ebedbae8..f7a485c43fd7 100644
> --- a/drivers/devfreq/governor_userspace.c
> +++ b/drivers/devfreq/governor_userspace.c
> @@ -24,7 +24,7 @@ static int devfreq_userspace_func(struct devfreq *df, unsigned long *freq)
>  {
>  	struct userspace_data *data = df->governor_data;
>  
> -	if (data->valid)
> +	if (data && data->valid)
>  		*freq = data->user_frequency;
>  	else
>  		*freq = df->previous_freq; /* No user freq specified yet */
> @@ -110,8 +110,10 @@ static void userspace_exit(struct devfreq *devfreq)
>  	if (devfreq->dev.kobj.sd)
>  		sysfs_remove_group(&devfreq->dev.kobj, &dev_attr_group);
>  
> +	mutex_lock(&devfreq->lock);
>  	kfree(devfreq->governor_data);
>  	devfreq->governor_data = NULL;
> +	mutex_unlock(&devfreq->lock);
>  }
>  
>  static int devfreq_userspace_handler(struct devfreq *devfreq,

Hi,

Looks good to me.

I think that it is needed to lock  on usrespace_init.

diff --git a/drivers/devfreq/governor_userspace.c b/drivers/devfreq/governor_userspace.c
index f7a485c43fd7..cfbd72892598 100644
--- a/drivers/devfreq/governor_userspace.c
+++ b/drivers/devfreq/governor_userspace.c
@@ -94,7 +94,9 @@ static int userspace_init(struct devfreq *devfreq)
 		goto out;
 	}
 	data->valid = false;
+	mutex_lock(&devfreq->lock);
 	devfreq->governor_data = data;
+	mutex_unlock(&devfreq->lock);
 
 	err = sysfs_create_group(&devfreq->dev.kobj, &dev_attr_group);
 out:

