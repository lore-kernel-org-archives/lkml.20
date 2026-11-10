Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315015;
	b=fwKg/BNOm0PfGAx0vCAP/A60+p5JGptA2P/+KJIeAHtJhWNSK2A7a0cLTJshQoxl3liy
	 dWqqpBvbMaCMH9jTZ+6E5xL9eFXrzvB7vAyVNT5uemWW3VSwqP1po6resUg11fF8IxPVm
	 j0WTR5T0vEcdRjtYPq7Wwf/eYJULR0FCaqHl50XYpmBXVs8xiC5dpmkd3cZFz0+TaM+YR
	 hPvPvU1h6p0/knrftvvNY2pu0FgoHACrtTpydY7QOoHZ/SmrvKxdd/9OM8M/VM/E9aVIY
	 mMOBqUxO4+GbBomSla63spxwnqrhVhlRa2MBaTtxdCu9X13OC9xh4yJnEzq5oWycHWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2+X51G9ewXmU9QYzYDv2H+VC+EelW5F82dLqqoHsS6I=;
	b=N7IuLQpyJbbYWpQ2A5Q549jtvfqB1LmVTZujymzke+ezWpQNjL7twOUikgTMtXjNzW9I
	 qHANwbK8w0oreh2QYNzXP6zulKZWiNikAGVj6zvdvFMFdahPHXRqxaMD6te0HwcSuzkk1
	 zG8JfSqUETOkIq9dL+sjvcdC82TuljN+VJ88OzmGwD7aWu9JTzPh8KW3/lX15u2qkI4MX
	 3s/DyvrkiIVBGn3KGUo/3BVA+9FVr5tN+rJvFGwD8CwaETVxn8In+lTSNpmIeIMPYN/ud
	 huWuIGfZLsN9PNYpTAZqZ5pSE1h1wAnFlsfojZZUfFfhfQonH5Kxr7njk3bUrExfCrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tMx4qIBi;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F46606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03F46606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tMx4qIBi
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1931ff67a29so1563903c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794315013; x=1794919813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2+X51G9ewXmU9QYzYDv2H+VC+EelW5F82dLqqoHsS6I=;
        b=tMx4qIBiX/Uugv0/DNFM26eD9UrYSRPguP76KC696Zof9hAN17qIBq6iuqCZbjYNwH
         ySMO9ZaQiEC6IURNxgTczWqU0cu6JTqaGZmlerI3ly0pP7GrHTAZ5+4jlr8jpxw7tNah
         H8eaS1s3x3DrsGD9+RpVpLiES2aZRh/QjBhD8rONImwSl+BHLDXlNYigbFyqD19J9SLY
         4E23uUT3ylf/zq29tbmIWFCB//tDnBhM5xlb/qSlk2UAuNGyAnnnRfjQKT1lr2FUv7Uw
         hDCCGDUInXgbfXTv7jA4f7J4Jbqkffhz/9afxBhRHWsqrkp+0Gn+YbpW4Mmr3eh3jh11
         JaVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794315013; x=1794919813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2+X51G9ewXmU9QYzYDv2H+VC+EelW5F82dLqqoHsS6I=;
        b=bKhpU1Rp2sRmDHYFQwMoETTr9FhmzLPf35wIkbkcmAtfmt3jtUr1XpXDEwYLs7q19M
         CjpZR2vD/VV9Er8jQ9HV+b8y8JSfrBpMu6WHVILeKVRrffsU9jl7+R85ZZoDDORceBEL
         Ipd4kzdn7aTzt2fpRafuK0zLCYHdsxDcvgU4Ive0KZDTXSY83N2vm26GRGEQGDJQYlqm
         78O6HPHGyBl1g4sBE/zs4t0ZgWieUlnqZHzOZp9HT/R8GIpmbgfBUXUuR7kn8XFfDJoa
         EVFHLtowgO3aFnI4Hjb2L1kmCoTlfHDJehm+dQmcfnsKhoC1cQ66N61lDEMrRaChAdLc
         qc7w==
X-Forwarded-Encrypted: i=1; AL+hErEatm6wSM4Wn02l1JJmfAQ5NEimj+ty5KWp3gXoN3iBjHg0SpVm79fD3TsClnVus2irroNH8nPH+Sqh/qY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OlOO2rEMii9Pq/LWV+SnhNyC5zcG+NKdhIyLwy2WlpuTG+PEj
	gF4uyn+2EQXEpELsvdrl1dfEhXixgNjPBRaqEZJe6LC+4Z03QM8lYoHCOUQyTGFTB6Y=
X-Gm-Gg: AYBFou3dDID6a8EVkGlwOECwB3ZVyM6sXDkUEvEDRvUEBm2J6ZQDmQoWKnV6kZ15xtF
	2gl+dvZb2Ij9Qr+EMGlCuuyUFDaaK/koS6wpuUm0s+fOzAIl5t9c7TKV4VSne+kxzdZw6vio+28
	huk3chCP6OTlDSVjsqGyWotD4Y44edmhO/iLcox7o/OUGo83jCnfwHW6W/HECBMX4v2V7NKjVPa
	3oIHJ99UdWHqDczyK0NqhkOso9xfxtNiC3POsQNrC+nlvg67xlOPc5ytxJ+OUQeh1JcYV4Fxswt
	VPnt82N0oujygcQ4gAPYOXa7ah8QGBF21c0V/Tywfp9EKgKPAtABO3DI3RY3me6vVpXYU6pcyJJ
	1X4Od74mWZrEt3LyjcujoWA+4udZpH8SgtMtF0A0MuZxw4K8OJ3+u/PN7SFNQSL5vpR2/gsAekT
	g4NStg39cgTH+WoSAb7MiYb1WvwaxYT6NvgfVjONFjNP2G/NeTtNqk4sMRBsGCC4huae5aX7jc3
	xWSxTBCaK5QhcqUCQ3l2Bl/Pe+Fls1oiRqtlUT1QYm3jisqA8OPF+c5VSt92/PNX044UAgfJxJ7
	WYT16VZMj+A+QapwbvdDNNYR3sCVuU/5D8tGu4iEljlNQMLjNpIM5AHiHxYQBP6xpMfa55IiFf5
	jMXICewc/JYeMMs2Da9HTYY8A1/HnSCXVYsS9bg==
X-Received: by 2002:a05:7022:3c18:b0:181:73fc:e53 with SMTP id a92af1059eb24-1b3b617f6b5mr3186213c88.29.1794315012523;
        Tue, 10 Nov 2026 04:50:12 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:88e2:4271:a9b8:cc50])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b79649sm7614830c88.21.2026.11.10.04.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:50:11 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: jgross@suse.com,
	sstabellini@kernel.org
Cc: oleksandr_tyshchenko@epam.com,
	boris.ostrovsky@oracle.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 0/2] xen/pvcalls: fix the backend error path and a workqueue leak
Date: Tue, 10 Nov 2026 21:50:00 +0900
Message-ID: <20261110125002.46683-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
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

1/2: every error path in pvcalls_new_active_socket() runs list_del() on a
{NULL, NULL} list_head, holding socket_lock.  2/2: the per-socket workqueue
is never destroyed.  A frontend reaches 1/2 with one bad ring_order and 2/2
by connecting and releasing sockets in a loop.  Nested-Xen lab: 5 of 5
cells oops as shipped and 0 of 5 patched, a normal connect moves the same
bytes both ways on both arms, and backend/pvcalls/<domid>/0/state after
teardown reads 4 before and 6 after.  Reported to the Xen security team
first; PVCalls is not security supported, so posting here as suggested.

v2: 2/2 destroys the workqueue right after flush_work() (Stefano).
    Picked up Reviewed-by.
v1: https://lore.kernel.org/all/20261109122324.30134-1-yhlee@isslab.korea.ac.kr/

Yehyeong Lee (2):
  xen/pvcalls: unwind pvcalls_new_active_socket() step by step
  xen/pvcalls: destroy the per-socket workqueue on release

 drivers/xen/pvcalls-back.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)


base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
-- 
2.43.0

