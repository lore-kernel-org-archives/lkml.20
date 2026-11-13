Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794561592;
	b=USXoaSJTAatAUKNK+Fzc5FCkJt4gQz2qWCBdSECWPzwpetXGTzLIe9b0Pa5puLGVsSSt
	 Iwe0vYckgATPrWoCJZD2G4Q2says+eieIalPVZjhoxv6cfJ4+5NaBN37xE7/cuqZC3lK2
	 x59XccicvIG9ecCugH1EuyVbQGFV0LYjjdNKMcWgNs3jAY1qOYWLTtsJlxPdcPfrBfPjR
	 n0nwKvigz/yj3Yj41gaUkKCpp1ETEWD6FYaSmRTYhxknmbiMn2HtEm3HN5WPgx0J6YCfT
	 IsBg/VuLov6lQTgPzmOKcBOdV/xAbLZeLf9xukL+uQ9CpFQT8dIU84OIP1MsozHe5nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794561592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=K2w3c32f4q6pe2d6yUOTDv3y5JLyWy2gymTmBW7sA8Q=;
	b=r0rV9zqvQw2DfDMeuhfshDD0ueINhcCexstRC/hxvwC6Hs5/FdukidMpDu9n+nhIcrHW
	 fLFCvtClrt9esaZ2wO5+LdP4rzPiUkabjrLxk+7DOfwb46Cq/83jv33IfhjtNO33mlEgB
	 IuxaLd4eXa4e5608uR17YKJGY014Esaqg3kN2MfY6tSSDLghPl4WhtzIYomJkwQ8c9Y4U
	 h6qlOn3b3swj6v8wiXsnOerHiIQFf9Wo8iabCyGBJc9Hc5RLtdQapj349VMIYCMFNxQx6
	 mrCvXH3gLIVjKYGN+GZt6YqJIIBSAOVKNkHibYoAIW/Xgv8W+xCHxasPdqIFldXeShA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AQL8dOGy;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6AB606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF6AB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AQL8dOGy
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so781477f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794561589; x=1795166389; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K2w3c32f4q6pe2d6yUOTDv3y5JLyWy2gymTmBW7sA8Q=;
        b=AQL8dOGyJtW9llbmxXGfnemLzJOn6ySyGs2CTf776mUwsjh/Lky4CxBPuBsPMHVnZV
         Mp/HvslB7b05KMwWYuUWLd2BUWktMm73lbN2nfa//39zVR22v35Ku0n7fn4LkiKh87DB
         JBnsy6ayERgnuJzGaP0lKZRkE3zpw4PTa4PPQH/7FPFUaO1eoonWPNsi81sZYHhalM6N
         kLedLvARxZekaD0I6IZogcldlPTtrjSbmWNWcDLpBWu8/AjgGSp0G4oOYqH+yCBWFqI6
         6JQeVXnPklY8icUvrEwVYCdjNyDrZ5590ml6hVSPLrxt2YxTmDCWNyO+51ODtYBtM+TA
         GBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794561589; x=1795166389;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K2w3c32f4q6pe2d6yUOTDv3y5JLyWy2gymTmBW7sA8Q=;
        b=mvLWPINZYfm/pxHNlZ3EYxSqY47vZMm73l94zqR77hmchjj6I7Vm/eQKsFDYTsswge
         vOVwC3wFy8lGyRK//vXCbcwVh/KNTLK34rlNFXGIQXhVbnfeFGsAk6kFgoOnu4Ge4TYa
         B7J4LWNSPi/uI2napNsQWk0WGb8ZsqvthQN5oVpJianu1GZ+O2De0SOjJcrUBtUOl1jH
         HhBZ7xEYVTwG5fwtn27CJ4KT0ZkFPcJUzFMl12lQtXGQuuV9mkj7DML4WBXFKxkMl9j5
         nQEZDm4WxxW2538ZKOkNc6OueqRkT7DDqnzPDaiX0o+E7YljqmzNAzXLzo6Afw4QJI8q
         sBfg==
X-Forwarded-Encrypted: i=1; AL+hErEOUSAw3/6KD9u0d4lhvCElwmw3TmK1Du+7EtjDHwjBBQ/3/bkwv1puKEk0cmqpuIL0PuMKEw98gnz/jWM=@vger.kernel.org
X-Gm-Message-State: APuU4Z91ttkLu8uUDGHp2BwSGNT6Bxnkv6WLq6JnnFVyCZQXl2qP45vd
	atyEA/SoS5LEVT9H9BzqdK+82jj1MZZmUsfr1q0dQqTSfHF9BgNxkteOxuIR+CAmkwE=
X-Gm-Gg: AYBFou0RabPao8I+cvAR0yzsQNKFz6oXS0aiWAskw2Rifxf1n/2SCbS8bMcrqT0WBNT
	0hoFByYzkE8RingnjRudqeINW6tkwSWyF6NJkiwVQEP62e6Hx9SGjeOgs++cRJXowEOnfplaTxF
	6zTgOEdHPdImk45QuoyV3RngEcJ37jsUiO4kG9qADzNEvdPfIsOZPyS/4I00Sp563pxzTGKnZhV
	LyO9lawsP+DvxbnJHbQfT+UsIBeViuQTkmv4gwE0pl46yBszL8CGDicgE6VrHebaQoLOE8vsFyP
	qd3eEhkhsR4LpJGRoJ8vRTmh+NaPmknWbaBcEVwLz8vahpDlLxc35WuGyef0pcqs18ro1TndGyz
	DotvfD0HDH2hh4cjqYeg3OUscg+gJYdMH1+wHCwIpeO5AbPNFM5JXZLbjf1MLqE4MmOeY5PPEP2
	8CQ9C1UJFr3mOPmCGrb85y7I8uRmgh0to0t76XwSBh+BLaoD7p7ryK/PnhYS4JCPQivUBgDK/hU
	85jb+brYpBVpxVKFzcXwEsQeOCQoqhP5D6mqGdaUGbjMCFXqXaYdaX+bPGGWA9epDgE0q9nEkkT
	e9pwQ/yMxta8TPg8
X-Received: by 2002:a05:6000:4284:b0:492:820d:5e6 with SMTP id ffacd0b85a97d-49c72ba6660mr4954981f8f.49.1794561589263;
        Fri, 13 Nov 2026 01:19:49 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c604ee47dsm3776134f8f.38.2026.11.13.01.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:19:48 -0800 (PST)
Date: Fri, 13 Nov 2026 10:19:46 +0100
From: Petr Mladek <pmladek@suse.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, mbenes@suse.cz,
	joe.lawrence@redhat.com, song@kernel.org,
	live-patching@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 0/9] livepatch: Add support for scoped atomic replace
Message-ID: <avbWMv1DJBoSzRKN@pathway.suse.cz>
References: <20261026133651.40061-1-laoar.shao@gmail.com>
 <avYNu60V0spG_xIf@jpoimboe>
 <CALOAHbCGy+tDn6b7rt11H99odZzRG6V67c17ToeHb_0SqVdxWA@mail.gmail.com>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALOAHbCGy+tDn6b7rt11H99odZzRG6V67c17ToeHb_0SqVdxWA@mail.gmail.com>

On Fri 2026-11-13 10:17:20, Yafang Shao wrote:
> On Fri, Nov 13, 2026 at 3:05 AM Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> >
> > On Mon, Oct 26, 2026 at 09:36:42PM +0800, Yafang Shao wrote:
> > >   selftests/livepatch: Clarify test module file names
> > >   selftests/livepatch: Adapt atomic replace tests to provides/obsoletes
> > >   livepatch: Make klp_find_func() non static
> > >   livepatch: Call klp_init_patch_early() earlier
> > >   livepatch: Implement provides and obsoletes for scoped atomic replace
> > >   livepatch: Deprecate stack_order
> >
> > s/Deprecate/Remove/
> >
> > >   selftests/livepatch: Add provides/obsoletes test scenarios
> > >   selftests/livepatch: Add state test for provides/obsoletes
> > >   selftests/livepatch: Add function test for provides/obsoletes
> > >
> >
> > With the subject fixed on the above patch:
> >
> > Acked-by: Josh Poimboeuf <jpoimboe@kernel.org>
> 
> Thanks for your review.
> 
> Hello Petr,
> 
> Would you like me to send a new version with the change above, or will
> you make the change on your end?

I'll do the change when committing.

Best Regards,
Petr
