Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793480624;
	b=Yx0I4nDXK+zQEYfFsBMikdeGQuTChr3r5rq+L099nIFPka0r0TGRqs3TOwjnI1/70a2h
	 Rr7Oe4gwM/QZn0q4BAHogVK9kZuKhQ4cCbHatHTwOOhlHLShRXPPWrXYhaeTp9N9jDjqI
	 s8tB+dsmrZ49yln0XyO5rFYR81RZvi33t2jrW60/UU5sq4sxcwl5c/sLY5dD3RvGhXwpn
	 Fn5uVPH8bQp9o0t4tVr1JRzI+mNcKzN/mB/tYeZ4lqrWoNW/kT5k9DdM/X8P/aF+MXwV5
	 9rfFuj2FaPucqD0QrIXTnq2qTsBQigI59qHlVwVd+jiy/ivdo+kVupRxN9l12ua7Pdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793480624;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=piub7Jp3Cm0dildjXbw9IOWYUttRHS+jgsIN+7iJt8Q=;
	b=09EVXN3BTelEY8CInXf2T+j/3U4EUMVVAy7uvu61LLGwaWcIb/AGX0pRc0Nniur2O4o3
	 8Ti64Zek+PK48XeKsPS8Ez7x3toI7N4AUgMPhiiQsfaq/S5lIFD2MFaO+7gjazfuSijLM
	 CGSxYuzn3ZnmBN97mtJNT5WPLQP6f1Ie+hzibDjGQDYsHZhgd+btxnFdrInhUufgKbKQa
	 ndfRHKv1A5l9rAsXUCOhXuYTqFx1B+dlAS1xAjCq90a0u/eut0LEF/6AJ+lKu8IQ6k1E4
	 2A65cNOlgyh6XaqFcFSl+J/hM0n/tiic8d9Lwa+VB+5uIjVyaSlqgNiixEIM9KjIypA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bSkmaaid;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C338E606A31D;
	Sat, 31 Oct 2026 21:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C338E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bSkmaaid
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E7151576;
	Sat, 31 Oct 2026 14:03:31 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C96D3F673;
	Sat, 31 Oct 2026 14:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793480614; bh=X15v248WCrjIN9447mjAtpg0bDk6UpQdgiQ7F2EU17w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bSkmaaiddT7s+KcKDc0Xx/M0zrWzbr+f2iIijNOn5Mb1EUh4/9YVYYH8LAmEbjqaw
	 xkYgkjfiF9GVDkCXkuJ8ypTpFyzLJEdKLTlLtbv2cVEgIBvYIzKaSKF05t/OwZgHR6
	 267xhQnmeZ77CiCWBkwao/m9EGfYxOEpa59jypy0=
Date: Sat, 31 Oct 2026 21:03:17 +0000
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Matthias Goergens <matthias.goergens@gmail.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, 
	linux-kernel@vger.kernel.org, workflows@vger.kernel.org
Subject: Re: [PATCH v2] Documentation/process: Add a maintainer entry profile
 for KVM/arm64
Message-ID: <6urqt376s23fcyr5pchfrrowvjoo6acg5xt4ujkft7gww6sagj@jxz5rqihtkja>
References: <20261030083351.3040604-1-matthias.goergens@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030083351.3040604-1-matthias.goergens@gmail.com>

On Fri, Oct 30, 2026 at 04:33:51PM +0800, Matthias Goergens wrote:

[...]

> +Review Cadence
> +--------------
> +
> +Unless the maintainers ask for a new version sooner, allow at least a week
> +between versions of a series, and only post a new version once there has
> +been enough review to justify it.  Posting more often delays review rather
> +than speeding it up.
> +
> +Pinging a series that has had no response is fine.
> +
> +Answer reviews from bots such as Sashiko as you would any other review, even
> +if only to say that a finding is wrong.  Pre-existing problems that a bot
> +points out, and that are unrelated to the series, need not be fixed in its
> +initial posting.
> +
> +Applied patches are normally acknowledged in reply to the posting, naming the
> +branch (``next`` or ``fixes``) and the commits.  The maintainers try not to
> +change the commit IDs of applied patches, but the IDs of merge commits almost
> +always change.
> +
> +Minor problems are often fixed up by the maintainers when applying; if they
> +say "no need to resend", don't.

The second half of this is a little silly :P
What about just:

Minor problems are often fixed up by the maintainers when applying; ask
if you are unsure whether to resend.

Thanks,
Wei-Lin Chang

> +
> +Security issues
> +---------------
> +
> +Bugs that let a guest attack its host, or a nested guest attack its guest
> +hypervisor, should be reported as described in
> +Documentation/process/security-bugs.rst.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7a162e9..183bf34 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14596,7 +14596,9 @@ R:	Zenghui Yu <yuzenghui@huawei.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  L:	kvmarm@lists.linux.dev
>  S:	Maintained
> +P:	Documentation/process/maintainer-kvm-arm64.rst
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git
> +F:	Documentation/process/maintainer-kvm-arm64.rst
>  F:	Documentation/virt/kvm/arm/
>  F:	Documentation/virt/kvm/devices/arm*
>  F:	arch/arm64/include/asm/kvm*
> 
> base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
> -- 
> 2.56.0
> 
