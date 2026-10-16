Received: from mta0.migadu.com (out-245.mta0.migadu.com [91.218.175.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3F64E50B9
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792164595; cv=none; b=A5XpwJ6Vjvr+/1nP/ss0HZR25ocxvZ2Roagwr/agbzOh5EGs8cAIebm5rVl9D2oQ6avQYm28wLiIyoQdfE3wXwgxyXxLWsGcIpLNzVZuSlKQS4GQBqIObSdOR/335+Nj29EW5w9mjTINhJ6S0ZwUdUGpmw/JmGUAD07lf4xtRkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792164595; c=relaxed/simple;
	bh=OXcwsbUzBCV1qMJEwdgg0XN927gF5DfKWZ+QuW4wci8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h+61Tc1F8XNvB26ERTexO7DPqNuwdOQW+3LJTSX0hk5FgNLLt0i7AuHjhr7CNFTH8ybGe7khT+jXxtNgCvpHdpuvbk00tU7C0TyitAoHKSIPTioJJJBTaZrO6P8B+MOFQXBpqGPdTV+3fXlu2biHZVWBUh+PPNjM/eL5Wv8+qOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca; spf=pass smtp.mailfrom=justthetip.ca; dkim=pass (2048-bit key) header.d=justthetip.ca header.i=@justthetip.ca header.b=h4cgrdHU; arc=none smtp.client-ip=91.218.175.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=justthetip.ca header.i=@justthetip.ca header.b="h4cgrdHU"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OXcwsbUzBCV1qMJEwdgg0XN927gF5DfKWZ+QuW4wci8=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792164589; v=1; x=1792769389;
 b=h4cgrdHUe0mvUvY+012fKlkrV6lmLHtodoiBs8mW1pausRX4u/keCIB/zQ4t3zafzDYPHgJW
 pamCKOIP3N2KkpDMVTlYUYfXih9ziG+Af+WPScVlZ01bHjs1vKQU9uSF7+U9PzKsc05z8AZzdGB
 Q3MbGqkusOgxHLsUx2bKfyZED7YxwfE5YImMRPcbRvmBlfAgOfwZdito5bMCXjquzKPWbb5c4z9
 bFNJ8yM3Bt4qa+/9fRQfqF0/0GSGq6G5cmX9LWVP5vvyoYc3bt9IbybL8/eDUcGK+BVMETBxFFZ
 fytiN4lmdf/Tp3OJXaTV7wFAHeuVu2RYaQMV3+dPP6KPQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6621dcbd1f3090c6;
	Fri, 16 Oct 2026 15:29:49 +0000
X-Mizu-Trace-ID: 6621dcbd1f3090c6
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: sashiko-bot@kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/panic: Fix kmsg screen hang on a long log line
Date: Fri, 16 Oct 2026 08:29:46 -0700
Message-ID: <20261016152946.130384-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <sashiko-outbox-173828@kernel.org>
References: <20261016052722.60051-1-lucid_duck@justthetip.ca> <sashiko-outbox-173828@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Oct 16, 2026 at 05:39:51AM +0000, sashiko-bot@kernel.org wrote:
> Does this code underflow the pointer arithmetic if kmsg_len is 1?

Yes, when a chunk holds only an empty line. The pointer is then only
compared, never read, and nothing is drawn.

> Does the strict inequality prematurely terminate parsing? It appears it
> would silently drop 1-char lines.

Yes, when the one character line is the first in a chunk. Anywhere else
it is drawn.

> It also seems to skip the first log line of every kmsg dump chunk,
> because the loop stops before processing when start reaches kmsg_buf.

No, a normal first line is drawn.

Both real cases need printk timestamps off, and both also happen without
this patch. QEMU on drm-misc-fixes, timestamps off, 10 runs each, with
and without this patch:

  normal line at a chunk start         drawn
  one character line at a chunk start  not drawn
  one character line mid chunk         drawn
  chunk of only an empty line          pointer one before the buffer,
                                       nothing drawn

With timestamps on, the one character line was drawn and no chunk held
only an empty line. Every run rebooted.

Devin
