Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD55649BD71
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818546; cv=none; b=PIJvQV9WYGvcdiRlMYMTeUFeSZLMX+SoXeqeLD51V/eBuGXBvMp0sBsvqFa/GMLV1Q5Lryl/qx2fNj9/YWurs4XfM1SGZ3N9juSJigW+xCPk/7KrRik2mnL3hmfhTpBlnwQODsjIGaB19mhRwpbkhDkVCM49plr8Uyrm+76KomU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818546; c=relaxed/simple;
	bh=OU/ZOZCUTF1a+9OBByGIJG7+kpK78IpdvczEdEcaEDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IctjO8WHOcM30ozVDC1EIEw636rREnh5CvBewr6Ys+c4hs73e13MMOTQaiWyD4sorSyzzHD1PE2dSggE0aEbPsIdTs1AYVtkeKxUXKxCsaqXitJYIGdwsLHQXdoMy66hwAFqckStWfI14r2Pv+kiHw9hC4thlsedduVow9d3xuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ntRNMBCl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UmJv89vr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ntRNMBCl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UmJv89vr"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0BuL1933337
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pg+ucC++OVs+P+7IDGhBwvltOq+8zBTV4xh2ZYbJjek=; b=ntRNMBClF72bd7xA
	PfTSDtBhmVN2vCR73iYXOFeVA9nzF3GeVu7FaPmbx6E3nCVPDwMdPW4IHvAWHMRb
	mxON3ieGHnygDWPoE66UxkDxeEPEar7p3cgdvu+U/HstUVANz4er6CFmZCRWlyLQ
	dHRdA17Z6JtXlZV24EwXMwniEMSB76WAI9gDgN43jg3nyH4BWOejW3kpbypp1E4g
	B9hHjmo3/jiq2N53gm+CSGiIUPd2pnEJF0Jciw3NBJpo5SCCapFKEJkQ+bAlV3uy
	ygmvPlqmC3IfnotLN18frROtHeo2g8IsH2axE1r3IHWhmSh6bQXmIE8kiiC1qZrL
	nfMGlw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8qtkjvk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:22:23 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c101b7f863so46915137.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818543; x=1792423343; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pg+ucC++OVs+P+7IDGhBwvltOq+8zBTV4xh2ZYbJjek=;
        b=UmJv89vrtw+qCn25BWa9GQisvFgyO+smlNRoE//j7iI1qOBE2tOeh52chF6jI6u6O4
         kGQ/4v9/ViNCsy57BDkqKblIBYOhy2K0yZS4S+R/+/EGIp5UIYOJnCqJnpS6f9nhYnS7
         OX8sDTNI16Pjbnk2DLzlA3m3lWGVS4THoQPAJkcalMt1sLj3jB5CFGu4ayXU4D/iyzpy
         WvjfU/fbOViGlZ1rBTcV+8c82+MTVgDMykJgB44AQ2CJKCDAgVbvl0khsBz8bn1f3aMn
         snRp/i0FHAWvDpjAyfvy2oK5sqmGU5AHA9E63utcynOr82ML+QmYL/OXt0kkqlwSxij/
         ySHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818543; x=1792423343;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pg+ucC++OVs+P+7IDGhBwvltOq+8zBTV4xh2ZYbJjek=;
        b=tILvW9y3wMe5Vw40a69RNRORNe1+GtR+yQFJlNwT7F/BFlGNpZt0P3joPvHMqh3VzV
         ISwfLiFxIdJpw9bCe+lcwbFquFicl0sVVoDPc7OFj4lxUbt5aqvz3GoF4iJu2LuaN4oD
         mXHzH4QH7HL9DGHBqGwc75dN8oSdBTqK4ZxGqr6aolL27gWXIf2WtuwyKk26amYavzdS
         t0grKaB0SeVy4C3OunPsjDI7vM4C3aWc6V40PSsZy5VF1YH9Z/5ehEIGZFFnDQoJ3yhM
         m/riiJFzYfFhrbX9OprsEEBZJwpkAIUc1nLz3PVmrs0ywiOjnyr5zo+pi8wngS2jtMQA
         HH+Q==
X-Forwarded-Encrypted: i=1; AKwUvBw91MmBmB8ES030lyiHqmT6TRiCNZJlruwERcigzGARrGaUt2zjN2E57dimxZGOodXj+Sa989bF6si2v5M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJeJHUh6oo5E1CTPmYRUwY/jQK5sNveqZ89nrVMmoaza7i6xgHE
	kwYVLvMxkZjEl3MMqgq2wrw7ooq+y9TdcN0iOr5ytPLeVE/qUXnzEG8w7ELuCb0gCGa2qUj3ohO
	1YmMNo2YPKBgNViR/7vayXdvFH1i+YICy2Cagsf4q3j+Sodv8B3ilT3KHfq5cOnpqcww=
X-Gm-Gg: AYBFou1HZHOjDfH2l//3yhXiMMKQEqnYRIXOo/Bn7TKi0rL6z3RAeEdZqeacGKTGyn7
	4p/MNno/iuMqAe1JasmWs8MADyXcACVytXzfaKzQkTBggM0KVSk/HmF+p29/3DgwoNai0sXHTD9
	LvpcWoIHmlt35uL+U8Ukg9gu35AQlRws0spoAmupRedSF4lNDCo3NXTr9xmnL0PO8Kibzwqn0+M
	+hbwi1G+dwiRdh1amP06jdmKCNyCMiIPZwy22GdFGwVUk2qR1Ik6Ra2LiQXofag12gqO6V38rEJ
	96S+xpdDZzubYYp/qPEfQytaUaz+oThOzBNrs0LPuHbUG5scKIDpcXENBIUiPgf8C/qzN5/1lbq
	ARcUmIVs=
X-Received: by 2002:a05:6122:8704:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5e9397db6b5mr1457735e0c.3.1791818543015;
        Mon, 12 Oct 2026 08:22:23 -0700 (PDT)
X-Received: by 2002:a05:6122:8704:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5e9397db6b5mr1457723e0c.3.1791818542546;
        Mon, 12 Oct 2026 08:22:22 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a74bcbsm478161866b.38.2026.10.12.08.22.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:22:20 -0700 (PDT)
Message-ID: <f7b698e2-e8cf-4ab7-a08a-40c15c18818c@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:22:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/38] arm: dts: qcom: pm8941: Remove superfluous empty
 lines
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <5c6619742e9203c7c54abecd7e714ed2906650a6.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5c6619742e9203c7c54abecd7e714ed2906650a6.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX4LvBsF5f40Ij
 3EXNpXMX+kOWRsma4IVbTrk85+mFP7egN2RqIsX+LXpA+OYs//Rqz9DPCKlEhEV1SU9uMD8ID2M
 URgN2m1fn2Fwiv2+iwbm9pXVip5Ne3fC4M/1viJfthhnW2Zjk+iKKiM+qxRCujPPRZhwgekYoQZ
 pZlvBglu7f2pI3Kjb4kvC6rYH6nNxrsfKBW8PQztbTMSKcKqnwTW4ny89eVlfzb9JwcjAGw9Zfi
 FLYjdsiug/nRy5huye+eWyHJKhk52+oblEd2U2oyYCdrOkMJunKhsGs1wiTHnNRnDQSQ39nnaow
 z9dWOo1cmDGoAbZjwVpdQT8t+x27IL6g4/V89PTf3PKCfwJ2T/QPzWU38g4mIkojWDMeJGHVf2j
 KMat0ylCVTPUJAfxJMp1pjpOW+CNg1tH61jfsK2bn8t+DJHqDj/KHh5h7uvkSzLX7Cawc8ePfUl
 UNeTaKvFp+jD+J/qWXg==
X-Authority-Analysis: v=2.4 cv=c8U+0h9l c=1 sm=1 tr=0 ts=6accfb2f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=bwAYAckmPWK81loY6icA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX6iVualAIWhOa
 4yevfXjqHcSOoVekbC31rIcQdBWR9xmC3mRc7FsnGaidxPAlqlbo/1EaS/jqyyx4r2iPrKKGwKr
 x3ugHor+iuTgDXqc2k+mLzjScdymtbI=
X-Proofpoint-ORIG-GUID: s0_Vg_brNyTc637t0ccQ_2JBKuYJmsY5
X-Proofpoint-GUID: s0_Vg_brNyTc637t0ccQ_2JBKuYJmsY5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There shouldn't be a newline at the start of node definition or multiple
> empty lines. Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
