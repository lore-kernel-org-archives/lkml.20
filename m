Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19655451984;
	Wed, 26 Aug 2026 16:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787760609; cv=none; b=Ebs8Kw+VqSlDTwqQNX7QrhwMdRvZTm/ys0Kh3+SKpLAKc2dwZDNJEEeVO5gOM3yhL0kaykVlcz6eHUu6t9x99/llLDX7LXcJYqc50GQYPJcN3gk8lwWq50HavG34KgH8l45FfTn6xaJwMlzUSS3x25js8QOBhD22BTyryy0olb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787760609; c=relaxed/simple;
	bh=TP9qkrRDB0qUqwmZfvlYztv1Z+2k10k5weAcLNcIR64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j6KfVb70UzfeQaIHQLT82TVOzWm0ef/bKqednHCWGezUnec7Kq0YJGQAgR2TF+TkzDyq7uN0e1VLsL2x3HtQ1FGrEkEu2gzEoStUx0thLp8eN1umbwm46BcF5Jy0E06EBvSOBthPCCgOZZuHPwcirLbQmGkjDaA8LjawxpHQ78I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=JWRzC/GQ; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="JWRzC/GQ"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A624440E020E;
	Wed, 26 Aug 2026 16:10:01 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 4LqSw-YMp4RX; Wed, 26 Aug 2026 16:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1787760591; bh=acgUmIjwUp37f9C6UHtd1NXCPV3P5eB/7427Zs1hn9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JWRzC/GQffUPUCy04EN2xyNjhAYs+YSkVGv/DAUHHF5WGl90vBXA6dJeQSwNLQx4s
	 s5Z4kLDiyrUbrUVYfvhXSBQaFfKAUav0m4sIvsVN+NAKi/fzcSmZKAnJjkQh1IE1fy
	 Kc5+Lr1pQtT2V8Cp8zpBUPwToYpAZ/N8AbebkUI37DJJs6LnZV9QEeuYfzE0GNo0+2
	 bKB7VqMTvTtBfiXq1YoPYcCgPr3kLMh5zsfV3KTpXJaMbiQo5uzaKKMTTFJtMIVF63
	 PhMXt8pMeRwLywwpgsHGQIcE3Om1k/Z/P5G78xY2a4YTL1NAI5zC5E7IUsCXD1VBy1
	 S+mG5uJqKAQW4fJUv7pRsAZ821bCPb3VJvajDZytEnloIGxGa0jW4+z0FZD8prXhsk
	 aP7gOb3FKBba0EOxA2nOCITpdadr+ddQVK4VveZLanJe/NmHBtnl1jmSaCv5+daRol
	 l9VA6yNPv15nGAyERzeATaYgbi7oKXT1hOZgTPRz+tnnDw7AMI9qwwyJg7XhAaq0Qv
	 tG3wERE5zEK237cJw/AnUp2+QpQYWn6pkFiI46l76KSKH5FGPFApRlv147tr4juOra
	 tkv2E78Wtx2t2xIkBUaEVhrjtVbAOEIzDN8DS2WRmPlkyXpFT4a/tVs2rBSQ4lKP1O
	 4oB6LcRRacK8moiotCn7Ay1E=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2B4BC40E020F;
	Wed, 26 Aug 2026 16:09:36 +0000 (UTC)
Date: Wed, 26 Aug 2026 09:09:34 -0700
From: Borislav Petkov <bp@alien8.de>
To: Breno Leitao <leitao@debian.org>
Cc: "Luck, Tony" <tony.luck@intel.com>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"kernel-team@meta.com" <kernel-team@meta.com>
Subject: Re: [PATCH 2/2] x86/mce: Add mce=panic_on_ce_count to panic on a
 corrected error flood
Message-ID: <20260826160934.GBao8PvsM8M-U7XuFR@fat_crate.local>
References: <aoxxxmM-xIpyAE_Z@agluck-desk3>
 <aoynhOsTCcapwRbl@agluck-desk3>
 <ao2eT0TWS9EaA28N@gmail.com>
 <SJ1PR11MB60837D32B5D89336C87280A3FCAF2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260825161625.GAao2_2d3U7xQFgHrw@fat_crate.local>
 <SJ1PR11MB60839657B965AC3FDA53C186FCAF2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260825191555.GCao3p63v3fXzwa7E7@fat_crate.local>
 <SJ1PR11MB608315809B99B7194D167D8EFCAF2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260825225202.GEao4ckknyv8nRc8Dh@fat_crate.local>
 <ao7nGM9sCQyxJvsD@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ao7nGM9sCQyxJvsD@gmail.com>

On Wed, Aug 26, 2026 at 06:22:27AM -0700, Breno Leitao wrote:
> In other words, I'm more interested in flagging that a host is a lemon
> than in keeping it limping along half-alive, thus my approach in this
> patchset.

This is your use case but I'm sure others would prefer the limping and
gracefully saving work the system has done until now...

Putting my user hat on:

+               Panic once a machine check bank has logged this many corrected
+               errors. 0, the default, disables it.
+
+               The setting is global rather than per-CPU, and it is compared
+               against a running total kept per CPU and per bank. Lowering it
+               below a total a bank has already reached takes the machine
+               down on that bank's next corrected error.

Ah, so how many CEs is "many"?

I have read that correctable errors do not have any effect on the system and
they can keep happening and do not influence execution.

So what do I put there? I don't know... hmm.

... Dropping user hat. Putting devil's advocate hat...

How many CEs do you put in your kernels?

Does the same number fit any machine and platform?

Or you simply say, after X CEs, we simply panic the machine - instead of
gracefully powering it off after leaving a helpful message in dmesg - and have
lab technicians inspect it?

Hmmm.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
