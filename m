Received: from relay.smtp-ext.broadcom.com (lpdvsmtp10.broadcom.com [192.19.144.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB4A3CD8D4;
	Fri,  4 Sep 2026 22:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788560852; cv=none; b=Z/pomS6c/UiXtASRz30EReFuJThME/LCW9d/cS5GLaNz2mVv5fHviFIG0sVNqGyFWWKm+YqsrS0hItWRjoVpIcDvpKFhRf53tn0Rvf6u34GZdBXIh0LNZ65dzUpANxWp9LSOeydOFle58XeMKegTahlkCxy3luCHWK2/ydKHvgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788560852; c=relaxed/simple;
	bh=EJhdUrXD00ZbYc4XnfZ7oS7rGZrbaRH6yr75sgQ/3o8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RzEaE7wFdf56AncifPBkzzQ0/0knG9GRs1Rq25Vmgh38q2JJFbCxiEwJlFJ/MIo96bPIFbwPCXRuWysRN6tGWUkgYkhcoKYDadtGoOPubFwTfSrNvVQ5nn5U/Jr0PQRxY9YjTSHdU6VoXLl4mzyTpCOhMagZ8yhXhpVNLfvyCJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=hfOrBTOP; arc=none smtp.client-ip=192.19.144.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="hfOrBTOP"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 46FF1C0005C4;
	Fri,  4 Sep 2026 15:27:29 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 46FF1C0005C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1788560849;
	bh=EJhdUrXD00ZbYc4XnfZ7oS7rGZrbaRH6yr75sgQ/3o8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hfOrBTOPT/4YSNAX6QhTJ2MH4v60PJ9s5fmK5IzyvFqWNRqgJINuit6DpsW+QMI0C
	 rc1ZSYwXg8mwimWOKSTxdFhbx5WBb7BZzGTg+m8tbQrB1Kd9h7n+vIU1YW2TWuTdRb
	 CiDYZ/hH7Nzjst4Z1jYwHuVrTyM5kWrPtiSOX0D8=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id C8498A9A;
	Fri,  4 Sep 2026 15:27:28 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: dts: broadcom: bcm2712-rpi-5-b: add spi0 interface
Date: Fri,  4 Sep 2026 15:27:28 -0700
Message-ID: <20260904222728.105465-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904-bcm2712-spi-v2-1-6f8fdfb030bc@linutronix.de>
References: <20260904-bcm2712-spi-v2-1-6f8fdfb030bc@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Fri, 04 Sep 2026 11:24:24 +0200, Gregor Herburger <gregor.herburger@linutronix.de> wrote:
> The Raspberry Pi 5 routes the spi0 of the rp1 chip to the pin header.
> Add the rp1_spi0 node and its pinctrl node to the devicetree to enable
> the spi interface.
> 
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian
