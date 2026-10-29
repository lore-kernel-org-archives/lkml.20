Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793287515;
	b=qc4Wd9bzN6DAittcPx3jDp8+p+JyFV2fBTSSynxe7WaVL3ME1Ylcc+JBAKXvjFZPxKqC
	 I7Eplaz6Y29EjzpvzC/1Lbi8aHnKpBAo/6bD8DFWHTkBuv4GW9HGjK7zmFsNE2f1a1yY6
	 zCUlZ5IfjgrA0/k51YCRCt9tdZfRL7Y5JgcEVJFpdFWHD0LeRzxS0iGLPEQlllG4QuDuA
	 w88CR4jnpU99YnVnuJVvKVuOw1k+fRazfIJzJluGWxu9n/K5i6dtrgD3jTdwkXnWVoWEc
	 rLt+rJZU+SkC9hZYfu/neQMZRpF8jM/1tNBnBRSQX0EH76UnTPX9pM4JEbKDmJ945AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793287515;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=XjX6gisJB//qDXMokKrwoltsXuJ9jGUsbAeG0uD8IUQ=;
	b=Sg0vMXHF4OV7PZGU4aOspBRyCLbVRa2TuKK44kiNOItgUmB6MVtqL9Ay3lukcw1NxYgY
	 nwYFxyQg5C7hnk8q0hPCSl6Ccl3JGZR26Jowl0xk29ktpOMmczqem0/Pi9CCeC7jIoP/f
	 5n3V2FKy3UuZ3QDoRCAcm2lZQHd94GQSbuiuD8EqwSp/vaJpXl517FuGwxKfDvz1Imv67
	 PwluoKrtoXWRxRYE+KTKkAmSykZDainMy/YPQoKuALRicsvZMKGy7mWd9WG/Pa2Kd0hgB
	 ozS8+W3fMAnzli/4WVly7DfYN12tbF4dKWvECWti2rJ2A4LHensaT3ZA5z7uDrcj7sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=NELCQc8S;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDA8606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=NELCQc8S
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6AD41F01816;
	Thu, 29 Oct 2026 15:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793287514;
	bh=XjX6gisJB//qDXMokKrwoltsXuJ9jGUsbAeG0uD8IUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NELCQc8S2XfebsLtAqbGTckv/3bAzlVbeIZ+aAm28Cz3cC3wd/Ry4UK8e0PVw16zK
	 ZmU7AdGSoQZ1Wk73hNnRzyuOjJx2RJKLlGmHYZ7L1lMewHy9tPhiHTa9vOvY9mpEuE
	 yq341HyT0A7y9bIMEi7utEG4B9+RP2vyzvVRP19U=
Date: Thu, 29 Oct 2026 16:25:11 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: MBKCHEL <mbkchelofficialdev@gmail.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: make g_fbmode array const
Message-ID: <2026102953-scaling-palpable-46ae@gregkh>
References: <20261028074946.12728-1-mbkchelofficialdev@gmail.com>
 <CA+YDrKAaU1EXGhCtJ_yqBrVxKRs0ykyAibvtevVhRwWyU-BLLQ@mail.gmail.com>
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
In-Reply-To: <CA+YDrKAaU1EXGhCtJ_yqBrVxKRs0ykyAibvtevVhRwWyU-BLLQ@mail.gmail.com>

On Thu, Oct 29, 2026 at 03:32:38PM +0200, MBKCHEL wrote:
> Hi,
> 
> Please note that I made a typo in my last name in the "From" and
> "Signed-off-by" lines. My correct name is "Ivan Tverdokhleb".
> 
> If the patch is accepted, could you please apply it with the corrected name?

Why would we accept a patch that was not even built?

Always test-build your changes.

thanks,

greg k-h
