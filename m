Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679CE400DFC
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790333877; cv=none; b=gRAR/QndOQIvDTWcpGFN4iTe9Qr6FxS1MrNDrb8UxSDr3P9bp0n6DO0GQt+ZCX7HZ4EqmkICZmmJkmUKMus15epYTNRiS5rknyv7A8CjWNyAHjWpJ+IwcB1mV44Hhahnhm9F0lEBIqmiEj5EgtqE2aZjTww80JtloiQWbyUjd/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790333877; c=relaxed/simple;
	bh=XZxo+WADsr42hu/WwcEvLMNMXV8qU7PpguPLDEp9b50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQv6a/1cZHgVeMwYl782WDcBc/fquIc0RTzuGnG3SyDrnAecc6IQ32tp00tFluqFTVP71C0eQ1yD5xf1PabXEdU+KncDzhJ+PODpH7W/k6yVO18XXYXE5+ue+mR6MI5K/SWWpadNinJ2/4lxD6LmWVPC1yWdrwfaVh6ySfMEjto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=VzyewI3y; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="VzyewI3y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=anZU
	1KfXBrg0LBONVfZO0pF5ldmszDBWgaPcW+jObfg=; b=VzyewI3yGO86fam5WTld
	zvvz7ZZwnlYyWWaEVbLJY0SXay3FtSQG0IXNkSishLxmBPdBnZxcjwmIqHxGA3H5
	qpXD/AqBCejFa2WMaKB6chS5k2bGIAAADbdKXrQdFp3IRQnghM5qlxb43sHfU767
	QywHCw+cmThFPTcAWqyoxlAZO0Pj4VXCxJdo8hTan5crYNkNweu3zE9oIgbWC+TA
	kb6FO//YmBehA2iNiswLAWa/OKB+R5gfXrR8frTNOhqbBUy8iDTgxWTDqKOY+bpH
	E2XpS10vdMoyhpOO6GdfJOA4MYh0YowWFxMt+/NaN8CPPVv0DCLzgkE8N02/I6FM
	gw==
Received: (qmail 1529304 invoked from network); 25 Sep 2026 12:57:42 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2026 12:57:42 +0200
X-UD-Smtp-Session: l3s3148p1@r6HilUxcJoIujnvn
Date: Fri, 25 Sep 2026 12:57:42 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Sam Agazaryan <samagazaryan@google.com>, linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Meagan Lloyd <meaganlloyd@linux.microsoft.com>,
	Vitor Soares <vitor.soares@toradex.com>,
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/5] i3c: add i3cdev module to expose i3c dev in /dev
Message-ID: <arZTphXbVF5wagy2@shikoro>
References: <20260921230603.2518652-1-samagazaryan@google.com>
 <arY6DfVf_9tZ_TCu@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arY6DfVf_9tZ_TCu@black.igk.intel.com>

Hi Andy,

> And you need to gather the opinion of Wolfram as well.

Dunno if I can help here. When it comes to driver development, a dev
interface is surely useful but can stay in some debug corner. However,
cover letter says:

>> Userspace access to I3C targets is needed for devices that do not have a
>> kernel driver bound to them, such as targets in ROM/bootloader recovery
>> mode (e.g., OCP Secure Firmware Recovery v1.1 and Caliptra Silicon Root of
>> Trust recovery flows), as well as hardware bring-up and diagnostics.

I don't know anything about these recovery mechanisms and their needs. I
might have time to look into I3C things after all the conferences in
Prague, but no promises...

Happy hacking,

   Wolfram

