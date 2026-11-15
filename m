Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.125
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794703799;
	b=oFjg7xpgeUhw6UoNdlV+79Isz1xikWGPElw/I/OXJLB1OAtFgfvpJk6Jd9yeVcnLzAqG
	 D/BCRDwxkC1cfe0aIs70veJnK5k4HQwjOqbr+sYPBX31z5rL4wYpj4wfDIMF5J8SheWP8
	 HegC6eekhNKDlyz1HC+KR6ZIxU0N9GsuFcl+E/vaP3NpLWW3d1WemwvlIC4B2IjGTDQ34
	 8qUZIcPph1yJyMa0Jp0jNw/P8nA//2tUrCjGkq9YN1JCanTKnY/MxzS77JAoX1O2kfuPW
	 GFZBHt/WUquNrEKJlU6R7HFW+u4DJx7TmRf0aUqzByiH+ILTbqw0Ij5gI+r3LNTf6QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794703799;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=8HhBoJ0oLDIkG/m3q7iXHnaJgleISQvg2LeUm5lbyGk=;
	b=vwSFOhW30d9Ab+New7ntv29ic/J3/8wbI7UnmxZbC1DDMeXCn+hr6/bAecFdHQyIx8FZ
	 Fk9Y1q5ZMMm0sNzKM/m5POJVV0SnaOamVLZ+R52+nzU7xiW5axdnvTVSehWN59zjF0qXP
	 h+vtLYHw3GxSi1LAH1hq566a/WSornAVHwRUYKt6ILSH8ddguFBssWo3VBlV/2CQ8SV6n
	 5Q6NTzvtdxS3XVtqSHJqR/u1JB5AELJF1tdy7+cfKfZw8t/OkZia99vAud1e+aCsupDu0
	 KrsQp8tY2qpjxSYwxoXi/i3uyQ69HINniuYf+QiVHXuQ9LlgheTefq5h4FLvSFD1KbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZmF3OfR+;
	arc=none smtp.remote-ip=91.218.175.125
Received: from mta0.migadu.com (out-125.mta0.migadu.com [91.218.175.125])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CB0606A327
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:49:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95CB0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZmF3OfR+
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=NSiCSGoCCyJBHjU2+fpDRU4Sn+QKieajStYeP4irVHU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794703795; v=1; x=1795308595;
 b=ZmF3OfR+T9xDVYyAft+FWe6oOImWbibsMqMV6h+4agbLfP/ZYcqkUWE60f5/I1pjL01Zatp6
 rU2DP5nj4VLsddMm0imPHyUoV2tfEXS1bi4a9emY+zGTNScuQJKazJv+1EXKBXWiaDFRKNYR3Ge
 47A80tS80tUqsjkYFfCsP+ik=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a0b98ee2d4f930d1;
	Sun, 15 Nov 2026 00:49:55 +0000
X-Mizu-Trace-ID: a0b98ee2d4f930d1
X-Migadu-Flow: FLOW_OUT
Date: Sun, 15 Nov 2026 00:49:54 +0000
From: Bradley Morgan <bradley.morgan@linux.dev>
To: wusamuel@google.com
CC: kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, pavel@kernel.org, rafael@kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_freezer=3A_Check_frozen=28=29?=
 =?US-ASCII?Q?_before_freezing=28=29_in_freeze=5Ftask=28=29?=
In-Reply-To: <20261115003113.1852160-2-wusamuel@google.com>
Message-ID: <09C404BB-5914-4658-801E-4DADD3411CF2@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 15 November 2026 00:31:14 GMT, Samuel Wu <wusamuel@google.com> wrote:
>During the freeze stage of suspend, there are multiple passes over the
>same list of tasks. Each pass tries to freeze non-frozen tasks, meaning
>that the number of frozen tasks increase monotonically, and that each
>subsequent pass will mostly be iterating over frozen tasks. Therefore,
>it is faster to *first* check that a task is frozen before other checks,
>especially since the frozen check is computationally trivial.
>
>Check frozen(p) before !freezing(p) to short circuit the more expensive
>freezing_slow_path() calls, while retaining identical return semantics.
>
>On a v7.3 Pixel 9 device, this consistently reduces freeze_processes
>latency by ~10% (~4.5 ms).

7.3 PIXEL 9??? WHAT HOW? THE BASE ON STOCK IS 6.12!!!! WOW! (Please do for
pixel 7, I want flair :c)

>
>Signed-off-by: Samuel Wu <wusamuel@google.com>
>---
> kernel/freezer.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/kernel/freezer.c b/kernel/freezer.c
>index a76bf957fb32..1adf09321389 100644
>--- a/kernel/freezer.c
>+++ b/kernel/freezer.c
>@@ -166,7 +166,7 @@ bool freeze_task(struct task_struct *p)
> 	unsigned long flags;
> 
> 	spin_lock_irqsave(&freezer_lock, flags);
>-	if (!freezing(p) || frozen(p) || __freeze_task(p)) {
>+	if (frozen(p) || !freezing(p) || __freeze_task(p)) {
> 		spin_unlock_irqrestore(&freezer_lock, flags);
> 		return false;
> 	}

Good good.

Reviewed-by: Bradley Morgan <bradley.morgan@linux.dev>


>

--- Thanks!
