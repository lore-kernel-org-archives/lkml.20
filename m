Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8884B1CE0
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403733; cv=none; b=eQcu5uvF9Vmtuv/clkskYaQTZoFVFOJURC5uMwIZcn2rWsHSHvLQZ4EZcdRaJU3b2oh4VFpdYQURFEtTdwu+iJ5+lAj9DaWIAUd+i0dQ9MJYT0Fjq7vd0OaGu9Vp8hykvClCLdA2Q+CcTzycCdLre1kdXashi1gsAhbUoMmSJrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403733; c=relaxed/simple;
	bh=j15NZBr9gmJFKjFiA+o1T4SJq+ce59GySu+ndbBbdFI=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=GckmN6PqVn4CzjmYImQimRKpqxFrnL8pVKJ6YlD7GYb6cIPy9amjHwcGSwDtzBcEzn80okLIEK8c1OVzbRtVEpsWhJqIOfsSo5UwDH5AsHVNmGW6NHKlwPMsY85Ue0ho6xrjEptCqOpHBdGDiOjFy1wGCQMvbQhp8ISYiHeAfS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Wu0pMyi/; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Wu0pMyi/"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49d05d51553so12802485e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792403728; x=1793008528; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/mV3QLBtc235SSF0yEhuYpNqjTPPn1gF9CIeniWG8O4=;
        b=Wu0pMyi/lau4nMEPPmah6Ri4a2w5QzLW8f86GWx0T3njqo5vzHZaHyq12Uf6OHqOVE
         AcThV+l3d0oZ+y+HIM/onAje2+1XyDgi/l4MdJFra67te7T6/os24sgPCmaleK62FLnP
         ZpAexp8P+WP801t+pP5M1+foNyPLJC8z3iJ77FQMwdf/ByckEY5l7+2HczRtApHi4DRN
         eGOoUxp8iJJxLkTsSlNVsLGh7slXyNXmaAXcZAgCm3EsqgW15FUu1c9S25TjnLxQ/aDf
         cV7irLtNh0LjQnZxzjfExZ+ZwfuZzKSVJaheedWG7+cuNYrDWWY2JmwVtRkQQekr5sPO
         jyaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792403728; x=1793008528;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/mV3QLBtc235SSF0yEhuYpNqjTPPn1gF9CIeniWG8O4=;
        b=KJjkIp/L+qOhu6PEO6hB3jSMurTiKyJlmaZheH9yr7ZTRVJfe+xEClhDbtauVyvEKg
         mkQqumqvF4Pedkl4IcICnIUo8t1SLBFMlvQEqd8zGtiygJMHI3N8GQZ8GzGjeBt1iztt
         HdbVymcEofkuYjG42WymJXJvbOMML+rszmiX8aFTitNr6UMkpNdfS3kI6J+7GXtQEdRI
         dBOpwVDGOm6LJrBn6gVHBRqplIUGKtLptw/8KGkRcDYyEWH4WBXa1UtVCFr1grDK2MA/
         56AP0RIre7xybUl/TBXx4eO8oJFPZy/2SbENMs3V7Nf9iDVUCR2tHpwibxLN2hiI6J70
         GieA==
X-Forwarded-Encrypted: i=1; AKwUvBxb5K4hh1c5/2Les3b835TNo7sXM1nTL35RxwKZZHRDhOjoT75kIBErRbs1uTUl9FU5cyxFvUWABevIDQQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLymBhbKc6uFILXuiodiefu7zH/Uy0GsiZr7g/tqtM5XyH5EMdf
	364O2+SZsQeRN60lp8XoPJewtHlt9nhQS2wUV1WrYW4x7+iO/kxKBaC0t5pQm4TvheA=
X-Gm-Gg: AYBFou0jER3NwCZwUzWsr1gqGSHc7RatDq0JUoeULb+38WtOrofUZpWfz6uZ8d1R6VE
	YRNbNwQZwTsUaDk+9fniXXjOYb3L8KO4BhCPGXsUrrpuTNfypaweDSawfZehIe1n1Tsc0NVBhov
	ydTjkYwJT0QMYUX0l6G/Hzt8AjAhGCYAJabCKV1AqBHlrs5enip3zCPZL6DTWEYEpBAm6MaU7Pl
	HXTxQz5Aw5fBtvZhU4dzOZLIPEhjFPcGcRz/9DGZFBp9p9TkAZXfpAQdA3JHa/S+M0mxs1LBIpV
	Tp7PG5/QleFZRxShd++yy90oGi/UE9hupH2rNvMbgBBwTA8mtiWp+U4dgBNyrI/aKVYgvZJ1ijG
	Dngeqhvo1GIYv9FLkIYNP0wRmRq0doBPiGEwC1O6Iq5cDQuc1psfcRVZfPwdrsdaNYPO+RpY0ql
	uewylDAO66awT82+S9NHB6spqtjByXoJQWfecG3BzwoKem4SQvTrdGLvLr5J2vKPXwU+jh2vIqk
	M9d1D8wkbYrE+cQaQ==
X-Received: by 2002:a05:600c:628e:b0:4a1:df70:b4a5 with SMTP id 5b1f17b1804b1-4a1df70b5c0mr122511225e9.7.1792403728536;
        Mon, 19 Oct 2026 02:55:28 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ddde4esm324919775e9.12.2026.10.19.02.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:55:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] clk: devres: Skip cleanup action for absent optional
 clocks
From: Jerome Brunet <jbrunet@baylibre.com>
To: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261018063009.1365568-1-pocj8ur4in@gmail.com>
References: <20261018063009.1365568-1-pocj8ur4in@gmail.com>
Date: Mon, 19 Oct 2026 11:55:25 +0200
Message-Id: <179240372505.859276.1184439049776215030.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=610; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=j15NZBr9gmJFKjFiA+o1T4SJq+ce59GySu+ndbBbdFI=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlXX/J/al5WFWzgFHunyGih9eXy6Ttz/q7QWSBjVDvLb
 7bckV7ljlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAExkQhQjw9L05XXGaTwrfP5u
 iy5cu77y904rTaM9pyf+XmVs3GJyL5Phn93+w5mPH8+ZZSKfOv2O+uSf7Im/bWd+EHwx/d/JXb9
 nd7MDAA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On Sun, 18 Oct 2026 15:30:09 +0900, Baek Kyu, Kim <pocj8ur4in@gmail.com> wrote:
> devm_clk_get_optional_enabled_with_rate() registers a disable/unprepare
> action even when the optional lookup returns NULL. If allocating the
> action fails, the error path calls devm_clk_put(dev, NULL), triggering
> warnings in devm_clk_match() and devm_clk_put().
> 
> Return NULL after the lookup to skip the unnecessary action registration.
> The state allocated by devm_clk_get_optional() is released when the
> device is detached.
> 
> [...]

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome

