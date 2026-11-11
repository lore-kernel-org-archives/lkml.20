Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794400676;
	b=Ih3B6ZSikWD4vPRl2ZSC1RG8b6jGK+Vnp+Ry52xGkXivPNpEd7c+SYvA+9uF0PHBX7Oc
	 JxLDuYmAI/hzDziIOpWnSKvdJeLt5OS6mcURE4JWOSypNqxPxmXyDvvqHvn2eanHuFwT/
	 h3ILlcgB6wrn8q3S9DQSkive8Wk+I42paIxCyXH+vIlPi/IBL0AL+EGqVZIiqwycLrItb
	 ym25ri//E3A3x/caPpOtUYxPOWvzxPNqHjU53EYXG9LS4590TSv8otLmL06d/ZM099BLV
	 6NLp8vTCKQUxaLpupZx4+HIeW5dVgpkCTRhyaEOmF7TjKhjyHlbKKKQysfj/NStjaww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794400676;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Gul0DZZy2os3Oi+7MpRNBs1ymdpKQ0Ark8+uU45of0k=;
	b=k/GvbtQxMNotHxKWGW6XQ9EwF2BSgQTghNH28+x5SVt9CP/775O0KbTHjeL7bkNnfgQ5
	 a9iWDKDXwcEMLuWrbw7CEIUGZmgf5XOkWq/f9q/hL7g/PlTt8m/v8Hk9qTBXIWp4moLpr
	 1SLPKuO1wzoISyGrZ9vvRuM7sbOBmJcF9xabORZS9JpIo1YBeAnIiORXCT+PAuDmDwdSO
	 rWQi4WcFLxQWmYzegANw/2pgRtoTg7fi+5aVccvWwg/gf/TVPz6tES5RUMVO6XODEtkLC
	 KasSR2BgdxLsWqIqDKmFs/QigfiDct92PQ8f9qvHZXdKB/CJ52K43u+O7uOwOFTgDGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ObCDNI7m;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d8SCx8aw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84141606A338
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84141606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ObCDNI7m;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d8SCx8aw
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZ2hc2356773
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gul0DZZy2os3Oi+7MpRNBs1ymdpKQ0Ark8+uU45of0k=; b=ObCDNI7mu00vdBlM
	BdBftEbOXb0MFSAzbf38IabYbXVhCYnZv+YNaCYl7C4Q7AS/dDd5M3CswUF/aHGz
	OAIQ1Nh/zwCm4VIaM1tK9AidZpylVdpLwsvEkGHcUB6ceKGi/JvBnZ4fqZyQ+Mar
	iuCNDgxdNDWqL3Fmm3k+67gBLEvrriB5uKBnhPxJ+6rLV1b3mIJxe1Mbf6F5cS0j
	M424PRdc8UuxPAcrq/2q35bmVPUVqcYr6AlcR7A9kOlxmK+Ip9zCPrJ93BSkSEBp
	48JKJbHtDL0vSEiX4oRyWJxON+Vu/kFzSqLBAj/dzc5PQhQ5IGHpj7nuEv32lYYH
	BmRZ0Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdhu4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:37:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b10afdf947so2883794a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:37:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794400675; cv=none;
        d=google.com; s=arc-20260327;
        b=LEYZw7IadZgnRC9xMd2D6YlLT0EfDsFI1qNL8cSkUEbdipeJgqOAn6dQci0jWfSaJh
         EkHUxFpc9seoThpBzqtv33aUF+WqQUnd9S6wNAY5AIQpW/O5ILfkmUe9rddOdLDBmysv
         NGX8OAoioawXKoxSMEmNl7n3xdwoGI1Ozu4rNrKpWZI1gOj1n4SPK8JaJf2P7pNDoHiw
         5L44IfODA1YEV/jpz0bqPz9Ca5rTIvYnvlsaJu16Toz60gE9cu74tu/tv0ZbHKZDenoh
         nB8tiI4vxDBBng7k9mOVoOdv8LU7CcTcX6A+sP/Jm1MgGc55qD13AaQuY4TMHnP9Aa5e
         jMmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gul0DZZy2os3Oi+7MpRNBs1ymdpKQ0Ark8+uU45of0k=;
        fh=t2LORNkX0GnlfoCRFwk3Ox9r2W0nf6Eoign56j7QReE=;
        b=Z1ISNQVHO9DzH1wPsfx5e5pY+VMcr+zCLvV+xND6uBjEaXqy+OH44hP2OJDWbvPsLY
         UqPPkrNpe4BblIS6bf9DGOnvZ2DlPiyFO4J/g6ct+IK3bnaL371cIUFnVx1/klhJoiQ6
         i7CravlQwj1lR8/QHBk/Y3U3rpTG90QkYF+WIQ3MGYlVk2zvhgP3YSfaS2B+Ec/YWyEf
         mMsMIzCmyGh4kiOnVmEvPSo8IlbW1/ijIr4u2lb+WlvGBiK3kaqzs2zyP5XTOO/rQixu
         1LOsO5o+ee5+1anNr3vrowRLMdjNo1D5HN/bhAyWgQp07ZRCmFr4gIjJzV70/H+LqmPS
         YV+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794400675; x=1795005475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gul0DZZy2os3Oi+7MpRNBs1ymdpKQ0Ark8+uU45of0k=;
        b=d8SCx8aweQlwQ2YxeaMGmjD5J7/IfmK8T+IN5kjZRKgZPojzsT6xY1gEDFdpg6m2/K
         fLAtMG9oG0JnGrsALGFmjRjj2pBCG+CAKTfzb5eT9i4bS8fNo+EnQEo/gpgF8Tte3CAG
         hPQ9BSWfMu37R+o854ad0wJSj+2os9GQ2OWKL1JpTBHdJUlw6OYyvX/PJZSi5vwsuTd3
         yxFQ/kx8iHWfeKbqvUK+Pg0eEVRrpGhTXkrUS07U1q9bYfy0BKtdLrthVEr1CUlue8sz
         l8IHGRQCU+TxAcXGFd7/1GkSH/TFjVciVgmMd5Y1yCy68aHe8BaOlJTigZ+kCmOgORLR
         d+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794400675; x=1795005475;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gul0DZZy2os3Oi+7MpRNBs1ymdpKQ0Ark8+uU45of0k=;
        b=qREtphnLYa+o1v++dNC0mJHTkrlJrOF3hVa4A3kd0b6naQbsYvAsHdRYycwjNNG/TQ
         2IM3tF6iKUGMpcjbPBcgX0QuoRxxRmrnkA+oNimEAQM77RZDVicT+JFS9kSXZJCTWHWy
         mPl8EQkId0j9gYVisaS2ojJVC1SRSATIgp+BL2cd8kqas8m3wREqxsJUopTM9IjCfREX
         U7BYbJI0a7UYa1/QYJJhy/AbctFCrHxSPijPtySB5mntuzgjmlhlKSbU4cmrn7XwvzHp
         d9uWsgBTeWx3m+YhljwoFv1bUVdAMmAt88jj/6O4tYUcvTD1Bph4vYbS/QG++XeJy2Qg
         mgbQ==
X-Forwarded-Encrypted: i=1; AL+hErFDtfMeR4PNRsvVGZcDV/Q5XlXbeiLGwaCZpos1DQzoXSi79vM+eJTKfuROBk5trcVRRRhJVEjCYX3v1DQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tMCAUOrj/A3JAHV5WHHXEwtjAXEnesQVe3p0Y5lKAhd68OYe8
	DAicgXkeWnp9g8mjTmtbpAqxzWaetQl/0toYcyhXcQkQKcIljtU0MqI3h0Y97IsbUmZ88f5pgr7
	JridNIZRDYrNLwEWdLmMlFMd2u6h6SUldAqvAzIvtn1Hw3tUJI88AxzSMKC05Nl/9WG7h1J9QcZ
	9iECp5BlmbCEQUukYJXqLORbLYdhFHS+oqqTObQt9S+A==
X-Gm-Gg: AYBFou2q9oVDtImdPQsOqMXuzh/5Nb/jVPGtGxk8EH8uuNXXZKqQuNJsVriP80dwUlM
	XzQtkFfXxxKu6V+JD3seqBLQoIPZdX5aQKrZ82qf2idXFSc66fw066yYSMTf+Ge5elidHmDNZ0s
	J1T+xPD4g810cr9sW9bI5Uin+oHaIq+Pg+ZoMPnc8U8Mwp9rKoQlfeI+RkYQ==
X-Received: by 2002:a17:90b:51c3:b0:3ac:9ad9:6afe with SMTP id 98e67ed59e1d1-3b182f9d62dmr1558999a91.39.1794400675197;
        Wed, 11 Nov 2026 04:37:55 -0800 (PST)
X-Received: by 2002:a17:90b:51c3:b0:3ac:9ad9:6afe with SMTP id
 98e67ed59e1d1-3b182f9d62dmr1558976a91.39.1794400674641; Wed, 11 Nov 2026
 04:37:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028-rzg3l_sdhi-v25-0-57f16691c2ed@bp.renesas.com>
In-Reply-To: <20261028-rzg3l_sdhi-v25-0-57f16691c2ed@bp.renesas.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 13:37:43 +0100
X-Gm-Features: AclHuK8o0uVdfxHZAmhvgIoBqg4smXNKTRXKoYRu3--Rc_VHFBtg03dl4JTb9lM
Message-ID: <CAPx+jO-Fv_qnq_ibUP9A4iY7k8d9u4W5D=2PzF+w9oF0NXDDXA@mail.gmail.com>
Subject: Re: [PATCH v25 00/11] Add Renesas RZ/G3L SD/eMMC support
To: Biju Das <biju.das.au@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af461a3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8 a=F2NunwkvNQPXbRNSDdIA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: TDsSFusI0ypGBkJL8XLf3SpmeeqQrfBz
X-Proofpoint-GUID: TDsSFusI0ypGBkJL8XLf3SpmeeqQrfBz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MCBTYWx0ZWRfX00OxLXteZtpe
 kRppHzxtBsrrRn/DbQgJj6caNYHNOBwlT7g0+ztiM3uVudFPKNaUMDsBVQQ0z8Bz6bQKAEaH3IU
 Wb1ibQK7THjA90/tAPFKurpeIFum4ei5xOMlA/mtnPrh7MQEB+NEeaJ/nECxs9V6spOoF8n8vyy
 IKTnuEWvFYlJXtf+C/MHkjIOoaxpRotwOv1Eg9TaW+7z80jA+42e5xmzyzVty6x3tQV52NmeTt7
 Tb+PK9jTVPlvOHVj37q1ksS8HLjZKOyWRU6aHjSlNjXNhegcB1ChC5PoaVWWEKTbJnBvMkKdfPd
 qbAeCd8Jv67eUdfQlOT7oncrJ39yNMAwZvfSfr5k7Ya8xBTpvvOWHDWSrBFuHAmelRLcIW/uWeI
 7eXX/OxVDbsRCmsU5gYxdeOeGHD4oM+vUuuk7Jx/lK0PT3xsRwSSZZ5xKbKCgFANe2kRRhrcIuU
 YhkABIOSHjGtSv8Q1Sg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MCBTYWx0ZWRfX9PFZPUR3eOSq
 WneO65PWX+HN6Ufqnc+mffBMIrn13w+pH+5IomgVrMAv5yeU8voXmozWlhqsnDUk6TLZvOyaXM0
 Euep5htbqWOXag65Co/lY0ypdkWCBP0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110050

On Wed, Oct 28, 2026 at 1:51=E2=80=AFPM Biju Das <biju.das.au@gmail.com> wr=
ote:
>
> Hi All,
>
> The Renesas RZ/G3L SoC has:
>
> Channel 0 supports SD and eMMC (including HS400/HS400ES).
> Channel 1 supports SD and eMMC (except for HS400).
> Channel 2 supports SD.
>
> The SoC supports a maximum frequency of 150 MHz. The SD0 interface does
> not support IOVS and PWEN in the SDHI register (no internal regulator),
> unlike SD1 and SD2. It has an internal divider for all modes except HS400=
.
> It also has a 2048-bit divider compared to 512 on others. Moreover
> RZ/G3L supports HS400 enhanced strobe mode.
>
> This patch series support all modes except HS400. HS400 support will be
> added later.
>
> This patch series tested on smarc-rz{v2l,g2l,g2lc,g2ul,g3s,g3l,g3e},
> rz{v2h,t2h}-evk and hihope-rz{g2h,g2m,g2n} boards
>
> v24->v25:
>  * Added max-frequency is a required property for SoCs with internal
>    divider.
>  * Retained the tags as the change is trivial.
>  * Restored struct of_default_cfg.
>  * Updated commit description for patch#3,#4,#6,#10 and #11
>  * Dropped initializing clk_mask as it uses the default value.
>  * Added suffix ULL to macro SDHI_CLK_MASK_DEFAULT.
>  * Fixed a very low or zero clock rate from the clock provider that cause=
s
>    an infinite loop in `renesas_sdhi_set_clock` by max operator.
>  * Restored the data type of max_divider from signed int to unsigned int.
>  * Dropped initializing max_divider as it use default value.
>  * Updated mmc->f_min calculation with clk_round_rate().
>  * Updated the comment using "ilog2(max_divider)" instead of "{9,11}".
>  * Dropped initializing clk_div_mask as it use default value.
>  * Updated renesas_sdhi_set_hw_adjustment_delay() with force_clear
>    parameter
>  * Added a comment in renesas_sdhi_execute_tuning() for tuning delay.
>  * In probe, if the SCC registers are not available, it clear the tuning
>    delay flag.
>  * Dropped default masks from struct of_data_rz_g2l.
>  * Dropped renesas_sdhi_is_internal_divider_enabled().
>  * Added a comment about the internal divider in
>    renesas_sdhi_clk_update() and replaced 'clkh_shift =3D 1' with
>    'clkh_shift--'
>  * Moved mmc->f_max to probe() and made it fail if max-frequency is
>    not defined in DT for SoCs with an internal divider.
>  * Updated tmio_mmc_host_probe() to set write32_hook() to NULL if
>    TMIO_MMC_HAS_IDLE_WAIT is not defined.
>  * Added macros RZG3L_SDHI_SCC_HWADJ2_{1_8V,3_3V}
>  * Replaced the quirks sdhi_quirks_rzg3l with sdhi_quirks_fixed_addr.
>  * Added helper renesas_sdhi_sclken() to handle 16-bit and 32-bit access.
>  * Updated renesas_sdhi_set_clock() with max_divider check for
>    TMIO_MMC_INTERNAL_DIVIDER instead of SDHI_MAX_DIVIDER_DEFAULT for
>    consistency with tmio_mmc_reset().

The v25 series applied for next, thanks!

[...]

Kind regards
Uffe
