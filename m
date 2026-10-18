Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA461F936
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 20:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792353868; cv=none; b=Mk/74vx81k7ysVxF/OY7+1ehAK2q6qBNG+me2XRnMwrBZeNGXWmUDr1ow6pxpXbqhyEDWrYg49csVZIS5LwawTG3AcB3vAzwI1ajxiFivP4v6ukPzlb+8KJGfGmD9SMyX4AZ50BYayXjIj1gTTAq9+gNxkpfBjdTILSmNkjEJOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792353868; c=relaxed/simple;
	bh=DBE/gCmfuhXwykxDQWOrWz7lluxwth9kB66PmzDn3lo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EO4KvxCLIkZ1jhrexS+yuhKjJ5ufL3DCVTpNw5Y+xaZ8WbEt5xPJJ3l/EvrDadX5aHLaNzgWhsDoszduh4f5mbxjTwmtZoSqC+2QtAAAAaGJTwC6a3FsP5z7H7a1IwIlrfQiCNU4v4zU+r6MyzNu2Mcke6fbW9bKoxJraoh0YVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WyPRuKrB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IxQAsvwk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WyPRuKrB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IxQAsvwk"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69IIUJPr1567542
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 20:04:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i3xZ9op9l58SU7/YC9N8juWPncXRu5l0tsz+cj5uvOA=; b=WyPRuKrB37c3X8Aj
	Jp1pnZjXYlcnbxq3+u/w3d3++aibxFILsd6NSKt2kKMMLfKBy0C9F7ZDVN39I2/6
	GEYgtKgKXtFHt8jjiekUKZlIYcHY3Nno0Ktq55Q1kJho3VB1L9JjRMILTuqTOl91
	HAf2eceZEQyEVOzL4oUWFwg8LK94sm4qc8CN2aSAClMZprJI4YJVhcm3zRfIJsh5
	qSs6w+gsL5GRyZJBHbGXPXcGRDEyVHZO2OfgVbqRzuX3DGVB/Mn05xcaM5C5JaXf
	vGuWsAejptzO0/oJ6k29Tn5OpUL8zjRbqrfIVFyunI7YWBBA8FXS8dazKbvTSICj
	fsfmUQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbxqfv3em-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 20:04:25 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35d4538fd74so5463204eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 13:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792353865; x=1792958665; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i3xZ9op9l58SU7/YC9N8juWPncXRu5l0tsz+cj5uvOA=;
        b=IxQAsvwkiYO2d2BJQ26kzK6tcB+v69N1psTXDuYxol+bUfq3CI3nCoQuJr3OZEcJV/
         +9wXEkMyy9c3gRcLhkWCFljr2yF1vpKUJgRLJuTGqdfjLXw6/jgGcUtLwwRIzRPca79y
         Lj9kU8SO23EHEZnuzE6/r/rxvdONErq5DcAEY4fyI3co9R7Rv0T4uy6z6lE2Z4mnDWGp
         4KpGeIbNovSIRLBhck3QQUJvhgEDvZlqNwnbQOPcts0o3vetCyRHf0tn90Y2IuXGCEHO
         QxueUfKx0QdmnAD/JnmO1C8A5hnHMdApItlGJUmd+syXkNduqQPCJDVzh6a3nzEZmFye
         QRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792353865; x=1792958665;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i3xZ9op9l58SU7/YC9N8juWPncXRu5l0tsz+cj5uvOA=;
        b=avOO8GUH+FkGmmv5HQRDCtNCdtuK7ZK5b0+Nd8wrlCG4GhP8ngeL16z2bsVLR6fHpW
         VgnGL/Ly0cNaDzIXCp1XTxFP/JWJUbln2gxEtX5CH6gdFP1SpphTDjxTZ4S+ncHGDQDi
         jwPbnskP4Vhpyf0ZJfXgEV6fUnNHgo5HuXE4nc1Kc1JTVwkvNOzrKRFMiwkGogdyKDHZ
         pUfaGKZXGe+JtCmwUgM6uP9oIzPrla4Urz6YYOLtiKNXJ0cr/BDXQkvaPBBU/6uFq53z
         0UFa2aQCo0C82PmnCMBrjfhwiI0ukcRHcrPwSqyUj2zD1iuUdvHm07jJMtl3H+nf2SO+
         knjg==
X-Forwarded-Encrypted: i=1; AKwUvByKIVM+kl5BmlMgAT4eR58FXa+xrDu1G57KPgS89TIzv86dVZ7722ShXvk5U6tNWSRI4Ggvm6fGLflvHUg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWxlas/bUA/BayTZCeV5S8aNbklv0F5HMxXcGXWjM3gao6K3fi
	HFo7goQVKl93rQkhQBOgN58w3xDlsd1t4vEulI2U1baHm5PVlkeXcgAzsslpo+DYs3nC0ZAASrw
	fZl544nAyZaSxrCz/jQ+HRgBmrQspRflZNqkbRFfqEcs27J1yuILdZjFUIRbEt1XHNeo=
X-Gm-Gg: AYBFou1EpHC7d+IQH8RtjFWDN+TqN9jo2bhL0VK8KqCpcdzJzVqp4KP9zNKdacNjYz+
	dCXqVyFfKefYthH5mOSg9LjPssHcb57xyidIkLO1qm5k3meS4U7diucovH4B7HuK9fw/VBmwbg9
	cfWxtpVk1XyISWqzt/CynexvtlgICAC03vAAU3UVXWa2gGV1gWijuE3BIeZ6wrD261qwJjrQgHd
	hdxjw/E1/jUnPTp4dxTZGwCPqsfsvkJLF/MjZc0CKfBppbtJsjepG+1VC9+RY/Foh0eOqpIpXMD
	3J0LuQNzDhiOvu/Zi2mT12XqDynvrtLnsgg0Qz4GMN0LeSzthitZtYFzl8COzGAbBlzDE2qTfFG
	yKkkLmaHnZgM4
X-Received: by 2002:a05:693c:4003:b0:351:6409:25c9 with SMTP id 5a478bee46e88-361a2942adbmr9329028eec.35.1792353864891;
        Sun, 18 Oct 2026 13:04:24 -0700 (PDT)
X-Received: by 2002:a05:693c:4003:b0:351:6409:25c9 with SMTP id 5a478bee46e88-361a2942adbmr9328972eec.35.1792353864174;
        Sun, 18 Oct 2026 13:04:24 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608308a87csm43680240eec.28.2026.10.18.13.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 13:04:23 -0700 (PDT)
Date: Mon, 19 Oct 2026 01:34:11 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
        kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, afd@ti.com, andrew@lunn.ch,
        hkallweit1@gmail.com, linux@armlinux.org.uk, richardcochran@gmail.com,
        andersson@kernel.org, konradybcio@kernel.org,
        alexandre.torgue@foss.st.com, peppe.cavallaro@st.com,
        joabreu@synopsys.com, maxime.chevallier@bootlin.com,
        mcoquelin.stm32@gmail.com, lorenzo.bianconi@oss.qualcomm.com,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v3 4/9] net: stmmac: qcom-ethqos: fix RGMII_ID
 mode to use DLL bypass
Message-ID: <atUmOyPnBUipmr55@oss.qualcomm.com>
References: <20261017-shikra_ethernet-v3-4-26a8beb44b8f@oss.qualcomm.com>
 <179232045490.3135.14337314664378256554@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179232045490.3135.14337314664378256554@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDA3OSBTYWx0ZWRfXwG6VlYTZKwr0
 rO9Yzq6+GmUcLjgz/ADVJvkTOMspQvdX780WhXwIHUuE/dz2jfLwkeFj8CCbeWbm5paD6F7vkGt
 pwoIyaGdmMagSf3mtmRUnlm02gnae2Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDA3OSBTYWx0ZWRfX0Z3XCwvND6UR
 SdZkRai+rKlXe8iJJUF1XnzQVR0G8/kr+8og6udCJtTjKjn5r8SFHWVCoRm4vl0rTDaJBF9VmQJ
 5/njeVEA6xqNl3c8yk2gD5Wov6ojvhMF7xz2v3XHiLio26t/GUe/KLgJKzJGe5n9mHCR9BSMr4R
 zVEcL/ihEF7jc+L2Dm6uoRghfmZ4wZ3qwLcpFPCaJ1VdCppJSlQPCm9SiygzRqkSv6vrTzQRvIG
 aHk+HZMZXyufm8Vl8THNVBrGVHC/EXYhTteoJBblXGBcxhGOwtWOJcDa3JMksIZuteJGr2SR1Go
 CFQe1u+Kq2jGxO/3WvqAcI/VMRYSTie8qoWvlS8u2D5DoGJl9a/NQ9bfggtFf0ajFZKsytEqMaQ
 +LSEq0se9LCob/8+DOJ6TfPTNu7BGwjXgKcrKSb/QJ7ApZ7Pf3hrCt6695FSgEEHuo1IBpgNLRw
 82sLSp1jPDu0e9t1d5g==
X-Proofpoint-ORIG-GUID: mkcz9G_Ed-ohBBddnI1vJiWVe7RgiuVM
X-Proofpoint-GUID: mkcz9G_Ed-ohBBddnI1vJiWVe7RgiuVM
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ad52649 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=rVh5EO9gQq6FD6a5X-wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610180079

On Sun, Oct 18, 2026 at 10:47:34AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 2 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] In rgmii-id mode at 100M and 10M, ethqos_set_clk_tx_rate() now
>   calls clk_set_rate(link_clk, 25000000) or clk_set_rate(link_clk,…
> - [Medium] net: stmmac: qcom-ethqos: rgmii_setmask() on multi-bit
>   RGMII_CONFIG2_RSVD_CONFIG15
> - [Low] The commit is titled and described as a fix for a defect in the
>   current tree, but it has no Fixes: tag.
> 
> --
> 
> 
> [Severity: Medium]
> Can qcs404 and sc8280xp actually produce 25 MHz and 2.5 MHz on the link
> clock?
> 
> On qcs404 the "rgmii" link clock is GCC_ETH_RGMII_CLK. Its parent's
> frequency table only has these entries:
> 
> drivers/clk/qcom/gcc-qcs404.c:ftbl_emac_clk_src
>     5 MHz, 50 MHz, 125 MHz, 250 MHz
> 
> On sc8280xp it is GCC_EMAC0_RGMII_CLK, and the lowest entry is 50 MHz:
> 
> drivers/clk/qcom/gcc-sc8280xp.c:ftbl_gcc_emac0_rgmii_clk_src
>     50 MHz, 125 MHz, 250 MHz
> 
> Both branch clocks have CLK_SET_RATE_PARENT. The parent RCGs round up
> rather than fail:
> 
> drivers/clk/qcom/clk-rcg2.c:clk_rcg2_determine_rate() {
> 	...
> 	return _freq_tbl_determine_rate(hw, rcg->freq_tbl, req, CEIL);
> }
> 
> So in rgmii-id mode at 100M/10M, the request would silently become 50 MHz
> or 5 MHz on qcs404, and 50 MHz on sc8280xp. clk_set_rate() would still
> return 0.
> 

As mentioned in another reply, I will update the series to use this new
flow for PHY managed RGMII delay for only SoCs that could be validated,
i.e. shikra and qcs615.

	Ayaan

pw-bot: cr
