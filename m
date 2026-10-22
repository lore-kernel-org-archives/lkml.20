Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792666867;
	b=le2ogOKyugS/IR6cyUqcKBWbFTvJcOmiMHp8WHdP8TiK/xUe0v95bnZbQ8cP/Ikaj6ls
	 6d/XVKgLfcNv2B/skCEmUBq7zKjgfRVgERn3jPmGAqI+dG9gSSzWmwlimtO8k8WNofCp5
	 qcYCleHg8L0iu+kaPWOgzizpORJbMEbat3j0+5m6SzLV6DJClZ8p4oFA/L53zkc7mvYUm
	 sXNvEIzn/VNP/caEP6A9YZNK/GXTSJD2+e4+VVDiwlXPISAvi2xiCuYhpeR2v2jGGL4DR
	 xEO7XAnb4P40EXTlK2+J2B0FoHM6rBul5tEM9Crfhb4i6Qa+6IlITLvuoRA+W8m0UpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792666867;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oXUIPAcLB3jl6Hwgze2Drh1BW75MZnZWjiaSASX9zxM=;
	b=AQqy0XwAd46QhjMIwvEamgG6mIYuM6TQSnPEOhUISfRzYQWPBqfgM1g0tcUiFR+P8kJU
	 8505LWZH5jMaooeSQgZvgs5aWZz5LQ0E1wFjVUfJfOwh7t6uP/zqVjdIsX6DNJ6rTaKYn
	 QpJtyXHyTzl5thbKG9aqNzowDHBsvgaiuTnQ2cgDOdbyXE0W4Hripnflb9zQpATuxoii1
	 1IH+jAiXPoFK8iP+WPuj0rRkMHh3nLpfv8MdwHg/2NgxNMS/HzGnih5ze6rMZy6P2NDgz
	 jeq+D9SOD1A2ruQiAZFflDOFSPAHToUzJJ2fl8XMDNt3fxT+G0ce+A/DyfoBQ8DDeXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jpccgJ0v;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VR9TQK5i;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3999606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3999606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jpccgJ0v;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VR9TQK5i
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0MAD1965947
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:01:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oXUIPAcLB3jl6Hwgze2Drh1BW75MZnZWjiaSASX9zxM=; b=jpccgJ0vpxCIvwCM
	XM35IV5CaI8D05EHICrRy18OjaGD2huINdKBjKun8XNEFDq3v2Eqf8G+Dsbtflsb
	07GxFv6bpfgLvJk0XIdh2jGDluJPO3ULpilqke/aIs33NFhLM8MR/5+2MUcdx6/O
	zrC2+5pr6B+s8IIQtRLJ9TNedsth+ZiRVWvk1a8rZOwn2mTzk8ZfbLi9FM6OC/Me
	l/Eizp5S7hn0FyMs8+GJtOA6aoUtpBLz0FGD0aP1Zjq0QAF3JCJdIPTG53UGMQ61
	HzgTAi71jGvE1v2gBjLwY1jkCyotFgFkVJ6nlTfuL/jGvzcqkw8veX2uqkjj1o/B
	3OyMLg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ajcxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:01:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e629c7b16so38515685a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792666865; x=1793271665; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oXUIPAcLB3jl6Hwgze2Drh1BW75MZnZWjiaSASX9zxM=;
        b=VR9TQK5iYViNgPLtW/KOWDVwPAuQ1tet/wuNFjeR5SE0iY55dS9ul1rmkbis0bIIL4
         i+qoUXnA8/r7WywXKtL9pwBIX3zAsf7d6HMrXP7RM/fL3NRbA1Q9IhWgA+EoKT513yMb
         +fLv+5FORTvlVSbT4ijSW/UMvbVV7xCj3OnvYuyu2V3qOcFTvF3TEyYMuw+9jTM+s33U
         QrmD+O4MOqErgiO2rKfFgCJog94XSuspXPF8z283I/6RlmWqPOsEypycDdKHboyY4dUI
         qq0V9nMRv8+R0JFBlRblXMu6prUQfGdwInXoBgbzR1Egxq8Xof0zbEV+O7PgDNXmsl56
         tiHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792666865; x=1793271665;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oXUIPAcLB3jl6Hwgze2Drh1BW75MZnZWjiaSASX9zxM=;
        b=vsuxbryE/BEUVbgiPHRN0wr1t8LcIsQVMAkoksKUdemHpJX7UcesiHdJf1aWkjRMPB
         VSc70yz64W30Hc9tjSkuao/B0tB9mIAGJEvzRdpH6SQkVYJ9vuxSXdsdW/Ua3qDE3IPK
         zAMjY4PF7x1UDiFLyJ7Z3bw3ufejJ6BX5BO6iSpkympgu6/46icD5oUqx4QgA4coDR3q
         wA7izvYjCKY2g3W5D1zTQzNev6cjQFxj8M1GbB3RblaGyXcvpU2FUfMcW19wC/nOc0co
         4Uew3aCbhQoyHL2F8gHCwNhxn4XK08me0vUcO5BEl9tReCGvwucEMxDBhiLd+pBmpRSP
         9zKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgKvwR61bRbz4vMBn8N+oTjev56fTgh34vjGnL12vkKSzFUJYSPlWlNLWOFKdQVc8fHNumN+ysvLZ6KEc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvNTGRK6VwmvtKd7VYNZLxc03FiwMIyR+FWgi+8vRG/+vXCsWr
	OiGZNavC50pxRav3e/LGrc+iF9KE+G4rv+fxr+ubUFUKH/aNVOAjINoxx6EwOPccaXGHcEeKWQ+
	3yQ9dPjk6ISamFV9Nkr3VMcMxTBriepKbwScc61PYBnG54jT804KeKnVz4jQ7a27HxTM=
X-Gm-Gg: AYBFou1vEylIKbdpj3Dx5o+k5V1mi6/TBGw0hL8o6Vi+aNnWr0saBZgOGf0GChGjP4I
	xy/619WTWcgH/P9LoKHG+PqAjdU+TtOswr6RsKGdsgUyxFUSFRacz8aQf7llCXExvL2+dT8gd1z
	d7XHY4kdiucP9s/m2Sra4wbSOxzLq0em2V0CsV8KPLt9gfv0PUmB2JHRD14jS5yIDwnJXZAnpGV
	bFVUwfCqtux9BZClGLVeqZDfMZrB0LRNITJHcKcvw9Pf0hSnHYpmteOK1vfFV41MNBzaZN4htEe
	8D2CWChw+S2kIWgibIrFqyUhHjCNRA4WxiErOwDZELJaDP9qYJKGuhB+FQWGp5G3rvTFf3/b8nw
	7Yj3f6qrA6SjwFWId6j+gUQ==
X-Received: by 2002:a05:620a:6493:b0:939:9ef4:79eb with SMTP id af79cd13be357-93f57ff1ff9mr1002785085a.6.1792666865013;
        Thu, 22 Oct 2026 04:01:05 -0700 (PDT)
X-Received: by 2002:a05:620a:6493:b0:939:9ef4:79eb with SMTP id af79cd13be357-93f57ff1ff9mr1002777085a.6.1792666864371;
        Thu, 22 Oct 2026 04:01:04 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b416ab05fcsm1203634a12.18.2026.10.22.04.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 04:01:03 -0700 (PDT)
Message-ID: <79efa2e9-e94d-4cb2-a260-ead51da3efb6@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 13:01:00 +0200
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
Subject: Re: [PATCH v5 04/11] phy: qualcomm: qmp-combo: Ignore Type-C
 orientation for Glymur DP mode
To: Nabige Aala <nabige.aala@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa
 <abelvesa@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com>
 <20261001-glymur-phy-v3-v5-4-3848c2615d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261001-glymur-phy-v3-v5-4-3848c2615d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MyBTYWx0ZWRfX1whNzynBRllr
 wokU27CTPp5HsLGSTgSBHRAT66ULadPzH2abNDBHAYHOj735/ngWIemUIvMW1dk+KukiSqiErev
 DIm6waCcbBrHAAcbhYyHjxmtf/1QiQ5yuxL133fyGa4cMAySUSh603t+3dVrhvQlDQ/3f6Z+FCN
 1LI7OFJ6sYhN7RLfbqIP1RhRFwbbuiH5lPcKXxmS76WTU6PqaxlGZEihob2mfsHM5E3yE5ATFsG
 q6NShrRJaDOTrQmfCMI0wwcr8RmgteDtMgeJU2f4g6XAuffYcl03ky02LTuzJf+AFQ7wdngw4+B
 9ext3R4nF5SXy7FffWUR/y+gV/R9hTXmkBVG9/dsp1uvPsKgL1tCHgTsOfkJIBqLBbkmPFhlkzY
 /YS0zgR5kmlZgKbGnXXtrd4RRzUV1XdrnRxhzucB/SAzTlhP3GcOk8bdWXZgZY3nulrtwysKKYL
 LuZeAIXm7bnWdBMlORg==
X-Proofpoint-GUID: W_xm9_IN8qaumwkLZ0XxEU3TcEnWAWs5
X-Authority-Analysis: v=2.4 cv=feg4WEQF c=1 sm=1 tr=0 ts=6ad9ecf2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=cuVGQRL4-KZBxk5-JMUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: W_xm9_IN8qaumwkLZ0XxEU3TcEnWAWs5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MyBTYWx0ZWRfX6/+S9VFXuOlk
 vn1oIJpk1QhIHZaaUVt2QFMz23W5ku0eiscMKM3LEBqdgbIjf/P3uIftoAw6vyMjWheq9hpSMPG
 tZvPin2kBDJi56Ykvag1gKY+XZ8dDX4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220043

On 10/1/26 11:34 AM, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Glymur platforms use a fixed DP lane mapping and do not support DP PHY
> mode reversal based on Type-C orientation. Add a configuration flag to
> ignore reverse orientation during DP mode setup and enable it for Glymur,
> ensuring that QSERDES_DP_PHY_MODE is always programmed with the
> fix mode value (0x5c).
> 
> Fixes: 815891eee6687 ("phy: qcom-qmp-combo: Introduce orientation variable")
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
