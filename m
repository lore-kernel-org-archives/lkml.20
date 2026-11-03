Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793743061;
	b=xKvPa0n/iZYTEZrKtV9YVa90yJquflU3x+qMvL1FFJkHx+IR17CAmdrt1+b/zMuK8yha
	 XOk1bvBQFGh+9yNpQ4vLlfkXjLwCdmneAcqEHv5MoH3J7ehKwBf/jyFOMCQ9K4eQCWQir
	 xob7TbdUicSiR7pCJMNItyoBAeGHhEiv/zRKon+u0ZG92Q/NIq7TecU8ydXyEoejsPDxh
	 VIi+lsQU0Nqy4Cy4yZwEBuO9rD8aEocXKiCLJc+uG6phL7mENfxLtGTz4SOjAnMBgx102
	 wEL26mKJQGhYE3Qxhergv9u2KS/4VI9DJ76CX7j2hsT8QhXdsAGFLBd8pY5IcVQRN9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793743061;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=5qvu1xb+d/MUKril1XvEor90j8ZJr5uw9xfUutlGO2Q=;
	b=deJXFPo+xUArVfLECqbAA7GVaEOHz5+r9OPtgzmvNPkAJjOnLmlGMTEZY0lr3em8GFsK
	 1k/yE969HnRK5DOnxLWbAOoRwelDtwNep/HkowX5V437z68u2qur6TMoxuv9u1IOqYuWH
	 QIcRsheHpPKcIAAaD3HxqYrfjliWtDLasyJ94FMpK376nsSLkmHEE34EJ+VCjirEcCml8
	 /ZB9f+9tK5BbanWbY9PxFK3XZMSdscxTUGdfPkYbWnASFenRNQzN8pVMRFBaO7BV6mDxF
	 ptgTq5MfXtANrajrdD2liDD0hU1yCRskCnjTMi4F5pGjZ2LgS4LfxwKhoQFjzwiNMFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ciTFYsnY;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDFE606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:57:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BDFE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ciTFYsnY
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so14962675e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793743059; x=1794347859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5qvu1xb+d/MUKril1XvEor90j8ZJr5uw9xfUutlGO2Q=;
        b=ciTFYsnYA9egDET7TvFrF2gFIsn8N5r99Ihufh9hMGH/MSqIsMG7zT1HMTHRtrsQnF
         Nz7jLQlJhjyX5Vsl/QxKpzI+MagBOV8khk1v6z7f7vklp9aYtgrpiMlDm5yCWDK2QB6n
         882t41ioU366uXvudJLhXHKCu7SYSG6WnNXFqaQIX8yDfbWrhAy6/FvuTD7BsfLfIfpN
         09uvnZfOu5C4IVFYVsKhBZH25ftq9VSyyZfBTwuJ6WAyLSf7fckiL6gkD59ctvHFq+lV
         p4jNLAD2+LLxxETHDbvLRc9QqeYt91rfJzH3i6kZW3TR9FQ/aVTOyiu2qx2WKulyq2Vg
         4qew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793743059; x=1794347859;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5qvu1xb+d/MUKril1XvEor90j8ZJr5uw9xfUutlGO2Q=;
        b=Ra7U8/sTBACPe7+sBbGMiDzRXEVSZS8E2DXGat/m7QWrcnzfO3Tcsf9lOe72SGSMJk
         +PZF3ZqGhzzTsSMizgHofUN8rGhiB2Rd5/2CWr/DmVFNhcbU/mRZX0v0I6PglYp/hAWj
         XDefm1nJefIoHXfSMKl5MvbzqAtmj3wgi175kFxhQXBSQqx8x6MzlHNpthD/Ch3BtaR4
         It6Qs2R9uKQreA+wLQ+hpIFEkAu0YLqeDo9FM07/1dcpaAu+Ab4IMuCWutZaCg0Cf56R
         L3d2K1OIhdF9fm4pFwBxJHVNmjoqRdCmYYshpgAsYUdQ6xqruPEDC2g7wIs53FZErtuk
         edeA==
X-Forwarded-Encrypted: i=1; AKwUvBz6O5ZtRmlvoc2T8VTsnPKhiS2cD2Ln5p+MPvhSyzHurZ+4lLc2TP+AwpPEW5UGfxOrOn4cHrF/UkWVGPM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pmOtPxZRKOXriIHoenYhZ8gKv98C7cROAwP3hZBfgqSIHWt4x
	6e32DqYIXCnEd4ySpokVF0mcrWjSAOO8xl5SnxqCv6SE+VSHRkX7vQuSmc9PAD4xUhA=
X-Gm-Gg: AYBFou3Mb6T1Z4e1axL+tPzTM/y8UJWE8J6byCb7X0twWgnIFakeKxCCSKHWfgyS3uA
	mUDpIilUe1iYKTO+Q7AHN1p2Dw+y62Z1C7R43OXZki3qKj6XBDUmV3ZYioA+MGsDdY980/xg1v2
	EDxdBghWhJhhZJ44lM6R7zgC4t+SEOdUf7PvtUTxyAXRCE8NeTw69AEU/X6nSFtOszQdvWy6Js0
	gpudViLEuAkKoBcNReNXitI3AyiiN1v89JInEZA8WaAtbl61ZIswmF5lh8GHCCc9V/YXPp1SGDB
	KpF62yEZuPQrMYz0wk0lEn/dq8SbXj2Rw54DfsHuiNjbWTxKRzJGu/jY/i1NfrLg2um1URuy5Uk
	X4q/3a8aYfL7OZRaz5jR3mJrtBnqKJcpPY9o/T4TIej52adUutUaKyrD3ATlTnmEOmJIGb9A5EW
	jiAV8vni4OGWQDOiDPO0uV+UBjL7rs/c8T3BSP8Jt/XxBs52JfAUkCxvREt7geZFbzIyxHALCKZ
	Y1+mXm3T6QEbb6Xr7MGJRCZ+839YevEBleWiT+SlzTGXFswvojfHrlBHl+dvRR0awiv3WZmpCki
	8/Gw/AC9bRcw/PVH4qdPQlivkPD5woEpl71p
X-Received: by 2002:a05:600c:1387:b0:4a1:88df:8a2a with SMTP id 5b1f17b1804b1-4ac1793e81cmr346452985e9.13.1793743058801;
        Tue, 03 Nov 2026 13:57:38 -0800 (PST)
Received: from [10.144.41.45] ([64.43.50.75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43d4cc2b0sm3571605e9.13.2026.11.03.13.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 13:57:38 -0800 (PST)
Message-ID: <fcdc09bb-7f70-443c-942c-81f50a695aee@linaro.org>
Date: Tue, 3 Nov 2026 22:57:35 +0100
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
Subject: Re: [PATCH 4/5] media: iris: Preserve timestamps on error buffers
To: Xilin Wu <sophon@radxa.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
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
References: <20261029-iris-va-fixes-v1-0-44a2783f782b@radxa.com>
 <9YPKYT3Qcls0jbUWdxOqIWNLjQSGexDoWWE3PUBiJS3UpxTN9rFeicV5aeaeTDyrXqw8emy9LBK0hkxmeEqthw==@protonmail.internalid>
 <20261029-iris-va-fixes-v1-4-44a2783f782b@radxa.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20261029-iris-va-fixes-v1-4-44a2783f782b@radxa.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/10/2026 04:58, Xilin Wu wrote:
> Clearing timestamps on error buffers prevents clients such as libva-v4l2
> from identifying the failed picture and can cause synchronization timeouts.
> 
> Preserve the firmware-provided timestamp when returning an error buffer.
> 
> Fixes: b791dcfcba3a ("media: iris: Add handling for corrupt and drop frames")
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>   drivers/media/platform/qcom/iris/iris_buffer.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index eb8de60c1177..f790483d13d4 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -899,7 +899,8 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
>   	if (buf->flags & V4L2_BUF_FLAG_ERROR) {
>   		state = VB2_BUF_STATE_ERROR;
>   		vb2_set_plane_payload(vb2, 0, 0);
> -		vb2->timestamp = 0;
> +		/* Allow userspace to associate the error with the input frame. */
> +		vb2->timestamp = buf->timestamp;
>   		v4l2_m2m_buf_done(vbuf, state);
>   		return 0;
>   	}
> 
> --
> 2.56.0
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
