Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEC539479F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792147652; cv=none; b=TaGD2nHWpl5jy6fYuUIyqOI7HlnNW8RelPLVKCcaMXEYAFxgJLvjCwclApgyE/dZMNuzW/dWJNVa1hMU22T0IanJXelCqbKbNOpbRsVbUpixnS7yJl15WfxD/XAI+PnxzRFMfL4UxOrTts1Vtm3QeX2NEq+rQHGtHCSZvbQI1TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792147652; c=relaxed/simple;
	bh=bPnl0Yf71e8vcUsCIuKIgbXK1yIVIeaibryeX5c0yuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IX23ePs554Ieaw3NOSMLPlOv4Nw02CcT0UjUUbFqr4TRirOR7o+re5ftj0i/GmXcq+i66rfaIskTwHL/zCM27lk3jLPJ93MwwUTlwOO7kcLs7XzuW/2zP2KYqQwAFrTv6JA0yXec1C3y+RbNhsX06pQ1Iz/Oj8I5qktk6K5GH5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cJe2x5yF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VtKQ7+8J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cJe2x5yF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VtKQ7+8J"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAA2Uv942577
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KsBGE5Y7oiOcGfZZJwFv4NGQn3UVu3xR1FcpZACoj8c=; b=cJe2x5yFzIQ+Rhyd
	SdV6xuc79AWvLhM666s5jDCaCbOo1rp4OpbXSghFupkfLhYXsJ6GciSMMe3Q2fpz
	E9S9OaaTRZtv18Np6DZ85G8o5pM0YEhmxjcPiuAmpCe8Jtd+V+2WtSFqhiMYLLqv
	eTFycHeo8rmgQVZaiFii9vDWIq+6tkqE4ZobrJR8gAuLHhiQ7cnMluVU3Y8U6L6D
	g7y8C5cyOKviVou9jV7eOeke2n02odrCkfdyvH0IFg56R8vuz2B8PGYDvCIMaBAi
	FCLkFne0HaCaNl7n7h9jzbZHPjCTJ8uoFecRXWQAUyLxDjOsU5m2THv8R3svp/tR
	q4Fp0w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbhur04vp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:47:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93edac58b24so95223985a.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792147645; x=1792752445; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KsBGE5Y7oiOcGfZZJwFv4NGQn3UVu3xR1FcpZACoj8c=;
        b=VtKQ7+8J/RVZ2LpARYYsLV7FM+l8A/NbCjYm+uAHmvplnspbc1aV9tVolg+14qu7OI
         OlH5vsstN8px3uPKelSVkx+OyOxTJDG8YuAMgtVmAw0UV2V3rEtgZLJ6tYZls19XjPoM
         UqtmasbNv2L+I3Yjo0HZxwxaoP+59ic1WRuNSmAc1t8uaPWQ50/3xrJSk3DMqSV4LjCv
         cNk47g/aFZjkAOitL65tEPinDWLpEaTn8buxQ+Sx9/j8yagtZkAl934MJWVzyphu++vX
         y9lbsos6lXB5fM5CyflLYCFvrz5okbGOD81Ph7XhM8mJnXzaT2lfAa+W+EC15sdkOsuJ
         +wwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792147645; x=1792752445;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KsBGE5Y7oiOcGfZZJwFv4NGQn3UVu3xR1FcpZACoj8c=;
        b=SC0yoVFlP1VcaJUWPog3hNAiqW1OLhSILJV88lOsWlNhUabEfFaGojrMne23tlc6bh
         WB7tWXaBR8ixlit0wD5pAbgBYAZ8+ZdoqvAbeBWID8wdjvBHMwNXjQ+EvZi/7ISnwqnH
         8XaMYk5IN+eImokVf6jYjTXa2BDlSM+UTRrO62y/QU5quA/P52klQhENLaOdsKQFcxMy
         h3A0xZNUzz+shk+00F8JawilTradAtCivpXktzOsrWHGSFf7rqiDVHuO8Ayx2wz6kpEP
         Aa84i890LMa4sOBnnXbG0VyKGiIldBLo6RKnUnyZcH/FGTAa61GrsytABvk8s32n5Bj9
         cFWA==
X-Forwarded-Encrypted: i=1; AKwUvBxTQvXcnc+sjPYYjG7TPBGcGPHnhCGJUqM5OzsunFu4TeHL3noY3q/0gp2iV0aIJq1P/NngdbnoAOcn9Pk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJyaMeKr2Gk3qS7AnL1fn6APQGA5oG+B+kfplXkn4phsmLp3T2
	zvJzWiUx3S1i1TgTpt1X9i5vidfePxkBNYquaVH2Qq/hZRQiwlZG1j3LLiXKIghX2cNwI00kecA
	iykxruBnDu4orwqbRJY0yGDclEx6vI/vtg1qutTkHiwLcv4qv1YfiqmrXpwQdrfYoWBc=
X-Gm-Gg: AYBFou3yfwsqB1H+2PfCNmMGQjHw5fZYX4+W89aWD+DskjC1ewewMY9VUx7IbxS1p8w
	5RyKRenpuSDjwYcGtlEWpRkjZb0OMZPVirzC6V3HRvnQC6O9Qa7r/S/Fst5IjFDGj/dfvgfPBKa
	JaK4rdwKWIwN7o/znjiec4cE3rRK0bffpBJ3m3XL5tfATa0q//NRKtOQU2kC7MByAgw3LDhtEsR
	fMrPdmh1f+ybL71F71NgrhLpyWwsqytKaRX3IqUTILVCDMw6YPLhYAygIwnsl5on5Jf2NaMWLb/
	/LOiPbLjsd3juTWr926yo7CASPmw62oJT1PlS6xNjH1C34jlZPe3NbVRnnNPWX926n3uNg6rOn4
	2iOdT/66DHGZCmNvALnVosg==
X-Received: by 2002:a05:620a:6506:b0:93e:508b:7800 with SMTP id af79cd13be357-93ebcd29970mr3706654885a.0.1792147644796;
        Fri, 16 Oct 2026 03:47:24 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:93e:508b:7800 with SMTP id af79cd13be357-93ebcd29970mr3706652485a.0.1792147644333;
        Fri, 16 Oct 2026 03:47:24 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a132d45sm752855a12.4.2026.10.16.03.47.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 03:47:22 -0700 (PDT)
Message-ID: <04d85ecc-60fc-4923-9073-6e00eeca5f43@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 12:47:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: qcom: Advertise hotplug with no command completion
 support
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260314-hotplug-v1-1-96ac87d93867@oss.qualcomm.com>
 <d709693e-b9ad-4d53-a368-67fbb0cbd601@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d709693e-b9ad-4d53-a368-67fbb0cbd601@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0MiBTYWx0ZWRfX4jsePfoaWffW
 OTngZ75aPZN8tvPGhIwQRR6l7tN+kBq/w8ehg/JKFpKgzpvYTnU25b9r2LnT5HwCLcBmGdzXOpx
 C1HAZ+va6Vo/XZ9ado6Rtn2ul6Y8ZTncffW9p4Kio1dQ6/hCtqn+kgOlVXfPKf12kH3TnBILrds
 dFWrZYMQLMVYAYNwQQISsLXtUIV8zC2dWN5UEvYBj5ya6kCRGYPuL3jAQiR7S1RLI67ZU7orA5b
 Ij1XFQ1HhCBY5CODhaPQbGRnYj5aQVbipuMrDBVsQ+Dzz2gse1RDGSZ7uFGaXGJH0+RxdSPH47T
 /dfjqctJIpnfO0Yu+tPFA2RWlC8TS5l8KuhjOP1Wh8a+SzX9PM6UTQBzOIrTj9okbNyc8lk2GVS
 uqVg510OChxYtLXswj0tFhPHQ9PzG1qDlb6bLztj6HPjE6ot6Nhm04mnD4p71BMoZeIk9bzzIxN
 gGW1wwofIu69ysHig7g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0MiBTYWx0ZWRfX7cUvZTr2OHn1
 sVyJxzA83w9xo9EPFfL7/6z4eYYBczZkXej31YTGTp9ja3RHxul8TYk+2/7fZSJOOsIoi2+gIOK
 /UnfCwLnHhX56PJCjfKgCYNeRoLeB8s=
X-Authority-Analysis: v=2.4 cv=PqsG/AM3 c=1 sm=1 tr=0 ts=6ad200c2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=srXNNXimyGuFi33gXwEA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: JI6HPbYE28ZPmVs5wiewDd2_irc-W1Nf
X-Proofpoint-GUID: JI6HPbYE28ZPmVs5wiewDd2_irc-W1Nf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160042

On 10/16/26 12:24 PM, Neil Armstrong wrote:
> Hi,
> 
> On 3/14/26 02:56, Krishna Chaitanya Chundru wrote:
>> QCOM PCIe controller advertise hotplug capability in hardware but do not
>> support hotplug command completion. As a result, the PCI core registers
>> the pciehp service and issues hotplug commands that never gets completions,
>> leading to repeated timeout warnings and multi-second delays during boot
>> and suspend/resume.
>>
>> Commit a54db86ddc153 ("PCI: qcom: Do not advertise hotplug capability for
>> IPs v2.7.0 and v1.9.0") avoided these timeouts by clearing the Hot-Plug
>> Capability bit entirely, which also disabled all hotplug functionality.
>>
>> Instead of disabling hotplug, mark these controllers as not supporting
>> command completion by setting the No Command Completed Support (NCCS) bit
>> in the Slot Capabilities register. This prevents the PCI hotplug driver
>> from waiting for commands completion while still allowing hotplug-related
>> functionality such as Data Link Layer state change events.
> 
> I'm a little late to the party, but marking the RC as Hotplus means the bridge
> is marked as is_pciehp and pci_bridge_d3_possible() returns false.
> 
> This means this breaks D3Cold support completely since in __pci_host_common_d3cold_possible()
> we now check all PCI devices, including bridges, and the RC is not set in D3Hot anymore.
> 
> The only way to enable D3Cold is to pass pcie_port_pm=force to allow D3 on all
> Hotplug bridges. Which may be wrong on TB bridges.

At a glance, may it be that we should advertise pciehp_is_native=true?
(it's currently only a thing in ACPI world)

Konrad
