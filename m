Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.156.171.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793499881;
	b=CEH6Q5R9nD9L3odbIv4vtWQMI9NPDtF8nghp9ovE6XAzX+xPJgcXp6FWoc66JReDnwZa
	 Wy6GFy1NEpEF+4nItoXZEBLhSX1H8d+av39my8h+M108Wb5hYVjcqx08/xM3lLqYzWxiD
	 wOiSMkotODAKS0NaEbqC62Paoe/tb3s3dUQwJdfyT3ijQC9dRm/1rVPmWO3nfq5WvoTCP
	 uwjDF1gd/2P3J2CrVt9xVDpGZ5EX5PvUaCuhawmmi59YQTbgBc2QJKRCtTOcHRMHAKt9d
	 cftrk92V9qeKVfyGknZ+dpCLz5WrsWaYQ118b+HMhJMGgSfug49jQQ8Nt6hb7jn3xVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793499881;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Received-SPF:
	 Received:X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:X-PPP-Message-ID:X-PPP-Vhost:X-Virus-Scanned:
	 X-Virus-Status;
	bh=kqU33gEA8KfwKOunAziA7xlh/3MGIAM7fmhplDE5fT0=;
	b=MBbcRFzBjeqPRouOdDyrCd7L6x6vipJtV4z7NVB4iFJv4rI1PsfxVBArohDSjdr18S5u
	 jIJzA70r11j16n2BnmSloVatCaSj1eqlWZ9gqrL5tQqVw5AWoi3f2JA1ys5v5gJ2o//zB
	 /BfWJ0bgvq5U1ZUrs2CWYK4vQ1se1o21ZImsOnBBN7gAy7JbPCWUU4TZq7g3yO8TQcBx5
	 wW5d0o41oRy0xckZccb76hZGOaQ4oneyVvk6k8KcKvI6l+Z3VkqRXE/lP0AdKHUxnOHhS
	 29sViC1N3HELfJ+Ut+9e9zccrzVjlLohWh4NZ8OcbcG8si99I83h5Ro+a3gu5dNJa3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=antheas.dev;
	spf=pass smtp.mailfrom=antheas.dev;
	dkim=pass header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=Kxgi7LrU;
	arc=none smtp.remote-ip=178.156.171.147
Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0965F606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 02:24:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0965F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=Kxgi7LrU
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id 146A55E5A0
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 04:24:34 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 8C2975DF02
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 04:24:33 +0200 (EET)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 2557A200CCF
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 04:24:32 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1793499872;
	bh=kqU33gEA8KfwKOunAziA7xlh/3MGIAM7fmhplDE5fT0=;
	h=Received:From:Subject:To;
	b=Kxgi7LrUkOuiXolUF3UrrlNrk4LQ5EH2FOlD0nYPp0Zpq06QIyb1lx9EwYKAQdde8
	 zi+CYTYq38Ic+ox4lcPgKmwuw4Yp7Yq0Mu/Ma3fE71DJ8vdFq10uzRMTOCdx01ZAfr
	 VUKVdbRjiYi3erN2r8PnAeAAjmQCVUMkwqLwSiZJlzmbYKFiOiB6v+60q18OXmZDQ/
	 znYAOzNU42qvU6l8Qx8R22mrR9UPjYkhCl2hM7Ww1sFcxgGUM7JmO97vPHxWyQ+Lkt
	 1BAXIU31APsZgWilo24z1Bf3RMVBGmUGFC8AhPx/89rz6YcHIRphYPRNQ3dlzpy0UZ
	 t7OqbKUQAl/DQ==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.214.174) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pl1-f174.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2e60f9af6e6so17965185ad.3
        for <linux-kernel@vger.kernel.org>;
 Sat, 31 Oct 2026 19:24:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvByi8ZbBrjA1WwbYK61aIuMONPaN5wnK5AJiIkIDbnJoWzNZu0Kc81BHzKgtCsk/yN25XBGplY1DEd/9mwY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9msqKz0VGCoeVzaFhYVi81hS99sHePZM6WmX9a2KqUqU+rP7i4
	0wqGf05fb9WX3w8qZod0gVsIQU+5pyUovWNFw37ICh3Ex/z3i54xRUt9jR6Stj69A7RdvD3wwH2
	b083BN+81PsJDH5hsfLBdxe6JbZblZRQ=
X-Received: by 2002:a17:902:d2cd:b0:2e9:5b4e:b8a7 with SMTP id
 d9443c01a7336-2eb364f8fe2mr65117825ad.51.1793499870868; Sat, 31 Oct 2026
 19:24:30 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: 
 <TY7PR01MB1374656B7810521751CB248D4DB6B2@TY7PR01MB13746.jpnprd01.prod.outlook.com>
 <TY7PR01MB1374600CF756D90DF8CFC37BDDB6B2@TY7PR01MB13746.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <TY7PR01MB1374600CF756D90DF8CFC37BDDB6B2@TY7PR01MB13746.jpnprd01.prod.outlook.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sun, 1 Nov 2026 03:24:20 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwGbxW9+uVkbcCUiZVZZPK3dVBQsmV-jMXr96XovudEdzg@mail.gmail.com>
X-Gm-Features: AclHuK8ncQZWy8VN_L5_o--scyvvyi6zdooVn7LuqNYynRJ8A1onvxPS4fM4gB4
Message-ID: 
 <CAGwozwGbxW9+uVkbcCUiZVZZPK3dVBQsmV-jMXr96XovudEdzg@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86: oxpec: add OneXPlayer X2 Mini (G3E) DMI
 entry
To: Jiajun Leng <adolphpi@outlook.com>
Cc: platform-driver-x86@vger.kernel.org,
	Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <179349987253.1471767.4672178459927109333@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sun, 1 Nov 2026 at 03:18, Jiajun Leng <adolphpi@outlook.com> wrote:
>
> The OneXPlayer X2 Mini (G3E) is the Intel variant and reports DMI board
> name "ONEXPLAYER X2Mini". Map it to oxp_g1_i, the profile used by the
> ONEXPLAYER 3, which has the same Intel EC layout. Fan reading, manual PWM
> and charging control work.
>

Reviewed-by: Antheas Kapenekakis <lkml@antheas.dev>

FYI no reply-to next time. You shouldn't chain versions on the same
thread especially for series. If you find out why Claude does that let
us know

Antheas

> Signed-off-by: Jiajun Leng <adolphpi@outlook.com>
> ---
> Changes in v2:
> - Remove the X2Mini PRO comparison and the downstream kernel version.
> - Merge the quirk mapping and test results into the first paragraph.
> - Place the entry above ONEXPLAYER X2Mini PRO to keep alphabetical order.
> - Move the AI assistance note out of the commit message.
>
> AI assistance: Claude (Anthropic) was used to draft this changelog and the
> diff; the submitter reviewed and tested the change.
>
>  drivers/platform/x86/oxpec.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
> index c4c4babe8e30..f4b5a35a4d69 100644
> --- a/drivers/platform/x86/oxpec.c
> +++ b/drivers/platform/x86/oxpec.c
> @@ -300,6 +300,13 @@ static const struct dmi_system_id dmi_table[] = {
>                 },
>                 .driver_data = (void *)oxp_x1,
>         },
> +       {
> +               .matches = {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> +                       DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X2Mini"),
> +               },
> +               .driver_data = (void *)oxp_g1_i,
> +       },
>         {
>                 .matches = {
>                         DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> --
> 2.53.0
>
>

