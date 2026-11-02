Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618940;
	b=LT9XiQ3m29jq46PvFOSEK+RwyKAZ848NfCTrjr7QgUI8Z3nbSzIWG8dH8sqxyEaSzVwQ
	 b7B0YvMFqVwRZXC9INdMhPNfzBuZA2cPVwNdTT1Ib56IkeLEs05jFnNkbxZdguXXlypnq
	 X6K1XKGE3c57q41YE1QGiv7ZUmUyLXFTMoAoTfDLlrxExVWDmkP22gyP2ReR1c07K/BK/
	 /ZpLZu1lz5GZBzyy/wJBwfyodsbn38IZ2tqoNhOLjRgUQ/058TKDEIRqr5suE3y/V1fp3
	 iWfWjzwBA2gJci+dzRU3vj+Xjl7qVUdjh+VWFn4bq2gB9IfIoAtuG6VUZJCD5en5mSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618940;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=0jQWLvhV2BQpjJO0jgUmW6KpNgHGp6BrXawDNV/+G6M=;
	b=lwaq448VODd6R3engrrLP6x5hn9gNf108hbd8aH8CjujUkoZ1A1TgZDVGgvKEFJWawSC
	 Lurq4iCRThwWsmyWnLn9PcEAV5lBCe/XymEVsMIfuqEAwl2Qm9VLQh3QVH1yH2aQAV+m/
	 zw7g0VxBPo2j5VD9MyA3llNS52DXZLpgNi2z5qA4MI9V20j7gTqAN8+qHaVybiwBgZUbJ
	 zQCTDYchojD7Bbx8pJWoUvQ+LBC8+aJtc4klwcnjVOqWrhUZHjuNvpKFAUqr72cZ3WYHL
	 29gZ7AB5WjQJQUaKh+zyICS629070Yzihcj/o/SYVD/4CJnZ9TNMPMujxBbYjiAUNbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uz7g8AuE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D8C60A5BC6;
	Mon,  2 Nov 2026 11:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uz7g8AuE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49D5F1F00A17;
	Mon,  2 Nov 2026 11:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793618940;
	bh=0jQWLvhV2BQpjJO0jgUmW6KpNgHGp6BrXawDNV/+G6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Uz7g8AuEiCDkEq72ELulNJ08PZdakSifMmazvUKIMWpUi9+/+J3YyzsVl42gwcKm6
	 r8EwEaOLfJ+wuW4MLtmcmsuc3y52hK7wJqNYjMloJSfOrgHk+4kDZgf9A1MnvbSGrs
	 NVdWe9pvFkFHLTzK2OYc2+U3UlP376v+vexYLXWXb53FeGqAXqffw0o5+erlKjXAAa
	 cJZaOaPj2jsCv/oFzV5ZNTvC5GMllcKuX9qMCd0qV0fAPpfAEzUU8DcEuJJSqs6Gxf
	 PGpWPjOKg4aZrCjgAx4/AfhOgyOKvAIkD8vDrlThBt6Bxrh/cXxCT7wGRYdGc7Enpj
	 5I4PLvglkY9Dw==
Date: Mon, 2 Nov 2026 16:58:56 +0530
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
Message-ID: <auhz-CFuPrR_iPjz@parshuram>
References: <20261030104840.3361217-1-lee@kernel.org>
 <aug1F0pampktAuzZ@parshuram>
 <20261102083707.GA13023@google.com>
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
In-Reply-To: <20261102083707.GA13023@google.com>

On 02-11-26, 08:37, Lee Jones wrote:
> On Mon, 02 Nov 2026, Vinod Koul wrote:
> > On 30-10-26, 10:46, Lee Jones wrote:
> > > These issues were reported by Sashiko.
> > 
> > Thanks for looking up issues and fixing them. Some of them do sound good
> > to me. I would not want to cc stable and tag them to fixes though. These
> > are bugs, but I have no evidence they are impacting real world
> > scenarios. Mostly a good but theoretical exercise, so I would like to
> > avoid churn and move them for next cycle...
> 
> That is expected.  I would like these to soak in -next.
> 
> I plan on preparing a v2 this week, taking into account all of the
> review comments and collected trailers.
> 
> Would you like me to strip the Stable tags as well?

Yes please, I do not consider this stable material..
Fixes doesn not help too... :-)

-- 
~Vinod
