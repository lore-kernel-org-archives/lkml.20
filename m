Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633221;
	b=uuiKSljGgib0wt7hdUtL7bpLtASX+AeB5Vrr0mpWNiLYmCXDscwRA3vfOxgJ4wxcfzWJ
	 66Jkl/Ij4vdKe1BJe6PrYRy5tZAX8KSZaQHLCT3DD/kljBFmLsgflTzg3pbaF/L9UF/Nl
	 cCYhgQolBcCS8SMxKdKV158SRmBrhI6mdy9h+azhlTXE4pNLo6GGs4Xa8y2AkpatRONF1
	 ++M9E+kDJmxtKlj9seIHjj71GY/XIKulMVHTAdQikRpsNY28HDwMKZeHCsvIKPTr4bPZe
	 h/8Ey0yTvEPVCbZHboJeIQKaH+uWWGyEgqx1N1jQa6S8OTb62ZvRup/E/ERYLr+0kww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633221;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QSiY87GCJ01jUUo00oIPwsT4O4cpRXayBoqLLS+mkgc=;
	b=dvf11JbtLzEwDVpRUmTH6Yp0kdrN/f7//rlwix0EiF35rzFkYv3CKlJVToP91j1DoKvz
	 1Arwwtbxxv0KNe/o1Z384RXsjashnEYlgoQB1sXhbRNqgiM4U/PLvM239SwuZGo8vQor4
	 9OsTyUHAjHM2TxKgYyPPhHfIj0Vm6vAGgE6hRcF5vVDCXsqnOWiP7WRPOOmwsrBe22Aa1
	 R9qW59NsGuwhlfZr583uAYtwwMLzMhkLDPTyrPFDR6X+FKRIdULKo5jGdHE+2OVpbJyiN
	 R3GTCP1x/8EBosYGr/5k1YACx1Y7MkKudDhRgJCN5jIAjjQuh6iCxmq2oAsSEUat3QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dq0fWTxD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z6rZ7cjB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58EA6083EA3
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D58EA6083EA3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dq0fWTxD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z6rZ7cjB
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpReQ477103
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 15:27:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QSiY87GCJ01jUUo00oIPwsT4O4cpRXayBoqLLS+mkgc=; b=dq0fWTxDt2mNCh32
	wPDhaCla5iyxWbTdVBCLLVaoKZeU8xSrTislPzaUh2u97sOypaNvlq0ds7H8lpwZ
	n5PzAqmF20Jmh7Cv76+BS7AKto5ttjOvzfCBdVGqGY5mWJSRzypUQhYxZNa08EeE
	iKalu0g/sLkFYoQWJSdE3VC44HDTb+HQN3gE+2AvC9x6FV8IlQMTgYQwHxXq6u1v
	vkW3tavWX3rnR+NN4ZoB5Lwfzktwm8L2pqDsyiaJajsyAp4D6YtSAzE21UVJKjHu
	idEdCVZ7ptFv6PVm2RsrDBvyzorCL0rI6QX1SbbeLRFBgRTNj+t5YoUg/MMZHzqZ
	7t06ow==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph19tg5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:26:59 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-77f133855b9so109853137.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793633219; x=1794238019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QSiY87GCJ01jUUo00oIPwsT4O4cpRXayBoqLLS+mkgc=;
        b=Z6rZ7cjBgFzIa3sYI1pptZxzJCSFZXzmOmZcRFzlp7Qw8pEdPCXbIS/vniz3ev6XWo
         4yFtTFOkWBY/bfeL0s2zQ1NzvZazlrg2bJG2G0Drd7TW/oByhkSpXCpMI7ZnLZ4nLLHh
         o/zye5RZzawYFTZxYni8w0rtYiq9NjIo1yo2CdEzc0CEtgJ8/7kBENg2FZ6c4ZkWxs97
         Rcfz26jhgDxOPOWW7U8vZ+fcyBZkOYOPavGol/GFmpS1OVuBnXtXrRNTNim681m276EX
         E6DcubC4NonjfujZf4FGw5BPBFezdXwu33jo91TJKEasFkMK1aOCdIvTUoLWMxPn4mYW
         9fvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633219; x=1794238019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QSiY87GCJ01jUUo00oIPwsT4O4cpRXayBoqLLS+mkgc=;
        b=sFsq8qx0Qi3r1arYniPo4KSbA4lK6TtuOEScEqMpHV5q4JPghapW1gE3h1JWmIqg69
         gqRAaQnh3mzsp7nvTFqoYgnnBKSRwQELqHfLRq7Hm4NYh5Mp3la88RypM5gw1sj2+Jq9
         7cHw9O6AE1upDMYa+1ImlDtZVzwS6WnChX3TbnTISQ6u7RQ4xt3E6IHX19bdw+81RpV0
         SOHXxlJoiLRv2GD0IV2goornzFbdj35TNE8PemOv8Q7Gg9tW+FhX+X7vJCr89btkwuft
         r0XK/U2BPpwJ8ZZ/GJj0Q2aq9+Z8Z3ulJuAF1+yPYstsv2P1moYN3BLR+Wwy1GQYFvgI
         5Pnw==
X-Forwarded-Encrypted: i=1; AKwUvBxvyUiOlOK2sfdplhwi4w9ZUgrFcnBVwQ65xl8nI4iUeIA9q0jFNrwf6Xzub7Cc4/yFYej1M/aSBF9SvUk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1axNW8pe3yr2A7ZeLpai/rs0VDBASXMOWiOKAFhIM+pAN0jnO
	RKD/kNrvYk+Vb+CAGNdr1uOu4v9Qd0oMuLKo4rhosSAnlg16LkgZeHmi0HiRmZkIit/y1xDrUcx
	t95yPzqQg/hR9jSmxQifjOVzDMEd7Rzv53ifO4iVAG4Glj8bMgHrx7anHotPXP3cJE+LmoTEzlG
	g=
X-Gm-Gg: AYBFou00STsfrtb3QnNJojxjPuFvT67Kek6E/gQPGXHkyJjsxFUxkI32vTnbLGtUxGL
	ye25dr/5QerBb0r/LTQXvuz53IJflmzbJDUKLnIWEkTIJmclnted49RVNzehYziw+fwywnBLZYm
	WBhOM/c/6xlw3BFqQv5k/r74O0mJjiPNCSVd52xGj2K5LN2Cx/IEpdPXJEjZ3hFoLtPlzFkvBw9
	5fOf97Zb2WrSLChX/naEHIlHZXDu+fkX7JTlUg0/Zb28wHQwULzasppjvnJJdpzo+CHyyNvVR6D
	Ii9BuyxKleXSjd3D4gzZx/se1tzSBbaZ5lIO9wz/R8Q37QmzxfC2GvD8OV+lFKl2I81IfZWBQGq
	YaaxMuTcPVoy+tvtvFzKacppeHtVkWnlHyT7R4J4DjI79Q5Glgx3hKBZ7w8KtNkgKav19kQ==
X-Received: by 2002:a05:6122:5318:b0:5ea:9c73:eddb with SMTP id 71dfb90a1353d-5ec6858c115mr5291948e0c.2.1793633219094;
        Mon, 02 Nov 2026 07:26:59 -0800 (PST)
X-Received: by 2002:a05:6122:5318:b0:5ea:9c73:eddb with SMTP id 71dfb90a1353d-5ec6858c115mr5291928e0c.2.1793633218512;
        Mon, 02 Nov 2026 07:26:58 -0800 (PST)
Received: from [192.168.226.93] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebefabf6sm1619366b.32.2026.11.02.07.26.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:26:57 -0800 (PST)
Message-ID: <ac07328f-63c0-42e6-b8d5-d3be4dc877f1@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:26:55 +0100
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
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: lemans: Add Vicharak Axon Pro
To: Ajit Singh <blfizzyy@gmail.com>, andersson@kernel.org
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261030074404.33517-1-blfizzyy@gmail.com>
 <20261030074404.33517-3-blfizzyy@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030074404.33517-3-blfizzyy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: l9BaYqqil_IxK17vNhBDng2MfG33dcBz
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae8abc3 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ugbcvswmd5WlYt78kqIA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: l9BaYqqil_IxK17vNhBDng2MfG33dcBz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MSBTYWx0ZWRfX4VMLGnnZ30yw
 tD1V3CITytRvNUum8xlsiYMRCW4/TOyxU3EcxzNBc7voynUZ/HYiz0ud/7/eCMxI4P1pn1EDsCQ
 Z0Vrjtx3uQ/6WLZjJgR9yGcwKbMAf+xsHJrKKVvwwqWOzaWdvf0cguECy9vIwYVdmyzFtYe8eF1
 VHKmKE5nIBnzlgtKNIUUxRmKlL+6K/oSuewnaK9skI7Yj5cquvUkUalooJDp4J1qFZ6mzUZwjRL
 DzKUw82L3Pi7heKtj8K4HBq7SFP9nh1lcjrtJHMRaM2aGFWbITCeDxaJBn1kO/5aF4E8wKC7RJb
 XgYHaZzC0qP5Uk2MXl41tArXOqtUpdMvmy01ECIVSq9PStg9dqKmWElUCLzZCpIpUlqHwwWD4kC
 R6psqFkgajghXe2onygLOPtGxsQB2nxTAwpDUqc6XgrSmSDWYuNM8TV7BFNWM5If/QOvw64wu7r
 8BBblr+DIjkzC090zNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MSBTYWx0ZWRfXxj6QhytEEipR
 V35tJNJIaUrbbnnhxgXcPX2MtB9z+0/mD3Jsd5/gUtb9XWETTYZS2RuHL0CZtxOMGbe8Op3OoJD
 lKtDKhZ6xmOZNuoA+a29q0CQg1FoD6c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020061

On 10/30/26 8:44 AM, Ajit Singh wrote:
> Add initial device tree support for the Vicharak Axon Pro SBC based on
> the Qualcomm QCS9075 SoC.
> 
> Enable the debug UART, UFS, USB 2.0 host, PCIe1 (NVMe), GPIO LEDs, GPU
> and DSPs.
> 
> Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
