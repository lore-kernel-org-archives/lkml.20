Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868736;
	b=ezIdjbnEXB+MJFLKYo/0zqusVdcOyPcObZcNkuRPArQ/Uy6grDUoqFb+QF/LWgevquAm
	 9gNY1aZRQbXBT6sGWfZzsr+drHo5yHv1RWa8hiBhCPwRD3oMeg8x5BodHvaIwPksScpLm
	 hq4h3mT7uIbvEEU63j5jwCg4BkN3kWtjR7yoFqbSzhN4OBpSESMgu1x54QZ51HZ8cetnT
	 dm59Ts6FcMRbWhgAiGRY/vJZtOxZPex4nwHXjjr3uOZN7k7tjgigZ3Gw1efxOHur87b5p
	 1PcM9FcU+nP+k38X0dEjBqlkO/OO9ekUVtHILdHfOFdaULWmYgA1w4enuzhJsrejmEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868736;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aKMn93+Pdz1KflYpYZRmRShKdt6jXJBXPqsYlhldJHo=;
	b=06wOdbZZU6ldLkKCT3KeCV6RLrUp6cUnG9EgIGhhCuuo5QMOBMLLCLsJrIEIT70brsFn
	 vgPYchQf6ebWW+Pfuer2DD+MBqtdrLFdxO2bZA+wof1SWNP/I2/W4XTeyMjmsak/ykPFS
	 1rlNA8+wZgBuAoBuZdKMiAPO5uVC/5AzONdHGondvopqJQV+Xo9z68QVl9eP0QlgbVvJ6
	 Q1rqJ3AS+Te5lNAUZysn6avvCN/ZS7TshNtUsiIwxGrPvpLL3nxSMZPlS1WG9c9OaxpAT
	 m2tJknb0QNr5iGwa/wqRJcmb6fjCXB82KFPL7M0ICIFRNzijEktqef25FUNCpiK8ofw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=duwbX2bq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KFG9SRMZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C22606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:52:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61C22606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=duwbX2bq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KFG9SRMZ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56U3N64139212
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 08:52:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aKMn93+Pdz1KflYpYZRmRShK
	dt6jXJBXPqsYlhldJHo=; b=duwbX2bqOb9603Ifb7XUTLPi79mBxD4P0AtDZQ/1
	k0SSLKBI05dxW5jcl2W9mROYKSNb12hR0aBBCDqIwRid/j7koacWsDufQHr2wHwl
	tb51kDKeRvVlMwr0fLkR8i19Fp9jwaATCbr+Xz9cS8e2CAZRwpwiyBtKEr9bBMTQ
	aYRaXT/V1l4WnrPLESMwRSCzMxbloDMjhItFQi83sb6d6NrkCcqh+CU01pu5NMGn
	XrJxy28HLL6gAA88R0q4eXGg6ofUBwG92fw+ef/Foo6tCQBrhQBv6aFZ6/KW0/z7
	cjpmS9P8DunvZcMZ+E086ULDnmonWlYefxRgRtGz8UuE3Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrm9v0myt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:52:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93909014c85so351640885a.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793868735; x=1794473535; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aKMn93+Pdz1KflYpYZRmRShKdt6jXJBXPqsYlhldJHo=;
        b=KFG9SRMZBt52l/EkT8L9agPlGLNzNi0xaEfY6qixOKQgcpdVEe3j9D2HDIcFlOguul
         Yb+khRVklHxxK1ZxHFub+/HOcGU6dXhMEVQtM8yejitaFuI25Kee+ogmSMR7pWtI+/CD
         f8znQmaUrV2ElaulGHNyjS41hXMwYdQnEWCbH6XGC2j6u2UvaOKEArPbpbLBY8cqKvel
         ZSO9PExzKeh/e8so+rJcyzhk2rN9iWtNkPXiMgs61u3bMy4RhT1pf4IUZFfu2MNPXSY/
         Lo7YDSz9W5elGosILSlUe+HTHtwk1YHhREm2V0ubumMZqQSQXox+Ridulqu3Pe6+Eo+3
         eAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868735; x=1794473535;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aKMn93+Pdz1KflYpYZRmRShKdt6jXJBXPqsYlhldJHo=;
        b=a5w7iEZHu2NmhoEJfxqh91SGKsKqqy3jbIV1NKwlIlo2n19L5jItjk0wsvws7QzinK
         dLUeMaNIY6N6VR3lSrXqzf0qzoAkvHEIHu/1gpQV1zib8k9vw7OSdgm2S7Uwjacp3+pH
         Xib9GxLV63I3kYbtefaEUQPMRT1g5sievNTpqlcbyVJ81/39zmCvlTC2EJIDCcty23/8
         EFWsfitXdr+HQ2EKSw87VjVELPupGujra9l42uUqB9YVXMycaLenVAMe58YVdEWrmglr
         JWDY3AhfEhBq3nkUCtiqu6lrYWNs/XZ7KkPzv/dur4EyGaKZroEPCvA0+QaOkBEnm8BD
         /eWw==
X-Forwarded-Encrypted: i=1; AKwUvBxGuoy9vb3+eFswzWwIm0BbDKYoToVzD2oVY6+xdXNDTnSWzdN/gsLvb+0LuvGTFfoBt/SYwewlGz94Ex0=@vger.kernel.org
X-Gm-Message-State: APuU4Z84lKKqCtKKhgM+ez7YBsimgAIUYqQgk9YetPTgijIMHBZU1LQo
	FQTToZJwrl4C4qFcSSeyNuo4dOTrG3aqb8mMS33y0OEmucBMwmq/1aLVDPKmD+W0bFKTlf9Qi5I
	6MO1oAS550r3VVgxArAKrYIWW45XcuWXZqkWWAimZkfDj4edchat7+NZqxJSsgs2k3Y0=
X-Gm-Gg: AYBFou2Z7zXCNLYVnSs/arxQ3bwrv4qb1aP5BmZJ5dDsFZKKzYTi8AaWivHwgitprBP
	Nio2qRs8r7/dHW82+G9zGCPDS3Am8s2mVQm6C6vdMq7XIKdD6IxmgeV40CR3x7IAxi6f3MPGJ3O
	g5kjhgkAY4xPxFieb2pas1UvjjQI8He3fRv88Oi53WJxVkdWgL8PnDULRT31zwMhKUiuUtDZ8Xu
	F3xTqe1trxAZiEhOEXrC5X4AkzggbKtK4IawLvMuS1jkbcfmacBDqjUQtD3okj1vEETNxuRXzlb
	pBrxkmm1dPWs3GwblYkpnkK1PRYeMFMtPsKhVPBBmywLnV+UKOVsfys+KoXv0sb8+vcV4zpdzJG
	NpePS4O1MszQSSq/xswxCVZkRgUtG26S/Y60+duRxGcB7e50eNCMFxpRIi6o43nw=
X-Received: by 2002:a05:620a:84c7:b0:939:f978:c1aa with SMTP id af79cd13be357-94421581759mr2865814285a.11.1793868734297;
        Thu, 05 Nov 2026 00:52:14 -0800 (PST)
X-Received: by 2002:a05:620a:84c7:b0:939:f978:c1aa with SMTP id af79cd13be357-94421581759mr2865810485a.11.1793868733609;
        Thu, 05 Nov 2026 00:52:13 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ef2e968sm58243895e9.8.2026.11.05.00.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:52:12 -0800 (PST)
Date: Thu, 5 Nov 2026 10:52:11 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Mark Brown <broonie@kernel.org>, Andy Gross <andy.gross@linaro.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2] soc: qcom: apr: Reject packets with header size
 larger than packet size
Message-ID: <diddapoxu3cgqkuldldmlbnlmlt3dpin3563rhrie5gyvg74jo@ip7omguafebh>
References: <20261101190733.121473-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261101190733.121473-4-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20261101190733.121473-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfXxp9kY7piqhBb
 NCLUBCicddJafwhjL+mea6v09qsYBEFOeZAkMmVU7FAo9iDcnjVhPv2oaU+49Wo6XQADQ7fadZP
 +meMzTkZNuITn1ABTnMQJbgdCOLMOsc=
X-Authority-Analysis: v=2.4 cv=KrHYSmWN c=1 sm=1 tr=0 ts=6aec43bf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5t2Un5gMkzPXvGO7pNEA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX8nZsCpWFnlcg
 Ho/U5u5ddmAKbmB6NwI7ctXi4lzYOAQYlxAsqKOCiFQch0vx+ofb3FUyzOTEopmY6NHb1FcoW67
 xaFW8ZhJlaLQUmhfsuUaHUNmp5pZSe5UErlSiHagQU60y46f1SqO7Fni6H8Hvg1zaCNBj9GNPI/
 +0GnN4lNed2GJAknJJWS0KX0Kmn+9/NoAHbj40NtjnuFZf/XgFb3D+sH18zXTCkVLCTeJOxU21v
 ZsZQwaUzNH25RXT8GPe8/3oGDbqlb8P28Ebt/H5xpqokKz0/pRF4wPZHsh4oLsiel52V3pNgHV1
 PJvr3O/+GC8Da4U4FFmfwcbABpihTbRAmi+83LI8bsh0B/3jHaPbBdxByti3Iz4exhL1yTxj0K+
 QHYNacth3dVApWUOkpF88NLh2OnFb4l1mhsbTqU+uNwMPbQqNUCZTFsHb4/l2ORwuoIZv8oSnWu
 QFtXzdwniryX0UhcYnw==
X-Proofpoint-GUID: asAkpVYQ8fUYy1ICG6zpcN4xGSFVABtX
X-Proofpoint-ORIG-GUID: asAkpVYQ8fUYy1ICG6zpcN4xGSFVABtX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050035

On 26-11-01 20:07:35, Krzysztof Kozlowski wrote:
> apr_do_rx_callback() and gpr_do_rx_callback() validate the header size
> and the packet size separately, but never check that the header fits
> within the packet.  Both sizes are u16, so with a malformed packet where
> the header size exceeds the packet size, the subtraction computing
> resp.payload_size gets promoted to int and becomes negative.
> 
> Further check "resp.payload_size > 0" would fail, leading to
> resp.payload left uninitialized (stack value).  Reject such packets as
> having a wrong packet size, although unlikely that firmware would
> produce such packets.
> 
> Fixes: 6adba21eb434 ("soc: qcom: Add APR bus driver")
> Fixes: ec1471a898cc ("soc: qcom: apr: Add GPR support")
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-82d40745-1593-4c20-8432-d86099836525
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
