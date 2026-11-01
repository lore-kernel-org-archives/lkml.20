Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=88.99.38.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793497084;
	b=mmjoiyNluoHjsj26yGVEnDFdhh9ApLLR6PQVGN1N7X4H7FpfIcFLnC9xZejCk2jJN4Zg
	 6BvhhQ0JrnsuLY5IWDqcfaxJRF6P+HZYkYfjcvVQlvltfsdyW0f+xTtiFqh373volYAhG
	 Pj6sjSjNdkAgoTYFsMYJYhWLlsSmMWT5uLa1o9T0oXBvr1x19Ttpu4DrXwT36b9gKpcUX
	 zxp1tOreonous8RH46B9rld8MyQKVGnSlR3yX0B+6pGA8Dp13rZiFJ9GiK/5YMvsCsI+J
	 ZdT6BGY5rmBF/UjlFNv2uC+5cPIY0vnEkjByWytkLJ4Bqv+oMKpUAVYqWb0IKv13NLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793497084;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Received-SPF:
	 Received:X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:X-PPP-Message-ID:X-PPP-Vhost:X-Virus-Scanned:
	 X-Virus-Status;
	bh=AbVV6hXFymPLGqPqc/r4VXUug2rta/ReY0oIgq5dhJQ=;
	b=pwm/SLqi3+RmQ5Mm8EHaEPLAWyrEb/5e9TxMKU5PXRlJFYpg3hryPjQdt7bNbTck7RaI
	 DRmIFxt7Mt0JKZ8nKwjN+WkdxEArioikulNT/d93zZD61kl0G0vKUvR+s9K7+Z5ZOz/A6
	 eSmdLemtNO/ZY7I1jlai39L4nYkkZT0VDhbGHsnldtJYgnyiM79KG7ibxSSZwycnU4IYg
	 na8EqurnFeK5o5msWdlxeQRoZNCP/JKqOG3J43ZVbO/tjyY+BmqRz6ZJFw0GnicFtBNrX
	 5OAyS3iHwgrmwMiafAZ+INZvzBs3wlVpi8IYrYmNr2nWbMdCx+UFdXcX61VfylTp9Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=antheas.dev;
	spf=pass smtp.mailfrom=antheas.dev;
	dkim=pass header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=LgD4z4s2;
	arc=none smtp.remote-ip=88.99.38.195
Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEC3606A31A
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 01:38:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEEC3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=LgD4z4s2
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id 2269EBDEA7
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 03:38:01 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id B0586BDE8B
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 03:38:00 +0200 (EET)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 9DAE6200CDE
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 03:37:59 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1793497080;
	bh=AbVV6hXFymPLGqPqc/r4VXUug2rta/ReY0oIgq5dhJQ=;
	h=Received:From:Subject:To;
	b=LgD4z4s27DFchTJKFRV1uV1tjWrF0VYZS1tNlPlRx2lmg0uIWEBrogvqzXGtHoAJo
	 r38jzslJqWSyhw6ttg8EF4MZe5JZPNJSlS7hv8plYnzLIiQ2FF6znRWGQLVgYnzt2j
	 asFjv11BbKneBiLYhbU10/VG/dD7C8aw8vTEdTldBxVTI23wR9IaYrwoaczHRui29M
	 9JEDOjjoHoi+AwBDdrp9dNOwL1Dc9FiNCsFv0abGEtbJ4w1u+napg+xIO8MDcYaBzm
	 hlclqouCm+dAAgiadM2/9Frr86J8JCx5M167e5auwv0cmrA8ua3qJUH7+kCsAILVjp
	 xs0SF0x9kZ2HA==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.215.182) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pg1-f182.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-ccce6d9abfeso1340692a12.1
        for <linux-kernel@vger.kernel.org>;
 Sat, 31 Oct 2026 18:37:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBx7JVK2ZRX/gguM1vBw6R0qlGBDfm2Hug+kr1qQp75M+ivFqT/OxdYXymZOzeXBAO74CGwNfVc+/mMieqw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ezR7SQR81UZKXxiocXJfkuTtvG7KOix7LfAqealDNqdVC04zR
	N9CWrhD436yjTazuQmTypBKKGU0YXoJz+eTFGu60e4A8R8K3oUiXEtPHQiFg7qkTsmfpsvMGZoS
	gEC07sSwXIu5dxkWn2AOr0bJ6bQ4dYs4=
X-Received: by 2002:a17:90b:528d:b0:3ae:5525:dc25 with SMTP id
 98e67ed59e1d1-3ae89850a1amr5314180a91.51.1793497078050; Sat, 31 Oct 2026
 18:37:58 -0700 (PDT)
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
 <CAGwozwGDo4ae4WV=7Ko0vtW+JLCFTZcnZ6z=zQcRE2qXUBJt=g@mail.gmail.com>
In-Reply-To: 
 <CAGwozwGDo4ae4WV=7Ko0vtW+JLCFTZcnZ6z=zQcRE2qXUBJt=g@mail.gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sun, 1 Nov 2026 02:37:46 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwFqNXuwepO80H2uJu3-21TkAx-0Xva9XPTf5tVyXp=oQw@mail.gmail.com>
X-Gm-Features: AclHuK-ZBEnNg-PxRUfvRk5pEnqd-SLiJgdGWd2YOlAcClDZkXSge4mXI7KBUbg
Message-ID: 
 <CAGwozwFqNXuwepO80H2uJu3-21TkAx-0Xva9XPTf5tVyXp=oQw@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: oxpec: add OneXPlayer X2 Mini (G3E) DMI
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
 <179349708024.1294865.9495059634984652434@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sun, 1 Nov 2026 at 02:35, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>
> On Sun, 1 Nov 2026 at 02:26, Jiajun Leng <adolphpi@outlook.com> wrote:
> >
> > The OneXPlayer X2 Mini (G3E) is the Intel variant and reports DMI board
> > name "ONEXPLAYER X2Mini".
>
> > It is not covered by the existing "ONEXPLAYER
> > X2Mini PRO" entry, which is the AMD board using oxp_fly.
>
> Obviously. Remove.
>
> > Map it to oxp_g1_i, the profile used by the ONEXPLAYER 3, which has the
> > same Intel EC layout.
>
> Keep. Move up to the first paragraph.
>
> > Verified on Bazzite 44 with kernel 7.2.11-ogc4.1.fc44.x86_64:
>
> Drop. Broadly speaking we don't care, and I could ask you to test a
> mainline kernel now. But it is not necessary.
>
> > reading, manual PWM and charging control work.
>
> Move to the initial paragraph
>
> > AI assistance: Claude (Anthropic) was used to draft this changelog and the
> > diff. The submitter reviewed the change, built it as an out-of-tree module
> > and tested it on the hardware.
>
> Also drop. if you want to mention you used AI, do it after the
> trailer. The assisted-by tag is not used anymore.
>
> > Signed-off-by: Jiajun Leng <adolphpi@outlook.com>
> > ---
>
> /\ this is the trailer
>
> Best,
> Antheas
>
> >  drivers/platform/x86/oxpec.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
> > index c4c4babe8e30..50d169302fc3 100644
> > --- a/drivers/platform/x86/oxpec.c
> > +++ b/drivers/platform/x86/oxpec.c
> > @@ -230,6 +230,13 @@ static const struct dmi_system_id dmi_table[] = {
> >                 },
> >                 .driver_data = (void *)oxp_g1_i,
> >         },
> > +       {
> > +               .matches = {
> > +                       DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> > +                       DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X2Mini"),
> > +               },
> > +               .driver_data = (void *)oxp_g1_i,
> > +       },

Also, move above X2Mini Pro to adhere to alphabetical sorting.

> >         {
> >                 .matches = {
> >                         DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> > --
> > 2.53.0
> >
> >

