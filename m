Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794801393;
	b=aHMDapw3k9XtEmnO2U1LECy+yuahJid4D8ET+x3gmsFqwSFaNA1HIUkYex5e3lbLKNdM
	 sm7ACY/Ac3BgnG3SBbBDjbbFKFB746ab6L1qmeoEfI05E4RPRc42w7/S77TLDhpCgLwiM
	 gNZBAPve+ElWEymLdJ/qOGMjKog/auMc8p59QF6KDds2D5fwucsxpV07zanxngD2q0QZt
	 qbLsvZ1vzXyF6f9/xbjQUXWTQW5iOJD+ppusujx9FLCNX+FO1QwvdpcCpPZ2sZK6BPDhn
	 peg3cbOhmQP0n9bnQDDmZkAC6/sn7fF20CYHOrhnIHtBCwFBly/DaGnOMTIE9L2iULA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794801393;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:
	 Content-Transfer-Encoding;
	bh=+6dOvYRVzQ9+bhI5eE5XNV7TqV3Ds0TchIlyG7Bl/Io=;
	b=zo0qI/WeMn4gCIeOoVyRRPjPbqJ10E8sNi13IF97ENorZyu42en43H72f2pRxVax+Mnu
	 1rtBioUGNCpJD63p7khMWnfoc1Rts7BQcFpJQNWLrl/ebNREBpJ1kRT5lf9eLwRmBrhm+
	 JnxLdpx39QDYepPaTQnyLKuEBa7chP6nK/loHeR5VyJz4XLoo+LgebNfprTnDjNB8TX9d
	 nuujGELHUe00MQ/e2SDVRSeXLxNhBo2yDMuMKA88lS1QkW6LPjECN1KK0kXWLIUK/l/eg
	 2JgelEav2CA0ctDIj9JEbT04pBNCGGJLjapJpqroZgCqeQAer0xIgeTeoCDlb1iRMyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=fail reason="signature verification failed" header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b="J/o0XHIE";
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94892606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94892606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=J/o0XHIE
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3245D40E019C;
	Mon, 16 Nov 2026 03:56:28 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id epKAmDZ2VJ_u; Mon, 16 Nov 2026 03:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1794801384; bh=x8ygkmDzVVjxUwAjhVjtmtzmZ+VLK3ZkDLHSUJ/iG+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J/o0XHIE4N9V6Q6Pa2JfIifs2QPxz3Yrk/Q+5Zft/fclMhDtx5520Nt34Eqr3j74E
	 qrtJJx9rQ+46hGRK/62y1xA7G70bDSjPvTEKbt/xow4ZCKTsAc1Vc3rWD/pXtOLKtd
	 lJAsV/iQHtnC3LmcfAgdW7G8Q/Iq7ZaAbPmOco1qf8cWP6X2+rfStsnLoJLncJtFus
	 I+CyA+94QPHXW7KNyU5mkHxCCC1cegPjc1a77qarmG2pxVF+ob4EgvK88AUreAhftt
	 hiXah/wEBzNaPEx/Z3LhNUHYIKSVS+d9ppZrvMFXF61sp+0EPdvjhdzncIw/MkSxax
	 tKkMyi/UO3zSrbcH7OuS9jHGGAn/h13tP14TEExCbaCq37ZYVj9g/R6WrEuFyhm5OO
	 Bzj8uuOrAZdvRMvHwl7IH+EyfKAldjpYjAs/nZZSbKlmTL7aEqAPEkZLfKS0R1kgOa
	 97oHoNrXQxBZEkvFVKMIVEEwjhoxPemBWElOBpPzP2VcL688YnNkAIKIMGBpFZ0Kst
	 OqcHaW1+NUPiNUz9LTZI4cMEwH4QgNq+WrTpuTD8BmPjv92Xkiz+wUHnS8xg0dbYOS
	 eislpGBzAcub1KdOiH6PmeSx0LDCaYHbVwrcL9g9HyvLz9AoSySpV9Cavnj0ApaqT+
	 4pnbgcy1uinkckn1vHr+ha1E=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id EBA4A40E00DC;
	Mon, 16 Nov 2026 03:56:11 +0000 (UTC)
Date: Sun, 15 Nov 2026 19:56:08 -0800
From: Borislav Petkov <bp@alien8.de>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Pratik Vishwakarma <Pratik.Vishwakarma@amd.com>,
	Prathyushi Nangia <prathyushi.nangia@amd.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86/CPU/AMD: fix booting on Xen PV domU
Message-ID: <20261116035608.GAavp-2BX67_xv2LYT@fat_crate.local>
References: <20261116014057.7409-1-marmarek@invisiblethingslab.com>
 <avpgJcmTVQcHf8QB@mail-itl>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <avpgJcmTVQcHf8QB@mail-itl>
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 02:45:09AM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > Fix this by skipping the read when running in a VM, except Xen dom0
> > (which technically is a VM, but does have full access to the hardware=
).
> >=20
>=20
> I forgot about:
> Fixes: ab8131028710 "x86/CPU/AMD: Print the reason for the last reset"
>=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethi=
ngslab.com>
> > ---
> >  arch/x86/kernel/cpu/amd.c | 5 +++++
> >  1 file changed, 5 insertions(+)

ea51d1a4c31f ("x86/CPU/AMD: Don't print reset reason in VMs")

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
