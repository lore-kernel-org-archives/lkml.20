Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794760615;
	b=DKYGU2pG9KKi/mGpdTxiv+AI/K+aUifvCyLo1z4a8EuP8TP325hGkYQkNlWGhnqHmapO
	 Rims2UkZontJ+4NQNTk1MU4KLnlj3WX7RdZq9iFT195CETbWJTMjURRDjdVNNAy2vRGQo
	 LeNa4Tta9JnHnTQXd+wePd/HMIFpPzQgRjNM9X3FfOw/ZZs9OcaxYquIHaLJ4pBihy9fS
	 QugqD0ynOd78bqyGdy/wpRYBhujxvWsSk9Yqh4SsKoiAdHSRxE8kdVX/k9jSmHdLjA0Fg
	 c2BgdjvRo3oLFxpIleQRbjVuQBckcBF2Vq2BQrvDTntQuH8OuiSAsTqdXaOsrSc0cdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794760615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=jDvIewuHgSWZFSleCln3tAW0HbtV7RMR1BDCjjCoTXM=;
	b=UGDLkVqvaQK3EydhyPlaizlTiPHUDKIIkHq08PEJ1hps+A0fA7h+WMj4ApUk/h7OU1n7
	 xEe4FCSKtNIuRoneWSD1+mSpIxYzrmsQWtlbJqXZeW/SwihRo+UcvBnSJIn7eUP5zaVGe
	 yBj3cFrK+kJcVR3l3ySa4Kn5324DmZjxvqruqZBTZ4j/2Qfgbn9N+DZmCuP312DwpYMgw
	 e0WknJYF0mgyVZsJLYZb+VNWwI03eH4cjxxVAtIVBEnenbbJnBONC9lAfoEEXap3XBc5l
	 Vo8xNWSgREG49oYcOEptMDMoxYx2jPxKCD9fB66+KjPTpkYgHd1oU/YK/FICDcYSVtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nPZpNzcq;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF80C606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 16:36:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF80C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nPZpNzcq
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-37198ed3727so4190865eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794760614; x=1795365414; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jDvIewuHgSWZFSleCln3tAW0HbtV7RMR1BDCjjCoTXM=;
        b=nPZpNzcqkUlSgCf5mDI8d2gyF5iZq/6dT+exVsluyWfEFNJcPZ/aVwWMopDzHSJX5o
         iqlizKQCM0ioeGkjmLPVuiSiIUbu0sOqYvACbfznYGXBSAOyGdEetGBEu0MLPpMLiux3
         fV7x2YsSDtJGyjZfr8Rw2jOw/TkPKTYmO2Hewgiy7DZmDZC3z1Al0nya6Igwh/9pAJc4
         S+G4Uv9TcvOQ0XvChZ6YoVujAd72bfGoWDUdm/C2Z21sMamT7zZ6EzXmis2ErLjcBi7e
         LtLtdzly84th+8VU/aDS0H3xykSCaTcKFPyjJA37PC+eaR1gy1IZ12C9RVeQVJIjUOhT
         sLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794760614; x=1795365414;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jDvIewuHgSWZFSleCln3tAW0HbtV7RMR1BDCjjCoTXM=;
        b=GluPOJiboja5/6VeWJpPWpIchIpfNOczdXa2GD9VO3XfrR1v5olXqwURMhhbrSbCrN
         OmcndO6c1gbs47zzljv2IspfxQGDbgjBJx7hPGDkedyfKwGi0KJpRP43BAf3/Aq7GYx/
         Mc+mWZU8pJC3eS+2C/T8fZW+g6S4NqpPw+3PuthcvF7s71ieruqjAvOtzmO78m6DzmMM
         hg5GLB6C694QrxPdZ0940gOqjUY1RLP9MF8iC3uaNuEtFncwaIvVybmLP/fGgqPW23v8
         W3wFHq+V3NEFARf8PsOgp4qkqvWISE2y7fx/e9C2IlvZvIi21V1XFMWtgS7vSyzBdHCe
         ljTg==
X-Forwarded-Encrypted: i=1; AL+hErGUM1M5w778kUxICW7jvykUA7ke0lepyt7ySnQYIg6KCpbO1R+rh8ml1Husa5XeAu9vWeqU8nm37wGKHXA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EILnQN5hg49OajbroIREoCHzIykOzfURcE7e9v3RdpO29gKIr
	Cw92P5QUrcnsef0ETHD+UcM68iQ2QFj7SRCnGzwuVznBH1zhIaFSJ1rE
X-Gm-Gg: AYBFou0HgUmwUcW//JdBIlbvxx09RiZKl9sAFsqLgfi97uwof7lYa2yvQnzXEwif1ND
	/FFGHQ6G32oceQnmVGnN0PoOfa9LHe8D49lcJD0PcFwzFsV6wbhqTDbJDB8cxHhR/ZCVRCtiA3u
	Cr539tRjp7IwzIhp16T8cygVWw12kddf6kVymbjsGW9jtGOingJ2NsEhTUrSkhExcsXyhycY6g0
	rUIKALPbRBDUnTpeUjvL4IFqqhpBc1p/AB47wPjGm4v0yNLVKG77EMmauUfEEtHDn4MzxHCejIf
	MVaD/ZcNK3Bn11vRHgWk6drxXrRiU0f9hqzIHlIknsF+Mrq5K2FEGMjW64lYfttuAfA5iTN9dDR
	GPNGaUggChXaRbsPHmeecfl8txoS9bOjDzPRwtfpbjIEIjp1QbxkWtyjfgPze4eVXYcy74dQ41F
	mkSwm25e0OKnvFnr4Qv+4KzSFVrtqyM17wP24MkefjQZHp3VxkskHYxKy4qkRyO51uGIrRbJPTm
	CJfFwhYwDIej9M5i2/WrviuVfe0fl60qoXO99MRxYZ+nXIFs5iVOktbAyLj50X8uRVhtFIN9K8I
	gYX1yInt8t7KjIaxHf0XKQHyrhtuBEkfqPCutGLsKw2GcP7RO/l5H4EISdgwK3NlCCkj
X-Received: by 2002:a05:701b:4549:20b0:1b4:facd:5311 with SMTP id a92af1059eb24-1b4facd5aacmr9201605c88.8.1794760613916;
        Sun, 15 Nov 2026 08:36:53 -0800 (PST)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50313d8f5sm36028735c88.3.2026.11.15.08.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 08:36:53 -0800 (PST)
From: Cheng Yongkang <teel4res@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] tty: n_gsm: tx_work can be queued after gsm_cleanup_mux() flushed it
Date: Sun, 15 Nov 2026 08:36:46 -0800
Message-Id: <20261115163646.226207-1-teel4res@gmail.com>
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

Hi Greg, Jiri,

Before anything else, a question. In September you said that n_gsm
should only be touched by people who can test it and have a system
that uses it. I do not have such hardware; I only tested with a pty.
Does that still apply to bug reports like this one? If it does, please
ignore this mail and I will not send more n_gsm reports.

The issue needs CAP_NET_ADMIN to attach N_GSM and a gsmtty close
racing with the ldisc being removed from the base tty. The window is a
few instructions and I could only hit it after adding delays, so it
may not matter much in practice.

gsm_send() adds the frame to tx_ctrl_list under tx_lock, drops the
lock, and then calls gsmld_write_trigger(), which checks
dlci[0]->dead and calls schedule_work(&gsm->tx_work). If
gsm_cleanup_mux() runs between that check and schedule_work(), it sets
dlci[0]->dead and calls flush_work(&gsm->tx_work) while nothing is
queued yet. The work is queued after that, nothing cancels it before
gsm_free_mux() frees the mux, and gsmld_write_task() then runs on
freed memory.

On v7.3 with KASAN I added a udelay() between the check and
schedule_work() in gsmld_write_trigger(), and an msleep() at the start
of gsmld_write_task() so that the worker runs after the free.
Closing /dev/gsmtty1, which sends DISC through gsm_send(), while
another thread set the base tty back to N_TTY gave:

  BUG: KASAN: slab-use-after-free in _raw_spin_lock_irqsave+0x40/0x60
  Read of size 1 at addr ffff888111b183d8 by task kworker/0:2/791
  Workqueue: events gsmld_write_task
   _raw_spin_lock_irqsave
   gsmld_write_task
   process_scheduled_works
   worker_thread
  Allocated by task 9384:
   gsmld_open
   tty_ldisc_open
   tty_set_ldisc
  Freed by task 10:
   kfree
   mux_put
   release_one_tty
  Last potentially related work creation:
   queue_work_on
   gsmtty_close
   tty_release

That was one hit in 85 attempts over 60 seconds. Without the delays I
did not hit it. n_gsm.c is the same in next-20261113.

cancel_work_sync() cannot go into gsm_free_mux(), because mux_put()
calls it under gsm_mux_lock with interrupts disabled. One option is to
set dlci[0]->dead under tx_lock in gsm_cleanup_mux(), and to make the
dead check and schedule_work() happen under tx_lock too, so that the
flush_work() after it is the last one. __gsm_data_queue() already
calls gsmld_write_trigger() with tx_lock held, but gsm_send(), the
CMD_FCON and XOFF paths and gsmld_write_wakeup() do not, so the lock
cannot simply be taken inside gsmld_write_trigger(). I have not
written or tested a fix.

Thanks,
Cheng Yongkang
