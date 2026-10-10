Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5246538F654
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 14:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791643727; cv=none; b=e6270k85Ii2+CwaCbSXpkGNTAl7fqm//1cRmHYv4Uzu7ONbj15RqQS6uS41CZCKH5uE8GAhKxQZ3R0EO8I1PQCBzNdJDPVHSPGYN7TOhsBk9EON3IutWgBEQQ1JIgBm/nFrmKRsqkMidMvnopXWjsbZnrH3MxxlwEGo62LlIWSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791643727; c=relaxed/simple;
	bh=UzuOT92CybzvWYw8i1jRlWTzrFVkI5nKTpxuBg2bFSs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=M4NpFLXuncun2K+3y3s6ePB/VTYryV/mZ0BIubtgnooApE7Guq2lDTnMwC9ue5+hbGHDkKoHGyMUMW61SqXZsr+x/AChtxBHDRNQo9d3QQwfX4nlbU4zsqPBqu/o0ewx+f8mI7MyL/rgGyCCV1G1vD7XGyG3NLlngC1XETFTgjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G3EcykJe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gWmwl5w8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G3EcykJe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gWmwl5w8"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ACUe961020461
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 14:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9EDoraaW4HZfDPss32Nc2ug8E5EIpFGQ5ypvQ5P+Zx4=; b=G3EcykJepng9Rm/4
	IcFivB5I7KHTyU3KxjXTUjPlLY1b8sDkKM5mlTXR+m08mQ/so2fbHdhWOWFp3S9w
	5/2kXjPYsKV9ULweaqMiLTVJBcK4Z13LxGLmwL4vDXAfY8MKc6mJcm7FeoA5YIl4
	bDVG8RZMRYuNZLBfp+E724+JfHKdFLe6d+ElskSaSXNeGO1DOOwFD1l3XeV0qhE6
	+k6c1Y3kIaEYG1TR6+4eKvRPvKt6Brk/1TptuKdJHKjVrB0AgBY1M4OH525FZ6IX
	41VFxWfFrwRMJnuyqP9M+xBwhPLxk4ziS4/J1VcIaFQthmQwJwC5SPXHziKnLcfk
	vGM7Vg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cc69c49-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 14:48:45 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso972573eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791643724; x=1792248524; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9EDoraaW4HZfDPss32Nc2ug8E5EIpFGQ5ypvQ5P+Zx4=;
        b=gWmwl5w8kbchdLpsHukPs0C1hC46pfsGiWIqB0SdTrcg7eG/3k4NB0KSkQEGubAPXr
         VXPm1QgSGrzCKOA/IeZFeUjmXUOoLcLGIb+MNXw3+8v8djV9dthCYO9HB8PQehPPPVsv
         zBx/R/tqMTMAJYq/TMqbSpldBTHAMfAH/KdWEtXG2VAQ05J5ILLjYMEgNlJDBwnxUaa8
         eQpS4+lXjAPMr95F7Ro+bXdFRJi+ShOvaJwO9eDIERh4Hs2FULmIZsAkuya1RuxEdc36
         B3zgalftjRLwWCLA3s8kEqfWPSMMnqnTrcajr5vmSinH+ONAVK4ML6Zd4s5v+BrdP3eF
         7ZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791643724; x=1792248524;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9EDoraaW4HZfDPss32Nc2ug8E5EIpFGQ5ypvQ5P+Zx4=;
        b=wIagLAiKY2XvDfEz3P7ny/ulorMOlzZ9GgHKfv5PEy1TYbwLZs5u0b38yXyY2SsEKb
         IXkN2t1zwsKzqOyvRoPm4v6r/kYvB5uO+GOg5uQfWgbsslsIwbKgifSW95cHsCSKhWQ2
         P/yvjb9mtvyTcyVgwjPMnIGURiB30SZVnQ/B5s1fGp+EJJ+ffMtcZwwgghEg3k85g8QP
         yUijUgjOUqWX4as9MCmLiXXXXbkQSHJ6Pdq62MUO+VnAOd/jN89owJ9V158JpGsXo7/A
         AiAmsx9mwdk2EKct74GCbj2tQmR5FLZAnth2/xbZyIOrIR4javaMa+nY3WxgbVbWm9fW
         nxNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzK1kXRP8dAeu3k6+RzkAUCj0Z9hPFR+4i6jTQsCTcC1h6HXT3evcBpHpGVyZtDyHW7wipgwPOGWpKn/fc=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1YItIooyjGogS6GeUPw4xHDB7fe/CSblVr56f+u/PiNpVoEzR
	dioHz7dLbO6JezvdwwSazBUoNTSVpHqWciv5XM0qDewj0tUzojrLxM/KmTOghIxLZUAw83PvLxl
	a99Kyb9t6vAosj2KdRw6CLyXYDGvKzCfL3dzQchSx2eE3y2NBu8YCfHlr/MebhTvi+Xk=
X-Gm-Gg: AYBFou1xgM4QLfDfHBxXKkn2d7ibcaO/hepSqnTs96p00JRLwAx9cDYXuk0EHU1WRxT
	dSUN5vQ7cBiXzbNa3Ekn8PXI5N8hl+yMkDubBq5lvTOm5P6ue5mIM3BDnT5y9Rqs0+cNZ6kJ+0r
	+GxUrkrjibj5QheItIQftY8NooI70YhG4//OxZxPuBOFG77J5xVn1J9i9pX5af5DlEthZGsaxBF
	QRUqnTo0J85aUtQQD9Nx8daEGATUiFVxjke6zJgwhRGocqYbM3NOVLbBw91T2v/8numLt0qXVAJ
	yqSxcc2fZs79OG8h7BQM46JBucmNgtzIbMcsDUgfuw5lb/r7lYIq2O7thtrc2ZIphGwAG8R6mUJ
	GIEyAGB+VCjdIP0cEbth/2M2cuB7D2zq8Q0P5TGOPCNP8pMwnXVWMRA==
X-Received: by 2002:a05:7022:b047:10b0:144:ddf7:2570 with SMTP id a92af1059eb24-16a5e8728dbmr6573644c88.39.1791643723983;
        Sat, 10 Oct 2026 07:48:43 -0700 (PDT)
X-Received: by 2002:a05:7022:b047:10b0:144:ddf7:2570 with SMTP id a92af1059eb24-16a5e8728dbmr6573602c88.39.1791643723354;
        Sat, 10 Oct 2026 07:48:43 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca7133asm19713287eec.14.2026.10.10.07.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 07:48:42 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260413-hal_rx_reo_queue_info2_msdu_count-v1-1-c4c92ccf77b9@oss.qualcomm.com>
References: <20260413-hal_rx_reo_queue_info2_msdu_count-v1-1-c4c92ccf77b9@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Remove unused
 HAL_RX_REO_QUEUE_INFO macros
Message-Id: <179164372257.2359474.11655670441431181998.b4-ty@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 07:48:42 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: I93fkNtQkCmJiXiLRPD322zxlPD6JTZv
X-Authority-Analysis: v=2.4 cv=XdQcX455 c=1 sm=1 tr=0 ts=6aca504d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=2ChmhLmt-ZLakbd1MbYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA1OCBTYWx0ZWRfX8wi6scmiTBko
 vHErK7o/2TC44ar1Wvp+SIbHBEyHLXBqo8j+F4AzguXWHRjbuAedJnoM7G6h96iaCEm3rgLJ8KC
 0zVHaXKVF3kmr+KDtl6+uVBeBw6S8xVyiSqv2SQjjwJNnLaANMv2iZKi34XkCXhVg8WPEUCFhQ2
 dOF4V7/oO105/K4l4OFpuzOavwipuF+od4TIxjnsVYHqpwOtHXwTqmlXcwT5J3nkkAIsUEM/qwo
 3VJviwrFEMEljrXc8G5XURZarsAGW+2RMYrz+4tdvklpQcq9VxXxKxkA0+vJ/9rpK5pdUuTi5Op
 aB7xcU3ELxA5zykpwfhPCSad8yInlcYpecP/X8Q44JclvUzEDveo9Ad7yWYvK8qZmeHnlbl2es7
 IwZk37UxEKpcL1DdCvhj8VKE9FHG7I70DJWHaTrciUjnhTIZvNgrIZYS8t3kecnU0cCiLDIg3aA
 O68KOdcy7q78HMDmudQ==
X-Proofpoint-ORIG-GUID: I93fkNtQkCmJiXiLRPD322zxlPD6JTZv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA1OCBTYWx0ZWRfX8RWzTNWSxurW
 BBV1QxkXQR6RD2TNVGInwBdr2rYNj3gSpXA161PncBSDyrGAPrlXLUbyu7LVICvZ9PEO3tm9zWo
 UAs5/lRN5wYlFJCOiFsV+kku5hMgbUA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610100058


On Mon, 13 Apr 2026 16:58:46 -0700, Jeff Johnson wrote:
> Many of the HAL_RX_REO_QUEUE_INFO macros are unused, so remove them.
> 
> No functional change. Compile Tested only.
> 
> 

Applied, thanks!

[1/1] wifi: ath12k: Remove unused HAL_RX_REO_QUEUE_INFO macros
      commit: d26b64fbb844fa00d9c95b7e1ae7fa8f546952db

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

