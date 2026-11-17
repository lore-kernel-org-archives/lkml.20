Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.128.198.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907502;
	b=qpgmW7VpLSNLevf8Fmdx9771cTRij8bwRyTaNF0OSrS8s1fvFPR1P5UHTnxBdNjinRuy
	 1oDfuxsYWZakPQUjwzuU6bjfRaw6u/z6NKvm5DDykssL0UeYd4SliviPQLTdzScqpmrRQ
	 j4G7L5LR5e4g4KLyCrerit0vVfdalINt29y4igEL5t0w0qL25nAYKKu/Umn2Gyp7Xss4Q
	 cV+iT/Q7Wdi9YFMc4lvlgNRGVwtl/ax9Q+HTRJf/D7H2L/BYZ7alFKg12FQm0/JZZQP8l
	 cIw27sGM4GZV5EtPQikSPOou6r0yNQise88y/Bdgv6wdzoiIAQYCzrOnRDVVeJaEibg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907502;
	h=DMARC-Filter:Received:Received:Received:Date:From:To:CC:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:User-Agent:X-Originating-IP:X-ClientProxiedBy:
	 X-DKIM-Results:X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=H3d1XA9UCpnKKoHJ1dfdJ5P8iyvP0FbSFRdcuw4Xu4E=;
	b=1IbbKDDUyfYscB+XdZAlE7sri3J+AUJT6yhymKhJsAta4sRGdB2u5CGbbn37W04+sQbm
	 eR7WdUk8W4GREE14K/2U7yJmWDdxwXXkxDxrRfhol4qlOZ7XYTSaKJIfs0pB+6PANiblr
	 BzSuv2reyyrc+mjRiMJx4TSRNBwZ87jkgLgIkbAQ0KRJdUAcgWs6IBliX5uHGNJSkjZR/
	 GvwmUfC1rxrWSyKfGNDBU0MXndu1lPBRZaS4vZ99bADW5LfapPhkJIdZkiIgXp4Qm/odH
	 8N3iplOGtmdvY56AA+rsgPdlexlqAU1CVxLIBwPs9uosb7EDiytw/LPrkk48pc0Vnag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andestech.com;
	spf=pass smtp.mailfrom=andestech.com;
	arc=none smtp.remote-ip=220.128.198.184
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17CB606A31C;
	Tue, 17 Nov 2026 09:25:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B17CB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (atcpcs53.andestech.com [10.0.1.153])
	by Atcsqr.andestech.com with ESMTPS id 6AH9OVGU068535
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 17:24:31 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs53.andestech.com
 (10.0.1.153) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Tue, 17 Nov
 2026 17:24:31 +0800
Received: from atcsi01.andestech.com (10.0.15.32) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Nov
 2026 17:24:31 +0800
Date: Tue, 17 Nov 2026 17:24:31 +0800
From: Mina Chou <minachou@andestech.com>
To: Conor Dooley <conor@kernel.org>
CC: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <jic23@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <geert+renesas@glider.be>,
        <magnus.damm@gmail.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <randolph@andestech.com>, <cyyang772@andestech.com>,
        <tim609@andestech.com>, <az70021@gmail.com>
Subject: Re: [PATCH v2 18/19] riscv: errata: andes: limit the IOCP workaround
 to RZ/Five
Message-ID: <avwdT/vGjfsUCkHv@atcsi01.andestech.com>
References: <20261113071143.1446167-1-minachou@andestech.com>
 <20261113071143.1446167-19-minachou@andestech.com>
 <20261113-helping-elsewhere-cbcf0c8f67ce@spud>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261113-helping-elsewhere-cbcf0c8f67ce@spud>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs53.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 6AH9OVGU068535

On Fri, Nov 13, 2026 at 01:53:29PM +0000, Conor Dooley wrote:
> > Move the match into soc_is_r9a07g043f() and make it also require
> > ARCH_R9A07G043. Kernels without RZ/Five support then skip the SBI call
> > and take the generic Andes cache errata path. No other upstream-
> > supported SoC uses this AX45MP mimpid, so their behavior does not
> > change.
> 
> But a device using this soc that doesn't have a dts in mainline won't
> function properly, so this is fragile. Why not just do it properly and
> check for RZ/Five specifically?
> Can check for of_machine_is_compatible() probably?

I will check for RZ/Five with of_machine_is_compatible("renesas,r9a07g043"),
which on RISC-V is only used by RZ/Five, and drop the marchid/mimpid match.

Thanks,
Mina
