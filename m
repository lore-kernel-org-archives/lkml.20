Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794760559;
	b=KAzmL6jMKKsJkwTsejKGrpoIbi8tRM9UNoIQQUQwzF94sFD6iz6LsyoZjKu3HbFbMbz3
	 GWmLObMWrmZZhpCr11jXvduBvHf7t16ERsB349hGWBCdS+4U4kwMGE9PZ+vrCaueA6onO
	 Mgyepgn8LFDIYZmknxwnYCbQ/wggCJvx4AR/ZPg6BsQqx6I8BnBt8p5AkiAztJDvruMtm
	 qLN3iJOYazVujQkk5edDmsqFyiBe2hqtJVS35vH7r+9jwVdPfKv8MyYcIxY1Ptw8AkoMq
	 Iw3krLyejv4CjEo64PH5SqTXdoK69q9QwXlzS328GCHovgrKw4iraA20Qq/J9qTuDBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794760559;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=dF4wIigZEM8rClwrr3KajflrYRJMZuf2K0t+yjrkzFY=;
	b=tqGJKdiq7HYdiLNnju8oltZ36M6j40EN5qbIV1fCQ7Bp2q7hASgX7EP1xWAFb/0s2mmt
	 xBmBaSWJ4zt7ANvLG00sW/xe0SSGDuPNSGqT8Tr8q/8eIE7hlmhggYL5hlKWupDYAJhrr
	 HOInaa0tWw/DyPYn69h0DAo/64Nn/fn3vf4PUKM6fXLB1NrfnA77q65il10xGUdtI89/U
	 ULRCCdiP4cYPrSbH3JweRD7tja0xyk5xpYxF9+MjPD2aEwBQsY87COauwmpjHLePWXPEK
	 d/E+EcCS3ksrdjGB4FzdjJq8ll8yALun/FKDfMQaVNeHS4T/kGDpgLMMyCShXdpyzoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kNsq7Pce;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3E8606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 16:35:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD3E8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kNsq7Pce
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-37628596783so4492172eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794760558; x=1795365358; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dF4wIigZEM8rClwrr3KajflrYRJMZuf2K0t+yjrkzFY=;
        b=kNsq7PceTQWA9KNqN8eSmwR0tZvbrP32x4vHj7FMSDvAD1FTMszpifSbDDlSFl8xBO
         otFDQWo0Nyt8cdLn7wkQnU3f6SggfS1avwaa1v34q02mcjEetcwL2oG31pbIJnlDvsaw
         WiYxxuo8qm323RTATTt+ja9psm13FRAwxdi2A3r+cI2W6+S6j3c27w9YimRixaX12KsS
         oPZoGCpM2BdyQbZ2bWUsC68pe+GfzQUsXm24bpsZ6AlKuPa+rer+/Vojdsi6OYaf03w3
         WY/0ZMB42KP0xTiHkH5s7BRjWQNO6Zo+RYNiX1oansRz7VHrVqXJjCJoTgDPwxT1GBK2
         LSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794760558; x=1795365358;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dF4wIigZEM8rClwrr3KajflrYRJMZuf2K0t+yjrkzFY=;
        b=otUgaYABVsElkd/U9JyIXOrF7G+/dEruar9Sy8HdI5xoEfh6VrS7RHs4iwbve2DBcf
         WL+MH8GAUHaIoQrtlVBwszmw+kc5V5fobCH0BlDBw3yUeb7ICD2a4he4Y1x5kfwQlCkm
         H3JmTm49CnIx7ZId696ryYh4fE08wNGAMG1MfgtdfGpkf7P9aoc4w33oOFoBMT9BCVOt
         Jt133Db8ZEYpho/Yo2vh/zIJj0iHXZe9wRJajPJaY3SWUNCf6bmcc4BwoQPeAU6N4gbU
         Lm4Zj97/CgENq0pfdEx7HFb3Di+EY7B2MTv8CzVktLG/ZXt9oAeydVDFjRbMYpT3DFyk
         P7Uw==
X-Forwarded-Encrypted: i=1; AL+hErEcUUjv8LuYDWQlxFpqHZ3sD5EcyNKAmOFOi6D4kRGroRTZIo8zxNlz5qJH3Xpjbi9xlONALDMN7kMaqDk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/f7IoVpMaeQ0N2ESkHj25+vS4E0B70kHUOHgucmU6K8dmxH8MV
	SN1vcxtpXHcdgZI5rfTMeuGB1R5Jedmgp9yjfzGBbiU/n9ZlCVVCvVlY
X-Gm-Gg: AYBFou0xPfCYzjpsO2seg4wI6Yzbx4XO29YXLrS4Q5TYLG59nyuTGZ9XAy/JCwUXPWT
	5o5JZO+8vM3mnqiVfnvoIYazmgxEHb4hJ1tfosVnEZXoR9XtiNy8iVtt9Bg989y3kkyCd2sY9tj
	CtqYRLUPR0Xzvd2Xvn+FlXY+EGWzyUWpeInAlWjeyHusFna7ceVsfS4HD5iYqw3xk83epOfe6yj
	AW3Uf6rWvAGQzJl/PnMDCE6nbzvFJl45fr05dGe9I9SZpJIlOEd1pIWrwn8PCUSQGc3wuaxxyHP
	sjyI/9tLKEldUQvbnVPBHDuw3vFF1KQx6gA8H4IpoJvGkoSK3FD794Alth2V0hnjHIH32PObcQY
	MivS4VpnGFY8cSK50pwWDo9H1roMYA8b1WdoovOAygRZo2d8Xwbw8Sot5/9d7Zp9btcrTsVuwmc
	knNzP1AwJeKPmsZ38JWhk4VBqrhwG+xlgSkN1O69r76OKnB9OdhRKXblrnA5E4UUC7NPcitpChO
	WKGsTSCvQJ0p+rgzX1/VvEWTS7UKkrsz5SGPzdW88H2V7CH5KyqNDQAn7p+On9pz8jNrQDQMGgF
	7mKNZfAS26biGd4axC06r7Rd5w506VzV+gTUJMMZ/s1IQzVpnTp9sNHaqMrTPVfi/A8UYQ==
X-Received: by 2002:a05:693c:4003:b0:369:9af5:7bc9 with SMTP id 5a478bee46e88-3796696128emr8308626eec.23.1794760557810;
        Sun, 15 Nov 2026 08:35:57 -0800 (PST)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379558231eesm25970303eec.12.2026.11.15.08.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 08:35:56 -0800 (PST)
From: Cheng Yongkang <teel4res@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] io_uring/timeout: multishot timeout rearms during cancel drain
Date: Sun, 15 Nov 2026 08:35:47 -0800
Message-Id: <20261115163547.225149-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jens,

I hit a corner case in io_timeout_complete(). It only shows up when
userspace sets the CQ head to a bogus value, so it may not be worth
fixing. I am reporting it in case you want the check.

io_timeout_complete() does not look at tw.cancel, unlike
io_poll_check_events(), io_req_task_submit() and the linked timeout
handler in the same file. During io_cancel_local_task_work(), a
zero-interval multishot timeout still posts a CQE and rearms its
timer, which queues new task work. The drain keeps running it until
CQE posting fails.

Normally the CQ fills up quickly and the request then completes. But
if userspace sets the CQ head to cq.tail + 0x7fffffff, posting keeps
succeeding for about 2^31 CQEs. On v7.3 with DEFER_TASKRUN and 4096
such timeouts, the ring was still not freed 5 seconds after close.

Skipping the rearm when tw.cancel is set fixes it:

  -		if (io_req_post_cqe(req, -ETIME, IORING_CQE_F_MORE)) {
  +		if (!tw.cancel &&
  +		    io_req_post_cqe(req, -ETIME, IORING_CQE_F_MORE)) {

With this change the same test frees the ring in about 300 ms, and
normal multishot timeouts behave as before. The code is unchanged in
next-20261113. I can send a patch if you want one.

Thanks,
Cheng Yongkang
