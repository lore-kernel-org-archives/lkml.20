Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9517CEEC0
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789538006; cv=none; b=qu7Zc5pEge7iTbYw4o7DrIG7pXBqiW155u8HrngK/cpz7HpPJRwAS4d0EIL7LJMYXT/eIEh97nIr9yKGReakHzqRk1gGi0n5vM761OFiGfPGMFW6vGgWh4OzFqHPNtllKQslUJyoyxZfQrXocfIC8HZ880IuZDB7nCFVnAOWKoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789538006; c=relaxed/simple;
	bh=TGmBxZkAVEbyP4jdteI6smMJFRjKiXbFQSonddP9ncc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kLgDasJy9ShOXHk97q9x0Sdzktjy5EfNpFmXH7nN08dagZG5bDYHIFso0egRC3FzolqQHGJLaCMaZTQFqtt3toO7gxLFH9a8sgna+xMzPyKZlldjbNQSniF9MRaFgCD+5bio8KddDpR+QwcTV8yemM60WaJTTZduabNIt9Nvpvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=KKaE2P8a; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="KKaE2P8a"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso1211838a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1789538005; x=1790142805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QwZJQra0U9Ii9RAq89t8ck1DuK1mpAEqHvx5PmiAUkc=;
        b=KKaE2P8aE5xx26yZf3W5ZfpgdJhP4uR8gW9cT/C6e0Xoc/Jf8fpOMoDdd51WdpKsn9
         fTfLebCGcrmMo7ClMq85J3DU1GrPhAptFwei5uwb73bvkc35Csn5dVwxASG8Z0TpFFVx
         VO6f1b4ThdVjHV4GqAKZSnfDng5svGo974EXkSYiz3aSlO49pAAlTwH4Xe0YWaIhRNrX
         CZ8g5Ti1wx9nagFw6/HNEaGK85fn3u87o+835fN+eRHH8NqqJKjomWWjXdWVSATVruhu
         1PTYpCnnby8+OE9pMn/MDiU4TquKuACsj0l7UkorXgU5ISNjE+/F+xRSTz/+zEI/RYr0
         JAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789538005; x=1790142805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QwZJQra0U9Ii9RAq89t8ck1DuK1mpAEqHvx5PmiAUkc=;
        b=o/d1MJl5ByoGVSmjyDjXDGb3d2Esr4JWUAv3hqS2bfg50zD3MMKAk5C64d4xPUKWAD
         a0B/Sqz8JFC5CHb0ARnLux3C6GLfap6N9Kzd5uQeaFqb6tgKqcs8OjsVCbh2civHGszf
         zEfeq4L6VskBBk4V0I403fKEH6xhtg/20h1khULjDmMMxUZbzkrAACCb5GomkSwNIHW9
         BNOrxFDxn4TUyfa2thhypawW3Z0iQuzUyeX5lCpyLwG/R8qb2tbnPJp0H8NpnIHC0Mf2
         eYlXAngjd2QoyWuW9wjVIs36idirS/jqM3KyfQ3cnwByTQbDOkPH0DKBQGfuatYRJ5XI
         xsXg==
X-Forwarded-Encrypted: i=1; AKwUvBxXDhMUQawK51fum48RaTrvbCF3tuLa8u5y/m+8ZVRMnwngYiwSTuwNF9eb7DQjti7GDEzJyNpd5rRjyag=@vger.kernel.org
X-Gm-Message-State: AFuF++mpFAvE4i712xEblvnQVG7SphcMgH/kUh/ZvUXvScz74eL5MEdK
	TxOVMakwHaSnwp9eOvuWtQ5whBL936GeJh70dSJs+QiI854elcSk3jS1hjAaGKs7G5E=
X-Gm-Gg: AYBFou05XoXf7YrvFoC2SCtt8ra9Z+f9gqVb0ZzyfXiBiW/Im7SOdhnSIinEbG8dCXF
	rv0fmSq9ejTEsa/CR8JAl7lDTfQ5mm8Cj5Sa3fNOB2SeS1kt9AnwRnf6vu0KS5satGRxGLe2UhW
	jRlITdpex3eMkIRbFtlQzzVnpmyjX3EPOgDcUjOBgSINWVeVZOZ13YxCJPlZIN9OPXYmF7kfgpt
	3HDEoA60c8vY5fTYuqNt8m+9ViR3Cz331coy0z4qZzuG9j5vEAcAuUf3rFLPwMJaX68ZFKnDYyl
	VvXtTrs7luGJ409r8EDGeaVYGyveYz9XW3yD0nVpn1CTzQ4mZn7ik2WB2N1tIvj7A9NE+pmhZ4+
	RwNZuNKND0JVgVDxlRG6TpuPb+jd1viRFkHgPnUObJkmHmMUeW4v9FlGWb5gW8MRCAfk/MrMApM
	Vd0qsP2fWmBOpOeKh04j38OIa2ndKoXDzqVLtpApENHB7ycNyqMpunsChgsmCNWzfInnPuDyhyo
	AJ2afk7I0QXoZ22iu69v7dKcSLPqVd3XtJzkPJKoxFW5ZBrHOJ+utlolkiKEc/J
X-Received: by 2002:a17:90b:4cc6:b0:39e:5cc:717b with SMTP id 98e67ed59e1d1-39e05cc73abmr7152700a91.25.1789538004833;
        Tue, 15 Sep 2026 22:53:24 -0700 (PDT)
Received: from MBP-Saravanan-D.civet-hops.ts.net ([2601:647:4380:3400:b9a3:a85e:3719:2059])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395caccf1sm3501077c88.2.2026.09.15.22.53.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 15 Sep 2026 22:53:24 -0700 (PDT)
From: Saravanan D <saravanand@crusoe.ai>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Saravanan D <saravanand@crusoe.ai>,
	linux-nvme@lists.infradead.org,
	Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>,
	Nilay Shroff <nilay@linux.ibm.com>,
	Daniel Wagner <dwagner@suse.de>,
	linux-kernel@vger.kernel.org,
	iyamahata@crusoe.ai,
	kiyer@crusoe.ai,
	ganbalagane@crusoe.ai,
	sj@kernel.org
Subject: Re: [PATCH v3] nvme-tcp: allow setting per-queue io_cpu through sysfs
Date: Tue, 15 Sep 2026 22:53:18 -0700
Message-ID: <20260916055321.54162-1-saravanand@crusoe.ai>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <13c160d0-0657-47ce-9a16-58d348267ab0@grimberg.me>
References: <20260909211432.6741-1-saravanand@crusoe.ai> <13c160d0-0657-47ce-9a16-58d348267ab0@grimberg.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 12 Sep 2026 00:11:18 +0300 Sagi Grimberg <sagi@grimberg.me> wrote:
> No need for NVME_TCP_Q_IO_CPU_USER flag and restoring to the original
> connect time selection. -1 would mean WORK_CPU_UNBOUND. In fact lets
> allow this file to access "unbound" string (same as -1). I don't think
> we need to restore the connect time selection, the user who touches
> these settings is obviously interested to be in control.

Noted. The next version will accept a cpu number, -1 or the string "unbound",
with -1 and "unbound" setting io_cpu to WORK_CPU_UNBOUND.

> I think that the queue accounting is something we'd do anyways,
> regardless of how the queue is set. It just represents the io_cpu
> spread across cpu cores.

Agreed, the accounting applies regardless of whether the io_cpu came from
the driver's selection or from the control plane.

> I am wandering if it is time to introduce the core nvme queue:
> struct nvme_queue {
>          struct kobject        kobj;
>          unsigned int          qid;
>          u64                          flags;
> };
>
> And have the transport queue embed it:
> struct nvme_tcp_queue {
>          struct nvme_queue        nvmeq;
>          ....
> };
>
> I suspect it will allow for better abstractions.

This works for me, and it settles where the queues/<qid>/ kobject
lives. As Nilay pointed out the nvme_queue name is taken by the PCI
driver, so the common struct needs another name.

One clarification for the reconnect path. You suggested earlier that a
user assigned io_cpu should not change across reconnects. Without a
flag the driver cannot tell a user assigned io_cpu from its own pick
when it reconnects, since both are just a cpu number. If the
assignment should still persist, would you consider tracking it as a bit
in the flags of core nvme queue struct ?

I will wait for Keith and Christoph before spinning the next version.

Thanks,
Saravanan D.
