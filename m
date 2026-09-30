Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1BD4EDCBA
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775018; cv=none; b=q3mN9AnT8iLjkEYlOU8A1ASzwYvx0LNzVMuRpFe1rqkKjbh6zdn0hORLwYSc9cGbt9VEE9l7bCIKspecQ6ne7KHTKdoJyfTNGia+4dh1DiGMLjXnPeq4MDkW5WBe+MItNAqa680BLUOySSMhf1K9XjcZMRB/7aOJLDRkAIOdZZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775018; c=relaxed/simple;
	bh=ZOyuaIOmwkkSk3A91L+ucIoyrzyrK9ul5Zp+W9bmaTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SGC4teAeUoVotfiQkD4OtzV3OAb0ITzxOTFl2gHFGJrUt9T8TKDNh0ihlcBH3obXd8RU1nGXgbDl99rhaUhM35hntHzsEsIwERi1yoa6rJeXC43rIekxx56WowJ6x4zqXunhryBwIAmMh8u8NxSFZcjv9ArkaMY4l/r9GyVqQ+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EqmA38rS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EqmA38rS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D52181F0089B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790775004;
	bh=ZOyuaIOmwkkSk3A91L+ucIoyrzyrK9ul5Zp+W9bmaTw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EqmA38rSXYQPd2pigxu6R80rBBhc8s1vNbYjROyKm/ARcMiB/CNJL8Pb78tIpEt1b
	 07yjFynWk7Tu9etsAIpikQqXip0QavPkg5fKSGtZun/xQp1wcdTaBLfWvWoOIFPFWg
	 c7Tf5zW/tHZrl4sJ/wxW6bXT8G7QBbRVNodvqSTLvqPGc+Jd+PlEUeiTf96uD/HiT0
	 gBM8TSQrUCyYbcC0rbHSFq8K834UXc2JPIUq1tYpAnLl8qoBcQOe4ZnOO4qX376Shm
	 v/+zIitx+8iNdYRuS84imi64r9GQLPRQ6/oaYnWJ7urTmWNyYoD5OPNYCzI+1/Fi1c
	 w8bmwfhI3fVVQ==
Received: by mail-lr2-f21.google.com with SMTP id 38308e7fff4ca-3a2ff148dfdso43436041fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:30:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzFyY96g6NztePbtgO/E2Cn4E74r1h7qZFjQozjLqF0dq0bfM4CJWLOXsdl6H6lK5a5iYz3oe5yIg4Swzg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLt85vW6avMVz61kmtbNffzcxAdzsaS8ihowH0b6NWwMyMBJVG9
	rKQpw79By3AX/269Xhv8DyiWusv8SgTHh4y24wQ1xlcmq3xMFpuSlApCHmOOmRNN5goOlWWm3WG
	PA71c2Eq7g/GyXX+vUfJ8a//S1wx5DIw=
X-Received: by 2002:a05:651c:1990:b0:3a7:7ddb:aab3 with SMTP id
 38308e7fff4ca-3a77ddbad7emr3364171fa.16.1790775003552; Wed, 30 Sep 2026
 06:30:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918141702.3022906-1-peng.fan@oss.nxp.com>
In-Reply-To: <20260918141702.3022906-1-peng.fan@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 15:29:49 +0200
X-Gmail-Original-Message-ID: <CAD++jLkBLzzbSL1PMu8HgCkWhtc2Kqg3k+sAvfbxhgP9HA3BTw@mail.gmail.com>
X-Gm-Features: AclHuK-8dhT06YFk1mO5ueKpaE_e7eqYqVQ_3CjIIbffK5PG2DFWwjAqm3XljAY
Message-ID: <CAD++jLkBLzzbSL1PMu8HgCkWhtc2Kqg3k+sAvfbxhgP9HA3BTw@mail.gmail.com>
Subject: Re: [PATCH] gpib: use assign_bit() where applicable
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Dave Penkler <dpenkler@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>, 
	Peng Fan <peng.fan@nxp.com>, Johan Hovold <johan@kernel.org>, 
	Joe Simmons-Talbott <joest@redhat.com>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, 
	Bjorn Helgaas <bhelgaas@google.com>, Kees Cook <kees@kernel.org>, Ma Ke <make24@iscas.ac.cn>, 
	Dan Carpenter <error27@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Ethan Nelson-Moore <enelsonmoore@gmail.com>, Akiyoshi Kurita <weibu@redadmin.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 4:19=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Convert open-coded if/else with set_bit/clear_bit and their
> non-atomic __set_bit/__clear_bit variants to the assign_bit/__assign_bit
> API.
>
> Done with Coccinelle semantic patch and manual fixups.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

LGTM
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
