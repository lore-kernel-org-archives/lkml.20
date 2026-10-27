Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101969;
	b=o2WRv9BOlyczbZBqLWgZqPLgEfcv/H4P6JBdhEbUz5hvPX0mxn5JC9/YkT5c+q1bQHrM
	 xtqYbfOv91YSLSvbaQq6axjhBmE7x65t9R3uUHWD1vZDR4YvWopd7UxpWnEY5jvPhi63c
	 wrqc3CABooSSm8Ex09PXeE4IF7QZohdiyqJNoHvjtp7OQm3UiKZP7kBdgXO+eG1fMyuhG
	 8qdqVq6XYvDJm5ptcRUlgN47mydeZcwPc+rGXJe5UBfmVNJH6wOqJSzhRZVy1POeMbDmD
	 VWkQ4qPyOOYCw7b7tmALuYKq9WHjkHX55tLW2wZ3qGfI6dpT/lOliGQpuE8UiJiAVxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101969;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=evLAp26msHZa21KMXu+YtqFBUAj1Nw5xOqezOiL4fU0=;
	b=Kp0miN8BIcev7lnzH3Ll02qBbSXEeMynjQvs7SLSB/RARtlOyja3tUWXQ672wNI3xndd
	 ggezyR1JAzQezUaEd+Wyhzi3m6qK5XVTPET73nAhyiiGWBKcZFe9UWX2GSVu2Pu5Ulx34
	 LmOB6i8A+psur97n8+ObttdnyM5wNp+oVyoMnHED0P2JLqHIUTnXbAgb0FViYB1zjikwX
	 bh4YEiIB/AHQQ6lU4pPVJrFf8F1Egkko4hIQocvxoCbxlodByxaqy/SOEwRYwGJPIyrai
	 FdsAHa3z6v1WchkFZhwhf2vgDPOyUNkjS67p30KTyU44Tjin022rRRe5xPIahsWEGqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fasM1xdz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B8pKnWBS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3C4606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D3C4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fasM1xdz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B8pKnWBS
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdwNY2458098
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	evLAp26msHZa21KMXu+YtqFBUAj1Nw5xOqezOiL4fU0=; b=fasM1xdz0MyUUFOZ
	xH6XddfJHYYVTiZEoEDgJWzfuI8aOY/Wk303Futj5BVx2N/rqRmSfsVHa/ugEirn
	4se8DNJTIK3GqrYnLNfCgUDcuZXTEN4SKSYyrNhv/LVQvrUg1+q5fdZagUmMutTC
	A7MyD8StpX4ZttfOL9IC+bXpzVqPZhPpPXxOzIyk7kX+CgyjhMILOxE9hNyc4NIq
	C+ccOi68UibZOU5Kb3bkdXkBwyu4UxuZ52DA5YEQNl2uJeuSocYIM/kzx1W3N+r1
	EVl1NcVLgk8Z/GkknyWSzZwCfrldQCXcIWwUIY7eoP7u0dLun8aqkyjbDrvoAjO+
	taksPg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbta3v2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:52:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934a8cd3a8bso57681485a.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793101968; x=1793706768; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=evLAp26msHZa21KMXu+YtqFBUAj1Nw5xOqezOiL4fU0=;
        b=B8pKnWBS9b5Z91QC8E10urXyTHj0I3dCpVM8a0mhX+cHPF9cvrGYyBqJ2VCmGh5iZC
         TEvrnEZqhNVsEWJl2wPJYLYTgPt+Py9ZA06sETLF1G9tDyaQT27eOEHL7gVOJy2u1oPD
         8xgpGfMM+qISLIEw4wYXUHUL9jF5YMwkRNg+ZPyZBC7SiI7K+q/IjCnorwrc60UENthS
         9UpzfsuVW66BWmcrvAMWplqm8DS1A+vszMVxtIE2mS07oIKbxCLmbQa99R/Du0rVUHKI
         dLz1v5oJkW1CP7Xfpz6CaxdQNh1/0O/XvWMv9ne7zIOr3rOxXjom2Y5InkPHvp2uGPNa
         yjPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101968; x=1793706768;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=evLAp26msHZa21KMXu+YtqFBUAj1Nw5xOqezOiL4fU0=;
        b=i6aW8Y5Nveo+krR8Bk4iW1hSR3hbOhfk14A3T1B1f6ZXKUDHKX++hTdN1tYONQP7sw
         2VB5rBSOI/0E2PoupdpeewwYcBxqFjQj2dzjnSTXOZPibQ5RPBERhlcOd1mr307QlT9F
         NlNaapB49IINyhC/l/knxOHkD5T3oaSU/uCtW9bkyqbdvFwJWEkJz/Mt+oyE4P2KJsxi
         X867r6bIIzzs2Rc8IVYeZoZ2L/EmVJWlQwthMIH509muqH4ax7IIqvns8RE+IPNW0+/E
         ccP/EX5Jthu2HQD5HN/H3izGC0OxuZWaYi9X3LV4pBiy9GjT8w7mjD6w/Rrb2KUTO5qU
         sVmQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkDHKhSlFAu/jC3e/IzCQnQXSLwKK0QHPZwgXepVVN81uO9bot48hrI44+EPX7Z+UyU+DTlYTnn3ToWSU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkBQFMCiahcawKVxZ4DP09gl1M2ouFyz0dZ5VipPAKF6qxtFqv
	QRbnYlWw+96rIeyMe3wFr5cqnaGG8C842+1+AXZwF7b0+b91MgRF3vNYTRzlQb4bEnQu7iF9f/Z
	76iwT6Nav22iHER6LvTXbS9KP+5ujxAO5LhxYQOZeTMizYTv9p+jdD7iuZqmsByflPlU=
X-Gm-Gg: AYBFou0YtuQDIiPa1L9dvu00O4sg0L+KKR/s7Jv5HHu2HU0xVByx7ir+EtlXbS8E1/M
	HnORnwoqZsUnQsGans44Imw0VBNR+p/TFAdMcKN94rFC4PrVIRDOK2A2h3d1XL5WtqJVFYaPWaP
	ctGqVskNrELSUAEmiAd+35uliiG+g55Azu+gyANhpUERYI50QAI0SVh09ZNxJb9rJlw792Ftc+B
	puDbbg/3ExYjDwEjaBengOA0rXmA35IO1+z9VweGQFdSnwzaYKfFr3nkYOhGcNgLvlGA5ML/6sO
	oE3PCwyyc89iI9Ws/NyPAaUeguipg2ZgamE+31Vd6OMSKB0eO1Og6pEnYxf5TJM1QlHCPoyLo8D
	VDaxRCHPEKqGDzLHnweMCVA==
X-Received: by 2002:a05:620a:a181:20b0:936:2f59:dfe4 with SMTP id af79cd13be357-940ef67bc89mr1481929485a.0.1793101967569;
        Tue, 27 Oct 2026 04:52:47 -0700 (PDT)
X-Received: by 2002:a05:620a:a181:20b0:936:2f59:dfe4 with SMTP id af79cd13be357-940ef67bc89mr1481925985a.0.1793101966983;
        Tue, 27 Oct 2026 04:52:46 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445991af3sm5027246a12.33.2026.10.27.04.52.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 04:52:45 -0700 (PDT)
Message-ID: <1682bdbe-acc9-483b-ace8-51569cdbb3f8@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:52:42 +0100
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
Subject: Re: [PATCH] irqchip/qcom-pdc: Restore the configuration when resuming
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Thomas Gleixner
 <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261026-b4-irqchip-qcom-pdc-restore-resume-v1-1-ed6cc37816b0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261026-b4-irqchip-qcom-pdc-restore-resume-v1-1-ed6cc37816b0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX57HadpvrKWab
 4nq/lf4WaJvjNz37m1U3ccAx1YntDoVF73PbihjjbhLs+KEQSpXNodNZV8Bex1bSELVzZWiaCL5
 WSNZW8bUR3aL+o2ZAWHi5UDGLuhXEbE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX6rvnnkiDKl6C
 31m5QBsVw1kaM/wjMTvt132GVtoCUsBVQiBo1915YElZu/pcnO1Fa6DF2yKHV9EFMWTZcYWCFP8
 2zQSCV/D9wbV/o4wRCe4QtfShDQ1ufuQm8HRL6s0sKErX230+NzGQWgOeQOMDEGtF91d1Xr4b7y
 4uFnxH4X0NuqFy+ah8KI+XKLNLlYMPdoyRPMclprtGVShgGxVPpI6oIJGN0k6XlfrwNhuEFkNnm
 nrTZgZCyXGWtYOqJhIbzTG3e11H3VXaleIvoAJ2LowTxTOofR+QQ9+GcH+yQRu55mzEWJ6IMPsj
 rDrapXj2OlbmgUY8etDKYZ+Dy1YL77PQzrnkBRpPec6dCs1E4Tf3tD8x7Alsw7aFm81pikf6lBR
 y9PtT9aLL13liMG/bKxRT8Roe1zoSyHk7/p8RiEYE+D44xdUPQu9pKTkjO+Bb0PegyB9NTc0kXX
 uWa2173fcp2+ZFHPJHQ==
X-Proofpoint-ORIG-GUID: jofo0dG7dLs4H4CqnsYfcmV5dB9c130t
X-Proofpoint-GUID: jofo0dG7dLs4H4CqnsYfcmV5dB9c130t
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae09090 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=5MpwvvwstkcgiFTKn_sA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270047

On 10/26/26 5:37 PM, Abel Vesa wrote:
> A hibernation image is restored after a power cycle, and after the
> kernel that loaded the image has set the PDC up for its own
> interrupts. The restored kernel then runs with the PDC configured for
> another set of interrupts: a GPIO interrupt it uses may be disabled or
> have another type. On a Qualcomm Glymur CRD the EC interrupt, which the
> PDC detects for the TLMM, then fires forever:
> 
>   qcom-hamoa-ec 3-0076: Unknown EC event: 0
>   qcom_ec_irq: 20501 callbacks suppressed
> 
> Restoring the TLMM configuration does not help, as the trigger type
> and the enable for such a pin live in the PDC.

[...]

> +static u32 pdc_last_bank(void)
> +{
> +	u32 last = 0;
> +	int n;

You can declare the iterator as part of the loop, since you don't
you use it outside the scope anyway (also in other funcs)

Otherwise I think this looks ok

Konrad
