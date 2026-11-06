Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.185
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793970720;
	b=14Zf74ff57GDOvs812NCX4L7DU/3XsFNKeDQ0UxfoPYmLJp4IIfdrKv0+7dnZxb0HfxI
	 whTNBvQgqEZoWoEl14d07bOu/0Ha38eQmz3EYvocFIsK9H4jO4Qb2Z8MZkvMj+D4upFHL
	 5vxdTIRRXQdM/hgwHGBApzcf58FJeF+yhrTuPyPVpXBEISQDN+dAzQg8PqwM79ursgsy+
	 2/o8rMKcNpYRkLG2tZFEJdgurOLvV4D7YuxMRhlRAE4iQ2K+zZqFU8oyZIb0b9CYU7Lio
	 pC5v3Zip2+20M9HQ70vYRjrwgUT4qg4ltGBa+oBrt7jWTw6Ewcgn89vcdE3iXPnEPlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793970720;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=jyoGTrIMGjJ4ap6T6ALDTSlQ2Cu72PJ44sVD5M6sRBg=;
	b=qjtGsLWP0a7N9GK+bQ2KcVBp4pYXe85NTJJpojz3MNQQkKErNEZcq85w9K7B/vGhDrMt
	 eSPQNWD1Ihjov1UAXFM9fy3GcClM60PFraUQBsLypjvoMKgw/dO/xaJ7pwor6ucyy39Ir
	 RdB9BGxUAm3GchKw3ejCT8NhH7obAgeYa77eLj5QZpugJ6cmGLFlzIqiaH0MLFYbzmZMV
	 dM5vXe+e1B9xM93Am2eAxLmVv0HUnDIAiWriGGOvk4sChLejU8PxT9GBOFlgggQtJAxyp
	 xGNRFVhm5IqbWm0/AQ/V34kr3jy623UTop8FcQdtBR/fz4DSmi6dseOxFS/T7n/GsqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=91.218.175.185
Received: from mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DE5606A330
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:11:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6DE5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=M685jcwraRWTO2z5jw7z+IH+CyXCVQlol4ek+READi0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793970715; v=1; x=1794575515;
 b=lCKlW3HA8s/pAjZZSfd1VHTi3r1fEOx0vPHU+VekO7bw3+bIYEaVEMNyqjyzgfvuyg2X4XSX
 wuPdKxOZIDpYjbLpsWSCfw9kJmfGZdAwcZgQwRk6flrHm9GT9rxCHNdP6zdb/EV4TXqqdrKMTkq
 8QxF+tGS5dwfeOBgxtK1pBMs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b1afb51c95a7749d;
	Fri, 06 Nov 2026 13:11:55 +0000
X-Mizu-Trace-ID: b1afb51c95a7749d
X-Migadu-Flow: FLOW_OUT
Message-ID: <efd5f1ed-4f45-451b-8ad8-212efebf2d8f@linux.dev>
Date: Fri, 6 Nov 2026 14:11:54 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ASoC: amd: acp: supplement patches for ACP7.B/7.F
 SoundWire machine driver series
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, yung-chuan.liao@linux.intel.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, Syed.SabaKareem@amd.com,
 Mario.Limonciello@amd.com, Richard.Gong@amd.com, Poojitha.N@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106130801.506026-1-Vijendar.Mukunda@amd.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20261106130801.506026-1-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/6/26 14:07, Vijendar Mukunda wrote:
> These two patches address nit-picks raised in review of the ACP7.B/7.F
> SoundWire machine driver series posted at:
> 
>   https://lore.kernel.org/all/20261030094714.1123396-1-Vijendar.Mukunda@amd.com/
> 
> These patches were previously posted as replies to the original
> series. Posting them now as a standalone series to keep the dependency
> clear and avoid threading new patches under the existing review.
> 
> Patch 1 renames three static adr_device arrays in amd-acp7x-acpi-match.c
> to reflect their endpoint set rather than their structural role, making the
> distinction between jack+dmic (combo with RT1320) and jack+amp+dmic
> (standalone) self-explanatory.
> 
> Patch 2 adds a block comment above the ASOC_SDW_ACP_DMIC and
> ASOC_SDW_ACP_DMIC1 quirk bit definitions to document the dual-PDM-
> controller hardware model of ACP7.B/7.F, and annotates each bit with its
> role.  ASOC_SDW_ACP_DMIC is a generic DMIC-enable flag on all ACP
> platforms; on ACP7.B/7.F it additionally identifies the PDM0 controller.
> ASOC_SDW_ACP_DMIC1 is ACP7.B/7.F-specific for PDM1.  BIOS wires exactly
> one controller per platform.
> 
> Vijendar Mukunda (2):
>   ASoC: amd: acp: fix adr_device naming in ACP7.x ACPI match table
>   ASoC: amd: acp: document PDM controller topology for ACP7.B/7.F
> 
>  sound/soc/amd/acp/amd-acp7x-acpi-match.c | 22 +++++++++++-----------
>  sound/soc/amd/acp/soc_amd_sdw_common.h   | 11 +++++++++--
>  2 files changed, 20 insertions(+), 13 deletions(-)

thanks for the patches

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>


