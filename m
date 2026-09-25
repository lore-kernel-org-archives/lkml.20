Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7FD371D1F
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790347776; cv=none; b=VEpZTSQf7t9FPW0vICfjip3liEfeLLc+AnHbunFicmb7QQp6k45F/xIIyhpEDx+sCXA7JIkMKQjRnlmoZmWJF2rz4a8jcteF6fXyxY7CgOCLs3tWa1toFYRojCI4glij4KqM5vnr0l+sfE4m5DaEWLOAxYBZ/MJBeD8hNLSaADI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790347776; c=relaxed/simple;
	bh=x9oEigePfVWlQMugOwQc6IBSmP1u5ye+LS0Xxh7lwFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RG2r8DsM5DlK1GsVx9/cJy2WiPfugPu+aAG2ysQjdxeNNtp6EPsOCy5250T2Ckvknlw67JtXGfGclm+dHV4OhH+sntmrzmm0TlerhBaFh68PIvx+SOjWR/MmSyyBq3K6+6gcMMWS9c5/QKCb1B+Zkbm2OOk2Vk6kQYOmFzLlxUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LAPVx4ch; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LAPVx4ch"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887635e952so434482f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790347772; x=1790952572; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9cxlkEBTDB6E79w8hcbdEMbueSyZOGRZywbI5MesWoY=;
        b=LAPVx4chnEquV75x4G/azxnaQFDV4z0310zaF0U9qtVuCG/1fW5URbEr5vt1zfPCke
         L1tYWL7TLUOhPs8CFAtxC1VhDbeCFRxbYgqUtVGIkvWJ1ibPR3kid90j56DFFp2e77bG
         UfyAUsaM9X0v7WBcggOhAZNl056pHWCZVypkAK742ZF7OpHPTnoYqLAKnPgBWma2F3nJ
         BM1EHjniNggQi51hwmuoPoe7FpGdUFynxutpAJOc88S0+kwiA6O58Vd7K/FcOIP7+JKk
         NhA03yzU7XwHg5kSCpsqEkXuADLKtxngj1380McdTgLIUxenKbxzu5AzBoFNN1NRHLKU
         elMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790347772; x=1790952572;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9cxlkEBTDB6E79w8hcbdEMbueSyZOGRZywbI5MesWoY=;
        b=VFm5UOYwMF/oSSfwWusKHeMr4aYVKfnMKGCIqAU7ilZQFENz8Y7/wG/dlCMYnAmDdP
         Q7eZw1nP6yY96KdAUuJ80anVLw0v/KAlDd//55Emlz0srqjrdF7nEjiCE1WQy9aSP4yt
         biATDgYc4dC/E1YbUXnD/yes9YcChr5eSFoFRoVdB/GOAV3PRDXJsSxE5LrC21A1xy34
         rH2GpiPT7BZGhQoIAnRDj3G3gBnIWfRqxieKu1KPlcRTPgw9wh4la7UQUlWlRXvsOUek
         uScthiQd54bPk4ovOWPBZVBkBVRgcjmxcrAGQq6epC434DpB/h4QtR80a474ODdblS40
         hT+A==
X-Forwarded-Encrypted: i=1; AKwUvBxKtn+a9w9vIRiJkfwdb89/VYxr/viGiVoCXW/fITuh3Fjb1I7FhnsfydRW5FOWvRYqhA54JG8k/B94qtc=@vger.kernel.org
X-Gm-Message-State: AFuF++nU+d1ihm5iGlb2J3trZC8CgyTKSRlyF+6MEBZMbUNBhlXybnwx
	zcFumlY4bllpHkDQc0un0+4nPSXkrvCpLt3lFn+X+ypms7e2RHelgnRBr4S1jh3L5h4=
X-Gm-Gg: AYBFou3dMYR5Y5Kfoyyqa0PawBq08A00dimgVYfKY3yOY0dg0LHwFIqA1kwuUkVRv6d
	h7BBxx5N1tzOPu709FGI0i9IegGwzAOiuTJsK04EtLcTMRyP+ON6o1e/44U3/xLmyiR8q7jDvBQ
	6BkczO2Dudv9OwW6E6PNCC4vopJHn5nZbItfvNym4WmScX/RWyWftYDsxToJ/1/anQdrJxxul7y
	pE96fYwERfBtMsU89m//2KmlLVOdYb0hNisYbcl4bIuce5r8YvgYTh0CthM5bool/17dfeiOPKb
	VQ+3M9LojXCOeB8yDIHmK0AVOLPxDe/ndkjFhOkJPuDuoD1Bc4k1OqTP3KUiMuaoZEH6Y2w2y/+
	ZNz6g/gVtNZR+dPo09qVprgHtjFhl+oLMSP3gcHgxeFTt3FhACCEoNLXrKMXNX+aLKTjWNiffey
	4L1yfpx+Ib5p8K3ee3ppqqeOTNgHbHsaVPB4ktFK7ZonONKN4ogzF/466l+xuufNa6aONSySBre
	GiXUIJ0fx0=
X-Received: by 2002:a05:6000:2892:b0:487:f31:857f with SMTP id ffacd0b85a97d-488716c7093mr12644409f8f.15.1790347772333;
        Fri, 25 Sep 2026 07:49:32 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a6450a3sm6975997f8f.25.2026.09.25.07.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 07:49:31 -0700 (PDT)
Date: Fri, 25 Sep 2026 16:49:28 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Fushuai Wang <wangfushuai@baidu.com>, Kees Cook <kees@kernel.org>,
	Stepan Ionichev <sozdayvek@gmail.com>, linux-serial@vger.kernel.org,
	Manuel Lauss <manuel.lauss@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] braille: nbcon: Allow using a serial driver
 converted to nbcon API as a Braille console
Message-ID: <araJ-EBntyqOGPkT@pathway.suse.cz>
References: <20260922072558.98854-1-pmladek@suse.com>
 <87ik3tiim7.fsf@jogness.linutronix.de>
 <araAvkIB5XatHPNk@pathway.suse.cz>
 <87a4p5iejg.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a4p5iejg.fsf@jogness.linutronix.de>

On Fri 2026-09-25 16:42:19, John Ogness wrote:
> On 2026-09-25, Petr Mladek <pmladek@suse.com> wrote:
> > This shows that braille_write() is called form printk() even when
> > braille_co is not in console_list. It is called via vt_console_print()
> > because the graphical console driver (ttyX) is registered.
> 
> But isn't that a bug? I thought Braille consoles were not supposed to be
> handled by printk(). Even in this new series you added that exact
> comment.

I believe that it is not a bug. I understand it the way that the
Braille device should show everything that is shown on the virtual
terminal. It should show the printk() messages when they are
printed there by the related console driver.

It is just that printk() is only one source of messages shown
on the terminal. The vt code maintains what is displayed.

Best Regards,
Petr
