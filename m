Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1378D47D94A;
	Wed, 23 Sep 2026 09:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790157173; cv=none; b=ZlMKpR+IyU9czPi5N/8kkJuRlV6qia/YdIyoU2Wjr/ZkSafIW8c69gbWgIXDlv1zT+C7j4Jl0CNbsV/h8fglNephPG2i0z2hdRZ0oXf2nY7jwvW/3E9/5GzwE167b+VLGes/+8pAgYWhqufu8jzvGxwqvPuut+xFCTgeBQ34Afg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790157173; c=relaxed/simple;
	bh=cr3W8DieXmThVCQcQlI5tu2RARXMWmWc+HMijnTrgBc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GBMxjbeUCjB7te6d3Zu1DCqYHExaCqTYMKmqVyahtjYDNJfJr+mT3TNjZnIihnHXoT++SxKTCYmy9kIo4UyFQ3R7/uAQ8vsbxevyDjEVD7Egb6B7K8cr7dD/H87pCfv6JE4xQm6RrmCvs8UjomeppYhCdTg5GG0cAqNs1vdZB0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q1hwjgZ9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q1hwjgZ9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2FD31F000FF;
	Wed, 23 Sep 2026 09:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790157171;
	bh=7v1qWpSubT0BojVUIH2p1MxNnH0XIrg55E6OXezB1Yc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Q1hwjgZ9SQW2uK8nsTbZPgfQjVPaeQF3bBU5t96/Ewon1/bhqTIQIkUFxq5q/H0t8
	 eNDFGiUy/EFE/txm2Jlym50xZO4Ae42PHDyHTo526ZK8NeVI0b2RtT4hDA2K3/aN9q
	 Qpq973qi2Y/8y/v8hHc/59VcHjr5aHCB6/n8BiqYABqJ+9U9B4w8UiEUQiS5fFyBHT
	 SCOl7dXcM84akr/vnS5GdldICfPDT71BxIUlJkSzSqLFTkzPLe9ATK9B1vknUUAgn5
	 D46F5EsoEu7r39jPgvIaFLeDdYtnwzZ++cBKGIwGnmzGzfCY79L1dtUD3bJIttno1s
	 FD8XM6Iqhg0LA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, Nishanth Menon <nm@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260901-ti-keystone-devctrl-v4-2-2922f2a44792@gmail.com>
References: <20260901-ti-keystone-devctrl-v4-2-2922f2a44792@gmail.com>
Subject: Re: (subset) [PATCH v4 2/2] dt-bindings: mfd: ti,keystone-devctrl:
 Convert to DT schema
Message-Id: <179015716864.3923423.9257262506672643289.b4-ty@b4>
Date: Wed, 23 Sep 2026 10:52:48 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Tue, 01 Sep 2026 05:08:13 +0530, Bhargav Joshi wrote:
> Convert the Texas Instruments Keystone Device State Control binding from
> legacy text format to DT schema.
> 
> During the conversion, the following updates were made:
> - Add "simple-mfd" to compatibles matching existing dts usage.
> - Add required bus properties #address-cells, #size-cells, and ranges
>   which were missing in text binding.
> - Document child nodes gpio, interrupt-controller, and reset-controller.
> 
> [...]

Applied, thanks!

[2/2] dt-bindings: mfd: ti,keystone-devctrl: Convert to DT schema
      commit: e3513583cdb959bbf1370edcbaf3c0b014077742

--
Lee Jones [李琼斯]

