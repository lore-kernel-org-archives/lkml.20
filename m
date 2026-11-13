Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557585;
	b=13vMP3xpG6muPA3YICnppY3lRwejLrG6/8OuaZ2aUnXTfcTl5ECRLjF8U8RhUIaDvl9K
	 zR5s5vpPMQoJly918PPYx7wcG1oPGpJw/kwy+5kY+biCRR0wV3VSzLTvcYonPrRVK0psX
	 m8wCHo69vc0KkyDOXCZchPUblGDbKBdIXjcgnms5i530FfdgDY4N+eA2KG3D4gXPIKdbp
	 rtx2B1ttlKYTxvUEuU2nZIbI0zvbFOr/MChDDHtjg83iqk5VjxOxwHqzqNB0mUfTVfZ8C
	 yL28ZLhC6xUmv8nxyYq6r4sAIklsPSa1kGlGcmXc8lRvFAftrBFV5qsQxMD+9C9CG2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557585;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=h6K5DZ6BT6PPRrqksZkUMcUpto2/+I23hqXq9QoTxbY=;
	b=FvWZpYAJ1+ie9FLNnAwQ4bMBZ8cIIgXPRByBRHx+gPhmQam/OBTcccpjQvIrK6ucjy/3
	 3r3k6+fLV+qbwKlbnG9O7mT4aZSXFtpJ55AVY2VNRphQPNjbc+QMC5Q4CGr2n4Hoz8aV+
	 Se7f7lBcsUANG/EtqnwuS2aYgg9LK6oU0/cTG2bXZZ+1oz05t4/QiSKVecDQiXImeItey
	 XYUXbBNQiSVmM1CNqzJQdklgOF2/nZ8VLVRCbweLcTUU4+HvzIxnElMmriXEsrArG2NU+
	 9dKRznaixC2a08ZzIMmcq2S279tHhdDZB1p1UB4G5Oi68Yq6vb7HyE2MBKiO+6dj+GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EUDuXOlR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jtw9YpE0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6D9606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D6D9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EUDuXOlR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jtw9YpE0
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD574RI3557245
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h6K5DZ6BT6PPRrqksZkUMcUpto2/+I23hqXq9QoTxbY=; b=EUDuXOlRXuJ3IcDz
	2DcpKzQGdALG+oJDx5gaNbkmaoThuRjrdXnMyNVETD/BnGS4mT2ZtezAOyg54iao
	79VA2Txb4loofUy9wCNDUlB1P473ZkSWTWHSAbMXoeBh9FTrDyrd8eJlUovndr4L
	SFEmT/suSlm9O+JSa4xFACYwStZnNnLg5GfFB5fPpI2x0Tshr6GTYylPN/hHtz9M
	S7wxj0dzXZSVXMYtFWgqHYe2RMZ7RAT8i9R+sYrXxjLmcEMB1x/98LUb1rF2rVyi
	s+rfGrs/EwC0sM4y5HjuCmW9p3l6VbsQ7wBiNDO6iDzZHIw6VQcNtctmQjYWVvLV
	K89yBw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdj979-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:13:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ea6b66e53so17519285a.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794557584; x=1795162384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h6K5DZ6BT6PPRrqksZkUMcUpto2/+I23hqXq9QoTxbY=;
        b=jtw9YpE0gDV9HKApclCQGi/Gw8fBuf9exXV9R/cCEJn6BhH/G0QiMFuarhbYcg0BMN
         xvMzHKUjSLdtEI+UYIszwNqAb1ulYHGMaRCWJBtkMxwLd46fLHTDiXhJaq/d0pV1g0GD
         VOUJ6JlzI3WJ/Bfy5SsCmKHEgjc8BB29WGRslb/+gIGIQBzNOCubYzSHyPiEkHmY84WG
         4j1p8vRubZuBO2AGOKHG2cS1eF1R4uPsQC5UtAL+vXeZ+2FOJhdOqDEU0UMx0UBan6uE
         kxgkCtymJ5EIina33xdCRhTW66A2kjBKjQnMVXnnCLnU0HQhuM8J7dVdhctgDkuyedQ/
         4zFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557584; x=1795162384;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h6K5DZ6BT6PPRrqksZkUMcUpto2/+I23hqXq9QoTxbY=;
        b=pvuXnSh6suGsPqxJ3lXImuEvkb+wOxlHP30w0y7TdZ02Idy9CZjvBkOqi2t8Bg6/L+
         Dh5vlDMEhapF1obr2OSnNpuvpnzBcaH+tNsLtAm0TRd6/94uZo+efqoxtlwRxrexLC07
         8VGpoIgCRmrooZsP0CAzthde1AJRPkUov6a4Cp3qO+d/3H9qZrY06eLM+8NR8AaKCFsd
         agQlSGKB5Hj3RtuiFn2c+CA2xvHfhfPOdgkO6IvERQOfw89CqQZP8MzhFXyklGoddSwf
         CFXuyTZ50FVrNPSt3QcN0Vg6nxhzpUwaYBpAhxB9ZLwvbhR1IDibWVJAPdtxexu1TsnB
         pRpg==
X-Forwarded-Encrypted: i=1; AL+hErG/rkScdymTZ1ENE1iXF2Nzk2ksnfXpH1NaWSaizQL0T+J18PSbyYXMHBm0iqnPN4rpRGX0e9gswiiI9OY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qYY2h8P+HydB1MWTEvZCmVCgo6qyjVZDBunOT30194SU/6l9F
	n+XoPebdgfQ2QJCHrrqDNMqdn7666BjYVdSAqfzCTRPrtLhENoEh2UCUE/pJzgKaZ48mgyo81pF
	6eHjU1iX+oFHrHe8HDQKqRE1MTL7qBuuvXhE6RmTHqgNUlrHNJj1jLBzbAN2ov16+zNY=
X-Gm-Gg: AYBFou3Um5cO5exsL8Xj57rrV00ZlgHqAhVm1vGIF/w6L+U6Yx7aO+pZBE6Vx5SzKxX
	XtLa94x81QqadLJOWXk2j+xiaJsUEoRL29JihS1kyjo7K0ROYfQg0zOjlKeHRINoeRHnbCSjf4T
	WAxU4rGXsLZi12AMBbV5wZxdj9TbXEnhYUvxSUjY2Uak/unQFMgElw1QbBE9AkmTgXQzz9olrxx
	C6hPW03TXhJVmmJQ8azzlNh5Zy8fW38hShbEbCNqnOQ40rMqotjmBCCzEupsIOSJCrztoIxX53p
	JIfME9aRBYfYn1yTgPlvxVUovXFyXwWEA+JPc8l9c3lP85vtIi9z9NGJguWyHaMKVeuB5/RM4B5
	Dbdz5sqwMONf1UMfDxuRZBQ9FjjpG+4f6RUMyOajHe4B3wk9WXHGl8vShCIJK2+hPqVUwqn0=
X-Received: by 2002:a05:620a:a819:b0:949:4dcd:da3f with SMTP id af79cd13be357-9494dcddd38mr215156985a.6.1794557583805;
        Fri, 13 Nov 2026 00:13:03 -0800 (PST)
X-Received: by 2002:a05:620a:a819:b0:949:4dcd:da3f with SMTP id af79cd13be357-9494dcddd38mr215154485a.6.1794557583413;
        Fri, 13 Nov 2026 00:13:03 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7e5cfsm63993866b.76.2026.11.13.00.13.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 00:13:02 -0800 (PST)
Message-ID: <83150fee-ae52-40ab-a3b4-ef180a29d48b@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 09:13:00 +0100
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
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SM7550
To: Aditya Choudhury <mail@inferno0230.in>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261112-sm7550-soc-id-v1-v1-0-57299906d81a@inferno0230.in>
 <20261112-sm7550-soc-id-v1-v1-1-57299906d81a@inferno0230.in>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261112-sm7550-soc-id-v1-v1-1-57299906d81a@inferno0230.in>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMiBTYWx0ZWRfX90j08C8GWUDW
 qKb9qVAr6ZO8YX7NK5MWOQkoexRJnS8BU+zoWWvJNHxOe/OeRFIhrkrGLs8WOy4AKVWtq+GM6+L
 h85InahI7x/RDrKM9NmuT1odB5qUEMc=
X-Proofpoint-ORIG-GUID: Iaw-tEwnlcyvihtOHh2xCEo9s12_kI1t
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af6c690 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=mPRu1C3yLCZmAX2_wYUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMiBTYWx0ZWRfXwjUAQWF+iLxL
 EUFSss5it5XzK7ugbvJmjPuheHU3MDnV7U3F1GDBd4q+0pUQAyLJVUzo/IXeeS9sablYJrhbjWn
 8933SbAJmyWRPQpU6GjtQaJgfDX04teJmBx45SH3b2XVeIa3aFSgIZ9owaWt9EorS3+w2tiZIkV
 adn6UZ7MqqlKKM/Qp5ADeQ479fF43XQjSDOMWuGuY9Ec94hmt6NWnQZpnDHy35C4yFr9S8Z1H1Q
 K4kMbWmS+ipDN9RBVjYH8haaUNgfLnWWYWOn0GT9qUcqbpf4gs7yWQ1zevMc5lIRuBgTtxsoIf5
 LiXT6FwG6Lvls4R3aMAZobi4eRcdpnoZuOrcdj+FjxXwjoUnFTuuPDe2KTUepjRa30KzB1kbI1B
 yoG9RkKKi8T/v8dq4Bs4dVnT9/bSvJnvMm4JLkjqTqPt87Barw78o9NRwJ4fxPu2d1cQcuXICug
 +ZZQ5wUPm8E43k5E3cw==
X-Proofpoint-GUID: Iaw-tEwnlcyvihtOHh2xCEo9s12_kI1t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130032

On 11/12/26 11:30 AM, Aditya Choudhury wrote:
> Add the ID for the Qualcomm SM7550 SoC, whose internal codename is crow.
> 
> Signed-off-by: Aditya Choudhury <mail@inferno0230.in>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
