Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74A2A4BEE25
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789164399; cv=none; b=r+ITx1KAjITLAP6w17qBSrPswnSoO7opH9kTjxc4k55tfLwP1YbOsV8pQryxvXfQg4h/rQFs3N/ZF5jyb7R0xaChP+k15Da79RHZ5TLge3X4wdZkRE9V35cF1/FIDplNUbiz4BTqnmTMo9IY4UE7Pmy6/IuQ5VX4/Y1ej6MRYGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789164399; c=relaxed/simple;
	bh=QfmiSG1WNXdPQTUBmk7di0RFlVWN/duAEE6OzJ0NA00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jcPFDOP0w2zuNlFukW5daogtNj0W07+dgze4Th3XIsyER/s8QRKeRuFAY1Muty64Xd3mq8aX2CoGNhtzjJ6r2fRgIBdlrIPKuNOPSb4PRFlhckAlnJS9h4P6nGUeUZUZ28eeBoR5YV1ynUUzKyyeW/N7JP3l63yfLxefgGG5OWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=gPfOnRfZ; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="gPfOnRfZ"
Received: by linux.microsoft.com (Postfix, from userid 1223)
	id 77CBE20B7166; Fri, 11 Sep 2026 15:05:56 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 77CBE20B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1789164356;
	bh=QfmiSG1WNXdPQTUBmk7di0RFlVWN/duAEE6OzJ0NA00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gPfOnRfZAYQ295IrYtL6HCccKUA9Ojc+i341UL7OjmY0dtpSXiBq8da9GrrWzq/F1
	 ZMTttVsdlmytiqI/Er9opXjW6TOrIikVwQ8qu8MjqKOuhd9DSb9IEypdE3RwnzTojd
	 27rGqQHNvQK1/jfQBCp/mwEXRM0lenBAOuOYvbus=
Date: Fri, 11 Sep 2026 15:05:56 -0700
From: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
To: Sam Agazaryan <samagazaryan@google.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Vitor Soares <vitor.soares@toradex.com>,
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>,
	linux-kernel@vger.kernel.org, tgopinath@linux.microsoft.com,
	boris.brezillon@collabora.com
Subject: Re: [PATCH v4 3/3] i3c: add i3cdev module to expose i3c dev in /dev
Message-ID: <20260911-d0e2d97df458cbf24fa42089@linux.microsoft.com>
References: <20260906202747.4041389-1-samagazaryan@google.com>
 <20260906202747.4041389-4-samagazaryan@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906202747.4041389-4-samagazaryan@google.com>

FYI, I have an alternative design option that's worth reviewing:
https://lore.kernel.org/linux-i3c/20260911210935.1353126-1-meaganlloyd@linux.microsoft.com/T/#mcec3e06c911d331d5cd2b2d0a7f7169b5f9f044b

It follows in the direction Boris was going in the 2020 thread:
https://lore.kernel.org/linux-i3c/20200222093844.2f5ed538@collabora.com/

The alternate binding solution is:

If i3cdev match id table is empty, the generic i3cdev driver can't bind
during the auto-loading that happens on boot. This means we won't step
on the toes of more specialized drivers. Once user-space sets
driver_override sysfs knob to 'i3cdev' and binds the device to i3cdev,
it behaves the same as any other typical driver model-based driver. We
can also use udev rules to automate setting the driver_override & doing
the bind for any i3c devices found by the core.

My series also implements actual_len in the controller drivers and uses
it as an output for user-space to consume for reads. It also accounts for
maintaining compatibility if i3cdev_xfer struct expands for HDR modes.

- Meagan
