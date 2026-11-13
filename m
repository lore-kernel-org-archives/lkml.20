Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794547998;
	b=5pXF2YZiY4pAwR5tlbAuGWpT4Bj1DN9b4St5VPt4DaI2fmrHQz4TS4wdl09V/LUMpQRy
	 u0lGjh63mIBRJx862XbIgJJ154GGvTfehqsLi+grcumtRcS2E2zN1yrURcsX6fHbTrRFl
	 Rs/J5Opi/w88AuDEcZ/48QaAh37H8LqiYyHJT+oNS14fjf7iSxb+c3+x699We/ujQwpL3
	 BgiKVXiDSklfIhyHQ5G7HBMoFDZNyOzKFoGie07oneoanIYaxb/U5UA8S9T+V0NUT++To
	 91L9wh8rjp7mN5vgTpsC24oAayMbgcdQ80YoBdP5XWzHpyGU/qkHgFcWzlLmrByBjFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794547998;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=RHnVMZMKjAJbKSX6kUAVgjpGbiApQ79G2eKyf44j3Gg=;
	b=CncobLCuHuxKZghYrjynTQKH+hTHiz4G4iU8Dk5CK5JNVcn/4feQkiJba5rJJ8Da2dHX
	 gzdcX2aLhtd7ZSFjQwze1c4wmtwzuz4fKedti8g5yvOqNC8KLehjwklQt5gbDE5onlgBX
	 10XXgDmIgz79wdNSYEHOyICz5KatL6tBcR44DyAdkPz5BJqFnzVYMK9kpgF9mmMUa2GLE
	 myMMy2PaIhvXUdnDEFHpa2karw5sjIjw/iBlnJSDESakHv0hQCecWWupwxqRuFIS8437G
	 4EyrFZm9HfhY/SD5NNtHYSlJvJCg9OkrL7k0Z9GfMoSpUYL02u2WONqsHDqtQZaiLOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q5R+SlNq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4878606A31C;
	Fri, 13 Nov 2026 05:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q5R+SlNq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A76F1F000C4;
	Fri, 13 Nov 2026 05:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794547998;
	bh=RHnVMZMKjAJbKSX6kUAVgjpGbiApQ79G2eKyf44j3Gg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q5R+SlNqu3m9BfMBf99pE16nDNboe7/hBNLhy3sNFMfeUY4dnnM7qOX7lb57DkPp4
	 aR3hX02z9y5pMrcND0Qx8w0Ly86pAjJxZ7GQO4C9X9vKYNvF+cuMkkrZZ+TxuwdsqH
	 pMbKXTKtFxlW6/aXbSeYT/k+1qaam0NV9RPjnMlAsKporhoTdF9arsGMA0xKuxgE7T
	 K2TS5UhfeVB53HEqn7g0OG+Qphz1xlVohj4H+oH2O338wZc6fkoHRm67uRhpeH0s29
	 wZ0TuOhUmapnK8WnbnV5ODakniOWK3S9wy2ZxLhfWzhkxnVpLjLjjXsb/eNIa/rfbp
	 d8XV2BLq1rDFw==
Date: Fri, 13 Nov 2026 05:33:15 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Matt DeVillier <matt.devillier@gmail.com>
Cc: Benson Leung <bleung@chromium.org>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/chrome: cros_kbd_led_backlight: use matched
 ACPI device handle
Message-ID: <avahGxr_1LELxwBJ@google.com>
References: <20261111172517.1407888-1-matt.devillier@gmail.com>
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
In-Reply-To: <20261111172517.1407888-1-matt.devillier@gmail.com>

On Wed, Nov 11, 2026 at 11:25:17AM -0600, Matt DeVillier wrote:
> The ACPI backend hardcodes \_SB.KBLT for brightness get/set. Older
> coreboot ASL places GOOG0002 there, but newer builds can nest it under
> \_SB.CREC, so the absolute path lookup fails even though the driver
> already bound to the correct HID.
> 
> Evaluate KBQC/KBCM on the ACPI companion of the matched platform
> device instead of a fixed path, as done with the Chrome TBMC driver.
>
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/1] platform/chrome: cros_kbd_led_backlight: use matched ACPI device handle
      commit: 71c3b4fe739123f9caca98cfbe274a85efa601a9

Thanks!
