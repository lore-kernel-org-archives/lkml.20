Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793095943;
	b=rNnWfiiVAG8Z7Qt2gotmimhzcfDxo2YM+hyr96VQZKQ5UJNbbf89kIlCMy1xQrRQddeI
	 pPzBfOrvtJUkT0Rp7jU02QFSOX8W6/OGaZRes4WAw6q5QYjcOYUSlbej8G1xstUjq1LIB
	 cAZ1YCt46nn0WYUzMk8z6e0G+He5PkDoLZASsDW/VG/LkVCW+Bc+FNAMFS8JLHxlA8D4D
	 aZ4YVZE0hKk81mC2l3SGLkKh0fzwyr3zzBlfZgZ8zQXg685KZxDK5csO8ZC+fawnJHkJR
	 ikXN+IHhOD37N58MZae1HD8wNmc3tOPANT1SffEZ3OqIZ/ab/tbmjEh/w72LkOurwxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793095943;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dZnFHrUl+Gj/kFt3fJT8/StQYbFIpGVV57CGxmYbwtc=;
	b=sETNM8E4E2tiucGpWj/76jSuVwN6AJkBdvnjelG9Qr7lF6X7EoG2qx7U6eD58+p+3Bsl
	 L4abS/serdOBCB0u/4EnRtU534+rZqAPb3gF+26NFChg/j6yAwzn421al/LmeXXQFtA6O
	 8b6kjVGaYSEpkFvf+APRvbe1Fk5Ek6mUfV+N5RT12Gfpe9fB/NcAhTkPxGMsDAqWeoux8
	 eO2iw7fjTEb9qExaPAmKiopQCD9qYBYW7EAuU7v3hNRBmQ+eyeoW4nSd6fCbYLzRK0BqG
	 MrHXW2t9a9VoUM6d18oDOuvzZXj6mHmq84jCYEMEFanupdVbpaNPbDc0NMUcfM/KJTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fLSBDTaN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=akr+87RG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E134606A320
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:12:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E134606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fLSBDTaN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=akr+87RG
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R8fvwk2259190
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dZnFHrUl+Gj/kFt3fJT8/StQYbFIpGVV57CGxmYbwtc=; b=fLSBDTaNKRLh2hEr
	yvyVAWGqth6HKonr+sPGzLCqrP94y6OfJVrcQOb7vtsi8pwTKEGTU7ZPRP3le/+h
	yB1AEwd2EC6jpgcfDUBWBKtZq3csFAAkwFs4BswZCNdCOTHwPJX+pmiGhIjUGrh+
	n/vgq6LStHXHpVxWp0cNwCnC+uvgL3SKUjEgwZgu3RAyBXvybGH1e5TLvp/pv1Bu
	HffWM7TtzD+VgivKG80LzGqKzNAxjCDY7c9oEoqnfx5NN9icM54jplEZKTGZrE0E
	2Vt6LgFs/wuL1lSS+r4nsCOW1k+nNMvHixLWByJGRtQraiGlFGjwyaRRXFGZ30GU
	66E98g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqw20j28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:12:21 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-88c768885b4so7152236b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793095940; x=1793700740; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dZnFHrUl+Gj/kFt3fJT8/StQYbFIpGVV57CGxmYbwtc=;
        b=akr+87RGh5+qXhfPHP3Rc+Wxe8dIyairNR+xYvf+E0FnpVyXauNn4cXK7KCPj5Mk9v
         KnNArUR3pqWz8hc8j8wCTwXjlxzf+9yUerjU3GuVA4vg67MR1fczxAhl4e/J5rZdpe4d
         RrZyqZnxgsgMfDXfkY1VdL3Avfjf6bnZ15SZ5L5YuXPlEN8CqU9ABbuD7yPiojWfR9wr
         r16dDpJzWoPLkXe+TM88PPPzvpcXbEbgE6Z4M8yulxHOf/KR4VFfZK9S+oOaC9OK2XmY
         e2GutPTEKhI641/i6aTf3Q08bMihlpOgpj9cf3uB4Vdzb5VWszusbtIHkIOYL/p9TZQo
         kKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793095940; x=1793700740;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dZnFHrUl+Gj/kFt3fJT8/StQYbFIpGVV57CGxmYbwtc=;
        b=NnAn2PSrn0/+fh6Po/iCzeo9qkkwFS1JFYakJAdzzalWgT7QmhpjxMGWMPmpXkr6q9
         dKN5aZUcrzaJ8Uj+70A6OnMuSig+c362iLZH/7qJN2FAJORz6TJvIW6rmrdmkkSMMqDM
         /sTChkUh2Ukz7A4oEn3R1FLyZaHa3RlV+3xVB6+OvrgqhRUAwrtcqyMfKaJGvfm3o3Og
         i5SGuuG862Oj69rEf0/+yDduBY/Ef0X0/GGSDdOTIDBmT1Y8kOcDD20wGfyaypPfz5Ec
         UAYHsD3RYEYZTR9df+/0alPS8iR8RfpuP2aQUA1j+XB1EKhGQhY5h/0+h3y2F56ptU5g
         +1uQ==
X-Forwarded-Encrypted: i=1; AKwUvBy37Nf3/de2MUJuyN7EH0yJvXDDWXh2+eQXb3Phx8EBlluVYH34SvMksjXtl4CRJWiUQj6aYqTqdLuO9jk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXQbXh8Y6KsFFGeJuG4EKNHmyFm2D/dNUxqRlBboJtDC5bFMjO
	MeZSEk7lj1UhpCI5Du6v3gNvCHa1DllloX0vSInwsOxbhuz49nWbzHot/TamkVlV8rRC8XLn6Tf
	cxfqGBkA2BE5j/WUe8JZiYKl+pHafk9F4Vin5ixTqtgLCvYETX74FrlHoZv0RqAUxA4M=
X-Gm-Gg: AYBFou2lB//J1lDtx8b7ijSrFulm2v1gPnNuoWowhEbkAPbqlyWBisWDAy98Igtmm4O
	8QOlAOSZYAHod6H6LZ9LrNYelponAs/XeiAS/VzvzNu0jhNsb62NVY4pEVNgzLRDYG8GWvaz/v/
	1/q1hqMsYu3CsuU6Kq/zIhQejJq2yN8RixiJ+rKKgui/K9vjhCPrTjcJeeIbZk9jngHFDwg9hFS
	/wnVETQvh+H6caDrhfX5bxp5GvUcCOl5n8ZZGk1y7QYfQFfKMVpOYcR0SGIT9QOrWTgfguD5Nhb
	g9K3Lk5HORSXW9wiWmfzZlzzhK+YFCsLMDZF2JpThrP8ZC7tWks2rRdV70XEoRyJCVShDjB7bDU
	8ZwqolI01XGy9ZdiSEMHDnzdcsZyAFLFb
X-Received: by 2002:a05:6a21:35c6:b0:3e2:3392:53f0 with SMTP id adf61e73a8af0-3e7bfbdbcb0mr6810838637.14.1793095939988;
        Tue, 27 Oct 2026 03:12:19 -0700 (PDT)
X-Received: by 2002:a05:6a21:35c6:b0:3e2:3392:53f0 with SMTP id adf61e73a8af0-3e7bfbdbcb0mr6810815637.14.1793095939506;
        Tue, 27 Oct 2026 03:12:19 -0700 (PDT)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc666d1sm2442498a12.16.2026.10.27.03.12.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 03:12:19 -0700 (PDT)
Message-ID: <7f405774-f6e4-40da-994b-02c8dfe8d648@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 15:42:14 +0530
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
Subject: Re: [PATCH] ASoC: qcom: sm8250: Limit RX digital gain to 0 dB
To: Filippo Falezza <effeffe99@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261027-sm8250-rx-gain-v1-1-386ee6d971db@gmail.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20261027-sm8250-rx-gain-v1-1-386ee6d971db@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MCBTYWx0ZWRfX2rcW3xabDgZw
 OISkN81rOdz+mSIrJsabsRNwoyb/IH3cdcxpUFN6AWxrslUJSuNMcGwqy5rMfVx9Q1TxHDFDmzG
 jUb42oMPdrF8tqeyFnLjKvKWYhv854msPoKnFB6q1lrImvOQsvUR2DUC1ER1lD0VRTVsPJ0kT+O
 Jff3ODaslo+QCBaW0oVg1QEMnlCSVdiaz2qeknhEbTEoxdGEdHBiuULatFkVpobLaN8mYgIuE6t
 H46nCJLSkyPEpaKTjVWEsjcAURE5ISz7HPx2pqGFsIu+xChC97DFI4CvmXD8tJ88xvWkOiBYlfn
 f78f31oIcP3agQB5qkbQoHRlFySLc59jlGiExX2Ct4CRN3p4mDg2s5w4En4ZWf2TtIPymKVL5CT
 /s009v7JGn4FWXFT0BNzMCAEz62LVrNEhn8MZel0MlRjo2vGYozZ+MJbaNStMauiN5Cdq52kpOA
 AcE8lA6QPMaoSbLyDmQ==
X-Proofpoint-GUID: DSporaCxZpywS5FSQWUH-OF0XuvFCbqb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MCBTYWx0ZWRfX+2PvKfBvpSSX
 emQgcCmt/nUlY9nhKH+/hTZKPq29u76dsCd6tYQmlOKywECSmHBxJYt4O9zVILECDdBJIyppeQ9
 bGAbDgu9PuNQppJU+N7kx5kpaxyanfs=
X-Authority-Analysis: v=2.4 cv=PsYG/AM3 c=1 sm=1 tr=0 ts=6ae07905 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=PDEUqFOJZ0MzX4fEFhsA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: DSporaCxZpywS5FSQWUH-OF0XuvFCbqb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270040


On 10/27/2026 7:03 AM, Filippo Falezza wrote:
> The RX macro interpolator gains ("RX_RXn Digital Volume") run from
> -84 dB to +40 dB. PipeWire and PulseAudio map full volume to the top of
> a hardware control's range, so a UCM device that uses one of them as
> its volume control plays 40 dB hot at 100% and clips.
>
> Set a platform limit of 84 (0 dB) on the RX0, RX1 and RX2 interpolator
> gains when the RX codec DMA link is initialised, the way the sc8280xp
> and x1e80100 machine drivers limit their WSA gains. 0 dB is the default
> of these controls and the value alsa-ucm-conf's rx-macro init sets, so
> existing configurations are unaffected. A control that does not exist
> on a board is skipped.
>
> Signed-off-by: Filippo Falezza <effeffe99@gmail.com>
> ---


LGTM.

Reviewed-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com>

Thanks,
Prasad


