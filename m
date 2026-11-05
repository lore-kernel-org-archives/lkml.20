Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793897457;
	b=tJUnYq3GFihq0TERjFF5stpR/9OXXUrRWlBY02oG+qzES5FHM8TCeg2XJJq927sbiQej
	 hPOOPcwyjyfRdYL/EFO8rMSLMKfTFP+f1Jf+GVWjjDDburqIFJleBT8RsdJE+B+Fps7y6
	 oECV+h0+yZ5Irjn6kbfqfCx0sDpUIvyLmtnrp1tfCbPcruwZY6FYliwRjASiK1pPiaJdc
	 wx5tqU5KaWmQ8HX4Xy2W1nvsI6H/bDI8Rrtz0nDxlDDjI+Io0DS0FvKeknQkOPji0XDos
	 tp5JPwCeAlg1zwflURX273RWYOTUNpjPTWPfR/nE/J/GT/kLPSvk2JAvRB/htREwc5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793897457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=zYjAjHYUh9bx+ZmiCJ1frNx1z8/yeils8zJb4uj3tGA=;
	b=EDy6ajDjkKLjhvFCZiZy6g/uXxZi2PhMDdJsrJRIwfdkIjCpdjjo2cvMblhOY9VInWEt
	 BkkkVEnwgFQLyDnO60JwWSA4GjKyLvlv5O1HBHajClHnABF8SMlcpApNP9vb5KhQQTYJG
	 iunBglmAg5KX/ygS1x2bM1uT6QVZcPQqeSgxIEhukz6vC7ntbSS92QtuUeLPiFs5ifOJA
	 1Z5nJ+l29btZBLIkAUyDTj6wvbrJuuAPZ3BQ+vUaBhGo7Q388V2EK3aq3FcTd7PcdkIYm
	 czoDH+cKD8QmNuvkCt+B20kUILxmb/mbVLAl/BEjyStOIOYdihxAuOBAwaEQ2fHzdqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=eCxQGP2k;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BD5606A32E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:50:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81BD5606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=eCxQGP2k
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so19927615e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793897455; x=1794502255; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zYjAjHYUh9bx+ZmiCJ1frNx1z8/yeils8zJb4uj3tGA=;
        b=eCxQGP2knSD23iXofcO+K1VyLJQbY9Sjj2CmB7Yux7vke/7oxutp/6OXrbqN9XpTT5
         sbEkLd0BxDXqRjboX30W2BjovP3AQx9IG5okhMf7H9lm330MJfTbpU5CCFvJXHYlK9wR
         IQrqcg24lvkaVdj9oSVWh/VEu91h+Zx8TcN/6u5Kg2u6fXimRO3fBlgiwvh9+dC7EHcO
         sivEb92mJE7Rj1mt66hFBmyv3bMVMYyC7iXea+PAUPkCosOva1YVBqhpNGq6Tr1T0DMj
         +XLdkCHi61/9qZO53zEYeazJomOCOkXhmkMR1ffaV73BB2M96wmyk1jKnrnMfAb5n3YY
         d/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793897455; x=1794502255;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zYjAjHYUh9bx+ZmiCJ1frNx1z8/yeils8zJb4uj3tGA=;
        b=V2iWJzjvjD6INdXfUsIndPhTWk9N+UTZBRW6YdHiX/dLuVqbEDhROZNu8UpP9R7Amy
         mEc3rmL+tJD9OZFWwQARXZMwcP9cSwsJHdq4m9BlUiRfa5fUrktAqrPlhJrzrfotrYeI
         39DZhxSriJJtv6nd5TudINH61+JmDEfigHs793r4G8X6KmV0n5PFOjC/OxKNFjF6C/XY
         HnHmznuxXLXKr5X/mK2cxdpBOpk1gRh+lZfu7+EmWG+lwMQuY9MczlZOl5FoFmYS2Eqz
         7xkxIrFkWCWX+wNdIifpwEeI+Cj7RQ/U2+y0W1k4D+8Ds7h8uJ4QUJNRWM54qmp+SeKf
         gLuA==
X-Forwarded-Encrypted: i=1; AKwUvBxoFjsyAavtb47+EmlM1EwxV7Yl/Yl1DCqCUJ7CXR0nFVdv4IZGlXXRRVmaS5LZBlwaWP2keP/xOu4hvM8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AY+8IgfhL4y8hnMd9Tcye50UbxG5oZDAOUoD+g+anf576LUT4
	dolAXTvb3BRJdApWIc7EFgGy3BVS2OpS1w1zXp90Mr9696VJUvz0esoMslYkasxbfFg=
X-Gm-Gg: AYBFou3BhpnQaFLIOYGSs7+9cxJhQIgztstvgVCKaAG6cbvgQa5o5B/BI1yr74i49oU
	zZcGkYXrGwe7Sh+koZkcgP6tp9JHIOD8v/rZsWKMVGH2x6CQ3aBPxd1w9HLBSlSXAv41IaQ57l+
	ASSh3JWudwZTpNsysp1SOnFnsNdbwBu00GvwSrU5S1/1SzxhD85xTaooI/rJ4lMjzHIUsmgTKqr
	/QuFgEfi41w+j7r89TxcY/KvlddPxkOlljFmQKAjnS9m228vx3EqqAj7to7p9V9h2eZpoW4D3N0
	eIUzokh+Du6v6I6bApPbJqQ19bO2OG318g7oQW1iACyGnLI+vGEXQb7SKzfrNjl7qaFu4byNdiL
	CJ04kev9BEN0tWUWgefzafFsiPZP8rzjoB8JZsYf3elVBv05FGtRGdlcA/29Qt+1LbbZ2Hg6RnJ
	aZ3rEgoqs67/VAQNMgL3DjpqHt8DouZO8k4SES94zkxnN36az9X2AKLJTcVc7FLQYa8bBZBMPaG
	CDKkZ03QYsAiTjjb5093kez9AwNf3LGuo8956xYM/Y46k+wyI+evaEFphwwNw1tw0jSdAQgoFA3
	dS2HF3F3WtqV0l7KWUWpzx6EiqbKkA==
X-Received: by 2002:a05:600c:1d02:b0:4a0:1c94:7042 with SMTP id 5b1f17b1804b1-4ac16bc4731mr472900765e9.8.1793897454794;
        Thu, 05 Nov 2026 08:50:54 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4104d600fsm134692505e9.0.2026.11.05.08.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:50:54 -0800 (PST)
Date: Thu, 5 Nov 2026 17:50:52 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Breno Leitao <leitao@debian.org>, Ryan Roberts <ryan.roberts@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Rio <rioo.tsukatsukii@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1] panic: Flush unsafe consoles before panic reboot
Message-ID: <auyz7JPCK7K9QFT_@pathway.suse.cz>
References: <auI40MZlSYO0oAAS@gmail.com>
 <87a4nwyiaw.fsf@jogness.linutronix.de>
 <auMmQjcy1A6E0eUm@gmail.com>
 <874ie4y5mw.fsf@jogness.linutronix.de>
 <auNaD8LELWok3LOF@pathway>
 <auTaBZlNbpm3jgvb@gmail.com>
 <auhl3cdwrHt4Vw7U@pathway>
 <87v76e3mcc.fsf@jogness.linutronix.de>
 <auniMWhvteH8C3E0@pathway.suse.cz>
 <8733tgc0b5.fsf@jogness.linutronix.de>
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
In-Reply-To: <8733tgc0b5.fsf@jogness.linutronix.de>

On Wed 2026-11-04 12:24:06, John Ogness wrote:
> On 2026-11-03, Petr Mladek <pmladek@suse.com> wrote:
> >> I can accept this, since legacy-netconsole had these risks anyway. My
> >> only concern is when we add an interface for the unsafe flushing policy,
> >> will we continue to have unsafe flushing be the default for netconsole?
> >> I guess we would need to keep it the same to avoid regressions (just as
> >> we need to have it on by default now).
> >
> > Good point. I think that this basically goes down to the question
> > whether we would later introduce an option:
> >
> >    --panic-focus-on-debug   or   --panic-focus-on-reboot
> >
> > The current state is somewhere in the middle. I would say
> > that:
> >
> >   + the legacy consoles are more focusing on the debugging side
> >     because bust_spinlocks() is called early. And
> >     console_flush_on_panic() is called before emergency_restart().
> >
> >   + the nbcon console are more focusing on safe reboot because
> >     nbcon_atomic_flush_unsafe() is called only when followed
> >     by an infinite diod blinking.
> 
> Note that this difference between legacy and nbcon was one of the
> primary design goals for nbcon. It is not chance that we are avoiding
> "hope and pray mode".
> 
> > It looked like the nbcon handling was good enough before
> > we added netconsole with an unsafe write_atomic. And maybe
> > even before converting the widely used uart 8250 serial
> > console driver.
> >
> > People started complaining about missing messages with
> > the converted netconsole and uart 8250 drivers. The current
> > nbcon handling looks like a regression to these people.
> 
> Please let's not throw everything into the same pot. The reported
> missing 8250 messages are real regressions due to missing flushes. These
> must be fixed.
> 
> The netconsole issue is separate. Unlike 8250, the netconsole does not
> provide a safe variant. This is also a regression, but for different
> reasons.

Just to explain. I reacted on the sentence:

    "My only concern is when we add an interface for the unsafe flushing policy,
     will we continue to have unsafe flushing be the default for netconsole?"

I wanted to point out that the recent reports about missing messages
from both act 8250 and netconsole were seen as regressions. And
we should try to make it behave as before.

But you are right that the there is a difference. The messages were
missing with:

  + UAW 8250 because of bugs. All nbcon consoles relayed on kthreads
    in situations where they did not worked. We are solving this by
    explicitly switching to the atomic mode or by an explicit flush.

  + netconsole by design. The netconsole does not have a safe
    write_atomic() callback. We should allow unsafe takeover
    in some situations.

Now, the question is where to allow the unsafe takeover for
netconsole. I guess that we will need to allow it in similar
situations where people complained about DAR 8250 driver,
or pl011, e.g. even in emergency_restart().


> And maybe users want safe drivers (such as 8250) to enter "hope and pray
> mode" on kernel ending sites, which is something even legacy consoles
> could not always do.

I think that I finally understand your concern. You would like to
add a per-console flag for "debugging" or "safe" mode. But
it might be weird when:

  + netconsole is in the "debugging" mode by default.

  + other serial consoles are in the "safe" mode by default.

Do I get it correctly, please?

> > My take would be to modify the nbcon handling to be more
> > like the legacy one and focus more on debugging. If anyone
> > gets concerned by the reboot reliability then we
> > could add the --panic-focus-on-reboot and make
> > the reboot more safe in this case.
> 
> I prefer we do not hard-code policies. It would be trivial to add a
> policy field and flags to the console struct. We could allow drivers to
> declare their own diverging defaults if they want. When we are touching
> all these flush sites, let us add code guided by policy instead of
> hard-coding policy.
> 
> And _later_, once we have /sys/class/consoles, it becomes trivial to
> expose these policies to userspace for reading/modifying.

I think that we should avoid people reporting regressions so that
we should allow unsafe takeover for the netconsole where reasonable
by default.

I see two solutions:

   1. Keep all NBCON consoles consistent and allow unsafe takeover
      on more locations, independently whether they have safe
      or unsafe write_atomic().

   2. Allow the unsafe takeover on more locations only for netconsole.
      And later allow to set both per-console policies: "debugging" vs. "safe".
      And accept that netconsole has different default policy.

I personally prefer the 2nd solution. Netconsole has always been
a bit special. And maybe someone would implement the safe write_atomic
in the future which will make it more normal, ...

Best Regards,
Petr
