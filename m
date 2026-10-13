Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6DF47B43B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791911658; cv=none; b=V493qbr8fTucTQCCV6ef74qf2N+4qPcGoE9YCTLeEs22u9hehvjCwglHBfQa1+/C8Yj3A1LhPPiJ6nT7u9/psCP8Ivg0UdmPYD6MtMBB3CTL/WewfdU7odqoj5ZEZuEqyWErgJjE7MkmS2/jJeFgNYSedB8+70Z9tb+SReYCQYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791911658; c=relaxed/simple;
	bh=OUz+o44EoyAaEgyls2XUlOxTe0oqUC2leYnQbuKd4RM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VLfeFvCOd0W2tZhFidiAjlkf855qujBKvlQZvBexM+tmBag9EWLu35sA4DGubg9617uWKiQdfpNb8XrouZuyL8iVFGa0arpl5eiFD7pYehlu3+IsQmvMTKI8l8hqRJE0j/af+Ut+ihrXkIVQpFQZFhKfsfAvjFaRrWpIFYlE3cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YuFOSSlq; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YuFOSSlq"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49d04e4a943so2789975e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791911655; x=1792516455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OUz+o44EoyAaEgyls2XUlOxTe0oqUC2leYnQbuKd4RM=;
        b=YuFOSSlqslBRjGWLj82KahR/XomOZlC9BttAN17zEBOUdip5R47V7BbiZ+sEID9DWt
         I2PRoPf5BPgpS/vi1tXs5AhkIZJSN42o1ByxWB3NY4TjagZafKRZhwdDlf91QqWn21bU
         uBv5cXVJnmsHGwV6ehEVrN5VJvHh6vqe57bz5YLFNXBOe4IAOsFH4yxSHXYUpnSs/def
         KrO7HBGwuxhhBw+BP1ifJWofNCiFlFkfhXWMiNzXBQbCsB8TugVu2fCGlaiWbvDEOzY7
         QXFIdcsEo0S32cizOrC3L3zdZPpOjZmSmLvZTa2841/gTMM8eRd0LhGTmHnT5XJbc0Lc
         I/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791911655; x=1792516455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OUz+o44EoyAaEgyls2XUlOxTe0oqUC2leYnQbuKd4RM=;
        b=SYyHdlceLuSC/L0V+GzdryMlfS2SXPqbzg4VPQul7VLgKS7P3TUe5N3432lrZSEs1I
         A0uQW73XzpgI38GjkOw7YOvGjszhccHaM3zlu8JkFPDQM2naeknQgMtJGCzA8deByZYC
         A2qw9g/kv7s/CCp3o4lXhK+cim5eHKz3JSDwjCJ/wuE5UN/CBLamGGW+zg3yj+jwo9rm
         veSFODMtYtwlGFo0sphwelyj4CAz86p0wX01ZZSViOlcLoL1QqvhLWuySszWpIsMW1hL
         fXOhBV9RlvFi3AJ7i4NpLP76eyNfXgasK//IjswUFl/A8ottd1xpssZ58Y5Cv7ubcSvp
         yUlg==
X-Forwarded-Encrypted: i=1; AKwUvBy1SMBtGTYYPycm87E15A2ZUE7MrAyVNDpUawY0qciuUPVMpO7hda/1YfrtJarCiGQxfTmHH+CI7Z5L8Gw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6i7gsQX31L3kvyhmSgCBoXDnsWs+q07Z1gOP+A2dLuqK6/N0R
	tjUe8g+amyVDkyS6+vGkjUH1beoDaTvfAPS9L2E7e1pGsXadXIydG/0s
X-Gm-Gg: AYBFou1nlzhVpu+XVxaqzPZ10rvrN7TErdEuLM1nLWgoKv5evITNVL+OQ2t0fbrc6OU
	+0UCkYcPFUE6G0zv1vfCparIRKqgFzpQJ+Jageq3k41jSh7NtE/0DRthcQN8gLB76xemSvebJb6
	UhvgOrQzSKHpSXFkODui+Neb+Pfz7irg+q69B659GBnZHbrnqdpNyLnkQcHdIDpI8dXwzJQl0VT
	Gg18BJQtHeb3JC3ocKzostHta2ZnKZxNzLlxnpMgT5vbP3b3/Q8fCcLWkTI4sU85PAkkluAiwUP
	E6o3M9ifHzvNWUB6jlygQQXI+XEmISqOF34p7+I9QNdYsjcLO1/WS1Wykaas0NzStMS/L9cVIvc
	ZIoOaO5L89gT7E2Z34S8rU18fnFAAGQwb/uQPyxwNTVaWyjwIAr3c8N/OVCV/Mte7GGhrTak7mc
	im2HkNhppShleDPxpkKPZdtoHcbU1WlyNJN90YtVJEepxep43t5hp89cFsSPOGjZI7+ZAa29PgV
	FEmLa2p5p4Ez69aNnlK
X-Received: by 2002:a05:600c:5246:b0:4a1:7e9b:e0b5 with SMTP id 5b1f17b1804b1-4a18e3ee9d3mr221469835e9.0.1791911655077;
        Tue, 13 Oct 2026 10:14:15 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f249692sm330932235e9.3.2026.10.13.10.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:14:14 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: peterz@infradead.org
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@kernel.org,
	rostedt@goodmis.org,
	tj@kernel.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	Kayra Cizmeci <kayracizmeci@gmail.com>
Subject: Re: [PATCH v2 1/4] sched: Rename/clarify sched_class::task_tick(.queued) argument
Date: Tue, 13 Oct 2026 20:14:10 +0300
Message-ID: <20261013171410.58340-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260929085319.981147568@infradead.org>
References: <20260929085319.981147568@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> For some reason the sched_class::task_tick() argument that indicates it being
> an hrtick, is called @queued. I'm sure naming is hard and all, but lets fix
> this.

"For some reason"...

I grepped. I think task_tick_stop() is skipped. That's a nit.
Just sayingggggg........

Aside from that, or with that IDC.

Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>

(How y'all find things to review? I just go to the threads that I see the messages of. I think
That's why I'm a bit late :<)

