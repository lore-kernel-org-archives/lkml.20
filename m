Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793794968;
	b=kifMgnpAyAvKLEAqWv3fJKwMNgPB69fatuCDj9j5is+JBiIq/MAVM1UMcecG6Lw1vTNU
	 2xPGDHVNBrhA00p0oYw+j1kJnEPwKp6vhDVUApagFczZ8fgt5sYnc/1cxKTaZJ5WwmJiF
	 T3rzucz1lDpGDeCfTylEngtNVD6HGjC7kwmGFbFal4rT49kwqs7NQvDIlgDithfBUVXQu
	 U7OYi/sB1965zhdOwgdNiJY0RNioaFm8wi5OFFwCGNTP0DUCSSQ4aZSiKS/5XD8jju8pK
	 05z+X3YkI9er6qazA28usAkkJivRqMejMc/O3wSMtdLUS3+Uq8WeEXZZSnQr2jAE3XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793794968;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rht0f/oWrWjTnOGn/C9y300E2QsF7Wp04C0cb+p59CE=;
	b=UwJ4iahk4FpeUKNRhg8DJVLnwr76lRd+5qEhnUT2HI20himeTVAuoOjgeHV5T9vFuuO9
	 u5hNw4dGiAintmyt/QIpC8ANAvyh6W5LE7sb/GGh1dm5kY2XfQ9SWYvcNBt8ISucs8NBp
	 aTYEsyHXwwVj7OI4n2Ro82zSbvuayTFdjCvNEIugAQWPq7KLKJA8jsqSOxvb8L8Fef4fU
	 6+rwSiyEhg+oxP4FKB3JTLVYjmNi6+drksXww0vcPAs1iEiY11iWpLcKm5f4nX40lMMWq
	 NADYv5/pRBggCEIq9YKRS3w6ThGNzVU3y3dRaByK+6ADTK69S330Yzjz1a4uuani3xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oALTAcXk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AJgJ6RU2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB33606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AB33606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oALTAcXk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AJgJ6RU2
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZwkj119391
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 12:22:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rht0f/oWrWjTnOGn/C9y300E
	2QsF7Wp04C0cb+p59CE=; b=oALTAcXkLMxJZH82YR/E8oEJjAXU54X7v8d8+GVW
	Sc4kR793PmMP/dd5+Jx9SjOqmy0XriHDnIuzzMJHPMuTJVMRaoQwTZfhqB6v5sMa
	IorUNMrHkn9QiTuw3RWlTs31XzzDF2eQDBQeuI/v5k/ptUU6z+sDMicz2yw6jGI1
	rRoUd4I7yrcFlJXV6MlATRmsTFOZ+Dmo9TL+I4lCVmvXIsNKQXiElDviXnBvsape
	4QK1uNEjPXHmOWrdonleCa0azyjX5QmxXANgA+WSfcRoNL41QENdx9FW0U1yXW3G
	CiHMQ01ceYE7TK2Lbrtx9jt5ZbKbxsE9SEE9B1C26pnWjQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqwb09yaw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:22:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3adeba76cadso546075a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793794967; x=1794399767; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rht0f/oWrWjTnOGn/C9y300E2QsF7Wp04C0cb+p59CE=;
        b=AJgJ6RU2rLOmRuZX+a7xqXvHkAIRgJA9ZRrfUhmOTLcUxWksjSzSsilGLUCgeH2HgY
         JjTImsgFaQqn+ESUXysimgCCmtYHE7RopN3kXfNjHUQY5Pv+xfvE8vc1hhjWWL+MtNmL
         wjQY5L2DUEl9GqmJELoCwVPGynkK11rTN8x7L8v/KbIT2jLJf5bZacuN6yODUM3Og/Ql
         9ojyfiN5iB1Nz9qFWl6BMZPhaz0wA9F8jmfKzzuDYumzCLNqUv4+W4NpsKb4brWHHhV0
         WmyrwmOd/+9Jsrcadz0k/y4ej2X3Ndehyb+rE6u1HJ4YZ/9/C7cWhsQeOw9vdgBKmzFR
         rR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793794967; x=1794399767;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rht0f/oWrWjTnOGn/C9y300E2QsF7Wp04C0cb+p59CE=;
        b=gyh3oW3jnu+hIcc5CI34pTtVE/99yUCjhPd2Phugc4fHxAkL/XmALvoiKPgCo8w1up
         UqoZeuPgP8gMwUUtCE2zpmDg+C/tMTGJUDRT/exw+V+kQ3g5yb6D7JtRBp4ZPy3zf7w3
         ze/kSvnQ6bqUPrKipv5+nGuw0JDjqK9Hc8P+cWpZ4fptet5b7PtMgvYxycjwpeRK0tcW
         sx9yISLGwmT4syqi7pL/lNLiRgJaNqdM3Gce2Bnl//LKsM1cl7jDKbq9fbJmm5sRQpHG
         ZOhBqNjyRwWcdqvvsFORiByG1FVU5D8hlURcmSzbDpE4AVVwvWb1roYSric72awmjYDn
         0fmg==
X-Forwarded-Encrypted: i=1; AKwUvBwkZH0pyrOzgbnQef4L6A6qj6dcMjp0pZgcG3zldHBV+3Ne3IxJnleceJrlYg4uBugHf8Cc8knhR/XtXTA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0jgvA61XZhEOeDPX8YUjh/sGZqumdUjyEydjCzYOsVFEZazNk
	KGMtkYsxduNIR2IAXJmfNKzOXODitBKNfe4LcoBL45OygQA/5jacsW1eWx2zaKYu0qooIPlto+G
	kBvjN77DpzX4YO2BhVELG0YsaukYTQCsdfyKnm2C/pYrYCzbnE1PewZc60OckS4JpYps=
X-Gm-Gg: AYBFou3vmXUFDIPKepdrvXqgJEkpCp5w8z1Pc2jIlaHdYDd0YX6PR6wOKqiWN8P/JpB
	71VA1SS81wc4oHay+1gfcP607RNzpas9iY0PCdcnotVJ9If9dfYTel+95QOZQJN8zPQb0T5nksN
	IE6rQAviyjLqP1ZrSWVAVYXOCk7hblg0H/F5Vbez9+th2/pKJBHIJ0EgY/sXFv5dAxdNv6V8x4O
	/iRF1WcKdCiIOk/H8xWTEzLCYoO/gsP7708xJtF641UsJc0wjKtTMFcFZrFx7F82E7mWC+ARnAt
	Sybe+IngBovv10cLLleyrE8ZfPwCQMXlSz6HC/UGtb/x3tkbhxaRk4S5OxTlry253WGJo9SvVvG
	9H3BgxBYFNVfnbg1bQZ3PJPOKafPBuLHIH0QQJG0+jOAxQKSHWD1kmaQP/2bKef7nccfGT8T1tU
	XrS2oo/DRT6YboWw==
X-Received: by 2002:a17:90b:5111:b0:3aa:f2c4:12ea with SMTP id 98e67ed59e1d1-3ae896f546cmr12767057a91.20.1793794966787;
        Wed, 04 Nov 2026 04:22:46 -0800 (PST)
X-Received: by 2002:a17:90b:5111:b0:3aa:f2c4:12ea with SMTP id 98e67ed59e1d1-3ae896f546cmr12767039a91.20.1793794966293;
        Wed, 04 Nov 2026 04:22:46 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c9928d1sm9513731a91.14.2026.11.04.04.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:22:45 -0800 (PST)
Date: Wed, 4 Nov 2026 20:22:39 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] arm64: dts: qcom: nord: Add Ethernet support
Message-ID: <ausjj6ScavYiYKWo@QCOM-aGQu4IUr3Y>
References: <20261101080413.1428016-1-shengchao.guo@oss.qualcomm.com>
 <20261101080413.1428016-2-shengchao.guo@oss.qualcomm.com>
 <658a44f3-219e-4810-8931-192a26ebdc3b@oss.qualcomm.com>
 <aurl7S0IEOeNHDo3@QCOM-aGQu4IUr3Y>
 <02ebb6b5-4f74-41a3-b6ba-bd8ff24ef000@oss.qualcomm.com>
 <aurv-mqf4MJEiuF1@QCOM-aGQu4IUr3Y>
 <26bef7c3-3c5f-4f9d-a9fe-bde9607e532c@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26bef7c3-3c5f-4f9d-a9fe-bde9607e532c@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfXzjpyNwbED2UR
 sOeeTRcbGnL06NqIjxB+D2x1FaVLnKUPM0W1/jCwkZRZnV83mZJdi2Uz1FiZmo26y4/IR8x9vYS
 5xp+GlVJ73s2Pw+abvEH5pAOnJkNflU=
X-Authority-Analysis: v=2.4 cv=OfINnRTY c=1 sm=1 tr=0 ts=6aeb2397 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9PWAzHYUss3Xwi-i11YA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: JFmJJC2PLVqFcsTh6WQaulf5nPaMQB1u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfXxxsUt1SmIIrW
 IJEO18SDxt1vnwVJixFybKJBLz/wuy8cVi1qkZu1ZVzwE1JkdiBmVUIYNJfwpf/Lu7DXIzotizJ
 IFZwvk59remeBXp2jodKqQXa0BHuvfRGfxxQOPPw6vmTibnWX9gYFtRuYlYWdFVTxJrneII4bNj
 oozY58K89X1zG6Bw2oNVvgjF/A7RLdrqRoRKcehNQJnhn5WmNYGyupphSiORkhmBcFHKiVY1ZJu
 KAQYv4D+KkSK03iCq5TCwFJ5T1Cpu/ECDnQFjgc4B7yTmuIeioiyvX9mM6XfddBew5sdRB1yaje
 E5aijwbdCq8KwFfMkN6fFvgiLZRjhYkB5ebpDA9+P1BhGlfiPYpr27V7qf4ch5rj+dnEsSBzWeV
 S+nn6CFAt9miFE1MqNAKdc8S0pZMm+mIxhDt9ybq7ZFJxmIvzkzS/LN7bRlFe/v4Etv13Jy1L6t
 jgu3/6SNytgtOnzDN9A==
X-Proofpoint-ORIG-GUID: JFmJJC2PLVqFcsTh6WQaulf5nPaMQB1u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040049

On Wed, Nov 04, 2026 at 10:04:00AM +0100, Konrad Dybcio wrote:
> On 11/4/26 9:42 AM, Shawn Guo wrote:
> > On Wed, Nov 04, 2026 at 09:04:33AM +0100, Konrad Dybcio wrote:
> >> On 11/4/26 8:59 AM, Shawn Guo wrote:
> >>> On Mon, Nov 02, 2026 at 04:01:03PM +0100, Konrad Dybcio wrote:
> >>>> On 11/1/26 9:04 AM, Shawn Guo wrote:
> >>>>> From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> >>>>>
> >>>>> Describe both Nord 10-Gbps Ethernet controllers, including their XPCS and
> >>>>> SerDes blocks, clocks, resets, power domains, interconnects, SMMU streams
> >>>>> and DMA queues.
> >>>>>
> >>>>> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> >>>>> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> >>>>> ---
> >>>>
> >>>> [...]
> >>>>
> >>>>> +	phys = <&serdes0>;
> >>>>> +	phy-names = "serdes";
> >>>>
> >>>> I believe this holds for both GearVM and embedded, so you can move
> >>>> it to the common DTSI
> >>>
> >>> No, this doesn't apply to GearVM. The SerDes is owned entirely by the SCMI
> >>> server firmware for GearVM variant. LDOs, clkref, reset, and the per-speed
> >>> PLL/RX/TX programming driven by an SCMI perf domain whose level is
> >>> the link speed.
> >>
> >> Right, but I meant the assignment to the EMACs specifically
> > 
> > The EMAC0/SerDes0 and EMAC1/SerDes1 pairing is indeed the same on both
> > variants. But the serdes nodes only exist in nord-embedded.dtsi, since
> > GearVM doesn't expose the PHY to Linux. Or am I missing your point
> > completely?
> 
> No, I was just completely sure that the nodes exist in the gvm one too
> because it seems like they do on lemans:
> 
> https://lore.kernel.org/linux-arm-msm/20261103-sa8255p-eth-phy-v18-1-b00cc2fa0404@oss.qualcomm.com/

Ah, right! We will likely have it for Nord GearVM variant as well,
so your suggestion makes sense. I will update.

Shawn
