Received: from mail-oo2-f0.google.com (mail-oo2-f0.google.com [74.125.231.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A773AD51F
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 09:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791537839; cv=none; b=mgxHCcoLbqJCmSH554ngYeMxhRjBwMqrBlhsRswBpUWhIiIDVVQy8Q5pg7TBQPkbq/EGMbZMTJwQ1X7KTZoLI0b5FZZTFEC8P+KRb30jgh/2W+0RLPBZ+0XrI4DUmA83hupmm7VByNwGA54I0hmkqnAAb6cDWXu4UE3mYQWnkEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791537839; c=relaxed/simple;
	bh=spHWg758MMa6cVLRm5D/eai/nTQN8STeDzA3Yqqr8xE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gBF8jbOkVf7F1LgUT0CIPrrKcQ5lgbnqxtJFx6NSYKCtuj1baTdrvS41vH6iw64SJaPNDzaU1/+pGvw04SZxS/XE8OHlQZ5Hx1efULkll1AZjiR0KNrAfSlrXkwGD4uemnTpWragzhwI/iPHpctkK4EYbqg8b5peVnwDeAnyHkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fel5Up0m; arc=none smtp.client-ip=74.125.231.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fel5Up0m"
Received: by mail-oo2-f0.google.com with SMTP id 46e09a7af769-824040a3379so2472890a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 02:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791537836; x=1792142636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9WNJzvugKvA82beZN1tuIwkN3WC4xZ3L9Ut+DKu7+48=;
        b=fel5Up0mw3itnc8xKzRPSDWgFy7hzIVlyVVg36d514Ix/+f2zi/E3u0t1pXNZ40DEH
         GoW/GYNmwK3GMMi/ahG+ScaZ18awQGQgNJqPuX6qa4+JlzPxBhfTBo/50KlFD1pYxr4h
         dcFd7gVbKi4dwoi8s/Osmxof48+lhbsMLPZjOV3YO7hVh3G7v5qGdU336m2p71Wco36h
         FD/vmWudY/zmh6yAAwaRAj7afrKsIrIlYGhN57KR7fER6MiPjMsd5ThbYkkAdWtAfHCy
         kXwhbnd3FjjzQVzkb+dc1Zzn5X4ou9vJYr7oR7a4MvnqFxMV2g71EwkC+gUlXPLRpAUU
         GcNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791537836; x=1792142636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9WNJzvugKvA82beZN1tuIwkN3WC4xZ3L9Ut+DKu7+48=;
        b=0m6rzl6s2ZgfZyN9UlTZuVNZsWga3/6KF7bTiITKJnPpF54sesDZQJqdMRzbX5OrT8
         On6Qov0zudPSdtGf53gjeuiLRGwNb0nDlor6bGq116pmWqc4n05JRCn0/fOLkFKU9jQe
         6lq7eN+atXvJC7gNBTYhwqyAz6fw2JAN356twaQESJns+j2UWhn0kB9JxZpOcKtHnh64
         NYCyUr9g9ty2A744pA+tqAqPhuq2ILMGpAxGfe+amDtw/bZrLfp0DbgpWIaXlgrvP+wI
         GTNUfjasGbfOHf2KQw+tO9OREt2aVfQTKQbDq0F5rW0JPjP3PBi2wAMqI/7CAD6YHKB4
         o0JQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPb33prU0tiNbOmc8EW1ykW0/4ozO7xYCqKLjVmAsKMWLPa5U8TG6BKpC3KyPeLEVwpiul3/NoDUTG4jg=@vger.kernel.org
X-Gm-Message-State: AFuF++mEiQrqD/uBytOV/jetURLii4eXHa7rpuXWSQwe4fF+5up0IDq1
	V9I1AQu7naNNJDYuF/mijBd/T07r56odfpSGgnfPLdt+1cWbl1p5pl05
X-Gm-Gg: AYBFou2ytU4yN0rHLfQ7/blsKAGE4PzH1evKFGVmhfAYzY8StRiPY35F3RXCMfrrfw/
	t6IfmUkI9+PVxdaQFt7N7POVuytDbBDnDvIRK2PDv7vKlFTWON9gVNSzizOIwRpyrQScrqjzNTl
	Big6Texgg/PaNlpR6PLcld5qCAcUFAsz4XJEP7F7343GMh4LmwkG1GIrRFGvAvWaIeUkgFomt7F
	NyUp9wdGmyXg1/mbXmaIv+k3iSRvBjBbBjGY2AAC10h4yh9hAcfGOKNru/2F0AdZKsvnwI7R1B0
	OiykhZVnYqgoLxP71GcdTgkNpjUeiTzxQOyxY501qvpV5gCgZIDof8upG1QdnNuYT+fQoxyteDN
	W/THgYWElzi1nBbrQTDojUmoXBqQevHVYe8HI8grsUOmro+10q9qC0QeZ4N25Tchmqdath+T/36
	5LuxRfol9NphwCxwSzpITPX1NyjreN4qyrnhbIky0BvvjKziXhqgMfAUEhGuQjodpIIodgUJ3ko
	OxhOUIy7XXRVXa92k1DnYd5Yv0GnRmlHHnn
X-Received: by 2002:a05:6830:4c16:b0:7f4:eaa0:1d14 with SMTP id 46e09a7af769-8309610ba27mr974839a34.9.1791537835773;
        Fri, 09 Oct 2026 02:23:55 -0700 (PDT)
Received: from localhost.localdomain ([14.22.11.163])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-83039076dc3sm1446136a34.14.2026.10.09.02.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 02:23:53 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: David Heidelberg <david@ixit.cz>,
	Samuel Ortiz <sameo@linux.intel.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] nfc: llcp: fix socket list self-loop and soft lockup on bound connect
Date: Fri,  9 Oct 2026 17:23:38 +0800
Message-ID: <20261009092338.3146149-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

llcp_sock_connect() rejects LLCP_CONNECTED and LLCP_CONNECTING but
not LLCP_BOUND, so a bind() followed by connect() links the same
sk->sk_node into both local->sockets and local->connecting_sockets.
When the peer answers with CC, nfc_llcp_recv_cc() removes the node
from the connecting list and re-adds it to the sockets list, where the
stale bind-time linkage turns the node into a self-loop; every later
sk_for_each() over local->sockets then spins forever (soft lockup) and
the socket refcount leaks.

Reject connect() in LLCP_BOUND state like the CONNECTED/CONNECTING
cases (a bound socket must be closed or unbound before connecting to
another service).  Failing fast is also the only honest option: by the
time the error path could restore the binding, connect() had already
overwritten the bound service name and the unwind destroys the bound
session regardless.

This vulnerability was discovered by Tencent CodeBuddy Security.

Cc: stable@vger.kernel.org
Fixes: a69f32af86e3 ("NFC: Socket linked list")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 net/nfc/llcp_sock.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/net/nfc/llcp_sock.c b/net/nfc/llcp_sock.c
index 1e5ee4bcde684..33afd85f931a1 100644
--- a/net/nfc/llcp_sock.c
+++ b/net/nfc/llcp_sock.c
@@ -714,6 +714,15 @@
 		ret = -EINPROGRESS;
 		goto error;
 	}
+	/* A bound socket is already linked into local->sockets; letting
+	 * it connect() would link the same sk->sk_node into
+	 * local->connecting_sockets too, and the CC handler's re-add turns
+	 * it into a self-loop.  Reject like CONNECTED/CONNECTING.
+	 */
+	if (sk->sk_state == LLCP_BOUND) {
+		ret = -EISCONN;
+		goto error;
+	}

 	dev = nfc_get_device(addr->dev_idx);
 	if (dev == NULL) {
--
2.43.7
