Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794591326;
	b=KKT6xzrSPRtUDM1x4ShKJtkHQyST44TS4qKiB3uehObO3+XiiP5OY60VWTtF1eNvROwJ
	 ly2PytbYwNN5OajeGVZ9fzIx1zHLAV49yQR0VhfcpKfWMRYMpKL/6D3esjU+Wcnl2Vln2
	 Hzqd8bu3bbjfH8CDuY0sIMUM1V6mcd6e86raCK1sU9zgMqGzkUArKtTBZIF+1kiefFVx5
	 HH7MccukQHyZfu/ECLpgRREN7LiudDP1SvJllM7Ze4l93hnyB+ddhvYYsMdF7zpcv9Omf
	 BoP33E6WL3Ij5KoSpu8CfU1qVYVhxtKI56t3iWUT0YZdk5vafShbR8ihYdMbv+jfRwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794591326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jbq0EeLMJFolx1OncOUqeneC72MUep198Aa3EF0wRf4=;
	b=YMybIeUXaxk/oU6vJlO0fKHXepdvvGqVCO7Ls268UCZ0pd2qZ0ybzqoUDwGNESE+xb2V
	 AjKKFII/sE9fDnFpFHMBYPtQjN7LfvIk5xCvtFznfKQH12v7L1E31K81YEbpO1BSnOG5o
	 Vg5LBfBtzFmVIY2tVZgwAq+uXNCRzl4a7PYeFtbQzUKQ6ZqtVubZixVSpU4Hr8FGH+ldU
	 I4FOrGpkON1gvMDzgb0etGuTgAF/hqvFaUoxNJkaUbYT36dsUOlpf4OMqRzoQX4sAw1xD
	 ShlUVAP0YHFe66dc5mrjZmEvZv7yKScbkaiqC4gKPFqZ2IaTO9UHPHcljmWfg4WfjXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="v/h6eiDo";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B6F60776F8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54B6F60776F8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v/h6eiDo
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4395d31228so266081366b.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:35:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794591324; cv=none;
        d=google.com; s=arc-20260327;
        b=HAp+gHzRHxwMcev21sUUPZhBiyQpssKwLuRGlIBAfNo0vfIy5o9WHxWqScNhRV7OC3
         Bstfg/MgPLiqjCAlY7aDJTvNbk3+Spu7ou8PTjeVE9xBhjju8cKqJNknDaYHL3nZw/gb
         hm0muEcMGQvQ6pya27q3fxK4sY3XBaqRddd7dctPFTtFltR3vIoLVeHRPN/jhkXTp9wr
         5w8HX/aGt6gYcJGru0VVRqpXIpAZMjlZhCqxnmAz1mZd1U0W2CNYmqpQ9PQ6NZJBMHx1
         UDVL14NUaTEr46GV7nEdfoWG1U1BFaF3hXxpVLg+KqVAn3f15hlKRqcPMP9j/flneJzM
         skJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jbq0EeLMJFolx1OncOUqeneC72MUep198Aa3EF0wRf4=;
        fh=5fiJT53W8ZvRYxBwIB82dmE3yvYVGYmv56YNPj6ysIg=;
        b=sX2iAnjgfsmXWhZin3PA+117T5xvKqd06Ad3BE1R7W7Yz77cD8t2NKzh6p9/dkzxfK
         w5OijB4ENyMqBSW01kamv1UyroHcf4kLwPiAbnLHjE7iMyoYwpVRz+S1MCfUC0E4hraM
         nFlSlvsRv8TV3m1pdnCOWQZ3b2EL24exkzks3LTPCrS8i4Qrk6DXKvT3ytFGM5PhnhSQ
         MYE485dWfe/fjKb1fXm+ysxCQnMu97KdnT5rKnVYOIlrPCnTfbLIIcD6bKpWmvlUW+gc
         YT+iDXk9Jp3nF8AvqQQCToI6QgclMMex36cpuOW2AWXrau1zW+DZm/wXcdNUfE2I5beR
         cz7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794591324; x=1795196124; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jbq0EeLMJFolx1OncOUqeneC72MUep198Aa3EF0wRf4=;
        b=v/h6eiDo1Sz/JjC33cCMKG30lIcuZrUyWPl29FhgUGZ7DoySo0nu8cdsAMG3cfQ1Md
         /W9aGiG7G1Tb7V4682z6GrMqjNsDawDvkc47PYi/YgbdLB2Fa4y9aOyzCvV1eHXkc+2c
         7jWx3WQnWk77/097lJgBcoX19rlASnCcEv/tcCRC0OqN1p7iimXTCffK+t2mAqqL9s1R
         EnasF27yqS3o0kOPM3gemggZcUzy5u7VD9UvtzEf+mH6L23n4rhMcAqmSB1/4bLwTp5W
         BWjt+wijQqLSuFyKNLSsiC1Ns2sML+xYt2piEO1cEFYtJjm4lp+xqM0OwBSNsulC8maO
         oUfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794591324; x=1795196124;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jbq0EeLMJFolx1OncOUqeneC72MUep198Aa3EF0wRf4=;
        b=QAOIeDpNGbDQJjyufdtUKKPgzG6E3xql6NNM9VfQNIVX20/HsRmlWMcy2ZmPs2yvf9
         NFEUTg/x+h5zRSeJai/cKsesX7rfq/OWsa/N5Q3svw36YjqV6QipcG2dhxpUd1itJsUT
         1gWHpkGUloEWXu3Kq9W5nxt4dK1QKL3LSymiJ1hpp0g0XIbk1Jx8VWKp4Yqp9wX11lY0
         qzvpmDs+0E2On3y8FcvL+GD1lmBlusfRk5XKaQ5XAPyDPusU8XVFCq5S/1z3vRy/jH1R
         5vor+aPffkEbi4AVtVHBJRuzsF9qnfGO3V28zADa2OPk2t1GSeFdoagZB11h+n5yd77A
         ItXg==
X-Forwarded-Encrypted: i=1; AL+hErFm3EHlj2Y5E6a98MuxYnVoPlxfdnUVJz3LURKBqJgjsuaFMgO/sr1CQ5OKrnXRHUM5Nxfzd0IUOPrzKnQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FGY9jIMX4Je6Xx8wKVVg2oY/PWpVnUUoOUXw7e9oMfxZA0ksq
	XlqQQRiYEsylkXP5Wi1KuuWelZOQHvWAGTBfIhSpWi/y8LClkTa7pyiuVm8qOibDNOIppwcWoJq
	ltp8N9pLT2nfjfe+l8FU5xngmn5XsKH7MZVBhBFs=
X-Gm-Gg: AYBFou2HCMcUIfrzxG2Du0AQahDvmC9peu31idftQ04a5cwwPAdugbIx1RKVZ8r4EYs
	43pcgEBZafRh8Xfjer6xYTf5kP4Jd4cqESHOf88ik2VTZoOmFU5/GHrb5AQMhGZ5FsGU2QweK8g
	3gORp3TUZBSDFDmd5FuoA9MCHXtvhF34URx6JnJytURTdjT6P0ZtmGbpJStQSbM+egnHeAS8ru7
	5ku/Yy1KC1unLsAN41VshpgqqHCNJA0P8Oadhd34EPosQQeU/ZIuB41rugF3Se+4X/XI3J8yora
	nyZoCS+AvRGTQ+oLO4x2j0Z0X4aCTH0ZPNoQ/JS0CmgHTFJZMatPBlh/vuLDF+l4WF2xr7SRFDg
	JpJF4Aqix+sBIdvyWQXcPlvANRnd3LgcH73b4P+8tac2CRBVdMgqdqVKfoTZxyOmR0wg+1PSdw0
	cZeA2c1a4pcOFagVZITYc1Cw==
X-Received: by 2002:a17:907:7296:b0:c40:aa04:18d5 with SMTP id
 a640c23a62f3a-c50963075ebmr332428566b.15.1794591323523; Fri, 13 Nov 2026
 09:35:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113132435.434615-1-alitariq45892@gmail.com>
In-Reply-To: <20261113132435.434615-1-alitariq45892@gmail.com>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Fri, 13 Nov 2026 22:35:12 +0500
X-Gm-Features: AclHuK_ygvNFFgMQPh62rnosaTlcWUXJwDufLBrg6ePU0sUvfJ5AaEhA0kGAL9M
Message-ID: <CADqcGB=SFQu1F9zasFC8L3Nm8B+dnPG8UUewL8QitFY7bFuriA@mail.gmail.com>
Subject: Re: [PATCH net v2 0/2] net: spacemit: Fix TX timeout work deadlock
 and RTNL in PM callbacks
To: Ali Tariq <alitariq45892@gmail.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
	Chukun Pan <amadeus@jmu.edu.cn>, Tomas Hlavacek <tmshlvck@gmail.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, leitao@debian.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Muhammad Bilal <meatuni001@gmail.com>


On Fri, Nov 13, 2026 at 6:28=E2=80=AFPM Ali Tariq <alitariq45892@gmail.com>=
 wrote:
>
> This series fixes two locking problems in the SpacemiT K1 Ethernet
> driver.
>
> Patch 1 fixes the TX timeout work, which ends up waiting for itself
> through cancel_work_sync() in emac_down(), so every TX timeout leaves
> RTNL held forever.
>
> Patch 2 takes RTNL in emac_suspend() and emac_resume(), which fixes the
> "suspicious RCU usage" warning from phy_disconnect() on suspend. It
> depends on patch 1: suspend disables the TX timeout work before taking
> RTNL, so it never waits for the work while holding the lock.
>
> Tested on Orange Pi RV2 (SpacemiT K1) with a lockdep kernel: 12
> suspend/resume cycles without the warning. The board loses its network
> after about a dozen cycles with or without this series; that is a
> separate issue.
>
> Changes in v2:
> - New patch 1 to fix the TX timeout work deadlock (reported by Troy,
>   approach suggested by Vivian)
> - Patch 2: take RTNL before the netif_running() checks
> - Patch 2: drop Breno's Reviewed-by, since the patch changed
>
> v1: https://lore.kernel.org/netdev/20261105123441.2524171-1-alitariq45892=
@gmail.com/
>
> Ali Tariq (2):
>   net: spacemit: Fix TX timeout work deadlocking on itself
>   net: spacemit: Hold RTNL lock in emac_resume() and emac_suspend()
>
>  drivers/net/ethernet/spacemit/k1_emac.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
>
> --
> 2.34.1
>
