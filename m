Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0369451597F
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898954; cv=none; b=F8LUBUqulMD9Py3djuGpIaaDz6C+nTC4qLjuj+kvZxj9oZyV+ZrpsoPTp4mF+MOOF5/ImHR0PyeeQT88goiNvfEDHv47fa+BxfQp34f5hAm6wiPJ4j7FvRtPxpGq5Sm1o3aKqIz4faxU3n9VpGlXkI4eIbZslDxDPe8YJcsQLYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898954; c=relaxed/simple;
	bh=SpwAZxF+cAtQzaEOGbfaLu6Pgl1bQkyBbYLAeZyTcIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Aa72lEzv08tCTh5IwCV5l5AXkcYlLd602/UYW7xUS3cR5a4nckUFni6ChYR6sov3sCHKKMxWasYL9RnBqHtiYCb95smaEJsTk3q7SuobbiUhjrqhv/uJG1Ul6xsSq+Q9Kdx8K+emnrCbqzyNU26Cz6jusfMMHRAbNzdjH8m7BjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QeTk8R3S; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QeTk8R3S"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48affdf66f8so526468f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791898951; x=1792503751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sf9Li8OP2rbaerPKVsChEYsOMpqe+hmg4rrQ+7WGEQs=;
        b=QeTk8R3SlGXcDeldlkHANV78VDIXJVjS5oarz/MVOfN/dMFeofgYLBz+v3qVP+CXZ8
         a1qgXkmMemtJLzbFaVzqXdymdrAkF2kgM3NNjaawc51g06+6Ve1g3uapDjKfhY4yxbVH
         7X34Bajs3VOUnDsieppCWwI2vePUNH8rTXPTrHPpkErBqMkIq/jbKhoJrGonHvt8aT6K
         hNnahODdoLl3enpnlev40vaUMNAIOkrgh08wxxPbV6TuBf35vApVVQ0ymhTcSgAr3UU8
         wfF9ZQ0HWWUqkl91Q7e57PKUQzexPQ4t4ORBuZlvkqC/rbE+/5zmuTmgZteDIyij9Tij
         u1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791898951; x=1792503751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sf9Li8OP2rbaerPKVsChEYsOMpqe+hmg4rrQ+7WGEQs=;
        b=yoEzc9lRT6uFuQZ6Wis+Nn737ynfwUnYeo2WVn1ezFdBKP0/G5YgRR1l+m5DJOvC4u
         S6K26IGoaH7uyiz/PsuBIhPwpluwdhI2xsGJ8u53HqM/AWnrueVmGEQOZMlHzZf3/iWc
         ZhN6fwnbcaXblKr6U18NxCULVLYxK5FORExZUgTJnjOxt7SDF4ORkdF5DNlqba2QqkRU
         3OSzift8+wjdC8CVUc0RkrEFLlksJ1ZQ1he3IdlfWqPq7rxxfjQZThdMeV3yl8WaGfKg
         S/A4vkYG2KeivlzCgE+MEgsDZzTD00IaODJXJ8i6/s2hE7EZ2/4KFDj4A1CpoelTeepg
         ZigA==
X-Forwarded-Encrypted: i=1; AKwUvBwPaS+3GKOkQvQFqT8tNgnPG01q/BNPV7DuTeQiCdn4jIGuJ7ie+y5mzmJ+ytGN4U8xvdZBNSv1CRzL7r4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+s+EXmBJWOiCixnjgSstG24ydI5GJbtFGTMAzGpKergPNp3ug
	Mm9cnLXJ5YncBPBUbxvYzzUouZVr0eytGUt/Ugo8MId00RTSGdlhJvCo
X-Gm-Gg: AYBFou3ftZSL2D/xbKeEEZ9p/6/azmbuSB16M+OPngK3p2wWtVUTbethIb1SLEMpXQD
	3OWInXKacmnAAZWQlgVQYLjw2XjfM7exlIlUmIdNOwAY+KAEmQGpnuhxGQoTujey5d7+CnE7i8x
	56zsQuF/95jRdbKIurF/O7ys89+B3xwFdhXVIPUaSG68XkOtxCYXstWoZ4rwLNuWIBvnDylhmVk
	NG9YlC/E/XdxXHES04RtfuHKN1LOM+8pRGo3iWdoy27OoPxjwt/zqZuS0IzOYzxRKK3iZPq9MA8
	RB8u7Qg04s4scj9mx6LWUbSlNjCPc5flMd5VKmT0OCXurthBxidD4dyzWN5lFjYv7a1qxR2H6TB
	eUky6gl/yzZQlZlYjtn7bmo9I+dDBA8zfv50+yKJPhfkoRcALTc/hLv7QQB7HmxwjIwWF0gEa/+
	LZweSDKmruCnjThmfWLuX78jC0c+/cgLTxXPw126g8cwauoEBbD+q7IHCaufJ+gNfxDxZRu+hE7
	ELz/sZ7ITX7xIwmbFtT
X-Received: by 2002:a5d:5f4f:0:b0:48b:58e:6cb7 with SMTP id ffacd0b85a97d-48dbad1e2a7mr25496363f8f.6.1791898950834;
        Tue, 13 Oct 2026 06:42:30 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc7299sm4450756f8f.53.2026.10.13.06.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:42:30 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: peterz@infradead.org
Cc: bsegall@google.com,
	christian.loehle@arm.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kayracizmeci@gmail.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH v3] sched/fair: remove dead code on enqueue_task_fair()
Date: Tue, 13 Oct 2026 16:42:27 +0300
Message-ID: <20261013134227.11350-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013115835.GI2009045@noisy.programming.kicks-ass.net>
References: <20261013115835.GI2009045@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ah... Just a dead code removal and look what were dealing with.
But killing your own beast must be a good thing, no? Instead
of just doing nothing.

> > The dequeue()->enqueue() also lets place_entity()
> > 'double-account' the entity's (on dequeue() saved) lag, right?
> > After dequeue:       curr == se, on_rq == 0 -> excl from average
> > enqueue_hierarchy(): curr == se, on_rq == 1 -> incl again
> > place_entity():      calculate placement assuming se is excl

> I'm not entirely sure I follow. With the above fix there is still only
> one place_entity(), which is after enqueue_hierarchy() and has
> ENQUEUE_QUEUED on.

> Here enqueue_hierarchy() adds the entity to h_nr_queued, and
> ENQUEUE_QUEUED tells place_entity() exactly this, so it can adjust.

I think Christian doesn't means the entity count, but the lag doble accounting?
On the case of se == curr, and on_rq == 1? Or maybe I'm missing something. Christian?

Thanks

Kayra
