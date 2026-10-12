Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C20738E8C5
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791773551; cv=none; b=E5IXRKJQDjy361Fc7ohPOJH/dHxse78xlQnd26yA0nM+EOzXbdMLz4YL7SSRIHFNQMf1e2fKT4wicyy97pgufVhfJj5e08TKcDziNe5Q7mcL8R5HGrR8hXXWDmRUhprCtOINdIE/Wr6bb0X39nOWqR2Y6BRhMRgfb2XOJ221XkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791773551; c=relaxed/simple;
	bh=c1bq/qqkjuRGWjHR9UcyqCsfWN6iu6XHZr6qBKD8ouA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fm7F2fDc7zzs7CMVRfLCSdkHXjgbXZ/XXBL0pzPfzYekJdIzOypEuW2offFEw7N/DAHIWn1wE1YR2SsP5jDot9uC0KMacUI4qt0nByskNUZgnzi3S8oCdUo0XKyq+qrRPo0PFzHVQJDMctp67vTsu3XDClpx/oV4fC23DlRXG4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P6rqp6Yy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Igi6uXv1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P6rqp6Yy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Igi6uXv1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C1lDIU052421
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:52:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QJbREqwsQUUO1NfreZZnhUkKL1+aQh3D5/8AoPrzCmg=; b=P6rqp6Yy2CKdpa4l
	yjj10dDeodgVAgks7h+nP+wEK1O3d65zjptYwzVk7WqBwuli3o82TnFd332GwR74
	B+k4R/frn0OZX8dI5I0jPm0IFDauk/ari4N97AUoQS7T6NADO+h2It/m7S+kZCkW
	9bBlrF72GpHYEdx3GxOxN2HPquKiye0r/8hU7fbVs0iwLdmLrxP/g8tkG3JOFlRE
	tIcdZw8N5vuJm5L4NexYjjIp3GhwR3BoqXvgT1upXwBFqEma1c1Iv9D03TUCcs09
	N0KSAs1Q+9rM55olerqkwuG7VOjYV4J7lhtkdr65ZhehGkXYNMVF2Q3u84S6om8H
	Z+siRw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7en9v98p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:52:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e827b3a6b4so22877115ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 19:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791773543; x=1792378343; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QJbREqwsQUUO1NfreZZnhUkKL1+aQh3D5/8AoPrzCmg=;
        b=Igi6uXv17qEGxxFOFHlaHIWrk0yNwyhk/A0HHUtE3LamIZcdibEW/D11DJU8te4fHa
         eAFEowmJERypQYE5ELm1JjCZWNVRmExGH7n3qGF7+Lt8fbbnYSAL/dYljmSHF+vuTHQg
         t+sDTWMyAkRnZX+tFA2c02tdA4fXTdp3CDJQQrmx0Dnjg7d1/R3GtEFYPE3Lz8H2N+JB
         cPfEhS1R/mNi6iatokHLjkBXLAd3O5hXy91C/KXihkOep7k9dXSuiUD2E0JxBsXVIhYf
         NDYHvwBdTo7NzdxEoYTgV3TqORtJTo9TmxZL4+zPczwnPlzudk61R3eXrgy5HSjw+7Os
         C97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791773543; x=1792378343;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QJbREqwsQUUO1NfreZZnhUkKL1+aQh3D5/8AoPrzCmg=;
        b=mBGmZqsmTz7Bt620+NBJijpoFvuHfkD8EJeztrK9UHQ/e7Gi0gUIS2Yctu15vT5vfs
         yL4JugJr00zlhVFfA2FYLPlQ+36tnYhGdjOn6w0MQxX8OYTf4/kWpwQdt5tZuiC2C8ku
         OJBVcBVk4aOEKPQxrVHAwdSKsCsCYxP4RZ8BBooWGPZCwODVvJE7IinNwJeOLEUt2ej6
         ddmNt3d5MSippRIBqgvfKMIFJYKBM8MnUlBekFXORobLUqwqs2G2Y6nq3T98Y2dyfShB
         2oG4xdTXJDarSZdLWZk+pv1Wl5IcnVjB2rA4J6A9a/U+WmxYmF5WSDDGBnXIJ9A41Uqo
         5lOw==
X-Forwarded-Encrypted: i=1; AKwUvBzPscJHvyoawOZO6VE4fjzpOdKp7KOvn1B5KN8Ym2r/bIW3r9CjnBD2C4s2UdbKt6caObV35G4ChXCvIZ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJblodvCPxoCpv+hxEafLdi1EHXuIKgvi+UhQCT8Qm6Osru6kjm
	wqEGGePGVJT0jmA+8R3/vKLj50K7LdMlG97YQ5GawIt87T9CMmMU8y8QSj7qPSqCIP1Nah6UdAi
	53c8un0fd41CTcbZH1DwOc+/ZbaywK8776X1X9MctdLgGX86aCAzYPajZ0sjAWpi0hTo=
X-Gm-Gg: AYBFou2+S2rSq5wFyrzzXBmabZzfklxAQfhOhMAGVe5dwCbWN3aSzetGIMKbPXumaCW
	2jsKoAlJsgUGeX3I1pRWtzUhK3TkCBFpR5TcaPL+cq/EKFsm37JblBU5dUn/ouhG0tOx1UQ/R4H
	I1wCB4GK73tVjalJGD0+wxtgSxT2CTuS/WWgAinquf8Z9JWknNzOKtM3SFuPplcQX95XEbQs2Uv
	+diIIxz1HfdjtvRmg//am1VrY/tXBZBjmqNY6WMcjjC1NPo0T7or9HtUmZsB/hXJBifvOCJc5o0
	MaX38KLIMCbCQeXC2lj1cqjaF8k+wkca3noMJizwMZVDEjWl5KiYkM/rSYZWzthhsAxoBYzHdH+
	MbQORKnivwg0d7XsVgFhym6zccuFJAhk=
X-Received: by 2002:a17:902:e847:b0:2e5:e1e2:21fb with SMTP id d9443c01a7336-2e842ac8aa0mr79892325ad.37.1791773542878;
        Sun, 11 Oct 2026 19:52:22 -0700 (PDT)
X-Received: by 2002:a17:902:e847:b0:2e5:e1e2:21fb with SMTP id d9443c01a7336-2e842ac8aa0mr79891925ad.37.1791773541669;
        Sun, 11 Oct 2026 19:52:21 -0700 (PDT)
Received: from [10.231.194.200] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8202sm35146905ad.51.2026.10.11.19.52.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 19:52:20 -0700 (PDT)
Message-ID: <c6c45288-1eff-420e-82a0-db9d92286db5@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 10:52:15 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: skip hardware rfkill setup on Microsoft
 Surface devices
To: =?UTF-8?Q?Fran=C3=A7ois_Roux?= <franzelfranzel@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio
 <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Dale Whinham <daleyo@gmail.com>, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261006062728.45007-1-franzelfranzel@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261006062728.45007-1-franzelfranzel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Woe+otfv c=1 sm=1 tr=0 ts=6acc4b67 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=4vkvQpwsUkj-1mQPOeIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: pzDEoBHfuM3gZ3BtbDPQvGGOuE6S-rEA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAxMSBTYWx0ZWRfX4UvbvP88ijcP
 5Oibrm6Lszmu9MG5L0cngVUoCydm5WUUhQP7tt8177yvNaodAavZnxaf0QgeLwGvTb6jD/TkSfR
 XxwjP5akzhEtb1UxBmdETsQU6MWmQ1rL5sdR5smOAgXSFT3wXKqfi9sWPQCVYzxd6X+MV7BaO20
 QMMcE2AgskQ4afENPJWQ+Bb9wGRHTmnpqilK2h6p4eBZbuVSbnzackvYCjqiGvl1I86LpYXrszM
 /7EDz4QZCCalgrIOYhiEIujiaf1ZJCtILup0kBa+fFOyjrjtPMw3Hbx2zwt+eSE+Fhg1H78BzEL
 nyUUtB6RVpHpjodgjjAhLd6lu/I3VXNxpKEoPu8d/9abxWwoRah2Ng2fVEhH2qwJ6GJ1G1fVAlt
 Q6LMbYCEGg9mUvpQP0fPSGJOwS/Qnq0ugkra6pfABW4LVq6+3fOOY+DL7/7+/GZnzfMrdjqBvSm
 7ndxvLjRIGijVojO7Iw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAxMSBTYWx0ZWRfX29Txeu6aqSiw
 ASNdRWKFRq3+Tucu94oJLGYXPZ2g5HMWOtsQpN9dKqe/o/Dn83K6qAqOo6I2lcCFaCJTzp4IXCT
 6Q1aSd9HisPexdrPcX9WjVJFSTpg/wM=
X-Proofpoint-ORIG-GUID: pzDEoBHfuM3gZ3BtbDPQvGGOuE6S-rEA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120011



On 10/6/2026 2:27 PM, François Roux wrote:
> On the Microsoft Surface Pro 11 and Surface Laptop 7 (X1E80100), the
> WCN7850 hardware rfkill input reads as "radio off" and the OS has no
> way to control it. ath12k enables hardware rfkill handling, so Wi-Fi
> stays hard-blocked:
> 
>   iwd: Error bringing interface 4 up: Operation not possible due to RF-kill
> 
> ACPI platforms can opt out through ath12k_acpi_get_disable_rfkill(),
> but DT platforms cannot. A DT property was proposed for this and
> rejected, because it describes what the OS should do rather than the
> hardware. The suggested alternative was to handle these machines in
> the driver until a connector binding can describe a broken rfkill line.
> 
> Add a table of board compatibles and hardware revisions on which
> hardware rfkill is known to be unusable, and skip the rfkill setup
> there. Other affected machines then only need a new table entry.
> 
> Tested on a Surface Pro 11 (microsoft,denali) with next-20260929,
> booted with the unmodified mainline DTB: the interface is no longer
> blocked and connects. The Surface Laptop 7 entries (microsoft,romulus13
> and microsoft,romulus15) are based on reports from Jérôme de Bretagne
> and Dale Whinham. I have not tested them.
> 
> Link: https://lore.kernel.org/all/2ixwny6hzumlqmok5cjwutvtk7nzmx4t3dhxc44ao4l2u755pj@n6m7jyxf2o62/
> Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
> Assisted-by: LLM
> Signed-off-by: François Roux <franzelfranzel@gmail.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

