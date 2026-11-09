Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216430;
	b=Du38E6UZOR6sbjSbivEn8Zs3EmPVDI+Gm1Lucw07oKhmiiSfjxbaISqRL2zyjbrnkd0c
	 EkLtpBKD4N0q7bo6nQw8XDrh90T6v5QbbDBGUShNewc3VSl6x6Wm0n2UqUmLiQorr3Xhg
	 4eGpvaRvd11dSNzcmrGosR4QjG3D0WqSXeSR1wLMLGeGunKgDKnw+J8b2j8m+xZv8BZit
	 ZM4X8iqmXJ+uYisivTLA0hEkUSmsb6b7/m/nWlz1pVHE4KBEsYhHycu6Z7HPNPat3vl9j
	 UvT10aWQAXDITcCmw/PeyHUZ/j7tV4KE+lXKQOh9CF7R+QtPkhxDS2yBXpQBV+R0FoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216430;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=k98AldNnLDpToTE1usQ6ljOvdKlSyqcs1qtKA1cJ9KA=;
	b=o7+l9lOV57s7rA0RnQPzlr9YCmmONUH+hTaQW0VWHI+C/obJk8kx5S+OG4YTmzarHi9S
	 tnjyQVU+AbNwmh3St3YKJM0sHFgB0glHANBPriYkADsuAgnUUCK1bhTh7l+e5lBBctmsF
	 AxscIAEYQpwxUDj2jV7bUc6TiuZ1RtsoYdTgM+6pOQrcNNxQKhR2F6Doyzpripdc7xGqT
	 FZuICCC5uH1+kTHxg0dIo759i4MbmIHFqdRB6ZYxpFJy6vxgzhek5VnriFthllM7XE6iI
	 rHphIEL59KhsN9xXlkgRRjM9tKTRHeQHSbqT4HH8O4qF9km1+bgfez+/9U+B2Roy4lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gKMQwUUU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aS+CbvMl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4000606A335
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4000606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gKMQwUUU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aS+CbvMl
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96A2CP481139
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 09:27:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k98AldNnLDpToTE1usQ6ljOv
	dKlSyqcs1qtKA1cJ9KA=; b=gKMQwUUUEeo+I3aMqxy/wLQMDWMf3z2dG+pM9i+I
	V9+diFjLR/XeoZNRr3PTTXwE+xloGrPDuuhtRIEePQt3y5Tq92n6Z4K6PWB1wqYa
	NG/ieTLs4M0FJisJp79ntwFPFDLyfBsasZ8wYqZvsS8pdl6K+yYBLCApF/vf/lmt
	vluuc4pV2/bi0p1Fb1/AnqRXtODTQ5/TTZSLoPGNAaq1vIIf5Ue8syUDRdqXggZN
	SkCqZ/9YDkZxPyGmbrAAnRGS7Jq87wm1yrn5OQUS7NeLEoSe8CfFGN0KA5tXpTI3
	N5YDl3DxaQFfBXRDWnPlLZ8cVn2sI00GydtCUfFATo1dPA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hstxsds3q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:27:09 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99b8fbf29a9so338178241.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794216428; x=1794821228; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k98AldNnLDpToTE1usQ6ljOvdKlSyqcs1qtKA1cJ9KA=;
        b=aS+CbvMlvbFzd0c0FE71ZGbrUiKGQg1bDxDPdeYpFFlE09m0vSOVQ6VTdxJ6dvVdHd
         PLt40791iu19ixjtx/1KALJg3yi1yK+2TGPMmp4yVg7AXvG5OCkIZaoHDJZKf1w5AgaN
         wA5pcUXPIexCRKSgeafNw28R1PurxkWeG/sGNAdp/W/PUmf/HbCH8AbmbJCC7tLIiRoo
         TTD5XXo9HCPMXHm7JXJ2bOUqKd/6FymIS+qyaVU+PMVHLRRc8v1Zp6H6pmwa/ZN9XvdE
         fLZZ2I9GLcRDDFMYJvOq/aVBJsRSFyx37D52POl7Lwvy5TrIbRtH3Nn7GJqGUIpFA7NV
         9yEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794216428; x=1794821228;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k98AldNnLDpToTE1usQ6ljOvdKlSyqcs1qtKA1cJ9KA=;
        b=hZwvHmLkpZEZ7ZLhXlyHC85mKbiD/2TgmFgYQjtNPt40x7aG5b+MdMTkjh9uK7iHhZ
         wxPK/sPmQBNH0H4sTNMCQ1Kcgr8NLhsoZsDRmyf+sOGKvFgh3DlOa0ZNtQp+SRP6Avzp
         9AU/UoeLxp7mVjWKcDsJBw/xS/nZ22IKRQ2A5P3kUoU5qogk6tPh+U0Qrt+k921v5Okp
         q1nqdfN0rJ2EYK5VOfxN0AKA01TLFp+XjgqiiMiuO4QhERp99+RJ5+ln0qnnghidQVop
         EfZ0apS1c5U6wFgYsbpaoAs5RDOK+yVcHtm1BSpElXv5rdMkhtDRvwAaVfaFn70CzHLt
         1Ynw==
X-Forwarded-Encrypted: i=1; AL+hErFssYIQ1MzfJ2HqRcPv3yhaOm/iOdOV0dGzxrYPRE0SC7KypGmr34+YjL8QJbKTDraw55teBELcgjrDtYY=@vger.kernel.org
X-Gm-Message-State: APuU4Z95E+OOBOLPyhTfeZ5gR9r8c1KMxohrRAWXfUcJm5q0bzyRbADx
	COIaOw6pagfcZOrGkUYoHAqzBVxaBt7KMUqI8N9drlhQqSVzEaN7I7jzHwWivo2CexnU57xJEwS
	gQFzQm4QUItpWbMoLjhX8zn2P2jdldVBGdA/2maprtV3uUdqj4OcJW/F+gIAlvX+WvJU=
X-Gm-Gg: AYBFou0ivoce+o7ZPrE2LMjUCiRg4dIhytgc9aAAwZdHDyNBOkZFGrdWSur5i/+y2js
	V9U8Gv5dJqtF3cV9oJvfW5GSbN/164pAjEuo5qQxoE8yLLjyyK2PcBtQwhP6V78Z4s0jaOXkPXX
	KMe9jM9CbaWP/CO/lR8bXVm5YX/RhXy9iLcCinAHCNLwEuYwFtJJo1VWbSWIxETtXJT64AXhisi
	7f5bMDH6cz7wuidvG/0yiTtDf88DQuRDrKZGudsksUkoigyRw7pq5P6r40WFrj/22EjramYu+AD
	uS7so8m3r1AsnuXW3d5UNZxYJt9FaZT/K7u/uUjxaa7G/nDOKfuNqEXD/b3gmSZyZAEU71QB/Je
	Pgycf4cSkSenEY1q31mH5vY2Kx/bOoIkuonsv9k80XBVOzLJ9MfMG/BDnlfsAfh8=
X-Received: by 2002:a67:e702:0:b0:7d2:cdd6:6c8 with SMTP id ada2fe7eead31-7d2db13142fmr682420137.21.1794216427343;
        Mon, 09 Nov 2026 01:27:07 -0800 (PST)
X-Received: by 2002:a67:e702:0:b0:7d2:cdd6:6c8 with SMTP id ada2fe7eead31-7d2db13142fmr682404137.21.1794216426710;
        Mon, 09 Nov 2026 01:27:06 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597371cc4sm8477370f8f.36.2026.11.09.01.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:27:05 -0800 (PST)
Date: Mon, 9 Nov 2026 11:27:03 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Andrew Gigena <mail@andrewgigena.dev>
Cc: Abel Vesa <abelvesa@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>,
        Stanley Jhu <stanleyjhu@google.com>,
        Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8150: Use standalone ICE node
 for UFS
Message-ID: <s5rb27nhurw7arvnem4yec3z65oscezjvlj7flmywcjfqjgyou@25v7efso7zf2>
References: <20261104-sm8150-ice-rfc-v2-0-d697bbce0278@andrewgigena.dev>
 <20261104-sm8150-ice-rfc-v2-2-d697bbce0278@andrewgigena.dev>
 <dxb7s2d25ixowmfifhvetctpckj7h4y5puiai7orhkimgj7uxu@ekhwvpm536mk>
 <CANn8UmeS0Fvdkamzu0Cgbv25+WdjHsXvCLMpsL98QSo-Gd731g@mail.gmail.com>
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
In-Reply-To: <CANn8UmeS0Fvdkamzu0Cgbv25+WdjHsXvCLMpsL98QSo-Gd731g@mail.gmail.com>
X-Proofpoint-ORIG-GUID: bm4fttQ7bLU2D2PdOrVB6VtuAjr3UgG7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNyBTYWx0ZWRfXxb4Qb/GmzplK
 UxPv/FSazNEQ2e3P7lcmUl2IWI9U7Vw2ABJYW3SrshwI8IQjEdDJpHBr7k5IKUGpU0eKS0y2VBz
 gwdTSald3IHHBp3g8QS+/1WPFaQOqpA=
X-Authority-Analysis: v=2.4 cv=dZMVTnXe c=1 sm=1 tr=0 ts=6af191ed cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=n44UkhTd5bL0-s0LC_0A:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNyBTYWx0ZWRfX9oQ7cqUKGgzC
 5f4Jz9LW4vYabvFPDCEY6ds/L+WhSTR1tz5A5pR3G99mo1EDiAfa845KXwhwZFaVviILhs5PbR1
 cTfeUHWwBF3yYKGQe0IdLp6QJi00NjSH6wcJuMnXaVYvlSzS88PmGqu/cG6tVxSirBRnl9lxK3Y
 K7L7L9lV2IWMvTEYA5x0Km32KFbQFt0vuUMOQR6jXKjmfw95WWj6XBJqtIhwSnxIX3y97L84PCV
 usT23FLmrE5GgR2BvhrTrbVxREK6GRQdXpSsCV+1kPdCwVzYhBrKB/l4hXedYjbGr+hUSigfeSI
 o0LZBMYKYZ2SN3Z0ohkEQDp1/cphKDaMi1Kb6kigshRCLi9dONrHWHkeAE3lNHFrm6Lsc4KxY9Z
 VOhDy26ePnwVHQUoC9LWOBSKKrqnC+CfSinWZLyxQTn85Bfuvf0WTPZqiTz5cP96EcUrWZSLEHb
 ULGHpsSWj+0VsC5d7rQ==
X-Proofpoint-GUID: bm4fttQ7bLU2D2PdOrVB6VtuAjr3UgG7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090037

On 26-11-05 18:51:44, Andrew Gigena wrote:
> I understand, I'll keep that in mind for future patches. Should I
> release patch v3 removing the "Tested-By" now, or wait for other
> reviews?

OK, now you are top-posting.

Please read through this:

https://docs.kernel.org/process/submitting-patches.html#use-trimmed-interleaved-replies-in-email-discussions

You can send v3 now.
