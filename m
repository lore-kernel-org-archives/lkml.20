Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793607356;
	b=HP4W6kTJ6rvTSYOL59eI9xDgXBb7zoiustFkIW94aKAufsV0yNnOCiFLyGbxn+swTPOb
	 Ga6p9r8wxDSS3VXNJa0IrlI8o4wmYgNZwhErlk/uBccwyU97mF89Ot/iQ7PHAr22Ztr58
	 WW1f8Zrtdo5XnEajDFS8umFGaa/IPJgpYthuE66APH5Hy9baPZWjZf5PxRMBCkMSlgCqi
	 8tXIvzuOidQ4aYDH8OW3J0zneOkauqZQ9Ys9+w7bNnX80BPh22rVOJKB7l32pYpfyeJCn
	 syDdmZa4IyyYR3ek1TAyKP9tzK3yCQiaSQalQMOMcvRStaKghGV4gzHs2XinxP8iL8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793607356;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yg1/YfsNebg1oVBiAZqRAo/GrAy95WMhji8WTMUGHuI=;
	b=ZCip133t9sG+3bZ744uqGLWrLLQvjgjuNwa9Xv64NTUh8glkBcXqTmuJN+2hkf1AYMB5
	 ojtQHp7Y98MkFujmHKT+8qkKiMpJzpsSKbbtIBxpW6P3y/I+5vJu7TcoxRcUhvmzNWA7o
	 zbQl40QXlNkrUJsY7YtpaoDRa6V4dOF/VA4Uj2Kyg2iYUiEgx5D//j7UFxa6fuf3pOipT
	 0PQyXL418iuAuKuEfYr89hdcAqClyeAbxsdWgYcWPNJzrgyKY7ql7Rzd1hYbw17pfMvoi
	 We3oVjrYHrODyWQhqKs2Lwv7+oh8TUeBFS4tqE+9tSU1pTIy/ABJVduh7kRrEo9rD4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kj9LEuOa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RqbTUzO2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD1860A2600
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CD1860A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kj9LEuOa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RqbTUzO2
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A25W3cG3924352
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 08:15:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yg1/YfsNebg1oVBiAZqRAo/GrAy95WMhji8WTMUGHuI=; b=Kj9LEuOamZeCgZkP
	4givCJdnYCchWqOH8jCoO3IExIQ7WToIZXnGcBnQ8ev3+zPBXJkcxAqIc24Pt/nK
	wZQZv0LlpAuRcBOrK47isX+5Pn9jzQOkx9SP/HsvWKJ0RJNwD9d/K1din4f1g8AD
	nDezlx3N3cGOsytIrd66vEwOSCtAkHfcQc2EuOYlrhUpnqU4eS21peFZs2GMAvft
	xqzVif96c9Bw72/5RTwLERmJOM4CTO23nWVDrcyPA29E3/flm1K4eBMhKTS0jc4d
	GZWL1fgS5FsN2VHWlCnHLWl7CqoOAV1KQzsgDBxEYr8wBhyhpXKxkKA61aV0GAef
	DMQ/xA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1rjfc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:15:43 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a06da65d92so1737743b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 00:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793607343; x=1794212143; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yg1/YfsNebg1oVBiAZqRAo/GrAy95WMhji8WTMUGHuI=;
        b=RqbTUzO2N4EMcJ/pUwul6Szd9ADjFFFhSoFlof8Y0nQyUnZYgThtACjssqg8OYgtUp
         duwf8wHStTcJfcSVNbkc9BdGDqanK52jN5dr5oUXGRbMfxOjQ/PeNI3agmitOsDy/s+B
         pfWt9ZrvGHctmkJLh5L7QXOd9H7xLyttD7RJ1u/Qw0mupIiQV90Id5qTeGBlHtJCYpjT
         nJBy6zSqtELBksJHOLgjGlKlarx7Li/H/aHwA4vRNFI3C1z4Hw5GTlGqiBIB+z6+grB3
         sEr/tAnHLdyBddwB2ES5+wCMzKW324UWTNOwOEHq97Dc9Bk2ICf0zhn/fir7xydHX9du
         hX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793607343; x=1794212143;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yg1/YfsNebg1oVBiAZqRAo/GrAy95WMhji8WTMUGHuI=;
        b=lIt/I9shD3Um8JFxLd1dkk+iJIVwVdfEH5muTk0lNS1rDXU8iZZtyGwhoeuiYSQ2FX
         W/bnsSFz5xzHdiDcmpVpeFm46I48rFle5at/3K9satAis1yH5B+tNM3V1ciJdBjBDTTM
         mq6UibOAw1MCrVX1L1w1MwcyDyAXkz5nncVPhTMWtgNRuse3jN+PWv9YSynq7VNi721s
         VH0ElZuDxTCmrLOClEklTzTsQQ+Ua1ai3HfFdKa8v/q80rsMdOcI3+COd9+cZX2MXwEY
         kyJaEXC3PblmOnkjrO0e2X6w6aHVu1DxzqW+42H/hlM6LC04GLQmHi/iYkqeJ3lOnGeJ
         Juwg==
X-Forwarded-Encrypted: i=1; AKwUvBygzFKKce7CIM6yDS67OvUEkxNhZbw78pYxu0AjFoKVykr+V/EisLoUkydzyNTmfWMRmIeiYzya3Adu/28=@vger.kernel.org
X-Gm-Message-State: APuU4Z8otVSp4AjF/so1WfnfTCawlEIJcd0eOJ773RrVBNpF1PmQqmlD
	z9Lxy6mRAlUP/6K+Kkcjtt99irJmY9tuLn711FCXzLCtb6xADQoFVhDITse2NS8exFda8aS6F9z
	Cl/lmOjsdv/Hi1RiqdxxzDWYA0vLgyRU82/6dwypSAR7mXHQd6fY2tis9fWXsHl2JZsM=
X-Gm-Gg: AYBFou2XJBdLr2yYWNsTGQS+ceklM17yhZV+hrJccPRE9cB+oYVzFnNU416foKYvLC0
	FX6QYH6Lq7oWcJn/A7Vb/JTTMzcLaTBx7kODO36wyhtoai00Vp/mq5jGae2vtSNkddeVLGkUrgs
	0p0DZ0ngchb+AN9EnapwMszQ/YM28BQ4ISxDGis89iYsvlDfbPfy81g98M7QX3W2//5t0zxrZ44
	bXcFk8nZiH3az2a6Nv0nH9Ni/mqGCNAyNo5Is3J4mBwcO+as7ny3J8Qe5k62UL5id1XShp8Aebh
	uhSC+HjEFROLqbTuR/f+ja0dEkG1uAjLBZKiafT80Tt0PQwlGikylbKQFeOcOstHqccV8A31JR6
	2hIY/vEfLdVZCB14s4j90+xncubPuvyZaX36qzvAedZuTqy37WcKbInf+uy588yM4wSBph5yqy+
	5dQg==
X-Received: by 2002:a05:6a00:1c91:b0:89e:584:bb77 with SMTP id d2e1a72fcca58-8a9c098ab29mr7792368b3a.58.1793607342758;
        Mon, 02 Nov 2026 00:15:42 -0800 (PST)
X-Received: by 2002:a05:6a00:1c91:b0:89e:584:bb77 with SMTP id d2e1a72fcca58-8a9c098ab29mr7792341b3a.58.1793607342266;
        Mon, 02 Nov 2026 00:15:42 -0800 (PST)
Received: from [10.217.219.145] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada3d3603sm1573291b3a.37.2026.11.02.00.15.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 00:15:41 -0800 (PST)
Message-ID: <9f7c605b-e7ec-49d9-85af-7dd9d00a9079@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 13:45:37 +0530
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
Subject: Re: [PATCH v1 1/2] phy: qcom: qmp-combo: Add PM suspend/resume
 callbacks
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
References: <20261022104321.306679-1-prashanth.k@oss.qualcomm.com>
 <20261022104321.306679-2-prashanth.k@oss.qualcomm.com>
 <de3e5baf-dab5-417b-a9ed-225cbc56ce1a@oss.qualcomm.com>
 <a8104e92-990c-4e1a-aa4a-c97b9a801935@oss.qualcomm.com>
 <a05ddb1a-a84b-4db0-9806-918958f3a962@oss.qualcomm.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <a05ddb1a-a84b-4db0-9806-918958f3a962@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hr5aiAP9NaL7zTi1UMZ8rhxY0iabHCVu
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae846af cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=3tw5ZB9OoNIg3H-R3REA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzMiBTYWx0ZWRfXw5yBjryNJIH6
 nLVJim3w3ObYPtJksa//3z11V9nDNEHpxzQxllllv1FNjU4aGrq65Ji9apgGg/BOZgzpJgB9ncc
 xD8oIRN8/Rj9zB+Z3GCzHnktnoOayebP7FkNNa7jNBOk7BJHKQpfBFbUtANPJczNdv7zmHYCCwP
 RhLoO0SP0EuZCjvIeagdomGkmmInbkKByRtDpOn2T67ScrkY/2HpC0DWp064h0aWYuULiCDft8e
 QeeWqvzMIf8Z25BGmvaT/esKSN0uegc0nhFKLHu8J8E5Krm50NSgesSRxvKP0iAJuP0aVykfR5+
 tfEQhFi7lZ6IJpr11txKZEIrRBT3IEypL1VsgAYzpqa7bsgEy/C+JHQERWTpP3mRhf2mFfiD4mH
 mScc3Nw/TJZgxWsm/s33EjleI6xeXmnWwdr/0T1I5pjk6soYZlyts9U7OjEMvPSVwdli0bnKTiN
 vMc0H1Tgy/TDSiT4v8Q==
X-Proofpoint-GUID: hr5aiAP9NaL7zTi1UMZ8rhxY0iabHCVu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzMiBTYWx0ZWRfXw5xY9Zdaf/BR
 1F21t160wK2ADFNiB8AAzr4OdcwNSoFBFsn0/QofRpUY+ZhmNAXCupouswztRimovhyfsBC8wOb
 7frdzElur10pTdBM/EtwW8CiTo3RuFM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020032



On 10/30/2026 6:54 PM, Konrad Dybcio wrote:
> On 10/29/26 7:11 AM, Prashanth K wrote:
>>
>>
>> On 10/23/2026 3:53 PM, Konrad Dybcio wrote:
>>> On 10/22/26 12:43 PM, Prashanth K wrote:
>>>> Currently when we perform system suspend, the phy clocks aren't
>>>> turned off leading to power leakage. Prevent this by adding PM
>>>> suspend/resume callbacks for the qmp-combo-phy which toggles
>>>> clocks on/off correspondingly.
>>>>
>>>> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
>>>> ---
>>>
>>> Well this still leaves pm_runtime_forbid() in the probe function..
>>>
>>
>> Not sure about the history behind this, I assume its for controlling RT
>> behavior from user-space.
> 
> Long story short it was an opt-in because it was broken.. can't recall
> if the issues were on the dwc3-qcom(-legacy) side or somewhere in the
> PHY code itself.
> 
> Konrad

ok, I'm not sure if we should modify it in this patch, I'll enable the
RT PM operations and check its behavior. But this patch is intended to
enable the system suspend/resume ops for qmp phy.

While at it, you had suggested to add mutex guard on RT operations,
I think we can add that also as a separate series since it needs
addition of mutex on qmp-usb driver.

Regards,
Prashanth K


