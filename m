Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396575226AF
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790067391; cv=none; b=GWM+SZgj9xuRZ9NhsY8/+n6n2/bc0Dob6Thm0xIOQhooKR19MVeHq/5y5q4FwB7CBWP2NkZ5NxXvz+qYxmLdy1Hy1eHl9G1wv//vDyl7GfvFLJxwB+Q4lHwdNGZs7RBRvdiEmb4UC9LDvqDCutCsQ0A1+o9m5A9eKtTynzSThYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790067391; c=relaxed/simple;
	bh=Wq2LoFmFiObS5jB4OwtPqD7h4w1zA3ahilWAP6xrcps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pc+DD6BbIaxXAg23XpK2YN6LFincnzjytiAtrvHi3MjOgdibxu8AJo6k8PqgfCWHFWPppIt0a8UNl2ILFngxcc8TPnGhR5SNjr2U6Iyedc1BwCROueDfJHxsTSNVpihcG8eYztqEZHfn1PzmwCX/SL7O5/DXos5Gpf8twsUs6wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=allKK4MF; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="allKK4MF"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482e1b55da8so21751f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790067388; x=1790672188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wq2LoFmFiObS5jB4OwtPqD7h4w1zA3ahilWAP6xrcps=;
        b=allKK4MFXfHCNnpVTBQvate5U7k/Exvzgerz1rx8tuSHJuTPMqlKU+FIu/2m3pB48Q
         nW8TX0wvUdUE867mSD0TyKqT91kVVXyQ/3fmrMa7sbPAlPC06VWFCCAWZrnVF683iADv
         TBfPu63EaQCFK++htIYG1dx3IorOch0k6w0GpACBECgOnRpSqt60RNmBdkSPGr03E1vC
         UuNvPu5/7CAmkrQHcBv47p7EneGPxo3vMkRjzyyq1lx+f+XqALQXzjsx00KF1GHVq21w
         9yJMobxZxgUJ3P/PiVClhuS7onNN8PX8fBLtrLG5Py78BPSCpn3B6uVFvJVnrEH5MaRX
         IPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790067388; x=1790672188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wq2LoFmFiObS5jB4OwtPqD7h4w1zA3ahilWAP6xrcps=;
        b=OaTViqYeFaZHqFQJBU1PzdFoNqGgxUEXbT9kevifcR/bf6Z2VpyZQqiBurmYvn3VjP
         byRxC871Eh5zJ8HTv8Q6+3XGYLhHqMkM3d+nHvkaLGpScFbNf00GNyD8wbSWkFRyFOF1
         gUBjCFnAgA93YtxI4Lv83drbyalTndx6z0EZHdwvI37OrCAdqfquAs3Usv9vhFxuHNLC
         RxQxjOwYpkbPIVXQc6SbxH7Dy+NBhD7Yoyy83lPnuPvEklHAeKjzkCX8F0C2nBBhD7oO
         GsiY6G68OYn2i0Y3aUzRBj7v2v/wuROkJydTyRjYh9/g6nO6hIakcB3hK3cjsN+H3699
         T94w==
X-Forwarded-Encrypted: i=1; AKwUvBxeQno1no52B9nXAMBPXswk8ay3m/h1ghzEORZaQq2lHakGhqH4nvKdd4RMn4MNYZYmHkwnHTwdcRqUhDw=@vger.kernel.org
X-Gm-Message-State: AFuF++n4MVu0st+l4FQE7AxiqSO2PP1X9MxtTpAqr92FjvltoyYmUUaW
	2zZsDh8J+j3bYSTonDuu+jNfIb6T/XnwfaDsjCmd5Aj81oI4OwiZhjF5
X-Gm-Gg: AYBFou1uwD8YYcljFYItS7v41ZK2VjakLAa5mSRg13hPar+A7Wmby3ZLCmIun6YwiKD
	qfFDkQtdGukeSF5Xe3koNQlIN9C4G+xeupi+xzH9tM4plz3JxNMOyTizt3fJ1wJE8LbENtAg75k
	Bufh7a3hrbCcFHT2DfD0GkPs5VAGv6etPwoBketqRgV2kuIpBA83jm+/kH0pE1YPXzi1UHrZlM1
	lxmxxZbATR6eVYt1yw1LwG3YgxJ6Kz1lldQyyE/EpJRzeY523p0dPWN6lNtLM3eSDU/8FvPgg+Q
	Bs/gjY+ZP//hMw+ypsvGrzuitlU7Si54d9dj6nrqzmWG5VSDzLdMOriwXfwL8UgpgGOTpg+c70c
	ftAmF5a+Jf05gR+MLbstso9mBiVsxRAonq8HMupWI54gsyNd0hBP8/Eoa8NX9ssb6wUi8zM3QjC
	dXE/TWkVje3i1spT5bvhm49f39HbBarxT4Cqr4c7VAY9CkQwvJdiQc1Ab7iCpEU1UQefoRd86IH
	7xLyfxEcs0Usx9GZHZTy3JgwqRXKMaPmwDQ+R6njRKPYn/iNGZE/xRHZXkOrH1cM/HOoPQ9L+ps
	mxM=
X-Received: by 2002:a5d:64c5:0:b0:485:ac0a:e11 with SMTP id ffacd0b85a97d-4871f9c6776mr18336406f8f.0.1790067388322;
        Tue, 22 Sep 2026 01:56:28 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B80530056971C6280202175.dsl.pool.telekom.hu. [2001:4c4e:1b80:5300:5697:1c62:8020:2175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886279298asm2881848f8f.34.2026.09.22.01.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:56:27 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	=?UTF-8?q?H=C3=BCseyin=20BIYIK?= <boogiepop@gmx.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/11] accel/rocket: add devfreq support
Date: Tue, 22 Sep 2026 10:56:17 +0200
Message-ID: <20260922085617.53620-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922081855.160451F00893@smtp.kernel.org>
References: <20260922080114.44662-1-royalnet026@gmail.com> <20260922080114.44662-10-royalnet026@gmail.com> <20260922081855.160451F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the five findings from the Sashiko review of this patch, in its
order. All of this is from reading the code; none of it was reproduced.

1. Cores left powered after unbind: not with the driver's own settings.
rocket_core_fini(), which this series does not change, calls
pm_runtime_dont_use_autosuspend() before pm_runtime_disable(); that
runs rpm_idle() synchronously and suspends the core on the spot. It
can happen if root sets power/autosuspend_delay_ms to 0 and unbinds a
core with the clock raised: the put then queues an asynchronous suspend
that pm_runtime_disable() can cancel. v3 will drop those references
synchronously on the teardown path.

2. Ignored return value: true, but here an error does not leave the
clock raised. Scaling down, the OPP core sets the clock before the
supply, so a regulator error comes after clk_set_rate() has already
asked for the 200 MHz boot rate, which TF-A serves from GPLL, and a rate
the firmware refuses never reaches the caller. v3 will say so in a
comment at both call sites.

3. Rounding the boot rate up: not with the in-tree devicetree, where
assigned-clock-rates gives exactly the lowest OPP. Without it, a boot
rate above 200 MHz would map to a PVTPLL OPP and the cores would be
released there; that is the code-read-only case under "Not done". v3
will create the devfreq device only when the boot rate is at or below
the lowest OPP (without assigned-clock-rates this firmware reports
198 MHz, GPLL/6).

4. Restore racing with rocket_devfreq_fini(): real, and this patch
introduces it. device_shutdown() pins only the core it shuts down, and
__device_release_driver() drops its runtime PM reference before
->remove(), so the last core to go idle can reach
rocket_npu_restore_boot_rate() from its autosuspend timer while
rocket_devfreq_fini() clears ->owner and removes the OPP table and
config. The window is a few microseconds and none of my runs set it up.
v3 will take pm_runtime_get_noresume() and pm_runtime_barrier() on
every core before ->owner is cleared, and drop them afterwards.

5. Concurrent unbinds: real. Each sysfs unbind takes only its own
device lock, so two unbinds can both remove the same devfreq device.
The unlocked probe and remove predate this series (Sashiko's finding on
the standalone slot-search patch, which I agreed with [1] and the cover
letter lists as open), but this patch makes the result worse. The OPP
table is not freed twice. v3 will add a driver-wide mutex around
rocket_probe(), rocket_remove() and rocket_shutdown().

I will wait for review of v2 before sending v3.

[1] https://lore.kernel.org/r/20260904135938.8757-1-royalnet026@gmail.com

Igor
