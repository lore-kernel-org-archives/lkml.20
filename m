Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D6E49BD76
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790109680; cv=none; b=nshL8Lz+3DzzA31Is1hH23pAu588T7pvy1mygwv47KA9moji5BR6DbkObSZ/5vtJjy9da7sJruICplynRgJfGIgme7y1/hOy2NNdD58z8mgSlijakEuQALOfpCQycBYOh/EPeZdiLUp6LwDtrmyGjxHrbu54bcWUxfAOQhmCJn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790109680; c=relaxed/simple;
	bh=Was9xrJcKA0i5gWxWGN8G4b+EGFRxvYGC6c1tInqrrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M5kqy89eBXIwSnKCHPlKSo/KoibRZBMszqxUL0EX4Zdxvsf7zeo/cF7SVvprUj44eyCF2T55TOKgsNCMqj+maDcGsdHmMc+YkeDrrUOAPDWeEJEFNxaNx7n35QZTsxYROmgwWPPYAKchiACL4Dy1Yw1q+0xltRzZPPoDc53P4Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JE2AiTm6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f8UbU0rG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JE2AiTm6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f8UbU0rG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI724L1153693
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kpSBu9jvqWp5KjJaZ47d6NVO
	S4pKiq3srWWOoTSWhdc=; b=JE2AiTm624Nz2B/YsNFX2W7LqpTQpX9Yh/3jJjfZ
	0CrqXl912W5uaWLr29JAO/zJsUKnuF4DQbqWjcWgv3kwUk7Us4iU4pFJdoomeNKO
	zd2LWkzp+i06V0/OumiOHxlYhUYcMYsYWqf9BeNk70yI+U0mEQSBtq9iLK8CzsGF
	jEs87pMVdRmTqRDCWqbAR1esY7Uf7NZQnXi0jZNE6u95J1Jact+xm9LjzP0SQE4t
	XWJ+dZ9hL3ciNsOtHJm+lrqtZpMXTKndWRIAJtmEFRFwGhJwhbMLYEY+N2AVJRaJ
	pGXWmLJ450mccGRVuQtYwf/Llx7bLwV9hBfqixEDxJbSiQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guvw7hg8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:40:59 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78fb9f59781so271034137.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790109659; x=1790714459; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kpSBu9jvqWp5KjJaZ47d6NVOS4pKiq3srWWOoTSWhdc=;
        b=f8UbU0rGAfened+Vhx9NFgFGtPe2KJ3E87RmiVCE/l5zN3Skca1vsoN1SmOt7twzn3
         1Nc3truS9Lz3tMu7NcVKat9Uij8TdVb/ShQtOrkk1q82aiZtXeZKmSr3SDCClR2qWVEG
         33SPZCjKQV4DvqvgGebuzmM3hUOAkGeYlrGZ5IRPHcQHsRXIqwMyXnXWUoYGJnPDx1LV
         qw7h/cRsLd3YkIBedzb8W4+Ag4SLZpsMjx6FqQO1Lg8lbXSNBAZMwDSc1afLApYCTGzR
         ij5sNJ0iJLhuWtWWzXrg2QXab1B0yyioohxFXpWuppllbx99sg+c9ROayhoa+KzSIfEZ
         P9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790109659; x=1790714459;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kpSBu9jvqWp5KjJaZ47d6NVOS4pKiq3srWWOoTSWhdc=;
        b=ACGj70xWe0vOk99K6PHH98MfkugcY/jdemxsuM9CP3apaMsXOKLBoDuxwNcMrHlqND
         ngfu5tGln4b45x5njdPxrLU3hisZwdAaa6zytg11CBLfNORVDrW5EPeFF22sVR/4wumh
         TV2Nfvd9KXuPDqgTExQJsR3LXQoFP6ZDfWuKMi7tfIj40oPyaNc1PybYfO32HoPq1FHS
         fUUsT0DtkSJMgYQvnhw2RPJDQzm0Sc7UZpt7TjweVe/V7cbiVs7ZBgNDJpuHxJjqEOkF
         DNP9VX5zmNtdLkducMP5+ueSzVptdkWo7byz/nUwsCA6Tc8F7R7iNkqGNAo9MIc1E3x7
         aGOw==
X-Forwarded-Encrypted: i=1; AKwUvBzoCgAygb9QClOM2npJUbx255DSIZ0gAyZzoJcZzrJGsmBrP1j7X2lBr/NzR0sZk7EEOG0fOU1/BTAU+A4=@vger.kernel.org
X-Gm-Message-State: AFuF++mfPVwFjyVvdw1lHE9Wkmn7t1Tvu1xpA5XiSkmpCtCbG4Lasz40
	d6BAgy4jOtBGkGKZJooTPbUoGZazg2nyMeqSkBL9nMNUGKkv/PWXWzFI/s3nVsjk0XNhoNNrfPu
	SJlXXFQet647JVo/Yb+BCVeKBbhUpvseIDkuTAeU1OdRnbDFUV3NrSoQ/mJLcptOytag=
X-Gm-Gg: AYBFou1J6J7kipQQfYtY9jKM/VPUFinWBRnAdA7THtIRF9o1LCHiCPC3v9iT0uvBW18
	9MGxiMVrDZ7PjKxynrtxPRft41LI+0yWM1RB//Wg2n2gE9TofBM5gB/l4tnowmE2VdqyelQ9keE
	7SNtCfxHBAnFXUNRC8aBt5RcV7g6AlXW60oUF01olx4cBK/yGP2lWcpY9zzID2CQGThlF4GPovT
	UwP4Ea53lUX9mCLgxEb1eQnNpTqsocmRQVG7nbexCCUaxfb5u395hYfiKXz5iBguW1l+QjLNmVT
	DwKV8/DNyflZ0gRt0ni0rqalknJ9TxPZvIu1lNe5X7sHhVovZPffrB9KfI1OMmoEyOjG2KhCWqf
	I3ywuIYpurpl3gg==
X-Received: by 2002:a05:6102:6896:b0:7a1:f7d2:e82a with SMTP id ada2fe7eead31-7ac1e65c1c3mr771091137.35.1790109658730;
        Tue, 22 Sep 2026 13:40:58 -0700 (PDT)
X-Received: by 2002:a05:6102:6896:b0:7a1:f7d2:e82a with SMTP id ada2fe7eead31-7ac1e65c1c3mr771060137.35.1790109658190;
        Tue, 22 Sep 2026 13:40:58 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1e045dsm18896285e9.11.2026.09.22.13.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:40:57 -0700 (PDT)
Date: Tue, 22 Sep 2026 23:40:56 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: qcom: Add lpass audio clock controller driver
 for Glymur
Message-ID: <acfvnzzcwzqq2pcchzxkrnesdcpqthmucax4elht2xzw6kd767@yqium6n6lb3r>
References: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260922184425.56114-4-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922184425.56114-4-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5NSBTYWx0ZWRfX2jBBdykGdjfj
 vp9PzIHXKgLpwHROA8ODytZZ2zqJrhISq8YlcZv1RsP3MoPH+JQMK8b7/FTBFyAn/AzBVOZhbH3
 aWdF7FnalJxxTVsryyKnJY8IF89lSo0=
X-Authority-Analysis: v=2.4 cv=ZYqIpcVA c=1 sm=1 tr=0 ts=6ab2e7db cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6XYEiC8ceDmu1LDSX3kA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: eP-OvpV0CKPd_2MaPM5s9RNVRCi-WK2l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5NSBTYWx0ZWRfX/mRELrLTH3Jq
 ViDj0XBGqGuL6N3WsToALvyySZ/RvfTZToMs0m/E4ziP4zr43W1npLsndLD73LSmG+9MKaH3wXW
 7ZrSK1f0rdlmW5r6U0uWDGi5xOSr/YVHLrjcAeJXl8vcRlZM6UpmO5JFWyK30xJU+N1j59Q8+m3
 Xwb7RgmmctLyoR1HOKzb2esF6hkVrLdVgEoWf3ZauxcPlfZLIOJWxwIWoXpTGVK7OeovrrpIJrU
 cRxq23vIGCFYiyHcqoe93+el/+f97lKzH/b9k6KlNLD1t6hh6+imotrAx0Z/+0J0d39gK9Vb9BX
 6+VE2LBfCvC4RPRKWgJzWsCzv/gZVizYRrmbNxOrYeZ8it1rtRrVJyishNfqwyvZnuTY6TrOYmd
 zePFgMLXBtS/0/LO4ov0lfBDMriWahQQG5zvZUAZUm9W66lCLH2ifkZRtFpasOVDMqIvL4vKlvF
 A8Q5zKLOy5dB9imPSsQ==
X-Proofpoint-GUID: eP-OvpV0CKPd_2MaPM5s9RNVRCi-WK2l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220295

On 26-09-22 19:44:24, Srinivas Kandagatla wrote:
> Add support for the lpass audio clock controller found on Glymur based
> devices. This would allow lpass peripheral loader drivers to control the
> clocks and bring the subsystems out of reset.
> 
> Currently this patch only supports resets as the Q6DSP is in control of
> LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
> channel.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
