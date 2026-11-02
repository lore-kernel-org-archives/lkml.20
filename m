Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612565;
	b=vZV8IPzLea5CQz8Vr+Th+xcq1I/iDG4ZmFZF0WFdNVNTWjcCUeVhI6Dpqdy5LQsPpiD3
	 uHE5pGDaB8csUcK+d6A2+Z2sLJhnwpCbyAA/mDhNs3pGflZ8kb2d8DEElAY934we+TUXB
	 XFWwJilRUIbuInb8xnA26r0KMQmVtSBNfVlqxMJ9RwaWR+tYy85Z2fiMs9TCN7FjSYWLF
	 1mmiJqGVx2IhQ1+8xj4wx68loazPcg+pApCt6BwTqTuTm5rzoOQuqszv/4mUI68UozF02
	 3seeCdwsImBZVI+EZ9Le7uEBqnBtr+XeJYOD+wWJkrBsF5dIwJ0wm9kTQkwBktpfU/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fS3fd1kxqIasLSOLsWPb3nWgBbFcJfSOZ+BlIh18+/s=;
	b=3tDpG2/nzbIgt/fieqdGb6kTB4EB2zyt2W4PUfGOlByotg/D6fp/o5HmdzLyKts1Ltm7
	 ghK/uw5xTHGEI+uP99K98WucUQLeMrPez9DzSDzo0akXsa0sea3hHjuiifxQWnqxUII/i
	 oB/EHOJya1YVDqRMtx8+1dFVlSfdcvT3foCMFNlNj3+p37Sfc59Mc3lT0fSVlVEdL6+oa
	 LBvyuY9sE2CHF6aHrkp8J8URk43tGYZCYvnVQZr9nIy95cbdh6UUy4/+H8PHjxbeU3Y3o
	 RDg+pJm597QFEZxyXoAHYSBV+KhiGM/T38Dd5nORLY/qdFWjkokmtkj3DXxeVUt/UEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rPn4Rwu0;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2778D606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2778D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rPn4Rwu0
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2eb5251724bso4786755ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793612564; x=1794217364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fS3fd1kxqIasLSOLsWPb3nWgBbFcJfSOZ+BlIh18+/s=;
        b=rPn4Rwu0Vgqc/6zBN1tVshjp1vVSo1gdqhSeah4zllTWNSzF8xxackwM9mpQ7g2+fR
         AFV/5cQj79z8HBZDXUhMo/bihmMsx6e6WMJUeOhfFoqXfIYh/UA5tp0rmWYmLdFawW9p
         5tMIM6sV7BT+OIDo76se6qqVpy4vLh6GWuvg8g3zBRFp8JfbA68yWMd4pE5uPd4lKgky
         Fax4onG7hA7tXc7xUZDMk3VYcLuAwrUQ2hdtHm1erRfREK3xLSMrRBGAQdXFpZa5i0/p
         OAXPIGmElic2kDNDrnC6kcj0r8XfxIRG7fudtZ5n5Q+K7psK6wGAZvX1a0Vu30B3o0la
         Hhsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612564; x=1794217364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fS3fd1kxqIasLSOLsWPb3nWgBbFcJfSOZ+BlIh18+/s=;
        b=WKiBqNM65LfK8nnqouckZuxtxV6fU3s7fHg+83WnKXI1VBQ4HhVFVi/HyrBIxzsTKT
         8hFeSjVYFK/gLefARiNwZe2Z5aA/q7p/vUdH4Ks4rI7iXFH5e063hrs4dvyKePHPm6Ul
         iUge5xRupgl2E+ayGdzfcl90GIMLgMWek2Tqi53EVh984Dnk40ZqchTO6qBo+vxfVU7m
         on4WTv3Rs1RgTjnwYjcqyvaqsoHO8cG8DIOhwLanBpYZAM3dYMPNwdsXZs+hS4VlO6gh
         NKYozyBesxFcLaQgkf28m1cmWCXFIkuDZmRwsvrCdT5sVUCfjFiUmUnbg8oeJNV/XUHq
         UEZg==
X-Forwarded-Encrypted: i=1; AKwUvBxwX2VIpB5qPcgbAQLnUM/r4zqlURt6V2r22Faev6BgI9AQYeyodt1fCIFvqfV/0aGKc+rIATc0A4ifqdw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VKJuTXIUYUH8iwsHKIERW+s5ZTWEcF5rGmjtJCVCmAiuq6tWg
	d4LtXTgVW2xdHYuohFOZYRL8ExzD7oU3fxd5graL2g5rwAbf7uLHM+nW
X-Gm-Gg: AYBFou12e6gQszFk5uIcvLg173WoKedsej6M89LSSD8jlEsXSzn5OK/rw4snJUdNO7J
	W4ol9JAnavygCQpaFvZ1flI8OdwvI4CHdb//gNi+qKzJhUivo94xhfLKl2rfDcWZtqFJUEAzv/q
	2rEOS7mmYolFsGveN0cEk7Xvrto8WYFLy5bjVecjP5YFSkT+pIrLqLd4Su4vv7kVlE1AdtZEW6O
	l485TOp9JxQscKEbbIVma9uQMefmcmrrwCvdY5nwqsURCOjXSKK/SA+5k2Ij+8zasYu8RJvD6ef
	Lx1FVA1TlyB879cIaLvPOqvm73xyXnIsFaD9c2MCg8GhARul8xohLcQIhdZNwRyW5iLF3ZGvcTn
	y38x089bWs1JviN+xUlV0Ret9qIl0CAkdCQN+dTpaubuzsHO4HXOtnnztWp6BSjBXM552wgck0O
	3BUXWkRTmV0Exdk87IjKCd/gxrJwGkSOXXJ57TODsEvt0swKWXTQCBc/XF+SgfygPmZprx5LbaI
	92/sviWl3jYlzwSWgNY5ERu19aZx3SLy+6IAxRsEffTajjoV/xks+0/Kob3RH3m8/IXb2eo4i2w
	Bed6y50pmhTILnUa+zlwxu7WaUf9TdklLA4XivXwWlsp7fBLC6keOVs=
X-Received: by 2002:a17:903:13cf:b0:2ea:7180:3a82 with SMTP id d9443c01a7336-2eb36402562mr93347925ad.1.1793612564355;
        Mon, 02 Nov 2026 01:42:44 -0800 (PST)
Received: from localhost.localdomain ([155.69.168.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb77df90casm70975ad.0.2026.11.02.01.42.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 01:42:43 -0800 (PST)
From: Yuqiang Sun <izaiahsun@gmail.com>
To: sashiko-reviews@lists.linux.dev,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: amit.kumar-mahapatra@amd.com,
	luca.ceresoli@bootlin.com,
	harshit.m.mogalapalli@oracle.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: virt-concat: Tear the concat down when its master goes away
Date: Mon,  2 Nov 2026 17:42:35 +0800
Message-ID: <20261102094235.34511-1-izaiahsun@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <sashiko-outbox-193135@kernel.org>
References: <sashiko-outbox-193135@kernel.org>
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

On Mon, Nov 02, 2026 at 08:45:12AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Critical] mtd: virt-concat: partition order corrupted on rebind after partial teardown
> - [Critical] mtd: virt-concat: use-after-free when master unbinds with concat held open
> - [High] mtd: virt-concat: double free of eraseregions after add_mtd_device() failure

Thanks, all three are right. I reproduced the reordering with a concat
across two flash devices (it comes back as kbb-kba-concat after the
first one is bound again), and the held-open case.

v2 will keep each part in the slot of its DT node, register the device
that mtd_concat_create() returns instead of a copy in the item (which
also removes the double free of the erase regions after a failed
add_mtd_device()), and keep the concat, its name and the parts of the
master that went away until its last user puts it.

One note on the held-open case: a plain partition held open while its
flash driver is unbound also gives use-after-free reports in the MTD
core and the CFI driver, since the driver frees the master while the
open device is still around. So v2 makes a held-open concat no worse
than a partition there, but does not fix that part.

I will send v2 tomorrow, to leave time for comments on v1.
