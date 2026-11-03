Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706459;
	b=qGkYoVBZAWR1K7Gib+c4UPfE3iWn1sVwUZ4O+5GKDmtRhNKBqBBUr0wCVh0n9fWYDgzu
	 xhsaPEA0oh93fpXsnekPg+Od3aV28VIDkuiIh5mrtm51kCbmNj57zSPuCJhtAkWrzjctP
	 qgb3PvR1uQZYlKyQ7Jzm0cgc/vcZB6RgF70OLQX/qAipNz33QgOdcvmYTYVwSMPORypgt
	 J0yNGGxZlhDnpPOPbcWJjAz7UsslR4ZkAn0sdZL5vaDh7sD0j6pXjsu1wj4g1iO2ib5YJ
	 /w93KH0BzpjIAVNad30Cl3XmcrAeiRZJnYcRMfF5inUxF27oyvVmLcogGhVfwaB81yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706459;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=La9ks4GtW0VZMxi2UuVB9fk1/wyf2ZEPSoiB/vRT8qQ=;
	b=0v0L6RH/NmvcuZEBgl5W4W0xkosxsd6O1VFqfT0Kn3extsc89I4zBFugimMzeAoAk4wL
	 Rr51E5YFIwKM9p/lS+WEMjyFcxvL7ROYEl74vD1V1oTIYN4k8BD9S00NBJEWvBlQ1+VN/
	 +nJzyv5RHSRkRH0U6W52OvNxnJx1h35X3bNteZxLB0ahFvTw9ZHnhGpqmb9497UABcnDm
	 Iir9fCo7LVdH5X8GiNvXs8gzjt0yFq2m6W8NmKHX5nVG7mVlXiMFsLgHAsHsUdatmkncR
	 3FqdFy9T9dlPTjbxlOUhBChQ4O/0+1j+R7nEEituALtOmxhmZmE5C6vidqE5poeWfkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lEcT6s7N;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HSg9ycfN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF86C606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF86C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lEcT6s7N;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HSg9ycfN
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAEKK1476075
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 11:47:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	La9ks4GtW0VZMxi2UuVB9fk1/wyf2ZEPSoiB/vRT8qQ=; b=lEcT6s7NS/n9mC6S
	t5+EyoVw2iBm0mUVcFCfmLLzrLG3TSjf6LvKRb6miyQzMUXQMcWXkiJEk7BhSJAB
	QyN3vLhMuwrxjZn0VP2sIJxIRxKpIRTwUy+uay1/OqcalUe7doJuJxlvrTRzvj/3
	5oPNQRiGPnGV1f4iUb+BEUb/6CSvm6XtP7ky0fumzVqEBLwggf3yppRFxHxdHJJb
	w/IEhssBXLus2WFZiTB+7DtWQFCqIteGrOc/ZIkzJhV9cIKDzO/ZZ2uWxZuJ26st
	95NtxqiO8EBpM+2bFoyhIP9UeiCq3mg9m1/rApddhFz3aBGjHHQRq06vZtS6jVWx
	en+5vg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq8u5hktk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:47:37 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so9065631eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793706456; x=1794311256; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=La9ks4GtW0VZMxi2UuVB9fk1/wyf2ZEPSoiB/vRT8qQ=;
        b=HSg9ycfNAYsVn0bPrM5e4DVegr2lveo73rSlGVJB+RBejZ27/dn8H6G2yi01UoV55k
         Bs7lbQKQmz7bULd1PstQRx6Va77RK1n4S/xAFWQzG1Mv/uZejooxe/mh5k2/skVZn6rU
         bWN0KhHSXveQeLYNWF7iNtaKM15G3zQu+b6Oeeie5/d46h3wawUaAGjN4UIc1mqGXPRP
         R0BL+eKlhVwb1lZdSB/nAvlsCoMeaSD2gkBw8ueOGBez7rlKilyxaEZJlKWZWUfD0NpF
         cPcuw2BanZm2EJtfVlWDOTl/TSyzSB00xuI9qzPqfAb6WsKKAC85pxM+jX2gMyf2CVNd
         RX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793706456; x=1794311256;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=La9ks4GtW0VZMxi2UuVB9fk1/wyf2ZEPSoiB/vRT8qQ=;
        b=UbGostXQ4niEppxpWJB8zZIoIiVtCQ8g0xl45w9hn7sR4bhp0BBD+QHsQ/iRfPViyc
         c47agOuQy2y5zTgF7EUvvlaiwTHd6NnjmlaKwckxgjkMtWvm/Fd2yDt2jv7Blezdzf3l
         Xm/oNJc1Uzar3mGkxJ2IfvKjFhOx/2YYP2Q7rKQFSr+pUVWdJbfQ480UBhmCMTAc2hxj
         jCGZmzjiLDCBcPsqwZQpU9BKYVSzn+VsJctwR5K4jJDLXzD3/rF1C4OsgO18es5Uogjc
         BoUh6ib2DIbP92qDPyabzGuKCrK1ZuT3NYOUTPeyDRMK306WM3dYdCzpxhPANfvfTCij
         laSg==
X-Forwarded-Encrypted: i=1; AKwUvBzRX+URz9WbkfwHCZYx/NPwHi/L6hTIZMrA8KJB16RprW8qZC5fDL86Kxk6Gt6SUCk6R0glzIpRaJmLJNA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mQd/ZYZIVS/A+FC3BE0h+tp3sTzJSH1Ht302pS44LArpjk9kE
	dY0Bjjz86kWYbY4CFuoScCwjc0sTEctEoeq3EpOX0ao3bvzrUjixcN9zFE631ppWvf6UtmegOad
	Wt3G/27IzVHhw6I6EHcw/LdjAE2TXJ3zs/iS7SyP2DtlImgVRyipI2OB8hXOnOrnkkew=
X-Gm-Gg: AYBFou0q2B3/IsJ+ETvm6ptkOSA8V8bmtA/NItHOO9rP+wgS8Qt8W571rg3cT5y/n+h
	7z4GaolxSU+pwHLC8yO6jlZHfDRrkXA3a1TAH6IgXUMeuEdlVMKubweG1+v8zc6q1xw87JqYZGD
	6HddxxlrD0jgJLfewNcsVdKlyeWzGo+vcVBfVhFKwTA1a9EEcbfn+/l5ie6xMcCimRSYNlIklv1
	7j2SgZO1/T3GpEkHfIDG5OXyDFVrChToyD9VadJVP/8gAm1aQsMsVFHM419+LonAme+eqCg3aha
	r7OuNL2SZM0srQg5uxKiYMpk6mrqjT2gC9ABnvbpH46eCzfZTDom05GkIg2Si4trg6w+I50XqSV
	lIS0HR8sBSTJt4hL4Xyn0rrYSolApai3KXk/4GkEAPGKA2UJYOUkppiAvhexvSFqVltXIiLwtAr
	AhgTDwUQ==
X-Received: by 2002:a05:693c:41c8:10b0:367:185e:867a with SMTP id 5a478bee46e88-36a4242366fmr19630978eec.38.1793706456489;
        Tue, 03 Nov 2026 03:47:36 -0800 (PST)
X-Received: by 2002:a05:693c:41c8:10b0:367:185e:867a with SMTP id 5a478bee46e88-36a4242366fmr19630950eec.38.1793706455973;
        Tue, 03 Nov 2026 03:47:35 -0800 (PST)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42902649sm52840006eec.11.2026.11.03.03.47.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:47:35 -0800 (PST)
Message-ID: <bf8d0564-8ce4-452c-b211-94ac37f39209@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 17:17:28 +0530
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
Subject: Re: [PATCH v4 3/3] i2c: qcom-geni: Add bus recovery support for GPI
 DMA mode
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-0-59b3ce96dc4b@oss.qualcomm.com>
 <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-3-59b3ce96dc4b@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-3-59b3ce96dc4b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Si3aB_2OhJ990oagyslxw1o_1K_x7KJD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NiBTYWx0ZWRfX0mbzp51G53VL
 HS3pU9qe3Afrvzm6x/sHccgeRxf/gwgngG8ibt10XX622hX5pBMesWsxDSL1vCMvI33p3sOO6tv
 Ouu+oW6zmOZw9j6Y2EEm+QnmxBLc3dA=
X-Authority-Analysis: v=2.4 cv=RZ0FmFtv c=1 sm=1 tr=0 ts=6ae9c9d9 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Ljc_7vWThQ_RCqSD0EwA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: Si3aB_2OhJ990oagyslxw1o_1K_x7KJD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NiBTYWx0ZWRfX9vNKawhT7rSQ
 dVJTFd++AKYEhpOAB7xnfEND9IGWMxFT8jqXI7zM0XC6PyEyq4yHjM9ujl5eO2Q4J7cQVWtaftp
 EMUhld15NOV0mVlDFAE03aVQYTt++j6TClzHBOPNyJ8vrZunJ2XmmBtC9QnTeFs1mZCrJ6yWyow
 owsmMLCkSXDRbTOCGqOIuGtdWR+XYo7eNrK2bbK22ctjMHCqxLQN3vDIYGMut2q0syHGHkZ3kUH
 uXcQz76ZW0SUnYTDYB28avqli49RaIWtemQR3OQvNdUlGN5+FHRYUSrTNbeebZjUhDFtpQD6GyK
 clSCBdCTKZEz2xVhoqX4iudPvbt2oMZu7YQowlJbfAIugP9b5aZIZSgz10fAqc9tVp4oAhQYqQT
 5yyfpZ7cW4CvxgtA4W39qGikfj8+Mr5IQqI1CfGZ1yduvZhh2mcJoGC09ztlVvaUUWYlLJJq1EH
 7qzptWM1Mt5GOyBfhnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030046



On 11/3/2026 2:26 PM, Aniket Randive wrote:
> I2C transfers in GPI DMA mode can fail with -EIO when a target holds
> SDA low, leaving the bus stuck and preventing subsequent transactions.
> The GPI completion callback reports a NACK and a genuine bus error
> alike as -EIO, and the existing recovery path switches the SE to FIFO
> mode which is not valid in GPI DMA mode.
> 
> Add bus recovery support using the I2C_BUS_CLEAR and I2C_STOP_ON_BUS
> opcodes issued via the GPI TX DMA channel. Guard the -EIO recovery
> trigger with a SE_GENI_IOS I2C_BUS_FREE check to skip recovery when both
> SDA and SCL are already released. Extend the recovery callback to dispatch
> through the GPI DMA path when gi2c->gpi_mode is set.
> 
> Use the adapter timeout for GPI recovery commands, and preserve the DMA
> configuration error code when GPI setup fails.
> 
> Stop recovery on a GPI command timeout and report DMA termination
> failures. Do not issue another command or override the timeout with a
> bus-idle result, since DMA cleanup may not have completed successfully.
> 
> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
