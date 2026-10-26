Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023955;
	b=esZam1ZOYwxNRQf8b1xfNMEYWH4pd6f4snDozcmK68oaT1OaBGuUdbPSiv/l2ZqWsWMN
	 6bR4bA8FWX3xICuClXbVhbFK/MLMe+Qodz+2gMa/f+Y2ldIuDIWGOkRamg+P7UikCY1vi
	 sEjkjlZzgDF3gS1QFYQNULV/ExLt9QjeqRnaeLNzRdfnaKBeQghTkY8xQKmYawTKwGoCn
	 eWFFmGor0C76KuIBOUOoBoCov+ZWE32aRdl9bWniJrbPtsjmLbhjUzuWKiCxp6Yri+ahe
	 2H1FiLPIbK4lSNwf1btoORG6vuORnbuuFeRuH7d1L/BlELUB6IsSsL4aM26N4otOQgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023955;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=V+S+mmWNNAXdCfolmnPRQKSIRG7gGMdoVyK8C7u3kFI=;
	b=iGvjjG8xdvEpyctZ1jdcUzyzhckN/07Ip/MjkSMnGAGsjIgJhBJdjrSjtymfSMlOc1JG
	 UvuAgZThz4bKC71OJqXo6fOlKBlHchQae/PNvDKHYQw4bvjCVHunmybE97MlFXIIeYrnH
	 m4+q2D4M881alkmpSIp2yRRM9S9ecT23YNmABoZDdmKk4lTZvGId/lmvDn6FrX5vKZPaf
	 j0XCQVvZfZOSR4p7pj1CR9tx8P71e68UBRcIPupTv58gOTowIMuQX9wGeNDVMDJ018MRX
	 iZ1xhsY607dMPuxwnzEGEaNjMmTUJuVye0I+xg3iMoy+npgs29W0++6ribNTT1Gx/5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D10w3nIp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SXWwrhlx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2341606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2341606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D10w3nIp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SXWwrhlx
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt0gC3033852
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:12:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V+S+mmWNNAXdCfolmnPRQKSIRG7gGMdoVyK8C7u3kFI=; b=D10w3nIpFbkWiha/
	pHUGRcHj1bLSKe4AoVHQsMWsh6p1u47njClYFwQiltaQWWW6Dm0B3YeDkSQT6uWy
	84srggUKshvtPGri1NjFXY3pHmuducFV3fS7V06NTH9RGs+HVzG6CqU5EEOM5+3Q
	5ZXk7oAWsN72nDz2qRNRjwSyQgSaPhD0zg/cz0HK98KTyr7B8BeyTzKlyokhGatw
	4GSbKNE+7AyME0V7MoHx5XGarCc4juZ1IlTP8cypOPuCHfWVZkIC1lUVrUzqpdci
	nJHeHFqffJJGhHPFT1aVG5MyGcyyCpijvgrPzLXrR2p1/texYRCoNfpLFbMj8jUk
	/rgSCQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj56y0sp7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:12:28 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9906ce36960so133830241.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793023948; x=1793628748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V+S+mmWNNAXdCfolmnPRQKSIRG7gGMdoVyK8C7u3kFI=;
        b=SXWwrhlxRncp96F5A02KR52zVy9QWnWaiIPY/IQ48RHmxfj9uqPISmSgpkrMCARO4l
         28LinqX/rKDS40sLj6wz+37GPiwDL1MxyP+zbpDExEVqVEDehdjbNNQHDa91NufVonrE
         38L5Ow5zGj+h9uMvsCPI3GhSoqA1/aWNakiaDPwMqyVgMG9CD5occdJCMU9OsQn/j8e7
         wIuOr8vZhKpJrBf+rsKWjULIx47Tg/l791V3PYKNhqGbFkCi2zRS/eQ+ivS9hbihx9L2
         iBzD/7KHxjoyxOde4g7PHYx+5QiKSficb7YqiK/gDuHBq7m/Ck90YSBtj9+OECfwUjok
         1msQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793023948; x=1793628748;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V+S+mmWNNAXdCfolmnPRQKSIRG7gGMdoVyK8C7u3kFI=;
        b=Gn6sv4AtvAPyweBHLsJ3sp0Zv+Bqu/pxN7SfFv9t6a2XDGhkdHTiUJki+KtEsQGMmW
         1pzdNmiwGA1Ih4QqdHsiD188I49KRgX/liquLcd1ti46pc7Btm7yZypGJl85w+FLnLlJ
         1DZblmkbeEW99+GzsTtrCfxAb0ZhrCzgiyiFKmKETvDABnoimpx1KmSy7nDQslghzF+6
         ck2DhUjp4UuUpEyJGLPidMKAaDH/RbCEsT7NEbOrjb/s8WI2AjQ6nBn/l9t9eDwy+ZhG
         +a9GekLWCY6uObNN04LqpfNkvPvG2cAiD/t5A5Am4ZbshYOicB48pll3VoF7bAkiKbmd
         wykw==
X-Forwarded-Encrypted: i=1; AKwUvBx/FLQ0SmoGZrMRrOhj8lQtPtEyOhYaK41Eoj8eVfDqS+BzJs6sjyMcSfMjI2jxoB/JUjREpaddhSoPjTE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiUhF/MbuDt7f2DwlRVdAFm3mJZvqt9pnVqbbflomkVjuOmV19
	ZOkkfCnx1KiS94VraUnD0hqtcdIRGaVPSQpXu6IdpG7VuLx0F34sWlZHm7LkUsuUX8CNNBjVF//
	FpOCIXNDTx8uPSdkfaKOTJ171xR71FJRn557dZt6RZg7P9NR3OMG+Q1+JYaZMHrrT4Dg=
X-Gm-Gg: AYBFou0Byht71zca+Y6Lw7xPA7uL/G07Rx/LLJ5GHDxIWSapfyDQJbQyOa/kP/wE99x
	6Pok5SvsUu7a7stATCcP4wNNaDTwQgEPYMmx8NpCWoE88JJ2hypZ/IeDwn4MAA5gDTdKVAYzUOL
	GVtFumvCKTZgiMrYKw2pTN/tYx/5gdKc7XXp2knyGANKkPAyxtniryLYD0mDkxtU6rS52UAdNLb
	F6HFVV/Lc5Gn70tGCL9ey1y9wXFkKRXYxVGOv61BCzCqc5cA4i73lS+regZ6QHzIlC5lapB/do/
	9yFuAlnmFfmEYRIXHmuIAiD/8+fDOnz7bXogDCY8vEzJpMgIpXkf3CgKNZnsVUwjjot7A3ez0yo
	SR+p4AjPicGfNnz9CEzqn8g==
X-Received: by 2002:a05:6122:6b8c:20b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ec2331473amr1934428e0c.5.1793023948019;
        Mon, 26 Oct 2026 07:12:28 -0700 (PDT)
X-Received: by 2002:a05:6122:6b8c:20b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ec2331473amr1934356e0c.5.1793023947243;
        Mon, 26 Oct 2026 07:12:27 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7bbdc6sm324825266b.87.2026.10.26.07.12.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 07:12:25 -0700 (PDT)
Message-ID: <52b1a1c4-6e04-42b1-b868-2edb132d37d8@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 15:12:24 +0100
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
Subject: Re: [PATCH v2 7/7] mfd: qcom-pm8008: Tolerate missing interrupt
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-7-b395d2b3f668@oss.qualcomm.com>
 <e68177a7-f2ef-46ed-a468-15d0d9421d98@oss.qualcomm.com>
 <ddefe6d9-1a75-46f0-9ccb-10766729e04c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ddefe6d9-1a75-46f0-9ccb-10766729e04c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NiBTYWx0ZWRfX4Ab2ZFStkVT+
 3D2bDq9S8oHSpQimhU6lwQLwwURTauu8svdgZa/+WzAeFM0KXIsriTeu9P7DUIr7ktRxr/C5JtU
 hhm+UuJtyGQMz9NbCwbGDb5+V6TnbAo=
X-Authority-Analysis: v=2.4 cv=eMeGH3p1 c=1 sm=1 tr=0 ts=6adf5fcc cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=zrBrzXTul4GvSfT2LqoA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NiBTYWx0ZWRfX5mUfblYKEPTW
 Wj9/5XSpGiF/jDRTRXm379u//VfYC4cDyHAV9DAPrREVIY4f8xjH6uFVfkSD2e616pxxNG6tdhl
 8zc78NttGeEFoJKhkvtKX1ovmG/lFK1fCf6tulmGwTCMgAYltfNvUEnLcXB+vb1RdLiYj4QbkMz
 uWeW7xHGGdmb+Xlw220wZC2hoY5bzOBOrErzLHdK+u+3ddfrZF81AEy+KnxSDCkPtxRRWnrOle1
 M800xcSTSA66ArI0j8jBMeVopxMzAG90pMi7O4WkpDqPihQiYdPuqG7lmmqPuMnNk02QzUxuQiQ
 22+MLFEkTjdEWVydM3kTtWjU/NEGAKryKPmKxRlK0ZTTHM9IoGJD4SIvV6GRMktNeJ8eUtWKONe
 SRZSo7nsjY+3AFcrwFeWu6pKCjhqgXqN/7RnqZAoWu0SbjmFqxqAmiL+wzrunpChd+VzNpgUHAH
 aUoFlS2ND1szn895TmQ==
X-Proofpoint-GUID: 3J1I3XYnyrhJemWioQXI6wwvoEk4Kz-b
X-Proofpoint-ORIG-GUID: 3J1I3XYnyrhJemWioQXI6wwvoEk4Kz-b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260056

On 10/19/26 7:01 AM, Jishnu Prakash wrote:
> Hi Konrad,
> 
> On 10/15/2026 5:35 PM, Konrad Dybcio wrote:
>> On 10/14/26 12:32 PM, Jishnu Prakash wrote:
>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

[...]

> And another point we should note is, the MFD cell name
> "qpnp-temp-alarm" used right now does not bind to our temp-alarm
> driver and this was intentional, as explained by Johan Hovold
> in his change (mfd: pm8008: Rework to match new DT binding),
> in the last paragraph of the commit message:
> 
>     Finally, note that the temperature alarm and GPIO subdrivers need some
>     minor rework before they can be used with non-SPMI devices like the
>     PM8008. The temperature alarm MFD cell name specifically uses a "qpnp"
>     rather than "spmi" prefix to prevent binding until the driver has been
>     updated.
> 
> Since these changes are not yet done, we cannot use
> temp-alarm for PM8008 or PM8010 over I2C for now.

I read that as one more reason to shave off said diff

Konrad
