Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556992;
	b=235X2U0nQvY8ioTEwQ9b3Z0rXc5vQ6QJyJEl/4dZn0Q64al01uiteC0mU2aYoNT0vfVU
	 LRNigcIgu38Md4JGLVfjhR+YdbCim7PmZRlIe2pm9opT+LNLcTR9+Hs+J3yjLzSfT5VaA
	 E2FD/JBGNw/w40xIOpCia39PmvuLaIehGVD/AAhRVu5GiQZXbjcQpekZdmn7jkGh5AMxY
	 tg7jLnabt4vWbjAp8iO+0SoxnO5WrbW2VlgirK3zqY4CiQtAu/fFTIcEZeUk2/Xo4W094
	 XaTqKA8eev4FjlKE6B+bel/bYHaAJmNhsVQelT1HO9zA04131tSNbKRNwrIEmhR7LXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556992;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zVzEyTZk+1HeWp1LRvu76rixuMIXyO9jzfzAeGraCds=;
	b=nREWCHm1n4fXW0XFCx3D+ovhdm+mkiGmxA3o+UpaBpWC8VYG2LxFlhGvVZkDR5MNlStY
	 LXTG85VfYSkLBGYoi9m7/FVbD9rHbK+TLpyKsWArt+rL7NLzJ/08qZBbUuo/ScYYCOcu9
	 o1V2RnrA1/KH2cAMjb933WIdAxsmqYg0cWETE8VvtKFbzf5Z+5AUGZaoW0k5MeQcZsgOI
	 2FKdnUPVdVrBvlXoiRNBGO8p6GkP7BvcEOnDEfxpuHiy3U75SCkJDpW1aSb2VA955YjzL
	 Ne9v2o7ErCfdl/T4PsD8VnL/yFAEzmHsnEliEn8LaDIXQasVWOfAVfqrgz0JjoJlYhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Oy4vo9zS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kR7FweQx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAB9606A333
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EAB9606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Oy4vo9zS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kR7FweQx
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD5718J367205
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:03:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zVzEyTZk+1HeWp1LRvu76rixuMIXyO9jzfzAeGraCds=; b=Oy4vo9zSfXOnTriV
	FVhy+t9/cBbMbZiP9Mhymkf+ac0TsPPXlAAXr62o2Igb7Ls2H8fJLUvazYafDGjd
	i7o4tG2yusJN/vwcR+jKWVM+KReKmtRbtB8R5/9fD9URbEUSruSXvT50TZUUCK7g
	vXkbyjuslOwYOwscZl97TgTTAm6+0cwyyXGAdMD5tp/AzrwZasMG+OQVGl5zUbV7
	E4JgYY69T200s8axZA11tJwEMKNQcbggyldDwZuzeFyqJEsgCW1HNLMujqDcuHgA
	WwqcO709jr0CH17N/OJi5vEAXOpoiywNdey7lP4Sok9XYsnEMz+05yFN9UKzyg+K
	ef28vQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx3456y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:03:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93df7a9466bso16237385a.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794556991; x=1795161791; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zVzEyTZk+1HeWp1LRvu76rixuMIXyO9jzfzAeGraCds=;
        b=kR7FweQxL9urAEPwJIs2UjYviDpjggbLbpEOfHRxx6ctBUq0um3yjPCrNs4c9jxErm
         JB5SpAY1l+R7pIm+9KLAQ0aq9AFMXEZJIu1SD1RhYy4MglvHgaceobXeTdhGNEgw/6sM
         YHqR6rmqfZ1TOxA2+2EOr4q0trkPOpWv5/qr5OaoOrnGlQwG6kNn6ajAxXgji2y1Vgh0
         UY93kt4zlYkeaOxl/XhUwq1lFB4dqdVclDgLmUin4R9XojsmMkCbNQBxAA7LhUWvuauC
         auPjDpKR5uP2gj+iGrp+91gt0N2D0+v1+S31OWNnZQYSa/1ysOOEI9WRB1WPILpPtOch
         JtFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556991; x=1795161791;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zVzEyTZk+1HeWp1LRvu76rixuMIXyO9jzfzAeGraCds=;
        b=HYzYmAlFip8zy+uHoYEBI/1XNa870ZD6vc7BUIPQo/fBJZfyb76gZmixhQrCttL/SK
         B6Tku6J4VQUl+BsKmrBSCdD+DI+sKjK/AM+qFbloBdYOvso8nadjjIUNwf2yc0QVmol8
         ZkrxJQQdwvl/UM/XgZpKHwJmNQvycoPsz4A8g6KPmijF5JVTsMuJwUhvfEB+fNIeLFj9
         iQSAj6Kzhk4XhYTUOp6/nVPC4MO7jJyZHsZvTdmBjYcz33ibPY4pd1aqi1VJ7ITER30a
         RnQ393kJXsS6JGbZ3jikGO2212YK8DOy2WI1V6ZLALr7rFrLVLeg6iB915JEALD/wJSw
         hcag==
X-Forwarded-Encrypted: i=1; AL+hErFClnh9xe9ZV2dZQUdnJcPj3lp1Jwg+Gt6f+ZPKgcxi1mTBuhpBUoeeXued+0mmWBjHCJfYXUjgk9c5QUo=@vger.kernel.org
X-Gm-Message-State: APuU4Z925dkgm/3CfcmJ0BWvCvY9ElvX66eDuBRcVB0FzZ1UhjAT/Uq0
	3Bx5JIJrXrOcBEZyf6OCKTboi1P7XwGfyGRUu0U0y02jrUw0lBxyo2k9vjfWqzAWSoUA8IOxbA0
	RCzNfSFD5cogNuf3nUj2G7PhmAJg+PkL4Ed8z+a9Oy6pLOaNyB509KNAQi9hn1AOscfo=
X-Gm-Gg: AYBFou30kRifMxlfmzupr3sBmqTNlbtjwaFShwsA52YXzw7g7LN6lHyhQ6jcaZlRC43
	qwpkmKz88LtbIXxj0I/AG1KXLrLzOtiulNDH0if2LM0R1skDj/ePr9B8y1MU2nyArNbP7WFIiEh
	cCu/4zEWTxsZ8+QonozZj8fgDDgbQciSXFjkAWgYTh5YtZAUAo/CKXfxE8OZRUgNJ7dB/HdbEek
	U+nHaAY2ruWOabsvZws3AiL9lzwl3pUdqOOfXgZqU2LsnQnIYZdiK49JdYFgFF2AZzgrG7qoauC
	qrKlAkdd5Ca5VNvwKj/bNgndH929bxXuG6YxPPhaFnSXwkcF5MYCIJuMSb68uIbIsD0DXvSS65a
	uJM9JuCTkzuLnhCQfVE30m8ZTiJMe4RL/9AhToVOOE2AYMHC16Au3pQdr9rAHrndVwY6sWtQ=
X-Received: by 2002:a05:620a:a790:10b0:93e:6d87:4f69 with SMTP id af79cd13be357-9494bbc8d7dmr268107885a.3.1794556990272;
        Fri, 13 Nov 2026 00:03:10 -0800 (PST)
X-Received: by 2002:a05:620a:a790:10b0:93e:6d87:4f69 with SMTP id af79cd13be357-9494bbc8d7dmr268098985a.3.1794556989293;
        Fri, 13 Nov 2026 00:03:09 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7e5cfsm63171966b.76.2026.11.13.00.03.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 00:03:08 -0800 (PST)
Message-ID: <ff19f124-ccb1-4f17-b047-da01d839bd36@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 09:03:07 +0100
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
Subject: Re: [PATCH] clk: qcom: hawi: Constify known static data
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261112154357.271072-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261112154357.271072-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af6c43f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=yez1amU5zvzsZwMJzWkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMSBTYWx0ZWRfX+jVDboSI6xzR
 ZuMfb/5Dbe1UxUmWrtZUVQDAXUo00g6LZvqeaC3GQGxne/NiEtyOC+eJtg0iHJsGnPncRwNBq4m
 FQzi1KPsnRUrbPHJnO/QbuDWL4TwXUAKDr61Ap8SuyPLxqE3B9h9h7pdwRh+EZhGmObop1/pHkQ
 WuvE7hunXdUNmijvSqQ5kdFdZB33Ow9/DOkq301U99IMR5lwd/pVMo/+z3Gy9YIMT/fLpfAStpS
 xaop6dlJQjD78qLukvYWRYYxYxAaK+1r0qMAcd9vL9kgdxGSlxEu6jUTRxUMLMouM6tdCzntG6u
 QcV9FZQiD9ozzICQLV274z0vR+kFdNxz/z2WfbXNPVWkhgFSQuAMEFdEAcp/pTDee+LB65Wxewn
 XU+opoVq22L18s5kMPMtpClYkEiSmbKTFYBYcpgAyqY8iuY08r/qxI0iz5kuz0J2TK10XCyxVq8
 SiGaH5GAWfUdqVDCQtg==
X-Proofpoint-ORIG-GUID: i-2Zj7ZyRkaOSYThjlV0VuQdN67SVCnu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMSBTYWx0ZWRfX96OY8wXAToGd
 hnyNzmFrHRyKGlcMsm1gITM7aY3svvK8oVnkaD2UukwraZG61jnzOEgfCJ03i2rESSDV5x2pXrq
 Kj4ar/WfgAgWD2NOP9vI8zEICO9fsVE=
X-Proofpoint-GUID: i-2Zj7ZyRkaOSYThjlV0VuQdN67SVCnu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130031

On 11/12/26 4:43 PM, Krzysztof Kozlowski wrote:
> The static 'struct qcom_cc_driver_data' and array 'xxx_critical_cbcrs'
> are already treated by common.c code as pointers to const, so constify
> few remaining pieces.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
