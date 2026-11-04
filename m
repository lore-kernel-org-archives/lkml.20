Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818308;
	b=fnWvO7joETLA7pPGixcz5YMqptOWg9kKmEjawC4KJ9IwM6breJLiV5wI3gXdf8okdarH
	 LAI3pbp/3bQiO0jzJb0s9Kaz4dwijWbI6qCzoSSXkREokxmFz9z3SaRgXENvteTo7Jb8y
	 dNHxIbh8/fxxfguM3XQh0XKyuurG3oxIvjDH7T9WNSOFTvefpjHiqY/0MV6ZzjLthmie3
	 h96ceKzBMteBq5R2/iKdc+6tBf1bemr2SK50FYrYsy53EdfyGMRBZ3T0q62o2Bban2psv
	 C5+845kB6JeoJ62vY8jNQjdJXynKKjJRoaFcbMoB8cHlWMTayI36plkXOq8ujZIEfCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FR9ISTDLDcSmV8QN0XnoAmz6g1DwpZqiIgX15CQUaGg=;
	b=zcHhtvuIy23wch/2AT/Omu3tcO+su0HlLHKrjiXQ5GlH1C0LuWqP0MQn82AIS8RDiRkN
	 zyJHQAqDgQ3ojy/CXnwuLl81FNbuQV6dTgSR9S+n16SwmXSGmNJJgvB34QFbTplmOgx5U
	 vhwsTHMqSDlrT/9ojPywT87j9h/2BSLxTbN/JiYJcCG7SAaO8WbtsEXV2C5QaiziopVKZ
	 PNyVKosgcOvrRQnHOgsgZu2Zgnoz2GrC7RJoKtPt9zFw2IHRB6wpbRp+90dr94r1kavye
	 9xSyUgDpHItT7nWC9opnZTXkgqKNp71Fo5VtTJ9caBx0CTMuWCE/oAeObnUBZnwsc1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crusoe.ai;
	spf=pass smtp.mailfrom=crusoe.ai;
	dkim=pass header.d=crusoe.ai header.i=@crusoe.ai header.a=rsa-sha256 header.s=google header.b=aXZc4RUt;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA618606EE87
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:51:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA618606EE87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=crusoe.ai header.i=@crusoe.ai header.a=rsa-sha256 header.s=google header.b=aXZc4RUt
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so1912475eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1793818307; x=1794423107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FR9ISTDLDcSmV8QN0XnoAmz6g1DwpZqiIgX15CQUaGg=;
        b=aXZc4RUt+X6JLu/yab1RJ4ui6uxGuurah/MuZQ2E8AB82pImMo512+wmAYfQytCWox
         aq+acp0ro43dxgAh8SQt0EuqzHdVrZ5oVwCOMuOhoZglZBH6893xIb/tczwV8UrUlqFy
         9C9QRDuayn1MAsQ318jYS+iEXm6PHdOARh46+LFrXSLgYNb/StSHhum9c+8bwyWP1qVn
         VHoZAvLLzPa6iw2eEWn41OT+B3pcdvcMyqtmHoYe0folbB27uIXZgPSfFoP6AlsZq2zP
         +Y0wNZ982HQnjz7H97oDPDvF2fnARaURqusezb9+gLXnqA1uU//CZ4J2EOMinq6gz2CU
         3z3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818307; x=1794423107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FR9ISTDLDcSmV8QN0XnoAmz6g1DwpZqiIgX15CQUaGg=;
        b=fbaVIE8O6rziimaxXNqSA2jH3AF0b9BDn4n+3vMM2ae1xjqqnuWi9ZXdaw/ykbPn+g
         WCvO/nDJSXuN/wa9Fr3imdFsKqMB9OgxUyh+P2UTj3xGn/qTfvRK11QqvM2YmstwEgIX
         YvenSfEdTr351eKtLjh8RRyyFDbMN1yTuC3foxQiwK41qjt3a3/421Hb1hyj05WxPyYD
         F17qFZsOSrlvh25A+vhfgz7nwY46PPoXTAeIsD6g+cQMuK8Fx2fW/Fw/3CVwmc64W09n
         7n1tbWiUSbM1WY5jrWc+oce6yS+54/JKi0Qt3hoQ9aS31dEYiLeEmRXXWEChamGjOzb/
         hSIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxC089kS+xBwGWaJcol/xlro/c+TGjrDv8XRhd/t0713O1+vAUm8mvtaEtbrPbccxRFRfq91ccmgLTTmTk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/imgOi2fUMvJ3XiZJLVUJcWe5M1Y+OTrMKTCP/D3u7sC8Asbmh
	F0tvaY+ieidolDkBv6s7ZaAnQJJS+idpT9VIUiloh87BWRac6tVHmCJwkcLrt+WPnbc=
X-Gm-Gg: AYBFou1f9hQNYimjGKn32EWcxnEgqHLh5VEA1LcxZ2uKNJtZicO2JsXftbqHZFa1VEf
	aIFgjaQSFRm7p3tZp6oLzHfhQq8lY+epoXA1jFiPfA8eqsB18GiAyFb8S71J4isKSz9khiVDo8A
	XVfbN0cCfcbX0MJfsmcb0F3NmyX3VXDFwGBpKYsAWbOy5og5aGWHQOziNDAmmyWxRYSbtzXtyWJ
	IBE6BmSdEt1DUJobbKlOFq4CF1C/RMHObAST3DeZub7jpLVYnjKMQYRybI125c2+qnSGdSLGIZv
	MsIHkKuHQrychVIHYZR4s2PH83umuYJG8klD5iViND8jqtgnKWWyByfq69FOFATXEqEpGo/S0wk
	UA4XQ01s1SRolJETulUCGZNlawWeiq96VJlnmMLxSUZTJvKU0hrivhN66u5dcz3mF/bKmACozv9
	K5yWzFSu6xcOgSVjVdbxW+fJh83lv8YAy3TMHCkcve+XSk4L92BVj+5vsd63nCuPKzxNp+rpvZZ
	wPoCZrQlAnH+lerASwEtcO2qNOKV9VnLPWYqLs6cKbYBsLmGNBF+nfTt4pj1MPEL2ECnkiEcPiQ
	5F3Wl3TXlPKckwz7TAWxUFgvNoQVGCT6vJ3cVsyd401mUyf9SjQoVOQIx7jPAbBVsW7gMfVWCwo
	=
X-Received: by 2002:a05:7301:6498:b0:36d:bf43:93ee with SMTP id 5a478bee46e88-36dbf52d6cdmr849344eec.28.1793818306527;
        Wed, 04 Nov 2026 10:51:46 -0800 (PST)
Received: from MBP-Saravanan-D.civet-hops.ts.net ([67.208.231.220])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3966daasm12193389eec.23.2026.11.04.10.51.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 10:51:46 -0800 (PST)
From: Saravanan D <saravanand@crusoe.ai>
To: sashiko-reviews@lists.linux.dev
Cc: Saravanan D <saravanand@crusoe.ai>,
	sashiko-bot@kernel.org,
	linux-nvme@lists.infradead.org,
	kbusch@kernel.org,
	hch@lst.de,
	sagi@grimberg.me,
	axboe@kernel.dk,
	nilay@linux.ibm.com,
	dwagner@suse.de,
	sgogte@purestorage.com,
	hare@kernel.org,
	hare@suse.de,
	linux-kernel@vger.kernel.org,
	iyamahata@crusoe.ai,
	kiyer@crusoe.ai,
	ganbalagane@crusoe.ai,
	sjpark@crusoe.ai,
	bchen@crusoe.ai
Subject: Re: [PATCH v7 1/2] nvme: add per-queue sysfs directories
Date: Wed,  4 Nov 2026 10:51:25 -0800
Message-ID: <20261104185131.92361-1-saravanand@crusoe.ai>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <sashiko-outbox-197419@kernel.org>
References: <cover.1793800758.git.saravanand@crusoe.ai> <656dac7329c8452efe786b0c76a3b8c0bbf53159.1793800758.git.saravanand@crusoe.ai> <sashiko-outbox-197419@kernel.org>
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

On Wed, Nov 04, 2026 at 02:17:33PM +0000, sashiko-bot@kernel.org wrote:
[...]
> [Severity: Medium]
> If sysfs_create_groups() fails in nvme_add_queue_info() after
> kobject_init_and_add() has already published qinfo->kobj in sysfs,
> should the error path call kobject_del(&qinfo->kobj) before
> kobject_put(&qinfo->kobj), just like nvme_remove_queue_info() does?

I'm surprised this sequence went unnoticed in the previous versions of
this patch, since the error path has not changed since v5. My fault
injection runs used DEBUG_KOBJECT_RELEASE, which would have exposed the
directory left behind, but they set fail-nth on the task writing to
/dev/nvme-fabrics, and fail-nth only fails allocations made by that
task. nvme_tcp_setup_io_queues() starts each I/O queue from an async
worker, so nvme_add_queue_info() runs in a different task and none of
its allocations failed.

I will send a v8 that calls kobject_del() before kobject_put() once
kobject_init_and_add() has succeeded, so a failed sysfs_create_groups()
unlinks the <qid> directory before nvme_add_queue_info() returns, the
same way nvme_remove_queue_info() does.

I have also extended my own testing with a run that uses the failslab
stack filter to fail each allocation under nvme_add_queue_info() in
turn, including those made from the async workers. It checks that a
failed add leaves no queues/<qid> directory behind and that a controller
reset can add the same qid again. It fails on v7 and passes with the
fix.

Thanks,
Saravanan D.
