Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793285270;
	b=iMpjNQHTtRPKLpCy7Yp8X/wEoeh0O+ASlcB3HyY+WF5L4heK5OacxHQ50squCriblX61
	 8BFpWsCC6IMFvxGMkmqar2GXs0bJQ8+imD1eh6o3I+GIAEt5k5IqYJB8aycncvXjOZXSc
	 5yiWihB3GKOzlgkHSZrQkRhQ1yOmNTZBs69eB0Y1+0vOP50yQLqYAemJ45Vlz9VmRmiD6
	 l7ea2+vjhl/zTJKCneoRUaZVQlH4U+eRqRuO7yvxY23AtIeYNfAiZvyOOP8JZiz0OH8HK
	 rK4rOUpBLLosAh++pXlPOzoFT1LqsjnTBX0CpVLJpPgtuDs7HbYgnuee41BE98m9Q5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793285270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=t2RLRcd4jJhvrI7zbg6jPMwuOd13g8I2G+u3G4j4wno=;
	b=V7LPp15vQvfitW7Z6fO86cM8FWtVYOtSvRgyufNYhWS3ml8KptsZ7FOIZOmv75qdCkLw
	 IgzaoDLRB4rybsG4hVoAOQbh81BFfiO8j+5hR65WTNGjx311D6Lt/vvS3gLqmDQGAhJCH
	 ggmTT+t3IT16mHBOcdHezBvoE1cJxm5yTYQvNkJfr3FvvdJD3jLG2C/krjgZ7al7YNYr7
	 2RysUx0eCY7hF/S5zOyFoQUace8bL2aISjaGAkzd80f185zvJgToT6A84oa7a4cHp1StV
	 beC5qjTdd8RJ8GGqH3u5LKsozasF7QTBoqY5zb38b/Xnl6k58z7E8KRABsuGL5Fxpkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0OFZCmkh;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AB6606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:47:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31AB6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0OFZCmkh
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a215e64962so23902235e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793285268; x=1793890068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t2RLRcd4jJhvrI7zbg6jPMwuOd13g8I2G+u3G4j4wno=;
        b=0OFZCmkh0R6XFSiXCMCoda+dB88WuLiiF3wV1jsn18ajZN0M9RJ0ZI2l2IO+aIzMhG
         eQTGx179mr9H9jdNlKdIDxOFSs42hUh8K5groqTtnwF62GjL95WcBGTK/VHMkyy/gfoC
         9ifdc1hNjM60fF2UAJlKM707FLSopDFs/V46q1NksIMHcneVfVEPGiOOBw/JmLhD1uDo
         xN9Ox7kIneeh4EMCkYStn0bWs20nDpCq6CTc9ad+NiRd/OFZZfZ+T/sG9KAdk9OJqy5O
         TTIjLxWMWyyxopurFGbYiqeE++uqUr5yxHENWfPZzp/IT6216175cC4L0SaydMvv8ARP
         DD2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793285268; x=1793890068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t2RLRcd4jJhvrI7zbg6jPMwuOd13g8I2G+u3G4j4wno=;
        b=k4SNmDc3GbaezP2TqeS23HJGSUKqXUV6+eLDVgyJeZVYhVGNX0UgU2Y9R/h7zctFaj
         fYJW1MUecsOqAp0THz56LHZZjCM9LFJvqaBFxpo2cBmSXfXLdK/eLt+kFt7pyypQMuMQ
         vy1OlmOc181LQwZP4juSCuFWl3bkSZDZa59tBFdxWj5KOhlJLTWX/xAkQFT82k2Q11PY
         QtlYwcKEWbhAIfSfkVDuTyYpFBXyHXr9rKdNTk++5cLYwXKvp/U6gk5TKZN5QL5jKEl9
         F7yxANZoFjocDiI+YkD5k1TMMoBAWxXeXWt9WWWdJf7or+sAz9NW7y29Rcdg3dwQurUw
         4oBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmB1VVt+nOXCCj19kzT7U4p0HsrFDQSLTFaQnvOW8a2VMF43998rqTA+E/30ldh5PCfm2gnfd7oTNkzcQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcVBzsnjpgcx9YN6QhCgbcfJTSc9rTNapUhfbfmpmwIjsbVlZ+
	y9kxfDOnToyF62njv8l7Ggrv+LVqNq6wOzGdjhXsgLJamtifq7ZSBnE3
X-Gm-Gg: AYBFou2lzN9oCukTcB9CzR/0cMVSMEz0mTFV/7sMwAJCEV/lnFFWQMX+PUhDO2hkf4o
	UmmnHCyHBr8WboAvY8dAD75erPx7aDaWFbnCKWIyzWAvlDMDcdy6lmRULgncWgVzjMpxKeUPbcn
	C1OHcaFF/EWDHfEnHdXx7gF6jKNVH6MnQL4hzMzqKZECryYJ8t53pgUKmxDXjbCzt6etRLcxKXQ
	QvbtfeX6Q9rv02Ri7IjWa9xkr9G1OQhmNBXvrgwT0tBLEQAxkqSPr5CnzDnsNSfHN0hId8XsVxk
	dXK4YY9pj9WLIm1mGahP1QMifH9ZhoOML2O+PCkI078E0S7K8IInA0diJAAQewbPV2c2BZjT7z9
	MDVSQxGHd19liJYpEYeKSm6wkL/qr+/I5ZpOgGZu3eh40xBnCKfc74MOpRPK2cCG2jlT7UHYCHa
	O6fyzb6/uhhSKiyIFxNxodRSIeqogtQGewcxMovcpFweFo3YvxjjjTmfIG3qw0+JPjK7U2tA881
	3xalchyVP3JI1SdsjiPgxcKmFGd9DMDdn5UmGxIqSp6o1/Y18oL9u7rvP7/X7dLdHL0g/vKkrYn
	riUQRXFO12M8M4MSzj1Arylj826u8KkeK2f+J316G0X3AdR9E6cklQkXxKq6s5It6Gmyuw6Vjjt
	K8DyI
X-Received: by 2002:a05:600c:4e03:b0:4a7:7d22:c50c with SMTP id 5b1f17b1804b1-4a963ffcf87mr130861115e9.2.1793285268267;
        Thu, 29 Oct 2026 07:47:48 -0700 (PDT)
Received: from andreayoga.localdomain ([151.57.246.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7c5063e3sm71561005e9.0.2026.10.29.07.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:47:47 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	Gary Guo <gary@garyguo.net>,
	Bradley Morgan <brads@mainlining.org>,
	Kunwu Chan <kunwu.chan@gmail.com>,
	rcu@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -rcu/dev 1/4] hazptrtorture: Release all deferred hazard pointers before stopping
Date: Thu, 29 Oct 2026 15:47:28 +0100
Message-ID: <20261029144730.213196-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <9da03ed6-fea2-44df-8aee-f7a61a1d35ce@paulmck-laptop>
References: <20261027163811.2470569-1-parri.andrea@gmail.com> <20261027163811.2470569-2-parri.andrea@gmail.com> <eb59edbb-c6e8-49c6-a426-c55cdb792853@paulmck-laptop> <9da03ed6-fea2-44df-8aee-f7a61a1d35ce@paulmck-laptop>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Oct 28, 2026 at 04:51:12PM -0700, Paul E. McKenney wrote:
> On Wed, Oct 28, 2026 at 10:26:18AM -0700, Paul E. McKenney wrote:

[...]

> > So doesn't the above torture_must_stop() instead need to be
> > kthread_should_stop()?
> >
> > As it is, hazptr_torture_do_pending() will still stop before the
> > hazptr_torture_reader() instances do, correct?

Its loop does exit first, but v1's for_each_possible_cpu() pass comes
after torture_kthread_stopping(), which returns only once
hazptr_torture_cleanup() stops do_pending, after the readers.

> Well, one thing that I am missing is that changing from
> torture_must_stop() to kthread_should_stop() might cause trouble
> if rcutorture execution is terminated by system shutdown.

Agreed: on a shutdown that hazptrtorture did not start itself, the
reboot notifier sets FULLSTOP_SHUTDOWN, and nothing calls
kthread_stop().

> So my next suggestion is that this be added just after
> hazptr_torture_reader() exits its do-while loop:
>
> 	for_each_possible_cpu(cpu)
> 		hazptr_torture_do_one_pending(cpu, &rand);
>
> Thoughts?

Works for me, thanks!  I have been testing it, instead of the
for_each_possible_cpu() pass that v1 adds after
torture_kthread_stopping(), and keeping the torture_must_stop() loop
condition.  I will send v2 with it if it holds up.

Thanks,
  Andrea
