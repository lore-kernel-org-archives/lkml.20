Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACF33AA9F4
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 06:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791269868; cv=none; b=J3L8Rw0z1nDghY8RsG5hwlxR83m/y63OqaDqVBQtLmqb4FDLwRg07dOq5wSRLe6u9gzEHpou9wwauGNnWrS8UiYJ0v5DwDOZ53TAiy30dGx5+geGtwdz6OHu51kij8hOz0RjNPI8Pw3VsgjA3wtENg1owLE+tcXhFuMNBBTnShQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791269868; c=relaxed/simple;
	bh=p1HoPRS8CIAfVRRUjvqIqOMQnVVNtJm/GrkGkGKWXPc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i/QBl5oZB5QNe8IeEcVHAW6wbYNgptTuoZmWh+DVznW8bcvpo/VggPhdwzO6PCC846c/5OgrWM46tW2wNXlcUl22SlVXo8ItB2eZGsaGKZ10g47U9GKvOgfkN55h7H/ydO/AUzBXcG2gP9fU/okHEko7M2sHapolt6zIu7aRcFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=It5Kzk36; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="It5Kzk36"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48b0584ad71so214271f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 23:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791269864; x=1791874664; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OtORuZkqvUS5rOy7NJ6EXSqmyQO1OiQ+cXTp0n8J780=;
        b=It5Kzk367JS84ylMeha3OjNgkGuKv317T1RJayuGPUIvDnlq0N+bbfF7ROvc/VZ6BB
         mNvUXEsxg9PKt5J/tQVRtbtZwhYEPv7/hsMRXoiAaLZOWF/tW50ldKR48Vty4klCXlUQ
         Kv+/fh4v7V2Z2pL822WQKNSFFbVLYFk4AdvrNHdJxu3XN4eUfClE3VUu26LZIzsZT7r8
         kIEZPloJV2bhMUldearAxtTam3vwB74kx8E9RIPKtqnoSECfSIvOXudBfgdNQ4Zsp+R/
         lf3v1LsQetoHT7R7aF2PYvGNP8GeQfVKcUFXibObefgIHvBi8YsLGmBzzDXc418O6VZh
         ig5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791269864; x=1791874664;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OtORuZkqvUS5rOy7NJ6EXSqmyQO1OiQ+cXTp0n8J780=;
        b=p1huy0L9XlGpG+EiStvLYOKvDcU18LVjpSsLpQqKxJjSIYTCqmYAR5HVH8i5V9d2aw
         GfoaOrmbNv0Wx6BEyxzcBlerTplQxSo6LRRNl2daiUnntgFfGteSsN3f++HkpTfiR5Ju
         jo2lWhzpz2dATKue95blDKnwTv+pmdF1OA+ixp+dM06mWiOYaP/fDpk1C5BwT1jV0w8k
         /OwVE8VjCXO9AcxrGQnJvBwXws8zdiC66Bk7EbwP4gFHNmzcpLP0dRl2hmm5kJD0+Gls
         QaZucUzBHgZY4ZzmnE1hOrC8VgJTj96qb7dtKfQv3FIxRXVDKr64Oaw/NfUxbnaYDSJy
         Lb4w==
X-Forwarded-Encrypted: i=1; AKwUvBxTHnOGdEEZYkLNw+ssazuX0EvN0TcHGcTbx3kKDGUBNbb38hnsyxJs4lYEsFvg8wKvrz9CMKbPyng9x7Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUnIySE8b71hxiKFkZNKL0/Ybt8semIRK/WT9aG+1VXB9vIxMF
	X+q/vQJSUrf1xlAw0HJ1gAq3itwa21SayEvf9fQlQ2oyS3OgSiQ77eyXka4Cf9NBPeg=
X-Gm-Gg: AYBFou0xC8J3RprD7xZulC/GS8Cy9Li7MyEJa32VMoUuWA/sIGdo3FmwtSea128VEWP
	SwtYfebSKt6mzO6AOk/MAZuLNbI7AwDweuiArl9xnoNqLc81/mG/pHdDV+VkU8A4JxQjouiKt4b
	mgbm84KZTIk3eg6h59ggkpubqZu36qzpBoQdhJvEV1sCDzbzAGiJfjpfizFKhm/WxULPhmHtjVk
	ZdOAhFD1gp0CySFFR/LgWu3LOKk1O081C91xaU+vLN3aiqrBB2mltt+xnYq0Om5xqEUn3H7m/61
	ttN6vbJCJSa4WJtmdZk+dsFRjKVQHij701rSFNQ1FQzJ34XX9gsnz5fQG/Qz+eB1kzL/LoNJZTi
	0J2KzXi85QtgMNpO5IvRXEG4Smy+v7cCnTo6OvOdCGIq4PFjwgo9z+7K32xylfMrLNCG+D9HwcX
	IY7B18bs8TW1cYB5xYXbkhuO8SsFBwAhdPkSVLf03NJCfRbXVsT3++8gyIyl2dxLMWZ7R3Y7lS
X-Received: by 2002:a05:6000:26cc:b0:488:83f7:6352 with SMTP id ffacd0b85a97d-48c6d0f4afamr907422f8f.4.1791269864600;
        Mon, 05 Oct 2026 23:57:44 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6cd7c326sm1256039f8f.53.2026.10.05.23.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:57:44 -0700 (PDT)
Date: Tue, 6 Oct 2026 08:57:42 +0200
From: Petr Mladek <pmladek@suse.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Peter Zijlstra <peterz@infradead.org>,
	Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [GIT PULL] printk for 7.3-rc3
Message-ID: <asSb5id17XfYBTyH@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

please pull one fix from

  git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git tags/printk-for-7.3-rc7

================================================================

- Allow using Braille console with a serial console driver converted
  to NBCON API.

================================================================

Note that Braille console is not a classic printk console. It uses
the printk code for registration and the printk callbacks for emitting
messages. But it is not added into console_list. Instead, it is wired
into the VT code and shows the content displayed on the terminal.

The current solution is a kind of hack. John has started working
on converting the Braille console driver to use the serdev API
so that we do not have to deal with NBCON API in the VT context
which is historically under console_lock...

We would like to get this temporary solution into 7.3 so that
the Braille console does not stop working with the newly converted
uart 8250 serial console driver.

----------------------------------------------------------------
Petr Mladek (1):
      braille: nbcon: Allow to use a serial console with NBCON API as Braille console

 drivers/accessibility/braille/braille_console.c | 57 +++++++++++++++++-
 drivers/tty/serial/8250/8250_port.c             |  5 +-
 drivers/tty/serial/amba-pl011.c                 |  2 +-
 drivers/tty/serial/imx.c                        |  2 +-
 drivers/tty/serial/sifive.c                     |  2 +-
 include/linux/console.h                         | 15 +++++
 kernel/printk/nbcon.c                           | 79 +++++++++++++++++++++++++
 7 files changed, 156 insertions(+), 6 deletions(-)
