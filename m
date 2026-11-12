Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794507706;
	b=UFpTn87t9bI5R6rFr2nu3BMTgq0knjPpQveZJvbbo8ay8+u001QndmXuRyX6Q1MjtQm7
	 mNFracMb5EqJq511J2aQJzlP7rudH4vrGxwVCug8T7PJu/vDM157oo+N/CmiPfKfoOj0P
	 XQ4J/tUXB4iVyyN2+0rGdV/bc3J3FlC5Me57MdgKDQucsUc6iMsh5rK+CmbdTflIMk8tV
	 8YYqmZnt/j117QJzIFqnkY0NmMb0bhFF9zZL1YVFWWAF3BXEl7kZMy0vfr0wdkN9CyzLS
	 GRft0fYjuWT4EW3ZZffeoTOo4LJhJz3/pQazfyiMsJIuTpZn2TTlucIYA6HYESosiwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794507706;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=DUsEdpIuJ3HZXB+zQOH8AaAz5Mu4kTccI9EpC3l59/c=;
	b=5MBAqvTwDrmgiKu099oqgFbdLni74jleS0wUYjalleDG1luCKaWFmOpaE3/V4lOzks2s
	 kVG2jMcTFk1Tltz33EhG+OdH68HxlkEgsRrJKe0KAuWziMc0gcERvaBwXXP6WfgT74bXQ
	 qTe2iiIBwvXvE7uca3OtJB3PASdXqRD+lRRgv+yc/7HWg1NRE72UKYof7qdCzzroniCBe
	 pfjTG5qqM8UqCKwiZVNitIyjP69dGb4hsdDimNFeM8ULRAeGfzLuCyE3DWOImOM56Qm2e
	 OKhCTRqAqGXH8DSJKFOdw4Xev+WtcU4D7xjGAHtMoVa+q0c4+Z7yzieKOVtxurqQwPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=M2qB6Xze;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768B2606A31C;
	Thu, 12 Nov 2026 18:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 768B2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=M2qB6Xze
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2D8F040E0222;
	Thu, 12 Nov 2026 18:21:43 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id yEW-NkbnVpY4; Thu, 12 Nov 2026 18:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1794507700; bh=DUsEdpIuJ3HZXB+zQOH8AaAz5Mu4kTccI9EpC3l59/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M2qB6XzelqlHl/ESwebupW9yS+tOmL51TGYWpXIWUNJoBKSO8O6/6HVE4wcCXZQnF
	 8BbOErJox5BK4AVxuwmb3e4eVYHtDKDGcTNMhOHeLn62OQeNehXX9uSvWJ9LyKxOul
	 yhVO73Unqo5JZWE/FNChI8QzsG2/bJKb2Q05n2Wc+MyUmK9GV9O0B0Ln35JKi+pqed
	 3B5DP63GE1yZmVKyQnbtRicrn2bc1xUOjg0QUrzVeg3338tmxkz4+u7NI28l67Dl/W
	 BWJzGEMiYraUXb3whJZE6gbZ3kiBbOCFk080c8cP/MVZP7RWWJmkzrm4GHdOUSr7/a
	 EC9zXlxoh2RxOje/iZeAlIkYSGkep5Aa0L0UYuYpAenBWmk7jfFsJHPnmg3Y28psCZ
	 pKuqs5ryz8LaLsBqhq7RBBVNri6jad0D54RU07Qy17IjXIqtF1O2LxCZl6rrp7xIwr
	 hkEgXVTmro+4ANQmLKk4vXec71mcfw7Et5x53KsZz1j4gyJnQ/az9R9m0MjIhyrLBz
	 c1M06Nru5jE8OzNDu2QnAo/gToE1GBMOHQ1DgGOvCzQf1NkOL9xg05q3hNRLUrk8SR
	 W1C2X1vN/c1OrRPC4Q1Bt2bU4WjIo2A8vwHqam2Zlcr1GOOVrxkvghqQZzgcQ+Pqkj
	 DBCvIecubY/mzaZSwaHaHP0A=
Received: from stx.tnic (unknown [209.52.143.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9ABB840E0234;
	Thu, 12 Nov 2026 18:21:29 +0000 (UTC)
Date: Thu, 12 Nov 2026 10:21:25 -0800
From: Borislav Petkov <bp@alien8.de>
To: Breno Leitao <leitao@debian.org>
Cc: Tony Luck <tony.luck@intel.com>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH RESEND v2] x86/mce: Rate-limit the CMCI storm transition
 notices
Message-ID: <20261112182125.GDavYDpdJpmpU2Piyu@fat_crate.local>
References: <20261112-mci_ratelimit-v2-1-a9e67055526b@debian.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261112-mci_ratelimit-v2-1-a9e67055526b@debian.org>

On Thu, Nov 12, 2026 at 01:56:39AM -0800, Breno Leitao wrote:
>  void mce_track_storm(struct mce *mce)
>  {
>  	struct mca_storm_desc *storm = this_cpu_ptr(&storm_desc);
> @@ -150,13 +158,17 @@ void mce_track_storm(struct mce *mce)
>  	if (storm->banks[mce->bank].in_storm_mode) {
>  		if (history & GENMASK_ULL(STORM_END_POLL_THRESHOLD, 0))
>  			return;
> -		printk_deferred(KERN_NOTICE "CPU%d BANK%d CMCI storm subsided\n", smp_processor_id(), mce->bank);
> +		if (__ratelimit(&storm_rs))
> +			printk_deferred(KERN_NOTICE "CPU%d BANK%d CMCI storm subsided\n",
> +					smp_processor_id(), mce->bank);
>  		mce_handle_storm(mce->bank, false);
>  		cmci_storm_end(mce->bank);
>  	} else {
>  		if (hweight64(history) < STORM_BEGIN_THRESHOLD)
>  			return;
> -		printk_deferred(KERN_NOTICE "CPU%d BANK%d CMCI storm detected\n", smp_processor_id(), mce->bank);
> +		if (__ratelimit(&storm_rs))
> +			printk_deferred(KERN_NOTICE "CPU%d BANK%d CMCI storm detected\n",
> +					smp_processor_id(), mce->bank);
>  		mce_handle_storm(mce->bank, true);
>  		cmci_storm_begin(mce->bank);
>  	}

Should we merge all the MCE ratelimiting into a single effort?

https://lore.kernel.org/r/20261108143751.3af49e48@fangorn

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
