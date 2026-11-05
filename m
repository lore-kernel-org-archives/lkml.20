Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793897046;
	b=ZcrcKjym4uQEbZSM9zo41C1U5jF+qycrskvT/r+SDtJK0Rsb7gcBC3i/xRel4GmgR76n
	 PHVSWKxjMNHFYeyYfAS1qiuwbrBXtGFbRAt+S55//hFAUSKLo9PDvtp67dDulqiat62m4
	 yuA3qms/VfY6P3ie2i7ZKE2JAtBfZDfoyrbmeNWQFghN4VHXm8jT5zCzqpb2IBUcuAnG+
	 6iPGFCHgNk9Qg/cz689SJTn3Xa+YW5LpC1KNl7bfP7U+simM3ChDHP+BQHVHQxBaYZF3e
	 azJQE8HlzLASgAiMrokFy+ksXtHnYrf3IFCB9zMrdt3jLbTWqW6JBtT/py9/e5XgSpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793897046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Xa99gepi22SogAWQPeAgc0EROoR0OAvZegPBJ3DWXuQ=;
	b=sTpAGckzrYfUWSRv7hpMqVgGyQnyav7fV1sHaTJCYvPQ3jR+oqeeBDP1p0QiYnFW9xE5
	 zUBii1AB9VE1iVRdWhrBppxkcNJ/sUBbGLqONTjpvMxNNShGGd1u1gZ06RCLKmYDPRL0b
	 QPN5CGqMS1QblCddmhsKmQXfuZS+y37yPg43hGdZ1b0dsHmW2qdLo9AILo5zpLrhx7hE0
	 lwLrkslMl9jiBWPb8hrC0yCd4noEzhz6t5IRxyDu6Znwqxvz+oKoHL3Eqf6JKWClpDVkj
	 1pfrtpfgyEnHF31BpkiBuf+X6xFgBIQ5JkbdR+AqBVbX/TyZGyRhx9kXCiZ4/Llipag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x0a4hyuZ;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2972D606A335
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:44:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2972D606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x0a4hyuZ
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e4831c028so1913582f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793897044; x=1794501844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xa99gepi22SogAWQPeAgc0EROoR0OAvZegPBJ3DWXuQ=;
        b=x0a4hyuZR9bNPDK9sTp8JRC5Ve2YkPdwkHoycWtq0ppzB1zEDNW19cJ21e3yDVmmEt
         KPk355x58nrqTShOgSKA4QiZgEwGa9DqNwh7dlSHDIMwx6CPOY6CMn+zsgGKeLwCuJmk
         WAVlMYcQXgsb9r5/E60ot47kzTDhL7fG5KDezw4ldukrLDqj3kW4FPsWAvMoRAeikQwL
         uLtK/ljaMtp51WBPY+FRO8VSTHxQuLwIdLN2x+lu5E0iCsWJOqdc6m0/Idj7X0lc37Ng
         lE+IgGKz8xuUF2Zg5zkcXL9Hue6rqEcCs6uixr6rLYCeHXlXxfcsMxkDpA+Kty/tDx60
         TyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793897044; x=1794501844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xa99gepi22SogAWQPeAgc0EROoR0OAvZegPBJ3DWXuQ=;
        b=Z/90xr8Y9JcQwtwfkDI4Tdgl7TZ736PtUAvz9RYqUnVpVZEKZBFP7XUWhKGq6FXN1K
         R42AuMWxKpForfvqX+Ef56DYN9i4mGK1tB52o8AKwrryKo/G5fWBnTD0To+OmB+rwhYo
         kVM2Rn8sROMadPaYbJ29rn+it3HWcAO7cHWjawkmrFbCwWECwNaiDGkIoUsWrfMv3aX/
         mZrQSPJV048pQ+XMgmyQN9Wy0Ze4SYm+bKbqSITFXxfBr2yfV4XL/wwBBFp+blZUI5ur
         1VLWanpIe4QbTgNLlSFPkLBHLyFScU7Ojy19sE4xSNDwg8nAKS9kiauCNgwiFBlLMy7Y
         +BPQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2pjaPWElYtSe1BVShHjYhl4kEICHKXW8Y9zgWOZROeEtno7/cTo60iX3yeF5yVIipiIBQ0UBIGTqcxeE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/94gp17Xfyn9ryzKy8jfoq4aeftb/Z2k1opREkng6/BxRjIj7T
	8Ekz3k/zMb2T69l3C4jG8Qo+C3MqWal3WENY/dvUAJZPDBTXnURof1GM
X-Gm-Gg: AYBFou3alvlxtiaQtyJYzQ8/eM6/PNgaeVSBNPZ8UyDLi5S5cwxeH7Vo0uAMbEGX2lV
	lSScch/XpS6bycLchuSOn5DYN+h1M950rGUiEUHvz2oto4jdvxUKJI6XD3C2q+P8qQ0W2eG96sp
	aGPnGgjFek3JhqYGkhw+m7tH0jaLMoZHvYTrUnGAmGjOVi0cOSEIeSkvnefQBBZ3MLrwQQpDJwF
	NmVUFcgVgABZrRj94+qAPZMyw6HrdGWVUZ1zpqu3kbwphWatEprYB/ZzWGDUuPBo9fU5kJAuZZW
	vJsPA2FyDy49wFqHCYMQyRGGff5WpDn3wwj16XomVPfyF1CDOZ0oBUV3PDnrSRYolPYic+jxHpg
	wpTOLTtEJ8SdV9R338o8Lnj15XFIxsnD0K0DGp6qehKeHEq4FfxVeaZv3OmLRHYF5tbowoIlYY9
	aX9er638nIe3KWnUHRCiAtCQJG8tTbHQ8XhwVBvydBxp6i4xwfmI0l8L4AYV+j4VMvxv4DjNAM9
	4WIoECc1waKfNMBTyTaFeaft+ZEv+SwEXbL+Lmk4HHzSsrqJXnzqCcsp5LEspKR18ONwNhxLOye
	x6QM02HD/1XFtyYOzrBDMAOueU8gFZbVCfbCC/7VkjB+btQpWeXxFO1Uv//EBEjm8Amve2cpLLl
	2hnUDncjrX74JmXFCZtj+iSJgedoS
X-Received: by 2002:a5d:64c6:0:b0:48e:4e00:b737 with SMTP id ffacd0b85a97d-492775f151amr306112f8f.54.1793897044130;
        Thu, 05 Nov 2026 08:44:04 -0800 (PST)
Received: from andreayoga.localdomain ([151.43.242.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea18104bsm11441519f8f.6.2026.11.05.08.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:44:03 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-kernel@vger.kernel.org,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Waiman Long <longman@redhat.com>,
	Ridong Chen <ridong.chen@linux.dev>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Kayra Cizmeci <kayracizmeci@gmail.com>,
	cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2 19/21] sched: Clear cpuset_locked where the policy check retries
Date: Thu,  5 Nov 2026 17:43:55 +0100
Message-ID: <20261105164356.28913-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104211207.1392343-20-mathieu.desnoyers@efficios.com>
References: <20261104211207.1392343-1-mathieu.desnoyers@efficios.com> <20261104211207.1392343-20-mathieu.desnoyers@efficios.com>
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

On Wed, Nov 04, 2026 at 04:12:05PM -0500, Mathieu Desnoyers wrote:
> The retry of the policy check in __sched_setscheduler() drops
> cpuset_mutex and leaves cpuset_locked saying it is held:

[...]

> Clear the flag with the lock.
>
> Fixes: 111cd11bbc54 ("sched/cpuset: Bring back cpuset_mutex")
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>

Hi Mathieu,

This is the same fix as [1], posted on Nov 2 and reviewed by Waiman,
Kayra and Juri.  If [1] goes in first, this patch can be dropped when
rebasing.

[1] https://lore.kernel.org/20261102134606.242743-1-parri.andrea@gmail.com/

Thanks,
  Andrea
