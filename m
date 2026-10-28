Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793149850;
	b=S68a9MABAZ9SExogGTcEtOleYycPmFAblEv/YKgXUnsQx76xHOmNDms8gX7ipJiBfP/U
	 XzXJTCjtcqTwEaMr7jYONN4BwcA5IfIJwpZEcv/xsHM2HCh/hJEpMeTP7uXk/71ZXyA/n
	 MQZy0SiSzF4sG625vFQCTn8vNPqqtHUg316F1kl2/P1AesB0/vtAY9CdYBUIOzZm0n3gj
	 ky7tBr16QBtE/eCrcge8H7szItUWIU9wYZMcsuUDEukVHJTPcxuuuxdGuM6/eDsKTLyvI
	 tYYJoNO++lx0PXGNUNZXp4h4qGVr9vahtFW3AkIMXYl4bA4/f+sb+G+IScLsmTon0BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793149850;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RJPAJwTyk99Ed4rKr5mXpNq6/k97CEUnT+YCoSZgg30=;
	b=GJU3wQmEErylOP9ia7u/a8kVttLf+tXE7wXSfYI2ZJNwlp6HCWcVgFlSApuKJXgG/sW3
	 ZMauiiCY97UjEfXLGLAih8hq27Kw42CR6iSeRpxLv/hLP6XRLTowk6OBXnAjEb9K6I8jz
	 7kw5TCZaR9Yvg/q45m70mao13aGcRDjRjj13ZBKCAEzWSXtNE1sBoslpyHdWOADOp1trN
	 ues08crH8hZIW7gH+yb/q7Rt+ZZ5J8uqBQO0E5FBvAaRx5thTHLvRIp5PRYj4L6d8jZOf
	 bmknw09i7thtcs0gjBr2kMvNxStWlP/sbHKg1zbNlsvB19BmJxQmperaMORCcmib6vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hZDWih+e;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i7TM+tJa;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7559E606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7559E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hZDWih+e;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i7TM+tJa
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S0k8bl3784609
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:10:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RJPAJwTyk99Ed4rKr5mXpNq6/k97CEUnT+YCoSZgg30=; b=hZDWih+en3WP1X/t
	eMjn++8sX3oLIoaOoa2bJDDkhbzruXNPzWmN4FrhHjZkAXSiQqORHY5b1gu+/0G0
	ZbTkooi2Nmgj82v+9u9yMWmxmWjXwjkrOqPa0EZj+KWTKJs63Fxtn7dHFqJ4SgGx
	jXu4vpU4BHcYVc6eoy9/wOqQZJCiRhHMdFI6Jb4uhLyoejB8LjTdR0P5sXo3zCDK
	CNE7JgdJJv+nFzxQJfesBNmWw3TPqyxQJ0PZU75zbrH00m2MACfdmRGtedSN9xQj
	5cbDgz0+A3yHQSs4Ktamf4BLb7OdU+MNJwZ94CAEkqFzNZqdUwuWfzm1wnxjAOzp
	pj6KTQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy671vey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:10:46 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c3c370b17so658565eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793149846; x=1793754646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RJPAJwTyk99Ed4rKr5mXpNq6/k97CEUnT+YCoSZgg30=;
        b=i7TM+tJahUzuLudZwfJbYuZ7N1JL0k2G5viug9r6E6BMisnfyH2Mlt/+M+ZkGS0Fg9
         bt11GNYV/X5c9E1BYS65Uwmt2sKEfS/Gl3vxLnphFRfRLUBHoCq5uHFXJNo3RrBXpRIC
         CHNWfNf88eAH9dTxNSs2s7lxVLFUZHtPQ7+7Mj/G2htVPskPgOpomLAwe0TZwyAMRdg4
         up8Sei1GBQn+v2jTBdkZFGS6C9aGDHLfTAjajTj1kUI7X2SPRp3JjpDP/HGLAKWE0Xhz
         X98tSsMysLiBGg6mNJ3DhFeoO2uYm+baq+JPRf5yqNJUvEr1LZpdODHRXMWrtlxioPQv
         MXkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793149846; x=1793754646;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RJPAJwTyk99Ed4rKr5mXpNq6/k97CEUnT+YCoSZgg30=;
        b=lXn7+cdobL97r7qOSMfJI4v2ca26UkqNGBoTcffP8/Q+8BLOpB2rzj+0XNpy44Mr8t
         Mr+ohPfmltIzgq7xMrRAGSdyNjYNUbc3WfX5DlstssZi9zpcML083icv8MxCjYSVawFn
         j1HGvPdd7NAQGrelzCOqLQLiAkkR7LqH5IIlEYgrem9e1ZosT5qOreh/OR7Bl2NNv+Xk
         srB7gF582HlBARxrg/WhS6zMsr4gujPax2RoYeIeAx+lC/Dpu8NOk0YY7bFHNqiNhzQl
         NrFpjnOXszS6kuZ5CIHGCYoC8g2It0RyLvsLKYJkpfehaOv0xplDLexPSY/B9t5ZoWWr
         8vaQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9T+3CX6givUDmVcYVISUipedNGqH0iLroCYTQkn2ntO+ZN0WxGLLMcjLpZ/BMhaE2b4Qmnh3nD3ArwGE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLSWS9yFH911GUTgJyHySXTv+EhVIh0wR51RN0kPxc72ysoWJ8
	/YzxjOMdWvvG3fO3wo4FP8WZGQZ3p3ML4m3mRCVgE9+ydvMGivEukSumkNjYuOvcQd4nhexQ2aB
	pwvwn0+PGel3pWxZnzuqNHDEkzyMIMKOWdJRHNOZcx2Q5xrW5fYepF/jVNL4pXj+vl0k=
X-Gm-Gg: AYBFou3pDwryB9Ko6uuGQiUU4YlBWb60hIYhRE6rr8kx1K+ii7SOvNCwBoJEav4VgrC
	rERnmNYZqPK+PjpHQgAkAMuywdvNH5RGPh5EzkQGf+vP3rLFeJNJfdPbFuXT7hIXYz/FcOdODyd
	DoAPUqGAiyeq2u96M2jUJDj2eQ4JtVldvtc9P3F8HbcYsBxUe7CTuFdsr+jSkKyyh2b27+9wIFD
	v8KWK4JbInXwI3AWSbowzeXcZtOLZ9cPR59Cs9r0rWj7X6VHcSWNLO3xh64XcKoxnBffEQUNpwv
	U+ngJUAy09K8QSkB8n2JIeUc/siZfch6wd+QrJweqo7mUZl36mWJAmHsuWPZ1g4d5cyN74aLA6w
	gcxZyBKT65ASVYiYvdoNJCUtwYrMoaxkO8YyP5YAmeTEWfeJu+3/2LRPiEzT0REe3ZsuxPx1Gu8
	7wyGcpH6wi4WaQ
X-Received: by 2002:a05:7022:110c:b0:18a:3911:ec1 with SMTP id a92af1059eb24-1a6ce2ff7f6mr1084990c88.39.1793149845511;
        Tue, 27 Oct 2026 18:10:45 -0700 (PDT)
X-Received: by 2002:a05:7022:110c:b0:18a:3911:ec1 with SMTP id a92af1059eb24-1a6ce2ff7f6mr1084949c88.39.1793149844674;
        Tue, 27 Oct 2026 18:10:44 -0700 (PDT)
Received: from [192.168.1.199] ([68.248.129.193])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75f51bdebsm675047c88.17.2026.10.27.18.10.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 18:10:44 -0700 (PDT)
Message-ID: <32fc0379-0c45-4011-a7ce-795c44594b89@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 18:10:43 -0700
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
Subject: Re: [PATCH net-next v4] net: stmmac: dwxgmac2: enable L2 split header
 support
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        lorenzo.bianconi@oss.qualcomm.com, hongmei.xu@oss.qualcomm.com,
        abhishek.chauhan@oss.qualcomm.com, sarosh.hasan@oss.qualcomm.com
References: <20261015221215.1714047-1-sagar.cheluvegowda@oss.qualcomm.com>
 <179244898962.3135.12890405028818098249@kernel.org>
Content-Language: en-US
From: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
In-Reply-To: <179244898962.3135.12890405028818098249@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YZx8wbw7GJ86DlvsnTk1GQFH0dTjH_E8
X-Authority-Analysis: v=2.4 cv=QvfLTlyd c=1 sm=1 tr=0 ts=6ae14b96 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=djYDpCgIitZxdph7ACYjJA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=WVQ7OhcWbFtDb6XmBhIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAwNCBTYWx0ZWRfX40SrfVsk/v1D
 612rJRMTW4Wpiq+LWQ/HC6nrZqclIGki44IQJDtVkzvszZOj96K/558LQXCuftOTblu1oKFzroU
 qyXJzu+mLdzz+JL7D9I5aFs5mPlm4mY=
X-Proofpoint-GUID: YZx8wbw7GJ86DlvsnTk1GQFH0dTjH_E8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAwNCBTYWx0ZWRfX99DuClSDDdeq
 lFSJwpTW6/7YyUV3eH8d29qGxyGUHuVTHodGu4mKA4DgpZPIcUpitwxGwKJ8hVhLRVmxatvoqDb
 8P311QiOPScbn2u6ayouYAQpHjwCyw1+GFK5IvvN4bQ5e73PaYpQ+E90vhDRRTrhWbBUhq0DkxP
 wrZTYgDZHFm3khohJAelqeXbrNDLZUZ1IuQtwnvQMcR8uMyEmXbrQptKlMzYqO8zd+MXVHH/X2t
 PxXrvRFoWEaz3B/4ua3tK+qDiefM11FZIi9C5MWwILwbOnubaWrPtQ57EUoJIbruBMJEvryNxKI
 5ovrp2lAEcPgZvyrVH9JNv0HoTsljPr8dCKx0o0wyRdsibLt1K/9MHnM44eymvQr+GQsqnXj7SG
 h7FzaRxVWGJahinJL9dbg6WfgJi6hBCIFSLZNvUBL9QiZLpNVyQtBRJT52PRbE2GU9Q7aoBC0rV
 3ET6sXa/SRD7xtWKZZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280004


On 10/19/2026 3:29 PM, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider.
>
> Critical: 0 · High: 1 · Medium: 1 (1) · Low: 2
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>
> - [High] On XLGMAC cores, dwxgmac2_enable_sph() now corrupts the RX queue
>   enable register.

Agreed. DWXLGMAC_CORE_2_00 shares dwxgmac210_dma_ops, and on XLGMAC
offset 0x140 is XLGMAC_RXQ_ENABLE_CTRL0, so clearing BIT(8) would
disable RX queue 4. In v5 I will move the EXT_CFG0/EXT_CFG1 L2 split
programming into a MAC-level callback implemented only for XGMAC, so
XLGMAC is no longer touched.

> - [Medium] dwxgmac2_enable_sph() programs MAC-global split and preamble
>   settings regardless of `en`.

Agreed. In v5 the MAC-global configuration will be done once rather
than per RX channel. SPLM/SAVE_EN will be set and the variable preamble
disabled only when split header is enabled, and reverted when it is
disabled (e.g. when RXCSUM is turned off via ethtool). The commit
message will be updated to match.

> - [Low] The patch includes a fix for an existing XGMAC split-header bug
>   inside a feature patch, with no Fixes: tag.

Agreed. I will send the FD/LD handling in dwxgmac2_get_rx_header_len()
as a separate patch to net with:

Fixes: 96147375d49f ("net: stmmac: xgmac: Only get SPH header len if available")

and rebase the L2 split header support on top of it for net-next.

> - [Low] dwxgmac2_enable_sph() sets the 2-bit SPLM field
>   (XGMAC_CONFIG1_SPLM_MASK = GENMASK(9,8)) with `value |=…

Will clear XGMAC_CONFIG1_SPLM_MASK before setting the mode in v5.

> Pre-existing issues:
> - [Medium] This problem wasn't introduced by this patch, but the stmmac
>   RX path has no dma_rmb() between seeing RDES3.OWN cleared and reading…

This is not introduced by this patch, and the new FD/LD logic does not
depend on it. It affects the common stmmac RX path rather than just
XGMAC, so I will look into it separately from this series.

I will also fix the checkpatch line length warning reported by the
netdev CI in v5.

pw-bot: cr

Regards,
Sagar

