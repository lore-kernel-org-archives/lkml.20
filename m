Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793321239;
	b=TYT4q0jq00+vLuzj4y8M+E38HmJ3FSlT9/SgT2C3/PetH7x4TZ++WJoNGz1/PDJ+1PuF
	 7g2+fXNQXo5yIEySOHRiCxTbNbdkRjRImK+PWa2c+diiiniuxTTLv6EOQHtc1m1U3A1zh
	 3M6JBl/qLOWzQKIE1bLm9ls5r8P9VxsB3EAdKAg3eRap3Cjbs78P4M8FIWaz8jw/MwKXH
	 f9zCK+pFdX9BiSmuV3YBPN1RgwgJOTtdeqk2X4NM9n+kUXPr69/PiTZRtJf8gl8VoGjJy
	 kh0Kgo28Atm1w7WsVXAz1B4ZgNM4G+KJvq9cJjW2F1Lq0awaNG3DCZ0PVM3fIJE/Kwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793321239;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZyF2bjC8xa+8LIGNcdCcv2LIv8QnDBHzykO+DIKZSFE=;
	b=etoZX0sin2hWYNmgXWLfl8ks7YQag+9Rrmz9BGJHGZspTYGWyQUI3cucS6dXMqVw+tOJ
	 2lgS+Ja6rQH+K8DjBvWOQCOk7DlVBScguk8onIwZ3VE3Zl4R6AWvRVseGVv2AVgGHrSNF
	 9sOhovEJ75X7Rm7xuNlmFyqMRiTqAKz0IZzgGR6Wto4hqsN7mgZjE5jsOIhAapKAuRwnS
	 34f0BIhTZ9rjIXo+QVWeXOSAjPXN/tuMBAtPRYZxkaNdg6uYGKM99xO61yKK52B9eHwRm
	 1OISvMKHt4DzZDrtDTuxrGpkzljFoXINPOX4U+gINq1cTG4OUvf9aa9WQliVPxWHC0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=smmh.dev;
	spf=pass smtp.mailfrom=smmh.dev;
	dkim=pass header.d=smmh.dev header.i=@smmh.dev header.a=rsa-sha256 header.s=key1 header.b=FTF+z8iZ;
	arc=none smtp.remote-ip=91.218.175.201
Received: from mta0.migadu.com (out-201.mta0.migadu.com [91.218.175.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF41606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFF41606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=smmh.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smmh.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=smmh.dev header.i=@smmh.dev header.a=rsa-sha256 header.s=key1 header.b=FTF+z8iZ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZyF2bjC8xa+8LIGNcdCcv2LIv8QnDBHzykO+DIKZSFE=;
 c=simple/simple; d=smmh.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793321235; v=1; x=1793926035;
 b=FTF+z8iZl2ugnpJGhJ/Vy4SRVL9wy9HJ6uor3VCnlsIIqAUcuIY4Mn9rWvWN9JilsmEwmAU6
 abE+o1QQwaHA2to/q+ac9vavMPMY6c6m3eFWpGsaZf/IWeIkzjMKtTAQKC0RHjVAjovWaYYJA2E
 BoCykCEKaRxg+cZytFL4zV/DtbODOi5f0CREjgBN4UKa0RR5Vx1io3b+8dy+wVAdphXvEok7wKS
 q5YYVt+R2hXPs7HhQmo/tRrD2D8Glrw7dUt54uHP7Ih5Tz9ZZv4lDfDVCtcZ2t6PxABwjqgORXq
 qwz6fu59aIQYnfXPI0M1dRhTtARo5Y40X/rnQcaF7Wfbw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 75d895bcb0951c12;
	Fri, 30 Oct 2026 00:47:15 +0000
X-Mizu-Trace-ID: 75d895bcb0951c12
X-Migadu-Flow: FLOW_OUT
From: "Seyed Mohammad Mahdi Hosseini" <i@smmh.dev>
To: eugene.wolferz@gmail.com,
 denis.benato@linux.dev
Cc: corentin.chary@gmail.com,
 luke@ljones.dev,
 hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: Ignore spurious 0xe5 events on
 GU605MY
Date: Fri, 30 Oct 2026 01:47:14 +0100
Message-ID: <c56ca832d450480df59096daeae35ab3@smmh.dev>
In-Reply-To: <CADQe2ZeEJEgE3AoXCtPNAvrggjJmG4WJh=O6++GS+ipRXaVgWQ@mail.gmail.com>
References: <CADQe2ZeEJEgE3AoXCtPNAvrggjJmG4WJh=O6++GS+ipRXaVgWQ@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Mon, 19 Oct 2026 22:28 UTC, Evgeny Volferts wrote:
> I also noticed the related patch series from Seyed Mohammad Mahdi
> Hosseini, which proposes the same global KE_IGNORE approach:
>
> https://lore.kernel.org/platform-driver-x86/cover.1791672579.git.i@smmh.dev/
>
> Since my patch was submitted first, I would be happy to prepare a v2
> using the global KE_IGNORE approach, incorporating your feedback.

Hi Evgeny,

Thanks for pointing to my series. Its patch 1 is the global ignore
Denis suggested, a single KE_IGNORE entry for 0xE5 in the keymap:

https://lore.kernel.org/r/d3871d83ee3f5eea3900d8bc0da1de764a8fc2ec.1791672579.git.i@smmh.dev

I am fine with either version going in, your v2 or my patch 1,
whichever Ilpo and Denis prefer to take.

Patch 2 of my series (0x4F, Fn+Windows) does not depend on 0xE5 and
applies on its own either way.

Best regards,
Seyed Mohammad Mahdi Hosseini
