Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092ED472072;
	Fri,  2 Oct 2026 11:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790939969; cv=none; b=JrJdwVqDcSrhKbLunj6rq2PsnihKz683fIhk/0X3ZYa5dc7BHgr14oswHxmv8nl0ws0b6KWuToULBtSybSSQGwxWJW5YY02e0Yvqlyibj7f/E1207J6X1mx4pLjKEIRxbh5rxpcMYRW3PRObbZ2BMMotCflhLZK3sO9dlUiYEv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790939969; c=relaxed/simple;
	bh=lviCT27rqn9fA11DK5jBpnHz/dnpBP11DxOVf3ldaK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ie9BT19q6Bk5Dg0ZF3S+uvfrlp/rrh17Nhj/m2CbjARI5EdGvryb8To4xNe5SgIDazpfxjXuKkyW1gBsBwP2a28k4liWZySbt9aojp66z2KzPK8N5t0CRn8jfnKvvVObqwP6HKCOUECtVJPCcIBZhB4MM5As5eAdftC3q0b7QWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A5+kComB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A5+kComB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95A391F000FF;
	Fri,  2 Oct 2026 11:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790939967;
	bh=zaPxFWn5phk1poNRE58QojD0V2a1+4RKn/uvTqNxibg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=A5+kComBFwibwIBdu4/nl2+6XPwpM13HBqbAX5eu91k/JApiaNiENgKducsCrVGQ/
	 TqI0pz3lugDEksMOSO6awWNy5cC/BTvrAgMjaXbVYX77f37UxF9nURhIFSjjm52pNs
	 phPOEse/wMmmtcdiXKTEJeDIJsOVIxdRGw0OmQss4KKU4tgAKxYYvxFfvLErjCAUjF
	 oroUCb0m3nCdTgDByBbi4OzqYFUA1JlOfoHoK/UFGd8ZPJ8GUouYUtEaq4qPMxweTy
	 daf8ZbSaZR6kLL4GZptyD5OOPAJ9VBemjQyqCeC5IsYWuEJcXIfP1gIcq1rygfDB6l
	 8+kKXK8nVjoYQ==
From: Yixun Lan <dlan@kernel.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Radu Rendec <radu@rendec.net>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Guodong Xu <docular.xu@gmail.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Yixun Lan <dlan@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Conor Dooley <conor.dooley@microchip.com>,
	Bo Gan <ganboing@gmail.com>
Subject: Re: [PATCH v3 0/6] spacemit: k3: Replace bad CLINT node with ACLINT nodes
Date: Fri,  2 Oct 2026 11:19:15 +0000
Message-ID: <179093990819.1237110.17149048431287759426.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
References: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 18 Sep 2026 00:29:32 +0800, Junhui Liu wrote:
> When testing OpenSBI with the upstream Device Tree, the CLINT controller
> failed to function properly with the irqchip.riscv_imsic_noipi boot
> parameter:
> 
>   Platform IPI Device         : aclint-mswi
>   Platform Timer Device       : aclint-mtimer @ 24000000Hz
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: timer: thead,c900-aclint-mtimer: Add SpacemiT K3
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=73329198cdc273008bd273b0c5ad4c65251cb49e
[2/6] dt-bindings: interrupt-controller: thead,c900-aclint-mswi: Add SpacemiT K3
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=c9bae665035f345ca050e98d6f4d6830c3d74f84
[3/6] dt-bindings: interrupt-controller: thead,c900-aclint-sswi: Add SpacemiT K3
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=08257b5b3d38b3e19b61b807850f5a637fd1421b
[4/6] dt-bindings: timer: sifive,clint: Remove spacemit,k3-clint
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=5397ba147c28427d3728812dec999fdab0f53619
[5/6] irqchip/aclint-sswi: Add support for SpacemiT K3
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=b424b3b0ab920a25c23fbd7d226a0174b38d0de7
[6/6] riscv: dts: spacemit: k3: Replace incorrect CLINT node with ACLINT nodes
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=cc6371a7f5195387584e56054f3af671ff7354dc

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
