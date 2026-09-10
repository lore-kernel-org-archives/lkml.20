Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A368A3BB680
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789031447; cv=none; b=NQtq6aUZPbWO15mcvgZicpcVPYPmc8vFVSUCFCqmbwn06DRLI95us+1qV8luNdQhF50YA7vSKfNgYs74wunXnJPDRKuj8xkD0YlSfyp9cocEnzIP6ITXM9ZYdpt1wYNylFaI3gW5ddx2IgZyMwHEC1TStZgzrOYGJcLqrV+SNE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789031447; c=relaxed/simple;
	bh=teHhl/Fby6UNaiUms7pOdB1pdpZxF3cZ+JUc+QXjPEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u36TsrMwcFac6ETIzQwQUyTNEOKuZQXZ16tHAoMMDSQWT/vSaitdDmqwhjSVAGmhXofNXTK6aO7F7nUBW2Op5m4VWfeRNPMXTIAAFLt8/zeMusZMubNhqlyDkQUNi9eEZeRfkP8GlfkWfdym2PnbFLYm7uQhCHtC05tnHDL1wsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WHC8r3db; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CyOKTOtH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WHC8r3db";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CyOKTOtH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8q9Pm3999050
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:10:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YTmrq1APQy8GHJDjSUGwA/3yLK3U/llwtiKi14Y0V4w=; b=WHC8r3dbXT6XTEOi
	A8+5/DD9O80VBFGzL8JvCr/tQCt3ysheDA6K/AqH4mWoN9I7BWSCIsqnpo/k79zs
	C/pyhmnMEIw9n+inmM+uVJ6bzIr0yv6al2TGqeFodbXaFr0vxL7utPxP7RnteKPR
	qm4kGFxqtjHa9a2dGeQq7USgwEe723Y4I4iKVu8uvYcjMCMY8v9ITJDjxIFwmDld
	IWbxa8fI+Sdw1hindEN8FOzIpVybTDotKkFKer62MZov2cOhiPkNr9TyD/FCWM30
	QKGNhRN3dRA9r5i1mLWRqTl0gUaw3bVn1+hTOpIIdCYJvFNrF6OwrljId1mJFMWa
	3aUtug==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyfk45e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:10:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2dcfed75f77so28566075ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789031442; x=1789636242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YTmrq1APQy8GHJDjSUGwA/3yLK3U/llwtiKi14Y0V4w=;
        b=CyOKTOtHmdXavZ/urfuBoLsMnIf10crXGTxD9shKQ94PCKctrWmfH6HWkBliLzaIAy
         NMywy3VyPMkci/x3QIEOnv+GqaqKwJgWWENiC79H4eEOYb4kqmAHx8Gdd+1sDNGc4qjq
         hNl2n+F8fTUuQ2yMILnPkwig5EliPl7HD5CIZXrHbT3ig+/XN34LN/SjLgBTiHZ6sWSt
         4JZWS4dNOqNGmxHnNT6ea19R5ym1j5YPmqAtVIikJD807ZjUq/htSUNE6ECWYMAaI526
         oWQLnv0Eok2aRyt3PPdmwczc+FPFFx6BYNHjGEoObvM5mjmQJ9MXtoC0nioBTsbMJvBC
         Z5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789031442; x=1789636242;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YTmrq1APQy8GHJDjSUGwA/3yLK3U/llwtiKi14Y0V4w=;
        b=sZUTuvl1MQSUqsk/fqFwnOBEWu2KL/0vMDS5j+sSZ83CKl7wNoCqWNMHGm2ie8zILb
         CYI/a8h2YErePmEMXWRBI/KyxmjZzZ047XetRlGoLMmo2be/7Efk89yMgTbnlXOBEqbq
         MTWkyNB1MynWWz7z32WgHmowipLBXXEpE+ycicPybR9Wnq+1vg+IP437sHJsCrrtOQs4
         2SchSTwf86tOW49mfF6ISb1yxZJLOP+gXSWnfqdfl4NgbOZDYbB3bowo13+Hbl/uGZ40
         gIPQHB26gExRNG09jqstezfgSlvarNUyyFx6Vr/fgECsWeI/4I6lDvjJCp9SscQ8Cy1c
         fjBA==
X-Forwarded-Encrypted: i=1; AKwUvBxOqvXBCFe20sFDclorcH3Y00yhyJ48oGiMrNodlOt4G0OkUQ/YfS5Y8ZheKEb3K/7WpBROZJ9Za+bCiQY=@vger.kernel.org
X-Gm-Message-State: AFuF++kcqiL2Fl83aj61FdDBzk1QxvOFB59IjO8BfKT0Nw/cVBHx1NU7
	J72TDSD5I3HOqt7bVs3qYrRYu/+YuR1e8qfCMgeapPHQa4tsUJlQvg8KaInq7CbiZKxMv3Bliyl
	kOub+hYSBT9Udyln7H+brXCILFtfE3zsDZGweAlfXQYOJn4R0xK/blQ7SZw+mq2pNZ1s=
X-Gm-Gg: AYBFou0io0jRRXDqnUDmbv1ikW2oXKYGxUMNegZFYqW0xb8aZJid7Tgz76n+VH+skIR
	vMQ0xxdqeNZvzJyCGGQ6aBPuohR06YI4Q4JpIU1lw92Cl757jpgTGgA/VL63JMzHIgPUcgVuT1W
	pN5QHGZkyoekLgCz/l/U0XorXptqxiLUSNZlYKeaU+Df/8xsxnD2M7CYRm2nU8Px6aEWQVv+Kau
	DvQYg58crIRinfq0+UBwpIuUIfs6U7UGWSZzUmwfZQSphOd2iK8/UuMfyuitzCY/UeKCXJAITtE
	5wXriFUEIb4AB6DXDbbh3YS2DJdvyUR66hypKzZY7OBA527Eg52YAQJWF/RnH+Pkry3rduf8RYH
	qVGys/tatVORaTdj4NX0sku5ooAk7Zg==
X-Received: by 2002:a17:902:e54c:b0:2d3:7c58:b0e1 with SMTP id d9443c01a7336-2dd07320bb9mr93831905ad.0.1789031442334;
        Thu, 10 Sep 2026 02:10:42 -0700 (PDT)
X-Received: by 2002:a17:902:e54c:b0:2d3:7c58:b0e1 with SMTP id d9443c01a7336-2dd07320bb9mr93831005ad.0.1789031441760;
        Thu, 10 Sep 2026 02:10:41 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm78910994eec.16.2026.09.10.02.10.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 02:10:41 -0700 (PDT)
Message-ID: <f7af73ad-f09b-433f-929b-cd6d22e2afd5@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 14:40:35 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] mfd: qcom-pm8008: support PMICs with no interrupt
 line
To: Oleg Keri <okerixx@gmail.com>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>
References: <20260908130745.2545-1-okerixx@gmail.com>
 <178887481187.4612.2819576206036967152@gmail.com>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <178887481187.4612.2819576206036967152@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDEwMiBTYWx0ZWRfX2gm//Lsf+kmo
 LG5eT6PsBs0F2YrgK5cT7JMqw9TLwzn5z1YZoxE9riGlb4Bxj7IIXdBwIQPojyQlVuPbRf5bCM9
 dfhMeKAyAafIY+PzgGOeGAC9ANzuvl4=
X-Proofpoint-ORIG-GUID: agZbRNOosf5KI5oBbF_-N8pDYK9GgH64
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDEwMiBTYWx0ZWRfX2a2+eim3MJCZ
 XETFsLKwvZV7BbLwkw645obWk/GMXPVA6meyUP6nPpMbtIqnNhw3CpbpZ4poVr2e8I5JMnbyPwE
 2YBjedw1MhC6Cp1Wz5uyhA0hVMdWohpXL68xaYcod+wUG1VBlysdlJUmcd1OaLsnwEHZ6r4079I
 klavOMMpg9AMzcpe7Hr4SjSp10Gto+xYMgmI/jznoTRpc9MKiLlteZX6UQBZAeaSQ59XFgnA+q6
 82l2bDezMWvufyASkk+gsQKCaUPgnHUExcsN/or7/+eyiUV5h+vMiUrrgqblLSZ9mOAiLt1/vLQ
 UDQ9CzbpEt3uGzMQVz2cEZy8o5wkJ9P8niQ/VgVbz9gf8GBtx54nCWVbtrVKPPOdszEgEaPcKQS
 3r6DxFIse3860ikkTwJBwqFzXI8NvO8vVDcKp9+BEkGzxRC7PmiI5QAReZzr1nGJmsefuNuTrOV
 CFxfyrJSKvrxCKFP/Bg==
X-Authority-Analysis: v=2.4 cv=H5pOUOYi c=1 sm=1 tr=0 ts=6aa27413 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ty4ZCte2KelZnw5hmtsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: agZbRNOosf5KI5oBbF_-N8pDYK9GgH64
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100102

Hi Oleg,

On 9/8/2026 7:10 PM, Oleg Keri wrote:
> Please drop this series.
> 
> It duplicates, as a strict subset, work that was already on the list a day
> before I posted:
> 
>   [v2,3/6] dt-bindings: mfd: pm8008: Add PM8010 I2C support
>   [v2,5/6] mfd: qcom-pm8008: Add support for PM8010 PMIC
>   https://lore.kernel.org/all/20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com/
> 
> Nihal's 3/6 relaxes the same required: entries mine does and more, and adds
> the qcom,pm8010-i2c compatible; his 5/6 already carries the no-interrupt
> path my 2/2 was adding:
> 
>   static const struct mfd_cell pm8008_no_irq_cells[] = {
>           MFD_CELL_NAME("pm8008-regulator"),
>   };
> 
> on top of a PM8010 IRQ chip, match data and a pm8010-regulator cell. There
> is nothing in my series that his does not do better. My apologies for the
> noise - I should have searched the list before posting.
> 
> Nihal, if it is useful: the Lenovo Yoga Slim 7x Gen 11 (glymur, DMI 83QR)
> has a PM8010 whose INT pin is genuinely not routed on the board, so it
> exercises your no-IRQ path rather than being a DT omission. I have been
> running an equivalent no-IRQ path there since 2026-08-25 - the LDOs
> register and the OV08X40 works - and I am happy to test your series on it
> and send a Tested-by once I have actually run it.

Thanks, we would appreciate this. Please note Mark has asked us to split the existing
series, so we would be sending out separate patch series soon for CAMSS support
and PM8010 support.

> 
> Your 6/6 also shows that describing a PM8010 as "qcom,pm8008", which is
> what I do today, silently programs the wrong voltage ranges. On that board
> the sensor takes dovdd from ldo4 at 1.8 V, and:
> 
>   pm8008_pldo_ranges    1504000 + 8000 * n   ->  1.8 V is selector 37
>   pm8010_pldo_lv_ranges 1800000 + 200000 * n ->  1.8 V is selector 0
> 
> so the same regulator-min/max-microvolt lands on a completely different
> register value depending on which compatible the node carries. ldo3 and
> ldo6 have the same split. ldo2 and ldo7 happen to map identically because
> the nldo and pldo ranges share a base and step and differ only in their
> upper bound.
> 
> The camera works on my board today despite this, which I would treat as
> luck rather than evidence that it is harmless. It does mean your series
> fixes a latent bug for boards already describing a PM8010 as qcom,pm8008,

Just asking, have you noticed any boards doing this currently ?

Thanks,
Jishnu

> not merely adding a new compatible - worth a line in 6/6 if you respin,
> since those boards need the DT change and the driver change together.

