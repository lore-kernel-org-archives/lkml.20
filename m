Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1436638F65B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741549; cv=none; b=MIX+/mihTUa1RTTChazv2bA0TsH0CyphOUvp1tEupdU5p+z8KCIP6DuBgb+ObNM1E3csZwXgYclaDdwfA70Fab/N1k1Z02yCI7vdcRkg8JnWtknf27sqymfrKCn86N1wEeopoE0ov+5lzhcvUs1i49/uPlJ51mBcFiiqvgbYB2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741549; c=relaxed/simple;
	bh=qRAYXoCCSr7solrRnmGhYoOFf4KTXsfyvV1ut1lsUlE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jgPF+nn4SsH4nerh9AWv1lGaxti2gyesGFVWVMNNWGvPPbOxjK2MrIaBgSFzdgwlMkYOZz3Yr2zYJ854o/0vAK5Ajbt2MqXQSBUc3jSXoG9Pq+11HP7csYzkM3DEqqO1tGUAuchtaHKv576FQPq1xWEALzP2tqN+85bxDRePwqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=aqneHMtC; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="aqneHMtC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=2KSMMtSUubg+dR1KpjZil1lT/CxpoiagR60ZzBrQ5pE=; b=aqneHMtCwlj4CyAKVlYAU1Gd6D
	QtZsLbvbS524DpYQZ0WCuHIQI7UGZyT42dgCsSaXL2eD/Xner07AQwGGHSPBCp7Pmlq/uNBPwtkw4
	eg8EcYH5yB+MuQXxxrSUQYeKOuhiPHXlnIEglsHPoSjLoRY0VQW3yKHmuoqu+mmEzHUHeYx5Queqn
	vDcNvFatwZOcWg+gFyZkPzfVikEeA4Ok55gsN8wnxNjR0bzYam3ZqsPy1tbR/NdHCzwotjNnFegVg
	Zs5lqEbd4sCeljHmY4ouEIksZl3xbfkRzWEEoJ7vcG7bKpY25ohJRs6+l7sI0agnE0kRwyj/UE/gp
	aUZQZt+A==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x7ZX1-006n8v-2V;
	Fri, 18 Sep 2026 14:25:40 +0000
From: Breno Leitao <leitao@debian.org>
Subject: [PATCH RFC 0/3] workqueue: Take the pwq backend from the attrs
Date: Fri, 18 Sep 2026 07:25:32 -0700
Message-Id: <20260918-wq_final-v1-0-5c43c08a26bc@debian.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN1JrWoC/6tWKk4tykwtVrJSqFYqSi3LLM7Mz1OyUjDUUVBKz
 kjMS0/VzUxRslJQMjIwMjOwNDTRLS+MT8vMS8zRTUpOS0pOMU4ySDO3VNJRUCooSk3LrAAbFa0
 U5OasFFtbCwC361NtXwAAAA==
X-Change-ID: 20260914-wq_final-bcfbcd3b0f79
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org, marco.crivellari@suse.com, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=2428; i=leitao@debian.org;
 h=from:subject:message-id; bh=qRAYXoCCSr7solrRnmGhYoOFf4KTXsfyvV1ut1lsUlE=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqrUng4uDRvoXddwjluOhzuuP2WUvi08vaLt/oU
 5mhoAiqklmJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaq1J4AAKCRA1o5Of/Hh3
 bbyzD/0fwpnr6EDeHNBFzppuWVSOJq/n0XXcyVhFfAcSFDWZB9N2IPhWNnGwQ2iUADfWPooN3fL
 z73tOa+NQJpQClGGOkVKr+ZwflaX1O7y+IRKOaXsrBKkZwNMu9iwVisunGiE5K9Ozpc93pGePGO
 7jONeQekj718+DSNA7uBfxcU1ZSxn9Nnmdt/e7S8Q4Ra62oFZWIJGVN/4+VdVivv3n1GA6upkY9
 7M2Rrgz/BEiwjRT0kgy4gCZe/mfNWZSDLD2OL7ozAs+34TOJGbUWQTutzJce73kQNJriC2b47ql
 dezJx0UXwCZQwefVdhF5Y12kVN69bSsW+CUPL2Cf8Rylw0H7EHgkrSjUrHFHkwzQU82OTbMAKLY
 O0TuIsFApqN8akOLX8X0x7YzyeXfoqW1o9CylhnEjM2LEbrxpckgiLG4DcNBpZ211zNLq2B9LPj
 c1Jo8uColcIk/I/kPD0amxrkr44F+rFq3y0HztCkTTxdM6LMihKST2tcm5QvVem70h2Fn4YJH5Y
 oBlSotk/EntcPvGCp/vv2BJFaze8+UOKTIizWCtUwM3nw2PNqY6LFCkfAw6pwJUtsoXkyNFrOCL
 i40JIzyOggxI/a9W1HqsyGSTshBQswPwbq3Pf5kzaoRGbd10cP5b68Bc+cb3XONYGazLD/yhc2Y
 wzvIpp/3uViFf1w==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

From the top of the mountain, Tejun said [1]:

  WQ_PERCPU would indicate that the wq must stay per-cpu for correctness,
  and we'd also want to allow concurrency management to workqueues which
  want to be percpu for performance reasons but can be switched into other
  affinity scopes for isolation, so it should move together with whether
  the backend needs concurrency management or not instead of WQ_PERCPU
  expressed at creation time.

This is an RFC patchset that tries to translate that into opinionated
code.

Design principles:

 * Keep wq->max_active and wq->percpu_max_active both current. The two
   backends meter work differently, and a pwq must not end up metered
   against a limit nobody set. (this is the semi-conflictual with my previous
   commit 27db9dd7f84f3a ("workqueue: Give percpu workqueues their own
   max_active")

 * Create a ->concurrency_managed field in the wq attributes, used to
   decide whether to do concurrency management or not.

 * Move WQ_PERCPU onto an UNBOUND workqueue with WQ_AFFN_CPU affinity and
   the newly created ->concurrency_managed. WQ_PERCPU is then only the
   promise that the workqueue stays on that backend.

This is not for acceptance, given this is drastic and it was not tested
enought, it is more to share what I have in mind and get comments from
the community.

Not done: the switching itself. concurrency_managed is fixed when the
workqueue is created and is not exported through sysfs, so nothing takes a
workqueue onto the backend or off it yet. WQ_BH is still its own path
rather than a third backend, the static per-cpu pools are still looked up
outside unbound_pool_hash, and callers still pass WQ_PERCPU rather than
asking for the attrs they want.

Link: https://lore.kernel.org/all/amESSqf0TMmzhFGz@slm.duckdns.org/ [1]

Signed-off-by: Breno Leitao <leitao@debian.org>
---
Breno Leitao (3):
      workqueue: Maintain both max_active limits
      workqueue: Add a concurrency_managed workqueue attribute
      workqueue: Back every workqueue with the unbound machinery

 include/linux/workqueue.h |  10 +++++
 kernel/workqueue.c        | 107 +++++++++++++++++++++++++++-------------------
 2 files changed, 72 insertions(+), 45 deletions(-)
---
base-commit: 9d4815c14f7faf789aeaa63515024168daf0390c
change-id: 20260914-wq_final-bcfbcd3b0f79

Best regards,
--  
Breno Leitao <leitao@debian.org>

