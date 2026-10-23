Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792723635;
	b=VH8O579j02W4xvQUOdLsBZ4Xhht6y6pSBH4XLhXiAqj9iNib9K3Uo7lCptrSyxEFu4N9
	 uKYHpn89+ftkE9L12e7NrdozR/Y/N8kXlWllH3NqQ61lyNmGU5LCvgUzpMwQr7gzlfDNh
	 CQOafTTJ6mSEbXiRS6yhDrYaQ8vYiiQYH6MMPS7czQJD6z23BbmlbA1F46SoP/CLzMdcQ
	 1gyrB3vde8XND2t/9ADaZq7l4HjIdK59yuH0fBYS1/NIx6XOOfGclDEYBNfBaLUS+cVjq
	 X1nI1aMJY3RXtZohrfAR2zs7zjnNWJ8nDKJ2d+xz4mVSbybrYaasPER2nFTeh6asFMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792723635;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qzkcBMxdB0AgfLpu2YLCDsMP/8JIkwWl1aJT9/SZT4o=;
	b=rScbteRoL4Bx6XrHEKplrz583tGp2/dnyMwAoXzBNf76v06iMRxwaZgGBM5jr8YCOKk7
	 2nuZH1hcGdJjh8nnFzZuRE5GxH1PPd7qPlkubW6YEre2K4c7b0IodGhQH12azX43cxuCl
	 HpOjh9ZLYU3KxcRQp5/KGROU1m/1eEqdXZkeWX8/zUfIYfwJB33uqqbv3CgVOwckxqu1u
	 p5TT4vFQN+404hjNDYkZ1B5O1nqovONH1IPqRudVRp+/t80/iIHb1wIX4daMJv9UsTEgs
	 Yc4GpLTqtpIX15MBv+uWGcYWzJk/n2bNeK03fh2tus90/XgXW/tecnbTHsVAXQ6qMmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T77eDZvy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="T/6sZM55";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26960606A319
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26960606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T77eDZvy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T/6sZM55
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1F8SI425682
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qzkcBMxdB0AgfLpu2YLCDsMP
	/8JIkwWl1aJT9/SZT4o=; b=T77eDZvyacg2/0VU57iAnPJXV5NrUeliWvH1hTnb
	Frb56x5WfoT31b/pPVtODsxU4IS49TQJbCBwAXMJ80qLUqXTEEMlRxgoC78FWD7b
	umRRcUrt3ZbGZOLz6ub+7Ac+8kqTkKaz+GRuQG4Ak3+9ScBxA1wZJqy9FOZkWqUC
	TXLIJaU5E9mHgMhvUasPKzk0ACEfzvY1bf/IHkRjAQkr0NjAr7D0sEPWS3xXqEET
	jpJZSqscTjcdAerR8HKFmzYtuC/63mahdzFokgtnv2SZCGL4iaQ4ypas4XoSSnXV
	LLregcLCl1FYXo1PBKE+MfaEnBuLcPIc12y1n4/+kbOMQQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms1gug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:47:14 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3692c5b061bso1301592eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792723634; x=1793328434; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qzkcBMxdB0AgfLpu2YLCDsMP/8JIkwWl1aJT9/SZT4o=;
        b=T/6sZM55To7DlbG4liHHfkiM1enTifjrdmyO9jdLiROJFqdeQHwUTE9ACt3cCBGcty
         NF4ruU7XnKleR2W5KE57pv2jmQLzg+xKBlKqQdM9RXbxzDLhoZE1juJGegWRTnT9E85e
         zQykmxDYaGVGCtYb6+KWN1N/2hTlHly6+9XTunrjaZDNjL/sNUh8QTFVVK7von7VDfal
         6TwFz7sLoh1uHY5SeEB4uxGzYZLi1Dyn05leUKTKOaRnW3ZnLvHtRWG7gdCyeCGiEIaV
         tduFoZYTF7VCLNVkTanlgFjJBJC5fuprS4N7zJUiKFwDw+nh0MfU7NlqDo2r9dzeyyrp
         bQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792723634; x=1793328434;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qzkcBMxdB0AgfLpu2YLCDsMP/8JIkwWl1aJT9/SZT4o=;
        b=jsWh+dYsK+RTtZZQ7FT2v63p2RavCiqj/8LeTJ1/kYC2bnB5FkYVsGh73zLftlf44A
         vBUUGTnm99PA0YsRP9UkYNwOG1CltYaanylhKJQ3ngNtDp1vUOQGIrt66rO0RsBeN7uZ
         qUgYKUErq9A/vnuUzGn6Cy0yKS/1VNChkNTSPn8xqFdMPdGHPHZZVQrbLaRpYFfeDr5j
         8rz5XUmvoxa6sVL25FGDfe++BJrtyLZtnMyh93lApMzgrCkIGgOSIE4WyGwT/tcShNrd
         Zmya1IVzWaTlzAKt0BMasWSWzTgOR9fLj+PCAXZPIW1cQj26FMR2WCh/nhB260qKzxf2
         6pNw==
X-Forwarded-Encrypted: i=1; AKwUvBwn2GlOKiqIvuXagNTFxd5oS8paMBWptUYZsuW2Bx7NRhsYiegoctR2o3kiWSrWKTedbZbv3kerAzPK4gk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIUMB4MfQ/KvThWAac5V8qkv80LDHox8X4R//PIhlynffmrKUl
	cHd7p/imscXSNNm9jEzeEJgk/sBqxUumF2NJoJF6W1Z53nDHNbAg5DPhhNVcqAqRKcJeM1VukkW
	7z87w31x0r2ddb+Op9V4AU+yZoxfdg/kwrGN2/W79sQX5ePV6oUt4W7m7v5yu0velZRU=
X-Gm-Gg: AYBFou1sKQhk0ZhyRmcLCjGPjUsnsHhNdjUshXCVoV3OE3wElvwTc/uIkz5qA5oCt46
	6iZyuhR38fwCYxs3ZalouEUCoyHZXBLLcJXg8YsUaRWzlLwiMeVsfbRk3Tz87Pvm/05xlgIHeNt
	6pX9ugUq4iXo+nPaEc74fPn+LU0yBl6QIYZQ331OHtH3rQvMKr3ghh3oYzG4sK65NeSwS33fwO6
	diLo6hsCquyh8v7VAvewcTGPdapioqRSrJZFq1Lqe+YNadCKCl8mI1M+TPnvfFSj/44mG2alfYR
	4iSh0Nxlck0fiuvXIPUbIYK3IY/+WH9tK82trj4CZqK2iFCcOXLAqRpmgccXQgPahfs9SvlzDDx
	IU+eQfkCBNoMxIs6vLOXUSfIgsXBqP0ZEomIHfDZUwg==
X-Received: by 2002:a05:693c:41d7:20b0:366:913f:4d27 with SMTP id 5a478bee46e88-369d9815875mr1237566eec.30.1792723633851;
        Thu, 22 Oct 2026 19:47:13 -0700 (PDT)
X-Received: by 2002:a05:693c:41d7:20b0:366:913f:4d27 with SMTP id 5a478bee46e88-369d9815875mr1237538eec.30.1792723633344;
        Thu, 22 Oct 2026 19:47:13 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9d5ea18sm2727851eec.6.2026.10.22.19.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 19:47:13 -0700 (PDT)
Date: Fri, 23 Oct 2026 10:47:07 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH RFC v3 3/3] arm64: dts: qcom: nord: Add SoCCP on
 Ride-Embedded board
Message-ID: <atrKqxb0DgExzYPl@QCOM-aGQu4IUr3Y>
References: <20261022-nord-soccp-dt-v3-0-1a69a4d54c42@oss.qualcomm.com>
 <20261022-nord-soccp-dt-v3-3-1a69a4d54c42@oss.qualcomm.com>
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
In-Reply-To: <20261022-nord-soccp-dt-v3-3-1a69a4d54c42@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAxMCBTYWx0ZWRfXxRnZZ1lABs+a
 ilxENRJ9yVZ3zhbJiDudthAvjC+9mOo93s0UoMhtyoIihGveDTeca8w0I+frGJ4wKbH5PmSbQ/8
 UKrN5Bb8pEzzMCMTF5VwBR5SI46ZL7S+ltVaseNBh/kKpuKcUy5KlzdECiVda9kU+pQwlcAcpMh
 +tGTbRf6QzrIEE6a7RadcO1U9g+Te1GB8HjpGjP8w6PyR1rFMGWyJa9latEwV5L7gVOSfUpy4qi
 DPvaFEcufrwWYz0VaCUpbgMojoPlWr+ZGWod/40slH+yVIGXAXHxZ+QbzVVGpdwkINi6yi9Sjhr
 s09FVghmty2tO5cD7o3qDmjP8B2k1voJZw2H77u9/RzzY/8JWS/a7jHGbJDBqF96WjrzbT0kxW1
 jgwHTWmwOlOvaloWp9sg293RQSo9tJQ95sH6HE9NQrQQYnIge/4VFtYvdXF3WZ8CUzwabqA+7IM
 pLN749zS0SC+5WB8G1A==
X-Proofpoint-GUID: Pb6AL5vEC2TcXm-U5xS1Od81cNbqHZG5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAxMCBTYWx0ZWRfX9twwYiu3LIAl
 4NJmd/+c5MazZRp/jk6yXS39QtOwsomapYmjQAPxYvi7LTTiHgwkOkxSo2RMG6+oSLTzFmXW0SJ
 3Qnx/UTq/+qeE9DmnbzwyDnvIWcqxPY=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adacab2 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=YweHfVvRe2V-vmamJHMA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: Pb6AL5vEC2TcXm-U5xS1Od81cNbqHZG5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230010

On Thu, Oct 22, 2026 at 05:27:03PM +0530, Anurag Pateriya wrote:
> Add the SoCCP remoteproc node with its firmware path on the Nord
> Ride Embedded board.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
