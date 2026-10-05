Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DBD463B83
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791194993; cv=none; b=LrqaXKB4Kj+o7v9xK3vyv9FgnywkszsKpiLlxv37E6/DtlDux/uKoSojGxeF1gCOJFKsNq7w5b7/LAftQ0G46M3BZSz3hUP/kE3i7pzZA1dvwnTA5y6LF9rsLZKZ/GlfBgzzqQxbxq4GxEbPuhLwJ/BraUyHnzuS4OV+0pYvarg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791194993; c=relaxed/simple;
	bh=F/3Ral9Y1JF0253NsPqcvdFonuL+abvMZayZd3zy7ik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JBeCFDiD8Jg8lilipXrzqMg1oIGnHzC2mkTXFnTiqHfNGI9rxKdtyaHsUIzok9EYl5sySkzshZLD6c3xCfMY1Qr8plaEtNpIz/E4WDQjw9b7TLyRf4ppWaBGa3aGq4Wc8cRNf3AsPtkx0Pt/BmBQOTX4kP730g/BTfi56hDttSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hHt52A2E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VrkYCMjq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hHt52A2E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VrkYCMjq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6958xQoI1102554
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 10:09:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	emKGw6rm4cR1mwCY7FGTF8gcjw/YmbLxMFdIuBtcbuM=; b=hHt52A2EdBiBL9kl
	QCo64vOOztqI6lpUDqROgw7qt9jYXih4ftOxo6wY9bdPcgxrd2Fd/pK7HcHASsgR
	IT3KERbFyjmh8/i2C9kMVcvm9Xok2tPfkIrSQW0XO9B9ias6jKVoZHdPSL89a5Pc
	DAy5nuywW59BSOw9aaA3vNrxQfPLUT6UJrk7qew5lt2h/yKAhKsSu+5O6d9xE+8K
	a7iXJi7OOPyYBKZ5XNrMefuCUIVDjGp24jwym2VKucPMjMJlfxg3KDU7n8Z6PLfB
	wD1Zg8um2qg4WLr6kvcD2SKxBYA//0F0Ys/3EHdm6ZFcNKyZD0aH0urJq2aUGmoy
	aCytvQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssu5ckv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 10:09:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a4b70941efso1208167a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 03:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791194986; x=1791799786; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=emKGw6rm4cR1mwCY7FGTF8gcjw/YmbLxMFdIuBtcbuM=;
        b=VrkYCMjq/IDwWBG+PHNczFWwGp0uTyR3jEwJTMPnBNYq2YkvDiq9IDH6hn93LNC3Am
         mitOWmhDKeqDRAKgD091wGexw756NPHJnKHJhlqxklYpnmBXikbnGkTFVpLhXLsi7jH/
         j9kLq8+RW/OxJaa7kffIoQhpnFPy24RsBBgI7T3nl0GIX2q8k3tasYT3slvrnv4RrgZF
         ZgR8oncZ3uT5Wy2ap58QuK8QAhakVQwsAv3DJ0Gydr1gACGCGpNZG6YAaboo+knYI5Cx
         QFhi9IAqiD78YzvtBiR9Epkm11CblMuVOEPIA6p0Xj5hTOyc7fw5+WScse7DVEYqJTuC
         PB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791194986; x=1791799786;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=emKGw6rm4cR1mwCY7FGTF8gcjw/YmbLxMFdIuBtcbuM=;
        b=V2r+pnVJDlWDj+FgUrZw3xoqugynQw73qjtHWd/1n2qrS+rxSSsdQUVIOkObvVOkNJ
         eSc5NMCiiHTJaX5c+/Yktlf/yg1N2d1QdC79h84+oR7qyiz1rnLwF1NEetqpEse+QUfn
         JzL8MPhzv5aO4Easw8TpMOCrSCkJp6WfndZxGpQ2UKX26mlu5SP6f3wGuzuZU3GiO1AL
         txtLSGHIa3g+/YzzKDvJcBSwSx5S7OphCh7rLh6lSVUbkFwCWnfehND+GEFWC9hLfcxm
         kyRSueuIasYD2IaP7MTDXYvLx5npWgp6nOG0niK+IJbiaadjwPQlYpBfQqyEIqvl4r8b
         QTNw==
X-Forwarded-Encrypted: i=1; AKwUvBxZk2MZdGKwglYqtdquZnljBnggfgxKFfPUjLLmWvtVHTxdpKqOhJzhfxEPaztXKl+H/dwghTsJLYYYgQs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOUiYguxW4gO7INbYsPKZZzZ2EgsvlwS3AnvqKxhTwM0c+tia/
	ZkdbXV6YJZBqXHmC1pfGFIBwIE5eTEg/8ddsqfh9oj0nEw+PJpq3yYVPDA5LkXea98tzSvIhq+K
	9b8g9nd/i7z+RCfmVdaIX+UB/pROKxWhmk+Zz+6D3vmKHbbgaUYl7nTh+s0/njSvaCQw=
X-Gm-Gg: AYBFou0xBDZVVWTXp1MgdUahji+ft3WAblsLD8UOrPU5mc07VnxwA2HBloIbkbc/Pf6
	t3JniGP4lw2DxgGzxCWfXbOuFwFFTjSOHw+y4zld15gf8Kw0ORxDin73yfc9lLj8kJjbNW+PX2M
	ZHqh+kJycZiTFNXKsi+U7ZpNqhBImqpB9bxMQJNssynqyXgiy+OJudLaRMyQ7OiFSusqZeWOVp4
	VIswFuc/N7FYfL3ATmY0THWRnoYNSjpm3NhaJoNWnEf+VL47Dk221PfDCRCL/ZQuyjFSTquEqYp
	/gk/r8yx9VBCV2WRVSRF3LGjoCyPzy9usFUUMGJFfSEOux+AH2C7hg0UejRprbR483jLpffDU1+
	wcisLVIOHMeYN/fMZFZsB7Jb0nJI=
X-Received: by 2002:a17:90b:518d:b0:3a2:a576:f67a with SMTP id 98e67ed59e1d1-3a6ce84bc3emr7488176a91.52.1791194985550;
        Mon, 05 Oct 2026 03:09:45 -0700 (PDT)
X-Received: by 2002:a17:90b:518d:b0:3a2:a576:f67a with SMTP id 98e67ed59e1d1-3a6ce84bc3emr7488141a91.52.1791194985008;
        Mon, 05 Oct 2026 03:09:45 -0700 (PDT)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78daef465sm11066805a91.1.2026.10.05.03.09.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 03:09:44 -0700 (PDT)
Message-ID: <c42c8f3e-fb8b-48fb-bbc6-5b6532ea9d72@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 15:39:38 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/3] Add DT Support for USB on Shikra
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
References: <20260912-usb-shikra-v7-v9-0-c7b507a0ec27@oss.qualcomm.com>
 <ar50erRON6cMF9Oz@zenbook>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <ar50erRON6cMF9Oz@zenbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAzOSBTYWx0ZWRfX1q3OXqXsF2sQ
 ZQHi6zsLRUV+MhtVhW42XN78wXbRDy6yF2uwN8NL6n3DD/lY3pMz1FAEZAHepl8VPm7NhhwKyN5
 M39TH7Iuk39MQ9GZhpHUrwFWzp94Xtssx+DupYdlQRI7EC9rKn8iDKXEJTKKWni+iTw1i4/2GNG
 H3b8+6pQF3v0PEHtKrbPZrGHPaVHBXdBpj5F0YsygbnR8sDUZDp9EC+5XY/Vjj7kVQB3+07CY4H
 8abHDyxSO7gpzC+xuvDdhIvcQlPTIA4QFQ6mPa5QnIk0UflWmTm0OaS3XJq46x+H8F9BBtEEJaD
 ZJb6MECfqpi6VSgV6K+k2Z218naU3dWyHqkEq3pMscZBkViXV5O6ab3nxzkzLLcbZ6q/cW6CkGV
 j3DhUfcL3P3PM/JEguGzdTiDXNamTlnuw4/S6tbYp/zy+Rqml6MJNbE5PHavlDz8VvjOXjhO5Mk
 YuQiFoRIKxj/V3ihiHg==
X-Proofpoint-ORIG-GUID: N9Y70fALG6ZrqbKCxPT6_8A-xsdJiwbm
X-Proofpoint-GUID: N9Y70fALG6ZrqbKCxPT6_8A-xsdJiwbm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAzOSBTYWx0ZWRfX4U8pST9x0yNq
 /ekn4EBr1RCSd+KNNf0RrI7RfzQiSN2e6KzP3c8PN/VtWKNTWWLUnBmVhdQB4JWrG/+PWULpis9
 Si7kAsVPg4IdLwvDucFZFxHONrkWpDg=
X-Authority-Analysis: v=2.4 cv=XPSl2ghE c=1 sm=1 tr=0 ts=6ac3776a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=fgocQaM1e1r3VjC9RBkA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050039

On 10/1/2026 8:32 PM, Bjorn Andersson wrote:
> On Sat, Sep 12, 2026 at 08:17:00PM +0530, Komal Bajaj wrote:
>> Shikra has two USB controllers. Adding both USB controllers support
>> in device mode in this series. Also squashing Type-C enablement on
>> CQS/CQM platforms [1] into base USB enablement changes on these
>> platforms [2] based on feedback to squash related subsystem changes.
>>
>> While at it, also sorting subnodes under soc@0 for consistency.
>>
> When you repackage scattered patches like this into new series patchwork
> is often unable to determine that these patches supersed the previous
> version.
>
> The result is that for each patch I now have (at least) 2 similar and
> conflicting patches in my queue. As the patches was altered to the point
> that patchwork doesn't detect it and nobody told me that the previous
> versions are no longer to be considered, we now manually have to spend
> time to detangle this.

I understand your concern, and thank you for pointing this out.
By repackaging patches into a new series, I should have made it explicit 
that the previous submissions were superseded. I will keep this in mid 
for future submissions.

>
> In other words, this series doesn't apply - please determine if there
> are any remaining parts of these changes that isn't accounted for in
> linux-next and resubmit those.

I see that one of the patches has already been merged into linux-next. I 
will review the remaining changes and resubmit only those that are not 
yet applied.

Thanks
Komal

>
> Regards,
> Bjorn
>
>> [1]: https://lore.kernel.org/all/20260818-pm4125_typec_changes-v1-1-6e6ede93db19@oss.qualcomm.com/
>> [2]: https://lore.kernel.org/all/20260811-usb-shikra-v7-v7-2-753e928f37ae@oss.qualcomm.com/
>>
>> Changes in v9:
>> - Move usb_2_hsphy above usb_qmpphy to maintain alphabetical ordering
>>
>> Link to v8:
>> https://lore.kernel.org/r/20260911-usb-shikra-v7-v8-0-851ee4bc0eec@oss.qualcomm.com
>>
>> Changes in v8:
>>   - Rebase on top of latest linux-next branch
>>   - Sort /soc@0 subnodes in ascending order of unit address
>>   - Squashed with Type-C support change
>>   - Individual patches were previously reviewed by Abel, Dmitry, Konrad and
>>     Mani; however, those reviews do not apply to the squashed commit and
>>     are therefore being dropped
>>
>>   Link to v7:
>>   https://lore.kernel.org/all/20260811-usb-shikra-v7-v7-0-753e928f37ae@oss.qualcomm.com/
>>
>> Changes in v7:
>> - Rebased on top of latest for-next branch
>> - Added Mani's tag from cover letter to both the induvidual patches.
>>
>> Link to v6:
>> https://lore.kernel.org/all/20260729-shikra-usb-v6-dt-v6-0-72ffb4796a08@oss.qualcomm.com/
>>
>> Changes in v6:
>> - Moved dr_mode property to shikra-evk.dtsi
>> - Merged platform specific changes into one patch
>>
>> Link to v5:
>> https://lore.kernel.org/all/20260723-usb-shikra-dt-v4-v5-0-5b69d9eb0888@oss.qualcomm.com/
>>
>> Changes in v5:
>> - Added interconnects and sorted nodes alphanumerically - Dmitry
>> - Updated commit text mentioning that device mode is being enabled
>>    since role switching changes are not yet present.
>>
>> Link to v4:
>> https://patch.msgid.link/20260721-usb-shikra-dt-v4-v4-0-2e7a092d7f27@oss.qualcomm.com
>>
>> Changes in v4:
>> - Enable both controllers in CQS/CQM platform
>> - Fixed iface clock in usb_2 node
>> - Skipped adding RB tags obtained from Konrad since on CQM/CQS, second
>>    controller also is enabled in v4. Also specified dr_mode as peripheral
>>    for first controller.
>>
>> Link to v3:
>> https://lore.kernel.org/all/20260716-shikra-usb-dt-v3-v3-0-13f73a0571bb@oss.qualcomm.com/
>>
>> Changes in v3:
>> - USB changes were sent as part of consolidated submission in v2, but
>>    they were later dropped since bindings had to be updated.
>> - Remove double vote on USB3_PRIM_CLKREF and also removed xo clock.
>> - Uses &mpm as interrupt reference (sashiko bot)
>>
>> Link to v2:
>> https://lore.kernel.org/all/20260519-shikra-dt-v2-0-c01b90fb4395@oss.qualcomm.com/
>>
>> Changes in v2:
>> - Moved to using mpm interrupt handler for ss phy irq (sashiko bot)
>>
>> Link to v1:
>> https://lore.kernel.org/all/20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com/
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
>> Komal Bajaj (1):
>>        arm64: dts: qcom: shikra: sort /soc@0 nodes by unit address
>>
>> Krishna Kurapati (2):
>>        arm64: dts: qcom: Add support for usb nodes on Shikra
>>        arm64: dts: qcom: shikra: Enable USB controllers and primary Type-C support
>>
>>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts  |  43 +++
>>   arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi |  41 +++
>>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts  |  43 +++
>>   arch/arm64/boot/dts/qcom/shikra-evk.dtsi     |  12 +
>>   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts  |  23 ++
>>   arch/arm64/boot/dts/qcom/shikra.dtsi         | 515 +++++++++++++++++++--------
>>   6 files changed, 536 insertions(+), 141 deletions(-)
>> ---
>> base-commit: f2bfbc3554ca6919484030729424b9dee2942d24
>> change-id: 20260811-usb-shikra-v7-2dc0d3afc3d4
>>
>> Best regards,
>> -- 
>> Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>>

