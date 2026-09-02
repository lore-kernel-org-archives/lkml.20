Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9E03161A2
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344103; cv=pass; b=Ko9TawdjL2Ph39kzRnrFneqb5wqPJRqP1KJArBpCnvtUMCvi/3bfm7c8qB6wXz2IeG/wC0rKzNjICRdQ9LcUt3hevYF9CMwAyO1tMrnwSTZUYR2bglMffBF3+TiaIOyO1V1ysxTViBxFA3ZTTDcqn/5j8E7DZvcmtE7L9Ny0bp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344103; c=relaxed/simple;
	bh=+bwQPpHd95uc6Rg/Dz4vte+4kd/r1X1rT7qjY6B28Ik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=my03ZlZdt7JmmWpsMkpkCd33Olsu75d0nebcuT16HfD/0zTOd0S27HHYEMcLLlZRLKuBySurL7qRa25wcUczJ1F/7+nEsea0l9i4rwIOsQuFy5lXR5gXmsQvQ5Xi2lZv/acVkrV8ESyBGw0TOTB1t2QTJhnM0C4q40rDMiMJmIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=W03CIwdp; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="W03CIwdp"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-66e63c2c9e1so2343983d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:14:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788344098; cv=none;
        d=google.com; s=arc-20260327;
        b=LEjWgM2ptPxCY62BlUHso9sbHHnpahKnwSxHTIeipxLDSh0VK+foiCKqjfGmYS1O5n
         HRT9Og2MXtJI+9ZBrozkloBmmgdGY9sj/5jZoUOV8hUFzm7ckXyw0Hq1BZAKl/QS5j1H
         C7c133m9VWxU7A+atTT+2FI+Aa2kbaKVx9coG0ik29lEyUSBxLweZYDN+476XT1knAaC
         budW/OfeyUTro8tUFkzSUvfBhnayQ2DFAYqIuC0tWzK7QL9tIIw8OplAKczIHjNMxK3H
         kkiTxpBGE8MeXd8hR/gTL0ARKW3Fa96vDycfaqnRf/E8s0qUyUFr0xFL5RD1ESp4QV8T
         OB/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mb8ynk069k+PNmY0VezYYz4qwV9n0kB2tXPfvCPTmTM=;
        fh=UuOKfhQ8KUEkePoX0sgL8zzdy598zKAQnSSQi/C/5hA=;
        b=hiF14/khTnTuMdQaj0aku+fZARJyIEX4+syAIur+WV7gtaKhbpvUIrcFufles36CE3
         LS/ITnwy8+7Klpznq7HRvNGoms0FmMk/4PWf54NvguIPPuy/0gfeRBrfLKYcV1sZZamS
         XvmRaCFn5FL799y8QIufV19uVkUu7jZm8GsEUB5F2Bg7inf9UnrvAiTBR+LRX6pvuZ/a
         1ytE1S1KOrVy6GVk3Z4PR/LGgMJBG+dt1wUn1MDikTeH52AUS+8OvkafDW0eiXB+rWE8
         640O3NJWdetFVk+DYQo7iFPjVltygSg0P58q1jljvtq6wJySKcEm2rhIPEypYgVWlgtz
         K52g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788344098; x=1788948898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mb8ynk069k+PNmY0VezYYz4qwV9n0kB2tXPfvCPTmTM=;
        b=W03CIwdpkCKp3D6qjWSroWpbanCmxeUXcQ53J/gd3HOu6TLhpxt/O4kXlwTSyFcqin
         /W1XGUFJU+ez7R8EFX3EMEQK1ugbtorgadF9hZGkcxbo38/YSuBJjQqeNgybhzyXItUp
         I7QL2ighglN56XoUItiTHPurt8n+dhi3NVLuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788344098; x=1788948898;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mb8ynk069k+PNmY0VezYYz4qwV9n0kB2tXPfvCPTmTM=;
        b=hTxLalCgiEI9jzMdhEvzW3/pd3OeW0q2kYvaRh1tUe2wSkzgMerI/wB55HVnpS7Ysx
         DcrG2xPyytverHA8hIg52rOB9rGdS3AkukCG2iCejDU9byKe0vqaVtY6vlyQ5RaHz79o
         Djze0XK0/ISsKA19dC+0LPTrWrYS1FaE8B8KXaupmWwNKFtTyQTPvOu6jn6qZo8DUuRJ
         1Jf+ObFpPHWAvLdPFL7hmKlN9OvL6ucipMUqKhZB3I8xLjPGErQwO6gG0WX+FKh9FFJM
         h3drxyDqllMF2JAv9rj8Qunp9jJMORbKhpwxgdk3nlKU8xs8En7m3J0J0Axyf2nFCNKw
         pNFQ==
X-Gm-Message-State: AFuF++kNZDTyEn0zHigJApHvGa+gmwbFiZ6xyeoCIuFXE1pjy96Z53t4
	rvf9j+mJC23SSMSQdbRj1Ny8g6gknwcX+LtQ8nLApbnzdLjNaUtatbr7qVHOJUZZjBxEBNw4bpw
	hUarDnanb8M3IsHVyQvZAxl7fDnbrueTrdHUXXzM/eg==
X-Gm-Gg: AYBFou0ObTfBgQ6nlrWPqRUUYP/zcUxgVFdDMMseA8JrhBgiucMXvTdcZo1NbypQcBv
	x+L2hkDD6qZhNt+OkgY3wTEtUoTcvYQHxTCByxk8hx+cDWUCFxAWWC1puFlUZ1n8L4jnue2pqkM
	zahSeLA7oZy5uTORzxbAYE/H/sQlBZno5eJ12QxjEDutuxKus1tqX0+SIDDJKQHz122EkcUrwOZ
	WeRLuw4V9c/cvPp+pdVL6KhdOjyvfNxpxg9zNJqPJiKgWW8MkHXC6wYSiROlU/I74NZLs5hRzYd
	OTFrFV7sxO6ugv84S5tKkaZpeSd6QrmWgVrVBzhdxbU+5m1E0qNXSBGlyqwoUyZU/gomVCvZ7o0
	=
X-Received: by 2002:a05:690e:4811:b0:66e:3f5e:d9d with SMTP id
 956f58d0204a3-66f8a55908cmr3215408d50.24.1788344097702; Wed, 02 Sep 2026
 03:14:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901090912.585681-1-dario.binacchi@amarulasolutions.com>
 <20260901090912.585681-2-dario.binacchi@amarulasolutions.com> <apfgacuyUC96x44N@shlinux89>
In-Reply-To: <apfgacuyUC96x44N@shlinux89>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 2 Sep 2026 12:14:46 +0200
X-Gm-Features: AcwNN1W0QxIzImRfwuJO50vyXAICPLdqq5UEUTh9rGTZ5udrdp2AiyHjRSLvxL0
Message-ID: <CABGWkvq+Fqn2AVG3UyUVuK=styz7F5bwu9zdZtAV0HTGES6vNA@mail.gmail.com>
Subject: Re: [PATCH v11 1/2] clk: validate spread spectrum configuration
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Peng Fan <peng.fan@nxp.com>, Sebin Francis <sebin.francis@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peng,

On Wed, Sep 2, 2026 at 10:33=E2=80=AFAM Peng Fan <peng.fan@oss.nxp.com> wro=
te:
>
> On Tue, Sep 01, 2026 at 11:05:17AM +0200, Dario Binacchi wrote:
> >The spread spectrum configuration is passed to the provider's
> >set_spread_spectrum() callback without any validation, as clk-conf.c
> >only skips all-zero triplets from "assigned-clock-sscs". An invalid
> >device tree can hand providers a zero modulation frequency or a spread
> >ratio above 100%, and each provider would have to add the same checks
> >to protect e.g. divisions in its rate computations.
> >
> >Fixes: c86814e70390 ("clk: Introduce clk_hw_set_spread_spectrum")
> >Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >---
> >
> >(no changes since v1)
> >
> > drivers/clk/clk.c | 14 ++++++++++++++
> > 1 file changed, 14 insertions(+)
> >
> >diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> >index fef87167a60b..208caf60eeb5 100644
> >--- a/drivers/clk/clk.c
> >+++ b/drivers/clk/clk.c
> >@@ -2851,6 +2851,20 @@ int clk_hw_set_spread_spectrum(struct clk_hw *hw,=
 const struct clk_spread_spectr
> >       if (!hw)
> >               return 0;
> >
> >+      switch (ss_conf->method) {
> >+      case CLK_SPREAD_NO:
> >+              break;
> >+      case CLK_SPREAD_CENTER:
> >+      case CLK_SPREAD_UP:
> >+      case CLK_SPREAD_DOWN:
> >+              if (!ss_conf->modfreq_hz || !ss_conf->spread_bp ||
> >+                  ss_conf->spread_bp > 10000)
> >+                      return -EINVAL;
>
> I think sashiko comment is wrong.
> In [1], we reached an agreement that spread "in permyriad, i.e. 0.01%".
> So the input value must be the real value * 10000, saying 0.01% * 10000

The DT cell is a u32 holding the integer permyriad value, i.e. the
ratio * 10000 as agreed in [1]: 1% is written as 100, 100% as 10000.
extConfigValue[7:0] takes an integer percentage, so the conversion
is a division by 100, not by 10000:

  depth   DT value   / 10000   / 100
  0.1%        10         0        0
  1%         100         0        1
  3%         300         0        3
  100%     10000         1      100

With integer arithmetic the current code programs 0% for any depth
below 100%. I am sending the fix as the first patch of v12.

[1] https://github.com/devicetree-org/dt-schema/pull/154

Thanks and regards,
Dario
>
> [1] https://github.com/devicetree-org/dt-schema/pull/154
>
> Regards
> Peng
>
> >+              break;
> >+      default:
> >+              return -EINVAL;
> >+      }
> >+
> >       core =3D hw->core;
> >
> >       clk_prepare_lock();
> >--
> >2.43.0
> >
> >



--=20
Dario Binacchi
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com
