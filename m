Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253960;
	b=1w++8NS2NRq+MWzTds42KT751xVbxo2ppN3wqDOW19JE0JAtVHEKPOqxKzAckL8s5tRR
	 gALptdckldecXF1zZm4m5PNjHeIX/daaNZBGgc1DEABs7AmZwRd5hcV6FrRIP7WbZr83K
	 nCkSOYVqcLm1mYhtgR923rQmWqAxRAi57qbblofc4wjTNNfYU0JdvJJ9nbySFM156j+qE
	 wYLyqb4r2Kw22ZlU/NbON7zxE3PR/YBsHai5oEa5KBVzzHR5aG2Z0IqW62jKSL3nuu+Xn
	 AwYZxwj1GPINdjEDsh+oZuB4Nmg9CPyv/5dQnmf6hZhqtjYIAyBT9q/xxots9aEsGhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253960;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=NpLYCJh/kpJH0Sg6e1vdUbkkGlRGgIRQExLjSJ+9qSI=;
	b=fLhM1Qo2cL7FtcdFqLgzA4Q4xjcmz1Hq5TUsbbbWrO11B2IKqO3I4SwsTqJyZ0UPZB/z
	 UDJXzJJNE6zQzswLyFdaey6KWgsyQsWQvkcjWUrBc+8lSFUN1aezuRxMjDjjmRm+9jopr
	 QieaVPXF3wWKbhr4qLj7NB6gXgUj4jHaUYCcgGilOhS1+WUZNUxJwIJn/0NTrRlM0kJPY
	 5u02TzWnDDxq+2JvnXKPIG1ArD7ZKzYlScIqPPaW/rc+Iz/WYFtUiTuwXUxIVK6UWFTLh
	 7GUuvbpHOf869sydnBdhMK1P3BhMwOoMAQkx7oHYvmuN5R16QcXK3BwIsa0jFJCtiAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=BRqibKh9;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43750606A325;
	Mon,  9 Nov 2026 19:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43750606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=BRqibKh9
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5DFEF40E0255;
	Mon,  9 Nov 2026 19:52:35 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id eFplIwcEG0hI; Mon,  9 Nov 2026 19:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1794253952; bh=NpLYCJh/kpJH0Sg6e1vdUbkkGlRGgIRQExLjSJ+9qSI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BRqibKh9PVve7Bz14XuicuFWwoP2UYGSUuPtH1x4ao7Ho0I32WOOTROcdKOW4N00U
	 neHLUHyfad+sz3OLJwbemWNFIPwK+GewGUgsFGdmvLHeXZwbMvzzaIyfhttoeP1/ls
	 CMdf6KxouE+ln7Six4HoSA+WT9yDJTSVnKp2dsBJ5up1lmQmN0TNpB2tKwRn/TwetE
	 2O3z/HFbzD09IKuI4s05mkG+Bm+NX1BgRiDx+BtxLaWUBlwfvP2YkGeEZqsqR1Nxg0
	 2n4QdEM/0cFaQk8+EiXurv0Yq1gkXlSdvaGQncuMsjMujSMT367M9wPLBmhrwjRRaJ
	 fWa8ePc8y30ByS49FdarVph/XSp4Cmit5C3GJuLSWDxJga/MUommlC4zQkNDCxY8fW
	 Esz3eGNs0iNPO5UCa+Z1QrNZ/P4tiIWBvprnK+GaBHdFvEUOIU2f7njqACZz7sZhsd
	 BJuyONveniIWcOj+QSAK1riHAUs5Ttp+zPxK5t9Naiwcg1NMs0gPEJS7INJ/5UU3ga
	 VnQ5h1dYGGhUlMnLVwPTOf+RhSnd09KprJxYrl+2jvqZPD2GCSMVzGjkBazef4cOsu
	 C4bIomXXOx0rjpYIsjYKCihlmUmghhkdA9NcUOPRBzPe0BJkvyR6MRsSOKNMcAboRU
	 qm3qeo58+ub1TYdpK+EG39Mo=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9AF6040E01E1;
	Mon,  9 Nov 2026 19:52:19 +0000 (UTC)
Date: Mon, 9 Nov 2026 11:52:16 -0800
From: Borislav Petkov <bp@alien8.de>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Rik van Riel <riel@surriel.com>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kernel-team@meta.com" <kernel-team@meta.com>,
	Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH] x86/mce: Restore rate limit on MCE logged message
Message-ID: <20261109195216.GBavIkcPlh-HcT_7JW@fat_crate.local>
References: <20261108143751.3af49e48@fangorn>
 <20261108202820.GCavDbZJgmwKqysH4X@fat_crate.local>
 <CH8PR11MB4034331B3E52AF39AA9C003E68FC732@CH8PR11MB403433.namprd11.prod.outlook.com>
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
In-Reply-To: <CH8PR11MB4034331B3E52AF39AA9C003E68FC732@CH8PR11MB403433.namprd11.prod.outlook.com>

On Mon, Nov 09, 2026 at 05:54:34PM +0000, Luck, Tony wrote:
> mce_log() is called from the interrupt.

Aha, through machine_check_poll(). Let's hear from Rik first tho.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
