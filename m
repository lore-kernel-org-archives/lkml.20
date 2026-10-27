Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793083973;
	b=uPd6hchBqtBa2d0ihgcFun4yaSd62TOLTnFfqOK8ti+/cO0Rnd3K1qgmTSqVlsIEEpDN
	 oRZRNHP50Ewh5DXu92AJDAMiJ868H1KHWnmc3PTb0iR4UicXUeHd45qLajsGzx70YiNCR
	 pYoft32426qLC8F+mLE1oNYoyoXXOUTiXzMxI2cRa7xvoKmZRkZz8jyzg1NKaArB2iP0M
	 MbhrFwmAKrP8FGhQ3I77bb5HpSvSqcovyc2QgqAt9i1PWUJBHD5uqe7g52U7DDmmWwr3p
	 C4uI1j1pR0uX+bnOhrvHbjaIb+QzFMRqeW6/pi2nWc8Fr7CXcNQuQzGitjh7S+m6P9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793083973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bcuq2df4LWxKU06cO1cKfQHt7bV53cP3D5X0WMKpC5M=;
	b=l6Wi3yS1/nstXi5rjt27HjmNm2fAUb5mW+8TBmHufNjO9QukL7tscZ+5exKDB8DtaggZ
	 Gt7+RnAOqeQOiNzSezNt4+7gH2FAHujKC6A1N6XuX4lIxsTy59lJu8wB0rR+Amv+DGEjm
	 s0/2VZYumzR7H00R+LhYxefqgaAQMEo4s6oiy/rGsW8ezzXVA4zRcW4TSkLAjUiHnrWf9
	 GoPC32RN3mLUeW5Ut0hIvMYt78XYU2zGBL9iFf/xEPgLpG3ranWSS0SSlBbFDuTRfW1yK
	 ChAs889B4Z/iN97D1ag6jOR9xYVdGqHRqsv4rsn5BRhTTfHkC6zHg2PY2pz9lBNxgjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CyVpYmwe;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D71606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35D71606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CyVpYmwe
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a208d93758so43223235e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793083971; x=1793688771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bcuq2df4LWxKU06cO1cKfQHt7bV53cP3D5X0WMKpC5M=;
        b=CyVpYmwexZ0bVEp0AP6HCD+adMbpynGOGrPpnbPVqkVSdUknZA4JinYq0I51kxx8Aa
         17jMEtKvvpyf6qJsb+JydH+g0gXGuN+gpDGCPywZi8w7SJkff9cmaY4GUC41TyRl41DM
         qD7lYaTVE+xOke0MyrzHq7xXdStA/EzCcFkL/dhcL1N/yvhuUCMLf4m2ph+ctGO+aI2y
         l+nhpfmo8m0zFLguHtoGeGbs5JAjWoVtefeElI/aiZd8obcTZX5IwfZSSpDP4nTW6Ut+
         b6g1/pCZedJSU4PX0NGcQqJekYsdDn1Fp4Cmw7tVPIdzIn5xFRARbGS3vl8i2WqWWLfN
         vnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793083971; x=1793688771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bcuq2df4LWxKU06cO1cKfQHt7bV53cP3D5X0WMKpC5M=;
        b=bxL44fJn8LH04oY11tC3wGjBfkwSLSHPp5x+ROgHsLpaa+IDtU1CjPX5VSbGOGFITq
         gnRipdCDrQmd8BYNtraCjQaU3lbsnEq7j37Hlz7i+aUsj9v6mBiC9cDpMON+7tkFjgRd
         YwzIE2eKjBMbdvWyZQDGENpU3jZKBTaPe571AFe7SHEOdU+5Opd3IVP+yscKJULtad4d
         Foxpwwn25MAdQS+sYI7shF3aYhbYnZPPrW+Oe76uu5+6aYvCddykQVsbZNiP8oTTtDV+
         UMGY0xr0ovTt8i1ftgaotKQBKkNaLmsA6nnRypqclFkWkE6Ot4nzpPPSwcrK/t6lXsce
         KRaA==
X-Forwarded-Encrypted: i=1; AKwUvBxiirh0dx/nORfFgo0ECfJgbDOsPhTU4wPdr7CAEutBZ+mDsOzf10vlxV1AraztA0tZM1O2xZxOP3x0Ziw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK92ppPunBUiEsNjVcPenavXPHgUqVIGGFm4EKdq0/zvPhYArnQ
	Y/3+uXKoWhAwOE1buf1oEHR4oqQH8U4Tl67rONzS44mMDp0lIN4+y7TX
X-Gm-Gg: AYBFou2k3d9yjx1I8TR4JtjWyHnHW0wbdiwui+hRSc2/ek2jynAJPevGkUa8QD1eUri
	v27+ONoLfcyE1B5MEBazz3Q5YU34IXewo+zuFYN5hYmlwAKK5B5CuSP1oq2bUfj/8mrnIVX6OZR
	sc9QKWB/ueavex1C8NAl5Qb2U2lXibs7ZJooSpQHZLnlgJqMYs5XNzz9gLzyYcJpgdnr7PVWFGq
	T3jJQe2BsgYD2Wgh0kminINTIe+RAEVGGX2PuIEM8MkGvdiSRi0l5OOTOvrTPQFhCIjc5sycN6e
	Qo6mX1emQfvwR9ODJKCwlCkzCyjrDQIDkUtmN+MtvcR8PvXrEnd7PpQHvJb1Yjq2UHCC7xEPjHa
	mVpL5OSENfnY0e7jKrmGxIVBCkQheCvLa3eKRwHeIFfGM+T7qrlyqVQt4R20stjOJMrVy3hl7DU
	UWIaX2Z2/DcNdHSaAeVIM7NDQ9UZMn5F4DVdcAq7HoFPvNPBU4ePKiKiez2VR6WRl8Bk1h41B5d
	TMfDOH+6Ujn1reHqM7ih33bB7FpeD8noX5oGyIeTTIM8Af1XZ9OkGthbEN2QPqHtdN3Uu5cWlSe
	lUgsex1zM9qEKy7i5LoLk1dOUjlo7gDjlS12slV0/OajvTcALtQL7j2C3SUf0psWWgDV5WsWcTU
	AztWesfxCEJa6Zi9wfsmQOkdqWVahMtmXQB1AC8Ys9YCWpItmnHqSCiTkqyOoYHFKqUx/JY94gu
	5JeNTm
X-Received: by 2002:a05:600c:3f07:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4a35ac91137mr150192625e9.11.1793083971271;
        Mon, 26 Oct 2026 23:52:51 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b2ac-9b01-6900-1f92-d182-4435.310.pool.telefonica.de. [2a02:3100:b2ac:9b01:6900:1f92:d182:4435])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2ed5a2sm259282285e9.15.2026.10.26.23.52.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 23:52:50 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Austin Schlegel <schlegelas@outlook.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Alan Cox <alan@linux.intel.com>,
	Stephen Warren <swarren@nvidia.com>,
	Austin Schlegel <austin.schlegel@arthrex.com>,
	linux-serial@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 0/3] serial: tegra: fix DMA descriptor use-after-free and stale completions
Date: Tue, 27 Oct 2026 07:52:39 +0100
Message-Id: <20261027065239.95915-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261022-serial-tegra-dma-uaf-v3-0-129f6d67f673@outlook.com>
References: <20261022-serial-tegra-dma-uaf-v3-0-129f6d67f673@outlook.com>
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

On Thu, Oct 22, 2026 at 05:10:23PM -0400, Austin Schlegel wrote:
> Patch 2 (TX) fixes the same ordering bug in tegra_uart_stop_tx().
> It also fixes tegra_uart_flush_buffer(), which terminated the TX
> channel without clearing tx_in_progress, so a later
> tegra_uart_stop_tx() acked the freed descriptor.
>
> The bugs fixed by patches 2 and 3 were found in review (Sashiko, on v2)
> and have not been reproduced on hardware.
...
> Testing was done on Tegra234 (Jetson AGX Orin) with GPC DMA only. The
> APB DMA driver (Tegra20-Tegra210) recycles descriptors only after they
> are acked; the series keeps every ack but has not been tested there.

Tested on Jetson Nano (Tegra210, 70006040.serial with tegra20-apb-dma)
in TIOCM_LOOP internal loopback mode on v7.3-rc2 (5b0764a53235):

- Unpatched: queuing a 4096-byte TX DMA transfer at 115200 baud and
  calling tcflush(fd, TCOFLUSH) 5 ms later leaves tup->tx_in_progress
  set to TEGRA_UART_TX_DMA. Subsequent write() calls see
  tup->tx_in_progress != 0 in tegra_uart_start_tx() and never start TX
  (0/48 bytes received on loopback, TIOCSER_TEMT == 0).
- With v3 applied: tcflush(fd, TCOFLUSH) during in-flight TX DMA clears
  tx_in_progress and the follow-up write() transmits (48/48 bytes
  received, TIOCSER_TEMT == 1). Twenty rounds of 3 Mbaud loopback
  transfers with mid-transfer TCOFLUSH and port close/reopen completed
  with no warnings.

Tested-by: Karl Mehltretter <kmehltretter@gmail.com>

Thanks,
Karl
