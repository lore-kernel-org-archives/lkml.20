Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204338;
	b=NQSiSWqcaPkG+UEPP9rT/qhUyis/Pt3CDryUoOsQpBCBX+2pMOp7pH2y/9013ZSIBw3M
	 kc6dTavi/ur7I4GZ2vSo7RTKtyRZeDxkY+UqbqeV28+8IwzBbd1OFaVRFXCgXF6htVlSt
	 bb3XS8IRdD5mo25qvFv/NybgUBzqY533oATKwx5Im2wgOzz3ZAYHMVkFwD2MKN4kYTyLM
	 A9X13I6d8Mx2xu4NVEmeJ3qi4McLh0bLBZP+xi8OngSQgwrCOYulotsnFCmJKHDSoslht
	 5GAGcu72IwM4ItiZtJqi30u8J0f23Eh1+wB/woHenU6q2XeXzUWTrOF4b+J6t86cHJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204338;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sFw54XMm1ori2CEdTotFB5r/3eWSVETSteMxiL7oSek=;
	b=CKIIEHa0yhdoDAWVNuLOWAAx++2jk41gSAUirSq2cA4RyRX8VQDsQMmWqmPAZellLMTE
	 mhqQidenSuzH1xh3OHRbytJ1uRIoaQc0Adyo0yKaTZKlgSn9HcFtdRF2HFQj9oUZoRtz+
	 XkYpPy4zgGCKOr+TZ1/PHClQg8aTBWwoQcPQCwCP6mCTn9mzgZQPspbNaWyIMiasXqMdG
	 HdS2BfVqZf/p/zPpEbDDcVcvhNwwbRfEg1Td5ucz8ZwbzYgm6+n5zgMIBtpq+gNQ9Qubp
	 /4e/2UqXw8ZGtpFdP2FynVjmszzNvIAkQVi9CVp2JnRHQsUpVjSh2V2M0EotQpDOpwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="I/BElP9g";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Igzl1RFv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35D6606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C35D6606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I/BElP9g;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Igzl1RFv
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A93KXRj2180653
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 06:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sFw54XMm1ori2CEdTotFB5r/3eWSVETSteMxiL7oSek=; b=I/BElP9gIq7VJCxU
	7eiC36NsIwEdpPI21E+0RjlT0c2KJVUMIfvB8gadfxCrHi4XGO8x4OGqOz178dQB
	dZoRaKX3+ShDm3cqVD1WciNXbVSLwLUwflEa3urcaQIp6ee85dcXTH7YvhdzOkHL
	pZrtdId59YgeBlbY+8/siqsmOqCAk9b+F9CMhnzVj1mZTrMu95KnKq1KqYYbhCrt
	eL3I8TTXBpW75fMtC/zEKgaTuphMFNX0IpfdA+Ll028zp7gqUu9BHwBKS7TiG/WN
	La7AUo22SCxNQKFGkrZZYpjgsEP9VWVG4TYg0MDRyLS5MT7a0dBVXm0Zgi5Seb8Q
	wob8HA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsvc6mwx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:05:36 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a71dd190b0so2332116c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 22:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794204335; x=1794809135; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sFw54XMm1ori2CEdTotFB5r/3eWSVETSteMxiL7oSek=;
        b=Igzl1RFvmyQSNJ0MkU0mlqFEULBjA8ENnvWytXm7zluOJYLs4kaVX2MTNuM/wP8IXk
         V5r7b4CAbX/9Aw2QdZUrawnciFeZx+ARRF+vj4qVBt/p7eDS84beSx7oHGelQT8KBAhi
         ldv4ljHES4a9aeFkfUO3ig72Q0Gs9FwPyvOAO67eT7NT58hxguxJrg/iUq2A2r4h8wx+
         u7JVlpSOmTBMZ2RDrgDV0IvKWNv+n/TQGcfaymtDmbc7GLqWVYqjB9Sz4LLZn7u5MTJ2
         7wGYkWfjyw9LsumVFCNwBdXpNiOUsu8ulwCRahOH6+b+OZpfVJWr1rLpXnAxNLT7Wc/r
         srXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204335; x=1794809135;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sFw54XMm1ori2CEdTotFB5r/3eWSVETSteMxiL7oSek=;
        b=Ccleu+jU70tQvKpivTsY6MC3DkaUMicru7LmNVxf+cDk613P9HzOtwiwWfM+mGhYF0
         j96jklWG3kggnb4PwQZsDrsNv6V22HhrPs8V1G7PUlVKOH2FHpbQ+GodrMsrwn3SIrrE
         SGhzD30ruQSzR1mJ6HZoGFntL5r4dewFPxNgVp5Sjld8eNdGDEL1h4AuiJuDrl/uqqnH
         Ryc2qdCO65YvqNrrOlTvc15hX3aG/SuzYjf5hRV6Pprlj2Sy0g4bNf/MJaNivm5ZuI02
         ilZ/KCxb9jL4O7ONxVnP8ubnx9VIHYehvqKgVg5DKP13bPLbiMC0rSJQ5/VAqK2KuBUp
         Amcg==
X-Forwarded-Encrypted: i=1; AL+hErHJUNAlbxOYmUuyMy07NnzrKSCoecYuO0SLwlIOoK5RfzUdPYtGTfXnMgHGIFIoVMaORuhia76Pk6Z+Rsg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fgIDeQ64uPc9dJ0bIKP8AlD5/dY+GRHITlgGuB57uJdN7BY4h
	wC49vX/yrttbNLg3FHc4y8TZDcaZN3YklwMXTeU7n53bac3gDEmYnZIGZLJEk/39iqF9EADAGSe
	xbZOIgtt1S6b1Xk9NYMnsQi0YThnQHIRGEsC7AmgPGuuCW8a1QiYgpANMtJSDuWYBR6c=
X-Gm-Gg: AYBFou3ac33hOFgY9kW/MSSibM0Cjdsh6pOklyXaFWRaOWZKbeaKrfdMCmweF2lbijP
	iaba4P8r1SO2vFryLyxE6I/QJnq8Z0V3YzuMuw3QwJpr40w0YYsKYYEgDTHmYdL0qvcXObDe3Fx
	rGNhlI+4ZhfU0ZgV8fW7nH9TXT0JLT9ekEMR6i8jkC9NiTLB63DVcHdyIKpVPSdWpOj8kbGvYO3
	UulwiAqmoyt4QE5kWiKM2bNc0fbvIauz0mUITzts+v10p6cPcg925fLegsLat9DP4Cn6yK/nmUy
	S0TYfNjg6qW3NAlfkGxPrtmwNlswKdMdfSkmGqwE0Ewstt5hD35vhW4qhpaGH1vLcLEYtS+UM+y
	JQiXIgRi9hmSmQxC1HKkKrVminn2PtTJ7C57lo+fUfHCRLWjGzKtQnlnsYlrAAf0W9WofegTsYa
	0=
X-Received: by 2002:a05:701b:2412:b0:1b2:48db:23dd with SMTP id a92af1059eb24-1b39fe87c0emr4454208c88.16.1794204335370;
        Sun, 08 Nov 2026 22:05:35 -0800 (PST)
X-Received: by 2002:a05:701b:2412:b0:1b2:48db:23dd with SMTP id a92af1059eb24-1b39fe87c0emr4454167c88.16.1794204334743;
        Sun, 08 Nov 2026 22:05:34 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e936bsm12513090c88.6.2026.11.08.22.05.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 22:05:34 -0800 (PST)
Message-ID: <5e0f4424-7194-413a-af7c-f6e74d07392b@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 11:35:27 +0530
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
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,glymur-camss: Use CSIPHY
 indices for ports
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
 <20261104-real-nebulous-ostrich-017e92@quoll>
 <72064a9a-1b2e-4c24-99e2-2cc15a8dd7f1@oss.qualcomm.com>
 <a2d3190f-bfd1-4548-aba9-a186cfea878b@kernel.org>
 <c5af7192-c923-4fbc-bbfc-7f03e310fddb@oss.qualcomm.com>
 <fc9acaf2-f214-434e-bbe1-88e8e1af7683@kernel.org>
 <539842db-c672-4549-b861-4a6f3be47556@oss.qualcomm.com>
 <d586b7b3-675d-48a8-b0d4-564e571ef69f@kernel.org>
 <CAFEp6-25QrLAF=-KgGJ-rC9pDpGa2YgoQAMKxU-FoByu2CJpMw@mail.gmail.com>
 <1db9bf48-01d8-44fe-8dd2-7a3c84ecc556@kernel.org>
 <CAFEp6-1fSPP41cVFmu8=0z2xibDpHuH5Lxrw7W_rvnt+Fw9EpA@mail.gmail.com>
 <62fba00d-831c-44cc-8d3e-083a95abfbe8@kernel.org>
 <qKk3s6LA2dFNbAVvrsOlf17dn6zizSiyVMf1rJNQOvkvLGxswT_81cDlITq0atMX71Sw0VZu6u9WHK0fS1bzIQ==@protonmail.internalid>
 <CAFEp6-2_opRq3pj6S=2nDFxXBv0waeyGBKSxp3t8OOe6vvKcoQ@mail.gmail.com>
 <3df59469-e665-4901-b4b4-512604194ddd@kernel.org>
 <CAFEp6-0keBgVWbBPCghkxMQAQeLeOHW8By7sQrqhjSGtJaZmEw@mail.gmail.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <CAFEp6-0keBgVWbBPCghkxMQAQeLeOHW8By7sQrqhjSGtJaZmEw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAyNCBTYWx0ZWRfXxaocEaOpADRW
 bbVSHRHVi8IBOydk86QVXaIgp8C5tZy3ni2ttqoyfvBkLw/mF1bD5MiehRArZg8xQfDayPISbfR
 7XHOYDIbTnLPObBepufnWWF4PGRD7zun2kL9K1K1zeaQ0tWPFlWdsAswDzkC1Ed+4BZn/RgHban
 bmLbouUKYduBwd0ZoArqTU8QzoO2oq1TjbhpH7W0N1wg5hy3ofu1y43DwlqaSdMag+HCms+wl2a
 8pV6lS//jpTV6EGlQUS0oKYGgTrBsZwY/lcrwZPUQohLyG0bWA3a1g3tMJ1uRe5rHp6YGyHn9uS
 KmXjnNoJrz+UDFuMgQN/7ODvlb/9mE6iPz8/iYan8C0smXRzpb0WxNiwKFB+YpcGE09qUNl/zKY
 9/hWje7MmUO3l9aQ9Z+op773pDXQuRkN3Fooz21hMebSWsecrgPcHJwSAH1/s9vMhc9Lw+Y2XpA
 yH6BsY9uRNdzpwfmjzA==
X-Authority-Analysis: v=2.4 cv=WOjqzXsR c=1 sm=1 tr=0 ts=6af162b0 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=CJrH0-i5KYxoBsuygRMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAyNCBTYWx0ZWRfXwcv27/SiICsI
 dgJoiWdxP/o7/Q2CO0MPdhSz7w1UTdu6rWBtsVhF6NDG9LoQo+wcy0skAiQuRJpcRMOUVWUBf2O
 BthH314vZOdVU/fr6F8DSWHj1XYSq58=
X-Proofpoint-ORIG-GUID: nSbdpLsCQjoC15tSfgOyS1cVrHzIWESb
X-Proofpoint-GUID: nSbdpLsCQjoC15tSfgOyS1cVrHzIWESb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090024



On 05-11-2026 21:48, Loic Poulain wrote:
>>> Alternatively, exposing logical port IDs such as { 0, 1, 2 } also
>>> makes sense. In that case, the driver would simply maintain an
>>> internal mapping table, for example mapping DT/logical ports { 0, 1, 2
>>> } to PHY indices { 0, 1, 4 }.
>> The media-graph informs which PHY connects to which CSID. The
>> port-number in the DT really only identifies the fact a PHY input exists
>> - it should be considered a mux in front of the set of CSIDs with the
>> media-graph being the route.
>>
>> Since the route is runtime selectable, the media-graph is the boss, not DT.
>>
>> You can try this on any CAMSS device right now, PHYs connect
>> independently to CSI decoders.
>>
>> PHY_NUM_SEL is derived in the driver, not taken directly from the port
>> number: the port indexes csiphy_res[] and csiphy_res[port].csiphy.id is
>> the hardware PHY index, e.g. port@3 on x1e is CSIPHY4.
>>
>> More work should be done to represent the fact-of-life - the mux. This
>> was discussed extensively in the standalone PHY series.
>>
>> The ports being numbered with the PHYs was a consequence of the PHYs
>> living inside the CAMSS node - which we have the opportunity now to
>> break with and should.
>>
>> Port number in DT should just be a linear 0-X for the number of PHY
>> inputs. Which CSI decoder that port routes to is still a runtime selection.
> I think we're all aligned on that. Point was not about describing the
> runtime muxing or routing to the CSID, but rather about describing the
> CAMSS PHY input ID/link, which corresponds to the input of the CAMSS
> block (MUX input).
> 
> So yes, we could argue that the port ID itself has no inherent
> meaning, but it acquires meaning through the convention we define,
> since we still need a way to map DT ports to CAMSS input IDs. What is
> really changing here is the convention used to describe that mapping.
> So, for Hamoa, ports { 0, 1, 2, 3 } would map to CAMSS PHY inputs { 0,
> 1, 2, 4 }, while for Glymur, ports { 0, 1, 2 } would map to CAMSS PHY
> inputs { 0, 1, 4 }.
> 

Thanks Loic, Bryan, Krzysztof and Vladimir for the discussion.

Krzysztof, understood on the DT binding concern. I should have got clear DT
maintainer agreement before proposing a binding semantic change, and I will
keep that in mind for future changes.

Based on the discussion, I agree that for standalone PHY CAMSS DT input ports
should be logical and linear. For Glymur, that means using ports@0-2 { 0, 1, 2 },
and keep the mapping to hardware PHY indices { 0, 1, 4 } inside the driver.

Krzysztof, does this direction sound aligned to you? If yes, I will respin
accordingly and make sure the commit message documents the logical-port to
hardware-PHY mapping clearly.

> If you look at the mdss_mdp ports in glymur.dtsi, you'll notice that
> the ports are associated with their corresponding INTF numbers, and
> interfaces that are not present are simply omitted. As a result, the
> port numbering contains holes, for example {0, 4, 5, 6}.
> 
>> Honestly I don’t see much value in continuing to treat port numbers as
>> hardware mappings in DT now that standalone PHYs have landed.
> As long as it is clearly documented in the binding, that should be
> fine. We will need to introduce a mapping table for platforms that do
> not expose the legacy PHY numbering, or otherwise derive the
> corresponding information from 'somewhere'.

-- 
Regards,
Nihal Kumar Gupta

