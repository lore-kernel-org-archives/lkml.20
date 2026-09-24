Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFAA3FF1C0
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240769; cv=none; b=FfAbYkvmLDjltWi0LTvx2IskNNV7qN0TaPRncmRaoew4xhCZ+FSBW9ZE3sfhWesIMDyeOxY6rVYDWJmFKuEaTbY36x8xjIbXOEYJEyujuUHpQMFvw/UPo7/30a8yPCyOJXeBkWgRSGyeKCfV3v4q732JVnsNqFdwe5mdJ1I680w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240769; c=relaxed/simple;
	bh=poW0PZ5zk0x1aS6ZoUJFhJMAlVCA0awRCniF7sN81mA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hz6F+Q+3GNwxnrsb8b/npoCluYeCsbtUDQV2VFvP6uhTQNdY4YsD3Hld4i1bmMKr32flo10EaJyCwqDX1PRHEQIHAmIl0TGGJ2BbvlZC2VAh9NrWfdF8xuNlOJXomYd1bfbFAGvLTQ0NEA6IUKJFDqN5tqFUL8y+mhOoUQvbMzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PTkDYGRG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NbedwOb+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PTkDYGRG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NbedwOb+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eWW01741982
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:06:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KZsUTsJlAuxATif6ogT+hS2X
	xr5/AGSAeT5fyF5OwXg=; b=PTkDYGRG4BI+pslPifUZbOe64td8IeHDTsLiS4qe
	llE5Tqv0ElgQ7n0ZJrJFsnOp8p/zzaKC7znWFI7TBfu/19UNhNxW3o8nBattTZhA
	MtgHYjji6URRqk6dQrSuxW2ZBoxS+I414jmtH9+KCfyfcPwR9J11OMIQr7cXWs+p
	hVF6Tx2iZ5gA9yvKcBfC+rLoR/smfgL+RLjMo4m/SF40WZAbTZMU//xmkhBS48+A
	dClHZ3lh9gaCzTOLMmMBKFYXnGBlNgOAPYLO//fJSkt1pKzrs9y3zZYMhHvN5uYG
	MQtkpXyC5zVQDZ+KpOWo/umG1M5Wdu8mh3uSYucAr78sNw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfkbm794-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:06:05 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3282d5302ffso750574eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790240765; x=1790845565; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KZsUTsJlAuxATif6ogT+hS2Xxr5/AGSAeT5fyF5OwXg=;
        b=NbedwOb+mTyCXrSvlj2a1dY/UxCzuUU7N0fACF90kwaJ+kULhzRm+ZWpE73bSjXpB3
         0aKN5jQVkx7qBCCZAiBBjBgzK6DND/GiWe8h5ESnrrm1K79s2ZSuJ37hzGtD3wKarNRZ
         DIQxJ31EeNXLvViRDrd1jI+Ce4WrOBvPQH9kLfpdggwyRJbxPcDOTdSljxbPHmlEUDRC
         aBpvwpj1qviXpaJSFNVLtbw3PbS957h2c/gNBxRigfCsK8p2TFc55KDCQVy/axG9tnV0
         T6SDApPrSUCNUxdEMenUIeo91qLGrEsuNf6c2MUqtgJKMLvtz0AI64++4mlhs5c7V611
         bB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240765; x=1790845565;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KZsUTsJlAuxATif6ogT+hS2Xxr5/AGSAeT5fyF5OwXg=;
        b=usFL71qY7xOV+st43yLR7S4+b1npdFNvA3p/a0ixhP+xYal6QQXrtG7Q1m3hDpztRT
         Su/Qn59+0ik5U1PvNq33CEgJps9AYhUssj6G0fHaBkDuThEDP/DNUa7x9/Sm9lQi1r6j
         kOSF133MdnxYdZYh+Vtyv5HqwySweazA+nh8PmlEvdB07zhLI/dbzkp/+PV37y8AB9uk
         HgZzrCfkYdDEHnLrlo/EWQ6EswHSKI9SVEV5z2Gxl/wSy3dVKleXbdjKTbvEZHGqeaJo
         4Yv8PgjUIlPh5ppdWo0/Sf7qY4a2zzVccVvNDIaoi/UK/O/jWhAxoDEFHuH6vxpFRx6D
         3ChQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+KH23ZkmjRtdIP3Quly6GBBmGUggUNTQbGNZf9EdvbqXn9zOovOzeA0Rvru5eEX5uc1d0zyugIuSf1mo=@vger.kernel.org
X-Gm-Message-State: AFuF++mSrbrsL5ummhBKiKHqWmhynXv2ZZQo0KZovSQzIGnXUHfJIPCf
	Zw1uK1kOnfsEpEi4OEb20K7PlnD+OVmtjqaaEDmVWh8Up/nKJYwXTmqO+5VjVBlpgsA2CNXjHtW
	CwxQYnYCsVwtfpAuG9lllIIV46XbDaErs6nS1wfsFgr88ZyLTzdnS5Y2/PAUJALvWVIE=
X-Gm-Gg: AYBFou0IzATl1as8kKD3RoHy858GNz0wKol+7Je9b8Ztdi0Iged3FQ2Rvj9Ffbd5yqj
	kP/xxUIufuQbGjv8UsSzGVU/BeuHpH20jPVzj4a2T+/F8zzBBRLB8SZzzAyJhl292nsnKaho4y3
	4oQnAphkAaxywK/uF/lVbLijJzJKI6l/qrf9pJ4r+GqUwWoUwXLyeUoJUNhSU7yRSTPDTNLCR1t
	bM8pZwaBJ83T8GYag0YO7yPGhnntZZarEDbOEK3fkEQFnF3HhnzNNW90fQWQWw852uUDzC3M+6k
	iII7Cy28u7N7uAdHn6srcnAM4X1HcXnN6igC8w0Qn/VUYgt4pZS2YoInBTmxPhHlWAdPvVsR8jC
	zgzf8uA5JPmK+nvn6K4C68GPgN2CKNglHZhOFFYkoWA==
X-Received: by 2002:a05:693c:4144:10b0:33f:ddda:6076 with SMTP id 5a478bee46e88-340039b21d8mr1392569eec.6.1790240764539;
        Thu, 24 Sep 2026 02:06:04 -0700 (PDT)
X-Received: by 2002:a05:693c:4144:10b0:33f:ddda:6076 with SMTP id 5a478bee46e88-340039b21d8mr1392540eec.6.1790240763930;
        Thu, 24 Sep 2026 02:06:03 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e90ec54d8sm12602799eec.0.2026.09.24.02.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:06:03 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:05:56 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] clk: qcom: dprxcc: Add Nord DPRX clock controller
 support
Message-ID: <arTn9HKZGNSUxt0j@QCOM-aGQu4IUr3Y>
References: <20260924-nords_dprx-v2-0-fa4364e087ef@oss.qualcomm.com>
 <20260924-nords_dprx-v2-3-fa4364e087ef@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-nords_dprx-v2-3-fa4364e087ef@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzOCBTYWx0ZWRfX0byZqXHHezpF
 Lr5u69xrRcxXNsnib10sBOdGvhYfUUoPkQRWErTVZ5eNpRocTLfXhvkHKV+SBRpbxEhh/4mOd33
 a1JkJh3167RCX2wgLz5XM2bPa2yxPT8=
X-Proofpoint-GUID: 8D2sh0JaDeYIRkzft-m60xyztoF-k5dg
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ab4e7fd cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=geveDRkZF6hWoGEvibMA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzOCBTYWx0ZWRfX+TlQmb4uXpUt
 03R1Q1oS68vaA+toUSGsV1p1zHx9fBQES8UkpH3iAuAc9fV4mobU1TAII670ErHubjwLqkPnq00
 OxAbmeSmssOj6Nsea5i/w9dRQ9E08Mboum1tzsnLarQruyCytrq0mzrwrCeGuowS6Xk8B2RMTZN
 3i9V4SrW65JM6erFlW3KI7LugOTtv7IlxQ4KZfOSF5vDhXHiEN8T9uFO8EsPFKd5KjlJENufUii
 EyPkmjlq8n40w35SyECbZiYZ7OZgvN/BJgzdY0lah5uMAa8FvF2p68Nb4Y20sjuwH7OThqAGHO5
 vMQOqhIhf0aBZua7Lz3pV0fAjCwVrsgVqy6PRZNCOOVKzfrxc9ADoSH7oNnJGs//7LKtcLC2l8z
 mV4XRq7NuOpWO8L5vtlZ/8UbCkcHYjHnO6EVW5+xfRAW17XdvKg21Mv7SRyOBftkvxnv7LACo4x
 JS7q3O1B0w7ocGdc++w==
X-Proofpoint-ORIG-GUID: 8D2sh0JaDeYIRkzft-m60xyztoF-k5dg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240038

On Thu, Sep 24, 2026 at 12:51:33AM +0530, Taniya Das wrote:
> Add support for the DisplayPort Receiver (DPRX) clock controllers on
> Nord devices. There are two identical DPRX clock controller
> instances (DPRX0 and DPRX1), each providing clocks for the DPRX core,
> audio, AHB and video memory paths, along with core PLLs.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
