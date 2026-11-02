Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793608635;
	b=5XXRwHUHuWhtvdK1+2rlhyg2vcwXR/GAvG6v1uqKxtPEkPEC6dboWT3rD/3tVmJbGFWu
	 hjDXUGxgGXNFs9cJjwzuvT7wmA2AG3+DSFpczTB6RdgC3RnoIu0c4WN2kiKRFY+atoA5f
	 hhiSraif5TyHCaHpdNfPij2Ct7b1q17usGO0uzkElvVnP0JyTpDTF5XHejT81WDHiKyak
	 1PQrHYqSjeoMVo7fBHJ9tFVfeldUeT57JLUTb5hITfGX/6KKf3pZftNpJLhVmD5U4eXcB
	 GiEM2nT1ecMzHHv883ToSXing2HRlbPYKdiQY3rH6sN1NS1SpD5foZtKdEZ3jzG7pUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793608635;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=g59qi3BiyVa9BdK2dHXLgm5AywXSblVqWdtAixzoZKA=;
	b=BOTEDmXakD22qG+owYNJA6agVARo1I/pbknlAakko2ZJsyGp3dm+NmqbDAcPymusMHoA
	 2OLdusO1vcdE0Fb3JoFHCVQuh48Bt8P47F9N+gKoUE1Y1AB48TMNgfaQC6O+3m89OQUl1
	 AgQ1JsyW2FUcy8Wj9HRCzRm+mCOqp2frRr0aR30bV2dWYU5tK6af8v7k101E8zs9BwVe+
	 xFDDnRHqrla9oNxhU5CXSVrsvYaEdGDhq1j6487AfHdn/bNV66tOyS8f7TcePCxq6NoJO
	 E0K0x1JonTfk0E6nvxWQIMo3DOP7s4on42kPy2q6oH4JI0t0S2LxKh9QNoBuZ4iRVsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cQDjXKTZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F186606A329;
	Mon,  2 Nov 2026 08:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cQDjXKTZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 623AA1F0093A;
	Mon,  2 Nov 2026 08:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793608635;
	bh=g59qi3BiyVa9BdK2dHXLgm5AywXSblVqWdtAixzoZKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cQDjXKTZNNGPXewxH5t8oliA8VUIXQziJwtUxqa7P1KREIWqlGfMCZUrzx1OzKMVY
	 HG8yCZRpgUduGRWLnMotDYtKcjYkJD/JH10axtVChOt4aEsQg7ATvK4fxCrhN8k8QY
	 meBJTte4IjfUqA2C0Bi+Jgqg+jSjSlL+QbDmw0g2r9P5d16fqnYHqbI8H4XAHXjg0R
	 6v29uMCLNf3KPkLKvGy+1K6jJu/74uzrIFzGg6Qch+nW1koN9BxQr0COGdaPHAwjq5
	 Rx8UJJT3RncZxSwwKvhWsFByfRthtsfgIhNfHxFGUo+QYwSKEQh32BRjDup8ytM9wK
	 /szcEO/yduh4A==
Date: Mon, 2 Nov 2026 08:37:07 +0000
From: Lee Jones <lee@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
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
Message-ID: <20261102083707.GA13023@google.com>
References: <20261030104840.3361217-1-lee@kernel.org>
 <aug1F0pampktAuzZ@parshuram>
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
In-Reply-To: <aug1F0pampktAuzZ@parshuram>

On Mon, 02 Nov 2026, Vinod Koul wrote:
> On 30-10-26, 10:46, Lee Jones wrote:
> > These issues were reported by Sashiko.
> 
> Thanks for looking up issues and fixing them. Some of them do sound good
> to me. I would not want to cc stable and tag them to fixes though. These
> are bugs, but I have no evidence they are impacting real world
> scenarios. Mostly a good but theoretical exercise, so I would like to
> avoid churn and move them for next cycle...

That is expected.  I would like these to soak in -next.

I plan on preparing a v2 this week, taking into account all of the
review comments and collected trailers.

Would you like me to strip the Stable tags as well?

-- 
Lee Jones
