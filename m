Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B76E4C8C5D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 18:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789498161; cv=none; b=papOegnpUMEpHl0xQs1yK0nu7A4H/28M45YsDek8R6YaZxLwP81j62NmLIQr4Zhyhg8wqyFR3dJoOpXrx64t0kT4bAKrywW8VaOZBejgoqFNo2hOX3M90wcr2pvuj34eyQvRhREpvhplJpF+m/q0UghXVbDr/eXmXiM+lZS3m04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789498161; c=relaxed/simple;
	bh=ugEJQZfUcFB9Z1ppGrrGNA/h0d+Oe9ECQn7OlEh4UJk=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=pU6R3l7jzs1ElHhvb8xGmMrzUwxRXsTkFplgq4MjK8YuB91zrTyWiCjwu8zgNq/LkgFYta5831mRajSdgMK5ckpsFUzJDJS+ien+SwgMrOv2dXaSEGskycORjW/Zi9zMuKtxVorN1X1XoJ6k1nHwcUCrJSv47EA/d1DW/GVeMeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=WAippb4K; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=bTMUs5Ks; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="WAippb4K";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="bTMUs5Ks"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1789498158; bh=3uFvKDttfTO/QIy3fowni5A
	OOiAjFU9+DL4MDPMZxTg=; b=WAippb4Kk+ZCUx9VPq7yiEhfegB2ezNugH4e3i9H0f5J+6Kkx3
	DkySYeLOPfot8yYrfq2bj/lUTE8dfNf4yYY13BQ1xedoSGB/aeuxIsY5P6sXk+7qS+TT7Ju0HJA
	luTbJWgCaAMUuIaUvcL8VizV+wZt87QYEwhQY3xPFhaHeskOwgYa6JFQPQ/F0d+LHxqoAalxVmj
	F2C56jvfPzyJr0M/VQLJbpHQueZRz6IJ2/6fq1Y/MkYMYsYmpN7bb8+G6ZYwezoIGI83ZUoaXPn
	u37p8Cj7HahC4OgNNGwfD3I3oaxAtA6n3t/21pr/uuN36wX1uegRXuqVqbiosjXcGpw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1789498158; bh=3uFvKDttfTO/QIy3fowni5A
	OOiAjFU9+DL4MDPMZxTg=; b=bTMUs5KsB9MJJ5J54vCQ5D+hLUUykgpoccOkVhuMXjFk63kzHK
	/QmGTZu0REbDwSl+FZXX7Ceteq2OOnJB/IDg==;
Date: Tue, 15 Sep 2026 19:49:16 +0100
From: Bradley Morgan <brads@mainlining.org>
To: ryan.roberts@arm.com
CC: akpm@linux-foundation.org, john.ogness@linutronix.de,
 linux-kernel@vger.kernel.org, pmladek@suse.com, rioo.tsukatsukii@gmail.com,
 rostedt@goodmis.org, senozhatsky@chromium.org
Subject: Re: [RFC PATCH v1] panic: Flush unsafe consoles before panic reboot
In-Reply-To: <2710a283-aee2-495b-b941-3868f4461d6e@arm.com>
Message-ID: <490C65F0-0ABA-4139-A1C4-086BD2CD1D8A@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

Hey, I think thisll conflict with the arch_do_panic() patch (b45d6e4b3580)

Once you rebase. I'd reckon the
change shrinks to just moving the panic_timeout != 0 block below
nbcon_atomic_flush_unsafe().

On your RFC question, whether the current behavior is deliberate: I
don't think it is. nbcon_atomic_flush_unsafe() was placed at the end of
vpanic() by 5dde3b735413 as a final attempt to flush pending messages, and
at
that point no console was actually CON_NBCON_ATOMIC_UNSAFE, netconsole
was still legacy. There was nothing to lose by putting it last. The
ordering only became a bug once the first unsafe console showed up.
John and Petr can confirm, but I found no sign anyone chose this.

 
--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
