Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D083876BE
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 21:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791063875; cv=none; b=cZ17TSZn6PSkMIyzKD5HggxIX7wlT66L88KizGQshqo2e9AQNg24qa5BPpBlJPYk5/FbrBRwU/8jP03FlffBgoDN07aOmjPcpIAomEyBnM6xqkZDCQ9U36JQRpUDNSswXnnlVG9mZL+Na7+CE8E31x+JUZVLR0dlSqa05bQayjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791063875; c=relaxed/simple;
	bh=XyONMfQ+UxmdbuwzpTC5fPCMO6vTJ5krr7EWqS+Skr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bWRxxMBebZmQT7Akvg7S0OjcHVQwYF/oVWeFhYOsOY/1eZDtV4nNCG0knIon6yBfYXuPXGqTp64j65gDb2rtyuhMU5EEJe6NzerpaH/e0UOk7spbagW2re64RhX/fa9ebUANcq35zjZcLoXbKiYGugRMHKXBjetn9Bts6ggnqd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=XeYbMlXq; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="XeYbMlXq"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 4BDB440E021A;
	Sat,  3 Oct 2026 21:44:29 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Hr7a2RVOpNMZ; Sat,  3 Oct 2026 21:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1791063859; bh=ZfElEK55180GLmRFxRAvzqsE81O8LoDDsMEOdg39UcY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XeYbMlXqA1O8lFk9cKAfB9A28I3OdQnluBq64EJkHQ/GsDr1sa1EzroTQsnkxxhcE
	 1dMIscHG4fTQMfQW5otuUz963aD+LO+AfEABXtKgyvdHGvwXGf3YnCHPs4jueucCzl
	 rrIBwf0iaB0fgXxWMNxn5GcJkyNeoXlkbb3V8Gopnqq8siSD00pu2MskyWMwhyZT35
	 woMTyKjZeHXZn7bhc7wMWw2Zjck8EVSY+PdFbylCxBgijsT85m6ewjKJqCCQKV4XHN
	 naqy2L48J8J03btvn+qud/ukYv9pajvuHjsGHtDshAsyVjY3X6DVL0twlW7d5hXLFn
	 wOuOIwD/v5QHQ95sMeNq98BznoCxD/QdzRp2Yko2Tn/BPyu/pPDRVX6eR33b9Yi6cB
	 q9YkSoPP3ONwhmdPCK8SPH56iDTGEXyDK0MQ3tpB5/5vRyOEkHRmnxk8KVbb+VMnfW
	 4qEbnqpMNihRVyW9Qd6rcdloKEdW1aHofpn7ivpWkRWtiF+t9by6Gmq9KFlC/iSVlv
	 E3RfFFIuaIphAR8bMVNXu1rdxXTf6rwqil6VTuEFF5GTdp5VyeTrFzjbyLTERr63L0
	 5qFkeSV0mzIl3UYFlxiOJ+E821BWSnVkVKU1wnY7AI3iGd/pSDQvKD7QYyK73Jzo5a
	 EGLll0oLtkAPnp/kqln4c9Xw=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id BCB7F40E00E8;
	Sat,  3 Oct 2026 21:44:12 +0000 (UTC)
Date: Sat, 3 Oct 2026 14:44:09 -0700
From: Borislav Petkov <bp@alien8.de>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Borislav Petkov <bp@kernel.org>, X86 <x86@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>, stable@kernel.org,
	Rik van Riel <riel@surriel.com>
Subject: Re: [PATCH] x86/CPU/AMD: Fix AMD TLBI Erratum #1718
Message-ID: <20261003214409.GAasF3KTcTWIQ9t3hY@fat_crate.local>
References: <20261002211617.1001617-1-bp@kernel.org>
 <asFqr9OEdRqCJKWj@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <asFqr9OEdRqCJKWj@gremlin>

On Sat, Oct 03, 2026 at 10:24:40PM +0100, Lorenzo Stoakes (ARM) wrote:
> Hopefully some useful datapoints also - + I hope there'll be a firmware fix
> for the threadripper too :)

Yeah, working on it. We'll see.

Thx for the datapoints - very useful.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
