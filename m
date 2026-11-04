Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822987;
	b=ecFTVy2/elZLy68W06u4qgnQUIIo26Xppm/iWX526v00JgMpl3Tc/MJ48ku2EFeA6BV3
	 qjY8S3+jVdzXf2tmRQNc7NcvAF4S9dG+4HSWiaKFLLWoQ8cgRyhUNrEg/40dQN3qQPtet
	 lcQH0Tp0gJ0UDo96jK9IMIh7A6aCEomGyTi4xIIWfJp0S06NkxQHrqwRa52iJNkKgQQdz
	 WR8I7/xi6/MNL7AcYEI16ZHGbFHk0zUd3jlrtRbl6mme7loy8Hz50bxYkQckxyBDvNRf1
	 HB7jdOaP8iH5RDbe9hjzypK1mmCobP3wJ8I40sraJ1YvgxNrNG+UCsRFlQ5J0MB+X8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=7PJM4PbhJHpLhbWOLitVKtM/DyGHKxiR5hSKnNJAjXU=;
	b=XY+PNvwpE3sJ6Bci6/HmKfmxBKTG2YlzSTgQ1J8HdFKTCCPR8/fWZY98MTj0xB05oazs
	 210xtlJQOv6TtF81SW3LxFrRIJqs3VYJCnPB+bN723rHiE6tRVSIoim1/mtqhkrdnOFnv
	 dH0HGDucR5bgxT+G9zSh05FHtRjjWnFQ2XSlB2IF/zuOUrPF0wiaNfIRKo5cpi1VoKj4f
	 AeExDTYw2fweUZyDN86wm/U9Z9Pvvy8CBycika9zu9IzkOzlLKd63ZbeMgW8RsLaUcKzi
	 mTgAU6bJIFDl1/VQui84Bkdleq3/KdgwAzWZXlrB+CJoLdgSMMgzlDZy3vHXeUF67Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a45YS1Xc;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65E36070F36
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D65E36070F36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a45YS1Xc
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso1898318eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793822986; x=1794427786; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7PJM4PbhJHpLhbWOLitVKtM/DyGHKxiR5hSKnNJAjXU=;
        b=a45YS1XcZYiSvN/+A0jIa3rWTLWJ/IzdfxjgeD9DUHE8RI1ig8G9b042/i5LxmkJrc
         ePRtaEVDBQbEPe4UjVMYQYg45+/fX8F4w+AdddwlOc1vZWjJc2e+TlVcthwliZBLx04M
         HCCnJttpgVSL6bzW8ECkMho1UciQkxFw8ZCWp6RM3b115fv7iSkWJkEG2Zak+k3oo3Yx
         IY4h/I2pbdrlJJJHsCQpUOSKHoH0t4WnR+oTm51TT9Cd8xyGn1zSXYVhfvaifLVH4rf0
         vdeRYsqcn3MqktNQR2vEcQk5FvZFlyS69S/a0oiE3bSsIqhADGPf2HrAwArqIKMOk9mS
         WqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793822986; x=1794427786;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7PJM4PbhJHpLhbWOLitVKtM/DyGHKxiR5hSKnNJAjXU=;
        b=fMIy29G5HELLBe7d6Ewy/dC1nNSLBattKeYiPR8Ot1fVnPwxdhe0Pt5Fz5WyIQrEki
         22BfzjKIql2nGNu1dB0V82E15QC2OMjOFn0xDa5OlmfGvhgjXTw3kjYjc8Tf7yxPUtA+
         sAW39ftMBpCk4tvyIjmUbxnUvgaK7m0eILErFvxezUU00QLhGaGhbeGAxXFw6mwh2nAq
         61pbjiqCruaK8oLMW4+8LT6ohUkI4WFkbRLZepkym8svvqYV2oF+Itn95ISEVr5GfmSQ
         GgzzDV0YhY++XcMs0orwz/MbTaOMWWpTzsekLU2eQzQrDLsMz4NwZuiXi+em3b0+E5OF
         bzjA==
X-Forwarded-Encrypted: i=1; AKwUvBywHspAjN4CFDBA8GcRUy+vz1PisvYDPD7G2NlDlM4SZgrSUiYyK83049Ic7Ccg7M6aPa5kztic9wm8W/w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Y5jHApfzyyBpfCsdyhzyzABun2eLXX6bvNiVxoxKQA9X8Ns38
	xu7K2av61qB3yBQTSq9JYJZhLRB5rlCeY1PQ1uWKLfq9GTb0BsXX7b8R
X-Gm-Gg: AYBFou0VYGaij6E06QnFT/OHxajvTqnHLHiunkF5eWqpyHkxiG+7payO5RnbbTWWfpF
	8wJzEnSC/aQy82ZecNJp13dYNWlkvZUboM7NTjzJfhAhqshO0y4n11s3bQSL0Fxk9P44tY0t1WF
	37USYkEKDugXOQR/VNJyL8dqpBFVuGj4fPOejS+ZanZK46YiWPrm8/5Rf1KsB0PVIyp/nht4AEo
	3aC/TRyCcvV5M4SrAjGCbiioI62C3/592mKkj6yfNz9zeJ9pm3S3Y4w1Yw4aA15PfUapdQvn6Fx
	rqyvFSbAMNDt1Mk45AeX458MXW0e3jgdPqQ3wn1LPZusWPPK4e+AE0+4mDcMA5igERVshbkSBgV
	1grtza+rSnGRIJ9yrl7IFflBOnjCqKOmh9clxxsnRn6uVY8wNGZVYQUQ/fQ4Yu7kGxn8uDP49dm
	MNqQ0kkH3w0dBC49fm1QSb/Kfmj2vao+vn/vUadICHRzyju/B8dnOwDmhcyZXHjMujx7o1zSaWb
	KtQNokHZMwmCsk7yacIVV5OqIftaXK5UPTVq3kUWkW3N8JPnmKsWZRtLEllz509kqyvXRBnr6aA
	O76rCnvs+WTjF6ihsAm4pNkzeCk1+HoPVwH6COS3QFTkbh54FD4a7qbsfNMXVyUKFzWTAg==
X-Received: by 2002:a05:7022:3a8c:b0:14b:cf58:ce5e with SMTP id a92af1059eb24-1ac4fa14bc6mr29667079c88.0.1793822985762;
        Wed, 04 Nov 2026 12:09:45 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:920a:44a8:6f02:232e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4706bsm12494370c88.15.2026.11.04.12.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 12:09:44 -0800 (PST)
Date: Wed, 04 Nov 2026 12:09:43 -0800
Message-ID: <14c52f5f176b8fc6aadaa31c9f4715c0@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Guanglei Zhu <zhugl3@xiaopeng.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	liuc63@xiaopeng.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] Input: cyapa_gen3 - clamp the reported finger count to the array
In-Reply-To: <20261103084135.426629-8-zhugl3@xiaopeng.com>
References: <20261103084135.426629-1-zhugl3@xiaopeng.com> <20261103084135.426629-8-zhugl3@xiaopeng.com>
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
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Guanglei,

On Tue, Nov 03, 2026 at 04:41:35PM +0800, Guanglei Zhu wrote:
> The finger count is taken from the top nibble of a status byte the
> trackpad firmware fills in, and used to walk the touch array:
>
> 	num_fingers = (data->finger_btn >> 4) & 0x0f;
> 	for (i = 0; i < num_fingers; i++) {
> 		const struct cyapa_touch *touch = &data->touches[i];
>
> The nibble allows up to fifteen fingers, but the array holds the
> five touches the chip is documented to report, so a firmware that
> counts beyond that makes the driver report coordinates read from
> the stack past the register block.
>
> Clamp the finger count to the size of the array.
>
> Fixes: 9f1cd857518f ("Input: cyapa - re-design driver to support multi-trackpad in one driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guanglei Zhu <zhugl3@xiaopeng.com>
> ---
>  drivers/input/mouse/cyapa_gen3.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/input/mouse/cyapa_gen3.c b/drivers/input/mouse/cyapa_gen3.c
> index fc3fb954523b..fda807a4c141 100644
> --- a/drivers/input/mouse/cyapa_gen3.c
> +++ b/drivers/input/mouse/cyapa_gen3.c
> @@ -1149,7 +1149,8 @@ static int cyapa_gen3_event_process(struct cyapa *cyapa,
>  	int num_fingers;
>  	int i;
>  
> -	num_fingers = (data->finger_btn >> 4) & 0x0f;
> +	num_fingers = min((data->finger_btn >> 4) & 0x0f,
> +			  ARRAY_SIZE(data->touches));
>  	for (i = 0; i < num_fingers; i++) {
>  		const struct cyapa_touch *touch = &data->touches[i];
>  		/* Note: touch->id range is 1 to 15; slots are 0 to 14. */

If the packet reports more than 5 fingers (for example, if an I2C read
glitches and returns 0xff bytes, which would otherwise pass the bit
checks for OP_STATUS_SRC, CYAPA_DEV_NORMAL, and OP_DATA_VALID), the
packet is corrupted and we should not clamp the count and report 5 bogus
touches to userspace.

Instead, please reject packets reporting more than GEN3_MAX_FINGERS
with -EINVAL during the header validation in cyapa_gen3_irq_handler()
and cyapa_gen3_try_poll_handler() (or in cyapa_gen3_event_process()),
so the driver treats it as an invalid state and reinitializes the
device. While at it, please also use GEN3_MAX_FINGERS to size
data->touches[] in struct cyapa_reg_data, and either fix
GEN3_FINGER_NUM() to mask with 0x0f and use it, or drop the unused
macro.

Thanks.

-- 
Dmitry
