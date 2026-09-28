Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED5F44684B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578224; cv=none; b=c18ITOdhO7ne3B6riJxc0dVSxjCKmu1x2JnI4HiLLi9CwjxdxUHYMS+otaIC4JWLYgyJ+zIP7Wzsm4VE+A+ihE5wTkP9NI5lQovPk9dyNVnnma6G0hwZOpxGs2NMcA/4sknZig4lB3Rq6W2ke15V/vkD8seHGz/394YRNPTvDSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578224; c=relaxed/simple;
	bh=GCgrWcGSYCDY9mnbDQEO1hABrtGS7fG1AJ/ZSwmQZpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=erW6CxMngZwX89vgbKbkwI9JTTOmQsmhduLSwxe3uuSe5SzzRgosEeWj56HUjXFSFeP3a8XoibsqBbU3ZCN+tnv3sORmLPgrwpoOzmUiSWDznirTtVqpWPlQCEIEMrfWQSgzgt9cPr+M2BDmQBsx+A7WuFZ3vkTlNYyJxRPq5lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LwYh32Uw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hD8ZqKld; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LwYh32Uw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hD8ZqKld"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S6dIeu446503
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4OUbyzBVRks7k0WbMnD+M/l6sliOO4VjgKoS0xSBAbg=; b=LwYh32UwulbZf+IO
	jFpCE09jsSD2szNPg9DkANXz9m8kUMETxG9LCYtzMzFpv7lXFMdde9yaKbrwB8TJ
	7mGM3a4wiI+DpvtiWB5qINf/U8sPmxkjCx1rDH1dVdNrjesQJ3qeY77zovnS4CFU
	8cn37vAhe7RtJrXWeHGG8uZyDhGYByHmyaHEMeFm2geFxnhczHnnUj8dRWe19S7k
	XP+XmRukowi/i3NrMXGm4tULmhijwPT3ALAlZcwO0WFWknGQKXpaGR6cPfe6jCmk
	l5uPUVagub5ceP9pvs9B2iVuUe3cah7FIslcRPpFSKoUPCKTdmU890NSDPMqYkU5
	r+wmvQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyk5mr18n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:50:22 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-86936089a00so127273b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790578221; x=1791183021; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4OUbyzBVRks7k0WbMnD+M/l6sliOO4VjgKoS0xSBAbg=;
        b=hD8ZqKldyR1ArE4b8KLiKOK6WFyxnUNHVzYtECA1q6UwutDdfgW1vdEpIJ1W03CddH
         U+WDeAoG21RIwygFzX6uYxdp47jpZd7QJIDtWSIT0KlFwReoO9xMeRP3Feaodj+gQ7X/
         IE9FVBiIbNY96uqqJUPYYnrJHEwiyhqFEpfcz1XrsFVihIHwiYt1mU7UKwFNW1/XUfmo
         s8ZacX5pqOgJOqHE+dITxOlHyXI6xi6IjM8BQHCYyJzzfQRGKbEa7EJBABoUfmFFVtuz
         liDokYdl3kjvcXmjVKjOeW6Ud3/Ta9KVvHEtXH0qdgSZfZZ6XcXKahorMMUiIfl3Tcho
         wUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790578221; x=1791183021;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4OUbyzBVRks7k0WbMnD+M/l6sliOO4VjgKoS0xSBAbg=;
        b=cAIj+bXV6zWqPDZCIwJidBoInjmrrrtSSMzgiIijFgJqOHFcwcbF7MP7JR11WbYjQd
         R00do9xndiRXgKIlGFAxnBraCXpSxdy6pMOe183BOs6I5DfdBahCWasY8HZN8mqTOvc+
         a7moDDPxNY1QUA4HHvv4FjxkMy7/ehiTdrQR+eHi0Wrn7jaatpiUSpd5MXFESsea2Twc
         GDlkXk2LErTK1wZ77VfjWQh+rc5Rkv/AY38GDs9BnWh8wFoKHn2TVjwyogjAqTNn4so2
         6cngLuufAK3QllayyrcivzF2saKXNnZ26Atj8aQkxnRi0XxNd0psFZcQiT23umwo483I
         BRvg==
X-Forwarded-Encrypted: i=1; AKwUvBxMnR2L+cJBmq57SZoWFn5SWld+P0peYGxszmr/9mA+Q8SQr+RoNPGUbEQyqG+KpkHRLjUSG3ydPybW0xU=@vger.kernel.org
X-Gm-Message-State: AFuF++mqFhwR04kx29wH0Jm2bTu/s1vlZDJsofrnT48fjUE9KSTfZsZ2
	UbcHb7pT532/sUn8hyCTALQ0tDb8e/LkpZztR3yOmSapM5z8gtogZwEDUeiqtXz2Qzx1AYA7gRz
	kcAlovf++qLwPa3n1ONCHo5n8qxF6mx8IovePykM0ud0Wlt+60b5cysPNKuJJJtIY8Hk=
X-Gm-Gg: AYBFou0/ZBq5q4r8ELDKwkAwHo3kDllE0J8TuaByzMYivtl5703sv8rFteeDBivxBj9
	nJ8opRotCE1BdqjmHYB1uT8QKy5ZzDXsHf9QmqVyXuGRphMKi72YUproZCcq1u0f9EbUC++5kwZ
	t/jSg6PwUTiWoG9eS2fVCS5u9a4xx/8pn6/2+ugMnCChNC0S54N8roNyAHtcXE/n7Ns7fDwHn4x
	8v91Jq45o+zi2kJG14O6lrwbp+0okkkXNYiJfzKoyECzmZtgsC1mRqRkWpxiR7oRxsmrqfsTYWG
	+I6mVLjy+hyvfPt+8CxvBOX5x+9N6eA1QZXYPo9CVS08FEmKi7pIuEzwF6zWV+UhevIRABG591W
	LGsl2RerlIlMatPXfIbm0LJXo
X-Received: by 2002:a05:6a00:1488:b0:882:4ef4:8eb with SMTP id d2e1a72fcca58-8824ef40e06mr5035240b3a.1.1790578221272;
        Sun, 27 Sep 2026 23:50:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:1488:b0:882:4ef4:8eb with SMTP id d2e1a72fcca58-8824ef40e06mr5035201b3a.1.1790578220721;
        Sun, 27 Sep 2026 23:50:20 -0700 (PDT)
Received: from [10.239.132.150] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87fe81f2290sm3633951b3a.5.2026.09.27.23.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 23:50:20 -0700 (PDT)
Message-ID: <9760cdc5-a2e5-4522-8e2f-3daba8331883@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 14:50:15 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: arm-smmu: Document GPU SMMU on Qualcomm
 Maili SoC
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Will Deacon
 <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260830-maili-gpu-smmu-v1-1-253e1108ce82@oss.qualcomm.com>
From: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260830-maili-gpu-smmu-v1-1-253e1108ce82@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: F6vXPuVdZCGeqbu05QlbczJew4ASL82o
X-Proofpoint-GUID: F6vXPuVdZCGeqbu05QlbczJew4ASL82o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyNyBTYWx0ZWRfX/loSgV9Im9AB
 jre8V9AQ9m6Os/UShKnE6LP6sU69/oHKp5N+C3GJmk8TMrzmKW/Cm+qdq+tCLSOO4Uen8TJyqI2
 Pwpn5+ta2/rElIbztcb2h9gDhYfd8JmFzRm85CPu2USKU0t1fPzdNIY5uKW5KYZeDjoCfaXF0b6
 wG9cj40XzLm201ZJcKi2DDdFlvNp9U5Pl4MtWjeqgnQpet4mhlTA1LCpN/HWc1Qp+n8fr3AM8bx
 AfgwfsdIKZbBjkHUjOBRt1EgI6SJIS8wN6rqhsLrYQZqAi7P5f5u4HcWpoMPkSxTQtlawTZkiF7
 8ovUnFSr5SfY17O5dfhyWb7ANEnJ2L6yrK2UpjTCvi8GmOtDxzk16vxSGu6AwUX5kSJPQia1O+F
 bjcva6bttbrfw1kw1E59oiBgRsW1YH/+it8hr1rkMDzncXGNZVzWncKHI2Dq8rdll6E/EmwmBSN
 7ZLjkM92zdehI7VAALw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyNyBTYWx0ZWRfX9mdXVG9+DjJ6
 El06J/alAyLkcj0aXWXnNB1WbLhAywQKH0iMMsL06zCDFQEt7aavEDxQI32z7z2eXK8wIoeFfG3
 evAS3efIXN8RMWxQPRQiS/LW+Y9eqFk=
X-Authority-Analysis: v=2.4 cv=asYnmiZV c=1 sm=1 tr=0 ts=6aba0e2e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oR-CnN3JeSK-wwzircoA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1011 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280027

On 8/31/2026 10:44 AM, Jingyi Wang wrote:
> Document GPU SMMU which uses "hlos" vote clock on Qualcomm Maili SoC.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index ffa33b7f4a96..187710fcc567 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -101,6 +101,7 @@ properties:
>                - qcom,glymur-smmu-500
>                - qcom,hawi-smmu-500
>                - qcom,kaanapali-smmu-500
> +              - qcom,maili-smmu-500
>                - qcom,milos-smmu-500
>                - qcom,qcm2290-smmu-500
>                - qcom,qcs615-smmu-500
> @@ -579,6 +580,7 @@ allOf:
>                  - qcom,glymur-smmu-500
>                  - qcom,hawi-smmu-500
>                  - qcom,kaanapali-smmu-500
> +                - qcom,maili-smmu-500
>                  - qcom,sm8750-smmu-500
>              - const: qcom,adreno-smmu
>              - const: qcom,smmu-500
> 
> ---
> base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
> change-id: 20260830-maili-gpu-smmu-33d20c1f4672
> 
> Best regards,

Trying to be a polite ping here to request apply since outstanding
series are waiting for apply of this patch.
Feel free to let us know if anything is needed here.
Tested with below series [1] :


[1]https://lore.kernel.org/lkml/20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com/

Reviewed-by: Maria Yu <aiqun.yu@oss.qualcomm.com>

-- 
Thx and BRs,
Aiqun(Maria) Yu
