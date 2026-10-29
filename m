Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793284628;
	b=VecEMSC3RG4UuVNj1bvhGNk40SRdHua6Pd1vqgXFfcza69uRVIJvsXWDABjwpZOR1qMQ
	 OYOKoNIpWBBZwTs+drUodlsz3bfj8aQ7sYTkriHMccOeI+GpJFr4vRAm9Kv2haKBe+OH1
	 SOoPCdeMrscWHQu7z9p0iVlbQZNe/nXO98y2KJ6zt4C31rkEtnDTXDY7p1kpAt1SFiRig
	 Hh70qrLu2vhGjHm+RlqAm9qxsGQsTvQDmk/Sm2hD6Pxoqj3VUJqHnC+AxtinnzhHpfGT0
	 jqY0svFg26G2sFwpkB8iWaEO9RG25NIPLH0WaDCwbj7jhPJwvP2mrW6dYtUPtIL+Ygg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793284628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9F2l/ryZbPfRU4Z5KrGyZjQxSPviMcixoFTHg+cPQzk=;
	b=Jb3gld40mqc8GA957JdpqJYx6kxa238AUa0zwjMIU+LtruKSmHaDIwGb1IfXQJYWWIom
	 IkkYYX8uadWbaToi6xH0nqEahe5i5a38WR2q6Au5dbwUq25hKCHIaNR70d1ihsuTuMxyZ
	 Vq6lZB26GuuzEOFci+18wmlxmbN2Ww6K5Alp2SRzvQ8IVh/lIFzXb6ax6YlUMAuEtAro6
	 ufq9m/FCe/iG1smIjApAIIRiskonISvwC/AzjmBSb+NAZPG83DtLpPl8ZTkJtQEB4or7H
	 pv0Ifi+Mwxb4PG8A0dVuoVTrg0veWIe+6T7iAVRw0FmalC56GuXGaztRGCkOSV0W6lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cEIQlpoW;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E4D606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64E4D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cEIQlpoW
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso18195355e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793284626; x=1793889426; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9F2l/ryZbPfRU4Z5KrGyZjQxSPviMcixoFTHg+cPQzk=;
        b=cEIQlpoWjLA18+YrShoU6slCNSoZTfebOJEwE+sUnctKIHJkHcIRbl0G3sU8KU2Xzg
         2Lrbiu1biSb/Y4VrMIpea4HqpvgBfJDwcW63X4q+q76qDIix0kDiIC243fYHG7qrzXSY
         BbAE/eQkr12xHTLoi9wFjYf7l44sVciDxu9GEP6TixH2QbNRUFS1OTIMY82DNnU/zsOA
         EK5XqCnqDwAR0PeS36gPfVbsHFPB01bkNtWu7Xh4PZxkB3V9Kc2vkwSBmFziF5vFGe2c
         l1h8lRJBrqu6yFFflEXFibyew4xpUwrwoTzoEu140fywZr96/AOYN2+Ff8BPyshK5rrs
         ESGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793284626; x=1793889426;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9F2l/ryZbPfRU4Z5KrGyZjQxSPviMcixoFTHg+cPQzk=;
        b=TSxSwcESQe9soLULnAZoAgmGu5H6v6ltKN57xDZUAQ0Y1YUFNAgR/y+0fBj0jBed6a
         pgxtJ3g/HS74He9FF8HULujBw0R6LosJ2HEIs6WIwH5OpbRkIzOrnVHgdJzmllHdV6+c
         K0OzWRW4MF0Q+tllI2srHZb8iilGbXUYywDkaZMrKI+2OPR2fjPt+uID51o/6SY9/aMm
         xn0jIaXXnWp+/kTUhixaDLxWPHvsYNaAKuVBdlE9vZXyt2EUxvzONLVOaQBS9/KP/FjU
         wm+AnIGrPeJvwVDWQPr+fy8kiFfdfd05y3lhg7UoE+Iv8amsgMBLsoovlPOVQtjk3nt3
         4lQw==
X-Forwarded-Encrypted: i=1; AKwUvBydZHHXlWhqCWkOoIyq2b6eFBowoulAhJpq1BM/+YBoSHuEDpgdN3WM/ZdyN0iQC23C72D8iSMCcs8I1jY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKyJ0Ahu9oOQm2iaQEHA/OCXJRnnCBoM4QwLI1rSTvRxq+A7tHM
	WunuUwogqBLiJDOdOqhBrTD3bOooAduf012xHDoEkAj/9ayNNEGnTSh9urJKiAr4TGM=
X-Gm-Gg: AYBFou33FXzyFzqfMzEKaaVOQlCFD2EsiFVhFomBnr/6TgpASOhIYwJ3v+BBcWMRjGM
	m7okvfKh7ljsV/64tmNGuCkbRCvlXvsfmVB2XAeyBWjvWottxLY38jgWnghUyBuyc1uT0p/sfBa
	BYKQaz4AGM51tH9BcrGy/oAE/IlaKrqp0DUInk5V19uboQuHL+cp3QH2QR1dgT/Wyx7Pk+SBYpj
	6RConovce0xLsKlvfBlnFjpkZWi90SWbiVyiHdhj6vQnJjvObn3njXOpVOe9MEnbBokqLiWHCeB
	UFotG2ufOc7x8Ys+Zgr/tP0pjxQurmws5lgUyC83qYFbBX6Bk4J8vMB8BiQb770sFCfGSIhXIX1
	BwlX3trj+FTFRk9eafeHZfJY7zVuqKOVLFTLmn9vcCG8ovoHl5zgO/JAWSItIVraPIu7RO0N0Vw
	266pn0TBPYsLK6yi7yLYC0RSrX12jssugWEdAbyf7K15dxNRC77MQi8tsKZkeWBjG/t/eLR6V3y
	0jsdyHBbu/Q4/W1UcfwZf8UnPLdS8ODhk0BW1/VfESpr6aHx0ncic8nkFI6Dp7UYRlOOGarCEAi
	Abk0EWWhSfStuC4BOcJX7XqR+mKafjUyacs=
X-Received: by 2002:a05:600c:524c:b0:4a2:86b7:b76e with SMTP id 5b1f17b1804b1-4a9661ab517mr123436365e9.13.1793284625641;
        Thu, 29 Oct 2026 07:37:05 -0700 (PDT)
Received: from pathway (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f3229dbsm69157825e9.1.2026.10.29.07.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:37:05 -0700 (PDT)
Date: Thu, 29 Oct 2026 15:37:03 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Breno Leitao <leitao@debian.org>, Ryan Roberts <ryan.roberts@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Rio <rioo.tsukatsukii@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1] panic: Flush unsafe consoles before panic reboot
Message-ID: <auNaD8LELWok3LOF@pathway>
References: <20260915100140.3631650-1-ryan.roberts@arm.com>
 <aqqU3I7d9lMAjSvy@pathway.suse.cz>
 <87bj8kkfwk.fsf@jogness.linutronix.de>
 <auHNz09oyGFJPTKg@gmail.com>
 <8733tphow9.fsf@jogness.linutronix.de>
 <auI40MZlSYO0oAAS@gmail.com>
 <87a4nwyiaw.fsf@jogness.linutronix.de>
 <auMmQjcy1A6E0eUm@gmail.com>
 <874ie4y5mw.fsf@jogness.linutronix.de>
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
In-Reply-To: <874ie4y5mw.fsf@jogness.linutronix.de>

On Thu 2026-10-29 14:59:59, John Ogness wrote:
> On 2026-10-29, Breno Leitao <leitao@debian.org> wrote:
> > Here is my view right now:
> >
> > 1) Converting netconsole to NBCON caused an undesired "regression" for
> >    users who would prefer the messages go out, even if unsafely. (as
> >    Ryan and Meta)
> 
> Legacy consoles were never truly synchronous. But, generally speaking,
> they were mostly synchronous in normal situations, which was good enough
> (and certainly more synchronous than the nbcon netconsole implementation
> today).
> 
> > 2) It seems the proper solution for this will take a few cycles.
> 
> Based on past experience, I agree.
> 
> > 3) I would hate to leave users with this "regression" we have today.
> 
> Agreed.
> 
> > Do you have any suggestion for something doable in the short term?
> 
> It depends on what is deemed acceptable. For example, we could introduce
> a Kconfig to always unsafe-flush when the kernel ends. This would be a
> fairly straight-forward change and require no changes from the user
> environment. Later we could add boottime/runtime configuration for this
> policy and make it per-console.

Honestly, I do not like much the kconfig option. IMHO, people would
want to change the behavior for debugging purposes. So that a
command line parameter would be better.

> If Kconfig changes are not acceptable, we could hardwire unsafe flushing
> only for the netconsole (rather than all consoles). This would be a bit
> ugly, but it would still help us to identify all the correct points to
> enforce a later boottime/runtime policy.

This looks like a good compromise from my POV. NBCON console drivers
with a safe con->write_atomic() have a good chance to flush messages
before crash_kexec(). But consoles with CON_NBCON_ATOMIC_UNSAFE could
be flushed on the unsafe way in panic().

It is basically the 3rd variant of the atomic flush which I described
at https://lore.kernel.org/all/ats4n8snmReT7Nc9@pathway.suse.cz/

We should think twice about the name so that we do not mix it
with need to nbcon_atomic_flush_unsafe(). I propose:

    nbcon_atomic_unsafe_flush_unsafe()

where "atomic_unsafe" commes from CON_NBCON_ATOMIC_UNSAFE.
Or we could emphasize the fact that it is only the atomic_unsafe
and use:

   nbcon_atomic_unsafe_only_flush()

and I would pass it via a parameter to

static void __nbcon_atomic_flush_pending(u64 stop_seq, bool unsafe_only)
{
	struct console *con;
	int cookie;

	cookie = console_srcu_read_lock();
	for_each_console_srcu(con) {
		short flags = console_srcu_read_flags(con);

		if (!(flags & CON_NBCON))
			continue;

+		if (unsafe_only && !(flags & CON_NBCON_ATOMIC_UNSAFE))
+			continue;
+
		if (!console_is_usable(con, flags, true))
			continue;

		if (nbcon_seq_read(con) >= stop_seq)
			continue;

		nbcon_atomic_flush_pending_con(con, stop_seq);
	}
	console_srcu_read_unlock(cookie);
}

Another question is where to call it. I guess the it should be called
in two code paths:

   + __crash_kexec() likely after stopping other CPUs

    + console_flush_on_panic() after flushing safe nbcon consoles
	the safe way

> I am open to both of these suggestions.
> 
> > Would reverting netconsole's NBCON conversion, while we address the
> > dependnecies above, be an option?
> 
> That would be unfortunate since the nbcon consoles provide a real
> benefit during runtime (full offloading of console printing). Also, the
> nbcon callbacks allowed the netconsole code to simplify due to the known
> in_task() context.

I agree. It would be great to keep the netconsole driver converted.

> And I would like to remind that our ultimate goal would be to establish
> safe atomic printing for the netconsole. So any workarounds (such as
> CON_NBCON_ATOMIC_UNSAFE) are only meant to be temporary (even if
> temporary will be measured in years).

Yeah, making this work a safe way would be a pretty challenging job.

Best Regards,
Petr

