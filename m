Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467B735DA61;
	Thu,  8 Oct 2026 19:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=208.88.110.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791486230; cv=none; b=J4LBLf/At0pt3jnmrfmSN4ilEd2DxoPSngS/yNOd8UPGfWhTVs0jEflkRGv8dVYJ5gOE0KA1tgwE1qqQiLSCnZCWUl6CfgmjFf0VaZDKkM7q9IU1JWCDfMJijzwnSs+xydLpaBoSi8Z6x1Jw62q8NbLBnbRwNXjdrblKlVMew4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791486230; c=relaxed/simple;
	bh=B+KhkIeWvO6uLZFfrPHmxb0TaB31dTgKqm8kTdJZZfs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X/cQRhmX7O8C9gMcgOdM15o1Tlkt9Z/kGAUqeRPD/OxgRWmPtD9CmreiLuAze70RyL+U4uwW+mxjsAbn5pobjDKD7eFbNg9Oqri/l69dvY4zYZq/LL4aEUS/m50JBb2crnW5QnYK1C1W+lC3u2EtgYB79TFiV3366Lae8p9W2kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=savoirfairelinux.com; spf=none smtp.mailfrom=mail.savoirfairelinux.com; dkim=pass (2048-bit key) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.b=HSzf67fm; arc=none smtp.client-ip=208.88.110.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=savoirfairelinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mail.savoirfairelinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.b="HSzf67fm"
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id A879F3D81455;
	Thu,  8 Oct 2026 15:03:46 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 1WLkzp2Tian5; Thu,  8 Oct 2026 15:03:46 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id DDD8B3D815FA;
	Thu,  8 Oct 2026 15:03:45 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com DDD8B3D815FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1791486226; bh=B+KhkIeWvO6uLZFfrPHmxb0TaB31dTgKqm8kTdJZZfs=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=HSzf67fmgUna6LZP+OmxjaZH8k25ior1ysmvRi3XMvXqKYUVqCt1aNwxR+4XQ5s9Y
	 HLDcP+rH1aJkeUbpxskqlPAMIrDPuy2ER50w1PkzHJEtxdMPnG6v/uzzXk4exf4xri
	 2d7nbqfb33O8RBnkpyaDy7SgPWtjWUYUvueALyQ3wByD1cAIqd2bxuWq6tyvXgoDYN
	 hWTU+4ZyZzG9oJmfi4ZvTjY7ZmVVc/EC8n5Q/CGhGmTq11q+W/uOZJADuLvP9cnEyd
	 z90/DcR//3SadYou1SFYznIdsrNg7/yH/qUoxu4tubNVG/DkJYouKLjWBshV8jZqgt
	 /AvW34Y1c9beQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 3sfbeNvrWwb1; Thu,  8 Oct 2026 15:03:45 -0400 (EDT)
Received: from localhost (unknown [192.168.51.254])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 967A63D81455;
	Thu,  8 Oct 2026 15:03:45 -0400 (EDT)
From: Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>
To: Josua Mayer <josua@solid-run.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Jon Nettleton <jon@solid-run.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>,
	Jerome Oufella <jerome.oufella@savoirfairelinux.com>,
	Felix Boucher <felix.boucher@savoirfairelinux.com>,
	Quentin Lehoux <quentin.lehoux@savoirfairelinux.com>
Subject: Re: [PATCH RFC 0/2] regulator: raa215300: add support for configurable 32kHz clock output
Date: Thu,  8 Oct 2026 15:03:43 -0400
Message-Id: <20261008190343.280102-1-marc-olivier.champagne@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260502-raa215300-clkout-v1-0-fd1c2a240963@solid-run.com>
References: <20260502-raa215300-clkout-v1-0-fd1c2a240963@solid-run.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Josua,

On 2026-05-02 18:07, Josua Mayer wrote:
> Add driver support and extend bindings for Renesas RAA215300 PMIC 32kHz
> clock output feature on pin MPIO2.

I am interested in this feature being upstreamed. Specifically for the
Bluetooth LPO on a board using the SolidRun RZ/G2LC SOM.

Do you still plan on sending a v2 addressing the comments gathered by
this RFC?

If not, I could pick it back up and work those comments in, with
credit to you.

Sincerely,
Marc-Olivier
