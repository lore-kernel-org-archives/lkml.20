Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794056679;
	b=JiXW+EGOoQugInnsZVo9L1WjenAKrIaiw8Y94Lb4xL8MCLOlMaVa8nNfAmBwXlXRCnxF
	 B3t4AWb7yVqHnpyvWnDpTP1zE3GL11znBk2fif636A9BPradWAp17Q8w3wOK7gGwh/2Hu
	 hrxWh4leG4gBEqdG4mix7f1PImzqzqoOC3NVLhCJiaE6HPNPvNVaUIKR9wmbJVSFh07+G
	 7Z8UA9d+7DWx9wR0f3wGKIXbcORREAzukxTpXeFR0uueQM+kXmWwE1p4Tt1BjJpvl10HG
	 t/es36o3Spf0NxYI0ATo7hb32uzF6euEx4jHqysnc4AA2o7yo+TH11otH9mkCXyogRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794056679;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=EfvUaRUOM7ozjphpXocqWBL6skIYg2UvfAavGZ0MGTE=;
	b=k6+wOFQBHe4zEokqYgT2MKU0qSsG5XrDXrkjW+1cFfB1RG3dXrMDvuxwASiLOz0Vr71l
	 ubPjWWc/ZFx27gfZJIP08lSEmWOZswBHr0CEyY9JJ+29V3JUiVcwGu5eEIpdwBCVFclXo
	 FZ7fcfPvZ5m6DAcoIAT2MV95kzTlPPIeEfT68IqjQ+CGpwAlkBimuBCzB+J1hFKCu4o9u
	 b0eDZufJ8zi0nCymjDipAK8m49pETvCCXDY4pgzWld6OIA7wnc7yUZQ46GNOnZ+nOx215
	 MHPVumvCUWpdL+hb4TMWoNG8/E1gh+2IUtP3T3TosbB7+gDQ63uNfSsAM9yRiQ00JAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cf6Vu91x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A83C606A326;
	Sat,  7 Nov 2026 13:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cf6Vu91x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A09B1F008A1;
	Sat,  7 Nov 2026 13:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794056678;
	bh=EfvUaRUOM7ozjphpXocqWBL6skIYg2UvfAavGZ0MGTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cf6Vu91xKryem6WmgRRPDil++bnl+9uspIwxeX1I+tIH2/XSDlEwgdu+PpYAyLpDD
	 63gErkHrzZB6AynTKIQ8OFdu0lH7Ms4gfVi9J/GDqW68jLrvaAyJYvrl+T0zmVC/Du
	 rzBUhO/FDTN45Zqzx1oTgdqFG3+hk2XmILzDKP+FTmHZ8kbEQpI725+Z6ReURLTw2z
	 9fKsDXHYPOD8HSAs5FZBFGAXePIs6nC2rr/fRRqw+3kTFzB2bm/O4+muFHbI9ttozp
	 TSnT/WLUJsl2v9D0PvwtceuwOdQxUs3XXjJ55ghVSwOQs8aHwxMA5FzEs9FndxQXi6
	 O00Oi6KipgH3A==
Date: Sat, 7 Nov 2026 14:04:33 +0100
From: Thorsten Blum <blum@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cen Zhang <zzzccc427@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	bui duc phuc <phucduc.bui@gmail.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: info: Use snprintf() in snd_info_card_create()
Message-ID: <au8h4SDC6fKaY7st@kernel.org>
References: <20261107004338.323417-2-blum@kernel.org>
 <87a4nlypdt.wl-tiwai@suse.de>
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
In-Reply-To: <87a4nlypdt.wl-tiwai@suse.de>

On Sat, Nov 07, 2026 at 10:14:38AM +0100, Takashi Iwai wrote:
> On Sat, 07 Nov 2026 01:43:37 +0100,
> Thorsten Blum wrote:
> > 
> > While the current code works correctly, replace the unbounded sprintf()
> > with snprintf() to bound the formatted string to the str buffer.
> > 
> > Signed-off-by: Thorsten Blum <blum@kernel.org>
> 
> Shouldn't we use scnprintf() instead?  Otherwise it may lead to a
> compiler warning.

The only difference between snprintf() and scnprintf() is the return
value, which is unused here. Both are correct and shouldn't trigger a
warning.
