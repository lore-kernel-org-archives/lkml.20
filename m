Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417E74A6898;
	Thu, 10 Sep 2026 16:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789057648; cv=none; b=lev8r43UyGOjVD4RfX3V4JSEZoF7vS9KLbOu/3vBwRb2yFPwEtm1XIMc4hodIIL+tvAdca5LXyDoP0pP9Iz191SjIiWsbwfU9goQ44uLjFv5THbftlMJabC3Mqt7J2wfMRJ2zuVoBB6s1eF3YPywvTLrYJcLfmmNVeGRCjlofyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789057648; c=relaxed/simple;
	bh=51cFfM5S3umxZrJCaooV7zSyAKYpkpsKge6vy0/4mW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CfaKpYKgYj8TR1YMq3pkKDPz3iqPCe1KaC2LY5gyM+eR9LZKlobQKbvy0ppX5qkcj1Q+ovDHi/s11U7T7Uh+zGFb2GWxLkN/UF4LOnqLmxbSzAJ2+FOoABAQT19BU4pt/9e+QvMHtAuTB4KmvVA3tG1xnTHLySWiz6jJi2SyDiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O7bKDPWj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O7bKDPWj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E7641F00893;
	Thu, 10 Sep 2026 16:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789057641;
	bh=tWNDrqWCw8zhX+YW2XyBg3uxHDB/fBuRnMf94DdU+MA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=O7bKDPWjpZ8y2KwinEehTvAR5FwRMpG8EJ03uBXEOVxDx8tLITVyLwPwrfG9wzrtm
	 UTxG46SGygJG8jZ+FhWG2pTIWJP7HdCiCEXfiRAekgZMaGUfWBoeVMDHRHUXCMSovv
	 IZceBBu9sMu7tFZ2zyy/bPVoH8ME/A7LghS5C8Z5CJFiHawAMNP+HZURDyvkAHwcH0
	 BejqFm3aOol+R7KrI47SQPnF7/CZuTnwJDNeMSx8TwSSGwiqQVoGWS249BHu7tOxMf
	 7iTYNySaCuSBXofJ7lSonu2BLU7VrS9t9dRlHybjCtMKH36qQEOHGJMkoSiR8/kBF5
	 7jNttkDpUFMfA==
Message-ID: <f8ef053f-d73c-47d7-bb81-72ce9844069d@kernel.org>
Date: Thu, 10 Sep 2026 11:27:19 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 0/4] ASoC: amd: acp: SoundWire machine driver fixes
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, yung-chuan.liao@linux.intel.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, Syed.SabaKareem@amd.com,
 Richard.Gong@amd.com, ckeepax@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910161728.1452808-1-Vijendar.Mukunda@amd.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260910161728.1452808-1-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/10/26 11:16, Vijendar Mukunda wrote:
> This series fixes four defects in the AMD ACP SoundWire machine drivers
> (acp-sdw-legacy-mach.c and acp-sdw-sof-mach.c).
> 
> A bounds check is added to validate the SoundWire link ID before it is
> used as an array index in create_sdw_dailink(), preventing out-of-bounds
> access when an unexpected link_mask value is encountered. The codec
> config count in the SOF machine driver is refactored to use a dedicated
> variable rather than reusing the endpoint-count variable for two
> purposes, making the intent clearer and avoiding a stale value being
> passed to the codec config array. An operator-precedence bug in the
> ffs(link_mask - 1) expression is corrected to ffs(link_mask) - 1,
> ensuring the link ID is derived from the correct bit position. Finally,
> the SOF machine driver card name is shortened to fit within the 16-byte
> snd_card driver[] field and eliminate a compile-time warning.
> 
> Vijendar Mukunda (4):
>    ASoC: amd: acp: bounds-check SoundWire link ID in machine drivers
>    ASoC: amd: acp: refactor codec config count in SOF SoundWire machine
>      driver
>    ASoC: amd: acp: fix ffs() operator precedence for SoundWire link ID
>    ASoC: amd: acp: fix card name length warning in SOF SoundWire machine
>      driver
> 
>   sound/soc/amd/acp/acp-sdw-legacy-mach.c | 14 ++++++++++++--
>   sound/soc/amd/acp/acp-sdw-sof-mach.c    | 23 +++++++++++++++++------
>   2 files changed, 29 insertions(+), 8 deletions(-)
> 
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
