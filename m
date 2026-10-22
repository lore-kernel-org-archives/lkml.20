Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792666895;
	b=rcMK7JGQWXEQrkC5EX4LZa31c2Yj4u5iwWlYE5UDzH4N3LwP0b29A/EnjJK0iJYqKO8l
	 04HjX52TAyPR/vDmf9J/A3Z8I0GLjm9o7ZLuWzWnOWnpMzf4kAGRY83iNtgn3WHpdexeo
	 5zC+LRyFKesvGXfqWFgY6NohCb7aWK34lKeHG6bvzVK+XNsYnJFrmxjwg7NHXeYW+ZwXj
	 8xvgS02DmOPIeSYur05A/MuHIH+j28j2qzHK2i4jOHISYKq0LeWs7PRGAkAV3wl1fhcMk
	 pq5+Q3EfmS6/WDO3xFRpIC+KTlkrz36mgl3CkAsC08yZ87uj0zgmMAJn1DeUdJGv3xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792666895;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=h5KbZjkHI+qASxHH5C1P7BwhKMwlWe8TrkEBvRsRJrQ=;
	b=v4ZAkGUzgksYi2wlL9v5T4GMRtcsZls5/HVdGSBPCbdJtd1Pvb+vOcr25xkSaIPLrbeU
	 LMzlGK7Jcb8Ry6YDMADEORsWSLpvJZ1Dy/N2hymRudKUAEu1MEY+qVSQV+rloDN0C3r1E
	 Fd0L2Uo5s82HRZ9nfe0LOGkyE1iSFVtbMLeCL70Ed++m0Z9740F83cBh2pV7x9dMj7Gel
	 X+bu3ZaIoIyGK16gvY1zjfwZLUVFvkdjKzegK/gPXUKREiuRziG3ykeuAplvrvr6zQH6d
	 opBpp+UsNe7y2GNWrhz9++cWfq7jWVrzY1Pe4c6xhChLtEuPyaKdHjsfWq+zt4b+W0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VQmtlaS9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DzdCnXla;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5439606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5439606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VQmtlaS9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DzdCnXla
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9xoAT346047
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h5KbZjkHI+qASxHH5C1P7BwhKMwlWe8TrkEBvRsRJrQ=; b=VQmtlaS97nGOD0lY
	HrDLOen9H7Q2dMF1UOwPZnBC1Qsgdgz+zz1bw5z3Sa0cbj8T0NzItgRlWjO+9xEt
	h3LkI8Ufnv9XhhiQR03CjCImEWb2Vtky7z8MSEY6gGDmfBrPfYy2xU80gGOU6y9T
	q8NruAikgGxk728bw3E/9vKum8wtjeNm9Ml9t+zQjKKrTEi/y/w/29OqO1rKccXP
	Pg6W5XHtG0bEr4jplWSIaQsLHuI/BnnjPpEQyyVNxGboCkQe4GF/ebO24P+NtzV2
	r1lnK7RdU2wmmYOc3mHCYpZO6P3BPUm3GlN8CNqWbpqTzUWfsv+Uz/MDsZ+UdY+n
	va/mmw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93dac1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:01:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e58614290so37728285a.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792666892; x=1793271692; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h5KbZjkHI+qASxHH5C1P7BwhKMwlWe8TrkEBvRsRJrQ=;
        b=DzdCnXlaeVifz252K/LGJ06eQUmzVgZF3YVJh5OORkNrXi/oW8YXpE8Zg5rnKUABG9
         /sK8pX5/m1f9Yynw48DMG3X/I0psP3YWCXGk6hhqV6DeykYWkND/rth8ngSGOgnAd/mJ
         EocF3pbHaXaSEQyBuMLYpwCy85PUT9xXa2lbPmN5f7jNs8L+O+jkVRJNckDW9HYx6Dh6
         pXWXUMf1951Sff8rDRy6NsJD2UPBthKFKvM3hyYlABpLlDEVoFkwx9mSHrEF9mqLXN09
         BOkgwjbYvfwGdMyclgtpbO6BAktzUMVnrY7JV1KK5MiAPT0XHyLiUZ1QB6xugKAQtDpv
         Xrww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792666892; x=1793271692;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h5KbZjkHI+qASxHH5C1P7BwhKMwlWe8TrkEBvRsRJrQ=;
        b=ksHw6DgBpj2cJOEIngrri2pOM0VrmhkG2R1LovQ9judrYxxsoKxj6NH5rAcWLLnvkH
         StEWfKWCFkM1O7cB4B3hRvft3rgUABiBkP4qz4RCQD5fEXrgF5q/prPLDJvuFk69GFKE
         pKIOZCilv+/9LeWA9e66hoX3sLUwaMlnePsESi1F6a2Jem4JNCRBqQj+yAKqluVWlieB
         r06eOfkPOeyVYYV5n6btQD39rYTtjtXn1WALhk8fvmG1Ae8bu+s8T/q7qaKvUhghhk0W
         sWwrg9+bOrmRKapo81B2s6aUFIJGzbhGWuAvVetQl5sBMmRneOjy474gjo0q4kHBf2cC
         1NOg==
X-Forwarded-Encrypted: i=1; AKwUvBxMR7WKNfEohZLPLAJHDX0QoF9rtqV8Rck2FIqXGsM3Pd2qpuK/WoD/MHY1a4cwD0h4YVnsdqEi0b4IMdo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKntcS4dPiiXUsr6x9JowRnUPP2NE3E4Y5BdciUO9dvNQ4o8LT9
	0Zzp3SYIMlflXNZllxJ4NOsGImuwsxTGYPQjkmJesg2kvVS+4p2cJDXmElFOAGBS+xBxVyYwIDI
	JIGsUuJaBh/UKaO9b0ktKpy8tdXTp9FWe+SDZxU51RQn5lvYxSbD+6n+RrPf7RG1vzeE=
X-Gm-Gg: AYBFou1woi1KyNb+uCxcHIl0RAKfhW0UdaGMXZAxQSySUQ/VNqVaGP4RDyqou4nFlbC
	ycNuoiQJw/gGZ+ZfU5+/PLJd+7AF44JQNb030m7z07jaAr22Pv+LE6OpGYyAPywnVBByWAsK0pK
	It1dsIch/p+oOlO/p9krX74EGXDGmiAZimm5fwKtWfUld+4ITEJKB569NOx9k304xfXzeP1iTR1
	0836e6uE/G9EBkQcptPrtU+7aQMQ68vRLrPFoJbzvfLT5K2QJUHqVxcIIBpMd29HZY87UEBqOmZ
	EjfD2W6ua8Z7Bob77FLM9hm72gt5qCOpBFQprleZ+swuIARIBx01uFxKx8e6t/O7giq+VTVJHu1
	V7RudIhpjhwR3k0om8W6cyw==
X-Received: by 2002:a05:620a:450e:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93f57faf861mr1060121885a.4.1792666891301;
        Thu, 22 Oct 2026 04:01:31 -0700 (PDT)
X-Received: by 2002:a05:620a:450e:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93f57faf861mr1060075985a.4.1792666887962;
        Thu, 22 Oct 2026 04:01:27 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a4ffd13sm91654866b.20.2026.10.22.04.01.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 04:01:26 -0700 (PDT)
Message-ID: <d808c486-42be-41f8-9f45-0d935c2a57a9@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 13:01:23 +0200
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
Subject: Re: [PATCH v5 11/11] phy: qualcomm: qmp-combo: Fix error propagation
 in qmp_combo_dp_power_on()
To: Nabige Aala <nabige.aala@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa
 <abelvesa@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com>
 <20261001-glymur-phy-v3-v5-11-3848c2615d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261001-glymur-phy-v3-v5-11-3848c2615d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MyBTYWx0ZWRfX1D5dX/qb+yo3
 I3Q1svv7Ih+UTEj77TvMqASEBsmPU7MDkt5UIEPBSaViBfPhVPivuVN3JftWALfqgQkVAGbUyxA
 7NMj7+6vKaUnOKkEgndvGe40yO3xFYk=
X-Proofpoint-ORIG-GUID: ZwN5VuCx0t5fcLzx4BbYour0guWiPOil
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MyBTYWx0ZWRfX50pKulyMLpMl
 46CYWlpb52geOlMoF2ONK2YNAJQ2w97YrNnGldkuThUrqD8k2zFiZ++nELuS3Xy90XwDBZPRfWO
 lMaDhotQmRtxtaVNI/7bIDlcbmZxxBNfBd4lSYNCCPy7gau49MDoeRXGbNaXp7avernQBt90NCk
 VCKrJuyAJ76gAis5+Fwoudq5n1g03a1Psdu5P3vFoO3xKW/6he3M36/sd6SQ0WCmxx1Vf0c0qbT
 PtwcMUDY/i2WW1IyjJEovee5QXFeQaC6TECgSdUaPNPSjqLTS1InXq3hPXPxTgrL18zs4Q0UnTo
 3jAWStacMgZdJ2857Jg9tk7P4OBYJZtTg9joZOBPRvOoHPbgfRpqx33sUmn0nYAjFR/b9hlfYq8
 GDNXVuXRtexiRMMVzG1Lo3ZsG9T9x8RB9uEYlqfk7XeXgHnbG7rxalYlo2SdKrJcCthNUplwFkv
 D/RHLteNTFOM42g6hUw==
X-Proofpoint-GUID: ZwN5VuCx0t5fcLzx4BbYour0guWiPOil
X-Authority-Analysis: v=2.4 cv=TIPQ2Fla c=1 sm=1 tr=0 ts=6ad9ed0c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=1jkgN9UX300lxNHWC5EA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220043

On 10/1/26 11:34 AM, Nabige Aala wrote:
> The configure_dp_phy() callback can return an error (e.g. -ETIMEDOUT on
> PLL lock failure), but qmp_combo_dp_power_on() was ignoring the return
> value and always returning 0.
> 
> Capture the return value, skip setting dp_powered_on on failure, and
> propagate the error to the caller.
> 
> Fixes: dd1153651b038 ("phy: qcom-qmp-combo: merge driver data")
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index 5bbb2b5f8c74..13d5586b981c 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -4376,6 +4376,7 @@ static int qmp_combo_dp_power_on(struct phy *phy)
>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
>  	void __iomem *tx = qmp->dp_tx;
>  	void __iomem *tx2 = qmp->dp_tx2;
> +	int ret;
>  
>  	mutex_lock(&qmp->phy_mutex);
>  
> @@ -4388,13 +4389,17 @@ static int qmp_combo_dp_power_on(struct phy *phy)
>  	cfg->configure_dp_tx(qmp);
>  
>  	/* Configure link rate, swing, etc. */
> -	cfg->configure_dp_phy(qmp);
> +	ret = cfg->configure_dp_phy(qmp);
> +	if (ret) {
> +		dev_err(qmp->dev, "DP PHY configuration failed: %d\n", ret);
> +		goto out_unlock;

Please switch to guard(mutex) which will let you remove the goto

Konrad
