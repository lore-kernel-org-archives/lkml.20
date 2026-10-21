Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792548228;
	b=bAcXrJ9UhmlppsoKtlKMq42Xg7KVWZAS9pKzb8YNtURavAM3F7rjEOsOuzQe5mOefoR0
	 Zn4KiWYohZLR1LU3wKuf+K2wLaSNb4vw+rkXPBQ40vo/nRl/dx0+mKz+9RN5FNLSC6xx0
	 HAiOJfpzeZ9jYSujqPYQlKkq2KPeTjx7R0mpY9a3UYrjzSlUuYqyHG5gMEJSlodwgMOQ8
	 m6UpWtA3lrBgtwT1SlsvBvfu6DzYeVrwTSU+Whs9yqBzzZrsPgkugxZyVRITgzgrAzczX
	 G926PmqfrlQCQg51fbYit1jytOWbco8l3vwCC2VXvdoPxUBsZcUBhyD4q0lzEhiDUCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792548228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=MgBowOpMqpLnENBNIJoy7ySD+4JhgZXDOvFmbx2l+14=;
	b=VRVnyvzwH+olkJ37t53wGrxwX2mp/uepXKqsSemX1AuTQuPn/nu1s7G0eRE4B7Tf160u
	 9AhHhrxZAojTUNZwH+ulmIL+52NpCJFIBSrqVdOlpBinvtt1xAKOGthrGtOZbRe1D8COM
	 YW5Rmm1km8dFfNTrC1rTRwQPK0eL2Nu+RWqCVCkXJU3FmbXZWdLB13J6EtKMakv60LIVh
	 wriQbigPIQ4RKMk2qPuff60KLqIjuiUDJR9DVcuA5W9/xOlDQmKsVo6XhYXyc0bIGBAmk
	 ST5Ol9po3ePMvsm4XqT5sEAekQCfkiV63dZQysiNqtrNWRNBsB/96dgzb0tvyQgQRtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=szzpzZvR;
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08D8606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C08D8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=szzpzZvR
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8ab395abf79so2386027b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792548227; x=1793153027; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MgBowOpMqpLnENBNIJoy7ySD+4JhgZXDOvFmbx2l+14=;
        b=szzpzZvRcT2l2cVzaau+gwUjtSrRclGYP580iw39a/rIIPPUZ0oUKUV2HT0QH5dZNs
         /gIbnF1zHvPvt3Ltd2ddiXD53OxJmM3/s0zzf/PHrB63hrSH0JoATk58V552aWCbUEIA
         di7eU95ka7EWglyQE80IJxLONP9PWXzej67EAPG0gtNbBa0oBXVcV+vdGtmStCtmKeR2
         YvpzI4Xv6R7MY55aphHguLJ8/RUvywnTJSDi8MipU//2BVhM0C/4C65KN68UIcQBsVoJ
         kv9f5YzaSotd5GlgY56vgry1Ah2nw8uo8arYSq/GNxf+YXX1B5xu/Thi513DXh6jVcPu
         tFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792548227; x=1793153027;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MgBowOpMqpLnENBNIJoy7ySD+4JhgZXDOvFmbx2l+14=;
        b=KgoQg22a8HxS2+0347vOMwEOR8clKdQBuSh1usX91D9zcq7xEFMxsbHYYtfwgOm5zF
         kagOc7lEwsNxErce81969nv+c0zgOwAy47j5ugdvenVDLxbowyMNqnEMjZe0uz1O+G3+
         p/2M94sEWX6BURqdcOOLeTIouhB++wgXsgvyaKS0ZkK7SELjrt23xhk/CmyLqkV1gdJm
         tZ35VZbS+9uL/8CsNqcDlLPDtXvwD/byZLqMc2jX83ku1Sa+OTjnrDNCnnj+sRJSvTJd
         2ZmppddJRgxsCLwgNXywHnsLf8RhdCL91YOI+nZNbdNU+bkZx2llLjeRekaaHUnSbhaQ
         aAtQ==
X-Forwarded-Encrypted: i=1; AKwUvByVQq10PmZsjLINJKYhxhOoS79YA+JAXk5ICWu7ieaexpvDaApykD/xkOdT0ETxQalJTk6tZIbWsn2tCrs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLY7SZn+3BVefkaesuVy1DsUISQUmXBEUHR37pZ/iLlvfip/cjV
	7styHBF8hIXOLDgxk+BsvyhBCxKoBwAGHLfP4zDkCr4hTC2q6al7ROI+
X-Gm-Gg: AYBFou2x6h6IewALMqIQdJ89YwA1gs55lGCC3DEV6uZb9WbTY44VFGCXDSwyvO4mtFg
	qztNR8PT4JsCQIOQuRGjb2eCkRvtiqu2YLS7Rej5RIVsMim+JKdIbI5rm9yIgBlmooY/Lj0pJYI
	KSJefpq9WiGAk7+Z3DO0VzMs/M9DszgA7xq+LIG9r80gvb3vkiBy3EJCX4wG6wcdRboo57u8Lob
	AJZqhBJNRTMwvl2lFOnDt8g2wKLflpN8SNtEv6r/SkA4LKspu5ymCPitEO/SMhjq5vITUKTRXvI
	gpRcfaWOfI7T5VsreIOtiBU7B4aPqAB5Z4l0SYgShxB8ds/mf4KgIxonllsOZiSbN/SKoHTMR/A
	KtIp4sU6qu/yGUp4dXs/j+RV6Dx5M007PNquAI2DbrJmyAtAgUaupjWFvrDY4TdmlUlN0yAfB5u
	vMRLxmwz0IoOT1WkYTvgZMRecAktrHvWz9EVsWTFvs/ax/PTICVpSYG3H3tUCWvvkfA0aUa9/j9
	ZjJppbU0vLK4ChlI1xHrjhCMB7zIhk3McSL2zJkjpU+Z64c0z9vOwupR2Hy7XbIii6Tjwk+ghB+
	Tox1cJrw4BQQo3MVeLuWlzoEQuQfBjBoQ0uU
X-Received: by 2002:a05:690c:9988:b0:8af:5053:5c95 with SMTP id 00721157ae682-8b133e02bf5mr4022787b3.54.1792548226705;
        Tue, 20 Oct 2026 19:03:46 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b1300c85c9sm5641467b3.23.2026.10.20.19.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:03:44 -0700 (PDT)
Date: Tue, 20 Oct 2026 22:03:42 -0400
From: Matt Turner <mattst88@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Magnus Lindholm <linmag7@gmail.com>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] alpha: soft-fp tininess fix for v7.4
Message-ID: <zouc6nnptikib4cpv3sf5ip4gzdzesdth4wgnexnk54f7jmsp2@u6zay3q6pv3v>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

This is one alpha FP emulation fix, sent separately from Magnus's alpha
pull because it also touches include/math-emu/, which powerpc, sh and
sparc use as well. Magnus Cc'd the maintainers of those architectures on
the patch in September and I followed up in October, but no one has
replied, so there is no ack from outside alpha.

The change for them should be nil: the new _FP_TININESS_AFTER_ROUNDING
macro defaults to 0, and the new code in _FP_PACK_CANONICAL is guarded
by it, so the compiler drops it on the other architectures. Only alpha
sets it to 1.

The two other patches from the same series went in for v7.3.

Thread: https://lore.kernel.org/r/20260803-alpha-fp-exceptions-v1-0-c99d75608e60@gmail.com

The following changes since commit c03c1a14507dfaf8b856c2608f9ac216021fc222:

  Linux 7.3 (2026-10-18 13:14:58 -1000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha.git alpha-fixes-v7.4

for you to fetch changes up to b74843b38da8f1186fd7d447646c835b47096a15:

  alpha: determine tininess after rounding in the FP emulation (2026-10-20 21:38:52 -0400)

----------------------------------------------------------------
alpha: Fixes for v7.4

Make the FP emulation determine tininess after rounding, as the hardware
does.  soft-fp always determined it before rounding, so an operation that
trapped for software completion could report an underflow the same
operation would not report when it did not trap.  glibc's math testsuite
catches the disagreement.

This adds _FP_TININESS_AFTER_ROUNDING to the shared soft-fp code in
include/math-emu/, as glibc's copy already has, and sets it only for
alpha.  It defaults to zero, so powerpc, sh and sparc are unchanged.

This is the last patch of a three-patch series; the first two were
merged for v7.3.

----------------------------------------------------------------
Matt Turner (1):
      alpha: determine tininess after rounding in the FP emulation

 arch/alpha/include/asm/sfp-machine.h |  4 ++++
 include/math-emu/op-common.h         | 23 +++++++++++++++++++++--
 include/math-emu/soft-fp.h           |  8 ++++++++
 3 files changed, 33 insertions(+), 2 deletions(-)
