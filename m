Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185103A63F2;
	Tue, 15 Sep 2026 14:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481768; cv=none; b=fSFq91I34Mj1Rl1Bb2WPxY5mkj2p8r+0RJXZZVuVEZpG7EV+LUwGhmLBC3bzjciXrbXd8r4xrtzkLWFDnWenzmrUsUrlDw6Cq4LPjoguJhvrDllS24vog953J3/wfxIoP/dtCff2mpE3WtnxlC3AxisEph+8B847y18jkTvmypo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481768; c=relaxed/simple;
	bh=PTbxpPFOxDQ8xv3WRyCj1KIRouewlTe+7MQl0VvICic=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HBKcw+5Swrafisz/yAlSGlIFZfjb9bYa2Kw9m/9jizFwllDAaVi1f+j/DoWJgMt2a6zkfwrG9ehaGsAiFc7/uNguAuFlKnVTRse5v9tkoP5122iC53FWtXRXacbIZx0F0DhVa82l8ZnpUZNMZcXOzg42fUQndVtCVcDLploOL00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KRUCyAoc; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KRUCyAoc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789481764;
	bh=PTbxpPFOxDQ8xv3WRyCj1KIRouewlTe+7MQl0VvICic=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KRUCyAocjxgVBz3HulW75LFARuyrG+119/V5KXj4ptEBwVuz+JDHiZet+PUE5I0IQ
	 qoy7VqAKh+MD6vKt02YWiG+VFikVc68ZjvuDBCMsJoa+vk+Azx+NRdAMf1ZDxvMFCk
	 1RW4txL2x7YYjWoElHWCLKxAZ5QoWcdaN7Gm80yo6u6PbSoBh+1k2YRqzerZjkZ57V
	 rcKpYgnNz/DI7qUhMi3jatG4TUpAFf1mthq+htbk8Ia+cv1QKt91/AjAkjS6MERzb8
	 42k50eoz5tHYt1tdyYmuf1ZL8TZ0SpWy5vYn6PFbarvsPRF0er/Cnwb0IW4jXWWeJf
	 BrvV6ODCSIQ6w==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AF8E317E089A;
	Tue, 15 Sep 2026 16:16:03 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Martino Dell'Ambrogio <tillo@tillo.ch>
Cc: linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kees@kernel.org, tony.luck@intel.com, 
 gpiccoli@igalia.com
In-Reply-To: <20260915135722.566918-1-tillo@tillo.ch>
References: <20260915135722.566918-1-tillo@tillo.ch>
Subject: Re: [PATCH v4] arm64: dts: mediatek: mt7988a-bananapi-bpi-r4: add
 ramoops region
Message-Id: <178948176365.42253.18334352766065751313.b4-ty@b4>
Date: Tue, 15 Sep 2026 16:16:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

On Tue, 15 Sep 2026 13:57:22 +0200, Martino Dell'Ambrogio wrote:
> Reserve 1 MiB of RAM just below the ARM Trusted Firmware secmon region
> (0x42f00000-0x43000000) for persistent kernel log storage via pstore/ramoops,
> allowing post-panic console output and oops dumps to be recovered after a
> reboot. Without it, kernel crash logs on this board are lost when the SoC
> warm-resets and the on-chip console buffer is reinitialised.
> 
> With record-size=128 KiB, console-size=256 KiB, ftrace-size=64 KiB and
> pmsg-size=64 KiB, ramoops_probe() carves the post-console remainder
> (640 KiB) into five 128 KiB kmsg records, with the requested ecc-size=16
> reserving a small Reed-Solomon parity block from each zone's own
> allocation (per persistent_ram_new()). The ECC lets pstore recover dumps
> even when the panic path truncates writes mid-record.
> 
> [...]

Applied to v7.3-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt7988a-bananapi-bpi-r4: add ramoops region
      commit: b71dd71f0965358d33a4c5c93789e46795f0f49d

Cheers,
Angelo


