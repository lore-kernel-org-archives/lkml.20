Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792476394;
	b=gAAFlLB6QWSEWbSF4lmjBmyR8Pe+BxUi4cruyYayRVA8MKA0+jWqCUQ+8A0PgDaTm84+
	 wpFskQPrCJbNEjywBFkQ9LLfSU9HFrSFy0tRCt1pw536iBKrUhzoc1S1ROUzeev9MbKPY
	 d8nxJNE9kpGmcnh1DJQW0UmHwE/OH4okCNROljPwhezH9kbVBJHAWhpfaHgi8n8hcV8GS
	 MSl1tiFeCbfApnhOWs8+egrfSkUeBhgzqpw85WyoGkflWxQzHqASJSNupwIfBOVmhejYE
	 4jZU5uX3e3rcc6V+PtPeSDlKeHDIY7En6iMIN8UuCGxbdwv9XCotkIn2E9XxHIKM4qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792476394;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=83A0XPftJ0rwMZhi+3J48PbNxeaJNHF08TuoPP3WXuQ=;
	b=ULh88uie7qnFHSDEayfCbU5fciOR3TUxUMfoZR8U0g4r9cVOiA6Z6kRuH4XKFMkVUP4s
	 8IA9gvUQ+l/hmX9Gw8rgU7lYV4A/oPBsBnTlmz7wYXqGVmJa7r91362VaRurSY41lnQyk
	 urbgEJaZ0i8HVc+vqkh45lcBQFe6i8Xhj0n40d5fPoTiWJMafB5EIqEFco6gOXVqjsTJg
	 rWuJmbNi0lepcc8AleamEwhgZMJ9q+QyEY+W4y8yGp5dagYegdIPO7r5H9wLo4a1ZpGCU
	 IAfZdMCg0v8KR8Qvv3GzLzu8NEB2tQWcPcU4MnGKwwFwsGTsK668G0liiZQX0ztuBpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=2d5Jtwr+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA66606A319;
	Tue, 20 Oct 2026 06:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=2d5Jtwr+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 356AF1F000C4;
	Tue, 20 Oct 2026 06:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792476393;
	bh=83A0XPftJ0rwMZhi+3J48PbNxeaJNHF08TuoPP3WXuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=2d5Jtwr+I3TQlDkWymIMsYsJF1wAeBnZAiweWa8Jl3/dSoG/y3icAkvcvtCA4gnOC
	 XjoEpJu8wgsbOdOVSqLQ7fwIufi5rXRrjjcGT6196e7tF5xXzVt0u8DsaOoQ+UISpv
	 dhzyV/JadBsFKJUFT5ktRhc4R+3+cSk6MCZaECtg=
Date: Tue, 20 Oct 2026 08:06:25 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: jiale yao <19888972804@163.com>
Cc: Huang Wei <huangwei@kylinos.cn>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] usb: typec: ucsi: acpi: Check ACPI companion before
 use
Message-ID: <2026102048-condiment-cause-320a@gregkh>
References: <20261017064321.3816776-1-yaojiale02@163.com>
 <20261020022707.3691899-1-huangwei@kylinos.cn>
 <105b5747.252f.1a15726bc8f.Coremail.19888972804@163.com>
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
In-Reply-To: <105b5747.252f.1a15726bc8f.Coremail.19888972804@163.com>

On Tue, Oct 20, 2026 at 10:31:58AM +0800, jiale yao wrote:
> Hi Huang,
> 
> At 2026-10-20 10:27:07, "Huang Wei" <huangwei@kylinos.cn> wrote:
> >Hi Jiale,
> >
> >A heads-up on the history here: a functionally identical patch was
> >posted in September by Yogesh Gaur:
> >
> >  https://lore.kernel.org/linux-usb/20260920090711.300-1-yogeshgaur.83@gmail.com/
> >
> >Greg declined it on the grounds that the only realistic way to reach
> >probe without an ACPI companion is the driver_override + sysfs bind
> >path, which is a deliberate root action, with the resulting OOPS
> >being identifiable by the taint flag - "if userspace does it, it
> >deserves the pieces the kernel ends up in":
> >
> >  https://lore.kernel.org/linux-usb/2026092130-thong-secrecy-1dd4@gregkh/
> >
> >The open question left from that thread was whether syzbot still
> >exercises the override+bind path - if it does and keeps generating
> >these reports, that would be an argument for taking the guard anyway.
> >Yogesh's version referenced a syzbot report; yours does not, so I
> >can't tell from the patch whether you hit the same report or found
> >this independently.
> 
> Thanks for your reply.
> The bug was found by my static analysis tool, which is currently under development.

And how does that tool reach this patch without hitting the "the kernel
is now tainted because the user did something wrong" setting?

thanks,

greg k-h
