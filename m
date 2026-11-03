Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738994;
	b=2XXe2X6Of0s0G60kvLgFE/CkChTdDc3Q9GieZ29HGKM1cEerws+rO6LcO19anYt7scV4
	 B6oeqcoO18+Qieiy0gAxSp+YQqFiOb3iUPpzPkMxjrMCyArfFmWCwL2p9gGAjc32UgJX0
	 20wWWi3CDx0HedozyaMTs05JCpP4PI7NlF8bZ79lP5bc9FAys3e3ITGw1lZpz5KY1ilae
	 srAMW7hGL27kGsYBaf88mRL4Pak+anPPpla54SPhgn8+crjj5quBjgeKyXsqZoj5PiE67
	 TByIPBf0/HpY9vTOIUGg/BAM7FHUgkcJmOh72OAUP4W2q1m8Jf6O8dDGOH6iWyxOljw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=vsBN/U3w7HiU12daWsEJrqxDOHajJ7sejATwoccs78Q=;
	b=bWw3KMlW9wYqH3T18ebJ4T+hmh1WetoZewwEqZrxRJViLaOB8RP1xblVaJjlc00EDYDe
	 l9Mk4V4g2HjblGVknOlZE0cRo4j5nbvomFgG5byZT7pDiUnOuvW7bzJqlJNSN2pRvuDgN
	 p4Dccib3V0aJzqQms1p/wphQ1jTSDzgAZj73+jeJqHuGWzqzYyPTImXpHfQiZT2t+1OAY
	 0NWeRmsu7aMNC03edHADuAWOm2UgAfyPDzcwXIF5H5R4JGN5QOYdKQfm74+CHZw+Uahy6
	 jbRGvtsGhRu3jI66F46YgJylTnC96bJ34SXiqco3xP/NmN29XvGMOqcF0pcvG74loXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=fMnpa+1T;
	arc=none smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD0E606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACD0E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=fMnpa+1T
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7ce78f9d6baso781245137.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793738992; x=1794343792; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vsBN/U3w7HiU12daWsEJrqxDOHajJ7sejATwoccs78Q=;
        b=fMnpa+1TiwfQPLuzFj5KOL6nFs02Wh1/Q1YpGU6fPLgP3xa3v32+1TjkV7QnIVan9X
         Au8t7zhlc/Wqy8IvIN+6jwLOFQbroSFX7e5zl0iAE7wFfeVbzt0sIuL3znxfqictoNsU
         AszKx1EvRDOQodQNEXb/u5LjHwROXDEMTmdCip+hwRGCmIxicUkyjygp47Jsy/AWcCRd
         diAEVE+F0cg81rpl7V3b9WCEeI9XS94s04/3X+zMUyu4ualbNDhpMfK0cW3xt4RRyBNm
         9tphFt4TM7T6ssY5Yq9vio5SJIJno9nEOGWGr+KAQeT+pXFnFKGV+dWl2SH0fY4XHZUn
         +r0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738992; x=1794343792;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vsBN/U3w7HiU12daWsEJrqxDOHajJ7sejATwoccs78Q=;
        b=0ldcNUuDfVY78xPm+zpz+3kuvjBWWhktg2Z7GuZrB3Q++ViEjleFlWb/VEf/CrRV16
         aJziUS/BBdinhdQ3Ezg03lmAGlxVeH7wlTZ8K1OsbeWpWd+902IsZU4sFgGsjqPeM4x6
         K2uDO7Qqvxp1TLG8wVGZMnCLNaeha0HFdvFANgc1V5zP1b9oYoiAOWkcZmjm0qUnFx5s
         3Xoq54Jfqne/WVlZMeo85f9v6vnkIiqDAmNxlP8nm61uPnCMBoO2McvCql1xX/IgXclW
         MKEc0mHDKtTQTmGR2pnmk5oBs7OVi4ApcjHEdCZw//KEuoNaRJjdaSPm4vBBuuAt+nD9
         Fgrg==
X-Forwarded-Encrypted: i=1; AKwUvBwdT2L3BoOZGG6CyVTKIxFlhHWWsYh2pkx03ZSHnAdQJR06I4ZraD75+oiH1K1Sigp1nwAVMPgkYYx266g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Fdy1N6SJsB5AZTuraQZWWKXj4Lt55fQx60XIsCOUaXU7FbJBD
	F1Nvz1zuLWA77R9Q2q0oumlnrMXsZcxLGOwjmlYf6OWfa9On+aIfg/QWiAyhVHGcFfU=
X-Gm-Gg: AYBFou1A0MlW0GzW4HxD7xOsoc0OThpyTqZjm2QiXEDE8i3mI/GyunLF5XYP1sjBUr9
	bNQrVyS5SGUrf7WfiE5b1Gv2XPrRgEQxyw96es3K9L9XpSlGZSSr1j2fxT1SID59vcHGiQIR+1A
	yGvXc7S5loIqn0b+GW84ZEb3/IBvChg/njfm2fZhoxbPIRDuibxosOcfvDorP9qt8B5MpFUcQwy
	FmcfZNQ1Oka+nGymi9qaVtP454/Ju730QRK/1q3zb0AyKHjmYN1VZ4DKEPH24zd4I3sIdnrwKm7
	dRqo6KE5RQF+E/K5tcZdGcXMvLYV6+16gO3xzd5Ia7X4gDiY1kL29DLiuVFfUZ8jClRZWLaWAaF
	burbQoxCQ/9m8rQiBaluoTuofgEJ3aZ3EkBW9TvVjwEUV4Jikcdxkh/ph+Yyta9n1Ta5hGdlLGz
	bwgY0qWTpnzD4EGdvC2AelQbPqvl4+tWq/FthP2B5AoTtOeSn8T2yghrleHApj/ow2jBvfJtuGI
	94VkUps5SGZUC8HQJSVYRo5S/PeNQI9GOkzA3Ahlwe92d7DOU0O7beBfyUMNmx6kIQttkJGvvsx
	whqjh8wvTrtChzAhVxZ37diCpzWFEz/ZhopVpqJc+Ty0ryLSxQZdVV0qB2bw2+C11AjCTX04OLf
	EUNZL/k4i4gFFixSX8pYEoMsTzXZKqo1eeZ7w3IKUP+mIH0kXevMIkk+0Q/SAVTFU2oa0nA==
X-Received: by 2002:a05:6102:4194:b0:7b4:9eba:69dd with SMTP id ada2fe7eead31-7d0543c880dmr4776321137.45.1793738992639;
        Tue, 03 Nov 2026 12:49:52 -0800 (PST)
Received: from soleen.c.googlers.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8d77c6esm117398e0c.6.2026.11.03.12.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:49:52 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Mike Rapoport <rppt@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Pratyush Yadav <pratyush@kernel.org>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org
In-Reply-To: <20261103172251.2348370-1-pratyush@kernel.org>
References: <20261103172251.2348370-1-pratyush@kernel.org>
Subject: Re: [PATCH v2] mm/memfd_luo: don't use memfd_pin_folios()
Message-Id: <179373899206.721270.10991415543158845800.b4-ty@b4>
Date: Tue, 03 Nov 2026 15:49:52 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

On Tue, 03 Nov 2026 18:22:50 +0100, Pratyush Yadav wrote:
> memfd_luo takes a snapshot of the folios in the file's mapping. To make
> sure the snapshot does not go out of sync, it pins the folios in the
> file via memfd_pin_folios(). The pinning also migrates the folios out of
> MIGRATE_MOVABLE to make sure doesn't land in KHO boot memory or in a CMA
> region.
> 
> memfd_pin_folios() does not lock the folios. So it can race with
> shmem_writeout(). A folio returned by memfd_pin_folios() might already
> be in swap cache. This happens to work but is fragile. memfd_luo looks
> at folio flags and index on a folio that isn't in the memfd's page
> cache.
> 
> [...]

Applied, thanks!

https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git/log/?h=next

[1/1] mm/memfd_luo: don't use memfd_pin_folios()
      commit: 9d07522bf59b3eb4b89b3a791a780a30884bfb5a

Best regards,
-- 
Pasha


