Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC5C361DBE
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427182; cv=none; b=OnDwlyjh5yjyZEJIaqfS+DLKN6DLRdjRNwmDjhpb6osTzB21KtTZ1Ywx9g4KIg1iBqaz/0gT9GkmAiX28kor50U7YCZHYjBInCYIRtCzgNDD46waR419eBVdySxRLFY37GM8yCg93WP6ziVrRwr7lvNP3UtOR7DRRjTWdYwAw48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427182; c=relaxed/simple;
	bh=BmgUO4SFAAkiUvoLfEBeBlYNMtLkuXLP429hYzvKFDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kG9CVOlLFFx8JTsetRS0iKp7JDmkiPQSfPXe0Kfxf4yC5cwfLvM6jR94dxTkmpKSNXHL24ShwMDXz/Te69ve96lxdZIZDGw713akpTRyAkcyoAv/co197wL6ng3VUtLJxsYAzq+N4sB5QO4DZAyaUWhOChFZRAC/YAIIzkBs3rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D0mIS9/w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nbti1yzD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D0mIS9/w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nbti1yzD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68392vgX269112
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 09:19:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6R2GhQZHS8mATC1/nyqeLrqxV2PXKu/j5RnA39FZTiU=; b=D0mIS9/wojDJcQZy
	zthgMQmrywmyA28v+PNALP5KAtb6kcOXJaHyXZ6kKmnBXXf3oEuNZIBMyvBT2qAU
	JqUnqX7xZIuuiWp4EKp1mXxBy4Wrvz3pMPucU/ozHppczyEGLffrLBgOtCZAh5oH
	ypjumB9ZEWG9QoMWLMWPPeGPNCiflLcTl2AeJ4QMmwpW+pClQxfbIDVBX4G/aWyS
	3UFjDtrkUuv+quzDWpjqWYlM6zaWRRRpsmprALm24JV3CHCspXtl2qViL0rNGMqA
	rXkQo/d+t/ZVohkBpGLaLjhqB4NGOv2D+NwYAuiB8FGdfPkITz7aqugPfYEy9fbJ
	Vybr1g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjhcdx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:19:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51ca37ce4c3so4906161cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 02:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788427178; x=1789031978; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6R2GhQZHS8mATC1/nyqeLrqxV2PXKu/j5RnA39FZTiU=;
        b=Nbti1yzDBbclqXp55fKQb/kuqArrl2yFpJpVWxkU0dF3wCun9SVefdwB29UyC3gw+z
         vtmHFJIItQUyxIy6782s7JvXqQHK7yp8UeUzE1BwHXK6nHe25jXdgNLCwtAgQKB1cywa
         d7L9ScJRpBSkSmxD9YWRPspRdabtdLv1OXAFxp2eagixjMkNcFWe32TW95FoSzop/aCC
         7LIEj/+pX9/IzOL0+y+FYGMNsOFrG+VIUpvd/9Zq1UdUNDKYHn3FoRlZxfbtCLSiGrgi
         lmB81x0fWvENtBlNU0NOHOr7vG0ScjuJN5ovH8KJy6hVPPqxhT2HGu1kNgZoT/8Lfouw
         1mPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427178; x=1789031978;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6R2GhQZHS8mATC1/nyqeLrqxV2PXKu/j5RnA39FZTiU=;
        b=GodTQiKNKFFk6eEYld9921uDztUc4ev9FGV3KlxWuyoqwbf/+LoD68XV1Vr49Imzd3
         RgPCASacKfDWYW/72/liKzP8o8FLHozpfWnu3PORNQULzRs9qN4o2hOEns9DeMZCHFc/
         L+qeKk2J/jlglq8kmDFpZOAJT4iKVW3UC4gNy/2qPdfnicrNl98h4zYB8pgueoSlNX4p
         oP6e3m6vq/qa5HKsJ4LG8nGk1rnBFWe6y2Py/j5xoTt63UY8G0ETfCWBz7wd8Qojqm1b
         OCZdtBCilo12LpadBMJFnSumH2S5weBI0DO7FsOaycJ2JkWJYsWfaA6blMho50MeO3x4
         opFA==
X-Forwarded-Encrypted: i=1; AKwUvBxGAUkzajImFvCiEwPlz7C2lxtxccqoEeR7kW6Lgj9dOrTt94NmI3kvzoXW3Rh7K6lRabuvCUzaCFQk7BE=@vger.kernel.org
X-Gm-Message-State: AFuF++mYvcCJe6Daj+I4a21+EprrIFYLrsvg5SpshdXIGSVxxAQRD52M
	GnI/nQe6ZiaArGqm2hfug/Yk+3w0YsL962fOgowFtNn+lpYE1J1vb5tqKtGNbcOSx/QpaKcxGho
	tWQrcxJJJkvuu3YY8SNY/g0bjiJzkCt7zfdsT63nuYUzCSpZg7a0m9X8MUyTEkvj5E8c=
X-Gm-Gg: AYBFou2LeXKypDcQqgYA/3Z9mORnlpn6bsGO/YRioKvJTYFMEAohiYKQrwPaGXP0jNB
	lNlMJqkOqKS2BeTTx0NrxWqQ71IDecGR4uvHgJHozDdOJenbCCvr2UwWHbmocN+lCXwzOQ6frpZ
	mlyu+IRACivz0mLjl9BhxA+tQoUBSDiX7relz7JfmENBmk5KtedbK+Wx/WpavQols51vNLpAAKM
	1MP8ZGbkn6s85EaQnR924jrWKZ7GJp5snaN0/U1J9iLySuKHo6UJQyLu4Zjt/0imq4wi1CCuWnE
	lEq5RpPgBHHaQCsb1W1AHnO54YE66zsP4KuAXrlO7G1T6Vd59JZ2QUk4EOVPdG7nbDbQ37ew36m
	1Zaahmo5jidENT98nTfYI+A==
X-Received: by 2002:ac8:5f8e:0:b0:51b:f40b:2faf with SMTP id d75a77b69052e-53036d1a44bmr79746371cf.4.1788427178458;
        Thu, 03 Sep 2026 02:19:38 -0700 (PDT)
X-Received: by 2002:ac8:5f8e:0:b0:51b:f40b:2faf with SMTP id d75a77b69052e-53036d1a44bmr79745991cf.4.1788427177875;
        Thu, 03 Sep 2026 02:19:37 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f952ed9sm2030616a12.27.2026.09.03.02.19.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:19:37 -0700 (PDT)
Message-ID: <3ea5e40f-a80b-4290-a8a3-5adafd290af1@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 11:19:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: Add Retroid Pocket Nova
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260820-rp-qcs8550-v2-0-d4ce78fe9385@gmail.com>
 <20260820-rp-qcs8550-v2-4-d4ce78fe9385@gmail.com>
 <a518f6c8-7880-4854-8dc3-ac90f0eb93c3@oss.qualcomm.com>
 <CALHNRZ8rqcDYcBJY0+Y_ioJroWsns_BFggMpuwZy9tiPavvBaA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CALHNRZ8rqcDYcBJY0+Y_ioJroWsns_BFggMpuwZy9tiPavvBaA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LaNjA8lxbDfOdMIohO0WwlT0nkdYiuON
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4MCBTYWx0ZWRfXxgUgSjjXJBLt
 K6GQ24lQVNsK49HOfGNMnjEcVaoyshm1cugl6Y4A3oJ8z5S1tUujz8Rh/TrEfdWLF+/uTeDahWZ
 dnuEe18fLdwdwuyDK6Z5OGLcCP2S3DRG09dM/WrrfWpmzSod7abGszt3JBWG99eYXYpY2OGrXAo
 plf8SxDavFvCNapPKMSfFP3E/l0pnM6tQ2ua8SH8ekJWt/wnsuCNbxhAORdDzOFwOutwkgtFTfU
 9R3dveZD7opwGYcmZ4MzFzkdmkBOJYWrfQKxKnK+1F7OvrF0HrJgwaiqXq5zF/2D3axfJU6Uefd
 PImpLjpI3IJ4zWwXRjfzS8lwp0oKKS1zuh6vUEdYPPY1eDlvhsLJhnkRIKGSVaVM8p9JVBrwU40
 clGfPiS0ydCtZSkv2XndmXuvjys05OGTbClpRnO0ol/l2dTfguyr7lQkAqTDLqFN0b6NHJkLOQh
 j8FZD8LzcS1iBJRoSAg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4MCBTYWx0ZWRfX1bU6nM237NpP
 +CUEe8l4DzwL7rcxwue/qLoEmMw0duWLaH8p6yb3w00KW2ECr4bJNZlSR2trxDggcgk9JH26n7u
 6THGEEhRYD8vBI9tErQs0ZJamjU0akk=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a993bab cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=uam39J3oprqiAalIEG0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: LaNjA8lxbDfOdMIohO0WwlT0nkdYiuON
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030080

On 8/26/26 6:06 PM, Aaron Kling wrote:
> On Tue, Aug 25, 2026 at 5:26 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 8/21/26 5:30 AM, Aaron Kling via B4 Relay wrote:
>>> From: Aaron Kling <webgeek1234@gmail.com>
>>>
>>> The Retroid Pocket Nova is a high-performance Android-based handheld
>>> gaming console powered by the Qualcomm Snapdragon 8 Gen 2 processor
>>> featuring a 4.5-inch 4:3 AMOLED touchscreen.
>>>
>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
>>> ---

[...]

>>> +#include <dt-bindings/gpio/gpio.h>
>>> +#include <dt-bindings/interrupt-controller/irq.h>
>>> +#include "qcs8550-ayntec-common.dtsi"
>>> +
>>> +&{/} {
>>> +     model = "Retroid Pocket Nova";
>>> +     compatible = "retroidpocket,nova", "qcom,qcs8550", "qcom,sm8550";
>>
>> Do these actually have any common lineage with the AYNTEC devices, the
>> common DT for which you include above?
> 
> Please see the cover letter to this series.

I'm sorry I didn't read it..

Konrad
