Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2732435B12B
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 04:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789187057; cv=none; b=VtaTFk6sHp5SdWz16Spq8ojOOcl9DujkN/dZNw7D7wk8qrx7fLDnCEZjOOPVR6zPp2aHNguHQFmdlu+5b8V/v+v940NM1SCz/y3yAh/zHYv15uQZM7RBERro3dWtAJkEwgwvgJAp83sS0ZkYEJrgkcOwptkgMTuZ7xoK1ff/icU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789187057; c=relaxed/simple;
	bh=ZAVbFGMrA6COIKq4H6CsiDZNmq5cq9F1IWhQqwC2FKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RK90eeyuo68KNI5EE5qzh5OGmQNb7ZelktfUkDNBuf7KYUHq9dVb9ayLYEovV6a/aQatQHrrxG4oQq7cZ3bQP/nPvoRCw47XxrJ9Q20BV8Wbl1irTtk/tpnTcTDeuCZkfLSdLTAQsN3nYXMDHxVMlZ7JpvcEKCn5xAjTmpksOkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=IPXmON90; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="IPXmON90"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id CC39A40E00B8;
	Sat, 12 Sep 2026 04:24:12 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id P2gl04w5ebSV; Sat, 12 Sep 2026 04:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789187043; bh=h9NCuiU4M2f4ImwfbY8Zzs8SJu8nmPYRsgPeElKgGfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IPXmON90R2NqE1jSS1EaSE1TYjd+6vdiMfbr/u0KEsWnloy7VsxLkyVju7LKTHZuU
	 f6kKwwBigELkJsgxyZafDPliaqy2fAzHOEA4BOW9GXLVPIUnJ+/gIzxbfiMUbVmOZA
	 j2KE+0ErO50tb4k0mUrhBAI2GcEupCpPTHcYVKQwdmPM1CDUr4hRkiz07Xbe5Ch5cT
	 oDQGkMqoFtsJSmbjzSRVUZNKcGnMkQOd6Eq1Ie9t5gY9nX9bL4e1q9xoJnhhy566d2
	 G3QYu98r3c/Dls3QWlWpq4R7jGdvd7ibgEdqmyIN0gJLWZmzDMaORLB8I2KFGgRWgq
	 3yEshMz4VXsYKpoXfjJrxQor5hemXQeu0ygn/ECMrfWj9pl3BehGJT/7o/p7aD5oRI
	 HuPbGmbexo8Dj7qM8zsejO0BnhPwpAnM4jUWOG/Elz5Y/9wwJoTcPf1sRi84DMGaxt
	 9ctNsyrJkn0ULL8oLI5ATe8EITgdV/8rxOiDlk2GbUP6BxGvwUIFaoYnhS2tYWK4fp
	 xQBmHOLib+RVVJm2DEqzH39XTHXvkP+5GLrK0CXe9YiUQApGBjkwTnd8f1K7lm8uHE
	 atWI+/faGTzddWjGo2ZCAVOPWAn7uDa9qwg1Pk8IVW1i6N86AIesZv6vuh0JmfJsQ7
	 f5vjb8henVWyO/fXo31t9wT8=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7177340E00E8;
	Sat, 12 Sep 2026 04:23:58 +0000 (UTC)
Date: Fri, 11 Sep 2026 21:23:54 -0700
From: Borislav Petkov <bp@alien8.de>
To: A Kundu <avikalpa@yahoo.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	Mario Limonciello <superm1@kernel.org>
Subject: Re: TSC marked unstable on AMD Zen4 (Ryzen 7 250, ThinkBook 16 G9
 AHP): 15.6G-cycle warp CPU0->CPU2 at boot, 7.1.12
Message-ID: <20260912042354.GBaqTT2mNIq09XRXff@fat_crate.local>
References: <1789149772593550955.2470305.ref@yahoo.com>
 <1789149772593550955.2470305@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1789149772593550955.2470305@yahoo.com>

On Fri, Sep 11, 2026 at 11:32:52PM +0530, A Kundu wrote:
> On an AMD Zen4 laptop, kernel 7.1.12 (x86_64) marks the TSC unstable at

Can you send full dmesg from that machine to Mario and me?

Privately is fine too.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
