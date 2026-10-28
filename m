Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793159872;
	b=CmGuB4VbvSct2FGvkrzAzLkRBM3AcsTodGJAXgGz3aH/BkxKYAcHA4HLbzgiUZx8k6xR
	 Ak//Dmsz8I/vQLqEbEklWAuUgJ4x+rfNrCsvJKnkOc+D5sM+vvHR8A7ZIICqLWMDf1kk7
	 qKKYOdE8yz9lNoqW2LIEniz8vhgTHLIfZmBi5h76kfUjie0XlTq3g9RfdkBRHW59sMfxR
	 HvBH9GH4BKwEhEvMzZRMXMVl9GpSW7JcY11+QXx2pCY70e1Xp8zPZAoZtZDo7vh8ly1n0
	 m6zXz6a7ol//UUC4Qv2HdclhnXBUAXsedNQ0c5dqaukE7UWBt0JB61lA3UQZWC+g5BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793159872;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Nt0pxHmh4HO8CDZJ3B8yfMpLw6KuzCIafkk/0XJhxnk=;
	b=eYr7cP4c3Yz/gAQ2KPaaXOPSt/j7JxfJwnfmR8CRxt74+m0FzaAEG6CnYRXqxkRlY8eG
	 0Gf1CSOuIP9Bt/ztioqWPK3ef3hPmf+V+oQc4JFOas1csY8mZkgGtvrBGEls75wnwZ6+L
	 maySbeqW6jx1RKdGMP7322awX5lejcwiHF3cicUcybmf/nGNEsJq2AnkbNyDHsBwCO8qA
	 eYq9Pv2lbds5IyuNYfX7El6sEc+F6k/heQZ03YsBop2jG8XImJK/w1qHcKzZzAaI1K6GG
	 iNf59+30kTwwoB9GLECEqW7hA3iT0IFyRp0UGANBo2tXX69ToQW0bcopA4T5kvrlJsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=TvTSBhaw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CA8606A334;
	Wed, 28 Oct 2026 03:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=TvTSBhaw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A24211F031E3;
	Wed, 28 Oct 2026 03:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793159871;
	bh=Nt0pxHmh4HO8CDZJ3B8yfMpLw6KuzCIafkk/0XJhxnk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TvTSBhawkjmcQJI82Ldyep92HoeSY0vdPBw7joHF7MRx4vXZJKUUEpUPIgast0+yu
	 eZCgPZUEUKPSKWtjjKimxsuFaWTToBzULB7MkAQawbCaFaOndnQWDmzj7UZHNXrtU2
	 MIl4lAoJXS7smxLDcVmjFmcSXOkNRH3GGt/7U61Y=
Date: Wed, 28 Oct 2026 04:57:49 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Haowen Bai <calvin.bai@ugreen.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: pci-quirks: abort xHCI handoff if MMIO is
 inaccessible
Message-ID: <2026102811-septic-confront-ec64@gregkh>
References: <2026102749-spender-coke-2fc1@gregkh>
 <20261028021226.1314753-1-calvin.bai@ugreen.com>
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
In-Reply-To: <20261028021226.1314753-1-calvin.bai@ugreen.com>

On Wed, Oct 28, 2026 at 10:12:26AM +0800, Haowen Bai wrote:
> Hi Greg,
> 
> > Sorry, but I see no context here at all :(
> 
> Sorry for the missing context. The v2 patch is here:
> 
> https://patchew.org/linux/02C44DCEA968C75D%2B20260914022743.30852-1-calvin.bai%40ugreen.com/
> 
> It makes the xHCI early handoff abort when MMIO reads return all ones,
> avoiding prolonged polling and soft lockups during PCI hotplug.
> 
> The v2 incorporates Lukas's suggestion to use PCI_POSSIBLE_ERROR()
> and carries Mathias's Acked-by.
> 
> Could you please take this through your USB tree, or should it go
> through Mathias's xHCI tree? I can resend the full patch if needed.

I'll get to it after -rc1 is out, thanks.

greg k-h
