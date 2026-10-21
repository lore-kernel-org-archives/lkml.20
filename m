Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792601774;
	b=cZZ/69KAWf+oi8mkASFr3DkQELLiDvJgssURsI8ADJeB6d05OdvcDsLHRHBep9FQOML7
	 GsQ2Ygi7tmNLo73/YtVp2/eqI4zNdbCt6O3XYaIvvTqTOqIoRtEMNCekaC+9nnv0bPlUj
	 lxggOo4X4dIMOC3flbj+NIj4BkKI7roIgzg+cQ7Z0l+BYWVzmLSeyobIyKaXS7KRHWxhh
	 v5l8PmqmffPOrEM9B0bsvaX531ZFSulp3ZVj35C8YJ8HB6d81Cy6SNQun5NPsxo40MS+X
	 /s+kaMABhwZTl2ukh3ejBXnD9iqfMOdkTsLaq1sryaiIYEShZi5nYSTI0lT9ywgUErg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601774;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=U1odT0h545fjjEeb0UTVDvE0Tg7Aw5T2oDxzlxF0X4Q=;
	b=0wCYaRNVkm0JHl2k3YdC6axJ6v+cVJM4qWrNCddWUMzVWw//yVVXFZA1Xd4eEEtTlN41
	 Q5MY0OciY2CXX/XAswp1NVpYqXJ/8AdHw6r1QXL82oSLO7P5TxoG1JVta5+ajknyIzAW9
	 Fth5vmRRKU9ICjSS25StMabCddAC84/N8Gxr25WVBmehVdRmsKohP1g+Rws8eRc/wlSgm
	 iOCvcyLvFFt4j4yNG2yEmJNGCkZ0x6qDAEITug2oKR+1Fo9r+BBJb5L18czZ3tQ0079tD
	 ztAJnaI0Wi4nc2N+4zSuh7I0CxFpR0OloiUe6eb5q8qzg3qoajjBRi9bVlfgH/Jv4yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dbfgYAmU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cYuRoPmf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2313C60A4AC8
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2313C60A4AC8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dbfgYAmU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cYuRoPmf
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFUGAT4160145
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:56:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U1odT0h545fjjEeb0UTVDvE0
	Tg7Aw5T2oDxzlxF0X4Q=; b=dbfgYAmUPR83D3MquXGFpWnp/Wrxo0tk3rIRxDpS
	ORZg7yNiKLtu40ncUtPzayfksX2qdpSYPEbC7mAtRvt6V1NguSsQD1kLwjH/54OH
	gXxeTx3s9cIzc1PVS2iED6SR2b7VyhNoc7Db1XjQde5WmmfCpFiNTdzTmHMwge45
	UDNUHFy13zGTOYJdadWx2R/o122ddPVokeWQYByBbJqzvFyVB1MxHrO3xIZ3qw+Z
	rxIFrMV00H5uz/KfE63V6Iomz2AFOvoTVhccJGK2V+EO8ZX6LyUv2o+J/wpxP4vV
	vR8uZ/PASeh2aQyYlX+1wOP4HgcX7oBIU75bgQM0EvY9+A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex5q8yhd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:56:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f13c143c8so174877285a.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792601771; x=1793206571; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U1odT0h545fjjEeb0UTVDvE0Tg7Aw5T2oDxzlxF0X4Q=;
        b=cYuRoPmf0X9XqOhph4XOfPKDZySeuyRhOCMvZ6glNlMBVeqd+eamYW8FTjVNSOYFC5
         lptHqWdprO7FvoiHgOvgTCAHVrpMQR480LdxEf6fr4JFdr+ze7DDccketXdvxhXTHeu9
         tpJ+VOKJ06uZTCmd2vVx+guEjwXiMLEFUttASnHlVUEhgiVsbqWEdFJjCjN7rslJZtH/
         jomUv3a+JIp98mdvJFHCilcWp1yy9ID65YRqlHiGMhIr6NXgLORXKgpFTH1fVqSLBkFA
         NKUjTtCTY24KNq1/tNfmM6U/zOTeZdz/HAt6/t8yhxmcE3/43tKGuD+X0NIdJ+cWRnrN
         w4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792601771; x=1793206571;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U1odT0h545fjjEeb0UTVDvE0Tg7Aw5T2oDxzlxF0X4Q=;
        b=pJpyb+KLfS+AJEIU98VJ/GonvVQSsj48X6gwglO5+B8/YsIkkRsrsrHHtXy4yPejm/
         lMJfgoS53iSWhUYX0f4vHsY2vR0SzkW6K4OJIRpYcipux+qRrmbdY01LwwGyyIP1shJ/
         lq0cvZLhbuXfWeudst7nSm++l63SBVRtE1Wltcj0Uvkq3YaZ1RP5t3xc9x/KpzKhKDLR
         Pg/0xrmVbQzfcjF+ECPd0QNBBzabn2SsSCZMWhavDSnAXNQNCHkLM9AJl1n5W3TpgsL9
         JcFWtR2xz50jfKsO/NSGxY2M2J0uGrYm9cLvwmJuo91xu4bDcLGOjvMWIXKZxKevhIoL
         yV5Q==
X-Forwarded-Encrypted: i=1; AKwUvByZAtDDbJoXrMl/YjihFWceqe4maLzmQUWr1Zz9xnIlfkrDVhhivDJNQBlXRKm5maJG8iNljGTWlty9Ckc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKi1KjbTx3tt5gEtuOeQYfXhVJeLuRFuAfCZNj8yDSPX3vrihRf
	24FtxgpBzEkUXfY3q3a3TN/hkqYo3EYSzXpAzfe8JD8SXZkcsS04ilw2BdmtRH3uA+/4133JYc8
	SPMZi35yzo5RpJlxWQI3f7Xna3RvpwzVPnLgQW5IZdzY/k0rNRGWgFRNxtxqvTajC4ro=
X-Gm-Gg: AYBFou2cI84gMWD+AYzd/xZboLo1+cFXp0rxNvRtqi/DPxHXBIia7S+wCWzw2kDNnJP
	8xChtQu0gkqO6lqrqKNR3CUt1UufkliiBhVJuiNj7dspVjHvT24TB4zWu1yd9NBGnr8r6FxSOBC
	WC4nmBNi4Qxof23BopwNP355xYvgJwJWeceK3Y94PQVK/ey3hPz7DF8pFO3TNdGv0LdQPEsvUS7
	OcyYuNXca2Tw49HbOcdDwtyrby3wd71BC58LTTzgVzDNYOJrVQZQZbVFaUySTD3dBF+dzBhss3i
	x1vlotop+hVMYZuXq+ArKYWy56W4U/h5BsdgRF+xBE4fvqbqsYcHFwq9URXFZAV0Wm+BoF71FsS
	v69572QStNjeT1y8n/Jrov4e8twf8c+F3OYaOc7q7W52EMm85DJdWtgS1miDRCQy+0dZN9kMK8V
	D6ut2K//0YHMHj
X-Received: by 2002:a05:620a:31a9:b0:93f:1445:82a5 with SMTP id af79cd13be357-93f57f7a432mr536573385a.79.1792601771288;
        Wed, 21 Oct 2026 09:56:11 -0700 (PDT)
X-Received: by 2002:a05:620a:31a9:b0:93f:1445:82a5 with SMTP id af79cd13be357-93f57f7a432mr536568985a.79.1792601770867;
        Wed, 21 Oct 2026 09:56:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa124187fsm640279e87.78.2026.10.21.09.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:56:09 -0700 (PDT)
Date: Wed, 21 Oct 2026 19:56:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/4] Add Qualcomm's IPQ9650 APSS Clock Driver Support
Message-ID: <3v5ul4b2qddghhwdyzbjh5uqwo6bvghrabr4nzs3ttvxpcwfne@tyepx5pz3tqv>
References: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NyBTYWx0ZWRfX9/i8Drggzykj
 krrXiasobRxyiokH4GDAKYBddFu7VyPhbWQzlwoYhLx5NODeqJ1pennFcZwcnJ0bZ6ELhU2n4ND
 nTXnq/A1Ml5lGdZVTi0OqUrteFP9VvI=
X-Authority-Analysis: v=2.4 cv=eJaGH3p1 c=1 sm=1 tr=0 ts=6ad8eeab cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=slmPpXlptjOQBmdJfhgA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: My-5Q-ZPhUu2ep98oH_raGMOWCRo6VBS
X-Proofpoint-ORIG-GUID: My-5Q-ZPhUu2ep98oH_raGMOWCRo6VBS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NyBTYWx0ZWRfX0oBmOoTXvaU+
 cJ/MS3gnDTV22VXsKiN5IIfkm5VKixO0F/ZWBX319beVeEnwz8XQA4u/8UmgBIY5pEnNSm26g5X
 sNvYQ/ncBn1Vwffwcxr/HWpctF3b65Ns7v4uNJRMBPm636fVcbxff60nCv145+KmGCidK06taHK
 UZwujNPm13GTJ/ZpoXnw52n+eWPGYQq4e2bvQM2tYpKRlP/Dt741o1kEUCSTZ2CQggFOusMWEUn
 a8wkuo7G3WW9zexaVtVMBCYd39q20Tx6TS3vLStLWGcySNyOMn+PBmauL5Xr+521mTrSIRXSz8c
 grYIZUA7WnW4CWzeEdQ5ENwWou5veX/POLxg5g8nBSAnP++C5ZL3HKec1hCt4K6D1k5KVXpBK7B
 3KDfPItBDQr6QY7Oc35dIPir3lSkucsMbF6ukp2udNERB/mc7LgJQU1QV+LsSLL3IbHYcE/YqgZ
 il31HlofrgqqtsceROg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210067

On Wed, Oct 07, 2026 at 12:20:43PM +0530, Kathiravan Thirumoorthy wrote:
> The APSS clock controller on IPQ9650 provides the CPU and L3 clocks. The
> four Cortex-A55 cores (silver), the Cortex-A78 core (gold) and the L3
> are each clocked by their own Zonda PLL, selected through a glitch-free mux
> whose parents are XO, GPLL0 and the corresponding PLL. Since the L3 has
> to scale along with the CPUs, the controller also registers an icc-clk
> provider in which both CPU clusters vote on the L3 clock.

Is there a complete picture somewhere? Do you have a DT implementing
CPUfreq somewhere? It might be worth including it in the next iteration
of the series.

> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Kathiravan Thirumoorthy (4):
>       interconnect: icc-clk: support N:1 master-to-slave topology
>       clk: qcom: clk-alpha-pll: Skip Zonda PLL configuration if already enabled
>       dt-bindings: clock: ipq9650-apss-clk: Add IPQ9650 apss clock controller
>       clk: qcom: apss-ipq9650: Add IPQ9650 APSS clock controller driver
> 

-- 
With best wishes
Dmitry
