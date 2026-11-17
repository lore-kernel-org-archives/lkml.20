Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794888785;
	b=O8azEMtcfn4xwJzL1IdCa6Wb1IMdaqz/OYaruk7CbBunrXkUY2Vu3spsndskQXXKyDZ4
	 1tiSxyE1QO5cEhd1UuOekv/msSRwK9GjtnxeGIJWOrH3O9ZcWsD2fp03X9Ahp7T3s+eOZ
	 XqBKK+E49nNvlvyve0yos3LwYOPIoZx7eUnn8uhvuedzReDbDYLw2eOUX/9IegpJqebV4
	 90Ll1s8V+Z79N6kPfhnm83pHDEL0403fVKiWrZ+qwQLN5XyIqhQlDqSuiRlH8sRW2NnhY
	 V/ylMZbieanA2pXGb75XxPrfP3xUvsmbZeoYjnMe6HAJfH6ufLwYvv2HIuGxRpmvSxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794888785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bOzBCYdSa/53GAfvZrEou4UNDnD5bis/vQ5YKWB+YTY=;
	b=JvoR+eiAErjHHNrHsa0UHQvJItuvbtbS7pZx0ypvv/XJDoRLiWuDu4vIZ6Ve6/EfckY3
	 Kgzq1kzffWsdfiYHTpldNYaZawjyXgdVeNy6H8HBATWrc4NIyey3rjKmqD2aZ/GoOzPDO
	 EhnSU4gpEb5QexnbJmlCAyqOSfFxn0At3OkPGeKuCh8zWhPvsyHo81BNfHCOjUYmCfqEu
	 NNRiHnsWkzkcuGiVTXPMstwSXjef5fc7PwSJlCCCMq5/vLU/qFpkY59khrCmhcf3Jh+He
	 M+AtwFFDxZ9m1AnJ5D+j+41bcjojQrdsbVoRLtrbaAx0n78Zb07GV+MXFUVAniSDuww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KBoJQMRB;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A631B606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A631B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KBoJQMRB
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-170135e43c7so6746841c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794888784; x=1795493584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bOzBCYdSa/53GAfvZrEou4UNDnD5bis/vQ5YKWB+YTY=;
        b=KBoJQMRBSzZ2irJ5K/QzUAAg+n3juo7QhGybVlaaResk0+HDhnqfQUdQWQHEesTH7P
         9d8Mte1hYFQHWy1t82ic3p03FVYtSyU395P2wjhVikdQzBGSjsjBBHDosLzKd5Ne4l3D
         TCiiRzFelZSwpShF6gvZx8cXq8axT+r4xhqmeuyhy1G/PQT4Voug5/ja3EGTSh713FlF
         JFeN3Bnd1/vMnnZgjFv447kx5PuZNp9ex8MBhIgr6pL+IHLfCWqQL66WFSS9MLOcc+0U
         0GysGRfgqcfxbs7UxHykY6Oc2675Z0nuRcesccIjJ8il83j4/iQ5W6NJPPFR3HXDVHWD
         US2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794888784; x=1795493584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bOzBCYdSa/53GAfvZrEou4UNDnD5bis/vQ5YKWB+YTY=;
        b=O7ch5Rs2kE5NNCmREFnrJ9ChVXNRAt8l1Ah6f7iFSA/TV2BMWTjAByqt+h/gEI7UYt
         KJqj9AhOG8rVUuDgsAowBhIj4L3Jdg68f+nhYVVbmBaCJ5IcSrFp0LaEJtn2UURbqxqX
         ZCtoRrhcXx2D3CYkEa1Rq+4TgmRkWKD1yaWwGSPUTrbovFKZS4V2yjqRA2b1eu+6/uwS
         NsyoAMLobFiqu67j+eHHR11yMYdmnfBQmn2NSVSKL1SWIXt6yDMI0KynjF2DSMxXbnYb
         EXi3ZZuy59U45p+D4vELT+mpTHAfN7MHiY9PIcQ9UcSfvj48QPW+KgyrZWYVRN+zUfyA
         lBtw==
X-Forwarded-Encrypted: i=1; AL+hErGxx6jT4CaHTizTWx6dfawIH9DGFVb1qaM4JX0HPUvtEjj3CrwtLZ7yBX+q3HDFYjXmQ3jmO1j/aIuyL7c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nmTTzeej0dxVAYzNB2WAaeRPXo8uV7E+XN0PIkPGlZnaZJ5Ny
	mBcatEKajo4ILCIMTt+rEtI4HCQphcSOoYri8Wa/5yjsy93MKhjqdlBcR3qncEjY
X-Gm-Gg: AYBFou0Sy8oo6BjMNMKX41aOtvNDagFQAZH0hweOiRzEPSRdUKxGQ56JDLml/KXL+1a
	OVwOTLKIHALSDPD70j/Xey7BI7nILpbBDI72vUNANHkTQwhsXbz48c/W2RlnxXAkpitm5+XTb9B
	I3L98oxlFq2Jwltg4drgbN3Q61ja+HYvlYhLKrUix5Z/qUsQ2s8wwitcneuwbEc59EDMosPO1Om
	vpMff8KZHK1mkKUjiWaD5mVr3cmOg1m8qmNhuF5dnTbbDQx2LoA9vjoUNDVamj2enV5ynhPcSo/
	s+jknIefS/jsjkDv3p/064G4opsu1sy8ow8PaJWgXo1zAjUudqHZtHi/9gtTsij3KkvUoHHBae8
	+aWgcDGtHz4RX1No371DfN5t1Ca94t8oKR9ISzBFcr2pSYpCpoU++jxx/EJoHplvbQkc0cX/kmh
	LcGtKP1FXL1x02YO266BIt+97eDjb0GTua1qLF+xGryhOrEwfjNOqhewgc5UY0mHUKLKskfe8bN
	TC/kOav2I++cpDIAFx8HduyeJn0b7diWHHdJBoH1a3lmfKet38u7+TVhiVIk+z1cFqr1e9ih10J
	4gu76N15eJZ0+ldmgrjWzz2gEoaKyw/9Qw==
X-Received: by 2002:a05:701b:2810:b0:1b5:58d:fd4f with SMTP id a92af1059eb24-1b5058e03e0mr9273652c88.43.1794888783614;
        Mon, 16 Nov 2026 20:13:03 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm40433851c88.14.2026.11.16.20.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 20:13:02 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH 0/3] powerpc: Misc fixes for debug kernel splats
Date: Tue, 17 Nov 2026 09:42:50 +0530
Message-Id: <cover.1794887659.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
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

Enabling debug options like PROVE_LOCKING, DEBUG_PREEMPT and
DEBUG_ATOMIC_SLEEP on powerpc64 showed these warnings.

Main motivation for me to look into this was - many folks internally reported
that after generic entry/exit feature, they aren't able to use lockdep because
of the warning splat it generates during boot, after which lockdep gets
disabled.

Therefore this series is an attempt to fix the warnings which are generated
- when we enable these various debug config options.

Ritesh Harjani (IBM) (3):
  powerpc/64: Leave lockdep hardirq context around replayed interrupts
  powerpc/kvm-hv-pmu: Don't allocate gsm/gsb GFP_KERNEL allocations under spinlock
  powerpc/watchdog: Disable preemption in arch_touch_nmi_watchdog()

 arch/powerpc/kernel/irq_64.c   | 11 +++---
 arch/powerpc/kernel/watchdog.c |  8 +++--
 arch/powerpc/perf/kvm-hv-pmu.c | 65 ++++++++++++++++------------------
 3 files changed, 41 insertions(+), 43 deletions(-)

--
2.39.5

