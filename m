Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792944626;
	b=nR2HBspAlkvagH5WcwUutSftaqoHRjsfYSe2PULwpdgAVIiQ60itnUXyva5eP11QY61v
	 XB2T+kYbf9ATqM6wAOB4tqCoH0QGCbGjzUYEr+M3J9mtOBZdFVP5WbfzM+F447dB4aSsZ
	 jmX7QcuKwaOYDdiw/5R0Yvhkk1aQm3Hh4DQgvYD2sDF8zYfqDwjB4gdHkrzy45n4GARXT
	 98OEKnWoCVQFhcw3bG2B6D+jbrGbx8LJBNffh7gA3fuqw5xS13AKL1zgKMAAcCuZdXUnr
	 BZmjjFnwZETS8OO6CY4Wokuv5JSihxaHlbCoOZ8tNB3DMlry8drY2jqmGoSgFUzKWqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792944626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=kI8AZKbkyFQDh3fWe2Ucjc2rZL7S/+hpSffclpLVllg=;
	b=ZRXSQDobbgyQgg5DyX4lmw2UjaRylAn9tB2+r4VzpQCTfqjKw+q6Av/V+0HwM+PuO/RF
	 h0U7PfZtWgyFZh7jFVw+JwMxuWjQg6eNouOR1pG47UO7+vuJBjNM428oqaLN/bYog9qEB
	 AO8beqNNsE/fc+hb1c3g+C/EtuLJGdv0dJKTQGyqIlO9CtuzQJuA/3HmRbing9Xrz6820
	 +USh0zFJ/r2BudJLCo1os1cfCNFjfx6AQQeK/rh9HXr+cfwemiDNlVoQ8LjGqX2Y2BkGE
	 4V2I4Z7gD6AKutvBu8P9eYlpeb6HDob4Kry8dGeQA7sQ8BgAI6kR0C30/F34fZ3Wtqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qYpad43G;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343D6606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 16:10:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 343D6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qYpad43G
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48b001cd92bso1272815f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 09:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792944625; x=1793549425; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kI8AZKbkyFQDh3fWe2Ucjc2rZL7S/+hpSffclpLVllg=;
        b=qYpad43Gp/uZiEgOdnGtjj0dO9omo54vhgDQNKJjCMZiSRGg710/7z2DhUVP2weDYT
         HzBE8cndmQ876KcaN2/yw0KAN4B7OkC5BWezW8SwqlxLy2fZ8t2pJnhlHXeEDiOn+5pF
         jT4fyQ/AN6iE5tI5h28AdqTJSDxBmOxkSUnKUK7+ZOWtw8vbNAPzCJt2ulFSqILwVcOD
         iqWZF6lnoyhzTgvqPmqDAr85fnoC4P3c4vymDolWoshsScrSpYiTv3znQtbqtPnat7sL
         SmbQ+2LNm9ij/44/oXz/IP1IlhG3EOxYtSOImLxjwFWrrYhYDw6JzGdr4p5sBVVq9MH/
         NOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792944625; x=1793549425;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kI8AZKbkyFQDh3fWe2Ucjc2rZL7S/+hpSffclpLVllg=;
        b=2tmmDvogP6FnhZXpOt5y0wpXyy9AFn/It84blDqNhhztWEtwIi52ZVWsHVVdQwgb63
         Ylb9LJTZRB44PR3wznWbz2oUE/nNN4oGJyeyE0AUiiXc2Tn5n9ReLvlXdcZNmuDB5Je3
         Wz5BM8nmVysVDoaqrV+9XyCygZo6zp57vFdZCtTMRZkYJt3/akW5BLtMKq3rDKHuqZFt
         1ZkaUZ78/xZ64CDdrGtE1dUG6Gbl6WFXsakXuKl9cXQQrGD5R5WAqaOv8TUMiGLhMJoy
         Esjtwhe/BA1DelAGsFU+S72Nmf1ADFyLhH46cQEYuFEenuw5IGPcEWtWlm2/Q3qpxKT6
         ajDQ==
X-Forwarded-Encrypted: i=1; AKwUvBz71q8mBDdklZWWKnYXroFVjt6J1j/wl3Xq6F67mY2eawiy8Lg3jVKlWwVEc0J40ziZ1kyuaom9csSQ8og=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXZbDreTrylkb669AU0S+xdF3BQqR/l8UQWLkp7xwKSy3p5wpD
	tkdCGX6BZSm1SlwCuseRlC2ngVaSrTfngRfzGvFa0P6Orwz88sy4S3Al
X-Gm-Gg: AYBFou3RYBfg8o0smjJKrJgUf/BOJhfp0cQxneonju5HL9dUo5D8dP7WP/7cb6Cq4qB
	RzZsmgtmiupZlFu/rDno1noAt4wNEw3wOIfSawZQAdqMybuoyNkLc6EPuVzqTOXmnyvQ6X5JY51
	Y//ILGz+nNFKkSW7hXa9vAWT4Yy7xJ6dYz5Ea1yH9rr7IkwUhh94vd7W/hi5gmWPUrVapoAkkr9
	xq5orG/wFOtpKdJ/1REAVB6SrDJWgz/n80+bBPXoNeWfZYnWyKXiDnAc0vSD6lVjmhPaSs0Oyfy
	O7zrRz6w/Lon2Troj+Kth/bqZgTosom8HybVCVIXZdO62AgN9CssjnarTvVamN0VEpT+sdl4ikL
	d/W9GxAEsOypLdgrKetR8anGCG0SPSjCN4JmJqi8kSl1XPrLdyxhjnpBlcwvOgAQBg3ZNqlE6GS
	9I6UcgsevIZTdZrz5c0W3TqE7XS51OASWIGQ1jyJGJVO2lviNG6zs+0RW/upCSA9COKHd1zz7/D
	X3d3IzE8kv0s10g1BShnmEZVlQAiNcQNGf+xqN4ptQA25d1ABDNCAv6nxFOv/il
X-Received: by 2002:a05:6000:2384:b0:488:7df9:3898 with SMTP id ffacd0b85a97d-48e3eba06efmr8344636f8f.56.1792944624393;
        Sun, 25 Oct 2026 09:10:24 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm13019486f8f.44.2026.10.25.09.10.23
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 25 Oct 2026 09:10:24 -0700 (PDT)
Date: Sun, 25 Oct 2026 17:10:19 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: IgorpetinDev <igorpetindev@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>, Oliver Neukum
 <oneukum@suse.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com
Subject: Re: [PATCH v3] usb: core: hcd: flush giveback work on stop
Message-ID: <20261025171019.49c9a66f.michal.pecio@gmail.com>
In-Reply-To: <76dfb124-d488-45b1-9525-5369026b529f@rowland.harvard.edu>
References: <20261023174015.54793-1-igorpetindev@gmail.com>
	<20261024155614.2732-1-igorpetindev@gmail.com>
	<20261025000643.425c57ca.michal.pecio@gmail.com>
	<CAG21Q83f_Oj5+-OPjFdxzmLWnFkjfYhY9ordyO0zoGtxkWEW3w@mail.gmail.com>
	<76dfb124-d488-45b1-9525-5369026b529f@rowland.harvard.edu>
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

On Sun, 25 Oct 2026 11:16:59 -0400, Alan Stern wrote:
> > > > +      * Even though all URBs have been given back,  
> > >
> > > but does anyone actually believe this here?
> > >
> > > Hundreds of drivers written over three decades, often
> > > without linux-usb review. I don't trust them at all.  
> 
> If it's not true, there's likely to be trouble when the completion 
> handler is called.  We could forcibly remove any remaining URBs from
> the lists before flushing the work item and just leak them (with a
> warning of some sort -- ideally, one that prints out the names of the
> completion handler routines for the leaked URBs, if at all possible).

But you are now talking about developing a whole new feature of
unclear usefulness (will anyone pay attention to those logs?),
while my suggestion is merely a small tweak which costs nothing
and makes no functional difference under normal circumstances,
but reduces severity of hypothetical failures.

Regards,
Michal
