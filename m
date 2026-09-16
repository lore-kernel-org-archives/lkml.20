Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B1B4C151A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789553569; cv=pass; b=PLYWWqmNGnkJXxxjsY0yYrI7CSVfCMx3eL1a7pCwOrsRFSRcjiAYNlkBz9ehkTH9XPm00aAC82QflYwP6Xi3qgyPcbWIofHSkkEusa4Z4eloztmwl0iFj6EsNFkgLzWGf5dMrOx90m3Cj1oXpmI8SQ3WMkSHVCeG+wCvl1dGwZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789553569; c=relaxed/simple;
	bh=FcMZAWu6Pl4djj9zhAk6RGVFzPCsFGY0WGARMV3Tby8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dv1Zl7CdLwRP3LsVk9ATL4aXOKqLFdaAdMQ936A3C2Vvx4zlkIUpZjeuQCB6MxLUs2Q2EbDOPlSMoke4c5ntVJnRDdxck3ok289HfrWr4jJ+psWKqgUT6Brt8opAUKrHl6chOJHNR5M5fyK1adof1qYAYMNgLeKApkVizIgq9FE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=oT2Dsa4y; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="oT2Dsa4y"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d822dso5608725e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:12:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789553550; cv=none;
        d=google.com; s=arc-20260327;
        b=PPPmhucGDLAodsaDqPcJPexvoX0FevrYelPdcX5Q32hKYZJeaq7htVDFIKjJwGUESy
         guiqecorbtOcevcLaFML/i/arSTScRRgX/a09BBzfaQDiD5K0I5iOB5SJelKexb8PBue
         g/jvyAA7c3o32xEy+VG40XUIlhbt8Ee3UI58PC6M+ijl0RBkKs5a8zgi8O2B02gR4N2Y
         d5SweRK+AOmUvJo+oCehAfFYrGe0XvoKdrFAig10FY2my79NEQUhJQ19zWR5rdHWKVWK
         jkXKTYaebVCNdju+Gxi9PLqVqWA22Dkn0M/wvnrHrYoBatBA47SPFN94wlUvV9YLBSqR
         t/dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VMvnu6Q+bhTIDoi1lbqTiSXnAgA138OR2uRiPsRsuJs=;
        fh=OBcU5jGxgTYUDT6pDTp7h3apkv6klg6IJB+6RdMoCRA=;
        b=dtsLYRw0l803E5c6yS1iTVZ9MYca2fuWMMTdo+CIEyupJyEULzyme84+xIM5a7W7aS
         UHLkfx18wsHOBolQpPVqpYjQ3FhZk2ejiSJdtYFdiLZ5F2gCJ9cweOUYLSxPum47rphf
         bzq5N7q6/GPvkk9a6xYoTwBMqYzf7IMK6ZgGdn6AAS8asaoNcBatf1m/EtN1RR9X4aGm
         /s2GXFHkugbL00Qg8S2Gwx+aJABxOvIlmzb92vCLBRhFshMGecab/B292e/Ly0sDR7Gg
         QEVIsdhqlkn6U/0zbjIfXFw+LPSPdzTasKOwNbD8PKx4i4zlxT+qlN+ipvadwJSqHhCL
         /ubQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789553550; x=1790158350; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VMvnu6Q+bhTIDoi1lbqTiSXnAgA138OR2uRiPsRsuJs=;
        b=oT2Dsa4yx3+dHLscDy3ZY+lSwK7V6pmb0dHhdUF8HM+3ZVgBjSm5S+jBPGPziqCFvh
         nefhVwCCwfX/abaqccUI2fEOs62vVSyIU6nn1+ms3l+bt5g1ibRnxAgSeK718Ck8Fe7A
         5OGxkQkrTHvP3DNmZ5Z1xXI63GelHMN+F7SD9DMmRqHEecivXvoHF9FqoYfGquN6YSQ+
         ji9SE1sUqEF+s29lfcSPXjYKJFxngsIEyWEs6xvc/RsO4+7MisNtv2/6/k+2d05fAGzQ
         fbGs4NaaYgXRtpxSV3JrrrWq4gVs/T0OOCDTUbgyBq4y+1OLUhZEOq8taGzt0eC7nWt1
         WAIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789553550; x=1790158350;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VMvnu6Q+bhTIDoi1lbqTiSXnAgA138OR2uRiPsRsuJs=;
        b=ti3P/6/cEMXAkr4fS3oZr+vk9uky7RXpb1rBfGUbzzX42a+xfPjUnos2RTSuQ8zZ1h
         MO2E3dpeXuymYfPLVuchCU65BjpMtqxakRzzqCruuD94mPKK0MVy3prljyS3LNlS9p84
         eflz+lw6QeNeuyUP0U1C3Qq7gXSEGBgTvgMztcGLBhca1PAqK/8h13UJywx342oaQ+ER
         cNhZCFJpnk3WY7d+O0rwfDRBNx0ckVcPqQVKOuaq3TcmnTM5lamwsU3rjrlX3sbHm8Bw
         qdM7b/bSYJMu9vCNqATFid72Rx5E/oKyi346sFmo41eXK5bMElxHGOadWu2jeSoMlQsL
         1RZA==
X-Forwarded-Encrypted: i=1; AKwUvBxDW9AOsnXLGuiOYwXX8z7eRHSCiRbqZa8MtMis1O1dafkEhkDV88T2Vc4fQ1PavJBcsHqbmpmNRCPmtIM=@vger.kernel.org
X-Gm-Message-State: AFuF++kkK5Ngm3RUJswUJD8EcuBzZKTJlGqxNBazYE91UA5zt1Hxct7d
	Vd3H/xL2gGhcpYKNSvgrJzmbLIc1Sgw45dGlakP7WO/uuKfYlZtg4+6hxfTj9MI7YdEl01GFDlV
	5dXPgVSSTfcp2v3vcOnfxc8crwgvtq/WZi0Vg89EpZg==
X-Gm-Gg: AYBFou3nAUJPR0pgzdoVk9gKbGBKrLyDP4kStZRgwQk5QP6AiQhhUXlANaGks0MT5zE
	rmJdNmyDiy6AYDX1B7wFRVxusBVZwILK1wUUO+D2RkUrdfhBoirTTav9tH51RNqksML6jRZi6uP
	o7jEYKlVCDEdXnrLtXqhVD4hSuOnNlz+dIELrVHKF/7aoNHy3XXvTAsEnjIbxg2ABwbPrCBLV4d
	nXcnf71ccpKSLv5mx/oRjkQXwrAXb4Uf0rb9uTm2l420Ip5JHsITnRAikojXLQbgNuhpIgdE/IS
	OTi6BCOK9vykJPGMqZOU42KVgsuFOLau9TNqrONGqsOUyQKNGus4GqaQbBkSoRwctrsEzkG0Kc0
	Z2dkGsXehonqq/bkBlkFnL9T3NYJsWccE0sk29cXnEhO9DaZmEEclXWRdep587Avbn8ysSJ1f0t
	8=
X-Received: by 2002:a05:600c:1986:b0:49c:d019:70c5 with SMTP id
 5b1f17b1804b1-49ea528e2f5mr24120835e9.0.1789553548884; Wed, 16 Sep 2026
 03:12:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com>
 <20260912-rpmi-tee-service-grp-dev-v1-5-1d1d35c2a859@oss.qualcomm.com>
In-Reply-To: <20260912-rpmi-tee-service-grp-dev-v1-5-1d1d35c2a859@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 16 Sep 2026 15:42:16 +0530
X-Gm-Features: AcwNN1XhJcdypVFFKePBGQrRcccPnauqo1pQsJ8HQwZetdLhE4E6-eyGGrD9-yI
Message-ID: <CAAhSdy3Or_uDWuQniUGguc9AwL8smF6XHhJ0kizFOJKJ0N+9OA@mail.gmail.com>
Subject: Re: [PATCH RFC 5/5] dt-bindings: tee: add RISC-V RPMI TEE transport
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Rahul Pathak <rahul@summations.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 3:45=E2=80=AFPM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
> Add a device-tree binding for the OP-TEE RISC-V transport using the RPMI
> TEE service group over SBI MPXY.
>
> Describe one mailbox channel per hart and an optional interrupt used as
> the availability doorbell for asynchronous notifications.
>
> Add the binding to the existing OP-TEE MAINTAINERS entry.
>
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
>  .../bindings/tee/riscv,rpmi-mpxy-tee.yaml          | 65 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 66 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/tee/riscv,rpmi-mpxy-tee.ya=
ml b/Documentation/devicetree/bindings/tee/riscv,rpmi-mpxy-tee.yaml
> new file mode 100644
> index 000000000000..8f6ff313fd42
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/tee/riscv,rpmi-mpxy-tee.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/tee/riscv,rpmi-mpxy-tee.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V RPMI TEE service group based message proxy
> +
> +maintainers:
> +  - Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> +
> +description: |
> +  The RISC-V Platform Management Interface (RPMI) [1] defines a messagin=
g
> +  protocol which is modular and extensible. The supervisor software can
> +  send/receive RPMI messages via the SBI MPXY extension [2] or some dedi=
cated
> +  supervisor-mode RPMI transport.
> +
> +  The RPMI specification [1] defines a TEE service group which is the RI=
SC-V
> +  analog of Arm FF-A: OP-TEE and the rich execution environment (REE, i.=
e.
> +  Linux) are peer endpoints and the RPMI framework (machine mode firmwar=
e)
> +  mediates every message. Entering OP-TEE on a hart runs it on that hart=
 until
> +  it responds, so the SBI implementation provides one SBI MPXY channel p=
er
> +  hart; all of them are listed, in hart order, on a single node.
> +
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +  References
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +  [1] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
> +      https://github.com/riscv-non-isa/riscv-rpmi/releases
> +
> +  [2] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
> +      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
> +
> +properties:
> +  compatible:
> +    const: riscv,rpmi-mpxy-tee
> +
> +  mboxes:
> +    minItems: 1
> +    description:
> +      One SBI MPXY channel implementing the RPMI TEE service group per h=
art,
> +      listed in the same order as the CPU nodes.

I am not sure why you need separate MPXY channel per hart. The MPXY shared
memory is already per-hart whereas the MPXY channel will be doman specific
for TEE.

Also, for this binding refererring to only mailbox channel is
sufficient. The underlying
mechanism to send RPMI messages is abstracted away by the mailbox controlle=
r
driver.

> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      Availability doorbell raised by OP-TEE to signal asynchronous
> +      notifications over the RPMI TEE signal bus. Optional; when absent
> +      asynchronous notification is disabled.
> +
> +required:
> +  - compatible
> +  - mboxes
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    tee {
> +        compatible =3D "riscv,rpmi-mpxy-tee";

This must be "riscv,rpmi-tee" based on above comments.

> +        mboxes =3D <&mpxy_mbox 0x10 0x0>, <&mpxy_mbox 0x11 0x0>;

Like mentioned above, only one mailbox channel is sufficient.

> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 207a6e2db70c..7d0e550085b2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20577,6 +20577,7 @@ M:      Jens Wiklander <jenswi@kernel.org>
>  L:     op-tee@lists.trustedfirmware.org (moderated for non-subscribers)
>  S:     Maintained
>  F:     Documentation/ABI/testing/sysfs-bus-optee-devices
> +F:     Documentation/devicetree/bindings/tee/riscv,rpmi-mpxy-tee.yaml
>  F:     drivers/tee/optee/
>
>  OP-TEE RANDOM NUMBER GENERATOR (RNG) DRIVER
>
> --
> 2.34.1
>

Regards,
Anup
