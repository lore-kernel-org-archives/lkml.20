Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794260962;
	b=0RN8oOBJD9pZLbp0RbXs1cIO1aze+D2GATuvVPt/OtU+/gtRls7IF9G+h7gwuTAY/E0u
	 LigZL+rg/1Siv8S8koH9sQkI6IbYedwVEoLl7ZOSYtabmmMIRonCo5g+L9rwuWcVTPvhe
	 23pJOmPdLW5BUKR/yHidFCPrttDp2EG/zrG2cYvwGTYqBs5Za4wby/+VemQwT9XdEPX49
	 UwWOEErxqY5ive8mTjncUGTb6TPtGvjmBeXtBNLtlJb1Jdru4yAaSlt9Bw7DUZl0M1uoy
	 aMt40e+PEpVxARRxi51xBphsAdgwFRtjC/BYqMB9Cx4ZEK9pZKSfhLMq0tieeBGJ1cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794260962;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=uEtW3s1zbnVOX6jpNNZBXvC+gKkgYk8Ew3vUQCdNNbw=;
	b=ZCaO+X7hqPiL4xmsMGANXUoDv8hPcay5DrqIR3LxAsc/0UuECkuZwuFsLwHWAfx8y+Nf
	 ST0Mbc78cWmVqIybjfba0A+IcYvqlz4HEyzHLKRwq9xF5h7xmv2SA2wlylwVyqje3AtSF
	 7MUO2tA7/C8B2dQQS55uxg8KUYiAUXUb0Bh54EO9ej/+ANAq27+aUT6PzxrYgQCIWmP4B
	 RgPWCLPnrD40R+Z+b48FIXtxICHlvN+9NPomQj/kPibwcqy5u2S6XXbYIuThhav9jDbYt
	 xEh0oifnTLHBZzB/NooqzspaCK4OAWWQFDFs05XBYzQ4zuu33cTSV3EA4dG1YfCgz+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=IGe1N7zY;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E9B606A326;
	Mon,  9 Nov 2026 21:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52E9B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=IGe1N7zY
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 41D7240E01E1;
	Mon,  9 Nov 2026 21:49:19 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id QWiQBMqmt_GI; Mon,  9 Nov 2026 21:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1794260956; bh=uEtW3s1zbnVOX6jpNNZBXvC+gKkgYk8Ew3vUQCdNNbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IGe1N7zYxyxFFH7+MzP3GiEm4eT69oXK4IwZ1MWc0BbMe44ywyBr8M93gecB4SQtS
	 jTP5LY1NDFa4N+iMgCQZvtH3go1V+RpQLL+dP3yW0z0DgJvEQek97tmK5V7go5bRGP
	 VF1yCNm3qDjVRQY68UbghRWNYWgAZxdS+w9a2ONoBrnj/lr8hL8usjKIYgh7/nV78Z
	 88dP3UQUVNyQ3/WNOKa9hqZ6Z/zBgkjRr3/HCrb8/tJH+gi9z7zRvAMZdoVI30BVMT
	 jUO3tbM3NvMyEhiImnh9wmpBiyJiB38IbCHpISWjIueQY/RM7SMehGbqM0h19Xoc5J
	 FRjMwX5PHGkHw315BXf/zvZLjOLHxwLFuPBpLKweDSfEO5FtXWWqioWNmBQWl6MNcL
	 fw0fGYn1o4eB3SeBs14GCtOtb9QL0Js51bhssUA4I9nbCcQHWSvQEtQxK36qoW8W4b
	 Mmbd6TUdBjfLU6VRdXZaij/+Ipl02gpuW2dVsIGBZaM/GfBSxs36St2sN8r4uJtvqm
	 IFpwvY8TTDmDZqCivQy97+JlmWsRutuhpRmkfaHHbWo8cVThPk7ryOkN8CjzN7owfS
	 QZBaWoWiKopiDlswGW2BzPztwKxrNAQdmMoe5lmOMzG4aXV9kWvo+RDjAwjbsMtfMf
	 sosS86IPIVU0ARDT/NDuAgcw=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id AD70A40E0184;
	Mon,  9 Nov 2026 21:49:03 +0000 (UTC)
Date: Mon, 9 Nov 2026 13:49:00 -0800
From: Borislav Petkov <bp@alien8.de>
To: Rik van Riel <riel@surriel.com>
Cc: "Luck, Tony" <tony.luck@intel.com>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kernel-team@meta.com" <kernel-team@meta.com>,
	Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH] x86/mce: Restore rate limit on MCE logged message
Message-ID: <20261109214900.GEavI_zEdfTeiCFKLg@fat_crate.local>
References: <20261108143751.3af49e48@fangorn>
 <20261108202820.GCavDbZJgmwKqysH4X@fat_crate.local>
 <CH8PR11MB4034331B3E52AF39AA9C003E68FC732@CH8PR11MB403433.namprd11.prod.outlook.com>
 <20261109195216.GBavIkcPlh-HcT_7JW@fat_crate.local>
 <63ed91b49db00d7a601b8ae1625571ee0c46ffca.camel@surriel.com>
 <20261109212305.GDavI5uXK066CxHoNA@fat_crate.local>
 <a799adc77dc325f5e3cd9f806dae684f198efd38.camel@surriel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a799adc77dc325f5e3cd9f806dae684f198efd38.camel@surriel.com>

On Mon, Nov 09, 2026 at 04:29:32PM -0500, Rik van Riel wrote:
> I do not know how exactly memory errors are getting
> collected. There are some tools that watch netcons,
> some that collect data on the host, and some that
> grab data off the BMC. I have no idea which of
> those paths the memory error collection uses.

It probably doesn't matter for the problem at hand - I guess we should
ratelimit that printk after all...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
