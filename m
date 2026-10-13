Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CA45208C9
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791918878; cv=none; b=IpKFxKPNyxd8u6bf1pi/Cu/AAy6E7rq+TesoYTpc0iyZF6E8CNqZuprUtm4E+jNxzTMuXGnwFx5m83984lKPZn0JMYR2W7VoRVWcrWeNkzb2SZ55cfqMDb93lK+SjcBBp8bk1eVWvQ5U6ulQo4X482uqFZzmJNGjByPow06wo4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791918878; c=relaxed/simple;
	bh=pmykTMtBSPU/oVAafGk24KBE3FFlLnr5N+CeMJEF6LY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iw7qvVYj2t3f4Qfq7pxrLo2zoLS/4m3SWOkC3VqcSjVDFFNLPUnr9ZIBlnc7YH6CcIJxvzWWVWdi2SbbTAr4O5qqVmV4XfwN5duOTiDZKOmUvs92GGhiIejGkhLW9TwQeYv8vsGB3K1zpjuiFzj4em9a5iT0/6r/uw2ydluRxAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lKgVetjp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gc7/iRz4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lKgVetjp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gc7/iRz4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE41Gj900183
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gg4svIlGHjMFWdE4ORpMaRtdmCor0a/wrTMsu8GhvKc=; b=lKgVetjplREUnJh4
	7iALWVWIP6om03f8b6FUaHo73isbCxsNAkBSJwvW4sZDHEI3ZVZKTkLXjJvUa5Ed
	MaALsm+uw0nPET3dpFhUGLFsbh6Q3ebjqXZlZN4/lHqUm1GNzlgCbzWHIOZmkyfk
	e+5yn4AwqO4shxcu0IO9DApGlEkiS5ZI0j6BmjOjyE5avrlvVgyUS9AxcZcC4QFv
	x4S/0WHNsxosz8qVZJ249qtjTUu1Ij2GPmivaPEFlGaD4PNDS498pVt8bkNmG2GF
	BD9K7ukVy/Fi5Asc6Fpt0FsZW83kvqpkc1NZwH5ExbaEDDa7xS4l22AleqfiR+ox
	6szy9g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9g7uk5cu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:14:35 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3592749a017so205279eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791918875; x=1792523675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gg4svIlGHjMFWdE4ORpMaRtdmCor0a/wrTMsu8GhvKc=;
        b=Gc7/iRz4LBd/Jqci73ej4xsBkp2fBok7WQv0LZHm8j1R93Cbzjdbg1U7+qKvkqp8F8
         iJ+VfQuhPzRuKwlqheAiBt54JRDB6bzTQtioUVdwOtX+WUPzcpplFtYZzJ93llnhuDWr
         U5L7ubTzHBUFWIM9UY74trs+l+ej8p0s7W502L2bXoMHCxn7tv+XwpDvjn/C4FJ4RJo6
         /gQ9cfnq6z98335B2I2w+AugLfg1g00W1UNnSkjg94bW9dDzZoqaX8UptBnnV/B4vfx3
         JRqSFGgVw+OfJYqflDBdQDFrnGC1xAYeuA/tpLjK4t+MboON7ZDFxFlzfShGlUWv6Xov
         72bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791918875; x=1792523675;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gg4svIlGHjMFWdE4ORpMaRtdmCor0a/wrTMsu8GhvKc=;
        b=0MPEyRw45lG97kV24u1JPkhG6g+DsAC2nqiK1R52z1L0z+cHvIa8PLWOzDI0lJUYkT
         ioWIJBZgZ86dMedmy12YwOwakz2X9Zg5HSVjd4rk9LKlukzNggc0dFOsytMzA08ikmxx
         hmukm5ro+6i5KLpfAJbFXTbV6nPLCC1hiPn2y/V0vUGCcSzIDoSk/k9hWajoTH5FUZnH
         0Fc8Ia5n9n1DYnwxNj37tXKCss0tZVdR1gGRz9kuULRpKWu+3mkXD9wIbKhNPlQcaSR7
         FgOlHG+55orevurNOElL/XTgglGxDQFAtiB8LIUluYKFJaQan4/8AcgOjIwqatNkJK/4
         vchw==
X-Forwarded-Encrypted: i=1; AKwUvBw/ukQkyYbaKAgHjwzsxrldmjhE1MSQSvI38ORCDhELPB6BwKokiYj6LqwYzbcg0hALymayz43qvi+2xaU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkQdt5wayGZX5XqpC9uhRxZ69m7xbMV1/oqe6PVo3ssd1dEqgs
	ITiSC3hovoirHO6LvLYr6x+S/l8qLXWmQBzV9N4eaSOWcns1jVYLJ3HE/DAsACs5KInNjxYDVsU
	2JgAd9swMlsdE7dRX2c1jmiI6DIZmdkGlsyw0it2Po3ZSDsW1dB/dJc18UXuFdXS9h3E=
X-Gm-Gg: AYBFou0/meLlGH5vkZp/R5Xq2E9nN72a0GROUQD5fO49khsnHUHn1w5jaSnRXl6QAkf
	RLHIwurOoWOJB2XALkidTaZoeCqBP8stdGki6Ygboq8/EnoxUiSweLeCkWqchmUFyD4iUjv0wMV
	JnORyHmsks6Om67lVbDJtYbod3yfmdX50XZmz6jUDTR/6q6vxWAsvf7x/gyrgqFnuJ5GAHCwJAy
	+7NunutCNLoMTHx+wyk1FHkzJt43Btbnj10qtmfaMwAAWdrqysgTNpL2LBLAnipnvvjjkAMtP2N
	LOQpJq80CN6Piwvg388TfEFId0/BhzuNtRhEIPWErk1vvuwyaml2I1GM0AwCynSkpBLAvefxRCi
	VPBq0tENb5O/w8dNw13DZrQb5rS5pRh2YuSe6c2aZSsSLBQR468HVnEjts90PkPc=
X-Received: by 2002:a05:7300:a8e:b0:35b:f6e:417c with SMTP id 5a478bee46e88-35b0f6e434amr7495243eec.15.1791918874671;
        Tue, 13 Oct 2026 12:14:34 -0700 (PDT)
X-Received: by 2002:a05:7300:a8e:b0:35b:f6e:417c with SMTP id 5a478bee46e88-35b0f6e434amr7495197eec.15.1791918873849;
        Tue, 13 Oct 2026 12:14:33 -0700 (PDT)
Received: from [10.71.40.138] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b690af3easm16076819eec.1.2026.10.13.12.14.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 12:14:33 -0700 (PDT)
Message-ID: <a05632fe-7511-45d2-afa1-a2215db570c0@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:14:32 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] net: stmmac: dwxgmac2: enable L2 split header
 support
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Hongmei Xu <hongmei.xu@oss.qualcomm.com>,
        Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>,
        Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
References: <20261007183905.2582759-1-sagar.cheluvegowda@oss.qualcomm.com>
 <bea80b7e-3d44-4662-b3b2-e97a7f903aa9@bootlin.com>
Content-Language: en-US
From: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
In-Reply-To: <bea80b7e-3d44-4662-b3b2-e97a7f903aa9@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA3NiBTYWx0ZWRfX6gdwmO9740/Y
 Sd2n/cRdG6XHL5/7RpxGeRJcbdynrf69P2HTZGUx5R6lMP5GWTkkJIGWdIjEf9kErhbR9vNQmXd
 66QGpCiHhzS+wVHQErPoioOLIjxFrjLuGXN+ZYypjjoZaXeocoel1mzaxbwjstuyIJkGJsIj77J
 0AeIzgNV21b/6SP5QNp8RH+6TVOU4oNLm2rrHzNBI1APKU74b9pN5EtfSvqnB3DCUbionLgRhha
 2aX/7UbTqd/S6RscisOTR66GI3uUYh1g9DLf0fOWWC6F9MPtlOXWOGoeFe6k1irZSpGWf+z5ew0
 EzcPfpiokpdk4IMcIO5eAcMewiPN5BtWoQlxIVugI3M3bpjJUyYxf5pRV/YDM876+7CGkG4GeVR
 wHWS3xl2H3mGVETQ9hHMFK7xJM1vnbP5iAN8Cv82Ue2oM2hEPW59YmamwYZTL3ilh9rJmNXIH5t
 YBCtmyI4az6HDP4fnbg==
X-Authority-Analysis: v=2.4 cv=Z495j3RA c=1 sm=1 tr=0 ts=6ace831b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=4tsTETeE3Fl7JHlmqNcA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: bwSXOdiIoqL9ciiUGTTQxiuBdhG4GnAu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA3NiBTYWx0ZWRfXxo4s7rUdg5nO
 W4t1cRpJDxfVKcCkcMhJRKnp/CfFE/lAH6HDsvYYhP0DhviSmLRGXr7Wbz15aewo3W4N26B0x6y
 Aev3Z58cIVjea5E+Pm4e0Lfex7YlKNM=
X-Proofpoint-GUID: bwSXOdiIoqL9ciiUGTTQxiuBdhG4GnAu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130076

Hi Maxime,

Thanks for the review.

>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
>> index f8ab347f7b5b..fb29dd489714 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
>> @@ -167,6 +167,12 @@
>>  #define XGMAC_HW_FEATURE4		0x0000012c
>>  #define XGMAC_HWFEAT_EASP		BIT(4)
>>  #define XGMAC_HWFEAT_PCSEL		GENMASK(1, 0)
>> +#define XGMAC_EXT_CFG0			0x140
> Let's keep it coherent and use 0x00000140

Ack, will fix in v3.

Thanks,
Sagar

