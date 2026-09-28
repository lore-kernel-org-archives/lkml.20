Received: from mail-ej2-f37.google.com (mail-ej2-f37.google.com [74.125.228.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395413749EE
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.165
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618901; cv=pass; b=bOZCze/1t7zvwzzu//tN0C6g5OKHarCHn84pndpaXa2q/Qq/VyslQcP7YHbKuxsqIK62BiLi9NqxOPZ41WwDlYteghirPk3XsNps/ZeiBU4Tjk1lVqUDDUtCpf3bdIyRLfZKA5lY7rT8UvydDEPMu7YfxfH+L99JKnNGCnSvZaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618901; c=relaxed/simple;
	bh=mcRtwH4UlFrqEVpmX57yJTECpN3GPGqw+mx7gncmkyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uFwbT3B22qwohCj6zthBiAyXGXoHt1/3JfnjlIaJUoWaq0YPe+ReKhEaKA40Zx5SBLFlboQQBTy5dWuk0bAAYwg475MINTMMGa0Sm6i+PFD5ABCU4XT8ENIV7pTBzk2SqxUjrH9MrlNsLA4ae0w6b+WL1T7GnmacdFATe8mdxig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/MZVWL8; arc=pass smtp.client-ip=74.125.228.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/MZVWL8"
Received: by mail-ej2-f37.google.com with SMTP id a640c23a62f3a-c2dbbf409b8so290853266b.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:08:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790618898; cv=none;
        d=google.com; s=arc-20260327;
        b=XWTUwy5yDwxecEw0FTpJStZd+0YPm9uKHYpXlWxOZjtPalf0h6ObSlQkekae4w9RGx
         c46aihZtgI26EzxfvQ4WIiBXqsl8I0jHt4ycjAp9SjW67fumdC/YjQhRGJcfNZoYRQLe
         m8c+kV1sxIRFXBXM7mXgBLJwY22y4N1MDpaKPzBghVs5TxL6uJqKDx0nQv+zJZF4BPwu
         JrGznsSkfw+R2eQEFkEbzmJUq9osd442WUSldL6Njia0C3CFskjgY1GbMUCiv94/XU+G
         5NN8XP3XF2L6mppE5ndh2cJ1d6jiiqyhM0AA97p7Xq5GhuS9zAvxrV3OXOKwRR1IoMY3
         7jrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+V2ar5MRuC35hvkbrJE5OWPvTjqRTe6YcdztCtqkXTo=;
        fh=VNex+85QzBjWHGOQ/R8unpvWl7xNkbXaVyrdn4/0jP0=;
        b=L+6bp8/MsqYBRgrDzAbw2FquO8vGJfF0etLsD29Qm5iTjBGRNXpnYDiRgPhp5TsR0d
         4Sa+bHjWpLkJELgD83yzxyQNQc5jumLDaUI6Hi0LwJG+y6eYOqu5YWKhO0xxO8FfvAEM
         pxo61HnOchzqJsf3AktHwwu7tr0P8aTjSu3cZ+6vTDaur1xzCkegvn/XzCdLBESIQu2V
         k+Yutltn3jQKI3YLdTqhqDtrRCteWfMRmWuxax/+xTisSELsO5DqjUVIMQrTwCGUBXax
         wCrRmqn3CYeNG7MqnRZmSKUucUAKWtYeNfBrI7NB7DLVP5gjBks/LOb+Wlx1Z3PQ9b+S
         OUAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790618898; x=1791223698; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+V2ar5MRuC35hvkbrJE5OWPvTjqRTe6YcdztCtqkXTo=;
        b=H/MZVWL8538RabLkhORczHMI87kKDJnc5YrbJCOrIpsFfV97gQ5bwFaek3Zg2+Y+Kp
         VeEPxzOBjygMZuWF6yvdvPjW1mHhkesFIxcpx2g35F8g21LHrJJwK6wMKogl1NPJ4RQR
         yZ0SX2SvL/Bi4DNnJrARN5gF9NgbGm5WM0CrLJggcigMGLLJHaM+Iz0V35eCQEW2Q6Q/
         H5/fTFQCcCg6JqgH13xsbTthDpCgmFt4YJAGVg5JIGJ/WTjgrKWW4lBZBBWlEiIZC/je
         Up6U18t06iXNjGhKWc+Ig16don71Ob8N+7GmHi+Zl9nG3/rU0ailKspp5MWzBGNzM4sB
         OC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618898; x=1791223698;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+V2ar5MRuC35hvkbrJE5OWPvTjqRTe6YcdztCtqkXTo=;
        b=mCbyjl8zSte+KhsAkQ7roL5jwk7q544lGvkvF1CuTkt/flOeQspoxeDZBEGhYfbXdJ
         i3KI/HJhrPIn/V1VBSUt6MveoLcT8t3kRHr+r8Zq66K3eFUEqWUY+v/0T6zGe2Ri3mTc
         KVrjB62pdpP0ZAcYK+Ck+aNsG3kNUBF9ao6cnk2rhDL6il5Arj9IHIZN7NeNdxHZZAjS
         TDTXVGL2qc02J1EojnBGoCKsuEwVNGzKAhSb9Pl9caeQOZj7AWOj/yRfij77CettHDrg
         6mQitLvTNj5iQHbCai7vP9SyugJYV6PfAONtNxw4gPYocvxn7QMmhJHBWf6BXv5vOV1z
         5MUA==
X-Forwarded-Encrypted: i=1; AKwUvBwTHsfw+JsizxWCvGqFw2Xqg+5FOhb1b7r/F6WpPAkahHxORPIvlIePTRv7hfkSWbBMID5/TLQeBPtvDaQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mUm2rT9REZfEwT9rkPXuN9Co4fRMsNqOUCh5tDia7erWlWAvA3
	ReBMyHMxqB3/DQPqTU881OGm1q7h7ty117aiFVi60xPGYDHYwQTeT/zRJdrjz19TDmp4VYpTjaU
	afVEBTgA2rkvrLgdUZRraZoLTNSi6x08=
X-Gm-Gg: AYBFou09c6ZUy6w0OXNofzrAplN3UAzRYNveIKk+SyvoM57XcYmA3Irphwc1/Hg5rW3
	5J/1zIr8YFjdUvUaaqP4tm5qXY60BVazOre8MNKb7jGejNb7TjGcZBMIl61qnzCe4nzIz9kfwZF
	/iIZ/Rbp6Yhou4Mopd07uDDas2Ol1kinSbNUc7MILvm9lka0Gn9ZcCU8UUNpc2vDSe3vDxcX4sB
	nUiWW1j6xX0AS1QUnN5Of2Wn3sOPIyBPkPG8CipSQiqDdXc3YzfdmwUYgr2nGg+yYc1N5xF8NyH
	xz6sik9IjIGFLgw28jUmL+lGEPgQ55rRj6pxBBg4JqlzssfgQiy2RZx8qUfiZYEvYsZszvk4MxO
	7w9DArBzkGepumf5NPfqv6S8bdhTk+oHXyKl6bwsfZRf7RXY6Js1hars10dQwaqCbxXiTGFG0WA
	J5xaTtQkOEqhfD4ogPsoPEx61eoIup77c2rLmrfNJN
X-Received: by 2002:a17:906:6a14:b0:c2d:ca78:ea83 with SMTP id
 a640c23a62f3a-c2dca78ed66mr435466566b.38.1790618898070; Mon, 28 Sep 2026
 11:08:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925160913.1648565-1-andriy.shevchenko@linux.intel.com>
 <20260925160913.1648565-3-andriy.shevchenko@linux.intel.com> <CAMRc=McxxVyAN5gdbegcaUgk8sKRrEAeg+5Oqs11B5AtEM0-vw@mail.gmail.com>
In-Reply-To: <CAMRc=McxxVyAN5gdbegcaUgk8sKRrEAeg+5Oqs11B5AtEM0-vw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 28 Sep 2026 21:07:41 +0300
X-Gm-Features: AclHuK-W1Uibv9PT8_q1X_FGeq16kfb9swrUsm2qhNpfUiRtMGKTa02TPGf2uVQ
Message-ID: <CAHp75Vc0QXteRFbiJ_OdJeTW8Mq3-2vCkbF0FNiuuM_LJ+71nA@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] gpio: Move Intel PMIC GPIO drivers to the
 dedicated subfolder
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Peter Tyser <ptyser@xes-inc.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>, 
	William Breathitt Gray <wbg@kernel.org>, Israel Cepeda <israel.a.cepeda.lopez@intel.com>, 
	Hans de Goede <hansg@kernel.org>, Lixu Zhang <lixu.zhang@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Raag Jadav <raag.jadav@intel.com>, 
	Junjie Cao <junjie.cao@linux.dev>, Runyu Xiao <runyu.xiao@seu.edu.cn>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Peng Fan <peng.fan@nxp.com>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 8:10=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
> On Fri, 25 Sep 2026 17:57:04 +0200, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> said:
> > For better maintenance and development experience, move
> > Intel PMIC GPIO drivers to the dedicated subfolder.

...

> >  MAINTAINERS                                   |  4 +--
> >  drivers/gpio/Kconfig                          | 26 ----------------
> >  drivers/gpio/Makefile                         |  2 --
> >  drivers/gpio/intel/Kconfig                    |  2 ++
> >  drivers/gpio/intel/Makefile                   |  2 ++
> >  drivers/gpio/intel/pmic/Kconfig               | 30 +++++++++++++++++++
> >  drivers/gpio/intel/pmic/Makefile              |  5 ++++
>
> This makes it a very fine-grained split, I'm not sure we really need this=
 big
> directory structure when - so far - we got along with all the drivers bei=
ng in
> the same directory?
>
> Look at drivers/pinctrl/intel - there's no such deep structure there.

These have a separate MAINTAINERS entry and not that common GPIO
drivers with the rest.

Basically the whole series follows the split that we have in the
MAINTAINERS already. One patch per group of the drivers / MAINTAINERS
record.

--=20
With Best Regards,
Andy Shevchenko
