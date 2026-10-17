Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3930541A547;
	Sat, 17 Oct 2026 23:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792280391; cv=none; b=TDzcpXAKTfhIr6WK8P2MwsGNPWCa8n6Sg/AkMTfsvuIeVWABzQI7cUKVce76Iv5PGGkLCsjecrAZXUWc6CZZhZaDQlcVqyjiNdD/V8bu/BZZdNZrB3M5PkfqS+gVTKiwRfaQFe8UBcQ2QK7+iOA+G/+lQ3+rjQoZDjGPCbQwEew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792280391; c=relaxed/simple;
	bh=15/DpY4+f5RaGBS7HqIDpDjfB6P/78pr5hig3CPkuYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=REJbS8gj0WMPQWQ56lYCgSWH4aCvOQfhDR0Di0IgyRhucEYZfMInfnQKpTKl7ymR1suJF5Xe7ae8CroHMbrnxXQm91IlAn45jvDjCd/0bZEPJqNiD99FZUhLZn0gHkiI7BUIzJhtwOOnn2fDBuIVjSUQc6lrfKaSVhD5+XIWd6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iToMp5fx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iToMp5fx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 035EB1F000C4;
	Sat, 17 Oct 2026 23:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792280389;
	bh=IOaIHN9koYBp4/y2xYG+zvcLw+InozkSxxmt+Azkxmo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=iToMp5fxLcQH7IgAb1ab5ZzA/49xSXrKI2GQNqawjAqYIk/zQdilaZchaGpGUXlpv
	 iYVY2foBiUqm6ppbXT44B155SUq/sfsyHOI2IF2uhXX8DaSWqzvA5NpAoeY7pH/MIq
	 hBRSPbNlhDPGyFPnn2tDPuud6lnp834DxZWuA2jiuMctz9Hfp/cfxDH6O2oLVNS7+z
	 Ae5vhLDhY2NiNdvzMT2VmN0PkXCAguJTTt0tiGa7NnW5otNE3k8r/TXQfcVMnnWXK2
	 SuKA7ZILgPurFQT2VsS6CM8lMMXpplyliduQaufxE+dmoIl684vGIpQxlxz/GSh26E
	 0RxHFbBLFfw/Q==
Message-ID: <141c5032-1915-4dac-bbcf-e697b762ae40@kernel.org>
Date: Sun, 18 Oct 2026 00:39:45 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/6] phy/media: Add generic MIPI C-PHY support to
 CSI-2 stack
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <pFAaFSKH8thStYg6_Ew1gWdIvj5lbNBF36QKdamV1cU1Nc73wEZfM_KdQWL2NmB5fvaUpMPen7qMOzjHZ9ROIQ==@protonmail.internalid>
 <20261017-cphy_support-v1-0-8b0e1237ce95@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20261017-cphy_support-v1-0-8b0e1237ce95@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/10/2026 18:13, Nihal Kumar Gupta wrote:
> George posted a C-PHY series [1] which we are currently reviewing.
> As discussed with Bryan, this series shares our independent
> implementation so the approaches can be compared.
> 
> Two aspects covered here are not in [1]:
> 
> - Settle count calculation derived from sensor-reported T_PREPARE and
>    T_PREAMBLE timing via get_mbus_config(). [1] left this as an open
>    question.
> 
> - Data rate based register sequence selection using effective bit
>    rate (link_freq * 32 / 7). [1] noted downstream does this but
>    deferred it; this series implements it.
> 
> MIPI CSI-2 operates over two physical layer variants. D-PHY uses a
> dedicated differential clock lane with up to four data lanes. C-PHY
> encodes the clock within the data stream across up to three wire
> trios, eliminating the dedicated clock lane.
> 
> Patch 1 extends the generic PHY framework with PHY_MODE_MIPI_CPHY
> and struct phy_configure_opts_mipi_cphy.
> 
> Patch 2 adds t_prepare_ns and t_preamble_ns fields to the CSI-2
> media bus configuration and extends CAMSS to forward them to the PHY
> provider for settle count calculation. Sensor drivers must implement
> get_mbus_config() and return non-zero values in nanoseconds; stream-on
> returns -EINVAL otherwise. The strictness is deliberate: C-PHY settle
> timing is symbol-rate-range specific and no safe value can be derived
> from link frequency alone. A conservative fallback could be added if
> reviewers prefer.
> 
> Patches 3-6 extend the Qualcomm CSIPHY driver: refactor D-PHY
> register storage to accommodate C-PHY, accept C-PHY mode with
> multiple data rate table selection, compute settle count, and add
> lane power mask support for C-PHY trios.
> 
> C-PHY encodes 16 bits per 7 symbols, so the effective bit rate is:
> 
>    bit_rate = link_freq * 2 * 16 / 7 = link_freq * 32 / 7
> 
> where link_freq is symbol_rate / 2 as reported by the sensor via
> get_mbus_config(). The rate-table entry whose bandwidth first meets
> or exceeds bit_rate is selected.
> 
> The settle count defines how many timer clock cycles the CSIPHY
> receiver waits before scanning for C-PHY sync. It is computed from
> the sensor's T_PREPARE and T_PREAMBLE timing. The /3 factor reflects
> that C-PHY distributes the preamble sequence across three trios:
> 
>    settle_cnt = (t_prepare_ns + t_preamble_ns / 3) * timer_clk_rate / 1e9
> 
> D-PHY settle count is unchanged from before this series.
> 
> [1] https://lore.kernel.org/all/20261016-x1e-cphy-rfc-v3-0-40a346a72153@gmail.com/
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
> Nihal Kumar Gupta (6):
>        phy: core: Add MIPI C-PHY configurations
>        media: qcom: camss: Add C-PHY timing fields and get config from sensor
>        phy: qcom: mipi-csi2: Split D-PHY register settings
>        phy: qcom: mipi-csi2: Accept C-PHY mode and add register sequence
>        phy: qcom: mipi-csi2: Add C-PHY settle calculation
>        phy: qcom: mipi-csi2: Add lane mask calculation for C-PHY
> 
>   drivers/media/platform/qcom/camss/camss-csiphy.c   |  90 +++++++++---
>   drivers/media/platform/qcom/camss/camss-csiphy.h   |   2 +
>   drivers/media/platform/qcom/camss/camss.c          |   8 +-
>   drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 159 +++++++++++++++++----

So on thing I notice about this series and like is that there's a small 
change to the existing 3ph-dphy.c

- Since it supports 3ph-cphy the file should be renamed
   3ph-cphy-dphy.c (or something)
- I like the progressive nature of he changes in this series
   as structurally the right way to add stuff in. Small digestable
   commits
- I think the missing piece here is data_lanes[] and lane_polarities[]
   per the other series from Qcom
- Another thing is the other series from Anusha has
   a more advanced mipi_ops data-structure for CPHY.

Basically I like the approach taken in this series for a smaller change 
to the phy-qcom-mipi-csi2-3ph-dphy.c file.

I'd like the best of both series - I think there is alot to resolve on 
lanes, data-lanes and lane-polarities in the other series and looking at 
this series, it seems to me we don't need a separate 
phy-qcom-mipi-csi2-3ph-cphy.c, I think Konrad observed in George's 
series that really the file deals with 3-phase PHYs and that seems true 
enough.

Please work out between yourself and Anusha what's next.

If possible I would prefer to contain 3ph CPHY and DPHY to one file as 
is done here - at the same time the definition of CPHY ops and lane 
mappings is closer to the spec in the other series.

I think either you should take Anusha's structs and lane definitions or 
Anusha should take your approach to minimal change to the 
phy-qcom-mipi-csi2-3ph-dphy.c renaming it.

One of you needs to pick up the patches from the other one.

George can land his stuff on top then.
>   drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |  51 +++++--
>   drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  25 +++-
>   include/linux/phy/phy.h                            |  47 ++++++
>   include/media/v4l2-mediabus.h                      |   2 +
>   8 files changed, 315 insertions(+), 69 deletions(-)
> ---
> base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
> change-id: 20261017-cphy_support-2ce4d656e631
> 
> Best regards,
> --
> Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

