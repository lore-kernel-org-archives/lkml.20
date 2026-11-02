Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793602844;
	b=P6R4UbHJXjrEGXJmePdrj5RxgfMVev6u7wU34SLvr6Lfjcq/v6GwebJEWxQ4wL37JbG6
	 lDmY/Gb8OKB6Y1K2MAiUCM5xL1FZaQgc6dxnqDpV9qhOmlyqs+vwPghBF+CxI+MbieEms
	 iGmjDhDZCqAq0H+ZNT3AAvvAeyVA4uOG0mRyrrIt9ZJGCDA1kYgGk7fwrxgFnWI2W8WEI
	 LAtt4r+aUcnBNhjvfGEOVfUrgV9vc+Iit0feGdZyLJsqIPg6Use7FSQXvTwcXRgSp6IBf
	 sbcj09oC9MwNW5qro5TmJYkOH/H70Bjf3LEYNTiEQmtMyQk6BsSih41VJguixbqSAbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793602844;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=RxAqcCWBr6a26XKwCwfp2bVB+gFQ0/IZpYUaWXrUWNw=;
	b=QcNjY91kyDJCy/OE5tylb5ETStY45QVaSf4gMda/vhJxQKegrJf6tphbdQ9ozZwkLaFS
	 NwIvWl7iQ1YuPgoQUtwALs7j1Tefamp9TJax5zTGkCvdF1kbn3/N1MTeBwSYWfxhHf8WG
	 ilqLe6dgujzSbUQETUNfNZBtX/vtdA+x8Pp1Uj4evRe5VzT8GtohOWkumGbiP5Ic0ePXu
	 XO8KSEa1w4UTi5nXYMFZGrny43zja+WZ03Maxnbaoydbe2p8a+gshuE1rPcfapdtsTiRY
	 5BXrQQGtTsNFR8Ey8a4VJoj8L3jL4n3ySbN/LicskCW144WLvY9aG77+Rw6k3OUjocQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="R/fiw4FW";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9B7606A326;
	Mon,  2 Nov 2026 07:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R/fiw4FW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E7361F000C1;
	Mon,  2 Nov 2026 07:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793602843;
	bh=RxAqcCWBr6a26XKwCwfp2bVB+gFQ0/IZpYUaWXrUWNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R/fiw4FWXIGbbBWngslouj4gCw2HEoxnkWZwHV2qXjiMzX/GVPMjCi007oDGcuNZV
	 a74u9gBFKQyAucwTTYn6nCo0+T0bqBQfRhTz03OxpuAgFeWMoZGqLRKtrOFSrFy+Ve
	 uGd5dU8JtHltOUGe317QU048Gna6gwfNjdQ6aik67AfGKwPGlsZe5F0S+58m2Mlnmx
	 eq25h2Wy/fCKvcVwGYuEVxvPJABOMuSMXqlXXTYWksmd2kCW2oFTmRMJf+n8JKPCbp
	 M6Q1j3vy+s4WIJkLRB0PuIHdFqJvnSaEsuShG2zEYgXOASqV7a9ysYAMfVa+Rbwvrh
	 W1+kECMuoJaxw==
Date: Mon, 2 Nov 2026 12:30:39 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hardik T Shah <hardik.t.shah@intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Mastan Katragadda <Mastan.Katragadda@amd.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Rander Wang <rander.wang@intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Simon Trimmer <simont@opensource.cirrus.com>,
	sound-open-firmware@alsa-project.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 00/21] soundwire: Fix Critical and High issues reported
 by Sashiko
Message-ID: <aug1F0pampktAuzZ@parshuram>
References: <20261030104840.3361217-1-lee@kernel.org>
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
In-Reply-To: <20261030104840.3361217-1-lee@kernel.org>


Hi Lee,

On 30-10-26, 10:46, Lee Jones wrote:
> These issues were reported by Sashiko.

Thanks for looking up issues and fixing them. Some of them do sound good
to me. I would not want to cc stable and tag them to fixes though. These
are bugs, but I have no evidence they are impacting real world
scenarios. Mostly a good but theoretical exercise, so I would like to
avoid churn and move them for next cycle...

-- 
~Vinod
