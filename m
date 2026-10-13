Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DD7531636
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791906574; cv=none; b=QBWTQZc+Es/QQfbDvtWUimFzRQO4MREBy136el12uuWmxc11HxmZ3P+u6x7vgBBx/NXFMZND10t3Yf5mfC2BdWyUEPexcYKfd+Vfl2d0IVYJu4qX3WGtD5ePENlXLIRocSJSoRuP4iZlrwQmeQKqRrvRwKb1ZmYwqvdPzVOXDgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791906574; c=relaxed/simple;
	bh=b2JGE3Wc/pnPBuGxto2Biq32yDH94ti0M+PIkBvUGqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ohrsT+4bUHVoQjYSzAFyOeZRLYrn6HrLWYkuvZx6YUyLjAGIXCcssoBP0MHxKS27zfaSsJG2rlEIJf+cr0JnP0bRCmv8H1cXB7frURW29Uabd9+sMWVavP9nTolThXAK6ykMitxd+P0TeZ+jqrnlu/WKVxxUbLJFssWr0lQsoU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=blQ2afTq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EhgEh8JK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="blQ2afTq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EhgEh8JK"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE3Tml442756
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sTRqTVcbxy2qXaHDYwoiLfb5eqvuCDT+3z1fXqGarf8=; b=blQ2afTqo9hiR0IK
	xN1a3rxhXFKN2//MhwFRypdUeVfFStVH3xjIn6yRWLoBwENsk5xodtBlwr5VSuor
	ygwonH9bFdxXiSWNIadMGWmnKurcK2M5OseyICqWogzpQjIdO8gsK2xgog9lwo7E
	utAmomisVHmmdpX/Wt2d1xN2UQoV4k99bfp2SvSKujEVadiUopmRGQq3Z/Afq9e1
	FjtK0z6pUhZClp06DmZwk8NF4vkM9MhAO5KL9mCgDi6ZAekiS40PZHwVTej54jA7
	lEgs8hcUPRkeEFgNBiAptU0qRMa4NP90ux7HakfifYAu/723zUKOyDIEEYoTgUW7
	N1HexQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9n71gskc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:49:30 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5de7ad7cdbfso92729e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791906570; x=1792511370; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sTRqTVcbxy2qXaHDYwoiLfb5eqvuCDT+3z1fXqGarf8=;
        b=EhgEh8JKkugsZPie1WeR2i/HGYrQ7GKymR+4tN3J1wMEXBzd5tDcToTMViBoL1iNwq
         ojdKw8KajryegEarnqSRvsP4CaIPxXEBvu3II4zljfH5WaDhWujbJBULxO4xTfu4gFOh
         d5MwQOicQ7e536s6UqVw1X3CgGeIZMIMTirfeGZVPAyZGk6SF1W8WYxTc/in5JQqVrw/
         pF298YfawpwBXniKZ62SkCvZtLo+khD77NaL598agE3QthlTFZ8ZApQwLCynRVKZgJLn
         VJLiv9VflBzQG5wiGTYW5azKe5RxKWnOszgEFB/3U8d8ZSyRaDtzhljoUxY7sr1jprDW
         MW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791906570; x=1792511370;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sTRqTVcbxy2qXaHDYwoiLfb5eqvuCDT+3z1fXqGarf8=;
        b=MqfAeGgIef8/MaUpdGD3mVxRly8L1zCRtygaJVYhnBHP0EMgTR15MXAs/+9p7phzHb
         LNZvRsKfUW+YMqpH7LJuhu7vhV0/R3mr9ZDcIiQSTcsevd0Sly62aBS19s/5AYc4QlvQ
         SG/W5X1ThDiAplN3GVoN0utjWIwvcTYD1/RVTGKFsbAxLhQucbJPPz1ddU+8tM1YWNkT
         NmNWFJAEfvUkW6CGcfBZHiEA7wMrYynFteaQTrpqt/O1WFZ8jVvKyUk3vKBgpQEtwQzk
         Kin1CCJYk0CLMrY4GbX8LhO8X+zgeYC2OoRZxCTHG+Fzj8qjE4o7TOi1R4S5rHcwxys5
         zD1g==
X-Forwarded-Encrypted: i=1; AKwUvBx05LJ3wFMWPaNPvSxkwC3SlX7JBoGXyozo6EmV/j046CNBzHLVjTwSSj6ews4KZ89VFShxdrSXOEE8VE8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9bmhacFNkQytSEt0fstViX70Cw7u4DEyAyxiTvjUkWkn4RFki
	BJbgNLF264Gd8e+yFk44RzFEGdui/XMg/Ph3/aSLriP+fFoexeN7Li7XVsyaznszi34b0vr4vKW
	asw6QXVc0+EkQg4VyDHoVM68RrOkN7PWkQRaoFCBa87kKmvdXtCcHQG7TpLXWw15mr7s=
X-Gm-Gg: AYBFou26Aue0VvOenDc2ZnYePz09yeeS7ZqblwsgN8kJCiPoa++WXqgInIQPT1cktYa
	6rvz1HJY+JxxNFNo0QMuA/EVA+2V24f5UyQ16tDhQdLLbeV4H+KBiYfqRDlBcSvD7Fe41/NbP98
	65DVAG8PUFQ/Ca6X9JPt8y7wghe197xdbFCmJ7w2u6nj+HHJkvmgMMEHgrZquFGKlEHatfHRrSJ
	QzGO+uPtD2U+W3XDhXGgoQTlsvERcrpBGIK76XClmFemqM4X70IMgeDVOuamSn40PlWtsZC0K2k
	H4bghC64AfrKPVt4/YI/Co+VrX68tFWCGev5vmPYyKAED2LKEURzApNn9LlIo6HVF0YjF9I2Im8
	9kAOXiIVE6iLWHOJqns9+Rw==
X-Received: by 2002:a05:6122:6857:10b0:5e9:6763:368a with SMTP id 71dfb90a1353d-5e9676339a6mr439156e0c.2.1791906569838;
        Tue, 13 Oct 2026 08:49:29 -0700 (PDT)
X-Received: by 2002:a05:6122:6857:10b0:5e9:6763:368a with SMTP id 71dfb90a1353d-5e9676339a6mr439146e0c.2.1791906569404;
        Tue, 13 Oct 2026 08:49:29 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a74c48sm605802866b.43.2026.10.13.08.49.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 08:49:28 -0700 (PDT)
Message-ID: <77b5681e-21e7-4a93-ab35-15554f7637c8@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 17:49:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/11] arm64: dts: qcom: ipq5210: Introduce RDP504
 common DT file
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
 <20261012-08-dts-v7-2-77bd3d68d850@oss.qualcomm.com>
 <5cfe6767-9097-4005-a78c-3066a2aef1f7@oss.qualcomm.com>
 <3fff91c4-b831-410f-a151-847ea407acb2@oss.qualcomm.com>
 <78480c25-6d83-4e70-a9f6-826760046cda@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <78480c25-6d83-4e70-a9f6-826760046cda@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FuqQbGrq c=1 sm=1 tr=0 ts=6ace530a cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=3JqDGoTLaDOw8MreyBMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: RRBfo9E5s_PqgezZU371_VJMYJ9VhcMA
X-Proofpoint-ORIG-GUID: RRBfo9E5s_PqgezZU371_VJMYJ9VhcMA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA2MiBTYWx0ZWRfX34rlIkWlU3XR
 VcZ9Hxv/xBXXsQ3cCmix95lDjJCRlc6/xVVFCD/uz5b7hYf3SPWQF6n67NfiVAu04HkUI16Gehz
 NveMi5LwwJEbe53O6e977B60ZzZ5NTiDYHaKz02UeiHCMP5k/X83IMP01Y6Xe+AW6QjJRzryo9h
 VdtsZdImP7C/BDwkexHcNRxMpi5TVVN3NTF3ILN0VDEGyEqdxEQKAMCldTrhaeRaJCIht/QiRCy
 OVSPZWztMqKHJtoIaPjDvEUckfYMw+Gf4enmnHDycLEP3IrNWEjAJQfk/qNCS8qTaYo8RqQrHtI
 PlB4vVN5g5mAtFirGY5DpJ11ho324iisfGCQUrYK6uNhf+rZ6oVX2TuVzWf/VbwccO4E4qAG8IK
 lNLw03C15wGOADmQlTGA7XB+C1UEp6UfHvQvCFRQ6iozyOl992rqzbt5IxqdsEQY/hmbFU1yPz4
 yQgfUHHoVXGZ+aNjEWg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA2MiBTYWx0ZWRfX9d0yVYaOQKxk
 eGQdvy+P0w9STb6XE+35sfQ901xJue9f+2tW1XlaaQcagnsfpm9gc938/8C42e7ds95kcmrolP2
 YNPapyA6FLEDJdsiEkzjW7DHtl01Pj8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130062

On 10/13/26 5:16 PM, Kathiravan Thirumoorthy wrote:
> 
> On 10/13/2026 8:11 PM, Konrad Dybcio wrote:
>> On 10/13/26 3:14 PM, Kathiravan Thirumoorthy wrote:
>>> On 10/12/2026 12:53 PM, Varadarajan Narayanan wrote:
>>>> RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
>>>> share the GPIOs. The board has to be reworked to change from EMMC
>>>> to NAND variant. Rename ipq5210-rdp504.dts as ipq5210-rdp504-common.dtsi
>>>> and include it in variant specific DTS file.
>>>>
>>>> Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash
>>>> and required pinctrl states. Enable QPIC BAM, USB and PCIe for the board.
>>>>
>>>> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
>>>> ---
>>>>    .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 209 +++++++++++++++++++++
>>>>    arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  66 +------
>>>>    2 files changed, 211 insertions(+), 64 deletions(-)
>>> [...]
>>>
>>>> +
>>>> +&qpic_bam {
>>>> +    status = "okay";
>>>> +};
>>> NAND is the only consumer of this BAM. Should we move it to NAND DTS?
>> Can we enable it by default? (i.e. is there any reason not to?)
> 
> I don't see any reason for not enabling this by default . Since nand is the only consumer of the BAM DMA, we enable both nodes together to keep the unneeded devices in disabled state.

The first sentence says "we can", the second says "we can't"

Konrad
