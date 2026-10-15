Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82724D7946
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792065743; cv=none; b=jN1w76EfJYyuqWR+MxRM6JQifms6tKbPoVI4FolSipOu/BMwB7DrVQHOB2eugPU8jN760Ir8RccmGpySAyA0hsgSgN3R7x0Zw2pOA64udVJzoXpxmDMVny/KwiqjnWDry9wcaCqIjvsEtPN88I1Ki4OqORwcmDIwI7Kbi5dvgRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792065743; c=relaxed/simple;
	bh=RW90kX5UXhPbMuU773cswcseDtRVTNo/H9SZj3A2zhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qmilLjp4CgRFfRlJr26E9taM3qYngRXXnu3lYT318Wx37UTORIWsMEIGwxY0c31ETDCN95MhXSpO+cOr15pKx4ZnqD9a1WflQ5reBDrtrUCzvE11v8uloZQMyhRcDdRqQcZ/n2hlEIDDTj91uGWgOFGUfUdFVZ1hHnop9HriCMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RO1T7zJE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kSGwJk4C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RO1T7zJE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kSGwJk4C"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jOGq2114144
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:02:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u5tUO2j5Cw5lTw813p08QZcgp9r68LXyMwBdh7jIMAE=; b=RO1T7zJENzrvXhIg
	kZIGA6hBp107Y2ZD3YxOskODR/SK3vv+O9N6rpbOmPOi7uy9zaIJ0ZMmgTjwMph6
	J/ci8p92bafH3WGxWJ/LRCBtHIreig7rai0GT/rHF23Udy61e2jw85RzTIJZjbcj
	coanBk27K8kCtxLczcKA8P2N1f09oUNEkXkQu/9jmbdWI8X5zCrE3V5E0l+mHo4f
	A/Upnd6GnOZSvbHwyfbASbpgavZJPAxsPqsU1whYHPt5Dj1j+BWO1WtpZLKzbcwO
	E+fcG5f8TkPBbk2qKREDZrRr6mx5ly69jXfDt2tWYcQ1ZHCzRgPB+rd9yt6zXR06
	BntBWA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmyawu3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:02:22 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5e705718bebso180241e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792065741; x=1792670541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u5tUO2j5Cw5lTw813p08QZcgp9r68LXyMwBdh7jIMAE=;
        b=kSGwJk4C6QWZ6BGFs9Xus7kVXlQCpR+DIvi/MNpMCHgcg0fA8dhzqsNmECXEDjMVbv
         n6/HiMaEzksQ0TDFAG7kyDqyTtif3uKbN3zz+lZbdiyNqPG256A1XWd0xg8Wb2IVSalK
         aAAe8vd96WVPadtK0jn2jWHUeTO2XrxrMp37SMww/kS5SQ3AAbiiwVnMllesA2Murj1E
         qjRr7DzoE9BmevfGMW8DHZNnUfi5N38oZOFFnbs100BSyIaMBxgwZKoxWIUntbX19sHy
         yaExw+gFwpi4d/eeuUnaaCQwwfrvWRR09buQSxV/ZkvWX8pSj7ePSy2PcJ/1dKyBWDs4
         Beiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792065741; x=1792670541;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u5tUO2j5Cw5lTw813p08QZcgp9r68LXyMwBdh7jIMAE=;
        b=UT6Rv+0jfKh03LBmF2pj44+H9EXsq8a6m+24j/jTvIQMpS+Au5AUITzbVInQQb6RWF
         t3TOJsVPFjWlU/4Ux95mgDd2RJ9is5SAoVCa5jZDgFWveBdePNbAieItBOjncEPiFB9X
         Yo5nstpn6eeThm+03Qa9+Wgonx5S7qEwJX0DSobGRDTO5C4T5jCzBsAmDH3wadEwRJoT
         k+lTZ/+yOnrePumpIamzatbU0M2r0RqlHzxLBnoUl1wjyd+umY3gkmj4No0KDpDBuytL
         2hCdK/vBkaR2ylMr03pMQBEidTZ9RCOfRxBCFNVuh3meSH8DzSueAqQXjMbAsATR+NR3
         7BMw==
X-Forwarded-Encrypted: i=1; AKwUvBx0b5SlsdZJtSc/Gs81xeHj/U73z5QuLvK5WSxiknlatkfx84IaAtdABoOIUtmBsf8RQPuMuVz+QQJNvzk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTfoSCaZibMn3N+kOafsvv5iyGpRhcl9x+8KaePQtJqVXpu+ZF
	d1SccTghhJVS97EQGojJlslTQmR1of6J9cBuAQdwhey702WhAxMKOPz0+pW7GxskfD+L34V90g2
	K8cK1edWbfxzZkbl6xKlrBC0FFPc2Z7xQczfD1shCMT14IyXGCVbFnV8eBpLnvdtEkxY=
X-Gm-Gg: AYBFou3uJ5HOMwUHz+vZ7N3zFK7OMQ3f1y9fi0H5FlZVQJl0dWvQ9uX3+NBlZ0eqzsw
	wUqVkxwQoJ3FiXlRvD04n1UWE1mk/r3FfzNP9+5Obh8kIFqiJVTdFWbtd2gbd/Ro7vnb6F1Dz4b
	CU2CBoPTfBYIplmB/OJXCQUbwKsjyMT9vfu2JFuCi/4XZKZn4Rs6d14mVNeX3nmnKLQreKB8yoG
	xhrYdKnlScqZ+NFm5HyymB/Pz7BtCeEuD5Bx9fviKi0iqcGg8h51QnsLOQoA9D7nNGF4bQtvnAg
	BsQ6tuq2AdnchiBdZ+csdhKnnB0Rlt8pFWPxrjM2GMM+8NpatysvC/Ul709Azhb2UcoSdWpNXOb
	PjM2J1WwjJrhWx5rnETYomw==
X-Received: by 2002:a05:6122:a5c8:10b0:5c9:ac9f:b7f8 with SMTP id 71dfb90a1353d-5e91ef9f2b5mr2905937e0c.0.1792065734791;
        Thu, 15 Oct 2026 05:02:14 -0700 (PDT)
X-Received: by 2002:a05:6122:a5c8:10b0:5c9:ac9f:b7f8 with SMTP id 71dfb90a1353d-5e91ef9f2b5mr2905083e0c.0.1792065723319;
        Thu, 15 Oct 2026 05:02:03 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda6276a5sm114642166b.71.2026.10.15.05.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 05:02:01 -0700 (PDT)
Message-ID: <8cbbdd41-f3aa-413f-a520-749abb8543ee@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 14:01:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] mfd: qcom-pm8008: Drop GPIO support
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-4-b395d2b3f668@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014-pm8010_i2c_support-v2-4-b395d2b3f668@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -ELJh2QwDbhYOFspJUujg9l6ZuTF9RgW
X-Proofpoint-ORIG-GUID: -ELJh2QwDbhYOFspJUujg9l6ZuTF9RgW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0NyBTYWx0ZWRfX86gb5Jkgs+gz
 U5glutrUCjYADwz7BE5oZ9N56L1LlP0rtmEuduUKjDJMoYNMcv+6KfLEhr++fdHpx4Uo2Ls/I2T
 n8CWVIPNmVNu5cMr5ShKlr8YQYh+r6o=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad0c0ce cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ZWiXTBPgYML2d7b_3NEA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0NyBTYWx0ZWRfX3hhtQ1pftlG1
 E+WILUkwPd/9nrkndbugmUeSE6Y2TubCp9tjfhGEqAxda1LCkBbynZechcOVVJ+GLH2AGK5GaEN
 5rlEDK1Tw4WKMui9s4XIDl0TJDwEv8e+i8o6O9Q6NbU3bWjhoVJBMlqiU2hM7CCYWseIbcC9dzt
 9Sk7G+VS6g3dGLfi3CH6zEkcmtLhsrKj50HTjKPoNqImv0vM6HvxJeFRB40l6R6UNOSSX9k0xUl
 UeU5YZvMOa1I4fYfAAqSQ7TpBySV+2x2iciqfch0T9A03jSj2QG5YNDgS1YLmxMWhwKeNN3eQLG
 lx58MG2hrIbYS8XdZ4kKwZayOvOTUAH5LhgY5si1oz2uvxcasbmv/w3HA6G+LFN9i7Um+nAn+Aa
 BEEVuQ14czWaqqpk+JGnWntN+lyT0M2X76RWiiuA3VBtDYHbpYqhaZI0h13qfgpTkWVOJF9jIaV
 M6nNQfOxQDrJJhRLehw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150047

On 10/14/26 12:32 PM, Jishnu Prakash wrote:
> GPIOs used on PM8008 and also the upcoming PM8010 have fixed
> functions (reset and interrupt input functionality) so it is
> not useful to expose them for general-purpose usage. Drop the
> GPIO MFD cell and associated peripheral definitions.
> 
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
