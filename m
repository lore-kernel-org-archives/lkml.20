Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E788144064B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788193084; cv=none; b=C0jYAOsFneu0ZvfIxtNCiwYsatxqu2b9wYzECtd4XOiMSGK0kZshOHji9kRjS9NA6tWMUH8Xt5usOixjZaqBWD5vy1NwnNHUyj/AdPLLCW9qj+HpRFLH+d9OVYhvT+o80yBKP1eH/8QeqSZmucbUp4tIIigUxW1z5NWYoWZr86c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788193084; c=relaxed/simple;
	bh=4wASPUEGd3KOv6Fdubi246q8cZj4P8D3ytyUATn9DWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ufOzuHIRP1DPopNLxUpQZ4K5IsRxO+CU4MImJ32jvchRUjuyEzatFszdilQLu0c1gPknYn3b9B3m0s9D/AK9cFrpzmG69A5/xz33RS1zqLfrmtO0i+kT/4Q7tQkSGsrJpySsXqkLWnJNAmlyPdj+GiYbLzXRz8R3BT+aUHbpXZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VkpndvH/; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VkpndvH/"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ca80d708489so22873a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788193082; x=1788797882; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4wASPUEGd3KOv6Fdubi246q8cZj4P8D3ytyUATn9DWg=;
        b=VkpndvH/Pur+W3PLHerOcOQw6WQRGw1qU/YKC/WHKR//2IVxngtKNmWKj245wyAJuq
         qIrRDYBOvPi3LMlHrzN4YdtuLAX3WjPp0rwnj13wRHO2yJjA4bHh5fJXujsyfkKUvPcL
         jwyTHXr+4+2mcLCOWPAaNNQQxN267is3TgmrP18mkzjGsGdo6sI9hkdWYovshUMZTKJQ
         HH2wSPwsc5YrFBmzIcbYgwl2g2RdYm6rxcOtlMpHFfYr4/r4mNH5y6kHo9V+2kVdrHgK
         xL2iCD68wkU3arxpwVXA5fLm56SVxGCOcKrHQtcQD1ssb6j6qKTiaRlD6CjodxNgE1W0
         WEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788193082; x=1788797882;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4wASPUEGd3KOv6Fdubi246q8cZj4P8D3ytyUATn9DWg=;
        b=KOo6IAJoCLIVfyWYVARr4ju+HrEouIMjrOcpaIZX5R3YYuSEkRgT0bBtMgw/Fy+2vk
         0QnfvIcMi/4RKcPUB6SBgUsY6pdi/65ufEcQUnR2ybrLjTFGJhRjESQ/I59hSeO8stBu
         GMfQDU6pvxNsJAYcj9LrajccZagl6hhN8q9PGHZvK/bjynsE2HGDK5Yii+HoMHYHyFhq
         0CvASbnqAybkqINl/sLAjAGFWVwKexYa/X1eOU5rFmx68G8v6XnoVXq7RkGvEGzI4NcN
         k6nZ/6V5Sg1lxBh+5t87/76JST1Lo4sYi73uqER2CowshIzoKU8p2ZepCjEzrr8OQPoA
         efSw==
X-Forwarded-Encrypted: i=1; AKwUvBwGSzJwVcnOO/5t5YAQfO52RoES8Ram12N+18ghgpHDgHYG8MT5jw+wgCf2Q7j/YXjOSMaTjyFm7WrSPNM=@vger.kernel.org
X-Gm-Message-State: AFuF++nKhiE/6MkEwIHCfKi8cCoZeLXc3ICCR57BqQ9sLJU9t6cend34
	W1wX4Tpwy6wK3wKr1P7RKkH4fSWEGI79KRmQXe3eerFzb65gvl43SIgq
X-Gm-Gg: AYBFou3+PJkUTztHr3kC1oH6puGOP4t9X4qFbZr17vnLmwe9+bk1BT4kCVXLvCTymuX
	cNRHk1UE9+ND05yBV66LUPOFQPQ6Qz2G+kasb8YIYKj1/c1l/in8im2qW6V96Lly35JUS/9CmSH
	abOF1jIl607kxur1qExcD1UOUmR3lPTKcN5gBudutMyCkNeUwZqxNrdOYBQRV9p55vG8v3FvQ36
	bRC99kJBcuwMIfSPHC+vpLGi1wN6u9ReOaVGcH9bWGcEcc1yXY3mrt5/oCbXBSai4yNTccIc+8n
	OprxagOu6cRJsEQl97uSGaRrakyKbYY/n4FOHuCJSZFIt+36PRuzKs/GOGLplUjaW0hLQDMkWRH
	B1u3k6j3gCAR3sBuibvyYIe4n0tApVq5oVqFSMH0p8H+ic24bczRYGaJw1ghA4X9T2t0RKsMDtp
	dceksFfdMRmLoViIF+wbY1KgyFd/nMoCD5suPxo321jaHTxEYhq94zEcjK/nTHljJhQr1suI/YV
	tYYNE3A
X-Received: by 2002:a17:90b:47:b0:384:927f:3db9 with SMTP id 98e67ed59e1d1-398da5981f2mr7582035a91.1.1788193081897;
        Mon, 31 Aug 2026 09:18:01 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:21dc:72d0:a033:17f7:ad44:4f35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-398a2d45bd0sm5115099a91.0.2026.08.31.09.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 09:18:00 -0700 (PDT)
From: ThangNN99 <ngocthang2710.1999@gmail.com>
To: Vlastimil Babka <vbabka@kernel.org>
Cc: Harry Yoo <harry@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	ThangNN99 <ngocthang2710.1999@gmail.com>
Subject: Re: [PATCH] mm/slab: don't use kfree_rcu_sheaf() on PREEMPT_RT again
Date: Mon, 31 Aug 2026 23:17:53 +0700
Message-ID: <20260831161753.7390-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <faac65a7-5c83-4a00-8334-ed26c45a8201@kernel.org>
References: <faac65a7-5c83-4a00-8334-ed26c45a8201@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks Vlastimil, this matches what I found and is functionally the
same fix I had in my v3. I built this exact logic (skip
kfree_rcu_sheaf() under CONFIG_PREEMPT_RT in kvfree_call_rcu(), same
dead-code removal in kfree_rcu_sheaf()) against commit 08dbfad3f504
with the syzbot .config and reproduced the original splat with
syzbot's C repro (writing "off" to
/sys/devices/system/cpu/smt/control to trigger the
__balance_push_cpu_stop -> select_fallback_rq ->
cpuset_cpus_allowed_fallback -> set_cpus_allowed_force ->
kvfree_call_rcu chain) — confirmed the exact same lockdep report as
syzbot, then rebuilt with the fix and confirmed the splat no longer
appears while the same code path still executes.

Feel free to add:

Tested-by: ThangNN99 <ngocthang2710.1999@gmail.com>

Thanks for picking this up and for the pi_lock/waitlock explanation,
that's a much more precise description than what I had.

ThangNN99
