Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794797695;
	b=xCwYATMxEHSkSEeXQ3Zv6664r6vuRTt8yNPlZVbfdfcm19WFfDHLpWpL//HAfL8MBa4w
	 lgbaI5HFicztybGJyBRE0cPSzew93+ZD9SSSXae6hJFTOSQOAZ3ZjZXKJP3eBW+w96LeZ
	 WBZDywQThz/2oOQMC6L6C8c4FM3sN6chCQ+Wo3a7mrIQO0fF7aUjqaSxvH9UrCaF+OkMM
	 yKlmeSl+D3KkRsnJ8LOc2blrF3s2oYbpowjP3yWmBPe27fceGGCpKW8l98yV7XlO35mDq
	 hIu0bwpNyJfa8EEZEd6sNM+DgU6NHo93LTSurdoUEw5bO9C2MgqL4CIj8swYDrDeJKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794797695;
	h=DMARC-Filter:DKIM-Signature:Content-Transfer-Encoding:Cc:
	 X-Lms-Return-Path:To:Subject:From:Mime-Version:References:In-Reply-To:
	 Date:Message-Id:Content-Type;
	bh=LFNkNbE/BJjMMZVJ30Nnj44+C1fdsFY5EBU4BEDDicQ=;
	b=Jp1Zso3ECDzkOezhQMfa2hDtJnzGOMW+wWxAiIj9jpDQVHeK5zYHsKI5X2wyejGT9vSS
	 J06wJ8cuEi0SFNg7o04wC5kHdSdKsHIdgAmoDuzOk7N/XdFZJNxRyrNqEvAiU+UMrpUvq
	 uTWDcPWE2+ooX2e6QrnZNvMJ8Vzu1gHtTexEVIbfFwYLfsMxWlyFRmUCtilVDB4jXpP9j
	 OuWYOuUG5ABdj7hFWg2V0TVlMTaXoaJA/vZUY7uRVd80BMrA65Nl3tdDlWGznYqUoIiGt
	 BHA4IjXVfoGABc6tMGj8IZ0nLhpKUP05/b6x3LhgRG39n9T3hdAPXWCcXh3dYPQ4clA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=16YLyYfQ;
	arc=none smtp.remote-ip=209.127.231.35
Received: from va-2-35.ptr.blmpb.com (va-2-35.ptr.blmpb.com [209.127.231.35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FC0606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9FC0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=16YLyYfQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794797682;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=LFNkNbE/BJjMMZVJ30Nnj44+C1fdsFY5EBU4BEDDicQ=;
 b=16YLyYfQbcyz3cZNUAjyKBpGujVF7ypjPj8iR9/eaz7hjdUx8OZ5ZjEKnowaNINjZBtUl7
 90/5zh8XeyB4QE3S/1fBfRxqb35JLHitd307jfJcuDaOkYsjZnXcGTpKOHCNshptNS0AW1
 1nyY9anLM55fPLVeWkCCvBWdirSH4j8JKMqhxl4fO9/o9oNEaCvp+yFlWAS+xZ4OYrp24G
 aJ1Mo7ht+71askjNKTQKMQps6NbnkxHCNoZvv7a+BtUUyIDerRXbirUEc+Bh3iQEa8/SU8
 8Yed2XoDZ+rqXz0qkCrRqnUDdQlQR9Tcg0ciK/70kHS+qwc4N5F4uhf46dTKtg==
Content-Transfer-Encoding: quoted-printable
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Lms-Return-Path: <lba+16afa7070+a5d044+vger.kernel.org+sandie.cao@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>
Subject: Re: [PATCH v4 2/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add USB controller and USB phy support
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261109033154.361399-1-sandie.cao@deepcomputing.io> <20261109033310.361435-1-sandie.cao@deepcomputing.io>
	<20261114073025-GKA100523@kernel.org>
In-Reply-To: <20261114073025-GKA100523@kernel.org>
Date: Mon, 16 Nov 2026 10:54:38 +0800
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.c24fe633.1394.4ffc.88d5.f9ade9d7763c@feishu.cn>
Content-Type: text/plain; charset=UTF-8

Hi, Yixun:

> From: "Yixun Lan"<dlan@kernel.org>
> Date:=C2=A0 Sat, Nov 14, 2026, 15:30
> Hi Sandie,
>=C2=A0
> On 11:33 Mon 09 Nov =C2=A0 =C2=A0 , Sandie Cao wrote:
> > Add USB device node (b, c, d) to DeepComputing FML13V05 board.
> ..
> > USB A works on otg mode, it isn't configured currently.
> Drop it, not really useful to mention there, irrelevant to this patch.
>=C2=A0
> Currently, No USB A port support is merged in mainline code.
> FYI, Chunyan submitted a patch for adding peripheral support of USB A.
> https://lore.kernel.org/all/20261105103125.2727341-1-chunyan.zhang@linux.=
spacemit.com/
>=C2=A0

Ok, I will drop USB A in next version.
I prefer to=C2=A0 submit a new patch for USB A separately.

>=C2=A0
> > - 4 USB-C Ports
> =C2=A0 =C2=A0 =C2=A0 ~~~~~ USB Type-C? less confusing
> > =C2=A0 =C2=A0 =C2=A0- Port 1: PD 3.0 (65W Max), USB 3.2 Gen 1
> > =C2=A0 =C2=A0 =C2=A0- Port 2: PD 3.0 (65W Max), USB 3.2 Gen 1, DP 1.4 (=
4K@60Hz)
> > =C2=A0 =C2=A0 =C2=A0- Port 3 & 4: USB 3.2 Gen 1
>=C2=A0
> For "Port X" here, is it a naming from FML13V05's schematic?
> would be great to mention which specific USB 3.0 controller (Port B, C, D=
)
> =C2=A0of the SoC it connect to..
>=C2=A0
> >=C2=A0

I will correct above to Port B, C, D.

Best regards
Sandie
