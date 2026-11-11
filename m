Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794397233;
	b=io7dgRzXumiEweADDxT836MzJAzxLVIel376Pwcebco5v8mdUIZau4UasFeQipv862WH
	 ihaNqF6NEwBgozHCNWyflZL/cEh7wAPnGwnz/juqnCxKD+w/ZAduPjHRycejEGerX0ZqD
	 RS5mLUE4feUfVrEMDc7Y/OFi4f4s2YAhUT2jomjlOW2WEQWozbmN7QsCmbTHFIlrA3qyS
	 fVsn+oexgGBhCxydQTMp5dwFYdx77HOGVCetE0jlfcE5LIa7uN4+Arno1DYzYfAyI5JWQ
	 XmP2pEe0joIKeDiz4aZjFu/p9zNrCfRtdvdUAmfoDE616lVZQp21wH7x42JFwLssXMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=K3dVn9RGJzT01nbdl7Cqhpuv5ZORMA6dSnVCJ/1pKLI=;
	b=uUff338r8J2uYnc/JSMNpezy0yMRqhDudKSNEmdQS3VLnVKD83BI4bWlpK0SABGQCa61
	 FXIgWSnkv5xpyj2w1OHb8QXxuPejgmbwQP/4Z4xIpMec2KoCOVA4wPJUX9yS3DMlqHrtr
	 CD02q+YsQOtm8idqf00/DKfUNhV6nkJgA8UEts9hlRm7y4NFecIk6Cq6M024aH3sxJHDh
	 n88G1S9QUw+nT8qrXq34OBq86GR7Q4rFTNAYce8/JasilO/pYrmHzs8QAFzvnRqKPIEVb
	 z0ct0HrOLgY62SqWNdxIuaOpqwK2vTYBX8Kuwd1YvDfN3P9dP5+/xtH31Ba/Ee3l8WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0iO4KJ7a;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F81606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10F81606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0iO4KJ7a
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-168de2167deso5626c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794397232; x=1795002032; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K3dVn9RGJzT01nbdl7Cqhpuv5ZORMA6dSnVCJ/1pKLI=;
        b=0iO4KJ7a3eRIh9SHmwAKjwVdCjrtXVyzhTGxlgBRhdmpgJ+OiLmS/fM/yaP70AG/A/
         P6UkMH48WAHMh8hkTTXQwj+1LMekpGrBsu405+gtbydLwddU9S+VzKCFVU3f9pd0zfQm
         VhnIt15SEaI4iwi+k1s9+upaz1DNPw7+uNGSAKpxwMLjFa0m/NWpCYwzeUv9oZ9tEafO
         zmDdfnNpR7bamr2QxgSpkmEpX2TiveYShs0iPs6QIjIJTAMB7c9CxpuGRn7CVAfy1LdX
         DShz/OYKp2XoDTfCDJierpU4EMsRYQKDOw8HPC9IJhdwgqCkCfHZfC+dFZrxYynmcOPv
         KsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794397232; x=1795002032;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K3dVn9RGJzT01nbdl7Cqhpuv5ZORMA6dSnVCJ/1pKLI=;
        b=LzXjPFsZtJ0Y5bThGFAxUFktTKU7G3HAwIfQ8aKd0lyGjlNcZSpl31t4C2efovIiQH
         9GWB4AmD6zENdOT0c9oFiaPwk20O/XLkH7CqcKqOmtZlx0Q9v3p89/A/Sj6Cl5uYmqy4
         k8w13L1y6K3G1yUoAZ61s0j3a6NokCFQVqwo88IGDpKBcS6BiRNWJcAxnHuA3IVZePfm
         8pYZdRi4+Iegnzj4jmX42Kq+40gcIaEXP0dCzNmzi02x9FctmaR6VLETKOaBFEH+uyoP
         z4nyDaGTTI0kk+DJNdnZW4HBi8Alhl2e/faIN789WAW7AIIGyvDQI2GrdzgMHrYKJCBE
         bYIw==
X-Forwarded-Encrypted: i=1; AL+hErHRR1orMeq2eao5v8a/cDfjUybRyBa0naOaYvseQJLzpotVn8ZXd8NI9xsPXJkoSFMvyZq8vl33LbyKxGc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xMQTWN73g5XkNGQRG3+XxeJPI+fkm4oAEIeYR8jEimThHVJPv
	3GJhX0bOPw/7JeH/C5QUpzPNIIlhXK7Mjgd6J9Bw6plLDTkuiVzi/Fum
X-Gm-Gg: AYBFou05XF0/6v8U9DH6dIT7x90MnPb4GPN9XtCl0l+eT6Rghv9Xxyv5GRFeiS9+TS+
	vGKE/iA3ZT+ixKqj680jgGV1eSH4O/rwAysqViTVakMShCFRb6Gx6xulPI7e9+qBP5MaKHSeBe5
	CBvQIrvjbBwL0mFSB1Cya9PSkELda9skzb9dCdNUnj3QRNPtS5V0WHJJyk4kArEShZCXqP6o6Wg
	Au4YZuHzAPs0qqJV8VDCN+SdAn0dcMxeB639mSJaERgqO6d1X+sklSfZBsum40WbMCxZEQEZsX5
	qKN5B63dLzSmXlG0zjPTFxOiKifaVrsGqq9UwkQBAeHm1VLwST4q8xEmgtnbNu08xGGGEHfg/Am
	wz8AGSl1Z51HgXzW8zVioY8UVZLM4pUrXEPOABfjzyjbfs6ZJ7FMRSNB2ovDU7/vcUCBBIIXSIO
	M3AJu9S33d8u1X027uaZ5gvT8W7wU4q5IDhHLArtXqZKb2wgsrTMHvS4a3DPEh9n3fJBnYNf+GS
	swnWLnem6mt6WFrO/zaZ2SeRKFav4KjwDSTkuXXZxiWBh7KYVNYouz+S2Isb4pKkUK3K87QutQu
	IHE9trlk1VLKov6Un5UQj9VGN3Ec06iuUY0E2i11nZ9HZKi8Z0d85TWTzinZCLWt3h56
X-Received: by 2002:a05:7022:3a86:b0:143:5c2a:e45f with SMTP id a92af1059eb24-1b3c01600d4mr3413598c88.0.1794397231833;
        Wed, 11 Nov 2026 03:40:31 -0800 (PST)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b1003fsm14128236c88.6.2026.11.11.03.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:40:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 3/3] docs: zsmalloc: describe statistics with
 CONFIG_DEBUG_FS
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: Nhat Pham <nphamcs@gmail.com>
Cc: Xueyuan Chen <xueyuan.chen21@gmail.com>, 
 Minchan Kim <minchan@kernel.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <CAKEwX=NEw=T6xWuu3Pv+v3Yh1BvfkGKRj-Xd3xxn1Ci_fkA9AQ@mail.gmail.com>
References: <20261109-zsmalloc_stat-v2-0-caee41684aba@gmail.com>
 <20261109-zsmalloc_stat-v2-3-caee41684aba@gmail.com>
 <CAKEwX=NEw=T6xWuu3Pv+v3Yh1BvfkGKRj-Xd3xxn1Ci_fkA9AQ@mail.gmail.com>
Date: Wed, 11 Nov 2026 19:40:27 +0800
Message-Id: <179439722709.2142163.401638033965414946.b4-reply@b4>
X-Mailer: b4 0.16.0

On 2026-11-10 08:03 -0700, Nhat Pham wrote:
> On Mon, Nov 9, 2026 at 5:59 AM Xueyuan Chen <xueyuan.chen21@gmail.com> wrote:
> >
> > Zsmalloc statistics are now available when debugfs is enabled. Replace
> > references to CONFIG_ZSMALLOC_STAT with CONFIG_DEBUG_FS in the English
> > and Chinese documentation.
> >
> > Suggested-by: Nhat Pham <nphamcs@gmail.com>
> > Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> 
> For the English documentation:
> 
> Reviewed-by: Nhat Pham <nphamcs@gmail.com>
Thanks!
> 
> (but I'm mildly certain the Chinese one is also correct :))
> 
Actually, I didn't look too closely at the Chinese doc. :)
"通过" sounds a bit unnatural here. I'll change it to "启用" in v3.

