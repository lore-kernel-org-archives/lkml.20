Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.22.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793760039;
	b=DxQ3I3TzC0nJkB05mEKsAfhrgFdxNZRXa8FC2Zqnv0GWj+ZYEBP9FL/kCKZsN19pVT3z
	 iPT0I2SPaXvn1IKTERZ9SuL1ULznYZT139toYaOiWZB+BhBQi33gZaOI0XHujVGn7Giun
	 WPJw1Z2XPK2zihyq7kDoiB21xRNl5EWNP51o+AJCrLOAmApEwLVO1BqzXpitakcOGyUnn
	 W8DqAWi2ja56l0PMgqCsEOWWRducBZ+bg1dok2tzYcKs/yQOoi7glIAkXc3DDf95JMySw
	 hBWHlAmfAYPpfoGMmHZo6xaKdCMiOdRpFWEMki989TxaAfQmtSHoThUbm0jKF+LjMnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793760039;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Message-ID:Date:
	 MIME-Version:User-Agent:Reply-To:Subject:To:Cc:References:From:
	 Organization:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=IDe2qSWFFVTIV++swKUqHNKYud0kxdi38C7CtewJZgQ=;
	b=0p5ef6bEOCSbmnkL6AROU5SZuGbsr+YlMbW7GxlgIsvxh997GHvhLtPDogsJuThU3NKC
	 jrFA8WHv3e0Cqi9mLpY2iti564V9wVXZapoBTWiCqLIhVG1fmWuMBDUnbvJL/0rLsDUqQ
	 s6r7qU4KMmRgwEvKoPsiI37USHEI+z5JzKUY1WyH+OFczhuT9/ovMssT9sWfdBSp44+OP
	 Q/oB+PhDLtL21eN+Nn8jHVHIC1vAGGjVq/SgXTzp8jWqZGUuKP2mHnP1nFZowgGijAKyc
	 wopCUKUmWt+LXP3pof64EChAN9Ls8413lyAVFUKyC5kT9ub3tWn4bkas4Vu9XQ2Rd3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=radxa.com;
	spf=pass smtp.mailfrom=radxa.com;
	arc=none smtp.remote-ip=54.207.22.56
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235CF606A31B;
	Wed,  4 Nov 2026 02:40:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 235CF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpgz1t1793760006t5417b2bd
X-QQ-Originating-IP: 2fnShdHWMrEg8KNG3iddKqy/WIl1P5qYuxCLcx2qxSg=
Received: from [127.0.0.1] ( [180.159.160.209])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Nov 2026 10:40:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1068051447538924119
EX-QQ-RecipientCnt: 17
Message-ID: <3B240D36F79259E9+d729c8d8-9eaa-4941-9516-401fec7970fb@radxa.com>
Date: Wed, 4 Nov 2026 10:40:03 +0800
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
Reply-To: sophon@radxa.com
Subject: Re: [PATCH 0/5] media: iris: HFI gen2 features and fixes for VA-API
To: Nicolas Dufresne <nicolas@ndufresne.ca>, Bryan O'Donoghue
 <bod@kernel.org>, Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 dragon@radxa.com, Chris Obbard <chris.obbard@oss.qualcomm.com>,
 Deepak Sikri <sikrid@qti.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Loic Minier <loic.minier@oss.qualcomm.com>,
 Jason Pettit <jason.pettit@oss.qualcomm.com>
References: <2a2gB7bYZ9q2UTG-mF855lyJvWdn3Ba6jqrFTEVO1EAjAIXMh7_-65v4XlrZmljww-5ozkNYL2-lWKTIH4oqOw==@protonmail.internalid>
 <20261029-iris-va-fixes-v1-0-44a2783f782b@radxa.com>
 <e0911e13-65d5-45df-9e31-7f99e5600a50@kernel.org>
 <6d16d639267c69344623f80ea91817308ef4f7d0.camel@ndufresne.ca>
From: Xilin Wu <sophon@radxa.com>
Organization: Radxa Computer (Shenzhen) Co., Ltd
In-Reply-To: <6d16d639267c69344623f80ea91817308ef4f7d0.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: M5aCtjAndv5OlZRv345FV/fMwP2vzC/GMK0jtvIW7aLrY++cZyZUQgRg
	eBy6tO8CUCmmKm1XYeXBRjbrWNXmFEF9DpR4rnLB8afSDC8XOsqBRwX1LVucivZbcZqCWrp
	rt50+jrBC1Lj8JpidJfTIwpoxeqI+Lq5wU2ga+/RKvur7fXcR15YE/GpDSo/F0/7vgiWge4
	oQc/HNN0vFCXze6RiSSlouz0B5DHsTDSsvlC1IXtxAdFev8kylYaUZVXyhH/uGWr/ph4xlK
	xQ8pw7s608UZ0PiLSW+pbltA+R5rbp08zE7S3F+dhI+OYX6ntM3Df6GJv2+1nxUNrkTfpSw
	mgNjXtYGJUSnPgJ98nPyXu2Hm4oj6Tt3/6ZobF+mzZhXhgHndJU7bfXR+lssz9W+VsanpTG
	ZwygRZBuFSDe6D0qL9ynVN3KyCHASjbgLmvfOs8WIeMoX/5iXnfj2zrH8DZhBig0FlA4AnZ
	Sjsy8Uqr1jmVlwhHjY08W0yPNakHpxLQKzGWuWw0Ce4aRv88GkWV7EsZPSxQVut1V3psgxS
	J1mPg5aLa6JHvBthMqP4R8nyOG1wU40j0AL3DGsD4JW0fnfFcDOO5IABT0tzY7AN9AT9uv4
	acjLcZgoQmrjVX+QovcO8afUWKxOoSpnezs4/kUXSX6B2S4nXFhNkN33I3BPZL6P2eVOU+r
	UckbPuo3O3k/tC7QbGi9JjbfMKpjyKifhpdsqJLvmM+R2S/U3I2KH5oreJy1B7GhXqdPNv5
	PqeORuqthCT1n9ZCvajKePcwpe2DOE0Q8umv3k+syyUE5J5oyP1DR2AT3HWujxR5WaE2Am9
	nb1EjHW2LqIT1sbV1bK1W+S3+cUjHrSFUGWY4PQq5D5zCXtA/HGruCMyjUZduMJWO8E2NhW
	scI1zGwRzott9ExggMf5L8fsX/mBY4ZX9HfCzKrV9BJe0TDDolPIEJI4IwR5mSnIPMcUM7S
	SNIJ8BCNZ3CIqxcvKH81ErWE6ntkm4E4TVjy1auYTAAsMGw4gCBv6NsikXyMgxb/EtTN+Mm
	nAC/XQewTqQoyFKqkY9Xt4nUa8L8/qY14sU+7NmIBJLw/8BRAM5Vqvii1zClVZU4skFO/jr
	w==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

On 11/4/2026 6:29 AM, Nicolas Dufresne wrote:
> Le mardi 03 novembre 2026 à 23:00 +0100, Bryan O'Donoghue a écrit :
>> On 29/10/2026 04:58, Xilin Wu wrote:
>>> This series adds features and fixes to Iris HFI gen2 to support
>>> qcom-va-driver [1], a userspace VA-API backend for the V4L2 stateful codec
>>> interface.
>>>
>>> It enables decode-order output and larger CAPTURE buffer pools for VA-API
>>> clients, and exposes encoder deblocking controls. It also fixes
>>> error-buffer timestamps and handling of non-display AV1 and VP9 pictures,
>>> which affect both VA-API and direct V4L2 clients.
>>>
>>> [1]https://github.com/radxa-pkg/qcom-va-driver
>>
>> Is this code based on https://github.com/intel/libva and is there a
>> route to getting it into the upstream of that repository ?
> 
> libva is the runtime, qcom-va-driver is a driver, so that won't happen. Also,
> qcom-va-drivers does all sort of guessing heuristic, bitstream crafting and the
> readme show that it cost as much as 15% in throuput performance. Let's be
> honest, this is a bit of hack, not really a solution. A proper stateless
> firmware and driver would do a way better job and reduce complexity instead of
> increasing it. The provided patches though seems to all have merit, matching
> feature with venus, fixing bugs. A bit of spec work would not hurt though.
> 
> Nicolas

Hi Nicolas,

The userspace software ecosystem around stateful V4L2 has long been a 
challenge. With qcom-va-driver, we're trying to provide users with an 
optional, as-out-of-the-box-as-possible solution that works with 
existing VA-API applications.

I'm not sure whether the Qualcomm Iris hardware is capable of supporting 
a stateless interface.

As far as I know, some folks at Qualcomm are also working on getting 
qcom-va-driver into Debian:
https://tracker.debian.org/pkg/qcom-va-driver

Thanks for reviewing the patches!

-- 
Best regards,
Xilin Wu <sophon@radxa.com>

