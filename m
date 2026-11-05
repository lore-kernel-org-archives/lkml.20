Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871732;
	b=OYnvaT11veZPsqvMgDl4G3GjUUqyf+sx6xTaZHKrcCjZkWFd+k0ogH7DnfCGInGtHifs
	 gQ5aS7/BNYfynvU0i9xPzlqKGidbfj9S+SaGAAJLue5R02wZ4RR5XXU6DHSga52ZgI7x0
	 ctpxdMriiytaBa6E9TK5836MH/xnqZNbTkJW5Fc3/4qNlDpx2zKdEroR0iaFprxbN8spj
	 BwKAUPP6/0UNwyNdw8o/gAKeUrPJlQmDU4jDgKGRotfcerrBdM21RgEf5jocyLHOETh1+
	 SfpWh3WHBh8ykQhJIcdBbBfNEX/yLpul5RcJmM5r8M4DuOZqnYaL9lRmYul81xaFY/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871732;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=B2OE5O3tb3Ou1RFkpFYugL2YEcVB6+K1puTo4VcQI7M=;
	b=Qk68war3ZzwKl68kk7N573xiF/4wShq/ZzsLGzgV0PH9jL2bfOPfvSAZDwxxCaHRvnP8
	 bOJL+1Scqj+8H3mtj4DTnoY/1C3JF7FNgRTPITSVmrxwA9u25g82wY53CoBg40megF7dU
	 Gu4CP9SheVvojz0T/UgJo/vpSV/9YzMTaS3mcDqz4En9ZbdR3Vw2awj3BZyJfRaZEAzpy
	 /qZQsVfzHCrLJZnhLgYRLBddCGtKd7LRFODSOcAg9S4ajlydPq4iVPhTA5eecgkLGhWU8
	 qSEGhlycYCqpH5t1isrvRXEDFe752xZKyYau9xCi01ARwBUAe1+cbkWDn7gJOqOiFUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=poW2s82e;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jjZlUd6p;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9155D606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:42:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9155D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=poW2s82e;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jjZlUd6p
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59XrOv1006470
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 09:42:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B2OE5O3tb3Ou1RFkpFYugL2YEcVB6+K1puTo4VcQI7M=; b=poW2s82endvs23ym
	DH/q/xYKatrQiJkcEbvhE/q3KC31NqGiSWxiEW4o5+S596zrBF7gHXP1pNzpPXCE
	CuxszR8vZ0zPNMUOPFgVUetc50sbuL9Qkf1edV18oKeKWWk9qBEubyxGmgjAl8E5
	mMWm4Hj0KTn1n9OX5OkxLKJRpXKqPWOXCNrtYBSTvOYbgo9MUvz2iV/KbFsUqcGy
	iy2Pz1LmeOdRsqzAkLoCik8GF0dewM04aSpu6nH4s1Vfyf3luV9m4Fe+7wSUbebv
	YA8yaNpd4GG/eowe7spMl+FOK7h+nx5pBR0jX+Af2MT4pRq2tBII9XTQ6AchP0XZ
	SWuUCQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq9f811h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:42:10 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9907539aff7so1171902241.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793871730; x=1794476530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B2OE5O3tb3Ou1RFkpFYugL2YEcVB6+K1puTo4VcQI7M=;
        b=jjZlUd6p4H1AWJR+ls68XRk84AtSExzynFPoy55VAGIPw8KFZJhU/tGSkD3rWVgAp3
         bUr6VQdII6zbyEmNvEAdIkkw4Apw7ek1biA602CqHE/O1ZkuE2SwpWmkfrMARaOeDs65
         VRAGYxT4Mfiu2nnRcePMi34uCljW3gig4aXSakVikd3XApMBBB5CCg56GiDX1KCkmmCp
         I9LLIPolChcNt3S7eNsoXTlO1zGS7TlFVfvvbw++pQ3h++VdIgH9EE5mQ707YVPI3DXh
         P8SVER0SXXsnGcULSlPu+IyCr7WhpzMvXxPShoPwLnV1IulwHV6ObJW5gTZw6BJyImit
         j/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793871730; x=1794476530;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B2OE5O3tb3Ou1RFkpFYugL2YEcVB6+K1puTo4VcQI7M=;
        b=NptQrHG2zl/tts50sblXJqkTqWON/kSPm0H9W+KVBm1GNMuU8SAsm6JN8IlTMX8Ad7
         U2Lj2byNqCo6wL7aP2/P/08Vg3bA6RkCgWkP+ZIuyDTyogSRHT2Sma1d57aBsxdrsbPo
         mHKRPe0PUYv6bM5ajTu0I3AnAT5D40YGtD9RBLboaiuDw2HP4iqNxFGsvery104W3lDK
         oLn3KtTW6lkbezI8MDjeZrrvCPL5tTz2HfnUlJZeM/4y0dvbM87VOfDpWBFXlJYogY+U
         FaCxnpJLKwNMbSSC00obxNkemQ9xubrw1XAIOfnfaev0pxGQagPiEWtGYIfy1378Y8P1
         e9/g==
X-Forwarded-Encrypted: i=1; AKwUvBwjytBfitMYgRlTgudfSOKtfCkpj6PRZnXpo2/tfgdqrPDtiDrSVgIdHCMPrepdCirgOvPLzbCfSOeOpmE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Z6caxEp1jIOJeCoO+cUZdaWoVMj+uhRQb60ZC3u+lnE97xCNF
	gcl9N2Ie/xclgCQxugT+5crowzfe64hNfilk06Wvq6+XwBVCg5NMH2PBPHAIIONu4wo+fnIa2oM
	Sfl7NiB45KJqQf2DGpyIEvz4XqQ7/deNA+smO2VoRnABoY5FGVlArBgVHfCTjXVAaABbiNVF3rC
	0=
X-Gm-Gg: AYBFou10K70h+1UA645Z+OvkrLhj7oibC153i41+tweFtqUw3rTfrBsMLZbByEuNyqN
	gtHuQwEsxVG2OcGK+uDhSlw0+KJh/rAWpXbUrAEUiVO20GKxDtztcL4mLDG9pbORhT7MY4sQCun
	g5qKcQO19DqzRU19McP/r7axeCg1it2UKDsTAHl0vNXMY1koDbucoec+bP4rMBwdp2gwaBVuK35
	OqV5Qry2a2wdR6wjiSDHyxDBaEP5GvtsWiDovulWFrGEEfUZu2kbLppCM9EJWtNlUrU/J7G4OW4
	cYS8/RwqCw/5j6JK18tXNyE7tiUunqn8P/UK6tMtjxZal2Av5IWPRB31cyEL+Dawyia1c/5u5Ra
	eFhRnMZe6g8dXKPutlaUjAokkNqh81gPy3lYfpDiJzrG/dLrh5fZbueo9QhmA8YfDQfhHiQoOc4
	NHKyo=
X-Received: by 2002:a05:6102:4422:b0:7c3:7286:c291 with SMTP id ada2fe7eead31-7d072c3e082mr9058548137.19.1793871729618;
        Thu, 05 Nov 2026 01:42:09 -0800 (PST)
X-Received: by 2002:a05:6102:4422:b0:7c3:7286:c291 with SMTP id ada2fe7eead31-7d072c3e082mr9058531137.19.1793871729170;
        Thu, 05 Nov 2026 01:42:09 -0800 (PST)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed553116sm8865382f8f.42.2026.11.05.01.42.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:42:08 -0800 (PST)
Message-ID: <e0b6fae0-0880-4008-acdf-b4f64b3a5d43@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 11:42:06 +0200
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
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: sm8250: Add JPEG encoder node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
 <20260730150524.2659577-4-atanas.filipov@oss.qualcomm.com>
 <ln6tr2vwv6zmoo3kcivjjf3rqjxqm2fltwcpn4kk3iphc4rzlb@qdpop32fjm5l>
 <ce631db2-8e8b-4b97-8164-c701a1b0dc1c@oss.qualcomm.com>
 <2rtrk7tsquxekqhk7tsiomjnfzc3xfqg574cbw2m5b4ui4ovt6@2oxme5w4wsqy>
 <31db3de6-34a2-4ccb-af61-043f56d8f86b@oss.qualcomm.com>
 <4f7tyzvt2ojfmkneoaviegk3xbt2gegp3yoei57rzijcxkrlyp@b32nycxqybyj>
 <20261102092828.3728247-1-atanas.filipov@oss.qualcomm.com>
 <tshclix3kzs4iwgfxjrj46o6vebelntyikhthqwfpoi6muyckr@lhaix6uban63>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <tshclix3kzs4iwgfxjrj46o6vebelntyikhthqwfpoi6muyckr@lhaix6uban63>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNyBTYWx0ZWRfXzL0LhTZxka9b
 yzyeW0YvkSSpOrX0RF6OSl4tslSZQJL7C95LF+kEum75T1mYCHpvQN/CDIQVQ+tXspnCwYkXqMy
 3oDdJsOpU/wjYzxkc5JtJ+1quvslEnKpq2JS6mxegTiITu0+lSoB/TUu1ycweDn5UMy5JMg6Wi1
 CR6xpl5KNAeQ2AkSunquxuxpfphQP+yzpilDNjZY4IAcdcuwQoHAFjJMsHwKYcxxHJcXks59K+4
 a1KlraQzI8pZesSdKJFowFBm3L/bZTQWBWHwQayN40Gs/eSom/lRBUhDuQDpONdu05CMHVfPflW
 HNXBa3EpuG+MQrUdyrA8qeW8hVaEVTHndtqaXS5umd3TVVSWO/WTVCy76H2k/RHDsLbAMDljltV
 t+IJNpPfPO1QA+jw4npO0Bcp71erAPt03Ld3g7TZ8/nxyTzzk/V+ZWXbGUFdJVL6RBlBkFoTEXs
 wCn2kuywIf9yDDVdY0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNyBTYWx0ZWRfXyVC8fXGksT1L
 fDm0vYix1m2FxEtAG5tv8FMIwRU8nIFHcN+hxVmWvpwxTXMy8eFcInOPKLubfaKcLPf7HvN7846
 tLm+t5WCW5wGrAGqCOsZbc/ON5g/eQ8=
X-Authority-Analysis: v=2.4 cv=Vdhir1p9 c=1 sm=1 tr=0 ts=6aec4f72 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=AEedx53rEO7tRwC6VusA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: 20GmSltIUKI7pzsGKTZvMYBIhDI_OXdq
X-Proofpoint-GUID: 20GmSltIUKI7pzsGKTZvMYBIhDI_OXdq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050037

On 11/2/2026 12:31 PM, Dmitry Baryshkov wrote:
> On Mon, Nov 02, 2026 at 11:28:28AM +0200, Atanas Filipov wrote:
>> On Fri, Aug 21, 2026 at 12:36:26AM +0300, Dmitry Baryshkov wrote:
>>> This will be true if:
>>> - MMCX is a parent of the TITAN_TOP_GDSC (in Linux kernel)
>>> - the driver casts the vote on the TITAN_TOP_GDSC using the opp tables.
>>
>> Both hold for v7:
>>
>>   - camcc-sm8250 attaches MMCX and registers TITAN_TOP_GDSC as its
>>     subdomain, so a performance state set on TITAN_TOP_GDSC reaches
>>     MMCX unchanged.
>>   - v7 adds required-opps to every JPEG OPP entry (min_svs to turbo),
>>     so dev_pm_opp_set_rate() votes the MMCX level through the single
>>     TITAN_TOP_GDSC power domain.
>>
>>> Checking the 4.19 kernel. cam_cc_jpeg_clk_src casts votes on the vdd_mm
>>> (MMCX) power domain, while its parents (pll0, pll2) cast votes on
>>> vdd_mx (MX) power domain. Note, that frequencies used by those clocks do
>>> not match, so we need separate entries at each of the corners.
>>
>> Agreed that the PLLs need MX. Upstream nothing votes MX for them
>> today: the camcc-sm8250 binding and DT describe MMCX only, and the
>> rpmhpd MMCX domain on SM8250 has no MX parent. On SM8450 and later
>> the camcc node carries MXC next to MMCX.
>>
>> Since MX feeds the camcc PLLs, which every camera consumer shares, I
>> think that vote belongs to the camcc-sm8250 clock controller rather
>> than to the jpeg-encoder node, so v7 keeps TITAN_TOP_GDSC as the only
>> power domain of the JPEG node. Does that work for you?
> 
> Konrad started to work on that part, but currently all the votes belong
> to the consumers, which means that end-devices should also vote on the
> MX (e.g. see Iris devices).
> 
Thank you for the clarification! I will add the domain in the next patch 
series.

Regards,
Atanas
