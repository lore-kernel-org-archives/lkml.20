Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB443ACA48
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787896984; cv=none; b=BQX0s23tWfzy3MqMtf99m/3aWaRHIl81Fus2XjmKjfYCWzn1lv3qSkq+oBx9Oz94fNPNUvi5x1CRD0dWfvlhB3BlCocP0IxfDg8mNXS9GxSwvGDmpNP49IM2KNVBeED7J/6/IXlbKA87fuioBmcgbKrmYyFOubouYmWGkx/os/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787896984; c=relaxed/simple;
	bh=r8Yyj/B0psBPnsbPoRoLJhZOA+rZ1pswme91QS9W8H8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LCb42QQZWpQKu21BCy0KchG2F4F1zqUdQoi38TpzR0jkzIq0cM7DZdkmvk6viarvh6wa6cYRYTAlnk/b2Htf9cGLYWxiZDQZhqvzta5o25T8XuKJw7hJJxIZO69wLS91Wq45mud3hJ7S+KSPk/tBpxfRvlCdFHWw/OLmDTC5HYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oO0KD19N; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oO0KD19N"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc1bcdb3c4cso516694a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787896982; x=1788501782; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ayElgOjba/J4lXi4vpvSYn1UEyGu20arfi9trmZff0w=;
        b=oO0KD19Ngly+8+x7jdiCC4TQ33pr7Bj3ZP+xHUQFKFPaRTwh2bSLfq13aV2rv9ND5V
         6WrJ4LAr60Ce1Qn1P9yjTfN63iTHi5xjAe1iz6UbiKPNDQqjBIVrNeWiW6rZhAXoa3+x
         YlVicmmKT5/biQtuhtc9o5aDuge6RWmBWEdzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787896982; x=1788501782;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ayElgOjba/J4lXi4vpvSYn1UEyGu20arfi9trmZff0w=;
        b=RIom7NSlVpr28K/ghxsbZV8WPjSEn9/sZhBU8aweGaRJ9yiBP8a7W8blULtSS5kiSR
         M7RIgfklFwZwUpqcO/u+mYKe8jZyXt5DFUa1XUPjRhElMOfXUC9fEu1Fq3d8IKT6pY2p
         0fWcRa0+Qi4HFbGHob0gJCUOABKzHq8K8oR9JArHk7bZbajf7YA10KjeI8y5/oAiabc4
         ayvZfCAajdsI7MI3M85h5os96HtMCBN7zNqwEgZy3K8Z83eMv5Bm4/DL2YK3cW24tSjA
         upp0VYOxDU6Wl/rkdmZEoSpbo+wpQ9K/QwmM/wPJ6q9skOtlllqUnENoabvtqCyyLnkT
         AbVQ==
X-Forwarded-Encrypted: i=1; AHgh+RrP1U/0C5xGKSbcUY7Tb4nNpRTyiWQOCTzFcTklKKVAilg0SIgAVV57U6rUYKt4cmJcMT4L93AYmDPWw28=@vger.kernel.org
X-Gm-Message-State: AFuF++kSdcA7nZzsN/lIlj/vDlKbYE8znomniNVCYwPOLzo631Dfgeuq
	XHio2lt9gs/OYJGAF3ihrqHlwNCr/59TaRge9wqzs9uOZHaf7J6UwdpoAkdfYb2GhA==
X-Gm-Gg: AR+sD13NJpiqENu0vc45eCxyklhoR0dQLUn0Y0VQldjx5/M8zbpOi9CON6fjz1ihfA5
	HLWveetuXfAqQb2CEgRvFnLFwGXTtxUpsyOpJMUYj58LaKeD6iHjb2Cy8LdcaxqKmCb3980kv5n
	nfxCzL1ginA5R7NT9DXj6mHnLfywukdc4l9avxda3KOJAmlVeapczKLJz10mZuAcAetfyqCg1qg
	0yZy3B8VP099DyMaAtBUEgyYSrev+bOjIsxvsNN9hyEqqOLwHmLKGu5Wt4fcTdSksnlrSD5DLUM
	rbEMluaweJD2FP7khQ+4K7V0oNw45xzx87dXliqyboTzKfbtEsPswRIAdKgchbUkgyRbj2B3km8
	2iarHx7uvMS+omCN2AV93YkYvAFM3sHBiDFkEzK5n3HDwXODa2uj2nmkfONNNS2zN8CCU/tIQ1g
	fn3Vkcyx+9zSbLG2+zelm03CjH9kfAN4RnH//TCgqnbwBtRUN1Ojqb0GrBFrRAX3U2z7fN/1ZUu
	26ng7/eER5j6d3zjKk989RTw+LKAQ==
X-Received: by 2002:a17:90b:3e48:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-396d0ebd7fbmr9970210a91.7.1787896981859;
        Thu, 27 Aug 2026 23:03:01 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:a804:e404:4b31:580b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fd5c34sm5744072a91.8.2026.08.27.23.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 23:03:00 -0700 (PDT)
Date: Fri, 28 Aug 2026 15:02:56 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Hao Jia <jiahao.kernel@gmail.com>, Brian Geffon <bgeffon@google.com>, 
	minchan@kernel.org, axboe@kernel.dk, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
Subject: Re: [PATCH] zram: fix idle age_sec underflow in idle_store()
Message-ID: <apEkQSC5PLQAsrqj@google.com>
References: <20260825092316.69658-1-jiahao.kernel@gmail.com>
 <apEK-yRTQR8VdT3e@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apEK-yRTQR8VdT3e@google.com>

On (26/08/28 13:23), Sergey Senozhatsky wrote:
> On (26/08/25 17:23), Hao Jia wrote:
> > After commit 2e8ff2f51dde ("zram: use u32 for entry ac_time tracking"),
> > idle_store() computes the idle cutoff as follows:
> > 
> > 	cutoff = ktime_sub((u32)ktime_get_boottime_seconds(), age_sec);
> > 
> > Because the left operand is cast to a 32-bit unsigned integer, when
> > age_sec exceeds the current uptime, the subtraction wraps modulo 2^32
> > and the huge result is zero-extended into the s64 cutoff.  mark_idle()
> > subsequently marks every entry as idle instead of matching nothing,
> > breaking the intended semantics of /sys/block/zramX/idle.  For instance,
> > running echo 86400 > idle on a machine up for only two minutes causes
> > all newly written pages to be marked as idle and handed over to idle
> > writeback and recompression.
> > 
> > Drop the explicit cast to perform the subtraction in signed arithmetic
> > again, restoring the previous behavior: an age_sec greater than uptime
> > yields a negative cutoff, and one equal to uptime yields 0. Since a
> > cutoff of 0 is now a valid computed value, it can no longer double as
> > the "all" sentinel. Switch to KTIME_MIN instead, which no ac_time can
> > be after.
> 
> Can we instead just reject such cases?   It should be an error to
> request writeback of pages that are 2y old on a system that has
> uptime of 2d.
> 
> Maybe something like this:
> 
> +             time64_t uptime;
> 
> -             if (IS_ENABLED(CONFIG_ZRAM_TRACK_ENTRY_ACTIME) &&
> -                 !kstrtouint(buf, 0, &age_sec))
> -                     cutoff = ktime_sub((u32)ktime_get_boottime_seconds(),
> -                                        age_sec);
> -             else
> +             if (!IS_ENABLED(CONFIG_ZRAM_TRACK_ENTRY_ACTIME) ||
> +                 kstrtouint(buf, 0, &age_sec))
>                       return -EINVAL;
> +
> +             /* No slot can be older than the system uptime */
> +             uptime = ktime_get_boottime_seconds();
> +             if (age_sec >= uptime)
> +                     return -ERANGE;

Or perhaps, instead "return len" and make it a fast path out, w/o the
need to iterate any slots, take locks, etc.

> +
> +             cutoff = uptime - age_sec;
>       }
