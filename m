Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A1A44E651
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787765995; cv=none; b=KS0p1kYf9LeXu6BNUqFbcfpl9yqJFsgAMY0dqqfeWevBLxVsrvrbTz77XuHRAaz8FqQtlINzvpDBLo63Qu/ACDt+Pihvdd1YusLa5+VvKx2MByMossJQujaK4y3Z/pKJToAxYMZMrwkQ/PUN1FbHZekYYpWeBHYrqVbVPjxJqBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787765995; c=relaxed/simple;
	bh=RNUvVHywhFZF7XRAeZI06z+g6tc5iHKgF20tqzbl9jw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JvS25EEMjhqQp/TAav/ssSaBpPX6dnG47w2sTBUA4Yc5V8dBG3DS5OS9HcaBjFHuTJb56XF/4vURlluYAu0ntb3bI4rl/BNmOEUoG0R7MhuygEMGoK7Xhf5QgeiW1HQhdlOkP0DgDixcWUAxrJYNfR6BWftaz6QEoxc25gKkSOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TtQOLEGz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kBSeymB0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TtQOLEGz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kBSeymB0"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QGuspE1008165
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cF2ObdGfsb68PRigF5kDWtjibcdTOJHY9W6xpmS42m0=; b=TtQOLEGzH9pt8AOx
	7brr/MLYU/Lp/wc+sHhQKaLpDe7GK+mBavMrbFcY6Yx3FH8VnTgQyn5M18kbGRE8
	5r2agtr5TaY4S+Knlb1KQBIFqV7RLgzuxh1XsxCRcytRB4ELxrFrSygBWznpedER
	jfYzUSywIS1sUsUMn7r2RAcc001/Z2Pu2jPVCPy9m9vPCtxUnTsPIw6UwUoeG+o7
	zLdBGx/+vbID1Jjj1zetAE5HOkC9RbiHwGTmzdwufY5zaEK5RLI0unrMWlcx5nnl
	FaZNk+hpK1aLOtuYUVePCkwp37lOoDs+XgqNFI6ySliv/kxYX45cOfDY/gg1RkQX
	AM4ibw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9smxb0n1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:39:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccb687f82eso16425755ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787765977; x=1788370777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cF2ObdGfsb68PRigF5kDWtjibcdTOJHY9W6xpmS42m0=;
        b=kBSeymB0NKe1k9hPkktCRQVsZCyrszwtnbsjV7qUy9QQO7pF4QyidLE4DXZ1buBmR1
         AF5NYH7rzqRbtYU53Jjycj9z/7sqIx9ZybIsTvWLxGiJiSvianc36sWPjS0mt66KqfEA
         aPMEV6LUsczaJrZJ1CUMGz7sW/XiRF29xWh0ScN5mUwCQFVZLJy6rAvQGtwU2YokxyvK
         Sv1x4A5iB9qru2aI1grDoXvfMjDe5KQ/unn+KDIGIbgUVJ7RPOeaDshrMIK8VpvxGlar
         eI80yU257gkNo0+e4eIeYQbMuhF5U7++A3e39cKyu0nezDYuikAcYxXvhMgoRGAwJyZm
         qODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787765977; x=1788370777;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cF2ObdGfsb68PRigF5kDWtjibcdTOJHY9W6xpmS42m0=;
        b=PKKQwRGCRUUnImQhL++FIwZSM2rHDcob1hXaVgiG34PLz35QJ90ZclXPuq6sJ6DaYm
         o69rUI05oY1WWvBVke/7DUs9BtEKlkl2WKkwsgpm/pt8GE/oyEzlbBW9jZqTFz4tkqgS
         8G3lbpCALcB8yB2DQHB5KgLq/n4HphEU4vLrkSTQuSl+lV0DmBENSKI6R968kx6edI0+
         cHMjZLroUOLKx6V1MKvb9fDi0FEu4JCNpKTB3a1KsL4kg4UYW2dfdGld56jug9+vua5o
         WW1dE16eb9Q1EbqOMi6XM3BizI4+V5UCGRKC3AzNiq11Zs8hDx6yYptwxJoptxTjRKa7
         Agmw==
X-Forwarded-Encrypted: i=1; AHgh+RoLbOjX+5Bwh8ogpHlX5mdcwpGowuX9RV2R8r7BPjWMmQ5jHvykgFh8HJnW2ny7WNh1JyKpBb7gSwmgHX4=@vger.kernel.org
X-Gm-Message-State: AFuF++m+f2GhakZNIFAmVp8fDO8MmhTFOp2hN72THxW9OuPR8jvpayI5
	I6o2QGwT9aNMa7KO5jBkExBa3tWF+d99/v2Qu8JUKqt1GQBpwghpU1LyMlrHhQwgg5J1OCq2wJP
	omCR4dA0sVH9OCAQss49xpTR45Av9eSPAGypdEunA7CK1KUH7dalLQpA1LgfEUKZL1VU=
X-Gm-Gg: AR+sD10iD7mTTWlKDGWDrvIXcEKfHAdf/ggcFDPtTSH+DqHyr70hyTkJj5qh1DNrCrH
	6Nt3miZZC55smlb4WjGEb3ZlBjMRTgvpsjFZCESVjx/Z4jrX+cE3IrbLdl+235S1ueovQF3nr6w
	C7R4vBtzqXLG7tzMT9I1mjD0lGoR3Jr7Ib12j48D7zaKx55Mrt7z0jA4INpKzzLDEvEVLBO3Mij
	uWTHa1wAqca0P6kpIcxQIlFMSiho6dGKKAbwEaNx2jXqH50WjjIz7WUw+Mhk/bf7YSOc/yEi8Qe
	T5VQ/XOakeWa0JvlRffB9R6meF6NS2/CFoDX1HZNAarSQrLV1a0/uUdVtTqvJ8yLfT/HzMymScF
	SVUnc95//LK7zFP/bwTATRJEc01OgS1/k/0dyqWgJ6OBiuzx5ZF4F3timiQboN2x2RqmWCtRCFV
	gx8GBH4dV1yYT+dfsxdw==
X-Received: by 2002:a17:902:ebd2:b0:2d6:61a1:822 with SMTP id d9443c01a7336-2d707af8b52mr47154435ad.10.1787765977014;
        Wed, 26 Aug 2026 10:39:37 -0700 (PDT)
X-Received: by 2002:a17:902:ebd2:b0:2d6:61a1:822 with SMTP id d9443c01a7336-2d707af8b52mr47153405ad.10.1787765976584;
        Wed, 26 Aug 2026 10:39:36 -0700 (PDT)
Received: from [10.50.45.102] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d70497753csm10214575ad.18.2026.08.26.10.39.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 10:39:36 -0700 (PDT)
Message-ID: <ecccf96f-e201-4dc0-8f61-7ebc6b9a9d4b@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 23:09:27 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 10/12] arm_mpam: add MPAM-Fb MSC firmware access
 support
To: Andre Przywara <andre.przywara@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo
 <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
        Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
        Trilok Soni <tsoni@quicinc.com>,
        Srinivas Ramana <sramana@qti.qualcomm.com>,
        Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
        Ritwick Sharma <ritwick.sharma@arm.com>, Gavin Shan <gshan@redhat.com>,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260807105451.3728284-1-andre.przywara@arm.com>
 <20260807105451.3728284-11-andre.przywara@arm.com>
Content-Language: en-US
From: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
In-Reply-To: <20260807105451.3728284-11-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O/oJeh9W c=1 sm=1 tr=0 ts=6a8f24d9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=y8rQOhXNOWzMl4_LRjcA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: -8QmxvpP_XOJcpn9CDHkuoRXUCCWs1XW
X-Proofpoint-ORIG-GUID: -8QmxvpP_XOJcpn9CDHkuoRXUCCWs1XW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE0NyBTYWx0ZWRfX958oCw1NpdAg
 /VoL69KuldaV1jl8dvh/wdwyuqJXlB5AHRxuej2RdSoqKXBSk2E3EfCZ1IjUo8UJ72iqlGhOaFi
 E4syZ+SF1cEhGlp7cpdsuo6olSgpzusF6NjddDAoKN1TeSZFx3ak6sqgKduMRRCn5ps6pvfuNIx
 XaJMRv+LDM42s7Ja5qn5gUHVScnUrT5CuWijIvrv0o4Ugw56Xws4bjgbDEgcPcFln9jRj+KKliT
 V7IuJgodqfi3HGCmZROR8wTwgBQXa6TqMQAIIwDC+5/JBRucvNSfAnnPQVa/zIi+ZssbGjFT0f8
 KJlD2ihIMeCBV1zjIYoPqybvs1nfkgPrAigNASqc86HK7LVSNilKK2NosOIc8pW3ls34DsKtmhO
 f/lI5Ru3/FZcGjFYxsIwYRi6AksW462BoGmOiKSEZ7LKIXM0jEdInnavxqE2Tc7Ss8E1QOYQ6Po
 GsZUhMSjuxzqnA7MUgA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE0NyBTYWx0ZWRfX+22NMGAz5Rg4
 ZHkPlbfMTCYfFWqbCPYQ2CLztCQNFs0amuwRD3a454CpZmH5+6vdbsBRDhf9T7GooQVjsnoDE5Q
 oaMiVamEwEHNYJ26pDEvTC2iY3CK8dc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260147



On 8/7/2026 4:24 PM, Andre Przywara wrote:
> The Arm MPAM Firmware-backed (Fb) Profile document[1] describes an
> alternative way of accessing the "Memory System Components" (MSC) in an
> MPAM enabled system.
> 
> Normally the MSCs are MMIO mapped, but in some implementations this
> might not be possible (MSC located outside of the local socket, MSC
> mapped secure-only) or desirable (direct MMIO access too slow or needs
> to be mediated through a control processor). MPAM-fb standardises a
> protocol to abstract MSC accesses, building on the SCMI protocol.
> 
> Add functions that do an MSC read or write access by redirecting the
> request through a firmware interface. For now this done via an ACPI
> PCC shared memory and mailbox combination.
> 
> Since the protocol used is only a small subset of the full SCMI spec,
> and the SCMI protocol has no full ACPI support anyway, open-code the
> (simple) SCMI message generation, for just the fields we need.
> 
> [1] https://developer.arm.com/documentation/den0144/latest
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Tested-by: Ritwick Sharma <ritwick.sharma@arm.com> # on Arm AGI CPU
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
> ---
>   drivers/resctrl/Makefile        |   2 +-
>   drivers/resctrl/mpam_devices.c  |  65 ++++++++--
>   drivers/resctrl/mpam_fb.c       | 211 ++++++++++++++++++++++++++++++++
>   drivers/resctrl/mpam_internal.h |  18 +++
>   include/linux/arm_mpam.h        |   2 +-
>   5 files changed, 284 insertions(+), 14 deletions(-)
>   create mode 100644 drivers/resctrl/mpam_fb.c
> 
> diff --git a/drivers/resctrl/Makefile b/drivers/resctrl/Makefile
> index 4f6d0e81f9b8..097c036724e9 100644
> --- a/drivers/resctrl/Makefile
> +++ b/drivers/resctrl/Makefile
> @@ -1,5 +1,5 @@
Reviewed-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>

