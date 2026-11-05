Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866088;
	b=PEnqItHiIy0eQfRGmDzPyaMTv3psgrXAi9jzpT+hMMmeYudLxOu2CIMIrv7zweaqHa64
	 C7kxNKOONFNAwWIEBbS6JKmCKzlfjG89HM1QZiorGV1nix5iWdS7HAKnZQWf62QvfHSmS
	 ExmxJVpIhd29rT7I3C31Bngvs9QaH/8peMaWJOCnLLJH1lzxbI4QHs0KlndQHcgfKDCvO
	 ac2O7U83fG4nwvu7Gj8S4yiq4lfxcZAzqeUGR92TSA9yGANGgpSPa7nAaCvHrEez9Y0uI
	 AJdtWgfsurGP+2HPs6t1tnby5TcnefFdOKL1vzaNozt+w35mRVJ9L4335spCaASHkJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866088;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=COqOviJVmIsmBngooW4OGwGHlGp+DN/R8J+T/Xc4pXA=;
	b=3+0I/zKqff0Dj//zTNAr09g9T2epeQ5ZU3yKTStYg2Bl2TnrIID0SAh0ssw+skVW5zfh
	 zsrJkayApcjeD9hVUGjJZeM7RKnmR8lRZjSi/x/ym8h1Jby0hGDM2dsvm9I9pHYy9kNnn
	 QTTTNElNc1WpjReYq6p3TFb14F/KQ6hKOlIDC8oQkiiy+el4KmG1QxEc3bVDz5qJmB9ny
	 2LzqpNm1Wq0kOb76pG7e7tTCltDIDa4Xuwfvbh1F0oxejEgIlhLFCU/VACE5tvKkgjvhv
	 8z+2OLNHa3u58j3Lrt9PL29dOmZ2siID6x8u4yymk6T7aWpVcKgBs9YW8cn74451s2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="O0uzeIW/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a8hgm+mi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC96606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFC96606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O0uzeIW/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a8hgm+mi
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UFGG3074135
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 08:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	COqOviJVmIsmBngooW4OGwGHlGp+DN/R8J+T/Xc4pXA=; b=O0uzeIW/H/Hxv8pl
	hk3/YzfC8zsjqijXerhctPmjKCMNw+D2c67SMri2K9ANgekiJ054ZfM+ag9JW1zY
	r5Ny2pB1QUqKquZqkSpGotwg4XMwmOLNr5rT7MNXwPGBZLlilLr8EUp2jh+pKI3J
	8fpojhcixy3+LmAvf/zhMFoWghdx3go7oUnHTrZYFhrBDoZEsOrG1F7hIfYdRTdd
	SWp4GVrfUxHhCYH0oEtpMk5pnTBiOSafW591fdWnIeJLSg2DiHrUJm4UUSP2g+Jw
	kQKNQkdw1lVTbdd3yF1Elc0IU+2H8kq9H/U7y1mE//rZ85GY+FwtHWV6OPepHNNw
	g4pEFw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrksq8jn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:08:06 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9909853d264so95415241.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793866086; x=1794470886; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=COqOviJVmIsmBngooW4OGwGHlGp+DN/R8J+T/Xc4pXA=;
        b=a8hgm+mi9u9vdcrUinc15eD3LWeD9Qott1RVvZuzrXjel5JBtUq1drjApVdRFyJxIv
         AFW3CpBzPbWIzGoI1CfEWu+jun8Q9QGP5wQ94IsdUlqwcau4F318S/A/jO66gQsdLH8k
         IBkW0RcdXLippN4VaR5W0FBsbF1APA/AQIqDud1qljiI1TuiNHTBguhai2Roto2WTQuR
         ld8cTYOy1NcNQ9kWb9ZkyBPi+zp4hi78Cilv1Fz7wrrldqHnoT7fFY4vXUsqQENIMUSy
         mhSXCx/WKUSEZsp2jT3fcEqY8OAFG1+23d/1Wf9KGhQ2hcKGDgdBDEz1+4kXQwtRAErs
         rt+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793866086; x=1794470886;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=COqOviJVmIsmBngooW4OGwGHlGp+DN/R8J+T/Xc4pXA=;
        b=C068D5ebta2/LQ38ryNEkp7iFjJOOHn3aQOnjIY5mSC2XMmZ+S7T3r0baVMpaKQZlI
         8skMJbhGvQYL3Kkj/PCZYLCbRS7zgXrFpRIEEY9ltM+lUI8r4E4jrcA5Omj35a/vEiWw
         d9i5xqTw0UaSyKFkLMIg0E33AsHTzFooGkhOpze/xoPp7jf/psC3Fhp1FhcoDGI+6llC
         zAoz6y2yA6uQcEWoLUFsr2Q94mRXhoyMOWQhStkA3LyxLCv+ne2ISUGHY478xLvbaGlq
         x75IWamDgGpsKMK8t0wrqsOERNH2IXI+RhnsDX2PSZGX2cHtLi/j3VNCPIbJyX4W6eqU
         gieQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6JIkNBclGi5/A/PYGFLl4T6urZqkaLKXbHQUr2f7EgYNRCAKyEuSy8X1WCNbWw6AJMDEvbxLZFPxAfBQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Q/dJ+EN8LqBgSmcnjMHYhF2yjcPEee+ekej3lh+ubaP5nNtfQ
	MAhSyQ+RPrHt/DVEs3ftKolWWJpuZak2qnxtYLnzX9Y3OwSVVed2WsUy3YEL4pOBCl2j9lTg3ge
	gitg+YxRwtGn+5MCfx/Ta60mWkJ4J2elcLDxIGDbyaMAWWC8rJ1xFYiGnrSRW791F7uk=
X-Gm-Gg: AYBFou12rzAAmiYMIPRzmBZKbkp70llQYPWUljioAK/Fgfz3HDz3ZIuJHjVvcaWLMe1
	7xZb+5m61WvAF95rR+G/fQIs3kzUc9AiBI7lusIS0oGcr2BL12VvaxpgPHkb+47JyVcEEG+rFSk
	7P79RUyITuBoDf43d+OPbWXVJYXimcGfMm2MAoZ9TFhCGt3Yvt6aj/dhfW9wp+gP9GZuwFvLKr3
	j/qbHslbV8wV8ve/7QJd0ffeArMpEds4LxBNUoKSnbGI3E0KwcmY0ftksjxgN1dMM9FzTPeUDLX
	4YFUK/0UDOxDPTGZjiGpdHJ4/PAo3JrHSHqmfgjjNN4eyNlvpF7+6yz9Wtpm0n1a/5MMYKzIw+w
	KXteKnIJBNOF0H7xSfPuudVLfg0Rm5Vg/CZNDNNcR/R0+FUPJkxK+53IoioWzscgeVU/D
X-Received: by 2002:a05:6122:1aaf:b0:5ea:c3bc:c584 with SMTP id 71dfb90a1353d-5ec68514ea7mr8490427e0c.1.1793866085975;
        Thu, 05 Nov 2026 00:08:05 -0800 (PST)
X-Received: by 2002:a05:6122:1aaf:b0:5ea:c3bc:c584 with SMTP id 71dfb90a1353d-5ec68514ea7mr8490391e0c.1.1793866085487;
        Thu, 05 Nov 2026 00:08:05 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e140f93sm145620766b.6.2026.11.05.00.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 00:08:04 -0800 (PST)
Message-ID: <22d8f5c7-8226-4e8d-b67d-f6b4b1cbb487@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 09:08:01 +0100
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
Subject: Re: [PATCH 2/2] arm64: dts: qcom: eliza: Correct number of TLMM pins
 in gpio-ranges
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Gustave Monce
 <gustave.monce@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Sashiko <sashiko-bot@kernel.org>
References: <20261104191700.676773-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261104191700.676773-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104191700.676773-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfXy7AQBCWq00KC
 ts8VZDIryupKSu2ODLOygdw6e3mweQ24c53J1P1DdPtQc0ZeIVL4uuFKY4U4YTMoLlMQZWq8Xwg
 ORG9EnMknmXDdTSfbf9W/TaEoWDCseOCExP3bX6ULXNJBhCpASbO/Sk5ux8PNctB5Ul2+8bkUcG
 X5WnxRrhmpf7n+1yIpzIiQdaAZ/O84XsXqrEdybvUTScI7u9wYykteRhhqp7/or9Nt5InXLuMCL
 m5tWIAnMWiWaipOg9wyt2kG+76P80rV3sAFxmqbJhiruo5vtPuSEo3wnH3o/8sKM597DU+rN6DD
 SH18M9kVi8HqllrERSiKPjOEO3F6Njy7iEPeq8sHP/0y+mBa2AQxop5wQqwDBBMhqmGQ2py38LP
 YN2VuFETsJjiqZndRdl+E6pw1fVizAgWoSMEsaQ0OOqc+Nh1nVaH/CSQWJKMD7T9WpZEA3gRoy5
 yewqzCEhciq/CqH0QXg==
X-Proofpoint-ORIG-GUID: a5bheUylTlyMHf5EZ3TFUVDxaa2haokL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfX8W18NrpOxfAC
 OOCi7u4mqnKuNtU9l8WfgAv+nkyTxIMarefLSbsEVGWqZnyPRyCPcRdAUC4MvIoRKROVsmHsdZd
 enLGVj3VsCQ9erkA4Mr2eFpbeI6UyL4=
X-Authority-Analysis: v=2.4 cv=CIe/zhrD c=1 sm=1 tr=0 ts=6aec3966 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EGeSfPnbYMIGY1KhdJMA:9
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: a5bheUylTlyMHf5EZ3TFUVDxaa2haokL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050032

On 11/4/26 8:17 PM, Krzysztof Kozlowski wrote:
> TLMM on Eliza SoC has 185 GPIOs and UFS_RESET line, thus the last number
> in gpio-ranges, representing the number of pins in pinctrl, should be
> 186 so the last pins can be configured in pinctrl.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-0e88535a-02d3-4a42-9f3c-ca4f9bdd3b11
> Fixes: af20af39fc09 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
