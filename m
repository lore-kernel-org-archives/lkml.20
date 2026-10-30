Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793319080;
	b=oLA7hPLcJjbaC9Bi45ELwPuWS/AvyqbS6sQciJFAZOihfXplEOOCh6Deq/TR7XHOxcOj
	 eqvYELvrwtcKxukp/Gxy0cAywbW1vDOWwTqie6bUuAozZWoTds4T0xeJD/SC8/dPwEYzg
	 0QMjx888BTKkihZ74/1bL9mp/Idb9/XpWl9zEAc54YeOVVamTeDqVZd58zTIpCfKFCc+d
	 1Odm0NCeL+HS6DYtSSL3ztFMtSj6hFk5F1imXYe9AekPANQaRhb/OnarvWmKvupN9+4gv
	 Po5yHRtYveC4v8ANAL9wMMSX0xbL45EHETN3dCrvIvuDDfirU4vvz9NC7INr/AkiUQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793319080;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=35N81ESSIkM4GxYJXTACuOqKcP2lTvFx2dqwuoVT5i4=;
	b=2jbMCnlpeTvKtdoa0YjVc4wVMfz0kXdvfr6WjyjDs41+QKx2KJXclWGNgOnxZI/47Rp8
	 OBmlzVyJcRbpl7f2rzWfJ+TcWSonG6kIyKVT8n6kSq55TnOyEVHiK8fForrtYHUQ4Iv2w
	 trtV50UPognnJg/f9qtTtBggTY7k/eMl1KQapAT/oM6u0CsKcfegvvKtID5Mu3jeMxMc/
	 UfNCcrSCeUHCIQ3hyx+0qQ+cfP94bk909YdMvC6/8zhj1LkhHRRQEmW9N1Dr2HQD15/QY
	 izg84R4P7WzKz67lyyHoN81yaFBtDXuhhdl7GMEPiulo6lrfzoZ4chPnje3HJfLCmCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l3nGrRmc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9973606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l3nGrRmc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0E891F000C1;
	Fri, 30 Oct 2026 00:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793319079;
	bh=35N81ESSIkM4GxYJXTACuOqKcP2lTvFx2dqwuoVT5i4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l3nGrRmchj3nxyU9QPW/e6LTqaMavn4piFy9Yniz21GwlNK10IWnOM64sJJB/cl7O
	 GyaS47YPfTwtNmkXqepHscfv2i4KRRRHBTZmeO3IijGuJx0OybJC3ZPzbTdmz98VLm
	 z4XtPtGC/weWJyd/L73s5haK8llHX1rpXMOodgzBb7QO8G82RzvIkAPjoLXtHda/Oa
	 zvOLxGxrNs1AAcL+oNC5tq1xpmnRjjGviyzkYH8tpgeHQdqjJLbxhHKhzu18m5g7/V
	 Z2gYt2R0TqgpzGGlIFc5yFx9PrYekN9dgQWWCs+lrQRMlWKEyG2nba69J6ta9kfA30
	 6UrZ610dii90w==
Date: Fri, 30 Oct 2026 01:11:16 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] kthread fix
Message-ID: <auPgpAHe_fI_XPvK@pavilion.home>
References: <auNlZtFskpC1ijA-@localhost.localdomain>
 <CAHk-=wgfoG5arG+zJXAXERTPcsgx5Uvxb6+9DbB4RYJB-8txzg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHk-=wgfoG5arG+zJXAXERTPcsgx5Uvxb6+9DbB4RYJB-8txzg@mail.gmail.com>


Le Thu, Oct 29, 2026 at 07:57:15AM -1000, Linus Torvalds a écrit :
> On Thu, 29 Oct 2026 at 05:25, Frederic Weisbecker <frederic@kernel.org> wrote:
> >
> > For example in a system with 3 CPUs:
> 
> That example made no sense what-so-ever. You say "3 CPUs", but the
> example had four CPU numbers (0..3) and the numbers in the example
> also never made sense.
> 
> I cut out the example from the merge message because it just made
> things clear as mud.  Please be more careful.

That was clearly a big mess, sorry about that.

-- 
Frederic Weisbecker
SUSE Labs
