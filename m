Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D7C42CAE0
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791464924; cv=none; b=nFm8yFoQQlyuXTvrMZ51ghMI8OHY/knUjBYKitV/RrgBTKY0x89ls/J8ugq/9sSh7GQIcgph3AJkpaQivxcgF5O7Ex9hBk/3AKGuYXKSzQ4XW+8dLGpASz7GwbHsJMxc2yW4WpYxOIgAeO0HnAJuCzBR6xnB2pwNxNZ+n+BWzgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791464924; c=relaxed/simple;
	bh=QwH8JTwtGqJvwi5xVGeamby7ttvbkMogom5klSRXEsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bwdB1zO3dxBqKRzR2PrvboihoFlpVAzOWBfX9kvjLWNknc5jLc82mraOjMKjZ8Pi9E3NVCPP4EMIqNJ2AtyWrlau1cHlUk2FfjzrNvYlqryRpZ5kGlFELvL8RffOaz35ZxYoRdA4Q+sQFFqzV44rFYf7IOGFko1KdYpk3dG5r14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X0oLT9Ey; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X0oLT9Ey"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c3156e7705cso612969266b.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791464922; x=1792069722; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1zkMv5B4UbM6QWd5wAgGktVY1O+Cdav6y2Be1vNvxcA=;
        b=X0oLT9EyliWOrrQHunWButGnWLrnv8iI5Grzo7TvdHwvh+N1ucYZDp3dV/1xQmJaDq
         fx8NeECMI8fU5WFAkPhGsPxDBmep5r9l0sCadEvcRO1/Sa3hB8ygYEJ3ZS0a+C4sm6cb
         SOzvQFvzTQRDt3C0lNWueurrpKQO1VH4k3Vpeq7T+i8dy23abpD0ebMaWmRyFNvlVqqn
         51oWQTuYBBI3X2BKJBRmfnwJn2uawpiKro1JKr9XWs+fLi3EnYDmpLFa6HcMM9+Uv6Hx
         AVp+auFML++HELT3SNbdTgc6Jk7UPkWy+HAwt4A2+6GBepIww+K5lW1/g+bcfDO4Nwc2
         sciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791464922; x=1792069722;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1zkMv5B4UbM6QWd5wAgGktVY1O+Cdav6y2Be1vNvxcA=;
        b=21G1J06W02ywp9d7YhwKAMXsxBZZUwWws+XY7lnPl4RZ6iFOI4shYh4VjnV04HpS97
         ddSMirujDMiQjlnI3c4v6MUX6j6F1ce5M9Zzk/tHX3/innUedcJEhvpWPJ24ybXSNDwx
         CPt1J5JC4bYbykqo07IGVdNd1078dQzDoQ+xBYZf91rFqDbEGdF6OsBHR0J1Oa3/kZpM
         rLiY+AkbCC6+q8/2AOFqSmJR6ASmpnFQNCdxbTrI8Sj+g54Gl5y1dpSXpS69cP/enLOk
         wuzZBij1Bt3/p/1jc7XTQ6y2Afo+isARvtytmVxUApeER8mOooHjbyxGXpIQMW2w2qwc
         olcw==
X-Forwarded-Encrypted: i=1; AKwUvBws885M4OsXxnx+HECcqIsTIs8RGg8utYVIbMHYYcmbrJAY1hr7KKSMJuul+iu7/Wg0SI1fYrd0JcLUZBo=@vger.kernel.org
X-Gm-Message-State: AFuF++kcqELeJraHwqWQmbmVVvwqgvys7Eienwzri6qtHsUJW7JsuXGE
	ZD/4iUTikn8nISBlzUBsb9DJnHfV49CGKkG9M1hL+Q7ivtxaQsdULlf3ss2daJ19wnk=
X-Gm-Gg: AYBFou0JkfW3Ugu1Z8UEdzsNbLYMXk+lPIsRrhCCUhLKzjcRmnPNdjdP+zYYeuxVJYu
	KWDzyjnU+HWQPaorV4DmJbHT1/kAX/Bpul8Qv1ZHiIOo9o5uPx4RJSPOuokhOp8QnfSsc93veFu
	Fd3EvayBO9aSaXWo5OzU8mFdIGvMf9zOtD6bjqK1BjIYApZ5FbbHUbbejF7bCc2MtLVCN1WsU55
	Di7qOztxqiSamYK57FXgVlj36cAXzFZquIHphOt0acHPItqkJMnySn305/KamzbbObng4G9wMjs
	YcPxOIX8t9wtJU/5grYjaDjNanPCxnrRhrJs/gdspKIDHGcE/PUP7dTox573Ei5DpykIMQz6wlr
	JrsbXKw749tiiGnQUQeoNKkAQX1EAsByBhHbEZhq6l3TXLpxXlKdEt2k8nRp1N1PWp3mS8vRyFE
	hupAbLuWIWCKLl2hiTQfS3T2t9tRvEZKouQGYOSX5b/QgSNLOs9doGSy9o+EOTPbF0F0e/rEVXE
	A/Bp7JC1BKZ
X-Received: by 2002:a17:907:3d12:b0:c2e:3ed7:7db4 with SMTP id a640c23a62f3a-c317c08dd5fmr521063766b.23.1791464921762;
        Thu, 08 Oct 2026 06:08:41 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.203.235])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c317c2fd4a2sm224034166b.56.2026.10.08.06.08.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 06:08:40 -0700 (PDT)
Message-ID: <09f1f11d-c269-4cd9-9016-dc8a6d8cab18@linaro.org>
Date: Thu, 8 Oct 2026 14:08:40 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 28/74] media: qcom: camss: vfe: Add planes identifier to
 struct wm
To: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>, Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>, Keke Li <keke.li@amlogic.com>,
 Richard Acayan <mailingradian@gmail.com>, Hans Verkuil
 <hverkuil@kernel.org>, Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
 Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>, Robert Foss
 <rfoss@kernel.org>, Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
 <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-28-ed985aefd611@kernel.org>
 <6a2df7c7-274f-4620-8a56-31551536c49a@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <6a2df7c7-274f-4620-8a56-31551536c49a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/10/2026 06:56, Gjorgji Rosikopulos (Consultant) wrote:
> Hi Bryan,
> 
> On 10/5/2026 8:13 PM, Bryan O'Donoghue wrote:
>> Define the number of planes a given IFE write master will write as a
>> data-field in the WM structure.
>>
>> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
>> ---
>>   drivers/media/platform/qcom/camss/camss-vfe.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
>> index bf8dccf4c901e..8bc07fe7798e1 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
>> @@ -101,6 +101,7 @@ enum vfe_v3_comp_group {
>>   
>>   struct vfe_wm {
>>   	u8 bus_client;
>> +	u8 plane;
> 
> Can we change this to num_planes, plane is somehow not well descriptive for number of planes.
> 
> ~Gjorgji

.plane denotes which plane not the count of planes here.

---
bod
