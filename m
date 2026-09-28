Received: from relay.smtp-ext.broadcom.com (lpdvsmtp10.broadcom.com [192.19.144.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393B538D3F9;
	Mon, 28 Sep 2026 18:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790620090; cv=none; b=W0ILJAxDoAQBLOP/vSY5Cnz4kWaQdHQKFFJ42OS+SWS2S35Z96hGgloP9Q3DF0LhOchJ7qO5OFVb/XEetGFumHKXm4NmtLkEcH9N7RHvFnvKDP7dtY9na18evP6/687pz1lhnpI/yrMethdtlWGSZRaROvVfVR5JxwBOdGzUQC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790620090; c=relaxed/simple;
	bh=UVPMZhvqMrthXlyLMMQxYdzI0vXhxPmHZ965qly+dGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i2EyUda9EGXVZIJTDUPZyem32aMld/iaoawXgnq+rJYuYrpOonn1xUlFCN4+hywBrlEz+bG5txqiuPowYsXvan3cp5Lu1Gs/w9/jQMZkcS/ZgeTZMtg98kR5NYuq0RCOn9l2BMxt2qIdy2wowZHeRxoj+W7IPb0T+FeD+jeR8tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Fn748EIJ; arc=none smtp.client-ip=192.19.144.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Fn748EIJ"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id F2EDCC0000F8;
	Mon, 28 Sep 2026 11:28:07 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com F2EDCC0000F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1790620088;
	bh=UVPMZhvqMrthXlyLMMQxYdzI0vXhxPmHZ965qly+dGU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fn748EIJiEDh2Xy/473H5+Q+w4en7SVO4XkIF1OIDtnfyxqklAhVjjvc2HWkL4eQP
	 Yx8bJTV6RuU1eG+SlvhDKSrvM9Jl6tuQp7drUEyIJ10moNchhJxvu9Z546O9e5c4aC
	 kwvEf3zHvgrgEM0gALM27U4vGe2KGR4ss3BB2wO8=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 95C99ACC;
	Mon, 28 Sep 2026 11:28:07 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Rosen Penev <rosenp@gmail.com>,
	devicetree@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	"moderated list:BROADCOM IPROC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: broadcom: rename pl330 DMA nodes to dma-controller
Date: Mon, 28 Sep 2026 11:28:07 -0700
Message-ID: <20260928182807.1269041-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921015634.1044454-1-rosenp@gmail.com>
References: <20260921015634.1044454-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Sun, 20 Sep 2026 18:56:34 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> Each PL330 device node in the Cygnus, HR2, and Northstar Plus dtsi files
> was named dma or dma@<addr>, which does not follow the generic
> recommended node name for DMA controllers (dma-controller).
> 
> Rename them accordingly. The phandle labels (dma0/dma) are preserved,
> so existing references via &dma keep working.
> 
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
