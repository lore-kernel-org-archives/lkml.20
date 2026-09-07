Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8412D7DFE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 02:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788747637; cv=none; b=ShdviufdpgeXT/ZoY7FtkfL3XN513bKjGdH7zDSvbJshkOTeoZQmfPEHOjtfAO66+RcS7kA4kZ0iqANVyX2M2tTJIYmFhI0OVmG+r7ve5yebtgfuM4Pff+FRIxIyeuoweThWJYnpe3skJNxU9NtphY6i2mn1IIOUqhRz53UBhIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788747637; c=relaxed/simple;
	bh=bgN0piWLoCmGGP6Vi0GPl7wrpZyOkEoBokqSqjUPb8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aqaDFJJvF2hj2lNATsNfpyalqmxt6kRDUrtx7OHV+46K7VHqSWn56b5wcCZhR00BhZi1oG7zBz8Y9e/femO6ATCXuEaX7HXHXtvlUq4HLQ2pyjPcs9vD+3d3M2LdhSvBl28fkG0aeYDN34PyOaJ9Zf3nWpsg1GQj2+OlYJ1+CAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSHEV3xR; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSHEV3xR"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cf452def93so33701415ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 19:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788747635; x=1789352435; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2xQbczVfHV6CF15MNixvVfDaRPmdmf2gjFgOoATcDvo=;
        b=iSHEV3xR727BaCbS1Ix1IzLZ/NpCHbUKnT+4YdcQjdbeccxodgI1cfgyoKOe6poD15
         JYh/PC4NTmsmzLXDM2Cg6u5HAdkpxfr696rtS/67vzwbPePlvohYIrgEXJcgpPFwii4Y
         fniARn7XkCOqwMa55RMAoKATkCxb7opXfUf9XGAL4EFTvMTU2uan7GDHzmKPWWxB4GJy
         FaNZ8JbgdvPTnSunSjopKa8BxMb2S0wGwH7NzMBi9h54lsTfI+D+dVwylINafmRK1QOv
         bnUaND+lhR3flSz+mCTwbwARmpCcl7M3PAK3xrw2Pyg8jugwP4ccFmeLXFBuZREpDng0
         dEgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788747635; x=1789352435;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2xQbczVfHV6CF15MNixvVfDaRPmdmf2gjFgOoATcDvo=;
        b=F/5EPM/X3S8Zf+XPyt1IS2gPY2Egbz4XlwDJKfr8OcwyWAxmdQzFus+z2fE42tf0g2
         2Ww68GYT/7gHqqltjq+rq6noJNR4ubfi/vdm2GoXwWO3b5plY28y+Yv/uyzfRQs3f1rA
         MlvUxOxpi4qF6puabDyKiZs30K2tqNKcNmxY36QT8Y/8pwb+tCP7699HzlUhMO+vLyQr
         s2iMS1OioMOLtBJ7IDxqsA5NzqVs1d6HjxOUw2YHhhvFgxRuVvpk+DpMiWtPMm2AjOl1
         ayzJk9F0iFnhYWsmAm1H6JQDLepCCTEkHyZhZpdi61xCY/bA0UrKACHFAYM+PSgwSyIT
         8x9A==
X-Forwarded-Encrypted: i=1; AKwUvByMPzxObCAa0LkqOzTzYJpXQ/cfDo6J7bQlyztd1kLyMDPAEFZ+fBNiMMnNwiUntMOPrj8Vz8L/017C9Cg=@vger.kernel.org
X-Gm-Message-State: AFuF++lgVrBATCJsC3gyQ6Drl2adTDmoIMRt1RPDciGd12iDqeEYX9I9
	1xdVtzdhDK+YkYh+9d+Glik7UIyAov3lRFH3JAu5fiU6/WdjV8QnX6AdE5gxCA==
X-Gm-Gg: AYBFou1N2GuRXiHDSKoHYO65uvgsrBu6QPWGopuviMaapm5ww1i/xX/AQv7cRkqysp2
	A5xs1bPJfEZbASG2NmXguWYCM61HE/VDI9KtA/a/UbUdK0TmE6/w5/34FSh3ne0iOlT5Z6AeK5u
	0kjtEj0hQa/LRvx+1WWeLOPKQwrwextmzYTNeTpJNEEVFoHm+H+uB3CUb0bzWzHcnV6fWrdPrFj
	NPyb89rkvDGr1NSG/M30w2c5mjGxDUZ0YgQH3KNHHDzOTNDY1KCWWU2g9umgk6Q5JwgZFb7UilR
	I8F+tMDS1/9yyrVYhT7z+BDT2eEWWfbZBZPiBcNNUhaJ0+q4UeYNDREes7xMe/TebNZDNFEmkYx
	nMYfJ6MjXQsQF65rYT3fkGPi9DRCIZy30OUfeK5PtA2fylJmAUbbfrAMfvAInWsxtzFfhsr6t0b
	QZ5+suJeGBDoSp2GB7jyfv8MgJV3gARYPT8a8sCLzt8UkmkdjNmJOHWJy41XAcwqjCaB6bUJ1Ut
	iynpdnrPNu5ZMwNRzKCWwlIWg==
X-Received: by 2002:a17:90a:e7c9:b0:38e:9784:dd47 with SMTP id 98e67ed59e1d1-39b07f2f51amr28808592a91.1.1788747635211;
        Sun, 06 Sep 2026 19:20:35 -0700 (PDT)
Received: from [192.168.2.166] (104.194.78.75.16clouds.com. [104.194.78.75])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm15214284c88.8.2026.09.06.19.20.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 19:20:34 -0700 (PDT)
Message-ID: <2f56d8ab-9542-4d53-9e6e-158435d29b67@gmail.com>
Date: Mon, 7 Sep 2026 10:20:27 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v2] docs/zh_CN: sync page_table_check.rst
 translation
To: Ye Liu <ye.liu@linux.dev>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>
Cc: Ye Liu <liuye@kylinos.cn>, Dongliang Mu <dzm91@hust.edu.cn>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260819025535.2967566-1-ye.liu@linux.dev>
From: Alex Shi <seakeel@gmail.com>
Content-Language: en-US
In-Reply-To: <20260819025535.2967566-1-ye.liu@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/8/19 10:55, Ye Liu wrote:
> From: Ye Liu<liuye@kylinos.cn>
> 
> Update the translation of page_table_check.rst to reflect changes in
> the English original, including the clarification on corruption
> detection and the new paragraph about userfaultfd wr-protect
> verification.
> 
> Update the translation through commit 8430557fc584
> ("mm/page_table_check: support userfault wr-protect entries")
> 
> Signed-off-by: Ye Liu<liuye@kylinos.cn>
> ---
> v2:
>   - Update the commit message.
> 
>   .../translations/zh_CN/mm/page_table_check.rst         | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/translations/zh_CN/mm/page_table_check.rst b/Documentation/translations/zh_CN/mm/page_table_check.rst
> index dc34570dceff..7ba5a39db487 100644
> --- a/Documentation/translations/zh_CN/mm/page_table_check.rst
> +++ b/Documentation/translations/zh_CN/mm/page_table_check.rst
> @@ -21,9 +21,13 @@
>   当新的页面可以从用户空间访问时，页表检查通过将它们的页表项（PTEs PMD等）添加到页表中来执行额外
>   的验证。
>   
> -在检测到损坏的情况下，内核会被崩溃。页表检查有一个小的性能和内存开销。因此，它在默认情况下是禁用
> -的，但是在额外的加固超过性能成本的系统上，可以选择启用。另外，由于页表检查是同步的，它可以帮助调
> -试双映射内存损坏问题，在错误的映射发生时崩溃内核，而不是在内存损坏错误发生后内核崩溃。
> +在检测到大多数类型的损坏时，内核会崩溃。页表检查有一个小的性能和内存开销。因此，它在默认情况下是
> +禁用的，但是在额外的加固超过性能成本的系统上，可以选择启用。另外，由于页表检查是同步的，它可以帮
> +助调试双映射内存损坏问题，在错误的映射发生时崩溃内核，而不是在内存损坏错误发生后内核崩溃。

This translation sounds too AI-generated and doesn't flow naturally in 
Chinese. Please revise it carefully

> +
> +页表检查还可用于对各种标志进行页表项检查，在检测到非法的标志组合时输出警告。目前，userfaultfd 是
> +唯一的使用者，用于对 wr-protect 位与任何可写标志进行一致性检查。在这种情况下，非法的标志组合不会
> +立即直接导致数据损坏，但会使只读数据变为可写，从而在后续修改页面内容时导致损坏。
>   
>   双重映射检测逻辑
>   ================
> -- 2.25.1
> 

