Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D293655E0
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 07:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788680379; cv=none; b=oE6y15YF8YzTQ0XqGCo/CRDAGPVvu0ATKzJqbkWUEeqtpll2538hYdH3l10KRPnXQWfoPBE08c/I45sv2HNf2Gi6rF9XlwIRilaRpw49QqsbOFo4qo4IGpwNJKFF0Ab1Buk0lTVIPYNsjtNMENtJ/9jmszPGgor/PytQUu1A8Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788680379; c=relaxed/simple;
	bh=QRYVX3ffZ985ovzTkfBf9fkBgICaOYuci40qCtccwWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oCUrNYVyuEgib0GfH0XOlhjcDPBTVfAQirtyC/bHs3eIQkC9rfOpbeOH+rbOsEZa0WRWK7Fa4SUrh43vgIauS4HYO74KQUwf9pPokLbjyM2uxhtOiH0MeLxSw8mjqtnb22jCwZUl77Pt5OchvZ99XQb91xkA+ejAYVo0TZFSPF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sY9VlG7f; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sY9VlG7f"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48441fa5c37so1694528f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 00:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788680375; x=1789285175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xVz5vFNXr4Sxa8HEvEEyMn/a+N7kN8guffUolshGPm0=;
        b=sY9VlG7fPEYM6od1qeC/hbfOH8nWesDdNG2Dz6NV3f00gN0bgKwngGcF5VhIpsGdQ1
         E71fWmZODcYq20jaEFbhnU01qXFQeS4FFhxiVIuyFFUMwjcd2n69m08OHIxzQ/CXv3XF
         YZM7aDIQgDFerKU+GRu0hsAC8g2tA2cy9yEUSxRVr3603NBmIoPZjLlDHNlNzYxIC5Ke
         7LcUQG6h8Aaof+anCUVJ66REkH8K/EqXUoDURkwNo178Ou9JHWVlNaOfhbsSrqTWEJMt
         d1y6StbkzGKWFQALrZ8YkpNsjk7hJYqdjOXU6Pzf/bJZsNr+Z7xkK12SNwNeIJoss/+f
         FO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788680375; x=1789285175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xVz5vFNXr4Sxa8HEvEEyMn/a+N7kN8guffUolshGPm0=;
        b=Lkl2QKOnhp67xT1cIQCzQT7C8FVzqXlpJKNP1cGwNNLeirnbuhD80ci+KlgAtFTp7K
         gg2Yz6ioPcOCiMdPXXC6PoZEJIOk82oMQcZvDydspVWtKf1K0UtpL9/x0OC3AWbzOxJP
         /8+5bs+Kt/fmkGOjE4Xxe3cUfjkaTDmnOQcEWI1x+pBeRfvZf5BGllMVXlcZoY2TLa+H
         WNSnhznRToeRXLXznvyN3wN4th0GWyYzqCl3OVTla1++lYeRqpCdWuKt0CFz3TRmTNlT
         XUPfQ3wzfOFhxxsNXrIGuGwZ+fUiXgEDXdMGxcrzJPG0dF6m6ntsfVwMh403CTfh7gIJ
         9OTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqASZSx7+dpuel3op3uGzDKPvLTRIRlMdtzOvzPDgJA/uYC3KmXerzjjxroGScEL+C3eTtxNVt4vKcw7A=@vger.kernel.org
X-Gm-Message-State: AFuF++kxodqKiBtzYA+45gmpv6lZbNhGQ3bTrnZ6G97CEw1BTavSvk9g
	OYgG4qbC0tMHzIJc7hWvnkMJhDi7koTpr+vT+RmvNfWmtQeTFXtMNuw=
X-Gm-Gg: AYBFou2rGXstNuiHpOc2OIl+PNWrgSzaDO370weyOgi5pT4g950fFgIm3DtW7Ic84N8
	qzC5HBcT90aMgRJz5ouRYbkuveRm1f2cxgL4wpf33utXnGz6YuumKwaeEI48YaTdw93a8hUilk3
	EWH3SAGQZMY56agLDgUZwWC6V+GUL0+1lj9LDmummOQs/ONx8G5DKVmQSXCk8azu3V0Qv46d7hJ
	yfG6e2X+LRdLChkZCsxzDnPYrz8tgz9xLOujOPXU1ykI9lQ4VUKP1TDiYvMGdvlf8btIL7uA6yg
	+gGpHzzDUm20LS8qYSq6iW9gUV/tTUvmR9k8G3bSxH8lhmy8SAp3RPBgcxXyfXVsWkEqaDiZ+s6
	VOh5Aghc2d1YDE/De6s9jpCjZv4UYXIuf/HJ+iFbti4X/PIWkqkhiw1XaKeVusdfw+m/n8AQaME
	/Cvq32zAjdLv2o+PaMhIe1DjY/Ws5FwmcHn2MJtkiQ6fixVuNf3IQNCWgy1AmmQI9pJ3teC4dox
	vzzYpq8hgPqPr+6zcDkMjKjgF+Beq2ObQUUPE5rAVdc
X-Received: by 2002:a05:6000:2508:b0:485:8e8b:7bf4 with SMTP id ffacd0b85a97d-4858e8b7c78mr12129584f8f.33.1788680374997;
        Sun, 06 Sep 2026 00:39:34 -0700 (PDT)
Received: from surface.. (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883a9234sm19580358f8f.14.2026.09.06.00.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 00:39:34 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Fernando Rimoli <fernandorimoli11@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Jakob Berg Jespersen <dev@berg.pm>,
	Fil Dunsky <filipp.dunsky@gmail.com>,
	Kengo Oki <dev.kengo.fugu0141@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"D . Manresa" <dmanresa@gmail.com>
Subject: Re: [PATCH v5 0/7] media: Enable the OV5693 front camera on IPU6 Surface devices
Date: Sun,  6 Sep 2026 09:39:32 +0200
Message-ID: <20260906073932.24090-1-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902142322.73523-1-fernandorimoli11@gmail.com>
References: <20260831181858.325109-1-fernandorimoli11@gmail.com> <20260902142322.73523-1-fernandorimoli11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 2 Sep 2026, Fernando Rimoli wrote:
> This series enables the OV5693 front camera on IPU6 Surface devices

For patches 4-7:

Tested-by: D. Manresa <dmanresa@gmail.com> # Surface Pro 7+, IPU6 TGL 8086:9a19, INT33BE; 4-7 backported to a 6.19 linux-surface tree

Coverage that was still missing from the other reports, all on the same
machine and boot:

- With the downstream unconditional 0x4800 = 0x2d write removed and only
  your gate in place, MIPI_CTRL00 reads 0x20 over i2c mid-stream (bit 5
  only), so the result below is your code path and nothing else.

- The sensor's 2x2 binned 1296x972 readout (a downstream mode, not in
  mainline) streams through the IPU6 hardware ISP (PSYS) at ~28.7 fps: three
  fresh stream starts x 60 frames, all frames unique and non-black, Bayer
  phase unchanged. A raw binned capture straight off the ISYS node had zero
  CSI-2 errors.

- The CSI-2 receiver error signature at stream start/stop (the usual
  "Transfer FIFO overflow" / "Inter-frame packet discarded" bursts) is
  identical to the 0x2d build over the same five capture cycles: 15/15/20 in
  both. Consistent with Fil's sweep - bits 0, 2 and 3 of 0x2d were doing
  nothing.

- Exercised on top of my ipu-bridge rebind series, with the
  "clock-noncontinuous" property name routed through ipu_property_names as
  suggested in my reply to 7/7: PCI remove -> module unload -> rescan ->
  reload re-enumerates all three sensors without -EEXIST and captures
  afterwards. The IR (OV7251) and rear (OV8865) cameras are unaffected before
  and after.

Backport notes, in case they help anyone else on 6.19: 2/7 and the table
hunks of 7/7 need hand placement (no OVTI5675/HIMX1092 entries there), and
5/7 changes the ipu_bridge_init()/ipu_bridge_parse_ssdb() CRCs, so
intel-ipu6 has to be rebuilt alongside ipu-bridge under MODVERSIONS; isys
and psys only import ipu_bridge_instantiate_vcm and are fine.

D. Manresa <dmanresa@gmail.com>
