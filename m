Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BA4503BF6;
	Thu,  3 Sep 2026 19:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788464958; cv=none; b=AjSuxtUH1+2WnL6aMihNkAMwOxH7Shfil2e9r0dAdotvuT4F2RmseFqMHeqJj+WcvqdJHeOzGY+8A6ClembovGpaEfCASpeaIQzgck5wmhJnZnKEJeOGfhwcmHGGaUC3KzymerVBPQDFg5EujAN0132zcCw/KtAWrIZsXR/oHfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788464958; c=relaxed/simple;
	bh=sqA3IzvdmDfTtkFBOGCjZOJL3AnE5LtSgLEw2h4nxAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rvM+D1p/WmTw9y2JvsedATW+Yl0DaQVHl2fHBz2Eazy0HHWyQV0NN/u+ugxBBEj8vatV/wFDoQNWVCxhIOj6iKNhzNO6IX7+MlEX2q2114fxL5XALLGU5okvXcltcHpjha6L/1iv38amfiJ31v9CjntumdmstMxhZTkbu+HHTJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ekSUl5Hn; arc=none smtp.client-ip=192.19.166.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ekSUl5Hn"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 86EA4C0000FE;
	Thu,  3 Sep 2026 12:49:07 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 86EA4C0000FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1788464947;
	bh=sqA3IzvdmDfTtkFBOGCjZOJL3AnE5LtSgLEw2h4nxAY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ekSUl5HnVPXej+QtOuAXMlG1c6nygvSMx4gYXdLP2rDhn9DFVrC9ARwIy0NHTPkv1
	 inHniCoQMqb3xKrrogHATIy1R/6vlyjuQe4+5J/t9XhFWtyEG619rcNgGCKXR+lLn0
	 sxrm8tcQB9S75LEYwFxujmiNhxoLc8zC82ARte6g=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 65755A9A;
	Thu,  3 Sep 2026 12:49:07 -0700 (PDT)
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
Subject: Re: [PATCH] ARM: dts: BCM53573: add phy-mode and fixed-link
Date: Thu,  3 Sep 2026 12:49:06 -0700
Message-ID: <20260903194906.2039326-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805190740.8152-1-rosenp@gmail.com>
References: <20260805190740.8152-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Wed,  5 Aug 2026 12:07:40 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> These are needed for CPU ethernet links for switches.
> 
> Fixes dtbs_check warnings:
> 
> switch@1e (brcm,bcm53125): ports:port@5: 'phy-mode' is a required property
> switch@1e (brcm,bcm53125): ports:port@8: 'phy-mode' is a required property
> switch@1e (brcm,bcm53125): ports:port@8: 'oneOf' conditional failed, one must be fixed:
> 
> 'fixed-link' is a required property
> 'phy-handle' is a required property
> 'managed' is a required property
> from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
