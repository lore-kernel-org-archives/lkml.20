Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721922;
	b=jPIOYKUdefdG5GJA9OJE4MxP/7+EjjzeAao9mazxfbGVtungNuyJbmr6o35jLsTOXlum
	 Ee3qLwRfJRGVQHIjkd6CtJsxp6MYxywEUQK4IAwgAAfZ9Ip5DbvHNB9cK+zT0KVA60vwh
	 QlQfzRD/IKBKx4s8Sadpy3u1AUPUN3bd5yfpvxXqZUKKddLDfwGt3s6wEZK1AkbOneA9a
	 meYF+Fw04F8sFJIv+fejcj5cUIX6uM+zHvqRePEelv4RfTIQDKv2X8XiAAmxg00RkgkSk
	 MJAmZnuUiWdyujJThWMjLUmoR78SfOmSiF0DbtzLPEFCphLGkXFMqN4Pd4EBnjvSWuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:
	 Content-Language:Content-Type:Content-Transfer-Encoding;
	bh=NaPp4Peej2BCZG+WegsY5W8E2E6lnmgbaSwB55nY4Mg=;
	b=YqI66ygtJNSpq50dQMqPMydgklZFectzY/xcAREoTBYPttBp7E34zy6B4uLmTi9flGrW
	 LC3aCpKZf85OChW3qQJwmqt3Nd1sDfKd8BH4JlpOVjPv4fbv0poMbsPcOvo2my3jZjgEW
	 2B4PgAPejIUmnPmZhfjYa5lDb5SCHUPulduWpmk20ghjaErSBc5aCzAOrWYIdzz15/AVL
	 ux8aZPeYo3CM9pyE3FhxQJo9PgS7nTUqXknirFEwcvjBgjWa/l9qXTY43aRCIosLZw9Ec
	 Y9tzAyaFbyGo4JGzk1rL2jqel+TkP7ld05PYHQ+Ya/MSlPsWQd8QrphNC2bvcZfs0lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DcVIXcC4;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A194606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A194606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DcVIXcC4
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so4610207a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793721921; x=1794326721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:content-language:cc:to
         :subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NaPp4Peej2BCZG+WegsY5W8E2E6lnmgbaSwB55nY4Mg=;
        b=DcVIXcC4yV3NwiBdwV4xH7DeGp6i+++DYbmETIHeUDGN1cjXkCFMEoihlWJ72NSOHB
         WnOwEW2/p8qXwTjVR4Mzi2PlBzpmPO0tLMwzWqCJlAdh6FH+omcmu9eLu9sbjAqfMR0m
         pn2sn9PUTPUb0qGOBnp0MF2IEzJB4lRAxsH4TXHCKyKnTlgQNwkSY3Bwlql2IZK8BLrt
         3IRz/L69HA3Mh1hyoRNT2+onXAgXRnRtqQWF5STcOduDtbgTKNtnClNxxGRTdldnSsNo
         gH+ILJs0QLdLV+EJ/8HsHaCZCA0BM7w1EfFQWL2iDbqsswQkz2kw1BxutdQXPO57FXfB
         HM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793721921; x=1794326721;
        h=content-transfer-encoding:content-type:content-language:cc:to
         :subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NaPp4Peej2BCZG+WegsY5W8E2E6lnmgbaSwB55nY4Mg=;
        b=EctvFIee1OQrkZ7JkGCHMzNtiEbaRXb/iFwPXy6vsUPmww1P1SuOg87x+j2y96Z1J1
         LssmYIdgUdUUegtsvxGZ6d5hVSrCeDxLZXq73Cl308Tj77kvk3XIXWhR2hyFSYidwEnH
         8CF5Yky3W8aoCTSP1hdwwNXPu4f0EqZvy8dzKFVMAptPGbNy34g4pYv0fVVJ1F1T5A6M
         QI8Sv0iWvm/cGGHxBNZM1G/3JgD10JW01HLBhAlfQhWu+SCUg6BT+W6oUaCTdLCoxhWv
         gM8KEhLOwawgmXOKvqQvB9XxsCeDUzDGw0PHo70lJY/HqM1n1IB+kNAv6Ycklv/KmTJT
         7BNg==
X-Forwarded-Encrypted: i=1; AKwUvBxWcjHM1qpNLuSV+rqJkc/hiaCBS/jCAT/7zGkkKowga7/g9uaKVD+J/JvJ3J4aNtFc32LsXeqGDq5kGp8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xInPqtjTH0mvfhXezXqnfC1T47exoXhTBZCw4y5DXt68ZFwFX
	PwR+lIJEd1O9RmmC9a0tj0seAO9C4hiZMIqcE/8M8U8HFVI9LuqUFDLy
X-Gm-Gg: AYBFou1PR7if5CCjY2eAnXW/edbwMj0xATO0yXWs0ZCuzMkYdaXf/FMHdnlgbD8+RTw
	UI9LrsCGkVBfsPkO3jsT62fPUiE3VpKiVG4DEOIp6MXLABlIDI/Gsx8TBMUAAEYeoTqwwMEx+gJ
	7EWkF5iBgheNDPn/68uxSTyNMpLR4Uvn22pppxLNfMY6Vc6W7Kqs39RlqBtkeNuh8PTYVOl8A9V
	EcmWztv16PJN87Bh6/32jdEnqNzlTWITpM+IUWZPJjvImAHWKHGDg8Hg867Zq0/Lm8j6UF55DH3
	ZIT28dzRFQ5SZnMStxzGSQr+qzFqtnCNjpzaP12rVWGRoldNRywM2KQsSqCYv1v/rSRGZD+HCJ6
	qRDVayv60ZP+Ljkk4RPr2spO/5+Jzv5DEdd4fsYVxMkqz1/8RDZgHWjvqXJo9ajYl0d4EuH0/Um
	2hi/g0ScFDrOhjd6ks3XxHaj4Cczdr+ibd2fBw04e9SK3wM/6SGKcRNGdLmauBHe7xFRD+HtV9Q
	wBgCWZtUgDMc7oZP73r6A+EsR2O5iQFHC+Ox68Ec1CSihMli0jnalxfD/sQYDu3pZFMyfqMU6BT
	9yf59SJbidVqwcvn/v9Wv78k13odzSxVfxjShQ==
X-Received: by 2002:a17:90b:53c7:b0:3a4:77b8:1770 with SMTP id 98e67ed59e1d1-3ae897c7747mr10979311a91.15.1793721920802;
        Tue, 03 Nov 2026 08:05:20 -0800 (PST)
Received: from [192.168.31.200] ([183.81.0.133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c9b6f91sm4955491a91.17.2026.11.03.08.05.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 08:05:20 -0800 (PST)
Message-ID: <50227b10-d1fc-4746-b156-5b9eed00eb18@gmail.com>
Date: Tue, 3 Nov 2026 23:05:18 +0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Duc Anh Luu <luuducanh0505@gmail.com>
Subject: [PATCH] nvmet-tcp: fix use-after-free when TLS handshake completes
 before timeout is armed
To: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

nvmet_tcp_tls_handshake() takes a queue reference for the handshake
completion callback, submits the handshake with tls_server_hello_psk(),
and only afterwards arms tls_handshake_tmo_work.

Once tls_server_hello_psk() has queued the request and notified the
handshake agent, nvmet_tcp_tls_handshake_done() can run before the
submitter reaches queue_delayed_work(). On failure the callback calls
nvmet_tcp_schedule_release_queue() and then drops its own reference,
which drops the last reference and queues release_work. nvmet_wq is
not ordered, so nvmet_tcp_release_queue_work() can run concurrently:
its cancel_delayed_work_sync() finds no pending timeout work, and it
frees the queue. The submitter then arms the delayed work inside the
freed queue, and the timer fires on freed memory tls_handshake_timeout
seconds later.

Reproduced on mainline during the v7.4 merge window on an NVMe/TCP
port with addr_tsas=tls1.3, with clients whose handshakes tlshd
rejects. It reproduces both with stock tlshd and with a minimal test
agent that fails every request; a non-debug kernel panics in
__run_timers. With KASAN, the unmodified kernel hit:

BUG: KASAN: slab-use-after-free in __run_timers+0x72a/0x8e0
Write of size 8 at addr ffff88800317a1d0 by task swapper/3/0
__run_timers
run_timer_softirq
Allocated by task 12: nvmet_tcp_accept_work
Freed by task 132: kfree <- process_one_work (nvmet_tcp_release_queue_work)
Last potentially related work creation:
queue_work_on <- handshake_complete <- handshake_nl_done_doit

The queue was freed 4ms after allocation and the timer fired 10s later.
With an msleep() inserted between tls_server_hello_psk() and
queue_delayed_work() the report is deterministic and points at the
write in queue_delayed_work_on() from nvmet_tcp_accept_work().

Hold an extra queue reference across the submission and the arming of
the timeout work. If the completion callback has already released the
queue, the final put queues release_work, which cancels the timeout
work that was just armed.

Fixes: 675b453e0241 ("nvmet-tcp: enable TLS handshake upcall")
Cc: stable@vger.kernel.org
XXX-ADD-YOUR-OWN-Signed-off-by-LINE-HERE-AND-DELETE-THIS-LINE-XXX
---
drivers/nvme/target/tcp.c | 9 +++++++++
1 file changed, 9 insertions(+)

diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
index e59810175262..e55a3b86f3f6 100644
--- a/drivers/nvme/target/tcp.c
+++ b/drivers/nvme/target/tcp.c
@@ -1910,6 +1910,14 @@ static int nvmet_tcp_tls_handshake(struct 
nvmet_tcp_queue *queue)
return -EINVAL;
}
+ /* Reference owned by the handshake completion callback */
+ kref_get(&queue->kref);
+ /*
+ * The completion callback may run, and drop its reference and the
+ * queue reference, before tls_server_hello_psk() returns. Hold an
+ * extra reference until the timeout work is armed so the queue
+ * cannot be released underneath us.
+ */
kref_get(&queue->kref);
pr_debug("queue %d: TLS ServerHello\n", queue->idx);
memset(&args, 0, sizeof(args));
@@ -1927,6 +1935,7 @@ static int nvmet_tcp_tls_handshake(struct 
nvmet_tcp_queue *queue)
queue_delayed_work(nvmet_wq, &queue->tls_handshake_tmo_work,
tls_handshake_timeout * HZ);
}
+ kref_put(&queue->kref, nvmet_tcp_release_queue);
return ret;
}
#else
