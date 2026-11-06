Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=84.16.66.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793950254;
	b=Poy0uafBH3NNWw2MncnB0/dnJpMclaQ1XAngmLfX0Jg0gQRNwXzsPyLGUTeQitMOX9AZ
	 86bm4C+9yOFZAxjS6zl2WPEsfgM0fMWo2RJiJgUKfQFC5fkcRQNko2cbZ/39qQ4fIImx1
	 u731nwtxae29b4H9Eal1W2VopaXVouaTOEbj3exPlFRvBp8MaOlAAY6gJjl6r5/9aJwi1
	 oP2w/jTZIb8QeRjuO2sKPctiof0t/gCGU/f22QA6/g1xsFiIvvws+Be9RhS7LFsNACv9x
	 ucIkCysoXFbmrhTwQ3w5VsCWoO/U1MrKbmxiQPA5xXU8g8/B2lwmy+m2yXZ3nCd+FrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793950254;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:Cc:
	 Date:Subject:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-Infomaniak-Routing;
	bh=6qwCT3Jvu8lkkM6R8PHy1mSFbjl1ytyEVmTgryXfzvQ=;
	b=jQJhHAW0zOeh1lGGSAB27BK18oHnb6roWaeJGYLcqXUGwz9s7nATH0KQzx+OkvmWf/nl
	 JbdtnrJ6cN83NRTe9n9Oz+5lOCdX9j2TDnt6Prm2hjRb3VUEXtuA4SM38L1/vCBMJ0WMW
	 nLNlWoJ8ef6+9EhsT7uOZU/dJ/DT3tSNIAJrCp4X4S8EKYsf4AItmQDFpnx/CwsIHkv2v
	 Q76mUay01pUV9wZNi4mWOO+/QIvdlW3qM9QGP1R4DzcvDyCn1irznRPz4zlmEEsw6TSJC
	 b0LFNYy5FFhntvj3xfFJnBbIVFTAiiF6J/izip6nJYpmFudUo+T2Z3MWDBVVFl9KvVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=daylightlinux.ch;
	spf=pass smtp.mailfrom=daylightlinux.ch;
	dkim=pass header.d=daylightlinux.ch header.i=@daylightlinux.ch header.a=rsa-sha256 header.s=20261016 header.b=Jf5ysTyK;
	arc=none smtp.remote-ip=84.16.66.175
Received: from smtp-42af.mail.infomaniak.ch (smtp-42af.mail.infomaniak.ch [84.16.66.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A40F606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A40F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=daylightlinux.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daylightlinux.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=daylightlinux.ch header.i=@daylightlinux.ch header.a=rsa-sha256 header.s=20261016 header.b=Jf5ysTyK
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jLW7B1N31zdCg;
	Fri,  6 Nov 2026 08:30:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daylightlinux.ch;
	s=20261016; t=1793950245;
	bh=6qwCT3Jvu8lkkM6R8PHy1mSFbjl1ytyEVmTgryXfzvQ=;
	h=From:To:Cc:Date:Subject:In-Reply-To:References:From;
	b=Jf5ysTyKp+sZFhcUaqaZP/yJR3L9J4ttB5TNtUybjfbNZF/hM9rW+JlYELAyAXsYu
	 55cRDkfDVNNI1YrBu5Vf0MwaI5j60Ul40sUhtAkFSj6B93vWIAhChFjPGrEkD/amTs
	 ow8mSwCL/nSYaBnUazdPek2zNct3klAMzGaQf4zij6mp+nFK/oSSgzooMLQ8g9mewO
	 hx9J6cuuZ9m7avyywWx9sEdLQ/oALXovFg444QgzCX60INvseLCwD8uJKfyWrplYpl
	 87UiXx9c1CZkL+7boyLLzpn2MnaS4OW6yd1iIEEhNYo2V+MtUQf9ocVH5PGgmmKI7g
	 OJggACS81f/pA==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4jLW79134bzWtq;
	Fri,  6 Nov 2026 08:30:45 +0100 (CET)
Received: from unknown by raspberrypi with local (Exim 4.96)
	(envelope-from <info@daylightlinux.ch>)
	id 1xPEPM-001IFH-2G;
	Fri, 06 Nov 2026 08:30:44 +0100
From: Hamdy Abou El Anein <info@daylightlinux.ch>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Fri, 06 Nov 2026 08:30:22 +0100
Subject: Re: [PATCH] kbuild: detect module name collisions between '-' and '_'
In-Reply-To: <179393591106.309869.2814629602029032688.b4-review@b4>
References: <20261103110411.11698-1-info@daylightlinux.ch>
 <179393591106.309869.2814629602029032688.b4-review@b4>
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
Content-Transfer-Encoding: 8bit
Message-Id: <E1xPEPM-001IFH-2G@raspberrypi>
X-Infomaniak-Routing: alpha

Hi Nathan,

Yes, it appears so. The module-name uniqueness check dates back to 2019 and compared basenames without normalizing '-' and '_', so this case seems to have been missed since its introduction.

Thanks for reviewing,
Hamdy
