Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201303;
	b=kVU2fJnoOVlpHX6CyHEH79c9d4lVFisTqoMSoIH6fV/VJcGJIWJub0BwsnRnlkNhw4dA
	 OkpLqQYVHf+K2UO4pqjsSgjU77LjAs8Iw5zNUZm1eHxkPv4KBz2lDh8A/IOyA4UZxXgNI
	 AN8PNEj28A3fBM4JrkCySp3DGrd9BzYnthtIXPFeof1kKZZJNMlN18+VthBBrhAcfhkz9
	 RBDLnVaW9fN+v1FaPj7DKVJt9aEDphNZxams9bASxPe4UFlWih45U4C4YQjAkOXpgJhtP
	 4rrvNydimeIbTC7FPdeE2aF/4N4d+Iy9haMIDTTzDcOppFiGqu71lQCeZaht51CVa2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201303;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=v1prrXTQL5enhUgRfv7SgNZPLHZi035rI9AU6gpS8T0=;
	b=uCTXZXNtrs9xlS0YTG476XDhMNPCc6b+XmhRbACAA1QsoUaiDNf3hWKcBCeqvx3PoWN2
	 C1PNwO0CUCJHvoLLeSI+JWDRDhCCMWI7psyfrl0ohCBhKsVIcSjUyYncwEHnkMJ3NcPTT
	 G7PiSDrfLhk8RDtfmLP94PTKyp9X248e2y74m37apmGTDGIdFnhjb+zDYWMsOxeIYQ6p7
	 QxapslO/T8DmsTdc01ZcXOy1TU4qlrKo9HFGrA/nLVuX3U8Ig5Ue5f0t6XAMk9iUpfzje
	 RyBGDBP8w/FS3XlXSMfi5jlZ9c/b/fyZ7GVxcXyIJAZ4EyB1M/sx9Hp8qcBZMzQv0sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZzKxpAXa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B0C60A2608
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZzKxpAXa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 948BA1F031E9;
	Wed, 28 Oct 2026 15:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793201302;
	bh=v1prrXTQL5enhUgRfv7SgNZPLHZi035rI9AU6gpS8T0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZzKxpAXaIP4i5ZjUWAleQpCNLEouQ2W/CZDoQT9Kcnmh0tHIN14wwGAWOgUoOy31Q
	 z2TnQ2N0Q/TMW/xJsS3aJ/tL5eNovg4VyI/shizr72b61tAnCeYmROliJAtWt6ZylP
	 0SfPak6ZZrItdcf/gVvU53PEuZad1rHTky3hFzpgYCsgWqCcWdsdaUIEilTUo7RzTl
	 8G/5hFKuGdElcBWlRfX1TQvTKzJe5YdDy3WBT+luUFB4UYo5ZmGUiOAvyoWHUOxrRo
	 Rdl0TvEhyPuA+rFqNgbrOUPWwB/Gss/maDWPwI7bBihByu6x7Vnt7djlpen1JMkmO3
	 XaOzjK4eDaT1A==
Date: Wed, 28 Oct 2026 09:28:21 -0600
From: Keith Busch <kbusch@kernel.org>
To: Martin Belanger <martin.nvme.dev@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>, Hannes Reinecke <hare@kernel.org>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	Martin Belanger <martin.belanger@dell.com>
Subject: Re: [PATCH v2 0/2] nvme-tcp: handle TLS control records at connect
 and on receive errors
Message-ID: <auIUldDuE-ldewcg@kbusch-mbp>
References: <20261027-nvme-tcp-ctrlrec-fixes-v2-0-9656395ebcf2@gmail.com>
 <auEreAhSYCdGCWvt@kbusch-mbp>
 <a0e96bea-b2bd-4c7b-ae94-a13c57c86f3f@gmail.com>
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
In-Reply-To: <a0e96bea-b2bd-4c7b-ae94-a13c57c86f3f@gmail.com>

On Wed, Oct 28, 2026 at 11:19:36AM -0400, Martin Belanger wrote:
> Could you add these tags to "nvme-tcp: start error recovery when
> read_sock fails", if nvme-7.4 can still change?
> 
> Fixes: be8e82caa685 ("nvme-tcp: enable TLS handshake upcall")
> Cc: stable@vger.kernel.org

Done. I'll force push the branch shortly.
