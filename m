Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEA023643F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789436570; cv=none; b=Cr6/mIPGJ3uGDzRwa1uH1pqBBWbc9kBl0GAqXjzqe6lej+fKcydA9faneWQUHotiWxoTwv7giwbBJ5N9+jYXo4INGw0C0zc4t/cmOPbZaxlHfVC2JWwO7qzorRM/UAmfuJF52ZHMpkUDzwROnOAd3X9Gh0uf5BRGj6fFEmMBxtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789436570; c=relaxed/simple;
	bh=LsVIYOKjfCnfh/5YRFVyr3VnUzX1qGN290xLX0OyZx8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hq111YwYfNiVmWNBC8aJDv2VX1CJCXRjDCcSXQyeAqUWsiCdVPHdhZPcQGUINk9NtPBuUyxu5UbAhBv7RTxfVWb2ezPoXG/Ai8IlA+Bs4mRxPTXtimnR0icrzlzii5JJ4FFs0PR7bxwr9YMY/dTZS6uTHOJVawss/CEF5pxXACk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=n1OO/lMz; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="n1OO/lMz"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc147d86bebso567056a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1789436568; x=1790041368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JSsbzUqwepUlLbo++d/svjElwCSVAHyWtztPEHYL3CQ=;
        b=n1OO/lMzNY7GOuqvJLTRpTmvcc8zSRksuE9D6EIxwpYz6+sVRNs5QY49EmZfEbfyD0
         8cJtTSfX6HmgcJtqmvU+ZAs3iiWtQjyI0Fc7OhELPy2K/Xar7xxhqKKhXiwjjHGpProU
         nLercrA/hHx8Ch94FMNWkXQ4NP+O82pOwfbONOiER8UtsWNXu2Oxd3+1Rf4Ebe7xMfSj
         7xlgQQobGUv4qJ3gUJvCeU+9oBUMJzwLBF49sBH21TGC6OJBopVSvrqEsZ3idJMeTBCI
         CzHchN7L55MdVcE+twMSOm7XmvS9Dn9SYuNBasWc2HwnVQMffKmk7UkqjZ7ad43Z16k2
         bvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789436568; x=1790041368;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JSsbzUqwepUlLbo++d/svjElwCSVAHyWtztPEHYL3CQ=;
        b=mSoTLOcbgxezlIJLqZQjVwXx8rD+7xK/RLUZUv7IHnqzS3d7mJf6L+sxgKb3meBqjs
         66kTxjLwB6Bc0gDfrBRCT1Elw+t5wcaxUKr0xwH9asgG44riZjYAdMVB9gNxBeVbyTi9
         /WmF3NAKdlEHe9xnPHsI2R/0SjFKr1lauZb+1siv/A58e/yrNhMV+QeskF/TAOxRwfo8
         h89PFprMG+dROOA0Zkjppl4m1l4abl6E4rHWuYaT+2qKs+5FPTX0T0XsUrEmxuPiCont
         B6JL9U7wjBfZ15qiAXh2xr4wqWSGwHy1ZYR2vfecuCmF7Ng8qS+VM9JeS+IRePXAPpbi
         1Lcw==
X-Forwarded-Encrypted: i=1; AKwUvByjDT1YEM2kI3oXZpPOJgzMEY4sK/fXMLDQdH6JZKb1wU1ppcaBFaJoALHmJ7IQ+IIJTXlE8Vkzszleb3c=@vger.kernel.org
X-Gm-Message-State: AFuF++kPcqfM1BhXesN0uz/R4CltJ6yJJLynYVy8cBq+kX5DpTQHStqO
	jvVFM+AhFmPJ93XdqZplEhUwDc9t4iAfCjxyihmhV0BKzS0dGwM3l85ZCMzX/WPxtK/4LL30zPy
	O5NG/AQ==
X-Gm-Gg: AYBFou0OkyXckmKUOQhMwl/YISjWgqfB0wDslR5oYx27rHqUA05AQHgbuqCXcdM1K0V
	6RZonQznOxVUed1Wek23NHUH6K7zGL9/doCIVJEyrRwwimNY3hUVzeKK16IaQueN5nXYGkcJnhk
	cLN1kb1Q+h3A+XroL4SjRlRnK61aPQKgNYAS7UNRxz6FQ//USgQfGgatFWOrk38a/U3YU8dH8pf
	8eb+MKsp6s3l0Kd4I2ElrXfJChOFnL0nOfLESzvR6wy3u1rq1sstrjATnCu87Xa0evW6T1XrFtG
	7N5q7z2fZfgokYLDJptJWdpxUfD/IrGfvzW6mpqXFDMXiexcVM4G95sKUEO6QXJhQIw6reMU0GE
	paR195wGyRO2/7/2ZOiXD/YOaRPxyaVxW3yLEuwwN+VOxsafoxIKHZx8CzNRQOuzuhLj9mQMD41
	bFWEJVAlQ7a6rhuIrmsxkcquFRrL0oEGuv81M84XeCrm2EAdKO6KoZIDhh6QWqhc/SA9gqR49Ls
	7w51x78Wdt0oVpMQzOOT8E6j/gXoGpxarJgfw==
X-Received: by 2002:a05:6a21:498b:b0:3b3:3506:cf3f with SMTP id adf61e73a8af0-3db4fa30801mr2498859637.1.1789436568049;
        Mon, 14 Sep 2026 18:42:48 -0700 (PDT)
Received: from p1.. (209-147-138-4.nat.asu.edu. [209.147.138.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fa50e3sm31051879eec.29.2026.09.14.18.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:42:47 -0700 (PDT)
From: Xiang Mei <xmei5@asu.edu>
To: idryomov@gmail.com,
	amarkuze@redhat.com,
	slava@dubeyko.com,
	ceph-devel@vger.kernel.org
Cc: dfuller@redhat.com,
	elder@kernel.org,
	mchristi@redhat.com,
	co+25860fb17af97289@bugs.sh,
	linux-kernel@vger.kernel.org,
	Xiang Mei <xmei5@asu.edu>,
	stable@vger.kernel.org
Subject: [PATCH net] libceph: bound mon_command ack decode to front len
Date: Mon, 14 Sep 2026 18:42:43 -0700
Message-ID: <20260915014243.355592-1-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

handle_command_ack() bounds the decode with msg->front_alloc_len, the size
of the reply buffer, instead of msg->front.iov_len, the number of bytes the
monitor sent.  mon_alloc_msg() routes every CEPH_MSG_MON_COMMAND_ACK to
get_generic_reply(), which returns the preallocated ->reply of whichever
generic request carries the same tid, so the buffer keeps its fixed size
however short the reply is.  An ack with hdr.front_len below sizeof(struct
ceph_mon_request_header) + sizeof(u32), including 0, still passes
ceph_decode_need(), and ceph_decode_32() returns four bytes that were never
received: uninitialized slab memory, stale bytes of an earlier message, or
bytes the peer planted by sending a reply that lands in the same buffer and
is then rejected.  The read stays within the allocation, so KASAN does not
flag it.

req->result reaches userspace through ceph_monc_do_statfs(),
ceph_monc_get_version() and ceph_monc_blocklist_add(); rbd hands it back
from write() on /sys/bus/rbd/add_single_major, and rbd_get_client() passes
it to ERR_PTR() unchecked, which faults:

  rbd: failed to get latest osdmap: -186318427
  BUG: unable to handle page fault for address: fffffbfffe9ca034
  Oops: Oops: 0000 [#1] SMP KASAN NOPTI
  RIP: 0010:do_rbd_add (drivers/block/rbd.c:7105)
  Call Trace:
   ...
   kernfs_fop_write_iter (fs/kernfs/file.c:345)
   vfs_write (fs/read_write.c:595 fs/read_write.c:687)
   ksys_write (fs/read_write.c:739)
   do_syscall_64 (arch/x86/entry/syscall_64.c:61 arch/x86/entry/syscall_64.c:84)
   entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
  Kernel panic - not syncing: Fatal exception

Use msg->front.iov_len, matching handle_subscribe_ack(),
handle_statfs_reply(), handle_get_version_reply() and handle_auth_reply().
A well-formed ack has front.iov_len >= 22 and is unaffected; a short one
takes the existing bad: path.  This applies commit d3c32939fa0e ("libceph:
bound get_version reply decode to front len") to the last decode-side
use of front_alloc_len in this file.

Cc: stable@vger.kernel.org
Fixes: 6305a3b41515 ("libceph: support for blacklisting clients")
Reported-by: co+25860fb17af97289@bugs.sh
Assisted-by: LLM
Signed-off-by: Xiang Mei <xmei5@asu.edu>
---
 net/ceph/mon_client.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ceph/mon_client.c b/net/ceph/mon_client.c
index c56457378d00..59b304eca273 100644
--- a/net/ceph/mon_client.c
+++ b/net/ceph/mon_client.c
@@ -943,7 +943,7 @@ static void handle_command_ack(struct ceph_mon_client *monc,
 {
 	struct ceph_mon_generic_request *req;
 	void *p = msg->front.iov_base;
-	void *const end = p + msg->front_alloc_len;
+	void *const end = p + msg->front.iov_len;
 	u64 tid = le64_to_cpu(msg->hdr.tid);
 
 	dout("%s msg %p tid %llu\n", __func__, msg, tid);
-- 
2.43.0

