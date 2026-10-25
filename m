Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792895009;
	b=4LtId6sVTD9wDe96Lomhn9qU1w/kiYv0QX2NoqwoRdthrq0QNky2zwf2dHIVM1UrqKMR
	 nvvsonA8/RT0Wsb6aqJ7M1t3PYI+rvrrvNaj9fpUV3PFfUnhz4ElHBcUnQ29j0N7PAEj1
	 0uYezcihI1ndW9h237mdbvobC02dJHWuCP3/v0B60ofqLM2wuWTT6tI1KxT7iGqhgEW2E
	 94N3bfsgesoOg0/rBLzVwxo7yUb+J1EzIVOrJ2HOkfzJIFhq9tHcOc/nsI0N3pcopMj1c
	 kJP1jJkK2YPh1wPuO3rTmPyMFOxgSo8mVt+AnY9mXRjmveGM0/exbYFWtHYPbOIRo0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792895009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=8ivcDCD6sbT3HeyNxmBNTblO+eeeUzkaQd94WtAs7n4=;
	b=CjGwj3gCTzt+ZWMpYvAHaGkaGu/bqNL4E9YXdZSYBKItvxm9K3pd3xAWm9vv2RBT5Ylu
	 SJyFB0gDcZwgn3mAJC4geuD80yJd3tUrdA9KwWGYlDgFR+kpv3by/ieEfz8UkVuc+AgMn
	 3R6fMvH+PJ1O2A51nggWmOMskkeJ2UmzZbLooSmS6grMbz+XOBECqCqHUb4Ap2leezZpB
	 7i0u9QquCcxCtcIFoaFDiusp8BwMAZikC8uxGYDGJdBlvISTxyRZlld9A14NCkhhtcx8q
	 n9iaUGpuXnyXhjA66xsSSHzQaAD8oGNIwKLZIwBNZuHQDGrOYxmPloUEUfewmjZAmyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KA6CYmBc;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E54606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3E54606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KA6CYmBc
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-16079d54c17so1058163c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792895008; x=1793499808; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8ivcDCD6sbT3HeyNxmBNTblO+eeeUzkaQd94WtAs7n4=;
        b=KA6CYmBcqsQvC/HFX0T1GLe65+gfKI4HeyLvBOp2ra0ohuc30NDAPlPT3ZOK0Y4csF
         m399BDBg9cUw+07eP4ywoxkaPvZiGyR9gr9FRtxPmNmYsvEp2IZPWLpxGmIXNcgx0jC8
         ctdDNw2lZCggf/ITO3oTzzfeLCaz0I6qAtDSaEHXt0Xi795KZmztElZYWhwlZenlLK09
         yi1djcyDu5kgl91J6j6HiGeJdLQAY1Q9zhsbgbLDHTOI3QwtmgqS1TJeuL7TarkS/Bxi
         xvKphuigbmylaaLgL1T6+Px42KezjZ4WzddBA5QZXyVMLP65iC0KJfgngy5Vd32SHiip
         G9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792895008; x=1793499808;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ivcDCD6sbT3HeyNxmBNTblO+eeeUzkaQd94WtAs7n4=;
        b=OSQP8dBIcTjbA0e2isGx16zckZxFvWvFb+wRalWfTJ+/M+8rkMiNkZq98k0WZnFK7p
         zDktYTUHC9+k95LLP4v9mrld1fStx1cA5TLoGQ/Y+UJBOb2weTrbSHQpFx/EAFGpS/YU
         4unDdfE/OmOPCxxARlyWEnHecZMFG52qsguspjaE3B6uGOMYe2MSQ1useI2zJG2+Vwkm
         4R+6i48vGDUD9PDeBB4lYjduWL/ZqqJ9c6uEDcETOsxIZiMnBV8sAB6qJVRveaa14dYb
         j0lXGGP6/dv6G4qeFjfSUTAdMYwYFVbzz7rtDMsUsCvWEj27Pwyt2LdhCQiPjh6sFhJ1
         iKfA==
X-Forwarded-Encrypted: i=1; AKwUvBzpeTEpI0QH+JMMXXL+Gpow31M5eMSkex0lZYmw6Tt6JmBxj2vWpSeKHh0FwMA6QsnlQFnjvUy4iX6d8Oc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVnhiWfkCaJFT83GrIv9PdffA5rVl9xzzyOsAsLnHHRTIbewqy
	XSOmac2gEsCs1U4Q5Ct9HKjEUpet/3wm8fZ8Skn3j5vVxYgM0EUrOhszg15GyCF2wp0=
X-Gm-Gg: AYBFou0c17qfYdQ2K0s9ut9Zw4TwrtmbTX4/aLtMg2D8Qz4yDNCLw5jpSw7sYjhu7Rt
	rs/PJlhiKAffijSPad7uKX/yIF5zxnixp0229n+zFero1dc1rZn6kEmbkeqiufekBdYVb8Y48Et
	OWTKflNjKbN1lnKyf5H5QWZaZZfUCGP54eDBVknXBc2K/iAV2LNK6d1e/7eIwwOTZr0Yit3QzVm
	DeX3dQB+F06yydyoLIA1TISMZllGemsHezedMpmuvfkRzExjR5tWlW+75oOb3ebaiWMX4yvw/J3
	zzatAfvNljItxRxZj/hI0maqniYfU1jn7KPmrRCupO6RzcFe7VgKYHcz2KVachrcNp6BiDBA8DB
	VJqcqEDqCbl/aMB3qbhKJTwNFFAVAwYgd4TLWaO7M3MGXDD6NSgPd86icclDTxWRtZkchHYRVAs
	oALHs3JgSurjJLetjybKrZx0ewmzE89eKmicnpHwNOmRMOWFFsgDzL7uWLXzFgZMxdMpcdhyMvJ
	6NnNdnpy08FhATBshv7dSbacn6BS39sUDrZRtHv5SyKr/lU/uVYQzzYoN/hVuj2859O
X-Received: by 2002:a05:7022:607:b0:15a:9834:73f2 with SMTP id a92af1059eb24-19937bb20afmr6922856c88.38.1792895007760;
        Sat, 24 Oct 2026 19:23:27 -0700 (PDT)
Received: from [127.0.1.1] ([183.242.161.82])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a1bfaebfsm11547267c88.15.2026.10.24.19.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:23:27 -0700 (PDT)
From: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, linux-can@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 0/4] can: don't discard the platform_get_irq() error in probe
Date: Sun, 25 Oct 2026 10:18:45 +0800
Message-ID: <179289472574.8393.12094085935716992853@gmail.com>
In-Reply-To: <20261021133130.2cf75b3c@kernel.org>
References: <cover.1792118040.git.chaosheng.qu.linux@gmail.com> <20261021133130.2cf75b3c@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi Jakub,

You are right, and thanks for pointing it out -- the Cc came from my send script,
not from `get_maintainer.pl`, and I have fixed the script so it can't happen
again.

To be explicit about what I am not doing: I am not resending. The patches
already reached the people who matter, the CAN trees are the right path for
them, and another copy in everyone's inbox would be exactly the noise you are
asking me to stop making. This is just the acknowledgement.

For the record, the same mistake went out in a second small series the same day
(`can: slcan/can327: publish tty->disc_data only after register_candev()`,
2 patches). Both were sent to linux-can@ plus the per-file people from
`get_maintainer.pl`; the extra Cc is gone from the script, so neither can repeat
it.

Sorry for the noise.

Chaosheng

