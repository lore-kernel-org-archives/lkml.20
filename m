Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368957;
	b=btdKoFkuJOGNSwVF/jGCERn+ZHN2reRXMMaOz+sD9WdwdFwGkgo5EiOt04O3ddMGV0HT
	 bLrf/1Hwm8vmRFrBXBGtKJA6xafup2paBZ9ByUd8sx+h3P+gqXJ1bN/s1Aif6Nzi33Fzk
	 1kIGeo1pr1fylhKFv+aHUyFtG4ZTxVyQdx0EyPlFuxPV3kqeVNBNhTos+0z8cd6/9W72E
	 ceaegp5OnINLw7d3ro8hCkZiidRx7+sn/bDYw13rTsB2Fcmkp6iF1nurPsankgGAFFJzC
	 PUC1I/E1xON5TyVhl/7a0hKIeKY7Dbia9oqOjj9NDayy1/gSpVTCTsUBPHiiqo69bTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368957;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QNdI+7KWoCrid+Fm1nxPILWoTNaEpSSdkMdBlIEtalQ=;
	b=nMHCeCnk0d6x7mY7X0XaDIvqX8SSmRWO9gRVIICR3ABoP3/R7GAfcSYT2R/Xs9npRVZs
	 II5SG0vCFQ2+3naJ7fLfOxYOPeBRkKFWFmxlyxWQdMRDCeONLlZTHFYF/+SA/vXEl/8yh
	 XcVpQR8hpokWhNM1nRSqnrMV8ryWQbEFMFD+rUKpdR5lEVj5ouCAfqh/34lX+6k6TAyQu
	 fKRiZJE4I7tutPr+6RdH1lwIqE/+IIjy4RE+kQKMw4Yc2zOmJxeUSSRufnT6VAixUFr9c
	 q0btMi7kzSkoHL9mkO6v1nbJUK0LavLkgZOfaHItyWWfr17dG7+8KNoT16y6M94zRFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EqjFGRzf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QmpKG2ul;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350BE606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:02:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 350BE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EqjFGRzf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QmpKG2ul
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UDnZOS3469080
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:02:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QNdI+7KWoCrid+Fm1nxPILWoTNaEpSSdkMdBlIEtalQ=; b=EqjFGRzf/gwkWbvG
	dqk/FZNrc1/HzxTW59nTpZrbFLdJeiJBsjVGWy9qKqEwiue54I75NBcWFtPBESfB
	1k+rixQz1SHx1zeBKvTdw5NX9owTe2RCUnpbM1NaUFnaO6/ZmD1pxDJJq4Fsr1sO
	TWmQjwSZ9DIrSZueS9Pdnmc0HypoPmfMlkB4hNDSgbAWHvpTL6qsjjRIQErJ050k
	VYS/qFtDXPSBXDJ1shKgsacT7ssLaH8bQs61yqUiayHLmANTOg1KLKdxXnCTcYcT
	nRXtg/VrvWMM6Zqok4PGXJts2pKVFsV7MRXzJUM8tg+zkCsOWDu8w3VCeU7J1Qhe
	jBqEfQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qkb6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:02:36 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ec3e1921ecso727055e0c.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793368955; x=1793973755; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QNdI+7KWoCrid+Fm1nxPILWoTNaEpSSdkMdBlIEtalQ=;
        b=QmpKG2uleIdRnECHZJIzmZh8a7lGRnvL50QBkRvBUm+m8NIDqgOc1PyaIiI4gZQx1g
         drnFYZqoLQcwUTJMMInJXkh5/yYfyoWvxgZ4OHDVzzvccPkS6qIWi4yqFwKYrsr9WaDu
         1uSu/j45QQOcTp0HU6/T1Yi5zHQeM0eE1KurIP5Lp7wzdRtB/Un/3kRWNnBqcLWXEYx8
         vleJt7oGjnymQ9hxs9wkvD/4Pad4rdBkTUZXj831dMfD3TB6/uY+ZUBkcZD7CzwGgxr0
         PYsXuXnURk4CZB8cprVPjIHfWqK2bE8nMcYI2bjo6gQBFEpnVwWtjSVtbYq8R7A1CTso
         HtYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368955; x=1793973755;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QNdI+7KWoCrid+Fm1nxPILWoTNaEpSSdkMdBlIEtalQ=;
        b=X/Xjkogd3RWLQzbijcrAb1zHmtoFeEIKKxfhOkLKiPUo0iaxhjTclZeSecvL+1ru7M
         L9zdZRfxLKEMnB7mqx5DrgvH1LVFrvKlRkifeuTaMz9eut3/ojLW+yDBQgtnHT3LD3Tm
         UcF82yBlJKluytNuZV5yAEFTCD5tvRc3bGGVCd58BdOhi+letzMmRbMkywJR0Cb8+2tt
         t36gEIx1N1cD24RlxnpnkF3ttqixNWQju21XTAgQlpltU+8C2w6AinCxLeeC1F2NGUJr
         rvIUrqTfmq5WE8Pv1RpEv5GT4Sr3Lu8X5SA0fCPohYRyrPHYTVtKVmkzJvgfSuDQDu0Q
         cVOw==
X-Forwarded-Encrypted: i=1; AKwUvBzGpp0StGtt6ILkgi2C0vP41s/KpAgkVMoTzWt4wHXyptxDD1rQRRlQ8SKc1On9VR0QN3ycgSyJB7n0YZY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBPP+a5JPGQ0LrNz4iWzAwRJij42WvvoqQK5c1v69OExVEVYbZ
	ghTJhf/TiWrLPu/yNsb1SM765ivUZeJdDRT71Ou01bouUZQik+JbabaCBj7EiGpsa5dvyeFD+oA
	8YemkrLA7KlqTamPNIj6GVbqJhdeoEmjUAxEz3H7w64hwJ3n6rsOEShM4whQgAebmS7A=
X-Gm-Gg: AYBFou3Z7nkWD1Cq64qjWvow3OwnXCo5ZP2a84uUsGU2nhQQSK9295iOuXIJKB+QJPm
	8aeSBsOYIjD9yx08PcE8aeuSKa83M0DqjTE1rdNIzlBJQNlDOYQ59Xgyy8GYGiPJNogI0DfkJhm
	OIZs5fXibdfCLCvIShHLZz+bnbbql9wh/Yp5KAUcEvv4D4FznkvIT62kFOF6mzZW3jkfp75rvO9
	fS7ADQV5Q6gzRKGU7I+D8XZCnbMGDL97Khwv/NC+YcC0ZRP0WyvuDuEoshmPt/BBOHxw95jheQY
	AapPWBUl9grlB48nZbXAJiZiQxYRSx+6fxSPyG82Bp9x1to5ojxyNLdZ52W8/iaqGertA6c2xty
	jNISCYXvrRdGl6J4tyGZnW03SNOwXHpTnJbLf6P090kQvYgVKV1jYYIxGWe5VzoKhjf72N1wDzC
	8=
X-Received: by 2002:a05:6122:3115:b0:5ea:ca0a:374d with SMTP id 71dfb90a1353d-5ec587af5eamr1870718e0c.17.1793368945256;
        Fri, 30 Oct 2026 07:02:25 -0700 (PDT)
X-Received: by 2002:a05:6122:3115:b0:5ea:ca0a:374d with SMTP id 71dfb90a1353d-5ec587af5eamr1869535e0c.17.1793368934913;
        Fri, 30 Oct 2026 07:02:14 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e719eec22sm3808245f8f.0.2026.10.30.07.02.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 07:02:12 -0700 (PDT)
Message-ID: <256cbe11-86ae-49e7-b7d6-0b0eb23a79e5@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 15:02:10 +0100
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
Subject: Re: [PATCH 1/2] mfd: Constify mfd_cell arrays
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Thomas Richard <thomas.richard@bootlin.com>,
        Andy Shevchenko <andy@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andreas Werner
 <andreas.werner@men.de>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        patches@opensource.cirrus.com
References: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261030094515-afbbbd16-d834-4ef6-8910-e936476ea018@linutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261030094515-afbbbd16-d834-4ef6-8910-e936476ea018@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HnSc7IGzVAWidS0CaZihWPIlLGQ_k3L4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX0xfOmNbO5nU1
 eTXq64Syz40aRwfodaKFa9GgFjbPp8oLWjaaaFm2HKuy7WJ3H2fcuH04xhsYZ3bhGPQOfa8pYKy
 uxK8GpW8vwa+qo+TutaYndlIP8J754A=
X-Authority-Analysis: v=2.4 cv=DfSCOftW c=1 sm=1 tr=0 ts=6ae4a37c cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=c-0_0CVZb4FivoHw4gkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: HnSc7IGzVAWidS0CaZihWPIlLGQ_k3L4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX76PUXRYEnldh
 Myj4I9jGjJJtqcZpRizgkK+EQJ3jNNwrly0ko8DvvbCUmH4wnZ3PvOgq1Z2dQC7NhUtqFNsudy5
 OTGKpx9MFbMbu0PJArQMWI70Tnh+zA0K7GxOigWSlN/dNjR6CL4UFnkxElI6EDJ5QAORVmcya7F
 SjEH6rLIrnCvwelFMCfQ1e+mqkl02baKLczCHW9thQQbGswAuAMCRGzGQhcCZGn4pmKCriYqHLW
 zBQH5qnIpECBGun22pRq2AYGj+n4k6ieN+tGz6VX8K4hKoi4Sq2isdofQG2Sf1ggGlCakOO+zS6
 VQ1j/bCs8qShV7+5zwDdRyC6wOjVm2ycFyhVS0+za5dvLpSrQ2Vz/srCbfsgkX3BtZVpvJDQ94M
 M35kscuTmOb1ds06bpSXqIUzsb2mU42fbtVb1mMU3aOcBX5aGHfnrdAOBpkfl116v+fQxIOo3+U
 kq0UJTEYFYZQoI5lc5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300054

On 30/10/2026 09:47, Thomas Weißschuh wrote:
> On Fri, Oct 30, 2026 at 08:11:38AM +0100, Krzysztof Kozlowski wrote:
>> mfd_add_devices() takes pointer to const, so 'struct mfd_cell' arrays
>> can be constified whenever driver does not modify it in the probe.
> 
> Looks like a candidate for scripts/const_structs.checkpatch.

I think no, too many false positives. 1/3 of drivers modify the mfd_cell.

Best regards,
Krzysztof
