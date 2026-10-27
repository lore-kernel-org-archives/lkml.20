Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793084258;
	b=r+FtqJp+fXAfvDMqMQCDkO31Ru33r20+hpp3AuHf/9URdKjlMV8/Uy5gAEaXgZbC+Gpq
	 NyQb3A+6H4PoQ2T/gsUH8Kq5CGDufLIJrw/fwW4Ry7WmGkjlxCbzVRjan6x6K4l+S/UUX
	 /EqXilBMAqIaYWhiZ4dgsNbcTPAgjLwpskwBPmZS8iTI71QHJaet82YnGq3OjsTaKqUr4
	 o8nBGsv21MONzUQKc5WaNtrNFj80uoR4SDp5aweHDMwF2rIpyy4gzl7w5a4GngB5xtn4p
	 WlIFqaXqFBZpNyTb2+mlYViP/UhkUoE1eiGutmI45hZpAM5rIVn011pwJyD4KtnPLXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793084258;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sA/soCd+jAxyVyCbYpE8ZxQ51mVTYvjC6BPEoSaY6Pc=;
	b=m5+onfZOiZ4gnKCMVyPjPTSOB2d5krVxDsRPazvmdtwmeKx6wsFT+gWiivl7b3MOqFr2
	 usiuE7CxvBTZTBX7ebxx4CHW55bkWYe734twneYkl0Bb7emXkKuqW+2cZuC98vEUJOVEi
	 +BDS2dDJcrPOKj7k0G0aUCkyz3TWYEVkNlBEB9kSKcJNHi/YkPp0svuAyD6tYN2gC6Z57
	 7PWiH/50ESbl9eXsjtk3r3dNlV7uK9qQl3A7Mp5DtTmnVNMbyotVok1PEvjIH8C6lVb2G
	 O3/rwTtmj79w8cj47KJ1w+BAGX/8wK/uyb2n0GddGazl10x87IWjkZg30Yy85c+1PsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UWuJ9Lit;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB98606A320
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DB98606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UWuJ9Lit
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso33043245e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793084257; x=1793689057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sA/soCd+jAxyVyCbYpE8ZxQ51mVTYvjC6BPEoSaY6Pc=;
        b=UWuJ9LitCKkGTEaaIUGD/Wghisf6auEQWKjaR9IxA8JMPvQ2KKQuG4HUqYD9j+3VD+
         rjFQMVOw+k5S1ZQcw5QE8SjBC3mETwLhM5bih+1WI4y4EoTKsJvYvelUDtThKY8qYneg
         /V72cKKSdPk6XPP+RzrYGJpKkzMrHr0z6rs/PBe+WSuRVXRc8/KasiTjlKIrNCwS9xhR
         nnZaTdNS7VUM4PaSMfgqLTrCAE4EU/8lmCy0IlsbcweyoZ77CwOOl2yv8RDH9V5srMZp
         ghmT153AfKK6H+jbHeFRZv6/Aj0EQT2xNW+PAeDzEoFfuqWxk7K+kse2XsIS2gZk3182
         J8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793084257; x=1793689057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sA/soCd+jAxyVyCbYpE8ZxQ51mVTYvjC6BPEoSaY6Pc=;
        b=QOQxYRQMXRblsT/TZJstXWjO2F4CuC4mkBmBlinsoHWUmS90T5QdRRcSp6MatNyFQe
         delxX5Vm6KaezgSGjdt+duVTc5kTdY/XnKuhPrDUFowM1UN5/5T33PncKm/PMXGjDoHr
         SBcYLPrTBYmydpG1IoaoVAGPvfPxq/iNEkhJjrwy4wOSgR8+L8CLZ7EV9sAm6Prbe95P
         QOHZJXTiT0Y62D1d5+kynmNCL7emqK5lC+LB+0m9RhwUFdKfMet5OkkA2c1wOHl1+4pQ
         SGvu5UQvgG/EgCvog/lIvVKmmtP5AJ8SJUaxx53bcFyIZcRwX5b/FbN2c+6AEqK4lin7
         ha3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxJCR8pFEGFn9JI72Xfoh5PdFknEiPAKVcg9NaSkfsFWTz5tpP1ac51haVwr+0mUe/RUAWsbr8St5LDUh8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUIlnL3jFF93+z2myvHvgPV5FMs0p5dfDrNucwlAsvGCP8p5J1
	DWy/gwp1p+HeCGzr0++IRW3GvuusT+1s427+sX/qStxpHrl803lernOV
X-Gm-Gg: AYBFou2MGxSZrxUUMQs6iSPn4CFzTUK0zRWQKQcXGZKoFUS0zcLuyKHZRI9flspw9vw
	azXromRablGdD0qIKnxHq4kskieeFurhelcZ5u6Re/kNkAJpPpXT0j+ZxlLGY5VokTa4aFd7MXW
	0tD+tkUDw2+9vG+BFDBPkHVfdwbhVBRKkvLpTJTz4TXuDS5GIJUmS4G19QIiIMj6SjwxRfaNGBH
	1zTeOe4QYvXUN5GV+Llhp0MSXbgm5ZrLYksV7CkWCfk0qJ3pzA9mgtxC5UzUonu4I1Wc7uqTplZ
	BaMhSfjeGfw40A6IiM3DT18LlbXBgdA1t0LiQp17HbycogWCZJamCK1BImj2QTg2BozSSp4Bv52
	dQwSqStmo1w/Kf4hF45PYP5gkXsa7w+k4TP8Qe+OQpotU6/uGE+OymQa9Vvi0Sjp0sOKLTCmV3i
	xSDeVn4xqnJKigdANMvAy/N74wnknItVot+/SpWGc0fC560DGIM8kfaiu3F/ycS2Cil19uExrPd
	qpSmfs4TVX5NMEqwIROIVv8fJkPf7re38zpfpvxyH3lFp6/W1UFMR16Jj6EBN4AbKWEvUPD/B4/
	WlJ+GqmT/kYh1+TDd77wraXOcS3Y8SjBjFHriyvkm/mSYiFEHgYkY+TBP9CCU5CqQEwH5vBFKYC
	534HT1u23zx+T9F1MOfSQTyfbZr/yCkt9FOn2urZmw+PBnmNPj9BptCKjv/CQ2jRRnCjiqPTICq
	LU7H3d
X-Received: by 2002:a05:600c:474a:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4a35ace28e0mr174280915e9.32.1793084256726;
        Mon, 26 Oct 2026 23:57:36 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b2ac-9b01-6900-1f92-d182-4435.310.pool.telefonica.de. [2a02:3100:b2ac:9b01:6900:1f92:d182:4435])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2c0458sm243490115e9.11.2026.10.26.23.57.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 23:57:36 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Vishwaroop A <va@nvidia.com>,
	Krishna Yarlagadda <kyarlagadda@nvidia.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Rhyland Klein <rklein@nvidia.com>,
	Suresh Mangipudi <smangipudi@nvidia.com>,
	linux-spi@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] spi: tegra114: chip-select fixes and PIO-only probe
Date: Tue, 27 Oct 2026 07:57:26 +0100
Message-Id: <20261027065726.98396-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <179258895296.403962.3492255118456900623@nvidia.com>
References: <179258895296.403962.3492255118456900623@nvidia.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Oct 21, 2026 at 10:14:06AM +0000, Vishwaroop A wrote:
> The delay runs after CS is dropped. A mid-message cs_change drops CS
> and never drives it active again. When the last transfer holds CS,
> the next message can turn hardware CS back on and drop the line.
> TIS-SPI under spi_bus_lock() needs CS held across those messages.
> Multi-transfer messages already use software CS; patch 4 only moves
> that choice so patch 5 can keep it.
>
> Patch 1 is separate. A missing "dmas" property fails probe even
> though PIO works, so fall back to PIO.

Tested on Jetson Nano (Tegra210) on v7.3-rc2 (5b0764a53235) with
7000d400.spi (DMA enabled) and 7000d600.spi ("dmas" omitted from DT):

1. PIO fallback (patch 1/5):
   - Unpatched: 7000d600.spi fails probe with:
     spi-tegra114 7000d600.spi: error -19: Dma channel is not available
   - With series: 7000d600.spi logs:
     spi-tegra114 7000d600.spi: 'dmas' is required by the binding, falling back to PIO
     and completes 128-byte PIO transfers on /dev/spidev1.0.

2. Mid-message cs_change reassertion (patch 3/5):
   - Two-transfer SPI_IOC_MESSAGE(2) on 7000d400.spi (SPI_MODE_0,
     active-low CS0) with cs_change = 1 on both transfers:
   - Unpatched: SPI_COMMAND1 (0x7000d400) after the message is
     0x40701827 (SPI_CS_SW_HW = 1, SPI_CS_SW_VAL = 1), leaving CS
     deasserted high during the second transfer.
   - With series: SPI_COMMAND1 is 0x40601827 (SPI_CS_SW_HW = 1,
     SPI_CS_SW_VAL = 0, CS reasserted low before the second transfer).

3. Per-transfer delay order and keeping software CS across messages
   (patches 2/5, 4/5 and 5/5):
   - Immediately following the cs_change = 1 message above, a
     single-transfer SPI_IOC_MESSAGE(1) with cs_change = 0 and
     delay_usecs = 40000 was submitted while sampling SPI_COMMAND1 at
     15 ms into the 40 ms delay window:
   - Unpatched: SPI_COMMAND1 at 15 ms is already reset to 0x40400000
     (SPI_CS_SW_HW = 0) because tegra_spi_transfer_end() ran before
     spi_transfer_delay_exec() and the transfer switched to hardware CS.
   - With series: SPI_COMMAND1 at 15 ms is 0x40601827 (SPI_CS_SW_HW = 1,
     SPI_CS_SW_VAL = 0), holding software CS active during delay_usecs,
     and returns to 0x40400000 after delay_usecs completes.

Tested-by: Karl Mehltretter <kmehltretter@gmail.com>

Thanks,
Karl
