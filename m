Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206505;
	b=ylXsUhgPbhA/VFvXWl71k/UzSujAUwwiZB/bCkt9KpiIkaEmtNHrq4IdDy9HSkipVPyR
	 ePslsZN5JaqEf6zvXQbirvlLDpG9wfDlpijfVbIeaWk/6U1isgSZmO1MJRm84cpY512l6
	 7qMctTG87Q/jgaiBSO1vh0amXl2EgvQW4Sr6dx5n+LYiLJiLFRRWl4kgR8a0CeKSygoMd
	 ebd5YM5ySwxbfYVS9zOFWDHBx2F+Hwp7EtVAt4rlehmsh39bJ7/lY1LHaTCU9N51oE5X7
	 LcfTx22nV9Eo7WKduOjk4ZH8eqxXDahcazXO5+hAMjhco2llTT/JCU+adPrJyuyMKpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206505;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=W+LCJYqpb1jh4biWPzp+yPqPTS1QJK29Y+x/nsyx6zk=;
	b=A1p+2ry7VeDqlIx6YZLvlHzr1aJilra9/BzfPFZsdfR+AOKNyvnV2wzgja4KeqMwECV5
	 V9PHDh4qMMqbPm25PmjTkur8aDJsQJz7nBHmrucpyTDi3xAyb7bsrBXWwbUW+5fMzUWK5
	 /n7v2kjIBMxST4K+FCZzt/YW9Kq+qRRR7vwUCMKy5Q+/RLgb0uYewo64NVAvn5sHFYW1E
	 X6ZUyrtf2YJoJoco5IeoUxXZzz5rPcRoV7qQsiUVWkfDruiS0QZ2eOBmHkp7MrGatgJ+A
	 kpw/7ogY+gEmU4kMSOH7A9yCixHvnxX5Xh5A2C07Q+JV0lQX6Zr+GeDyNZdkopxoInA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=smartx.com;
	spf=pass smtp.mailfrom=smartx.com;
	dkim=pass header.d=smartx-com.20260707.gappssmtp.com header.i=@smartx-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=c5vSMU4O;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613B3606A333
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 613B3606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smartx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smartx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=smartx-com.20260707.gappssmtp.com header.i=@smartx-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=c5vSMU4O
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso2122343eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smartx-com.20260707.gappssmtp.com; s=20260707; t=1793206503; x=1793811303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W+LCJYqpb1jh4biWPzp+yPqPTS1QJK29Y+x/nsyx6zk=;
        b=c5vSMU4OlFpJofx8pyh53OYoKfiY201bp+bkEJXfqn7e+hktJysWEkZucR6HjEPfBB
         LDhg+3CBKTEqrpKe0VQPdo4WxW4U+n39wNy2ru5bquFNadzoWRfv182qfvJWGxU/OvIZ
         Vlhp2/P2q8Ljb/HU5UwFLFl4gmfZ5zEcABDGS/p0ws+ULgk7GO4NX4vn8H2AYSvd29Zs
         NXpI+6s24H6auqF5CJaqN32/AbZ4vmJcySvMQndnUHPoouAxBLXAs6QwEua6iarUbB3v
         XK+zJ3YN9uqzQhZVCkV798LASYaWoLBTboPr79DJqitpYzdW9NJx5kIyyZ8lqwjqNQtz
         VogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206503; x=1793811303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W+LCJYqpb1jh4biWPzp+yPqPTS1QJK29Y+x/nsyx6zk=;
        b=En1Bdl1iJYq7MkNnmpW3ORXyMDFibdUTlUny/NhPs0hIutUYHMT/qN58jW9y/XJHdD
         uxssa1B3hwC9Mo7eohJnnV64yiSycyr+kpeT793IXabRhtnMaiY2QEeIJRBfGpSJ1c7T
         HWNXEpZFa78yZZUs28ismm9y5sP1nKszB/GMz8NvV5U1Q/DcIySnVMxFkjmt9l3Wa+mi
         NQDszsl0VzIKOkrVPBGHbZzwkHllNHqSB2bZwcpt4tVXoQWuEnLI1mZulYkhtN9VtNmh
         GrrAfxoHtTy/UuNjRfh47PDvfIzG5txU4tA3PYxS0sIsnDGEzzaB5zXYy5xs2herixwq
         +/fg==
X-Forwarded-Encrypted: i=1; AKwUvBz2uTLrJ1VfPtHY6ykCDHltVujJLjRt1Gtw7AW4Nb7RXEAwanH57j5Lu8VeckxvEpjvSYl21u4s1vq5+no=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaqaOs/nnVgY0Xw8VD9RabG4Zv2j/2vE26MApoooJMAt725Yhk
	g2KGTCTX3abncC2BJbunu8jsYsKvbtjcJmTb+maDGzGLGxiwNKc8sNmOmIY341Clw254wmCBZK/
	fIESkG4nsd4OCGNYMPsJN8bOCsPuv1bR8jLkBKCkL5QOBbjKRPV3yRjJ5rlg=
X-Gm-Gg: AYBFou1dlJMQye3iHXy0cE/0oYFUWVmTXaPOItJpdwVwdmdbP//Yo/jk5b6dI5dt5B3
	m1Me/DjHtt0c/4llAfKsij+c+P6e/eAxqPIGcjrW6aHeomm+YS546y8ViWPZRcHIQTpjqoR4IC3
	XIFYPbkHev3hdmCDsHHyyjrtgG3+WfRgEr9Wys1+kE2dxVZFBGLPeLUfWiTc/0zuKkfG9j95/oE
	WtsGhLf9vibHpUs48HkorLFaNQTud5L/ML3yKTqLww3l7Vyj1TLrmo/9QnBKwcRKHTSNKit22Lh
	gcFUrhkdAoG9/b7nXJWSbfZarbTzNkMq3j7JuDygvTW9Z1TXFSzTK/egyqiIwfqImxT46k1J1TI
	hSuwxQhxJgh7A2Q9Ymb9xchP9jb8O3tpRfW38R9Zs3fdwDaU6MzG51vjhdVJsq+bDxf+1puuMjS
	Q3SrI4kUcd7HWx50Q4vl+aIpE3jonqx+vtXVMHC+D8mlw/Z1ERxkYkaC91G6VGO1zpyMSI2GoHH
	7FHwxkdX7MlnKQKXi3SvDG/ekAahL7GyIl6vIY+G6amGhqbdYHfBo6TCcAJ2B4itCK3RplfTLKw
	L2WBj+RQkhKeZkNufOxO5Z7bM/GRVKHWHeE92wzX5sI=
X-Received: by 2002:a05:7300:a210:b0:366:83dd:4704 with SMTP id 5a478bee46e88-36a2014b145mr4102794eec.17.1793206502537;
        Wed, 28 Oct 2026 09:55:02 -0700 (PDT)
Received: from localhost.localdomain ([23.148.204.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a238d9a21sm8603125eec.4.2026.10.28.09.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:55:01 -0700 (PDT)
From: Wang Zhan <wang.zhan@smartx.com>
To: netdev@vger.kernel.org,
	Yingjie Wang <x-professor@outlook.com>
Cc: Wang Zhan <wang.zhan@smartx.com>,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 1/2] net: preserve rps_default_mask on failed writes
Date: Thu, 29 Oct 2026 00:54:40 +0800
Message-ID: <20261028165440.1093223-1-wang.zhan@smartx.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <7fc32d133404c078352f0b8fbcc80a67861bf2c3.1793199118.git.x-professor@outlook.com>
References: <cover.1793199118.git.x-professor@outlook.com> <7fc32d133404c078352f0b8fbcc80a67861bf2c3.1793199118.git.x-professor@outlook.com>
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

On Wed, 28 Oct 2026 14:52:09 +0000 Yingjie Wang wrote:
> rps_default_mask_sysctl() passes the live per-netns mask to
> cpumask_parse(). bitmap_parse() stores chunks as it scans from right to
> left, so a later error can leave lower chunks changed.
> rps_cpumask_housekeeping() also intersects its input in place before
> returning -EINVAL when no housekeeping CPUs remain.
>
> Consequently, a failed write changes both the value read from the sysctl
> and the default copied to RX queues created later. On a four-CPU VM,
> after setting the mask to 1, writing zz,00000003 failed with EOVERFLOW
> but changed the mask to 3. Writing a mask containing only isolated CPUs
> failed with EINVAL but changed it to 0. No kernel modification or error
> injection was needed to reproduce either case.
>
> Parse and validate a temporary mask, then replace the live pointer only
> after both steps succeed. Readers access and consume the pointer while
> holding the same mutex, so the replaced mask can be freed after dropping
> the mutex.
>
> The rps_default_mask selftest failed on the base kernel and passed with
> the fix. The fixed kernel also kept the mask at 1 for the overflow and
> housekeeping failure cases, while valid writes of 2 and 0 still
> succeeded.
>
> The issue was found while fuzzing sysctl write error paths.
>
> Fixes: 605cfa1b1090 ("net: introduce default_rps_mask netns attribute")
> Signed-off-by: Yingjie Wang <x-professor@outlook.com>

Reviewed-by: Wang Zhan <wang.zhan@smartx.com>
Tested-by: Wang Zhan <wang.zhan@smartx.com>
