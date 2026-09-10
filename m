Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014093955C3
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789013158; cv=none; b=a8dUiFHU4neSwoOCE4ILYnS7AwvB/w+eooBf0kzpUmMPZDvbQGyyGKLc0E3POm2i/OxRy3hNPUi0z1EJmSp/REHbCd4YS38I7sAGO1xzNEDuvrVObYJ17ih/muAkL8Lg9cAjYRHKk2+JB/cl0DE/hRsOCBPJdCzZZDoMKJFC5yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789013158; c=relaxed/simple;
	bh=SZex78iRRmNEPMFSl7W6+Q7e+5ckE/x74Tq8Bf5J1w0=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=QEsgv0+h8EfCSesxOJtWIRIVjCqYt+xqAqlrz7YYVW9tPHohhYbeuAuBdC/0m5dSCbzbHte/TFveTU1SQym2BRSresjvUrdL8oWfYFIVPrRB/lBu10dQExW4SVTfELXE5HIqS6PC9z9kQ4ZtUixa2YL5P0NFsHFwqoXrhOjOxWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=As1RbXNT; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="As1RbXNT"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc1c73645a1so5214195a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 21:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1789013156; x=1789617956; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X6+WYysp4a7UmvnN2F6aIsypaUaxxW6rRb3Z7ELY0Lg=;
        b=As1RbXNTCFgY4u39aT7fbd4NvNji6HnzwpHVBJqKU5s+TCixW1zCKIzLidmOfgCWPI
         pYnbS0EG3ilC0fLBrrcKziVs9ww7xDsrfAFAerf0EzEjfa042LV9cxF23Fi9ZyXAtYEa
         cNsVFZa3fPfvFp4OxQ0a4PrU1wC7gkOZRZ3vCgxEIbTRcjceXHZgKG0Clw+kE+xxpu2Q
         32hdnbXEzVTMjNNjRMZ6FhwZZhkuQvCFtpzYrwzRV5R4/2WFF5cpabkPWgJCSbK393xF
         JoxllxTtLOKanRlimgJNKydFKS6abPb0NklNcjvq4ZHuNJljEQxv8McaNKx5JBIBIRZ7
         Glrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789013156; x=1789617956;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X6+WYysp4a7UmvnN2F6aIsypaUaxxW6rRb3Z7ELY0Lg=;
        b=JSLBwk1hHqT9WtaAUIv0jQQf9YgwMybu0P9jfA9/4PByn5oeCNqQByTQhnmInHJcdS
         YfVZr+a8HP8YqqrZVSk9oCx70dOOFgyBeUxiYwv/ChS2anMgy6SuiNSWLG5WMMyl9AWx
         6FG5CncbhhRoXE2og4znR75c/te3TXvxrQbdqUSdyZonpgMla8FPGVoUzrX+BsWoEMoQ
         d5zX3J0ayRzNkVxkmfoRZhwEa8o27ZnDZRMXf0fz2sUsbGn7t8BMEFTZcQg7rYgoriHV
         Hj8Dwh8h2xseUU4QrXh1ZB9LdY2U39QFQm+o82YiYcEvlFvnazlXAi22DxDyVN8d8BIO
         4cKA==
X-Forwarded-Encrypted: i=1; AKwUvBzDxNcjNa9FuGBP3ZgNDf03eR6k1fa9MFUEPPXJm5tKh7o0qji43jNk3AUHbypAVfwolxpqxg6zV4Jr8Rs=@vger.kernel.org
X-Gm-Message-State: AFuF++m72psZKywop893TwJSFtupmvj464x4L9EMi2LK2rA8E0lypEQ2
	B+jE/xGjLc761dqhjpGiZvyM9ZLWT4qXSbKUolaOiHPhAT4rVUgGlbDn53lWZxw/Pbou7lZyKnc
	PbjRU
X-Gm-Gg: AYBFou26zxSvihtyvwR4m6VmQ9SSSKzyyaeDtu3i8HpLDmmYFXyAPNqZ8VVFxLY1hgF
	Zw1XIk48JolxenMD28tKn//exQnEd5SHbb0aqd+MPfFMD3Qoq0tTxU9mi3mfWMJE+USQv2lej8q
	u0ivU0E7Y4zQ1vTjTzCFOlVbAGTO16WBwVi2tRaful2ROqDfKJMwfSn1oHkZZGT7TiiTGzpXWsv
	6oTPVQF2Q/JgZjs7S9Y07CRuJDn7Xl98lnkXB+SFV/XAmR5uCUzam9X3cqkVQAq0M36haNSUcfp
	WgnJ9RTZ8Qpuk4OtlP0xWZ1pQaaT6FmUfjL8wIygu8YEV1ZMtrj6G9LUO7+ofulSlOtOShPOqo5
	lQjgLGOjoLl82K/kP5vyp3Z59L3NxYbivPZgWydTF6lj1FobfPxsw0HXYSQCQiys2zmWZ0zBgBT
	e6u9aAqi+qFyjnUGNnbTC7kcoYRGBZp89UpQ9+DejPvdRaM6stSckOWWxnrff9tg/Qy9C5+rE=
X-Received: by 2002:a17:90b:2f87:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-39b261e75femr58669335a91.16.1789013156095;
        Wed, 09 Sep 2026 21:05:56 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bbf1feesm49043209eec.26.2026.09.09.21.05.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 21:05:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Sep 2026 21:05:53 -0700
Message-Id: <DLBC8GPBM4MK.3002YEAZ3WPT0@nexthop.ai>
To: "Rob Herring" <robh@kernel.org>, "Roman Gushchin"
 <roman.gushchin@linux.dev>
Cc: "Saravana Kannan" <saravanak@kernel.org>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>, <sashiko@lists.linux.dev>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] of: property: add i2c-parent to fw_devlink supplier
 bindings
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
X-Mailer: aerc 0.22.0
References: <20260815-b4-of-property-add-i2c-parent-v3-1-c22588b6482a@nexthop.ai> <CACRMN=cXSy0ZYH78sQ88QKkwYtbE768kh=KzRhkYYCO4SX2m-Q@mail.gmail.com> <20260817145906.GB579285-robh@kernel.org> <7ia4tsosfsj5.fsf@castle.c.googlers.com> <20260817210038.GA1775252-robh@kernel.org>
In-Reply-To: <20260817210038.GA1775252-robh@kernel.org>

On Mon Aug 17, 2026 at 2:00 PM PDT, Rob Herring wrote:
> On Mon, Aug 17, 2026 at 07:36:46PM +0000, Roman Gushchin wrote:
>> Rob Herring <robh@kernel.org> writes:
>>=20
>> > On Sun, Aug 16, 2026 at 10:17:08PM -0700, Saravana Kannan wrote:
>> >> On Sat, Aug 15, 2026 at 8:33=E2=80=AFPM Abdurrahman Hussain
>> >> <abdurrahman@nexthop.ai> wrote:
>> >> >
>> >> > Platform-device i2c muxes (i2c-mux-reg, i2c-mux-gpio, ...) referenc=
e
>> >> > the bus they multiplex with an i2c-parent phandle and hold a refere=
nce
>> >> > on that adapter from probe until remove. Unlike muxes that are clie=
nts
>> >> > on the parent bus, they live outside the adapter's device hierarchy=
,
>> >> > so nothing orders their teardown against it: if the adapter's devic=
e
>> >> > is unbound first =E2=80=94 e.g. while reverting a device-tree overl=
ay whose
>> >> > changeset attached the mux nodes before the controller nodes =E2=80=
=94
>> >> > i2c_del_adapter() blocks forever in
>> >> > wait_for_completion(&adap->dev_released), waiting for a reference t=
hat
>> >> > is only dropped later in the same teardown sequence.
>> >> >
>> >> > Teach fw_devlink about i2c-parent so the core creates the
>> >> > corresponding device links: consumers are unbound before the parent
>> >> > adapter's device, and probe ordering no longer needs -EPROBE_DEFER.
>> >> >
>> >> > A plain DEFINE_SIMPLE_PROP() cannot be used because the property ha=
s
>> >> > two incompatible layouts: the i2c mux bindings hold a list of bare
>> >> > phandles (i2c-demux-pinctrl takes several), while toshiba,tc9563 ho=
lds
>> >> > a single phandle followed by an i2c slave-address cell. The two for=
ms
>> >> > are indistinguishable in the flattened tree, and a 0-cell parse of =
the
>> >> > tc9563 form would read the slave address as a phandle, linking the
>> >> > consumer to whatever node happens to carry that phandle value. Use =
a
>> >> > custom parser that only takes entry 0 for toshiba,tc9563 nodes.
>> >> >
>> >> > Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>> >> > ---
>> >> > Changes in v3:
>> >> > - Fix the tc9563 compatible check: match "pci1179,0623" (the actual
>> >> >   binding compatible) instead of "toshiba,tc9563", which never matc=
hed
>> >> >   and let the bare-phandle parser misread the i2c slave-address cel=
l as
>> >> >   a phandle (Sashiko AI review)
>> >> > - Link to v2: https://patch.msgid.link/20260815-b4-of-property-add-=
i2c-parent-v2-1-239c6da9e097@nexthop.ai
>> >> >
>> >> > Changes in v2:
>> >> > - Use a custom parser instead of DEFINE_SIMPLE_PROP: toshiba,tc9563=
 puts
>> >> >   an i2c slave-address cell after the phandle, which a 0-cell parse
>> >> >   would misread as a phandle (Sashiko AI review, Rob). Kept the ful=
l
>> >>=20
>> >> A bit of a tangent, is this a bug in Sashiko bot?
>> >> It just dropped me from the reply in the v1 patch set. Any idea why?
>>=20
>> Hm, can you, please, clarify, what do you mean?
>> https://sashiko.dev/#/patchset/20260813-b4-of-property-add-i2c-parent-v1=
-1-a2487e920ce1%40nexthop.ai
>> has your email in to according to the email policy.
>
> It has mine, but not Saravana's. The problem is Saravana only gets=20
> drivers/of/ emails and not all the bindings.
>
> Saravana, If I enable your email, then you will get all the=20
> sashiko binding replies. Is that okay?
>
> Rob

Hi Rob, Saravana,

Gentle ping on this one. The v3 thread turned into a discussion about
Sashiko's recipient list, but the patch itself has not had any review
comments since v2.

To recap the state: v2 switched from DEFINE_SIMPLE_PROP() to a custom
parser because toshiba,tc9563 puts an i2c slave-address cell after the
phandle, and v3 fixed the compatible check to match "pci1179,0623",
which is what the tc9563 binding actually uses. Every other i2c-parent
user is a bare phandle list, and i2c-demux-pinctrl relies on the full
list being parsed.

Saravana, since this touches the fw_devlink supplier table, I would
appreciate a look from you in particular. Is the per-compatible special
case acceptable, or would you prefer a different approach for handling
the two property layouts?

Happy to respin if anything is still open.

Thanks,
Abdurrahman
