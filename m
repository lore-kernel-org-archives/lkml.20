Received: from mail-qk2-f40.google.com (mail-qk2-f40.google.com [74.125.230.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBB83B71D1
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761863; cv=none; b=tJr9qjjF1pKxBunOIarOoWjA0WLdxT0vUzJwR3yF4PRUBUz9zmxuj+O32bo/Qrp+ejh40wvVJ0ZOIo4J853ZU8BLzkUqUX/cGuyMHHmsBXS29D1kRP1PQrejKuH+CW0P8mkiPEqvdeF9SojmWwGMDsSMByfNvgsB2CGhFwEgDAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761863; c=relaxed/simple;
	bh=nsDZU6lH0ABxd2mkaqWWWwpJUUSibbd+Sb86MxXWU3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sPTYNZoLjERzEsmE3L0+fB0V/wPFTW6FxlQYtwaoQp1jZeifzI+o2QlSJFQsr5HudVjmRYn6i7gD3Qm2tr6FCux7zfsuca96uD47ZuqSls83drUlpv9Czx8glg6wYsNyU8Y6Z6eMJoP1FpTWaKuxNzH8ep898SxGEQ44uIp9jow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu; spf=pass smtp.mailfrom=cs.unc.edu; dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b=SK3nCRqU; arc=none smtp.client-ip=74.125.230.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b="SK3nCRqU"
Received: by mail-qk2-f40.google.com with SMTP id d75a77b69052e-5332b967eb4so37744471cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1790761860; x=1791366660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LCubAwWVijXqS4BHl9nvH1ievcAHTddydMzemiE8ous=;
        b=SK3nCRqUOj+9Lbj4V4UWI9UMWoY3FMYUnnDsgkESvx3OTiquV0HrHlmwDJ/9qFZ+GY
         oNQoD8nFJ00dQ7xf2txVWJgC2DMFWOs/6I0+aEl7E7cSWF1xFmc724obfassRunPN90n
         C4PC7KVXQPvdisp4PGeTdkijC3VnRZk4AkNSQ3IQ6LfX4t2O3WrENUxugM8fqSMUOKSd
         hpXRqonKqfbdEqoo9wB7CSj12fcrSNh49FWQaKY83AVSqk8xH14dS1WnnKNg2d1laivX
         dQFQRyrAbtyQ+1NFKvrsl7CrAB7pm1L1IKpASwJygyf5ytkeJphyk4AHV8c1x95Eqp5Q
         t30A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790761860; x=1791366660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LCubAwWVijXqS4BHl9nvH1ievcAHTddydMzemiE8ous=;
        b=AjG0Kgn9cylhzLs+z6mRcr3q8qMWBFFKSZe4xpZ+7ED6U7oxiy1yYEeQVKAOMgKj2W
         b8D/CdmfUHpl479IvPcZnyYcy4nvYkqmpBquS3tXZlNvh8F7Qm+zo+T9b7QQ4kbm5TCk
         8k1LsKdQsCyRSgU8TqjV5CI0vkUo6GVzF/oDS6Ldvzxfxfhtowuod/SMDAxiYLxacgKY
         80lGOtfmf2lHYGHRqX2YP/TDRtxBgs1GXspoGdwUtJ9kLPfGVevWBKqqTI3OLLVdnp24
         3S919HJFHgC0ADyJxEpP1GG3EXZj0nK4W14Udhe9xQzIxk9u5DoZu0pRdNKzdQ1X4Kle
         M7Fw==
X-Forwarded-Encrypted: i=1; AKwUvBw9eriXRRImPVyqPcq3RRy1o9NUr41HWkwyQOpwwtWK/OuXp1DUs4e6WVc08TKc9CsES75IM3UgW2hNrQ0=@vger.kernel.org
X-Gm-Message-State: AFuF++lLmQDaTWcYCFaO5QXfJeKIs9Gy1H2NyuE2OLHJg5pEHKnv9eMt
	wnGbzrp3MTJJhswVj7SUw1ZlWZtsTMXHkRU5ibOE9JPRsXADCPFJalEnJvZ/jCgdkw==
X-Gm-Gg: AYBFou00q5QPshPF5OGJxSkAUHVpFW18/B+iiuUkSw9C3aTuBX7Js64Fg3Z3Br5SU6T
	AX97WOVNL79PLR6LH0Q4NxlGcyVj4slazgbF8ldrtTT3IhNwHWzr5+lCRKstS4SSUB7qT5D7ZKE
	uYEE4KMc99IP6KL0pfnl5s8GGNN9sOBoLvFDKTN6G4iyjOb3uY9j74MR9ZQp1vhrm6ftQsJ80Uz
	Q5wkAxU3tY+ie5a/BUjfXYgBHsfQkPLPzS4zC9NYfK/TIQIjqehbSrygTZVWbStGc7qYlnqdshi
	H0rfcnsbVwxKZkM5w55En/vZfuXp5fcsY4PnJeRLqXIjy2DSMfXtTzA0ERPndZJso0LUu9kU+Xj
	RXtZZ3Q0vsgsXMtwcvPXT7LMJIJxTPUZpzPw86iR2o2YnOosiV4i5YUdh+r8vQfknDHW3GbDlZP
	hAh2MJzqNrLbNDQljQWGAZJd7IN59mw54UQC0cUTQAH8tRVGbCOqKs72E4OI19xRtKyGGYsaiSA
	U+MgZd673JnTKc9Kd6TVGJjrTU+MTPG
X-Received: by 2002:ac8:5a01:0:b0:532:be46:5b07 with SMTP id d75a77b69052e-53374abf22amr13892561cf.23.1790761859955;
        Wed, 30 Sep 2026 02:50:59 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53374118024sm7797121cf.26.2026.09.30.02.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 02:50:59 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: joe@dama.to
Cc: brauner@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	hengyul@cs.unc.edu,
	horms@kernel.org,
	jack@suse.cz,
	jirislaby@kernel.org,
	kuba@kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	sdf@fomichev.me,
	shuah@kernel.org,
	viro@zeniv.linux.org.uk
Subject: Re: [PATCH] eventpoll: return -ENOIOCTLCMD for unknown ioctl commands
Date: Wed, 30 Sep 2026 05:50:58 -0400
Message-ID: <20260930095058.1062123-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <arWdMDek0iv0obDy@devvm20253.cco0.facebook.com>
References: <arWdMDek0iv0obDy@devvm20253.cco0.facebook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Sep 25, 2026 at 5:59 AM Joe Damato <joe@dama.to> wrote:
>
> On Thu, Sep 24, 2026 at 02:57:47PM -0400, hengyul@cs.unc.edu wrote:

[...]

> >       default:
> > -             ret = -EINVAL;
> > +             ret = -ENOIOCTLCMD;
> >               break;
> >       }
>
> I think based on the documentation this is probably right, but I am now
> wondering why both ep_eventpoll_ioctl and ep_eventpoll_bp_ioctl need to
> exist.
>
> Maybe when I first implemented this I thought it made sense to factor
> out the busy poll ioctls into their own function, but in retrospect maybe
> it's cleaner to just collapse the ioctl function into a single one
> instead of having two layers?
>
> In other words, maybe:
>   - delete ep_eventpoll_ioctl
>   - add the is_file_epoll check to ep_eventpoll_bp_ioctl
>   - rename ep_eventpoll_bp_ioctl to ep_eventpoll_ioctl
>   - fix the test (as you did in this version of the patch)
>
> Would result in a cleaner fewer helpers / cleaner code ?

Thanks for taking a look. Agreed, a single handler would be cleaner.
Two things I noticed while looking into it:

1. With CONFIG_NET_RX_BUSY_POLL=n, ep_eventpoll_bp_ioctl() is the stub
   that returns -EOPNOTSUPP for every command. If it became the
   .unlocked_ioctl handler as is, every ioctl on an epoll fd would fail
   with EOPNOTSUPP on those kernels, which is the same problem in a
   different config. So the stub would need to keep a small switch:

    static long ep_eventpoll_ioctl(struct file *file, unsigned int cmd,
                                   unsigned long arg)
    {
        switch (cmd) {
        case EPIOCSPARAMS:
        case EPIOCGPARAMS:
            return -EOPNOTSUPP;
        default:
            return -ENOIOCTLCMD;
        }
    }

2. The is_file_epoll() check cannot fail there: the handler is only
   reachable through eventpoll_fops, so file->f_op is always
   &eventpoll_fops. Unless you would like to keep it as a defensive
   check, I'd drop it rather than move it.

Since this changes the errno userspace sees and 18e2bf0edf4d is in
6.12 and 6.18, I'd like to keep the fix itself minimal so it backports
cleanly. How about a two-patch v2:

  1/2 this patch unchanged (Fixes: 18e2bf0edf4d)
  2/2 fold ep_eventpoll_bp_ioctl() into ep_eventpoll_ioctl() as you
      suggested, no functional change

If you'd prefer a single patch, I'm happy to do that instead.
