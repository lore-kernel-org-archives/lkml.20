Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E3B42882B;
	Thu, 10 Sep 2026 09:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030933; cv=none; b=Jue55Z3UdZ2aCFFzZmzeJFa/Jp/0yOilaBQjcrCjd1pofqaHi2VvoySK4jVxvRhRlrOX557aKP6PWNpMlOEi/HTEQRl8C4K+yiEN7yyFXA7wTiJywCfvv46ZJH5KUwCaHDMMf+G05XSNGtasGAsFyvD8xRRyFLumyrbnAUXLx4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030933; c=relaxed/simple;
	bh=QEYke2hVNWv1EGqNGXg5xa9bpj7C+fUm0IIrTzQT/Fk=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=MqWF3PfA+sqEZv3kPj7/q/pZS8lysXhLiNXBTNNsLrTR0H0q19oYIf4xzt6a2Bv72E8z+NL6L8DzsEhlof7Y3G7Dk5yDY+US+Y9QDkY0Y2YtQ//0Q9FHy6okqDcm36/UB7dj+wCVaikZyKXM2Vv36DpaAZrQCtNqROjqgLhSL9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qhxugwRu; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=J8+toY9b; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qhxugwRu";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="J8+toY9b"
Date: Thu, 10 Sep 2026 09:02:07 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789030929;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OjNdpLihbvUXNfmsAhATQn6iCTcl3AP3II6xvpouQTE=;
	b=qhxugwRu6fh1SqY9kLsgdGryyAPAFxWZnSmzW2WrOldmBQ6kIudrHq6Cey5vn/U0cBlG7y
	XPk8w2B1x3EMoPp9B7CU+IhE2K/DfjLQKMO9j4Kj99VB28QJy4pyrY92v9M/zfuwOFJAw/
	CgMXBpz1YATSAIJHbom0yVt6PqjIOQH1706NbxDjeVGaz5if6r+TlgV2zer5vz30AzfujY
	ZBEswXaCwPV6oPnbgt1d/AVkhHbmoISrCim/XAhUXbGhD4mbFKg+NywAJ9/CqNwXK68jJ1
	RLzj0WH3E+ksijOE6Dp56nHZzF6e70uHXYffdAmYOdS6kpb+8LXQl24jI+l4MQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789030929;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OjNdpLihbvUXNfmsAhATQn6iCTcl3AP3II6xvpouQTE=;
	b=J8+toY9bIcUA3zuighe+fPLH2jgAqQSJEndgqyIwxJvQfE6JBP8DtYX+npQwzaGYjcCzVy
	l+/9zx5RxJHi8GAw==
From: "tip-bot2 for Vincent Guittot" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/urgent] sched/eevdf: Fix augmented max_slice
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 K Prateek Nayak <kprateek.nayak@amd.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260907123855.1297976-1-vincent.guittot@linaro.org>
References: <20260907123855.1297976-1-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178903092750.623050.7543123540318471247.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     9a8bc9bb4c3fb3218b4f151f98a722fbeb5b5c34
Gitweb:        https://git.kernel.org/tip/9a8bc9bb4c3fb3218b4f151f98a722fbeb5=
b5c34
Author:        Vincent Guittot <vincent.guittot@linaro.org>
AuthorDate:    Mon, 07 Sep 2026 14:38:55 +02:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Thu, 10 Sep 2026 10:22:51 +02:00

sched/eevdf: Fix augmented max_slice

Similarly to se->min_slice, init se->max_slice with se->slice before
enqueueing the entity so the augmented callback computes it correctly
at parent level.

Fixes: 6e3c0a4e1ad1 ("sched/fair: Fix lag clamp")
Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
Link: https://patch.msgid.link/20260907123855.1297976-1-vincent.guittot@linar=
o.org
---
 kernel/sched/fair.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index ade1ece..5b944f9 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1073,6 +1073,8 @@ static void __enqueue_entity(struct cfs_rq *cfs_rq, str=
uct sched_entity *se)
 	sum_w_vruntime_add(cfs_rq, se);
 	se->min_vruntime =3D se->vruntime;
 	se->min_slice =3D se->slice;
+	se->max_slice =3D se->slice;
+
 	rb_add_augmented_cached(&se->run_node, &cfs_rq->tasks_timeline,
 				__entity_less, &min_vruntime_cb);
 }
