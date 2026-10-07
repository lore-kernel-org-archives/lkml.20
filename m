Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5944AD7FA
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 14:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791383334; cv=none; b=hoZ2Kxryj5KPW80h+6+89bRc6Ff6vgBYM4NL0shNCcju7HeC5/tBVN6tPbLbNzUf7ejCf2L+kGtgnz29vJTqP2e2YQ+Z/5OHMLnglSoUNHsxTr6UI2Txyu+qEAH1+TZM9fln7HD3aQwkyATKz0dPlctbSl9rpc82bNLk76/+VcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791383334; c=relaxed/simple;
	bh=KVQ5MgRmaQYYQf25j/wqXLwVGYvs2wwXh38dzhL7l3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sT/cWAH8gYzyyHDvmkHGFL0dLykmIVsm7RQmPRsiA5Y9ogp25XrWYnAWxubmE10STGCvmQFGjZvKCU+OmXk7fAGmnxDV3JobsyMegrewr6+O3fgjuw1UMdfLpOCSmCmdJBEaeZNrVaL2GI444Hpg9RXEhgLmCGhinYARENCZelc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=KLdsr+bN; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="KLdsr+bN"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5338c1197easo33305451cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 07:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1791383328; x=1791988128; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=95l/b3hRWMzn0R2We8bkKJczOlV+bNp1xvkg05eCbus=;
        b=KLdsr+bNMeDJukBCVzMwHcunmNKL51kFNNOuiSmw61Eybt+CCyOhKTlajlrZKQcEJj
         vVgDM0Em3ScfAOnHuxpFOKcNSpD+r+mDs3xr9j9FpgcIwWis0W7j1mTl2M3hd9Vy01H7
         ljEEaIGIGAXltPdh9E+WgG/FboWiD5JDj+jmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791383328; x=1791988128;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=95l/b3hRWMzn0R2We8bkKJczOlV+bNp1xvkg05eCbus=;
        b=jbepyY8ftpO2k24993DWWOjypcrcGoRqkMBO1YfPjMLe7BET2V2eyPN9dqRxu1XbXq
         15hksbJRK8ARaYW3cyh2PZVL1MwWRd+NVdLCU2iTLrfeTiowFvSAMWk5M64n659jqg2n
         k1U6j9Z8cAslSbMAQODFj+KFyCDaO4Sjv0wOfVJKEegc7kJ96XMEq1cOWwAxy5UbtXKc
         dhH5Hm10VaIqKR2/tYKDfQoGuYmIPfZBbr1klRkNsmBfhIw/K8jqR1Ddd0iAMqHveIYs
         587yzEaWs5UAL82hLUb9th4VjtxeUb/07vcT03TM+TOv7t3Q2OUq2n7+cN6NQaoF+i8A
         IzYw==
X-Forwarded-Encrypted: i=1; AKwUvBw5WROYyMMqCf0obWT9pUhcbiTrkE7oha3GGon6wBn8ndnCo/Ut+i5lF/Zaa6SI9lvPXreuoOQkwr0q/Ew=@vger.kernel.org
X-Gm-Message-State: AFuF++kPpaylYdXv6PgTzGUYNlWLC0yfBB4PkFTS1LnlSpS+kTSx1MXp
	t1EcOeMe2vyJF9kUuFu74bdg4/GEivSVJRXB4Ch+y/5qahkfsquxnFpHE4BZQKnFqg==
X-Gm-Gg: AYBFou2MW/otbliV54blLMK5PjGidTQivjn24A4hVrn5LK0iZaBd1wPk3ZzDNHQFjp6
	qxCECUqxUFnwUaynX7RTbMjFyaUrLMtru5bELgXxt+kWyLFy9aw6EFb5eq7uAE4Dk5WhedqibRm
	VGXdzXKqWTkM5jfq/u2BPfaQMB4eHUwD/VGwwKAhgcqg1Eda9+6z+gzKG3cd/kxwkh4+Eeg1s3S
	DfWUpR5UM19ZcTXxFGnf5k1p+7ci58bglaYNDkIrOPRsxZySCZkfvv+lPcgMHfhTbunlHJRsoWf
	tHeBnJ0z7w56ewtbs1ysVQLU0aLMKIK/37Az1/rNSsTeLK8GKD3ZpWJk/w+s4XbsfOFPrQxf80/
	QKF2zTVaR98VpPMyeFYARv7sxDhUeYzeVmkmc+QRTU1cFR5Nkwsnv3xu0KPT2wJICcEcqClTi4O
	vD1blk7KQLU0225+lvMbVBmhsG6PCjgjU33nEfuzA3axA+WkogHbeJCKWAwNow5RHIZH5XmEdWm
	HGY
X-Received: by 2002:a05:622a:2512:b0:535:d7e:dc4 with SMTP id d75a77b69052e-535753b8838mr37078081cf.19.1791383328200;
        Wed, 07 Oct 2026 07:28:48 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id d75a77b69052e-535721ec7b1sm21527631cf.30.2026.10.07.07.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 07:28:47 -0700 (PDT)
Message-ID: <5b4a1156-d05b-470e-952c-1958982f5ae3@ieee.org>
Date: Wed, 7 Oct 2026 09:28:45 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] greybus: Discard pm_runtime_put_autosuspend()
 return value
To: Brian Norris <briannorris@chromium.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
 linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Johan Hovold <johan@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
References: <20261006231900.3230373-1-briannorris@chromium.org>
 <20261006161337.7.Ib0925681ca623093ddf812cc4de848e10ec07c73@changeid>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261006161337.7.Ib0925681ca623093ddf812cc4de848e10ec07c73@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/6/26 6:13 PM, Brian Norris wrote:
> Returning an error code from pm_runtime_put_autosuspend() merely means
> that it has not queued up a timer or work item to check whether or not
> the device can be suspended and there are many perfectly valid
> situations in which that can happen, like after writing "on" to the
> device's runtime PM "control" attribute in sysfs for one example.

If I understand this right, "put autosuspend" is basically an
unconditional "put" with the assumption that auto-suspend will
ensure the eventual suspend occurs sometime after the reference
count reaches zero.

> Modify gb_pm_runtime_put_autosuspend() to discard the
> pm_runtime_put_autosuspend() return value, change its return type to
> void, and update its caller in the Greybus power supply driver
> accordingly.  Also drop the redundant pm_runtime_mark_last_busy() call
> from gb_pm_runtime_put_autosuspend() while we're here, as this is
> already part of pm_runtime_put_autosuspend().

I support including this fix in this patch.

> Note that this resolves a bug in the power_supply driver: in tracking
> 'gbpsy->pm_acquired', it erroneously assumed that
> pm_runtime_put_autosuspend() would not release a refcount when it
> returned a non-zero value. That's a false assumption.

So is it safe for this code to assume the reference count has
been decremented in this case?  The comments say we're trying
to ensure there's exactly one get/put pair.  (I don't know the
reasoning behind that though.)

> This will facilitate a planned change of the
> pm_runtime_put_autosuspend() return type to void in the future, similar
> to commit 3afd8df02433 ("PM: runtime: Change pm_runtime_put() return
> type to void").
> 
> Signed-off-by: Brian Norris <briannorris@chromium.org>

Despite my questions/comments I think this looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>
> ---
> This patch is independent of the rest of the series, except for the end
> (changing the return type). I expect it can be applied by individual
> maintainers, and we pick up the end once the dust is settled.
> 
>   drivers/staging/greybus/power_supply.c |  8 ++------
>   include/linux/greybus/bundle.h         | 12 +++---------
>   2 files changed, 5 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/staging/greybus/power_supply.c b/drivers/staging/greybus/power_supply.c
> index 44bd8a72fa50..beefcbaf3681 100644
> --- a/drivers/staging/greybus/power_supply.c
> +++ b/drivers/staging/greybus/power_supply.c
> @@ -377,12 +377,8 @@ static void gb_power_supply_state_change(struct gb_power_supply *gbpsy,
>   			gbpsy->pm_acquired = true;
>   	} else {
>   		if (gbpsy->pm_acquired) {
> -			ret = gb_pm_runtime_put_autosuspend(connection->bundle);
> -			if (ret)
> -				dev_err(&connection->bundle->dev,
> -					"Fail to set wake unlock for none charging\n");
> -			else
> -				gbpsy->pm_acquired = false;
> +			gb_pm_runtime_put_autosuspend(connection->bundle);
> +			gbpsy->pm_acquired = false;
>   		}
>   	}
>   
> diff --git a/include/linux/greybus/bundle.h b/include/linux/greybus/bundle.h
> index df8d88424cb7..361a94d3499b 100644
> --- a/include/linux/greybus/bundle.h
> +++ b/include/linux/greybus/bundle.h
> @@ -59,14 +59,9 @@ static inline int gb_pm_runtime_get_sync(struct gb_bundle *bundle)
>   	return 0;
>   }
>   
> -static inline int gb_pm_runtime_put_autosuspend(struct gb_bundle *bundle)
> +static inline void gb_pm_runtime_put_autosuspend(struct gb_bundle *bundle)
>   {
> -	int retval;
> -
> -	pm_runtime_mark_last_busy(&bundle->dev);
> -	retval = pm_runtime_put_autosuspend(&bundle->dev);
> -
> -	return retval;
> +	pm_runtime_put_autosuspend(&bundle->dev);
>   }
>   
>   static inline void gb_pm_runtime_get_noresume(struct gb_bundle *bundle)
> @@ -82,8 +77,7 @@ static inline void gb_pm_runtime_put_noidle(struct gb_bundle *bundle)
>   #else
>   static inline int gb_pm_runtime_get_sync(struct gb_bundle *bundle)
>   { return 0; }
> -static inline int gb_pm_runtime_put_autosuspend(struct gb_bundle *bundle)
> -{ return 0; }
> +static inline void gb_pm_runtime_put_autosuspend(struct gb_bundle *bundle) {}
>   
>   static inline void gb_pm_runtime_get_noresume(struct gb_bundle *bundle) {}
>   static inline void gb_pm_runtime_put_noidle(struct gb_bundle *bundle) {}

