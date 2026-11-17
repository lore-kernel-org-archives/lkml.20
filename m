Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911672;
	b=cBDMNMcHEYBu53duYWFXgt7iFRpM6dO08HJudF0oecCm9ktp3XV8wQW7MikTRhfW67jT
	 LcU3sENc5wHFQCw5JoTDaHR3JJs6saaiXOBx8UGTvtk5Ra8hKV38Ju0emei54x7wRPGVh
	 oygrsXsEQohLkNDcMPwG++PzgygS7Db3rJgZTxw5XySO0Q71FcRza5/AvJOjJJYacpwK3
	 bGGqUq6uTCLs+J4HUl/wV3oINbHhEqt1AEAjW3k0aBmZwS+LaKoEBbCxhGNhqahTUoCbz
	 cqyga6m637+wK1CSB1BxAtYucDMFQbp3YN/YgfZVTMscqsxweMI753lvtd7SBhRETfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=BmiLk7Woyt+5HnggThSiC1LBGvT5JbyN4EymqDd4Y40=;
	b=g6UIhi/Y6YeAfENTrELrgxvXdDoWE+/8pFNhg0f9Qh1B44kaB0Os6iD/UOEoeTuVzHzl
	 65UQegIFywFRrmA/w/x0EaB+EsBHS0xBV5kNIkQU7vNcgVYtHA6YkmC8yUbLerVqY3nMf
	 DYlPKyzWDpfMyns0hq7qiVpSGXBI1ZpplqGROwJao4q+jk5kDXXonJtP2lHPy4mvOWe3t
	 QdpDbf7pw7klSZSVQpiIK+wJwl9/TW9WPoR8gNhc+1Mgxzb9ny6uiQ5sF3EzPGP9feGce
	 f06k7TaBqsvAQOIo5IM7DP7nhkuvKQ/fotJabaVqq5O1eyWbEowNPz5xhpSJVhKX7zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=En1EFsdr;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6E0606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:34:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA6E0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=En1EFsdr
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b24f4b15c4so209042c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794911670; x=1795516470; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BmiLk7Woyt+5HnggThSiC1LBGvT5JbyN4EymqDd4Y40=;
        b=En1EFsdrdIkH9eyOkefMREOOPdHM/WJ+nB7do8MFPGS2RFE46buqsjhkuWVzuC8m3+
         3gF/6S2D7s5EKUEATZ4QiaqaxVW8vxGRVrNqRlv0ezJXermBAeEXcKla4/EuExo3AGhx
         744hX1dAhanRL4MRxPITaiF1pZc7rjSKVLZmLgqQPaxwG9QHuvi2XbBzY2z/Oz+c8clw
         w9aV/YcX9cHZDqQ7JoiLvJYMcZUoztZLy/qKIKtof7mobdWmjRX/Xb605HQRdDqW74k6
         TMi/qHyRczbrpjgMZe7BkgoUBqZIoFt20gqXXVyuC5UnYYSFfLMRBcKyYryrj3FhAjnf
         j83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794911670; x=1795516470;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BmiLk7Woyt+5HnggThSiC1LBGvT5JbyN4EymqDd4Y40=;
        b=iKNBTL/HIYZhK6EXB/PrdJgZQGH5PmQ+z6AiexUYXkorz6AOvZHIO+MCvENXbAVzqs
         BbvLCrZB+CGSKN7BfCawNvHW148RLBl55o4kFEnNtrwim03WXyt0mIUKHrelEHyVv1/6
         4MwaGHxH8KknjpkPsBwgDXOv6JC5YzvbMl0HQ222qPGqS5sQSJIuc9ljyBTMSm8a5orq
         hGSKa+QC40QWOX1sHwZ0+i1syQR8ujX71dgUVmiTMvqmlZyXJDgP6tEAfEqDai3Cn0iQ
         IaB/mno/3xM8RtZt6BVhIcFTpTdktY5o1W5vy+zq4OIoBOjT/27QHG2KDeSahUA/m7mJ
         yjYw==
X-Forwarded-Encrypted: i=1; AL+hErFUu2/cGmjagfhjE3JWz9mIwY/h9CI7UIroY3j7A+H3sbpyMDtsUAvw78yNpHTl7k1m7+/tplTAwHsvSjg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8r6zzf1PeVarkAHWGu8msmBIb66TpELKjKChJFTEPlwPA9/6cW
	5CdQbGClKcLZhTNuAFWxvU/7qmC4VkotzbpY055luLT73fgoho8g5tDx/eNNjdukUyo=
X-Gm-Gg: AYBFou35tLze9vFo/dCAa7VXiCWDotI+EG2WmIZaw+jHIPpRIFWPcHM5l3Dy8ed8NGs
	mBu1/OgcUOUw92XYWvkIWj4vr/KPQ5SkgfcpiozIemGT8VKH5fszP48UdJ4xPgIA7WlDUkMy7ne
	uiDc12h2i6KpaO1Q2an/9IdV3GL8LEOpwcznKWd+YYVLM8uWetX0u0bZzzYMMuLbR0bYgdGaGyr
	f9KHbsRYYiyOLt/zMFxHvwUtuHF+b6P/P7S32s6nOTWouLQX/T3PGSFnjtJN1vNuEDEZGHRFfmP
	Bm6TbgqAt8Due53HuIYsaOoQmVix84OmT+qBSz+xrmLg/UEGMdBhKN+NWB/PDxb3uRonXSpu/Ia
	lolBAVM8k5DmQUnwp3DLn8CgUphjdud9JyT4tb7/BTL8yxFUSCFcT4ZDaWVCJepIrCYbuQekZXa
	x5+bEGq77K7uRqOtwWYHT6FsIxQLUFuIodK6xGFaPklB5niF1K1QsvSeG1TvG9566buKwjotVw5
	YMeO2kgfUbAbjx2RNiovHNPUtSAt0JB/QDsCCJWlS0B4HOrrA3hegrX8g07WWqQxJDhYLs74Bbj
	ukYBYvROFjWTfcRJsrdTK3iks2IfAw==
X-Received: by 2002:a05:7022:b052:10b0:1b1:f02b:2317 with SMTP id a92af1059eb24-1b53a4758b9mr1979699c88.22.1794911669662;
        Tue, 17 Nov 2026 02:34:29 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b2519sm36212362c88.13.2026.11.17.02.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:34:28 -0800 (PST)
Date: Tue, 17 Nov 2026 16:04:26 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jie Zhan <zhanjie9@hisilicon.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Oleg Keri <okerixx@gmail.com>
Subject: Re: [PATCH v3 2/2] cpufreq: fix policy max not returning to
 non-boost freq on boost disable
Message-ID: <avwtsmp7Mqacbbtl@vireshk-B250M-D3H>
References: <20260929-schedutil-boost-frequency-handling-v3-0-68de169498c7@oss.qualcomm.com>
 <20260929-schedutil-boost-frequency-handling-v3-2-68de169498c7@oss.qualcomm.com>
 <auhMD2-5FD4BqImG@vireshk-B250M-D3H>
 <avRiWsxCEAuBouBZ@hu-anancv-blr.qualcomm.com>
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
In-Reply-To: <avRiWsxCEAuBouBZ@hu-anancv-blr.qualcomm.com>

On 11-11-26, 18:10, Ananthu C V wrote:
> diff --git a/drivers/cpufreq/freq_table.c b/drivers/cpufreq/freq_table.c
> index ea994647abc8..5b364d8da4f9 100644
> --- a/drivers/cpufreq/freq_table.c
> +++ b/drivers/cpufreq/freq_table.c
> @@ -49,15 +49,16 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy)
>                         max_freq = freq;
>         }
> 
> -       policy->cpuinfo.min_freq = min_freq;
> +       policy->min = policy->cpuinfo.min_freq = min_freq;
> +       policy->max = max_freq;
>         /*
>          * If the driver has set its own cpuinfo.max_freq above max_freq, leave
>          * it as is.
>          */
>         if (policy->cpuinfo.max_freq < max_freq)
> -               policy->cpuinfo.max_freq = max_freq;
> +               policy->max = policy->cpuinfo.max_freq = max_freq;
> 
> -       if (min_freq == ~0)
> +       if (policy->min == ~0)
>                 return -EINVAL;
>         else
>                 return 0;
> 
> I am pretty sure we can maintain the policy->min status quo and only touch the
> policy->max updation; which from a passing glance simply seems inconsequential.
> Potential side effects, if any, aside, this would at least fix the issue at
> hand, which is the frequency getting stuck on a higher value without being able
> to come down. What do you think about this?

So a change like this also fixes the issue ?

@@ -49,15 +49,16 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy)
                        max_freq = freq;
        }

        policy->cpuinfo.min_freq = min_freq;
+       policy->max = max_freq;
        /*
         * If the driver has set its own cpuinfo.max_freq above max_freq, leave
         * it as is.
         */
        if (policy->cpuinfo.max_freq < max_freq)
-               policy->cpuinfo.max_freq = max_freq;
+               policy->max = policy->cpuinfo.max_freq = max_freq;

Also, can you please explain the issue again in detail. I am not very
sure how you are reaching to this issue over current mainline (without
the first patch).

-- 
viresh
