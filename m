Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792967861;
	b=bLuWE/RnjTe/QAvWBr4q2idBoD4bF+abnzSSpgi7H5Ng6PRb5Q8LPGOdOleSpYaHor2e
	 ZdMs3AnolI4RbPSRyHUh5yCGl5PgQ6FDkg92yTHN7tT959Iz4hzRhaYwb4LwmDYMIhe8O
	 H9wnMKsHWRAEpRxKx/EN6B/FIm7juYHBUUUWBfN5KvsMQ34LSOg+7+buN8KKFimGHqiaC
	 NFScWI0Qm2uTaJ01mVcuOu4sgHm1F0d3JrvSwZsdXE1TkHfPnN3ZE7yPmliy/5BTj+0cb
	 YLZsWBcfPEhJ9X08WSOJd8EcWqle/FyigSSTaY56nV6YZYAVhIS4thT6zKHx8UMeqxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792967861;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=7impYwACoISZwGlOc5Priuk2S9H12up09tmswYx5jhY=;
	b=JBtrnXyyqnPdHIquzW4SqQdc9fgKeqe9He63dO4vnLg1eFXY7lQJD1LYm+jqXiM5rqUP
	 FmY8sft+4gagAAFHlxoilEhIocBrsWWIVUUmv1qz8jzqS+ujBjdaZAnnbPwT38Zk6EdkF
	 F6kjfkLYoQySSPxoOnj92sSgcoslpZ6Ot22ePn04reG3hbbyo5Edg7ZZvbuRiHih07emo
	 WQMA9ItSJk+IJz7ROrkL1+PHaFjtlg4fnNGfL3cSPVrcVLU88Bj6JaLklKUMWZgH4qZDj
	 W29Cma202chCgGhTNFaoupWxB8ercEAdjDM68tSfsrf/qxhM8JSvZdmmAcu1TWWAd7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="f3qN/86k";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ME9P9Qob;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22CA606A31A;
	Sun, 25 Oct 2026 22:37:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C22CA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=f3qN/86k;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ME9P9Qob
Date: Sun, 25 Oct 2026 22:37:36 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792967858;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7impYwACoISZwGlOc5Priuk2S9H12up09tmswYx5jhY=;
	b=f3qN/86kYG6959rNNlZiNvh4T5KwcCR7LimAcYAD6cQZvYO0ZH0E4hWp1kjrqvdn0WcDzh
	642tZbsxyMoAlGjWc/n8lQln9gqvagDzOTVMqKB+TJuaQWYFWXISWGydpO3NSlgB8H+9Z5
	QHh+U0CHci1NyOdGo9CR7hw7pMldFMWqh7pWELARNq88Ruef0iX6WtEmT4RSz+7M3LHey5
	PRrLUsveQWX/FdEfey3yoUaykiKr32SJmIbEj98qSpPDOHSTBEvgadJLlqUh1CX4/DQNlW
	ch68xpU2huFciOWgZzy6rLeIQZ9hE0TjpxhCkqBc5jL3xf91f4OZjwRVhHPkMA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792967858;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7impYwACoISZwGlOc5Priuk2S9H12up09tmswYx5jhY=;
	b=ME9P9Qob46XCX0SOSjw47zfl98g5N6m0pUWydv0olopxtm77HtEri7i4OBjawSkCrXvlj1
	0J5e/gm/t7g8pUBg==
From: tip-bot2 for Thomas =?utf-8?q?Wei=C3=9Fschuh?= <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/urgent] vdso/gettimeofday: Correct the read of
 tz_minuteswest and tz_dsttime
Cc: thomas.weissschuh@linutronix.de, Thomas Gleixner <tglx@kernel.org>,
 Nam Cao <namcao@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260902-vdso-tz-v1-1-4d37a6b85ff9@linutronix.de>
References: <20260902-vdso-tz-v1-1-4d37a6b85ff9@linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179296785683.4109677.11162190329940318146.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/urgent branch of tip:

Commit-ID:     cbd0f65b48f52d308c457b0fd5201324abadb501
Gitweb:        https://git.kernel.org/tip/cbd0f65b48f52d308c457b0fd5201324aba=
db501
Author:        Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
AuthorDate:    Wed, 02 Sep 2026 14:06:15 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Sun, 25 Oct 2026 23:30:54 +01:00

vdso/gettimeofday: Correct the read of tz_minuteswest and tz_dsttime

When these fields got moved from 'struct vdso_time_data' to the new
'struct vdso_clock', this access was forgotten.

'vd' is not an array, but a pointer to a single structure. The code
works by accident in its current form as CS_HRES_COARSE is 0.

Replace the incorrect array access with a regular pointer dereference.

Fixes: 886653e36639 ("vdso: Rework struct vdso_time_data and introduce struct=
 vdso_clock")
Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Nam Cao <namcao@linutronix.de>
Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
Link: https://patch.msgid.link/20260902-vdso-tz-v1-1-4d37a6b85ff9@linutronix.=
de
---
 lib/vdso/gettimeofday.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index f7a591a..6e9b030 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -374,8 +374,8 @@ __cvdso_gettimeofday_data(const struct vdso_time_data *vd,
 		if (vdso_is_timens_clock(vc))
 			vd =3D vdso_timens_data(vd);
=20
-		tz->tz_minuteswest =3D vd[CS_HRES_COARSE].tz_minuteswest;
-		tz->tz_dsttime =3D vd[CS_HRES_COARSE].tz_dsttime;
+		tz->tz_minuteswest =3D vd->tz_minuteswest;
+		tz->tz_dsttime =3D vd->tz_dsttime;
 	}
=20
 	return 0;
