Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193590;
	b=3snpICy8Gp989P0d9ab5/lt6eIVJ8lr8xGFbzEbg7dKVzN2iDoLDEZjutKEddljo8dwh
	 mJKJNf8D2QpjmdRR//9fi66f16hrvWhDV2aeV+Aardn8Yq8g8Vo4I63Jd5N3CThfXBa8k
	 hSNZ9EvDigc+LaLVatCBwE1wmtIz7REaWf40rDAa9Hm+SGrVoVzC4rzv1i8phD1ZlJZ9O
	 dMmnk+LT4e8EqGBeZcs7vQLLxjLG0X7yJ644QM8/RMqyCgVoyC7SQztHSFiGLRQ0l4XHK
	 uSuiIb0d/g5KnmWKXGSObsnY0xRcyy9iJSP0wYZ3tn0xN9dOPwprPTK2DblgdimuFnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193590;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9sJ15fAiQ3xUbogZ/2lVO+4lcBVZ8XL9apblczjVX7A=;
	b=CkaZV1bcPetZpBc3+/tAZ8q7s9h2duPUOGaLgfR3z4UouHAEoCL56A+J7c/oN95Wg3lm
	 0lv/HjvF73do5wAEGvpizz6sXn9lyBBe8qlpWbgSRCco6xDRLaH0TlS9GfNHEVc1ZTLdT
	 4R08oqPDy6NeZAfe80P4gBKC2kNWJgpPN0iuRzwLceHDwSnrrz3gqe8Ke2LpKj/GYhuMd
	 w74p7utIVxMSZelRRt69ji2sCUvTqTtiSmeWk20Z9pc0PKKc1KVOLSv85OWo3xuYjB/uz
	 AtATlf8B14VuC91cHNjaKrLXRlclOdRqhbGHmIL9ad/jesZhSt8vmKj9e2v0jHGpA+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="O2/qth21";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DOhDeXsI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9446606A337
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9446606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O2/qth21;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DOhDeXsI
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe1gA2082519
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9sJ15fAiQ3xUbogZ/2lVO+4lcBVZ8XL9apblczjVX7A=; b=O2/qth2162XS9tg8
	yVi/6rKuwKd2FIFBCePGsPMVpcDY3P3sWEiwA+Ug5KaZ116QAR7euW73XIwAzAXl
	tpSfWSaZ+7q0PnpY3atrgzpEMxeSM7D8ZQ5BNyQH1Q80UMatMuW70YOt3jZoa4ga
	vYNaYgWznGYSo3XkA9JOvaJMeuP+fCb7XbpCY/vJSTkdQVQho2m5emsuPXdpe4oU
	ulSU/qk9rdG/RcI9vmqgxhJaRo62g1SFvUNfig08mdUDvt7Y64Z3gXtPMGYzuxOo
	OOcV8qUS4KNNPAprA3gV20wNiCGfhFodsgJkqTTAXN89O4fhj1BLyzPEf8/qxYDS
	yvdTiA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjpv56f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:19:49 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eacebedc9bso50188e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793193588; x=1793798388; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9sJ15fAiQ3xUbogZ/2lVO+4lcBVZ8XL9apblczjVX7A=;
        b=DOhDeXsI0bW70Un5RJ9hSmWROGAM98Xn3999mReT3+q4xv3jDFjPaROxo8BybHmXP+
         RifAQDLHDQeIsqMPEllPta7EOvIDka774WNNmWZW6SvHpkBN5zf/XMLR0Fhv79BJR2ys
         RpklT+6MN/yU+ifEdbAJObwoCo71YJtwFE32p78eGYzgbSPuAWgTh7vksIrw2FEFSwuU
         2FrtaY7HMwZfdip+E0PAhXp6nPoE9z3sEieyfY8aBwszO6nRNU63sP4TJlIJRGUOfI0h
         dfyiquxLuWbDH+GssDhOKgRnHPVUKh/hEyLO+lUgOAij2uH9DQi0TL1HNPki2W8DIifF
         T8lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193588; x=1793798388;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9sJ15fAiQ3xUbogZ/2lVO+4lcBVZ8XL9apblczjVX7A=;
        b=wJimlJp5Yp7O4Wr9KMC48pFfPj1ZAW2IOB5o7687Iqu27rdlll6tZ421MdMvUZO1Ff
         uzG1/m7+qEdckqZprRIzFwZvc52tiNtVdOCvT3WNCBfFINNXiQHJZpEKoW4N5u+ge4S8
         PeVSV5cgOyP9s+qQ8Q0Q6Cyl/17kf3NSUsAzUln0g/jnd2M4BOsLa/cCMvc8elZGtDoQ
         61g9bgFKxvBBLPyJkAM0fVKy/uda0Rw55K9IYA+MucBA6eQOCDwO/JMcVRzd/IX8GePo
         +WInBVuzPo+UNEaxrBeRPCK6yEvLvj0M2qKA8GFhqPm6LkADyJSObbAKmCEzn9LnXoeY
         UgZA==
X-Forwarded-Encrypted: i=1; AKwUvBwdvXhjkrwd52iGIi8rjUEY2LX9xGl805kvwdu987NI2waqVYNMw12BK5cclWP7KSN3g+TJjMu4mKXMEwc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiMbyh5LXTkFWACtLyYkVg8aIDBIuVGN72zn7MkgMQu5tFY8kO
	TktV9tf92ngjS0TsNbV2YK9oDZnLNXbj8k4N45Hm+3d5qmaaQxKypof7JGA9nn63COkMfiZEx65
	B4AykHaH3Y1DxOxVCw66aN8OkXZezXGjI5VtUzdjgXxnhyaps1ki6801futY3Tf+oyGgsluv0LP
	s=
X-Gm-Gg: AYBFou1fNUJmBwH1WY257qI4IYtxxyZ45AQUfPA9e2Ttb8sFXg2Gn/dj8BfSFlJLKQg
	pvKOgWHPe+R0KCcLc63UnHCk+XT4HTpsty32ZsLglSIqMQHewu5njWWMZVZEQC7NJjql0RP+Wkl
	rSfhvOEay3vVEJSuQ8s4bBCnxEu3EaH7oxHfmEwn+X9+Fmt4Wav8mr+zX7Bz959IMlMLUGAHm87
	noQdfOfZ6ojpa4+OcSE83lnr/M9+4taiO4U+NOXzvEeTcg3ZBV/iqFrvxd1c5NCcpx+zcZySR9E
	63U4oh/sG7O5wdvmiUmiajhCTFiBzO7I2GI3Ylmp0aTSTooITzmkydGlD0YrJouUhrQcz+zjMsg
	ltg7lEM5EZRV48Ua3o0ClA5BshPdCwozb9W1ruQoRcOpYRkyf6ZQ83vR/v+h/UZQAqP1gF2U=
X-Received: by 2002:a05:6122:4697:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5ec4c8f7e42mr1273203e0c.0.1793193587964;
        Wed, 28 Oct 2026 06:19:47 -0700 (PDT)
X-Received: by 2002:a05:6122:4697:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5ec4c8f7e42mr1273155e0c.0.1793193587397;
        Wed, 28 Oct 2026 06:19:47 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfca47f3e6sm605557e87.9.2026.10.28.06.19.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 06:19:46 -0700 (PDT)
Message-ID: <e838e538-056f-45a2-b062-1da5fe4004c5@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 14:19:44 +0100
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
Subject: Re: [PATCH v5 3/4] soc: qcom: smem: validate private item payloads
To: Albert Esteve <aesteve@redhat.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sarannya S <sarannya.s@oss.qualcomm.com>,
        Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>,
        Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>
References: <20261028-port-smem-v5-0-121257d490b5@redhat.com>
 <20261028-port-smem-v5-3-121257d490b5@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261028-port-smem-v5-3-121257d490b5@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfX4WZ7SoGasua4
 SF/K57ywgBNQ9JnsHXro+hKtuV3dUxCtrzK0b9TmDex3mtT6y7a/EEsb6Nu2THeZR/ctQQH+Mrw
 rzCFb9V2OlJS9NgIMUVrabzH7KIMM90n+Ygb1XCTzTbVsx7ClfLDgm5NEQsb0v7JplUqUHhscCz
 +zYb3ftlv6ddWxvC3zvM+NuBQSQSVKP8UzR128iYNhmx3cb0y4y4qZrk4VCatu2eUmRD5eZgOax
 wnwJvbJ1zosQsVa4mgKgu3AxIYAv0qd05N+be1PXRZwsNvvL9o9Gs1/WPOsvmwSlX505J6yqNSN
 euMlJBJlTtsSm5cLZ5LrEl/Q49XS48vx06z6CfaAhvLqoMgh4RaXTrAe3QjQD3WraNYE6qBcgV3
 KXxE1ksshoguTQ/5lPxN2/3WA+tIdZMwiY0M7KpDAFA2+fc7O7QZAZzWly3aZuk2zUTWKr291oh
 O3iUUfS0Wxq2rXrjEfQ==
X-Proofpoint-ORIG-GUID: DckTvTGX1IOqQIQTUA7htibknxd_pVGA
X-Proofpoint-GUID: DckTvTGX1IOqQIQTUA7htibknxd_pVGA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfXz2hz2dq1AOPl
 fOFYCPPLgOy8tsSxEFM8CXSdhYKktkUPGykPWTwEDTrM9ELdvCKIQ0n1L35P/Sm+cE2kNO1vcAU
 WDPLbtrgsnEepY4Q82sPPHdk1ebPQ0w=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae1f675 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=P6xoLi8rPFeUcLD7uVYA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280053

On 10/28/26 10:33 AM, Albert Esteve wrote:
> From: Sarannya S <sarannya.s@oss.qualcomm.com>
> 
> Validate a matching entry's size and padding even when the caller does
> not request the length, and check that the payload stays inside the
> same region as the header.
> 
> Zero-length payloads are now rejected as invalid.
> 
> Signed-off-by: Sarannya S <sarannya.s@oss.qualcomm.com>
> Signed-off-by: Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
> Signed-off-by: Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
