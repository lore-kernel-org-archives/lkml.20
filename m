Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632122;
	b=a9SALqJxf7gYhQZYsi8FUWjdeH7PmewywiNT0v2aecPTpoF7m1cjdlyrBpkBB+cuRgw/
	 w4UyuMCqkjN2nPr5eRA6Y0C9Zj51Jvj3pueD6NYDLpNMx+szGdbN4Bl7CR57dG/nJrTgU
	 l+LAoNskaryv2lbfmtaKRuLJ+wmfAZv4C05ziakww2n0nPpkedkay2YNzEg8/FvVt2x4p
	 xXQ7+QAPScFz1xSx+uEel6Iw0hDZ423Tva6xkQnvwPwoLKT6di0dd/QYnDJnQgCWxmCQc
	 5Mxhrthr3d7IKuWroBTddPf1BG95h691LQM537KSn2BJ/unTVje1QgGruV78vhh+gNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632122;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8oGu3tFtibA4F9MPtu1QvqHowOYqxa/ZoelgOGIY8lo=;
	b=KHutlKVXNb4qmRd320176peozZWG0RSNF1sCO/zMTJMq7UxOTYu98L/ynurYCvtbDe8k
	 VRb6CfqE/SKFel7fO/RYLb+mqvZBI7CwUvvTiAze21dubjEpwHFifwvtXOhAgD8fLI9fj
	 ETMua7rtd4ukHVNmJWiBWWZnwecUeyFmYQtI5PrTUub2eLPKdOEKvNPyJMo6NW5vlapq/
	 JcQKnFwykSPtp4m6ZSDlDhwi60tTC5cHT4NitdShtCbGSmZlq4V10Lz8u7ccfCtWshiod
	 wIMefIf1+6NU9zB7YQEw5Axai5fXzTipiQKWird8ZVm3SyR2hF8lfy/jovuce2yJMbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=edyVx3Rl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X22ALmRm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32730608B7CB
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32730608B7CB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=edyVx3Rl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X22ALmRm
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpLj02991851
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 15:08:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8oGu3tFtibA4F9MPtu1QvqHowOYqxa/ZoelgOGIY8lo=; b=edyVx3Rl/Gix/vp8
	fVxiwC8I5X3BwPxqEiE5qvO+NETSFY+0Ml2dTzswfYhKFjNYhxNmH1C/I8azYcy1
	ffEcu+eW6YjBGz1rC8vRPiXo1BHAcXRiS4I6dmjN52QwzAfpp4gnmGYQhY4f7RoQ
	2NEh6Oo7mzMD7aLUcT1gZr97osp7UsI7quWnE+frI62Z6cmG2Izv3/AMWWe6MgIN
	wnhZoykblMkEnP/rZKodILXFBezTdof0LkQ8JpMc9PGN9N78Cy/qBaNMOCGUaFkR
	5BxulQQmJL9p8OtiEbsirLW48LUyFc/vh02J0GJ98Kup6qkvlJfSvdbz9FMQLw9B
	tcYVag==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsavgx8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:08:39 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eab0ea26afso101823e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793632119; x=1794236919; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8oGu3tFtibA4F9MPtu1QvqHowOYqxa/ZoelgOGIY8lo=;
        b=X22ALmRmrQr/oD55jXdHNh0Az2uG+9BA4LWAkZe5KMi6g4ZK+ZE+KiMHDOAqsVuaIr
         8//EE69oar9gO0Zw4uZol777w7EwPXh+hhlwM+UPN09AvuKNtsEZ9Ddnj9b2Lz9kx6Zt
         JbeQYIB+8wS3I7IRyIl1EesbgdUKOxw5ApcbLFPkO7I0T0fIWVrapV4TIHExiaqD8a8L
         AU9r1UhUlEgK6eJAooHYk0zAOCVqX+aXreLaaTSqPFPnnOfTJZulgzbd4HTe4WmI866e
         PoKszrqRaIe9g9tekEFzlsk9JnXlmS30ou/qpDI54YE/dD59GaQKlcFxUEXOHFKjlCi6
         osbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632119; x=1794236919;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8oGu3tFtibA4F9MPtu1QvqHowOYqxa/ZoelgOGIY8lo=;
        b=tsXvCbZTAKY9suC5JkJLjcJWX0kt7GjzLp3Sq2uhcfSQdXx2kIApdf2wNi22N4RIaq
         7C/BPSjrfN6pKRA5O6LGIDsrnhoG50ZZJqfZkAp+AjC7+d2L77oldlrZhLYpGfoR0GBw
         ffNkl5K6MJNbUMcPhYye8STrYGskOjNQYTJ84i+BUQyBhG3n89lpHuTeqlql3vB6mxm+
         /GfUjHLzoA0Uz9sjZfjoDjZ6ca/PyCDAnPBjovNDm0m5fygsbFM+CeylAH4YMxwA5HOV
         oDTyvbne3SJ4vvCUs1D9E+ViF2Ur3t5hDWBsTIRCcnfFMzdd5R3czHS0wDIECSL+/e8g
         xkcw==
X-Forwarded-Encrypted: i=1; AKwUvBzuXdLK4V7kr5YDqf/C+JzkkuNmBsNlR7DOw/b7vC7YgOgBV0dR7DPAEeKxd2OGf65nY+NqD0YoZe98DJw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/hgA2RGv13UgSK2+3vOATnRShgLAS2CVai195w/zEAYLv4Az8
	KIBiJnQkVvPXCYeRl3b4LeWgX8zsz0+ckmY07bhkHI0w130pDBOyEXZ4v/60T9alWKEuLVo3jfE
	7NLaemw0qx/m9rqGfGceyXue7fCE8LV5FarrrLQ5rlxTs1/ZQ9loc5UjaN9NeedLPFlA=
X-Gm-Gg: AYBFou231mbHBNlEPIhPV+ZVb94JR28NhrnTiw0DzrI4FuNe0jMplLANEKQ5W6WEsUF
	53p1VzPfIYfQnIWSMRpRa9m1D3G1lkN4qPzz/+FWpeTZmdH1TCOm5KKQjiKFwwIw5qX0z2+FDXy
	lrQb9V2qew/Lh42itmW0Ez6rYcHw8ZBp3VqZrHPYvRa0nFFWHfHMr8CMA2otPi7cDYqeH4QzwJD
	lKo9SbaLfTiqn9vo3WNoQothsisNV1q87rh1eJ7UpYVv3rI95fz6oxBihg0qp4OV1dPSfAzY2Pn
	wIm0luWTZoDMHbrUlxH/6p6OAJCAlq9cEtkUzunnj9aiG013raa0aONqQUjMvp9tS+wv/nwaH+L
	dbpo3FJaNw3iVge8BhyYQWU2NGGMv/7wo3bILfnsW8KbEwJzeUsqAujeQUJdO/2Bc/I+Vxw==
X-Received: by 2002:a67:f446:0:b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7d072bde34dmr4127829137.3.1793632119253;
        Mon, 02 Nov 2026 07:08:39 -0800 (PST)
X-Received: by 2002:a67:f446:0:b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7d072bde34dmr4127770137.3.1793632118576;
        Mon, 02 Nov 2026 07:08:38 -0800 (PST)
Received: from [192.168.226.93] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b52f3c2934sm444634a12.33.2026.11.02.07.08.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:08:37 -0800 (PST)
Message-ID: <362884cb-71c1-4d12-b315-9923118c8564@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:08:33 +0100
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
Subject: Re: [PATCH v2 01/12] dt-bindings: clock: qcom: Add bindings for PDM
 GP_MN clock divider
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran
 <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-1-ff8e4bc8d567@oss.qualcomm.com>
 <20261027-inescapable-rough-viper-6cd56d@quoll>
 <fc2c4943-0482-4c72-b713-5a66c9995c5e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fc2c4943-0482-4c72-b713-5a66c9995c5e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MCBTYWx0ZWRfX2QsUQLQn8jcM
 fgMqwI+40y3k7KU9l9uGt5o1VobzVlx+sKU6hjdDmjRKvK+trWqxuOb8c80FLq+uu0DTl6aTIkw
 A2iRXsq3SOD0yup3UoEvJfomnzuaPRXILwRBQRSlHBfCUoynASeYXl2CfUqbSXe1HN3OKHlhSCN
 ZW3OHEvfNM0GN088XVGVQBPftA2YDEMDd23+8pghVSCnBnEPaAx5LjzZG2ImHCiUqh2gkFuaE6y
 w9W7yCC/q3BGYrazcWI4+ownIAZpQBks9/66ykkvYIZsQd48gM7BhtMByHJULRFakaxugoQXOPR
 TArWPGLcwXeF+68FrEb91bKicDA67ICoYDMXts9vySi8lmZ1aPlbuswLC1pVMeJA4uS92hEe8mj
 wOlCYPlroOaj+NJGdhezLFQtPrjIWbrcTqpGrIGQnbbCVPHJZgx/eRDSqT/auKZB1R4wmVHKFod
 xCsIyySJNn414vY1lxQ==
X-Proofpoint-GUID: I2wVARkOuo9wVvoywjJ5dASSwg6oMPn4
X-Authority-Analysis: v=2.4 cv=FZmiV5+6 c=1 sm=1 tr=0 ts=6ae8a777 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=fjKjonZ3CYBpfGIA-1YA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MCBTYWx0ZWRfXw9KLaJbw5Scq
 D8V1fS9T1V99q5nZWxOMHDQWdgukdklHLQgvhn/0ESxFfOoByKofptpf3Vb8zCdh7V4tIs5bCh9
 co65yD3xOe/UwtQoVydX7ZT4ANd14gM=
X-Proofpoint-ORIG-GUID: I2wVARkOuo9wVvoywjJ5dASSwg6oMPn4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020060

On 10/29/26 11:57 AM, Taniya Das wrote:
> 
> 
> On 10/28/2026 12:17 AM, Krzysztof Kozlowski wrote:
>> On Mon, Oct 26, 2026 at 04:59:27PM +0530, Taniya Das wrote:
>>> Add device tree bindings for the Qualcomm Peripheral Web's PDM GP_MN
>>> clock divider. The hardware generates a fractional output frequency
>>> from a fixed input clock (typically TCXO4) using the relation
>>> Fout = Fin * (M / N), with duty cycle controlled by a separate D
>>> register. The clock output is routed over a gpio controlled pin.
>>>
>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> ---

[...]

>>> +  assigned-clocks:
>>> +    maxItems: 1
>>> +    description: Parent clock phandle used to set the input frequency.
>>> +
>>> +  assigned-clock-rates:
>>> +    maxItems: 1
>>> +    description: |
>>> +      Rate for the parent clock in Hz.
>>> +      Supported rates: 19200000, 9600000, 6400000, 4800000.
>>
>> Neither assigned-clocks nor assigned-clock-rates should be needed.
>> Parent clock is outside of scope of this binding.
>>
> 
> Sure I will remove, but the parent clock input is a requirement of the
> Hardware and the output of this module entirely depends on the above
> ranges of frequencies mentioned and that is the reason to keep the rates
> specifically. I will capture it in the description and hope that should
> be fine.

So this is essentially xo, xo/2, xo/3, xo/4. The gcc_pdm_xo4_div_clk_src
you added is defined as a 4-wide divider - do we need to limit that
divider's range, or would div=0b1111=xo/15 also work?

Konrad
