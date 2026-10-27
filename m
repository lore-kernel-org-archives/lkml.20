Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793137575;
	b=bD9QfR6YQpHrW5jFbKqqK6PpZE6jYJbQAOYa3uWX3+BUMlZWhWY85DQOJrRAOdiczXnW
	 QF4LpW+ThHFYp1anx26QruS0w5Or/Xj5N8XhagkuGWbzt077YQ5kFuos0qflBpPdJ+7eP
	 HxTdR0QMUIsOhidhFrlLgKR30IhNBa5iaORblyzmXpni0HK5TddM9A3Y0HlzuSrwbATZ+
	 A0RnUHX2aXtIEczdxNEyt4AhQVRet7WC+9ZHFIlIDDEDd/IaKvqpCbCtvLir9acCWKRgj
	 9nMzI7YHrUHiIK/yxde9objXdW/UXQAu5ThVJl8p+BvE7+38MZVcVx0Ex9gcZYPu8Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793137575;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 Content-Language:Thread-Index;
	bh=QFC3dMXMjls1OkSJlBz/j7yjixIsRn3p3uTGKR2xSH8=;
	b=Y7FR5luJ691Ozr7g58M7Nyf/eQ3KC0Tv2uxFN5aTEBMlcE+gutnllxaqAsuPrBxSRM+L
	 e8WVOcw80Apav9y6REw/rZSKdL6FWtgvIb/jbyWbdkSsyLCxuyD6SyXipaphU0GENV8SB
	 CRzAETQVo68t4GmgLp82DsJkfO3ddsZyk1/isRjSYH3zv6ewt3XyJjdqYrugV3PItv9EK
	 iJoWJA3jBKyK+pyfLMO2NmitNpinlw/kA8EWdOWbrr+dFlb2WAEAVi5lO7Fq8x3UaKJ2j
	 Od5YNT0LIn/jiGHHUv5eVO7iCgIPsjB5+OcQd9FE1xegHFHMIQAVzWzmvTRtL167GSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=telus.net;
	spf=pass smtp.mailfrom=telus.net;
	dkim=pass header.d=telus.net header.i=@telus.net header.a=rsa-sha256 header.s=google header.b="g8q2+/rz";
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCD3606A322
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:46:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FCD3606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=telus.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=telus.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=telus.net header.i=@telus.net header.a=rsa-sha256 header.s=google header.b=g8q2+/rz
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso204421a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=telus.net; s=google; t=1793137575; x=1793742375; darn=vger.kernel.org;
        h=thread-index:content-language:content-transfer-encoding
         :content-type:mime-version:message-id:date:subject:in-reply-to
         :references:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QFC3dMXMjls1OkSJlBz/j7yjixIsRn3p3uTGKR2xSH8=;
        b=g8q2+/rzhXuw6wKxw3KV2YR8BX8fg8Kds2z2AHAyF/6JetyVQz4ZLH8Ai7afnJXTmY
         mBbrKrodlIwcZK8ucZSVgMvatETDXNsIcJBix65BYRskrHTQ9fKkvRh4efC4wdsEIewB
         9kyRI0nT1p0qA8voAv9umdpuN3E4Gqlttse/fQ9LpiF9zaZubPw92b49AylMKdcFofUo
         TeKjfLgMxvEyyn0Ibmb9vA+tGlF6JzNksa6TAbxjdF37cIBdLaEUX/eR1hRccxN38iNH
         evz/3wIgh40x4x9VZ4jprGK7pMQHUuXcSfoENNZltFrbg0k5D4ZcQ6l5GMYSpNabUJ6u
         4wwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793137575; x=1793742375;
        h=thread-index:content-language:content-transfer-encoding
         :content-type:mime-version:message-id:date:subject:in-reply-to
         :references:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QFC3dMXMjls1OkSJlBz/j7yjixIsRn3p3uTGKR2xSH8=;
        b=SX5qvjX6z/h4T0ZZdwvW2iUrF0HaeblQyPcjx6+JZKWsIC34F87d08/ygTeHf213k5
         kH9rpAWZfzTi+ikLiAhJe0d19iMopR9xl5At1NY8avMShqnJ8IBjB1KfpQRgoy2zayTE
         Qz9m7K5VIWjD6cejXE0cfonRAUGlrdOXxrQld+amlLggCO92gCj6VwWXTOv0W9mF1mXc
         ldsrVlXWWtdijzuMfQIYwCCzntLw7rKS4Q4HswNiOjuwNM6/VazEv78n62TEdpR4kN8R
         LX40guDJ9pSbeQpB+UngCDZjbP/N0HLWSiwh7slDz2xe/08LklD6arXV33bUOUALtlyX
         wuoA==
X-Forwarded-Encrypted: i=1; AKwUvBwaKhSQFOfu+GKFa10YmPnn6YgZYO1NL9UG5V0Ai9GRNXjYD8H6UfX+yqNDqtx2HRRDylsQslYqvhTgVoU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOYaAuWTQs10mzuRHDJ430lf9AK0PIFUnrMjGDXghJoacOcp43
	wLi3V/kIvFlwpy4jGv1zV0TsIAdLUwtytbOzBgAmnLVqSK1AOQE1sRVtmqIAa/GnSkk=
X-Gm-Gg: AYBFou2MtSkOqPd1Qjhq0+sNoz1KDXXBz26e5v3PPA/h5MTON+0HLIc2fC7z6gu1raC
	wMXVL0xH1AFvtT+0eak6VoX0I1hubyhHdFI8lZJFa87p+iMUPbEvwOu4bEoSJOKtnItwgXL+ix7
	gjNDUVmLJM0VJtwy/+xTiB9afnX4+IjIKOHRbCBI41clhmrjkn7M9sgWOSicUgVQt+WyG7ePdIS
	mO60tro7vHMiQc71WSxMICxNqgIObxR7MmRLXQhlb12UP3QKqFLcFsNNEvMVZdir+bWbpcSOIFm
	bbtX+qmBzCu6zVmzGo8kfx5EZTXyH+mMJHECI3d/VUYEO+5oPIPWDfP8kUlDZPcIrKny6bH514J
	l+QYKcjeraiS9sXGMszKAEg/rg1rqVkwYstw9rFtgMYI35Q7YmTZeX7IB5mg4BxNBWb6p8y2OjB
	jVL5VN7SSft0t6lnJo30wRt0uvX0Z/MWQuwBEWHP98xtbjAXLsLqQcXifUYqIUBueyq70bT9cYG
	HPrJdkEHWgo9apaTdTFCbglN79ssS5rT2Im7K5ge/fSD5U0Dy6dvrV0d4HNKVo=
X-Received: by 2002:a17:90b:4a45:b0:3aa:fc22:8ab4 with SMTP id 98e67ed59e1d1-3ae58100ffcmr211135a91.29.1793137574706;
        Tue, 27 Oct 2026 14:46:14 -0700 (PDT)
Received: from DougS18 ([66.183.142.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a9a60f8sm33185a91.11.2026.10.27.14.46.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 14:46:14 -0700 (PDT)
From: "Doug Smythies" <dsmythies@telus.net>
To: "'Rafael J. Wysocki \(Intel\)'" <rafael@kernel.org>,
	"'Zak'" <zakbrightonknight@gmail.com>
Cc: <linux-pm@vger.kernel.org>,
	"'Srinivas Pandruvada'" <srinivas.pandruvada@linux.intel.com>,
	"'Viresh Kumar'" <viresh.kumar@linaro.org>,
	<linux-kernel@vger.kernel.org>,
	"Doug Smythies" <dsmythies@telus.net>
References: <20261027143725.3763827-1-zakbrightonknight@gmail.com> <001101dd6631$6167dbd0$24379370$@telus.net> <CAJZ5v0gVkYuZAh7H8KFakN+vHkJTjzvmZsLrUVP0MXkaKLVoCA@mail.gmail.com>
In-Reply-To: <CAJZ5v0gVkYuZAh7H8KFakN+vHkJTjzvmZsLrUVP0MXkaKLVoCA@mail.gmail.com>
Subject: RE: [PATCH] cpufreq: intel_pstate: Restore P-state request on resume without HWP
Date: Tue, 27 Oct 2026 14:46:15 -0700
Message-ID: <004401dd665c$97eda060$c7c8e120$@telus.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-ca
Thread-Index: AQG+ka4iSAouj32QbdBtcmCOlo9WegIHF20PAY25hX23Mu5WwA==

On 2026.10.27 Rafael wrote:
> On Tue, Oct 27, 2026 at 5:36=E2=80=AFPM Doug Smythies =
<dsmythies@telus.net> wrote:>
>> On 2026.10.27 07:37 Zak Brighton Knight wrote:

...

>> I confirm your findings and tested your proposed patch. It all worked =
fine.
>> I had not seen Rafaels's reply about a possible race condition until =
now.
>>
>> Test computer: i5-10600K, 6 cores, 12 CPUs, HWP disabled.
>
> Passive or active mode?

Apologies for the incomplete report.

Passive mode has the issue. Active mode was fine without the need for =
the patch.

... Doug


