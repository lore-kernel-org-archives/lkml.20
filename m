Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180226;
	b=tKWPCtpZyqzYId2Dohu20NPCA1rqWyTreN5N59IqSJdedH6uslvm1sTVlNWar1sRI1kF
	 TxHnHtXJ/fNn/BMjlKrl/WzBv8zZU2QV2KHy4JALHXLc+6+3yb7uUwY0XUYxruJ6HFHbW
	 lFpy+xDtVIun2V+7a7aR0xnnTzGBvSk31HjxDCnFKUuXAiKyz0MW6dOWxk77sn3I6yjWJ
	 eGFuEkNf9lxwgf/3REpE/p4GlPD37dKSt8b0MpIxkVQs7IC3RWRs1qW12X4iYLdUE1oCf
	 y5muJD56ydsKlufPdnF20TRKCoI+mO4ZeHxWKYz5rTGY7RGKUpL2R4RZyCXTNaNceZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180226;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cz4YKAMCk8KikpnvYa0GEoqBXjnXnaaG6t7Nu7hKJiw=;
	b=syf+GoPx3pOxEOsqp7ghyHGcfxujy4YI94vJji74L0QYqueURkyobCczcVpRXU4Xmzby
	 /MCEOlh8CI0KEGtjetMgwK2BUbAAMJypT4Im9MfsPw3BGjrkOGmnUtJiEPuB11mJ52lXM
	 C8nlEivB3X8t0UT5gE1D/JXb9Hsyi5+2wnZ+BuEo3a24SPOnIO3cgTxjJIz3mNaLXvAyh
	 AtzluiwEXdDXl/s0eMnTLBR6aneKs4HXVThEwRscGkePMWHZAiFCNZ3sTz1Cciv640nnS
	 TUKPoo2wUiYJl7UyALkKmExId6WPc+eN8/ISNvdgNaZODu7IlJ/1QiwZ7klR1IUkQbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nBqdO2Ew;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ryw+AdFK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B8F606A335
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1B8F606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nBqdO2Ew;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ryw+AdFK
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K4Ee557167
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cz4YKAMCk8KikpnvYa0GEoqBXjnXnaaG6t7Nu7hKJiw=; b=nBqdO2EwPD+OP6+9
	TpY6Zi31lkbEfvB/xizxY6iRFclevysUUTbWecmOMJYpzgADZE4NDk+VMn2iwN8A
	iB1+7f1jHtHsyxgO6xxII43EEK0kAJtkvJQDAWnlJaYfi9lL8v/XboMDuwoPCADD
	hfZxAgBeAB0wVNOL8ug9gRSnE2yal1ntScQNDTbjeCcoVMBCqHxYAddTGyuCrpbF
	olxR/1kt2fBMJk6rR4Nm6O+tsQpFrsnrWAg+u8kKei5pi1IOHnm3whxuLJ8qJFL8
	uy7/9hWgG+d8/g2VOxNXZSpKDdc0tZh5XAgxLQ+gXFcWgMuJEmxZNZySjK3i7Xqb
	1OIoYg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk82tse2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:37:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2373e9b4so67050385a.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793180224; x=1793785024; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cz4YKAMCk8KikpnvYa0GEoqBXjnXnaaG6t7Nu7hKJiw=;
        b=Ryw+AdFK5t5+Sl8NMKnleXyGipACJMcpHwJKOJKj1lEY97u3gCGARyfDjF4jQL1rmU
         HZLZKwkhJUMl5PIWJNilk0Q1sw9f7DFMu7989sKC6QrFsJptoryvR01RZZsmW4ybhTJ4
         R2ixY3hGXCDLTURS2T6/tX7xVbS/2jJJ0djpRMMVAW98CW06nITw97OjZG8+x2430M07
         kIRhMlRb5RVMWdoyhMaIAmWpwfM25V/4jEW4Rzw7Yn+33uumG3X457MiVFFYgoGTTsTM
         tWTJz9CP+hSvDOojm/lV6+Bg7jQnepo2brt5RnLBF9Pse8bJ2ZW4nqatrz/XDnnRY/MZ
         JLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180224; x=1793785024;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cz4YKAMCk8KikpnvYa0GEoqBXjnXnaaG6t7Nu7hKJiw=;
        b=EwnaOU07kBG59Ge/KB25cyeFJ3YcQW+mbRadUU+POGlepM0BLUiqesR+u6iv52iXtX
         SMsygSx1levYbKbkAysIzVbmxrKZFoh9w7UU7MbZ0rUhZ1sSZWOJpiy7BZzN9sXfb7fU
         ewzrkl/jr2tzeGNoT4YiEdKlYg+hUiWpb67qudreejtcmldMhGUwUWYJiuf3wqXC2aLJ
         DoOerlpbb6Vy1WZwcXc+4oPc2p9L4/5TlW3RQfgytquMCaCer/G8t2fmGAJp51UpE3Jo
         WkXG8RyCHQU4YjXM76YbWpk+SlOXrixQwcuvcoGqe+YqBUzD44Z/CigApQeY0NpHCie6
         a5/A==
X-Forwarded-Encrypted: i=1; AKwUvBwbRw/46VViYSCEmLZNW8FPvtbi/uS0m2dPi17+/HXrM1HM9sYO3LecOWX3r+yovL4A/uXTDrrzwy70u98=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdbUvbrwAwH0tg0KAL8KRDnXrEkdEY7EnITZdL9cnD4Q3a6n1G
	/uICSSPtasoumUMMtIZwetkbf8RiQecERfMK/zX21h5ZwvlvU8cX0zXoZSYGxFYKpb6xcvr32EB
	sPcrcw3z8+PAj3D9f70cPgr9z3xtL9/lfozkKfQ5uJlzP4URn6hitihvrsc6pOikX5TI=
X-Gm-Gg: AYBFou0MfTCPc3Lp8HZ7Rj0iumQluWUQlceoMGKEPnQA++ABOnq1jCeFIGrJwLKZEmM
	Sas0u56olBV+U6aFBjWlQ3xrXzD9C/CMYJ10K6/uDHW/8PLk8GBiwFP5YryI62Szj11VI2Ci38i
	TeMsRcYfKGo8lp9JQYCLM1qrcgFseTA0xfZRBcKEwRYJHYJ7Zh2Dqam/1rHbAw1e4rXsjRWY2PK
	FkIowh+w80yFAHskirkscbwBYiQLg5vPj+M4GFY6GJMLHqiOk377ePMNmNUd0PfrAhte8YtLV+y
	eDAf8Vk91w0fRgLcE2JdpMs1semlOEt19iGcgmYvxI3nLMEl6Bi5cCJHomDKM3Z5lLzq1obJkU4
	DTbKjPsCs7lM8E4TUoUYX/EYydwdFrkrLpCPyRU84fyLEat5D9IHrYaO1z5UeTbU5XCT0wJ9+U8
	AT
X-Received: by 2002:a05:620a:2a09:b0:93a:824:ac8d with SMTP id af79cd13be357-94408a7303bmr234816685a.27.1793180223766;
        Wed, 28 Oct 2026 02:37:03 -0700 (PDT)
X-Received: by 2002:a05:620a:2a09:b0:93a:824:ac8d with SMTP id af79cd13be357-94408a7303bmr234813885a.27.1793180223312;
        Wed, 28 Oct 2026 02:37:03 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97bf5d5besm38985905e9.5.2026.10.28.02.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:37:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Guohao Zhang <guohao01.zhang@horizon.auto>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] gpio: dwapb: add native hardware both-edge support
Date: Wed, 28 Oct 2026 10:37:00 +0100
Message-ID: <179318021613.11875.15753295922275285962.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023094220.2989225-1-guohao01.zhang@horizon.auto>
References: <20261023094220.2989225-1-guohao01.zhang@horizon.auto>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5Fn9v5WYxRMcY9Tplo458UMHJfZrEkDd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfX6naEpZd2G5PE
 YKUDNNuYpYyOeRzM/Vm3hUu+SJ7YcPonYw4J+pqul9uhCQQWa3qIiQNjH7YxBtPcXtwg/yWbxjo
 3CXYoDgZ3Z8DajMoF+eZacE1Bj9WqbM=
X-Authority-Analysis: v=2.4 cv=Tr1zFzXh c=1 sm=1 tr=0 ts=6ae1c240 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=o6x5aZxaXGoRFeGydZYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 5Fn9v5WYxRMcY9Tplo458UMHJfZrEkDd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfX9RibvhiNvc2F
 D2ERgPPYNomj7om9zQ+yZedVJIa/uw7QOkOfvYK6wi5InF8e5Z/TQwL3dqr4soHrclYpUteyxjd
 VULd8DuIIOF64ldgl/6BkISFfr152B3GbRyLDd4mBr5hRxs0wPJ3blOH0oWK5DurtQbHxNRbfmH
 SWrLlFGDd3wCx4k/yfaFPb2X8C7jNj2MKGwBJ1WZZzLmopZhaujHb5XqyJnjm+yjrdhGcA/Bej/
 yhHmYY+dbFm3KEjW8SGQZmRhi7NByo2Hz6Dl0prsHa+BhryEgK9ug3syrpmd0oRDSxFcSY1HZAU
 nX9Q1evHfraHCV2MPX/OZ9SlogsEuRc48umyP9ULpCTDVAZxK+FAmC9LIrcOPQ9ZD4WY4ENkW7m
 v25f4YSI6nsyxU0NLNubo5rVsanLcHKuvZg2RXPRKh1V2byl+laopyCfujw3Fki2NutH/pUbG7c
 U3AnTERyx8UVzq5PTXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280038


On Fri, 23 Oct 2026 17:42:18 +0800, Guohao Zhang wrote:
> Some DW APB GPIO IP instances are synthesized with the GPIO_INT_BOTH_EDGE
> feature, which adds the GPIO_INT_BOTHEDGE register to latch both signal
> edges of a line in hardware.
> 
> This series adds support for it to the driver:
> 
>   patch 1 adds the device tree property "snps,native-both-edge" that marks
>           a controller whose IP instance provides the register.
>   patch 2 makes the driver use the hardware register for IRQ_TYPE_EDGE_BOTH
>           when the property is present, and keeps the existing software
>           polarity toggle otherwise.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: gpio: dwapb: add snps,native-both-edge
      https://git.kernel.org/brgl/c/29f8eefb7a41e5012ea8c7f82ebab7b101a242c8
[2/2] gpio: dwapb: support native hardware both-edge detection
      https://git.kernel.org/brgl/c/b41cfa014391694a60f9fd52f758943d52b550da

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
