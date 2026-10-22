Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792691883;
	b=XD2rvDRGM/h7YzVc2A8Adtjyqvmd62MoojUO2r4JHc98cMc1dBhzmgpPQ6zRcnA2uLJj
	 1U0XvqxtQLy18wBZMSifGlGO/mbiiN7yjgH8XpKcMW2F+viudkVwtnYuxz6udcPPCerTw
	 7ZNBd8VX1wLQnf4eGSSGobMrSieOGt8ouePAnQwahLyfp/xpHySqdu7JqasZZ84Ce2rI4
	 pkvj/rk6Suyv3sh4a6ToSS2C4EnXWHrhUVR66pOW7ZjChjj5ZeDKDf6VICxAvvRX414UW
	 GTvmx/M/WHjnqd3OlIL0VXoO3SMfR4BWByHIMD8By+ho3+UBxoqcZBo7NP8jDbRYQOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792691883;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=n1REvRKYYNfK5I+aUVJkrK0y0rIac5QSu0xgyudqYaQ=;
	b=MFSjdv1za+Dy0DEBTknHMSJ3Pqevh/NA1I+kAouhhGhneUP/ahRsTb2z3hiu9G5uU+ki
	 ofebKRyENy6fyQDRldn14PQ+0PRQ60Ov8GNbm15nZHulaAI4L4ZfSCAFgww5YlaAJp5tT
	 gYVCryOTK6BJD6fFeAMQpdPh3PGkirKAkCVcKfsGTmN9qLi/56BxXdjgA6oOicSjHI4DJ
	 NnPXGXxXahJ656xPOGUoJ64UU3zK3WZeadcH5O0A0TTJPJbMpKpCkRPT4IyC3vxjTaA90
	 +QCnN5z4JvvJ26djeR/BHkfmth+/biYB2fzRs4TT5VRgvDfm1NEdfcLy3doBnBl15iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ESPLJ8uy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB28606A322
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ESPLJ8uy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4615A1F031F4
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792691883;
	bh=n1REvRKYYNfK5I+aUVJkrK0y0rIac5QSu0xgyudqYaQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ESPLJ8uyn9I9Q8vwd0wftJM/00hPrIbl0LqcSweUdd9MNDyyY2z3cATHvF2GoN+AJ
	 JolU0v0O8/StGNwXLF9xfJMoMyA5fXGyLr5BHCM9gr4WPadC9qWc/rFh/LLwqZDL88
	 PY9kYsyM1a/a5b5YDekHDeHF5aQ4D/iRrF/A4wJTGDhZmr05fJXePpk85nWKUWf4Cs
	 5uxIIogHSGsYqvhE9XGaREvJJUVDFt0X2n1jkRdmGt0Knm5Ei0RoRdhQlXYolVTe+c
	 AsYmUduLKfMy2GnO0W7i7RGONQ0rPH25FD3922dA6l6IjhtQLIUpchvr52QOl4t+ay
	 s0d4PsRVFbxbw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5ba36cc21cdso2557045e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:58:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz3hiKbHHjtCTVfBcFhHm3cxe9Q5kFpnpcEerT8khKqId0hXBbBU75zqNjwshtTxjO9GZ2SBi7mKceP/UA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhT3+Ak5+aYHVECWb1kmCxDJApBedUPP7EofFwqBVTg+YCT6DX
	xXsTX8VleoqEcauqVaXPaqcGvdonpGaOzH9f21/PVKlJQwnJ+dy9tV4MermF8zr7GFyc6VccbMc
	CgtPA9/lqbcTBZSX1lGjq6CYtajtk8SU=
X-Received: by 2002:a05:6512:138a:b0:5bc:b67d:58d0 with SMTP id
 2adb3069b0e04-5bfa1bee863mr2387595e87.24.1792691881611; Thu, 22 Oct 2026
 10:58:01 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018122220.678822-1-aliamemis@disroot.org>
In-Reply-To: <20261018122220.678822-1-aliamemis@disroot.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Thu, 22 Oct 2026 19:55:41 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hke5wNJSJvAmiA3ON4yPXcGL=v2n5ev6=MZuVs-=dSPg@mail.gmail.com>
X-Gm-Features: AclHuK9EPLLPC_-L6-IZdNf5QI0rsgLXOu6t35sNCcJB1-f2gYVIoB-IIxp3uJY
Message-ID: <CAJZ5v0hke5wNJSJvAmiA3ON4yPXcGL=v2n5ev6=MZuVs-=dSPg@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] ACPI: Serialize battery, INT3403 _TMP and ideapad methods
To: =?UTF-8?Q?Ali_Ahmet_Memi=C5=9F?= <aliamemis@disroot.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Rong Zhang <i@rong.moe>, Len Brown <lenb@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Ike Panhc <ikepanhc@gmail.com>, "Derek J . Clark" <derekjohn.clark@gmail.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
	Charis Stratakis <c.stratakis@proton.me>, Avraham Hollander <anhollander516@gmail.com>, 
	=?UTF-8?Q?Jeffrey_W=C3=A4lti?= <jeffrey@waelti.dev>, 
	Rick <rickk1166@gmail.com>, linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, acpica-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 2:22=E2=80=AFPM Ali Ahmet Memi=C5=9F <aliamemis@dis=
root.org> wrote:
>
> On ThinkPad P1 Gen2 and P53, INT3403 _TMP switches the EC page selector
> without taking the mutex the battery methods use.  On some Lenovo
> IdeaPad and Yoga models, the battery _BIX and the ideapad GBMD take the
> EC mutex and a serialized method in opposite order and deadlock until
> an AML mutex times out.
>
> As discussed in [1], add exclusive variants of the AML evaluation
> helpers and use them for the battery, INT3403 _TMP and ideapad methods.
> Patches 2-4 depend on patch 1.
>
> Changes in v3:
> - Also evaluate _TMP exclusively where int3403 and processor_thermal
>   probe for it
>
> Changes in v2:
> - Merge the follow-up series [2] and drop its EC query and UCSI patches
>   until they are shown to help
> - Add acpi_execute_simple_method_exclusive() for _BTP and ideapad
> - Make the helpers wrappers that take the lock around the existing ones
> - Join lines up to 100 columns, add a Link: for Suggested-by:
> - Drop Hans' Reviewed-by from patch 1 due to the rework
>
> Link: https://lore.kernel.org/all/CAJZ5v0gS4agVUkCO6M=3DVW4Wi2y1-s+k23bpz=
mX9aAZ0Rsv4z9Q@mail.gmail.com/ [1]
> Link: https://lore.kernel.org/all/20261014190544.150093-1-aliamemis@disro=
ot.org/ [2]
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D221065
> v2: https://lore.kernel.org/all/20261017130652.318778-1-aliamemis@disroot=
.org/
> v1: https://lore.kernel.org/all/20261014132703.93355-1-aliamemis@disroot.=
org/
>
> Ali Ahmet Memi=C5=9F (4):
>   ACPI: utils: Add exclusive AML evaluation helpers
>   ACPI: battery: Evaluate battery methods exclusively
>   thermal: intel: int340x: Evaluate _TMP exclusively
>   platform/x86: ideapad-laptop: Evaluate ACPI methods exclusively
>
>  drivers/acpi/battery.c                        | 12 +++---
>  drivers/acpi/utils.c                          | 41 +++++++++++++++++++
>  drivers/platform/x86/lenovo/ideapad-laptop.c  | 12 ++++--
>  .../intel/int340x_thermal/int3403_thermal.c   |  3 +-
>  .../int340x_thermal/int340x_thermal_zone.c    |  6 ++-
>  .../processor_thermal_device.c                |  2 +-
>  include/acpi/acpi_bus.h                       |  7 ++++
>  7 files changed, 68 insertions(+), 15 deletions(-)
>
>
> base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
> --

Whole series applied as 7.4-rc material, thanks!
