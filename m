Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595942;
	b=K0zlwO5W8E2mJvgi1BhoxMcbFkTh6LBPbAI6/hwOk+WM0WO7auFz+u9Mb1zuNmCD/tfA
	 fpZIwJ/Jsds96fE5NTOVWVozrQbKjzcUiBx2of04Wp9kZ+R/1hXYcUKF6g548wDKeyvdm
	 3A3suZzB4iqQ0PNRi+TmkRl4CWg4GouCxwXCCCEEJwtqlvyaZS6Wg54l8dQPclz28V6/h
	 a3TV99sokmNKIWSHxLz9jY6pRhHtC7+eB5hLpZG8xAjXthMzNI/Pvfw5suh6gcP+YFWOU
	 2MG7/EegJ/AhLwv7Q9v0sCHFTRX6NM5235iFBH7ZOx0dPJiqFYrLwYgaSgn9eh1/+KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595942;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=yp/iAPb62e75wupRmvyv0YjK3+amzNSWley0MVfbsjg=;
	b=bJepKu/szYrvkZWUWhRF0hKymR9B1xbXz3il5IyPMLQ3qlzWIt9ronzUvg2xhGuOIJn7
	 pBAbQuNWGhvfxwZj6/4dRGBL9RtnZ/Xroe/IxfgtWZMEvLXI/5zUVSZOLLCoJJjn4NWjK
	 xBK97OJEv5psD8kVfU8rM6x6TLXTlZSIPqbsxwugFK4/2IZNlX5zmbObBYS4eTrUnQUwU
	 XgciGuRGz6k6ogYBNunekR/qbEL1TvrqW14hrQTmYwXM6YpP2PDetoo101gjEImME//5i
	 glZdC5ye7VQof2qCVJNrLe+eSorlYEe8i9xwtncMOK4fCL6r6LJcbq/kPvsVZMvPFCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I5bAgT6I;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C54A606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:19:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C54A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I5bAgT6I
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1e154e4c6so1520995e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792595940; x=1793200740; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yp/iAPb62e75wupRmvyv0YjK3+amzNSWley0MVfbsjg=;
        b=I5bAgT6I4ZHP/ULymcKjMOYkzka1gk0I2XhpIlEiYckvPuo4gw2OwfcZvoHmZHKOYi
         FvAreJ+mRh98hq2y1R/m7ovnyindM34dGXfUnGQOHHKA1wSpVpZykGIqC/3gkR+5mwph
         Sm/lUpHGWlNOSGPxUYkULcWs/7It+XeYu8Ku1iqo4TviNm1hoY546q9o+wRmmXxBr13U
         39iMYwFv2JaZ/dQbWem7q93JZcUIjlyLDejjkDlOnuuvOKQDhvNgsVm7mtEJwsenLcRC
         zU1QkZuksuB0U+gwizwE7ARc7w7ZD3mNzbIcejqe9s0wUHeq9exow09pErOrjiPbUtca
         iJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595940; x=1793200740;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yp/iAPb62e75wupRmvyv0YjK3+amzNSWley0MVfbsjg=;
        b=D45ccoawh/35e6mpVxUzNAHNVZS51KxdDRUhrOsBo6Vjetu/QOInKUdhLCaONiWa3I
         6rllE60xV7ekSjxS6w2VAlNHuYZnBnYaSPNlJvhfamgxJlqllnbsneWusOMx/gb4hElv
         K1XzzT8WWLeIiiXPDr2ScOPnKPRO8dXecUVJEWedwgkKzQQQ/DGQFTZFvtput3gZnKlw
         zeopIv8nv/g/ISEN6mvZqLZYJujoGZaGIX4zimZiCiThsi8mRzc0fR83md3Dg44jvp8o
         4clgnt6yMC/LkocUs8oIVb0QXxsp7aqdmvuV4ogAIUzf3H4Zu17KK1IoAXVuP61muITt
         Gcvg==
X-Forwarded-Encrypted: i=1; AKwUvBzTch+6YVvefpLKtlhymg44vu8rcz9t6/kIeTpTXRzcNR+EVBqk94+75vI4PldZw8tTyFY2a6TLPmou20c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKya7f62hapJQvJYfP68ubW7sveK5Dv5v6j7FWmYWmHP24ShcUx
	Ns5xsYdkIvwnzm/i9QepaGxdui4np7kA9w/0u7DgWVQP+NJ6LnWFEuAO
X-Gm-Gg: AYBFou0ac2F5UOJyqBp7lMcZTST51PwgbQ1Q0bg6G0pUfEArDzXrwBJE1d+yflL0Nvk
	WrBetLb7L1BF4rmu9xBcGk6tBF2ITc2GKr4FcQ4f3PWe8tF/XyHAHKHZsXWCFviEpNZVZX7+YC5
	QF1E5rc/ZO3rvyUB1q7BzswPZsXgMuD+SBzZT0rSJs3VRIfMlVP6jkOKLYf1cA/RpaE3MvlH+A1
	YJuKEYJihAhTGNlUB+TZFSO8wUQGhxrOQOdTx+jLJ7YNgCogyFncfw7DGo8MbPZo+qsecpV6pyh
	/TFAg3APuxfVEF0z2pvVziPz794+aHganvhQYWsD1SFz2BKTeBhgCESy5M753vr7P2+3VWrbYqx
	NmuYSNhJbAGZshCpykB0FTmtl5wsWDkY0sbnY/E5XRhejuLrSK67GAgG72WZjqXj/czKCDg3Ipu
	5T80xHmESkmtHXoa+4IJ5w5vESlWYBvOZf8Ki73OmJf1h5NPWRDxIuSwY49HCrgg0c9MrgdOB81
	MCYQHWlN2Gxjh0uQhTPfFXcCB8aJGtuuKXgz7UPbuO9JX8edJ0SZ1pC0KwuH2y/3P0NZctQLuoO
	+pSqH9h9FWa/NrJA0RsgSYXUI9lhog==
X-Received: by 2002:adf:e198:0:b0:48e:28f2:64ea with SMTP id ffacd0b85a97d-48e28f26602mr3979833f8f.4.1792595939291;
        Wed, 21 Oct 2026 08:18:59 -0700 (PDT)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258213cesm6051960f8f.11.2026.10.21.08.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:18:58 -0700 (PDT)
Date: Wed, 21 Oct 2026 18:18:55 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, mingo@redhat.com, 
	juri.lelli@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-kernel@vger.kernel.org, jakub@okonski.org, longman@redhat.com, tj@kernel.org, 
	hannes@cmpxchg.org, mkoutny@suse.com, cgroups@vger.kernel.org, jstultz@google.com, 
	qyousef@layalina.io, joshdon@google.com
Subject: Re: [PATCH v2] sched/eevdf: Fix sched idle task group preemption
Message-ID: <atjTelN1fMPlUgZ6@scheduler.schedules>
References: <20261019182622.1584454-1-vincent.guittot@linaro.org>
 <20261021131313.GM2823843@noisy.programming.kicks-ass.net>
 <CAKfTPtDOZ0=nrQe1-WSTamgU0qqdJVvD3KZPtnsqwwnE53BSKA@mail.gmail.com>
 <ati_o5c-SoiOp529@scheduler.schedules>
 <20261021145042.GQ2823843@noisy.programming.kicks-ass.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261021145042.GQ2823843@noisy.programming.kicks-ass.net>

On Wed, Oct 21, 2026 at 04:50:42PM +0200, Peter Zijlstra wrote:
> On Wed, Oct 21, 2026 at 04:41:52PM +0300, Kayra Cizmeci wrote:
> > On Wed, Oct 21, 2026 at 03:32:59PM +0200, Vincent Guittot wrote:
> > > On Wed, 21 Oct 2026 at 15:13, Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > > > What is the actual semantics of cpu.idle nonsense? Why do we care about
> > > > this common ancestor?
> > > 
> > > AFAICT, cpu.idle applied to one level and against entities at the same level
> > >
> > 
> > Yeah. Like on here:
> > 
> >     ROOT
> >      /\
> >     /  \
> >    /    \
> >   GA*   GB
> >    |    /\
> >    V   /  \
> >   TA  GC*  GD
> >       |    |
> >       V    V
> >       TB   TC
> 
> (marked GA and GC with * to denote their 'idleness')
> 
> > If GA is idle and GB is not, while GC is idle and were looking to TA and
> > TB we gotta choose TB. But if we just look to GC and GA we would choose
> > neither. .idle just applies to one level as Vincent says.
> 
> Yeah, that's what we used to do, but the more I think about this, the
> less sense it makes! 
> 
> Josh added this (added to Cc now), but we have a number of Google folks
> on Cc already. It would be good to hear how this is actually used.

Yeah.

> 
> 
> So in your example TA and TB are both inside an idle group, and
> therefore one can argue their behaviour should be like !idle. But their
> common ancestor is root, and so the fact that they're contained in idle
> groups gets lost (which seems crazeh).
> 

Actually in that case TB wins over TA, since GA is idle while GB is
not. GC being idle only makes TB lose against TC.

Right now being idle only changes a groups status to its siblings.
Like right now GD being not idle is only a advantage for TC when
its TB vs TC.

> But worse I think is T{AB} vs TC. In that case none of the common
> ancestors (root,GB) resp. is idle. But T{AB} being inside idle should,
> IMO. definitely matter vs TC, which has no idle anywhere.

It does. In the case of TA vs TC, we look to GA and GB, and
TC wins. In TB vs TC we look to GC and GD and again TC wins.


> 
> So I think I would very much like to change the semantics here. The
> current stuff makes no sense.
> 
> Anybody, please chime in with how this idle crap is used and expected to
> work.
