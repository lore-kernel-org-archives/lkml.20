Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781900;
	b=pP/d/8CKxkYz9qA5O55bmfyXNH5X0la93aMmEvrb6YKV4gEbOCHWNitYFPhgccdMprno
	 KUhSJmFeSAfmvcV7a4PP1NBu9RvZSv22yXRPsO+Q51GxJbs++qqJnnVfvUXzWNY2WuvHL
	 ++esUtaXRRZJM3ljaM0aGgeIDJOhPnGkCJ7Ok3OQgqxH0JDoxyR7kyScbQrRHPVkAVZV7
	 IRL0will49NhMxc92oNLa70i4lQ6aKpGfT54s2t4K1pLbpyIJqVNfidAjNaxFx7vO8KMI
	 MyLDbyQIVlEg7HLa5nnsRnO7uXfZNGV2ok1AMYcLPCdbF/q480/BGCYFw1Xcy7BcaiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781900;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=n+TEDrUElWg9uttZzwotv6ehhRQDadzLBsmWXWQ4tek=;
	b=vKfpHKCcZWbDpEGWaWYCerknAyxHR37KfbD6ZVcqWAPywfriOsTmea+ZLaZpQH0sokNJ
	 anPkulwzES2WFfKDvv3Q3DBFx9GzaVDgChgxvtUD1Sv05b3wi003NDe2EG3RCfz+hFVog
	 XytxOy4G1b2DadSmt91z80WrxL5jMcJcStIiAYEx+OUdT9Hli7ygwB5xJn5m1Xmf6gy82
	 0/WRKQXspMWVQpCmBssIm2jsEJA8HYm6q1Xt5vWgZbYdETvus2ugQTz1NOMdSOvZtx+yM
	 D0kayNg0kyUdbRKH1UXnxpgAlLp/rhpr5cvcXzrey9HNiNStjmcuL+iRL90ZludPyMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L8tpp8El;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=An8CfSCW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FE6606A32F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93FE6606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L8tpp8El;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=An8CfSCW
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48KWYV3875516
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 08:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n+TEDrUElWg9uttZzwotv6ehhRQDadzLBsmWXWQ4tek=; b=L8tpp8ElNIR+2SCL
	7ABPfhPua3esRfL1aCbBvR9OMxlgtGpIn0i/qMU2pEcNo5Eqx3J0rn2c+0kkfR+I
	U7/8vrjIpKlksjXwfdREkhZVExiSm+DC1oId2M7zdyVNVkECDPnxUmevJscvZvGl
	InIg2N7mSUFHqnfg0xSNZQqINbtu7s5o79YgzZ8+hKj8dbnah7ACvSe04DRsmRiM
	Xwdm5i74GRLViDKzpPTEx32acz5ROpfe3JHkOsB3MsyKe0irSgrfQc347pSSDkhj
	wAnTUQBTyaevg2kGbnx8oyv1WV8X6mwi0e3m+SKJCpji9MroqND5HXNR5fjCX7r5
	MwXiew==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqwb093d7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:44:58 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d091514509so1258058137.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793781898; x=1794386698; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n+TEDrUElWg9uttZzwotv6ehhRQDadzLBsmWXWQ4tek=;
        b=An8CfSCWQwW0diZJlUulskvDtINwQDb2uX3sBnyH4H+oUBkqWKth48+Tokq9/nGKv9
         aX5zX9LRrG68zdr6uPkjvh4W9NScqizMgLHETeYmOU9SS8glbvDeZPVZPlVtLgMw6o9Y
         jfoURFC5Frz8t2D/AZONsYOudkN622j/5ll7ItvEjhL7wuEzXuuzXLAu93izx4PaRxM1
         4GOmO3Czlm00iEJDYwNTVDpWf9QhXGOZ5F/OFeR6U7HCuaTh+frAJOv4UYJk0Czq6jkf
         le8kTXegA/o9/hcNVjEgxnDUkrMiQL9Ah9c9R9z76oXLV+GfXr3tc8vFLjyXHvfdFpQW
         V9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781898; x=1794386698;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n+TEDrUElWg9uttZzwotv6ehhRQDadzLBsmWXWQ4tek=;
        b=JAM1bSVif17ESC7v4Bwx8L5Kol52UIK2nFrMt6uHbHv/5ekDW5s4FmGExGh00/gbuS
         +MiaZIwxMeJNBL73JWY3PBlYHUVAkJS/WuAJBnUJsI45sL7d0SF42x7MNw53TowiwRGj
         mgJ5DUa1X7/GvFJkjwwY9h9nCectUIAjw/SpdAYo2FL9IybuCShsPeRcX88/lJf1kW3d
         yJ2zjXRFeDFljwXhL8hnlLJgZQPCfxw0Dv6io/XmhHaBj3+SaLiLrl4TOBrti7ZNADmj
         NbFQE6ovRnhZhqchBz4mzJc6+nWaUHTl1+Z4m9zCAPPc50p8AX/z01+tdJFX3zqzFGTS
         tSeA==
X-Forwarded-Encrypted: i=1; AKwUvByE0Ojr0b9UuVsnyd3WCx3po/WzjzbmAV+XWGG4RgdEM8QQRAoi9gI6JuNRP+IEpPTvJseKzUOqojiuBlI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+J1xHkNfFaLucZxnEfvHKSAXiO25XVPueqpck4kYOSq32KY6n3
	bCL01ueEap++utxqnwDqeAt4VsR6CsAiM/WYnxx04K2CnEzWc66omiD573bd9LRFgM5dxkR3ZM2
	e/Gi3g2ZtQJtecxPMoKyKe6/Gb1zw7aj0EE5g8kuSUb13EcWCneJfzZxjumgJxwx+Q60=
X-Gm-Gg: AYBFou34qud1tGykbUQKDjPu7BZ6chRcRHBLLMdwuRfcI5mmU2muTIe9+4YCIe41VLt
	kK+4OUNYWv5aUIoZIQzTx4usUzaYlisAQkCgwfmpznpHULArutezpuVMgDUgXDCuW8LZb8ro66r
	gkoz7ntMxXMpzIdRTdfc0Ylyu7QtYeJ3I3cps2zJmYGDav7aoodb66L3VciZcXngJ1641JtysMq
	p9VV9tIa6t9/okG7WThOJt/dqTngDspG3LKWduGtHkswbhqli6HtYVnJzYWUmbYAQWumP+o1M2E
	Wp3bUnkrRFvGY5laqt11M4kDrZTIhhXcnaLcYZsgy2w+JX4VltghyRSHqEJYJ5aKl2K7w0hTBCr
	QP2E3VNY9xBQspJQAKjIwQ7wvGq5Ll/XDgRbcHemqILwHlcNRpbZF80YWlvdwE2FTgzs4BNiPhA
	==
X-Received: by 2002:a05:6102:3f9f:b0:7cc:14d:52e4 with SMTP id ada2fe7eead31-7d054182fa2mr5047770137.8.1793781897701;
        Wed, 04 Nov 2026 00:44:57 -0800 (PST)
X-Received: by 2002:a05:6102:3f9f:b0:7cc:14d:52e4 with SMTP id ada2fe7eead31-7d054182fa2mr5047765137.8.1793781897282;
        Wed, 04 Nov 2026 00:44:57 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed45d7f7sm2658699f8f.38.2026.11.04.00.44.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:44:56 -0800 (PST)
Message-ID: <6964d550-2ddd-463a-a142-9e8f72588803@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 09:44:54 +0100
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
Subject: Re: [PATCH RESEND v7 1/2] dt-bindings: input: Add Qualcomm SPMI PMIC
 haptics
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov
 <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
References: <20261103-qcom-spmi-haptics-v7-0-418de67ef84a@oss.qualcomm.com>
 <20261103-qcom-spmi-haptics-v7-1-418de67ef84a@oss.qualcomm.com>
 <20261104-myrtle-kelpie-of-chemistry-de43cf@quoll>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104-myrtle-kelpie-of-chemistry-de43cf@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNCBTYWx0ZWRfXzMehNupWbcER
 DgW5+EZ9xxIHYOR2tgMkQPgd0G9ZhVqE/qlAq9iGx00M4sYBQu4+JUAurdZAIkVUY7bUZYhQshz
 SBSdJFZ2YENd15WmNSjIZWrnd+6tJ2o=
X-Authority-Analysis: v=2.4 cv=OfINnRTY c=1 sm=1 tr=0 ts=6aeaf08a cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=kU8dVnbwxP-e-aHbJ4YA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: EbxcM5EA1cyqaVb_LP82KaQr73P3p-Rp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNCBTYWx0ZWRfX02QprppR4RJW
 WVnvQl4Aw5luSKeuKHoSnCmKXbDQpXNZA4EylGwE8lETFP5fH35ALlKjHxUkZvIdm1gRQ85pyXl
 48MIYl3MnQ5pjAc5Nq57sKUz7HsAUnJyPimqLkrPS0TXT+STGewxdaK/stKJ4aG2a5VY41yckzs
 dwB4ySSEqamrw2CRS2hR24CsoKG47XmJx+fD4gTBpu8P2xZIBontlX/JUNZPUj047EN75X+C+r4
 /91nSdI+jG1OWb/I7sC9zvLds1VYhUADd07xW1l4IYUPjSizguvfn3tjm/XAUNAYtOyxE/TkDvt
 YNhecdezmyQwDV3HLEqM9JyB2fqi5KPYbvpFSZKXgi9aFgBuyN/FFxb2lr5Yr38hAuKrFilIBvl
 EXxvYSRqX4BfcCNyWnNrNWOlxHZVXKQKdVkYqwPK7g6OLhrT/AsTv0Q+tCHkPQqaTnWAT2kcafR
 haMSDpzydzt7WEGYmrQ==
X-Proofpoint-ORIG-GUID: EbxcM5EA1cyqaVb_LP82KaQr73P3p-Rp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040034

On 04/11/2026 09:29, Krzysztof Kozlowski wrote:
> On Tue, Nov 03, 2026 at 08:51:17PM -0800, Fenglin Wu wrote:
>> Add binding document for the haptics module inside Qualcomm PMIC
>> PMIH0108.
>>
> 
> Why are you ending this? On what sort of ancient, downstream fork are

s/ending/sending/

> you working?
> 
> 
> NAK
Best regards,
Krzysztof
