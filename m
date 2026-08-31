Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D12A3B3C10
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165237; cv=none; b=GSMIN5ijctwLDWIFRA1GIkmD8mUAagSgCIus/f4kf4TN9xjCkF31UKSxU4SUzxSPsQkJEj/boIv1dyecpFxIPpCxBaUrp1zvx7BSRIY6bif9vLSauaXMHfM4fauKvAIBZxTAhoI2JcN4oQpa1ydyOzcmLaKzqSLSulNURuqEKO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165237; c=relaxed/simple;
	bh=E2cs6xh71vx030d1TizgLdvJeC9aenu1aS5GPS+AlB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V5GXmx4UD74dLEtqZhQ8rf9I1c6HTs2gxW3oYXPWSR7+b2gxp+pzkHz9vaPWZKuGWMHR+ky5ITrz7oo+APCRYioCT4TAJ4BhcceuG1uXD2XDkeSQL24KDu7FXTLuIBrlzv/u/Ra9e7RnFimn0Yfx+1/hhqTr6dwg9tYE2v7iwmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JElyMn5c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h3QmSmVd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JElyMn5c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h3QmSmVd"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xFip2332458
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ha5fAnUZVZrjWDFhLPVJNlt0
	TSWD9lvu+/EaHaGmMUw=; b=JElyMn5c2DESjvXs/Ccwb2wtyI8fwZYnffxiXzzD
	J/pnR644em3zP2kL8MwzkRFvoOQi0G7L1fOGQk9vyzd6wt6DEmUuraPip+8A0Aqm
	yxuYfHsA3BkS53wVB9yAvR4sdp2ploe3e+FZql3i9ZXlUZtIj5aecGZlL50eOEPM
	+/LoCscGI+3N9fBXOwJ1bV0baa0+AT84qTQ7hoJos+LTlMcYnHegR6+AxACdsfzK
	NS1KmTYX9Z6ifGAjxB0pOXYKa12WNmXnntF2b7tJbJu4nWjVynM84UV8WQloGfWy
	pI8ec0M324fZI/B8O0gwHOvR1jNUtLLvfuLdXQG41MyQxw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrq859ny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:33:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0aso1490328a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788165229; x=1788770029; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ha5fAnUZVZrjWDFhLPVJNlt0TSWD9lvu+/EaHaGmMUw=;
        b=h3QmSmVdt4WaVsdjh4iVRzJECq3slHcSh92vaOqeda3Jr13jb7sBzYNb19iRquR2kq
         IZqfac/WYY3scEG2e5tPG6RAHvyUPwk6A7nQcxkCjtCtyimhcilM+QIKDumXL/KQ6U7j
         pCblISGn9KTueLO7YlLBJ2vTaXFxn8PXZyEe/3ALnvw0/6NHXDq2oTtIHME3WjdxxTnS
         fwgyKlyvV1cHgg35Xl+GxipXO60C/BxF4OioAjwdc1pfL6z8cDWj6b5y8Lfnd7VISxZ5
         fFFdvbEXa1TyyQFta2dbzwv8KG/jcaDZIzVUD/99JtHPXJx+a2U036S46qYAeB/24D/T
         QO4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788165229; x=1788770029;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ha5fAnUZVZrjWDFhLPVJNlt0TSWD9lvu+/EaHaGmMUw=;
        b=gR096TBzq/S7iR5GrNFq7ixSGEog1KkyCq6ulGaAz0djK0Rj1dXKPZ9nZt3RzMJTb1
         fuMW8lt6joYeWwlLpy012QQZkkYwB9DoPyBC2oOiv3a3WupdRETJE7n4KX6nUS9tvSM/
         g6ipXQVQB++ocZFmeUFp5+/b6pAYiIgnTD+if6LwHQwZeIHFZwXoXk3+BH2Yjy1arIWG
         8vUl/p8fXisurVoIRs/oBOjQpGqKWZS2+zau+WL9BlZCMTnALZQayeqMDIGpPcq9EY1c
         xJVg2HUXppazPvJx3bqBJfAa1SbGu2924wsP/+wm3yw66BDGcPd5olCs5qS0Az70t09o
         GDtg==
X-Forwarded-Encrypted: i=1; AKwUvBxEzHEaMoy4nel/HuImXF7vcO8pjLQjerue/tICfgF2y87cn6SD2S3cNKK7Uae53AAW+nWGqxH/IWBRhI4=@vger.kernel.org
X-Gm-Message-State: AFuF++nLbUmiZ0PdWLEcHHxVwBcFTZFd/qcnGuyQywW+ElM4k1xpqtwf
	7sI5jfex1rESlbI2hRqim5QOUNoy/QpAJBrZfGfBYGAi6uez6feVeW+qAziRFM+meI+/NmGgeCB
	jqAYVzplLxpfcZwOe6uO6lme8O9hMvoTBRdySVCy0UPkRpUSEc8Fj9XdorUOj7Y8/ruk=
X-Gm-Gg: AYBFou088l43f6EJnJbq2rMWweLEdWMESEJ2MPwOs23W5oDA/QbxIPsUf1I5IoGYgB6
	XlryAe9s5MCIuOu0wpRoeKrDoT1HsfQ8PxX9a9OrfFq0LznALKqILD/w3ZwEppiZjiXX8ZVIBHn
	uO7S1HCd2YeeI5g+aSdgydimygzKKgdPLTrTe4YnLb85UatlB2LkDsBM1mpVBRjSwsef48g+XJo
	5etTLXU3rYjIXgOGFMs+KnSST5BpDAS5ET5tlwZpapRI5rQ6vKpxKJYHxRc544nMGmRNehdx5lU
	hP7uvCjczrPJWijKtkSkYugkIVg/deyqyNLnrfGzYfBua1wOzpMFky0U+1IBPXd2I0MasNo0kTz
	oZIIolJBwtenl7w==
X-Received: by 2002:a17:90b:1845:b0:38e:9784:dd47 with SMTP id 98e67ed59e1d1-398da5e8875mr5965753a91.1.1788165228519;
        Mon, 31 Aug 2026 01:33:48 -0700 (PDT)
X-Received: by 2002:a17:90b:1845:b0:38e:9784:dd47 with SMTP id 98e67ed59e1d1-398da5e8875mr5965699a91.1.1788165227912;
        Mon, 31 Aug 2026 01:33:47 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b58c057bbsm13558506eec.19.2026.08.31.01.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:33:47 -0700 (PDT)
Date: Mon, 31 Aug 2026 14:03:39 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 3/9] net: stmmac: qcom-ethqos: fix RGMII_ID mode to
 use DLL bypass
Message-ID: <apU8Yx08/PJiS9Xw@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-3-f0f4a1d19929@oss.qualcomm.com>
 <42355330-c22a-4fce-98ab-dc22b321ff16@lunn.ch>
 <ai93X/cNWHtEQsDt@oss.qualcomm.com>
 <82705420-771d-41bf-a4d9-ed94dff86ff0@lunn.ch>
 <ajF6q5eKz92ddqVl@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajF6q5eKz92ddqVl@oss.qualcomm.com>
X-Proofpoint-GUID: Ta2qfXnaNQxGbsl1dKbxx8KiUzyVSEMR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MiBTYWx0ZWRfX8KlmfLkNURky
 G8Fa2U4g5GKz6iia4T1rbbjYmAlqlUt3a5BjniBvRhz8xoKVLMmj1DkxEZ7yCf18MjnjaY6VaAq
 blIpxrZA3AgtTKD77onK0069vOMXZ9Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MiBTYWx0ZWRfX06+qcL+H9rE/
 867Q+ZMqNs38w/M68xSZr0lpavJGk7PhF4SfRC4YO5eAL0iiq3GkZcrkuoF0cWiJZElQxjnQY6r
 F6R4mVr8MTUUcysG6inGetU/f7EUXSbcrEaQMA8JGo+RYv3bJe+yyDV9TMyFO0+SVNl7e+cuiCH
 NpX7DCgxpf6VNrGo/XTcbEpPHAWXwrRo3Lx6j9JqMpMt/D8rHofyaQBhr7YsMWRRAkw1aFZVUxI
 v7OjqnOLnCB0AMQAXk5O4TPFCRmkGJaDSGgpEQ1/AsWYXE1w6jNXLG/HuQ43QOT1gKTeK1SMZC1
 CZ0ZtjnUZZcSxiNOMM53ZVvZZIjXsK6ewAYeQ5NEDGdas6DvPpfBwXJEf6ZFGB7u+Gm1VO8hwIp
 kt08etp9/rJM7UbwWx+vTH9egoa5Qqxycdlk2npjoGwNURjZBITw5iG0a+pxFBNDlTD1b8IbJ7z
 rvr54KlVcnraP2KSRSg==
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a953c6d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=ee_2aqc6AAAA:8 a=4fMhwKYZf46Hqd9eeeQA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-ORIG-GUID: Ta2qfXnaNQxGbsl1dKbxx8KiUzyVSEMR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310072

Hi Andrew,

On Tue, Jun 16, 2026 at 10:02:51PM +0530, Mohd Ayaan Anwar wrote:
> On Mon, Jun 15, 2026 at 06:48:55PM +0200, Andrew Lunn wrote:
> > > > I'm curious how this works at the moment? Do no boards make use of
> > > > RGMII ID? Are all current boards broken?
> > > 
> > > Searching through the DTS, I found that we have two boards using "rgmii"
> > > (qcs404-evb-4000.dts and sa8155-adp.dts) and another board using
> > > "rgmii-txid" (sa8540p-ride.dts). No board which uses RGMII ID.
> > 
> > So this causes problems. We cannot break existing boards, yet it would
> > be good to fix the current broken behaviour.
> 
> I am trying to track down the sa8155-adp and sa8540p-ride boards. The
> EMAC on QCS404 is extremely similar to QCS615 Ride [0], and I got that
> board to work with this series (with RGMII ID mode). So I am fairly
> confident that QCS404 would not break (if its even booting up with the
> upstream kernel currently). Also, I think we could change the phy-mode
> for QCS404 to "rgmii-id" from "rgmii" if these fixes go in.
> 
> > It could be the best way forward is that you issue a warning when
> > "rgmii" is found and pass rgmii-id to the PHY. And you also change the
> > two boards to use rgmii-id. Lets think about the rgmii-txid case once
> > we better understand it.
> > 
> 
> As Konrad mentioned, it would be great to know if we can test out these
> boards. Looking at the different versions of the ETHQOS programming
> guide, stopping MAC side delay should be as simple as what we are doing
> in this commit. But whether the two boards work directly with the
> default PHY delays is unknown.
> 

So I did find the sa8540p-ride board but have so far been unsuccessful
in getting it to boot. While that goes on, I would like to proceed with
a series to fix RGMII on qcom-ethqos due to the following reasons:

 1. All versions of programming guides give a programming sequence for
 MAC-side delay or PHY-side delay. There is no concept of "rgmii-txid".

 2. I also found some downstream code that was using "rgmii" phy-mode to
 program MAC-side delays on the sa8540p-ride board. So it looks like
 "rgmii-txid" was a workaround to enable ethernet while support for
 this board was being upstreamed.

 3. I have been able to test this patch on a variety of boards now,
 including:
     - Shikra CQ/IQ variants (with the TI DP83867 PHY)
     - QCS615 Ride (with the Micrel KSZ9031 PHY)
     - Talos EVK (again with the Micrel KSZ9031 PHY)
     - Talos Lyra (with the TI DP83867 PHY)
 These platforms cover the two RGMII configurations that Qualcomm has
 typically deployed.

With this in mind, I was thinking of breaking up this patch series into
separate ones to solve one problem at a time:

 1. Introduce support for "rgmii-id" using PHY-side delays rather than
 MAC-provided delays. Also, issue a warning if any other phy-mode is
 being used.

 2. Fix the DTS of the existing boards to use "rgmii-id".

 3. Once the DTS is fixed, remove the now-unused code handling non
 RGMII-ID cases. This should also allow us to remove the whole
 ethqos_emac_por code since it wouldn't be needed for RGMII-ID.

 4. Add support for regulator voting in the DP83867 driver, mirroring
 what Daniel Thompson/ Alex Elder did for QCA8081 [1]. This will help
 in adding support for the Shikra/Talos Lyra boards which need the
 supply for the PHY to be explicitly enabled.

 5. Support for Shikra can be added once these changes are in.

Does this plan sound reasonable? Thanks.

	Ayaan
---
[1] https://lore.kernel.org/netdev/20260605010022.968612-3-elder@riscstar.com/
