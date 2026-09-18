Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF1D4C042D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726063; cv=none; b=duDW/9Z9sF/0oWrDZ3i6ByKonpuOVxnzuvTaYEGythZGbj4xYnb9mUOKj0T/5p+XudxPhLac519AXKtZdKJjczM9FbPG/fiEzw+gXOefDwM1Y2N1SK8DTYdAkNx8QWxSJJusqXGu3MOEzSiRTnEbIkIHssM4uhuWaRP5zgC7ZGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726063; c=relaxed/simple;
	bh=sXtgV8XIR6GTJEx5iIjPWXzdIUReRNQpTPU9/R0McPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N8ukf4xOoACe7FT7C8iPJeev+4xsvZxcjpQLD1Kr3kd2zgw9zWqpx07IfjbGcV9PfWQ4KczoS8YzYc5DwMkOPDaphGNtjY8dD+XvI84vR2n4HYaIchVvxcpVBtVZKSwkSEa6UpeuEBo1KJ3DJG8QWDI5EVkdIrHsif4QIb4GMDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lVuMsVk9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PwlmQd7h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lVuMsVk9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PwlmQd7h"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9eE9V522593
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cTJkcejpzyl7UHyeLK4klNTLMnqbEC9yIm+DzH4e1kY=; b=lVuMsVk9uP1WfMif
	E1VDzNRvbs09IIFxDOm+TLCQLnkYGKE9pzb29KEMJkbYJGMvQAVq6BmtUwiZ/U73
	+rosOfuy0ExE7nMz/T44XfjlGvZUMk0xMkPOb3mjYD26x/VHaAVUcFHrNsGIGDHJ
	SZ5TOUY6NHm7JvVVC1ndYmGr3qh7/XU2jmUK4c9697TUqy7u0HEpvaDzrHssGqP/
	3PBtAse4iP2wQ50Y4UQJQhly9ACcUnPR3fX0WfPwn8dnqcStNp+IEPkddfkUDBuw
	zKJ5mZrwZGzqnLz9bJHwB5i8KY6FYhhuc/pvI/Qu0b+N53m2yfFwY4i5nExn9ggd
	LSWfrw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grnqebcxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:07:40 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9103df70f2fso1541286d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789726059; x=1790330859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cTJkcejpzyl7UHyeLK4klNTLMnqbEC9yIm+DzH4e1kY=;
        b=PwlmQd7hbvDlCT/mqIrUhLrFkmxEyTTnS4EQKwMBrMIPFZGivnImdPFxO44DA08I1O
         5jWJc1KxRdMSGMgD+FBOXUWebDqbq70s5LdLFPMPufE3EXvaaxANVwLnhuXYAdCBlNCQ
         3fzQeVtqKuZ5tuH3g7BxEoZgcqj4dNtxY62ChEZr16QhwcbFQrRZXEpCiCCDPhjq9Pgi
         aKdQYvfvnITkZjMTO0ZvcGMlQEU45YO9WVVmd3r1jTCv03FW+YNOTDqOyygJk1KijoAM
         XrzvXLAgOq5qDlLPdJH6Ee364F2ayPdO7oYN01SitvEUV0IcgEC2pA7og9olUzbaf5UQ
         yRow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789726059; x=1790330859;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cTJkcejpzyl7UHyeLK4klNTLMnqbEC9yIm+DzH4e1kY=;
        b=cE/zwkeMfqIeUNAZioFqyaxzlj0upJxOWCWrQ9LUHVfJ5i8a4PCzbmaPn4/vXJlfCy
         +OkcoWujHx2N4ugI02f7XKaObIvbHIvwGamAi7F6dUpS8nupLXeFKMAftYQ9Xf2BhbOh
         iSVGNVw6/tEgzBe6C1zZRCbK3MjLfqoauz8YK/NIBi2yxaT/Z8NvuEN7xPKWe/SwnAOK
         sw//mjJ6SLzlMMF2azxcWSQ8X6O0p1FtMsiW0w1lxZa7ZGgnjWCUAPwz0b/cKfTNCTvR
         PAORientjvxHqulzalzZyFIj7WiDTiZ5qtJ38G/HaVXj1b0TRtsFmlHtZ+wwDbwsAGfi
         HyhA==
X-Forwarded-Encrypted: i=1; AKwUvBya3y6jzxyBU7aYtrcysAOkk/GswrCCJ94XNmEYhqShPPDH145vCQEOeSUPV2dEizRH+Uj/1i4agb8uks0=@vger.kernel.org
X-Gm-Message-State: AFuF++mUcdbKGCCT8ZUagypRNGcEQy4+DkhBKno3KO0CRCtf73Fqvtf6
	N6tbEDE9sNpcRGsL6ZATrIYoJW9AEq+VcWC/057ddI0phZ8MnI/ob5J6UGrWdY/tD56K5mod2/3
	ran0AgUuUU16l0lK9gvz85Pf2gcdzGVRDnlaISMd1wiJ1ArHgEtJ0auRAJVi+AB7DjmouK0vDez
	g=
X-Gm-Gg: AYBFou0resJq79RFds6+RDLqSiFIj9UOC0h+YblJIhD6W2Bo5aXcuieciAv7N4Lxbd/
	5+blcBkYnvmxM48lVV+vLjnm9erEsMYaiLG+gHBmyscEZROaxok4ykkkkmxkKN6B1KwjhkHjopK
	W21i85SmB0mWfnREFzeW4ICx7rhPe5PAeL6432cTrfd3J7ASh8qIzkLRbM5GxhHg4n63MfR2Ry8
	FdEYGnxaWszmJXqlIQy8nVJ6u2gkhZCIU4fv6XYCt3eD0wb78B8N0W3qxKUtSlbaqu/1LPeI1JJ
	H0gT2+dvOmpL1onTJP4xenCgCxE8JfkasNtKvMWvGYYCGja3cpgfYz5Ta4ks5P4t0rhG15/84Rm
	CDrYpShVdm5MSh7XRqXu8Bg==
X-Received: by 2002:ad4:53a4:0:b0:912:c74:ea6a with SMTP id 6a1803df08f44-91254c2f01emr25542466d6.1.1789726059436;
        Fri, 18 Sep 2026 03:07:39 -0700 (PDT)
X-Received: by 2002:ad4:53a4:0:b0:912:c74:ea6a with SMTP id 6a1803df08f44-91254c2f01emr25542146d6.1.1789726059027;
        Fri, 18 Sep 2026 03:07:39 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa58d56a5dsm650749a12.3.2026.09.18.03.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:07:38 -0700 (PDT)
Message-ID: <a744dd21-b957-497d-bb45-a0cf0998f52c@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:07:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/15] arm64: dts: qcom: sm8350: Move PCIe phy and
 GPIOs to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-9-6272b7caae9a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-9-6272b7caae9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JZ8JjSoNb6I1plLNkkzYXqaVpmTJCsi8
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6aad0d6c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: JZ8JjSoNb6I1plLNkkzYXqaVpmTJCsi8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfXx7J1WPc/LqaF
 qxLQbAyN9le577fynXxGOlnjWCyR5AJJ4IP8es81SmdCRwIalGhWPRBft7wQXYQmjZrEPe+S2tR
 3sWuSqMhOtIZflg3GVTwuzyHtT8eE4+A2pScN0ngCK6/eACAcp6Q0I7zqewuCa07paCL3jv96Un
 5MwUdBFrOLMJ6754/9uuYri1IAoT2fb68sSCMfF2wNrliuXixSZlKsIIYJ5yKJLnGOcu1B14w98
 JdH1Kf9omRqvZTNFriJGQiMAEo3t23hgfNSUKcAhroDPKlpkJIXExYBfCKm0Syj5twedFoLqLrc
 4wbDifRWhoOfXUQuXu7fJm88bSAOruOfJM/3H2oyt6PVu+H7pHTkBcrETOMvmI8cI8XzsL24Haz
 y3mTbxF/9jEEOTDNL5n2T9FL8T80Um8B70mfNc+7sPF95RwRt/2KAnkFQytMGlcoB6jig0Gv/gP
 Rf2OwrFNaTZ1vslDJMw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfX+dEpMadu9oxk
 A97T2iKfledTSKosX9k/ndc0Pw5yPkGhGilqkzox4qcMStfCxl0oUk4uLmeRE1bLDU/7kLrT7nw
 pNFqg11+Xg3eFDFbqCGrx0HGG7ujHAE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180140

On 9/17/26 2:25 PM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> pcie0_port0 and pcie1_port0, adding labels to these nodes to allow
> board-level overrides. Move perst-gpios/wake-gpios from the
> controller overrides to the respective port nodes in the board file,
> renaming perst-gpios to reset-gpios to match the binding used in the
> root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
