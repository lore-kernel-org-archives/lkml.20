Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792443754;
	b=A2Dduw0LSijZLNf0vRTQnag+lSX3yXCjG50H25C5cEYoELBePbhYtnpJq46QlJ0prA+F
	 WQFrCKvv2FEUFucP9gVYN0rK939NHA8o7+1GbjNDoJp+1q7AUr8M5F7IpFAFlSu6RaHCb
	 hLBRWUHon72PCC6hWtCJUZ3P6u9sxHx6nEYvZmGqDGbjHeR3zyvjtODAaE4Ugq2DjHQdb
	 UlnFeZWdAIkj687My6q4qGSYa8lqihNTpvW5KDzUa8n3cfH4psIrUTooAG8gOLgJqbykq
	 VZC22Vyyrb8cV9SjTxm/kCIOV42Yo9er0Hu5t94u7KplKv55CCb2b2U1BTxG6lOK1fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443754;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OBwZx726/9ho3XoZMIYvptvPiQNJGceesFvYTKcqywY=;
	b=Svo1mukL6FSfiCMqmADGHBcdDn70+jT/w6eF3xnda/VmOwjfztlRHCFJN4EBFvBEmP27
	 O2tZ5liOwb1Qx2Zd3HAaGEgFQUUVdSrfGJ1YJPum0P7emOruykIMJ+AP/yTrxrdQDpP4f
	 G2b9PXs60IKw20YtxOfzdUNEffxTbzJMqGh2tvkSLTLM4Ef+Z3lCA6jXUS2SB9YcmoFup
	 Aw7pqBm3dhS6Kmi6a5mDXJHr1tWx737PQdeFKtDFUNrkTSDYk9btHPWlKI2mpgZNbzsMd
	 +0EH/iYRp6gYRdw/tYcHJ+caBKGrOo0B/AftnMwbsDTiKXjtsDa3/1q8/SzRMt5/KRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iWLJ+KLw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YrY6VPa8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710AD606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:02:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 710AD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iWLJ+KLw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YrY6VPa8
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JJK4634189723
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OBwZx726/9ho3XoZMIYvptvPiQNJGceesFvYTKcqywY=; b=iWLJ+KLwsyLtbo8g
	7uhBHNgEeXH56UX1iDgdr7ckbrl9UcP8hYvhmJnWZksrEdLRGVqd4KePkrhgBJ6a
	9/4T9I4HH+fVyfRKhXGGs8ZUbEUtH7qPUqi93fcBXiTQSw+1ttJ0J5IUeMhne+Jv
	o9z2umVaBQrwb6IDHIwqLQ/gqe0KJVmbPZ3dMq75pfL9gLthJXupNJWdCdG875jo
	mu08ain1Ki9lDk6XdIvQS9nkQ+5BaDRkRcQJORRr27XVIs0hDn0iKwKh1hcTsAVg
	6z7QllGcKXJzalgoqqRlJ1qq/DlC+KVhwj2MMIqnPcMAymgNX3TwJyeMfatct3ud
	OD6Ebg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48k76s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:02:33 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so1548457c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792443752; x=1793048552; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OBwZx726/9ho3XoZMIYvptvPiQNJGceesFvYTKcqywY=;
        b=YrY6VPa8CKW+Zcq8V43jQkjR7ZsgHfc9dNQwuR3AbGMQ59PGJqsTpTHO2Shh2p37v9
         ZLH+YKI8gte2DAGdqpVdFn5758Wa/sIN95J4OeXyxdLEU6glQ2/NeROOmnmEj7fFf++o
         Er/oDx3K3cVMcUjmNzNtNCCDAmK4F+68lJmHgNWkTmw0yDGsTmCndU4aDHATSU+ZiCk9
         9vUn+TTqI8eH6RVsgd1a4/6QtV8xQXWRNcz2TBy8yjiGYaeTzcp6BX8IKCU7XgJNLmg8
         dqgPlyQkPS0V3QVUgIHGXsQkwdzyW33TsUv+FN8fh0Bqp3aoIgc9t2cIOYfeGXJFisld
         ORiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792443752; x=1793048552;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OBwZx726/9ho3XoZMIYvptvPiQNJGceesFvYTKcqywY=;
        b=rUH3jwpkSR+b3/RCNr8iQ5kuWDlvqEXm35HXMRfEVn9B3si/DVCgNE2d+BdheotYA9
         3Arh9RtObD8RHEzetcBT/kn2bm3TR89wFpFqgjSJ5IBnUt0t8LYg5TJTy5dVA/xy86dI
         lLabAo2Cgi/4Q9zcAIV/TCGOoqJCaejnJp9rw/tnOChlQXFG1dhG4p5oTgtmub7O28wo
         PorxeSLc5AIMatv12yKAXb3pvU/L/Ax1UOj/L9R62E1OlZYHQ0bIIgasP7BtEqGG/lEV
         IkspmKTzV+9+gUmAPYVu6qX8963156lo6J3BUJDEBy1bBRaRrccp0Ndn5lZm2IuQf+xV
         /Afg==
X-Gm-Message-State: AFq9FYIrYSEf0WeIh7bj3s/ZhunWAg2eY+GGyZak9jRuEpn4oqZhJRuq
	MxtGScpG/w1UeZgshSJPxlsyYEQbl6jZMVJ3Eb9A3SzU8C+2OVxA7u+KYpFIK8CFNycahdvSEIj
	ThesTTSXAPESfMfYy6aWDQwYBIX/X76MuTI3KnNdweBIrP/ReQzK/3SQz0syYPpsxeJo=
X-Gm-Gg: AYBFou2NE4hYC2udL10AbUxiHFbca261nuhH6gwglKHbgVZwz19yO/ZZUPx7nNW2tJe
	MtiawI1BTCkvKyuilTVof5dyZe+bAQvT9s3klAn+h7q8EIwou7DTnyFfzGKhj/9gPHQIxmzd/9c
	hpe/s39as9Z+NsuITUKHwsI1ZYOnQYMLJVORZ2iZGKf0hE3JNwTq7WFRBFuPOgQ/6AJ/9939o3b
	eXiOBG7Px1CapCo3c8ZB08L+Su2T/JaMakAyLlCR1fxiN1iethJlJkVxEplcwAiZX8sAPMpau9b
	7C8Qy4GFtZTq0aaRbFVS0rDqwztTQK8d2HVR/G+1l73ehv4Yf8dsF42N4QtSQdBdDJzFzfULcLK
	ugXsBJsnmarPiw0sZyooDaP+urk2J/tYj1fT965Od2Q==
X-Received: by 2002:a05:7022:f51b:b0:159:aa67:28c1 with SMTP id a92af1059eb24-18512b3e25dmr12731901c88.20.1792443752031;
        Mon, 19 Oct 2026 14:02:32 -0700 (PDT)
X-Received: by 2002:a05:7022:f51b:b0:159:aa67:28c1 with SMTP id a92af1059eb24-18512b3e25dmr12731519c88.20.1792443735366;
        Mon, 19 Oct 2026 14:02:15 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314b1722asm32711150c88.1.2026.10.19.14.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:02:15 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:02:03 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v14 04/32] firmware: arm_scmi: Introduce protocol
 instance notifiers
Message-ID: <20261019140203.00000f2a@oss.qualcomm.com>
In-Reply-To: <20261016185553.2794459-5-cristian.marussi@arm.com>
References: <20261016185553.2794459-1-cristian.marussi@arm.com>
	<20261016185553.2794459-5-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA4MyBTYWx0ZWRfX6O9Plfqgd7R2
 /bT/tN+aCtAZjV5G08yMUYQfkr9SizVrCJeIF5cCZP8Ue1C4ZeNSlT8Jf7IntDlfUOoimN+L/lc
 b3J5088Xxi39XRtTAzxManqi7hvPuKYvBLl0Uf1eo6od1qaV4ATM23Sv9ppG+esmiE2iBQQGCeF
 kbfnPk1LYxLrxrHysbywO3G5tqH6DGibCIbHso4xlKqV3WmeafwI5ECnOOIRgjVqR8Pfvsezq7X
 4MpIbNt0AF6uAHo6MqKuej1RC/xVFgE9+N75sy/YSuBOXUUV6KvstM05r1MbUficgxX2+5M/ZCg
 0ljQBvszPqA3xxpzKB6GlH8/j6JHvhq2++jArcrpeC0k97Mj5KHN5z7HikRfON5lxYMxcP30I6X
 8dRmTyRUmdBPtnBf/mnxcpa5HVlyZuNZGANq3iyTQAoWUlT6Cf2GG/iVKx1B2LHWE7+/VTtdQas
 yBouw0wj4/jl/KuKpEQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA4MyBTYWx0ZWRfXy4WlxhnMk9e2
 ifQyUSM+rwW87SF2qzPoybTOjVfusMZjYNh0/rhkylmsf0MkhFtf/gy4rDAMdWbBTo8uNS+oDcW
 Tl/73EPCJiS/DumHNe4bmVphDrCiEOE=
X-Proofpoint-ORIG-GUID: 3kQs5_DZ1_wb_VZO1PJ2RFWLQ72oK3Wn
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad68569 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=gIk6nJaUoXxf6RY8mAcA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: 3kQs5_DZ1_wb_VZO1PJ2RFWLQ72oK3Wn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190083

On Fri, 16 Oct 2026 19:55:25 +0100
Cristian Marussi <cristian.marussi@arm.com> wrote:

> SCMI Protocol notifications are typically used by SCMI drivers to detect
> and react to particular conditions: this was the assumption and the classic
> usage scenario upon which the SCMI notification framework was built.
> 
> Some protocols like Telemetry, though, could be interested in enabling and
> registering for such notifications: in such a scenario each initialized
> protocol instance could want to register a common protocol notifier.
> 
> In order to reuse the existing SCMI Notifications machinery, allow
> protocols themselves to register for their own notifications and provide
> their own notifier callbacks.
> 
> Each protocol, at the end of its initialization phase, can now provide one
> unique per-protocol-instance notifier block, which will be registered, by
> the core SCMI stack, on the related notification chain: such notifier will
> be automatically removed during the protocol de-initialization phase.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Whilst I'm not that familiar with this code, it seems fine to me
(i.e. needs more eyes despite the tag)

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
