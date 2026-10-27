Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793119422;
	b=KhdSINgNuibpl5s/LnY1VWpqzIFLgU+kuA2cz24dyGreWUV2uAi2PjKi9nL1Sp4+SAgk
	 kzhZK+PqQMubKX2Sz53FeCK1wAxl/2/v4+K9ksvy26QhQJZTzKFAtWUad4bHY3aedd/jA
	 QczIe6NNcl8Pgz6jjRX5vvlEOup04kURzvcvYCzwW7phZXHiF0a3x+lrJ9z6rjh0s8UPe
	 cry9XLTwdY5TcVGIuFbtklRJgkNHUinlqdb0mnN7UsLIwRdRDkKhzwNC/R4KGw3z8E/hC
	 bfMi9g1RpXC208RVeqgfwGOCZkvsMYZ9DWp+KRzK8UjqDSsMkhh2Po8Alw2ddKPYWVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119422;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=6qHl/cMD0A9vT0H/NX5XdRQrkTfmJRWAduf7KDATGLY=;
	b=f/1JWq9hM4ayIAZUbWMHjV3qSa7F4xSkLix2iYoYRvhFT1LnerpGrllhqu6konQhfGJ+
	 s5kW4KRUn6OcV4+zf3F54gTzi2ANVORWG2rfIUbDQTqESnzj579MvZJKMWrHDIxLoNHIy
	 63nd7SKwAn+ADb/P+ikp5Y5yl/BaE9LB+kFaVPPXWbN4441a8eJSM941zVmzfhw4z5Nhq
	 uVSGQUspLmIW2CS18uGvYCM92m0cI0MlCZQffPL8Uv4X0w/2vxYVEeTX9Nfeyld/DI18c
	 90Tjfr6zmzniMRAZkD6ucEi/DYmnYmqYLsqaGw2pza64zWyI4D6956ExZhR22bkDPlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b="GmhFnPC/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E183606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=GmhFnPC/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A31741F031E0;
	Tue, 27 Oct 2026 16:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793119422;
	bh=6qHl/cMD0A9vT0H/NX5XdRQrkTfmJRWAduf7KDATGLY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GmhFnPC/2oPwWVlFa6JpjLAPR1Ja8vwOxdmtREQ0BsdbE2J0ChpfceserjVYOof1+
	 NyqxBvlnMzuJ78ICGSe2t1VrTOyjXm5OvhKoLmxxRdMzz7K1lRO8YIjYtMHSMvfjNQ
	 KjNU0dkbEltf1+wRB3+fGNcwvPHpvX7yNQYcRSCY=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 27 Oct 2026 17:43:31 +0100
Subject: [PATCH 4/5] comedi: ni_tio: Fix overflow of the clock period
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-llm-char-misc-comedi-v1-4-1899771ee15b@linuxfoundation.org>
References: <20261027-llm-char-misc-comedi-v1-0-1899771ee15b@linuxfoundation.org>
In-Reply-To: <20261027-llm-char-misc-comedi-v1-0-1899771ee15b@linuxfoundation.org>
To: Ian Abbott <abbotti@mev.co.uk>, 
 H Hartley Sweeten <hsweeten@visionengravers.com>, 
 Frank Mori Hess <fmhess@users.sourceforge.net>
Cc: Josef Bacik <josef@toxicpanda.com>, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable <stable@kernel.org>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=1629;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=cxcw7FQaT/ugBX0xey6h0pFcUZjYx9elASJcZQ2H+DY=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPrmzkPF1558PyxAjmfVdslmjf4A/yLM/dZHGtYfXX/
 XcPnZ2c0BHLwiDIxCArpsjyZRvP0f0VhxS9DG1Pw8xhZQIZwsDFKQAT4Z7EsKBn1qL+YFX+ZZG3
 9GeKb/hQceKr/gmG+T57+D0W3/f5yFnxscTKcUrFtadVTQA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

From: Josef Bacik <josef@toxicpanda.com>

ni_tio_set_clock_src() stores the period of the clock source, which the
user passes in nanoseconds, in picoseconds:

	counter->clock_period_ps = period_ns * 1000;

period_ns is an unsigned int, so that the product is computed in 32
bits, although clock_period_ps is a u64. It wraps for periods above
4294967 ns, that is for external clocks slower than 233 Hz.
INSN_CONFIG_GET_CLOCK_SRC then reports a wrong period, and
ni_tio_set_sync_mode() decides on a wrong one: 4294968 ns become 704 ps,
which is below the limit of 25 ns under which the alternate
synchronization mode for fast clocks is switched on.

The multiplication was done in 64 bits until the constant
pico_per_nano, a uint64_t, was replaced by a literal. Widen again.

Fixes: 3e90b1c7ebe9 ("staging: comedi: ni_tio: tidy up ni_tio_set_clock_src() and helpers")
Cc: stable <stable@kernel.org>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/comedi/drivers/ni_tio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/comedi/drivers/ni_tio.c b/drivers/comedi/drivers/ni_tio.c
index c3a909abcfa7..b7ab70f34275 100644
--- a/drivers/comedi/drivers/ni_tio.c
+++ b/drivers/comedi/drivers/ni_tio.c
@@ -800,7 +800,7 @@ static int ni_tio_set_clock_src(struct ni_gpct *counter,
 				GI_PRESCALE_X2(counter_dev->variant) |
 				GI_PRESCALE_X8(counter_dev->variant), bits);
 	}
-	counter->clock_period_ps = period_ns * 1000;
+	counter->clock_period_ps = (u64)period_ns * 1000;
 	ni_tio_set_sync_mode(counter);
 	return 0;
 }

-- 
2.56.0

