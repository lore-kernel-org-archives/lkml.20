Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB772F8E9E
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 17:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791306948; cv=none; b=n+SGjI8nZveCycnvBitM8L9iz+JJFh0qKuVPUxQ2FtUb1RwPOX+4hw2djpjuJfY+D0ttbvi+GW1eFO8YIWAmUE96JOE8qFohWJvR7PEhJ5Prh9vYHAy/ePQOBy0qC+IDeBobJzSu99Q/RkGvhqruC+mCFBokJrKIRgFrfZ05Vms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791306948; c=relaxed/simple;
	bh=d8S055UBj/5wN71BcPPpjejTrrppkWE71ziPbZmIhNo=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=B02y/qxpJF8jc7qI0lW6t/Wk63v13o5YnRd6MDId7t2ZCfgmJAo5twa2niKy8Lesb2KRR7m6BoGKZoU8HPjEPj2F12uBs9DWKsiWlJcDttAqYqjEE0qR/C8Rkdt0fSI7Tf1X8fopsx1a1mpyyyTNaw8ZKEg8uYhBk0RuG+OwrBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=IOXpxqkv; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="IOXpxqkv"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-53394bffe0fso21934681cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 10:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791306945; x=1791911745; darn=vger.kernel.org;
        h=cc:to:subject:date:from:references:in-reply-to:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tb6m6q3lI6SI4f4aZTEHuBTNP07WEiV8+eieTwoYduY=;
        b=IOXpxqkvfhkZJDlXEkl09ZDv9f6QrHSc9XpFT6btkZ9QwfqU/yK/CvaScr9U5WwCtf
         3XI8/504BhydaVbO8DiID6lwRTuQgnQMJ1FeytLD7g3ybZAxOp2cNnErNBhzTh7YBJ1r
         Gql7gRDaBYnx3XV/N4BngNBOnrO1HogmIuFzdCsPOOfUZ+R5HK3d8cZuXQ01yxpJhDHo
         QKqQuBwsBsaaR6as+q7uOZhFDp/a9NdS/rn2AozRZUAi6pyLzzziUUYupow11m80HohJ
         fIZpeJztgwo0I97IWTmKxL8u/ipCG2IQmYAUUSmS8iUEd8HEZfk8kZk/uhcuKf2/xY2S
         W7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791306945; x=1791911745;
        h=cc:to:subject:date:from:references:in-reply-to:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tb6m6q3lI6SI4f4aZTEHuBTNP07WEiV8+eieTwoYduY=;
        b=P/R2xktI2BEtJNIffc9Pc3gtxxMPvJz57ExE7E6EZ9rIw1Z9Xuu9YEuuhu1GTz5QOU
         pEImWfUYCVzZVZ6ld2Q0Xl7pkJoS1yM1PEhjGLkGvl0GQCX/O11nsuzLAac2D4ktc/pB
         uuUuBBNTF0pj5aVcoTGaXKPuVyMM8ioKQywie6pSri8jgUmpbhnsS+NR8342jX5HAvPj
         /LR87amlaDqgzrkAYsbdWgu3AcCz8zGQNDNO8fXmOqnDs79lxchlYS17T8K88jrE/nZp
         FOtGgYMBokiEjQ/9TB3yZlM/HSGAxFdw44raXnvvgrOjPMeMIydozZr38G8TibqJr5Ep
         36jA==
X-Forwarded-Encrypted: i=1; AKwUvBwdOztmpRPSO3ZjeP60edHpc7migkiFynItTj+dDl+kSaHTKoAcy5iEltOzqMqosjItemofr3ZCiqsaEq4=@vger.kernel.org
X-Gm-Message-State: AFuF++lb6ctvjhhlXH1kICIqCwCvpoEk0fHfjhibmCbR4X0b2INSz5JD
	uQogD+n4B9dYalnMG89BNwU7XFsKS8uKARJJmB7bXqRH/JudJf2Aja8qZJ+QCBYULz4=
X-Gm-Gg: AYBFou2xd9z5+d/49riRLUEVTwB7tNlB2tEmpiTQt1ZjddhN4Cm+iVsZtXKZqRbB2xp
	hVtUWWUkH2WvDInICZ2+Rtis9Sclx/tkhiOjbecndUcXiMcTyHF9iPAj70aO8A+/HC22oT2JNt5
	nSuv7Porpo4NRRfkm3RHy54LzoIQn/v5021YyC2H2e+4u/Dssn/3r2NZtgH0AMNa9DmPZKKmLdf
	J99Q62FDUr0eYuTrg0aX0co24QOrfGz1FspniUrfF+q3baTAPxbYE4B5bnbGFhEl3klrD5qhZhv
	CwUl44WHJUWeQUAKnHa4eSW+V8zvXam+9OwjNHl7SOnyPXTqU3SPOl50DfS9NTF2dftO7kNZT8i
	RowalI2HN9Kh5MNPZY0hGi/GLV0k0A7CP8NZMK9XlCrZUAdJRFzjshyV46wJhXi74cjOxmkHEdy
	4f66SMclusMZZG0mZOSonkK63nQ3hbWDjJcL+WUHFt3dZdOf60mwLIwD7pXJFLuBwIa2VUVXmtG
	8U6aqheYOoN3XZ+A/uIVggOqQ==
X-Received: by 2002:ac8:7e93:0:b0:533:37ff:92c1 with SMTP id d75a77b69052e-535668c9ad1mr33799181cf.8.1791306945270;
        Tue, 06 Oct 2026 10:15:45 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.249])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53571f185d7sm675691cf.2.2026.10.06.10.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 10:15:43 -0700 (PDT)
Message-ID: <cover.1791303049.git.josef@toxicpanda.com>
In-Reply-To: <20261001125422.1364260-1-tom.leiming@gmail.com>
References: <20261001125422.1364260-1-tom.leiming@gmail.com>
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 6 Oct 2026 16:10:49 +0000
Subject: [PATCH 0/4] ublk: fix UBLK_CMD_QUIESCE_DEV leaving commands behind
To: Ming Lei <tom.leiming@gmail.com>,
    Jens Axboe <axboe@kernel.dk>
Cc: Caleb Sander Mateos <csander@purestorage.com>,
    linux-block@vger.kernel.org,
    linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

UBLK_CMD_QUIESCE_DEV has two problems the fixes for STOP_DEV and the
FETCH rounds don't touch.

Sent to a device that is not LIVE, it still cancels after it returns 0.
A device whose server died is QUIESCED, and a new server may be
fetching its commands for recovery at that point, so the cancel takes
them without marking anything and END_USER_RECOVERY brings the device
up over NULL io->cmd. Patch 1 makes it cancel nothing then.

On a LIVE device it cancels in one pass, which skips every command
whose request is with the server. The server's COMMIT_AND_FETCH arms
the command again right after, nothing ever completes it, and the
server, which waits for all its commands, never exits. The device stays
LIVE. Same for the active fetch command of a UBLK_F_BATCH_IO queue. The
kublk selftest server hangs this way within a few quiesce and recover
cycles under fio, on every kind of queue.

Patch 2 drops ublk_wait_for_idle_io(), which never waited and would
hold ub->mutex against a stalled server if it did. Patch 3 has
COMMIT_AND_FETCH and NEED_GET_DATA give their new command back on a
canceling queue instead of publishing it, deciding inside an RCU read
section, so the I/O path gains no lock or barrier. Patch 4 has
QUIESCE_DEV wait for that with synchronize_rcu() and then keep taking
the armed commands until the server owes none, bounded by its timeout,
and stop once the server's FETCH round is over, so the next server's
commands are left alone.

QUIESCE_DEV now returns -EBUSY or -EINTR when its timeout or a signal
ends that wait with commands still owed, where it returned 0 after one
pass before.

This applies on top of Ming's "[PATCH 0/8] ublk: don't dispatch to
canceled io commands" [1] and my "ublk: refuse to go live after an io
command was canceled" [2].

Tested under QEMU with KASAN and lockdep. Without the series, 20
quiesce and recover cycles under fio hang in every round on getdata,
zero copy and user copy devices and in some on batch ones, and the
quiesce-twice reproducer oopses. With it, 3 rounds of 20 cycles on each
kind of device pass, the reproducer is fine, and the ublk selftests
including generic_18 pass.

[1] https://lore.kernel.org/linux-block/20261001125422.1364260-1-tom.leiming@gmail.com/
[2] https://lore.kernel.org/linux-block/9b876f2c061abc401ec4b9b3c2529eda.josef@toxicpanda.com/

Thanks,
Josef

Josef Bacik (4):
  ublk: don't cancel commands in QUIESCE_DEV on a device that isn't live
  ublk: drop QUIESCE_DEV's wait for an idle command
  ublk: give the command back from COMMIT_AND_FETCH on a canceling queue
  ublk: keep canceling in QUIESCE_DEV until the server's commands are
    taken

 drivers/block/ublk_drv.c | 286 +++++++++++++++++++++++++++++++--------
 1 file changed, 230 insertions(+), 56 deletions(-)

-- 
2.55.0

