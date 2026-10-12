Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC694381EBB
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812847; cv=none; b=nsZg2g4feF90UFYZd0pKApz+qLdulsijl8MT7iAMXai7owURpl9Yv2V/ZKc+cgz+1sLL8tbGab3srQq0AHh7BBENyMOuyTM4LvaKbVHX9pxDzDmG4POYxEBGuor4nEyjF8raD7pgAKZYUoTZ3WB+TPgnhp/pySdH9LaK6IrXaFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812847; c=relaxed/simple;
	bh=mvoMyMEF23qiE7YbRO+z3EFZlH5bVE9dBQLlox9zVQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iPN/NXocxDKt/4nSc/80QSNk75BDwH8KQKOMYrFA5eUXh76Z1tyzueTMqla30AcUbtCV8QIIr8urVaUfzkUlXqq6LqhAjcb4UU4lE0MNqyvmmwUQd0qCYp6NrSvmCidWq9HBtITwt/Me42tgYo7jsojwnulMRarQc7Ii6zqLoO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TXJK4xXy; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TXJK4xXy"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b1cc392d8bso855771a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791812844; x=1792417644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WDpmXyGOWYzIAfqCmBiCkL6X89MoKxiD5dfOJNrnyDY=;
        b=TXJK4xXyKL7Z0gzdB/vtTB92XHZWI2Uz19d3O20VRCVjGux+32YW9jqNhDWN/LWmCe
         jMInVfAdf/YVMUp+iqg2HAf9fMWlEvK4aqeMq1nNx3f9hgWksXbBUZfh7pEdkhga1wH+
         Cb7VunNJ1+XXn+Yf0Z2qUy3S99fbeF8jjOu5/gZNRcvp0Usrtrq6Ji4u/wlbIlCB3CGJ
         r1acUFcyEAzJ0eaWo7R0/C05aq2TEFEEEcWg7lUgRtHkOrl2zdqZ4haxBPNYB6/+PXBQ
         57HjBM/w4/fb0SRzkYFv1KiDS/iJC8k/9SQBVfYkW4AUBu6rktSZtDujCjvZA31EOz8A
         6sRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812844; x=1792417644;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WDpmXyGOWYzIAfqCmBiCkL6X89MoKxiD5dfOJNrnyDY=;
        b=Zbnf08RSJx9HQGkTwfSnWbLggJh2U1zMIpV2AV9DM6P//2RONiN4gPnnEuKgRCBt67
         anZDU7RgXUo8JI32xlOSXYQkyGSongfxzMEklznf5x8ITrv+omPsWcVRf2g8JnjUv6Zr
         AFWZmskgvkzuP5xbDTcJR8IS4Zl15wTxlXsa34A0od7oWhgiA+EE46NG7tUauUWaI8ZF
         4gMKrPdbwFYkKJ7xWXz2rzTKK84jI6T2XTR/PaRiXmrhj52A7FO85qEzZFRhKnpIQcnT
         VSYTbDmGI7DefZ8lQE31qNlih8HaA+KL9WpnnE3HVnXmqNYQyn1a3umjjY1R+xAEihMq
         jPYw==
X-Forwarded-Encrypted: i=1; AKwUvBwqjYXtPSZ6FPEHTwcuBV7ZWvYmEbewlYx6M7UfH21HDmSD3LCz2onccMDNEOV+/Y0EUqIoNymgCZHTFdg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaXJNCNNWKOtlffjIuQ/WZ0sgpw1EPBjZiDmCxMj5VrrtRledX
	jeatj1v3Bgv6Tz+bocSDA/XZPPcBcrNL0AWvEWHSLetsD799FHIRVnQY6HPEIfKR04g=
X-Gm-Gg: AYBFou3hwzYI1TV26RFB7m2TZvqVW5RHqVSURhwSgJlK32bZGSs4DG1jluDzL3T/i8j
	nUkxdN1p5XKDHpVDeCcy29kk1jDtO/+bcktpT0zGBSqebnw4RRcRY80Sb2ynQGFNQKDyf7fHL60
	o3SXackNVUTKl66mmJOBSFvggcgrTyAbiTra1bG/+pqsrXwAZuTtmRzb6GM04OSECJmta/PtIC+
	uByPkt3hA0rtVzCGAl79UcJfKE87dro3oJQ0haoJmnOZ31HLoqYCCBzyc1pKZ2phqhYQZhM5AIU
	q40P6ztxxITMNpDB7PHTemj1TS0/6SckU+0BqF9kSH4VTCEcXStCoWPQ5G9c3aj4JNUKpaww5Lt
	hh7BWys5B3dws7d4vgUSxVYJB439UUb//MJJumsu0iH+KVv0bP10g+Vp+jRYN+fBqYM1SEIStm6
	yl1hntJSELcJ2qUc3Ut23dzgINcUyWDjdCRpbdGMXZQEiaZtmaYo9YRyeNMegBFYK360tKfu26z
	3bfgMfxFGjYCN+pnzsBUg==
X-Received: by 2002:a05:6402:c4ce:20b0:6b1:dd07:8e64 with SMTP id 4fb4d7f45d1cf-6b1dd079bd0mr624426a12.5.1791812843956;
        Mon, 12 Oct 2026 06:47:23 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.202.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1c27f0f3esm1350124a12.27.2026.10.12.06.47.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 06:47:22 -0700 (PDT)
Message-ID: <66eaf57e-9023-45ea-9c21-737304f6d1e7@linaro.org>
Date: Mon, 12 Oct 2026 14:47:20 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] media: qcom: camss: csid: Match the current
 set_fmt pad op signature
To: Hitesh Patel <hitesh@ebytelogic.com>, linux-media@vger.kernel.org
Cc: gjorgji.rosikopulos@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
 vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
 dmitry.baryshkov@oss.qualcomm.com, atanas.filipov@oss.qualcomm.com,
 jigarkumar.zala@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, ravi@ebytelogic.com
References: <20261012120542.1140157-1-hitesh@ebytelogic.com>
 <20261012120542.1140157-2-hitesh@ebytelogic.com>
 <6f40cf25-1967-4a7a-9952-a0fba3bb5fe6@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <6f40cf25-1967-4a7a-9952-a0fba3bb5fe6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/10/2026 14:46, Bryan O'Donoghue wrote:
> On 12/10/2026 13:05, Hitesh Patel wrote:
>> v4l2_subdev_pad_ops::set_fmt gained a
>> const struct v4l2_subdev_client_info * parameter, so
>> csid_streams_set_format() no longer matches the op it is assigned to
>> and the driver fails to build with -Werror=incompatible-pointer-types.
>>
>> Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
>> ---
>>   drivers/media/platform/qcom/camss/camss-csid.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/ 
>> media/platform/qcom/camss/camss-csid.c
>> index 2559ebe98..991275398 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
>> @@ -1696,6 +1696,7 @@ static int csid_streams_get_format(struct 
>> v4l2_subdev *sd,
>>    * Return -EINVAL or zero on success
>>    */
>>   static int csid_streams_set_format(struct v4l2_subdev *sd,
>> +                   const struct v4l2_subdev_client_info *ci,
>>                      struct v4l2_subdev_state *sd_state,
>>                      struct v4l2_subdev_format *fmt)
>>   {
> 
> Please add an appropriate Fixes: tag and Cc: stable@vger.kernel.org
> 
> ---
> bod

Ah my mistake, this is a patch for Gjorgji's streams series.

---
bod
