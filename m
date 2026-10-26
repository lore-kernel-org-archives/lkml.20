Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792992700;
	b=Zqz4IQfZYvLbJgtsjSWOYR8K49qdjtkFJSAEp9ItGTlo0YknGLkkTPaNAAabiB1V2kB/
	 AebbWaaruTBv+84T+DAstWJQYMi9UaicMkV8UdbhdbixSHjLxKvheRpFYdOetk+eBak4K
	 Es+pnJHaMX2l9I3ZWex5i7gUnxGzMC+pe+752nKxxQYHzmxOm7B+dokIOxzBHTtDNsbqP
	 9NcPStOxpezK01CQC1D4duzWkUwdOxYMufmY+Gq4DdyrKKg811Vifg4hVY36vREmrveKz
	 K496HfSMEF91DY8d0sPzTI2xHP+4Y5HxUXgJTcfGaZ9D3U9fxaJi/zzYrVcJspHhJ3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792992700;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fyq5dGa+rOs8GKUpJEw1gvY3K4JPA9zickD9AlO7hlY=;
	b=jRjBHteFMOJVMAQTRReoU17NJ85dMm1HWPt9IqhNsOTAZtpmDsgfNZ78k8Ss+URBXZB5
	 FvnajqmJXHQpmoC/omboaIfl3At1HN3q8ZTXa5HTk6FznhN4r24Xt2X0GsZ+Q1CttVYjO
	 W1q/iTWgGDJco2zSjesg4a9Owpi5x54onVLdvic0okfeS8xKsCFy2RWDxyAKnI4XqqZ27
	 nR1OfXPOSL1jzP6wFqQ5lSIE7EXu6qg1VNoItW6SUl8e34d6F5sxtvrX3JOjGG4C/4llk
	 HwrYcstJPHHGnCJx7TE6hq7D4kQzw4EM90ILImrE/gxA8sei6JRAUHaeBS+UYVHPgwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ecqGBCl7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RXSuNdi+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E285B606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:31:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E285B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ecqGBCl7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RXSuNdi+
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4bKlf2255639
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fyq5dGa+rOs8GKUpJEw1gvY3K4JPA9zickD9AlO7hlY=; b=ecqGBCl7iDU9pDko
	eAYWdC2ecPWqVsHyt+6amofgkQW9fS4tZz/1Py6ef05r8metQAO5TvfgmR4qUHcJ
	2Bajust7IfA6Kd8TEfUAMIHtmWurqvWK+gFvMRvYktMA8Wd62DGXugX1ex+DUqwy
	L1+cxYsqmuMBgiwRkaSoB5XhGil90xwgua7E3aXKR9NzLLkQpDVru4eI+VKPw7HV
	/Syg8httgcppGTUoYh+RS4ssoLRDiEfoUtkvm+iWwGmsVNnbIACilNx9E2hykk4w
	snN4upute0OS3g3BvP9lPyqfJDkrwID8OKXbjyso1VjMnU7397nJndoi2HMrDfNt
	zsFIwQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmw3muyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:31:39 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a086f5d91aso3988023b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792992698; x=1793597498; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fyq5dGa+rOs8GKUpJEw1gvY3K4JPA9zickD9AlO7hlY=;
        b=RXSuNdi+h/q6CGMw58LURa82rcDEtlgaN4A5C1Q3gYMxNW5WsPkZbQOYkPQ5Qi+QEX
         5jI/vOc+qhPE8BVm9Von+wktI7UJlmXgw5XgJzg5U7HR7Tvi8KrCnyXxpt//rHBDvp6P
         jC6qi9VdszhX6rBiyQAlnksgvi9BwXKfRCPWMeprMwn7TmTyFz9MWadnYetlrq9Fy3bA
         QA2JteW3SIYzVqC8Pb2th45/FSVl3mAm5OtPCVZkm9vKfhPPvn0Bjvl63NgmkecwE2co
         sTdfnRVJzBYuY3BNoHpWpdSz83wVyA4Gon3Op2sjGP+DYOfMSYQVYGz667r0RJO/MiIv
         Ug6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792992698; x=1793597498;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fyq5dGa+rOs8GKUpJEw1gvY3K4JPA9zickD9AlO7hlY=;
        b=TcuNqmUWhMN5dmIDPskJn9ePUv99wQv2ilcsJ/qNWlJNt7egnKLIr5JSwvhD4nCWi4
         yoSjmpKAEq3cnGNEWgZwBCGiLjEgMgPTUX/ZbwIAm14IJtMtnpQIJfqNsz2N633VKqf8
         L3d2wxUCditaO64vyqlrSm4bAg8hFH3AfDw+Hln4vUFcV3i1VjgtvDUyeaPxY6+O81qJ
         FjxRPY34ywPgIxKUHWA/VUw3Ch5cBERBUIZJPbaI3WSfAjLbJapdp0of7FIEgqBgKKJG
         FBORuQv2J6rccfjQha24Dawoletm95NHF4t7XmiYyX5zrpSc5xM8etS7rlg0lRKb2xcp
         RkTg==
X-Forwarded-Encrypted: i=1; AKwUvBwKXzjI4JnSuTQUuTUn1jFDsu6XwcG7fpLONHAbCUioYOfOpEiGTQxxtNnEPn4GCxnqKPHutHvpr46p+8U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8r7JQ2PhXy9suB5RTUtqxvO0KqSptpmrUXPwVE57bBZxM0IlS
	hLrsyMe3ltRpob+LjCqk6ffpX/g1GaS2Mi0zB2qxkUpC9YlRaR5Kt8Hv9/95GWs1OcdnPUQNjpf
	jOSFHIsfCG9k73grg6qKU+hbXOPH/tZflLZisuo+3+hd5m5nZ95PhTw/Q91u5va0kjsc=
X-Gm-Gg: AYBFou2UDIaAbB62+nJoSRYSGME1iUadXCMuBfOLufyMK/35caYmFI06fd+fU6QBTr5
	4KfGCEZomB1EWnNSQNtQHOT7DD3LprUpToHVSHjtTNUVdBLQM0jRQBooifraL4TEVfD3HiNcrOa
	oGsQQbOAUSDn13fEfCAbSZv5Aox8NKPDPLCvEQ4J3CfFveiD1p2S8eD27fLXjcTeFefbM9zY2G3
	fVIarCT0rYp58bmEv2br5l7ChMns8eH6lCQA20uGNJ4cBvXQwCJ6SqDy+nH/LUCm4g1tCTvZlaZ
	8mEUHTcJP5nOea5O/UlmKCQxcbP7N/fmfqTTauGMd+JCKwTDMBSjuCNnNRjcySlkInQRA1+BWzt
	J+vyU7bpZTFRaaRxk6gGbKF/T2/aN
X-Received: by 2002:a05:6a00:a0a:b0:89e:d76c:327f with SMTP id d2e1a72fcca58-8a367a2d5c5mr4469591b3a.34.1792992698479;
        Sun, 25 Oct 2026 22:31:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:a0a:b0:89e:d76c:327f with SMTP id d2e1a72fcca58-8a367a2d5c5mr4469573b3a.34.1792992698112;
        Sun, 25 Oct 2026 22:31:38 -0700 (PDT)
Received: from [10.219.57.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36acada58sm901954b3a.11.2026.10.25.22.31.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 22:31:37 -0700 (PDT)
Message-ID: <9dac352b-6f8e-4616-a0c9-50eefbc4c0d4@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:01:33 +0530
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
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: sc8280xp: Remove FastRPC compute
 CB9 entry
To: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@vger.kernel.org
References: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
 <20261023090308.2898683-4-abhinav.parihar@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261023090308.2898683-4-abhinav.parihar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 68l4xD4an69_4y2O_Yga6R3MqtRPkx6h
X-Proofpoint-ORIG-GUID: 68l4xD4an69_4y2O_Yga6R3MqtRPkx6h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyMSBTYWx0ZWRfXyefuNNY73ob0
 wUPlY5NSX0qrrALx7H24s6J2fdR3Ny7KnT1jn3GuwNZSfb75XLsprcwHEGMyjLEEo/la4lEeM6k
 hHOVmH6tb+PbOfKIL/Rd4IXhA1ig4/I=
X-Authority-Analysis: v=2.4 cv=HqHjiETS c=1 sm=1 tr=0 ts=6adee5bb cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lp2TWI-43rxGvoCc0Z8A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyMSBTYWx0ZWRfXyaCK80Yfr7GH
 V/MxrBSNTsT6uyQ/6QPVbybGYvaN3/+aEFrwkefB9muvyWi1Nj1FHBMozKJa7fQFPz/YGrVH8f0
 25VlpVNJc2vmm7ywO42syczECeFRcpulVDwHo+2/XKbvYyg0CVm3odjMx9S/buR6cVaa2hb08H/
 3wy000BiUSyaUoGArZWzHtwNOKH9pWZKWbZ2xXG9H93PgQd0DuuoyKVYOS7hWkKPBvAofU7Hr41
 E30liWCEZF/TH9G628OXbtkX7TeQ05q19b4J6D2qU4L7YubyudRDa/VcrKCgwzNb5wsyWY3KCn3
 pHe51EvjE8/mAwByUhx59uJ/rm0AN/pM9dKsryoVYvQalJ0S+IpS9KSC/SWrpbFF3RU2RZynGRa
 GMvFVRevOiJYorGgZmPn2obFUHEl7HhY97Xam4DUHdd4jllOcBhoxjmfKdbxGAN2QrawWNPevJ5
 UavYNlFyVo2LgNg5d4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260021

On 23-10-2026 14:33, Abhinav Parihar wrote:
> Remove the compute-cb@9 nodes from sc8280xp device tree to
> prevent clients from selecting a secure context bank for normal FastRPC
> workloads.
> 
> Secure use case support is not currently implemented upstream.
> 
> Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
> Cc: stable@vger.kernel.org
> Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
