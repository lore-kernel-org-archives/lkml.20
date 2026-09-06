Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2881E30F7EA
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 01:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788659353; cv=none; b=D9GcGMi6nusgeza0sNf6VhDvOhA69LqHG0yiwxEKM92n/EJkrhGMh48xHkwRjUb/J5ae9GeWNQ9zwD+b4F2JqSeFUbvUokt6d8+7USaQWejAb7fPSP2gEXYxB9m1L12gVtcbh2QCKiyTs5/gyW+xE9/nyNrKHor3IoYxaxcigC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788659353; c=relaxed/simple;
	bh=lx+vO0k0LbNDO+b65TwoNgF+3n+dJnxkzqMSInh04No=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WRAZAHHnErOK0eGD/Mn9MGkRV+Xmkmh6VbNu1mMiGwtw3oBJB3AEmoLLpRxBmfNiOMpCT3Vmc6ddq9tKdHlwlizyBM2Y76KAUcNg08ffbt1PEAGtZA0vovkVUSXDmQbC5jS2urKKDOhqIPZfRQizXfJhew67aHiA69EgegW+AlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d0qM90AO; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0qM90AO"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3969e82ff8fso2451825a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 18:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788659351; x=1789264151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lx+vO0k0LbNDO+b65TwoNgF+3n+dJnxkzqMSInh04No=;
        b=d0qM90AOhChEvNdjuXgBWj7OYd2OKsaj3jxL+Xr542d0m8KYpdEs7Bs7BWO3qxwFrf
         0fMdK7/0hrz413aeLQCqkxtjxcR8171BR55tDawwCtf84/fhWy4vLzvoE42mcI98tmXB
         4O3RHftXsNgE/7TcGZN498VUscSx6fCZu193AXnR8IhamZp/u85IDrmBRIP4Q6zZ0lOz
         rvJ3dt2GurAs8p9dENAepILEerP1pJooWlSE07xzZBo+vU5CkFxfdV5hcfP/RrPzV6dX
         h0T4bTjxWoOrKuSX669lSdEsyEMPe6Wro6PWLUJoFx2SjJH1EwKeNEBqHFeHuFFcC9PP
         sx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788659351; x=1789264151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lx+vO0k0LbNDO+b65TwoNgF+3n+dJnxkzqMSInh04No=;
        b=XnThT3wgAt2iusf1wJFpRQaEIffVCvoAZN/4C2s58WiZ3o8eSGfFqViYfu/ryXfw7Z
         eo7dgFVtgxrcqUREuibcNHEop3qeVsLMMwpRfDKA4NsD/gJMdthrmrZz5xp7RHQJ0ojA
         xc++YaNDXSqqo2Oj+bxk4fB+gsEiZ5G9YRm3IQxrUgKU4ZIdr29Mf9lIPjHVGRu13ztw
         NcfN0DgxXlWvm9yx5GSMRUsDQwVZShDgXZQbr+9gdvF7rHH9TreRAueyJ7zFQZlVEkAT
         GSJJkYP4Nf0wxobtfx3KmLmmE/4gxaOovIyU5XebMWixY5PFIDSVSuq2isrujBNvl0ir
         5EZQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6JsO2k6VQ2w7mlT1pOj0mQNfM3CNWvcbX9gIwyT6FopxrB9/DhAnNeBxWr79nxrzrigkZUYQtiu9zvfY=@vger.kernel.org
X-Gm-Message-State: AFuF++mnC32no5rlwU0lCFBQGUfETgGXrPa5cjrTt+BVgwSIRo3XbNOZ
	6roArrbQf2FLrXCdhGWERnpVhAfxQXcnu/yv1bpwXZ4BTod6E2L/eCrP787UCA==
X-Gm-Gg: AYBFou3PDpJi0KgS3iLjEyyW8zvY+Bzwl5a8cOKpDEj2OaWWGSsllSNzHF7ZrZEhF2M
	nxu2Jq9AYNFReElN46L8o1b2hepXdzA1+uAB4XK6Zk89KoxTnFi0qQK3f8uT0xsAzido45W7OGP
	tHr+CuHDZsc7LLG3Ci9TW1PVb2vYtscEI4snyeVfSxgEMU9u8DiazyJJlL0D8kdYOiZq3dmpZV9
	9cYrZigQV5g9Y9QPcE7/xR9w8uin2a6n998eibGS1F6bZqmd8LdMPH4wHRlJrDiOXVL4lgHzlDX
	B4JJmbyikGyahFn4hQ83utzrKtwIwpdgiEGRz5aIwdtCnSn8UqSmYNREwRjmI0BQOCFGwofzU8q
	c1V0w7Zwv35sL34a33pKaViJvJr8tqBQQ13TdqIDJmWrbWlUirZUIZwE58sD0ZH2gzr4eT7mljs
	y4SPhvQtoUdqrFMCFLks7DyCFPVp4kCZsaCQCVkOSzPU1cv5lI1olUzjozFJiMiCP/45/3m/1aP
	w==
X-Received: by 2002:a17:90b:3b46:b0:398:dcfe:967a with SMTP id 98e67ed59e1d1-39b2620a2ecmr22097793a91.17.1788659351350;
        Sat, 05 Sep 2026 18:49:11 -0700 (PDT)
Received: from localhost ([220.196.228.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260f64ecsm12668945a91.8.2026.09.05.18.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 18:49:11 -0700 (PDT)
From: Liang Hao <haohlliang@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] timers: Check timer_pending() before reading bucket index
Date: Sun,  6 Sep 2026 09:49:08 +0800
Message-ID: <20260906014908.7278-1-haohlliang@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <875x0j5tdm.ffs@fw13>
References: <875x0j5tdm.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Sep 05 2026 at 22:35, Thomas Gleixner wrote:
> Which problem is actually solved by this?

None that shows up as a bug. The index is never used when the
timer is not queued; I only reordered the checks. I'll drop it.

Thanks,
Liang Hao
