Received: from relay.smtp-ext.broadcom.com (lpdvsmtp12.broadcom.com [192.19.144.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148A151118F;
	Thu,  3 Sep 2026 20:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788465888; cv=none; b=iE2MLHGCJ5LCiov6gtj5TdNkOLDvFq1wZGNtD2iHwNcdh0xnJJbp4kCLfIjXov20XGjDgyvE+yD4AWaoUS0DPHftri/phNPDnfjRoJBRxXk6dBwGDxLI3kLTgFBf2AQ7dlNCR26Y8IA+od0qRQ87rK3NQRt/UXC9YN0xa1s/bdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788465888; c=relaxed/simple;
	bh=3y7n9zGFhvv+h/PR5gozbr1TAGtRRuth6oAg6boeVCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hcBnojf9QJeVS6MMB2CIoQx3Zqgm65LG3i0Ce9ViRxuphs+Y6h8L3kcFtLDoV+vvESuDtWlqXlxqQmWTfVWv1njYS72nZFKXK2uOJKfLpoiER0A0eMTxRfW0+DkSl3B+gV79j5a+a5RousmcEN5PXnv92/NqMQBCUuTjL17oOhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=OA5l7yJi; arc=none smtp.client-ip=192.19.144.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="OA5l7yJi"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 755B0C0000F8;
	Thu,  3 Sep 2026 13:04:29 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 755B0C0000F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1788465869;
	bh=3y7n9zGFhvv+h/PR5gozbr1TAGtRRuth6oAg6boeVCk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OA5l7yJiZCpIFOA+Lp9PfMst0InYBfjOoQUvX0w7Ptzu+6fz2gFWkxskuLuVhNL0L
	 NjwbO5fg1mBujF4YXPHPqMw3jjLd8HEX1FwD0TD34Oe6faBh8Z9y4vyq1Mo4FUUTjp
	 xfWVdSEv39eRoVh4/k+CRdQmBJMtiIDZNSF+4MIY=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 158D7A9A;
	Thu,  3 Sep 2026 13:04:29 -0700 (PDT)
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
Subject: Re: [PATCH] ARM: dts: BCM5301X: EA9200: add LAN WMAC
Date: Thu,  3 Sep 2026 13:04:28 -0700
Message-ID: <20260903200428.2042690-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805190640.7957-1-rosenp@gmail.com>
References: <20260805190640.7957-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Wed,  5 Aug 2026 12:06:40 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> Make it clear what the MAC is relative to the others, which already have
> nvmem definitions.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
