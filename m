Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501962;
	b=L+gDHFth4zHqxR2bDHFzzSbOp/R4e0uMRMZAkRGO/HmCfIpDt+82zanN+nwCxkRb8zem
	 0+lnNf+dS8Gm376MNnJqKIAfF7sGsHDXyCMHVbDwrWUsG3qdpYCiLlS6QKtTgM7QA8uW8
	 DlHaxZiz87tJb22wsxzaXjirpYDumhJntOWVn6fXJebh510lS/I4pohktrkd6OiTYJlMo
	 WkuaHU3pzxSn6QXIHvwJtVwot80usKr9ExORkLwLA4xIkjKCzf8MlltYrusCEp/rng12p
	 +1ccfWGDSMJelEYQa2eE7tfVCFbJA5DecIU0sS5vZ17HnXcHsrWlhsFvTdHC7bg3iRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501962;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UW1vQbaFWJhWbULotNLMo4piEQJWdZbWypx45nJnwSg=;
	b=jrrdlQ24HpqoAMyH6zkqNDmupPDESfs+JymfsXaoHqstYOA5M6Q7rO0tgLX2My8B1sYu
	 ogpaIyVi3XG7yoPsbBgDNHgoDiTiwtfZybShPSRMgse1fIDv/qi6dvLtv5EFj4Xzg8WZi
	 NU03Nj8pBVBSzqw+KhZOzp+cyBn+nzB139wPhoSGIAeHtOVCqZAFJtukNAYQ2+CrbcGpo
	 e2WeV/KN0wHVSXTdt3X7mYgfcfcjL0AuE+9r+cvpnRqBVhq6mDcfrLCrmcfa23rGnMp7z
	 fEH7Rgb/FPOH12/EQHDNL3qVHelIrioH1LUtUSwlUSGtPFPbt4W8BJLEEcu2aaONypg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="MP3ZJgF/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CttkPhLZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96538606A321
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:12:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96538606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MP3ZJgF/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CttkPhLZ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KD9uLZ1781334
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:12:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UW1vQbaFWJhWbULotNLMo4pi
	EQJWdZbWypx45nJnwSg=; b=MP3ZJgF/FAlQUyDw6+XzcQi5v0bSP+XtRuLy50Le
	fzNmSB3NjW6qchpcOAY2bNp3FTzVpERDE1qbj9t6SSwrT7cQersODq6vT1aBbwwj
	EVImjOpK1o54RHAaeIpIMExbMjyaypbz9ARdxGL5DoYeBcDziJor30LsL80y/NpY
	cizTIJ4RED5a20FCSFytRKs7FMp8oA5qf6UAJbKXgIRVwIZkRbBEqCm4uPiknK7P
	ur9OkWND1Tm48bsnGb6GLtrsPUeL0Lb3l6Rxg/eTLz8XqW7qFm/Bg00rJSr4t2M/
	eaZZy5WZkONdeNv6HOr0JN++S8KfnS7SfolkCXiyTyNYwg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h28ata-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:12:40 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7c10b8abe29so2632712137.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501960; x=1793106760; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UW1vQbaFWJhWbULotNLMo4piEQJWdZbWypx45nJnwSg=;
        b=CttkPhLZfpnX2Ae+1gxBfAcHoIhbwLTV+bx8gTovNjS/FvaUH40K93fQaGpUQjuE2O
         zurhAZ6E+5cbt+/ycDYotvtTkL3ZgdXSqU6mY3umpKxYPY7AFvKr9FcUe246bnAm2IT5
         002D+Aiz4zvaDCA3LLArIIKjOfIoT7V8oF0Rey7EeU7QPJyLcWEsTIZPNNtvtNdzE6ht
         MIKzs8On9BSCJ+9wOaShmA5Zhp4y7RESZij5omuHFUPzECt9gqjO/1ElqT6sbAwdk8ef
         grG7CDcZhrdnhU7MNwwyE/U+Rmo+A9EVEzgI8Uhh1NlYRoK4IBq+yJS0T9iZsfWnN8ZU
         W8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501960; x=1793106760;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UW1vQbaFWJhWbULotNLMo4piEQJWdZbWypx45nJnwSg=;
        b=qDW0m+LeM7PLPCb/t6hjLAmDacXFtMCHQYbCzK72vb/SAI9hX8BUyrZz74em2ISnzA
         8/T+YLWQ42mHyHfr04yI254IjmpyLSxD109+5apTDz7juXZosSi2JJDDZB21UrGLIUZj
         1IafPphtc3jt7ExI4ydcgbnbhILQ/OX1jkIzupALvKXKdLu8E82KEx4XceJX8VTnhuW2
         amJ2rHDRTm8HzvAr9HbkUNDwnKcywo1LT16dY4wLQhDMHX8QdXu6gXsWNFu55uIzPQ2i
         G10pUt1BY/UiUc5hQuItEipjP4iyB4Z+LkGZDXOCxwxE7cPgwSYnMULtY6HSc1LD6nCR
         hJlg==
X-Forwarded-Encrypted: i=1; AKwUvBxAs4LRXn1Io8mDWdRYm5jAxt7X0Vpi5PtZ+G6wyUXDOr4D1jAFBg9LhWDlAoKuid19z3ifb+Im0zAJ52U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIG9P+A/P6Z+gXwzVXM4zTHDyY5GI0kcgHVHKECpDN0pk0Dd2qn
	M8MRMv3OfqkMdiEuGMiargcbbjZ7/CIjVK937lDrUlmjaUkVe8AfAVF68u415k8iyiDqKWp3mB4
	BCMM1OGEe/pQTl9LNwiC/seymaL7tUONteEHdzB+ZuQR2PGYMP+It79wei4ci0x+Belc=
X-Gm-Gg: AYBFou3oV1dNG/zP5H58MeJM3fanqDaYClRqekK1ZOCTbtHnemfIX0JpYu0u5iD7nIp
	x0dC71UR8PXmzif4thmEnPDJhHOXVkEnqjE3zMT1y0sXdRrtajaZAljgiUwzPEJAx8kflA3LQ3J
	in+YUm+lImsmrbzwkn4vrJTZq7voULz65stWBsg/Odu8pjillpCNeARpHpkOXeWLEnb5cUUN0ZD
	oHwGKuxG0DNC71+EW4ICQV9G/rIXgmlZdFAZfj84hiBWbyYSp1fFoFEUPgOmewpEUByib4OiQSt
	rDlWFaILSyHsIBBFAVH/NoWQfirsH91VSsjsci2KqSKK+wrCmipNa5+/plTRp2J4QfIofItr9eV
	/0t1/l0ZfThtSYUzQ
X-Received: by 2002:a05:6102:509f:b0:7c8:448:5237 with SMTP id ada2fe7eead31-7cc36a05fe8mr2648190137.24.1792501959601;
        Tue, 20 Oct 2026 06:12:39 -0700 (PDT)
X-Received: by 2002:a05:6102:509f:b0:7c8:448:5237 with SMTP id ada2fe7eead31-7cc36a05fe8mr2648176137.24.1792501959052;
        Tue, 20 Oct 2026 06:12:39 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f69d9b1esm47118715e9.7.2026.10.20.06.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:12:38 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:12:37 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Cheng Jiang <cheng.jiang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Add RF_CLK2 clock to
 wcn3988-pmu nodes
Message-ID: <s2a5sfz2pbyvfzlmwwteh4tptrbaphpelvd5fomfcm4tfxoq4r@m6zdxbrmvrp5>
References: <20261020130852.3049639-1-cheng.jiang@oss.qualcomm.com>
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
In-Reply-To: <20261020130852.3049639-1-cheng.jiang@oss.qualcomm.com>
X-Proofpoint-GUID: Z58SolMb4uz0vyoSlv-EDSt0kXEseIEm
X-Proofpoint-ORIG-GUID: Z58SolMb4uz0vyoSlv-EDSt0kXEseIEm
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad768c8 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=9xTM98GwyULmpW7hZsAA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX9a2Q+FDjBwtI
 VUcU9roLhTFIimI+ey/PAIDAPexMkRN1SyhaBHd7sO6H7gruIj+y4txg4ElcI5XdPftBAW5HRKg
 8Fj91BANEXd9DwPvtVIJT790AN9ZVZE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX3WFN5UMKjsa4
 t9OxDVaYXKxxkRScy0rViBI5/I4ueL+Th1BJZ9vdFKkWD2Ory2kJqgaCbSdlfqAZMC87BRUs47e
 Rz+5fahIDUBtQyYfhHTU+mmxyGJYZ17LDQVehUAAo3YYl2MQmKi1CF4/+eV8ZoM9CXrhAb+e7cK
 Pbwz+s8kMcUcQEXC6rNxNJVD8WZoPjUuz4Nf5psStCJXhAueDpAc7LXrklZ3S1T07tli0fnkYTh
 GK7VNFBAjixMxHQHpeUMatFHLD4HV+9CvuYHl5xRr9oqM/87I5OucvSYxz1N3sSNsUQzLAarsHy
 2EaQuHAAI5hJ4vVK4PQqXpACG7HlFxYLXf4ICNtoMIDoYVa6L44VRLVKt8fBo0VUM9GYdMfDlfq
 XdQyaF7gagOsKbgRk+AnMPuvE7wvxmw1gZuei3NCEuqsGwwrFBwDoUKEDu7xS9OBwb3XBJ4Boiq
 urL1iEd7PXWci/55DRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200052

On 26-10-20 21:08:52, Cheng Jiang wrote:
> The WCN3988 on the Shikra SoMs takes its reference clock from the RPM
> RF_CLK2 clock. It is not described in the device tree, so pwrseq-qcom-wcn
> finds no clock to enable and RF_CLK2 stays off, leaving Bluetooth unable
> to come up.
> 
> Describe the clock on the wcn3988-pmu nodes in both SoM dtsi files so
> pwrseq-qcom-wcn enables it as part of the WCN3988 power-on sequence.
> 
> Signed-off-by: Cheng Jiang <cheng.jiang@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
