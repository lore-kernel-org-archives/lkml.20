Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2324DE701
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790778462; cv=none; b=s9YYlpqw6RjIiX9abwVuRbGrtdltH0XJPtkhdwf91zk7TEs/z3H8dKtjrVd7Z29dRwtPWkECV8OWiwFXdzi4n1EHP8SVA/cxsI8qxaf/nET3EBrvI6d6uKy31uaOZtsYq6cKoXeW0+BXXPlM8QV9SJ/Vm4YyPeW3n67MLt3Xakw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790778462; c=relaxed/simple;
	bh=N9+/8jM8uuYfmpUXLuAXawQmfXgOP7OdkrV1C2ve3fQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FKGknrd/R9CuChVA4PeQfNPCQFIERIqXzx1ZN7PS/vcBlFR82QnZTx6U+FiLe9Y1zh3KV/Thm2nMsSChC4s5/jc6nE/B23DnBj+nVfxvhtsCUQ4UVbMiTQH9pTvkN5E+9NA23HSr6TemtZc0qBkxwpJnK4IvFdUe9fXjE6J+nP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k8BV9KA8; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k8BV9KA8"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49e6ba4abdfso54464905e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790778447; x=1791383247; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EQ9BCMyvbPVlkBm+1l1uCAim/rVq0Tdr7btP51j5V+c=;
        b=k8BV9KA8y0mFjAAiPAZDnPDgL9pi3scpcu4OmNf0MEHaXFfLb+IHF4RvovmEQSxgfF
         ye7yHR7VGLxt5o/6AjQvJROuDP9pOjkwuo1UURjawOFeY9f6NmmgGhlVi9Jm9kijngg0
         O02JFp6ZU79e+b463J7iVe0NFcqcDwBEmWfZBy+3iI7IXzCRe+4lpq8LhkRcE0CF4at+
         ISOG5EMan5czGOGmRkF8SgQZuTAgXz2DCVrcqBr4f0ZcCDsaaQEuiehsuKczjqn/mRxM
         L6JEp6WyTqwzDsNzCSxIUx2kJtCyIuWJyfWnhobqvwXuW4F8hnc/cQ8cHoPiPoZGV3Ms
         0GjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790778447; x=1791383247;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EQ9BCMyvbPVlkBm+1l1uCAim/rVq0Tdr7btP51j5V+c=;
        b=2jzTGm/gCcEwlNxdAgmXFTIhwB47PFhu6FHjvLIfHtseTEKacdUUc339Wl3+dHAPyI
         o+Yp1VC246uETDp25b+JqjKOKgc2k9sQUJOyuvpjyCWZWRAQb0t79ilCbMdpPziRcS3Q
         gBeJhM1PpCYBu+8cvQmmnJ/leo0VrbagWxmZw2ImxAN5DQhkHQBj8lQuYvMuM3sDu6Ku
         1dtFyrhnz2yzm2ezRP6oql7N9w/CiFwq+Xxkje5mmjMhqnYu3hMy97sSF3VRozfu1trY
         eYJVL2VbjBFrq9hLOsu4gBI8z4rfumX57yDaxSJBQXhQrQqlFsCe9Dff5xP2HnHo08iA
         rUHA==
X-Forwarded-Encrypted: i=1; AKwUvBysHsBk6qpuMO1IoVA1f1vWNFoW/rE7GhkJVO9s9/W+V2490qAwlzMfAKqxU1rV5ugUrGCfIRdm8r2NGxU=@vger.kernel.org
X-Gm-Message-State: AFuF++n9F4cMdEg/4Z9YZBjrWvjqtKz7c8LUjpgkyl/tkuLrhs9Qwes6
	Z+4/3LPM+TEv73s9ed+J4LW71DTUCIhiZSltDo/XFJtC8f867IHmUiGObG2v3HCqJJfNTq12Abm
	Oyo+0FxhvHChD0A==
X-Received: from wmde11.prod.google.com ([2002:a05:600c:108b:b0:4a0:1d42:115f])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c3cd:10b0:49f:bd3c:bc24 with SMTP id 5b1f17b1804b1-4a01b131337mr21208985e9.31.1790778447237;
 Wed, 30 Sep 2026 07:27:27 -0700 (PDT)
Date: Wed, 30 Sep 2026 14:27:04 +0000
In-Reply-To: <ar0Ua_zkwY7P22iI@gpd4>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930114725.331370-1-jpiecuch@google.com> <20260930114725.331370-3-jpiecuch@google.com>
 <ar0Ua_zkwY7P22iI@gpd4>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930142706.560608-1-jpiecuch@google.com>
Subject: Re: [PATCH v2 2/2] selftests/sched_ext: Add a test for ops.dequeue()
 on remote local DSQ moves
From: Kuba Piecuch <jpiecuch@google.com>
To: Andrea Righi <arighi@nvidia.com>
Cc: Kuba Piecuch <jpiecuch@google.com>, Tejun Heo <tj@kernel.org>, 
	David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>, 
	Emil Tsalapatis <emil@etsalapatis.com>, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrea,

On Wed, Sep 30, 2026 at 03:53:47PM +0200, Andrea Righi wrote:
> If there are MAX_DISPATCH_POPS or more stale entries in front of a valid one, we
> return without dispatching anything and the CPU goes idle. It's quite unlikely,
> but maybe we could re-kick this CPU when the loop runs out of pops while the
> queue is still non-empty to make the test a bit more robust?

Good idea. v3 uses bpf_map_peek_elem() to check the queue and kicks the CPU
if the queue is not empty.

> Nit: maybe reset enqueue_seq as well?

Done.

> Nit: uei isn't reset between scenarios, so in theory this check in the
> second scenario could pass using the exit record of the first one. So maybe we
> should add:
> 
>     memset(&skel->data->uei, 0, sizeof(skel->data->uei));

Good catch, done.

> Reviewed-by: Andrea Righi <arighi@nvidia.com>

Thanks for the review! I've added your tag in v3.

Thanks,
Kuba
