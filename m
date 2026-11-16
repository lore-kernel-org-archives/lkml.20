Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.128.198.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794792184;
	b=BnNNVslgQCDpgGtxfy9HH7yD+VcYTxDSTCzkUb0TiU+rBiTvjbtveTBU1Lhns/bL1aSG
	 qvbOzgZvynL3uYZwrKSmF4NosRINAeq1FBBQNG1d4N5l4WYNHZGSBP4BQN7o96T5ROpvk
	 VZgdpcuYLMy0D5bV6vUHt+F7wYLrQ6Q2nf+NIZo/8Q0SpihnMitEFhh3vnMRPiUF04kaG
	 t9fRJLy9wzMXGsb45Al7G03Ypjeb3v6TQOaGv39hLYzAyTCjqMAh/wT0eY/jv7rus3fIP
	 gFJ0OrOaAWnnV/WXj3ZkLAYsqBmz6U+vFLV9xV8nO4zNwq9fFDKq8juTyr6tfG0LQhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794792184;
	h=DMARC-Filter:Received:Received:Received:Date:From:To:CC:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:User-Agent:X-Originating-IP:X-ClientProxiedBy:
	 X-DKIM-Results:X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=9JDkqFxFxJjvUaiAPs450ZRmRiqw4sJhppIRqRfsXbA=;
	b=B2sd96OwC2t8M0j9f6RvNFohyNpmYG6d5TeDQtUYaXETHsm7zaVchafyr9oSWlTlVm5Q
	 myOrPJ7VQZ7Gg+CvREZ2yq8BJ3waaKnnqTv9zjDrXK8Jq6e9rJ0UjHaQG/G71ksH0loGL
	 iXsaQzCCxtgWrHf/KNvOTYRGLdXB4SOIm1p8iQiDzhhbcntghX4kGqGK8ZLmJ+zr1IK/J
	 7aXzpvA4AbQWye5rer+I75LnFhoMMI67T0t8yrE1neUK2h0qeIevqjFH+GWuE4RjB0uIx
	 1lU7kSn88j9ey+0NK+2zIOEUSNLgqhH4bLsPrlvP4msHGIp1z4BCkDHvOTEpv/HnFyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andestech.com;
	spf=pass smtp.mailfrom=andestech.com;
	arc=none smtp.remote-ip=220.128.198.184
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC3D606A31F;
	Mon, 16 Nov 2026 01:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BC3D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (atcpcs54.andestech.com [10.0.1.154])
	by Atcsqr.andestech.com with ESMTPS id 6AG1MShj096367
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Nov 2026 09:22:28 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs54.andestech.com
 (10.0.1.154) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Mon, 16 Nov
 2026 09:22:28 +0800
Received: from atcsi01.andestech.com (10.0.15.32) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Nov
 2026 09:22:27 +0800
Date: Mon, 16 Nov 2026 09:22:23 +0800
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
Subject: Re: [PATCH v2 00/19] riscv: andes: make the LLC driver and cache
 errata generic
Message-ID: <avpaz5nZ6UsSNo1Q@atcsi01.andestech.com>
References: <20261113071143.1446167-1-minachou@andestech.com>
 <20261113-overcoat-facedown-fcac3e162931@spud>
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
In-Reply-To: <20261113-overcoat-facedown-fcac3e162931@spud>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs54.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 6AG1MShj096367

On Fri, Nov 13, 2026 at 04:21:53PM +0000, Conor Dooley wrote:
> > - Patch 19 adds the andestech,a27l2 CPU compatible. The V821 devicetree
> >   will be submitted separately by Allwinner.
> 
> This patch is missing.

Thanks for catching this. Patch 19 failed to send with the rest of the
series, so I have resent it here:

https://lore.kernel.org/all/20261116003937.1776888-1-minachou@andestech.com/

Thanks,
Mina


