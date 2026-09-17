Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3954A2040
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789687322; cv=none; b=Bk/NeJ2XA5VG7MK0vDz6AMHRTq11S2RHuknsyTDjKu74L6IlNu41FiYrLet+6tpnQqzesFseTjdH3E4FBS0OLlRBrrW29RTQRgBB1kSMkTAL4oxvtj27XSIN2ZomBgSjSEEXdQxU4TOf12GOOb2v0W6sLZmZdKAU9S5cqueoHkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789687322; c=relaxed/simple;
	bh=1HMJSpEe/iM0dqvznJTng//tA16N6zarxHYP228CtsA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=n2dLDQDwEdLM4yjAZnkZ7fJBNgkkrbxQubTmxxdP4qHmwfI5n0PL4YE/DBqj/Gsp57jYaWYMEUdvwhKayhYUV586LyR/EJvmRNPQbN42A2QNej+6dyJ84GvaKb8UKjm5QxJzACPaLD3hCFBgBEFuP9C5sw4R3+7uEq3iD7ri3TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=Drx2nWgk; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="Drx2nWgk"
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 68HNLIMQ3490347
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 17 Sep 2026 16:21:19 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 68HNLIMQ3490347
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026082801; t=1789687279;
	bh=/FYw270vTOngW6ke0HkG10bI8MAN7U8uC56DgiLggcI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Drx2nWgkn3kDyfL/XaOAQr3MKJLVYhKvjitAdD8IzHWY/FXZEU4hW1tStH1PJ9cgH
	 1B+orRDNhTndhGTxIjjlkTixIsQ+INcJCC3KKXDn8kw2TgZVYPbKQ8Ri4KZyRpwOg5
	 BSQOmYArr6wZGk3IbDpQUhyeTk3/HBTqHdXIT0rnXhgpZFr0JCkSp54cpudlP1cyiS
	 UrIkAyACOyz/udiSUE2WijCvBjiOHIdaM7gIfR0E5JibDwGqj0ZR5txuC1xCEwbBir
	 C43TTniYrIGztNFjwDRnl2PwtFCsebxB/5wLzsSylhANZE/uK4CGLHN2PAeU4OD4ys
	 mX+fBx+TQ1ErQ==
Date: Thu, 17 Sep 2026 16:21:13 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Thorsten Blum <blum@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Jarkko Sakkinen <jarkko.sakkinen@intel.com>
CC: "H. Peter Anvin" <hpa@linux.intel.com>, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_x86/realmode=3A_Pad_the_embe?=
 =?US-ASCII?Q?dded_real-mode_blob_to_a_page_boundary?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20260917114928.213178-3-blum@kernel.org>
References: <20260917114928.213178-3-blum@kernel.org>
Message-ID: <A263DA22-65F1-497D-96BD-D9ED0D0E36A4@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On September 17, 2026 4:49:27 AM PDT, Thorsten Blum <blum@kernel=2Eorg> wro=
te:
>setup_real_mode() copies the page-aligned size of the embedded real-mode
>blob into low memory=2E However, real_mode_blob ends immediately before
>real_mode_relocs, so the copy includes relocation data and potentially
>other =2Einit=2Edata contents when the size of realmode=2Ebin is not
>page-aligned=2E
>
>Pad real_mode_blob to a page boundary so the copy contains only the
>real-mode binary and its padding=2E
>
>Fixes: 084ee1c641a0 ("x86, realmode: Relocator for realmode code")
>Signed-off-by: Thorsten Blum <blum@kernel=2Eorg>
>---
> arch/x86/realmode/rmpiggy=2ES | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/arch/x86/realmode/rmpiggy=2ES b/arch/x86/realmode/rmpiggy=2E=
S
>index c8fef76743f6=2E=2Ece5350241238 100644
>--- a/arch/x86/realmode/rmpiggy=2ES
>+++ b/arch/x86/realmode/rmpiggy=2ES
>@@ -12,6 +12,7 @@
>=20
> SYM_DATA_START(real_mode_blob)
> 	=2Eincbin	"arch/x86/realmode/rm/realmode=2Ebin"
>+	=2Ebalign PAGE_SIZE
> SYM_DATA_END_LABEL(real_mode_blob, SYM_L_GLOBAL, real_mode_blob_end)
>=20
> SYM_DATA_START(real_mode_relocs)

Acked-by: H=2E Peter Anvin <hpa@zytor=2Ecom>
