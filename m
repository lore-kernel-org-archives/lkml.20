Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398575;
	b=1v8WkEiJJJdFqGRPvvpbxnNV3s4Jp+gHcrVvIifQ/wxTWU45aAnRiklqw/Ckv7SwD8he
	 czuChPL9Hw1DbBPMHjdoCyIJ1Iikl+1zcj6X9Kjq8/K5BZgiNCXYp7oeu1R+htA4Z3Cu/
	 DqZjPjbuTGeGzjpQjQpGSoefK+P68MuqY9wylbdKfJHDg1zyLswVruTKpcN3YCDGv+Bfg
	 QWGRcHk/cagYxI5XRnwtgyHhOMU211B9EKp1oO6DObfXE0G3pj11QwL49Oecxt5rakcSV
	 XVvCu5ZPPJXgyjDn9RUNDbt2LMI2o40k/8vGJg7udjKgxb4nqwV9VG9SV+7vaopXfFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398575;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=UivbCTrZu5T6Ljh0amMXD77aTIMYr502Yn6jcLHNbLM=;
	b=uHsz+rxHWzKu5bLkIbc3dArrkrflfJadpXkrhwZc7N2Cf4nNxsvJ1LjaBzE8pa4wO5W9
	 Q3nzPJWwEK++aTjZBPbzPHxm04c/NgjnzaDxymg35l918aAXxNlqkvpwSzBsyn71+Tnm6
	 DYy2/Q8Tgq5Mjmw3PcDqshQIaa7PNzyobju3O7JJXfppUtM7LDY75/ALHVypqLj4VmqAx
	 WUGLjCj9Mf22cRGbAr2Hqo1awHtf0dgn0dnx7TR6S1PY4GvxeNvFWsR5EawDgfZSeGZDT
	 ygnKndCpw389Olyd/f/WVap5uZ8qtlMixxnt7M7znpVtDR75J5fbCIV83y3Dlyfw0zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=kNKPAqZm;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAAE606A89E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BAAE606A89E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=kNKPAqZm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Uivb
	CTrZu5T6Ljh0amMXD77aTIMYr502Yn6jcLHNbLM=; b=kNKPAqZm0U48zhq/xx09
	8GhhQN3oE3+XjWr1iTFPU9kh7Z3AivRTL5oWb/Ll99NYpGzWAff1ZHWS2pNGsz+X
	OqnJTLnW7ACs7bCK5PljXHDSORyjChmBelwA08fBsYKjspIugYJj0roht8A3s64k
	uHdkNe4Ymd9nI1VDJJmCoL4rTJEt55Rklq3Jj+XULIm3Ib9wiFmWeanO5t/Nc5vu
	le5a/AB6yxCY0i4es68MCu1CNaTNFA1vETJwIKCzn1LCznE4BqekiRDe5YHtkRlL
	nCrt4T28ryjw8MV/Cnd3njlMSFO0qQ65Qs5YCnMlAcG6naHfU+82IN/4e/nnz5pf
	cg==
Received: (qmail 601576 invoked from network); 11 Nov 2026 13:02:50 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Nov 2026 13:02:50 +0100
X-UD-Smtp-Session: l3s3148p1@/Kpe+f5fQokujnun
Date: Wed, 11 Nov 2026 13:02:50 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Marek Vasut <marek.vasut@mailbox.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
	Niklas Cassel <cassel@kernel.org>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Serge Semin <fancer.lancer@gmail.com>, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Shawn Lin <Shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jingoo Han <jingoohan1@gmail.com>
Subject: Re: [PATCH v5 13/17] PCI: rcar-gen4: Route Root Port AER to a
 virtual Root Port IRQ
Message-ID: <avRZanGRks2mtIw0@ninjato>
References: <20261020031049.969895-1-den@valinux.co.jp>
 <20261020031049.969895-14-den@valinux.co.jp>
 <33e7f153-9dde-4bf7-8ab4-d128b256239a@mailbox.org>
 <dwgbyrulxrbiygjquuyd6cke4i43um7oio4fefey4lfgngwuoe@lkkn7ulwi3vj>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uYPSiGB8a/xbkduS"
Content-Disposition: inline
In-Reply-To: <dwgbyrulxrbiygjquuyd6cke4i43um7oio4fefey4lfgngwuoe@lkkn7ulwi3vj>

--uYPSiGB8a/xbkduS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 09, 2026 at 11:41:52AM +0900, Koichiro Den wrote:
> On Wed, Oct 21, 2026 at 02:19:46AM +0200, Marek Vasut wrote:
> > On 10/20/26 5:10 AM, Koichiro Den wrote:
> > > On R-Car Gen4 SoCs, the APP block exposes the Root Port interrupt
> > > signals in PCIEINTSTS0 and routes them to platform IRQs: AER to
> > > intreq_pcim_lperr, and PME and bandwidth notifications to
> > > intreq_pcim_sub. On an R-Car S4 with GIC ITS, a link retrain set
> > > LnkSta.LBMS and latched PCIEINTSTS0[23] (cfg_bw_mgt_msi), but the Root
> > > Port's MSI never fired while endpoint MSIs worked fine. With iMSI-RX =
the
> > > Root Port MSI capabilities are already hidden, but its INTx maps to
> > > intreq_pcim_sub. Note that even before this driver took over the IRQ
> > > with rcar_gen4_pcie_msi_irq_handler, the port service was unable to
> > > request it, as the DWC core used that IRQ for its chained MSI handler.
> > > In either case, iMSI-RX or an external MSI controller, Root Port
> > > interrupts are not delivered to the port services.
> > >=20
> > > Hide the Root Port MSI/MSI-X capabilities so the port services use
> > > INTx regardless of the MSI controller. Do this in the R-Car host setu=
p,
> > > which also runs on reset and resume. Use a virtual IRQ to deliver
> > > notifications from separate platform IRQs to the standard handlers.
> > > Route AER from the optional "aer" interrupt. DTs without it remain
> > > supported, but Root Port AER stays unavailable.
> > >=20
> > > The APP block may still receive MSI-form notifications because hiding
> > > the Root Port's MSI capabilities does not clear MSICAP0.MSIE. Handle
> > > these alongside the INTx-form level signals. Clear the MSI-form latch
> > > before the AER handler clears Root Error Status, so a late APP clear
> > > does not erase a new notification.
> > >=20
> > > Check for reset requests before dispatch: on S4, DBI accesses from
> > > the port services can hang the host immediately after link down.
> > >=20
> > > The next patch also feeds PME and bandwidth notifications from "msi"
> > > into this IRQ, so both parents may dispatch concurrently.
> > > handle_level_irq() calls irq_ack() before checking whether it can run
> > > the handlers. Keep the APP latches set while the IRQ is in progress or
> > > disabled, so the level parents can retry through the reset checks.
> > > This avoids losing notifications without a raw lock around port
> > > services that take regular spinlocks.
> > >=20
> > > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > > ---
> > > Changes since v4:
> > >    - Hide the Root Port MSI/MSI-X capabilities in host_setup() instea=
d of
> > >      adding a no_rp_msi flag to the DWC core. (Shawn)
> > >      https://lore.kernel.org/r/bi3rvyqpdu4iq6pfyrqvx7eplyim6gmg2ijal6=
7mpateobmtlq@gec7zewfm76r/
> > >      I did not carry Marek's Reviewed-by tag over due to the change.
> >=20
> > Bjorn/Manivannan, can you please have a look at this patch and the MSI
> > handling, to be sure this is OK ?
> >=20
> > (no further comments from me below this point)
> >=20
> > Thank you !
>=20
> Marek, thanks for the review.
>=20
> Bjorn/Mani, just a gentle ping. Could one of you take a look? To summariz=
e:
>=20
> - v4 had 'no_rp_msi' flag to the DWC core. Shawn suggested keeping that i=
n the
>   glue driver instead, which I found reasonable:
>   https://lore.kernel.org/r/20261015033103.3076869-14-den@valinux.co.jp/
> - v5 hides them in rcar_gen4_pcie_host_setup(). (this patch)
>=20
> If you'd rather I send v6 first, rebased on the pp->msi_irq_domain rename=
 Shawn
> and Geert pointed out, please let me know. Otherwise I'll wait for your c=
omments
> before respinning.

As maintainers are usually super-busy, is there another MSI expert we
could ask to offload work from them?

I'd also like to have this series in the next merge window. Thanks
everyone for all the work involved, so far!


--uYPSiGB8a/xbkduS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmr0WWoACgkQFA3kzBSg
KbYs9Q/7B3w5TZnOMFExvZX9yMd5lzx1q1A4XHWwbRYefW/EEEQ/+zv95I5Dhi+O
nHxM1xuaVsccXZjU2Dydd6EuxUBRQTsXyfH1YOZafne8TkqJMLVYKmQabQZUc7AR
0isKW2mzqAWB93xVP7L0E+GljY88DsUZSwn+1s/i/cwzYdTjf1b33QvByphEhnD4
g2VA9RvInhouw+VGUWZ280E4WmP5KO/1d4sH/93HClKnJz/3luZkuln/2kp+ak8E
4s2X0iIakTXta0xrvg9ywh40C3hZKHYsI8wuMjKgSWBpa2qHKOtbgESa0wf5Xanc
rFJk/6ulBHv2gYpn0+nFYVzG/y6IlLlx3FbV2t6zp98AfeZpBF4ac0ICG/arkJGv
s3ObseI/GFbD2Ajqtwhqp4YjoW7GRG5bni9WqPrXK4C22paoC4bSLPBlG/7xx17d
o1E+LKLaKINiCQF6c6VZg86yLF6TWiwojQn0IMJNHaWwg8fu8Lb+pVTgCX8iO97s
wOQrktHcHceR+ZFjl3AAl9/Do5IPCoggZGRmz4yH6s+Un14Qk+cTSvAv1utQ6Z7b
l54Kdwv4VDifJQMzxdDAClKCLlktIkN0nz05t5uGikEP/0tUpd2CFR9WU+eZyng0
q64/s74UAYeQ/sztagEs9SiBlnBzsQKf/a1c2FcZn8AblhaQXHA=
=6r5x
-----END PGP SIGNATURE-----

--uYPSiGB8a/xbkduS--
