Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794914678;
	b=MOd9G5TtONHbbEHja8YBfFeefMO2TdRVXZK/BmR+sXmuz6E4hAj9mz4cMh1N2qSDtftD
	 +pOsxrL97QGx41/hv5Gb1w2sJOQ9VjptVP6aT7pXDUBTR3xtAbBow+ZD7/Xx80ws77i5k
	 re+88vha/QcD724m9JPfKNaHTrd1ejd79jb4tEbc7xnegLnbDZ8GdT6CRfBNFEnYWYHcQ
	 qE6l2/JY55uMP6eAVRwUUZd9TbjS0C2get9s+YOzECYmagfxufVtLSdmPEHtQjt/m91jm
	 VJPFiHIATuCiu9rKxtBZuL1Nm3Pbux8QdR64FRDi6A8GY2JNoOKrHVWKplChjf565Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794914678;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=b9cQAk9LDyNmw6FOHcs3iHeEXGZIuOld4ACCEb7cKIA=;
	b=ASozWbu8BL8uyBEnx7SnzymHyAC/BArB/JffpUXj1f4/uWl8w60hlaaXnP820Eh6WgGp
	 /LvUhFgxRYBnM0Tyu/ciJBYOzISPT4RDhXe2/ZFGK770BraKytEUXFmZIaEbO7kIQMClF
	 n2TEidM3tr9Zu0MVTZhBu3zPzZuBT+VFzyPrj9IODgLWwVKGmvGAxPwXNbBY6KHVx2CrE
	 RpaAC0W6gdv1ZVrsJZdHrvVWVcYimPoxTErJeSC8Dkg/dI4DBbV1O9V5oi13uBrzTCTRs
	 5CStL6IERgVvyl+Trg5HZBbiO+fZ8SjefFXy2RfnBrC9nw/TV2TDQxMaiQEmBMafwFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gImLORue;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90C4606A31C;
	Tue, 17 Nov 2026 11:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gImLORue
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC4D71F000C4;
	Tue, 17 Nov 2026 11:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794914677;
	bh=b9cQAk9LDyNmw6FOHcs3iHeEXGZIuOld4ACCEb7cKIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gImLORue2nhvJWpnv0UdiQWj3YvAR9u2Q/mlXde2c7onCKCeYJ1AhTaGkefDZpKHf
	 2GnotiJQA53sfRymHQ4+KOR01IWVNAkWB6RQq0AwLZBl0PYJiApifULDY4FIU+mvjH
	 tB8bWUCEspF8L689u6Q+0V+CPqkBInSk9x6z1inkitXPjTUpuZ/aLMHeHeYdbP03xw
	 iEXUmYIRQDS/xIQs2dz4+dUQy5vX8+XFigeeppsWJPggF0ryVZjyZwCmZ4EvTJ5zA0
	 I6QikSyWvOW+rnq490i1uzpeG88UeAJ0nzrwmSrlGwaqq1G8bS4LCnnojgeKG0Z7/J
	 GjeK/Y8CH1Wsw==
Date: Tue, 17 Nov 2026 11:24:34 +0000
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the mfd tree with the origin tree
Message-ID: <20261117112434.GA84168@joneslee-macbookpro.roam.internal>
References: <avtYstt11GO7g85R@sirena.org.uk>
 <20261117104722.GB64850@joneslee-macbookpro.roam.internal>
 <56691895-b885-4c63-a929-c4cfdd7a2dde@sirena.org.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56691895-b885-4c63-a929-c4cfdd7a2dde@sirena.org.uk>

On Tue, 17 Nov 2026, Mark Brown wrote:

> On Tue, Nov 17, 2026 at 10:47:22AM +0000, Lee Jones wrote:
> > Kees, et al.,
> > 
> > > Today's linux-next merge of the mfd tree got a conflict in:
> > > 
> > >   drivers/mfd/nct6694.c
> > > 
> > > between commit:
> > > 
> > >   4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmalloc_obj() family")
> > 
> > Is there a branch / tag that I can pull this in from?
> 
> It's been in mainline since -rc2.

Okay, I'll rebase.  Thanks.

-- 
Lee Jones
