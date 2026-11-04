Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793825821;
	b=WY2l0gNJtFlSE86Csk7Uipnie3KFMpH2O+vFyZlJ35EAYvL6CIY7zBRc98tHsPGWqb9F
	 VpwS+w4ZdV31VGjcAqZagbEP832xs5dauRf9oAWDZCO7muuWvAzWv76ruHCZ7VOcy1dWo
	 Yh9qQ2XDs2XrrlB64HCeF7mIU5nKK+AllztmdZZhWOqtUphCM3YOiKnhuwkE+Ur8gTY52
	 YG0646qihso6R0Azxuhc8jw9cJq1tHweEJ3B45fxV+gnXOrJBeBXrHUJNbIqn+e0qWCLe
	 W/7YWpJTSNVO4qu8kxfdYyiUw4xhArlECRtF3dXXbPme0A8XHcYkDl8IwEFcR35icVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825821;
	h=Received:DKIM-Signature:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:MIME-Version:Content-Type;
	bh=6t79USymFAtqPRfgPfIK8J3kv1s3TiynLmIh2V+i210=;
	b=NJA4z7rkHqx328SlnKfk7Q580pgBqaoiZDrrn8lb838MDGOv9kUF5XB0ePgR21sFu0wg
	 kThY9y16NGgs0aurjOerjJQqyGAd5U74SOeTGn85w6wZepP+0n7gocu58nfhxKQm3p6LH
	 Nx6jTbBQjAaqDuon0lWUiRlW7hIgdIic1Tf++2ilo1GpC96ZW44NMZLHkQSX/E1tSJoRl
	 Di833Xq7F70wEeDtTY/ab9fD2cUn8joMDi0jJL7NqsfuQv2g7PYyxhi1STR3iNRT9V/25
	 6d34LBwj0JLe2XL7UoiAacyNoBhYnj9cf7GgXS5/pzUTrfhyCBLcIkbOQVmlUR4MjZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OGnhoUJZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E84B609C59C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OGnhoUJZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4DDD1F000C1;
	Wed,  4 Nov 2026 20:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793825821;
	bh=6t79USymFAtqPRfgPfIK8J3kv1s3TiynLmIh2V+i210=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=OGnhoUJZKRG13vcRb7Kp60zCchju3MYAG7SykZ7dlpnfpSCoHWqoFCxXLCj3qfoVn
	 BsW4XPmh5M342b0QqvguIgcSLVRkPetVJzUi6yLZUsBuv+3nhCKBOe6LRL2S3BZbJF
	 8Uyt/GFQEHZ+aCGZZcv0IMitL+5xnr5ViFQi7wSo+7JdqqhaCBZ5q3SCga6l2guQSZ
	 KjAiQtNWczXvNir0gEbBERbdAHgTlYRt7xbpqu6zWVa81PHiqt+xzxynw7rndolaRb
	 eSeK6DoPb/kdvt73nuP4BJB67kmWjDA0kxwJG7o3PgBmhcgh3ix9z0amrlZdPV3Sv7
	 74CcJAax8w9XA==
Date: Wed, 4 Nov 2026 13:56:59 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <clement.leger@linux.dev>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] riscv: kgdb: Fix potential missing local_irq_restore()
 call
In-Reply-To: <20261102145812.36939-1-clement.leger@linux.dev>
Message-ID: <b7441b08-3c95-5a2f-bac2-e9b0cd5e2f7e@kernel.org>
References: <20261102145812.36939-1-clement.leger@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1524687159-1793825821=:104658"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1524687159-1793825821=:104658
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Mon, 2 Nov 2026, Clément Léger wrote:

> If kgdb_handle_exception() returns an error, local irqs are not
> reenabled. Fix this by factoring out the kgdb exception handling to a
> function and call it between local_irq_save()/local_irq_restore() so
> that the error handling flow is simple.
> 
> Signed-off-by: Clément Léger <clement.leger@linux.dev>

Thanks, queued for v7.4-rc.


- Paul
--8323329-1524687159-1793825821=:104658--
