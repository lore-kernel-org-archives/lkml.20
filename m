Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793371671;
	b=fFTq8MqE458zwkxFIyvGtgrpIGy4Te8nXMEV4av8R8AD2SMfDFy1VnzY/f6wWTC9SAby
	 9pA5D0dQGBvaPcYtJxwjKIIKRHnCijWFnyKHfGp+XCHMogNctYE8FjTRiIM95jFEAzdGl
	 NPOyi6+elVzU8jSBu7uQktG2jpzb7YHOAMEiIZAtOaQG/Se9Wo53KI9oOMCX8sGljJ3wR
	 Gouj34EmT6jsG8SyrPOHm64T5XVEVYMaWOvQR7dyz0kTN3uqxXaJ11ttOTyzIyjJWkPcg
	 Pmm09uTNLp5EfI6YNfKQeamU5VklKdj7/pypD51ebkh1QKIC0vTGdQDbbeCpPrhFgyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793371671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=x5OeOnwyNDwIcs2/N4QDgJU4LzBpbmYJ/Rxk67e34f8=;
	b=uZB5ArmoYY8R94SJ3A+qmfoTnb5jhZ+vLfkzFiSL1Pf9LLCL27mrh5LyxMd8ax3TxwEG
	 1QGK9lutxcfoPPrMmKgo9hDzTS2dWUkkKaG7gXKg0OtDFe1N//gi/pmS2gvOa3a02HwQf
	 7Da2cxB9ZvnkmnN9HHZXT4SpLlL6Ewwf6eHdD5aafjEaO5ZjUCMuLi+EzoIC3c1+POWOL
	 lO2NLXm8QxPXL8O+IGUOuVe3fs3sD6VuUlEcvLW2xP/dl/b5H5U/fIR27lhoG3M1TPsVT
	 tlvnyT5PTDGvHizE13B3Q3mzbqin54/PEkEG7ChRvbeJH4/YxG6Bnk9yRiCO3AELINg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EnWRKfLV;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2234606A320
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:47:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2234606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EnWRKfLV
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a78ec32fadso1035565e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793371669; x=1793976469; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x5OeOnwyNDwIcs2/N4QDgJU4LzBpbmYJ/Rxk67e34f8=;
        b=EnWRKfLVJBYZRvuY4GDy3zyitxPEriwY1Z4MzFETQe3OpeSWCqNvgg0d8w3CRTAs30
         7VCEO8dg5/WzLrvcEg2FvCm6ZTNgUdrvKiVRpKYsnmJy0YSwwXkoUaJc4kOK/AX3xh2a
         N/qHkzoyYpMjnU6RztPhUIDKa0GyeP6z35Rt1bni0s2bLMpOdvLl9QEDBZvp0qS0auzv
         oqxakjI4MXnJ+gXGur2zmHIuujrYx58BA/CDjDM+XoQN8g7kLNgyMNhSmgj2aWNfyVz/
         efka0yU16T79cUsFkxvtDuoBxUshPIO+VbCZdS6SNOXR+tCXV1VGv146mi8AZD2+JBxG
         F1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793371669; x=1793976469;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x5OeOnwyNDwIcs2/N4QDgJU4LzBpbmYJ/Rxk67e34f8=;
        b=ehyIfh1n07VrVcrh327YKKAQlqFyd1FbsROFiND96bU6cMfBhmN5MhPqIrPC3Gi9ev
         83YYj+tDOoFTBt4f5peF/8BKYSQ2mGEzLt+7T8SBUXqYE/g+fIwt8y6Hwsrgy8ZKQHbY
         0/u3DMOHE0DA1D+LCefEuc+Zn9omP+1L/dnUOega3OKRvrS1Z2mbSqxoOtcOd5JDP8cY
         zhgSi4/2u+4R5U7O0PYxhi+EKsJB1QdsztdTE1LopOX9qtBP4xBc40tOkbUXDxt6K7Ie
         iI+QHUyd7UBi5JiDG3RqFUjH09SzAc50ThIr+aLkm2j5uITGLsoDCuvb/oAx1dDMweMM
         3Y8g==
X-Forwarded-Encrypted: i=1; AKwUvBzzoykGvwXUkPtqKfZqn1XNSvzDePwUunzOEqfcU4CZwFM/tXf5FrLu0yLSmhZo4xmiZKL46Iay9bEJCz8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/uyvReUm+XdzOXhsKy4wsbD/yqXdaSuAabp8RhFBp5mnlGJex
	3aidtmnr3IGdi8Dq9MbscAD+NaGdvaIGuiSILUDtEGy48yLvNVvT5T7a
X-Gm-Gg: AYBFou3iHpixh7dNmqELLEsTubsJluEyHzK5gIY1gBFVYjmgKsKkEF6dn7ABxqRj170
	P5cYXN6IBcaoakiDdoRmCRPmdMWLvC5LeNRRiun1W6haD8xYz68/x5DG2DvZbt0NVCw4Z2yjERX
	9hNgfnse/a1ghMn5bjPv6VhtjJV6DGveW2ZYWefUHj0GFkGOeZkXnBl5fEo4PHlIZQeRmZvQdk7
	Guuv6n17Df4k33KCUDG07Qnsuh9YF1D1r++nC5mInjFrmXjyeYwiriQz/uWmB8QWYKGM4PbrskK
	isF3A3vrnXhL8NH/e/GZg4fMTm0c3qvBIM7TEtzvb2wm5WWrCAEbPORck+d7cpG/fvotAwIhERn
	hkXlpZr2Ga++O+tIBgGZ4G99Cw1HVhZT5l+I1q3TWi0wRK87PbN5Pn+8YWDdpcBsBNvtva0jOh3
	ZNbw4mBDHyHK/FlHqacqg/L9z0NLBTKzEm2pIjNHiy76QmWkP6UeB+fUYVsRTkjop29fDMa8i0P
	oZeyF8BxjsZirimdmufFZNvctbwNX2+X11ADmqB8VzB+EbEVxH3gNq5G3xAO37nfRurkmeXYAR2
	xnsUs02VXsvopFxJwb0h32KG5htCkvSo9nL+PZDRBbuSnl4pH2gwfOCm
X-Received: by 2002:a05:600c:6749:b0:4a2:6ef:d1dc with SMTP id 5b1f17b1804b1-4ac167e56b4mr56707195e9.1.1793371668903;
        Fri, 30 Oct 2026 07:47:48 -0700 (PDT)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b289f7sm65169795e9.5.2026.10.30.07.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:47:48 -0700 (PDT)
Date: Fri, 30 Oct 2026 17:47:45 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Qing Wang <wangqing7171@gmail.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Tim Chen <tim.c.chen@linux.intel.com>, Chen Yu <yu.c.chen@intel.com>, 
	Davi Chaves Azevedo <davichazbh@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] sched/fair: Replace random newidle_balance with
 Bresenham accumulator
Message-ID: <auSo1jhKzD5vDNys@scheduler.schedules>
References: <20261030091946.2498870-1-wangqing7171@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261030091946.2498870-1-wangqing7171@gmail.com>

On Fri, Oct 30, 2026 at 05:19:46PM +0800, Qing Wang wrote:
> The current NI_RANDOM implementation uses a random dice roll to allow
> newidle_balance attempts according to the success rate. This can be
> replaced with a Bresenham accumulator.
> 
> Replace the random dice with a Bresenham accumulator. Each step does
> the following:
>   - Accumulate (1 + newidle_ratio) into newidle_window_pos(accumulator).
>   - If the accumulator reaches 1024, allow the balance attempt and
>     subtract 1024.
> 
> Why Bresenham:
> 1. It is deterministic and reproducible. For a given ratio, the
>    balance frequency is exact and not subject to random variance,
>    which makes the behavior predictable when debugging or tracing.
> 2. Bresenham spaces the attempts evenly; the random dice can go for
>    a long stretch without balancing or fire several times in a row,
>    especially at low ratios.
> 
> A quick simulation where the ratio jumps to a random value in
> [0, 1023] every 512 calls (20000 windows):
> 
>                       Bresenham      random dice
> max per-window error  0.5 attempts   41 attempts
> 
> The max per-window error is the max difference between the actual
> and expected number of attempts within a window; Bresenham's error
> is much smaller.
> 
> Signed-off-by: Qing Wang <wangqing7171@gmail.com>
Hi Qing,


Tested on Zen 3 with tbench (8 cores, 16 threads) 5 runs:

C = Client, Higher is better. MB/s.

One boot per kernel.


-C--+--------(BASE)---------+-------(PATCH)---------
 1  |     311.19 (0.00 pct) |    313.42 ( 0.72 pct)
 8  |    2097.95 (0.00 pct) |   2113.36 ( 0.73 pct)
 16 |    3271.83 (0.00 pct) |   3229.59 (-1.29 pct)
 32 |    3341.13 (0.00 pct) |   3286.98 (-1.62 pct)


stddev:
-C--+-----(BASE)--+----(PATCH)--
 1  |      0.93   |      1.07
 8  |      8.35   |     10.24
 16 |     15.06   |      7.56
 32 |      2.92   |      4.04


There's a loss at 32 Clients. Some gain at 1 clients maybe.

Still, these results don’t show a performance gain for Bresenham,
no?

Thanks,

Kayra :-).
