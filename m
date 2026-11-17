Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794879481;
	b=bQ7FHmb4HRNHfnRfb5w+2yV8p5J+sWMtXE88MccqKlPyA3sEGoJSOnnIwTQsmG9UNVeV
	 lrRMC50n7w8pHkRL1Km5KLrBQx3bEXX2/7JLaqf2KZ9so/F1prrXT0InoZja2Jr+04rcK
	 MDo0x1BIRYCxpsU1+ZAPuuji1Eoa3W0BwN85lVVWgG7yGi4PG+8sEUQude5dPJFHO3IVD
	 C2f81NpiyGQyM+8TBPqbKLLPt8UW7BrUDaHCkVm+aUf2waOvOx+SMpUfBe8dM4miSso/4
	 x/WXWTOCrQMc2ANWeR+0SyUc1SpbdZDM/B55HiEcSO/6928GF9Kbxsp2ebJXuNrt+xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794879481;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=8JcHUYWuXURIlDdVtjfl+F+I3k1RR4DC8FoHZM3MqHk=;
	b=NrT3gXFqVJUrajPR4uoLP3nYCu9FuZbO1xkHmk6qDA6LJNKG7Vp3yrxn82JBNXIrV933
	 cjVeofOipy88bsFFeVLmKl9Q7nSsV03ytY/rXJqk4XWXzm34Tkg10Xy94Meww7Z00ms0c
	 F1daqfjFF8LlP2LcNF83VulvHsa4J5m0hBQ2ESBvla/V8YDMHipyDHgDcsf2ky5dFu3qf
	 q0WYZrGGk1aTg2H6koVt+tpeaLazPZGRxyeqrxK/qeV9rzRXam3g3ITOhQLzC3MBzQ4RB
	 x5Q4D2eudc/Lq/zYSEr3G+h72zEBxbCosJR9OvzK0NZ4ldBkVKUjnKA3267khKQmofg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=fGFmytpc;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE56606A31C;
	Tue, 17 Nov 2026 01:38:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AE56606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=fGFmytpc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=8JcHUYWuXURIlDdVtjfl+F+I3k1RR4DC8FoHZM3MqHk=; b=fG
	FmytpcbRtrvDNF+9s8ZwFJkcXyrWSOuUTR0YQB5jWn8N4AHzNhGRGM5Q9Un2X+3nI+il55+kZQvib
	kv6z+w08inaseaOt7yqUlagi+X0Y0bK0r7qZkmdysaXVoL/pIxgekZqhnDTJLn6cAfmZaKLLqz5xf
	bUnFmMvM6gOSD14=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xT88w-00H2xi-IT; Tue, 17 Nov 2026 02:37:54 +0100
Date: Tue, 17 Nov 2026 02:37:54 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Janis Edvarts Lacis <janislacis06@gmail.com>
Cc: netdev-bot+sashiko@kernel.org, netdev@vger.kernel.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, wellslutw@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: ethernet: sunplus: check budget before calling
 napi_complete_done()
Message-ID: <69fdc047-6cf4-4811-9161-8edfc5bcf355@lunn.ch>
References: <20261114222744.535158-1-janislacis06@gmail.com>
 <179479577764.3136.18033299607451586926@kernel.org>
 <vj5f2zj4fpqp7qaztfp3e5elec44pih3pjqsnkmyhv4js3vxid@naaggpvburqc>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <vj5f2zj4fpqp7qaztfp3e5elec44pih3pjqsnkmyhv4js3vxid@naaggpvburqc>

> > This note is in the commit body rather than below the --- line, so it
> > would end up in git history.
> 
> Shouldn't it? Documentation/process/maintainer-netdev.rst, under “Bug
> fixes”, requires describing how the fix was tested. I included the lack of
> hardware
> testing in the commit message to make it explicit that it has not been
> tested on hardware.

It is unclear if this is a bug fix.

It is unlikely to reach the criteria for stable:

https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

So i don't think it is a bug fix as such.

Since these emails are kept forever, anybody who wants to know will be
able to find these emails and know it is untested. So i don't think it
needs to be in the actual commit message.

	Andrew
