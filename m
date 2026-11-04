Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798506;
	b=0aSImtpVR25OG/fF96gM1uclG8+g66/BoDvNmXd5xwR19QTquqnPz04yDFVQSVntaT4T
	 Ot5GY2Kdv9IoCDwGHeej5uVoa9NKdYtae4iapLkKYvQAZniR9vnNMCrqZ/JQZEyTltwC3
	 eolbxOA2wLAv49BAqAUkSbVFJ/iOArKhyc4tGhMTWNXnJ9Cg2sndiQaP39nE6pyn1u1Xf
	 X7+A8i8xpZnSTeejwbQliOdNjSbI0Pu4fh6PWLOmOce7jqsDldmZXIxPhZm35ADRe/oSo
	 zK8H/2PMOy/UYPahxu7aAKP5CUvYY9l4MOwxWUbBcaqmFWKfZH9ku5N0Ko6HnsUYZ9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798506;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bdDbdezahsnwvvodBAeZroZhoHCyGDtmjwh7kWkAIGA=;
	b=1t1hpkAYBXPvobmZBpi4f5W7KfzXN1QxNTwmGw7uiydbbxmQ2QF23qZ1aBs0AxLb8Cgj
	 WfGMWWTZszCAmHZxLd9aTRnv2n2Uwz0b08bMFFkirY4UEJConx9Lj6/quv6XrNafv/9pP
	 T9YKrMkkHfWJiWlPS/a+RWY2cuFoclhjpUMHtT7B4vG4vp61oDo6cBx0igJer9f41lhfO
	 UdyOj+U/xtMzhnRKFaR1tnspbeekHF8Z4bBYiV+lVpi6KxVkPf8SRnHrptMZqvCcs3c/B
	 2ARfePztgMEUWMIVLSAccYJg2v0773w3+9qJNcp/vLYSxQJspKsk+mYn8OV3FnzRaFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hMkwn1Cn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sjyo6MDD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD250606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD250606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hMkwn1Cn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sjyo6MDD
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Bo3DM1387756
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 13:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bdDbdezahsnwvvodBAeZroZh
	oHCyGDtmjwh7kWkAIGA=; b=hMkwn1CndJq7dLbOzHFcp/c7/7+LQmnU4IIeYXhl
	eD9flXMfO5OaxwvR6zf96TNocN2EPwyBHfrQvx5gGEzZmRspTRMI/3FRyLn5T0nO
	qO41sHImGEHld9GwuCDhB6F99fvCiDuFm1TlIQYNaaFdRjFO/x+usFvPgSkxXyA4
	ID2fD9HRzGcPw54pAVPqmi+DrqNoJ8e4HpPBIeci+lzWMD7y/2DAhp4K7eupSWlq
	EqE0hb/9UOAHrXtqnuGvWtK69xBgP1n+U+SX3wIbITKHiuTT3c5NfNUqCY1eXeGF
	eJuVaTRqZ+2CTMIVbZ0oA4nhv2JbtD0c0Fu/ehoTXiLj4A==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqvsga92s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:21:44 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99076c676cbso205107241.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793798504; x=1794403304; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bdDbdezahsnwvvodBAeZroZhoHCyGDtmjwh7kWkAIGA=;
        b=Sjyo6MDDWJLQeMVjSqSGKWmDG7H4krUMB6ZdNQ5m9dHjyBt99Q8CwA1wQmlVRMbUGH
         rqI24qbrTRoJYiBfJapCIziabzEdgSXvOo1qIr3Wzhc+dCZ2D/9ILiY7/WyKx+/Bh/hQ
         cC6ySuikCJVLMiVtU6wpQwTY9+blH9La1pQzJei/mFiaWyT49WTABmY+n/nZjX3QyYBz
         FIh8XQnMyHW6NhnIjVTUEJI+mcj/Q21U6nZf7RK0QfVvOqGGHGIVAhpwPJ4UdysQ30jF
         7sr8+/TUObuNDX2AIMW8KUcMqf56HmUxk5m8Y5ev1wWhdP4C2xYAxl1PsfFaEGO2pqhw
         KZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793798504; x=1794403304;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bdDbdezahsnwvvodBAeZroZhoHCyGDtmjwh7kWkAIGA=;
        b=KhiiJhjABiWOxf1Xlu5LfcZZXmymcKzv8RACDXLYuvUG8OvolJDrWDcrnnwFUVprdP
         BJdDjCO/YXuKMO9mXzF6m1TkpFxUXOkGh2LRa7iey9+IyiWD5z0VMqkRCCK/fuzQC7O0
         +dZbQAAWFpUsy8hDj53qQNi+2OKw4yHFgLoT32CY84XOOIka7gvfXZufkx5Pl7LN5kvv
         dKyv7T9ut1phORDpZCerSPmiG58k1TEwoKPRaJyqcsPwI2G/FG0w16Kc1NVJek70jj6C
         yoPhfJ1V2K37xM3ZZ+6cvRkz+3DnGdmnLVuldhUJg2rRN+C3R+gouyfwO2m9+AD3p27X
         wXZQ==
X-Forwarded-Encrypted: i=1; AKwUvByXPa8C3eYCUJ//2hkJs/9SOG9RS7W3Q6OJ49P9sl1FPUa5Fu0aTNG8UdF6+xTvM7PqbKXGgsCJCvKR4fs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QDf4q7wyinxF3NcJ7VSZf257eYMwHMqkoSttCLtdThGgATtnG
	3FdmfHHrA9tHbkQXtmBc3AuglZ7h4c+1CBcsz3Mn4mZvgiKks7dz5mD1XlXpX4BI29cGZ4L+gmd
	9GAn87K1DlOdOlzkAMMtxf6rHWcRHJ2rQLEC12NHLIM/bPmleJksjvaw2vfFpLWbYHx0=
X-Gm-Gg: AYBFou2eTKdsEh+APxO1oEa+iRpM657RokIfpKz27P1awsVvqzfnJ5Qi61p0TQjsZMw
	XLaVTTfc4AAygRn9J3Nb/2CjW6gvLcLtyWA3fhhyryEZxiH7mKcyp1lYfgaCUDYWQBl3/f+89fV
	EfAdpsVWx6ux2OCXabcEFKITCB4Y6kMzywCaiCvyldU0RF+qOMMQ3kpix0TGzpx17ilh2lXSDNB
	6kZz5q3wZuiTOSZsLEKXFMYdA98Ia6ny3UnRpKRwrXAqL1Yp0XNQPn21hXw1p5IBV7jm3V2a9Kd
	cMouwUqHx9FKiVV8gpG8NQqrsjWy3iNmyZF7Fdhbg6xz8qTJ4XyVMOZ0SHuIS6xOYYXuE1ub6Iu
	nSDjOs6nwYstlO3bQpZgpS/Ah0NBQQU20wuR0SIGr7y1V39AhopOI2sAkSKLTh+Q=
X-Received: by 2002:a05:6102:5712:b0:7c3:881f:b620 with SMTP id ada2fe7eead31-7d072c56c97mr5830341137.21.1793798503871;
        Wed, 04 Nov 2026 05:21:43 -0800 (PST)
X-Received: by 2002:a05:6102:5712:b0:7c3:881f:b620 with SMTP id ada2fe7eead31-7d072c56c97mr5830327137.21.1793798503118;
        Wed, 04 Nov 2026 05:21:43 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b412e48fd8sm51175065e9.1.2026.11.04.05.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:21:41 -0800 (PST)
Date: Wed, 4 Nov 2026 15:21:40 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <andy.gross@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>,
        stable@vger.kernel.org
Subject: Re: [PATCH v3 2/3] soc: qcom: apr: Fix theoretical use-after-free of
 GPR port on concurrent RX callback
Message-ID: <xqvbybeyrp5fgortzu7pkq2ge4hshhsma2nu4ag5isjsekmitr@66erhrmbpega>
References: <20261103145635.309032-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20261103145635.309032-5-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20261103145635.309032-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GtnXaU1C c=1 sm=1 tr=0 ts=6aeb3168 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Fpy8J9LNTvDAPkKIS1gA:9
 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: GT4csTo_MNA4uaAp-w79nAnvMkTtNJNd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1MyBTYWx0ZWRfXycLpU3/mAqXC
 vdvZS5qnbJHh0xj/hwBiL4MLUgC1Ht24dLgUQC09tJA95URJCyv2a+pFsh3RY4/P2pt4aYdiLJ1
 ZiIz1cziVox2sqqZhr1/sEm6PRYeiS8BlM/oAmLI2kk0cyKErlbxEuS7mO+hrSe26iC0e0/MlfY
 nvq9kfk3QGVlodlH/TGUINtJf9EADaZRLbMPDk4w21Y1h6n0j2BU0OktOyMydYe08SbTxeZO3s5
 Fte/jCnUVXiGUfzVknwOq0uS7b1Mz7c5YI0TaKl/FC1ylEW1aU+MlDmIiiN5DJvt1A22klh9AEb
 oJo4XcwoJLToYxSD7lAe/Lkkouj1AMwya55ML1Goy6fRuMawZ9lS7fDrcWAJWh3LmgzZh8k+A0k
 q6la8juT3pJDXQwtkvGY1znbOJbZV79WJCI/dYnZU8P4h8SFr8gyH6x9//HxYZTmhaWTaHn+9xo
 lrXp4jZ/Fl/B1669brw==
X-Proofpoint-GUID: GT4csTo_MNA4uaAp-w79nAnvMkTtNJNd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1MyBTYWx0ZWRfX46s/vGpyAduu
 MdQBlZcJs1ej7ryJuqv0Z//MTBROxJBGLt8gALfYutladnbc2xxCuK7ucxxgdQBsOJU7iUXlAHa
 byUTdVl09AwOb6dfu6otPatWaW8Xesc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040053

On 26-11-03 15:56:37, Krzysztof Kozlowski wrote:
> gpr_do_rx_callback(), executed from the RX workqueue, looks up the
> destination port in the IDR under svcs_lock, but then drops the lock to
> call port's callback.
> 
> Concurrently closing a graph calls gpr_free_port(), which frees the port
> after removing it from IDR, thus a theoretical scenario (not reproduced)
> is possible:
> 
>   CPU0 (RX worker)                  CPU1 (teardown)
>   ----------------                  ---------------
>   gpr_do_rx_callback()
>     lock(svcs_lock)
>     svc = idr_find()
>     unlock(svcs_lock)
>                                     q6apm_graph_close()
>                                       gpr_free_port()
>                                         idr_remove()
>                                         kfree(port)
>                                       kfree(graph)
>     svc->callback(..., svc->priv)   <- use-after-free
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-1ebe255f-a874-46dc-b7cc-455e7bce402f
> Fixes: ec1471a898cc ("soc: qcom: apr: Add GPR support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
