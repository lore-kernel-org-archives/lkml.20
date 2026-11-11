Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.212
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403730;
	b=T2YxvmncBBQC5g1R2MyWg81L2qeuCTIsegdaWg2+MOHKLBjK3hQYpeqRgXGDYKeuTeD2
	 mSZlEgqARFsRjJlCqRZVKRHANM3UXwTM2q3yOLykd21mP1SP85gVCtiLIHWWZq/nDqAw1
	 BLQBT9Uy9B2QBxkXucSvHt45qBZcy4nhIYmqVBpb9tDopfkWs7E5xyQoqqWCrCQOihbnL
	 w0JDKYwfJXXtih4NWPR+h6Nd35tfl5xkKskuhysFfuBRv6MjVcQIvXFEOrorC8gVLvctN
	 kyK5UzBlzR6kVEY5ajvpPUtr573qJa/K6W362uWvPuRqCfRfoBzH89FKrkyaY/m2zRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403730;
	h=DMARC-Filter:Date:X-Lima-ML-UUID:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=5c77N8u6Czt0/5d/IqrCtfC0JTKdzHTT9pGNYKLsZT0=;
	b=vip08DEMpy/aeoHm4WKjhZVscvZswCzuNeFfi14bvOqW9wrZEzqvepxbri/kSXD52Spo
	 /jF14emXSjY85LZXNn8NqF4JH865f5hL5mtq1l36Z/s3Ij0LnBb37TMPQRXzUWkV0DPK4
	 mJnQvjPkWoHMACaSHu2/RRFY/U8dkQ9cQbNUBnNqRXOkWlgx/fDlYO5LD1A3jPvJGZQoF
	 GucCU/9DXtg42K0XyYKKWvkPXAwJmZ0BYSBx03phheBhcSgcJAZJRTyUn6KVXhg32W7/K
	 pNeEbVNlyXYCrtf2rnMu8Z7u9MotctEPqjOtnJKmdPTVd7T0coj2Xc71aFt6myT5nfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b="uR/uH5By";
	arc=none smtp.remote-ip=91.216.248.212
Received: from bulk0.mail-out.lima-city.de (bulk0.mail-out.lima-city.de [91.216.248.212])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE8E606A327;
	Wed, 11 Nov 2026 13:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EE8E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=uR/uH5By
Date: Wed, 11 Nov 2026 14:28:45 +0100
X-Lima-ML-UUID: 0411ba56-6847-4d61-948a-5fea010dad0b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1794403728;
	bh=5c77N8u6Czt0/5d/IqrCtfC0JTKdzHTT9pGNYKLsZT0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uR/uH5Byu+dS1eFzmUF3jZvpQGJBETq1H/V7Rr9PL/U3uV9/GORpICPPTzyrTYyJF
	 DU/a+GDLyByg9xP5KGndhNho69VWjMV9zfam66fD2tT4X41QPKnuvuZAoWNVw2wlA7
	 eTKj3lyb8+ltZH/DyMWQOG2niqdbkYWqczLEi00i0EldschU/KAzCWwiW6bBN7D2Wx
	 7RmRrLsrA2dKXjUizOyiANw3XqI376tHAqoTiwzZhm8LZufHIw/CV/wM1BCzhPy4Z/
	 3j4CURuQBiGDvOqWHXjZS1ID3xHt71FKgRFYneuEDn5hYmVxteQ64O73Ie3+JOKSHI
	 w7FoqAmuw5uRQ==
From: =?UTF-8?B?QW5kcsOp?= Eikmeyer <dev@deq.rocks>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: westeri@kernel.org, andreas.noever@gmail.com, YehezkelShB@gmail.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Enable runtime PM for the Ice Lake router
 with the software CM
Message-ID: <20261111142845.25b6ac67@kait2en-mbp15-1>
In-Reply-To: <20261111132112.GI259790@black.igk.intel.com>
References: <20261111130851.62101-1-dev@deq.rocks>
	<20261111132112.GI259790@black.igk.intel.com>
Organization: KaiT2en
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 11 Nov 2026 14:21:12 +0100
Mika Westerberg <mika.westerberg@linux.intel.com> wrote:

> Cool, does it also wake up if you plug something to the TB ports?

Hi Mika,

yup. working perfectly here. There is also a bunch of other patches
for hotplug and such. I even get pkg-c10 on all T2 macbooks.
But that is for another day.
