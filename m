Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792449344;
	b=MVR2IQgu9Q8QpC1dbYTAIRjQdq0ODy6dTCIonfqOI6dsbyGYTj+8F5JjjgS6GuAK2Efk
	 2e5hE8+9KecnLM0yeY9+wRY0I3TRMcxbhO9qq8JmKqUg6R0S4g/Ru9aaA3qS//Q15jp+j
	 GZepgv+0VUjtG4teENeODDCLwt4ass9qNS+RlxB2tqLo2HsrrKMo6Xc8Tm0PHVZJVLPM3
	 5S5f3F7QMoOQ8zQkT6QQ+0HQOLdVCU5Tg1txMCJ5EK5/RmirB/EQBGU+XccLZ8AwaMie5
	 Dnrh93IMDJ8LW+NdJOHayrzsXmw0iIT0/XLRP+EJszs/GHrldydLUQ4sXffP/FggxSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792449344;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Pt9nzRxPIl7P35cHqXHVdzmbGI/WZ35dWXVb2+9inZg=;
	b=ANf6WvjWiEoLaHbldzNaLqiQViu3IyIEQ6sv95j0uPcc1OEJPo1Qp3/waPcwMLZWYFbB
	 pqtHt4Akj4sbr22AjFcWRsbO5n/NPxo5SqBOS3idO1P1gpa3mYMdCUT+prl9CPh24PdDv
	 vqOWHiiNGrgKaXF+/Ak+IrZoJobeC57cP1taCli9gxFrHZA4lHfXn0/ReKJVU2qGIeKAP
	 Z1VcBOgKmiW6Fr7i+ehJWfSaUfIF7GWpr5hCRG/473b4L1tThJh/4362zfNt1WdgnNfD9
	 WFgKk4vE1pSh8Pj4/2JeLPsXuhCOKIO1/o2FrqQWhNXNejhcfBL0EROUE92WUTDMwoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YKCoiIDF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jdNUPsM2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9C3606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C9C3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YKCoiIDF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jdNUPsM2
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JLZN6X3070782
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pt9nzRxPIl7P35cHqXHVdzmbGI/WZ35dWXVb2+9inZg=; b=YKCoiIDFqykGqAD6
	2GXQShRnEXS1WB5jRGVqj0fkjbTtvbKoA6gq8EMv05sKwSnWk6RLqQ23CDD1GqOq
	/rS0Rkbkpvpu3ZMkOVDqOc260HZYaV9CnLCIUzMckBu5pxx30B5QkYsgdIgDIjau
	mODtD8TtjqNl+cpVDb51HhFiIziII5pTnwVESuQPUz1Hn37ssWSGLWp1MS4K4gTS
	scDwmnv7nI11Bqxgoh1vthOZ7YObh+uZmyWb5dAqpop9Ei+qesz4fhyuun1t5TAa
	sMGpdwX5+02tpIrM0eoPJf6YjPbXFOMlr80kI1TeRq+Aa9SnU0TyX4U3hFUNy7D3
	L1FP3A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdr3p0xrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:35:38 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-357e2bc3b1bso4390793eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792449338; x=1793054138; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pt9nzRxPIl7P35cHqXHVdzmbGI/WZ35dWXVb2+9inZg=;
        b=jdNUPsM2dp/a2ALnBGjQwJ70USU3zOzLqIw3zQ+tGfobIHEv/7TT+sKW/y2KuCOXFt
         Rp++lD5/vde8uL6jjqzexemf7vzEgLpt6r6hOse6ecsjfT63pDFj2R6ydLzg8zmdNTLk
         HjiKhScurdWRFNg0dhf5vvknDYo9GlftZmvlgURuljWnjNQRax3fa9SilDUEg1M3paGa
         Clse6MkgjOrGRXwm+jUMiXfELCxoVJdcLkEzeX76GwCbvD/j5z+ydWdiLDurdVpXmMqG
         q/ewQU9Tm4yO5yQvXpdYY0z3Yf5DVFjL4GKLqPs1+hpSMcp8arvOc6eHkNP1P0XVTnuO
         lUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792449338; x=1793054138;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pt9nzRxPIl7P35cHqXHVdzmbGI/WZ35dWXVb2+9inZg=;
        b=i60nDcUYYFN8o/uzwh5iBYs+bpuXo9SBi/DX8q0jUYt4cx2ibB6h7cCF3SUP9s+JcP
         Cw+fc7BmpZaqXf0CVV2wfx+/8/Q6MHTWs/YhyLijABXnhTQcZzOR1jC0qBn/g6HSKHJc
         vBp8gUoEFot2ODakToJhAlUFKLfoiSgcijkf4tbwxyXb6e58IzIGKspJkbl66qh3Ps/O
         lPYsYPwWChPnTyZzSMdu6RSbPZUFOjx8aas8FzWnyDGev3dxXgghw7MCRg69Okf49vIc
         7J/1XC982kBosDcO7y30GteyDAktM71btEq59B9anV5zoNHCsiEH4nBitBLRDVCaABl3
         ot2g==
X-Forwarded-Encrypted: i=1; AKwUvBxUcPi0FMgQZCdnoMQsz8qpSRZYxMwugEowBH670oRHVstCxGqE01eWrDC6xAgo3qFeG/Fe5JiiFbgA4UE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8EoeWxuFrLM1a0a5cfhvF8tTJXCg9n+iMDSxrkT9VEaeVtVUv
	MNTIIQ6sU/EkXN0zy43Lk0sRI+qoAyHm9oBWVdWzkd5iAv5d53C0ICnlZKuPVFLku0jxtk9BXCS
	/IWGDsXFEcbIRuS1Tqj+saDd8qWRjJFC8SOxLhBVWfhnL+1379ee4V//hSGrzTNc/dbw=
X-Gm-Gg: AYBFou3caIZ13mwDnTrcwGWI3gUF7A1kUW12LVCT9rKYMFygqQzyIgvcgwBDMWblCNh
	moI+GoRGrtM/LVrPMSVNo4XP59JuCzMxf9UwgG8GF1lYRa9olRvZGTpIaxZPBEsdUBSd8QYLeTw
	1Jc9ja8P45s8QHgMlyDkQg7+ojpxCJrvdyuQhf47Kp81gnJcG9JDoXdy5xO6hhgcn4vlNH1d5xw
	LZmMtDpWm+2QBpZ8xkNlEcnKPpQS0AiOb5gXB80tio8vcyznEyuGEDW3WxduyWtn5SXLtRm4I33
	UCxk8tQB2e3St3NG8LEI/5EpKO2N8gABChHbb2ALBmyOLlBJTZOhGV6JMs6feNR6XU591dGpOw0
	INtHwzwwBROCuBCV8H4X0ngPlwu7BLw4X10Er5kSfdiBoRXYPVgSCtsE5
X-Received: by 2002:a05:7301:7305:b0:34e:9923:e372 with SMTP id 5a478bee46e88-361a2b35aefmr12367181eec.29.1792449337786;
        Mon, 19 Oct 2026 15:35:37 -0700 (PDT)
X-Received: by 2002:a05:7301:7305:b0:34e:9923:e372 with SMTP id 5a478bee46e88-361a2b35aefmr12367135eec.29.1792449337243;
        Mon, 19 Oct 2026 15:35:37 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608258aa66sm44127084eec.20.2026.10.19.15.35.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 15:35:36 -0700 (PDT)
Message-ID: <a06f3cc4-b457-41af-b981-0a3da19da87a@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 15:35:35 -0700
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
Subject: Re: [PATCH 2/2] media: qcom: camss: account for C-PHY when
 calculating link frequency
To: George Neacsu <geocausa@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com,
        daniel@quora.org, konrad.dybcio@oss.qualcomm.com,
        christopher.obbard@linaro.org, alex.vinarskis@gmail.com
References: <20261017035221.3816464-1-anusha.nandi@oss.qualcomm.com>
 <20261017035221.3816464-3-anusha.nandi@oss.qualcomm.com>
 <20261017101227.61271-1-geocausa@gmail.com>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <20261017101227.61271-1-geocausa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: EiELlc65jIcSksRtjdiVE-FhxSCLtXTJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA5MCBTYWx0ZWRfX3brWx+RFcbmS
 7GwiIt7qv2EmQKxX+piUgHrLX5RWwDS1vJfrl18RUr1tZLXJ45XhZfQ89h6oiWu8ODPdnoD6/bp
 eWxaMXcwjW2ovRH2tpMqObmSWAW2bvJd6anXAad4Q8dOg99+GIKouV2PETY6x26eZLu11oOxHph
 jtc0an6cyvc6NOGvDEjvT0ei0dV2Vy4JVFCwA4kWaT/hzgccz7Ci3ZFQRRlZf8xj2U4bfSubtIl
 ANWjK7rw6srQ99wgqSFHo2A94m7M16r/vQ7DZxK//0/Pywtqm3bEKwycg3wHuO35mTlC9i4cNvP
 edgV7psOxx53agd8lSIUOc/Iouf9seKM7gjcx9xV5Pa3bVP3rmVhALW63dWDw4ONs1S1Xia0CJx
 n3Jyq54WBarqhgaTFybN24kVNta/NaD85UYJhH88LvwNhhHjTCRTIathQ8zywqrTIYO1MPqm6Rn
 a+xBKsjxwIpPBCbkhLA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA5MCBTYWx0ZWRfX+7PxkaZ27bSQ
 xBfsD4ueD+5KN9VOHasRNJo9dIt9wdTBXHMk2fpfuS1i1kKZXIeETSK2KWPGXykToCCp2y2u2fl
 Od+3+v5FWgYfSGxyxPfTzP2NcIcmbR4=
X-Authority-Analysis: v=2.4 cv=HLxWhYtv c=1 sm=1 tr=0 ts=6ad69b3a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=2yIVbSAsc_rmbFz1E4sA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: EiELlc65jIcSksRtjdiVE-FhxSCLtXTJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_06,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190090

Hi George,

Thanks for testing this on X1E80100 and tracking down the csid_ops_680
path, really appreciate the thorough analysis and the control run
confirming both front and rear capture work correctly.

Let's fold the CSID-680 line into this patch. I'll add:

val |= phy->cphy << CSI2_RX_CFG0_PHY_TYPE_SEL;

before the CSID_CSI2_RX_CFG0 write in camss-csid-680.c alongside the
existing gen3 change, so both receiver paths are covered in one go.

I'll send out a revised version shortly. Feel free to add your Tested-by
tag when I post it.

Best Regards,
Anusha


On 10/17/2026 3:12 AM, George Neacsu wrote:
> Hi Anusha,
> 
> I tested the CAMSS pieces on X1E80100 and found one extra receiver path
> that needs the C-PHY select.
> 
> X1E80100 uses csid_ops_680, not the gen3 CSID path changed here. The
> C-PHY flag reaches struct csid_phy_config correctly, but
> camss-csid-680.c leaves CSI2_RX_CFG0.PHY_TYPE_SEL clear, so the front
> IMX681 stream is decoded as D-PHY and capture times out with a zero-byte
> buffer.
> 
> The equivalent change for CSID 680 is just:
> 
>     val |= phy->cphy << CSI2_RX_CFG0_PHY_TYPE_SEL;
> 
> before writing CSID_CSI2_RX_CFG0. With that line, the register reads
> back 0x01300000 on CSID1 and 3844x2640 RAW10 capture succeeds from the
> IMX681 over one C-PHY trio. The rear OV13858 still captures over four
> D-PHY lanes.
> 
> I also ran a control with your posted CAMSS/qcom-mipi-csi2 module code,
> plus only the X1E PHY table and this CSID-680 select: both front and rear
> capture successfully.
> 
> Would you prefer to fold the CSID-680 line into this patch? I have a
> clean follow-up commit ready if you would rather I send it separately.
> 
> Thanks,
> George

