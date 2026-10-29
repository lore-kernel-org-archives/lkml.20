Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793261310;
	b=zCaUtCrd3Ib7i48suxcCuQkJWKwHMKj54PC+IjgZ7g9xSjrXm+QnRoPa/jL6p4sreC45
	 jTiUHbqxLUZerF/2GmJI5BuGH0f60g/q8W6dWMshI/v5yde3sJN/0p7kR5mhTzpnogqOG
	 ljf8hyJ87AJV6LFByjHn+APThTAzcei2uG9GEehz6/DFtPDl4iGYPfCWDY4Y3zCtqwv6Q
	 +GUR4Ut6VR13fr0Xf8VEgI6vpyifgMx/N5roHQTVzQWQhfCdee3mAPK1xEOvp3n0C+cCJ
	 M+XhwbJPYZppIC/Y4AhKxA72bphP9IAGeTEYBW/o4NF/W9tfNQUS4xUxjYqtjOzOW0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261310;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=E8uYgL7FEPaUkpU4wJE7nFzr434D0ruCIL9ZeeArc4M=;
	b=v4bXg/Q7DWbOnlZI0krmWaRjjAG1uAVJy2DRpZmgKPg136Dz7jQjDES5dCFtVB0HSDuG
	 6m3Za/lqTfXX5Pu29F9P9GZsKpG1Fl3tpiN/Tna5AApne4dh5nYOis8iMCS7hYENcmbGz
	 y8mrY5zkfHGxfc7PLht9oLFKI8WhsUYrejqb0rO8aNgjoEuwv5kC6KCYFpFXsJOG+MSjS
	 aNaAQ1t6z05lLl+wWDzISemvn+UmLes533kH8TRTaZJqbyz69zpwPIidaAG/RGEfvWLQc
	 G6haGhVdmof0Wj7dqduGbuoik7s5h4RdIZa+VydabQjZAd6GG4MxxhOp99oPKCPlS/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aJr7hgrz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ukz2NAeS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DE4606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:08:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03DE4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aJr7hgrz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ukz2NAeS
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5H2oD2974543
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:08:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E8uYgL7FEPaUkpU4wJE7nFzr434D0ruCIL9ZeeArc4M=; b=aJr7hgrzZevpCt3O
	4zEntwDY/rCcJ1gkJlJkRkGyLmUil+SHryTwNpfigXF0SP35v1DKo5ufSWQQFCEI
	KtTIUAZEMfV7IpumJXSBst1sWEW3ANI2GLUs3oRorJlVmTga+VxDvgdlCFgKRA2u
	cbIeo/A3xN7XyP/J0i/8IPGLkWERt266f6OR3WW4m40zjInDJZhWDUNWBwUzq0JA
	tdXfAfvBrHV0FjxoOv1rwx8FL9TUtEJKf0qaLTLUdnolpK7HSDytku6FBluJsr5c
	dNmeKm01P5sOiBa5fwuIoVadH5/4gvrtXzkJu4KulRKXw8KLdrYYz4Ryd9GFW+yf
	K+P13A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknkpaume-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:08:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2bdebfc5so45239985a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793261308; x=1793866108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E8uYgL7FEPaUkpU4wJE7nFzr434D0ruCIL9ZeeArc4M=;
        b=Ukz2NAeSQb5enXXArkZ9knl5A0uHJILkzbLyBDvih9jk2xqoy8ckEF2JN3bnAx18/W
         W2bq3VaEFik2fMKbuUYfWhQgBbKtQekVADI6zWhWEZakA4Q4bvItjtO3K9bvsfD2Quan
         HqbTIeHaONcuWhGF41AVMxk3flEw9Rf9yVfpUyDUWBliZ104K6yQh4UcvfY0Uy7+3Wjy
         VDRyxZSkhR7VXiWayWROsG0j4xwILlzqay0h9wVM2IDByt2bsVHxi60vc7lFptqqGiRd
         Jds1AHhRxLdPdp+8CfUT+DM2nFk2Yg256RBawC8by3cunqozOOZvDnLNz4ZtYH7qQtO5
         HByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793261308; x=1793866108;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E8uYgL7FEPaUkpU4wJE7nFzr434D0ruCIL9ZeeArc4M=;
        b=0yKSqbAMrrzUG+UztDp9Z3n/DzbF0KZ79qJd18mla/zwcqzvv3tc8fgsXhiV5nF0e+
         PiblJFOP60xQHn4tnGzNl0Qj0wIcP0iY/iSZqYcPWQwP3f9x8zV4HC7P1bsYtYm0PSkW
         DMmaL2ZDQzYl8rlejI2Il33CZLT43X5qQsqC8B/EEelhg7Fe+xeZ1p6lPdctYkBSMPjJ
         2vQbYCZveQZSm+ufphnEbTG8fJq8c6s46ZXETSupmcDPymkAo3tCwm8TZ4+I7fBYBlyX
         rXjsDVMZbTkhhbz6HBAYmXZ60/KkgWSA95Gb9dmEDDRi8SjeygDNC76O5O/97U9PQS8z
         eYmQ==
X-Forwarded-Encrypted: i=1; AKwUvBwRSt51nsGHdhpBWSqPTf05MMhLbu9kkoRyIZ5pjz4P9jfIyG0EDL6TCjoMYtno24Iro9VrWu8YVDU21nc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKk23O2xJCK8Q16u88cBp5L3allX9YK3El/2hqA+ycamh80P64P
	l7y8bqYmschh1Y4CqPU2oAhF4cKBkRjs7h3XyN13CdrKqtwafoXi5oRSYQ7cnSG+tAveWbxn09Y
	xOzekROy9/krvqCWgw3DLRTkJLl9EWTFR8Vi0bEOLD86H82qzO5RFkh/QHRG7BqXD/bTi5rsZkX
	o=
X-Gm-Gg: AYBFou1LGzn3YrLptDQ+fbLg+iCQpdDxc+7Qw3Pz1bjNSzf0Ka8zU/4uvS1Q+Mvio7Z
	VXsqy6wBVRr365lhuPNPJ9AoJRTKs6ZiZzZ/Hag3aJxtov0Xx3uxr5gWUs4BV0ZfTSnkpdrvh7i
	yQxhG1nsK5XRzU97GwXAM959k34zlntlvBPn5lK0WWYlRxJF+aR15jD01OEgQhwM9VTAebaO36H
	21M/dbg9wOnTnBYIm/1FMey7tQL8Odx6V0d5asQdeQIQOe/PJa+ZtGECcGF+YddFwcp9LEF0d23
	/CohDtD7REIcX1VHJ03fU24uw/H0Yzi+uXK6+HQ3j67Eda1VjOd3Nvumn9Hpmr6FmfnLtQeGVyN
	L35gd0CYyA+LLugpyDaGOYnB6z76fGfAvQWFUgio3fJEBNg0wjPzzxRZasgV7esTi99xzEM4=
X-Received: by 2002:a05:620a:a2dc:20b0:93f:a34:d9fa with SMTP id af79cd13be357-9440898904fmr679896685a.1.1793261308126;
        Thu, 29 Oct 2026 01:08:28 -0700 (PDT)
X-Received: by 2002:a05:620a:a2dc:20b0:93f:a34:d9fa with SMTP id af79cd13be357-9440898904fmr679894785a.1.1793261307658;
        Thu, 29 Oct 2026 01:08:27 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd798391sm704558666b.71.2026.10.29.01.08.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 01:08:26 -0700 (PDT)
Message-ID: <416a5c60-910f-40ac-b452-3ce68a901238@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 09:08:24 +0100
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
Subject: Re: [PATCH v1] platform: arm64: drop the vacuous THERMAL dependency
 from EC_ASUS_GLYMUR
To: Haiyue Wang <haiyuewa@163.com>, platform-driver-x86@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20261029021330.460192-1-haiyuewa@163.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029021330.460192-1-haiyuewa@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ju9kP84C c=1 sm=1 tr=0 ts=6ae2fefc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=dHcd1t0V7vDCV6_KY7EA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: tKkZo01hzYBNn6y1qo9GMmj0MbuzCbdh
X-Proofpoint-GUID: tKkZo01hzYBNn6y1qo9GMmj0MbuzCbdh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMSBTYWx0ZWRfX+Bzo3DrzDvfw
 I49wrAPmbxwMf2rmoWWZDQvMkEHZCRNaR1O6ODkcf3OLXyecL9uTMUsY4XzOzK++hO1yOV+eJWu
 eivC+b4tTtBSBm9RPmm0Ty/4EvpRjaM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMSBTYWx0ZWRfX7q7Wa67BSGym
 dK0/uqV80IM8pvFraZRp7E/WNJT6JK3EnLnAZlJ7qOD1BugCvSHYG1Gmq+aLe+W8xbbskBpYyhw
 n5ozwn4qvqvwlLmQa6yTCBS1kWOqPRwJpwGgHZuSaHxiTexMqW2bQUiy4Gr/wyHqdhmzver8IXP
 hOjuUmGIpgIbAnpz/w3d6KHj0QUpGF/as1nxpkWUL+BkQOWdCtMRr3RoAyKqX8dqhiQzd15FNUE
 Tl6Xtr66dc6I9796WB3WxM2yzlpOv+v1/4gwxhQyd9pGq20GbJDe1dUNTTVoDjWMH/4/Z9ogjEV
 rcaDtADVJXCL4k6QpceURD+oK8HImR4mH6vEDgggoKRabD5j3K73Ta7H7eZuUjcf2XpMbXnYvxV
 AH+iYHicN1TfEuXnkmkYw061iOn4/HGN7hHzHQLkhJChjmONU19fJZ2/WpmL79s/IefzNYkgK7T
 Ekx2QEPm1sNiSWEa33A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290031

On 10/29/26 3:12 AM, Haiyue Wang wrote:
> 'depends on THERMAL || THERMAL=n' is always true and is semantically a
> no-op, but it couples NEW_LEDS, which is selected here, to THERMAL and
> closes a Kconfig dependency loop. The C tools stay silent because they
> fold the always-true expression to 'y' before running dependency loop
> detection; kconfiglib, used by the Yocto kernel config audit, does not
> fold and rejects the config at parse time.
> 
> The loop is easy to expose with the in-tree tools, using the technique
> from commit b33a654a5bd6 ("drm/tiny: Kconfig: Remove always-y THERMAL
> dep. from TINYDRM_REPAPER"),
> https://git.kernel.org/linus/b33a654a5bd6: temporarily make THERMAL
> tristate so the folding stops, then any config target reports it:
> 
>   $ sed -i 's/bool "Thermal drivers"/tristate "Thermal drivers"/' \
>       drivers/thermal/Kconfig
>   $ make allnoconfig
>   error: recursive dependency detected!
> 	symbol POWER_SUPPLY is selected by HID_ASUS
> 	symbol HID_ASUS depends on LEDS_CLASS
> 	symbol LEDS_CLASS depends on NEW_LEDS
> 	symbol NEW_LEDS is selected by EC_ASUS_GLYMUR
> 	symbol EC_ASUS_GLYMUR depends on THERMAL
> 	symbol THERMAL is selected by AB8500_BM
> 	symbol AB8500_BM depends on POWER_SUPPLY
> 
> Drop the vacuous line to break the loop; the driver still builds both
> with and without THERMAL.
> 
> Fixes: db3a9dddab5f ("platform: arm64: Add a driver for the EC found on ASUS Glymur machines")
> Signed-off-by: Haiyue Wang <haiyuewa@163.com>
> Assisted-by: LLM
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
