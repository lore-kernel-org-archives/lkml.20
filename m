Received: from mail-106118.protonmail.ch (mail-106118.protonmail.ch [79.135.106.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1814562BA;
	Fri, 25 Sep 2026 20:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790367745; cv=none; b=fK0HtJtuIQyqns2JHoy4ShZsU2xXXJ6R1GVNEQxHH4C3BRSgWLYT2y3rZHlHbL28lQWOLme2TcMQedHsH5BBGBm/3Dh5WLPy6vVVcCsPxMMSR9qYngUoNSvsT83+6LlWY9A051ickf3D37wjM/y99ojfhfhf6o4r/F/jWC8EXFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790367745; c=relaxed/simple;
	bh=5ZNPASRplPy2DuNlOipZy+jH3w6z894WaScclxbZsNk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GIWVlrRdd3rMxF5rfdoh+VKoqVpb7HtLhKiKbD1WYkYw9RYHcsu/5VBWqmCcJtm0IG8iXeH/dQCFDxxMBk+nMlgKKWKCGFE2n6+5J+G1QNMMlEW3KWFKcKkQfIQi8dGfeo8ghJj+Bb1yqX4uX0mZSUN9Ps+pBeo1Qif5WM0I3XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=dxzaKklI; arc=none smtp.client-ip=79.135.106.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="dxzaKklI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1790367735; x=1790626935;
	bh=5ZNPASRplPy2DuNlOipZy+jH3w6z894WaScclxbZsNk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=dxzaKklIphPKsA4AVpWEZigj+ahbr06UWkNj8XSMPtZrSonofHwnMbWKoHXlcvCT5
	 tJvUD3NkDqrojzLZDTQA8lPcyqqCpUYFHnIYIcOp0y84aXyY2dOS0LmMwX3WXEPKW3
	 Bkl+XZbGcG4AE5xH4sZeRpm9dpc+As9cy8nsVN12+tVcFB8tb8q/vMNZFFnprSbF7Z
	 nq8AcGbWoYsxNVAXI3eqlFof1+8IMAtt4w+4UgWeq28ZNrKc8PlKcDHiOk2FtAZkY1
	 QKb1geBVjq+CMUbpfLq3qXjIAAuSxHtjHIH6qb8UlQ2wRRF8QOGT2oj0LhgZYQ3U+5
	 PBBrrPk2QCQJQ==
Date: Fri, 25 Sep 2026 20:22:11 +0000
To: German Pablo Lindo <germanpapulindez@gmail.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andre Gilerson <andre.gilerson@gmail.com>, Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, sashiko-bot@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Compilation error in [PATCH v7 0/3] Add support for the Sony IMX681 camera sensor
Message-ID: <20260925202158.37878-1-lsa.uz@pm.me>
In-Reply-To: <20260925200238.12765-1-germanpapulindez@gmail.com>
References: <20260923211816.89954-1-lsa.uz@pm.me> <20260925200238.12765-1-germanpapulindez@gmail.com>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 6fb356f62dc1c560621033441b11388730fbdf09
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

German,

Thanks for isolating it to 2/3. The patch is fine on the base it was
written for; v7.3-rc4 is missing one media commit it depends on.

The series is against media/next, as the cover letter says
(aedd77ea8168). There, 7eef49c1646 ("media: v4l2-subdev: Add struct
v4l2_subdev_client_info pointer to pad ops") gave .set_fmt,
.get_selection and .set_selection a new argument, and imx681 is written
to it. -rc4 does not have that commit, so the driver's two pad ops no
longer match the fields they are assigned to, and the kernel builds
with -Werror=3Dincompatible-pointer-types.

Checked both ways today with the same config and compiler. On
aedd77ea8168 the series applies and imx681.o builds with W=3D1 and no
warnings. On v7.3-rc4, git apply refuses the Makefile context; applied
with patch(1), the build fails with exactly two errors, at the .set_fmt
and .get_selection initialisers. linux-next already carries the change.

For testing on -rc4 in the meantime I have sent you a two-line change
off-list.

Sergey

