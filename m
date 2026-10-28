Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793227988;
	b=In0vYYrSbbdJHXMXTvxUZMzcTA/3bwjqa4a006MdLSWSd1nusC6KR+rHWPHxYmkMz7Cw
	 h2geDMSfWXrLMMJUarSAg9jwgqTJLdhmTE50TgLgOjGBc2xtgUZ7WH6mo2evmQvqyI0PA
	 XVqGv8K8Etn5EQwKCU5OA87VZ62fLzi7ALFcgHOPHh51nucto7fNqupByh3tMRN3Dx/LW
	 pj5RtyZzgxO0pr/x7uNXUQHu+YnxjtAlE57y3nHDWh7QHKVonfaQ6HaOI4DuGdRev22zq
	 5GYVQ7eqw/E/ihfHTXL4BPpFMyNXDWu8u8+LHCq9wFuzbWUu44HZwYCD5DVHgLpcYLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793227988;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LUzzsIAM6IlGqlO6QeE7+4Pmhv4eAgzjV7MKduHlPpI=;
	b=ZooZQ2q+AoegBOy2+y9XuNZoj5mIxKgy/Z9HbTS+dwIx6cw0cJUDg39QSInfh2Ften5b
	 ZoIjnZehOCOShmTxx/uOndSI+flooepEkhNyw6E8fBlAdj+0TiVOurWL4bDTXYalVLO6D
	 T6uSkSXqgskDbtFNYy96izNko1/LHLJ2lZveABKLDJ4fElesEBLSn99RpPRn6IuPbAcYS
	 J5zpQHGiMa9HKaYAfR8lJm9gWR3F3xECZGxvc65/1UTgOIISVe5VpCdR61DW0nGMkS200
	 9TZYFX9BktPU1Th/7CmLf2Znm96i3si8q16YCOZxL5a8M+K3DODxXrYHC0/DLbAVGaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MoG3Tpvr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0296B606A321
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MoG3Tpvr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5FB21F031E8
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793227987;
	bh=LUzzsIAM6IlGqlO6QeE7+4Pmhv4eAgzjV7MKduHlPpI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MoG3TpvrBpkcNOjjXlzCqkry5e09Sbh4WEMosecwIm0u4ucwfmxyGCSH6HmVBLD+E
	 mqnizOjovDh3TSi8hfYf1rVMAOGP3Sb6kXOELfx52ckxd8gMtYgQ3On7WqlUiS7ArT
	 JWqMZmtJ4vCAtC6uAVKi0bEueAN7uWAFbG3DqtVJoxzjjkfb1dvSk+WJbQ5vBaTI2V
	 OePwGMMsXiu1K8mjxMbs/4pzQehbukEjthpphFtH2j3MehP7uF5L2a1OpcsQWtl88F
	 kyC3lhriuzdzXzzQSvd+Y3U2nXTKABoymr5BNtHdbnNHPkQiGJoww8nQmkWNNqbFbk
	 dQPs7jqom46rw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5bfc32574e7so153749e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:53:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByxUNF8l5uuajuaRBtojl11nYgm98pggoOlCKoNUAOcDkffTbnEo7TUZNJn6ctpVnNSmdXLGb28K5zbxGQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLD1VEkuSPK11ijFzLnLv3WI39A9eNGMb3wsl6reY96YtTOKHom
	ibIzBPo701wBa3FHUuPLt45JZRpayw/hUTmy6Hj36bFstPdpmlfgZcWePO8bSORl/fuxxx9LDBa
	RTHIgQ7Zlco63KNpTa4u2mP1YR8t6Hy4=
X-Received: by 2002:a05:6512:3186:b0:5bf:b7d3:beb4 with SMTP id
 2adb3069b0e04-5bfd11acd08mr221499e87.15.1793227986490; Wed, 28 Oct 2026
 15:53:06 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-gpio-mxc-cleanup-v7-4-v7-0-7b602d70c149@nxp.com> <20261027-gpio-mxc-cleanup-v7-4-v7-2-7b602d70c149@nxp.com>
In-Reply-To: <20261027-gpio-mxc-cleanup-v7-4-v7-2-7b602d70c149@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 28 Oct 2026 23:52:53 +0100
X-Gmail-Original-Message-ID: <CAD++jLngFzjoieJNkpp5-m-86CqNNfK3TDw9NDa1S7oMhOm1sQ@mail.gmail.com>
X-Gm-Features: AclHuK_KQ4oBhICxbJAF69cbCxAU7hikZMXoxY43y-DzbhGz00AVIZeTD4WQFRs
Message-ID: <CAD++jLngFzjoieJNkpp5-m-86CqNNfK3TDw9NDa1S7oMhOm1sQ@mail.gmail.com>
Subject: Re: [PATCH v7 02/12] gpio: mxc: use for_each_set_bit() to iterate
 wakeup pads
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 1:13=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Use for_each_set_bit() to iterate over the enabled wakeup pads instead
> of checking every bit individually.
>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Neat!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
