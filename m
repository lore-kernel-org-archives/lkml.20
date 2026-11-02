Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634881;
	b=JzEcWYC6iJLl6e6mNrOS8kWtlq4NnoRt63eYpLzxItrDpyVO1InY14XEIEaDbG/HaWyt
	 3tjp/nABHL8xSnFmPgBRB9tH70QO5uzb586X0zxitGmYVQMPBYPhX3wEKCFrTz9PEDXU/
	 1LVRpbRaNhQHi12sS3ruMTmlVvybTUelK6g7V44civCXqBKyI76sYhq8Wedwzz+2C3cd+
	 a7x10QzJ2GS89mPObbK6onevOLWxv2YjpOJIeXYED1W3f1Ezx62HjUNCwi5IukVNYlLxW
	 S3sgWpwSt9RuAdLvkA5JRaGcCllVP36i69YZS4iCHQIULbqLVRvcyW+WZX+Q0qtQMmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634881;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=vn+1zZ+E+vaOD7UpEKJ9Trld0l/HcprwkYOwtqDxBhw=;
	b=WjV5pV1oa07D0jZaYd6MZFxgyYgjI3dyMK0YdOA+rG+D+0eIk7wZG28DFBQDjfU73niv
	 zA7CGxWCBuTl8xpLa8QyNl+ORv0TWNZtGfOm3OQhDPAyUhEs5Sexh5WLHl1HXWQEflOlN
	 Gxol1SXJkPz5t9sNL+2KDzc8XOxdWBdDKiLx5xDMlpll2VWjrMXxRV22AY1oIawDSwOrn
	 FZMV/XZVbotI+dl4o8+S1ELLilheSKdvcFGs/yP/W7oVZB5DfC8WBAudfvAGfU2YFdjpq
	 d+7H/FINynI9Qc5IgWARo95+3y/4iFlPiKfanJo2CY4LSa6TPg+imlmmsLJA5dz2Fjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BWMmXzkm;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B48E607A89E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B48E607A89E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BWMmXzkm
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e20edd106so2455215f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793634878; x=1794239678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vn+1zZ+E+vaOD7UpEKJ9Trld0l/HcprwkYOwtqDxBhw=;
        b=BWMmXzkmGLAyuAKGDeNwXSZSdNa9i2qcUcm7Wfror1xr5VLKrB72XOi/Rgh9gHLR4Z
         x99aNPyvfe44OogDyVAcXXRPH0TDxX12JD36IY0ilc+2KXgcYhN7I6x4OKwhM2g4JLTV
         4bWEGcQ3g/6Wzn6OyFqtSJMInvkluZKQf4Pu/YiGewi+KvRvzCzxtpr3GrtBZ7tz/YSw
         411/HaO9pVlaeXzLqZXhdD+vczhuCVIgS1fFmwl0wm8h6nifeFhbdg9SqDnWmm50xY/E
         mQlnvq+pkzXTquZAq4326+yrEkXYbUixrSA5Ho6naXe3nPt4KNsUNTsZ0T5eyH1SYhI2
         x1uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634878; x=1794239678;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vn+1zZ+E+vaOD7UpEKJ9Trld0l/HcprwkYOwtqDxBhw=;
        b=mXd4RJd6wjnQG6TDqD+vLnuu+F7lQ+DelVymLRy87t/03pSwaqDZ/K7ljRmwZuF6tT
         ObNe4UCqSXnyPwT8rvJVJvhw95vGlYYTXDVFxuaXc1oK9V6orKqwdSjJ6jXxfbOeK5Aw
         f8Szt6ZotpzQyHS1jNXZXfKYAeKbnu3gP/v4+1M1KvnLiuoPCKC+wCa3d9CFhDuzqzBq
         8igPx8yfYguxZ0YhwnXWW2tgMqqGpNsYobOPpEiI8PH+K3ksRjy/aKo6ygZ97fqjSdil
         LushO4AhOq0n6hOV3wDtPuv1EZXfnj/tJ6TJH03ucHWEI2/YmnDRJOXt8GvBc4ePZS13
         XLLw==
X-Forwarded-Encrypted: i=1; AKwUvByDt5HbiJnugNDcl+9KrqmI426waoptBIKAU3b9n34gKSU7UhcL9tAl5O0r/gPkrt21EWPgQfztAQhOi+g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Pa8mU6W69w8PCvPrh8kFF55SaqDdTYQ3zTkS223k9ywZ5goFn
	CJ97x+AGPqxhV9wPg9Ct7WXN/X1AyvjnEF8r+2RKRK7bFdVoCHYa5SUncBAX0XlRtXg=
X-Gm-Gg: AYBFou0UXDbN5w8nmUAmJo2U5FiGQmhm69E6h5EEpjSM16iBun2dJfxNwCjxNISv7EL
	yHEK7h5BKGoIo2uqTo6VJF4XhXvTZdqujvBmams2kD/UhLnXGzL9Xn9oBXpQ8nLhYcfN7yJqqYa
	sGSUYdbxuPQwZcjzS3+Q+AXhm+ZcLgIXGE3pKDfVK3cw/ZjkbuRdlkuqLQenHgNGP/RsldBA1t0
	yNSqNGohy8Smn2sUVGvcKwQ+mzIlZ8XvJv1Kk8yKKKXdBMHZT6Fbf90qpPacyx5imFOWAOr3rrL
	vSwGQR14lSIZpIxr/+apfr42r8D8Cgu9sf8ezQWLABajG9xH+PQPeGESGyv5DhqrQrSjdIl7ZRD
	K0eoEeHflRPX9uJrnTPAVS1I4gM95sK+KxgxM4Q7AoNfvDNwF/4HqOsXekTtOJkN2YrV5g1f0Ma
	T5Aj9xauupAxbM/4pBZdCjeSXjkgG7bwKR2euvcPgYWAShNA6V61/4L13fwd7MZIPhOQm5GZLu8
	GprtiCPxfmA/K4nXgIvSph4+Ya9tLd/tCKbbL8HpNHKpil9jDm1JnakMRUJXDUbeV9DzwcwLlvN
	Fj26g8n1efM3UkRHu3OKW0RYMuBCBbuPGvcEz1Iqblt78WiQAlK62YJZGFI=
X-Received: by 2002:a05:6000:4a0a:b0:48e:2448:ea23 with SMTP id ffacd0b85a97d-48e6e307864mr24148547f8f.55.1793634878411;
        Mon, 02 Nov 2026 07:54:38 -0800 (PST)
Received: from [192.168.0.167] ([64.43.42.35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d511sm20298463f8f.8.2026.11.02.07.54.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:54:37 -0800 (PST)
Message-ID: <0785069a-eea5-440a-a12b-3c01a02b579e@linaro.org>
Date: Mon, 2 Nov 2026 15:54:36 +0000
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
Subject: Re: [PATCH v2 8/9] media: qcom: camss: Switch on frame_sync_en for
 x1e/x2e
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
 <20261102-v4l2-frame-sync-v2-8-25cbed7a772f@kernel.org>
 <c69d072b-ae69-4f87-aa82-d3cb4b1af82b@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <c69d072b-ae69-4f87-aa82-d3cb4b1af82b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/11/2026 14:32, Konrad Dybcio wrote:
> On 11/2/26 2:56 PM,bryan.odonoghue@linaro.org wrote:
>> From: Bryan O'Donoghue<bryan.odonoghue@linaro.org>
>>
>> Switch frame_sync_en to true to track and consume SOF/EOF data.
>>
>> Tested-by: Bryan O'Donoghue<bryan.odonoghue@linaro.org> # x1e CRD
>> Signed-off-by: Bryan O'Donoghue<bryan.odonoghue@linaro.org>
>> ---
> Is there a reason why it's gated behind a feature flag? Will
> exposing a SOF seq counter that's always zero (i.e. not
> implemented, never bumped) have negative consequences on
> userspace?
> 
> Conversely, what information (i.e. platform list) are you
> lacking that would let us make this non-opt-in?
> 
> Konrad

Yes.

To be in-spece we should already be incrementing vb.sequence not on 
every RX data-frame but on every MIPI_CSI2.SOF. You can't just return 
zero as user-space wants to know about sequence numbers.

---
bod
