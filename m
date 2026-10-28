Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793175402;
	b=XcFkrBVoStLTaH4Wa4cIDBaEps0QqsDnC69VLf+UqfBnwPiBFSdqwprfYjy4bZaU6AXZ
	 Sbh+FZOQx1cA5Xgb2TyDHMNm0/92D8bWT9aRbOrT7dhyjvSQ9lENQzVBD+KCaFIW7JlGG
	 0zUMEBrHPWa4t4D0hBEzx4bZ7jewHi74kD66C104ojnnO/nPox5v46X7rlaCqb1RidVlT
	 AK13rXlDZriNGZSSfUnzHFrfYEwpKdtZ3NNq7Db5bajJsU0ll88rCvx1BkJDM8CbIfk3P
	 qVYNWx96IG0tCW14tOi6tGL/ez7TdH/Tdm3sEQlZ8WtuWFzeNY7E2e+Bp0OScMeM3YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793175402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ewTGkXdsNJwvYFPISDJjvcJQGNkUEeqtLfVaYw+sa6o=;
	b=lPe2zA/JYiFSxX7CgqfsiuQE8xDtw+B04kitporHWo4lITbolAcEYrb/Xhag8JS45lq6
	 J8gONQACk2tIa83XUOZwcEH18RgWbCOBDjb+hKMAnjezLzE+Hg5qJBGB6PqK4mPDDsEaF
	 Cb2GFzKinIYXxIPjR7KcFIm23XQhLYkIDjuoiwhcKu90xVIkz8BKODQQkNlMK6A0m2EO/
	 N60CfbHkNaO8CEGQO2Hcpd5myCz5C7PKpeKmOhwfH5ROZ27FmtNB9TWDkBvD0vrhwO/RO
	 GD4mn1zMlLnhmioPoJM8kEwpGcCOyu/MkQ4RXVIuDueAeyD324mvMJFUnTWj4Dw978w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xYKY4EZm;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA098606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA098606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xYKY4EZm
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-ccca948203aso325623a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793175401; x=1793780201; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ewTGkXdsNJwvYFPISDJjvcJQGNkUEeqtLfVaYw+sa6o=;
        b=xYKY4EZmRwmAundVML4+5ovDNGlRr8UuPp5gwEt6SuSzuhRgbvisbWLbI3EfpUIvzK
         P0ooy6qAAJl4sUwm36aji3IhCdRne5qjPJwbmjTjS8npMEbGNUcJmM91/V82yckO30h5
         C7cW23+v8Mu+g8YzfGSstApN32J7mWJSWGDNEsPV0x1UqfUekeeQkTybvX6T8xevJoX4
         ot+Wy3FXR+HuPFc6KGN/UVCmnYkTVStLTmUymDA039ohWYz6pZlG9wLHuw5FeFe5FrQR
         3cGcZxQHoQDMWJOEGpWQl8AvFJu3q6PQwLNspeRggArAlOrfTs3gDVG1YS2gZEOwGd0S
         ilAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793175401; x=1793780201;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ewTGkXdsNJwvYFPISDJjvcJQGNkUEeqtLfVaYw+sa6o=;
        b=RCO41XPTKAZBcfI4P7omJA3apW6PqZhMmohaY7/2MuzTxI7lXiVYvTv8Bx6AQN72lc
         3WwluvDc+2VLOcv81rAT6II4eTq2X+Yj3K2HCpFlNZgQafdqiWiyaqpqO7xGy1BI41to
         xudGUVz2ey+gD8/wwR06mvnnJqXn5ibb8tP6xottk//f8J2RYpmE5lQMzNzlDAwkEZaf
         MjLkAcnt0mUVCDGcYxeYkiLrjLyN4WWzYgZjqPlO8p4i0Vvqaan9OBNioaBJxQQb2tmA
         eQMOR3c8hrS86wU1EZDwtiMDEkgkyTHbnITLBNb6bVzf+AIxlSrf1sanFvAWluerdEUr
         Dqqw==
X-Forwarded-Encrypted: i=1; AKwUvBzNbo29lsaHswC80zw+57iPOMYi5fAipbyHgnBbOOFr6nq3+6Y3Ipg1mbVevntd+T6r5TJZcdMwDmC5s1A=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+sulAgEjTsmRpywK3z5LAqzxsTcUYVmwP3BiSW+T/kHOc8O6g
	AOYReK2fGhFzNXB/6a1p2NwpG/MgXWuoUriDgx0KBjTPE6L9deBtyVQNfNKM0A==
X-Gm-Gg: AYBFou0vO8oun/pHelVINWCG9wofezNz/MUiv3HSAODDQiVYNZ4S7JkD71Es/GEvT/U
	S1gsiLM0ES7v5A7yhjZD698AYhMuZOY9ocmNVFu6Ls5Ud0Sne5leYbGPbaTX1G81dM6QzC+EHxK
	PQiN7Ps+sgP9gtjpNdkCpCbmAOmvNNSvkUdt0IdJdKX1Ymvp9agrIkvbVL1BnIiyMGp8FboT75S
	8beRtYWZhKl8zcHOVt0csYZsmgWlARwAbrDQizA6o4gmEN+qaEm5EYjxE/cAIDWuVqcORqN0q9j
	UZkq6dosxbIRqVtwTBpdVCz8m0rgyfURHxSwWqWBxjnkisVkSvlCgx/a6k5FZiZYTYLX/077gEV
	8NIvrqF908MrrHYy+H84uqJ+C3pjcPQZkjUYRsDoqkqAzxacXAODeVHl5Clqly7JSxcPhaPnEEr
	7MvrDNSv+f+IqphtFLJDgANyCMgMSaS9FfDZvU+kqEMM3m+/49dOe6X976VBrkoJU7z8FHYEOK6
	9XTcukvk5QdOg6uz101yLGMeKRvKr9j5UitzDDSG5dvCNU++HGIx+iZY0Fomt+tCn4qSTqnUbtk
	3WUo0F6ltpM09xqlz+2PEfb8DH9p8RPhG4OF+jgXgzT0ZQqm0bQ=
X-Received: by 2002:a17:90b:4c:b0:3ad:9ecf:2b88 with SMTP id 98e67ed59e1d1-3ae580c7a08mr1105748a91.19.1793175401041;
        Wed, 28 Oct 2026 01:16:41 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a902a51sm1953639a91.3.2026.10.28.01.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 01:16:39 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 2368A4163B73;
	Wed, 28 Oct 2026 16:16:37 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: Marek Vasut <marex@nabladev.com>
Cc: Michael Walle <mwalle@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Maarten Zanders <maarten@zanders.be>,
	Cheng Ming Lin <chengminglin@mxic.com.tw>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: spi-nor: Describe locking support for MX25L51245G
Date: Wed, 28 Oct 2026 16:15:34 +0800
Message-Id: <20261028081534.945416-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <8ee5b312-80bc-4584-ac35-cc76c2812c5d@nabladev.com>
References: <20261024001658.222147-1-marex@nabladev.com> <8ee5b312-80bc-4584-ac35-cc76c2812c5d@nabladev.com>
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

Hi Marek,

On 10/24/26 2:18 AM, Marek Vasut wrote:
> Cheng Ming , can you (or someone from Macronix) please have a look at
> this patch and confirm that it is OK ?

I checked the patch against the MX25L51245G datasheet. RDCR (0x15),
CR bit 3 as TB, the TB bit being OTP, and the 4-BP locking scheme all
match the datasheet, so the description is correct from our side.

One concern, in line with the sashiko-bot comment: since locking is
an optional feature, I think failing to read CR should not fail the
probe. Controllers with a restricted opcode set (e.g. spi-intel) will
return -EOPNOTSUPP for 0x15, and this part probes fine on them today
with macronix_qpp4b_fixups. Rather than special-casing -EOPNOTSUPP,
how about just leaving locking disabled on any CR read error, e.g.:

	/*
	 * Locking is optional. If CR cannot be read (e.g. the controller
	 * does not support RDCR), leave locking disabled instead of
	 * failing the probe.
	 */
	if (mx25l51245_read_cr(nor, nor->bouncebuf))
		return 0;

Michael, a related question for you. Maarten posted a series last
year to make the RDCR opcode configurable in the core and use 0x15
for Macronix:

https://lore.kernel.org/linux-mtd/20250922155635.749975-1-maarten@zanders.be/

It stalled because setting 0x15 for all Macronix parts is wrong (e.g.
MX25L12805D has no RDCR), and because there was no user of RDCR at the
time. This patch is now such a user.

I have gone through the flashes currently in the Macronix ID table
and checked which ones do not have a CR / do not support RDCR. If it
helps, I can add this information per flash entry, so that 0x15 is
only used for the parts that actually support it. For IDs that are
shared by several parts, RDCR would only be enabled if all of them
support it. That should address the concern on Maarten's series, and
this patch could then simply use spi_nor_read_cr() instead of
implementing its own RDCR helper in macronix.c.

Would that be an acceptable direction?

Thanks,
Cheng Ming
