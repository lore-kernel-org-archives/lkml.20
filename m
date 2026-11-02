Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793579544;
	b=aTn495GfyoAyqz0O4zJl2GZ+NO+Vl46ccxoi5VLRyM+6DqV3uYGeEV4VkfGxSpwlV7Qg
	 4YUKUR8lyLa+NeXFxSygavKqQZvqHk6a/OUVHkamdqDoLtqjagVrA1D6kmzfNB3Db6vrB
	 fHEJe3JsP25vLtZ1ZTpuDYSPlgqw+12JKC4SzYAkcskU5ZEpqgZgnXk3pohi2YaxS5r26
	 Ynlm5FAjBRqHs79djrxH3curFUleWcmDb5CrcnFl6h9pUK94ZEr+VGTOKXQCRtt8R0WPE
	 iYpRRBJgQIXchxFEQ0A2Nut765VCGBO/+hCcQM7YC+LLacFy6dtKKTmri4hIK9FNIpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793579544;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=kAB3KC6DRwJn+NaV37+V61He0WUG9I598IGqKb8WGIA=;
	b=lVET/936Rps9d7wrAcS7CkSju8pwTA+JlpIiHX38P5sKi/WRdX0RhDK5F3JDirTY6fTe
	 T3j1DV0Kh0E0KMzos6IeGMA0mm5PdZkLVHMAcahjocsVcxEEJuYy40tkSGn8PvXMNeRPu
	 WF76GNnNeUA7O0TE9vNazadPhRE07yUSW+9ghUP6isvRvFIcODw1pPUfZl5GdyWZvf5AN
	 7VZYuB5LZtNvKKy/CixU3oAeyKe6VxQ7qeImwZvKerUXZofhnjXyQBiDh2vQ9RA2LQOQb
	 v9coE70kexxPgTFUcOTf1OO7ygpnnrown5EuL51tyhM57kS0WYQCVY0I5P+Vz4yskFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fgcX2Z4W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84081606A324;
	Mon,  2 Nov 2026 00:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fgcX2Z4W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0D6D1F000C1;
	Mon,  2 Nov 2026 00:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793579544;
	bh=kAB3KC6DRwJn+NaV37+V61He0WUG9I598IGqKb8WGIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fgcX2Z4W/wsGFLfAh3Gx3McNKsfYrwH8RKflYbW+qWk26ETJ3xI1CAa8Pa2kpvpyQ
	 /8a8JfN9xG9qq+WbONWvNGk+IkGYLkn8xEiX+YDSxvABwBUooSsaFeTrtMHdpbH7OH
	 sisP9dsDHlm1vZEb9QDcR9xJAEMwJn8sjsrvWAJzyHEmyD1aBTMVbDr2HqxVzO4cGq
	 ZfkcneQAjbwhh9iJ7Kh9qxnR3DrE5UIhPLNjvbLmVDPNNVBF5cN9LuUs9QU9zfQddn
	 is6r6uDt8qkU0Ka5+fsbTs/pSCzkN6MCsOnWfcRk8ZMlNqHrgCuRBa/F6YzZSsQlR7
	 zy2bc76VodbiQ==
Date: Sun, 1 Nov 2026 19:32:22 -0500
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
	sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: SOF: Intel: hda: Stop the controller before
 freeing its DMA buffers
Message-ID: <aufaFu3THHiUf_t3@laps>
References: <20261028144446.992948-1-sashal@kernel.org>
 <179357405490.1679716.7958054921741157139.b4-review@b4>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <179357405490.1679716.7958054921741157139.b4-review@b4>

On Sun, Nov 01, 2026 at 11:00:54PM +0000, Mark Brown wrote:
>> hda_dsp_probe() starts the CORB/RIRB DMA engines through
>> hda_dsp_ctrl_init_chip(), but neither hda_dsp_remove() nor the error
>> path of hda_dsp_probe() stops them before hda_dsp_stream_free() frees
>> the CORB/RIRB ring buffer and the position buffer.  Unsolicited
>> responses also stay enabled, so the controller can keep writing RIRB
>> entries into the freed page.
>
>This doesn't apply against current code, please check and resend.

Just to confirm, I see this in Linus's tree:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=11ae63bd9030349a0136fb2edd1622a4a029edc8 .

-- 
Thanks,
Sasha
