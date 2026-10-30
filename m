Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793389431;
	b=oIqJOKTct/vR9Zg6+IXjwzJZykMavZ8ukOxLZUGaRGJpAxe51/7o0x/sLNTSQZTWVyEf
	 vprsoy8ZQNnirSAuhnHS6qyuELl29uo+3RxB6mPHRFytDsuyqSvtNAoWX4hDQ/BZBuTZD
	 sXPKYhvcIDvD+w0+eDk4w+wQlNE0frm6xYLvVFuT5tZ+YnKzcMyO+b+Tc8Iw9O/7X4WIT
	 u9DdvvRm9cXp2mB+VG60oALcX55IXlzw2xaxMRDvo7lfeNmhx1TJ5QEK8vhwekog3Shin
	 vY+OFcSJFF4zgIupkJJNX6Dz3xERgPJ+j/cBK6gHD0pud0tCyop0CR+/JlaD+Ce4MyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389431;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bGx6qJiXLm21UoHQs+MxjhyCVQP4Uyn4ufhGO58Vffk=;
	b=mKlQ3ANX9KPbgd2/qpOJt1Icucqvgm2rwho22R39tlz8ae83U452E9dZaQsNGWVq181N
	 s96Qo0CPkjGi9emQsWBywVydmf3aNIjF64rZ0rzzhYhrUToyfEL/m6zrF8vzG8/kj9zI1
	 uOFCXlLzo2wJuEfI+Kj4uWw4CMZCAtqc4cYwUmS7plKQ6+hszQwl5Q467rjtoCWf/4DMw
	 7Suv0solsiM8uxRMUSC9IAJn5sMGxJMJkDBfTAj96SSx4f+z0d01utoaOBymT05gX8Rv4
	 E0cbLqoKnirQTFBIoep/TK0RQWXvWbn1ZLcJRV7IB4QGFGYZBRpJz6J2uOg0m5NNPhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="mg/YKwDX";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kyc2IyZs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45774606A322
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:43:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45774606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mg/YKwDX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kyc2IyZs
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UIhwON3776931
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bGx6qJiXLm21UoHQs+MxjhyCVQP4Uyn4ufhGO58Vffk=; b=mg/YKwDXjNT4sPSS
	zHJ/KjhTajfRCuh8o7XnjdPQKkn8VSnYjnIsnbyIEhg94zmXDIKiOPQJlUhTlE6K
	2JhR6X/Cbjws4VEztAiUqalx0ofpe/DOi9JcvImPuxNn2IO3nP6Hieu+c+OJGwWp
	PS7i2yXjr2YyK2VM27vAVwD62WF0pyNU+YfYk5fgyOH6Eke8mCha8F7yF+OHx2TB
	bDNO4IgKFiJv0cG2kfQES8MJs8kXeOfxaeiDG3qtoZ/U5I8+iB0BAx40hUEl06bt
	NdF8TYkbdzHL91dV2SH917+kOcWvaie72JboesjUDflH4Kc7SBlu9ozhsfGd+cJT
	GfmSzg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn0s9r5vn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:43:43 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1663fb7e005so1328742c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793389423; x=1793994223; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bGx6qJiXLm21UoHQs+MxjhyCVQP4Uyn4ufhGO58Vffk=;
        b=Kyc2IyZse8E01JbN0ZV6D//07kBPkwXg0tDFxT8jjQQv62wmtPzb+rmOlhPixox2MO
         JuDJLo18/PbZbWcBKT/6SJN6PPsQnkdUcBFuBMoyVF3pJYRr6JhB0gf8pIwrA4W6BJke
         pGXRa2tuyjLHe3HolXi5OhnFUG8cNUitcsRcoBAZrouGpnafOOvev5jlpP9uUIRhc6HP
         AH7G2sM81CGH4k/EVk1Mmjq16m4603aAcJRtPm7bbwwpaDysSzbRt+QE86kTgQgwMTc8
         foaNaoKpJHZGlqbyLWrvWgI3uUiIHh44dcE0ORoOFosTBuDAZBTWIBuGjgdsDAW3hR8V
         B7xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793389423; x=1793994223;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bGx6qJiXLm21UoHQs+MxjhyCVQP4Uyn4ufhGO58Vffk=;
        b=V4cmUb1A9dyprCxONDc+XmR10EJoqGfUT61n1aFr9otaG9uW39DPFmXSm1eNLmTcSS
         aKzlGqlUTj8oY7o0v4lGeGz+iMI3LiR7l8SNT94YpLnnBDxMhnrklKFmiWJvNwmjNdBO
         hcJyRJsFgwReavpp+1PWQwYqpp7j/KDRnNJcnUvKZHsRQzxWJ+QUO/WOjundaOk++mhi
         mgxqb2M/nITBMrQiG3dL+4pDTKhvHLBZVzPfzoHMW4rWSimrLeyAGj63Xxwk6z95cPID
         arulzzrQpsHgc6KTjRiK5CwPNkqxXq5QNmS4ViOuyZAyZs0AlvvzmIPsZkrrafWTTnTn
         6Pig==
X-Forwarded-Encrypted: i=1; AKwUvBzsUKsinoqkF+s/VNMd5PzmWAvqwfXSdcrOyxhVA3ADuraWK6A5jEkDaHKvI6Xd8EGCZ5+VNqj2YBscn6Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxuqNC3CVGR4YLbqaBVC+/rhwnHOxMyH6ezfcG5K9OdErEQhZg
	wa3B8L4ZBRZ+MqH4NAsd9KJov1NzHQgcWsvOs2hiweMBKIc5C/pfkugkTnAyporZi2soY2Tedzo
	HEBpkkBtIIJbH8B0OnDxcw2XfAcMmz76rE6iGeeY7n4yu+51rZK+snbWtVafjSBbDcS4=
X-Gm-Gg: AYBFou3syT6yzpLd71q0sgO+Qj0bxOsyJEf8J8o/obcBsskdHz3SYePDVuHTjDxq4aG
	KCGUwvA5NWYYZMJk5ydPXMe7t4zLzUTTma2/y8FczyqEur95N3TBNUvacXeohDfefou3hURYh86
	flhUN99TIsmV8qdYALu/RJJGcFy/4xpduDKs/EFO1LykjAsDDV7xK1lfgLhl5saPVXWM8JpAhHl
	JGMNz2oKri1dDaAFTpXepUzbASAxv+31gRKlVzlm0kVN3AVKEU+zrAZ+atIAmwXFSqHK2/H0Mlq
	CIPd7vgELQjoMbBRh0fYOZDY3z3t2EyCLT6lOMe6gpV3EDmZudFaVIhmGMNmjM2hpCG0x+4v5Ak
	INOGAdmESw0N4ab2TjAfOnsyuav6SCnVgrkPC3psy4Su3POUK9CSS4kwNAfRRzc2N3rF4FjefW6
	maaUS0tHLjTcSODbG0PrtS4yU=
X-Received: by 2002:a05:701b:2052:20b0:18e:5292:2670 with SMTP id a92af1059eb24-1ac5d88cae8mr4358380c88.23.1793389422495;
        Fri, 30 Oct 2026 12:43:42 -0700 (PDT)
X-Received: by 2002:a05:701b:2052:20b0:18e:5292:2670 with SMTP id a92af1059eb24-1ac5d88cae8mr4358362c88.23.1793389422005;
        Fri, 30 Oct 2026 12:43:42 -0700 (PDT)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm10965340eec.26.2026.10.30.12.43.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 12:43:41 -0700 (PDT)
Message-ID: <0f57c001-4c0a-4b35-8864-d83ed51d0abe@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 13:43:40 -0600
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
Subject: Re: [PATCH v9 2/7] bus: mhi: Move Sahara protocol driver under MHI
 host client drivers
To: Kishore Batta <kishore.batta@oss.qualcomm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20261013-sahara_protocol_new_v2-v9-0-dc9f24357c4a@oss.qualcomm.com>
 <20261013-sahara_protocol_new_v2-v9-2-dc9f24357c4a@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261013-sahara_protocol_new_v2-v9-2-dc9f24357c4a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bPyDs/+Z c=1 sm=1 tr=0 ts=6ae4f36f cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=lJNEF0nvcUjEJBKM1O0A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: 2XUIurl3KSkhWV-N56IrDh2OQ0Dhgv2q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfX5SHuVM1dC4ta
 rHzX0z/lBxvUnnJiaJCdH0i2BJFOUySVQHfgO82vXcA1QjoSGObrBSkiqle8/DEDTNM/D9V7met
 luhUltsInbzEQe+p7EEOMK1he57aBJwyFLWA5fOJaVUglvBWv9oClHcVJVfbjuBisGyQT+hP7QL
 SkqdNzyE2SRu51xP+7CFHjShHP2aG7pdr8uMTXOXA9vgrMyUJqu+Jho7Yk/wEX3NFEysSfKISAw
 BNCUKkxDcyTbwT6C/kjNb851kHOC1CTZ8Bv8UAQtpanyvMPiq6J8TVnQtz3r+/aK+zxCV4tAld6
 HaO4zF5VI2p1Gsm5HqeE7+MKvZQrqGTmg//idf8lbXc9eqI0Xde4pG19H5ENCcMeAZOf3ipRuWS
 X0Epm8y+HLLVBefnCdI13WzjEZ30HaRnpltesnHSuxcNs8riSqMiiJ/W0Ha9HjyHncfLQdcYw/K
 GkYsidk7uKzjy3WkngQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfX8jUB0yU8vAn7
 Wbu3VM+Vf3XvH66Gi1GDmKbQ0Vm01glENv7jg59prdjKP892Z0NwDRErBqCNiVfIT6L/VMTENVU
 iZr9B+hZDfxYZ3gSG9D48h+d1P3JEp0=
X-Proofpoint-GUID: 2XUIurl3KSkhWV-N56IrDh2OQ0Dhgv2q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300078

On 10/13/2026 2:45 AM, Kishore Batta wrote:
> +mhi_sahara-y := sahara.o
> diff --git a/drivers/accel/qaic/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
> similarity index 99%
> rename from drivers/accel/qaic/sahara.c
> rename to drivers/bus/mhi/host/clients/sahara/sahara.c
> index c7c0b3eb4b65fb7776a6c724cb3105046cf6f7eb..75c0cf6010e1506fe661cfd110112bbb37465880 100644
> --- a/drivers/accel/qaic/sahara.c
> +++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
> @@ -1,6 +1,8 @@
>   // SPDX-License-Identifier: GPL-2.0-only
> -
> -/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + *
> + */

You've been told multiple times (on v4 and v8) not to touch copyright, 
yet here we are on v9 and you continue to do so.

I'm stopping my review here. Between public and private versions this is 
the 15th version? The 20th? I've looked at the majority of them and I 
see you continue to make the same basic mistakes over and over. It does 
not appear to be worth my time to continue to point out the same basic 
issues version after version, and thus I think I've concluded there is 
no point in continuing with this series as is.

For the entire series: Nacked-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

To proceed, I think someone else needs to take over ownership of this 
series and address the open comments.

