Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793976366;
	b=NiCcGbIyzVr6WGg1z5v0B4Hh4l49b5RJ2YGctFkFMx+AYoVVSonOARrsfJebgK0AehWT
	 4q+gtpB6KcDd8tCYNaEfJDdNS3yE5Jro0uU4Oji2vRJtOSxsbBsJW6JncsLdRzkRLrDu6
	 FTzj5kFARuSmyRzmLKF6+cLLr4970uskmmElQh62k3XwzhRkjf/+QI3dpL/89dzast5Nm
	 EYb43+tSx1mXog0XCYcxDLq3bjhdbV3boEEzgrxQ67xLXiylVJzF5Ob5GcuFsFkvqLY3y
	 LX+4ldfUtg/mRA1gPzopf24WeoU8ucv7PGACnGKJpATrNo9zb+2+fRRNqmEvE3GwrTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793976366;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=m4jzlpwnCHP/iJRE3j/cC9ctgB4TV/ZSpibJ2GNxpak=;
	b=D2WpEyW4D/LthaeDOuHe2iJCuhach/6I7ZCGgtYVQJHf1Z6L1yVmSS0+6y2aYDAkSfwv
	 t50y0dNWxNe0DvFyU/PfyYAYKWoZ1gJxHPt49Rn49pNfh3mInUpScbPgapUr4a3SJmFeX
	 zwx6RrcEq3c0E6CR+2SzrRlfz2cjUS/oKAM58A9dszh5bDrfS4SxkiWNIy+FNmwwEaYhc
	 oz0Uu1tkAe+XW+MFv8Z4MtnUHF5SdRN36TFl2rUZdczwWSBzIjecn5fft68KqE5SP96/q
	 /t58Pq83SUGxe2ucnhT74SU4eJnZ2vZMZznx5GyCKMlepdVceD1O2pwh3WHFy5DKTaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=noIk3x1s;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B52F606A326;
	Fri,  6 Nov 2026 14:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=noIk3x1s
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE5021F0089F;
	Fri,  6 Nov 2026 14:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793976366;
	bh=m4jzlpwnCHP/iJRE3j/cC9ctgB4TV/ZSpibJ2GNxpak=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=noIk3x1s1aJaNOsWT2PiYRjaW3Fqgx2DaHi4yFS2pf6f9VK+xQ5IRYfDDgOnV7E+P
	 oYfXNCxUlc7a4c0wCiJqf7PIKnRLulEpofSVUOv2RlMnuM7B1H2A9fLD78L7Pn28sU
	 CXys6ABmH0zB1st1UCqlRo8SLytuaaYOlBt+wtYry/BL80RXiq9Mf2k2OT6pnASnKW
	 e8DZDhfm8IBYPQr3jS17cZYkghZRBgAvTeLm4eEgHCCQMjKgC+DwUxwgYAsfbjhbtH
	 1fPCvAp+Oivfy5+Oh3EJ8rPCq1jrJsQW3qmvoRQ+bxigKfgvlyxe0t6vtkGEfRDQ1l
	 FEM6Lqomg9qug==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 2783F2882BFC;
	Fri, 06 Nov 2026 14:46:02 +0000 (GMT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 2/3] regulator: Add RPMI voltage service
From: Mark Brown <broonie@kernel.org>
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, rahul@summations.net, 
 anup@brainfault.org, lftan.linux@gmail.com, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com, 
 aou@eecs.berkeley.edu, alex@ghiti.fr, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261007100022.2512187-3-joshua.yeong@starfivetech.com>
References: <20261007100022.2512187-1-joshua.yeong@starfivetech.com>
 <20261007100022.2512187-3-joshua.yeong@starfivetech.com>
Date: Fri, 06 Nov 2026 14:46:00 +0000
Message-Id: <179397636061.3231166.10683268235781980587.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2512; i=broonie@kernel.org;
 h=from:subject:message-id; bh=2ViexyKP3rKAYA4WhqMhgA31tYT59gK0ViKGcTvQbtQ=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLevtBU0po630513pvPrTrFEzlf8YWlzvFZLaU9Z2ra8
 40X72WqdJSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAipdkM/0yeuZx4e/rPVa7c
 eo7fKo8nt7r8EbLabmLn7+GlczCzzYKR4V3UrOnfs2+d4Fb0O20r9nMOZ33QrU2s/1QDdx4ocdW
 bxAgA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> The RPMI specification defines a voltage service group which can be
> accessed via SBI MPXY extension or dedicated S-mode RPMI transport.

> Add a mailbox client based regulator driver for the RISC-V RPMI voltage
> service group. The driver enumerates the voltage domains advertised by
> the platform microcontroller, reads their supported voltage levels and
> registers each of them as a regulator.

> +++ b/drivers/regulator/riscv-rpmi-regulator.c
> @@ -0,0 +1,908 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * RISC-V RPMI Based Regulator Driver through SBI MPXY
> + *

Please make the entire comment a C++ one so things look more
intentional.

> +static int rpmi_reg_setup(struct rpmi_reg_domain *mpxy_reg)
> +{
> +	struct regulation_constraints *constraints = &mpxy_reg->init_data.constraints;
> +	struct rpmi_reg_level_linear *linear_level;
> +	struct linear_range *linear_ranges;
> +	u32 i, linear_index, n_step, top;
> +	u32 min_uV = U32_MAX, max_uV = 0;
> +
> +	mpxy_reg->desc.name = devm_kasprintf(mpxy_reg->dev, GFP_KERNEL, "%s", mpxy_reg->name);

Do we need to take this copy?

> +	/*
> +	 * Everything a regulator constraint would describe is already known:
> +	 * the levels come from VOLT_GET_SUPPORTED_LEVELS and the always-on
> +	 * capability from the VOLT_GET_ATTRIBUTES flags. Build the constraints
> +	 * from that rather than from a device tree node, which would only be a
> +	 * second copy of the same facts. Without them the core leaves
> +	 * REGULATOR_CHANGE_VOLTAGE clear and refuses every set_voltage().
> +	 */
> +	constraints->name = mpxy_reg->desc.name;
> +	constraints->min_uV = min_uV;
> +	constraints->max_uV = max_uV;
> +	constraints->always_on = mpxy_reg->always_on;
> +	constraints->valid_ops_mask = REGULATOR_CHANGE_VOLTAGE;

No, the driver should not be specifying any constraints.  Those should
come from the platform.  These regulators are described in DT, their
constraints should come from DT as normal.

> +		ret = rpmi_reg_get_attrs(rpmi_reg);
> +		if (ret) {
> +			dev_warn(rpmi_reg->dev,
> +				 "voltage domain %d initialization failed\n",
> +				 rpmi_reg->id);

id is unsigned.

> +
> +	/*
> +	 * One line for the lot. A domain that did not make it has already said
> +	 * so above, so naming each one that did only buys a count.
> +	 */
> +	dev_info(dev, "%u MPXY voltage domains registered\n", registered);

The core is fairly chatty...

-- 
Mark Brown <broonie@kernel.org>
