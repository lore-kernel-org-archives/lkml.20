Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.128.198.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910360;
	b=jN81sv8ePJ0pBnA8aSoPLwiXZMARW2cqt/zwC0dGsFzO5Mh2uHA3AiaZhnfe3n1u3mnq
	 l3Be51N6PsLnv5MifabL+UlqtEY5W6D435uPl6kjyiYnVQBZKFMKno/llbdujHII24nGB
	 C49UoMJa5jI1LCi9it2EtiUVejaxx0o/HStLqlxNgbJEdxPF3DVp8rB1mXh6YD57C3LXX
	 ooK03UMEv0YrfawNF23qTQfr/2NtRzUXOyR1J+vIaj/1EMEL1Ibp4xp1+grARN7ZJk/xM
	 TQHP4fIYJJIClb/bo9/IXAbKM4triwvn74Y1xFn4VPrv99iK8iFklJlC85vt0Kmoj8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910360;
	h=DMARC-Filter:Received:Received:Received:Date:From:To:CC:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:User-Agent:X-Originating-IP:X-ClientProxiedBy:
	 X-DKIM-Results:X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=hd3lpnNdLx+PWPEPuMz+oaXos4GCD/A0WeAPGnkcYEA=;
	b=ys8JRNj+ge4imQfDsdv6tUOCMy5G/6JNHGraP7p6m9fdn3wSRmZ75ZFndr2KB79d4wK/
	 jCY4FxGo9ylLG8IHLqzsS/k5zJAjGEa2CJyMoYeXuuMQ+VvzEnchIJna3ZhyZ1PB+vQze
	 Hkf10ONxsRAZWrCEZYFP/DMYd9OEVQSHh7lnA4vQzJ2R1gI+tC8FMbDzrqMHTN72gOoXZ
	 P5tG1KPucYgTQE6R7GTYPFVggEIZRbaAPYf8yRVE9fDElLlvrW4kVz0RuxvmySGqYvXKH
	 18BcXEBybPLDtIL1MWj2yZOinFdL0aTC7tJxj1c4RkJh8e2W3hbk3kSAc+FoRM6W1GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andestech.com;
	spf=pass smtp.mailfrom=andestech.com;
	arc=none smtp.remote-ip=220.128.198.184
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E00606A31C;
	Tue, 17 Nov 2026 10:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87E00606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (atcpcs55.andestech.com [10.0.1.155])
	by Atcsqr.andestech.com with ESMTPS id 6AHABtbI090783
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 18:11:55 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs55.andestech.com
 (10.0.1.155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Tue, 17 Nov
 2026 18:11:55 +0800
Received: from atcsi01.andestech.com (10.0.15.32) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Nov
 2026 18:11:55 +0800
Date: Tue, 17 Nov 2026 18:11:55 +0800
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
Subject: Re: [PATCH v2 17/19] riscv: errata: andes: generalize cache errata
 for Andes cores
Message-ID: <avwoa/UDFV8iKG11@atcsi01.andestech.com>
References: <20261113071143.1446167-1-minachou@andestech.com>
 <20261113071143.1446167-18-minachou@andestech.com>
 <20261113-voice-pledge-d0b4e1420676@spud>
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
In-Reply-To: <20261113-voice-pledge-d0b4e1420676@spud>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs55.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 6AHABtbI090783

On Fri, Nov 13, 2026 at 01:59:11PM +0000, Conor Dooley wrote:
> > -static void errata_probe_iocp(unsigned int stage, unsigned long arch_id, unsigned long impid)
> > +static void errata_probe_andes_cache(unsigned int stage, unsigned long arch_id, unsigned long impid)
> 
> Just call it probe so that you dont rename it again when the next
> erratum shows up?
> 

Thanks for the suggestion, I'll give it a more generic name.

> >  {
> >  	static bool done;
> >  
> > @@ -51,11 +51,12 @@ static void errata_probe_iocp(unsigned int stage, unsigned long arch_id, unsigne
> >  
> >  	done = true;
> >  
> > -	if (arch_id != ANDES_AX45MP_MARCHID || impid != ANDES_AX45MP_MIMPID)
> > -		return;
> > -
> > -	if (!ax45mp_iocp_sw_workaround())
> > +	if (arch_id == ANDES_AX45MP_MARCHID && impid == ANDES_AX45MP_MIMPID) {
> > +		if (!ax45mp_iocp_sw_workaround())
> > +			return;
> > +	} else if (riscv_isa_extension_available(NULL, ZICBOM)) {
> >  		return;
> > +	}
> 
> Is this correct? The code goes on to always mark noncoherent stuff
> supported, so this means that every andes device must then support
> noncoherent. The commit message's wording isn't that strong.
> 

Yes, this is intended. IOCP is configurable on Andes cores: a core
either has no IOCP, or has IOCP that the SoC can enable or disable
(RZ/Five, for example, disables it). As this is up to each SoC, we
would rather not check it for every core and configuration, so the
errata marks non-coherent DMA as supported on every Andes core without
Zicbom.

This does not make any device non-coherent: a device is still coherent
unless the devicetree marks it dma-noncoherent, and the CCTL cache ops
are only registered when the devicetree has the LLC node.

I will make this explicit in the commit message.

> >  
> >  	/* Set this just to make core cbo code happy */
> 
> This comment is no longer accurate because you gave this value special
> meaning elsewhere in the series.
> That patch needs to change this comment.
> 
> Cheers,
> Conor.
> 

I will update the comment in the patch that gives this value its meaning.

Thanks,
Mina
