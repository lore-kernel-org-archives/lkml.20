Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793038785;
	b=Frg/CSMBQPdhN4ID59FWgqHVNRBL6E97AS+cdUcNFm+lwap0eW/gXVnR/CaE/Zybyphs
	 VnOSLuuJUhb4CqqrYieb/NEiZwjaApAB9+BxDRB/sEe1ZJ361335yfdtadWj0bvjMyQ1t
	 bLs248l34Kv3NwdF/7vQM+DLXuHpnAXASSMZADBqU/8Gp4/9I0Js3NfNgkZSt960Y7qXt
	 8+6rzHDvPP+UmEHBhRh9uyE26FwGCN+HPRsr74fQATj+0AH8ne8PhkbK6t0dNO20maw8q
	 CK7VGK5nIMDNAhsjvfMbNskIBh/9H7rrnsiMdEhkG61Ig3C2Kq+oRt9LF5uF9oaU+qw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793038785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:MIME-Version:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=ArunF3JyHzPDJjIHJyEibRPONwhw56eILbBtpNH+onw=;
	b=lWWOK/Lyh/tSYbEcXLavYQ0G/duikW9MAFEJ6IlkdtMOFKZvTbl0zV8U2HKJ5VUwRVvJ
	 j9spOfjr6ypt/LGM3qvkNqYH8xOp+Ia57TXITEVo3sghFJo1ICWqZ5a23vcKGLMcIXP0G
	 dQinG1XkKBaO4/CQD98sa7YCwxi/0rtTMddeMV64URkNp829C+U4TQ7pLtebPOID5TvjX
	 0O0RNP/76xAc90PxoyfmGh803BTpZRXsHLCQ7s4Qs1x8om1uwfIc7YXwQ5Eto6U1XiY7G
	 3CEoe24MFXaba+UqELlWWCqSzyUzhlTmcFO7GlafsXwFKmZ7t3jxuUDE4BsRyu3zr8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YGjzFdL+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51421606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:19:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51421606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YGjzFdL+
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6af9a9451daso5032431a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:19:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793038779; cv=none;
        d=google.com; s=arc-20260327;
        b=Ttm9YHR0yYRCrLh79cbNIiF4eFOcMHyrNWwKLM9J3QSefY0Jb8kCFK1ehQfcs7I3Av
         IevCNFduONd3ISRwVAOCRue1O89A2+xw8LdJGprW5m1Kex8KMmBHsBWv+ES5oo5IFnNq
         vJQMjwNQkWJi1Y37p1n87yjOy1O5EvKn5tXpDR3s/Z3+CFmfIFRaMQRtrEvfXsW9axFC
         I4SlCXQ5zkjCwiv+RsoFW6zc6O0J7ZFXTMRYmn452wGaEktQUHyRhbSzMk38O4UE6zec
         FKSTHU5ZRrBMX6oJclrS7RW7H3vxIXb9NOE22kpr0YIZm3tZTwCuyh9gVslH8hxigwPG
         7cnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=ArunF3JyHzPDJjIHJyEibRPONwhw56eILbBtpNH+onw=;
        fh=v22ZDahUTJKF99BgZWqT9dfvIqROqhOOE4dD7/FfeUY=;
        b=rxO324w+lldCtTL8Y0FMIFqgLvVrVvSSIMXSRu5cbZMd8YKbgV/xp4NW5g1vvtmMkI
         koErSwlkGayZGh+7nJ/Q3QS7YwWoKkTD3l/4mFewhV8s5xdDwonZqrrcaiOBEJFHaoP7
         92HdOlAVZOG3tHYmIIUH/7LZrsqaGnpSS21WSNBrGOChdsE0Q8SMsIiT9Qd+ODKc0NJb
         MFpH2NsjGMtf4d5qarXfq+ZF3NNH8dqWEgqVAW5/iGqmVwwhP64G2Yw8nDpnqTTGM4N6
         tzwMY7pBu65LizjJw/QVc1vsbsEWQoG3pDdw9wMNdoSW6HwkcpgNgJjXY2A+wpG32/ts
         Iarg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793038779; x=1793643579; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ArunF3JyHzPDJjIHJyEibRPONwhw56eILbBtpNH+onw=;
        b=YGjzFdL+jOpAqPYLKQLXeowDdiBFXp9xGOEftbffQ/DcSmk0zUxfGxF3o5ybWmoagY
         BheMMIiwKYmjHf/yBW51rXPN+MfqwjhZnRahC9oSJyUtP2dK6t+Pl4CZPCcwLnhgVxgs
         l5AMBUWqhpuZHnxt/YBxWKxMu+vBzz6+8LFyETrnvXZs2BHT9Re+QBsdLITP3lQWkJGh
         XCNqxOQOlxZASsZmn5fGvvLpYcP/y49GXIX233Vz63YbY3Uy1gWkU7xgRZUcOLl5UbJJ
         KAjD3anj6GrHleTFwHwIPUlKooN7xu6APIBOnXZKpA3dowFn1jYA3rWN4Eq3SPUR/6c1
         O/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793038779; x=1793643579;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ArunF3JyHzPDJjIHJyEibRPONwhw56eILbBtpNH+onw=;
        b=vChq6fgwoMT7Txp26moXh/tN0bm/7VQUcc5PLw7dqqtEYc1DDb27uDI0KUNm+BZMEm
         aipQwk6TtTKlKTt90nNQ7qBFw3S4vT4EJiYz0aPYWffxrX/iqNl+kwJ5AZYvElJrBWRw
         xnUTz70gqfrcHFTXSST5rKZefKbqKCk2+hpJMxTrbke4BSnu8sJ2IXKpTPaNrFs8OjEB
         FOmHcbceV0LGaTdlTBQVIA+lUwCzwOVnG9Nz/6rJHrBXQ5AH3AapL7ku2JII6vgotUlX
         2S+jC5pcD0g+EMBiRBegl6zNJsYI6/HRQ/DxrvgvzBjrjiHzrEdHj0HTqKRebcn+0Mkx
         Cr/g==
X-Forwarded-Encrypted: i=1; AKwUvBxUG6u7nklpBErqgnytTMOCJag0uNsUr1rbm6lnsOtL3xOrPRrqS95ZWD0g42IykJIW/EiKwlGOVzno9Ow=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6iHe6qO06vpc014kdf6hRIc9emhaJG1yC3u5Az26qdsxDJV6p
	+nyUAcOh0etCPlR8IIABSwSkNw4zxt2pmuan7+IIqXJtzgzmGQbV+boEHDkCXHKQ+ff8mvdyrSa
	nEgg0OutdB9L5L7sKEQWfYB1b8Hdt3eTo0y8n
X-Gm-Gg: AYBFou2g44CcqB5mqzEKpNRYXWud5WtLkrkYCev5WNbmV6+T+lpoQmNRFfb0tXPlyNf
	p8ootAen2JP7Pu7Fci2yrctVuli06oo99BgHdycfcJ3UUJugc6FUEOtbQbZOEuTk73CUBRoTfwu
	e0WNpVM+hZ7hIAJ4JQVSLu/1FjVa3nJSAW+e8759uZYbE0V1leHSLosaQLdXuHK7kpUIe3030Te
	WpdophyVO9oAMkuDRInSsLzpTvao/ZFjP4sdO7YRiHPO0iu4EKTsT64xCC+Th6UGwLJ8KMIkbK7
	dfNed8q8Lq7rAA/sAwNZ5GzEHIoH36WmtGUQBQM2KO+d6wzY0JaHbq4VCxyhlxE47CBrDbiIDrt
	jFBQnarKaQvSF9O9tMeWeHPhG/pcCd6RvOw==
X-Received: by 2002:a05:6402:404:b0:6b1:b5b8:b696 with SMTP id
 4fb4d7f45d1cf-6b442fe421amr6628563a12.23.1793038778619; Mon, 26 Oct 2026
 11:19:38 -0700 (PDT)
Received: from 511566560828 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Oct 2026 11:19:38 -0700
Received: from 511566560828 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Oct 2026 11:19:38 -0700
From: Ivan <ivan.vin.ctf@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Mon, 26 Oct 2026 11:19:38 -0700
X-Gm-Features: AclHuK8-VKJdch5JGSdLR7HiZAxRhyNLKRo4wOVMpFlALXVFs8xNG5yVrpTkgZA
Message-ID: <CA+hZKYK7M9EB2HmVTQtccuztYeSSrygnN_20g07e7C+mQPRMnA@mail.gmail.com>
Subject: Re: task hung in xlog_grant_head_check - still reproducible on
 7.2-rc7 (2018 report went dormant) - and on 5.15.216-stable, with a cascading
 inodegc victim profile
To: linux-xfs@vger.kernel.org
Cc: djwong@kernel.org, yangguikun@tju.edu.cn, syzkaller@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Picking up Yang Guikun's August report [1] with independent evidence from
our fuzzing fleet -- we agree with the analysis and would like to help get
this unstuck, because the history of this bug now looks like the pre-history
of CVE-2026-109618 (PHP2Shell): a known issue sitting on hard trade-offs
until it becomes an emergency.

INDEPENDENT CONFIRMATION (5.15.216, KASAN, syzkaller):

Our focused XFS campaign reproduces the same hang with a different image
generation and an extra victim profile:

  1. syz_mount_image$xfs -- crafted V4 image (small log)
  2. one setxattr(...) with a large value

  -> xfs_attr_set -> xfs_trans_alloc_inode -> xfs_log_reserve
     -> xlog_grant_head_check -> xlog_grant_head_wait (xfs_log.c:256)

Unlike the August report (V5 image, single victim), our logs show a CASCADE:
the first task wedged is the xfs-inodegc kworker in xfs_inactive_truncate
(D-state >122s), after which user tasks pile up in xfs_trans_alloc behind
the grant wait. All victims are unkillable. So the blast radius is the
whole filesystem, not one unlucky task.

Same root cause as described in [1]: a transaction reservation larger than
the usable log size can never be granted, so xlog_grant_head_wait() is an
unbounded wait -- no amount of log tail pushing can satisfy it.

THE RECORD (why we are pushing now):

- syzbot's main tracker: first report 2018-05-21, open 3079 days,
  1471 crashes, 0 of 29 patches merged, last crash within the last day.
- Sister trackers all open with C repros: linux-4.14 (2450 days),
  linux-4.19 (1412 days), linux-5.15 (1311 days), linux-6.1 (1302 days,
  394 crashes), linux-6.6 (Dec 2025, corrupt-fs images).
- August's report included a concrete, low-risk fix direction (sanity-check
  the reservation against usable log size -> clean -ENOSPC instead of an
  unkillable hang). Neighbor fixes over the years (integer overflow in
  xlog_grant_head_check, the nowait case, ioend log exhaustion) never
closed the unbounded-wait itself.

WHAT WE ARE ASKING FOR:

1. Either accept a reservation-size sanity check (we are happy to test
   patches against our fleet and provide before/after traces), or
2. record an explicit decision (even "won't fix, requires crafted image")
   so that the dormancy becomes a documented choice rather than silence.

We would rather spend our cycles testing your patch than re-reporting this
for the 30th time in 2028.

OFFER:
- Full syzkaller reproducer package (image + prog + C + logs) from both
  campaigns; can also provide a hand-minimized C repro on request.
- Bisect/testing assistance on 5.15-stable and mainline.

[1] https://lists.openwall.net/linux-kernel/2026/08/24/265
    ("task hung in xlog_grant_head_check - still reproducible on 7.2-rc7")

Reported-by: Ivan Vinichuk <ivan.vin.ctf@gmail.com>
