Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32C740759B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789586822; cv=none; b=jU+aeSe9vgetF0CCPHi3xc4e6PDcCmYCP0CjN/BD91m/W3GPNIPT7snvk4gkGUI3J99Oln2V35/Bzj+JINT5uzVKyMFo5qF8S8HQ3zC0vIczbyEehTK48pnojWxdVZXXHH9DWm+WBU/HzOwcZn+v8FpE6JDwFua60bS1hTYMXW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789586822; c=relaxed/simple;
	bh=D1h9fsMcvjsKv13n+F+quh0HDSXrCR58YnIKhayYq6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oUi2K+QhLgR6s6gSW6KbCVmI7tzqAgDVlElZ7Zbid87Fhyv4vRYarVdFiz2PMRKwBkaSb4Fmm/shgNsMyBpw7f70lbvupO9iLhChO/CfXaH7ybG0RwsolD76WHcKrynPGYn/Nv3vYnXm7Ph+3ZqkB7mGnJEpY/lQ3mU8dDsQBCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T7IXdfUI; arc=none smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T7IXdfUI"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6aa053900f5so174037a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789586793; x=1790191593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9TLJ0RsVpJxjU2Txsy2gxZGoZCHNVB1C035SNno+0KY=;
        b=T7IXdfUI7un8s+ZL1UnChTYNpTs9yZJZtGmOSrp12EZxRKl2TD86G86KI8xRJ/0t8I
         53Y2ewErheE+HA8WPn0unLymNt9AB51/NEhYwz/XJXJ43RBgyb9lrqzM0zjf3x4BZe03
         Kp23i7V04BO+pne4QFu5HiL3pjigTZRdqYOm5Mf25OMaQqWlV73/JnqmphY4wKnDCMVq
         u505X3pe1zJ9Qr3jruCMqW02tP+GpSt/tFXT0KFohodkrRN8XIug/nhVglwbchFKiSwC
         Wreaa6N6x/zbvlIteo2A1Tk9m/xGkbfstrWBdnx6XqIimAVFwIPoXE5p0A/iFsSECd7e
         amgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789586793; x=1790191593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9TLJ0RsVpJxjU2Txsy2gxZGoZCHNVB1C035SNno+0KY=;
        b=e5zZsL9FbUgbSf9kfH2FAqGfy/WOFAGoUfpEZxVCRAEGp6IaRS4xXHEvSFpIChcSEG
         Tnjrqr/wImxeffGL+/AB03txWHLMwBBUQWBJWMxH/X1q4ErfJzAtkw6Zas6NJ1SIfbx3
         /wctlXydBVUIIMXMzPrI2cWvcrDQU1ivv0rxd7iYaDfW2fjDXw86kfUEoLjQu9G+tGyA
         t0ApN8/a/2i4rS7RUlN4nNOH0B/whrOziKhyuoUvIyv2gtsaK9zdeZ6H507yz+VdX18W
         StGv4ugGh+BTeCN36z8L4RDagyuKUoxiS2EXHJCtwUHSpFaLWwstlFq/xFfgCkDoLjIe
         uBcA==
X-Forwarded-Encrypted: i=1; AKwUvBwW9PIBN7vO1ecEAekXa8NlaPUtL1upmBfOV549SjFFxqiVME4kUGOr53pSBX6wzpJ7/MI3EKT6q1h2yPQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mBgshUtWWZ1OiCKQ8JlYbAaMNd6Qs6hlsrdQr2uq6ni3TcF6oy
	pPCG8ane2iM5S10rTWZ/IoZ/uNcloVOSQPZpQbKu+aYOk+ZxdvIoqNvH
X-Gm-Gg: AYBFou24oRlm6U2oTUsGHG8bmSa/xRBiZOiI74FKDVTo2U9oAVzXFN+5er51RBdEY9L
	IMQwHWqhvEFdcqfwZWtF1XhQx4mEL3flc5iw+z0QkBo+K1q5/bnmBwje321z3HddJFnxwMfH786
	n3MGqbd6YiU4iBH2wYjaZDCa+d9OAA6AUODx+okzvxk9srhiQHATZHhBlnDJKuddZzq+LjJ5etq
	4fIn9IkbdqdyhIPLkG7o3NIy3cQ5rKLE7YRytEuUFu6vyGkUW/bqKBmt0WosR1wuU8XTHMZEgZi
	a8GCWTRRwIpMvRVsG8mlUsB/PFyyyakq42llb2/+SYXvZkxvtWOdjiH9cISqI9pHAOk5e2w1+bc
	s/uq9K285FsiznWntOvilac3SayqMrCgLelJwNG2bN8h2CxQU/dsfPYc4ul3x0UQq6vY2fDnF1W
	CKUts9JDVio7tbP5vF998w2ulFJHq5inHjmsABbQyU+KyFWWk8HIrBoYwR6/ER/BGQ41VHE/XeI
	vA2SLq+ZGJ+bAWxbEI0T7e01+b9qIoruhFjWq7jyN2cjIYOQa8xwIz2JEli
X-Received: by 2002:a05:6402:21d0:b0:6a3:691a:9d71 with SMTP id 4fb4d7f45d1cf-6aa22251052mr3001238a12.11.1789586792762;
        Wed, 16 Sep 2026 12:26:32 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d25e331sm2303248a12.17.2026.09.16.12.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 12:26:31 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: vdonnefort@google.com,
	mathieu.desnoyers@efficios.com,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v2] ring-buffer: Take cpus_read_lock() when changing the subbuf order
Date: Wed, 16 Sep 2026 20:26:28 +0100
Message-ID: <20260916192628.274136-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914182850.21449-1-devnexen@gmail.com>
References: <20260914182850.21449-1-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A CPU coming online for the first time gets its per CPU buffer allocated
by trace_rb_cpu_prepare(), which then adds it to buffer->cpumask. If that
happens while ring_buffer_subbuf_order_set() is running, the CPU shows up
after the allocation loop and the install loop walks it with an empty
new_pages list, corrupting the buffer.

Take cpus_read_lock() as ring_buffer_resize() does.

Fixes: f9b94daa542a ("ring-buffer: Set new size of the ring buffer sub page")
Cc: stable@vger.kernel.org
Signed-off-by: David Carlier <devnexen@gmail.com>
---

Notes:
    v2:
     - Reword the changelog: offlined CPUs stay in ->cpumask, so only a CPU
       coming online for the first time can appear mid-flight (Vincent)
     - Drop the comment above guard(cpus_read_lock)() (Vincent)
    
    v1: https://lore.kernel.org/linux-trace-kernel/20260914182850.21449-1-devnexen@gmail.com/

 kernel/trace/ring_buffer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 04bb94c29f58..e78fb4bb2195 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -7464,6 +7464,8 @@ int ring_buffer_subbuf_order_set(struct trace_buffer *buffer, int order)
 	if (psize > RB_WRITE_MASK + 1)
 		return -EINVAL;
 
+	guard(cpus_read_lock)();
+
 	/* prevent another thread from changing buffer sizes */
 	guard(mutex)(&buffer->mutex);
 
-- 
2.55.0

