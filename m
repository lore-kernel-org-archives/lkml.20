Received: from achilles.noc.ntua.gr (achilles.noc.ntua.gr [147.102.222.210])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82D1231ED7C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 20:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.102.222.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789503801; cv=none; b=FAZLHkAa1mZ6D/8rl+O0IsPV/vGIHr8pQ43lattAsPAFey4xCfa/IIobkNZlmk0tFK4qf7nyVo807uxDoU24a71bR0yrbZRvkbbINMufgu70lEOXcR2oR/f+m8oDmHI81RHoKmnYBi5vC9nBV6sB1hRoXlIug+MuSORB02PJ0jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789503801; c=relaxed/simple;
	bh=p4DJxDGX45CwjWp9sjKGzlhS/O821CmkQBl1CQw054M=;
	h=MIME-Version:Content-Type:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID; b=YbURUOMVWX7ZlK7h42DXo5kdOJopP13y6YCDj1JNcGWEG05O0ndJm3C8CpG6nYJad/edJOHxwpA+WIi8rNi8VC1k3gPlpVQcnihulS4AUTbwxgk4hNZMdofzSL0RwcDk4Ivzwh0rmvRFhWhhoQZ6Nuzyu2rvi4ZcKrjoWZq8fP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cslab.ece.ntua.gr; spf=pass smtp.mailfrom=cslab.ece.ntua.gr; dkim=pass (1024-bit key) header.d=cslab.ece.ntua.gr header.i=@cslab.ece.ntua.gr header.b=HeyPr/np; arc=none smtp.client-ip=147.102.222.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cslab.ece.ntua.gr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cslab.ece.ntua.gr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cslab.ece.ntua.gr header.i=@cslab.ece.ntua.gr header.b="HeyPr/np"
Received: from webmail.mail.ntua.gr (webmail.mail.ntua.gr [147.102.222.247])
	by achilles.noc.ntua.gr (8.15.2/8.15.2) with ESMTP id 68FIFmiV017180;
	Tue, 15 Sep 2026 21:15:49 +0300 (EEST)
	(envelope-from dchar@cslab.ece.ntua.gr)
Received: from webmail.ntua.gr ([IPv6:2001:648:2000:de:0:0:0:247])
	by webmail.mail.ntua.gr (8.15.2/8.15.2) with ESMTP id 68FIFiE2012309;
	Tue, 15 Sep 2026 21:15:45 +0300 (EEST)
	(envelope-from dchar@cslab.ece.ntua.gr)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cslab.ece.ntua.gr;
	s=ntuawebmail; t=1789496148;
	bh=NIw3TqKdf6r1lTBpjlNLZFk1uLtc0Ed3f1SchXTgv0o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=HeyPr/npOSvdsVDUib5gkZ9sbZRPRn38Pk84aEkWYXtArv9KQ2bNzholvNvWF6/n7
	 7rWqD5OG4M1AmOrub3JdnpYMPBj+knA/OuJ4wl6S+FQeuLSwLKBwajqjQ2FouEGdk+
	 CYz39R6W3IvirqX0fEnHYflOaHSum6of5anveH2s=
X-Authentication-Warning: webmail.mail.ntua.gr: Host [IPv6:2001:648:2000:de:0:0:0:247] claimed to be webmail.ntua.gr
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Tue, 15 Sep 2026 21:15:44 +0300
From: Dimitris Charisis <dchar@cslab.ece.ntua.gr>
To: "Liam R. Howlett" <liam@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Alice Ryhl
 <aliceryhl@google.com>,
        Andrew Ballance <andrewjballance@gmail.com>,
        Suren
 Baghdasaryan <surenb@google.com>,
        "Matthew Wilcox (Oracle)"
 <willy@infradead.org>,
        maple-tree@lists.infradead.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] maple_tree: fix maple_range_64 crashes in RCU mode
In-Reply-To: <npw6xqsjzsdmtezkca4osoncnle62wvde7ycaladk3xzlmzguf@d7smzgbzsmpj>
References: <20260913-fix-maple-tree-range64-rcu-v1-0-31a130bb8cbf@cslab.ece.ntua.gr>
 <3aqxp6zcomm3wzfc6jt4nhltutnvoatqqsjxlxpxlo3j72eeva@nkqwz43zxsug>
 <npw6xqsjzsdmtezkca4osoncnle62wvde7ycaladk3xzlmzguf@d7smzgbzsmpj>
Message-ID: <b2bfcd9b99d52bdc9d210250216bf1c0@cslab.ece.ntua.gr>
X-Sender: dchar@cslab.ece.ntua.gr
User-Agent: Roundcube Webmail/1.3.10
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.6.2 (achilles.noc.ntua.gr [147.102.222.210]); Tue, 15 Sep 2026 21:15:50 +0300 (EEST)

Στις 15/09/2026 20:13, Liam R. Howlett έγραψε:
> 
> Please respin with a few changes:
> 1. The message in this email will be preserved by Andrew including it 
> as
> part of the first patch change log so "I was running a patched 
> kernel.."
> should probably be removed and made more into a change log statement.
> 
> 2. Add the testing to the userspace testing patch to enhance the test
> suite please.
> 
> Thanks,
> Liam

Thanks! I will, as soon as I work out the way to properly add the tests
to the suite.
