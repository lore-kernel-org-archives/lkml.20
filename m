Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B853A9605
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856802; cv=none; b=a8sIVd1NX6rFFjIkh/LhZ/yZHxd8QXV6yHdj7GP0VY/oiJcJ0otXpnURMI+YwKYACyfPmvcYMJc7CMVFWftyJYbhsThlWPWRAkzl4w/A/JoadoDCVyzKGDzJ1ouXIRfUiJuGqXUvQmZbWlLMMky2Oj6p0HyaoXKeq+8LhbZ3lsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856802; c=relaxed/simple;
	bh=xxMqH+7cUJJ3V8puKUGYPz0SiDAyC+IQiFhBdon4ZKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FnRG9dvpoH1Inj1QZpcNEAANo1k+F/b6xhRNlXvzLFNSTGP8Uzej1mKiMa1E8itCHA+5UGrzuDkWtM7/PHFuCdFRoZNVxUg1q0o5yufZCx6Do/eAuBrjzlp1AEPRN8Edb9Fuhc/BJGPmMuiEd4A5GVi/2AFq3aJDC8PmKCoSl/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mm9l/doq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kasm7Rkk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mm9l/doq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kasm7Rkk"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M2OH2363258
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 08:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	liMTX+5W1ZhScG/VtPCEXcVGP5PSRJI5VVuw8P97m6A=; b=mm9l/doqRsf8Bc5n
	wAGT9LOAROOQh1pUSyZ1rIGXOuVoDdTqBSZuFjBsS0L1XeH+89x4BxdgpZaKrbx3
	iVR3ajG/3eXLVOoAcN+kESDPCW7w8kEdY5Hsfh3oda6OOKtjDoQQPYKxaWLb4cy+
	nL5VIcrzm6PCUdQnGi2dnfeKovg1d985Z84C3YcAqKUvcbAj4aI35y0aCWqhLC7r
	+gRBgwXk/xZMNDRGywoyR0YMA+ifM5tSprEg+fB4BpaGYzYWXSc47cSNi4F9VDDI
	N1yt4KVYT+uPRUhdNxoxhDGvNLqpIqZWKL3aVZEvgw3KYz4T/qUc4hcOidwt8Ete
	n+gapQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjaguh3nr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:39:59 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9104c2ce026so74930346d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 01:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788856798; x=1789461598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=liMTX+5W1ZhScG/VtPCEXcVGP5PSRJI5VVuw8P97m6A=;
        b=Kasm7RkkOEHrh1QZwq/3buqccc2uKDdXwiqi/rA2dXBCW2pjWw3XjiQrBEdyBzurLW
         2ceiDbCRNhPbuQYFQoYAcnIKpexULt6xZnHUkOHbLDENAzR8F7VUfJSWE4abq1CQF4o9
         gpicHRFUzp4sSpzkQKwV3izSuv40OMMHMwHT2ugD8v6CQOSht5OqV4VnIdzSvO1jRCay
         CiL8PmoACsYdQ25z05sXSOo3SZc/VpkHf1GnucEwHXBE3NOLDyTBGXGTdlsWj7h+P3ub
         VWTVyTs7JfVZWf2kOnEXsbT5aQ8saqQ1UK5+ANLGxSa0ZdulLBa06mNfOHPkUqdXuLge
         LaZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788856798; x=1789461598;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=liMTX+5W1ZhScG/VtPCEXcVGP5PSRJI5VVuw8P97m6A=;
        b=J5uAOPJiX25F1LL1Sph5g/fIVTELITSAXbgJAVQVPezH37Jlc+DC/EQ4vunZFwJXm/
         7N1UBOEveCRrCjYYdZiuKurTE0vhQSgKlIH8n21nuB58qn7G7H3NJCc/eHfSFQaVi6un
         YUPTTY12ham1cSx9uCdlF3RuKVm7mzah3iSPJttNcxj3cmieaLSJlMSd3z8CZpsOQbs+
         PBrWgtV1JVicFQ5DtwWHjrAaalENQvXA4A9BBQMONzlw+e8pamJMfNNYl8xzLhbLvOZ8
         RH9b2QcQdNRd45VGvJQm2TTgTdjGxv751GgPQH9qn2fNZCVQ9vyKxc2dRDs6R/82jCE+
         5AAw==
X-Forwarded-Encrypted: i=1; AKwUvBy4tuvmTl/AwckrIjiQC08z5ILSmfJkpceuUu+bSHWz0oGuufACQUxaxTdmr8Gt2qj1j9zkpAjgfx9KIC8=@vger.kernel.org
X-Gm-Message-State: AFuF++nhR14vmWBHSBLXE0w7d3kABnJcqm6wG3dz5aD4gLlADx4m7yvD
	M26XxG9IJ56PvbkfxeNMSeXta7PnZzbgGY/gwqz3PhHeMF4pdPF8rmP4uS0JnbXEXVU8u1hN2Bq
	Espf8bjXuJDFM9pI3ycMKYykQg8nvvZlwZ/UT9TCjm8nB+8EpqfuP9r6eoGUxYWeKQyY=
X-Gm-Gg: AYBFou1qQaGfhYsGFjkr3ugPbqUhazuC1ng1AbZixq5d2IWUa/noStzc19BekbvTV+K
	zEgm8Hvw4tiEMKhqtC7qSMg8M/MiFvVTt7tTdS3ZinBcI4P7AtSFE6TUDyfxtCCJSJ7hHwjVDG4
	J9oFF8iMz3MfihiPHe9QZnAZ6RDD+py3yJNwRbHzNyjqZ47uYTmruh94fSgOIi9Sm0LlJN2JzN5
	H0vS8vQ8wfIuHtvbEAPZiFShJZ6mx0k5jZF+8sXreXPt3U7LlH97BOTWHF+dTB5UFUQ3/5f2E+q
	K70Uyd7RbgPaQN5JkRMPpjXfrcIyjdxLMJBGy1erEovgqkAsrzA0EEdm5Gmoh07elWbx1TBq3Y6
	zjHGr/m3sKWcF/Og3CI4cpT1OzECD
X-Received: by 2002:a05:620a:2617:b0:939:7683:33d5 with SMTP id af79cd13be357-9398037b951mr3141905985a.19.1788856798440;
        Tue, 08 Sep 2026 01:39:58 -0700 (PDT)
X-Received: by 2002:a05:620a:2617:b0:939:7683:33d5 with SMTP id af79cd13be357-9398037b951mr3141903985a.19.1788856797991;
        Tue, 08 Sep 2026 01:39:57 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf755c22esm377307385e9.0.2026.09.08.01.39.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 01:39:57 -0700 (PDT)
Message-ID: <6380c418-afb1-46a3-837c-582175d51cf5@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 10:39:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] drm/msm: Properly handle msm_ioremap() without
 name
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-0-dcf8956878ca@oss.qualcomm.com>
 <20260908-drm-msm-hdmi-fixes-before-eliza-v3-5-dcf8956878ca@oss.qualcomm.com>
 <51fceedb-2dbb-483c-8eee-9409ca61b1cc@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <51fceedb-2dbb-483c-8eee-9409ca61b1cc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TqLWQjXh c=1 sm=1 tr=0 ts=6a9fc9df cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=JWgyNuB4YE4UXSG_TMQA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: h7g2akBeJGYpmn_zJ_Z-8pu7puiy_4Jn
X-Proofpoint-ORIG-GUID: h7g2akBeJGYpmn_zJ_Z-8pu7puiy_4Jn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA5MCBTYWx0ZWRfX4Om8w6Ggw2Zy
 RrS2G5Ede3x1pqW1wGTOja7EOElQ0XwxU1yzMennKY3L/BtDQ+0hJAuDTpJWZOYzrhJXOUOJfbW
 GVDRsyWhWNCYq8AMioGT4Vc+Z0sjLX8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA5MCBTYWx0ZWRfX3s9VUfIyPsoF
 zWT/y3pooEc5uFdIDrjesUVkxBEsCsKBNUSZ3lZq0lXNcnSsNboUx4USNkiLsYo11W1MXUEi+3Q
 xIo4Royh/0pvV26k/pebi6dvDQ1cgIAxfl7tVhofy5kg2x6HuQBJSniLcPkdwZ3+Dtr3Oms6l4R
 mm1SWKC3ZDA/6zNecnHkV/yQj0tP8ZRBjFxHY0pK2BRU7Es/LD030TqC7hxTKoH+d9oP1H16mKs
 2GlKqE9iS38vK7U31oJUdHU/fZiRXkmTHigXhqGoG17spwK26AoRCk15N7x6rk9ghKkY4eVTXPi
 LY7aefS/z5JmvI9zIeTs9YUif4ai+e7NdRixALKEs80+mjJEYPZE9zue22zhk1PuUMBSHUy/j9Y
 ZRVJ3esTTOcyO0ICJS3d0Ki00WjPSFuU5TAArt1RhwZfzPWO6sfm7t08baE6Wf3BqtZh5TOQ2Un
 RO6poDIc4om4i+vaZzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080090

On 08/09/2026 09:59, Konrad Dybcio wrote:
> On 9/8/26 9:10 AM, Krzysztof Kozlowski wrote:
>> msm_ioremap() accepts being called without name of the region to map and
>> in such case maps by index 0.  However error paths still use the name in
>> error message.
>>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/msm_io_utils.c | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
>> index a6efe1eac271..0a4ac0fc5fb5 100644
>> --- a/drivers/gpu/drm/msm/msm_io_utils.c
>> +++ b/drivers/gpu/drm/msm/msm_io_utils.c
>> @@ -77,7 +77,8 @@ static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name
>>  
>>  	if (!res) {
>>  		if (!quiet)
>> -			DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n", name);
>> +			DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n",
>> +				      (name ? name : "#0"));
>>  		return ERR_PTR(-EINVAL);
>>  	}
>>  
>> @@ -86,7 +87,8 @@ static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name
>>  	ptr = devm_ioremap(&pdev->dev, res->start, size);
>>  	if (!ptr) {
>>  		if (!quiet)
>> -			DRM_DEV_ERROR(&pdev->dev, "failed to ioremap: %s\n", name);
>> +			DRM_DEV_ERROR(&pdev->dev, "failed to ioremap: %s\n",
>> +				      (name ?: "#0"));
>>  		return ERR_PTR(-ENOMEM);
> 
> It's odd to see one being ?: and one being open-coded..

Oh crap :/

Best regards,
Krzysztof
