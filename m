Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793772723;
	b=eV0eQoDufTEudsjYcGyBQ95wAzmxZ+ygfNTnTXUZBQPNON1RNiIUV8e0YSiVxbOFh9Wp
	 9R3CQY27nVdw1aRfba/PDSoON/NHhnwwcWbgB7UU1Juz21k4J/yQ7XQJqFlwgi5fkMY2d
	 AVEVoB+gmVf+mpYgGdD1UlUyu1eoXHMdR5g35esbJuJsDhDpeNcJv0DNKq1xfz4TMlX7H
	 0qurjY2bd0I3hS3Fldu+NoFELFNOT+s6UIjN1XlplkWcPmCNOtetMcS1Gl8O38w9LO+j4
	 Wb8ai23dPD7P1/HeDHWSB84Igi3VNNicqpZfnZrdW+FYc12ONsajyylPi3RQFq8P/Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793772723;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2rWL/C7LmPFzRIy3jqvsgEDQQv3vMaerdjzG8BHe0QI=;
	b=zr5mqRD3rq2nOypq8JeonjH/Q2qjMjKjpJGLntXgSZyihIQE1B/FD+nxjRWV4R5AdzIj
	 ANOzVcvchNeTbsXiTCGFQVVaFd2zDmBXxWBX4vcGsqg6BJgsH/nnkPxBgtDgcXDgfgbWh
	 aqyCxRO+HQXYQdF4uWyCAqu5ig4+SxqFYwNH6VokLcAqyXvoMJrIZ9c6Rm6eu43z9a6zk
	 pOqOAlJRqg65gPxmFJGVNhJOg0NOI6FTpxBWRuckCPh8dMbqQVw5GK1ElqaAHZmsljpMU
	 xCMkCFTbjQjF+LlULZ3BYCkWIjBkgxrZ7M5+EHuqRA7sp0UGHfU190pfKuJdgjvWXRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n+nXXV3G;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FynrFz27;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2186F606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 06:12:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2186F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n+nXXV3G;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FynrFz27
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RKO11191425
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 06:12:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2rWL/C7LmPFzRIy3jqvsgEDQQv3vMaerdjzG8BHe0QI=; b=n+nXXV3GlQtT/i4y
	quPXl2Pke4TQ97C+eyjpjqQb+wn1NpaccJwz/KJrzBGAyGe2uzBpk/3FO3LMw9hc
	VsrRmJPWPSdw0n6ydqB7weaqMRRtM3dExE9lJQJQZiS22/sxrt+NwWUusHh2J5fR
	n4ASZUnis7YHF9kr64dau3guQrxoKl+MGN7EMq7uLU5jlOq6w5a//q/8qLN6Q+lq
	kMNA7pykdYkA+GHY+daR6s4TPZB1QMc1PgQdZ92E7utIdgXjPQVSmoNLsVDRIo2n
	htFJrSwnw81w5sf40o9NVxsbfSkR8rECrSEk3MK26aF7mgOnRSuKWBigsgwgm7lw
	iYGTrQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqm2pjkd5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:12:01 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-88c768886a6so359971b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 22:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793772721; x=1794377521; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2rWL/C7LmPFzRIy3jqvsgEDQQv3vMaerdjzG8BHe0QI=;
        b=FynrFz27hf3uIj/IuccXI7UCHpfIFAK61NXQZkrKH4aBw8ZICOqTyD8cpjSjEnfJRv
         6ylaPH/fM+vyP0We2HC64oNNek9TRor9zLmKcmnWcTjNAxpSpI7iFw8noE6W41gW3Tp2
         T/TgzMZWH6OJlx5xrl6H0sP63jYqchyBpY6dtRo44/QOztujxPojGTPoll35jMoNSn5k
         yg1nq+7Xs4DSlLUfseTNK+QyDrxrKEbojCxqXg8h/6X9jmJ1tHwTFi08oPvvp9b6MZEV
         pirqweZq7ewYptMM208sHB2g5aOx105shS2+iT4uKy+31fSB8NX4BVBIs2q6jbzjb8Xv
         Qbjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793772721; x=1794377521;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2rWL/C7LmPFzRIy3jqvsgEDQQv3vMaerdjzG8BHe0QI=;
        b=LAX5N55SAAIdAyl92rgvarmfpRpPmK7kqzA6wfxxrl/aV4+N0zU/ZWejqmArmImAtm
         Ny3xxLeDROMDiQHCw7OPNKeVMDTg11eeoRqf9oTJE6k2fBSu6Bl+MFrDBKPs0m76J5bR
         oHmK9U1War/4Tdn6h9cpJEiBD3+KMYYaoM3nOor59pmB0uTXQWQBYbYM6Q9RHInMR4wz
         ssGj4n8YrKHGP4Pj72hdWJ1f9zXkr6TNcStkjlkAdjtKGaWuSPwy2zVF2OZ0+xLnai8E
         4CD2uf6fyzYX1/VxGLVCWsW/80ucyKjz+BSbtyCEMO442h7+2grXO/ECa2aOn40RYojv
         sbzA==
X-Forwarded-Encrypted: i=1; AKwUvByNKdHPqHAUbVCFTjuxAR+4MpluoG/HsqzDlJPsAD59ww+KtMm8SEOHtfjLCvyJ/HNaCH9L7l9YRyL2iWo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8il6vu+SEN0ap7nZh/bIkaD6IIN/YnI3rgqmEY+LKGHoX8t2b2
	qgActmC/hsyPTqtiuP/KXKrEZ3RO7h8mSOvFpSvrE9V8IR+0rXKF3NADNUkazPQFuwH1cX6Alg5
	UykhEFnXVBCK2RKmu2WXpMDIE6DMa1Z0FH09TehY5yDcdPxLL8MP5fRO5iLjY4tg9Slw=
X-Gm-Gg: AYBFou14KrBbyB9aqKVf+2ouEffZHQs0NFUnQpO+pKCxG4MkBDCz0PjhALvybhsvKKg
	6irMMUzDb6zMLFs0oPK7PHCNlkU9QtuadfknMj8kSSzYInLl3goYVesHo64N1UvpKkG/ejhfpgg
	9+eFVrOWVYLjM4U0kGLwGDGIE4YEhP0FlIqhk76WD301STST/jdIgBum3mYLcJRCqh+u0JBMH2W
	v3wgmFYh+64Rnb0GquW3rri6aBWfIY5Sy7MbV7L6I8KUzkp2Q01/Az2LdqEIHFNOxc0mCmcHl3F
	qGLRElM44ViOre5NMXjX7Qm3Li7AKP4+jXKAjwUjFqo2xtwL2b+L893r2fI1J3DiedBhBzEe52+
	Ff/bQv5t8C7k97OIGgIxmkJqEOK/Xi4zBmvC/k9Pp8RsxjqzgNrJMUi5ZZ94wUFq9iDsbMbjdSh
	cj
X-Received: by 2002:a05:6a00:18a7:b0:8a0:70ff:ab2c with SMTP id d2e1a72fcca58-8a9bfaf8f64mr12038989b3a.57.1793772720505;
        Tue, 03 Nov 2026 22:12:00 -0800 (PST)
X-Received: by 2002:a05:6a00:18a7:b0:8a0:70ff:ab2c with SMTP id d2e1a72fcca58-8a9bfaf8f64mr12038972b3a.57.1793772720003;
        Tue, 03 Nov 2026 22:12:00 -0800 (PST)
Received: from [10.217.219.145] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09bc40bbcsm439892b3a.51.2026.11.03.22.11.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 22:11:59 -0800 (PST)
Message-ID: <5df54e91-8898-4fbf-9aa6-e2202a67823e@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 11:41:56 +0530
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
Subject: Re: [PATCH] usb: dwc3: Use the correct PHY mode for USB3 PHY
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20261012093704.2762263-1-prashanth.k@oss.qualcomm.com>
 <aup282PqM5c7ks4J@vbox>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <aup282PqM5c7ks4J@vbox>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyNCBTYWx0ZWRfX0BhqRkad9cat
 6TiZru+APZyVx3arICAvR8eyvJ/4u58lEgOVmZabxpfSexJ5jfggbbv8YD+p93bjgKrLAyVVPsZ
 woPeZU3qzZYlLjdx9BsyI3U8il15cF+4vOcdmGo588QzSbm1aAGeu2YgrbLcR12shX6CkdEPAaL
 5TZWpJjfdTLnEfmnCE4C+NKFFNBtV/Eouft3Kb4dvNKT66MiDvZ6v7apwcqcM3tqag52JgoYbA+
 nDDaol+sPV6E9ZsDKpbl7wQ8K+CKkjT5+4CJ14ibOWX+WAzRL9AfwjnQqTxhFVsrVQTUq8FvQNh
 GBL82tpFyRxzOYtaJ8qKO7Db9hwLrwG9ToUxRXvqVudFt/y8ep9SmFzup0i69N/D8EOKwF2HczH
 d0HvnoBmp+wmsI+IPVKaHr3TUP8BL6Cay584QvywNG50LYPQyU5sA4TjeGAUn8wjrgA9+jPBVTO
 i9HH7kkpyVhaHO8Jmtg==
X-Proofpoint-GUID: Px0xelWTISjvXCWeuf2YrQ4bFtMKqeWd
X-Proofpoint-ORIG-GUID: Px0xelWTISjvXCWeuf2YrQ4bFtMKqeWd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyNCBTYWx0ZWRfXylMOqdMsVBP9
 7DLU1IDSUB8drRmXGlIyUktPpBckA7BwUI1pkguu3aF838+2g1OjGmWAA7rawKuAj8iy5K9epOB
 7ryFPqqCiJ6b3t/ZGhrMNeuGTLeC9DQ=
X-Authority-Analysis: v=2.4 cv=c64+0h9l c=1 sm=1 tr=0 ts=6aeaccb1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tbF0VEVlScR4vGo-Y0UA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040024



On 11/4/2026 5:42 AM, Thinh Nguyen wrote:
> Hi,
> 
> On Mon, Oct 12, 2026, Prashanth K wrote:
>> DWC3 currently configures USB3 PHYs with PHY_MODE_USB_HOST when
>> switching the controller to host mode. Even though usb_add_hcd()
>> sets the flag corrrectly, it gets overwritten in DWC3 layer.
>>
>> Some PHY drivers distinguish between USB2 and SS host modes and
>> expect USB3 PHYs to be configured with PHY_MODE_USB_HOST_SS. Using
>> PHY_MODE_USB_HOST may result in incorrect PHY programming. Fix this
>> by using PHY_MODE_USB_HOST_SS for USB3 PHYs.
>>
>> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
>> ---
>>  drivers/usb/dwc3/core.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>> index fd5c2cd36c59..1bb87a370725 100644
>> --- a/drivers/usb/dwc3/core.c
>> +++ b/drivers/usb/dwc3/core.c
>> @@ -251,7 +251,7 @@ static void __dwc3_set_mode(struct work_struct *work)
>>  			for (i = 0; i < dwc->num_usb2_ports; i++)
>>  				phy_set_mode(dwc->usb2_generic_phy[i], PHY_MODE_USB_HOST);
>>  			for (i = 0; i < dwc->num_usb3_ports; i++)
>> -				phy_set_mode(dwc->usb3_generic_phy[i], PHY_MODE_USB_HOST);
>> +				phy_set_mode(dwc->usb3_generic_phy[i], PHY_MODE_USB_HOST_SS);
>>  
>>  			if (dwc->dis_split_quirk) {
>>  				reg = dwc3_readl(dwc, DWC3_GUCTL3);
>> @@ -1643,7 +1643,7 @@ static int dwc3_core_init_mode(struct dwc3 *dwc)
>>  		for (i = 0; i < dwc->num_usb2_ports; i++)
>>  			phy_set_mode(dwc->usb2_generic_phy[i], PHY_MODE_USB_HOST);
>>  		for (i = 0; i < dwc->num_usb3_ports; i++)
>> -			phy_set_mode(dwc->usb3_generic_phy[i], PHY_MODE_USB_HOST);
>> +			phy_set_mode(dwc->usb3_generic_phy[i], PHY_MODE_USB_HOST_SS);
>>  
>>  		ret = dwc3_host_init(dwc);
>>  		if (ret)
>> -- 
>> 2.34.1
>>
> 
> Can you take a look at Sashiko's review comments? I think the points
> raised there are valid and should be addressed:
> 
> https://lore.kernel.org/linux-usb/sashiko-outbox-167906@kernel.org/

Yes, I was thinking to add a vendor hook for qcom and modify it from
there, so that other phy drivers wont be affected, will come up with a V2.

Thanks,
Prashanth K
