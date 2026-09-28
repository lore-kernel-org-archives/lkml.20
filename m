Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108253C4554
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790622323; cv=none; b=nlqUzIHZ4yEFfVLhmY1+1oqdxu5kbXG24xFXfQ8u7GU3k4inC8BhsczZWSl+C39flk280gPkD2Gzj6zFPb2umRKtFZiyWi+n097uxbZCoHVrn6XDGIpwe+1SKhs3BWEINTTt0sbG+JGBSF3ZO2Fy4HdTzm3hXUrpul+fMQqDWgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790622323; c=relaxed/simple;
	bh=YEWEBJ/wLzBusDv7u986mZJkPr1sOwP5tXguBWv1j58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=At6aoT5H4Irsu6Pm6jCqAd6zzbfQW3RMUgx5b1GyqIvZTf/rl7PXGuPaOa2Zf/j/GtBhViCYB16/JhWEPgUWU4reyLlAzv+DuTcPFObHFqveBF7Da0G/eixMNt2qshxreV3Ep4ImAk5PQiix14dOzNJhTWlxOozPVGXvjyMg3Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CTksQLh9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eobRru2b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CTksQLh9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eobRru2b"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SHvagP1457407
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:05:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aUQXcc91Nms0mMqzegCYthYDa1bP/Fd/lJEybhf1XvQ=; b=CTksQLh9GRSRU5aC
	RkNBkiHcJRI7vkuzbXUnrgkGoX8I7HlKIE+HdNX9yhy8EwaM+Q6JN5vqkdKpcHEP
	mEI7zCQ16KNdzkfpOsPNQfq6FywVtWukivJn18kHmEi0YBB/4+sQA0vXQf4HVz+u
	y4IDpGwo2IhC3f7svhevQUVXTZI7MXu3j4dxNaW/9WRmgBsSZlaOQEOLMNfs2PyB
	ViyMR9jDPVjhPONgnLMD2DyYyD2K1KhelVxixgEm5+wDvG1jDdoZ9NlGkQoPVXyE
	IbpR9pNPWNunK9qS7qVg8rs7hPnLTz+ax30kmT9hgqBt2HkoCcebmSSoe8G5kYNh
	vJMD5w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvw20chj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:05:21 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso5721281eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790622321; x=1791227121; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aUQXcc91Nms0mMqzegCYthYDa1bP/Fd/lJEybhf1XvQ=;
        b=eobRru2bSNv4UvNoe45rAW39Bc4g1XqOzLhqLEJkxk6PlYmrYntfPZur8JbCmlUFkk
         fbM1jgHevg4ALScBZNMwkSu7po+4QqlwE/88U1rWPbrswv4eBCfoKiA+HnKM7qyPeqEp
         AYSn5AgbeP1Erkvnsv4Lun9ftvPY6dysAGDMpxDBU3R4VrnZLbKouUmo9iuMtNV64oY2
         UqhtcIcxmhjyzS05kGuQ0PH75Ud0oswMqKpdk1fKYqiSatD0OzKpwCpNnObJfUdsQpiV
         zXGPIyr+hjO0TpTxHa3yfmtXHf9WK8lJIc2tH3dzg3svuq04hGc0TvbxBvMCvF4jGNTZ
         OBSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790622321; x=1791227121;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aUQXcc91Nms0mMqzegCYthYDa1bP/Fd/lJEybhf1XvQ=;
        b=qrPVZz9y6ztvENuadyWl6d0fkgj3LhDiiWqT0446cDk+bEHG1bYyV/4xaJc1abyOm/
         yxO3L/z5nOT6cxTsBtDXCYVSX5N6aS2nliwEXc6dwbiZkwTZjeGg3UjK7VaiALGnDoAu
         8BQBVza4d2UVZ+C89jgsNTAznnPj7C63UbPqCN0AV/iYwNcKz2TF7tI75lMxjl/4RTzM
         HX4qSX6KBr9IIzl8aBl1Le+WtygLBkuI7sS4RBgVAUiOJUPdhmPhp7uQtMkRbhu1daM5
         5sLtYsICJDiiEFCsVkhAGTpI1+UErQPVTrLbIPrr88Ut8SoQkVBY9g7FaR1kaodHIfCq
         HJ5w==
X-Forwarded-Encrypted: i=1; AKwUvByJsHPCx4pB5GyVNxICfD4vlgl0g3A0g9GL4PIH6xuMJtgaGRHp8i4L2E8t/ZCDuIpX/3CYwlmMNLqce4c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRg4frvpbIWwOx0EGpVOgJrhUC5UhaiuN0WytdzpCQmhZj+YcV
	A669p6t7On3V3CWEjMu3ux9D4sLWu4Li90DlBwXXrJhba6MY1eKla+kLFIy1sAcZ3XSFF4CN5yP
	yvNzl0cDzv/FN4UjDbJFu1NC8IAojFTXPeoXa2yOzq0giPvo6EGctEihMHHK58FZQA5E=
X-Gm-Gg: AYBFou1yEgMAs424WL+8AuEQakxURIag0LoY581t+StotaH2auvLMc5DRmmfTp7FGF1
	4it7WMlUZtNcw1peMwoXAI4+3aVUUJyQsDNKOm7oLPdMnrSQ/Yucl8COoUFRqK2wNinLx1lsDwD
	kjopkvvLLEERqQBQO+OCDw2+s3hZVxSWkLrzEK0+AsgAyqFhwFOrYTEZuaeFuijgJenPM9LdaSF
	w1WwOBUuRklWZ+z82Uu8hNzN6oHOPORKF9cfdAaOp8n2GF5eLS2UdXRRdCc1xnEhtPVhAJAt2Ii
	19mN09e+1pMH5OKowI0WlHEQ4wdtqEsxnefvM0sv1kVC+0o+pqdIl5mfAmA3Z9qDzPiZP/20ZNX
	TOYrz3oIgOWgQAn8Lmpc1d1cC
X-Received: by 2002:a05:7301:2811:b0:339:7572:7b2b with SMTP id 5a478bee46e88-34271d8d7edmr12283309eec.24.1790622320531;
        Mon, 28 Sep 2026 12:05:20 -0700 (PDT)
X-Received: by 2002:a05:7301:2811:b0:339:7572:7b2b with SMTP id 5a478bee46e88-34271d8d7edmr12283193eec.24.1790622318728;
        Mon, 28 Sep 2026 12:05:18 -0700 (PDT)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3434958c3adsm37771935eec.22.2026.09.28.12.05.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 12:05:17 -0700 (PDT)
Message-ID: <fac7522a-a9c8-497d-8753-e8c397ad581f@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 00:35:08 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: display/msm/gmu: Fix Glymur's compatible
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
 <20260925-mahua-gpu-v1-1-0fa0bfd8d315@oss.qualcomm.com>
 <arnTH0_tjrspIymm@zenbook>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <arnTH0_tjrspIymm@zenbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=N6i8hG9B c=1 sm=1 tr=0 ts=6ababa71 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=QgEWrOWD1ie02Gccw6EA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: 79gqs0LIm8-gOu9cvld1DhIAVR6OBin_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA3NiBTYWx0ZWRfX76TCTRUA2usr
 OsljFkuesRUkzIPevQj72hfjVyqzhJGDqlxi6uvg+Bv2Lh6Q4/fWKp/OoNI8MSi8BxwOSxkAEED
 fBFivx1qTnl9Eqsoh6dOmF3wWJZeQA4Y1GZPn4EG17biM0zJqtP0krYKbQYMr/hUojAeMxE7Lad
 sBtcc9aKPUu72KnbaKveilXfP9ipYX6RI07RwTU4kLDTsdnuGRT+NfvAlPLG+Nv24yJbnicNUdn
 D+TSwe5FSkv2Ke78XpP0zvq4npsXI/24WVSkK5H+iGYqRIUNcUkfh55+ihZwnnAGoPl/jBw35me
 lAzNg89qmZ2nPuuKwWSYRWFqHQb1eiHl4Xg6rvZNwRkHhlaWFFJEb32EGobvJqiLNRD9AIoa5mc
 1dpTjmYti7mYwbTNnnyihrAUI9DOhruAwOelGjh/6kxP21LtOFCS82je1szRCpAXy3ZBJnOEiSJ
 QMyJEapphOBOYNYALcg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA3NiBTYWx0ZWRfX4fXyh/IlfsM3
 +prV5vQtRSTKz2Cw8GrFUoMiNmp55nsW3lk6jrUnxFAxtHetQYC4/d5wGDACxFRQ/yXS/4Prs9L
 iVULypZnFlnAq/jZOV2e7Ywr7O5ZgYA=
X-Proofpoint-GUID: 79gqs0LIm8-gOu9cvld1DhIAVR6OBin_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280076



On 9/28/2026 8:10 AM, Bjorn Andersson wrote:
> On Fri, Sep 25, 2026 at 02:44:32AM +0530, Akhil P Oommen wrote:
>> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
>>
>> The Glymur GMU compatible string was incorrectly documented as
>> qcom,adreno-gmu-x285.1. Fix it to use the correct string
>> qcom,adreno-gmu-x290.1.
>>
>> Fixes: 7bc29d5fb6fa ("dt-bindings: display/msm/gmu: Add Adreno X2-85 GMU")
>> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/display/msm/gmu.yaml | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
>> index 9e459f12ce3f..f22661447e7c 100644
>> --- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
>> @@ -363,7 +363,7 @@ allOf:
>>        properties:
>>          compatible:
>>            contains:
>> -            const: qcom,adreno-gmu-x285.1
>> +            const: qcom,adreno-gmu-x290.1
> 
> It would be preferrable if you add the new compatible and then once the
> dts has moved you remove the old one (i.e. after next -rc1) - that way
> my dtbs_check doesn't light up while we're trying to dance these patches
> into the different branches.

Sure. We can do that. Will drop this patch in the next rev.

-Akhil.
> 
> Regards,
> Bjorn
> 
>>      then:
>>        properties:
>>          reg:
>>
>> -- 
>> 2.55.0
>>

