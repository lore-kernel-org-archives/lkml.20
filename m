Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794575574;
	b=qFrPY8mlvC+nLo0W0QWbhiImdAXSf7GDmzC/UsUPQ1IA/Iq2BYgj9V0GJ5954EG3lqQN
	 j0A2n3VaJ+Q00fAKIcJHwdshGKX5enihWOkvnjMDo2Hf167OyW2+/GgFTpZZ8gkOdrmMl
	 9zxC8zYJqpVW3WsRqQLKRfXpSWJbyaSXKi23Ssvg2nWUhYHoSvkIQ43ElBGXBdC9yHlFJ
	 EYY/RZ1XWMZOYkrZYm8OgepTRENqJ6PdfoJOqIJtUa45A0jIalbt8lWCk8QgyEE54MCq+
	 z24rfv5PdZIcWG++Xp36EwP4lmflZy9JaMc2D0X0cmUBDhTW4J37/mYRR86Re7SSjZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575574;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vSzzZQXyjWd707+YEztZNfwhTEMbuMsIk3gAaxR7cCs=;
	b=nDm7oMGKX/NuUFzJwaU9yBZB+l56L57a6NBQRlQNYQRkF4ATPB2qROGq9eWbKwEru4Cr
	 86LlF/D0RLKq0lp6c6CsWZeaSCIXQMROaIbf0/z0EZfVroTD+XY4F7ZZAGCm7yjh66U2E
	 zAKUioUQOg0utPdTp5t/5Nm70nDxc5s0k1JiNJ3SN+sJ3NmvdfPiOk+Mv2KAOCS2nZZmJ
	 fwzAWmPOtk7NdgL8N/ZG0+Vq1q32gHiIn/ZJnlslII7asdVl7z/DerRKXGZGCF2D7ZAZp
	 +smQB1rPcx0lQDt0eiK6U29vTdxjCDtaPKkfRm8WOS8V++aoC1/PFQtbAnIIksANZ+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cyskekEA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397D760A2618
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cyskekEA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D544F1F000CD
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794575573;
	bh=vSzzZQXyjWd707+YEztZNfwhTEMbuMsIk3gAaxR7cCs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cyskekEAdhtrPKmUr/gE2ThgA7q7NVKzsV4u4W4HbaBqmHFsDI2iN/hkL+YZs9N/b
	 UmV5t0iSJkFp29o86TmJIE2qqhltYZ1tqguxVdjr+5/KUzX+i7naCNolXlQgisd4gH
	 rQjalS3iELABZ/bnOO7VCoyqXi0A7DJ5EZLP088yRBUX+LtT4IiKQtuL7qwpKgjbvD
	 SOTzhTKhYAUI/2eECaWWpMGQnMGgRHmYKGveSMCrER0bofsJltyX3ycf51T+M2Y5kf
	 wufBl0gA8j0nX1sBNQ2uOMWEqTQl3GbMoJTWNOH8oI/KlxkAjhB2HS4jWd6jEppmBV
	 5FI604C/FopdA==
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6df7f544919so1141521eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:12:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHBlZbkpMuNVSz+J4My7/ZdMPGZ1g7MHrOjx3hB31ROunmsGYzKLysdixjTRrbpnp3aQp8lOqyf0vhWi7w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+41SJmj6at6icNg61E0n0PSYpK5Cvxr1KdPS9mclbSAiRXTBei
	htD1GOMQsUPnXNnt5jx1TJCnI9vPrARwHGxqR0XTPiIwRlt0vF3Gf1U4ttjxsPXHmBXs/+6rF2z
	xHPHK1GBgkltPh/q4oUd27J/0pzRDhjM=
X-Received: by 2002:a05:6820:60c:b0:6f5:1e7f:c65c with SMTP id
 006d021491bc7-71ab4f38fbbmr1236618eaf.33.1794575573123; Fri, 13 Nov 2026
 05:12:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113053221.3131068-1-wangxiaolei01@kaihong.com>
In-Reply-To: <20261113053221.3131068-1-wangxiaolei01@kaihong.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Nov 2026 14:12:38 +0100
X-Gmail-Original-Message-ID: <CAD++jLkE7zweAY5V1zihorrHv8EL7LO+r8z+VmOVUTCesdGK_A@mail.gmail.com>
X-Gm-Features: AclHuK-XfwbbsThDWRKKp0Nlzp5SCGGel7-dOlgu3vEKR4VlZvcMoWFny-hIjEw
Message-ID: <CAD++jLkE7zweAY5V1zihorrHv8EL7LO+r8z+VmOVUTCesdGK_A@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] pinctrl: bcm: Two bounds fixes and a dt_free_map cleanup
To: Xiaolei Wang <wangxiaolei01@kaihong.com>
Cc: florian.fainelli@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, daniel@dragonzap.com, iivanov@suse.de, 
	andrea.porta@suse.com, phil@raspberrypi.com, linux-gpio@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 6:32=E2=80=AFAM Xiaolei Wang <wangxiaolei01@kaihong=
.com> wrote:

> This series fixes two out-of-bounds accesses in the BCM pin controllers
> and drops two hand-written dt_free_map callbacks that duplicate
> pinctrl_utils_free_map().

Patches applied!

There may be futher comments and/or Sashiko moanings, that
stuff is better addressed in-tree with follow-up patches because
this is GoodStuff(TM) that needs to be applied.

Yours,
Linus Walleij
