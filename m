Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792992682;
	b=s5d9Pz3K3oGOLGe7+b4cTiyalyNIniYtLSzl+Kp6/2xUYTc0Chk/UE9Or7aO/jhxo/bu
	 AzRAzBY7m2P8ecvM7cyT/+mikKfCFiwDAQdeZTUn1lqOOAy/eIOQej+RCl6e2QVgqSyn4
	 S5PpbcMk45mYF6RU5eYIm8l1esQSzQDJDp8alah0UpMICWXHFPLeRwn15NstlNSoEfjuW
	 kCvtdiCFiyfCLKIOaBNLbu2LTO8vH8qUqC6qOEXo6dX6WGpcZzRnVe/2frbLvSO5buNL1
	 ge5qc9I/l/zmernFpLACmHMxCcaAhGuTdd5QDfeM3AldqHTteX8oBmLuL14sK4W5K/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792992682;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PlujsyuCUi1kWfCtrDGOhLB75OvATIPXE/Gw9ApCurw=;
	b=TZndt4Js7kj7Qzoo3TEnTYQ0gP+hMtidPQywbfgI/ZkWI4CB/jrZbYDSFklDOoA94UF7
	 7E536PWt4J33CFD+yd1cSUg1F53j6fzinGTCmGiRLMyWaqY6p6EWarJ6o+jEkVru5NxT0
	 nFy2rExxJ6Esj4qfCXXXgEqBhDqm5ih5vnNgHgHcXqlCYZ0CswCo7PGM8j6/VBVI2RnDC
	 aeNKGcmH49lGpZwyFKAQdZBqoJREpzqnAvoZ5TYjdW+/py8D3jvnNxSMR4zpTHAzYBHgJ
	 xXUvAuVZhTJ6MHayGP4+lNUp2V/TYJzRRrgL2Pg/pAx2oDRqUgtVh7j4Au1OW/j4tzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jjHQO5TT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="etx1K/YY";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5193D606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5193D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jjHQO5TT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=etx1K/YY
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4avMc2727100
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:31:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PlujsyuCUi1kWfCtrDGOhLB75OvATIPXE/Gw9ApCurw=; b=jjHQO5TT4qCEYWvu
	9a05YClP+echbMyLofIH2MSnKayOoznBn/j4JWNHM5j1s/kH78OSoItHe+Y1Uimb
	Ct9F5kNV66vWR72XMOy5HMtMpk4UeKMYJKeLUKGZ/xU/hEuAfve+JbIIpMWqTah1
	bGBJnvNGYrla2YG4j9mzsaHh6ICJPHOGf8yoemQZc0xD/RMFGhR/Tt2NTgnePEaB
	TeGCb1daDNE4C28WcAQsUNJ7kqADovrynsvvl3zGQIHHluHk2+3DzVYelHVaP6Uk
	OsOkRK+INBDJh6rG+cBvWDW/yZ4vDUfi93zBs1rm+p0GCykW/2vGbdqzakCHNR49
	dihZ8w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkp6n0tf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:31:21 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso4831492eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792992680; x=1793597480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PlujsyuCUi1kWfCtrDGOhLB75OvATIPXE/Gw9ApCurw=;
        b=etx1K/YYlSBFzRyJr+rj54tdeVHHLZ52sIRq5l/tvmD4Nd5bpIemTo7F9q3lr7/AdX
         L4rzDbAs2q6i2vAiqrrX9G4XkxtHi+CDbOd29uGFLs5SNarmA94yA7LWufXoog27HpS8
         xt3uHX20MHgOeF9wyv0adcMKktmx9QWH0fuyW40tWnHnZSQxh3LKY5GO5ipld2lUKOEI
         SIzB8MZXgq/heqBuZnkIxJKcKh06FP9x7gbKZYT9s8N4BayGVRCuB9StDHzykmSu8sW+
         he3aXg3HLzq+4I50356hV0Qp3B4OmhgyIOEO/m47huaCLbgE3dR+Q6kwJjCJhahsIPXR
         aWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792992680; x=1793597480;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PlujsyuCUi1kWfCtrDGOhLB75OvATIPXE/Gw9ApCurw=;
        b=1Aa2lfmst8hm13ajAYgh5OmvARdqYcuDry7mBKXQoq2IfceX+nvDu/dyjHWXvmJC5q
         PwnSsBiZI0reZaf7n/0VU0BS6WosI70MqGZxGK08i6XFh6lZQE5Qyiswj/jzqOaQbKIk
         MfUJWTPE4eXiwZS6+g3keLZmNRSuplefVGIGAjIZoPSzBnsKGjji4WJDe9RDmrcqQ4+r
         /ZC0dO/5MqZBUwdvyBGaTRmTzFserklh+O7wPjHIfsFhyxlMwcn2bRH0CTjXogUGvvhF
         t99kKS8vUmKEXqMPu+R8JeuuQDcXCaesLuqwJYAO3lrzLGy0f2JAmcV/rAh0HXDFVmgN
         q7ug==
X-Forwarded-Encrypted: i=1; AKwUvBzYKTMepwTABcdfUVgIZwleo2hs57q8RI3Dfu7x/b3jLl7zgGQTW5YPJhKPyE7xwOIzi4MRKZY4tFf+FwA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdS6x9c1WXafLogQdWZVcK9WCKEoJWvSrFeEpyaBrynlqbGZ4s
	KDQ9g9zGrrVHuyTs5d3G6bPLqzKCPBp1v/DpAE4RB2SMTHhj5ZNHfF5ZyZxLJvfwAPzS6C28Q9h
	+t0KjOSKvpY4/KBKtnErncruBf0EyNQlHIU+K29Z7XOz6yo3H2g7geHyqSfbQrUJtnko=
X-Gm-Gg: AYBFou1qi2WtAO0CAqX/2nEpj5G3UtfabGqoCtS9IQgcoSgxOIMlwayjPKnlttdhpl4
	tTUCTuSu1pCd4YGd0Vynes0w+ryA1PQZ5Om7l4wbAKihgFDslAVA0EubbornLW4Du9NS+yijT+I
	lRKuWA381Sn2Djwq37dDQlJemBt6iwLDEYmVYUnLV8S27QE/f67Jrsk1YY9cwoRJ0OV4Dg7oVKU
	7c5fa+99MfTBKoGLNrrNXMWJyZxaJD+k1Rm8CCsm1Mon6oiDQuCbPjFdmwernTFBzfvSsl+YIzT
	bQKb2DnpQS0a6H92liEMP2ViUEHVgd5LSPyuTdqYMYcSZEeBk7TTXXwra4BpT7amcIhEKR3i4QN
	LN1RqDmxL6t5yQZ7Io6ZKZn0Yegqlww==
X-Received: by 2002:a05:7023:885:b0:149:d501:b990 with SMTP id a92af1059eb24-1993677a1b1mr11019302c88.25.1792992680083;
        Sun, 25 Oct 2026 22:31:20 -0700 (PDT)
X-Received: by 2002:a05:7023:885:b0:149:d501:b990 with SMTP id a92af1059eb24-1993677a1b1mr11019264c88.25.1792992679477;
        Sun, 25 Oct 2026 22:31:19 -0700 (PDT)
Received: from [10.219.57.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee69sm29231493c88.4.2026.10.25.22.31.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 22:31:19 -0700 (PDT)
Message-ID: <d0b68329-a784-40a2-919d-971923a599fd@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:01:14 +0530
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
Subject: Re: [PATCH v2 2/6] arm64: dts: qcom: monaco: Remove FastRPC compute
 CB9 entry
To: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@vger.kernel.org
References: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
 <20261023090308.2898683-3-abhinav.parihar@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261023090308.2898683-3-abhinav.parihar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mcxOMWEGC9jzAJGovKGVQK13tJfPqcz4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyMSBTYWx0ZWRfX5MSZonK0wUx4
 QMMAfknTOD8C7r89K1XE3czWNSBv85FzKCYx4B4dPHO7Pwo/Fn5zqM8gsPC3QZiOFbRvhRBK1vC
 XU73TCPkUbck3BbBb+jMP2abf+3/5Js=
X-Proofpoint-GUID: mcxOMWEGC9jzAJGovKGVQK13tJfPqcz4
X-Authority-Analysis: v=2.4 cv=bq/Zl0ai c=1 sm=1 tr=0 ts=6adee5a9 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rdexUmAEWTTLP2vLS_oA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyMSBTYWx0ZWRfX1J06UapBhzFi
 oq6T/lQQSu/uovP/K22zfwW/x2QxoSoGCTXI/yvfHeLoV2/ezJ1PnykTHU2KEhn32SwyIFJg9Jy
 2t4R5URscQufkeQ8BMYfh0FiUj4mN8wAYDiI0sHKiLpPC4xhXQs0h9JbcPMs8b+jjxy3tDow69q
 ohpNJAjrmaU95Imt2i8Ok9Xp4N1nvVQm1dyMuV0wFyizF0Tg36rCl8sBSp1VjjrUF8UH9diON0z
 fhfKIxVy1PGjcLF3bCE8pIu9hzSbxbOIXJ8vDkIxCdF8/N+d6p9rywssw3PNicI95zhIUcsZ2Ss
 pK6uCuBRHCtn7kP1hB/IX5ogj1Z2/gkJR+8Rq59mNAAyTa5qDHNxYQ0VSlo55TPZ5P34wtBPety
 iYrESlc8f5AJGYbBUwwzkVu/RG7jxxEbSxSTbzScasrY9kpVREZphcIfgLcwoFm61v7b8Wj8DVt
 WrMLymjo+Ihpiw+/WkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260021

On 23-10-2026 14:33, Abhinav Parihar wrote:
> Remove the compute-cb@9 nodes from Monaco device tree to
> prevent clients from selecting a secure context bank for normal FastRPC
> workloads.
> 
> Secure use case support is not currently implemented upstream.
> 
> Fixes: af0d19ea5a31 ("arm64: dts: monaco: extend fastrpc compute cb")
> Cc: stable@vger.kernel.org
> Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
