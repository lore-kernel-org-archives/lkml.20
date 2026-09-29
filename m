Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361DC3DA5DA
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790664863; cv=none; b=MDt+nB7ADLUzwNfNRsXt5590yoK4BZQ+6w7hMfS/sWwj/q+TUSI9Yoy6totrbz00NQgxHCIvR5n7MzvZhgdEHkIdGHOvdprgEkSvOfXEELZSR9Yfz2m4kcasomdlS4DkxFy1phZ0lN9fuFdUl/xQ4HBT+/zSgler3rODqKg8qAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790664863; c=relaxed/simple;
	bh=4AILTySd7UOFbCLB2VpbZnitKDnzSXWz3qknFH1+qvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LTlHQohPMzJ3Bo+7XER1mKQA6qDnA6cT2bfhYo69S4GG8hklrhCg+YaZxR4M9TAeDEwmF8aEiU3iKXk/UdHZVZGSVGwmoraE9Qr4NXdU37rPkyp7ReKWIwjVIXtOpog9vzmmNkea1Cr+keiDzXndLpjVkl3TuRqNONfr0FdJ+QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XpnS3THU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OR2OwpGB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XpnS3THU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OR2OwpGB"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47a1o2775432
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:54:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nptFMILb3QxNzc5p1LDXj34HfvgxYdfHtBcXmYZumTI=; b=XpnS3THUvae9pZLm
	5796AtzrKqWYV44rc46ERAsi0BZLg3saJ1J87xBvwPC2ulwMW4BE4eXMc/pFckEj
	/iKzpysOtbznLfGY7+gIh8a3Up6d6VhMKydLh//MTXkEABDzXpWcSgfLggTeWg8Y
	T1OhFu3jUnTZPIUloDnNCuMTpwoYBYwWefFka26WVHOtkpqZ/4lLve1peuIuvjPW
	d92e3HxoHralQT5yCn+1ZaJKO9xe5HIaPilUCDm/SzSZ8kE6IKOo2/O1dDwDsEnG
	UrxIEOyybNxPs2hAVxvtjUcIwYPjhyBlXvGuw2P4zDGpUbg1H8Fswu3HHOSomgfQ
	IDAuyQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvw22ns0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:54:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d959904658so38585815ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790664861; x=1791269661; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nptFMILb3QxNzc5p1LDXj34HfvgxYdfHtBcXmYZumTI=;
        b=OR2OwpGB/HqfLgX44YoSoIxHeqOYK+WpNj1fdS3wbtuREpP+E3P0g9Wo32IQBjMJw1
         qrdby+t1qypJLn7sIgY8G2x+WNA08Mv/jHantuH2ytWG+H9w9kC6mBCxSasHCa6jOi0T
         HBtjyjab+cqv7LVoQIOYiAHIQMxmGzk4S9M061zRYA55cedVyCQeZ0tgfMyPjRf/ry7I
         KBcJ8zvDKgK7YR7VsJvH0axcA86pqMtMIiNg+sxcikYzvXRI4uv0yjbWazNK8WsYQaKj
         xZyoPn6zIJeuqEZQpvnezWxEaYVpl9Iw8YMBbWvQChw8d990kd8Wepor9xutwl8XCql+
         gE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790664861; x=1791269661;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nptFMILb3QxNzc5p1LDXj34HfvgxYdfHtBcXmYZumTI=;
        b=K6boWLv61otyyppJAdwtmP74vrvFZg1f20t0WgW4A/o05gz39n+/a766zsXf3pciUV
         HUmzC1t6o4bJTFKjlasNQw8OrUX4MvQni/bq1SR4/uLbK/tIW0uxjCrRvAy3/M1hLH9q
         NjWtM+w1yQF2oKAZ+3RxVnoZ2hMBAIkgNJTO5mDe920W5vqtd6EGI4N1CLVMRqZ/PvDH
         AFwSVX+HFe9LSl9SaNu7KFnlhLwAQ9IXsz7rM0eemVMaOdVcy8UblP8jGm1PoNDX+WIH
         O3S59EqDSgl2J88LvUpIXEkOzFQN2P5eY+iHTsgEYhpvhg8cfSaIOLERi/uGi4AyuOhU
         t9Yw==
X-Forwarded-Encrypted: i=1; AKwUvByROgKc10VEsf3FAG7VFRpgGQ2vAG0P9SfHqWfW7pNYpgptymXzInqXPu+SY7hQzN55KlTRi1+/weqK1wg=@vger.kernel.org
X-Gm-Message-State: AFuF++mnt0NyKDGRog78ntbsxWITzQgUqVxfbsDAbp3O3MPg2hACAbD1
	Hm9MrxENcXjkpPtUPLG+LGvNaoPnJLO/UibzbIta85IlndPJsVuLlrpkZso0Nw2OO2h4eAkf12e
	/7qqR7Q3IBp7BtIpuel6LainYe3ClfJl+FOUW21YamZrDgKZONkebjKzaC9dsxa0KMzI=
X-Gm-Gg: AYBFou13ldYZaMiyRxcwXD08dR8gEPYIKRw/+y4xypWAfSbiFq4fnf/DBacLXcd9Utu
	WV7hk1O0U7/dYM+wyiO/cOlUqhHjOk5aGOvrnaGYPx/K6rI7JcOt942ru+ID8mrzs4T6VasSEY6
	obRYxPmQnPICRI4A/pUeul0HQaIlajinJu67H856fWvFWliWSZHy72TYrsJowTMVzjt57DN7hYX
	KbHblZY2VogetlPFOQB6pfiyJC7XCinHClJLhMZ5PtSellUEmTive/XE1EulUqF9viQORxIA5+q
	YNQz2uTRK+7vnLSav8goWEh46Pi4x8GsxHjAJppXeB58oxy7XNFONaGHvVZ4JMXypf6oAnOYdUL
	vMJKXPEwH3IUJaDYLpb7acdE2Gwg7hXNnZzBLslDzX8s9QRPcWHkez9iNYmfaRVmAEReTVaVQUE
	t/qcVDCK8b5nF+
X-Received: by 2002:a05:6a20:c784:b0:3dd:85a8:4c58 with SMTP id adf61e73a8af0-3de0e73a73bmr14325985637.31.1790664860889;
        Mon, 28 Sep 2026 23:54:20 -0700 (PDT)
X-Received: by 2002:a05:6a20:c784:b0:3dd:85a8:4c58 with SMTP id adf61e73a8af0-3de0e73a73bmr14325957637.31.1790664860412;
        Mon, 28 Sep 2026 23:54:20 -0700 (PDT)
Received: from [10.79.116.124] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc78773acfasm5579201a12.0.2026.09.28.23.54.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 23:54:19 -0700 (PDT)
Message-ID: <41953b98-571e-482f-aea1-6c3ff78f09d2@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:24:13 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] platform: arm64: qcom-hamoa-ec: Switch fan profile
 based on power supply state
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-3-771abd65ee1a@oss.qualcomm.com>
 <cf04c613-ed91-4929-aaf6-421fe9bb7ab4@oss.qualcomm.com>
 <1612b46d-1291-4593-b24e-464ba2a180ed@oss.qualcomm.com>
 <872897af-6357-460e-9aa0-158eda22aa43@oss.qualcomm.com>
 <579939eb-92b5-45a8-b782-8e79a4366a8e@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <579939eb-92b5-45a8-b782-8e79a4366a8e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=N6i8hG9B c=1 sm=1 tr=0 ts=6abb609d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=G7NnfM6ISWE-AksYWssA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: ST8qUk7eqaBxY1l1BqM8_BoZcbZUvCr4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyNyBTYWx0ZWRfX/hmGBOom5tBP
 Ai61tIZAA98svSG/wUGjLf5ig//xyLdKDON1Gf08cBmSWzDL8+atCfj8Vrr/n+EigH6ADIF1VU7
 KU1nPTH9EJlp/sDQqC0D9RMHU0aew+1Sx/ZGU5Qgr5d346h/WA0tk0ZSY/opeQDf3eyyi8e/PFE
 Up7Rvfx0dnjrtjUkK6WFe1RQ5c+3HEnSBjBnttn976BDR0pz8xQOOknw9N3DXlia4w4FkECbAFX
 HaoUYE74n09k7dlpMUZotc5RDjpcD5nI9BPna+b/kue+7t025T9Nkf+1lC+mimZfmwV+tDBXzk7
 Ws7l5K7IIRCgSVGbBEX1XzfOXezHgfKpMVN7dy9kMHdMzI4N5deOWJtQu3D3QY9B/OG1Q2HsnfA
 uydJGgiYNLrkzMaf4oWWMsSV5iekDX6cdfan5WxYyTyUFZ4c9jYq587eUDWUrFBZXDDWYsm+QAH
 2Vwla0z2QLHcUOVnBvQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyNyBTYWx0ZWRfXwPOaLFdo7zRk
 s3KY6THAOy8v+21YG8gtHszfrH6L5wgQMGOpLToJHbt97+Yj5vGmVVyQj+8Dwb7IkpnOpaWlYMx
 uRT2sBlXifSXoWxLAOaOd/cFEOykuTU=
X-Proofpoint-GUID: ST8qUk7eqaBxY1l1BqM8_BoZcbZUvCr4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290027



On 9/21/2026 5:53 PM, Konrad Dybcio wrote:
> On 8/19/26 7:19 AM, Anvesh Jain P wrote:
>>
>>
>> On 7/30/2026 11:51 AM, Anvesh Jain P wrote:
>>>> Is being on a (powerful) charger a prerequisite for entering this profile?
>>>> Currently plugging in a 5W charger would trigger the switch as well.
>>>>
>>>> Should this instead be exposed as a fan profile for userspace?
>>>>
>>>> Konrad
>>> Fair point — power_supply_is_system_supplied() only checks mains
>>> presence, not charger wattage, so even a 5W charger triggers the "best
>>> performance" profile. And exposing this via platform_profile instead of
>>> an automatic AC/battery switch would let userspace make the call
>>> instead. Will check on the feasibility of making this possible.
>> Even at 5W we're still not battery-constrained, so best performance
>> still makes sense, it's about wall power vs battery, not wattage. And I
>> don't think userspace needs control over this either, it's just an
>> automatic fan curve pick, not a performance setting users would want to
>> tune themselves.
> 
> I believe fan profile control is very much within the expected
> feature scope of a personal computer..
> 
> Konrad

Fan-profile control need not be user-facing, since it is only a
thermal-management policy.
-- 
Best Regards,
Anvesh

