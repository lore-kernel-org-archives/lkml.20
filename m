Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D175B4C77B4
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790769079; cv=none; b=cuO7XxsmWXh9n6g0/FQXbn++yq8CLQ87lnr9k4+Men5IX3P39uvhERBjX3T+lHN7xRjg4v4oMY+cP7Lr/EtXmSGuIShCcmeNT3SRsjQCps+jIIbI09e9s1tkzVzg49lbg0WHhhprat6avGjtQg7BCRiA4D8MOKsdySMU+P/YZCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790769079; c=relaxed/simple;
	bh=gXRJKrPhjzj8gZ1pv3u7OB2hruuDfHXgAkamLmyAIqc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OAewQqtIf+jJVGtjL72DZ7Ox0HewPLcUErpihAlWDedwRw7hCKislpCFonueMJQHbmorhd0jAOP13Y6kPY8+zSlxbqc+NgbtijNkwFxgEHqfOFBMVrPOJOzwxRmr60DEOxH/28hj3a6W6vpafmnux6VFo9tiRtZ8YPY5VnIOFmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VQwO9RQH; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VQwO9RQH"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a01b112fa2so4086275e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790769076; x=1791373876; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sPYuwE1/0bF4HTDsvndpoot1c/MYhCPRtMeze3nyqSE=;
        b=VQwO9RQHGsmqdSC9uwjEy1sT5fTBvMgpH86Q+Q5Mkx3A9KfeYFcRufC8m4kWR0d/Jj
         vBeOHkhKB8GlWycAYDGGmR0ta7sbwiJaTPQ3nsfWtO/whzpw72nBeWTeobAh9kLALmRB
         2bMbc1/5Hq++m5pK3pw2HYbeRJfDlVCkdPbtziqCk2Vqx+AOtcDGTCw5V8U9d46fRIYC
         tSVAvpOegsfUHq9P/U2M3bK4zzjxrSPw7bZHAFiS3b4Ql/Vzyq7yl72dW/x+t9/Am6+a
         +6vb5pCFcECKtV1At+7HNGDfhbb+pUdwsmsPw+RXF2ipPus3X+hS39Hb2L1tleB0UxTa
         3Ekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790769076; x=1791373876;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sPYuwE1/0bF4HTDsvndpoot1c/MYhCPRtMeze3nyqSE=;
        b=GxQ19wzXpLqW5sJbYFSiF2PrSW8WzY/C69569nAyaV6qpiaLcTVGd8beqL67Ir88/+
         eHMTrnWAniEJ+33HWjOMTemtLczCvVqFCWT/QGdedxmkj88LR/dADHLPirmz+QUO2Hug
         KVhlGew9bszJe1tib8o4dwaiVRmjzNOyTPFg9wZnD2H+QV74ih7KakEQHAo2WPKc9fz5
         IhlVg9syFroTHZDnbkLw1Mj0OLdo3ob8zzpe1dalOwOvk60bwkaBTNWum2ctpVGJLgch
         qPa9Fmkmk702tCXcXwXqqmmVDyJpl0PttyH3kvCgwxbBeoD9TJ2XpLSbBhES7zpZcTq2
         EugA==
X-Forwarded-Encrypted: i=1; AKwUvBwtYyKZLzdPJNIkhCywr7ondRT3kyNp9aQV2KPapclmwSe7P5P2UVGX53+uIPCuPM6gyYwIRz/9991mgmk=@vger.kernel.org
X-Gm-Message-State: AFuF++n+1HczJBterT4kWQbItS7Bfmwk03l3cGc26YBTO7l1uzQzkUOk
	TctvtwzdcP5d1MKai+m3M2/WbJMrd5z5Pht9d2fiXiy4I/9byCl4HXBG3CP6wJvBDP7Dd9YQrKT
	ZGc1EnfB4pbWBTw==
X-Received: from wmoj20.prod.google.com ([2002:a05:600c:4854:b0:49f:e58b:90d5])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d0d:b0:49d:17d4:d6ad with SMTP id 5b1f17b1804b1-4a01b112cbemr18408285e9.23.1790769075880;
 Wed, 30 Sep 2026 04:51:15 -0700 (PDT)
Date: Wed, 30 Sep 2026 11:50:40 +0000
In-Reply-To: <arwEiZVRNlrOosFi@gpd4>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929161730.185271-1-jpiecuch@google.com> <20260929161730.185271-3-jpiecuch@google.com>
 <arwEiZVRNlrOosFi@gpd4>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930115044.337291-2-jpiecuch@google.com>
Subject: Re: [PATCH 2/3] sched_ext: Call ops.dequeue() when a task arrives on
 a remote local DSQ
From: Kuba Piecuch <jpiecuch@google.com>
To: Andrea Righi <arighi@nvidia.com>
Cc: Kuba Piecuch <jpiecuch@google.com>, Tejun Heo <tj@kernel.org>, 
	David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>, 
	Emil Tsalapatis <emil@etsalapatis.com>, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrea,

On Tue, Sep 29, 2026 at 08:33:45PM +0200, Andrea Righi wrote:
> Nit: nothing between the top of enqueue_task_scx() and scx_do_enqueue_task()
> looks at p->scx.sticky_cpu, so p->scx.sticky_cpu = -1 could go right after
> reading it into the local variable, as it was before b75aaea24c9f. Same
> behavior, but it also covers the SCX_TASK_QUEUED early exit, which currently
> leaves p->scx.sticky_cpu set and essentially makes the fix a revert of the
> enqueue side of b75aaea24c9f.

Makes sense, done in v2. The clear is right after the local copy is taken,
guarded by "if (sticky_cpu >= 0)" as before b75aaea24c9f.

> Either way:
> 
> Reviewed-by: Andrea Righi <arighi@nvidia.com>

Thanks! I kept your tag in v2. The only other changes to this patch are
the comment and description rewording that Tejun asked for, plus the
7.1.y prerequisite note.

Thanks,
Kuba
