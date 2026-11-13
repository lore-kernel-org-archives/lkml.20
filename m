Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794546588;
	b=vgy5BAUBXnVF9fEhLxfRnj1uIPTPr6NpZc7dmN7Da9/W0bQMx6woBRTh6qGMrD+1QlgK
	 Te/pizJJgehowsHneuUxvW9y3qCYc22wwkLeK5GGYownthgVj7ruJdRwGe77VxrITce86
	 cN18G4xiHAscMgce+UIGP7IrwZ6yoIwhUujHpDX4vnv6T0bmzNiPymFGjFblMB7mWsGyY
	 jr6Ys5HYPAGziMTXiXm9PPgASKlEAktCkbsn0d9xmJcFjvJJ6Fw2Evp/h03T9/EedpKkC
	 +WWbadUH2u7C5NUeSiJOxeDgdilDCuzQo040yHWE5uC2N0YYZwe1Vb4aLavlrsmPH3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794546588;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=T5u9/ZcY+fRSY80vAGaYbfOYQ/8C/gxFB8KcY9lX0es=;
	b=xgFUkIgbIxH6ZFWr6GNJpQcQFSc1VWDrvz9NLqP/CAOk4iIVSFaJVuw8NEoWRYCPmEvh
	 ciPKpTURAMxOKWssPCUZDzex9CpLW81sgWzabLFhFCA9+mty082SUMXhGJVKJFM0ZWyeq
	 yp5t7qQp4Q0r2dXqC9V1h6d76bE91nMDNHO97sr3jnFOx+kr1yYcMzuWNDQfyehTbDUWS
	 fCaimt6pxfDB/++i85OBMBz0j+2ApPj4PTX/4HVyI+oD8f3pHSbd6rr28QLKS0xOTOmfA
	 CMx3k9EgWvKGH7nNcAjGoKvb1PnlXpAZ7DSEQz9eCR7oMB9k/jf1mq+qSmydsS/X6tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=VhU5rcGK;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55DD606A32D;
	Fri, 13 Nov 2026 05:09:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E55DD606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=VhU5rcGK
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7E1ED40E021B;
	Fri, 13 Nov 2026 05:09:45 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 5i_g7zqmnJPz; Fri, 13 Nov 2026 05:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1794546582; bh=T5u9/ZcY+fRSY80vAGaYbfOYQ/8C/gxFB8KcY9lX0es=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VhU5rcGK/biCE4rhQh5V2A6RLSpUTHl4cnNpQXBRy8doC9W30xBkOtwKYMPorcUk6
	 CPmjvAhQrbHsvwul/uIHoKSQy8s8tK1mthsSB5tRw7Y9U7J/pL0pNYrOmVD6/tqtSO
	 M2DZdPIvydJMykdf13qG+U0m3R0kg0NABXz5cKDTDlcv+1MpTu+X+BMGEGB9LgQ/uW
	 S90xjbM5A5bH71TxJGqGhnzbIa2aMu3T9U5lHaUaVrD/0Irm1/Cjjzk9pOalju//oP
	 xAw4rkclrtjdYLv7frTTpe9VYFchrhc536wtJ94FRF4Pd5FNbrR0YiNY72p5aVLAEE
	 jbU4nOobHRABBoZ1qaxpz3fpqMo/ZvrKazxarZvjJbTuA86wlWFBrcNOj45cBnfNBj
	 Tq2VkpBIjtp0Ld9Sn4rK6Pb0NcFxQcoyOLDmdXV/eG0pxSbAsz5TrEzMH9NBEYxXc9
	 p67aI9Vd/3N4dGalNhbyJdo3B8OUnaXkq+umUXziI1ftqkhD5UH9jC1UZlmXjkYqyg
	 GctlAtTrdPe9jPfaqBrGyJhxFjiojos7o6hJA9KU8FVvNuhyRJ2Zmzp1YX6ZoQP3B1
	 yXIy0zc9Pw0hCl0Lyr79nJdAStAHZYMaQz5R1FkXU6K3MypAqAUEnWRiTEoRqLPn4i
	 DKTOw6T9OwoVRw8cXaeq/Wfg=
Received: from stx.tnic (unknown [209.52.143.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B83A440E0184;
	Fri, 13 Nov 2026 05:09:29 +0000 (UTC)
Date: Thu, 12 Nov 2026 21:09:24 -0800
From: Borislav Petkov <bp@alien8.de>
To: Lin Wang <wanglin@open-hieco.net>
Cc: Yazen Ghannam <yazen.ghannam@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Pu Wen <puwen@hygon.cn>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Tony Luck <tony.luck@intel.com>,
	x86@kernel.org, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 4/7] RAS/AMD/ATL: Match AMD CPUs only
Message-ID: <20261113050924.GDavabhDniAGJMUgtH@fat_crate.local>
References: <20261029053313.46323-1-wanglin@open-hieco.net>
 <20261029053313.46323-5-wanglin@open-hieco.net>
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
In-Reply-To: <20261029053313.46323-5-wanglin@open-hieco.net>

On Thu, Oct 29, 2026 at 01:33:10PM +0800, Lin Wang wrote:
> ATL matches Hygon through X86_FEATURE_SMCA and X86_FEATURE_ZEN, but

Ok, I had asked about it but that ask wasn't met with a lot of enthusiasm.

Before we go any further here, I would need you guys to go and define
a X86_FEATURE_HYGON and convert all the matching that Hygon does with
X86_FEATURE_ZEN to this new feature flag and get off the _ZEN flag.

Because the _ZEN flag is an AMD one and you have no place piggybacking on it
because when we go and change it, we will break you.

And you don't want that.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
