Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956639;
	b=SWF5qTAg7ImUZ91mJM5VtsdZQe8eEv4BGEEEPzZrMEulayoL6ayg+GXwArVyuCDXO6o3
	 mrcCAxK+Mw0/BLQFt/LokZptNJCGdUo9715/2c3nzpGSavBTCskXk6FcqXS8/4zDdMiDx
	 /XsXitik0Z5DVlrgxssXbTmQJ/EdN0cEggKs/tdueCoxBYeJjgFHcIzjV7YsvxW7HGR2k
	 7z7I7xUxB0aM2+OCfC8BsPZa2niohOaG8e/48Qm0TPCxU9C8o6bmlvQPEhYop4UAyOAOT
	 YmqDXeUi1nfpX224RNUQBTzPzmCnJDnM9XBdMvXWogG7K8HtARvVev2UnMP++Y0Xmrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956639;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QV5hhgwDtQTt5SAYfrerd7IkI7JI7kVQtItIdeKT6D4=;
	b=H9uO9wsFDYAYCrF7sFJpXCcVIxJICA4HeEM18Tu73CyrIkdwCi28oMJhUdle5GawI1h/
	 grGJqv3R5xANrAnBCnSeEwUb79M8TWoY62USVssmz3Ouyc2RLon8a/LfITv0Sw6WVCdFw
	 Lc8BciSl744f/5qrwuUjhYu1ST5ztWrLFw4VSiH7AqAm/JRQCkYqsMiHjFoTkqibXcqeS
	 FW6A/aYWlX/JSSn0k4yZz3n3xBMjRvo1wKbSu7zQ07nuBt+yvtwo5hfi1RNB+gT5NnjrC
	 gDg0sqn1hiAINXKDUuq7FJ0HW4F21AUVr/ttxZ2Ba2RgWkyx98yInixNDHH0FG4U6Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=edHJqB3a;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=chRZodAF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94629606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:17:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94629606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=edHJqB3a;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=chRZodAF
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67R7A53243894
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 09:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QV5hhgwDtQTt5SAYfrerd7Ik
	I7JI7kVQtItIdeKT6D4=; b=edHJqB3aL3fPedwRbjfz/LmF1f33hPVcRqgR6F3v
	cMqwNkwgetZYNJAoQA1H/6E5t7YcJZW+c49T7vw5m+khdhzRTCEn5bXJ9yK7BYLb
	oyiP0rMEtHtJGfEmA0Im5mN+N72Beyp+/2mInQoIahf6x/04P6tPS/jXmyv+UkEC
	m+uMECtgiQJ6Xn3cSivZ/c+Sn1JDIPXDAMe8HeQbyPrbxSg4CyIS95pYZhbsu8q4
	3ZgHze5AOq3O/NE2Zk0x53NbbTEDBYDMpPWPqDDZPNjS1G5XYvg02g5cX76MCA2g
	6O6vXAidFv91H9vwe28bHAkgFVO0gi1uhEnuNZ6Wapj2Og==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa21d5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:17:17 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so998638eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793956637; x=1794561437; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QV5hhgwDtQTt5SAYfrerd7IkI7JI7kVQtItIdeKT6D4=;
        b=chRZodAFFY9zXiIlerVNoEEzK4VsdnIIHDuYWD9y2wBS9U0FdimmDwBbZpFtfQLQwE
         z0/KU5mAHptEUDz9MpBa1BQRiVWhRYqeudT5K425SvMAWIH/tYBhZwz+LOkjxjs8Rspg
         nA3O2MrnBznr13jP5ZPbA6WtSNdJA23Nwkqt9FkWmVRnqaJo7+xOrX/W62XarSEegIii
         254KlNd5l6CwkEyqk7YMDW7UxiPOCZgg/4LoUYU+ZBd1/rU3PGqAtsw4JH7MPXpkYO83
         sM7LMjB6wp2OC7Sp370OPM1MYvuMYA05kQPRzQR2cRgxVF1vwJtcfNLWK1ByLMm+l641
         QM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956637; x=1794561437;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QV5hhgwDtQTt5SAYfrerd7IkI7JI7kVQtItIdeKT6D4=;
        b=tDssDXclYpy5LBd1xu3XXUEvt5s0yzunHRmt5AZs+iXqcTdeh3tSDCKi2/D8s+qzUC
         YNcHQQbKENvPGc2vQ5RjChEx4VzIbf9KpiyFhn1dxyFjv0sC8G+riP333DU9SzHpbgRL
         phIiZG7qYcuPdEoLUfSNvV/BleNUmggHRtawzjaoB1WpqyixpatJgZc+/jKaxH55w3Jj
         gfvyqFGb5vrW0oxJahrISeZudIuUCAVteH8zlabXMJDfBe7xj2YbPVeN7xUGIqWhFHLl
         cWn5aa0SByZt7/LeOYzsil6+35ytxi2f0AArNZgtkzcfWT7Xtej2p6phX6MdnnaJVbkJ
         1p8g==
X-Forwarded-Encrypted: i=1; AKwUvBxHxMJLjl2Zq1MBv5Kv09vAxvnu3sQVJeEgIhmn34Iuc72fnj/Jwr0qS+CLJiwL9cqOgS8vxB6kP75P9b0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fGfzzaHYnzAMMr453c4eqlu/t+V6Q+6Vdu2DoIFW92EsH8T8+
	jtN7ImLZ/qUZqAUCQhQoA4+2+07UjiW4p1HlSb34irJfVYM8k1g8OWF7IvrJg/qFfPcnF3hYNNL
	RWgS2oCbftpTGRkz3hNXrnEB6ZdubU1O8PA3RuQ99GUXjym55BRpxWvuGqVR5fnQK7s8=
X-Gm-Gg: AYBFou3W//ivUMuLBrfH0BisJ2yK/L8jTRYLCMB/jcjCkoTcs1bpe3YZdXX3jKVD6CY
	eqNjrrC7nR8AOZmgmG432LtGhfN9GUHyBSjgjkkpq6SQBDU7MswxNvzi6ETODLVctksFLkjZRDZ
	nzjZCcMzIVnSmRdEahqnscOmuOlDbinZTkMQNPdVtSAkbZ9E3b3nrmNf/huXzURTw/Ie0uGhJWD
	eLgdpZFnoBVnb+fSyY4GPGHxUO+uqC2GNgDrjnFyfqYaDehyKGfddJ3gWfFYrdM2Yb1euF0qG23
	U+7JoIYAIMGSvjymPhOWsnWiA1t+7CVJkbW+ouMtElomvodigwRPw6GMT87xeLZ+7nlrMmUJfJg
	FEDXG8qHBtyDEJG34ILvvsyq9s4eeCgwRmVnFJ0YvQwm1bME7EKOaatvCEEZIBsWBKZM95/Ls9/
	zvQGGnS2RPVwauaohQfpLzWFmigiYuQXcHcD/uUR/XHpLQVSmSNf3KubE4GKj9EHudEVEQvJ9RG
	nKEdg==
X-Received: by 2002:a05:701b:2041:10b0:184:19ee:1fdd with SMTP id a92af1059eb24-1b25d28c0f3mr2485582c88.5.1793956636839;
        Fri, 06 Nov 2026 01:17:16 -0800 (PST)
X-Received: by 2002:a05:701b:2041:10b0:184:19ee:1fdd with SMTP id a92af1059eb24-1b25d28c0f3mr2485548c88.5.1793956636231;
        Fri, 06 Nov 2026 01:17:16 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e261962sm6603403c88.0.2026.11.06.01.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:17:15 -0800 (PST)
Date: Fri, 6 Nov 2026 14:47:09 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Ilia Lin <ilia.lin@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: cpufreq: qcom-cpufreq-nvmem: Simplify
 bindings
Message-ID: <au2bFZv+KW626iEs@hu-varada-blr.qualcomm.com>
References: <20261105194606.772346-2-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20261105194606.772346-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=PLeaavqC c=1 sm=1 tr=0 ts=6aed9b1d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cSl9Pj24hSJcTmzJFjQA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNiBTYWx0ZWRfXxvJyISs1CInA
 +NdnC9XaLxWPYjFqtVDUvMWR99lw0nOJAjmhZGJLgh0gS8cKnMhYMBRdXQKtUFHdfGumRiMu/8P
 00f5rt5rwlKafP/0yn7JmqLqQnEqdao=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNiBTYWx0ZWRfXx8meW5T5FGs4
 2Yday15188uRt8RSyjH+Chc7nAhNvcqwZ25JGoKeCUVjnRxWm00zs+jBTQIgkekFavlMioSa6EM
 X2bgv76e4d9qSJKgdUH3IIqLXQtBaFvHiHK9Ifun0BMNvyxw9Q856nbOZIe0X/OIQD4d+YUpZ4f
 wcV0VXZV6WSkLVVQkgDQ4hQKQjKL0yfvtVnSNnugymOD28UfRYPJWhgqduiAQk1xjTnliznZvtm
 JZgIezhu/aMR+ZWMyYvkfiw5cut1rSGbqLikKSvjd3aJ0Zs+UbCm8RHvONg61/gQ7jdYegnvgsl
 OPT0XO34Vbl870KWkOn3v+SaOmlctbaYfegDlyoVM8fpORaODCGLH8btFG93opawOMQsMO3mBZF
 5HZfbn3BAxYDKPlL+6hdwvwWtlN6RejaRpjS+j75i0giodNA/WJAKFRTf1ENm7/0LM2YOJtc9j5
 PJ3A+yjXpW5Osejv6/w==
X-Proofpoint-GUID: MBxBjSF7k3j4c56Exm8_ArULvNZMSFSP
X-Proofpoint-ORIG-GUID: MBxBjSF7k3j4c56Exm8_ArULvNZMSFSP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060036

On Thu, Nov 05, 2026 at 08:46:07PM +0100, Krzysztof Kozlowski wrote:
> This binding selects a few top-level compatible machines, but since
> commit 389de9c5a677 ("dt-bindings: cpufreq: qcom-cpufreq-nvmem: make cpr
> bindings optional") only qcom,qcs404 is present in  "if:then:" clause
> which enforces specific OPP properties.
>
> For all other machines, this is a no-op, because there is no schema here
> enforcing a specific compatible for OPP nodes or any of OPP table
> properties: one can switch to standard OPP table (operating-points-v2)
> and this binding will not complain.
>
> OTOH, this binding has complicated "if:then:" blocks so is not easy to
> maintain and causes false positives when regular OPP table is
> encountered in matched machines.
>
> Drop all machines except QCS404 and move the subschema to top-level.
>
> Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks. With this change don't get the [1] error.

-Varada

1 - https://lore.kernel.org/linux-arm-msm/athPyI5nvYG4vmfl@hu-varada-blr.qualcomm.com/

