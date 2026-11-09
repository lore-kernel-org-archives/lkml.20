Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213823;
	b=jvhq1hsL89WcQVwWyHbihHEsAGXsEgBtKwRriocAB1TWPV+hKOk+4YLpmzm5WN1xTh3p
	 2s4BsnOWx5uxpPFvZsFbUPTS+kCXvULCCTh8qZhg1mxevc7wy79A9iPmjVeLECBjfwIH7
	 19Igp6t3S5UQr3hqJJcyy3Wsw8SjOp2WGfNBF67I3Rvi+E4xv2XSBFgN1F/en6Az9I//G
	 ldk6wt45FhzQoI8RlJU+yT3+666R4xnA2ChBEFJwEXz3JxCS9LEzkDIIiAHhgzejQosiL
	 9b25VTyJmoY7BN+lK+K/Mh6zv4CQAdAt9N8A4E4u9+IwFaB/znAMDM51VnPt09YqOOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213823;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QZinr1IAPmVW7r84wj/qNINxqSVY9URVBnEwGBpoonE=;
	b=ZZMgDc2mh0ezbqoD1ICzFJ/45MRjMH81GHfHD6bdt1yaSX3AO1wzGie2T8nSf+AqIZZg
	 PyErGaj8PAoOCFQHXEOcTu2Kmm/hXE9H62qDVqdcBpybQIJyIUZgVWE4DmDhtwRKeQi/O
	 ECYlsCdB3CkY6PNw0C7SiXsRaHegZ/hLX0SMLIrdGFckgAonOgtc9ndFj9tdT6qIAKL/R
	 Y7ulr5eAKVbrgj7RU0F9aMGGJn+P0qaR5UyaTiqewCkg8AFqMzk92cJ3/X1nZPKiWhz8t
	 h2pOU6Z37w6uqeaYcv6wMrL9kt1gnu9QjBAAS0R6ONltYiM7C6xMg1h0/Pr1W+V586w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VvGR+y+0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SOGy5zDI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D593606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D593606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VvGR+y+0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SOGy5zDI
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A969wn32539896
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 08:43:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QZinr1IAPmVW7r84wj/qNINx
	qSVY9URVBnEwGBpoonE=; b=VvGR+y+0j8b0rhQLb0HVC4mSOI+FUqfuaAEz/Qot
	axbIu+LIoxtWGQMG7NMBK2wqU/Zg12WJ2L/eOBsviPDqCh2xbQonaFtAXHPdXrYR
	PwE3/DphKE5hepLXvAN+Tj5xf1iZAdAMlj3EQikKBa8vn5alDS2T+7eaIXOhC0iT
	0ZTAZCaTgW/N3Fqjs6c/JMWNZtQBRz34MjrAIz3R7wSMnakEv8NX0RyOvjIo4e4L
	9P6a2QVx3POhffcGv/RXdje5F/MwAcunv9j1CA6GOcgcpdlY+rjDbxCUf01sAv9S
	i4UvFFYJIpdo0x+Jx7OcfA36tAl71VPMy1/mFy6+ZY856Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsvc6nea1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:43:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so49501785a.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794213821; x=1794818621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QZinr1IAPmVW7r84wj/qNINxqSVY9URVBnEwGBpoonE=;
        b=SOGy5zDIrjS42khZEbmK4fz9VuLy7/WxjHA8vDZB6HHNH43vt0sQztxXAq7BnELLzD
         cJk4PwQBWcDj9e5kQuzljlpaW3bK/ZNSmGhfXYb4V2Aa9h/KKCSe6T3+G44b3Cm7CKM4
         2J0fDj2wg8DePiyjyvbfx9UyMuLT89YPtZuazFHEjck2yv8lOREdPxIXz/suRmjqKiT0
         Vrg3SuH5/ez+WG+1ZhYgJN4XU9ftlPWnAb3zm75BmvWGaR6wbz58kjKPJYG94iJbETZW
         wm9rIYeiVefHLt6RoiMJuwDLy62RHxAaee2Bsidz3Z8MiwydDkoYhG3JICuvdquz+IpI
         eiMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213821; x=1794818621;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QZinr1IAPmVW7r84wj/qNINxqSVY9URVBnEwGBpoonE=;
        b=vBZxbaUDTyecDcxt4GffXIm1V8OPoIvl7vFpmKejleB6Pp3L7PQ7bWlt1G7k6ipPWx
         ifs2EkqZbtrvjKPuR8wpnNH9hFXN2KiJ74bFB0dsWOWQ2S6uZQqegg806UDL/dZv0jdU
         f7y+qiP2O06Gc4FJme63YEcgxFj/zhg36kYQEbDCSXYnoC12DanIhr7GxbSp4la/uJ34
         UQLYCVWJM11id8tdEnw6JYiICFBPlNrZ865LczJ3zhYHT1X/n2Ida0LfKPYI3FhnqpEt
         bJFWq4pDJMwqV2t+IZXyF2gYA5H2q8LijFG2p0L+K86Jol2UqjsNuJ3B1cCnCV5V7/9g
         Qrdg==
X-Forwarded-Encrypted: i=1; AL+hErEFmAdJ3RiPGG+kCDoYdRSuoSSknWCbng8NVLd+EpY4UzXfRfqRFUf9AqRnjQPGSZmRpMFh0AlruOC8lIw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WLDHivk1wXP+3c+5ZnLqEojXtqpDzv5c14YDEnZsLWugP927V
	jWQBttV7sSEjlRpyv9k4ix0jIySIdW/sHKOu/7aQUTCyka0xc0VaTg3YF0PK+4X93d02lKBBmrg
	Z27X8BQ7GPq6atoUSrHM9ZGrUp/Plzz8nsheJUhccXlwuPQbSRGEtHjWlbfIV1yDp/eg=
X-Gm-Gg: AYBFou0Kbh9X6cB5V4DeirAZnOZ0nDm7Us4Jn7gJUFaRoOAJ9309gPyUlno9o4t7RW/
	MIXrbNi4EK1MUGxfLz23LA1q63wguB9LfGnn0uQqTpsYOMN+1fhl3jfaDn2HxmW+4DQlEhhJ+m/
	Gx5g/mTgiXwZ0fP+dWdu6VykFT2qUwXiKiNj1eweUz7AXwyBbHz/7xjPpQM11B1p3zmVNyRgtxy
	6LkTtiaxRVivEDS8K0cHWIK4AgS0D0Uzzq/lRDHExkw4FCK5udvbNYvHlhkPwaJztzFfZl8ACNo
	evguwgmet5P177C4rwAyvvd2V8N18MiEERWnYBarBJYqnMBe8icm+70oqYrLUu7jXl09rOuqmWx
	4s/ko64LoIVujauSpRX9LxSkI4X2Q0Zp/8RVeAyj4ZWpbn4rnbmdt2OXOXvFri+8=
X-Received: by 2002:a05:620a:6601:b0:93e:c12c:fbbf with SMTP id af79cd13be357-947842c578fmr423491085a.76.1794213820769;
        Mon, 09 Nov 2026 00:43:40 -0800 (PST)
X-Received: by 2002:a05:620a:6601:b0:93e:c12c:fbbf with SMTP id af79cd13be357-947842c578fmr423489285a.76.1794213820190;
        Mon, 09 Nov 2026 00:43:40 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b96cd012e1sm111001085e9.8.2026.11.09.00.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:43:39 -0800 (PST)
Date: Mon, 9 Nov 2026 10:43:37 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/8] arm64: dts: qcom: Consolidate Glymur CoB power
 grid
Message-ID: <643lhglqyf6322f3jmioy7xwl5uuqgy5m36wfh7okny67zxz4q@ommxzt73cwkj>
References: <20261106-topic-sip_cob-v3-0-52cd3826ab49@oss.qualcomm.com>
 <20261106-topic-sip_cob-v3-2-52cd3826ab49@oss.qualcomm.com>
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
In-Reply-To: <20261106-topic-sip_cob-v3-2-52cd3826ab49@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX9cJl6LLmMKE7
 oD6znnmdtINMV5UPYvxkuhbe+w+iO77LRkbRVV6jmWLKkV2+SgsF9GdBoOL8gVmcG+LVo4O4Cwi
 0B+PRYZxbjvJcFA4f09/zokbd0zx4/Mt6zgdgIU0QvDW50fFxlOI1tip3JRn+V1YndTLYvWBBk1
 s9WfRekm3SA9sk7p1W64roJnv5EwBmaRJuI1N2KI/i56dlkgzfmQnAhWTKJ/uSbHTilCk7OX3RY
 kr9PoDxsUJrvdvko+4XE+OuT8EpVQzXiYHJmb/hv6vjUstUIcT5pOKJ7OyUIhJ25kiPVSixIogz
 f8zv+rqkgS0VIGVmCkJEMbbC/jxh/8DoXOOSLgaIag4Nir+tX4sLnb3gPl+zHxymdP0ORyhNt8B
 5/Qy92WIr5v/TpPdnw8KGZ0G19mPsNfWfODG/0nD0EHtw+LedDf+Bl92K2Qpm5I4BtVWADoy9YM
 GD1QIXzpRRXIGbhlsWA==
X-Authority-Analysis: v=2.4 cv=WOjqzXsR c=1 sm=1 tr=0 ts=6af187bd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=WbsCytHUCBBKkCb54EYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfXwm5W/DHM1KjE
 leReAgLZ3Up89Uc9KE2Xbr4PH55q5RR6gb9Zr7CusPlSqJrMKCP5MhvyUxArvHFtDHOaoMYozfU
 pZAIYiGS7GQB2UPwCfL8NqNBv9jov9A=
X-Proofpoint-ORIG-GUID: TxoTW2d2Kv2ZJ3_1oa43e-iKzhn7mLoe
X-Proofpoint-GUID: TxoTW2d2Kv2ZJ3_1oa43e-iKzhn7mLoe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090034

On 26-11-06 10:29:03, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The power grid is partly defined by connections to the on-SoC
> peripherals, which (due to various reasons, electrical and practical)
> are well-defined for each PMIC configuration. Factor out the common
> bits for Glymur CoB devices.
> 
> Because some DTs (mostly the CRD) disagreed about certain values, I
> made sure to look up the desired one for each of these common rails,
> they are now set as expected.
> 
> This enables one to take care of most required vreg settings with a
> single #include.
> 
> Tested-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
