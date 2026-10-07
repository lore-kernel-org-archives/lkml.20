Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C104B53ED
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 14:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791383795; cv=none; b=UNdJdnVLYUhMvk09VfzU6rIgLgEY+3cII5RGzbLhz+m6z3/l/BZaiZg1KU2BbcfY/azENnSwNViajOCH9uK3C+8L2uK5/dMtVmL15vItZ85wkUK4bkFNLMgj5HaWt1riG1vaiTJ94/J1GgFkLBb+B73Mm+6tIE/12j35qIkuhbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791383795; c=relaxed/simple;
	bh=m8BwqGpGaN5NyW0o3YS7MAF/UiHjObuWTcpN8dzIZkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RUhBBFDO2t5mrvbYB7G+zl/zzoZzM//Q7u6H8cdIymE9ZGLVVmAY//IIE8YcunT0o7gp0lglGfbtZ1zrrYMucsZpCnxLE23FSnAJoyN7f3oMJE6L8dzfezxc3c7VFjj/X3WklOFJWgXPSPGfLxyqdw1+XI7WT6QcgWAd5ckHr8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V9uBFNoI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LWuo5Xix; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V9uBFNoI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LWuo5Xix"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697DJg9M4057325
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 14:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2eSGGmhPnLXMyz0ttXDRLcWTAD1FLKpx4rLl3gYv1Bw=; b=V9uBFNoIIsGfBCyr
	IFLJ5olOiamecqFnaLTts2GOhTpHEymNOai/gCB0hvfnx5X1eH3dyD3O5XSMDqX4
	rj8xP7SSbIOMMjizZBTLGREznScKUA+oY5DUvUk0Rf05jSw1fDZ6MhRC66BY4uDn
	xmWluEYrhkXsMZwDFtv6PBxoB/aEUbhGkH09CAqUdX4KRN3Q0COgzo7dq6hXvOyy
	snYta1slspHwZownxgV0I8NzS/dma/XU2bMZXNzMhJ8qm71OaRliuC8KG/sea2XO
	QpguKd69sA6YzE2r3dNiLN8QpQOLxNWCsZrA8eRvkT3DueXlEIBAfpGYyfcYiKWW
	rOjhcA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5pv709c1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 14:36:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ca9b53afaso1074821185a.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 07:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791383789; x=1791988589; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2eSGGmhPnLXMyz0ttXDRLcWTAD1FLKpx4rLl3gYv1Bw=;
        b=LWuo5XixVgti4FK6odpqCNzyUUKgnDBDsnNEjbJPXSyoet7fLOvQ76D/PohaIB6Is2
         WtO79rhSOkGV/aah9RaSrRN0o/0pveZByxQE00yYc31wdfcF4Wxtz3mBiQ4WzaI0pPxf
         gXlPqyz+J7QLii/MYmDzgVESKPYyXRJzyHQyO0PZsS9SgGY7SAdtolOC66uj380sgpYx
         0ABqyug7KVxTVAKyNBChcsk+JRxvJGkO5MDpabBHl9AGVDvAHbEpRpe9QQe+wssa9TnI
         DRD441XASxXlDi2s1vtIA1oeww/MZ8LOd6ZRjs550MsDVc/uCYS4P5/PHGN+Uw1s683P
         n7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791383789; x=1791988589;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2eSGGmhPnLXMyz0ttXDRLcWTAD1FLKpx4rLl3gYv1Bw=;
        b=O7I+rga9JinLWDTQPgNtejcUc8JvdtJIO7n+rTA9FD1Mfi/LD0vnn5GhAfSQyJRe7X
         Qz6MJwPZXT0tGaKLaQ53fyt4WHyMGdjpChHVYvWCDb8T6YBEsKmemWE/nzBmSznq2NW+
         kNGnKNVySXpoBNUzjq3XYtaRZXqSUlJUzlH0r67LA8fAvVJV1ttG1qaTo6yUr3tkf+KL
         dWc9S4bvbpU2BAbTC5Ln3i4VDUeBpaZ+s1LsZGAyjvc8eL7Hp9qLsQUrGn2QI718lTWk
         WvY2B/aRZRzb01jJEK6Er9I00rEZZx1P5eEBGc1d8mVeGNFqtg7zSUivfCgxlTH5HZxD
         BQVw==
X-Forwarded-Encrypted: i=1; AKwUvBw6weuCFlJeUso1mapDj8kZm/h2PKF7uAFBwVmw7aJQjWGkQwUTVoUdXJKWRuTZdVANzgoBWXg9P8apgyQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kPycZdr9QIlZbmTezd02E0MOrh6XpzZ8PPncg7tLypdfyX+ZtT
	T5yQUFTBSiy2X4o8E+PgaFH9XoNdyo0zuJX5N40rm94hXb4uTyaZjsVsrUAgyaMalFrh2bbDleL
	ePSTvmcVql6vA5oC5V5wcMdMikS03R33JvJvyvnJMBuTqmKL3bgdeFUiZnweWNu3+3sY=
X-Gm-Gg: AYBFou0ZCsnmrHD+op0MqegjBzIC2F0a6wOi3LDdX0emPxFkjcFKF0Nvp7B6v9wxXLr
	Zztpi4DrOLtWc73QR9xI5w5QpjZlcIp1dfPZqq515Kqfglpj5T36+eUMMgGPzsxDZu0IRB8nJZA
	xHs5bxQtfx0gen78obk0ok3pdv7x+h+SY9V75dEAjhN5KgJGx1ZHtMi6TjXZ92tPLtw1wadV/ta
	7bXXpdvxyQaK3e29jz33NaEJMGG5+XdaIS/G2j5X2Eq/htbP9M+aQFwkU1YnLMOmQP3u0wMqsSv
	me8uMh71Zjd409dZSubK+nfTnd581cJ64t4kHAHf1mHW4cstgQ5MLDADd+AC4cVHs/GL6m8QRvb
	k3yKDnja7jfSj86hpfnQuauEf0WmMR0R3/fE9oqFQy7JN
X-Received: by 2002:a05:620a:454f:b0:93e:9809:270 with SMTP id af79cd13be357-93e9b87478cmr487224185a.72.1791383788482;
        Wed, 07 Oct 2026 07:36:28 -0700 (PDT)
X-Received: by 2002:a05:620a:454f:b0:93e:9809:270 with SMTP id af79cd13be357-93e9b87478cmr487218385a.72.1791383787932;
        Wed, 07 Oct 2026 07:36:27 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71c0b60fsm5679687f8f.8.2026.10.07.07.36.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 07:36:26 -0700 (PDT)
Message-ID: <5439d103-cfcf-4fa0-ae8b-32417e30ae95@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 16:36:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 0/2] Add bus clock for t7-thermal sensor
To: linux-kernel-dev@aliel.fr, Guillaume La Roque <glaroque@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-pm@vger.kernel.org,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260923-fix-t7-thermal-clock-v2-0-bff7a09eb487@aliel.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260923-fix-t7-thermal-clock-v2-0-bff7a09eb487@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA1OCBTYWx0ZWRfX7Lnz8kCLU19+
 cIeeWlL6Gj5uvFrNvp4ix7mkPSc9e4IiGXY5JvKTkP8YjebUhwI9qNXYxLgKQSdKzaW/7UB1BZt
 D6rSsxCTEPWKPx1CNcQ1kmU7cPiwTWM=
X-Authority-Analysis: v=2.4 cv=J4I/fwnS c=1 sm=1 tr=0 ts=6ac658ed cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=z_e_Sa1Ot6aGCMGJufgA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: ESFqdKwHhLy9U8fNAkElqsRmpAEzzvdS
X-Proofpoint-GUID: ESFqdKwHhLy9U8fNAkElqsRmpAEzzvdS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA1OCBTYWx0ZWRfX4TEIx3MbM3DO
 g44urhXid36+jwN6XqSHUTUcqZfhDC4LfPgKpBERywhh9uaxtt5pSSFnEAiI53fhzlWbQChqlfY
 w4ZLCZaLbbNZivfp52Uyn3dISJhjxWMQY7onaHhnwI/4lLXsH7dd/figC5u2ZPgAnVq83sVfEw9
 kyBA3L49H4+N6MEcFk4KeT5eBD4e9vlaSYo97apnhCAm3Vn1oYZjOKpvmwAEJQYyrlam9UEjgOk
 qwZrYJWb5I6laf58PX/8lv50gLe1HYPf0Y3bSwuyc526bqc4W5kpMwrIq7dNcLV9/vmU21GXm+N
 /MmkIykPiKfQMkQ5vGsKM8ITWl9TypksiaMwzVxcJjsyTOJDUlno4ZOQk2apQd4xFKXHSGMc3Xz
 yUVb1Ieyz5okbHXvGP+wn7yENY/7rCxUKytq5lJUzNmEOyfUCIin/fHk56s0/DYeyPESsFani/w
 IE2nCjvYdu0Z4ktyxRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070058

On 9/23/26 16:37, Ronald Claveau via B4 Relay wrote:
> The t7 thermal sensor requires a bus clock, gating register access to
> the sensor, in addition to the functional clock that is already
> described and shared between sensors on other Amlogic SoCs.
> 
> This series first extends the devicetree binding to describe this
> second clock, making it mandatory only for the t7-thermal compatible
> so other SoCs are unaffected, then updates the driver to use the
> clk_bulk API instead of a single struct clk, so it can transparently
> handle however many clocks a given compatible declares.
> 
> `dt_binding_check DT_SCHEMA_FILES=amlogic,thermal.yaml` is ok
> 
>    CHKDT   ./Documentation/devicetree/bindings
> warning: python package 'yamllint' not installed, skipping
>    STYLE   ./Documentation/devicetree/bindings
>    DTEX    Documentation/devicetree/bindings/thermal/amlogic,thermal.example.dts
>    DTC [C] Documentation/devicetree/bindings/thermal/amlogic,thermal.example.dtb
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
Applied, thanks
