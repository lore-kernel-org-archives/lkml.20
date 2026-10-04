Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5C937207F
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 10:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791109108; cv=none; b=hwLGMl2foQU+8QFqdz2sny2ByCGLJ+POHw/JAucECFW0n+bIOYVq1Tfv5S9num/S+m24fARsMplj/zrq7deHTYUI9RRFu9qRDMo1V8UERdOxq0kNDN4JjjWtwK/PmpXm8XlZK3f+u1bBW2071OVYEmsxvewBZS06F0LY6kQgkpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791109108; c=relaxed/simple;
	bh=/M79WdL5TfKGE+htbxj0oUjXUfHo8zAUfiiwGag6gKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=luOFKkYOxSlgAeLgqZmECNxkUf1EYLCOkseBc0hpNMt1dRdMcdX8YOQF4+x5hBJ9OzkOOHVtMTXFU4Q3PH2+zqK8rUe388DWS0YH/xOcjIy8IRbfF7MD6y/0EXMMCL2zXkI8hR79YMIGK0hzJzNVsgUKdPo5Y8ywJJ0zVIlkhzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NLgshQkq; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NLgshQkq"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a003bd18e5so5124185e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 03:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791109105; x=1791713905; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zcABtXKvJoqx2poeQJ6t2MmxEQEWYqoclox0iAY9dqs=;
        b=NLgshQkqvJk2GgNBFpV9taLJmFFNd8MAkZB/37V3m83Q0mp5lzW4GGaYbG4nsm1/jJ
         dfQQ4iIL3R8LteXQ4kRHxY1m5g6UA2ZGi1iOOOEn/nnL3OOs8ggfWuafcnQn4mDl63PH
         h/BbMFeSFmotLmxuMTYT+Kyx4+LzLqbbNjJqS44rkSbPKDNRKXqNpFJBkCTJD5cwwIzk
         +HiS6BCzODhClrljuHKJSciuzD/UfHWbeky1aAkGUgtWVLaft0QB2j/4e1acsbJp+09O
         Bk01u11XMwOAT9LrwzNF6yH9nfK4dLkQL6ajGsfcnExLKfcTwhWNSiFv6LgKL5YyfjC7
         Lq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791109105; x=1791713905;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zcABtXKvJoqx2poeQJ6t2MmxEQEWYqoclox0iAY9dqs=;
        b=QV1OQp/pEluYKdfZGhoJeNUUhRl9lAsPHDWiL4Sbj3VTyzwDg60VpSqmqhuhAtlzsW
         HUD7S+F6SLLMKkiJ2cH/vkHCoTTNgi98amkTztQJQ0a7O59DVEOklbs35Lzh8RClJ0qI
         Kn/odx8ndK1o1+41CrDW0E+QJGtO0+0+CakgMZ9TFLWNlzKjCg84nFxqjmwOR9PIZqQi
         IM0uJEGp8RwFnkev4fN9zFNj5XGNXtUWnrtX9gdbSkMA6E95yI8VRZs/9b+kTLx8MsE4
         0TpEJd3mzT9xY7WvJF7svpESa3sn8AafFPJl6YyvQty4gShAtqo0F6dCKCENTFBP+A21
         Fgjg==
X-Forwarded-Encrypted: i=1; AKwUvBw2CRkneLpPsw0NuDxjXbQ5xbPYXpyuFz2ESeQFwSwmFplvLCGMCVLJFUn07usdIpL0mVQZYNUG/Mmi2Z0=@vger.kernel.org
X-Gm-Message-State: AFuF++nHnTWYHfD4t4gQOiWcGokuKsP+cJYQ3hseq8PlylEaBTs9pq8L
	FHctwhXJZIQncLfRN8jmUHLKKS0TdhvKmzsdo4KVunzxdEASgKGWYD2Q
X-Gm-Gg: AYBFou02wJOex/cQdTQgD7m0J5hooLEVcWITs0u3Ni9FItnhMPmW8XRoVkh30XAJJ8R
	QMiyA4r4anwKgZsPLtN74pOxHMVJ3TwgxsOClP2Mst6BLUOFHD0UnMpTNSk+dlbTOCsVpRIOLcM
	eNCpak52sL9tx0Jlh6EqGD7ixa6eNKsBumLYj7Sh2JDWZTpwD3LVWIrBLZAiEtE0KErid8EEu4N
	VzrkxHKr95xAkGmL2NiOm8V7BQJMmpSihqEDU7PhYHCpQHUcmNod0bnRPMtR49iJ3QnWrK+jsvg
	gPDGyy3FXuv4T04v6FkF+/DeStq31z56at4iLqncio+mjtHvJqcb7WYwtmME7cJTquZKVu6YigW
	B7jpSld3e2mtsEUCcYQ0bZKSUdqpVfl1cbtTwgSELOoZzxbyIiBO7/QhPHwHnUuGHISoJRjDb5H
	lbnsftvXj97kHpsSncWDW2b11EyP5cY1s/vc+PTeMbmvJklkIYJyNLB6fbTGnpOys/M1qaGtKXf
	nOMiAk=
X-Received: by 2002:a05:600c:6091:b0:4a1:702f:c736 with SMTP id 5b1f17b1804b1-4a1702fc916mr16684305e9.3.1791109104687;
        Sun, 04 Oct 2026 03:18:24 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.11])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a027735be1sm333552335e9.11.2026.10.04.03.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 03:18:23 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Joonhoe Kim <26rote@gmail.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	ds.heine@posteo.de,
	Abel Vesa <abelvesa@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: glymur: hard reset on the first system-domain idle entry (SS3, 0x0200c354) after a heavy load - Lenovo Yoga Slim 7x Gen 11
Date: Sun,  4 Oct 2026 12:18:15 +0200
Message-ID: <179110890955.4630.479435085519179001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261004093509.74316-1-26rote@gmail.com>
References: <20261004093509.74316-1-26rote@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Joonhoe,

Thanks, that is useful. On Glymur (Lenovo Yoga Slim 7x Gen 11) the
pattern is different:

- Plain idle has never reset here: 50,000+ cluster (0x01000054) entries
  and hundreds of SS3 entries without a reset.
- The reset needs a trigger: the first SS3 entry right after a full
  all-core load (a kernel build or stress), 5 out of 5.
- With SS3 removed from the system domain and the cluster state kept,
  3 out of 3 runs of that trigger survived.
- Day to day I run with a cpu_dma_latency constraint of 1500 us, which
  vetoes both the cluster state and SS3 at runtime, and I have not seen
  a runtime reset with it in place.

Glymur has a single CPU idle state, 0x4 retention, which is also the CPU
domain state, so every cluster entry here has its CPUs in retention. I
cannot separate the two the way you did.

A correction to my original report: the min-residency override did not
hold. With no timer pending on any CPU the governor's idle estimate is
effectively unbounded, so the residency check passes, and I had a reset
with it in place. Only removing SS3 from the system domain survived.

Oleg
