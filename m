Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AAE3914FF
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820934; cv=none; b=PlO8gR4vph43TfQHemisrCZR5tc1mOwglffPE9EtlZOgCZvzpRcybPk5O6bXLQLKyRM+rpTdf7lz6648hMvwLVgYEv4D1F5GstDFpTHregROk+iWiD1+K/PhjFLVIgV9SXD9W4b1Z2DJjP61DYQo8k3wZhi/z+KcXt5flVKXDLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820934; c=relaxed/simple;
	bh=2RjDGaBIt9UpCsIrhhyUdlCRXMviK38qRoAakOzKOBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OS/vCldVf3vecdi7ojtiavQ8dgD2TNca0GAEtZfprvQCw2fa1cat2uFJkKAZh5cpCV2emlaMGZIVIFGDGoT62gju0Tz8hzZpR5p1QM5xfSy4hblixvrY3AASE7CpdWOi4Q+X3sjP1rYEOMOlDtfgCif43eCYVV69zWap0zzZuDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bkbucb44; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y1HIDQ5A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bkbucb44";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y1HIDQ5A"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFexmF1895581
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gyByxyOQ8a0f415k4TSij77SdQVIwV0lR/nDvlbYRAA=; b=bkbucb44LiOp9kmQ
	qGRbEZUyO9umgF4oWHpmy38uPyfxWf5aW7mT/d+mG1anXeDz9uNZRNn37wwkFqBA
	R6Cdwumqd3FcdZ+xxqoVYiTOJJn3ftU5OKnPpQR8N/zuy0Noo8WdrZp5RnJ9wTlJ
	G/PFo38Qo7XUcvPvvHokJakAc3tlDaro8rWnmaRpMVceZ0Y1HgFMhqEgwyOsLI+4
	CKzknB22nh1stQhXijTkhje/2hUvRBXIo5B8wYX3ck94c6vJlZvpGjaH+mjEO5D4
	LWsgBbJGaTUGuAEJxAKNrTB7ww+Jc9QVU9OhgMua3heH1haOyLX86y3nNyAMY7j8
	2uPR/A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8v7ksy5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:02:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5350173dc7aso4472301cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791820932; x=1792425732; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gyByxyOQ8a0f415k4TSij77SdQVIwV0lR/nDvlbYRAA=;
        b=Y1HIDQ5AH1yIo+rF+HHwlh3+iGURRQvPus7SYLdPVxZspdOLylBtDzUq6pRI3CwjvC
         3KV1/HgsFlYhpkRHw5pFPSpFrWAk0texHrQZodE6rqIxQigLH3BtbV2iNjMNKYSfTPD/
         liSjbmYTV6fp4dk/It3sW++tZlromMLFH7vptjijQRmMzbSi9LZZ+ediv9loeTQry3/V
         khFb7sJaIvZy/D4uE2fWvf6GvCtbbDjqC5s7xFSW8d0FOUS1oQ6vG8XIIYKPZO0c2v6Y
         8wi72HTKH8DZYBKI2c2HgICeMHE434mUiWQRmr8LHEfFXKCIK5W88X6J125jQsqPLHJZ
         M+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820932; x=1792425732;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gyByxyOQ8a0f415k4TSij77SdQVIwV0lR/nDvlbYRAA=;
        b=YeldZUBAie05aRiKiPe9e9RUYK5f6D/esQU/fu02leUoog3m7lliinEGugn6E4UL7O
         migGm1r3yUqDSm2g+LuoqIRJ22z0Ge2vFzcJy0DxYO8H+OIeICVEb/5J4sg4T2P1C3x/
         ISANLbxwL1K8DhmgdMpNULQ2ubFs1F+XsB7v+F3dOoOBCH5rQx5pXf4XcyoNjnikaBtr
         npyocoTWm+plbe+99tVCQp+LW/FNXRNuDPJKA3uGxZPFpinj2UpA5YC97/sJsZH3hXj3
         qQdpWmo78T+ECgX1QRBjAvWnfixckIYHZw2TOKFVeAaogd/cRjpSua3SSiy1dDaP8vKj
         IRtg==
X-Forwarded-Encrypted: i=1; AKwUvBy2JodsmVP7LovOFTWvC3wxjZRNo2wGaTPjilAQ3l8YsgwpkSkMlkB1oPxI74wqoKaVgpTmGX1ERWhSJ4U=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbEhbkUmDeXRSGioNAfAZjFEY7qBnb43JqFQbAgpqnooZ92wUa
	cqRDIBiZHX9S09bONkhwNC2QGwRIPcHl4tVCK2ydD9gnFyycZQFSImq8fSTSJLtOiQNVfFscGWU
	hQ+25iC4ucBHC4LMjpKFm060gGf/bI451LPz/mgG/jhdEP5mcARgzccCNVrJLhbRVsTM=
X-Gm-Gg: AYBFou0M4frGt9BA1pp3oItaETPXsH6WIQLZH7K2asjGZhIqMb2cPr0+iNIhlVv53Qa
	lUXhCURAuyE8UbH3cMecssDIJ//ZahWAH62wCVBPfHYEzqQW69OHsInFg75GmieoR+Jq0HkGQGL
	zAZdlxqrhk8KCCVX0LnjLsbhDBNYQzy0SJLGqEnfH8wRf0wsU9Lz8pgfE+IL2lGl/wu5IOuWx/I
	X5pHn2qHrjCJJOmbXraRfZwmxs2mD9YJ4vJmqhjB+AXRaV9alS/7Fak74LRQgeb+ZYQHjFjW+pe
	hRzdfhnOH4rkl1zVilQOrWntKHf18fgngFWBRXu9QM4tjXPEvMhgJr4xKnkYblGZfKOMVL1w2TK
	5H3zEoTImEU+SAeAfxSYJng==
X-Received: by 2002:a05:622a:110a:b0:535:1a6:6e93 with SMTP id d75a77b69052e-5359f4e01bfmr192065571cf.2.1791820932041;
        Mon, 12 Oct 2026 09:02:12 -0700 (PDT)
X-Received: by 2002:a05:622a:110a:b0:535:1a6:6e93 with SMTP id d75a77b69052e-5359f4e01bfmr192064921cf.2.1791820931537;
        Mon, 12 Oct 2026 09:02:11 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c353bf3a541sm110415666b.25.2026.10.12.09.02.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 09:02:10 -0700 (PDT)
Message-ID: <a8e6e9b7-ca66-4969-bc34-99df34058af0@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 18:02:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: qcs6490-rb3gen2: add the clock
 controller
To: Alex Elder <elder@riscstar.com>, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: abelvesa@kernel.org, kees@kernel.org, gustavoars@kernel.org,
        mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
        danielt@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Thompson <daniel@riscstar.com>
References: <20261012152408.3729237-1-elder@riscstar.com>
 <20261012152408.3729237-5-elder@riscstar.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012152408.3729237-5-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX/MPnnPlNgwjc
 ymS2XWpzw7hw8xYgzc9vAoBi5y1QBdf8h9FPfot9bOgC5CwpbXI4TLBNgfiEQE67Wr6t6rvdV3y
 vpwl9vJ12q5BEKHONugkOOWwosV2RTzop++z0wS3Nw1sT9b6/soU8LAxj2fahE+MoLB1w/XXr1P
 hs0+Hcid5uYgYqM+tf8csr1zeksvNbzSDmq4oCjLdnUMoQoWerNoWOC0Gs/zV7CzQJ4drfzDxdr
 DuptvX5vDjlQPea8KqC2bHaUOUDrmyxRFyMuH8M3tpDJSWFzG4CP535J/l8U9SwK7cZVEzRoCpS
 qBdZQ3FXngWYSOAjDVR79LSYNXLhSMkCv9BYDbkDQLukEEDkVuAHkc3QGQGyMjaYlEF2fsac+1c
 3RAVWDrmuSLe9Aw5P0T60Dsgsw98CKyA1kH6aeZoxdQGcBbsqBtsJbz5vsr/AgtUcMBB4+Rv38M
 I77NPKX1QqzqdENci6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX1WHXFPrj9xcI
 poWuFc1x93yblshoXgkRdQcDMCUaS/iU9yVN+ih9dl9Q+LqVH3+FwbQyhX1VSNrSYz2f2LCbqEf
 O5DEe0r83uy0sg78gQh4Oku3EZbHf7M=
X-Authority-Analysis: v=2.4 cv=VOtIDNPX c=1 sm=1 tr=0 ts=6acd0485 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=ee_2aqc6AAAA:8 a=WjKZ7VJ2YQ59rNZOuecA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=dawVfQjAaf238kedN5IG:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-GUID: X4hVaceGwHtC8LMo__7vPYufmn-B4JVC
X-Proofpoint-ORIG-GUID: X4hVaceGwHtC8LMo__7vPYufmn-B4JVC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120063

On 10/12/26 5:24 PM, Alex Elder wrote:
> The clock controller within the TC9564 SoC is accessed via a PCI
> endpoint bus through BAR 4 of the first embedded PCIe function.
> A syscon node is created to provide access to a range of memory
> that is used by the clock controller and shared with other devices.
> 
> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---

[...]

> +&pcie_s1b5d0f0_bar4_bus {
> +	syscon@0 {
> +		compatible = "syscon", "simple-mfd";
> +		reg = <0x0 0x2000>;
> +
> +		tc9564_clock0: clock-controller {
> +			compatible = "toshiba,tc9564-clock";
> +			clocks = <&tc9564_xo_board>;
> +			#clock-cells = <1>;
> +		};
> +	};

It's the same file - just put the node under the ep-bus definition

Konrad
