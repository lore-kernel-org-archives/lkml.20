Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783031;
	b=iaBsFJiTDGcQuDUivXHEgxF5ApRU2oVPfZrE0C4SclzuVq08Bw0Dxdu68OcbqUr2C5Bh
	 jDTaqnKbnvgh4AJICy8X1sknXQiXY5bF5fO0le73mtx8/PZohJ6JpZ3ZjLElnmjszR0Uw
	 JRxXwnujA2F9jzS6S4KZZfn/hRIBgXxa3TZReV+JTzpbE1MtlhQHm3UDRmOVR1wAytdcF
	 FID4JCocpBESALfNAUuMt13CE88DevjXhDRdueqZM6ALYhmjY2xFKOh73VrgPWjWJt7xD
	 OlpJGNloa/MWjZNZB8lINHYCh+WFAd9NU/hSVJ0Iz597jh0N1e9wQf/kaLUXswyp/5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783031;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=iHYdHhRmbjQcxscHDcCpZ8acQ3uHnfxu23ktn4nG4Lg=;
	b=eFIa0AfgY8Oiw/8A6qZT0t2UCzgLYrXl9InZpL6dptbPRMSHg8eQdoG5lCmOYfsA/6hf
	 HbtOdKZkg2oEg1DKVWJ3q30T3swwI4/85RdGRdNSxsfngO3IFQMes0J5mYVTdv9iW5OHS
	 8MP+Y9RoKUG+nlYrl2xbSDDKtpYsxRBW8zxN94H1iMnnK9fYeJK0Gi8OCXcUWuiMALfDu
	 6vEh0/tNRlFyiweAYQufB7aa8+IKtR1eyEYhZupJMF1iOMavk6dcEzYs+aRsyXEOmSf99
	 xn1q9a7PfJ6XG679XSDuKaFLXolr4h3aK5qWvWWwRfo53bbJeD4hSabk0XJ2502q5dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b="bY/HWDAQ";
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1FB606A337;
	Wed,  4 Nov 2026 09:03:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C1FB606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=bY/HWDAQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=iHYdHhRmbjQcxscHDcCpZ8acQ3uHnfxu23ktn4nG4Lg=; b=bY/HWDAQ7lHwSJ9XPB6FqUu/AE
	wcwm0H9izENxVo4LThMrAkZiy0MutIj7mridbKtjUB3BXxoXTqd1q6nuQFEl2B3wIxvkpluq2tK7h
	pVO6dlRzHH+P+5d1XYcb6OlVt051mRhfQYqPAY7F6utvBprm6uu6mZ5Jkx1c8k1+sl2WtTucsh2oe
	FdDM0O5rcTV0AeBawde/oLUHPdbiVLYPOsywJ1HSpzpvxwgpvZE/OR3Nj2QG/ALgcj9oj8+KU3rU6
	LUe92DhkYZlooqVoC4MNJsgAdXUVODrATFTqm9MaZKE1hxd6QqKPDda3HdNKgIyYUBK+XnkpK6b0X
	n1jdwV1Q==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>,
 Igor Paunovic <royalnet026@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Sidong Yang <sidong.yang@furiosa.ai>,
 Diederik de Haas <diederik@cknow-tech.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jiaxing Hu <gahing@gahingwoo.com>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Jonas Karlman <jonas@kwiboo.se>, Guangshuo Li <lgs201920130244@gmail.com>,
 =?UTF-8?B?SMO8c2V5aW4=?= BIYIK <boogiepop@gmx.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Igor Paunovic <royalnet026@gmail.com>
Subject:
 Re: [PATCH v2 01/11] accel/rocket: search every core slot when a core is
 removed
Date: Wed, 04 Nov 2026 10:03:13 +0100
Message-ID: <49835528.XUcTiDjVJD@diego>
In-Reply-To: <20260922080114.44662-2-royalnet026@gmail.com>
References:
 <20260922080114.44662-1-royalnet026@gmail.com>
 <20260922080114.44662-2-royalnet026@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Dienstag, 22. September 2026, 10:01:04 Mitteleurop=C3=A4ische Normalzeit=
 schrieb Igor Paunovic:
> rocket_remove() decrements rdev->num_cores for each core it removes,
> while find_core_for_dev() searches slots 0 to num_cores - 1. Unbinding
> the cores in the order they were bound therefore loses the last one: by
> the time it is removed the search range has already shrunk past its
> slot, so find_core_for_dev() returns -1 and rocket_remove() gives up
> without doing anything.

[...]

> Two paragraphs changed from the standalone posting, which this series
> supersedes: the one on unbinding a single core now points at patch 4
> instead of saying what is left, and the round counts are dropped from
> the last one. Posting:
> https://lore.kernel.org/r/20260904125936.26234-1-royalnet026@gmail.com
> The two Tested-by tags are from that thread. The round counts were
> taken on a kernel that carried the use-after-free fixed in 8/11; they
> were re-measured with the whole series applied, see the notes on patch
> 4 and the cover letter. The single-core unbind and rocket_open() cases
> in that paragraph are 2/2 of the lifecycle series, now rebased into
> this one as patch 4:
> https://lore.kernel.org/r/20260731064933.12548-3-royalnet026@gmail.com

Seems like I merged the standalone version in [0].

The code change is the same, so I guess we'll just have to live with
the older commit description :-) .

TL;DR this has been merged in 7.3 already now.


Heiko


[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3D6eff1d69dae808a1518aee5a58d0853a8db3f1be


