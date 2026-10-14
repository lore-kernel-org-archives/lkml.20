Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDAC545DB2
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791988422; cv=none; b=OTiFP+XFz9B2n5AdQlDz2JUKqpd7UMDS331rRlC/CHk6xj+KZjYXeJI3pKl7YArG3DYDdXdqWgbZ13dyP9orYVMepj+UyqsF6DhPxnMMpfMT+ypJK/Pts8WARfVAR1PqusEnyKkKN5KgukF8gB2Si0FZNPzZ1OqjfTT8Mk/Wz8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791988422; c=relaxed/simple;
	bh=+5PLPrr9n0KYI6GRH3NRijC+PobyDKxOrwuWi3GiuDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oyZ4CNY1wjSn3UATZbQyvtui/htA4QJ1KWydzIEVZVLKEh2r+CWjKyhFK8WJSWGUDdxOJt/S+wTgSfbA8YBhfBwScP/PiG9YdJxXx5JcZegZVLiD1egzE2Z8d7sKRvk7MwNLSQSGilCxl6Rx+ebBks1VHOS/+DWZEhaIVcule5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KX2c23bz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hX7H/eYg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KX2c23bz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hX7H/eYg"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EA9Cmv806619
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pARb0cSbsxH1j0eV8lXPIFNVaNSi9k1K4sozd3r/QpE=; b=KX2c23bzOARDMXps
	aDYzFVaiUvLyi7xGKrBCvoWp24tfaCh5uRO75xF3e2JMSyF7SSWoQRUq5AAk4nMI
	nRrvwDu/SuH8fVWXBr+GLhhkgIb+y6Y2mbHEPhmr0/POKZ6Jz/gCQDDHmcUBRFfq
	q29dctfIpAb7ZxJYDid82GOg+Wx/DgV8jBG9k0oHFYVzHwTbRK2g3WqRjwVd9W9b
	nHZqWxc5KuyvPxwfLU0OODmPfSvu05tcbiAQ4j67okej+WwkJQNczPMR3dZk62nb
	Sq7IkqQJ8xMkbYKp1pHATkCZgiM4cG/YeIkCx3HA9V/QzMPX327ZWFjzfW9fytv8
	JtwqFg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9ud6bxdt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:33:38 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c2b7a15cedso149770137.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791988417; x=1792593217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pARb0cSbsxH1j0eV8lXPIFNVaNSi9k1K4sozd3r/QpE=;
        b=hX7H/eYgtBHh9Z0UjEShY6GtOolAhfb2GEhEteMz4N0p+HAQwZ9ZrORY3cqyZmcY2s
         s2DKrFOG5Xf5Hfkg5/d4RjOWtFdPnhEET27qWGOluEzbbkk0v8DhHYQDMoGSyDEAv7Fo
         9krjTKEYewfd2w/3x54Ui5p0rTlVr8s4J2/6yh8ihqkmf0bm3Y1UfavtzVzHzAIwlCnW
         jZFg3SPFn7D2CHwI9xUsOFQcXh9z6kAzowD4HdC3VFCS1kD3C/NKXNLMFT+Inp23hRiv
         gYfB8B4jNTghIU/hiue3APwC6kaH0TRqIFF6lKiV8iwkAGRpgrv5usFKi4X0Ix/biR/W
         b68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791988417; x=1792593217;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pARb0cSbsxH1j0eV8lXPIFNVaNSi9k1K4sozd3r/QpE=;
        b=IrXMMl1fk//VtUo3un3B4Btrs6BfcTHs9oqwOO3O9qfG2DEzYJJr6sMubDBPBx33LR
         sOEfKUiAkuFJIjLIoAXvmUNPZyfi5fzTbFiNPX96RGYQju2/hYJPSVE9Z2N+w4yXWWQy
         SAuGDpjoMdr61hGqXS5KE3fg/FUBYWq+3bB1RSNuIQuYCaA0AQgye8SWDHBCASoJqLAK
         ts7v5HqmIATpzrN2a2XVCkVz4iKKByjqkTUA/kYUkGqXKtDQvgqmFC/D1VLDHoCr13ip
         ZQBX+KDhJnRFxNckclemsRGDJZeSR5XU/U06Hv5LUNRFL6vmSRapzxe9m5PxsfXXayYn
         iopg==
X-Forwarded-Encrypted: i=1; AKwUvBymR6VuA58suRM9A/uDiyvHFt6sz2bMwcImx+/qstcNu+1BttK3Pu1QMrwVM3yA9JdO05LwpaThjS8QmK4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNZTBh1VUFAghyZC7NigY9Fw79lccNx3n3jW18HE7FyxK814tW
	stMsh0iYqzNl7FzVSVx40Bj8LMsnnO3FjGOlHJb3N0utcwA45z2+ca36+urSQSU5yxafH3WzNVl
	UlZlZrx6qNT+9xdYZUL9lVcuKfBt5bvLF4c3djtrK77SLdWK08uSmxRH/AgLYTO05xSU=
X-Gm-Gg: AYBFou2R4eX5UC9/mdcK1FStT/ADKkoK9kbYIUExJfR0yIuQ27Jk8gLCc9vNwqQduFC
	abl/BBdXwm8mII/J0BoE7I865PhZYhrqMsOg2JtcvBamum27aoRlR40XEizk/vMdUP8eMAWDTR1
	JkJTgqOjMTVsaw46oAlQ1CQbB+2k8mUddCbkqMT3AK3dxyyus/xrjpvQljltMB4MXTEJ0xmqkk+
	zwzGP8EfBhXtkOKkGR1qKPNmSrV8vxk5yx9/t4Xv0/mM98XUxSnaMgy3ss0q0PUqqP81ghVnGFT
	5RdHP3dzlBCt+xi6RUA1aGy6OeFud7uyHnTnyBBOem2USLsfQRgUsASUuiLFcF0dYhC72Zs9m6z
	hbSVtG2ZIC6cKqU4/ZaW/Tg==
X-Received: by 2002:a05:6122:3b10:b0:5e9:484a:3499 with SMTP id 71dfb90a1353d-5e9484a38e0mr2697096e0c.2.1791988417551;
        Wed, 14 Oct 2026 07:33:37 -0700 (PDT)
X-Received: by 2002:a05:6122:3b10:b0:5e9:484a:3499 with SMTP id 71dfb90a1353d-5e9484a38e0mr2697064e0c.2.1791988416956;
        Wed, 14 Oct 2026 07:33:36 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c356f981cd3sm327141866b.83.2026.10.14.07.33.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:33:36 -0700 (PDT)
Message-ID: <0d448a75-6fc6-4f38-a871-7a5338ee31ff@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:33:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM RFC 15/16] arm64: dts: qcom: sm8650: Drop
 required-opps
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-15-3041b788e9f7@oss.qualcomm.com>
 <r5dc5p4dozb5lkz4yaiv3epp2nskxmgcjjhf7fgoy34vcsspc6@27wzsgsvgspm>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <r5dc5p4dozb5lkz4yaiv3epp2nskxmgcjjhf7fgoy34vcsspc6@27wzsgsvgspm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cAeA8hGOF-taOa1O7zDi7VqsPCZyBqnn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX0Z/DlB7z8pGn
 Kx+6DXO3N/dXm/XdjA2Msd41s9jBG2rqOm13ZTe63kBzMTgRXHLtMyEZfdyB2PvPdJFR0Oa++of
 sHYjUgp7YQOJcYyfiKfq28+o9hZu8F4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX5K0KcQJPRysC
 teklJomXL51X0mYV/twQbEfONi/rwS6hvWEc3GEiST07EcrM6mTYh2qkM2+3w+TA3ockTVHxX+B
 KAkHVpd4mdMMiImUfRuVIcwPVWTeye+gdaiz/3Qh38e8YUfaZ0DUMyVO3bIsGslUBQm0hGJYb0B
 yTZxS2fesctfrShu4d1NdmmTLwNsjmpa+uc9UE8J3i2DG6abbc7PtyvJshT5EqnBmyivx3yVc+q
 2FedP2nhTyFZbsSsmAfCRpcyt8K85pOR4kiCi6nI66KKPKNdsVFVB5zgmDMbp412xqJxmyfiZrA
 qEK4bBQCbrM3YqOdA7wb9EkCKjxcOqCbLeHijNzlZ8bkkKFescqMBowLIgbz53gsmuUQ4jFZMe+
 WFfUfEUzJ40HrOYkn/0hhj+1qghC/ap2n/jsNZq89RHElLW4XSYAlSPDlfbwsCIfwucZCg6AVnc
 nnZ813az1H2vNkWFv/A==
X-Authority-Analysis: v=2.4 cv=fJ6sTpae c=1 sm=1 tr=0 ts=6acf92c3 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=eDuGKJUQ3iVb9g9TkgsA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: cAeA8hGOF-taOa1O7zDi7VqsPCZyBqnn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140057

On 10/14/26 4:23 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 14, 2026 at 02:19:15PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Now that the clock controllers take care of their power requirements,
>> drop the required-opps that were only there because they previously
>> hadn't.
>>
>> Assisted-by: LLM
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---

[...]

> Can we then drop these OPP tables, which only have a HZ entry?

I suppose so. Unless they should also have interconnect values?
(depends on whether these can be inferred from the bus freq for
all protocols)

> 
>> @@ -5200,7 +5178,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>>  			iommus = <&apps_smmu 0x40 0>;
>>  
>>  			power-domains = <&gcc USB30_PRIM_GDSC>;
>> -			required-opps = <&rpmhpd_opp_nom>;
> 
> How do we ensure that we can access device registers? Is there a clock
> (?) which now casts a vote, letting us access USB regs?

Yes, the device driver turns on the GDSC and enables the clocks
and the clk-dvfs layer ensures all power votes are in place!

Konrad
