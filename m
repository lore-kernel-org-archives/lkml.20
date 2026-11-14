Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794672969;
	b=YDzNOsKAn0TkqyNjor5EwpxJkT/FFk+z6SQvc6ebvRgGnj6k7SLH/N/lbPHqUHp/wWk4
	 ACAusNfs6cRH1Bzj5/sKT+IprMS/cr1Xci1Qw+mNYwcHRoZyb9hA7fkxLB5K5Ozj/sFLj
	 ViMqg0nZE3RTGN8RG7YLTvdDVuADqksxtxMuCxykndFltmGPxFqsxDSy9dhlniLo/28U/
	 Zg8rXhy7KKxHkNaiUD8rOIvR3ETI9IIClP9BNGGnpquUpvDRSzrZyQVWd73hiFP74rbO9
	 MZecYCSBJdN+a705cOW+dKhwFQMW3gaBMT2q8KjxXNDRED9wDYN5nagVvNYwCItdFSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672969;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Date:
	 Subject:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=125l7MOxbVHbhGudwwrdjbz9WLUhsq9LcYtjiXE2fnQ=;
	b=ETfL9RttZHJ3zi54cU5d1kDhsvsv+1KsbIryztTz6Ig5g0bi77GARMV3JqKsnu7FQ590
	 MxgJ7ROjnb1k/anLHjP2Xw7EKQcow463zOQfoqKtDqxMhN+6lfOjkRaZNvOPsFnD7c5O0
	 F85EtZIO9BwZ5+5JPvXJPf2QMNzQD/HITCllsD3hvSKwwSzGB1XkqT8haH9nfFxL77MT/
	 a/qe3orAyZ5NHRmQnGa9FfXAdqo6dgbfW0PQsbOtIvaqB4Dc1GNM2h1ElYh+YJZpHdgAi
	 YVnIpI8HkkH0kPARNCXxC/ZC8D7hbb5UTG6cQIFOm5yAQfGcwhoqFSN4ukilFY3t9lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=5hVpRiuN;
	arc=none smtp.remote-ip=79.135.106.113
Received: from mail-106113.protonmail.ch (mail-106113.protonmail.ch [79.135.106.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C64606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8C64606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=5hVpRiuN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1794672966; x=1794932166;
	bh=125l7MOxbVHbhGudwwrdjbz9WLUhsq9LcYtjiXE2fnQ=;
	h=From:To:Cc:Date:Subject:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=5hVpRiuNFxPuNuHh65fJ41C4lOPzmdgrGlh32RVO3/RlXoj12CoMzX1yHkMSRv6Mb
	 0nYaF8aqAMWDlDF8rzi+6k+ZsCQYcqTO1D1hm53r05x6hOD1pMlaUYcir/Wwbtlp4z
	 LRM5LM7jlSSZ8tcIL0dOdCR3OKhhyDYsu7W02VyoGXhDgv3XNt/oZdkayq3NVcK7/O
	 xtveI+Z7JrnaDAERWkL9b2uD5ySFKqK756csFR3NzKaW7g1PXu0qu8+d6tmFm3Rj13
	 gBIbwQb3n5Y9edDynNuUFuYyaG00OLitWdGaIimtMVOFiFnbRkUd/U8nDni9atgaYj
	 J3trEDeurW3AQ==
X-Pm-Submission-Id: 4jRfPc4wTrz2Scmb
From: Michael McAllister <me@michaelmcallister.org>
To: markus.probst@posteo.de, luiz.dentz@gmail.com, marcel@holtmann.org
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sat, 14 Nov 2026 16:15:55 +0000
Subject: [PATCH 0/1] Bluetooth: hci_mrvl: Fix duplicate serdev open/close
Message-ID: <179467295518.97469.12346516231160594592.marvell-serdev-v1-0@michaelmcallister.org>
In-Reply-To: <341e56b1ff7d8a5b109e26e30dfed61faa54d603.camel@posteo.de>
References: <341e56b1ff7d8a5b109e26e30dfed61faa54d603.camel@posteo.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Markus, thanks for flagging this!

You're right, hci_serdev already opens and closes the port, so the extra
calls in the Marvell driver aren't needed. This removes them as a
separate fix.

I've build-tested it and checked that the duplicate-open reproducer
passes with the fix, but I don't have Marvell hardware to test on.

Thanks,
Michael
