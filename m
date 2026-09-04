Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D22E3E92BB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 21:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788555975; cv=none; b=LXtGwo7DmB6ZTAIhEp7cginS87JZtv1/6LxiM/aJ1hcJmekTUo4xcmTpfT0jF98t3AL4CXY6tO6f8AuWE0xGxdo3Rueo4usaKI/tOjUgjKeTHAJI3sIMq8gmDfHfvUaHD030Edl1ilPKUTjK98Iz21h+OA7ZO2xX70K/wN9vY54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788555975; c=relaxed/simple;
	bh=FAC+Zj7qwKqYw7fFM0u215FoV5ND4YX8fjub2SpnxsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y748cpkS96Xb1ycOIM7xirNr7UAVkc9C5CdVwjv/JrQxKOmelKDEO7aP8RvbdsU3fJl94YkpboicNOgJ5Hl1o6x46wO+Ng2sTdwNX28sLF4WVGAQYEWe1oZJogH8KT6Dq4/McCWyJIp6yiYTQZkceJbwlHicwh3lj+ulwO24vUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f6tqP/YF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fHUmBs/C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f6tqP/YF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fHUmBs/C"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684KboLE731838
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 21:06:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pmKN2/HQZks0tpmHaapx54nu
	pIE8cyQNKHSbzgNzJiQ=; b=f6tqP/YFyo1lXLN2qbefS6WAXA3eHAq623fvow1m
	GSNGrPJZg5nEgTLReHGhb2yx4uLZTnrbVXNl0kXlLZMhTuhA5yJ9hvnDZplw7nXj
	Kz4i8xIo3AGWJhWSEFIoDJNio5RbhzAFoBCnAXJQep6LcAClfkDmd3i3ZSAmXg1F
	qSpPZv42f5QJ2mLUzoa3mQyMvAy2c35UCAG12UgfnfGGFuQ0s34wvxW4rUCGiKfr
	ajgOY+nOGJvkz44ft2VqlxQtvdPf6QkZvjuuMybFBebozZfh37kVd4XrNPDe4L4g
	4p+ZPYHvsfN9QKUhKNqkGWuPklMZI+r7Y5pkwjoAL8EzVQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg011j02w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 21:06:08 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7f8931a803cso1460543a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 14:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788555968; x=1789160768; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pmKN2/HQZks0tpmHaapx54nupIE8cyQNKHSbzgNzJiQ=;
        b=fHUmBs/CBzuMaGUcle4JOw30ssrwK3aGDI4wL7GRAb3sCxXEQgIEByCv89593gUVcA
         5jCy7bqEzCHs14UFjTwgyyBuaAGDGM31P08VD+LmreEoJIjMo9unaKHKqty1X4TpyI2Y
         aIyl4wCoRuvyH0QRuNS4NGiDZCTdbnQrUc5baOnNn4gHABmZWZu0g3P99/aFGZGPS5ht
         Yftmq5X+LJerE8afhM3N+wbqckHLyaHJqy6iuT+4hIBNk5BjFULWlghXC7cDUe4oXe54
         4IB3Jdc0VYg9tO4xRs3fQ/3r2weq3e9irD9Z0iXxr9bOHkczFSmRdwkeNjj3RrqUQ2W+
         8urA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788555968; x=1789160768;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pmKN2/HQZks0tpmHaapx54nupIE8cyQNKHSbzgNzJiQ=;
        b=POdra3053kEjiczXg2F0m9LkwnYVzseWW6Z874u12JDuYq53o3Mfcy7vMh6nqhdm1c
         erCsk6pkQS5EFh3ZzZvbDLL5SC4w/ILFbKbjkN2sVyjHNvFBoNOBLqHaQLtX4CKiIbBu
         X24yXLjA13/VX1HioxuRTrYx5Qc19OSZSxnSY/WyEsBLVEgl1SwX18uT795n5PWz1neP
         Wx0rV0i8gPelbOd0HgyvMRgrxEVqaf4wFMKcHslVWZrRL2pw8PfKDC3eDDAWq6Nl4ZWA
         /meRkrpq/k99p50FKxhQWL9qQshvhb8ZDqDUAp0w+dd6vKVn7hsjUxcRuV9R9OBObAJH
         xysQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtVMCPuIeqjUBp8Z1VFz03Vhwb4tRXTt/EQkRNQIeSwFAYLgoMZsWUSQ+DK6i8NkJdwDZHrpixNV9W/cM=@vger.kernel.org
X-Gm-Message-State: AFuF++nJvB8DL/AQRL7E+liovFrmzseP5yBjNpx4WtjOd1zQNS9LnEcC
	arb2rhCa9cgQxRbIsk+AKpOR9l3Vhe3TRpp0HJknUFwh6Ryy06SuCU2hTPHNsGzRa+YJSbmyAxw
	/Ofmo5zaAFukLqksOpFEbv1jP8Ttv9eTzbPWqPhGX2UCzfD7oHXANGPjDHDFUtljgcV0=
X-Gm-Gg: AYBFou2rrN47PJi/WHtGcVcq0K0Hvxh1Gi7hLyOKm2QojizE0Ln9GblZdv43JfF08p1
	tuIx03JHEb/Lcp8TXGwVNqg2volV6FpzokK9wgqf+0wr48wTQ+1oZ+QAmYttIf89LT6UpWxL7aX
	jHuuvaFPA/lszwhZ7cnkDw/qujwf4dAg9oxdoS9OEVc/3czJfYjagXNXCbSYszsm1HqLbrvL3jx
	vVbX4xvJHmy4gK14GVAfsQwObLTKwDE5SxINcnNTTM1LXAoVFp6mf2m+CkgaLA6ugWGbdv8BNub
	GDlI8VtubzHpg244sOsWrOuWcFGVanSq0guHModHl3Cz6I0TKSTcX794bWpIRbQXrqPl9tm/kjJ
	Dl4KOXYzLs8UqTw==
X-Received: by 2002:a05:6820:4b88:b0:6b1:bf3a:ed8a with SMTP id 006d021491bc7-6b6fb4d7bffmr5403414eaf.14.1788555962987;
        Fri, 04 Sep 2026 14:06:02 -0700 (PDT)
X-Received: by 2002:a05:6820:4b88:b0:6b1:bf3a:ed8a with SMTP id 006d021491bc7-6b6fb4d7bffmr5403371eaf.14.1788555962494;
        Fri, 04 Sep 2026 14:06:02 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243f780csm8692399c88.13.2026.09.04.14.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 14:06:01 -0700 (PDT)
Date: Sat, 5 Sep 2026 02:35:52 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next 0/9] net: stmmac: qcom-ethqos: add Shikra EMAC
 support
Message-ID: <apsysH9ia4x96a2g@oss.qualcomm.com>
References: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE5NSBTYWx0ZWRfX8ADPmDzLaT19
 TzoWsALcYVCyRIlP+lXR8x9TEwLUfajRJg3me29dUk6fGxdcb15/9DBP6iv0y6W2S/o0LM6h+Lo
 7KmobtXGTgPksAzbOy0K6kwG5bH8qi8x98O7a3DteatZg5dUS/Xg4mduF4Ped1KX+lKMFqu2zJe
 Zwh14Jh3B1OqenE8ICGoqgginytL264vr/svBwtYO58x82PiBXYNNRs6jQb7Xs30ZFf9xR22lPm
 tCqnt/1yaNM2NBApupGX05Ibi13xGRiCinYDSwnruyT+NoJRN9/aaVQ8qGzdAuw0KZD0rlOQWCp
 XYVjUSz7slw3QufXTFXiJpMGYnILYKYxv0XR731Z1X/yGuhxp5ojmIN4atlQo1oNBM/sx/iAsRz
 eCOm2UpeM2779WsqwO0na1c2yvUQTWKtx3ksB9PSKgqHJwsN8aOMXobp5tEqNCR6WYuiQDE3II7
 yewOQD6JIjXDR6TnQ5g==
X-Proofpoint-GUID: bXxS4u8QZTrt_Cc8FLJt3bIUp-xOxyWT
X-Proofpoint-ORIG-GUID: bXxS4u8QZTrt_Cc8FLJt3bIUp-xOxyWT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE5NSBTYWx0ZWRfXwO9Qz0PvQ4Vu
 NrwtcasTuRy0PS0lI08QDuouOE8KT/av09vtgIFFgLK2I9xrJa1gWo/LXddkhSPHlFQkH82Ivo2
 S4ctcbLuoUcXOuCzQqiHAnsYznSR7ok=
X-Authority-Analysis: v=2.4 cv=Ibi3n2qa c=1 sm=1 tr=0 ts=6a9b32c0 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=ee_2aqc6AAAA:8 a=EUspDBNiAAAA:8 a=T3LL355Ksxp6dEOEn3QA:9
 a=CjuIK1q_8ugA:10 a=EXS-LbY8YePsIyqnH6vw:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_06,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040195

On Fri, Sep 04, 2026 at 12:13:42AM +0530, Mohd Ayaan Anwar wrote:
> This series incorporates feedback from the RFC and adds the dt-bindings
> and driver changes required to enable Gigabit Ethernet support on the
> Qualcomm Shikra SoC. DTS changes will be sent out separately.
> 
> The series has grown from the RFC and can be broadly divided into three
> areas: PHY power supply management, proper support for RGMII ID mode in
> the Qualcomm ETHQOS driver, and Shikra specific clock dependencies
> required for NOC access.
> 
> 1. Shikra EVK boards use a GPIO-gated regulator for the DP83867 PHY
> power supply. Patches 1 and 2 add supply management to the DP83867
> driver so the PHY driver holds the regulator vote at probe. These
> changes are largely inspired by similar work done for the QCA8081 PHY:
> https://lore.kernel.org/netdev/20260605010022.968612-3-elder@riscstar.com/
> 
> 2. The generic RGMII fixes from the RFC remain. As suggested, an
> additional patch now emits a warning (patch 6) when the legacy "rgmii"
> or "rgmii-txid" modes are detected. A new change (patch 7) now
> initialises the RGMII link clock at SPEED_10 on probe instead of
> SPEED_1000, dropping the unnecessary 250 MHz source before link up.
> 
> 3. NOC clock voting (patch 8) now uses dev_pm_opp_set_rate() so the
> required VDD_CX performance state can be propagated through the clock
> controller. The Shikra binding (patch 3) is updated accordingly: an
> if/else block constrains Shikra to exactly six clocks and requires
> operating-points-v2.
> 
> Testing:
> The following boards have been tested with this new (proper) handling
> for RGMII ID:
>   - Shikra CQ/IQ variants (with the TI DP83867 PHY)
>   - QCS615 Ride (with the Micrel KSZ9031 PHY)
>   - Talos EVK (again with the Micrel KSZ9031 PHY)
>   - Talos Lyra EVK (TI DP83867 PHY, this board also has a GPIO-gated
>     regulator for the PHY power supply)
> 
> Changes since RFC:
>   - Two new patches add supply management for the DP83867, replacing
>     the gpio-hog approach for PHY power -- Konrad, Andrew.
>   - Use dev_pm_opp_set_rate() for the NOC AXI clock and require
>     operating-points-v2 for Shikra -- Konrad.
>   - Warn on legacy "rgmii"/"rgmii-txid" to encourage DTB migration --
>     Andrew, Maxime.
>   - Updated binding document for qcom,ethqos and snps,dwmac.
>   - Drop the duplicate "axi" clock from Shikra's DT; use "axi-noc" and
>     "pcie-tile-axi-noc" as the only additional clock-names.
>   - Initialise RGMII link clock at SPEED_10 rather than SPEED_1000 on
>     probe.
>   - Link to RFC: https://lore.kernel.org/netdev/20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com/
> 
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

Sashiko raised some valid concerns, I will update the series and send
out v2 shortly.

	Ayaan
