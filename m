Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F885477E
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 18:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791226778; cv=none; b=lhwRzyXXoRcONMm0aYq+f2RE3Ep2cwEM4cx36RSVYm4I/MCej21NHNBHt43ZvafO5AnHj7CT6pL9ipQque7/ceozfWpYnlV5rfQ91VB0XITxoLmQYhkjDEhZdcvItCbPkrIuR/Shw5/wPWhz1y85bZKv7fdDYT7EVSOYsJCtxNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791226778; c=relaxed/simple;
	bh=SRcC8ohDq6n1/1x6uEFOzKfccQ4AUSwXZvAuiYjE+d0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ce5hPjinm2mIfcN30BiBGZIU8TvIOPdoleLlUpc9109sel/h9F6s660FNoObBa9/cAEBXa9cxKL9DhMqT2YVt8+DsDzCOFQT15pkW1p8x0SDhiVoEUwfQN26mdNmBK3YnATnt5bxZn2NAC1cGk6YroVcQmfKkJmZrCHEUVkIK5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=G4cuvJ2y; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G4cuvJ2y"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33fb4680717so5953866eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 11:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791226776; x=1791831576; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=34Mc2VGmFq4+SQZVPBzQPN4LtH9/hpTQPAekRG2rusc=;
        b=G4cuvJ2y3Vi3vcYL+MrUs9GsLiO7W05OgIG15dVMH4EfF3C/NPnpBneKEKrK3tJOMR
         wDcJAwXTw3M1KsQKcM65DcqzTVUFw7O//niWgSxrWHs4ZlN3AtZKaKesVLgDX3AYkpt8
         mlcDRGp9LrK1BADyxjJ8Fn6LNSvr0icuBnK5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791226776; x=1791831576;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=34Mc2VGmFq4+SQZVPBzQPN4LtH9/hpTQPAekRG2rusc=;
        b=0XfS8fFOZ6wwIkeN8T6pwMb5YytPoFBb0DKXxqIxATeuI9TlgOdNjGBFjRonmgFAed
         mDR8EkUGB/jpWrMjJAcDjmnHeTn9hC1U98l3JtIHBt/AUtbnfPHAXVdBt9R8PsmTJfGt
         tDWTrIIzKHE5mzw0fPOMjNL2P8/LLbuPUpFXpfg2FRJI+ZLr0Gsv4GYOIYt41O16GD9/
         5t42ilBo7uPQvlb5evx9Nn/R6mccZHBCcpdq25VF4bFe7zBMIafTBbozoH/2+BNFZWPu
         SrSJ32NjPA5Rb1SizCu3kXf28uBoSOox1M9iGJDFdgjZLw7bJXI5lo7lIchUoW+bRuUg
         VqlQ==
X-Forwarded-Encrypted: i=1; AKwUvByXY6tfikhLyoHKN8F1KCi/tnT9zOvWdkymYOZv6FRBU67AX2BLYs+2ZGbzKAxREUiIS0QSxDUog40XZtE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKsz2ZvnfoCmKyuYnzwwjFpi9kYRhf7t/kyGVfwJu8v4/tY6zJr
	5nn54fVXg0SspMkIJm/exTinbCYft/EAJ7QkNEQ+d+wjN7WM0vUwlyFFDIVU+jj7TA==
X-Gm-Gg: AYBFou1yz7oVWVYL0eg0THleoUYufU1InzgT2iBLzZtXdy7t1/8CSWqYeYcDdKGlYjG
	697PGQxY5jIB/tyUvUlv+UFIpQz8cdPbD/chxkl+zYqkTqrozrxkHknYDjqmep2ojCnjqCboWlj
	gpLfOM9e1s49+384hI9JFcyxY1q8HstK5H0If8XN/uqbPGEOokYocBgdxM0c8MZ2LqHC7KT4bLe
	pIdQVMu+McKLcJARdvUndMEhU1VHLzj+Ovb6ihuVJXa337FsstvwMq+m9OrqxAULu/pyoQ4Ls8Z
	Tj70gyywxxzPGKY1TVkxX/yjQLueD9ufR0aH/gIk/SI9K6IagiLrUYI62pAEpGIjy8sKAG/ebWL
	8RcE4aT3iC+dSVIfWU/wpz7jftfrpjqoHlKYatjjFJGBL0XukdHrfy+zybqUkqzfzwQG04LfUJv
	F/ZcibX0yHiaNbJ8bpDtRTY9oqNjwUKDNJMri7Y0VMWFMX5eYUFzO9ybPjl6QdWIMpJXQbnrrfD
	NgjNMxdqMoiP3KfVDRIPk1YPsXxQWZfE4J1
X-Received: by 2002:a05:7301:fd8c:b0:34c:4af7:4da4 with SMTP id 5a478bee46e88-35111732d3dmr9225010eec.39.1791226775679;
        Mon, 05 Oct 2026 11:59:35 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:3452:be62:94e:a46d])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-35146abff39sm233580eec.21.2026.10.05.11.59.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 11:59:35 -0700 (PDT)
Date: Mon, 5 Oct 2026 11:59:33 -0700
From: Brian Norris <briannorris@chromium.org>
To: Doug Anderson <dianders@chromium.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Len Brown <lenb@kernel.org>, linux-kernel@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/5] PM: runtime: Avoid racy clock checks for
 autosuspend-retry
Message-ID: <asPzlc60S4N3sIrk@google.com>
References: <20260929184729.2346769-1-briannorris@chromium.org>
 <20260929114714.2.Id0a3276d23d30e0b5fd4d6dca730be0f9d8fe018@changeid>
 <CAD=FV=WPohx1seYHdw0Mi=5xh8XCWvh23ie03+ePXQgTixGzOw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=WPohx1seYHdw0Mi=5xh8XCWvh23ie03+ePXQgTixGzOw@mail.gmail.com>

On Fri, Oct 02, 2026 at 05:27:23PM -0700, Doug Anderson wrote:
> On Tue, Sep 29, 2026 at 11:47 AM Brian Norris <briannorris@chromium.org> wrote:
> >
> > @@ -242,7 +242,12 @@ static inline bool pm_runtime_has_no_callbacks(struct device *dev)
> >   */
> >  static inline void pm_runtime_mark_last_busy(struct device *dev)
> >  {
> > -       WRITE_ONCE(dev->power.last_busy, ktime_get_mono_fast_ns());
> > +       u64 now = ktime_get_mono_fast_ns();
> > +
> > +       if (now == READ_ONCE(dev->power.last_busy))
> > +               now++;
> > +
> > +       WRITE_ONCE(dev->power.last_busy, now);
> 
> While we definitely want to fix the problem identified in this patch,
> the proposed logic doesn't sit right with me. Let's say that
> 'power.last_busy" starts out as a given value, let's say "1020". Now,
> while the clock hasn't ticked you call pm_runtime_mark_last_busy(). It
> detects that 1020 == 1020 so it sets the time to 1021 so it's
> different. Now you call pm_runtime_mark_last_busy() again when the
> clock hasn't ticked. Now 1020 != 1021, so it goes back to 1020. This
> could cause the whole heuristic to fail, can't it?
> 
> Maybe I'm just worrying about something that can't happen, but the
> logic still seems odd.

Thanks for pointing this all out. The above solution was trying to be
too clever for its own good, and left a different set of holes. It's
definitely odd, and I think it points toward:

1) either we somehow have to be even more clever or

2) we really need an additional state variable.

I don't think #1 is a good idea.

And #2 was what I was pointing toward below the "---" fold, mentioning a
|last_busy_counter|. I thought we could avoid it, but I believe I'm
wrong.

> It felt to me like we could just have a "bool". We set it to false
> before we call runtime_suspend() and we check it after
> runtime_suspend() returns. If the bool is set then we know they called
> pm_runtime_mark_last_busy().

Yes, I think it doesn't even need to be a counter -- just a bool is
probably fine.

> There shouldn't even be any weird
> problems with weakly ordered memory since this boolean should always
> be cleared, set, and checked in the same thread, right?

Well, it *can* be set in other threads (there's intentionally no locking
on pm_runtime_mark_last_busy()), but as long as the setters we care
about are in-thread, I think the only problem we'd invite is reading a
false "last_busy was set", and performing a spurious retry.

But potentially-spurious retry is already baked into this protocol.

I'll let this sit for a bit in case somebody else has other
thoughts/suggestions, but otherwise, I'll probably end up adding a
"last_busy_updated" field for v2.

Brian
