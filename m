Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794319435;
	b=wLHbtwDBDPU6V4tPsE42IZy97jNTkOvuQJifjQyzFdJ8/RVe+WUL6xlJDwtc9Fq6qWl9
	 0ULt4IvY2/2a4yb/wmo1oa23SgtF1F/xZbRvkC7nR04miwy7wGqzGEcLIgMNGSZOswj4u
	 /xCM5o0yqWCh7mYydxbpggZGB8d8/QDYreQFq9AGZlzTa3br+KZ4SANgR++cARjse2Jgr
	 IVHZXyNWvQDLwhcAVlhlX1oOpSZRu+EQNugd/h/DH7MRM+3G/u+ZEGRWuggiFMZG2FyUq
	 MsgglXyeVxD6lHXyG7gcOYgsYSsltyovGr1OXKVnym5v5DT9PWtANjetCvjtlTgjZFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794319435;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=6GFrZFNEcVVsZPQvsqXmRkr0iRO2Hm4Oy+Pj3GXfb5w=;
	b=BgBj1+maxDyXJlbZ2eQhJh38kY7QFY4j8YDd3294gcsnv/y6MagcleJpjiA7rm+vNrYH
	 uy6+mFKjV1TFXh2L9iqipH4VWzg2i9afYeiBtfReW7cnk9jHejrzOYDZ0xiXVygXdPeFH
	 fYHp1TxTizMZOaC2zbADnR3ZGtJMkeyW8t73Ire1Muj2f1StVbb8SwQ3AT4B9CgpDN/rI
	 fPXaOnrouE5QRREM/MqvOqbey4xOwYlI6Y/b7xUnRxLojN2cnWuP1A6NxzlgsdueSZSMk
	 WZnOTk/Qb8usQ8EU30XxflSEjfkAXhWkEueXW/FAv92VjPxM5W6ZWxlCJLzTvN440MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ENZDWd3u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB8A606A326;
	Tue, 10 Nov 2026 14:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ENZDWd3u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BE7E1F008A5;
	Tue, 10 Nov 2026 14:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794319434;
	bh=6GFrZFNEcVVsZPQvsqXmRkr0iRO2Hm4Oy+Pj3GXfb5w=;
	h=From:Subject:Date:To:Cc;
	b=ENZDWd3uGg1+Tmo3zXLk6L6U2lFlsgi1kjOdxkvSqhV71fIx7EWonGTJFA3F84IlD
	 oZVvskTxx6bCMQsT725kpRjsPu/mc1UTsh/ZUwFp/dLB4CwoI6uFAwaISfugs+cz3F
	 vZ1rQ3Y/8uhdQi4/5//DK0G86lpSu5QDLmb5iZ11/c050AB70YCa5UCg095gLP8zgn
	 3yKPz7CLTX8RAlP2+xDabhc30jbnkyR+elZY79Kq+5HjRdSmcMcRlaNPW4fXXZigFW
	 UJ6TskFyvUm6QeZzxvUjYnXniLsqP+ABELFTMsq4JjgvYH0CQ/iKlOzcr6gvnT01Cv
	 BmqVUHkNyIy9A==
From: Joshua Crofts <crofts@kernel.org>
Subject: [PATCH 0/4] media: remove redundant
 pm_runtime_dont_use_autosuspend() calls
Date: Tue, 10 Nov 2026 15:03:46 +0100
Message-Id: <20261110-media-remove-dont-use-autosuspend-v1-0-cc07e71b30f9@kernel.org>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEIk82oC/x3NMQ7CMAxG4atUnrHkZKiAqyCGgP+ChyZV3FSVq
 t6diPFb3jvIUQ1O9+Ggis3cSu4Il4He35Q/YNNuihLHEILwDLXEFXPZwFryys3Bqa3Fmy/Iyuk
 ab/KSKDpO1DtLxWT7//F4nucP6oURanMAAAA=
X-Change-ID: 20261110-media-remove-dont-use-autosuspend-a8290b020d6f
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 David Heidelberg <david@ixit.cz>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joshua Crofts <crofts@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794319431; l=1330;
 i=crofts@kernel.org; s=20260422; h=from:subject:message-id;
 bh=7WsUjSa7CRk1bRkJLcw6la5WjIYAu39ccNcQBO/iUB4=;
 b=RWCKpNdGMrBHWssnIQ6L80sL7GB3bPSKMuoW8APdnb1uBvw7VyuObpaPzTjEWhziKndG23Iju
 TYExbCGsRknCKl+ylKWrDd0wMnQdt/w8Ar0311y9hYYCrydQlcQsgS5
X-Developer-Key: i=crofts@kernel.org; a=ed25519;
 pk=Xd+UVoRPiiI0K3LHQ2XIcXmO0jvVuFTv9eTx3lgBphI=

Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
driver core is now responsible for undoing any
pm_runtime_use_autosuspend() calls on driver exit.

Remove the redundant function calls.

NOTE: Some drivers in drivers/media/ still keep their calls because they either
rely on pm_runtime_dont_use_autosuspend() before pm_runtime_disable() to flush
pending autosuspend delays and trigger synchronous runtime suspension,
or operate on a parent device rather than the platform device itself.

Signed-off-by: Joshua Crofts <crofts@kernel.org>
---
Joshua Crofts (4):
      media: i2c: imx355: remove redundant pm_runtime_dont_use_autosuspend() calls
      media: i2c: tc358746: remove redundant pm_runtime_dont_use_autosuspend() calls
      media: i2c: vd55g1: remove redundant pm_runtime_dont_use_autosuspend() calls
      media: i2c: vd56g3: remove redundant pm_runtime_dont_use_autosuspend() calls

 drivers/media/i2c/imx355.c   | 2 --
 drivers/media/i2c/tc358746.c | 2 --
 drivers/media/i2c/vd55g1.c   | 2 --
 drivers/media/i2c/vd56g3.c   | 2 --
 4 files changed, 8 deletions(-)
---
base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
change-id: 20261110-media-remove-dont-use-autosuspend-a8290b020d6f

Best regards,
-- 
Joshua Crofts <crofts@kernel.org>

