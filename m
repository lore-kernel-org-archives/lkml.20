Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792544216;
	b=1EKkP8H5rcx5cI/eMX7ChoaBxVybJBQgrQmT2rvlFDQ92NZSWrhthiFLuSe+WGZPit46
	 YIi8djDk+toyURmxVu14a0PisWOolWXMfjEsaAiVsimwN8fg0gFXK46zJLvv3wsEB3ceM
	 9SEEdf29CcI6bR+CuOQqrtYhc3HjAD9bnVoAfYZ0sRvfoLJN+kktLM4ISy7EZ7hARolkH
	 0CJCfhAbwTY19EytRn7un8ONCBw7qyOXSCnzeztDbH5BMf0dmBvGZLaOPR1YzZ2D5gU5k
	 EhiOTmx3p3DcZcUhpvF7RKBiE5z67DGQuCX9LF/cGCSpwL3WHmTo5j6ttBy0DnZE/Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792544216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=c8FRBRNRn8bl0SDKL7RuaEvjORkG9mV5zlR8I8Ub4DQ=;
	b=RP+4E+QGX2/gtcMY2LnpkE86MLt46iWgTlJZ+bLNVsRyO7DYca4VxtL1UPE+YC9upoxg
	 3wYN31FQPPEOzKKqeQ95reOCfJSqSNqT5JW7cJ1mYbWaJPMgHd/72+ibxnO1n1owtJ0mV
	 SpniNbWDLF5XkCTrf4lOpr66L0Rj4/0NzPDbGZnn57sI86MNUs+0gZS+eeR75SkMJBsK5
	 zkoFAycVf0ht7XC/Z+UliwvI1S+ZDKWciI2UJqSN+9u2oMQA1Lrb4nxhDr3l+DqGk3Jnu
	 8iS+r6+8ncighKVm/Zoq5sm/eZX9JslXJR2ZD7eXyKVeHQBwqLswUzgWiBfRsN3OsGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=XPgoTH51;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA1C606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:56:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FA1C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=XPgoTH51
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91c11468b5fso2463616d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792544215; x=1793149015; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=c8FRBRNRn8bl0SDKL7RuaEvjORkG9mV5zlR8I8Ub4DQ=;
        b=XPgoTH51ArrcLYQJR6YWZFsr/dbR42KqJfw0DuxbQPeSsIzjBbrEESoXsB00rkuYKw
         xmSTsUTNMSrM1dArd5Qs60x82aFvvSqD/4nqlaEuoa5CtX/XI9m2B1ikzPmSl2xZ7GxT
         l8vAZ5euRjVMdY2pHTENG1Cc1kH3mDqnXVLhOV583D4e3v2Wsls0s+NraPZ+FAY9XCZJ
         dLDyj/1FqBl2oDIIOlO3T6u81KGUmm8Zgc4TKbaKO6S4NOt+21PEiwN1hJ85LwAkyQ5g
         j/l3IoNLlFrW0VC7H9stsfJnVHHSrlkHR+jNidB5NzWQIaDHRE1fbb8hPciLZKQMr6lT
         TVxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792544215; x=1793149015;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c8FRBRNRn8bl0SDKL7RuaEvjORkG9mV5zlR8I8Ub4DQ=;
        b=aLimVS+WuuU984o+TVFPUgPm7by4Gw329oG/0TsfD3MPbu/XaEEnzQ+mTZ5khKDXB+
         9qJ2vukNBKBLfU8/5bfoO18PSa5KSAjRacSlqFpyhzxQFo4R3IASktwlel9C8iJuM8NN
         Gc7U+f8ea84FG2bho6JZOGnU2/YFkhZs+9URdVyA3/eoCUxSfJzaA1WQTY9Mm6sUKeiw
         vDF82/BkqGV6ZEdIJ0nWJBtw+8xMuB0IxrAWmFNJEbAFUCB37UoOXgwJSPC85wE2rR/4
         34e1bCOgDAeomzATgqabKq7zjfr4fkhYTZffInaF8gixgrS6FMbv/3eSwSA06HRVb2GR
         WGRw==
X-Forwarded-Encrypted: i=1; AKwUvBwwtq1t3UX2gW98EWdaLWIVeH9VBxxYGBNidgzdnAgrVjSR6jt2rRU6F5BQOkyqgY5INOHhVZRifO9kB3M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyclocDnnshjsuLtqMCu3W+BeIZfPT1ZSRjsd4ACeiYff3coCe
	G/G3MBtmKsV75fivDFObYR63CI0w07HkkDBegNQbwA/cy3VsYhJe5wG9/ZbkmdJXI20=
X-Gm-Gg: AYBFou0LKzf6zemhk8AjPCcaLPitY3ODpeoOhn1wJDIkCaZw4g7uMUtFbL6LbNmUANE
	ilwklABwRK+TMGuXd+QtqLGNomAbILgMKYfNvtr9wA5k1CeDThRKe1tYA/iF2Tykv42jm5Abc0A
	hnEV1AeUTVhSmkEViHTzg59pwttYTgklxId9A6T0W7HTGDufci8c7nOExXLvI9zyEAXW0uJte42
	b36GGjG0pwhrNrVkxCl/QQAKoSbQx3bcnQ6pWuT9L1/PBbRH949c4/aBJhPsdMR4cBXJjyerPQw
	EMSJBOowkqmaPImF/cHboH7wNVR0Eabfn3UquNGhe5+ZyoPGXBw+x3uAGKYF17/oaFDH9dYOXzi
	DC1XRw3JrrRJIEvTGXbw05fHwJ7rwk4NYnV6hsuZqgg4Xbp0rClQLQE+jxQnPl3b6X/8WGiQ2bs
	Yzju79T5P4I5VZir5/vnnRsCeTB/7RbRNpBwTa98+j7UYPLyR3pnWsdjbU/Ixm59owRZaoOPg9f
	teIHb6+CedDCXpQ18o50NjRjzusPSREoVtrra47fcD1bU1WOWnKoXJ4Y6f7vrz427OyZeLQoVYx
	cVBltwcd7NmUqclfOA==
X-Received: by 2002:a05:620a:440d:b0:93e:653e:6981 with SMTP id af79cd13be357-93f57e459cbmr179503985a.11.1792544215209;
        Tue, 20 Oct 2026 17:56:55 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.255])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c10cf9f32sm11388256d6.45.2026.10.20.17.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 17:56:54 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Subject: [PATCH 0/5] fs: don't let a stuck unmount take everybody else with
 it
Date: Wed, 21 Oct 2026 00:56:34 +0000
Message-Id: <20261021-b4-super-lock-dying-v1-0-2b35e86706ff@toxicpanda.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMMN2GoC/13MwQrCMAzG8VcZORtsyxDnq4iHtI1bVLrRbKKMv
 but3jz+Qr7/CspZWOHUrJD5KSpjKrC7BsJAqWeUWAzOuIM1zqBvUZeJMz7GcMf4ltQjUewMsbf
 dsYWynDJf5fWtni8/6+JvHOaaqh+elNFnSmGop8r9fxa27QOLOgdFnwAAAA==
X-Change-ID: 20261020-b4-super-lock-dying-aad90aeb1984
To: Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792544203; l=3332;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=wAS62HwPfAj/+XcJD7YqvP0MGbTU2mrv9OwpKNV77eM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPfEh3kXPerMOpQ8eMqSpuaOemDsTLQn/vPOj6il0zo3jNXJV0Gox6+CV/f25xuHEhfMXsjSB7B
 CnYFUxIV2hQ0=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

Hello,

A consistent problem we have in containerized environments is a
misbehaving mount taking out all of the other containers. We hit the
super_lock() while we've got a stuck or slow umount and everything backs
up behind it, and there's no way to kill those things.

This is because we call super_lock(), which waits on the s_umount lock.
This is held throughout the entire umount operation, so anything wanting
to operate on the super block has to wait for the umount to finish.

This is fine for certain things, sync() and fsfreeze and such. They want
to block because they want the work to be finished, it's essentially a
barrier on the cleanliness of the file system.

Other things don't care. In that case we should just skip grabbing the
super block if its s_active count is 0, as it means its going away soon.

In the cases that we do end up in super_lock() and we don't necessarily
care about the barrier behavior of waiting on s_umount, we can wait for
DYING as killable, so that we can at least stop the pile on of other
tasks waiting on the super block.

We set the SB_DYING flag at the end of the sync, right before we drop
the s_umount rwsem, so this is an easy flag to wait on to get the
barrier behavior without taking the lock itself.

This series doesn't really move the needle on keeping the host usable in
the face of a hung file system. It is the first step in a whole long
series of steps needed to make sure misbehaving containers can't effect
the rest of the host.

For testing I put ext4 on a dm-linear device, dirtied 64M, suspended the
device underneath it and unmounted, which leaves the unmount sitting in
sync_filesystem().  Without the series drop_caches, quotactl(Q_SYNC),
ustat(), sync, BLKFLSBUF and a second mount of the device all end up in
super_lock() and ignore SIGKILL.  With it the first three come straight
back, the other three wait but go away on SIGKILL, and a sync that isn't
killed still doesn't return until the unmount is done.

Freezing the device (a dm suspend with lockfs) and freezing everything
for suspend (pm_test=freezer with freeze_filesystems=1) wait for the
unmount with and without the series, SIGKILL or not, and leave nothing
frozen behind, and the emergency sync doesn't claim to be complete
before the unmount is.  On both kernels the unmount finishes once the
device is resumed and all the data is there, and 200 rounds of
unmounting with sync and drop_caches running against it are fine.  This
was with KASAN and lockdep on, neither had anything to say.

fstests ran against ext4 and btrfs, no issues. Thanks,

Josef

---
Josef Bacik (5):
      fs: make sync(2) wait for superblocks being shut down explicitly
      fs: make freezing for suspend wait for superblocks being shut down
      fs: make the block device callbacks wait for superblocks being shut down
      fs: don't sleep on s_umount of a superblock being shut down
      fs: let a mount waiting for the old superblock to die be killed

 fs/internal.h |   1 +
 fs/super.c    | 124 ++++++++++++++++++++++++++++++++++++++++++++++++++--------
 fs/sync.c     |  15 +++----
 3 files changed, 117 insertions(+), 23 deletions(-)
---
base-commit: 2c3ba1f1cb416b81d617b92a24a4bcaa48d574e3
change-id: 20261020-b4-super-lock-dying-aad90aeb1984

