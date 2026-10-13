Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50CA415F35
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791855842; cv=none; b=NXL+pvFCVUd52/7GCkp62IKMIMEXIBx7c8QVkSHpWFPMAU8JBbSAUgVVL0B8aBjkPmJ8euQ9ZW29bTOcYd/81LpTtdNu8hSHXYVc8hpkN5oFCmOhcF3N3pSGWXWd/TUBJnlbd6zjlV5n/wHc7avE8/8KL07UY1fufdytYEwR9cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791855842; c=relaxed/simple;
	bh=cwxYtqwV/asJI0sJ0LThEUuGst5eSyMrVjDHOf8D+Tc=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=SaL0+EhvnzbCWrfZBZym2tzQgpzwN62T4w3Tz1NW109BzVv9j40ssGMizBdbbq00O1E7JEGYunh6eeP+XfoY3seQyb6AYxNL9g0sQXZ7iOy7vgf75C8mmxVk2G6YhftVKB63Nu6Ddtfi/g5jFziOJf6+9nZyORzGmpB0q4UzAMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pAyFLk7p; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pAyFLk7p"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd5e6f0a22bso686433a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791855841; x=1792460641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lKPaX1rZHzqkluIlwZ5oqUSCtuKL8Cpnoh/XmdieGa0=;
        b=pAyFLk7paXKxrkn8c72rJreBTor/XtNoHRo5kTxy4mbg+hjYWndVAHATazbXlYjNP2
         qG91wyhjWVXmFysdR3BBwo+hLlYNsGV/UnvfKF+inz3qLiPp77AulUdRLzg+PtGmaL60
         qJ3K8YtaSoyFQKR2LAogr6szC8rRBzpQXJDE0oP78cZdK4CDShqZYQoGJxurwB6e1geB
         Og4H5XIGaneQ2Ub0SH6OTdS+Cs0dW+Ql/l6b4YHpwttK4M3oBnUE576pJ/5oEAXpbpuE
         8YVsk16mvODCn81KQ5gHoWzQo3eJFPK29SS6qem+NPrhzGXrKOiLcuGzQasWu5tGlbET
         AW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791855841; x=1792460641;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lKPaX1rZHzqkluIlwZ5oqUSCtuKL8Cpnoh/XmdieGa0=;
        b=nzDG6/dtRg/YMX+iv/nuaw1PP7Y1oP0I41efiEBE4fnA3g+3FI3GO5NCeTkfUJDqq9
         uO/BSgefKKdLh4Q9xeTQeLmhw7+EgfOd52WOuVqgxAe9bNDnUjKviFtxrCPWzLp0zXWq
         A2UeWKvkNwVJ3cFlPW2odxkfMLBtXRrmrJ+s/K1UpS5aeLxLMMmjEwuhz3KKffsSTIJk
         BEnK0rvoXETgBr9Rx+WStXs9FOgAUmcwl/fahmxZqBQAsbLw4AQcqbzLYVR8txpq/oE2
         Wq8Vb9KMAq+f0qoxxSTkcSl+JQbU18fHMkwo+T6JgKtpvJsap1lvnukkg5cSCcm3cQyO
         fz+Q==
X-Forwarded-Encrypted: i=1; AKwUvByLqAP2r5wvAyBbkrykSlN4GvQ6mGyggsZG6lZxeOuqVVjUGQJ7LYpWKzKGRkMUHTSNH0ueIdFZ2IxSUWg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIw6QTHM8MmmanWLd54LrZ9M/rjczHz9VpqCJciFZQq4m0UBfdu
	XwKYhpM/VYeDDR0UKnB4oWoQYh9v30p83Z9zDyqJnlEL/6sf47XfY0S4
X-Gm-Gg: AYBFou3HL6Klu+Y4yvz8/UVP6d7ngnW0NBdYX/XEC4rFTvE5qmWy6OvKju7sLEgi+L4
	VFIIIB9p+70/tQ6ZKXjpvgICk7Pz42nHtq8H0T7tMh6T/aoorrvGVohzqA01UI0xLt+U0ggHL4Y
	Jz4BQka8Dk/7utlA0fMmUuz0x3rs/d++gYX4Wa7EfRQ39pz4Z+yApnkBGHCKPwgodX5XYX/uVKZ
	LkDVUUOEVcw9tiAE5EamG+frvUeOqdf4k2TD2rjXZEqjOxz0B4tYBBmdtw3Fg5qmB4axGcSDGpy
	McbXMDM3XgLAwlTqBHeWZ8qXDmfZQX64MK9jbwbfJrZxxYKnIcCxVLFK4pxGGbJDqpMMpiwPbwa
	hRWXZ7R/bp8K/oLfquokp772nT63O4BifqXNaMBXyzhk087y5ggGanF1MVLIvOa6sbMzLBpseAn
	jwYegwF7zgO8aJ4DMq1x1MUdXok9KOg7tyPBlZFOPZ6kFG5wyUXEl5jtGdwhSwaBDyig+AORXhn
	d30yQ+LL+uakx/0lBhwp6pwei9BVCgzv7gcVRFAT335K0yBvFLP9eB1YlfpZbAp
X-Received: by 2002:a17:90b:4a8f:b0:3aa:fc22:8ab0 with SMTP id 98e67ed59e1d1-3ab3a8e55damr9182667a91.38.1791855840930;
        Mon, 12 Oct 2026 18:44:00 -0700 (PDT)
Received: from localhost.localdomain (c-174-165-208-10.hsd1.wa.comcast.net. [174.165.208.10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac38b36d41sm1060191a91.2.2026.10.12.18.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 18:44:00 -0700 (PDT)
From: Michael Kelley <mhkelley58@gmail.com>
X-Google-Original-From: Michael Kelley <mhklinux@outlook.com>
To: haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 1/1] Documentation: hyperv: Update documentation for sending VMBus packets
Date: Mon, 12 Oct 2026 18:43:54 -0700
Message-Id: <20261013014354.18023-1-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
Reply-To: mhklinux@outlook.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The functions for sending VMBus packets have changed.
vmbus_sendpacket_mpb_desc() can target multiple ranges, and
vmbus_sendpacket_pagebuffer() has been removed. vmbus_sendpacket_getid()
has been added. Update the documentation accordingly.

Fixes: 45a442fe369e ("Drivers: hv: vmbus: Remove vmbus_sendpacket_pagebuffer()")
Cc: stable@vger.kernel.org
Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
Changes in v3:
* Fixed typo in the documentation text [Sashiko]

Changes in v2:
* Add vmbus_sendpacket_getid() to the documentation. [Naman Jain]

 Documentation/virt/hyperv/vmbus.rst | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/Documentation/virt/hyperv/vmbus.rst b/Documentation/virt/hyperv/vmbus.rst
index 654bb4849972..c546e821ce6b 100644
--- a/Documentation/virt/hyperv/vmbus.rst
+++ b/Documentation/virt/hyperv/vmbus.rst
@@ -141,14 +141,15 @@ Three functions exist to send VMBus channel messages:
 
 1. vmbus_sendpacket():  Control-only messages and messages with
    embedded data -- no GPAs
-2. vmbus_sendpacket_pagebuffer(): Message with list of GPAs
-   identifying data to transfer.  An offset and length is
-   associated with each GPA so that multiple discontinuous areas
-   of guest memory can be targeted.
-3. vmbus_sendpacket_mpb_desc(): Message with list of GPAs
-   identifying data to transfer.  A single offset and length is
-   associated with a list of GPAs.  The GPAs must describe a
-   single logical area of guest memory to be targeted.
+2. vmbus_sendpacket_getid(): Similar to vmbus_sendpacket() but returns
+   a transaction ID that is matched against a reply from the Hyper-V
+   host. Useful when the struct completion (or other rendezvous data)
+   must reside on the caller's stack. By invalidating the transaction
+   ID before exiting the function due to a timeout or other error, a
+   late arriving interrupt is assured to not trash the stack.
+3. vmbus_sendpacket_mpb_desc(): Message with one or more data ranges
+   to target. Each range consists of a single offset and length plus
+   a list of GPAs that describe a logical area of guest memory.
 
 Historically, Linux guests have trusted Hyper-V to send well-formed
 and valid messages, and Linux drivers for synthetic devices did not
-- 
2.25.1

