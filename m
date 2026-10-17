Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C561E3ACF0E
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 16:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792255171; cv=none; b=l+M0rHQ+4BHdYN1IZ0wbCeEnW0pBNQDh+k11+YrdZY4lVdmasFlIejgX+Dlflql0YAwXzbxuBMCqfxIf4MA/3oLbxdIRLRizBDPBKlWjgXPCQlWfKvJK/pKhpQEExUFJd9Cr0gmGMO22BtNAvQFwRgpSLzSGguXr+nLNC2g8L18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792255171; c=relaxed/simple;
	bh=VjJXPVvJ28GFo5oaYh5V0N4OmfzYXgOo11M2D9Ou1Sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iaPlv/662VrPQy/rUP68T3l6M2gm93zs6u6xn5o+FbxxCkVKmmX6/D53aEqn/ibQaXE6EGc4bumJKQG5gg5X4jU74dqOuVoFo79nhPQs6imxr1Hm3BcithiazDeNwnKGk15Is9b6mWjpNwUoHZZCihzzNHs5MvUe4ybRDyK+BXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iqcI3njC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bkWXpWKm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iqcI3njC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bkWXpWKm"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HGA1j61332737
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 16:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hz4iIDuDhHEcy2mIuGeKuord
	9GLsrFZT6JV2X218PUA=; b=iqcI3njCDzM4e7mRHLw+YV3xmeKx13qdpNpYLO1c
	uKuJcnhcRz3rtqo+XqDGeMCZv2dURNY8sE4Up/wSPorj21shN+H4P4PvOUiE1k4f
	HrKJsV+TXCcL1K6rMrtrXUEtT4Vlu4w4TsY7ngl01CsdTZz1rKlYemGVmnu3eNHV
	+HjThJ6ViFeCJyAVpyHQYmZUV+RGbosOkNtCwmXNHB6OUn0sulMIxvCNKMz7qg71
	VvhPs8OoWfwTc1Wwi9VbA8nr0EEah65QxY+qlhZZrIAZfY7QJDXrV6PujpiUFd11
	LA1oKqK2zNAXkDqjMldYzsbUJ7V6A2GAOrlTldaC5GhPdA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbxcnsng7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 16:39:28 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35d4538fd74so2935975eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792255167; x=1792859967; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hz4iIDuDhHEcy2mIuGeKuord9GLsrFZT6JV2X218PUA=;
        b=bkWXpWKm0NRUSG9PhLYNTHN4FhE5pXgWKQ2BiFrJAtTOrxb/gAywrLXj2xi2b2VLXZ
         LAsW4tMXgcBZ3lKecm3kdB0a4DKW24THIoB/56X8kIN0VF9ox4X7T1NACIHdwP/POypx
         lqaugXapDVanzTkTWB24hmEnFf1Ab8LYqWDH5iHSXodjQU5aiJ322S32y+58ZHZv4ROb
         Vaz7JgGfa+6hEBy4UOSi/BatVitZ+27XBj+/l/NORlB+y1kEnbo0zKOtqwfJj8Bcr43a
         oN0VoMC6vkfxjAeQ5r1phAXB7gAfVYB/qGtUecgSc6M93dRlw/4Yd8ZoMgu9IDGawDgP
         9r2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792255167; x=1792859967;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hz4iIDuDhHEcy2mIuGeKuord9GLsrFZT6JV2X218PUA=;
        b=c0y+4ut9sC1lZ29XSQUje5WOzRO/00ngrBclvJLDwN5gxaITsqF+Qyux9rzvJUeGFM
         iD3QMvOhICaNujhlDgaU0+F1JEao/JiAxRCH79ftH4unkE07pYIDkv1NGCiAAOxNs5Wz
         TyzGXnxcc9PYWS8L+HQMaqXXiIG8KLOluUcoGjm3veedHxABp9EF6FbXtL0ABuKqj7BF
         C56GNnLpquLkBYHQp3c1ooIqIO2uslxn18RpAKJdcvFrsaNKDBJ8/WAxT5G4vBq5ZBSX
         OcuSm07k5UI5s5Jh6bfwy7wvlF/SgG9SFnMZKtMkKeIvZUijMq6wkiASsSgWZC+tIYJl
         zNAw==
X-Forwarded-Encrypted: i=1; AKwUvBwsCqEp9E0yNFCkQ8skCnk6L4Y9GkQrjPJlEVM29fQszeYJu2zvq/RDCJp3HJ95xZ+TET1l5ScI4Jwptww=@vger.kernel.org
X-Gm-Message-State: AFq9FYIn5DhmyD/BajHnHwcfJhP+6et2RiF/UxXjJiw5Msg8GNwY0YYf
	6EPeIfJLDzrztUarshBAuyIcnb+bFa4454ZWfQepE7qL9IdeltOrjUnMlP2mzrpMqCr88aQKwMh
	c6ZmB//GiFs17FRtLABYRO7PmFgjhI2+Lwd+0ILlUIQJh8V2v8SRpwpVdUtRYVU57WEw=
X-Gm-Gg: AYBFou3nF21tnzoZ2oYuugo1ScLjexs7UL1NCjPvDrIYrnm2Lxzw06Gkb+bqggURwBm
	Ng5vLV6erxnkjfaiyabYRXDlVFYssBb1UKG3J3tBn6/n6Zi6QEv9ReqyT3GUktjTvpplABSvLyM
	qUdQCnlvbwbaYeG0IdetlQ1nEKO1lvXm0dOo57wjiNeHhd4BegxfAFeDYgaTx5/RMsMQHcTXgIG
	dN2uKpY1rd4bygH7lqFQUuqSzyLGrMlMAx4VJtXi81pMyYWyxO9N36lT3AUDAR4j9GWbNZmmLBB
	hupR7GfDvJwb0IevO8duOnNsIZa8MT0TrgEWqs9aFSlTkxbJwZSO5Bu+ejFdqd7/13f4czVDLXL
	Iq1lewwOs9YiJ
X-Received: by 2002:a05:7300:2406:b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-361a254da08mr4629959eec.32.1792255167313;
        Sat, 17 Oct 2026 09:39:27 -0700 (PDT)
X-Received: by 2002:a05:7300:2406:b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-361a254da08mr4629905eec.32.1792255166648;
        Sat, 17 Oct 2026 09:39:26 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6e33sm17691508eec.7.2026.10.17.09.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:39:26 -0700 (PDT)
Date: Sat, 17 Oct 2026 22:09:10 +0530
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
Subject: Re: [PATCH net-next v16 4/7] net: stmmac: qcom-ethqos: update
 phy_mode to the resolved interface in mac_finish()
Message-ID: <atOkrubiz/V7aFiu@oss.qualcomm.com>
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
 <20261014-qcom-sa8255p-emac-v16-4-0266c2ead980@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-4-0266c2ead980@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=BNUmP1QG c=1 sm=1 tr=0 ts=6ad3a4c0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=K33ZUWoUxhUzfzW7EYwA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: NPvvE-fTHJuLjoX-6mEtVj-tx-2DTKgO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfX5wn1GwSACuze
 nm5z2C46SsENY8ZqlCCKAdlpnkij3htQ8ycDSDYTDff+vlqyEMx+FqWUpK41Pql3546b2NWt1tG
 yf5coQId3Z9Di1Ycx86f1O598STAkyU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfXy0PCiAyUDLxn
 fARVQIdr5yzs3CQnqkPK6AUZUh/aylrsXwjXeY7KL/PCgrfYEn8KkcvN4FeKPBseb8dt566xzfH
 dany3fS9fSybeod+/dRV1pvSfrRPiwUvmOC0ZuyLpbV6XLVjHhxezDUVdS2b1+hxHt+3f2Ed3ss
 0kJgDN53WADe0AvwhSYCpjijGYsNN4ihUpS1OqgKlxgDlF5UJZSPw+5BfryoHogeZ+LHAXB02pR
 wz+mpwAd65F/R2X4uaacbpQjiSlWmteJp1KpC5aXJxdvfIs1vwotlkdm6Ley3qjJiqUJcHMMck5
 SF6cSe6gt5KIGxW0uFIoyJh1I/QEFf4UW3KoKZYA/ykyCcsU1qxtUHEQv/R2wbnlc9EhlLlGawi
 gJAJ54ndYlVsous/UaX43t7o1FMZXK97PqkJdH9GV/SojIQyHPntZN93U8MZI6L3H91PR4B0aed
 +WXco0yMUOzSawbbFKg==
X-Proofpoint-ORIG-GUID: NPvvE-fTHJuLjoX-6mEtVj-tx-2DTKgO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170066

On Wed, Oct 14, 2026 at 02:36:43PM +0200, Bartosz Golaszewski wrote:
> ethqos->phy_mode is read by serdes_powerup() and
> qcom_ethqos_set_sgmii_loopback() to configure the SerDes and its
> wrapper for the correct interface. It is set once at probe from the DT
> phy-mode property and never updated.
> 
> phylink resolves the actual runtime interface and passes it to the
> mac_finish() callback. On platforms that only ever operate at one speed
> these two values are always the same, but when the interface changes
> at runtime - for example switching between SGMII and 2500BASE-X - the
> stored value becomes stale. The next serdes_powerup() call, on
> a subsequent link cycle, then reinitializes the SerDes to the wrong mode.
> 
> Update ethqos->phy_mode from the interface argument in
> ethqos_mac_finish_serdes() so that it always reflects the last
> resolved interface.
> 
> With that, we now update the phy_mode to the runtime-resolved interface,
> so any subsequent resume with a 1G SGMII link skips the loopback setup
> and the DMA reset hangs. To remedy this, extend the guard to include
> PHY_INTERFACE_MODE_SGMII.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

I am not sure but should this have a Fixes: tag?

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

