Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792424132;
	b=UwPd6Y/JxKrRDeC83DSsMiA544t+ZVOLnJEgPNNN43slZbubjS4FOnO5MxG4TqjsbWvE
	 nENFIfEMgc85Cb4hg8G60OfcZ1fZt54JRztpiaJRxpPLrqLjkVG1jooBdHII1uFjpbcUg
	 lvm/2Nh+9HOIW/wmfF/w1qa7y/RMoV3tZDndxD//2yi+FSeu2JL4xNgM73uu+0Vv4mIe2
	 2dOuve6uBAeecyh/8twQGBt/MtOrQZR+K7Fh9doVtwz3HER4G9Zqh/IMPtzGfRhhndkxR
	 olXNi/KbQ1wACFkYuO6Tlxlg8VB2XPZ/X1zsfxUh1ITZ+aaXrGupziOJQwbLUylvCdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424132;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=pctsoJTIi3PIcREBl4WC4IIZ1RXf5gRECxbUB6cpZoM=;
	b=ukk7t8iIeByximaYe2RGfxPe+zRDuQJDcb6JVbMQSBf31hnu7j/wmOSZ50WkyO5iORSd
	 g+7inWcyKwQSF5qY2mgwsGbAnr1m49cqGwovp+2X+dq62zKzpxbtMVN3P9hf3Yt6wfbN3
	 Pqnll/rl+GiQzsI5Fb/mCO4UhhLCPITTKOW12x2FHSk3F0OV0nKagT9QKByYEgEdh0sxW
	 RWsswouqfHJExoyw/f6Qhfo81SG+O67QzFpOPht+RM7BpJuK5uUtWKHfKh1TNd+QLRPo8
	 0xGi3GftsqYTa7/jlEslJWMvNaijlcfP32fWzDLWnswe3qZVUJYJfRDicXj4BtmaoTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=YYbUVaVN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383586072499
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=YYbUVaVN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C5701F0283C;
	Mon, 19 Oct 2026 15:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1792424130;
	bh=pctsoJTIi3PIcREBl4WC4IIZ1RXf5gRECxbUB6cpZoM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=YYbUVaVNFOS3ikdPPAI0feyllwwC0JAn5J9+vzlGaHw385Cbra4uKCOAehI4fLL8d
	 lHqVkJr9iabcTmrdzSgeBqF6ufaO1VZQSw1fIO7wQjJxWubhEDsZZl+opqfQn0DQtO
	 x5+6ZpH9ghkNIilJ1vs0fiqHzhnyP3e7b78PTCkQ=
Date: Mon, 19 Oct 2026 08:35:29 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Nikola Ciprich <nikola.ciprich@linuxbox.cz>
Cc: Sean Christopherson <seanjc@google.com>, Borislav Petkov <bp@alien8.de>,
 David Laight <david.laight.linux@gmail.com>, Rik van Riel
 <riel@surriel.com>, ljs@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, david@kernel.org, Mike Rapoport
 <rppt@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, Pedro Falcato
 <pfalcato@suse.de>, Kiryl Shutsemau <kas@kernel.org>, luizcap@redhat.com,
 pbonzini@redhat.com, Tal Zussman <tz2294@columbia.edu>, Matt Fleming
 <matt@readmodwrite.com>, Yosry Ahmed <yosry@kernel.org>
Subject: Re: hunting memory corruption bug in 6.18.x
Message-Id: <20261019083529.a81910ac0976c1a5687d4c6a@linux-foundation.org>
In-Reply-To: <atY1vWRBRUwpISKb@pcnci.linuxbox.cz>
References: <aszH4vpXFAOQP1WG@pcnci.linuxbox.cz>
	<20261014235736.GCatAW8GD0GlYumL4l@fat_crate.local>
	<20261015172820.7961d2c0def74d41cc6c4b0c@linux-foundation.org>
	<20261016031242.GDatGWKo98YSOhEOOn@fat_crate.local>
	<20261015211832.45d87fab15bb3e0bbc2f47cb@linux-foundation.org>
	<20261016054954.GEatG7AgMNFRkiTo1H@fat_crate.local>
	<atI_yuCc4BiweBQP@google.com>
	<atT5TYyLapHO5ZoX@pcnci.linuxbox.cz>
	<20261018201538.d0957878f378a9821852836f@linux-foundation.org>
	<atXXma5NXxoSWJO0@pcnci.linuxbox.cz>
	<atY1vWRBRUwpISKb@pcnci.linuxbox.cz>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 19 Oct 2026 17:22:37 +0200 Nikola Ciprich <nikola.ciprich@linuxbox.cz> wrote:

> > 
> > Sure! And I have more good news: after applying 55780d8a1dcc
> > to 6.18.56, I was able to perform more than 30 migrations without
> > a glitch. After booting back into 6.18.56 without it, both VMs
> > crashed within 2-3 migrations. Furthermore, some memory apparently
> > got corrupted on one of the hosts, since various commands started
> > crashing too:
> > 
> > [  303.466091] traps: systemd-logind[3085] trap invalid opcode ip:7f7b5667e616 sp:7ffe1afdec38 error:0 in libsystemd-shared-252.so[7e616,7f7b5666d000+22e000]
> > [  303.493810] traps: systemd-coredum[11269] trap invalid opcode ip:7fc6bf67f614 sp:7ffc075da958 error:0 in libsystemd-shared-252.so[7f614,7fc6bf66d000+22e000]
> > [  377.528955] traps: systemd[5607] trap invalid opcode ip:7f791447e616 sp:7ffe83e61cf8 error:0 in libsystemd-shared-252.so[7e616,7f791446d000+22e000]
> > [  377.556993] traps: systemd-coredum[12080] trap invalid opcode ip:7f97ce07f614 sp:7ffe28b56a88 error:0 in libsystemd-shared-252.so[7f614,7f97ce06d000+22e000]
> > [ 3746.173043] traps: hostnamectl[45846] trap invalid opcode ip:7fe00cc7f614 sp:7fff89916e48 error:0 in libsystemd-shared-252.so[7f614,7fe00cc6d000+22e000]
> > [ 3746.202305] traps: systemd-coredum[45847] trap invalid opcode ip:7f7fe9e7f614 sp:7ffea227cfa8 error:0 in libsystemd-shared-252.so[7f614,7f7fe9e6d000+22e000]
> > [ 3750.581940] traps: systemctl[45903] trap invalid opcode ip:7fbb8967f614 sp:7fff733e5748 error:0 in libsystemd-shared-252.so[7f614,7fbb8966d000+22e000]
> > [ 3750.612651] traps: systemd-coredum[45904] trap invalid opcode ip:7f90d347f614 sp:7ffdc7f55148 error:0 in libsystemd-shared-252.so[7f614,7f90d346d000+22e000]
> > 
> > I'm not sure if this is of any use, but I collected a vmcore of
> > this state by intentionally crashing the host via /proc/sysrq-trigger.
> > 
> > Anyway, I'll give 55780d8a1dcc some more migration rounds, but it looks
> > promising.
> 
> 500+ migrations back and forth, no issues. I consider this solved and am rolling
> out the patched kernel; I’ll report if anything new turns up.

Great, thanks.

oops, we haven't been cc'ing Yosry.

> Definitely a -stable candidate. Andrew, will you send it to Greg, or shall I?

I volunteer Yosry or Sean ;)

I think 55780d8a1dcc should be repackaged before sending over to the
-stable people.  Its changelog is very wrong: "The bug is benign
though".  Update the changelog to explain that the bug is in fact evil.
Otherwise -stable and further downstream won't understand why we sent
it to them and won't understand the impact.

And that repackaging would be an opportunity to add
Reported-by:/Closes:/Tested-by: you, which is the least we can do to
thank you for all this diligent work!

