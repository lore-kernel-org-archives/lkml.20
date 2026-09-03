Received: from relay.smtp-ext.broadcom.com (lpdvsmtp10.broadcom.com [192.19.144.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE953FF1B7;
	Thu,  3 Sep 2026 19:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788465266; cv=none; b=aUIwY5doVor/KcFL0TJN6BEhibN4rtgtP/pKojmAJ1Lx3d3zG8Gdo8KWFozxF4ecDtPzQOaAOplyO8iKnZGOfYuBwmLz7pUzxdO2kln5jpdKTb7ICPVlGuqT7K+18JX5092T86Trv8Xp+Nh/QwO6uX3xN4CxIfsvNVQ8c16Cpnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788465266; c=relaxed/simple;
	bh=5ywL+AjbqduBPI70f+35daeMhjjmOPDHuxP9jp+8fRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XopbgPnD6jIIhB2quwHaK7D3VSYMU5CE3t62EaKL0V4rvan2TJlAhq2uyLtqB3u786rSaCkQ9RtJr8ShXDgHxTgnfpZeCo7Fy12cZMMziIkvTKa1HNNAskJJNvxOM3ZLwWwYi+YZOyMhhCAxNqEfQ0WIDp6M/PSy8C1AtgZimu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=wNlMycB3; arc=none smtp.client-ip=192.19.144.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="wNlMycB3"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id BA814C0003D4;
	Thu,  3 Sep 2026 12:54:13 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com BA814C0003D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1788465253;
	bh=5ywL+AjbqduBPI70f+35daeMhjjmOPDHuxP9jp+8fRk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wNlMycB36Ai1OrwMD/ANDaWaMr/1zObPuven9GeU64hX3flJv9gwyNaXk9vsNwBnl
	 HmSLMzglOg9pEpPEQe015TJBII9DYDykLWyQ896m7MH6epHC0HqQ+Xg7mPa4ij7S+j
	 +sSjLn5dW4EpkwAIVdk/DmzeSgoyiOEheviHtaqo=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 5DA06A9A;
	Thu,  3 Sep 2026 12:54:13 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Rosen Penev <rosenp@gmail.com>,
	devicetree@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <rafal@milecki.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"moderated list:BROADCOM BCM53573 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: BCM53573: Rename mpcore node to mpcore-bus
Date: Thu,  3 Sep 2026 12:54:12 -0700
Message-ID: <20260903195412.2040463-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806003703.5141-1-rosenp@gmail.com>
References: <20260806003703.5141-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Wed,  5 Aug 2026 17:37:03 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> The 'mpcore' node name does not match the simple-bus node name pattern
> '^([a-z][a-z0-9\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'.
> Rename to 'mpcore-bus' to match the pattern, consistent with the
> naming used in bcm-nsp.dtsi and bcm-ns.dtsi.
> 
> Assisted-by: OpenCode:Big-Pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
