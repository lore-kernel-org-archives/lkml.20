Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AFF4E0B94
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790717143; cv=none; b=W5opqBOzwH1V7ZkPZc2IfDLaC5RRS2kdncJucNwOyhvcOiIsjRHky4nCN9MxpgADOLhAxHA+5/+Fli1TMo9/0glNMOE7jU2g/m651KDUPnYqI69WyUwzB6bo0AYI+G7Y+tKaav39vDTeUxsq4dRi43DfJ/09yzp24kaayvbzG/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790717143; c=relaxed/simple;
	bh=Tjs7FwpG8SBJ1qS8KHelfEMZVZQILD7n6hgU4O1XLxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I49pA31B3zYZm+aIL0uAgg7YsCULUOMZrKtpI+O1z/GxqmpXYl9aBCIQL1ggRVNmt5/dQ+SULlUz08HI+GzFlIrPUy2UIpgezQeiHgCXkgghvYHq7+1BAQ7aghspFvhNL987vmP68PSkfZvzTU8vvjuDmoLvw1zzL4nWfeiXm8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SBf5aJz2; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBf5aJz2"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ff9642c57so6413885e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790717140; x=1791321940; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o4P77awGw7CnoZ9LloNVfZMxMXD8dRiBGwj2EdNOf8w=;
        b=SBf5aJz2wIqBNpBzuwi0LLileKtRLyJ/6uTundHZrL1VmbEcGKSk0ZCVaCepin1Q0E
         KE1ojVSjbk2SxsH6cXrFB4cY4EE7tzA7YgIMD46gfksKxs49LswTa0PyUV1VoeRXmezM
         4VMMiSGX6o/iwe5TqoNRhMUtLghfkC8Y5z2OLr5n3T4L5mtB33SyRQnuedtfe4qRODm/
         jgUain/A9wrx6ppvA/y35rouiXWBqNxPKige9IQBk0fA1M/SX7KMPAzDZPYHv0+Zu1o9
         teOmKrs7uyL0pbrMe97oYvOAFof0IgHj/OzGOO46ETWak/8eznfyACEttFPnoRqGOxRB
         7Rzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790717140; x=1791321940;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o4P77awGw7CnoZ9LloNVfZMxMXD8dRiBGwj2EdNOf8w=;
        b=Yn1CRLsUPP3xuqU/ojw4ejg5bJNMUEz15wfG+uCIDWm/1bq4Gd0+w2i1Kg65I/9K6E
         Ftv9k39va/YKapZnu3dDwT5jONocOEMTKWKoFIQY8Fb6WbyNqOdZA8UrPWRaHXolay9w
         KrTbxWcoEFMHKwADMVnzrDHhckfTjmgEOAMRi5l8WWBL6OpDCxMISTZi+u5K3DaLzW4J
         prm4xj0uZRZkYeON3lbI+mbLZHfDDMv/qamHE47O0eShYwb+kDt9BG4+LA42lsJplaL4
         jcKur2mUXJcaRG5D6+NQkx9pZV/NJRp64CKia/5YRtejL73j9auSwTPiK7Q4ZeRxtey8
         qOgA==
X-Forwarded-Encrypted: i=1; AKwUvBzJfddrTw1XZOnry6S+nR9c0UYz/zwbKcddxi+9oiqYIn/qz7mAuIhNlWEQYMKdYlMGYco6Nh0ZGLE68s8=@vger.kernel.org
X-Gm-Message-State: AFuF++nlF2ZVZ4O01r9unoNfMefuehhBJyp/PIOoullGXzS4aB4B9XOY
	YAGHHhCbEUAu5OnBwyhpXgdNM72VOyqOWNlzYNw4YNlvtRsmFcRPXCOM
X-Gm-Gg: AYBFou2ygA3iB1NY/C+i05dTtbC55xP8upBX56BhpIBXR2K+EVMUcIGAXMpt+m4d7TL
	jXM83V0UidTwuUbIGWC4r4jmm03It07rYNACiUKzSgpwSyowIMf7PTUKPmofnwIpsK50XBWyK4E
	5LW/di5PtWPPOm3n2TtuaOolb92efXcAh+8WW2AG0Sdi42zNyLKXDfV5Q3DuehDrhTiMwTyqnNz
	sv/J/irEV0uPwvrLL54+Jc0Hvr6TIBZO/Cr0Dd3gfu0MTDU2wNc1Nyh5lhRyYTo1XT0EMNgJuqt
	wqT2R08jE3hzn1GiUcdTyC6peyEV6Ajt4E4Yv5HsrmS0xu4IMeU99GBjtWQ0/p3YRNGMXz5rDp8
	opQZrQjXcvLa45KZXegnCtRcsRn0CIN6iicnNW7jTGv+mBhNl9dVW15h07FeiyCrGCDkN8N/TXH
	ZawZ80cfcobS0HzGbvdu41t2mQQFx3b+4RQ/xk2YjhkQBjM2aPy84CRKAtAEGIzDHgqEuB85GRm
	37i0soAc1zL7N95k1zWLYpv6JGOtz2pMbEkXLukfc0QlCeDnwZ1sgk+DH0mTdnIxErmnYgY2IRU
	kHW4UjmVWq47atefaaqQyhpzA+U6VJr9Mphnf5vzcMHiY+TCdyNkLWKNeGJn1S/7sQf0p6EPfbs
	=
X-Received: by 2002:a05:600c:c176:b0:49f:fbad:29ae with SMTP id 5b1f17b1804b1-4a015142604mr5797515e9.17.1790717139884;
        Tue, 29 Sep 2026 14:25:39 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-9c32-f801-9d9d-c89f-9fb1-4ec2.310.pool.telefonica.de. [2a02:3100:9c32:f801:9d9d:c89f:9fb1:4ec2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfecb39sm118395395e9.7.2026.09.29.14.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 14:25:39 -0700 (PDT)
Date: Tue, 29 Sep 2026 23:25:37 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Boqun Feng <boqun@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Alexander Potapenko <glider@google.com>, 
	Marco Elver <elver@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Bradley Morgan <brads@mainlining.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v4] softirq: Preserve interrupt context during IRQ exit
Message-ID: <arwsK1dOHVB5KZjD@gmail.com>
References: <20260926143505.66024-1-kmehltretter@gmail.com>
 <20260928082402.1iCSzDzY@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928082402.1iCSzDzY@linutronix.de>

On Mon, Sep 28, 2026 at 10:24:02AM +0100, Sebastian Andrzej Siewior wrote:
> could you please do
> 	(in_nmi() | hardirq_count()) == HARDIRQ_OFFSET)
> instead? This will merge NMI check into the hardirq check, dropping one
> conditional jump away.
> 

Hello Sebastian,

Good catch. With GCC it removes one conditional branch on x86-64, arm64
and arm32. On x86-64 it also uses three fewer instructions.

I will send this tweaked version soon.

Thanks for the review!

Karl
