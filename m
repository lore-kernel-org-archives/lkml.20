Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792443850;
	b=2ugZ73axyJHKbwhzjkcXsjkAvI4gkWVJ0Uno0gWVKxNl4eZnNotU78ltNgFN6yqVAKhO
	 QgzSzV6DwWCShFj1HLTJsLILcvC7qfl88f2/ilYQPSirrSk4Tr9zhGakjWD0Dc1kqpTSN
	 PJmbxchp/wfXg8UWF5sx+MFLNw6XCvhqA0fRUrg1cJ9Rkhk7kwntb9iJWG+fWn34IreRn
	 jugvAWXPJXP/n5wbRvDYyabW0KCf86a21bd24zvIYlDmZMRHyJOL/XCQ9Vb49+204fIYb
	 ack0jrlb390cEO71iGorwp5LzUREp9ClKvLZj8JD91jwtBdSKa3GnpsxvvtlRXh3/Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443850;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=blTjjTu968skKectCc+Yq/rOfNGyGv4vOrqn0909Bn0=;
	b=nxPiPpYypyxHg9lixqRx7ZiQpuFpKGbK0J4tUSZv7FQPoe1joFl6dgBnaK+69dB62AO4
	 tgAROt4StcLzlAiHwLj1q5i309s25g9awEf4gZFykDc0Yv6htWOYH38uve9Fcys1FEDqM
	 QhK34K6eWpL/tNVVHPPUiM7G74eNlm2FhpXegXvufoWqGhj4ebHdrfuJW5yStuD5rnzDs
	 IQbvOqjU6A0R+Y/as9vGSYILyI9BJXSWOccRlpS0hQIeZH8scgdRa3XkRPLQMx1xt1POa
	 Pu2+kdPlq28/doloPIC/UuIqlcOHLVBZigYLh/KtigXnfKqicJJwZpouqCnU5HqvTwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NG9cy6sQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JT1aN1lc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F67606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41F67606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NG9cy6sQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JT1aN1lc
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JJJvgZ3328384
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	blTjjTu968skKectCc+Yq/rOfNGyGv4vOrqn0909Bn0=; b=NG9cy6sQH8ZkfYkG
	H9XN29jQrzjrkPwM97s7ROfLzJ4085SGyOHFIPYfqOFgmvx18QlIM0mcN9CYhPR0
	lue6R7/7a1g+mterYAsZMRmHr77CAYcI7npMB6EjJbssC693Zq1Dgft4FBKZ+pGW
	R8uaqXhv2dxCpxnGl9RyG5AiFjj70fIjWTTn1O/jkMac8LvkKK+TwE459/mC3jGF
	FgkHFmnEbMaz9Oii/9Ivak9rluRfdDSoIwYppb2L1XtOFhQ3gIxzPzU4Sz0tWjjU
	lpqbfoeTwgUWv9F2G72fc6SuuXQLTWQejgRRQcA2gOjnexmsSwV5f2k6o0lJYANE
	+uz8Fg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdkmfj11u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:04:09 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3592749a017so82581eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792443848; x=1793048648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=blTjjTu968skKectCc+Yq/rOfNGyGv4vOrqn0909Bn0=;
        b=JT1aN1lcDHBfZRx7o6UNu5YnLK5/JhnqH/T2m3MR6E33x/Yv4aECubt3RVguI40KJq
         2fVRsmJ4UgEw+0Ao3xuSr/LBYVTmLYQKYWmue9Fny82eidZJ7MVyBTPIIFjlrQlDXja1
         t0hFniZoLMZ0LGVQxEVgmIigH4M0Yri8ioLidolqYbHioG7HDT/Q+JSbODjVB3hMICAv
         oQnBToWUc9nWQCMUnVwtVj8TyT0DO/SYqL7CyBOQiXZ8/7FtZ/C6xB3X0rp9nMKFjcVB
         YXWDUElofcC12XHjglaYjDbfDpDjBBNCacLc7SW6WnWJmNxK1y1WX7Np/OGTU7li7r5E
         avIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792443848; x=1793048648;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=blTjjTu968skKectCc+Yq/rOfNGyGv4vOrqn0909Bn0=;
        b=yi2U+86ZQHY4GRsYJ15uZIvouX+zZqsRCpX7AMQ3pxIbBSBKPZpOZl5HUchPBZm33g
         678wLsek900qEGP13xgdnUKtifIW5NJcfGcbl2pOT/uVJcVg3ZIjuIpDw7masClbBVFX
         xXaxFi/eGWrtQavqdj9xW/lKfags04T3mhhr7qbzmQqEOogCPrfV2y2XFFe2aK2Qc0Ya
         3pYB5cNc0OIjQIMcL3bY6wO+B4D+br2VG9ru8gC0QozpBkQaGlSjWEu3ufOAs644Bhye
         SQ7Cvq+z4RbEtkox1Ko8Wg39GFLXwEDMAurqYXtVap/sCdIqAvH4TIlECyyYeqMzNHaE
         8hfQ==
X-Gm-Message-State: AFq9FYIPdHBEaQhTJGqD9e6pTh0MseCxYKZHDlStI5GbywvLQ8zYr+ee
	xOsXp7YjY4mqOpBHrnGpfi7tLWOXqVsXPc+d4SpHG7i+6lBLUwrCNe7afYdX1q83YI/Dh2sJgnA
	SuSQIB1B7GxJzWaAZJiGnzEYjYHg85jESzEV5L6QmHQS00Dnt0V1u8FVyjpqdEF5IH6s=
X-Gm-Gg: AYBFou3t0MeQ2i/TZm8ROO9MN/5Z+KRKmDXlPCiHO16Kcjkv64J/6SCcwVfqK+crV6L
	dsZnyLZQpDeHi4q+lKer/HJDoBzprWCYrTRXZAZtKCYm6ff0o/bGWrs8FsKywozofPx9r08x6Un
	ClnqcpOk2ffwpk3ZOW1hgkaJplfxckUSGcoyGzwdfXbFhLeR6whBJgNB5z8l9w8MPKJdnBCjioH
	3O1udDbtVHPEl8D8Q6tnve/EA73JqzhwnNL59y6ockdt1GOvtK5Fh8zN+nF8xCsNM2kr+YMxvGN
	z4qfjDfaVqTVjzmRJGczNsCudt+CpCT5dUihfJOw6lvYnlFstimiRW3iF0CJ5FGcmcwYOGCLeeu
	s2quwnOIvoV4LjTSJINxDDIDaymx8coL3M07zaPItug==
X-Received: by 2002:a05:693c:8214:b0:361:a195:c46e with SMTP id 5a478bee46e88-365f83a0701mr382418eec.1.1792443847750;
        Mon, 19 Oct 2026 14:04:07 -0700 (PDT)
X-Received: by 2002:a05:693c:8214:b0:361:a195:c46e with SMTP id 5a478bee46e88-365f83a0701mr382370eec.1.1792443847154;
        Mon, 19 Oct 2026 14:04:07 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360826875b3sm36508652eec.21.2026.10.19.14.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:04:06 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:03:57 -0700
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
Subject: Re: [PATCH v14 06/32] include: trace: Add Telemetry trace events
Message-ID: <20261019140357.000075d3@oss.qualcomm.com>
In-Reply-To: <20261016185553.2794459-7-cristian.marussi@arm.com>
References: <20261016185553.2794459-1-cristian.marussi@arm.com>
	<20261016185553.2794459-7-cristian.marussi@arm.com>
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
X-Proofpoint-GUID: NeOUWMz5RvMpY0RAuSSWeyXfJwX87ceH
X-Authority-Analysis: v=2.4 cv=O+isLx9W c=1 sm=1 tr=0 ts=6ad685c9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=qlR7w6QO3uULSQa8ePQA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA4MyBTYWx0ZWRfX4+MmQ8E/ZfbK
 7/LMqp76+gkYSeEmGJuLBAM4ew983+mp+BhtBEsf6I0x0L6Rzber5ElwEkFsy5K7we7VQRQnmAa
 +quCM0QJgKdHn9PKcHfzrR1ZYbB8E7cDrE89YnAz6FhS7LzajSsmNQ8d0AVqTlvtnsXHSlRmUtA
 UAhQp8lzUqsFBjIANVTaniXE4KRr2T6c67gFUUtOnFpuwgf2WfvORy+25bom8uj1X1Hf6MWy4d/
 Y1vYlRGhJvV0nsQuZ3Sy6pEoicPvsbkPS0PDmNwP/OOfP4wqdGgJP2rN8gddC+1DDOml1JBLmNH
 lgWOTBW6AoSsSuG7+rpMLXpsBaFX0EG09+oMeiuVpkVLZgljs45/Qvt8+uJDCMwr2Xsq1jMypKU
 uMrWw6eRum2qteBd0EosV/GlyvQUEzJPFhkv9vea6n3Boa2UD7P6viiHoGV6ojjrG4T1cjIlRhh
 pTpq2jzp/PuQNGjjypw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA4MyBTYWx0ZWRfX9TUPVxewu+bq
 ZsLVu9tqfcsu4MdlR9cWydbCLRPLvsiV/eIQjs1uat1yLREnL/vWBWRNKIUfoIRa0CI1rEKXbwR
 GDiBMzkAMHklZQR+cjirNtdWQEu1d0Y=
X-Proofpoint-ORIG-GUID: NeOUWMz5RvMpY0RAuSSWeyXfJwX87ceH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190083

On Fri, 16 Oct 2026 19:55:27 +0100
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add custom traces to report Telemetry accesses and collection events.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Fairly standard looking simple tracepoints so FWIW
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

