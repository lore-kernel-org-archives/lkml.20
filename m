Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794222473;
	b=HzPiwO5d9wVUtbyx991JQosgYXOi26EXH4CG6SgyrVBa48lU5M1qFJ8vAMX9oKndTZe7
	 OuNwBjCJ7dODS7Bz0Rqend4XG0deYMxAIb9a1f2UOWe/vwHK5bYLDCnUMz2spUHl5+pH1
	 YNoxyYLhPZKkQLDqjhkTdmc7pYVcD77KdF5sCM2RCbKY4WfSAGWvRBdbMxydZxvtFpQWE
	 WPAoToPEdcWcAS+qVJuXzYnKFIj0aNbZCZhZjdTqUkiA3510LSHNvwYKwL7sWdAoSlfbc
	 xaZfJH7FvE5GLvqnA3I0+XxtK5MUaEyEbwRuqTMeIaXTj3UnGtnxGFqDwGGQ5YlGrFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222473;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=w1TZas2nUn4Iyhi9A5CEWWZlSF+cg7JudGhxYTHfccQ=;
	b=kB36hb4i9fs+mSSWCIozRUKA1JAe+fc1KdbacllEmqzkFMK1/FUtojw1EHfI1/kARKcl
	 rkwksVC55hTPUh5V/ejDUjMTtBLqbg/KI1y6St/0m71WKDAKdIECG6k4G+yOXIfsBaEML
	 nkvllLgEWx3Kiq4WVvdJlbb2hV9ZnqYpFEyQ5/Jgwiv618DPFGX2GDlWCikyfJZiBBpwL
	 ZDLAxGkMwut45eGnFsIb7yQng/QjvjRPssXZvEcVbUwY1RM1LfuuO9yqzcbyBgvtbREzY
	 fIBcbG8o9buc7n08ja+LUTQupn/QhnOUi6em4CioXgM0jcISQttlWl64bj1bdErX25A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=imtvoHwe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EDBoLGJb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D774A606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:07:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D774A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=imtvoHwe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EDBoLGJb
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99v6vI562007
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 11:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w1TZas2nUn4Iyhi9A5CEWWZl
	SF+cg7JudGhxYTHfccQ=; b=imtvoHwe1TePJNqu7ofU5s7Z+PeuiQMjH7T+T6Eg
	7KuU4BNkH+mMEByIzdcoBf+b07G7+oodUIg8HscksUnb88yKzQ5KSvd5UPp0PEhI
	X5+Z2DrTnF+gy6xx/STu/TTTiUYbNNtV2pcxfuxObjRqpdbVZXgkHZgMTRbYk1PE
	JD337eqeHe5vl2u5ULAo5bpP0zGtvDZanQf5BFrRRypA/k3xaU/vBwqXLzV1je4w
	cpGfF2ujU2opvksfN8+bP+6RAsTHO5HdDQ7ri8XQXCrekzGWRyN3WHkFWBrlx7z8
	ZayvXzg89jFRfBrzafleEQcpSnq3MZ2Ohvm/0sf7BlnfDQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsujxe3ah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:07:51 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99082f450bfso653031241.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794222471; x=1794827271; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w1TZas2nUn4Iyhi9A5CEWWZlSF+cg7JudGhxYTHfccQ=;
        b=EDBoLGJbXKlwqaS8YkqHtf8UCv0iuglQip6x3YrR7AvwU8STF+IaysKCH1ULJGvA/O
         0/pTPE4VQ0hx4xl57SawpeeurSttsw3Eao72r5quJnVLAFc8l2Zap8VYY8LQl/F9FEM1
         u86D8qPJcWb1S2XY09r+NquH65wAaF9Z/psJ2MMs9qZadm6BatGkKKhc+pYBb9EWdyF3
         Rhk3r5MrH8NQzhhIGVA2vbnWvsLI/SNySc1JzFEjFFragvtWrvr5Nk/SW0IOO/8RGPJm
         WPfw8OwD2S0FX71FphluFcK6eObm0iOLjmxfShu6DZc+6qVQsyDA3rTIy/oTv+7UzATW
         IAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794222471; x=1794827271;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w1TZas2nUn4Iyhi9A5CEWWZlSF+cg7JudGhxYTHfccQ=;
        b=2noscy7mlItbt8gbtIZxTnz59TSpoIe8hwKdu77TCKD+qEjt5fR9qhjEMNd14L7WKW
         0r7xw7hFmSY+CRPsDdYqcU32fwx4S/L/88EA2D1n5n7nrTmHfEF4U+qbJL4dZoZRd3+B
         DL3gzIUiHIrkoQofldBtJOp9W5hr8dbSXfLEaLqHdx4ph2MyoVUQVG8dMY/+b/1f/Jie
         Ze5Sm3TUssTxgm9h2+vHJgVaDPXzUkpIysOg7OifvMsiJdJOy4VQh9UDhVAz92D0agS6
         WM7o0FV2IOYBMhlDWWsuS+6/sM23A4VECgt/36lP8RR4VMvovPcTuPpglS9yRBZ6/40A
         wXRQ==
X-Forwarded-Encrypted: i=1; AL+hErGeIjgIedpR0j7rLeZgfBYm0yqXUHOR9ia/sRHbMTH4ppursOLl24mQ0DKGLuDVB3CIpsW8k11tT+4fgD4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/o0+OIAlbolz7zLPnf94QXIRMPHF1KTV1aUZePhPskISKI3ic
	P4gR2KSccNYk/8v1a4LZq4MmuEXmAg3TZxBkdHgpYrBNXBR6Se2eWUgAl9Tavnud9Z+oRHdwrRz
	cyLy9ZJzrPds+gGJGiLjxgmqxN2pPS/o2ZhpZFpvKl49lMx+dzWqPP8Fgbxp5hADAWCc=
X-Gm-Gg: AYBFou2jckEqLc6bnbwkbGme4NdPBgkOw4OYccHRGdKenQknonhqzrM7fUNqZPuF+ZZ
	smmCQ3Gp7UfBCpvQ1ZFAPxxIfRD/ecRGxXQ2Mn2x9sGHPqhWyjOxRRVIefzjaIx+9M8zpNLNXsz
	KIlF2G1kTnReTwKYQjJlP494hGXjExgkKqcKCKDkFJN6r2IcjAJd+WWVSWCwSReux0NlSnFKN2R
	+/c+8ypEoy41iTNa26ImJmUv/LnPmpaWXdbWm3ttgfqbFR4RXGX8Q1F3+GScJvqTNnowrZRwT/d
	FUvbow0ypnI3pm5/mFZBdEXWZxYFLOW2IrM4OkFqWfrR+KnVKvIjYv+F9BjU/74CUP6Sc1TBaMR
	bDgMV+VO2xtk4RIinLx4XZaZsBZ3i08ycjtq3TXAG05OeK4I4ommBO5pYU31r37s=
X-Received: by 2002:a05:6102:6044:b0:7c1:9f20:36ad with SMTP id ada2fe7eead31-7d2dabedb56mr1076590137.2.1794222470966;
        Mon, 09 Nov 2026 03:07:50 -0800 (PST)
X-Received: by 2002:a05:6102:6044:b0:7c1:9f20:36ad with SMTP id ada2fe7eead31-7d2dabedb56mr1076584137.2.1794222470405;
        Mon, 09 Nov 2026 03:07:50 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-496150c6e90sm7740628f8f.2.2026.11.09.03.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:07:48 -0800 (PST)
Date: Mon, 9 Nov 2026 13:07:47 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7:
 Describe the Embedded Controller
Message-ID: <adkqpnhp3gcxjdot4yratxmnvi3mmkyovbusff5ypl46cqlw42@cd6on7mzjmwk>
References: <20261107-t14s-gen7-ec-v1-0-f4a8edaac447@oss.qualcomm.com>
 <20261107-t14s-gen7-ec-v1-3-f4a8edaac447@oss.qualcomm.com>
 <7dae5091-6d51-4bf9-9a94-bb2d98e2ad28@oss.qualcomm.com>
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
In-Reply-To: <7dae5091-6d51-4bf9-9a94-bb2d98e2ad28@oss.qualcomm.com>
X-Proofpoint-GUID: l_OTyowxIxCVyDLFPBmsv_H600P8c75e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0NCBTYWx0ZWRfX6WCS3e59Dc9t
 yfNxKgDdOBui8bUMJqoKiX8misUIKeCASOx5uyJkkQFn2e0U04Wxg72KyYSqLpWJY8mjPddf3yz
 LbgTV6bKOmrbnBSDNxu2A6ip9PNL5bimPfgMaewSNyNDw7GglezyIlcNf1erEZCnWdrf70jMnIG
 SYj1Sk7bu9jjFGlNSDnGR+fheFYiMy/3DuM73xxaT0FnugFafQKTVQIULsmNwhrwG09I9oDQAlu
 vOS0V3ifGhvheu/nsp8g3WikwwsLRpCNNZwHp8VkLgnL7vGVIIFpjOGgeTa7myq+1HbPMmLHQ7l
 c5JUo8pUZqYrDP+1UZLzO5TC2JY1oQ7U8/yIw+jm4bhFLvbT3scu51NyyMhmHOEhV49UNV6A4Do
 BCGHMJq4YpnQgzXp4ptxuneqCaGOFQDgvz2JQpBV9nnx6vzyBGJrDoEhRymB8LNNSzw/qQwbQs/
 ec16Smdf5mcv/c/C9wQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0NCBTYWx0ZWRfXzyqs2UDVjrSJ
 1+Nt3GymUhvuQgUQrriKS+TnVzetWms+uIWgpYL6HEunfRgnXYLIPrwpqbBBb4WuMCpUECQ4pk8
 gv6ILIFYFi2ZozDhWpyGeuBoCBR5QyA=
X-Authority-Analysis: v=2.4 cv=TeIDJhQh c=1 sm=1 tr=0 ts=6af1a987 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=FPO0yo-LnFrNtlzATzEA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: l_OTyowxIxCVyDLFPBmsv_H600P8c75e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090044

On 26-11-09 11:19:46, Konrad Dybcio wrote:
> On 11/6/26 11:01 PM, Abel Vesa wrote:
> > The ThinkPad T14s Gen 7 has its embedded controller at 0x28 on QUP
> > i2c9 (ACPI \_SB.IC10). It uses a different command protocol than the
> > Gen 6 one, so describe it with the Gen 7 compatible. Its interrupt is
> > GPIO 66, as on the Gen 6, but the firmware describes it as edge
> > triggered, active low. Using a level trigger makes the handler fire
> > continuously while the EC holds the line low, with no event pending.
> > 
> > This provides the EC hotkeys, LEDs and keyboard backlight.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> >  &lpass_vamacro {
> >  	pinctrl-0 = <&dmic01_default>;
> >  	pinctrl-names = "default";
> > @@ -987,6 +1005,12 @@ &tlmm {
> >  			       <44 4>,  /* TPM */
> >  			       <139 1>; /* TZ trigger */
> >  
> > +	ec_int_n_default: ec-int-n-state {
> > +		pins = "gpio66";
> > +		function = "gpio";
> > +		bias-disable;
> > +	};
> 
> nit: please keep these sorted by pin #

Yep, will fix in v2.

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks,
Abel
