Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFC949E5D3
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 13:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791380633; cv=none; b=q/q81bsQEAAL+tGu3ULB2NWRw3IUH89j1IHaqi2X9ohMw7pgiUJt9XqjTzElmWrKz5O+08n1sz8PmjaEDSwgI/x8AHlJ1TW5EtycLy1nB+VUOiTElouRiFcOxWJDXYZQJcr/QitZ3ydi2hllB1LBsfJoktL3rQ4YWZyzsM8Wg4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791380633; c=relaxed/simple;
	bh=Mo5vMW6Zkz5H2CFeTFubPNvIJVxYHl23UrqUeg56qRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TR0+4COmzObl3740dIcyeNa+LcufPQe2SUv0EqSC7RCHth+J/SFoamNd0VDfwD3F69VFqHE5ZDI5yMg7LM1O76uPdIlYwpzB/DieG82LVkpt/5tkIa2iL4jNCCh0krltC3mNNlGaA9WreKa1d0yvgM/OcWA5rrAuHXULE8hVWiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PuVW/ih/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D/Z8MhEZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PuVW/ih/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D/Z8MhEZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697DJRBl4056313
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 13:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U/liQNsAQUWHpc9Ht9TcT3uf
	glSLG7X10a7oV7oShF8=; b=PuVW/ih/A+mwX/6USRRApZMn83CjIk1rYKuzvzbU
	krqpC98aa0i2aNqjMK3xdpQ4Br9qbwZiSyVbZL+oXVJqHdMNE11j95dT74R9qUJd
	umMnFL6E7g3hh1UNW7o/2/a1Wx+zbNR9rzVpZ1Ow+qkDaZK9oksLnEe82lTsKJeF
	bkubDgi+0XFHaj7sQK9rMuK4+ib91+3Xr7R+9HaM2tTfbMjZ6L1ioEoyet+N9kR7
	6LUSOxdgbJDR0ot9+DgA4CmN+Y0OZE+NCMWog+IoLtQKONWtQszFsmpsCTkpqC0C
	ila0Hd6XnmvvoBlqU9FqFAA9lhZlNvVPQXZ6A4fEdMpHIg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5pv702yr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 13:43:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e49a1d3b1so914337285a.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 06:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791380616; x=1791985416; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U/liQNsAQUWHpc9Ht9TcT3ufglSLG7X10a7oV7oShF8=;
        b=D/Z8MhEZ7eAuIuE+16dY0jS5/yU/jZkIfu/D4JMLzMF5ry++Pw4wncparCVPDd7BrR
         +ezoio3ulHzMs1f/zkIZIftMv6Si4PiGt9jmsjLEexEyDw+LowvIeuRjixh8vI/DcAzN
         dZ1vEEIu/UNUpRIKGQ9n4wEGwYBIWAk7kVuVRJbffD75AHBxg668DI2cLTWOGy+6qEdf
         E44nm6lwebN7F8N9Deb2J/aGfl2z5F3SrPSmmxh1fSvljRWntAY+iIiYLyw7h6XqsWGw
         fBPhElPToe910GCfcQraBzJ3VgfyPcfYF5t2rVdkLDQhtq9feJsLafbJYm9ur9EX4nk9
         c46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791380616; x=1791985416;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U/liQNsAQUWHpc9Ht9TcT3ufglSLG7X10a7oV7oShF8=;
        b=Dh8ijifhmaogMBtJ4FAI7h/pbZRSkA3SnB5pPCki/2VF50b2SKPXM0q9ZlpC7TprCW
         nbWKyB1R2NPUWE63pIYd4vbcK4SvjwM+jAeliEzarHnH0eTWzdyAJYXthZkd3ZTdTWYh
         bYQvwRCyfBPJMsv28HkFPElt2AYylaupwrywte473M9InjnavEM+SbID4iV8JjoR/jY+
         wEZ+gk35q31358AoZHHbn1BTvu3UbN0DMwuguzzzXsZzpOldpZl7RN1asT7c5XC7DtnC
         G05MyRYUW5I4Z/99K1a7e/5n5Sm9T8o/ynpD7EBAgQ5I4cvIPmBAUuxp47z/u4EsChgJ
         MyRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqnKtSFEYr5/Y/6POmSi2XpwSjo0ObAhUc9OhrrRB6ACOvdJoc9ezpHGsa0Y/SReu0/TISbs2elRPjLIc=@vger.kernel.org
X-Gm-Message-State: AFuF++lUEE6FpiSkPhuS3/wGw235UcnBCttUEZrChCsIHsWxFgoFKEKM
	YDUX04VqQlxRof/OCFAJ6YxogoQkoU9Xyi6CSo3Xu9fh2ac7m27uS1rQxxLtLSZkXbIj7kqpgO5
	fKsyfs2Z8odMg2N8SpLGsAqj/8+16j+140I8yk3U2D0zqkz4nxRmm61W1x1532nyzB/4=
X-Gm-Gg: AYBFou2n5l9tZNSXoD0Jo/tBESvvlyF6g+pf3g1LqKNiJBUXYqS6PARvbp35KwmVBCP
	pQUPxZCArRaIKUmDqiuZIh4UvZswu6XPtQo6p8vuSNnGhmdmZf4fXdBN5oQxhSH59WFGkN+w7tE
	DCEgaVHvTur2f+kFp2y4XzQVtp9gGOIPc6+B0sseecvxvQcYek57gMr9R7VSAsYkD0q/wMNBzVp
	YeUKp+pHfyEcw1GdzFddl5hIN4jKdwJkI1nnEZ0qQFabwZpn/gr5jywUeskMuWEIpqUOfjtJVX6
	4YAxfrCxO5rl/iTTPRmJNWthXwToXNuoOVUpWQ4kYYugJ1ErnFsHX0hVrEJHIXIILQRIYlhIQKB
	mkvQSmyLmQogrbhUm1bVe5URtv/AbdmBzMyyol9PfpaVTIShhB5zDupHRiYOsSpxWKKmlvUoJOY
	QLHtk9SAroxIUS
X-Received: by 2002:a05:620a:2711:b0:93e:74b4:3115 with SMTP id af79cd13be357-93e9b795c5cmr398242885a.38.1791380616104;
        Wed, 07 Oct 2026 06:43:36 -0700 (PDT)
X-Received: by 2002:a05:620a:2711:b0:93e:74b4:3115 with SMTP id af79cd13be357-93e9b795c5cmr398234185a.38.1791380615473;
        Wed, 07 Oct 2026 06:43:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcd309c713sm54780e87.68.2026.10.07.06.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:43:33 -0700 (PDT)
Date: Wed, 7 Oct 2026 16:43:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        nitin.rawat@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 5/5] phy: qcom-qmp-ufs: Add Glymur support
Message-ID: <p76qp5bhijenec2ygj36dd47uxkeyk6kztccbuhblte5lqn22x@yikvkbipjbae>
References: <20261007-glymur_ufs_qcb_enablement-v3-0-84cf4f861415@oss.qualcomm.com>
 <20261007-glymur_ufs_qcb_enablement-v3-5-84cf4f861415@oss.qualcomm.com>
 <zovl7lrhlleflaewk32o4wofr4bzm2bmkdnakev47peijrnkfe@p3ixrxltdpcm>
 <f9c7bd4a-2e97-43e1-a9bf-295b841ef0a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9c7bd4a-2e97-43e1-a9bf-295b841ef0a3@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA1NCBTYWx0ZWRfX9w5Lway8BErl
 n2oYZ64aJUq7tAdIwgipkoS7PjryheC4nfc0UcZ6HszHps+5TO6ZWFBPcQoel6NszF8HOrtNv75
 KxmQ2IuEpzWgv3o+6snYjm495CcT/kk=
X-Authority-Analysis: v=2.4 cv=J4I/fwnS c=1 sm=1 tr=0 ts=6ac64c89 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=JfrnYn6hAAAA:8
 a=EUspDBNiAAAA:8 a=g3YXqlWUHmiHVpce9XYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: zDTs8R3gNElL5WRBO5GZIL_rGfB0YZpj
X-Proofpoint-GUID: zDTs8R3gNElL5WRBO5GZIL_rGfB0YZpj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA1NCBTYWx0ZWRfXys7oa+J4uq5C
 BTspv7pe3Tnux0PY1PktAVxY7jpI3lURUDxHR7jWf/BmacDZAwLsRW1Lq8YUQBiMobYuaDHAw78
 8UqIIUuRNXzKuyBm6OTOky/NWuL2SGzsdlb2pcY3xFnry8W0y65nJYtKgCiZs28GdqSZHJCU4ao
 SctpNXsJmzVwElnM4tJCcJGAL15UUdl4l/9Wx6w2F8JBeIJ3yQlClKDxM0FXV03LqTSYx7MYCZh
 3EZrThxb7cDTdcWD4ZmSC56ZEH/2d9ZJJqR+c4hbpkq0o3fEnnY2/lkWrjrXrBuNco9uYh37LYy
 ydWYpgogWPiKk8mwy2vrvigmKv9mNkwEch4FNvpISFv8XKPS1RWQSLcKc/GbYU/af1Fc6X5uZWJ
 o5fCuArkX6EqVnfm3O3htFXPypQ/MrV178r3v+mWk7nJQtW6lXC0vOg9S+UWOpin0Ca17f/HNj5
 0+bYIzEH9PffY9Xqxpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070054

On Wed, Oct 07, 2026 at 05:03:02PM +0530, Pradeep Pragallapati wrote:
> 
> 
> On 10/7/2026 1:18 PM, Dmitry Baryshkov wrote:
> > On Wed, Oct 07, 2026 at 11:59:38AM +0530, Pradeep P V K wrote:
> >> Add the init sequence tables and config for the UFS QMP phy found in
> >> the Glymur SoC.
> >>
> >> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
> >> ---
> >>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 99 +++++++++++++++++++++++++++++++++
> >>  1 file changed, 99 insertions(+)
> >>
> >> +	.offsets		= &qmp_ufs_offsets_v6,
> > 
> > So, is it a PHY using v6 offsets, but v7 registers inside?
> > 
> The QSERDES RX0 register offsets on Glymur SoC are aligned with the v7 register layout offsets.
> Therefore, the v7 QSERDES RX0 register offsets are used for Glymur (similar to SM8750).

Mention in the commit message, please.

> 
> >> +	.max_supported_gear	= UFS_HS_G5,
> >> +
> >> +	.vreg_list		= glymur_ufsphy_vreg_l,
> >> +	.num_vregs		= ARRAY_SIZE(glymur_ufsphy_vreg_l),
> >> +	.regs			= ufsphy_v6_regs_layout,
> > 
> > v7

This still holds.

> > 
> >> +};
> >> +
> >>  static const struct qmp_phy_cfg milos_ufsphy_cfg = {
> >>  	.lanes			= 2,
> >>  
> > 
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry
