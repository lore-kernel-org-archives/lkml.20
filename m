Received: from smtp-outgoing-2001.laposte.net (smtp-outgoing-2001.laposte.net [160.92.124.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9081C2D0C7E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 14:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.92.124.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788877217; cv=none; b=dQP6NwFs/1zuGXq0BiGo78o02t6oukjuxJj+stx5EzyAdOmZZq5ifv48HsCLDl9UnttDG20YVIKvAau5Q2JaTap/2rkWeJB7w3FAKTAi/sZFSxRuqaDTnb1T/DVtPxioWThOmznHvGX9CyJ/ZMSYwXR25y6VsbFN8MvJZhe+A84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788877217; c=relaxed/simple;
	bh=DErKUlamimYuPinfWRQBo3L6f2qMDUbP2BPZtPx3X1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FZXbov7/GcakSSuwIn7AUX7YvfwkmfailQkKR33JAnpGItOdEe/04jK1HzJOIfoMAhjxKnhR3MkP7zWtxFC758wefsTpGZjK+ThYIGCYQymw/UNrjXtc9xxh2SNu/I9soQH54HQaAigyjJ5iKcXVx2/0sPmUaFXkoVpql/eQH1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net; spf=pass smtp.mailfrom=laposte.net; dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net header.b=Lj2gTHMU; arc=none smtp.client-ip=160.92.124.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=laposte.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net header.b="Lj2gTHMU"
X-mail-filterd: {"version":"1.9.7","queueID":"4hfNKm4pmXzFpTt","contextId":
 "fa92bd25-bd04-4480-80fb-eb23f73b4bda"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
	by mlpnf0101.laposte.net (SMTP Server) with ESMTP id 4hfNKm4pmXzFpTt;
	Tue,  8 Sep 2026 14:19:40 +0200 (CEST)
X-mail-filterd: {"version":"1.9.7","queueID":"4hfNKm19m1zFpTZ","contextId":
 "5a289249-bd63-4880-894a-662698aa4d29"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
Received: from [192.168.1.2] (m-dj.hd.free.fr [82.67.82.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mlpnf0101.laposte.net (SMTP Server) with ESMTPSA id 4hfNKm19m1zFpTZ;
	Tue,  8 Sep 2026 14:19:40 +0200 (CEST)
Message-ID: <c1fcd1f6-38a9-48a6-9986-9723d2dead39@laposte.net>
Date: Tue, 8 Sep 2026 14:19:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: hp-wmi: add charge_behaviour support for
 Spectre 8C17
To: Shang En Sim <sim@shangen.org>
Cc: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260812062113.27741-1-sim@shangen.org>
Content-Language: fr
From: Alain Cousinie <alain.cousinie@laposte.net>
In-Reply-To: <20260812062113.27741-1-sim@shangen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=laposte.net; s=lpn-wlmd; t=1788877201; bh=DErKUlamimYuPinfWRQBo3L6f2qMDUbP2BPZtPx3X1g=; h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:Content-Transfer-Encoding; b=Lj2gTHMUNgWfrv/ObMhgK5KdidgXCAWfTmKr1+3HzC0GquLefcNaubVmI6mzV4W6Ih2CdR+HwNi7gm7zW3tLGiYol3B8g3dmrk3pT5wHplOP422C83Wkq1LlOgjoZf8jPyHuVvPRvSaUOr2Fkd9jIkPTkhlXyg3h5zX8OJIrKWF96fnEyJR8ZfVTxYtuhQ+B2HdtfNjjBi0Jw2/kvuWuQFwMVGjJC/nf++JLdBngp40ka2Zl+AY7obUEf2MlfRXkLhDxYdMPa50xVKy2l0hCLquUDjT1jA5KmMJCsZU1U5l4/M+/W4H8qmetaBU6ium14OxAGWW/OWi95EKbr0Ka+Q==;

Le 12/08/2026 =C3=A0 08:20, Shang En Sim a =C3=A9crit=C2=A0:
> HP Spectre x360 16-aa0xxx (board 8C17) exposes battery charge mode cont=
rol
> through WMI command 0x2b (GBCO/SBCO). Inhibit charge, force discharge, =
and
> restoring automatic charging all work through that command.
>
>  =20
> +#if IS_REACHABLE(CONFIG_ACPI_BATTERY)
> +static const struct dmi_system_id hp_wmi_charge_control_quirks[] __ini=
tconst =3D {
> +	{
> +		/* HP Spectre x360 16-aa0xxx */
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
> +			DMI_MATCH(DMI_BOARD_NAME, "8C17"),
> +		},
> +	},
> +	{}
> +};
> +#endif
> +

Hello Shang,

I am using an HP Spectre 14-eu0xxx (board 8C15), which appears to be iden=
tical to the 8C17 model regarding `hp-wmi`.
(See also https://github.com/aigilea/hp_spectre_x360_14_eu0xxx, which als=
o covers the 16-aa0xxx model.)
I found the same elements in the DSDT, and my tests seem to work after mo=
difying `hp-wmi.c`.
Is it possible to add 8C15 to your patch?

+=C2=A0 =C2=A0 {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* HP Spectre x360 14-eu0xxx */
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .matches =3D {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DMI_MATCH(DMI_BOARD_VENDOR, "H=
P"),
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DMI_MATCH(DMI_BOARD_NAME, "8C1=
5"),
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },
+=C2=A0 =C2=A0 },

Thanks in advance.
Alain

