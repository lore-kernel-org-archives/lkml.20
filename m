Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF0945BE3
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 17:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787939120; cv=none; b=KFuiooMQL+V9IPJIxn9HjG0lCyoJGfZNkgqzR4Cukx4EpCzb39Ba8Ikv+I0B2nQfPJsnpf1Nac49auj+nHIHtbdA6eY5jeKnjeibQqhfv9y/hba0qtRGY7Z+bW8LiGSS7U9rehYypmLdLMd5YkThUn8FueYMlUsguHpVR2rwA84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787939120; c=relaxed/simple;
	bh=gB5RTtAy5uyR3po6ncycfOXTkq1Gqhn9QMLyNLNNF1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gW9eiw2RqWktO0tpyAiJhYyHArkKiu8liwmH+ixvvWRFRzs9LQeSXJkDiD3hATp6U6rypZKv0pmzZl3yz8hXqnjezYBnaJYYHFoAoSUJXgpiuuOCoCJQSZkrqv2CLSXKs0MRmYlUfhVTwdMirnvjvSkR3hhU55uBgU5PdnY/A7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=iMERkoKO; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="iMERkoKO"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so11361565e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1787939112; x=1788543912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LiTQ78YI5C0O3US8Qv7gUnvZwNb3AVrk0V6EDSLnVw0=;
        b=iMERkoKOvBmpyeG/hH4/xDJEibGcRZ5TADPpdSTn8Bdsis/K+1i/uqDPtVji3/Wzba
         kNxkqpM68n7fZnwtMUlDju/3L+UxplWL2m9XaZ8v4bH5zp57dsJw7pQqhzj3NUV/NtCx
         1MwjghA7rTxXXBYtypvrBTlPkrerXYdNLysC1meECfdsRRbho1tSJRcTYtk2lEk3RpFv
         zqsdQOhdEsjgweQzdvTtSKImKzGSwlq5GpUTKrqx3XuMQApvMg1N+/QSAibsE3hjs9QC
         HVCtW62fjr2F/GtAbKDHTjvhCXsNqsV7fIgtqKko0wRU2Zd5Imk++KvHxu1gMVBrhUsY
         Ue7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787939112; x=1788543912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LiTQ78YI5C0O3US8Qv7gUnvZwNb3AVrk0V6EDSLnVw0=;
        b=MMnmHa+o5REuI4Qz/Sq6IbogAQKySLdGMWkhEbtTXbc8r6Cwotw+mkj1+NEZCSqbgx
         6Tubze6ky8tL5kTyWNDDzDgp6eA1D99EtnsKRAx8WTfCuGXcwOtyzrIPLEhJOZ5/7qkY
         ffNdF2XHwk3v385DGFWn/tE2puh9qLhIU68A8a+BKhxUjsLEocoStFyVcCTSGz8nInS3
         hir9g/uDGxodJ1lxbCzQMopIKMXY4106fqpjSC8DWnI7+87/kX/p8sQPz9xS2OtAQ4Hq
         cEf/Qct5ItwPjdCS+giu/7q09cK2amM2oZV2ifat/BSBfxZ2eqNVWgmjkpVJD9naKTM3
         v63Q==
X-Forwarded-Encrypted: i=1; AHgh+RqYh+2ccGdi+gL3py/bIhALp+FER7h+SczzeI//s9l8/r6E4AV6lKRv2iDvVuslCTZpqVFJtUMdIe7gDc8=@vger.kernel.org
X-Gm-Message-State: AFuF++m2fFH7TSo55dNrbKFHWhgM+xoefzCGW3+vCp0JWOP/zTIx4+lF
	GdwaFNokAYUY1QoMqD/82V2a4GnmiPEkLoayxHIDztlgbCX80ZWvBoV6g19IOvUawDs=
X-Gm-Gg: AR+sD10r566SCCwUv/PvyVZU7RHLMr9PDQoc2kXneg23A8TzRaiQJNxA9AUGalnxsbg
	82sVfL6jQOvq1GdsY9zP2zutfrh6t+eQbiA3oyLsG8D1Hwq6YFumGFf2EqS8iQRS1QkQPWRc3vp
	RGkMnENFCUlk3J9jCboQfkN6ueSSV6/s/hYGy5sVSeG4TC2/l+lLFWLI30r+76Hi8sEpGwxw53T
	hwQ7oI1B9k4fKJZBxvbURTUKNNMtnRWipyo+LF9dIKWwlWDcX+OcE4fGwzP8HG1/4xX1UBc9Qoh
	YZIn25JOYA5ml6vDWzRrgwa9GClZpHzQ99n0X+0MotgRx7tWuGYG1I7SbK+XxvxXvK5+xw1HpMX
	Im1HKoJRHytBRGkKj9KeAIGj8YFE35/DxINhjWsxxDkBRewu0sqL2Hbu1lIv7s+TE0LHxdCCmWt
	FGh5GNMV+g2WCW4XAE8imAgI9XHZGJJgCg16VB5uC3w+lve7udBBsIwKO1xXBpzEj55Gt7Tblq6
	IGlTrSZOHCuYeY7dA2I2uh60nbRarHoCNOSWGhr9iFHIeRFJ7XjD8aX+/NvqK1W7KLMcc1Aa9c=
X-Received: by 2002:a05:600c:314f:b0:499:4e47:eaf2 with SMTP id 5b1f17b1804b1-49b91c38bcfmr120834755e9.6.1787939112420;
        Fri, 28 Aug 2026 10:45:12 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f02b200023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f02:b200:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb2794dsm5480678f8f.25.2026.08.28.10.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 10:45:12 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: idryomov@gmail.com,
	amarkuze@redhat.com,
	xiubo.li@clyso.com,
	ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH v3 0/3] ceph: don't unregister an MDS session before removing its caps
Date: Fri, 28 Aug 2026 19:45:01 +0200
Message-ID: <20260828174504.1247038-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

handle_session() removed the session from mdsc->sessions[] at the very
top of `CEPH_SESSION_CLOSE` handling, before taking `s_mutex`.
Between session unregistration and remove_session_caps(), the MDS rank
has no registered session while the old session still owns all caps it
was granted.

Any concurrent filesystem operation may walk into that and the next
__do_request() call registers a new session for this rank.  Once it is
open and the MDS issues caps, ceph_fill_inode() calls
ceph_add_cap(), which looks caps up by rank, not
by session identity, finding old caps linked to the old session.

The list_move_tail() call then moves the cap object to the new
session, which is already a bad thing to do.  Since it doesn't
decrement `old_session->s_nr_caps`, this will quickly run into a BUG()
instead of crashing:

  kernel BUG at fs/ceph/mds_client.c:1959!
  Internal error: Oops - BUG: 00000000f2000800 [#1]  SMP
  [...]
  Workqueue: ceph-msgr ceph_con_workfn
  pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
  pc : remove_session_caps+0x2bc/0x2d8
  lr : remove_session_caps+0x74/0x2d8
  [...]
  Call trace:
   remove_session_caps+0x2bc/0x2d8 (P)
   mds_dispatch+0xf48/0x1b60
   ceph_con_process_message+0x74/0xa0
   ceph_con_v1_try_read+0x3a0/0x1510
   ceph_con_workfn+0x260/0x460
   process_one_work+0x168/0x3b8
   worker_thread+0x1bc/0x3a0
   kthread+0x118/0x1e0
   ret_from_fork+0x10/0x20

That's BUG_ON(session->s_nr_caps > 0).

I was able to reproduce this reliably by delaying the close and
starting I/O during the delay.

This patch keeps the session registered with
`CEPH_MDS_SESSION_CLOSED`.  New requests will be put on the
`s_waiting` list where they will be resumed on the new session.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
v1->v2: skip CLOSED sessions in check_new_map()
v2->v3: split session pinning and stale-map guards into two preparatory
    patches; rework CLOSED-session and export-target teardown handling

Max Kellermann (3):
  ceph/mds_client: pin sessions while checking a new MDS map
  ceph/mds_client: stop checking a stale MDS map after dropping mutex
  ceph: don't unregister an MDS session before removing its caps

 fs/ceph/caps.c       |   3 +
 fs/ceph/mds_client.c | 164 ++++++++++++++++++++++++++++++++++++++-----
 2 files changed, 150 insertions(+), 17 deletions(-)

-- 
2.47.3

