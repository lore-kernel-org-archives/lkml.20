Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169723;
	b=W735+6645l6t7T+hxGpJJcxt/68DNH9oFZP4QjB8ROI55HTDqDfhllMWs5dkoFTSMej+
	 rFavevwi9GXMUylESCrfY9nerwLeGoYzVXOJmcINwbyXBZv3GlcETcCUKRziDCo0mP4Ov
	 +LnOBe+AqWucVItc0y4+dZrkYkjY4a81mMAPHGlBYf0icKRaxNT12l6LVGEQFC2O6AkG0
	 JRs2lU7MUUq2F+kPZ776HzbOOgwwQMyGiZvI0IbamTyYybdu+SO0il2NPO7erj/+p5j85
	 rPIekuAfpKQMSsyvh9WBTdjiob+wdADjxxBuX8ojvjDNFut5W+k4XhjgFtbNChYeABA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169723;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=wcKESyKlUe53z2QO1nYuSnZfwG6Mb4uKZfngmDr9m+s=;
	b=yNKHO+tUlRi5wgBL2m+Lis4NteUHsKEtCiMiw+FZVpgcJ7ebkpuUh2XoCna/0PJgXNCv
	 Dia5NObYqZNvIwCcZx+o7SHwZoWPjwmU44bQxd8VasUtvLAzdjNixhgVHBWocVcuqgo3P
	 G077vjEKr//cOhMWW8Z2RwNStZ67hO6udC/wp903suQIAFIwnX8gLTmn1jluCFz6/n8hB
	 oOQ5E3Os1j3Tt4nmwJzcX6UMvxflqKhYOGj4vLuTSNlewnaGSEO6AqjlXUTq+AsCoFsEp
	 QF0+rp/q1FYWeC591rZXYN6X7aG4AYH/XzMr5tGUw75PSlER9E6h08CtSpYNmvZQLBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=GtQ74TfS;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D93B606A334;
	Sun,  8 Nov 2026 20:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D93B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=GtQ74TfS
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 9BA5340E03FF;
	Sun,  8 Nov 2026 20:28:38 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id rJWilwZAF7WO; Sun,  8 Nov 2026 20:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1794169715; bh=wcKESyKlUe53z2QO1nYuSnZfwG6Mb4uKZfngmDr9m+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GtQ74TfSGkD7TRvT2iWVY3SynnnUOQGBEDhAlJkLNo73XS+Un9sROdycb5XsYxC6+
	 Sx47AgPzAv0LDaaokC4CoUiuZVHsuBhokQQ7U5WwzU/XphT6JMSjQPEeNMls6MYd8M
	 +LSdoHT4yf89y4e8oP6R0KvduSmitj2vOwiTAHVzH9aGxWfbHh/s7k90xQd1eLEhWg
	 0Zcc8nhh426LIWvU7F35BMwLwdfyRRVM2BaB/Nl6RIoMrL72ynCwWppnmdwghCuBPS
	 rvsbYTcKoKKCJF347nHXtRWDMfrnfdIFo1Em8FrR1OEdwbEeKlPfiuOLouds54ArmP
	 zFxl8cZZpdDw5/kDtTOYMbp9KLrswwoURZ2zi2K76Mpmc5VFvFfT4a7QfwVms1ncF0
	 8jtMshlSY7gZmyNITOHkSQluggabL8hotOrvo+0KJdps9MvdrtlA0yVXfLId+rUSEK
	 6cO/0IptDhIC7rOGk+qm/HmBto7bsmKhOvBJZrJQstolq9ayPHCGOBUIOFxdtqJxkO
	 iKt84nZgFp3ebM70urX99RFdqDTtPGZGz+WtquVap+iKB7UZKRjm1aKrLbgfI4a4Wb
	 EePKTEr+iZKVNruBrXgLJMvxexPq9m8pv80oR9aC41vtFhGvEl9ONaQnLvadbT0wub
	 tcwpXM90f9rLw5rgk6b2wEaY=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E456140E016C;
	Sun,  8 Nov 2026 20:28:22 +0000 (UTC)
Date: Sun, 8 Nov 2026 12:28:20 -0800
From: Borislav Petkov <bp@alien8.de>
To: Rik van Riel <riel@surriel.com>
Cc: Tony Luck <tony.luck@intel.com>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com, Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH] x86/mce: Restore rate limit on MCE logged message
Message-ID: <20261108202820.GCavDbZJgmwKqysH4X@fat_crate.local>
References: <20261108143751.3af49e48@fangorn>
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
In-Reply-To: <20261108143751.3af49e48@fangorn>

On Sun, Nov 08, 2026 at 02:37:51PM -0500, Rik van Riel wrote:
> FCommit ea324444ece9f moved the "Machine check events logged"
> print from mce_notify_irq() into mce_log() and dropped its
> two-per-minute rate limit as a side effect.
> 
> A particularly unhappy system can spew out around 100 million
> of those "Machine check events logged" messages every hour,
> without that rate limit. A large fleet may have several unhappy
> systems, leaving the netcons infrastructure somewhat flustered.

I need more info here. How are you running those systems?

Usually, correctable errors are consumed by the CEC and you don't see
anything. So you must be doing something else.

.config and dmesg pls.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
