Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CE53E5EF7
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790155704; cv=none; b=p4l5w5r/cieL8XQnytfUO1nCa03bf8bhySVi3m6+ePe0ve+o5Xdg+meh0SHsuY/1zxtr6RXXg04OkEqhW7spsdgolGM2TORWtrG0o+lfrT2+AZbThLFsH70IeG8RNas1j8+dH7Yr/6rC4JuZp767oYutDqxgUqvK9VpCA0mGhsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790155704; c=relaxed/simple;
	bh=1MOd4w7s09OI6TuYj3wnci7LsymgBd4yB8eYcSBdIjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l9ExhxWqfcVFgVkApJ+2P9FtI2K8ppaJl6ujj7wetZsLFE6Ak5Lz/ozrEhosHaGp87wvaMLBbonG7yiFdzDFjcx6NH/rJTBe+NeC6eLQ+MOVGRPd6Kuw7xg85u+eCAj5vwHIKdUAhMkHEeiLtDX03+PqQaZ/N6Ugxn926/h8iYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mO+R8sGu; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Bb+H1iY2; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mO+R8sGu";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Bb+H1iY2"
Date: Wed, 23 Sep 2026 11:28:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790155700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vuuzklLFXpGyxvMk6v9sJZguQfGsHk5HMtg4YoVNttk=;
	b=mO+R8sGurXdWjAEuTXmy5Vv1Y6CCXfzxdJ0PoOc+IFYG7/ZjocnCwqo6K/Bzs9wY1Vl5ux
	h/VFx4AgtIJZ7+E5uHKhtdt5Y0S+PXhsz3x7WyjGtmiH9rCVQQSXt6Abrij4oZNBlNdEs1
	iGmRFVh9kdhX5ZpiJQrVvMHfoWaT30Hrj0XLy4rdjmG12+f2PjvG4Ehv3oMc4nr0r1OeJv
	+KzT/Ps04To+YYu0umJa8pw6jU5ocfzvFDMOqGHUZgRTjm956Ou7c/Z2rRon5SL1qMRP2/
	Ix230+UOsyOKMaAnHLDQWCYv06WOuSaz4gaCbxFVxqdorSmzfu0cQRmSg2eSGw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790155700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vuuzklLFXpGyxvMk6v9sJZguQfGsHk5HMtg4YoVNttk=;
	b=Bb+H1iY23I53kepYLhmEaGB1F34bhpTSsKldoFIwiaz0R7c4HntCcduVF+EOWn+Mihb+uY
	dNjMpZW7mhSk0mCg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Chuyi Zhou <zhouchuyi@bytedance.com>
Cc: tglx@kernel.org, mingo@redhat.com, luto@kernel.org,
	peterz@infradead.org, paulmck@kernel.org, muchun.song@linux.dev,
	bp@alien8.de, dave.hansen@linux.intel.com, pbonzini@redhat.com,
	clrkwllms@kernel.org, rostedt@goodmis.org, nadav.amit@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] x86/mm: Decouple kernel TLB flushes from
 flush_tlb_info
Message-ID: <20260923092819.OVgjJ9Gb@linutronix.de>
References: <20260921095359.3784458-1-zhouchuyi@bytedance.com>
 <20260921095359.3784458-5-zhouchuyi@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260921095359.3784458-5-zhouchuyi@bytedance.com>

On 2026-09-21 17:53:58 [+0800], Chuyi Zhou wrote:
> --- a/arch/x86/mm/tlb.c
> +++ b/arch/x86/mm/tlb.c
> @@ -1487,38 +1487,47 @@ static void invlpgb_kernel_range_flush(struct flu=
sh_tlb_info *info)
=E2=80=A6
>  void flush_tlb_kernel_range(unsigned long start, unsigned long end)
>  {
> -	struct flush_tlb_info info;
> -
>  	guard(preempt)();
> -	init_flush_tlb_info(&info, NULL, start, end, PAGE_SHIFT, false,
> -			    TLB_GENERATION_INVALID);
> =20
> -	if (info.end =3D=3D TLB_FLUSH_ALL)
> +	if (end =3D=3D TLB_FLUSH_ALL ||

info.end might be TLB_FLUSH_ALL because init_flush_tlb_info() might set
it so. But 'end', which is passed as an argument, should not be
TLB_FLUSH_ALL or can it?
And if so, wouldn't the check below cover it anyway?

> +	    tlb_range_exceeds_ceiling(start, end, PAGE_SHIFT))
>  		kernel_tlb_flush_all();
>  	else
> -		kernel_tlb_flush_range(&info);
> +		kernel_tlb_flush_range(start, end);
>  }

Sebastian
