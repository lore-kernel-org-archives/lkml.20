Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793207710;
	b=TgVIs0VpR+uIkPoNiKiVTIj/MDvrPHZMfhQGSdWiRpeYZwZNb7IUNDMr5GOIcShgv4Lq
	 ZrEetGIJDk7CW8HDwuPFAXU70//2nkdWJabcyzgGYti8LEm4ASUj1I0UwQKkAuvqhozOR
	 zM9hASV5ahsnzcQBpO2lPBoRWMmIsjSflHmz+dXJZfnffzpslFd2CdifzZ8OmOmDm0BDu
	 wIcNTEdG+EiJH1rE3D1DC5NQjh0SGcLTuc2NwjDcWscUteB/JG7vSMwwfZPofRmWTLh2F
	 8ex6LUQTLX73nfRsuEXV25yYYrG7h78tlLn94stvNgZ/WX67TQ/OnKNe6aBNp2aLMyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793207710;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LnugOozrP9VXqnObYje6VqLo7X1iy+GTdieQ0zj7BwY=;
	b=iU4tH2u/Ec9QD2LEPiZgqdYeNctNOlrUXXNPiCuB3Fq3SCQyGK7+7WgAph4L8eKSunL7
	 zDJcxS+P6omRtVWmObGSz2oulQCpuIJmp4FzicyYolgOmcGyaOyft2MYZquh03kT1MWN4
	 FK3HfhWMDAYivqtfbpRZqwsCebpiBKcibuVAf5t4xpN31zTY+BEWj7I7ToggOQv9MFNT9
	 7hh9t5swwpk3qJoPBZ2FaAfgQ+/onTmmFj1agosc+N95Rzz16LeTuvtdoaTyBWD2ryR2B
	 p1WDu9sW8Gcn4DTUkENVD4ytadibbH1EW7Q1N9IN+px/7X5UBVV2tPJoUlkn1p6cefg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FX7BORYH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GNWToNHe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34274606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34274606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FX7BORYH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GNWToNHe
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAjN41517022
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:15:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LnugOozrP9VXqnObYje6VqLo7X1iy+GTdieQ0zj7BwY=; b=FX7BORYHJdGVYKvP
	zR05piPoIjX63d2tWSfCH0J6bCKixFpnUmf1n0mhrH3EC29X58LJUIr0LMWnDcrt
	bhBIetCLQUndTqTHCfCeDfME5hyzY1n3eqewj40uPzif/a0i3be5ZtooHM/QHDq5
	VDW90hWYqF0meKrmTr6FHQWoz1ztHZvQk/2ymvsLUXEW60148Tto7S/iOHhqVac2
	0VL2hz16Pjb0nLEdQZAoea1bXtJaWNLpNaDT840VxNPKzHnIWXv8/dM7Z28XoDAA
	4oMdN4NRefuwGCVQ5hCYsMIP9DFz0ZoQZGDorG5vt14rJWtpcHyc2cAf38G3DxQK
	mJtQfw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhwam6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:15:09 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd634ac49baso1088529a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:15:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793207709; cv=none;
        d=google.com; s=arc-20260327;
        b=IPytbqA6DKS0A+PazUwzJJmT3rVbodaQN9gsNcvm9/gDmrFE+X//fSm7NBiNuBV6M0
         GFwufXKcAstn90bRjwUWN7k1nc0l3bwkKvfsTdneKQe3ojjP/OBxeDb8KPl3o0E/+eZK
         JLSVu7Xocr6PuS+QPgz00nHAd+UMRH8pdQnvZKr3ghd/H3WfiRIDSWsxpH6ORGMZRriB
         1HMMq0uhKhGAnd7JclsdBhGuy6wwEltdCvIgfgjsghhJmQWEhrNElEV3wrngkve/ZEGU
         Mypv/6pUtCnC7ro+n93Mx76hBefTCqSNpqqUCah5xHWcOY592bIKbw0jU1//0WqrY0Kx
         IbEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LnugOozrP9VXqnObYje6VqLo7X1iy+GTdieQ0zj7BwY=;
        fh=LId6s/VNEJvQcEtNPBVCiB842jmhSZZiNKIdmUOcm9g=;
        b=Tb1NdHYq5QsqjedLNJBF5a/hCwLWLOVgYnEWM4+ztzcwcVuz3s/9hMKGptp225zqiD
         oyX+W9zWnhJBf/0TzXJDZrx8cLFPO0PCXPbxwO+RrK/ylj9umGjInpFBREzvusxu0LxU
         JxYpKExkBpr7pFCYvFOsUkWbbSBObfKANr2SduyOXtLIst40+hlViBZcEyo/O0spb/hu
         W29AMbdAgTnMu+HAM4rIQS04mUVlxGcyisqxijkKjelgByKSuXctICLL03wM2IpqDzFA
         +mfkvEAqWJBCQ30+seipDILai4upyk717I/E1cqrUyAmwYcKrZtmXzOrIwyGvl5kSYxs
         h8DA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793207709; x=1793812509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LnugOozrP9VXqnObYje6VqLo7X1iy+GTdieQ0zj7BwY=;
        b=GNWToNHed3bYT4+kWleZscnKYhPlHPwActwHmXX/XBwgnIMIsdJaIIBlCZ1XTTCyvr
         eoZ4uK22Q82Pmt99l9+BWT4Q7TXjJeIHpjDeVIqEVnQu5zVh3WplA+6NFM0mBOK85zPt
         GixX/jHVxbjoPaiiCU0TnZ3Armxy9VAnR/NbON/WQVjbpvep6e/grtVSpPPXNdWWgyhU
         Yfe21AP+BhsMhx6WL6fskkpKyZjt/lQUX2lNu34WoHnl5ORBKjtcMZ6ikZB2IZkK9JBT
         SlAwvsWUJpoQz7Y6wMoFMANclJZYvjqnvV+SxJDvkcOfz1QTM+77PvDUkXrVArXmdqZB
         EP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793207709; x=1793812509;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LnugOozrP9VXqnObYje6VqLo7X1iy+GTdieQ0zj7BwY=;
        b=XTppNBZPIzphGRJBpGkV6UX5YtIHxOzxRyXtXjaMtzNqgye6jCpjxP1S4rtyE4EpUT
         gJMQeblljaUuiPXV2zAXavpr3dQ2VSXl1tWimJuqizO/pfq7yKqIldioewM6PZjsp6af
         nBMxS0IwzspcY+B0B/CAzaEmqNcJvT3scb1T2bQ6xYWZklmNdJNTHjAgXcjko65M0HKM
         qrYZUjdDdiHHq3b45ETCL06v8qQ1oRA+psb3bezHvxQ3EmfDiQISiACqXxcL4Sk6eyVU
         qOvsHFAC+0486LdAbipSzpZsoFWGOWtXJ5pSIchBZfNPgpyyqijBtQtzCfhuqUff3mWv
         2ZXw==
X-Forwarded-Encrypted: i=1; AKwUvBx85FpsokR51tx5vD9va2Sp/OGMej4VTFlPB+sA2Q+ZsFRGOgxhgXLbhjOWpzfwgDHV7gQm0k1PoK0rx+k=@vger.kernel.org
X-Gm-Message-State: AFq9FYILyT78gdzrYSWesusFCEI09v4P/seaXIP5nZhmF/G7el3QHIl8
	jTb3J5EAIJO41hSbEyzGt9b61hd4OGQnw2AO/zR8VdOYq5EEekCX40WAL/k7KwzKaoevPsC9Zh4
	rt//KdvQwQ827I0EC0kX8hu8FLtar5zfOwc7I6a3vc/wBRCMD3fPNiFhilNvrBnWCcDUt436BQU
	ej7i1GRcOg78g/ezJwlIaDUp6CJU0X0/rd++NwaZlYDQ==
X-Gm-Gg: AYBFou1l2+J6cxQ87S5CLkZUJ2455Vnxmxp95eKbgR9QQalaZCKgzr9an1Ms5b/BPnV
	S/dHkNKAU34WWIW2CFB+hEKo98Ah2uVB9Y9+ZAezvbnqspyN8vZADqjTNQ4Rg8kZ7MAkyS50nri
	p412HqgQ+F0yL7RXd2uuTE5nUhIEYQf6i8PmUyMCTgn8VNbt3LTFPDA6qoqQ==
X-Received: by 2002:a17:90b:4cd0:b0:3a9:79b4:d85 with SMTP id 98e67ed59e1d1-3ae6eff7393mr71041a91.32.1793207708740;
        Wed, 28 Oct 2026 10:15:08 -0700 (PDT)
X-Received: by 2002:a17:90b:4cd0:b0:3a9:79b4:d85 with SMTP id
 98e67ed59e1d1-3ae6eff7393mr71013a91.32.1793207708003; Wed, 28 Oct 2026
 10:15:08 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930103258.13375-1-changhuang.liang@starfivetech.com>
In-Reply-To: <20260930103258.13375-1-changhuang.liang@starfivetech.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 18:14:53 +0100
X-Gm-Features: AclHuK8CaXJNTmA5tKbBoAyE77_drdIKa6H1QBEjzQPCv7RqE6LaFLcpv1yZaLg
Message-ID: <CAPx+jO9dthZCQ4V-25PKGgEJ2qF9Znu6VVFECYhjB-JabyV=6w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add StarFive JHB100 DWCMSHC controller support
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Inochi Amaoto <inochiama@gmail.com>, Chen Wang <chen.wang@linux.dev>,
        Jisheng Zhang <jszhang@kernel.org>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        sophgo@lists.linux.dev, Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 4gcVoM0VHSo9Dnc-Jx0GkES46AxvhzCv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2OCBTYWx0ZWRfX31Xzqg/h4RGV
 plqRfmrngPoz9NeTftIeyHgmS9xriJxLr5Jssn577MRRTBppVnzqh6TRk2UgAgh+qzA+Cx1NQVc
 JsmJdM3XhVeJbQDNqU4fQD8wRjqAPpk=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae22d9d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=Bq6zwJu1AAAA:8
 a=N58GgX4bPs6XW67x5a0A:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=KQ6X2bKhxX7Fj2iT9C4S:22
X-Proofpoint-ORIG-GUID: 4gcVoM0VHSo9Dnc-Jx0GkES46AxvhzCv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2OCBTYWx0ZWRfXwZqKTcKymoU5
 ivktqHGJK1pMFQryo7TAvK4pQoszVgj7dRyLdh/ylV90thkCPyYSJ/IRH8vr+JXSf2BFkydEZCH
 6XGlgJco7k920g/v3+wGIFjuwgOh/FikSvASLsscWnMjppsnr2VHs1loAOJjjqjxH8nfrKVmcOo
 D0FUp5csXxeHJskWySDuVzEbAW6PuAPwHxI2KpbHySZtTzZnGhSEbhm73D7fuAdkTEAV+ZP6r5H
 4hx8Z82T7RXMIMY+eWOzoEIY9XgJgy1Z8yzfgx8l67zFrEu8eD8c53PZcyQR2WDwm3UPIp3ZnrX
 Zru8dyTGYy8gNPSB9FF1hc76kQ7ZgPq1kM5LUeuIwBtUvPhfSCqOBcy8fPx4M170rE6obZrvkA7
 ISkCuJtzzQAKLms+kEuoVOu6dKo19zAxLUnAGQJ4mSwXPUS55+Y2pPDmVDeuhgjhmNwPgK9Lz38
 s0bF/VvmwpHahFz9aLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280068

On Wed, Sep 30, 2026 at 12:33=E2=80=AFPM Changhuang Liang
<changhuang.liang@starfivetech.com> wrote:
>
> Add DWCMSHC controller driver for StarFive JHB100 SoC.
> This series has been tested on the JHB100 EVB1 board.
>
> Due to syscon limitations, it is necessary to use dma-ranges
> to restrict the DMA address space of the eMMC controller to:
> [0x400000000 - 0x4ffffffff]
>
> bus_nioc_4g: bus_nioc_4g {
>         compatible =3D "simple-bus";
>         #address-cells =3D <2>;
>         #size-cells =3D <2>;
>         dma-noncoherent;
>         ranges;
>         dma-ranges =3D <0x4 0x00000000 0x0 0x40000000 0x1 0x0>,
>                      <0x4 0x00000000 0x4 0x00000000 0x1 0x0>;
>
>         emmc0: mmc@11b00000 {
>                 compatible =3D "starfive,jhb100-dwcmshc";
>                 reg =3D <0x0 0x11b00000 0x0 0x10000>;
>         };
> };
>
> Changes since v1:
>
> patch 1:
> - Add Krzysztof's Reviewed-by tag
>
> patch 2:
> - Fix the DMA address range error in the commit message
> - Clarify the 36-bit DMA capability and its constraints
> - Add a named macro for the JHB100 delay line value
> - Use dwcmshc_reset instead of sdhci_reset
> - Detect 1.8V capability from mmc->caps/caps2 instead of DT properties
> - In sdhci_jhb100_set_clock(), keep cclk_tx gated when clock is 0.
>
> v1: https://lore.kernel.org/all/20260919092950.178617-1-changhuang.liang@=
starfivetech.com/
>
> Changhuang Liang (2):
>   dt-bindings: mmc: snps,dwcmshc-sdhci: Add starfive,jhb100-dwcmshc
>   mmc: sdhci-of-dwcmshc: Add support for StarFive JHB100
>
>  .../bindings/mmc/snps,dwcmshc-sdhci.yaml      |  74 +++++++-
>  drivers/mmc/host/sdhci-of-dwcmshc.c           | 169 ++++++++++++++++++
>  2 files changed, 239 insertions(+), 4 deletions(-)
>

Applied for next, thanks!

Kind regards
Uffe
