Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EA74A99B9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363287; cv=none; b=Tp7rOeWXWacKVH+APGxVmZSGDnF5848Bw+tgmwmsZTTVaGfYS035lTxNzvUVk8ExEqiZIK3Ea4AX46USVH7pcpRixp5welLYe70fBb0xOAc1QeL/mIvfdSDZdrcSmqfuwK4JEzj2f7IV/rkLwjCxi/V+qic6F/IiAzj2hK3xi7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363287; c=relaxed/simple;
	bh=111HryzAB3+BmsU9N8tLYwKEyvYhIGzqqk3NSmGK9+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ig/vyk2EfER1XmYDDZBkkeYuAhes4zHlQJGjigfS1zmJV/+tKQVG2iuokuEB5PxDuBgEODzsAolLdLLEjaUu115lZi6RfZsIaAv6oIar7tgbm2SX9xkQXYj/i6S2Y5wmX+jTXGilwK8GpXnuxkING+P3RGaM35Xa6Wj9LhGUdfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OpJN5MBf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FCztkWi4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OpJN5MBf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FCztkWi4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682DHVuT468431
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 15:34:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+e5rc5ZqqqGIDuB8180+QRzd9U64c1Eil4t/TI37H60=; b=OpJN5MBfxd7f5L0I
	usmbjBFo1h+2/8y7RkUKk2IJkFuy8AbcnK1GzmlPlnfnjsCCSRL4asH6GM9eBJ0N
	cDUC976k1JRmxJgYhxxcGH/2s+8rdST0guLo59KiWiBzVMHF2og13jCceXKcqvdG
	KQ6VP4AkCeZcLv0XEmP/BRWW2hfvJhn65AT722CJ/hAXap2dts+ONm/GhRHsG1xl
	T5Fzvfr7YPm+NnrwIhM2+EhuG0VA+xzMJER7RJbOpgjPsWaZe9Ktlyqh1mJwfynz
	BSNNkcNFM1+aYz7WkCEoINJ0EmLYZ605DoflJjH4VSwcRc5jBa2yt5cEbuAEfXb8
	df3ISw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemja0grq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 15:34:31 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-738be9df36fso39671137.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788363271; x=1788968071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+e5rc5ZqqqGIDuB8180+QRzd9U64c1Eil4t/TI37H60=;
        b=FCztkWi4iSBs9Cbps0bL+f46Y884BqBCv4WkdH0ee0JCW3cOTk8ipYiXerPsWizetV
         axmYOhQJFxXvVvCvkd8Qmcz5ZW1pleq0pTd6IqPbTAaCLLR/ZoRs9uaOHnFu5ir5uYKS
         9mTvGxfOxJDQuLxQG7k1vAzrqGvjrpOdG3xEzvFeKrGEMqV6Kfy4rUGzp+zLZfanxzzx
         qr8iN1QBweBHf1s4AGINaR1+c8rBaFOvXroq8rtmDF2j2wrGvisxGURJrlwQM9v0ckU5
         pQOKFdLZALggI1Fst9cIIlegAPkm0nERoly+VP7hCsC5yWU0KjAtKgBnYkytilFjv7fn
         zceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788363271; x=1788968071;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+e5rc5ZqqqGIDuB8180+QRzd9U64c1Eil4t/TI37H60=;
        b=m6v1CI6dl8LWtpMS+UXAV76/kcTyqv5NvQy3MPC7hAE9uCC3Z1vzSBLSW06n89Yw7O
         5ITQnediXJ16yYyBJNK7Xvfd11xldMJ2itkhgOlfAhaIWCfRnO3ThHcf13o1iZFW1UTg
         GO04vqpsYMNn9fE0cTa7sik3faxMi4hEDvGxbwBsTStsj3+ZaoAcIJfYUVHSp5ht5Mqu
         i0VbT+w0vi1dicOZpOmym8HZSWWvI6EYBPF9cDuxE+X2MzTtpNeN+kosLHjyPD/wNSm1
         jWHs6D806ntTBAWlBHHH5pDjTqxPmBsF4Ug1iDoL3J3i2DZY3pSU0vLxFcbet4UhXTd9
         f38w==
X-Forwarded-Encrypted: i=1; AKwUvBwR/CJTcl9GEBhJoHOAYp++8yEV5DnWGiLNFXfBNOpGXuKe5SPof7r0oz5MYxCgWWc5ejFP4I6/EmO3IBA=@vger.kernel.org
X-Gm-Message-State: AFuF++lYk/9kJ967z2w/9RbS7k6LVu8KTymuppatqZjNPuPwR1hYgyyT
	4+Sd4BM58TWw64shk5ybqiDGTZwTTtXFJleJaAwF40avSCiKYrSZ2xZ5i3SSQGLJ9BaaQu3pOm5
	ViFiDJztmuJRnsvAm94KnJUo5ZwUlG6aSoAD6vvE3A/RbSipkhconlJCWxaHm8nzNIHo=
X-Gm-Gg: AYBFou3rN+q28BOvAugdjAwyzpWdRXn7vyn89mVRpE7Ph9DgXwsw/nHxeVd/6WRWIhB
	Hmf6+8Sz0japhmtNd6rIeHf8guvO4eiIYdniSMawmZ+F3sdrJcRONRRlh7vXC+I+Iya60eeynHU
	4JDTdBAYpH6hy1tpUr7F2/KpKsvpWnIkbaZju/t43ktWhTc/VGtpSbjTPURNqMktNKXftd7UEY7
	tmhprzY8nPSvKf9RBTkMWy3XInOrJlTG7IHW2ikpMVVy7MuNq2XUfoNPvCwSsT572M1DiuTpYY0
	WEDV1qB2jN+y+m9715wo0kR7M0lBoj4srHWo+CDaZ7AdS0e320xIeEbvBhPfTxTPAsGQ+IpFBw+
	wuEX45sPkA4OUJ2z8HsqW/g==
X-Received: by 2002:a05:6122:6d08:b0:5c5:b3c1:1fc3 with SMTP id 71dfb90a1353d-5c7d23a5f77mr928048e0c.0.1788363270866;
        Wed, 02 Sep 2026 08:34:30 -0700 (PDT)
X-Received: by 2002:a05:6122:6d08:b0:5c5:b3c1:1fc3 with SMTP id 71dfb90a1353d-5c7d23a5f77mr928010e0c.0.1788363270357;
        Wed, 02 Sep 2026 08:34:30 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a35a5e887asm1147281fa.33.2026.09.02.08.34.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 08:34:29 -0700 (PDT)
Message-ID: <e1d809dd-0972-4ad3-9dba-0b7d573d9190@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 17:34:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] arm64: dts: qcom: sdm845-google: Add dual front
 IMX355 cameras
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260901-pixel3-camera-v8-0-99f159883348@ixit.cz>
 <20260901-pixel3-camera-v8-1-99f159883348@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-pixel3-camera-v8-1-99f159883348@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YtfjbRJ6ideH4bHELL1mvT80oEOtkW5o
X-Authority-Analysis: v=2.4 cv=FeAHAp+6 c=1 sm=1 tr=0 ts=6a984207 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=uxpBaPyPSpK-buiB_gcA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEzNiBTYWx0ZWRfXysJLIfks+ISs
 qy4YULIVB2i6tttgnx9twevQ0arrtPk6LJARJubvaOVWZb/FtuviFUpcRSMJCZWTWyQ5Gv+kDKI
 ma+5GUty8XFh2IAv/Bp1VbbskZsSnn8=
X-Proofpoint-ORIG-GUID: YtfjbRJ6ideH4bHELL1mvT80oEOtkW5o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEzNiBTYWx0ZWRfX8KhyfBz6Gg7F
 JCXjG60+UJ2BaADkj4T5eiZEq7dWTtDRS8I8JTzuOPeUNs9XZsYWNgNq86U2gwOcXxtvTtLNZy7
 aItJ5X72obJTnJSRG1t8q4qSJHzIE/DpwFEgj6Jw5xW869dkigVo5AxJRcyvnMQ6L+ACpsdSx0n
 0O9/LEkZclNHYZ9c1uIh/F5oZTSR0J5eC01bCLQ9p5pmuLLeFg4dA3stL0xwx5iZLqz+9S+leeb
 z/+VUacXFav/kOasnNLLRp2zJgvoI/IJavRXicejvreNDZ4CVAVvzoUpWW+heoizEjijxEr2j5l
 RH4EuHqstXPVGl7Dqi6z660OD6RIAYoVJbUZEBqI9dJpjQudxNf1fWfkdadIivVOcQ3nK2vcEFE
 9a7iHj3b8E65SeRTwZUuBUsGEoBwjinbs3Zx08Bazt8lE26SD0a7MrxL+CrUJFzUH12yr1waBpa
 GYpIjqRvs1VyjakMtIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020136

On 9/1/26 11:46 AM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The Pixel 3 features two front-facing Sony IMX355 sensors with
> different focal lengths (standard and wide-angle).
> 
> Sensors are connected via CSIPHY port 1 and 2 and controlled over CCI
> I2C1, using MCLK2 as the clock source.
> 
> This enables support for the dual front camera configuration.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
