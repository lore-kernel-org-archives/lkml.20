Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793043510;
	b=eFXlEG4g2hH+QxGrexS93dY/aAFGnaViyOyw2o9uWQ3btqTbI/WlF+SXmkJ3JyQg502X
	 09XNr6pevw6BxnEafe94ohDWXtJ2kWpJ127og16AB/kgeGUOZkw4cRB5VdTls4dnIDjf8
	 CCMrhSgsZc+pli6aO/ly5W9Qk9OdFcT44RbMGfceYuS4lXeV7UvVUaaq8VKeuiXMOjw1H
	 CjEEMdFsBaU9DZjpabbhZLXB8C/CfzialToQJ2wOthNeN8XjWlE1xMub9RqmfNmmYmA7Q
	 vGaux/PfEfXcMhfsDS44U0s7TiGXhEDxS2dprHH+heN/UDAd1KD/24S3zgKv6nlXXMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793043510;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=dSxMcvCi50FStr9NIPYVVCpZkXKm+Vd8EruufX/uBTA=;
	b=kqop7hRx6wu+3uDIGJDNPsiNvUJ8saRPfjVUB1E8r8+G6OscxuN+iq6lDnX7QtnaB9bw
	 E2gl1xdCpWnzSkSw8RoLtzXk1WRWtOLaAOVfxq+Edr3VMYem5NWthoR/+f7ys4Rn+szMh
	 gu4aFEjRoESJMTGKPSLFr9cuBaAZCh1OHO8dEk3PA+rlw+/wYcIwsl47MyKpDoGMwLkdh
	 r+zmiJe0Qa8CZCmaBglUVxI4gvWY2HlYYm3dhxb7Pg41rq5bPwYkHZydt9PcvveYpoIPA
	 uHkrrElwWAYbE4dv88at6hufrIEXodQHKkJIP80fBU7w7OO5xs0yGl7ZoLhJjxGhupw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vofSMuHZ;
	arc=none smtp.remote-ip=95.215.58.21
Received: from mta1.migadu.com (out-21.mta1.migadu.com [95.215.58.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AD4606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:38:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16AD4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vofSMuHZ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=526XwKCaV8g60Tmvkvy/WpLSza7NhvA7cZDq6upGYME=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793043502; v=1; x=1793648302;
 b=vofSMuHZLbjx9qTH9SNM1w2Zab5XIucse9pgKZemcKrgdkKtpBKUyJrgG6ieWP3uTxRkqN0b
 NGQpNVcTfIu3emPnDje2GiN8sAuTUVYJWJigmEVgDuxscBQOYipPE2POBcth1JHdvawHAlnY+ly
 WHp93Rd19ELTrYSoPJyl3GsQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f858b6db7119bcd9;
	Mon, 26 Oct 2026 19:38:22 +0000
X-Mizu-Trace-ID: f858b6db7119bcd9
X-Migadu-Flow: FLOW_OUT
Message-ID: <ca5e15e8-5ef4-431e-91bb-198a00d6942f@linux.dev>
Date: Mon, 26 Oct 2026 20:38:20 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 12/18] HID: asus: size feature reports from the HID
 report descriptor
To: =?UTF-8?Q?Rebecca_Mara_M=C3=BCller?= <rebecca.mara@posteo.de>
Cc: Paolo Pisati <p.pisati@gmail.com>, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 kernel@lists.opengamingcollective.org,
 Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 "Luke D . Jones" <luke@ljones.dev>,
 Mateusz Schwartz <matthew.schwartz@linux.dev>,
 Denis Benato <benato.denis96@gmail.com>, Jonathan LoBue
 <jlobue10@gmail.com>, Khamunetri Clark <khamunetriclark@gmail.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 Joshua Leivenzon <hacker1024@users.sourceforge.net>,
 Nathan Chancellor <nathan@kernel.org>, Ivan Levchenko <me@livan.pro>,
 Corentin Chary <corentin.chary@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20261025235232.129945-13-denis.benato@linux.dev>
 <20261026130606.212382-1-rebecca.mara@posteo.de>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20261026130606.212382-1-rebecca.mara@posteo.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 10/26/26 14:06, Rebecca Mara Müller wrote:
> Hi Denis,
>
> in the cover letter you asked Paolo and me to try asus_report_len() on
> the Zenbook Duo. It works there, and it covers what Paolo's v4 5/7
> ("Do not send feature reports larger than declared") was written for.

Hi Rebecca,

Yeah I felt like putting an end about that whole class of bugs
while also unifying some core code across devices was the right
move.

I apologize for making things a bit more complicated (and perhaps
adding delay) but I feel like this is the right thing to do for everyone.

> Setup: hid.git for-next (hid-asus.c f6aa1be09ad5, the base of your
> 01/18), your patches 01-12, then Paolo's v4 1-4 and 6-7, leaving out
> 5/7. I stopped at 12 because 16/17 change asus-wmi and asus-armoury,
> which I cannot swap on this kernel. Paolo's 4/7 needed a trivial
> manual fixup (include context and the enum hunk); 6/7 and 7/7 applied
> cleanly. Built out-of-tree against a 7.2.6-based distribution kernel,
> UX8407AA, with my userspace workaround stopped.

Those asus-wmi changes are for the old non-thunderbolt XG mobile:
you don't have that hardware connector anyway and no more laptops
will be made with it so not a problem, I have this hardware and can
confirm it kept working (albeit sashiko-bot spotted an issue that I couldn't
with just my nvidia).

> - Docked (USB, 0b05:1cd7), captured with usbmon while reloading the
>   module and pressing the backlight key: every feature report goes to
>   interface 4 as report 0x5a with wLength 16, zero-padded. That is the
>   handshake SET and its GET read-back, the 0x05 function query and its
>   GET, the initial brightness, and two brightness changes. All
>   transfers completed with status 0. The backlight key and Fn+F
>   (platform profile) work.
> - Bluetooth (0b05:1cd8): the backlight key and Fn+F work, no errors
>   in the log. This is where, as described in 5/7, the 64 byte writes
>   used to fail with -EIO.
> - After docking again: backlight and Fn+F still work, and the input
>   devices keep their hid-generic names.
>
> So from my side 5/7 can be dropped in favour of this patch, and Paolo
> can rebase the remaining Zenbook Duo patches on top of it.
>
> Tested-by: Rebecca Mara Müller <rebecca.mara@posteo.de> # UX8407AA

Splendid! Thank you very much! With this tested, a ROG ally, an
ASUS touchpad and a 2022 TUF tested this should improve the
driver for at least 90% of supported devices!

> Thanks,
> Rebecca
