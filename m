Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C8930CD81;
	Tue, 15 Sep 2026 13:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478755; cv=none; b=OGpxbiDg4OfIEh69OpKhyW666WTw1W/kZ8PfxyRdCBiU1CkG3UPtiS9W9oJ1hhghchmWs7hOYg/P/FvlFCN02kSpqm2yVSly1hMEHBRt0dxu71Nadbhvao+8Ou/8PujTOPLQHhdqkgPjQPv1Yh9G5nkBx2x8D1t6VMXeBhs7kSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478755; c=relaxed/simple;
	bh=n+xfkg7b6cBRQFcEcl4DQNh7KCXdlVfEV7dSl1CI46g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Q5JzpreLSHbdnbX2o3gNGrHXvePGoqyoG6YMjKwEN20fKCmHZ58gN+G9du7NRrybZeWVDUBD0YcWmDo/Srac2IpA0PNqZEK2msYfwzRWK783PeZCXsZwKa2XCxslrNHki2uWp2IT2w+PV+wDKkRbfwl9SgC1HBaBdeRSnj3db2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HLzK5T+P; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HLzK5T+P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789478751;
	bh=n+xfkg7b6cBRQFcEcl4DQNh7KCXdlVfEV7dSl1CI46g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HLzK5T+PL7+QNdbur9YPOrEAL2xCzL2s/cGPigZPIhmJuIhlSN1NWe4RggLgBfLX2
	 ti8SoOcuFR6yA66H+oJZv8f9r4tfsZK3N3QPWbeubsfkCsAY7NpWZBnbRwCoCRTRzb
	 bw5oHpgYjS6Z2Us+4Ha7n+vVXFM1SrhzBQy+syp1Xt9Ur1GFITkePWBbRC41o9BJVx
	 lQFynk0uQxxLQsTbChs2TuooLRjgpYxq/AMtYqKrsWm76YkpcvosIoVQvvO8yxdTFl
	 NzkgUeV476tlyNHkdr5F1DPG2hANy6sf4zDr6twX5rjk4aB6FjLVTEvhCu6rrHOy4c
	 DDjkNKNJYdSXw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8BB6117E07A9;
	Tue, 15 Sep 2026 15:25:51 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Martino Dell'Ambrogio <tillo@tillo.ch>
Cc: linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kees@kernel.org, tony.luck@intel.com, 
 gpiccoli@igalia.com
In-Reply-To: <20260915141226.600486-1-tillo@tillo.ch>
References: <20260915141226.600486-1-tillo@tillo.ch>
Subject: Re: [PATCH v5] arm64: dts: mediatek: mt7986a-bananapi-bpi-r3: add
 ramoops region
Message-Id: <178947875151.35150.1801064329287090544.b4-ty@b4>
Date: Tue, 15 Sep 2026 15:25:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

On Tue, 15 Sep 2026 14:12:26 +0200, Martino Dell'Ambrogio wrote:
> Reserve 64 KiB of RAM just below the ARM Trusted Firmware secmon region
> (0x42ff0000-0x43000000) for persistent kernel log storage via pstore/ramoops,
> allowing post-panic console output and oops dumps to be recovered after a
> warm reset. Without it, kernel crash logs on this board are lost when the
> SoC reboots.
> 
> The zone sizes (record-size=8 KiB, console-size=32 KiB, ftrace-size=8 KiB,
> pmsg-size=8 KiB) consume the full 64 KiB carve-out. The requested ecc-size=16
> reserves a small Reed-Solomon parity block from each zone's own allocation
> in persistent_ram_new(), which lets pstore recover dumps even when the panic
> path truncates writes mid-record.
> 
> [...]

Applied to v7.3-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt7986a-bananapi-bpi-r3: add ramoops region
      commit: 5b748eb481caf88e7f0b3c763dbc6247a59f6e21

Cheers,
Angelo


