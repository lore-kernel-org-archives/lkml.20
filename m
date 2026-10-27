Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793106788;
	b=pCc++XBo7hMnVTKPtn8kVHfL+jfT2Gxf0QCIAnpzDb+nXjesfSm89GZ6SLOt8SDOtm+J
	 HbwTfAqZs2RalHSP9yZsDRV45ZxdFxgy3QeCE3yJFeH4VdmG+eSKfKLzxHJsN8uSel/ng
	 qeRAyPXFOUATKJlu2fpfn4b8r5mZ1JwhssGudD2nuoETVBiu79xDNpiKEW7Ss75r5pwZO
	 DMgOmUooMapQuWMgrKFGqATQw525aR8+nH4ttPbVZunRAbGjN1B7x2kqNys39+AdlPB/I
	 HOQayzC4iWYKpLiI/rC0tE/1+7O5caL4FUjBjQgzF4z2sQ1RklJaDCpn4aH6q18Bj0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793106788;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7WvmV6i+t04NVkQBEVgPIfAREv8DxyMHYZ9gaoAPyvQ=;
	b=hJvgy3JB9UD1eSLrYYI0KP4tnGdLO9OwEloEU3CrPdTytjssNQSqQdvBLxFZhnQUQE6Z
	 j03GWhrlU3mqtBlAjJpqS8iVLVC1ng/C/36z2C6rLJpl0rEb3y7+HwbtzNP8XsHzV4fFT
	 rVr7LlZzzcCpOxXvCeYlm4/E97xEk/RWzWt7tM9DbD2WGdS9KhotUn98kDezEt7fwyhmT
	 hcxoKSQ3L8tkx0WBxc8H9tUm9ftyEi2/YcOe/8q2Eq0G3Q9/wHGU30nW4LrFL5CA72T7Z
	 r+Q16LOO3nLcCTUpMxsAUWtRB3sejv16DOGEWKeoNhtdxOrgf/zju/w2nr6RY1xvOIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g0SkaBPo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LjJfy47U;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FE1606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:13:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6FE1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g0SkaBPo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LjJfy47U
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe7602524885
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:13:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7WvmV6i+t04NVkQBEVgPIfAREv8DxyMHYZ9gaoAPyvQ=; b=g0SkaBPoD2DSomoW
	C/Pw36ZqeeBH3PkKVjeb01huIbylnMejQecjdd/n465bfDGvQoTOWnhfvBXi68rS
	7ttyexsHI5SS0rtOdZ/IYu1OJHAzOqYV/sVcdE6mVfkIQcxn0L94yuMv5b+M+OKM
	3KXhN5rJ4uF6ty69PN5AtnB8CoCCwQX1nTqG7xrStx8virnkdZcIxybKj40k/ZOl
	TuIcPXFX3Cq6FBwhLcRvCxX6p4orTbFEa+4zEJ498NuGt7DF8Gm6V+olhU3vGBGw
	wweFAol6BJ+DtDGa7tf0eEhmAXe5XyiLZRE0SyeQdn1HHVyEeyxoKiUDp6XkgISo
	m4k/Jw==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqw217m3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:13:06 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-45e83fd0663so4656014fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793106786; x=1793711586; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7WvmV6i+t04NVkQBEVgPIfAREv8DxyMHYZ9gaoAPyvQ=;
        b=LjJfy47UB/6Xk8eCpfZEwBLMiZ3QuxxE6qJvFivEUIFPJy1i1fB189Kt1u7nPNdw/3
         ePz+OaNJq642NfGlVgIn0dCqcUhI2yRSdpDbOnjO8h/ZN5VJqms5c+Am0/xGtAxtepbT
         w9KrDrDVfs2JHxULqm4Z4tEImTBCuc8UOmWsP198a6E9Jy4aOwCDAj5e5zwRShsb4vlD
         9DOwlaH/U1rop62YSEb15XV5WSoRXHhMU5lKRKGUcRM8X+U+lrng2HQDDPja5oejDM9e
         XoQmnzelypEyrgaMGw8yqssvNVJchqH3yWxjYTcMtlZ/yBpwYWIT42p6OzZS1C6Z08o4
         uh3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793106786; x=1793711586;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7WvmV6i+t04NVkQBEVgPIfAREv8DxyMHYZ9gaoAPyvQ=;
        b=CeeARQtfDRIUa/azu1eJNfuVVpjCz7dWWtokbRsvUuMuotRe2Taw5Lg3fgufEkt4J4
         mPflsHROhP/OQPcYTkvYAjyORUyToEM9lxTuFSL+7FVzabZqnOyEQ/JqAypFuvFWJmtA
         k9LFlC9dllKkRwegQfUFWaT9wCFSZV05RWJyJKSiQdfQGUGPMsroVkAnYHp/b0BNy59D
         Dbl4EfSIaj5X0MKKzN08LNSLkTDsKCFuzwEeiqgInq8wdmG0CPXJskbRSo6IVzP0AnUq
         tzrqNqL2Ogwun9UXYHEmjlae/HyeEt4BrYZ0ldYfG2uSpR91NypBT8lTf3Kd9q91vP7i
         L0dg==
X-Forwarded-Encrypted: i=1; AKwUvBwEDGVw+0sJVpDWkJAjHX5eoXiHKR6dMekFANqgFpDCGvrabDMdAsku9BZ1C8XigNlbDr5rcsnV2jzjrcw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOF42cw6ZHV4mSKJvsp9b4N6Rd/HfWNDlceojPdSwLt9oOYZDW
	1hXa8452j96TLcjHo2LWN6nGKu4eYjtw28XtUWMiSZjGB2yiTTY10nW+x9tWVtg9/hGTsbW8vef
	a1rz2eBKcWyrSqqoZrf0xTvPDNB3rY+RYZcnb6+fIY4c3r0nAykiN03P3VAh8C6LGnt8=
X-Gm-Gg: AYBFou0BxsIzyJbBN8K2OdiPHmxwS5iMPirxU3b3qp65udW0o4S6Ha+q/uRaRkNE2ri
	CIu5a934ixsDtZUO7F20laEh9Fyo2qHfla+ArfWuizP3NUz6bZTpvSmD4s6j9nc8X6dL7hcLd4y
	x+JwfZTrdltt+sdGc/ktdIbZIR9bDrIuEx5YlDftybDInOPZjWBQtk0UQz4nL0OnCQ/gLf68aeB
	XO7UlTF4wlPNqpUP13lQBhL2NWDAKXTOKuzicfqAmu4BnHhKzwKcC+/RRa9cu8c/Ds2My08ABID
	QBWI8Yln+JjmdSkXZXYT8vJxH+VX9S0iVjO/8+KZT/1TGWY3/mBy1IMtppZhpGsXTW36uQt2s4J
	z8JSw9lRrwZGz465d/4aZJWkjC1xwB3AyccnHSOCdgPu+xmWDGt3ldqvOSGEdvTw1YTh0rpck27
	wSm82+
X-Received: by 2002:a05:6871:2114:b0:4a7:c737:5a11 with SMTP id 586e51a60fabf-4a83f40c1e9mr5690929fac.20.1793106786005;
        Tue, 27 Oct 2026 06:13:06 -0700 (PDT)
X-Received: by 2002:a05:6871:2114:b0:4a7:c737:5a11 with SMTP id 586e51a60fabf-4a83f40c1e9mr5690892fac.20.1793106785324;
        Tue, 27 Oct 2026 06:13:05 -0700 (PDT)
Received: from [10.219.57.214] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b74c0a7fsm11511fac.2.2026.10.27.06.12.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 06:13:01 -0700 (PDT)
Message-ID: <1276435d-7102-42f7-ad92-84c61aed6d2c@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 18:42:06 +0530
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
Subject: Re: [PATCH v2 1/4] dt-bindings: misc: qcom,fastrpc: add iommu-ranges
 support for context bank
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261007-extended-mapping-v2-0-5dca3aa2c2d3@oss.qualcomm.com>
 <20261007-extended-mapping-v2-1-5dca3aa2c2d3@oss.qualcomm.com>
 <20261009-space-crane-of-prosperity-bba4d7@quoll>
Content-Language: en-US
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
In-Reply-To: <20261009-space-crane-of-prosperity-bba4d7@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MiBTYWx0ZWRfXxnheFOpUH8Xt
 FneZ/y/hq3r65OdeF/M1PDYF0+9KYEgxHD5fKav0U4zhyobh9ngZPKJM6a+8S/vuxwkib+/43ho
 XgzM2b6Rp83yRjiVU/hv+NyS5KyU+8TWQFZW36hqtt/L2+MIYYaW5q+zMQTsxpNIqFGo2+b384v
 bFD9+lJdSv/mQQ9g2M7yVEg0OD7LGqbamlkwXdDhMfLOrZwJpfHsuEVB07xqlgbWDkm0FXKRH96
 TmgyyTRB+64Zhws+NvN+fSiZ7yci8KCOx0yU/jGIhLuN+TYrwhkJiLNCXdtNflE8zzy8juHVhTq
 OxFetQFlSjGrIf6tUc+JpK59jLYhEJutMuvlk8Xn8De4xa8nyy8nfhNLZmmDscqYyOJQlGWYLBa
 MulldIcZEjKXZbVM3dnNYxq97Kczq0rxq+l7nra6kRaiv2iPxRF5QxghmOvRu1p5g8xUSAzvPn1
 QbUN3WyELNgeutauuZg==
X-Proofpoint-GUID: vEknHyh3fWdDq_n5HuznOOwDw5s3Mtzr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MiBTYWx0ZWRfX++xyXQ2bKluh
 11zRcZZRWSFIFSYd1N0q7RyJo6YFIw1Fj/NrHIr2bt/r5BsxCzNvqIL4dFYapsAvbwN+tvmgKt2
 YoGT4QfUmw7WyiMcSYACmnm/Qerx4pQ=
X-Authority-Analysis: v=2.4 cv=PsYG/AM3 c=1 sm=1 tr=0 ts=6ae0a362 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eYkptJB4znfycLMIrrkA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-ORIG-GUID: vEknHyh3fWdDq_n5HuznOOwDw5s3Mtzr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270052



On 10/9/2026 3:26 PM, Krzysztof Kozlowski wrote:
> On Wed, Oct 07, 2026 at 05:07:48PM +0530, Vinayak Katoch wrote:
>> The driver uses the presence of iommu-ranges on a context bank node to
>> identify it as dedicated for extended IOVA mapping. iommu-ranges lists
>> the IOVA ranges the IOMMU allocator may use for that device; any range
>> not listed is left unused.
>>
>> Add iommu-ranges to the compute-cb subnode properties so the DT
>> validator accepts it on context bank nodes.
> 
> Example looks incomplete now. Please add a new example showing complete
> picture of this device with all new properties.
> 

Sure, will update.

>>
>> Relax #address-cells to enum: [1, 2] and #size-cells to enum: [0, 2] to
>> allow platforms that require 64-bit values in iommu-ranges to pass
>> binding validation.
> 
> Which platforms are these?
> 

Kaanapali onwards, I'll update it in the commit message.

>>
>> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
> 
> Looks like this needs some dependencies.

Yes, it depends on v5 [1]. That series still has open comments, so I'll
wait until it is aligned and list it as a dependency in the next version.

[1]
https://lore.kernel.org/all/20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com/

> 
> Best regards,
> Krzysztof

