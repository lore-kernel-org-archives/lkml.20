Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379896;
	b=XD1OY5eigk6Kg2TH1M1FoClUK92tHdBIGA9dWVwS7Y94tDHbSl8ZKnCipBIzj0YOOdJB
	 KmL3yCsTDDURdAQyK3yMtiR+OtIV1p5RSASmSfmE16RK2ZGnQyL6Ntzqb5i+gkuRU4MRX
	 Tl3dnR+7vP8CXKBrdZro/KrMIOoGAZWQy+NRGV8lZvVqPPHKYCH6Y5Y5SJay0dgCuY9RM
	 OTIqHoaxryiT5Xr1J0oYMChaICpc1hBuqqY298a+5wiz+CG8VCgiwCtUPAduxprAUnzZ+
	 Ky1QY/ujUA7CQKm4vvvBrne1Qm0bTrvACpFrl+dv5BLh3W885qTTE0R65hg0OpP617Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379896;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=12tionjgIiAV9o/5U68BGKUEiAZOBBaWcoJagzDPBhk=;
	b=BZvOVl8kfmsi35P3iADTM9NO+5d1qYDbcE5HyH3jh0NPR0ARfzTPCfXYj3OWDfAsO4A/
	 r6ZRS2f/dHiO5Up1kj0YvIv2gnW3UMOYWntaKp6TCmGNFcfA71uUE86FOloovpId7DvCL
	 ZGOVSX2vfbnSrA1zg9sPiLEJPIlua4z1EAi61YFrYSrmSsDjVfP/0hauZyU3Mp49l2tV4
	 /j0K71ZvK4V/XtvqDm/22fnAeSjDoYnTediE6OY18OgDfgpK9sM4FNedALrVBGz6sWi0B
	 tmkanHz6qv/nFrBdV3eB10czcRU4bgqRCiOvqqGgcAL1I2yMWDvl+/wNeIyz+yK8EeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="MrybWNW/";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="0b+/WYgg";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838B8606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 838B8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=MrybWNW/;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=0b+/WYgg
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793379887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=12tionjgIiAV9o/5U68BGKUEiAZOBBaWcoJagzDPBhk=;
	b=MrybWNW/HmmnuPVrhw4iRyvRU1/yjXw93JNZJFKpcTTi3yAHi2LZSzGtyKpTDExuwg6ZrS
	jANrJTZYf64Apr0GqNYwP0UNNPkj2Q1qhRy7NY5OrrYRBo+vJ6rvPNoE9Tt6QfuL6HebQK
	AA7nwufQUX5RjcvLrAYckbFy4gIQTTH9NreMCapLedZEmlE1UIGumz0hqZaeLoiJySU6eY
	Ib87QNUjid0hZFL0J4pxHQUgJAWqYCu8bOXWPS4Ya2kcyyy4TDVVpQPcyPp8Tz15/Bwh+N
	EBrY5wDejMm/Ear/F/TeiW3Zudta8DqNfMtRwUIQ1QMqnEV0ztbMVO/UaSzUBA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793379887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=12tionjgIiAV9o/5U68BGKUEiAZOBBaWcoJagzDPBhk=;
	b=0b+/WYggKUWYUEY4pNBdURUmQx3ppCRsbYsVG7Elu5x6qDSV8JQRnVc0f9SCXQJF2yNrbQ
	7a4IS9wC8Ed3U2AA==
To: Chris Down <chris@chrisdown.name>, Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Marcos Paulo de Souza <mpdesouza@suse.com>, Naveen
 Kumar Chaudhary <naveen.osdev@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 09/16] printk: Allow to override options via the
 command line
In-Reply-To: <auLyEcr_gqE3CBBi@chrisdown.name>
References: <20260929120546.328616-1-pmladek@suse.com>
 <20260929120546.328616-10-pmladek@suse.com>
 <auLyEcr_gqE3CBBi@chrisdown.name>
Date: Fri, 30 Oct 2026 18:10:47 +0106
Message-ID: <871p97i0gg.fsf@jogness.linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On 2026-10-29, Chris Down <chris@chrisdown.name> wrote:
>>Consoles can be preferred either via the console= command line parameter
>>or by some platform specific code, e.g. SPCR, device tree.
>
> On v4 I recall you said you would probably do the change in a separate series. 
> I think that is still the better plan: the rest of the series is a clean-up and 
> it would be nice to keep it that way.
>
>>-	 * Historically, the preferred options are stored only by the first
>>-	 * caller who prefers the particular console.
>>+	 * Allow to override options via the command line but always
>>+	 * prefer the Braille variant.
>> 	 */
>>-	if (is_new_entry) {
>>+	if (is_new_entry || brl_options ||
>>+	    (user_specified && !is_braille_console_preferred(pc))) {
>
> This also clears options when the later console= has none, which v4 did not do. 
> That breaks at least the MIPS boards that pass the firmware baud rate from 
> setup_arch():
>
>     arch/mips/sgi-ip22/ip22-setup.c: add_preferred_console("ttyS", n, dbaud)
>     arch/mips/sgi-ip32/ip32-setup.c: add_preferred_console("ttyS", n, dbaud)
>     arch/mips/sni/setup.c:           add_preferred_console("ttyS"/"ttySC", port, baud)
>
> With "console=ttyS0" and no options, the drivers there (ip22zilog, 8250, 
> sccnxp) fall back to 9600, and anyone with the firmware set to another rate is 
> gonna have a bad time.
>
> It also makes a bare "console=uart" after an SPCR "uart" entry oops because 
> univ8250_console_match() hands the now-NULL options to uart_parse_earlycon().
>
> (A bare console=uart on its own already oopses in the base, so that part is an 
> older 8250 problem, but this patch adds a fun new way to get there.)
>
> If you want to keep it here, could it at least only override when the command 
> line actually provides options?

Agreed. It should be (user_specified && options && ...)

A console specified with no options should not be interpretted as "clear
options" but rather "not overriding options, just specifying that it is
preferred".

John
