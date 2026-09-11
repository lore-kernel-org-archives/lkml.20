Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch [109.224.244.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB0C3947B5;
	Fri, 11 Sep 2026 09:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789118711; cv=none; b=PmdbPaUQVnOiC4nwpYnl+voHR81/d1j5j+TViX72s7iZs3E5p01yk5mXZYZO7HDP/13FKKe84H4jYLYQR8AWw2i68c9sEog8w9qzXEvKOE0NK+1kohKd0j44QBs7cbbDF+Ag7X+3bcIs3ZbyBAgffbvpQTNZ3XdQ3dFdNV4pj38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789118711; c=relaxed/simple;
	bh=gFnYNCUkLALPqHBdoLHP6pmjdlhElBIhiQreamThwEw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nOyZ/xxYaUcgAp4C9y8oXlDhz84ARONc8gTQdwVhK0DpXOX7jQKHiODstggO6t0iYOEijJdilunpdpso6AesD5cu2upaYhaXrZxhQ0eOYau42K87q4iXSDMfcdYtNkupEWfE9OB1f8eQqIM1ywn88B0pT40RRHfFSRIzGef+BlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Gpx/5AMx; arc=none smtp.client-ip=109.224.244.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Gpx/5AMx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1789118701; x=1789377901;
	bh=ACUpEEGG3JZqEaqpcUPXznlrt400pBUy6ABhcZy2NmQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Gpx/5AMxvSrjhrOS4vp2l6cXeEgQ7iDeVww6ptY2w52Ksgj+vXpJiO22JaXN+8our
	 McjBt4h10Rik+BeJ3aZz6yBcJ1XlmAYwKjEU1xmF0Jw5iyTo0UJ4sjSOZgiAg+l4gy
	 WqkbgAUl3zM4gcpEyqos1iN+39yywKv43dd05Cb8UaZT3f2l9Kc6eZvMMBinngXr+s
	 +qLzYOWjX1ZK2ugNxI+Q0LQ4vHcCtDkX7m5L2aAujrXL6qhfz9vD9fXqThWUS7RZYm
	 HeZALrsFlaDXmRbXK+HgPPRIRKW6ayy8zYLJ6Z05KaVsM1sAd6g2WeUos4/jBnFwRB
	 N0NseC4EWAUBQ==
Date: Fri, 11 Sep 2026 09:24:55 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andre Gilerson <andre.gilerson@gmail.com>, Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] media: i2c: Add Sony IMX681 sensor driver
Message-ID: <20260911092443.68221-1-lsa.uz@pm.me>
In-Reply-To: <20260911-lovely-khaki-inchworm-a13bb2@quoll>
References: <20260909203717.90605-1-lsa.uz@pm.me> <20260909203717.90605-3-lsa.uz@pm.me> <20260911-lovely-khaki-inchworm-a13bb2@quoll>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 9d5a9fdefcc3d9fc06690128a67b129c904d79d5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

All three taken, and this answers your note on 1/3 as well. One of them is
wider than you flagged.

- MAINTAINERS `T:` dropped. You are right that we have no commit rights the=
re,
  and the convention agrees: 14 of 96 drivers/media/i2c entries carry a `T:=
`
  line and 82 do not.

- `dev_err` then `return ret` after devm_cci_regmap_init_i2c() becomes
  dev_err_probe(). The same shape is in twelve other probe-path sites, so v=
4
  converts all thirteen rather than only the one quoted. The seven in
  imx681_start_streaming(), imx681_stop_streaming() and imx681_power_on() s=
tay
  as they are - power_on() is reached from runtime-PM resume as well as fro=
m
  probe, so it is not a probe path.

- The clk_get_rate() dev_dbg goes.

Recorded for v4: your Reviewed-by, on 1/3 where you gave it. German supplie=
d a
full name after your note - German Pablo Lindo - and his Tested-by goes on =
2/3
and nowhere else, since as you say it does not apply to a binding.

v4 is not sent today, and the reason is the other thing you asked for: Andr=
=C3=A9
should ack the binding, and he is away until 28 September. Rather than resp=
in
twice I will hold briefly for that and for any comment on 2/3 and 3/3 on th=
eir
merits, then send once.

Sergey

