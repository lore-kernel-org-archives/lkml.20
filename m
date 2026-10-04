Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0548E4A689D;
	Sun,  4 Oct 2026 21:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791147971; cv=none; b=usrYlvVi9YgKHPBdPXLHq0gUmhu1Y2uioU9IAOZ8Z58FvitwtIiBij1K8W1XxlOo99CaUl/Kxscj+fKFQc/KpTLVN7ngv1WFmTq6ZdPB3S6+c/BW37S2rV33NJ97kRBdvy4z6iywFRAdGFuIr2CseMVQ3SVIqwC6iK4juKRV7ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791147971; c=relaxed/simple;
	bh=WVvZnmqf7otb2xzIIjMAYoRtSD8DTmYCbO8+hc58h+U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DMgieqz8fHFXBpcVJM1NvGUH6Dz6ECTQjNSp/J/BMvo6wqV1uK1xSJ8QezDlDd5ZkVHIvDhlY+Pw7FYFMnRYK4A0LoB9JZ3eqg+2pp7meH8jtH//PTJ8zpH0kQJyAzYcwtpmkY9qyySPvMqWojJqS/rLVaQjstoOxLRicv3YpAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=Vt4udXfC; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="Vt4udXfC"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 3CD3AD1960;
	Mon,  5 Oct 2026 00:06:05 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 3CD3AD1960
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1791147966;
	bh=WVvZnmqf7otb2xzIIjMAYoRtSD8DTmYCbO8+hc58h+U=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Vt4udXfCZ1/JUWP4/DfnuTq+mb0YgBRhjudhJN8lgyREdVf0qkMXmHWnzgfpDRder
	 tt59QhD7r6tSczqq4sgZ+wzWlEsYFNN1/2DCk2BJDM5mIHVR0J4v72f+RU9U5PiGTQ
	 Ng9/P4hCaHX6H6Lp58c/Dl1fNEKZB9eNtCDVbopo5B7vIUEmqft4A4ZKOX7prD9ZBF
	 T/AuTMcaf7X8nIvfTaztjFRMsaKUgqnOXJoJt4VmzxVhC/pLqPvooiJ3FJUvnkcPDL
	 Zc+k/059Nt1UBWukwcduGyP74XG/5nyH8P3BSHkbwD1xOUyUcLLDCVXI2Q5iRq38v3
	 QpKXdFQ7SJRHw==
Message-ID: <b5f627c814a783f989dc4e9edc2d1c17eaacf1d9.camel@rendec.net>
Subject: Re: [PATCH v2 5/8] dt-bindings: interrupt-controller:
 amazon,al-fic: add mask selection
From: Radu Rendec <radu@rendec.net>
To: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>, 
 Talel Shenhar <talel@amazon.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sun, 04 Oct 2026 17:06:03 -0400
In-Reply-To: <20260927080637.27285-6-farbere@amazon.com>
References: <20260927080637.27285-1-farbere@amazon.com>
	 <20260927080637.27285-6-farbere@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2026-09-27 at 08:06 +0000, Eliav Farber wrote:
> The block this driver calls a FIC is the generic Annapurna Labs interrupt
> controller. It is built from groups of up to 32 triggers each; the number
> of groups differs from one controller to another, and each group has its
> own 0x40 register block.
>=20
> A node in this binding describes one group, not a whole controller. reg
> points at that group's 0x40 block, and the 32 hwirqs of the domain are
> that group's triggers. A controller with several groups appears as severa=
l
> nodes, and controllers cascade when a tree needs more triggers than one
> controller has.
>=20
> A group has one cause register and three mask registers, which decide
> which output a set cause bit drives:
>=20
> =C2=A0 0x10=C2=A0 info mask=C2=A0=C2=A0=C2=A0 gates the info output
> =C2=A0 0x2c=C2=A0 error mask=C2=A0=C2=A0 gates the error output
> =C2=A0 0x34=C2=A0 fatal mask=C2=A0=C2=A0 gates the fatal output
>=20
> The three outputs are aggregated into three separate interrupt trees
> (info, error, fatal); mapping one event to more than one severity is
> forbidden by the interrupt methodology, so a group belongs to exactly one
> tree. Which output a group drives is fixed when the SoC is wired and is
> not discoverable from any register, so it must be described in the
> devicetree.
>=20
> The error and fatal outputs, and their mask registers, exist only on
> controller revisions that implement them; earlier revisions provide the
> info output only. A controller reports its revision in the group control
> register (bits 29-28), so the revision itself does not need to appear in
> the devicetree and no per-revision compatible string is needed.
>=20
> Describe which output a group drives with a new optional property,
> amazon,al-fic-mask (info, error or fatal; default info).
>=20
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
> v2: redesigned in response to Conor Dooley's review of v1.
> =C2=A0- Drop the two proposed per-output compatible strings
> =C2=A0=C2=A0 (amazon,al-fic-error / amazon,al-fic-fatal). A node describe=
s one group,
> =C2=A0=C2=A0 and a controller reports its revision in the group control r=
egister
> =C2=A0=C2=A0 (bits 29-28), so no per-revision or per-output compatible is=
 needed.
> =C2=A0- Instead add an optional amazon,al-fic-mask property (info, error,=
 fatal;
> =C2=A0=C2=A0 default info) selecting which output a group drives. Existin=
g
> =C2=A0=C2=A0 amazon,al-fic nodes keep behaving as before.
> =C2=A0- Rewrite the commit message to describe the hardware and the group
> =C2=A0=C2=A0 granularity, and add an example fragment to the YAML, as req=
uested.
>=20
> =C2=A0.../interrupt-controller/amazon,al-fic.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 16 +++++++++++++++-
> =C2=A01 file changed, 15 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/amazo=
n,al-fic.yaml b/Documentation/devicetree/bindings/interrupt-controller/amaz=
on,al-fic.yaml
> index 26bc05dee0bc..1ebf9a427f2f 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/amazon,al-fi=
c.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/amazon,al-fi=
c.yaml
> @@ -24,6 +24,19 @@ properties:
> =C2=A0=C2=A0 interrupts:
> =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> =C2=A0
> +=C2=A0 amazon,al-fic-mask:
> +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/string
> +=C2=A0=C2=A0=C2=A0 description:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Selects which of the controller's severit=
y outputs this group drives,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and thus which mask register the driver p=
rograms. A group has one cause
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 register and three severity outputs - inf=
o, error and fatal - each
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gated by its own mask register. Each outp=
ut is aggregated into a
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 separate interrupt tree, and a group belo=
ngs to exactly one of them.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The error and fatal outputs exist only on=
 controller revisions that
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 implement them; earlier revisions provide=
 the info output only.
> +=C2=A0=C2=A0=C2=A0 enum: [info, error, fatal]
> +=C2=A0=C2=A0=C2=A0 default: info
> +
> =C2=A0required:
> =C2=A0=C2=A0 - compatible
> =C2=A0=C2=A0 - reg
> @@ -39,8 +52,9 @@ examples:
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 interrupt-controller@fd8a8500 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "amazon,a=
l-fic";
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0xfd8a8500 0x1000>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0xfd8a8500 0x40>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 interrupt-controller;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #interrupt-cells =3D <2>=
;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 interrupts =3D <GIC_SPI =
0x0 IRQ_TYPE_LEVEL_HIGH>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 amazon,al-fic-mask =3D "error=
";
> =C2=A0=C2=A0=C2=A0=C2=A0 };

Reviewed-by: Radu Rendec <radu@rendec.net>
