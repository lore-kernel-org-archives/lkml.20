Received: from relay.smtp-ext.broadcom.com (lpdvsmtp12.broadcom.com [192.19.144.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F773CC330;
	Thu,  3 Sep 2026 19:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788465358; cv=none; b=O5j2UfCT40RdXX8haY9pTUqChq1S0l7GuXVlaF0NjRwzJy6icABU04wJ4c/Icvx596HJoGqqs44PWyisKaVjpoTNwsNnswzLKVxgyYxgVzFUABVaBcbEx2xR1/vf0w+kse9AuY0sNKqWm65ieV03AhFWXO/jS37Z7jhxyKNzk4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788465358; c=relaxed/simple;
	bh=+Y7LcAXasqCLrxXPAcBhJn6rf7lf3GRbJ/5cPb/kUSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OvvYa1wVP7iHlckqktuMAW+7jz0OXHUdfryOyuulyndYDpflJdu6A5ikpm5mRZRc2rqugkDCb76StjAOfFLCgcxLZqOucV4o8/rtbgwnNIu2A1FIb+oME7G3kCJprFpLnaeYuBL7p9N9B63XFsPLIjyDOFygy51brqNIhvzIMZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=DON0eii9; arc=none smtp.client-ip=192.19.144.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="DON0eii9"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id B201DC0000F8;
	Thu,  3 Sep 2026 12:55:39 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com B201DC0000F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1788465339;
	bh=+Y7LcAXasqCLrxXPAcBhJn6rf7lf3GRbJ/5cPb/kUSQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DON0eii9hT72AJdLxhuaexdN6G15x5NoGxVZQGu37MV2oQ1fVPQNY+DxPWr6oV6iv
	 Mx8lsUQ/U49vt6H9Y8rRgj53fGJHcS/lnMAsqZ7/fZ6wvPhctJOEUws0WMkB8/TtWc
	 pp7Gtsvh8eeirFrmBaoiWW+hnrTSrDuquDJv3rUA=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 58989A9A;
	Thu,  3 Sep 2026 12:55:39 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Rosen Penev <rosenp@gmail.com>,
	devicetree@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"moderated list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: BCM5301X: panamera: remove reset-names
Date: Thu,  3 Sep 2026 12:55:39 -0700
Message-ID: <20260903195539.2040848-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805190846.8312-1-rosenp@gmail.com>
References: <20260805190846.8312-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Wed,  5 Aug 2026 12:08:46 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> reset-gpios does not use a name for GPIO acquisition. Fixes dtbs_check
> warning:
> 
> switch@0 (brcm,bcm53125): 'resets' is a dependency of 'reset-names'
> from schema $id: http://devicetree.org/schemas/reset/reset.yaml
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
