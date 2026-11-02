Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639828;
	b=M5AUQSHNQoBL+VyLlKgDzEt59evs4VPxZq0G5ZIRr1hJDMSqFn9VvJgJ0opEK0w0+uBQ
	 QozkzaD2zGRlR/WgFr5067+lOBbSozupOD5YeopHAGE6IzLyWgDDF9oizT9ygQTM9IdcN
	 bPvLCxxzwo2MkIO27sVXN3z6t8uCMl0iq0ywqZjXqOqeQK8Mcdgo3f1c39ZfQ6rUN0Yue
	 k4++mL1rQC6SB1FTDwPZJgBRnXchZ/4NqHXVlWrg6kzD2RgSSi1a1wH69M5HLzkf7wDou
	 aN8L3yl1EF3dizY2+b/y7R/5IG094orVvWpruhjnQWwvl+pClRI05OcXNH+QqTIRPGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639828;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=SFahV0/vxBo8Msro1Eu75lAzfkd06yG1u2ac/bBpjVI=;
	b=pbC+Up7N0vzBJuqfM+2kHsCwRu2KUjYwRNrrMzsO1d3LccVspIH8gVhdf0d4GYxYNCKE
	 lWDxFGBcIa+7GMhvXColi8II6wR2+JBF+MaT43siZ9SKY9VuYurG1+Q0WqUHfYeBJaWW8
	 S97M9aottt1bfTYWV9lIqnXqIC3r8aHq663WlpIJozI+YvvrdMZmY7MpWWCLLhhYfAKw7
	 dkUhkVH2aLm3IgUoyTqcp7zvF9RkUisHDq51zS7j3jMSleB7Qi7v/4UDfk0zPmHIyss9V
	 SUpHsxH3Uf1yi7XRfMhODRhJgeLj8TS3PrmKHJ0eyQ55T1u3EOtwS0ie+qveI8UcazQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e02g4fCQ;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6AA606B0DF
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF6AA606B0DF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e02g4fCQ
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so20160695e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639826; x=1794244626; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SFahV0/vxBo8Msro1Eu75lAzfkd06yG1u2ac/bBpjVI=;
        b=e02g4fCQxkQkLe3YLNorchFbvDGrVQ0zAYrBcmD+d25JC5l7qEzj/rJ0D8uONqKNxM
         QJSm69L+fzTv2M/y9fziOIOboQE22ZPtQRBsCF1qKffVgCSJHI/4BlluDN1l5IKq6zKc
         PNXRebCD6dFkDgbrYg6T6J2CVJyAyvnyBQm080Xvx4AjdUb70jOZGRdDlOkNgWwE9q7q
         v4V00nND/8oh8IV8qrTQMrCqUt1qvBB0oKX8X46dlNNVIz+9SYOSqg8ZB3mv/EAEM+e1
         uhW73RVZEFVYLZh96+R+yN3RgKbI8p8W8QXXq3uXaMVKaa8u0l0XNP3mBKkdWhT7RnRV
         lrTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639826; x=1794244626;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SFahV0/vxBo8Msro1Eu75lAzfkd06yG1u2ac/bBpjVI=;
        b=sgfJslYgafJ2RplkDoJ0rqk+azoMmeEXTGofNcTY6scq1l5P/siGmmZTeXVNyEr2c8
         FQjEjovm4ODslccByxe4XhHaNBZDv6b71D879HLMuSRQjdmGgjGYbq83dzb4NhHa5VBI
         1xuvGl1f+SirDPr4dWoskEgp++Iz0ic0+Hk9WDboT0Q5gbSWmxcWCKVRihOUQ/I+Y15J
         yJ34FhksWGuY+zja8m7v2xWfa4ue2Hc6hQaQrhzeJRmUoX6PzLLUgpd+Wf1W4arbnuMe
         vEYwhZ40k468Qj0z0Gljp/xfvHSrvVso4Hxgf00QFYhldFwvr4RbDVXe2L9VyXRH4FF3
         PP8g==
X-Forwarded-Encrypted: i=1; AKwUvBzZ4tXhJ0AhxCve5e7qv1t+YPjRIxa6boypBJl6WlnNMIX/p4WPJfbyTIuy+Y7IWCFBJdi2VJfqmpK9IG0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVWSRsQWsPBN5UuuJzBZQE858tcHYTik1NlJ4tHGTh0NpEhxeV
	DxnDy/riw79aF5/C1/M0aQHKrE5LIdp0qKzMuT52jOcu/Zm98qdFxGiB
X-Gm-Gg: AYBFou02YH/a9xmtVRl440qK67O/tudIhjgLwsiJTCmXlWvSRao/51+TWE+fXTcBN8P
	VG0/3uuv9XFwgGfpaCFW3bnwn6v3X4QLh6NVol5hXMc5slYsIWW5pG0z3iBw6uMgdcCJFRILtM6
	hYjQCKsaRNnLVMyHt2Dq4XjrlClbtkM0hX9LJBURLpTiLF9M8FN2fMfGAvwFHzQGg6Wj+I36QyG
	Z1ifjabdhem3JLtnspQlLlAtZJnR1GGO9qLwGNCRa5vkVGdJnOKpPWQls5v+ZbLpaxS7Vl08T44
	stAxIk4q+pWNar4YdaRcFZj6Jtz1QzbAMsptJmuRjloOGAMhwfkh95pz0qHyL5x1UtLO2QFXy9/
	C1DS84dHxE1iGwVOnr9ygMP4oI1Yhza0iE4ckpst/VX2bcU+mGUESiMxp+6nYTxK5An34IY2eGD
	s9kbKMI1JVquR4kcJcQi1R61Ox9VeYxmR278g6l9+x0EPVnXLYErBhCEOhb0DS6UlMjBdYyoBKN
	7p5blU91anIdyivEpfgT9tjytd6fbKLZIy1i/nArBZo1QEZSZsrHSK4K21+dRt5J0MWHm92GLSz
	yGy5+nsp1J1zHkozdVZG5/5d4plUFrduURLYOHjid8SFQsaHfKlDgBrAZ1P8LGaH
X-Received: by 2002:a05:600c:a49:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4ac17ffb2ffmr250686375e9.9.1793639826380;
        Mon, 02 Nov 2026 09:17:06 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a9fafe08sm1311345e9.3.2026.11.02.09.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:17:06 -0800 (PST)
Date: Mon, 2 Nov 2026 17:17:04 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jonathan Corbet <corbet@lwn.net>, "Rafael J. Wysocki (Intel)"
 <rafael@kernel.org>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Joe Perches <joe@perches.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 users@kernel.org, Federico Vaga <federico.vaga@vaga.pv.it>, Akira Yokosawa
 <akiyks@gmail.com>, Carlos Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik
 <avadhut.naik@amd.com>, Alex Shi <alexs@kernel.org>, Yanteng Si
 <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, Chen-Yu Yeh
 <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org, Petr Pavlu
 <petr.pavlu@suse.com>
Subject: Re: [PATCH v2 0/2] get_maintainer: stop sending every patch to LKML
Message-ID: <20261102171704.2911cf20@pumpkin>
In-Reply-To: <CAMuHMdXe1xxk2ZFJ=yr=7z1DUs3oRNfzHw1Ls1hftcGnmoNwrA@mail.gmail.com>
References: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
	<20261102093206.50b6c9ad@pumpkin>
	<20261102-smiling-binturong-of-gaiety-f64c1f@meerkat>
	<CAJZ5v0iOJ1r1OvYhV_KJSnHOJL+oVUrbOXizLk0kbGNiep7a6w@mail.gmail.com>
	<87a4nrfgjm.fsf@trenco.lwn.net>
	<20261102150535.6c5689f6@pumpkin>
	<CAMuHMdXe1xxk2ZFJ=yr=7z1DUs3oRNfzHw1Ls1hftcGnmoNwrA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 2 Nov 2026 17:24:51 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> On Mon, 2 Nov 2026 at 16:49, David Laight <david.laight.linux@gmail.com> wrote:
> > On Mon, 02 Nov 2026 07:34:37 -0700
> > Jonathan Corbet <corbet@lwn.net> wrote:  
> > > "Rafael J. Wysocki (Intel)" <rafael@kernel.org> writes:  
> > > > So it occurred to me that it might be actually better to stop sending
> > > > messages directly to LKML subscribers and only make it available for
> > > > download somewhere and as a Lore archive.
> > > >
> > > > Is there really anyone depending on receiving all of the LKML traffic every day?  
> > >
> > > * raises hand
> > >
> > > Some of us crazy people really do depend on it, yes.  
> >
> > I certainly scan it.
> > It is also useful to have an archived local copy that can be searched.  
> 
> Indeed. Sorry to say that, but Gmail web interface search is still
> much more effective than lore web interface search.

You can't possibly look at lkml on any kind of web mail.
Although I have setup an smtp server in the last (20 years ago) I'm back
to the older scheme of doing hourly fetchmail pull from elsewhere.
(and lkml isn't fetched from this gmail address...)
I'm currently using claws as an mua, works moderately well apart from a small
memory leak and its insistence on putting each email in its own file.
But I can (and have) searched for things 'I know are there somewhere' using grep.

David

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

