Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793708141;
	b=xqqtscW2M8AdXx5yPwnzpdHmn+7Ik5bhUnqFzshxH+TyuSWviNlJlAFQ95kYpN+GtEeN
	 gEQzjnRgBjhv3OgU5O6gNA9R4rNqtAIfm7w5PA5SCYQL8GEVTwzRt56eAltolpUrmPjD7
	 HJt0Zwb6IlKxia4jnrQZUyHl5yAu3p663OLgvh3Z+l2LChbPZqXPXje4V/Pq8uOzgNVUQ
	 Cna+qOoIoGrhO5VWY4eAaY98YtRpzq4lN0hp8iBj3mSyucQizY+saLdqrc8zNwKzL5KR6
	 1vEyzAQ/S5SKcPx20VUrl0ESgkxnz/wDNvWPQhbaJL1DhwKlY+G/y1x7XnDUz8u1tYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793708141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=8wBqdKLHHXSqR7AJ6tuSpjHoQqmJinv7wm2sN1Tdae0=;
	b=fjRHOaCkJgZPsCt104xWLmLBN7lUrIUTnQ7eldstYvKGrzjp6W5F8Z0yvhvSxFe71S54
	 LAr0YOrwRMTDhR6ha+c+d1hobjEhQejsYIATccTBNiqPXKw256JKy5POxXqVLgvTrJLOq
	 Q0axXp+0CxrGvNzKou1MMDiGFfr6JPTml75lUWI1EzeViv8qHs9wWJdd7n0rIxLeY442o
	 HT0nXuvUtzKPT77I0uin/VU1HAkttjAdNqbbeR4xlthuM4XR+LydypPUhr13/Qdlo0gG0
	 rhQK0UlocCy9n6BhLc1l3FvrpWbASS8oPElNP+6QuC9QlkKawrun9jXz+ruafPhpDpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0RCcAOaU;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6923606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6923606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0RCcAOaU
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso1834240a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793708140; x=1794312940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8wBqdKLHHXSqR7AJ6tuSpjHoQqmJinv7wm2sN1Tdae0=;
        b=0RCcAOaUMvdRKwqhghV9k6boeWfAgxTaR2LC8TuN6qmtAUoaqcRE+lNPQq18+rSw48
         vIHp0RQ/q+Z2rrYXNdgrckfHWHxUMNrxOe/zINgmorS2LLH74zS0EP0wIF6l55/FS9Qz
         3NGE3Bn2VmMc44xfd7yOZ92srW1cqZwwt4G5b5gpTYPkq3zkSaguHVWaQMOv1ev7MjU2
         /fhpy4SMaLdyOyczbvYNAXJa+opNypC+8cQegl9h9Cnivr7pxyVz9W0UNdYll6ZQ8XQt
         Bac94mxQ7QdOS18YrO7psybIkcJTlOw4NoT5vv+PFdT41tlYu7eiUy7yPnlL++33E7ZR
         VC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793708140; x=1794312940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8wBqdKLHHXSqR7AJ6tuSpjHoQqmJinv7wm2sN1Tdae0=;
        b=ksny4bGkP+LdIpEYvNKd++wUTyu+xpSqiTS7hrJbqFVXTATxOQFI5z3iUIcVf1Z21q
         S/nc4RNexy/8YoDBIiluVfdylAh9L5xekQve3EE+I0N356bP9jVnpqf4+7irhdKrZQm8
         kpMORj8j+ISDcmZik+F+LQXdhJ6v/joXhGfzJktt0ZFYb19GL6fAiMnEPzwQkT9HTNCA
         nDHSTR0DZ0/nq/0uGnw/ZeFULu+hOf/eey5jgDmBeUUjnNKSOwyQBA34vKRSdKsk8K2e
         BWAB6iWx3Nv1nVkGWCMnAGkb1hxsiXaaD0d4pfIJz/P2OqMh7WMyL8dAI4OBjklkN9c1
         r0ZQ==
X-Gm-Message-State: APuU4Z9F/S7HoEyp/7xhN8b7bkscCBdxUlbtrJxcwceGacVSGUkADDJh
	q55aq/2f4Yd3cF/oLARq6D1MEY7lRDahSTMP4H9utPU4VZBky+cNBPQp
X-Gm-Gg: AYBFou3cOP+8zLSHLu9/PZLbPwl4GBPxfj+SFnl7Jt4Iyj7jYVaoD9ecNTIqgEWEpnr
	IgmOBasMZxxJnZlF9FKPFAfmHFay6MMc5j7wUpcx4cL/a2XTVbAE59Ryo0WhRAu/WbOqcrz8xNS
	rRKEFRiyefNClTVyhzL0Xi3YM8jE7fkVMsmftwcMND25CAPhZrYWLdU6BaVd88r2qhiqKcHUQdj
	igEAuFWF3C34uG20CXm1UCVz4Pn2o/no0KvUoct93UuVoshB0jDUiG1VSDB5pnVcWDM+eRnSLLj
	LBxi3lh7CwsqrjaqJr6YMSR0HYrV9bV6yNtyeqn6lvxCIcSntwf9O18g4oSaGlOiHMQSN9zgz3O
	IoM2IjXhGV4eNqm17OEnjmiQ33DyiuwKKq6pzuKvGEwB+WT/YJl4B8X/FypcdDXyTDb1taeWpz4
	QCHGwWeeXPUfcynfoymEHfVNPbr/yQSntmaHrj24bdeOTHQQ+cG8563+7lAGNrEiz7d5qlaW1L3
	INGjLbe70RvzlANstNgTTl/ZvlgQ56lRi7JWeJ2jMBuMvedgdPsNtleVvC5RCfFdk4BRr+P4lUR
	eLJPS7I9KZs9NFPGAIy8lI4AncjcfgpOgcXx/EM0YbjL6/7tyTobmhE=
X-Received: by 2002:a17:90b:3d47:b0:3ad:1b0b:1246 with SMTP id 98e67ed59e1d1-3ae8981280cmr9675823a91.32.1793708140115;
        Tue, 03 Nov 2026 04:15:40 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c71c253sm4177200a91.16.2026.11.03.04.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:15:39 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: james.morse@arm.com,
	ben.horgan@arm.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	andre.przywara@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com
Subject: arm_mpam: plans for the SMMU integration series?
Date: Tue,  3 Nov 2026 20:15:34 +0800
Message-Id: <20261103121534.532108-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Hi James, Ben,

I have recently been debugging SMMU MPAM support, and noticed the
series James has on the mpam/snapshot+extras/v6.18-rc1 branch. Is
there a plan to merge it upstream?

Thanks,
Ping
