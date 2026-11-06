Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793932325;
	b=SsVNWNpI+rM3hueVGTS3IcJu7yOxqSTYcKDa5dMk6Ds93nm+C8v7exFYmNsLruMknbP0
	 7MCHu24k39KvvLGrYNi1+I0Nkc2ZAM8nrgXgf7TPYloBNrOYf5siBKm4dVMyf8JxmC+6u
	 xqq3GRLpWHMhAhlV84CMmYELZRrpNPmKfFD8wNpjVGXDmI2f+/KWYOuzSlKIbWGRXDL8s
	 KTVvRP2K754O6og7Ywx3rqUay3H4roUn1mmQGgCYydOg/M8bdgXc7vVP+o0TDUZBZVA9T
	 +CCWAmjGfHNVjamAnBNmwarH3lGnlAJFp3SORim+y8dHEY30BQ0hgS3Kk1CWJV/tL6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793932325;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=IdbZCl3+n5Yh2E8Fhnmug6wK9qnkPQQh6gANRRAje0Q=;
	b=Rzk8az/JTTVPPBepxkT3MmnPvi5IxS5owdb6vCz5PVO0QbFEaEASrDmiZYcyGsxWM1Ip
	 ATNMOtoTj1SOsjBGNOh+BWqogM94h9ls9j6MZ6oDkFmGTS5IWidJf8fPN7TBZoTx5Meu6
	 opK8YB4x+bJ0LutN7A/W2wI2RBZ7wmDTV/QTeG0fMnKok+8bMsf0dFu08r25CO6DZVEif
	 Phk060vGDUFi6/uLAVdCDD4MIs7N9BECKE2HN/tM68buouz0MgRcbHrQNyF1SYWH6el2k
	 Cil9skaOzyh6M3I/KrnsX4kbOcJgu/SoSehRIha5fxkcvJpjwzNy+b0Uabmg0bPCbuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IzIc3bvv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7149B606A31B;
	Fri,  6 Nov 2026 02:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IzIc3bvv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 288141F0089F;
	Fri,  6 Nov 2026 02:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793932325;
	bh=IdbZCl3+n5Yh2E8Fhnmug6wK9qnkPQQh6gANRRAje0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IzIc3bvva3doAurrJwS1aw8soUgNRjqmGjmjVycMG4fTLcr5GsVmW0YmwgUsRxgMf
	 3z5wIMYiAObhQEWmqaW/2YRwp+YqGxyGgc3iohEKgVZ7WtuZ6zQaY5VQj9AeQBP+/j
	 tJ5wREEPuzpXe18aZ4S0oCO5P6Gwmum+RLXRavKVOkjyUnY79sQGK7l90vULTedv9t
	 f419oAENwpnhbJbP9jWwFwYAkyZfR/+uuaM2k7HKAtrsSQVDD8IXXgUWevfqR1GPKT
	 g+MDETT7sEDJVY3RI40LZinXzwZrUiDEl3JEsB0UDkO0sIIxTmxdMTJqQENgTekn/k
	 NmMIWd27pvEeg==
Date: Fri, 6 Nov 2026 02:32:02 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Jameson Thies <jthies@google.com>, Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] USB Type-C mode selection
Message-ID: <au08ImBfMix9nNAV@google.com>
References: <20261105155906.2670094-1-akuchynski@chromium.org>
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
In-Reply-To: <20261105155906.2670094-1-akuchynski@chromium.org>

On Thu, Nov 05, 2026 at 03:59:04PM +0000, Andrei Kuchynski wrote:
> This patch series introduces priority-based alternate mode selection
> support for cros_ec_typec. 
> The base patch series and UCSI support was submitted here:
> https://lore.kernel.org/all/20260119131824.2529334-1-akuchynski@chromium.org/
> 
> When AP-driven alternate mode selection is active, the driver enforces the
> mode_selection bit for each registered Alternate Mode. This blocks
> individual altmode drivers from self-activating. Once registration
> completes, the driver evaluates USB4 capability. If USB4 is unsupported,
> it falls back to priority-based negotiation via typec_mode_selection_start.
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/2] platform/chrome: cros_ec_typec: Enforce priority-based mode selection
      commit: 8dd5100e565ea8a89ef20b2a3512e6b31be9356b
[2/2] platform/chrome: cros_ec_typec: Reorder altmode registration
      commit: 2d234d566e1fb434fbff7827872a3da7aa8064c1

Thanks!
