Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793106272;
	b=NCv7Xujn0Vkvxvm3dWqeF5Mm+NmKvjmagbnqWZKzIm95ao+zN2733cR74gXI7KwLOvav
	 dy1SyOfPaAOOR1POjZC33s/rnF1ZpnTXaR0/VqrO9uDBQyP2gjeTa9doTLPPbb+OKoSiU
	 88iVmRYfPN2FxODibppMZaVCzmym1I+UHDXJH4/5EFzjg9n02XBGWsIgUcX2CyhCUPAee
	 K7Lc0muig5KJDJeH5LhKQw+M+coWv7fb0KeRgLEYNzS1/wYrXXl8n9MZjkmQ4Jc5SjBgR
	 uHbMfU1btBvKsBzijQ3nKeKPELNOKu2NN+vkftCvCB9Td0h60tWjCPsREKsqrNfsX0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793106272;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=20sAaBtek/W6uwYCnGF7PYPD9AnfU5r554thWYjEZOI=;
	b=AK57KvueCNNcvYxZm4z92d8tx+x+mXPgSlOSGu7gxXVhJ717NNC8oAYijw6kn3ggDHOV
	 fDLu66DvQz2pWjJApQi4M+qU9BE4fORa61g8ICb9Inlyv0FkxoJrHqy3L2G67wr5y4Gi8
	 sgFnB+dNaMiksDuhnENBj+HdHO+f8IzR5NIP9vpBj63kl8tQvhXl+D+ojTVfDpj0PUf9G
	 Q9gsI1HPOxclvrRtWYDotwoqlN98Wh6bAjn6b7oj1WWcwTrANvpPnX+9nzyGPdqSMYb0c
	 Nfs8Ib8+1urCSC94vKlSGq0EdGvL8DLoPZOIQu5bBaW2vIqGn+gw1GXc9wvL/XvtFMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CzoEnh2f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BD8liUP1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C0D606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:04:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58C0D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CzoEnh2f;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BD8liUP1
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeQpp3013052
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:04:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	20sAaBtek/W6uwYCnGF7PYPD9AnfU5r554thWYjEZOI=; b=CzoEnh2fY3FWxv+S
	mTyVyGZt1JOg+PzIKup5Pv1txj9hnaELLI7UhW9atQHV1vRzQpmfQLCNyDl7dYRP
	2v6JkzqfmnHdJeCvEx0z3H/FdXaEoMfMiNotmlzWH9X+qWYvb9WMgBVrW4J8QjZL
	4cMteuqeRrUT1wPg79EoKsmR1JgrDdG/Ug22wxT1Z9Ms7RbZ5LvSHaN73atvd8q0
	MHQJzNkFICLfmxuIvfkGmjNCHjdPDQGxERMeqAcexn60WWlqZwj41RQzLW6U2LR7
	ok5WyZsHvE5huQFUHISRqYwmnPF/kPH4y/kENR8N9A50S9oICFsvIxPg93V7xHUt
	2unGSA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hje3db4s5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:04:31 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eae4d7ebd2so240946e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793106270; x=1793711070; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=20sAaBtek/W6uwYCnGF7PYPD9AnfU5r554thWYjEZOI=;
        b=BD8liUP1HYEvR60U6DRxz3FSP6rt4asjLuyFsoZfJI+dSHGYuA+jP3dkZTZr7E0AXs
         CFVA6dkq+F4yQkCLfzI6Qc+ykNgSDfhLDnvO6utVg/w64pDbZKIbeV55VIdf7fPFhgjF
         O5+MzmmjRVYmTDMPASXkGjoWZNWFerSPHroB2RFKZzfwJrractCnjsV8hAgUdgnpdeJw
         63KxNslt2FEyLgXb5WYb8aYoPkSqvEEUhIVGjQNyCJghO/5OEK16pVsho6B0MObZgvxq
         JsEzqUZiqITCFeRMQftUtyBb3h+NoqaM9R24Ne8yZab0Vuq9SwEAEmNGJXcr80ZhMdEL
         k4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793106270; x=1793711070;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=20sAaBtek/W6uwYCnGF7PYPD9AnfU5r554thWYjEZOI=;
        b=DnwcBKGzplTykMNBKWVkgGDiFRFZhxe17JLi53aJsaFgKIvFlVYurE366bJxVgJNn+
         3ogelr+BeEbf9B/D4rBTEh+3nvZPnxobMtOLPOET3VkxkBwSGVfYzbzZS7z1o4bRF4e2
         li5t/WCfFu8P5OJsj0XqSS8KIDkYyAffp+kQE3yv6Fd77vM5F1XCo7ERjAP+fdXP8R6l
         /dS5JrUguRg2wYNpVhHGuE2BRCOh/ofbTZAzSrRzhCcqdRrdUvgtaiQORFxrY1xR+8/9
         aJdN2SkfdIOYZu2cXC1uJ2UdPoXpiDgBH4qQHBeHTFpDzpbrNUDBvuWXqAwKwiFcwtTU
         2CAA==
X-Forwarded-Encrypted: i=1; AKwUvBzi2lzLveLsB+YVB3SBHek5/6hg0XqKknz347kfCp8S0qv471Fon/RYhSJuvEkM3JQ7zbBksjSeDp6AsP0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1svfNHx8MLG1xfSkUWpxl0Ixt5qOZJKzJ3vXI+QBDd+Czjofa
	4DPNg1OxjvETaDJ4GhAvtGccKRgbCkxbBunzrMuKl1TeolfW64ZfgfrASYCrh4+vye7z3MCtuhI
	8qf0wrHM+RTZQepLUkjaTq12xionlp9ZmaKwWVYjxNQQ6GJOkw/GEc9RXBxvRAIa6NS6MbwJNIq
	I=
X-Gm-Gg: AYBFou3ho5OTNdWnpP+TBy7rlV/yRDFtQV+yDvV/zJAezFlii9clOQE1pON2wmQBn4h
	TRaoGcjClr7u8MOjweBAk+GTKIQMTrl+6geHfGqEUyTwtFnq07zgQ/Yw5ofiCdCmHuLBqKQzNjS
	ByZTMzW1lbJRPdSimLGViSmKHz70qa6W9gmxzYQO5lUBUpWlxXFXCWKcnqneB01WcYKVfGOi1NL
	qxTP0TcWA23zNZZSchvX7D3dLyWWp3yZBz87TlI2VKWhoYTVIiWoFFSBE2TXVYmf2EX8voyrZdY
	EJyUeBBV4/UNETdP4gP53ZZzHUeXxeHPVJupHXt4DbHuCWIjYQAtFj862JiH5/n64bxS7y0e47e
	289XMine4DncJgrKDG7D0gg==
X-Received: by 2002:a05:6122:c2da:10b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ec23230f38mr3698464e0c.3.1793106269986;
        Tue, 27 Oct 2026 06:04:29 -0700 (PDT)
X-Received: by 2002:a05:6122:c2da:10b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ec23230f38mr3698435e0c.3.1793106269536;
        Tue, 27 Oct 2026 06:04:29 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a894d5sm2072671e87.50.2026.10.27.06.04.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 06:04:28 -0700 (PDT)
Message-ID: <08bc0714-4998-494b-baf5-bf1fed8a80f8@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 14:04:26 +0100
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
Subject: Re: [PATCH v4 2/2] interconnect: qcom: Add SM7250 interconnect
 provider driver
To: Ishu Brar <patches@brar.si>, djakov@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        konradybcio@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261027-icc-sm7250-v4-0-f9bdaa3c1c7b@brar.si>
 <010601a17d62222c-befdb9b3-ce1d-469d-a6d3-00511529579f-000000@ap-northeast-1.amazonses.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <010601a17d62222c-befdb9b3-ce1d-469d-a6d3-00511529579f-000000@ap-northeast-1.amazonses.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MSBTYWx0ZWRfXxqgoJmkmhs9X
 zKLo6j9gMIJWo/sdO0oi5cOvxmUt6IVZCAeag0YKISTqPTiV5d3ogz5XVG+ZR7gv8sgmE62sKg+
 eHq6LvTaE/Uyx5awOSnygzFzoV+3b8g=
X-Proofpoint-GUID: rVKnkkRGSQZ-4pRmFufrg-8WF5qIj7KI
X-Proofpoint-ORIG-GUID: rVKnkkRGSQZ-4pRmFufrg-8WF5qIj7KI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MSBTYWx0ZWRfXxuP1pcSCsPmV
 BsUuBangpVE7W1OTlQZ3WqJFv2y5p+tayAna7WMKxC1Yh68AUJP3w276Wn3ZHTOASwnYlfAIrCG
 MhLUqa316/hswWKooD2VsCQHdHssAwyRZ6KJS8cahU9lWLpMUWJ5DMllVkAXpwaW6Jln4ujAwvu
 FDN247yf5BT1v32wX42zgt80Ztzh6jC+R4B9N19th6oXkyUDS/bqQQhf7kF5epzz/gn1YE5IEE0
 UdSf2H6W0CAF1o33FrO35JolsSl0UVwAX/Is7qNDAukSmYs3i8snoPOOxgQcEFu9ZuiDm7sFyDy
 +PGksUFExA2aU+NXVLf3i7e3rTC2qlyCnja+QfWzFk8/KndPW/eOSZDpz/TaXn5ttQUlttUMpfQ
 I54jedG9O69JRuoPRQDPfLTL+tpnomkVOuwZSF5v7XDE0iJTzlpDbLx/MpCslm2M3JMy+RiFMyc
 wyoCoPSWyfbIqSgWLWQ==
X-Authority-Analysis: v=2.4 cv=SN/Xx+vH c=1 sm=1 tr=0 ts=6ae0a15f cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=rbLHc7TusOZuPl1584oA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270051

On 10/27/26 1:42 PM, Ishu Brar wrote:
> Add a driver for the Network-On-Chip interconnect providers of the
> Qualcomm SM7250 SoC (Snapdragon 765/765G/768G). It follows the layout of
> the other RPMh based providers: the nodes and the Bus Clock Managers
> come from the downstream interconnect description of the platform.
> 
> Tested on a OnePlus Nord: all providers probe, and the UFS, USB,
> display, I2C, serial and camera ISP devices get their paths without
> errors.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
