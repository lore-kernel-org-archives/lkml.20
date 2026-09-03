Received: from relay.smtp-ext.broadcom.com (lpdvsmtp11.broadcom.com [192.19.166.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3450B50AC0C;
	Thu,  3 Sep 2026 19:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788464798; cv=none; b=doFwKTt3KYoEvgpUw+uw9EI3WWHrAKmJOuy/iyjuEdjJB2SFNRHJwq0YItKWk1IvnggK/9NGEVmU8ZzjvqPbQt04UhcswBWzfECb/nJDnDFZX3GUKn4P14eHx14Dqtj+xL1mwvxxDyOYkqaJ9nBwj1S/A0DHkxxdB/OEpZ8XF30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788464798; c=relaxed/simple;
	bh=uHPojPE8uTxvqYvxf0QC0QEyxmavZ55R5St8vUJd738=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sdk6qGEUZBOXX7RkqeV+BIxYwSZlPnEqW17/SUWhYEKCI+uNTiBTbPxHQhEIQVfg8Jg0BTHzwrkqQotlD144QNPqEsnmGE4HZOi3tPwE1SJ1aT3R2kri6izbFnPIyf+rDv8nYt8JkR866id1KDA5DG60HIz3Q3qc4jtVVhmO4uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=DYJiow2a; arc=none smtp.client-ip=192.19.166.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="DYJiow2a"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 26FE6C0000CE;
	Thu,  3 Sep 2026 12:46:25 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 26FE6C0000CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1788464785;
	bh=uHPojPE8uTxvqYvxf0QC0QEyxmavZ55R5St8vUJd738=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DYJiow2a2l+9RsOFaChDDgM6xkZ81TXgn+If9Khu3VsCKsn2TnpQc9+B4jdBgWd2M
	 Tgu77ma8xqj7KCByeJ4HkdUegP+CDyl/e0RqxES75o+3S2KiTu6L5ZNYIPbeeKBOvw
	 peiuXtjL3gOzB7YvImv7aOBvDWYs2flbbT+WXk+o=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id EF1A0A9A;
	Thu,  3 Sep 2026 12:46:24 -0700 (PDT)
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
Subject: Re: [PATCH 1/2] arm64: dts: broadcom: rp1: add spi controller
Date: Thu,  3 Sep 2026 12:46:24 -0700
Message-ID: <20260903194624.2038562-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811-bcm2712-spi-v1-1-4c1708d354bb@linutronix.de>
References: <20260811-bcm2712-spi-v1-0-4c1708d354bb@linutronix.de> <20260811-bcm2712-spi-v1-1-4c1708d354bb@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Tue, 11 Aug 2026 18:04:15 +0200, Gregor Herburger <gregor.herburger@linutronix.de> wrote:
> The rp1 processor found on the Raspberry Pi 5 has nine Synchronous
> Serial Interfaces.
> 
> Add the relevant nodes to the devicetree.
> 
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian
