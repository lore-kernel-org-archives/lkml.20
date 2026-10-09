Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217334718E7
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791529666; cv=none; b=j82v5ztp7iC0OnZs83v4xcvC5IUJ4P1c6kRardTO0gympQLl90BwtPuG0UVQSBoQsonZo+nTH6z00XDVqDiNzFHIxDnBvo/EeKKiWlDp6dXWf+tV+QEWCIoCVZCqyefRmXVIr2B6iss01YZhSG+uQ747E3TgTiS6HNhlzv/lixc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791529666; c=relaxed/simple;
	bh=AOBfyMObxsPKe5555MA7X0XhuhbKoT8tcSGCgf4g340=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jj4bNZkS6kplieStn1vq53ZmDSBgXqcFD/uKoEj7BMGPPvOrZUSLKHqS4pGbwwCyS6pjdgdx7C5ZaKXxR1rQdpGJFoOvrS8tCEjed/zO3dLc5lA9POdj2rHKmJKqdGbx4j5+GVXPFAhI/vrxnVD/QshMU2N+WhytZYeMxTy4qhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B0FazBUM; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B0FazBUM"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso54364165e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791529663; x=1792134463; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sKKm9SmEIl/bnNoeHMWb5gysBaP9kkRYpBJirexaJDo=;
        b=B0FazBUMi25Nrrx2P3zFQv2Ew0+HrurV02ZxT0ILniaokSjQwT9spny6pLPlp1arCQ
         1nAdmH3V1brYpLPo7/AztGbTYqYoJJgWo98R3F97yxJ4sq8ZBEGYHgri/atjcF2d6pkI
         jbLcBH9o3tVEXeAtKs1O/scczwwJxtXZS/4/mls0BYyO8yOsEFwj5Kijs9eJehnAmisA
         iA+GKPcr1x1HpVpwtgwfz5NeI+GgRU+dMy9ucDUovhkXoMK+uXY4w6cFkRYrzzAzLSUg
         ca2YmFMruULHowX/r57yL5GemGkCyKceU0f55382ZLGYbx2V3I9+xMDTRJCZAJjnrGlp
         Q0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791529663; x=1792134463;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sKKm9SmEIl/bnNoeHMWb5gysBaP9kkRYpBJirexaJDo=;
        b=ICuMR68C1ussFYrwm61Jig+y+lwT8QDFD24FsHVbWCWKq+1KfRYuoCgkP8nTZ4R/G8
         u+r+4AjRvU0PSgyrsOje2IedUqQa/tm3N4hcC60lg4fqMOFxCOsZx+oabkHjtTGbsnlj
         AE06HKSKbCUdiptfvEFv5gKCqZwiLBqyBBaotpU21wGWulzEjsHBdJs2yMdiue4X2H1C
         DnW2g7tfImWR4QCXgrS5sJTwP9NLRQVRu+Pgt7FdgDnKAeANcKub/JYODfTR41EIZFvK
         XghYpCzL5S8hAsXZkjA9SefNVHrOEbx4yUw5+pbKsrRryYURUSIHl73MXXLrA2CWpKRe
         7Yag==
X-Forwarded-Encrypted: i=1; AKwUvBxeDKXCpf4SZSsPLeiPtUFQrA136qXr8r1xKAw2lj64GPqfCMo8mnyx7xPGLIGJ8gfiyndyyARZHquc8uE=@vger.kernel.org
X-Gm-Message-State: AFuF++l4dlJx7EZMfAJLag+fXqhTvVnACsUH6gBlZj3FK1s2lGeUcwT5
	jO10rIk0zgclUZHoPSRkSHswoZ+Ao4mTTVVr+P/1fiL3jKpvTUBjq1x0
X-Gm-Gg: AYBFou3Vnmse5pPnWyr4msvjnYakZNTPq9xDZFAnV19Ha0MRLBlzFae6/JmEFir8FX0
	Z9thByV/Jl5V6m6WK+5VUQwYp0XuZfJwuCiibC8MeyrdAUyit/9ON9lCu/GqIi+hAypN/f9+9CL
	bnR2/t8cZFC2YtlIe0n5kgtOuY0rT4X0VR/sLt6F2hvI9zeh7Do005iDtF0EhIgFqX5qOn19C51
	mFZFzKVKK2xJV31f7kwRdwwDLc4p0HIEZmWmIR60HZ88ilFx3iatnkxD/AOZtF+HmaLRaS++hiD
	YfRgMETo7ufXlKYSDH0kRHI75PMF6SD9p7j8j6ivUS2JIOQfj5x5eJ0ADXh7XWNOl/k/nsTNsRc
	fjPw7qE0s5wgBr18GMiMvl5Xufo7BF/NI1/r6LWZCalHxHr4+qoW5azMtHAOlInKjELjc4nu7Zh
	n9qt5cU+irFRVkO34ER5+fzahAZOmQ2QgvGPLtJNaJ8TfoebtogsLFUiKCChXdRIPP5P0LTd2db
	Yt7JFGIURgWsvkao9OEJzJzpZEoOKK8X87iHVrU9VKWU/OqQP+ll7mUXws/20frS6p3Fk29B9C2
	Xh7DmhIdVD3nIWcQOQcM/sIawaCI0+YCa2bKfIQ+ODaRf0lgW6jL8yOBk29ET5olynAQyTYPSTa
	ZrMIeRS3fwQ==
X-Received: by 2002:a05:600c:8708:b0:4a1:7b05:3a6d with SMTP id 5b1f17b1804b1-4a18e49881amr14849175e9.8.1791529663117;
        Fri, 09 Oct 2026 00:07:43 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a128-aa01-297a-7094-853e-a20c.310.pool.telefonica.de. [2a02:3100:a128:aa01:297a:7094:853e:a20c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2caf4sm41656205e9.10.2026.10.09.00.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:07:42 -0700 (PDT)
Date: Fri, 9 Oct 2026 09:07:41 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Harry Yoo <harry@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Muchun Song <muchun.song@linux.dev>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Alexei Starovoitov <ast@kernel.org>, cgroups@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH 1/2] mm/slub: preserve no-lock freeing after memcg charge
 failure
Message-ID: <asiSUpAYYU8Od4HM@gmail.com>
References: <20261001044056.75079-1-kmehltretter@gmail.com>
 <20261001044056.75079-2-kmehltretter@gmail.com>
 <asaAwg1KeZoEYd4K@thinkpad>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asaAwg1KeZoEYd4K@thinkpad>

On Wed, Oct 07, 2026 at 07:40:17PM +0100, Harry Yoo wrote:
> > 
> > Use kfree_nolock() when the allocation flags disallow spinning.  This
> > keeps the SLUB object rollback on the no-lock free path.  The failed
> > allocation continues to return NULL.
> 
> When this happens, the object is not charged by memcg.
> 
> The kernel should not invoke memcg_slab_free_hook() (called by
> kfree_nolock()) for a slab object that is not charged by memcg.
> 

Agreed. I'll avoid the memcg free hook on charge abort.

One question: kfree_nolock() currently skips init_on_free, while the
existing charge-abort path honors it. Was that intentional? I couldn't
find it discussed in the introduction threads.

If kfree_nolock() should honor init_on_free, I'll include that fix as
the first patch in the revised series. The charge-abort fix will then
reuse the shared initialization helper.

Karl
