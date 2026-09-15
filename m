Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55714486408
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789462227; cv=none; b=cj5SSQes0gIACPMEed9z2Beu960RRQeF0pq4AhQNlFDmTWn2jOOPP5dn7rvln9AH0IIB0alKENNbSO4B1e6JoJxMNdEV2kX3zC4qK9Kr3oVSDRehfFZveJIbVeJZkjlCNnBLbxZ1Ebd7DHptKMoB4kXkgNqOmPmzi3VY/4xzgwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789462227; c=relaxed/simple;
	bh=eQBZRt73OJPvQihSuxprGsITasHhC0JemHvYW7flDPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AiW0n3ei602hHZUzpV7EBuoc64kwMkLXjvPw6O6gLCTX83UHGh6kHfgTEvSM7KgN9Uv2Iwg4zWaL15Ow/ZKfja5RJCmzMpFRpd80PTb7voE2MTTh6BbVkdfBW8C6t7al/at1nl22SNf5wMfuQdg8TyXzXJQlwM8LpijLmzfhi8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FjAF2v+o; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=s95J9I75; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FjAF2v+o";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="s95J9I75"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789462225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WYcdF374Pa9T0avVKuHqJFN69BWIvYlMq0B1D72dSGY=;
	b=FjAF2v+o8f8pC29Z+bmLppVS55khpDGOuxP8y69/31kuUrFcZTX1N6ND6aJeSJx30ae8nt
	e0XYGbQEa9T6JEfJ5LfPEyuaQQLs9q0T+76fM+hHQpfcdZeAYdzYQRZ9arkSQrwhTxL1xI
	tsNrasiBvcXu+vaBAcN7QL9gnqYeqwY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-r33AHW0cNzOsjgI21BfbCw-1; Tue, 15 Sep 2026 04:50:23 -0400
X-MC-Unique: r33AHW0cNzOsjgI21BfbCw-1
X-Mimecast-MFC-AGG-ID: r33AHW0cNzOsjgI21BfbCw_1789462223
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-486f3dbf7d2so2746161f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789462223; x=1790067023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WYcdF374Pa9T0avVKuHqJFN69BWIvYlMq0B1D72dSGY=;
        b=s95J9I7516Y1j0/YaZeNdvndUO7lKl1iQ8YlReD8avz/6zkP9ma+Tdtmqs4uNGBbHO
         eApGMRs7hSwAK+4mYJj4hgXwTLaRHbh2sZuGxciXHJ9nWKj0xAGHI3Sfbu3MIdYtcIHI
         q+XrGBbIn4vidBG2MtR8/r5oD/W2odLMiPRmKBHaD181CRZjBl8CjECVUQJH5GQe98Yr
         31NnjU9jf2gN/1NvodOFXlMpTltsoBCyf39bKf9HhF1/NHoPZ4WBMuBqvseBHJy7LwPE
         HA4xXPU6rnOmysn3tzOCcvtX4okZGxN2M6SjO3HNDbJk9tlOJicC03E7z2IXEEo47ioh
         csQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789462223; x=1790067023;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WYcdF374Pa9T0avVKuHqJFN69BWIvYlMq0B1D72dSGY=;
        b=PYo2v1HpJUjFEH+LASVfGRax1WnPzQEsfhCMdArP7IaDfel3i1LX3KkI6jJTrfckUY
         5rFeelXqGTKHN5zyOhSBfoBwbTO4WyN6L+RjGBVRpDUc2fIDkS9qZmXz08mUFa5fOczg
         zrEntOZhFsyZy6551khQAR4A0CIwrgX8551ufDjvOmyt+JdsJpQHZjYKidMDZIcdzx0N
         4l6wXbNphwO1+2dH0xpj33PhO5xApOE4hRUb2U8Rhv74cu/i/khzMaueo9a/2ncj3hEQ
         TJwiVUn+jqw371MGQzN34fE46q0oa8KRjxyhtFEF0uIB41YcU40NWU9GS8YqFZBFFzRB
         0fZA==
X-Forwarded-Encrypted: i=1; AKwUvByh1vSBzE+9X+7T+/UzBkruruRWoZi9hJmRL+F4Dg2uWgJuxh9+D+qLKzYq/wLp9rEzw7V7IvLpWcPS6sQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lN+u7YzDKyPKKbC/c1arLCY7RxVc+yPQPlb2cX+6J2BOmHMAqW
	UUHhcXlLkSrGr+H9UccJJ6Oyv8y1RhWdx1yY09mRuzIOGQlA7+wPPRTy83tJoSV6aRTOtJwMBp5
	Xn1r3FEP85PKv9qJW6p5wIJjg+kpkxOjZTSBh9EQy9tGSUu6uG4uuaTY47xjM4eJLXg==
X-Gm-Gg: AYBFou3gyGFfCArVmX9zWHDhN6UwbuF3bjX0X+bzwDqdkH5NPzV0S8fFqTcIaUq7H1M
	sk0R6wc4ZYFMJbBKVkY+S8EwDLsDoDQ1OHgLVTucZ9cu6FXNo5/MNDv/mUWiFpx0FzSM1YuwyEF
	lJQ4JxWuSsaX+bIfVI3IwPy/WI3XnD404nPgFT1VGmfT2mZeFAW4UPAGakgP07W6ZZPyr8nJPL9
	XkKNDKcfxCs02jiRZtlbfKmKe2vibE0OtuUDlzX2Ztmy9aaXHa0rpfdxuxfE3v7dT/pUrC0JTDI
	rNQYAvXqCVWzv7PwhcAHQCYP7LPRKBtAHMTvuagteP+zJYTWwWEUBRq0pack5VN7Z11XGRpqgvH
	/aFADGh/APCD8cKtHCIBXIaizJe8HY72oqkEUfn1Z8Dy/jwobYS4KcyxxryJLvaXhHNGhPVApaQ
	==
X-Received: by 2002:a5d:6f1c:0:b0:487:970:ca4b with SMTP id ffacd0b85a97d-4870970cb5amr941604f8f.25.1789462222480;
        Tue, 15 Sep 2026 01:50:22 -0700 (PDT)
X-Received: by 2002:a5d:6f1c:0:b0:487:970:ca4b with SMTP id ffacd0b85a97d-4870970cb5amr941559f8f.25.1789462221970;
        Tue, 15 Sep 2026 01:50:21 -0700 (PDT)
Received: from [192.168.188.218] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e7f5sm32623392f8f.9.2026.09.15.01.50.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 01:50:21 -0700 (PDT)
Message-ID: <0d85afb2-c738-42da-aa1a-aa16e5709948@redhat.com>
Date: Tue, 15 Sep 2026 10:50:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 0/6] net: stmmac: More selftest-related fixes
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Heiner Kallweit
 <hkallweit1@gmail.com>, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Minda Chen <minda.chen@starfivetech.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jan Petrous <jan.petrous@oss.nxp.com>,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>, Jose.Abreu@synopsys.com,
 Nicolai Buchwitz <nb@tipi-net.de>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, PKneuper@dspace.de,
 David Laight <david.laight.linux@gmail.com>
References: <20260911212028.1497613-1-maxime.chevallier@bootlin.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260911212028.1497613-1-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/11/26 11:20 PM, Maxime Chevallier wrote:
> Hi everyone,
> 
> This is V3 of stmmac selftest fixes, adding a cap on EEE test as the
> timeout can get pretty long, found by Nicolai.
> 
> This is another round of stmmac selftest fixes, mostly about the selftests
> themselves but a few things were discovered w.r.t MTU and buffer size
> handling, see patch 5.
> 
> I've continued expanding the test devices I'm running this on, more devices
> should come in the future. With this series, _almost_ everything is
> green, except for some flow control stuff that is either a false positive
> or a real thing that needs investigating.
> 
> After this is merged, I consider the selftests to be now reliable enough
> to run them nightly on every stmmac series that's sent, and I'll be requiring
> clean selftests for new glue drivers.
> 
> I've been running this on :
> 
>  - Altera CycloneV (dwmac-socfpga, dwmac1000 IP, v3.70a)
>  - NXP imx8mp (dwmac-imx, dwmac4, v5.10a)
>  - Allwinner H2S (dwmac-sun8i, dwmac1000)
>  - Amlogic S905X3 (dwmac-meson8b, dwmac1000, v3.70a)
>  - STM32mp157a (dwmac-stm32, dwmac4, v4.20a)
>  - SiFive JH7110 (dwmac-starfive, dwmac4, v5.20)
>  - Motorcomm YT8061 (PCIe, dwmac-motorcomm, dwmac4)
>  - Qualcomm IPQ8064 (dwmac-ipq806x, dwmac1000)
> 
> Tests are OK if return is 0 or -95 (-EOPNOTSUPP), tests are KO otherwise
> 
> Before the series :
> 
> Test                     imx  socfpga sun8i meson8b stm32 starV mcom ipq806x
> MAC Loopback              0     0      0     0       0     0     0    -110
> MMC Counters              0     0      -95   0       0     0     0    -110
> EEE                       -95   -95    -95   -110    -110  -95   -95  -95
> Hash Filter MC            0     0      -95   0       0     0     0    -95
> Perfect Filter UC         -95   0      0     -95     -95   -95   -95  -95
> MC Filter                 -95   0      -95   -95     -95   -95   -95  -95
> UC Filter                 -95   0      -95   -95     -95   -95   -95  -95
> Flow Control              -95   0      -110  0       -110  -95   -110 -110
> RSS                       -95   -95    -95   -95     -95   -95   -95  -95
> VLAN Filtering            -110  -95    -95   -95     -110  -110  -95  -95
> VLAN Filtering (perf)     -110  -95    -95   -95     -110  -110  -95  -95
> Double VLAN Filter        -110  -95    -95   -95     -110  -110  -95  -95
> Double VLAN Filter (perf) -110  -95    -95   -95     -110  -110  -95  -95
> Flexible RX Parser        0     -95    -95   -95     -95   -95   -95  -95
> SA Insertion (desc)       0     -95    -95   -95     0     0     0    -95
> SA Replacement (desc)     0     -95    -95   -95     0     0     0    -95
> SA Insertion (reg         0     -95    -95   -95     0     0     0    -95
> SA Replacement (reg)      0     -95    -95   -95     0     0     0    -95
> VLAN TX Insertion         -110  -95    -95   -95     -110  -110  -110 -95
> SVLAN TX Insertion        -110  -95    -95   -95     -110  -95   -110 -95
> L3 DA Filtering           0     -95    -95   -95     -95   -95   -95  -95
> L3 SA Filtering           0     -95    -95   -95     -95   -95   -95  -95
> L4 DA TCP Filtering       0     -95    -95   -95     -95   -95   -95  -95
> L4 SA TCP Filtering       0     -95    -95   -95     -95   -95   -95  -95
> L4 DA UDP Filtering       0     -95    -95   -95     -95   -95   -95  -95
> L4 SA UDP Filtering       0     -95    -95   -95     -95   -95   -95  -95
> ARP Offload               -95   -95    -95   -95     -110  -110  -110 -95
> Jumbo Frame               0     -110   -110  0       0     0     0    -110
> Multichannel Jumbo        0     -95    -95   -95     -95   -95   -95  -95
> Split Header             --95   -95    -95   -95     -95   -95   0    -95
> TBS (ETF Scheduler)      --95   -95    -95   -95     -95   -95   -95  -95
> 
> ARP offload's still there as this was a net-next patch and I've ran these
> checks on the net tree.
> 
> Jumbo frame tests on dwmac1000 started failing after :
> 
> commit 23680bf5f8c6 ("net: stmmac: restore NET_IP_ALIGN in the RX DMA offset")
> 
> This commit is OK though, it just made the selftest reveal the cracks
> hiding beneath the surface of MTU/bufsz handling.
> 
> After this series :
> 
> Test                     imx  socfpga sun8i meson8b stm32 starV mcom ipq806x
> MAC Loopback              0      0     0       0     0     0     0    0
> MMC Counters              0      0     -95     0     0     0     0    0
> EEE                       -95    -95   -95     0     0     -95   -95  -95
> Hash Filter MC            0      0     -95     0     0     0     0    -95
> Perfect Filter UC         -95    0     0       -95   -95   -95   -95  -95
> MC Filter                 -95    0     -95     -95   -95   -95   -95  -95
> UC Filter                 -95    0     -95     -95   -95   -95   -95  -95
> Flow Control              -95    0     -110    0     -110  -95   -110 -110
> RSS                       -95    -95   -95     -95   -95   -95   -95  -95
> VLAN Filtering            0      -95   -95     -95   0     0     -95  -95
> VLAN Filtering (perf)     0      -95   -95     -95   0     0     -95  -95
> Double VLAN Filter        0      -95   -95     -95   0     0     -95  -95
> Double VLAN Filter (perf) 0      -95   -95     -95   0     0     -95  -95
> Flexible RX Parser        0      -95   -95     -95   -95   -95   -95  -95
> SA Insertion (desc)       0      -95   -95     -95   0     0     0    -95
> SA Replacement (desc)     0      -95   -95     -95   0     0     0    -95
> SA Insertion (reg         0      -95   -95     -95   0     0     0    -95
> SA Replacement (reg)      0      -95   -95     -95   0     0     0    -95
> VLAN TX Insertion         0      -95   -95     -95   0     0     0    -95
> SVLAN TX Insertion        -95    -95   -95     -95   -95   -95   -95  -95
> L3 DA Filtering           0      -95   -95     -95   -95   -95   -95  -95
> L3 SA Filtering           0      -95   -95     -95   -95   -95   -95  -95
> L4 DA TCP Filtering       0      -95   -95     -95   -95   -95   -95  -95
> L4 SA TCP Filtering       0      -95   -95     -95   -95   -95   -95  -95
> L4 DA UDP Filtering       0      -95   -95     -95   -95   -95   -95  -95
> L4 SA UDP Filtering       0      -95   -95     -95   -95   -95   -95  -95
> ARP Offload               -95    -95   -95     -95   -110  -110  -110 -95
> Jumbo Frame               0      0     0       0     0     0     0    0
> Multichannel Jumbo        0      -95   -95     -95   -95   -95   -95  -95
> Split Header              -95    -95   -95     -95   -95   -95   0    -95
> TBS (ETF Scheduler)       -95    -95   -95     -95   -95   -95   -95  -95
> 
> ARP can be ignored, and Flow control needs some more attention, but
> we're getting there :)
> 
> Thanks,
> 
> Maxime
> 
> V3:
>  - Bail out of the EEE test if LPI is over 5 seconds
> 
> V2:
> https://lore.kernel.org/r/20260910151404.976753-1-maxime.chevallier@bootlin.com
>  - Snapshot before sending the frame for EEE, in case we immediately
>    enter LPI
>  - Also return -ETIMEDOUT instead of EINVAL
> 
> V1: https://lore.kernel.org/lkml/20260909074740.1247762-1-maxime.chevallier@bootlin.com/
> 
> Maxime Chevallier (6):
>   net: stmmac: selftests: Support running selftests on DSA conduits
>   net: stmmac: selftests: Validate EEE based on the actual LPI timer
>     value
>   net: stmmac: selftests: Check the dev->features for S-TAG offload
>     testing
>   net: stmmac: selftests: Capture all packets for vlan checks
>   net: stmmac: size the RX buffers from the frame length, not the MTU
>   net: stmmac: selftests: Account for alignment shift on dwmac1000 for
>     Jumbo test
> 
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c |  20 +--
>  .../stmicro/stmmac/stmmac_selftests.c         | 121 +++++++++++++++---
>  2 files changed, 114 insertions(+), 27 deletions(-)

It looks like that the possible ETIMEDOUT reported on patch 4/6 is
contradicted by your testing, but the other not pre-existing 'high prio'
findings from clashiko look actionable to me.

/P

