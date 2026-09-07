Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B0C3515EA;
	Mon,  7 Sep 2026 03:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788750222; cv=none; b=HEHrc1EfzRiU+2UJj80aLQdOWL+7CYMeKhNjhSoUVogQsjpAPzc+O7ltgBEpixqq3S4JEvAqcsPXQpk/4FsMZ4r2T4LVbfWa1kuKrBLePB4ZOTsjgUefifuuNeGC2R9ByjK+ByxQYZHVRTpQ2OwkTuNoXons3ggNbqhQ41ipXQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788750222; c=relaxed/simple;
	bh=LduGvaq2HkeHsnZIWAa7rOO3Ab/Ral7ZtalXFWrd6F4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DsMT9EX4HYvZYxKLIQf7FgWJMLVuqoceXiovG1SxklmGNQb6eKTbsHFa88KWLTW1sr6P/fvqotXoBeLyC3FrSA03ShYLlbiRjuySjBv28nc+yg4AbW/vCDbWaU8If8CGaV0/VQxHdaI+UArv1058AvLK3Kz4QxvCgd84N+qlXUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=anka1.top; spf=pass smtp.mailfrom=anka1.top; dkim=pass (1024-bit key) header.d=anka1.top header.i=@anka1.top header.b=m2SWZhT0; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=anka1.top
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=anka1.top
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=anka1.top header.i=@anka1.top header.b="m2SWZhT0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=anka1.top;
	s=fpjh2607; t=1788750178;
	bh=Z6/MI7V3AAaJibCCjbTOdyrprCVn4ys5G848ohYzyL4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=m2SWZhT0lAwCdcU/XGNUPyYAFmE+r3mS8Fhp5Grrrhk3ogTPwpu9YMO7m6k/zNnfw
	 HLWvvZcSDNeuZnHgdqkeM6g7e9kRw1FLID8u8qk0bWvIcd4H/Ai7s+HotwNl8gqIWW
	 IlDzB5eN4zcdABgndOlEN3tZmB3bGgcLx5KLL/HQ=
X-QQ-mid: esmtpsz18t1788750177t1bebc041
X-QQ-Originating-IP: mhudmuRK+jGUoQh3trioMNkllJpXhZrC6vtfn42PiQU=
Received: from anka-20eya00ycd.localnet ( [110.188.68.77])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 07 Sep 2026 11:02:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14547451761491214320
From: =?UTF-8?B?5LiN5q276bifQW5rYQ==?= <businiaoanka@anka1.top>
To: alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn, corbet@lwn.net,
 skhan@linuxfoundation.org, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, wy@wyuan.org
Subject:
 Re: [PATCH v5 0/5] docs/zh_CN: Add Chinese translations for five networking
 documents
Date: Mon, 07 Sep 2026 11:02:53 +0800
Message-ID: <0180CCC46BD8F82B+2856576.mvXUDI8C0e@anka-20eya00ycd>
In-Reply-To: <20260824043806.46731-1-anka@stu.cdut.edu.cn>
References: <20260824043806.46731-1-anka@stu.cdut.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:anka1.top:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NHu6THI/J1zcgw89oYmRv0hfritCjEkyivPDATEwraauh+N41KPgA/CF
	mIcWjeCxLBhpqLO0dnmULj74cmsuMycrwew/Q+KBh/rpltSghSMujb3TWwOAYu+FYvl6xX4
	RGQ1QC5bkvtuA2FTbnY+7VatQXzm+XOuJrtarWVVkhHA6WCXln+LMVHCFXY/s0BdcWHGjbt
	ksT7lFcFdW/tFZHiGZVkCdyMSbByDmbftCYoxj07fo8KknMhGK106o3l8GW82T0XfU44kbl
	mCSeJ0+j/5eq7PDyaqiEYTVlv8wwd+nypWgPktO9pJ/BNIjfx0l4vmvhf/x/JHD4V4ojJ7Z
	Q47V6wgXFwGn+5pOa3mAF7Zy80VIhYVu5fmJbwC0b4bA08OjNZwu8kakvwdagEzr9sEkJqt
	w0+FyAViA2Jl6OoDtWwuq+mfWAlJ6vIVZXztqCfidEjPjbCEaIJTWOJnNMC1RZdGCGOzIfa
	KBSTgHXA8BdUYc9Pe2OgdBW5Fyo/11Bu9awkJQiN1/1izyqmDQw6E7s2v2HsU0J3P77V5+j
	tV7rgbM4ejjOC56LylJQjaCZAZaO7kmy3oLeD6wh/TmiyCzjZNmbkaw5+kDoE7tIjSTzd8C
	CuMQLRpC4D4jQ36E17E9x58vWUtmntqhEPJtc695c1lfb1PyjaLIiOEN2qRCcndhsi4CJDi
	URKRo610FS+tBTwuo17HIYZLrH8FcoQZUqXU1YwPnUogF1AuOMsFkQ1SHns4XTse8H++CWr
	ApII8FRf12Yke5mbvKx8bvf1lWp3oUuOVgGjBlqdmqZ8MSKqD6JSe76C44Uvt3iUkysw99m
	Yvn+TgxFI8L8LdrBbSlQ6+GdynZDVSchsa2FSzv/YH3BCWFiY9UTQwQiv0XhNIPBUygwa/C
	2qN6ksMlYlrY4mcL1LLIGstNZIHOpWpuSpv3/eMToI+6syt73Ur8HBMugEI5eXWzgdEzE5F
	31ZS9nkKXmNNuH5qEjnu8gg1E46krfWKDYG4JQMnJW2ezoqGGCzWnRUe+6b6iTmVs1s+wxU
	7v1dEy+/csG1KLRzYU
X-QQ-XMRINFO: Mp0Kj//9VHAxywGQnE2EvByktjoVJQWl+g==
X-QQ-RECHKSPAM: 0

=E5=9C=A8 2026=E5=B9=B48=E6=9C=8824=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=80 =E4=
=B8=AD=E5=9B=BD=E6=A0=87=E5=87=86=E6=97=B6=E9=97=B4 12:37:59=EF=BC=8CSiwei =
Chen =E5=86=99=E9=81=93=EF=BC=9A
> From: Siwei Chen <businiaoanka@anka1.top>
>=20
> This series adds Simplified Chinese translations for five documents
> under Documentation/networking/:
>=20
>   - team.rst: Team devices driven from userspace via libteam
>   - sriov.rst: NIC SR-IOV APIs (switchdev model and legacy API)
>   - driver.rst: Softnet driver issues (probing, close/stop,
>     transmit path guidelines, and extack error reporting)
>   - ipv6.rst: ipv6 module parameters (disable, autoconf,
>     disable_ipv6)
>   - secid.rst: LSM/SELinux secid usage in the flowi structure
>=20
> Changes in v5:
>   - Use direct link instead of ":ref:" to fix the warning of
>     "undefined label" in the translation of "sriov.rst" since "switchdev"
>     documentation has no translation in the same directory.
>   - Revise the commit title: "SeLinux" -> "SELinux".
>   - Translate "flowi structure" and "flow structure" into
>     "flowi structure" uniformly in the translation of "secid.rst".
>   - Link to v4:
> https://lore.kernel.org/linux-doc/20260817021340.17318-1-anka@stu.cdut.ed=
u.
> cn/
>=20
> Changes in v4:
>   - Fix two minor issues in the translation of "ipv6.rst" and "secid.rst".
>   - Link to v3:
> https://lore.kernel.org/linux-doc/20260811071200.54062-1-anka@stu.cdut.ed=
u.
> cn/
>=20
> Changes in v3:
>   - Remove spaces before and after "=EF=BC=88".
>   - Add a missing space after "IPv6".
>   - Update the translation of "secid".
>   - Link to v2:
> https://lore.kernel.org/linux-doc/20260727073538.56951-1-anka@stu.cdut.ed=
u.
> cn/
>=20
> Changes in v2:
>   - Add translated documents to corresponding index file.
>   - Link to v1:
> https://lore.kernel.org/linux-doc/cover.1784866896.git.businiaoanka@anka1=
=2Et
> op/
>=20
> Siwei Chen (5):
>   docs/zh_CN: Add networking team documentation Chinese translation
>   docs/zh_CN: Add NIC SR-IOV APIs Chinese translation
>   docs/zh_CN: Add Softnet Driver Issues Chinese translation
>   docs/zh_CN: Add ipv6 Chinese translation
>   docs/zh_CN: Add LSM/SELinux secid Chinese translation
>=20
>  .../translations/zh_CN/networking/driver.rst  | 138 ++++++++++++++++++
>  .../translations/zh_CN/networking/index.rst   |  10 +-
>  .../translations/zh_CN/networking/ipv6.rst    |  76 ++++++++++
>  .../translations/zh_CN/networking/secid.rst   |  24 +++
>  .../translations/zh_CN/networking/sriov.rst   |  34 +++++
>  .../translations/zh_CN/networking/team.rst    |  16 ++
>  6 files changed, 293 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/networking/driver.rst
>  create mode 100644 Documentation/translations/zh_CN/networking/ipv6.rst
>  create mode 100644 Documentation/translations/zh_CN/networking/secid.rst
>  create mode 100644 Documentation/translations/zh_CN/networking/sriov.rst
>  create mode 100644 Documentation/translations/zh_CN/networking/team.rst

Ping


