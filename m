Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988247;
	b=uHAeIv6BtspBO0A08ayqDc5gfHn9U35XkfiIr7bc4/ZrPD7NDF1bdRYLk4UhY7845aLN
	 8HBQc+jxxemQMDkmrEaNWuRkfd3qyN/XWMmpsFZO6U6bWVjS+7tm12L4OQrIN0XvNqwlf
	 yH5c1hprhEdFtjA7sUajzBL9NEC3Nr1M8vWohSaXOIOddbFsvWh8ttTDQnpz5VFDqYtaN
	 Xo4sAWRAGa4+ZFRjECNSbxr7F53N8UhUQW1TC1fNaFDxlKTi+G4Xw0Y5CSRJA0VLCh9vX
	 L9yE+M5P394nc5yIAzT25nblVsw2PJu3NskJJ2S9NsvnXlV8l6928MAqPtMvDC+dqeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ff87flfpWxQA4dJrc987lusQnFIhkWINyfHTfPBOik0=;
	b=rFhjTHsGMtQS4Linl1Ao+2+B1J15Fwn/FwRtd+ZxUKJqg++mPHXzmbOy0qpUpe6DztXF
	 4bx0M2PMYSHiQQIi3caFzkmw5D30qzedBPGo01vv1XpZz91fN+22ZQwQ2kMarsEDa4b32
	 VHcH8MReZl8KyJvtq6K5br3piEyZt7zpZ7pva7nDdZZp5GyBVkt74K4OOJzSlfdyI2l0J
	 naI8wUDKwgI0Joh13EK6e2ZIxKT1k75bVjLsW7kgKWzB0ueVL7GUzIFnu79DvbGHUrGP7
	 baouztbnB+2Hfc6yMs6tPlhcz2e173glo3bWjrGzHuNLIbGIwAEbrWy+/WWHqqnP/oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YWjno4e7;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0742B606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:04:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0742B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YWjno4e7
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ed1b9e8f43so4036895ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793988246; x=1794593046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ff87flfpWxQA4dJrc987lusQnFIhkWINyfHTfPBOik0=;
        b=YWjno4e7L9L3NjRYdqODuPBgXA4YLXt0z/Zp0jjJWNG/wwMi+2M7aEl0GWBS+gm/fJ
         qssPwwDTwh9WFW+bzyCVHhT9i2g8HUSKWa/6s3L5Ukw8ES1qfiBrYU+GSzPhPty4IRLh
         SK9gsTGLvMhoj92IV20iEErU1/E6HKFBbDIZuIe1nGsh2qsqMCmkmtukdQ0HaIYUAS6t
         BkxCjHMAKugFN6rqg4F7Tf9rWyTrqoRQ9iVUp/IbC2LuxFYADi45ENT0mpuBbe8AAPfJ
         HeMRsXNivXuB8+iVacAnZOXeV8Uwmq0D2r3V6OH8g35CPpKiuTZRY7bP3ajUI2QkbwSP
         c3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988246; x=1794593046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ff87flfpWxQA4dJrc987lusQnFIhkWINyfHTfPBOik0=;
        b=jnY5mGFSCeq98XJQDB2DaKSzjS37yBgW3MhZsXw5CbJTGfGgraB4oxzERgS9wYj3Gp
         Vywv9IWq2/IforTZ1qvQrtDhSw5eoDX2mJClGIbwHJHb/pz0JI6nzUYP36tZzQAAAv6W
         rMMr8boLRh/EfWniHBx8Y60Be8OP/fD2+CIPhtualBK6ijdrdBdqtReWPJ6QeJ37KChg
         FQMVPrestvnD9+5m/Rz989gem2DLwX3PDhZ9R540WmWckTOBcIYdRRT4w1GS4exYA/tm
         921fk/95GVVnTSx8pxQcbQyNsNS0iVkTpGRAiMGYQhlY8UnaB5+nMxAWIStGxsrBB3zZ
         LUUQ==
X-Forwarded-Encrypted: i=1; AL+hErExMg9S4TKUG4u5kdVreakBCIRtBB/RBPrSV9pnRMV2q6P/HzN9Dhs9inlVAVA4a9HE+WoD2d1NyMa67Vk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+o5ZsPJP6ZlEWI2y1sO3iHx+Wx2bKM/0edEmCZb2Wr4g+L59gJ
	5u1Wi/nWmVMkIgZOn787KT6VGcCqOhzKjIVa50EZl2lxlLAnSkbR7I+y
X-Gm-Gg: AYBFou2kbjukvDa0IjQ8LPnhuR/roGWkzA5CifL2Id8AYrHQ3+5nC+EyS1N7nV1eD/Z
	qpCxdp/1UmlFC0asPeXpNmYMgypq9VhpUwnFLvqEmtP7TchzORNmEa0EQQwFd+cWw4h9VFrA486
	N205zoSbFmMu+9GWZHp0IS8lc0ju2pEggeZRFuU0Mu9LaP6dbfCJshPgrmk0XO4jrZ+0P1iz6Qb
	54PrIZEpt7qdU+E54Y855pEMUoA87/kA0KCvQSaXvATFZPu5+8YtdpgSOz3xB4N4yBZOuxOEFAe
	uZ2qEnUV6vZgumJu88zdJn2rflYKXn0shjb0D2jcFmmONehZ6yZefqE6W4D0X1Oqg2zQ1AAt6ba
	qkkst6wPTxsqN6oX3/rcB1OO39s/eNaNHGVT4SbZtwa7pxpsj9WIHjaFqDnMdKkvLK0q4nhUcKf
	fAdRpzPbeXBgudnn3RJO9ENZcqph/kbyxSMWYvgLGjc8mY8AQGYPj/VUQk9vcW+qZOppzVRonw4
	xE2BkMHwazRcNJL6kNWpPL0kFLHPpFavhTzWcMbQ98gkdAFW3cMQqSa6qNAWSnVKakEGsp/1NC8
	uc4IuElhPzlr9jCVmP83WzHq3aq5jYLXBKAWGVyG6RUQgMdReFklGELTBNEs4uOGOj+3QGg65g=
	=
X-Received: by 2002:a17:902:ce03:b0:2e9:6790:212c with SMTP id d9443c01a7336-2ed40c494f5mr41103385ad.30.1793988246266;
        Fri, 06 Nov 2026 10:04:06 -0800 (PST)
Received: from DESKTOP-31QBR7C ([103.120.166.85])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47da165dsm8057515ad.73.2026.11.06.10.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:04:05 -0800 (PST)
From: Rahad Bhuiya <rahadbhuiya2021@gmail.com>
To: tj@kernel.org
Cc: void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com,
	sched-ext@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	Rahad Bhuiya <rahadbhuiya2021@gmail.com>
Subject: [PATCH v2] sched_ext: Reset task fields on exit of an SCX_TASK_READY task
Date: Sat,  7 Nov 2026 00:03:53 +0600
Message-ID: <20261106180353.457-1-rahadbhuiya2021@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261106142818.1475-1-rahadbhuiya2021@gmail.com>
References: <20261106142818.1475-1-rahadbhuiya2021@gmail.com>
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

Tasks in SCX_TASK_READY are attached to a scheduler but outside the ext
class, such as RT/DL tasks, or non-SCHED_EXT tasks under a partial switch.
The scheduler's BPF code can still update their dsq_vtime and slice (for
instance, via ops.cgroup_move() as done by scx_flatcg).

Because __scx_disable_and_exit_task() currently breaks out of the state
switch for SCX_TASK_READY without calling scx_reset_task_fields(), these
fields are not cleared when the task leaves the scheduler. If the task is
subsequently moved to another cgroup/sub-scheduler and later switches to
SCHED_NORMAL, the new scheduler's ops.enable() sees stale dsq_vtime from
the previous scheduler's clock.

Call scx_reset_task_fields() in the SCX_TASK_READY case of
__scx_disable_and_exit_task() to ensure SCX-managed fields are properly
reset when leaving the scheduler.

Fixes: 5771e79e461e ("sched_ext: Reset dsq_vtime and slice when a task leaves SCX")
Signed-off-by: Rahad Bhuiya <rahadbhuiya2021@gmail.com>
---
v2:
- Rewrote the commit description to describe the cgroup sub-sched / RT task
  migration case (per Tejun Heo).
- Updated Fixes: tag to 5771e79e461e ("sched_ext: Reset dsq_vtime and slice
  when a task leaves SCX").
- Targeted sched_ext tree instead of bpf-next.

 kernel/sched/ext/ext.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index f74ffb3b1aca..b57a7989f304 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -4728,6 +4728,7 @@ void __scx_disable_and_exit_task(struct scx_sched *sch, struct task_struct *p)
 		args.cancelled = true;
 		break;
 	case SCX_TASK_READY:
+		scx_reset_task_fields(task_rq(p), p);
 		break;
 	case SCX_TASK_ENABLED:
 		scx_disable_task(sch, p);
-- 
2.55.0.windows.3

