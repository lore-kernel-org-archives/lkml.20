Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311206;
	b=t2fMs8nW0GNli+tcjsUj8ZfxwqWC02/XhwSj+eqOEqKYRCKvYxQLRSZ1KWFSUmXZTgv3
	 A12xMc5aTHFZBjCB4P8a3bUNPB0AwljJNUEafY6ecZN6vdGg1GvyO/jCtPPhinjT+6zoh
	 LS0Zej0iMrcCtejdW5AKcm1j8J2kWfcFZBJqaH+Az1jT7y6mq39UWrUt41N6Tn/IlUxlB
	 DJe3go4qXDRaxdIMklJl2DUtm8LXURWV9wu057lUwVNFnpkIIfjhll032lP2qfy5ZbsYo
	 rKQ/qBYcGc0Mob06sna3vuij7Ifgxe9dXxg43ecyYx9kJeAp5hycPF2nwRkYF90z90A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311206;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=+mxNaERwxQq956ZCj9Y5CcIlxgzFYJgtWrJGQcrIJDY=;
	b=jkwvYF7lZ1MSDYvTI8oaVPXxXyz5/TlvXF5kHshWGTWFBhiM7Zi1rbgNaROvefdqyYK3
	 1fZZLoA4c7Joq9R7dtmxNmxYhy4B0Ap75QgRE8S5fq/3TyPoXga581ic2TBDbtIuaPcql
	 JatJDCKsvX0fWvVk9XUeQw4h76dcOdajPqZ/zedAKXKphEK/DnIog6v9prXx7BZSeubiT
	 KDfewem1dqdMWyS/Et04vibVhHWJ5nGM9HwLxLDFQ5V8wYZHNgWc48xiMZy8o1XFXSaWK
	 Z8RvsZi0Aj6ytrfLRq2LCh+NjOyi6m1bBeThepyusGkKmh9hONqz1jJdDPQssOxiGIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=boLWSXMu;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88168606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:46:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88168606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=boLWSXMu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=+mxN
	aERwxQq956ZCj9Y5CcIlxgzFYJgtWrJGQcrIJDY=; b=boLWSXMuwS91DCg+uHyO
	Fu0C0fx99irHNc8zJj7ekPZ8psWctBUkyteJYXCXR9y6wlMA1I1+W9ipqVWJMp5/
	TU8psAcibhYxjYfTtrxz6xEX4WfQHiEmblNl0NwhXRsBfqiI/FLNbE9x3cnooV97
	I44pzuakGZiIK4dcDRBWcPv6M+PgIO+SOK5rkZM6irYks6Rcv1jT6ep+5CylG+I1
	iGwsiu8brTgop5u+/R1VyvJUMDSUosx3Cmj9JOxeeCnVLtDa1K623nozvps5w3hH
	WYESphYyvj+NDAYLXZYMZQJg1Bp8ICIK2NTc2Gy+YvtvBlp2krRJZ9UOL/1hjG8C
	6A==
Received: (qmail 216367 invoked from network); 10 Nov 2026 12:46:43 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2026 12:46:43 +0100
X-UD-Smtp-Session: l3s3148p1@xMHjoepfqogujnsO
Date: Tue, 10 Nov 2026 12:46:43 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Johan Hovold <johan@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] i2c: dev: drop unnecessary sysfs device lookup
Message-ID: <avMEI9UuWSnyV6uP@shikoro>
References: <20260827102043.673273-1-johan@kernel.org>
 <20260827102043.673273-3-johan@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827102043.673273-3-johan@kernel.org>

On Thu, Aug 27, 2026 at 12:20:42PM +0200, Johan Hovold wrote:
> The sysfs lifetime rules guarantees that the i2c-dev class device is
> still valid while its attribute callbacks are executing so drop the
> unnecessary reverse lookup.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

