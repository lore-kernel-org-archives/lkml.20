Received: from relay.smtp-ext.broadcom.com (lpdvsmtp09.broadcom.com [192.19.166.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABC84A5ED0;
	Thu,  3 Sep 2026 19:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788464783; cv=none; b=XEnlgXTorrKZ2LPTKYbunbgDBx5xYJoVr7IFtuwkBathaUhqrOiz53nvhADB5soY3QmutITpsPR4gLYR/rqWGmmp3XkxWSEnxm+WWKFOMKAHJGNg+63iwcTajxVlsUde6bhW1+3nD9ncG7fTHxPgp+aWCP8rdiq0qb/jwHcS0eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788464783; c=relaxed/simple;
	bh=+URqbLxuDKgSD6CyxEGLNYWoSOkrCtwhEz54gzj0VZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OC+yWb/rnb0VttxltPl1wfzvxh/avc71Jnk46S4pivfV9BLfNvInBNbDmYKl1FLXLOq0m91y0j26FeCRaesaquQkBzpu0PMY6nrResxclkg7y7dMXHqterBf7vvLEwJFvqvY097x0324FZBQihUyYQNQPKOIgbGDEHp1yQHWZC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=rhV2MIW8; arc=none smtp.client-ip=192.19.166.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="rhV2MIW8"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 1A475C0000FE;
	Thu,  3 Sep 2026 12:46:08 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 1A475C0000FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1788464768;
	bh=+URqbLxuDKgSD6CyxEGLNYWoSOkrCtwhEz54gzj0VZ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rhV2MIW8RqQnlBJxUwjzAcRDiwg9h/WHeA413q1L6MIdnWTvMjolddE6aFVqhXOKK
	 AtXwFPX/aWJmoAIRoqWLE7mI3SbtTJNrUMSHlV3z5gxd9MJ+6vDxwh4SwddIQlv2Ia
	 N3945bn/2PsDqBw36uvE9o24pgcM5+1impPI1INM=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id E39C1A9A;
	Thu,  3 Sep 2026 12:46:07 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Eric Anholt <eric@anholt.net>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arm64: dts: broadcom: bcm2712-d-rpi-5-b: add compatible
Date: Thu,  3 Sep 2026 12:46:07 -0700
Message-ID: <20260903194607.2038438-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810-bcm2712-d-stepping-compatible-v4-2-73f74479539c@linutronix.de>
References: <20260810-bcm2712-d-stepping-compatible-v4-0-73f74479539c@linutronix.de> <20260810-bcm2712-d-stepping-compatible-v4-2-73f74479539c@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Mon, 10 Aug 2026 13:46:34 +0200, Gregor Herburger <gregor.herburger@linutronix.de> wrote:
> The bcm2712 found on the Raspberry Pi 5 is available in the d Stepping
> and in a c Stepping. There are two separate dts files. The
> bcm2712-rpi-5-b.dts for the c Stepping and the bcm2712-d-rpi-5-b.dts for
> the d Stepping. The d stepping does not set its own compatible/model
> string but uses "raspberrypi,5-model-b" through its include.
> 
> These two steppings are not compatible. Booting with the wrong dtb file
> causes a crash at boot.
> 
> Add a compatibles string "raspberrypi,5-model-b-d0" together with a
> "bcm2712-d0" string to allow us to distinguish between those two
> steppings.
> 
> Fixes: 44839e2ac8ec ("arm64: dts: broadcom: Add DT for D-step version of BCM2712")
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian
