Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584940;
	b=zStjPUiz2DHSaBTTUlqvpan2CtkkpQgu3ssrX6TSBfNDTm6rhGaIkmJMvfirmyFuY7G4
	 4oqYDjyj4NquUY/vNM4dqta1hwaHM8y+tRYOFFecskhSt/5VWuMSiXi5mIbQ9fbbgpUuj
	 wKIOHIXL8WN5vs236vdZq19sKwmPyhZSs6yqjCf7l6k3jYZ/jRwMZd6YmIcX1CEA9jhZM
	 89maSQ3vh/WPp6AVBbbsOgbUk2yoljl6hrYjBib2frId2KDYaPgTAFQs+YypiGlWvb7nB
	 zYhph+G6n4ZbkF2oNanI6JeATFxfEeAYWX590Z04NbaZxfwvz2R6qwsvMAiyHSfchzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cH9e8a66/fPrQXh1VXaCN026KUPqZYcbPtWpdmcGZiQ=;
	b=XnBp3ZVFJxL8aH2i16+jUH45a+ckoplmcbg8usLOSjKdDqF066fJEujwO5vyf17u066M
	 65CQTdDf68F6dyXJ3fe1pc011WpiM43pNQ1VlwwJZodCmqtgOvUudebE3diwZBDAV2tfA
	 n0keirTxYfDnrlPVEds/5cbzjGR/ZMtdQVUJ1+VshPHTQNv3IYWqCDhnAbzLApIXlsYGX
	 d9LEVnahjrynLL72XJpIMg75y4bXH+EakdzwGTYmjMpV0F4tvZUQWbkWe3oeRWpawHffa
	 ejzdIa6QO/ZKbNLECtc7d7G9ok5MWMBDAIFXYeQwN93fcF8Ir8qoNKAk7VV6L5VGKCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HtadXHK9;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57C8606A884
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:48:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E57C8606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HtadXHK9
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e10a70540so530901f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584938; x=1795189738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cH9e8a66/fPrQXh1VXaCN026KUPqZYcbPtWpdmcGZiQ=;
        b=HtadXHK9t92BrbkjcaGnpVRnLg5g3aNhUW8/jR0zafF/jSSGEmGeQCSpdhctwUL4ti
         9aysuhB14RvduH2ZVBqBvmxgBttvA29Nc7TIqsK3L666++/834igmjMbGLjqL5TN2wuq
         gpTt+d77EPmTB9wA0umF0j5fhwhOxxFZuMJXslsLoAwfMY8AEnsdZv1tpl3rJc4ajhgt
         drzvGvQ8USFQ4XpwPr/lR1igjlPOI/myRzPyPcrPNBlyqeBhuAM1Y23er6D+KILFLIse
         AuUZ0fylV4gX3Mxj6WLmd04EkM4GrNmeMf/Z5p97mupgnDy5nwmHpZE75xPp8GL/kjbx
         yN7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584938; x=1795189738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cH9e8a66/fPrQXh1VXaCN026KUPqZYcbPtWpdmcGZiQ=;
        b=Q3j/XwcC3hQA0LLGngxUFPj4m3lDW0qmbrEC//RQIaqm1GgqjP2ubuGeNDkXYjsdYb
         7RRjyNJhh0GFN2lsmDlS6hB5CLT3bE0LGMvM55fxVjxhMp9LjvE6GV2O0/IU6Jmip6DS
         02sAW5IsVVNnpxh532lJJSfLw00Qn9B4ldN8HY18DIWnm1dOk2TgmzlqJwGoc4yHn4PX
         DE22hnI698rb2TATqKQWwy6p+QpS/RBQANLJVF14MIjWjpCa1uedGNavn8X8kvLKVQyu
         nur1/y2xaBuaDYVRKtUdCP+wXkAiUnRT7SniSVge8CBRudSBHbYMZ6i7psZJ2+YCkPB0
         hEpA==
X-Forwarded-Encrypted: i=1; AL+hErHLYc9MJOJxj3nmlwyOmZjMh7fjfN0Vo7x87ZukycSnlLY09CC2ZboEL5Lq5Ta0FY8zqa19aMBv9S+FHPI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aG4A2lrWfPvfqt8DGToJWmMDmj2e5h4HypSPPDu6kYUYHZaD8
	zrw4MD01ncfPIswnfq4E2OR3AANHFvuLp24rxjJ0tCy2KXyAxXrM8zKr
X-Gm-Gg: AYBFou3lMW0UMKefcYoaEP5okplAdTG3Utgu+8NIihvCENSwwfAThu5wAUmjhmMhZIV
	DrV8OyoCxZw7RhwUzgEeesVUg2aeI5sp5fpvkXmmWuoUZo+TGXJql+ViypvjOb/1pjotxviU7fL
	uk8XFdazAmf5lUoIiWkDrG8v+xg2VXWS2tsEt1fihP+2+4w5mPcVec1URHzL5NNZa6TgYGGhLAZ
	NCBoz9aSiB35h6AzYTlcCCsQBh6H+iu55n3D8aqSMpms+GdIYz1J90J/Xk5vX1ckPBelRQGaJSo
	bkKeB/0Ls8lZRo7I6ASas5GUlV2Q/ARC6dZxg0yD/4+d8B53giSu5DFPwf8ngMXWzCf8yro7bwE
	bMJSZgE19jrDnZ1XSeUTJLZk853r/KYzrVOj/XFXVo+WcwSbtxvXicR6RymJTUihSHVsmB1o02r
	4KZ5JFE9MLJ6ORLKASqRE7YXWDuC6RHyO0Ab80TS+5R38Yse+XtLwlUDl8LXdKpvgSIksujJWia
	cc1jCGlnITfiC004h/n93yodsH7ov+sMvlBs/Df2UVV+e/I3U+ehDFPYtD9FXS7Ly7rHgv3R2Qg
	NLTcxHh2HM/XZW7oiSnYU85Ra2nDW2HSBCyHHFLHULjwuh10SpdZ6nltWicq5qsIzLEUQz7tbs6
	4lg==
X-Received: by 2002:a05:6000:3102:b0:48e:4300:c6d4 with SMTP id ffacd0b85a97d-49c747700e5mr7815205f8f.53.1794584938107;
        Fri, 13 Nov 2026 07:48:58 -0800 (PST)
Received: from andreayoga.wind3.hub ([31.189.56.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5fb58fefsm6638119f8f.26.2026.11.13.07.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:48:57 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Clark Williams <clrkwllms@kernel.org>,
	Dario Faggioli <raistlin@linux.it>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH] sched/deadline: Check SCHED_DEADLINE affinity under the rq lock
Date: Fri, 13 Nov 2026 16:48:52 +0100
Message-ID: <20261113154853.14393-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113153549.Z8XPohWU@linutronix.de>
References: <20261105164856.29698-1-parri.andrea@gmail.com> <20261113153549.Z8XPohWU@linutronix.de>
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

On Fri, Nov 13, 2026 at 04:35:49PM +0100, Sebastian Andrzej Siewior wrote:

[...]

> You could keep the check in __sched_setaffinity() so it bails out early
> if it is not possible right away. The check under the RQ ist just due to
> the race window that we have. But I don't have a strong opinion on that.

I'd rather keep a single check: the early one would only make a request
that fails anyway fail before taking the rq lock, and two copies of the
same test can drift apart.

> Anyway. The reported problem looks solved to me:
> Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Thanks for the review!

  Andrea
