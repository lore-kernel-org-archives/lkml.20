Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705088;
	b=CCJr+ik8byiF1i3xJ+IMypWW7PlwJMyv6n73ZdbK5f+RDKZRaEajh9T/qjGgFHBEojB6
	 G358fH96baAfNn1uSk9xbKUF0CgCZqbBcCq6ws0CPDPwfyj36SDYhTnhctayogeW1MWRx
	 H1kQqFG0lXnkd6+J86B58Zsw/m2Gdo6+SIkVIfmj0yWbbhYmeEzanJbHsAKppdWnCkCVt
	 WAr5ObI0nrbZ/9uLVmZdnnYNhvd9zlguddtQr8t9KdouBda70avnkmAKRWwvu4++25gGq
	 7bt7+zsMnCSXUbCOhubFM65gqtUqfwJiKnxYNNe01OpNl8f21GoQ28EimIIhfaG90Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705088;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QqlVyg+4SxHyWGbqD6MEOj3gqhmpTxKhd4H5ol0BuKo=;
	b=OoAEAHlx9X0Rk10NahWLKeiEExUC9ogkcUNOUnjPDcWvLyLigtvzo7vxNGzkojI19RhG
	 4wQ+PbGgPIdVh1Xavvcp9i/BkWJVKKgeNtHMk6RdmKmWRex3LLTWbP0chm3SWbWyHSM8s
	 qRMhHYJ+DD6OKBbDTbK5GkabYU/V0fproKCA8wkozpUqQouW1AtSveL4ZupHHPfH5z2Tx
	 G/ohFmeCedfOhK0g+TGkYoiqNHh3XLOoJzCspz6hhuFmSWFKlKu4uzr4EA++5JatKV8qN
	 8ifynZWIPw2wbfkNkUirZxBwL0MBDLUPYYCEMQBITBd3P5AUT3hkH7QQVEISuR8qJ6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ey660j63;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YRLG8Wbk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F58606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67F58606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ey660j63;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YRLG8Wbk
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AA8gd3526200
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 11:24:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QqlVyg+4SxHyWGbqD6MEOj3gqhmpTxKhd4H5ol0BuKo=; b=ey660j63CcUOVg5S
	oWYK/DdDV3WsySRYf0E5QO5Vgvy95DfpqC/6EpqafrSfHCRlFaJZeNgmfCDng5oy
	oNcvREz1COh1Ca1Uxvkl3Qey5W/TFaeILIjJ/hrwM8uVt1RjKvJDMdGr8u2UNoQY
	oxfzu2x9sZ3VuzBgYUW5+rojHzjr3FIhtwkXcmGAGw74yTE8+hUIVLCgqPVe47/r
	O+NjunEYBh1vd/JSv7QWMPGq6eLFp+MTbmzvrWgDaozWpD6e/IYPH3YM4Xo27oW0
	9mJo5E/wOSDP7MHkBoLjz7TMMuJnY37nUu1Kto57iWv15sAq6gxwj25+qWt1LYN9
	FfREgQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq3uy2mb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:24:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5356c6d98cbso6773421cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793705086; x=1794309886; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QqlVyg+4SxHyWGbqD6MEOj3gqhmpTxKhd4H5ol0BuKo=;
        b=YRLG8WbkOnC6RwuMU4wLrF+yp+JgO6E3z30hga7DPPXub4HSxtbpY+2jJplLQ8ZnFH
         s8QJfcK00/QgZW68stMqzNs6yOSG3YyeSTAH2lX/WrCzuQXv7f/4TazmvmNEfaOO9cOq
         YGuHvbIvIjiPftWp2st+pwNHlqfYZ/tWAhCnwGPOUDmFMRDSMi6dW6vWzcbek6HIm2fc
         nY0dNY0/Cv9FW6Q79TrBBMZSP/ugjWt9pVy06PAqq06Mn6sHqKFHCxaXvD9v2YIuo2XB
         KLWCtOtwixU982opEGm27mErrmiACoyoTySV0WMf8p1KmhOlSbXuZirGtGf2dGEBAz0z
         iVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705086; x=1794309886;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QqlVyg+4SxHyWGbqD6MEOj3gqhmpTxKhd4H5ol0BuKo=;
        b=0vDenyV91PeMtWFBmlgWe+4to3+6q/ksPn+UDqUUKsdt3LGdHfNW5aBSqECyIiFn88
         oxPyErk1/rlUP48qd7rDiiQxeWEQYbg3riolRkCN3GucdkVyiqbdc/34KPketrjvXOqj
         b6Gt9J+z02QqZUma6fNl9PbNCj/9vW7znOWUr/bkblNVzZLPVLsadq/En4s335DXhyZy
         gGSWpeELr3yLcWqS8iVB3+J88Dh1zNLNzHkxU6JF5GfdJPYis4cr660v0O/fJPJxns1T
         noDeEEvqKBFeJoqMDjHFyTteezrCr0GB3lqnjRDYXpK6Di08mK4bnbUkCcSoaSbiOKqf
         CcwQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6OGuVL8Y5jDzQBF8BkAckxnXRMIMwwdDS/jftvcm5oN8rhL8UrvVaJFBr/xXu+bU4hj26dDqNEFmLlR4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mHu0j+awfCnei3lCt4yVcq3kzJjsouu90+VMuHtDY6tArgqb6
	4X7w7Y1RzMQ0BwJ+MzP+sOAkWMzkn7KIQ5BDkO3MNeiPSV3WcIgwC/lAYP4SH6ptazpO/qd56fZ
	HSI3yqIMNb0E3UJp7pK6KBMFNARO8qZpIBaZ5joZc1gqgGGo8PayrQOQUdb2HBxehVIU=
X-Gm-Gg: AYBFou2yp6ljF/E+bqqo4lpBlW6VqiN/8YFTcGbTp5xM/PCdPh4lAP+SScUEnOypEeF
	7nSYihHSGqmyC75DpLm8hIlsG9InXM68v2xNSMYVE6/4F/Npo56CL83TU00F8oSLk0trY1MFRhp
	CjGJ8t5szSyCNR60K+fwhmHilabIEfHEBnKImLXE4MiYnrijvo/bcQPZ6kFGtnduBYyWer1iP6k
	tK98J+JH1bxJtmXbwG+MAu9uj8wS/WrexCL4lCybdQXFCI0rDY868U82n9UIrii+wl/gSBTxfOM
	TXT7PBLfxtVIETVnMIafpdV+MVgw0b+Ws/xuTSdR0lCW8r5ADacfJA7y16VHZKTTe/uqzyyhHXS
	xHXTzxzCA86thUMuTUl5nGqkKzVeHSCUEJ0R7fy1k2We89hoXVfk2rfs+s8o60AMqKFYipA==
X-Received: by 2002:a05:622a:8447:20b0:543:18d7:1823 with SMTP id d75a77b69052e-54318d75457mr189595421cf.4.1793705085512;
        Tue, 03 Nov 2026 03:24:45 -0800 (PST)
X-Received: by 2002:a05:622a:8447:20b0:543:18d7:1823 with SMTP id d75a77b69052e-54318d75457mr189594971cf.4.1793705084848;
        Tue, 03 Nov 2026 03:24:44 -0800 (PST)
Received: from [192.168.226.81] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebf3ec91sm76164366b.55.2026.11.03.03.24.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:24:44 -0800 (PST)
Message-ID: <236ab115-51a3-4e2b-bf1b-6f775c387a72@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 12:24:41 +0100
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
Subject: Re: [PATCH v2 1/4] drm/msm: Rework IFPC disable
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Sean Paul
 <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261102190010.720443-1-robin.clark@oss.qualcomm.com>
 <20261102190010.720443-2-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102190010.720443-2-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RzFc240_vKfKVfnv4_06acf0opEP6PKS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NSBTYWx0ZWRfX/UqVPQSXppgI
 Mhz8FMNYBNP8pjH/Vr9rotItKymoLKYHsdqQ0i9nwEwE/owKClGnfapgeTh335sfSN+KNWDKTft
 qPuemJSHZ0FuoGS5kNHQx+znL1jo7CdpU5C2/9KAPHYJ4+T+cyGkxA+ij45tSe6VgwfkseQRm2E
 ImFnEfZH8ReazJWOzbao/xLAQ7kY4MELb1mwpSM9bghNUtoJviuVRWtGExiDxyWFkTCXtJHzXpq
 /u5/ngzxTFpv+efnsy54u7YAk4om3jrXQR2MtNUxHdl7j5iQGxmeKTLmOzlPKUa1NF3gVVKtRq3
 j6xu8hcqG6bCg8OYDkSc6gpBPICf2mp/JOPrU+ebYV5Pd6PwcV64MgRUD47/4aOJ79Bdg4tqRAI
 NRBEqVzGLo0KUJg+YRgugpKKo02irIyLemppHi2yB2hdciRYEaKw32cuw8M6hoig4v6o7Z+tZlE
 PyJcVb4d3He5WEWQ1qg==
X-Authority-Analysis: v=2.4 cv=VoG2kO2n c=1 sm=1 tr=0 ts=6ae9c47e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=td5gT8Jxdf4Ed59i9cUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: RzFc240_vKfKVfnv4_06acf0opEP6PKS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NSBTYWx0ZWRfX6IFilx8KX7aE
 KIeZdByLq3J8ZzU7w4C6t6RW8CIvu/DR1hVm9OFEldSD80lHEm2yAZZXtk2tQ49/3PNZZxv1P04
 WPnT+Ll1EzDYTiKpOqR/TN8koVQuaCo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030045

On 11/2/26 8:00 PM, Rob Clark wrote:
> Previously this was coupled to SYSPROF level, which made sense at the
> time.  But there are other places that we need to inhibit IFPC.  So
> decouple it from the sysprof refcount.
> 
> Now it has it's own refcount, so multiple threads can vote to inhibit
> IFPC safely.  The renamed gpu->ifpc_update() simply applies the new
> state by setting or clearing an OOB request.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Sashiko still has some comments

Konrad
