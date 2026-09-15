Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FE94503F6
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789501919; cv=none; b=LD1d+ezrIjM9TtJ34WQUhjae163bMKW7JrBReI9h+YyCJ9lrnqCLh7/dHhxspso+XK2NuHsZ7VWwojp4PQUGbtIb+e3z0+ZALA1N8NnIaS/+E7Lq/OErqzic9RWRP6ZAgi/ZEw3cUz6tzJyTv1yIDWNNMmAGlhXbRuhY4jj36I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789501919; c=relaxed/simple;
	bh=bKVl5EPxdtpk2JfngniCgZ1c/53BvJXdrA/23hblqTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lI4NYffEVbOgkYSD8OgtHIo4lPn7Frrr484WA2+35SF9XsplyV9nxbB6XJWnMpk8RF6HaFKguOTCV/GcQODdWVE3bcOZM2pefBU1VJlzqXrFdlsvKYT1NVZgPAbqL3LJs0J19aw5dcxTuLBY5Scuu12yFOEBaxLwNobmSOQsClw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EmOnCern; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EmOnCern"
Received: by mail-vs2-f41.google.com with SMTP id 71dfb90a1353d-5c67e5292faso64270e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789501917; x=1790106717; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bKVl5EPxdtpk2JfngniCgZ1c/53BvJXdrA/23hblqTU=;
        b=EmOnCernvjuloBz9pl+YCk+s8O+IcFX1DXmV2IYgYK5Z1i7TohuVUeGAwO2MiSlYnp
         fLQBx5wsJ5BbMI/8f9YFg1dXfaP2Y3tpYpwgxaSGLmUiNkIaTI+XJDadReFjIf6EgZc7
         73rsbQtoOMK/jdRVLjfzhJoX83N4ZbHtDQcGFItjWGr8S288c/oj77w/h89Z3BKMC2A7
         JU+siw+8vBw1i3uXxnX2YdFqBP51nOZL3MZsnprRlr944MIehv+odD2fYac5rlDOIoqC
         BdVpBZf5NbSNEL7YGqyC7BYnYlQHiqUdxzNv9+fNWPys6LQK0sjpnLhRrk3r0t1YvO5p
         lr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789501917; x=1790106717;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bKVl5EPxdtpk2JfngniCgZ1c/53BvJXdrA/23hblqTU=;
        b=hGv0WOorNKwpoLOT1qAjOFK7ACzODblndrK0rjYGKBAdjULQPz2CVdCBNVyLtqhnB9
         xJFLisWU38tgBS4j8N8CNgegFGM39AEUo+F8nmmos1+S3OC5s5xC4cUKzsKv/7moqHHS
         Ifw4er+eGvnFsleZ8O1XsvjoViRE5atjT4GhSJPwNEoXnWhEtGcEiGGCh45KmeJa5Uhj
         wz5r1ZjD9nckHx1v0+3nrEP54qqXJzdJKQ926iMMJLlRhB3C9FOkgREbc2CIuyYH92lq
         LgdMbL4MKKI2KGWsxqSoiD9UIQA9vKiH5WzWMbJPgdKfIWLwCXVaujLHU+/o1J2HOM5p
         Ipqg==
X-Forwarded-Encrypted: i=1; AKwUvBwB+6ytJgIqbmOhdeLj6r6rRZy7HQO/bJuBhj+Fw/0wf0EAC7eqHj2IxnaaHyCAuRmTtnnbAc5ZjRF3MNk=@vger.kernel.org
X-Gm-Message-State: AFuF++lHlX3K/aNzK5QV9kv7OKq+ClwO4Jwz25zRJhSRAWGEmc/i8KRr
	kHN3irc8fT+TigkyygtTKUgxzwNaE6AngCEGuxpEasxQMNjs6GDa4VvO
X-Gm-Gg: AYBFou3KC+oLfv32l7Q6iumdYuVwO7bGdHvMVaE+82uv547yFwBM0qFnOtVdmejYzj2
	nYS152cNmzeJKSEEIQJG9w/tWsnyHxHuE+SOtGmGG3cCJaEtbWh90SyCb7TSBqkMmm2L/QEQA5I
	yTX2st/7bLUY75DcGTcZ757MkbIWBpBJhXuwRkMfzsm0Rn2COk4hBxhze7iDpqdi5pgiFFTbbxK
	0k74f5NMDXChv44vN8asvpDHfSicVI8B/SWgtGF+zEde3s0JKA9zglN+qzF+NET9yipDnceqk0F
	HQvsdG/eIblcJqlyVer39CnsSDdd1n0X0B54WV+b8Nnq2JevSnJarYjUT91SOPG/tXSqF77wDhr
	5AdPaGazrtfALOS0ze55lPh7gSmhq4n7VoeRqceOrU1iXJBfMRVsQOzrOKlLPSgQrjawCAKfSdw
	+84qeX25DxgxRncSyUevj/lsO7AWd1P2S8MX+dorJf/3oW2zLgxyQQX5gFYB664yTZ
X-Received: by 2002:a05:6122:8d5:b0:5bd:b2e1:e1f5 with SMTP id 71dfb90a1353d-5c981a8a2f5mr5665227e0c.2.1789501916850;
        Tue, 15 Sep 2026 12:51:56 -0700 (PDT)
Received: from beelink.. ([187.13.206.89])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c998a65a83sm564826e0c.10.2026.09.15.12.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:51:56 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>
Cc: linux-nilfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: Re: [PATCH] nilfs2: validate segment number in nilfs_sufile_get_suinfo()
Date: Tue, 15 Sep 2026 16:51:38 -0300
Message-ID: <20260915195138.3331490-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <MSG-ID-sufile-v1>
References: <MSG-ID-sufile-v1>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Slava,

Good catch, no need for a separate variable. I'll reuse nsegs in v2.

Aldo
