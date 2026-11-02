Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629673;
	b=EitiI/psoZRSXUxpnknKLSbwUlV55yJerHQtF4jMjC7T0ksmRNdBo3BCK/48hdvzNn5m
	 BX3vzJvSK77pBEaY/X4+wNCFx1OFL1pi/IeSRY+NHx6155GkO+7AAp6h8D8D8380SCup+
	 w+GUh6wQIYDyOCsk1HW4L7fsk6ebnXivWDWjgtWZ+5tqqTyW/cQjNYogryN+2DiK6YXZm
	 Qi3cgojFVdHyE1GlO2pQUSmmbO+I1uHurghplyqqKtKc+H5avyk3S9bGdxWX+5zhT3YZZ
	 D5DSH/OomB/18z2tYz14Xb7e67ZJRU6pApsxrdz8s52no818VSa+W3thrNZM0sKwz6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629673;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7O78g7drrpQA9NJKlkHztJt8GYgTb6oyaZ2MZ53tc74=;
	b=qJ981gMGpVh+PTPrXNMCJySujDYMyWKrf21np/paTwrOopoEi+vbMgX+a6e4vhxypRVR
	 s030uXjbZVm/X0qGXDU3sM+ELfjRVv/0lfF34eSkF1Pvjqyxi2qCxcl1Z6+zGBco/Tyyi
	 e4wk9jeotdzwWG1mzIpCmA4jYXc3Uf+L7S7lhq63rwezoy9GyQfj5fk2h54XG9z9OblY3
	 4xO5KGJQB/984dQ9nmK+lOIkpS2k+YP5p2ReSoLQZCEEelKUAcQC+oyg8RxOQZf3b/dio
	 aIDwZr1o/QnWqD3qfUomKvkWTZl/MdDz0VJK7AV9DWSwHy0BGcqDBjqwslhavdz3jlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZR8PHAVy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RQxuUbuq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BAD606F20A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:27:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7BAD606F20A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZR8PHAVy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RQxuUbuq
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpLnR452530
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 14:27:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7O78g7drrpQA9NJKlkHztJt8GYgTb6oyaZ2MZ53tc74=; b=ZR8PHAVyDgsqVgY1
	AJ0KdeAERdFC8n6jm5aESl/nvRkNb4UismGJ1/QaF2jS61QVDci/f3rw0DlBr8vL
	Gx27VXo6ygscZf13LwXN9QteV+UKKRETx+IlRmEjAmCkgrOOv2d/N4535o9AnW+C
	Lree5tpHw9LWUOhfzpTPtdEbWo82Xjs/uKMxeNYEL+/kQSQpSQsxYcxnqZkitj72
	2rK6JJEXCx1kTifg0o5Cuy4i5UqhHKVn3gDslXpQmnroXKXISqyjLdUBM0zEg4Wt
	8LRaE7ADEriSdp0dLu2SXByspYK1bGuYUL0gnJbUngyOxtd2ZUXxCl0Hc8hdFOru
	LUgNLA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsa6rpxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:27:51 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-77f133855b9so100745137.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793629671; x=1794234471; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7O78g7drrpQA9NJKlkHztJt8GYgTb6oyaZ2MZ53tc74=;
        b=RQxuUbuq1/DHLsRrpVazR92QWu+xyrmNUxI68PLOirBLWH/vU7fvbu9K/GWk/dPMZs
         rkEceJgXJG66Tfx26z/GP4xYFGeAbt2BXPZx+BaTbvMxXI6sAG6WEjVAWX5ObpZYaIcP
         FfGNat1azY/bCbZgl3eejZZSQBN/gUbv4uOEazjHz4GaA75V9xQkdKVpEtVtNfXu7SaO
         sXqxHW3y1hxu+ucfx/cY7216n9Ml6+40j86FC8yBAN8QKwaTyWhvgIhfg8zQBbZVoqVe
         CKzFZokMckQ0nzS6qpxrAreltWi2xuHMx79ffmuTbhap3fuA6neDZBseYwuLCxioRQ5q
         9/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629671; x=1794234471;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7O78g7drrpQA9NJKlkHztJt8GYgTb6oyaZ2MZ53tc74=;
        b=ef+JQjTFPUip5D4ZUVQvHs2YcQCSap4/l4UQxxCRDFLyftr4c/1elp/PpUhcYQp+u3
         +QgcbXxMV1t90EcgqLQ3tbuprOvYts4GAgJUkrxVNx99bVWxNdE/PoaOl8ZoVkXDUwly
         sXRDxWFq8HeGMRrF726uxQ++HDHYe0/QCvKRlXMtLct3A8sXTmkyvBLwRfK74yfwSZaS
         ztwPboGjNlsqL13Lpria4SwIaDNa74nH9nhJT0dEDGzANykEzW7n8ca98v7V1wQB0VRv
         Ms30N2w+3+dmxTVkQh34gNFhHHuFpIVKy7HWkj6ZeIS9rWepsGgjM3/CE0g2DLyt3NGF
         xcug==
X-Forwarded-Encrypted: i=1; AKwUvBzRx/DeV4IxUkQm7fu60mYLXwoIbIflt+26IStyAfUezmj/jdYVqC3OUE36P7ahbfu258/e6QjyrMcecmU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UuE3gkKXPnsmRhgI3Wylga0KvBpGlmd3zMWl8sFtG1fcyLsR0
	EHoxU65ck8l8k46tIrBVu/b+a5bzTxj2uf1BUQlfO3k34fu09YcspSY3llCA/gyHYj36LlWCTis
	aoXxte/W3G7NKOpme1dHs0/BTwWWX7CtRENa1Jbw0yJUtsMWkp2+1iWTt7jyUDzeLDNw=
X-Gm-Gg: AYBFou19C8nDxbLMniV7PBXBox3eawYzFu4RzTo3VY7sfqcgApaE+yySSpJ8OHrrrJA
	3Q3JFSCNP1paBdL7bHpTvVhfkluwxcVBCBvrEUF2m4VmjgzePfQYaztJ1H7VFkUnvmsqYRLK3jW
	a7YPbLKQ+NKaZXQTd6T0ES0mHkNomQ2me0XLAAVYmfdT9tMujkBuCCfWrmWkUEMFuh7ZxDmGQd+
	VTj2fhRQrgI67qiD6Ljnoj2lYxMuOSFfU+D8nKmSCLW3Ek+sWkktw3PT7BYOce0f/D8K303Ryr4
	B7YKpvHFY8Z0paxMSGa+5LQk6fOl3KTFLa5ERGJH9lePoUzJzTRjRxdF5X/oF08hq8Q4X+Vw3I1
	hczXdc83SkaQUeiBo88xmuJXh9ocOFatNjtdsvh16qVi8+dGgiQPYxZ3O2o56K+NWA0kLi0UbHp
	6U17eEmBlWsA/4FFmZAKqxWfQQfP+4qA==
X-Received: by 2002:a05:6122:5318:b0:5ea:9c73:eddb with SMTP id 71dfb90a1353d-5ec6858c115mr5084395e0c.2.1793629671117;
        Mon, 02 Nov 2026 06:27:51 -0800 (PST)
X-Received: by 2002:a05:6122:5318:b0:5ea:9c73:eddb with SMTP id 71dfb90a1353d-5ec6858c115mr5084377e0c.2.1793629670655;
        Mon, 02 Nov 2026 06:27:50 -0800 (PST)
Received: from ?IPV6:2a00:f44:e0:8d11:8079:3a24:c57d:745c? ([2a00:f44:e0:8d11:8079:3a24:c57d:745c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfdc20sm392186166b.19.2026.11.02.06.27.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 06:27:49 -0800 (PST)
Message-ID: <97c4555b-aa3d-44de-b5ae-9d11c708b530@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 15:27:48 +0100
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
Subject: Re: [PATCH v2 2/3] soc: qcom: smp2p: Fix out-of-bounds with incorrect
 DTB of too many outbound entries
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>,
        Chris Lew <chris.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
References: <20261102133531.173434-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20261102133531.173434-5-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102133531.173434-5-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NyBTYWx0ZWRfX2QBmASo5mm/9
 g48zE6eoHove6ojwHjjtYOdfhtdMXW6qpRObNSXg9hrn3ndY1W6m7Lxck2sP3HXNXc4bkpRLoT2
 tcfpPoshR+JTHI5sQzn9Mi/gb9fb+SWmkCj4JnTx/xXtPHHwbQZFTjGahBPygVs0p4Iwc6px9rT
 +x10v2ZbOOAa3xN/OzVJ5hf79HqbKnot4oU+OQN7OpQ+7fb63EYO2TCZffRbWS/2XklgsbSQAtr
 79KUgzKrTwAeG/P4QpWhIjiCeGxJGhRuQf+LcsCqXIVelFfYA+aBXuFKpf/ygLuq8WxdWIEe84j
 90GefSZr1larQR5adP+wzfgpCajiGPyURsZA0q3izGJVNyDQBHcfo6d852SpwKnaWvK0Lpxx1fq
 op7cWaHFqCSKKCviHU6rJO0VOQJ8+YZZjtw2wqFGUmGzDtoObdrD01xxmg9Ui1ux04Tr6Yw3dRX
 9pba2PyDq/yXDEpZ9WQ==
X-Proofpoint-GUID: p02Bz03QA33VhAFVZvJmMVmCidR94Fvr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NyBTYWx0ZWRfX4NQ7N8lV1atq
 TyB1JoSK7MCqDEthipugXt5wcBTZ/gupon3/UNzxvT+KKmXg/bHxHG67PXtMjoozzS/of73A2Fi
 rRV5WAOrtYTenOXsfKffC5tnhJUmqzs=
X-Proofpoint-ORIG-GUID: p02Bz03QA33VhAFVZvJmMVmCidR94Fvr
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6ae89de7 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=teR3AlUbzk4yVbe4HIgA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020057

On 11/2/26 2:35 PM, Krzysztof Kozlowski wrote:
> The outbound SMEM item has a fixed array of SMP2P_MAX_ENTRY (16)
> entries, thus driver should be sure that DTB does not have more of
> these, otherwise such incorrect DTB would cause out-of-bounds writes.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-eaf9beb4-cc0d-4d8e-be28-4c12b039b3c8
> Fixes: 50e99641413e ("soc: qcom: smp2p: Qualcomm Shared Memory Point to Point")
> Cc: stable@vger.kernel.org
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
