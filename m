Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BBD3BFE26
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 16:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792255373; cv=none; b=kwvRYyo1sll/AK9whFEZg6l8rwa6Kvt6+Fp6BKCiwoeldhkfj8mGv0At9NbL19YrpMi6iPJDbl/qeZy3MTvFYbuy7GYIc4rTkY8b38f2DJjPU71+6Lmi/3f/KRkA7m6drtpYkVz9tE4vv5kDCdty66bG0uSZWrKxBs/pzZJLEFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792255373; c=relaxed/simple;
	bh=oqtbq2GGeLimTwMiPXXLtV6CRd56cCRXZHus+yXgxlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NP91QFYPb44QtKlgua5Sn3z0oSvxDP0bKSAs0X5wnj/id8DXXyXReypAeCTITNaCZzBm4DFusUtT2/6ojDIPt9h0xcD6u3mqdo+MoQQz81MNPciIo7NHEv3YdOSX2Vkx/Ztd25YocXn9hHmjlZceiwjqO/RBhlB8qChW5XjsPRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lNhoZ5Km; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V0xBkvDV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lNhoZ5Km";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V0xBkvDV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HGAGw11944686
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 16:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A5QXkyLgqve2yg7aR0QbgBy6
	tWTAd+S8xlmq02cu4VU=; b=lNhoZ5KmND8CPcI2ztJrmEz30rkXHlfA6ZXPZ/BF
	dIjaldaBjswQDQz152ahMBvv8elLhUYIikte8R33fvDM1XFYB4bJJwxbmkydvHs9
	eShIPCBWf8E5pwxIyBHGeuDQy6qdqbdVggs0w6DviKRSBV4mr+P3cTJTp4wdY74Z
	5KS3ymg6PgRQRKbX/+YVIu7Re+hZZAA+q5SytRzeNXF0f5SCG5w6ckx/tUicRxJW
	NwxJhIQeClRVZ0OtvWLuWHL0rqEzv6Gfy7aqB1TktkhdKtYwuruOrhAkDsgnYJJ5
	WmRvDQrRAWN6umuhYE7m35Y2hOg40tfgMs8wZ1wwrVlYWw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc016hes2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 16:42:49 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso1863192c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792255369; x=1792860169; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A5QXkyLgqve2yg7aR0QbgBy6tWTAd+S8xlmq02cu4VU=;
        b=V0xBkvDVCCZqAGH5Cr5IQ5SYSrweZgJGMCJZvlp4QOyF6LOvZCLk0KmLNig/hEyhrw
         MTIFPCwh8UR2AfCntw/X1ueFjqSGe3JzV1mBX7Drs7x1RLU9J7Eqo0a9r+hXl+78JgjR
         63IcXgV1rqh/OGfN5y6uFtzKgYGFWXEx6XR5zd4gibZ9VA1hvVbUbozZN8S1ArJGRzvD
         bPJVqnY2HjRZZgCJoXsaaTHK6XHahraEPJnupEddg6BMRzy0fRb45Xh7YNaXZS9LMc99
         qprDVLlQK1FKDUplcMfYBVeuzut4iCupCPn53iHAKBW5mCWm31x1iSU3+gxH7j89ARph
         mFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792255369; x=1792860169;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A5QXkyLgqve2yg7aR0QbgBy6tWTAd+S8xlmq02cu4VU=;
        b=OBeC09hPWkHJrhgFtCVaCzRcKyjEzSrYv+B2uNEn4wS+BzwbFR+dyAlBLPnZBWWj8X
         ajjwdVMv7mSMGfjR5LwrzOYDpqOqCLbj1LfBI++NUeIDpapi61B/o2mSKnhjFhAaER/c
         PJlcHaXBLAyo+g2jo5sck4QX6Kc9h/iZnXRGj7if9oY2Q5f4DYpnsmu4a+tKRujK23PZ
         qjC62fNN4AHWyVeYQbcXwWxZ9tlhwEFmgxn3WTMUYfSPPdtNjUtc9GVEGQWHr3CMFbz1
         dsouGLqZj73PT50mWLsTC4kRGd90uUhj4RTnwPDGC9HgB4aR81yx/4gg4yu4sJwqZEmm
         5jqA==
X-Forwarded-Encrypted: i=1; AKwUvBy963SDvrcuEIs7vfKVT567tIeBWHhqcJPupT/WK+M0K1M/aaTVTMflX7qZJXQRZu8YuAPCZrnwTDkYZU8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIT/sVSpLPmMVro/mT1aDxZa6HwZ1gkswFnyn0jIEQAKuPlD7vx
	ftJAkXZipSryemhTHuWQkMs9YwODwGumGlpaW2SUPYUHIL7vtY+2P+GGfkkHDAYO6oyklRiXVaf
	ncKVC5v3t1F4bdvb3++cR3pBjr7w+ZL/2d1XCjS2jQghWrbibCueDgZlWzi3zZSg5fLE=
X-Gm-Gg: AYBFou0flLmIz5IgweNefken6S539Vyf716Xhlh0sUhPCCq1mebVsndJqdAigQ7fLgw
	2m6rwXQA/gJlnR/RuwV+uC6cWUNQSJdV5z5gJF9/NOYAud40oXnerE20n1/2iHAa4rPrnrOpDD/
	3pgYiTGl3CTNaRDkWdNi9IV5Otk/ZCHXRXSzzzF/Lvur7623VH3iIk7CWKy4IrgvD/1hYwmoX8Z
	tvFLYMIaYpByOpEr27nPom2rHhcnb5d1OdPnXPuXLCuArUjkY10nFZnSo5hw7RC9Vz1mzZHI4vd
	gFbIdIZTmDEnVwsQIlh8Wsmhcf6Sfd1tG1/6zKyOqi4IIzAtyyGiXBwK319opnV5hsPVYKveUVr
	yiU3dmRUDLYucHg==
X-Received: by 2002:a05:7022:7e89:b0:14d:ef19:246f with SMTP id a92af1059eb24-18513e7b18emr4689752c88.45.1792255368768;
        Sat, 17 Oct 2026 09:42:48 -0700 (PDT)
X-Received: by 2002:a05:7022:7e89:b0:14d:ef19:246f with SMTP id a92af1059eb24-18513e7b18emr4689692c88.45.1792255368055;
        Sat, 17 Oct 2026 09:42:48 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm15041602c88.5.2026.10.17.09.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:42:47 -0700 (PDT)
Date: Sat, 17 Oct 2026 22:12:32 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Radu Rendec <radu@rendec.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH net-next v16 5/7] net: stmmac: qcom-ethqos: reuse the
 address of ethqos_emac_driver_data
Message-ID: <atOleDtybJde/UE8@oss.qualcomm.com>
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
 <20261014-qcom-sa8255p-emac-v16-5-0266c2ead980@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-5-0266c2ead980@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfX7hifyjf6sv87
 ydSXiYzk8XWVR+iH9PvGJoExVKe6iFDeXDeJLcUkXYxk45rkf/yM1KcGROURjqiR3AdOb+g955o
 eS3APUosGcg5furhWe5SBaeWVgsLwa0=
X-Proofpoint-GUID: 02zamcB3I9WNNyVLqRAel6s47z5KsIf5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfX1z5gYSQfHjFE
 cdwwZEn/coUKsmY0LjX2C8Me+6WpEcC9WmWxXzUuuI/Cwx5A0sqZW15AlTXbEap72A1QV9kTmYG
 2JHPIhONsFAtoQvyqc4vijd9H/r1IR13/8nvhFTA+il1mc/HeVbbChe+/9KQG3cYQLB5S557xNP
 pFX/PdRLZYb+jHUSxn5jCWn0LLdB6JOzFlmFgVWHPLsrZsyuHDRJyFuQzt+xQgFvcBQsORAwEiN
 kpHr7ZMu1owPgzzCXl8u2k3NObN3vmC2zXuEVq9ykyDtUWZqDDOaTq75oV4yKWCzlXy+E9Raj52
 56iGL9hZakKNY5H6fi4IvOI7hXtz4t7d/OXgexZi7ukoy0Bki3lbFv37Yt4i8HLzfAsaatWHMqB
 NL4f3PIO1VxB67PTPJCfKxCOiYaRL7rgVBO/NSynhHtydXNUb23EBwj3XVUpP32EgpFAi+maXBy
 nrMBdt6pX57awLN29hg==
X-Authority-Analysis: v=2.4 cv=COm/zhrD c=1 sm=1 tr=0 ts=6ad3a589 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=XX1oeNa5M8xgm1Jp0F0A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: 02zamcB3I9WNNyVLqRAel6s47z5KsIf5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170066

On Wed, Oct 14, 2026 at 02:36:44PM +0200, Bartosz Golaszewski wrote:
> Instead of needlessly copying the fields of ethqos_emac_driver_data into
> struct qcom_ethqos, just use the address of the former as a reference.
> It's .rodata after all. This is done in order to avoid having either two
> calls to of_device_get_match_data() or having to extend the latter with
> another field when adding support for SCMI.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

After testing it on a couple of legacy non-SCMI boards, I did not find
any issues with this patch, so:

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

