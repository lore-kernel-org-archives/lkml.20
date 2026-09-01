Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9CC37AA64
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 05:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788241400; cv=none; b=VhCI2tgq94IaR8/eXUeNiOZpdsk3NrOj/VW0GzZYrNb5Eq5SudXoVJZymYh0gtYDHI7wX2cghZs4rAyg9KwchWsrfHL7y2F2hDuoES6jL71zvIGBt4UkQ3cC8mcc1uJPMjvuxo6OzYJFZdUv83qROq2JC8+c7a5/boxP7BTiozk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788241400; c=relaxed/simple;
	bh=OrT6/G6pG3brs3h5U9lP+Lp6Z2MAy8eJchC3JZa4RqI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a3cgKIUaDogl+WW96Yf2halEmj6tM5PO3mIisoLCKuWgnpel6tkwS4ZCqIVWwRvwz8LeXmNLCeq9CX+zf8j9kTxc65QucSLaunjG7bNbTmvgvtWN6RNXcRM9OT2vvjSCrzULPYJBhIOFrX4jp7uIjeIuQEKvu6Lwy0WtjZ4g2aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cx7WLRJ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BZRAmeLO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cx7WLRJ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BZRAmeLO"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6812kNWn1312578
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 05:43:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZXnt/eV5Q+Er/aEKGlxcy33P8n1vYu7bu31h5cpjjFo=; b=cx7WLRJ8E+gHKwE1
	wlA9+OnxS/aUmLsF5jam7iZ9s2p1aWJJaQF3FHn24xzSJBg3rQKzdoTt5aZKXEOE
	Coq4m0D+ff2Nb8EniT3yrutlSgbfT+DqXgKehkeTcLsjNCGSOQ8QXVsMNyvZtCT6
	QR6/mqoDN04wfiqeqUyAxwLCC8gOBLrGIbw4HsXWMZeYtOoOXnXHexgSdRMcNV3+
	KUfm2aslJCrRcjsCoG+ZHw4aQilS4z1dxR+589CgCixGKcPZxC457ZYkrllamVM9
	gUhPGZEg2jvxdJljkvKH8t70B6rQCW+TE+RiNuRQpjwPvfuu5LAueS9RhtnT9F3f
	hLxUoQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7c8mwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 05:43:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso4829396a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 22:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788241397; x=1788846197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZXnt/eV5Q+Er/aEKGlxcy33P8n1vYu7bu31h5cpjjFo=;
        b=BZRAmeLOJZQnH/YFEKNBqCZs5tSAGAWOrXn6e44IRGnkBJ34UOODDoiy/ajRlKkizv
         DbGPJ958lhuk69H8FjnTAOVTPtJP2OwKtAwdVmyNe6tIl4q4qOSDRObK26G6f5NtLU6J
         xAhEl8cM9M8N3HSHsDuclAXVr6/7OcyOSHR2lPPkzDF2cZET0gpMTSHtgp66jsJBvxjc
         4qHTMvX/ZMRZwoqr/45uUAXitsEA5xOsfcleUs8KFSTQOL8qKOHNLHYcJg/z/FEG/PcN
         n6u5TB4gz/6zRokG7F0uYZ8kINW7pA7cEShckco0s7NsZ76skSG08lHvdeESqfyR5omD
         GATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788241397; x=1788846197;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZXnt/eV5Q+Er/aEKGlxcy33P8n1vYu7bu31h5cpjjFo=;
        b=EjvCbzT2O9p92SpnBMrsJ88HDXHbkFAKynnDT5tbyIOW+s4a9TxvqccvlttzMbo3Ht
         jd2Bt4rddNxiaysxJnzviFN+Sq63YGk+yN2hyq1GDhte8kIp26mrSrulkiLXKU1nnl5F
         4K1fjzJ00CH1X2wA9vIf5E03ENDobDAr3LvGBL6GdNRr7M11Hq1WlxaLlkfzbxbOd1QM
         gf/exYHYu3hqLrqkFYNwPYJCwVpRM5B0dP623RO5HzA2Lucn08Gt1QjMVOmL3y5EFUIA
         zlUUuU3/+GaDxLJfW7mJYcxqzX3JEgWanxTkeCduZNYuwBSER/co4WecRphgozqw7DmV
         Ascg==
X-Forwarded-Encrypted: i=1; AKwUvBySbSZZqjanv+iY37zQ691kdLivA7mlCm4NB1BwmmR+glQke13W2U1makeyCGEnbGJXyj6ivXnNj50FgD8=@vger.kernel.org
X-Gm-Message-State: AFuF++nX0aqw5DzfC2yH3YbVyqAQ4j6HXwUC9xae3fpy6umeBHw1AG+s
	cuWh//DCC5P93Fdw4gMgxckaBn8w1/OEMHvPrgItzPaBby/ZdEnVCjMV82+0YfSMUMWf5iNeTVv
	/UE3tW8VFuDZOAq0mHpXFrn1TGQyue73hBa7AsWBs0seydPL5kkrc+iJCG+rMPpDF7oQ=
X-Gm-Gg: AYBFou2WjUUtVEIR5YNsffKv16RQK+yc5Ry6I2Uys1hrxnR2CfdvTIBvwxVFicgvpfs
	Ueq2kM4CoPIDCW+/yfYM4pvItIouF6OmlUK00+bYf/RLrl3F1jQkNENb2jLY374U5Ztihb9zrUz
	jDk1zv/5agPBhryhiuFARvBiyEYTRPwa3hS2vGDRyvNkD5RiHMO16xS6Y4MrDATDyklfMzA4uXX
	V4F5wb64cl4pzsu8WoOXfe0Ncl14TJ9yeYVFpXeO2yJTGd3sQ42G42CU6Vme1Fn9I6o8FbZeVCS
	r52boVYNyIfEffU+yp149rhc7XPPN7VNlQQ50fCazkc9Fe9ghbEVxJ6WloTm1X9/is/NWmWg5JZ
	ZNfpGP3d1hXpaDHRcxGaqvj1AlAIO
X-Received: by 2002:a17:90b:50c6:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-396d1017316mr49221682a91.13.1788241396452;
        Mon, 31 Aug 2026 22:43:16 -0700 (PDT)
X-Received: by 2002:a17:90b:50c6:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-396d1017316mr49221618a91.13.1788241396004;
        Mon, 31 Aug 2026 22:43:16 -0700 (PDT)
Received: from [10.217.217.192] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d38207sm32357246c88.5.2026.08.31.22.43.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 22:43:15 -0700 (PDT)
Message-ID: <ce91111a-0672-4b61-a38d-79d6ecf57ed7@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 11:13:09 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: negcc-nord: Add the secondary QUSB2 PHY
 reset
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260901035322.654-1-shengchao.guo@oss.qualcomm.com>
 <20260901035322.654-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260901035322.654-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OcyoyBTY c=1 sm=1 tr=0 ts=6a9665f5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=yQ5hQiGTvVYem8VU7YkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 9WgyTxPHo5p1apZSvNSniSzGFLtlMc9T
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA0OCBTYWx0ZWRfX+RXZqlHtFwNv
 OZy7MFo44MR2Xen/Ld4PAXxhsKsPZ/WNf8elVpFgqhFC+yjSGMgo3sY+SIUJ8crtDVwyNJ3WGio
 qyBthpbmCm0+uD4HjyfOURIxjN/w3uQ=
X-Proofpoint-GUID: 9WgyTxPHo5p1apZSvNSniSzGFLtlMc9T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA0OCBTYWx0ZWRfX+wjFvjfGoPwP
 zd6kYvUrD3dNz0bui9+zQFcmdXojWCFraa/Yvlo4D4ndAFl2kM0ZNpNJHWaV7KpW9ixG5e7s80A
 YySJVYNwusQ0zfMSuqJ4+TVqE2c6YPNZfoz9LO2QxqJgCzNjrloQGhJk3PPndtBNlu5oVbofjdq
 dpQe7VunVYMtBrDtkCv7qc7OuZD6OHb/TJmxkFbqCoZ6qwvoGXzRg3kbH1idsXkS8vlA2gEupBF
 pyn7gETDC6oKwH7lM931YYruvVsc5hCoFOWS3TNV3K/NV+joB/vLF+OUVXDBlfD0y4/0B/CFwvN
 mEkVplX3B7HDjqTUey/8lIHZO9kWse4rXk9uMLVa9eY3jC9D1zsI0rscu0tqxygpSU2e6fA6AYV
 O7cWW9eNFM7VnE5MJSce9dZUcZgL0FYTgW2n+P8k3qwqaPZMPtDogcrG2/zIsQ/eEFgnG5PECXP
 tXFD/W7OVFtUsq9DHFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010048



On 9/1/2026 9:23 AM, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Add the secondary USB2 PHY reset which is needed by usb_1_hsphy
> enabling on Nord platform.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/negcc-nord.c | 1 +
>  1 file changed, 1 insertion(+)


Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

