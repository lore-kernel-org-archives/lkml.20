Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4082C3F0A90
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788342066; cv=none; b=ukdYWV2Ld43lVZhA01Ad2OjG2ojn/WuOTcfUioep6YG5ELOjJr46+uDxATviJqTqNxQ0lslLBOhXPhvJr7Am3QfHzoQDFfecULEzJiK/3pNJgzgokJtWf8BetDUU/+0uow9pVQs35hkOmEFM9yrdQEidXvlfIgVF8KQumDZ4sgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788342066; c=relaxed/simple;
	bh=m7mJPnrxHWOyEZZGuMJyGGgp/l15wF2SNz6afr8E6tg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=R1a8ykb15NTSHy68IBz6Ho9NqJqNJFLf4eyxawMkvKJQFriMUkGeu0Axu5XfRWdcKKQJY3t6Krh4ENc454ZqiyLlpbuqp06LPLc1qwfYCxio21u1QMsJk0PHuUeWYgM81DYXesno0o3UrqDpKWHeIG80YM3hT+T1NF5FziuZGoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qZXcziPr; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qZXcziPr"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 330D61A1943;
	Wed,  2 Sep 2026 09:41:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 049BA6053C;
	Wed,  2 Sep 2026 09:41:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C243511C79300;
	Wed,  2 Sep 2026 11:40:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788342056; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=m7mJPnrxHWOyEZZGuMJyGGgp/l15wF2SNz6afr8E6tg=;
	b=qZXcziPri/qyXRlJMCEfoWrjGc5w9g+hB+AwwFPIU/WkUwKG1WKlt1YcKvvOZPXE/A1+ke
	S4OI9PB3yMMSuVk+NGjiCSN1AUArS34abkJVf1vvjrKNVmpfci2zpAsOtFtKM91IBoM652
	OQkQErdlp6JhP5LNXyS8f5eKYELa/eJxHCX594cHgP+RoAjMm1NFlyZpwobHgB0oH1N0hF
	p4LhuReLSiJlxJQff66Y9MFBXQdKn/1Z3FpZCv/lMwfOrGBRrwjqXjlFcQb0koe00C1mq9
	5/b2C6mAZjG697ZlTMUJKeiVuGiXvOwNQsq8Z78foUHu6RZ7HEVBb5uIUE0ecQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexey Charkov <alchark@flipper.net>
Cc: Srinivas Kandagatla <srini@kernel.org>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Heiko Stuebner <heiko@sntech.de>,  Michael Walle
 <michael@walle.cc>,  Finley Xiao <finley.xiao@rock-chips.com>,  Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-rockchip@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/4] nvmem: layouts: Add Rockchip OTP CPUID layout driver
In-Reply-To: <20260901-rk3576-otp-cpuid-mac-v1-3-ea9135270fc2@flipper.net>
	(Alexey Charkov's message of "Tue, 01 Sep 2026 19:33:13 +0400")
References: <20260901-rk3576-otp-cpuid-mac-v1-0-ea9135270fc2@flipper.net>
	<20260901-rk3576-otp-cpuid-mac-v1-3-ea9135270fc2@flipper.net>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 02 Sep 2026 11:40:52 +0200
Message-ID: <878q5k7zyz.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

On 01/09/2026 at 19:33:13 +04, Alexey Charkov <alchark@flipper.net> wrote:

> Rockchip SoCs customarily use the CPU ID programmed into their on-chip OTP
> memory to derive stable Ethernet MAC addresses even when a board doesn't
> otherwise have dedicated storage for those. The derivation depends on the
> particular bootloader implementation (e.g. it is done by upstream U-Boot,
> which patches the derived MAC addresses at runtime into the device tree it
> hands to the kernel). Using less featureful bootloaders, such as direct
> boot to Linux from SPL, leaves the kernel with only a random MAC address
> instead, even though everything required for the derivation is equally
> available to Linux as it is to U-Boot.
>
> Reproduce the same derivation in the kernel and expose the result as an
> nvmem cell named "mac-address", so that of_get_mac_address() picks it up
> through its standard nvmem fallback. The address index comes from the DT
> phandle argument, which lets both interfaces of a dual Ethernet board
> share a single cell.
>
> Enable the layout by default on Rockchip, as consumers of its cells would
> otherwise defer their probe indefinitely.
>
> Signed-off-by: Alexey Charkov <alchark@flipper.net>

Quick review on my side, looks good to me.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
