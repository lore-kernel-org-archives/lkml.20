Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103219;
	b=frV303+szxi9kK73JC1L8ciXnV1UwzSvtenhVcCzYRdOksOq5HwYTPl+cVIc9ZikOSBW
	 i0yKoy3HZMVtFCdSc4izlWT7Q9gL+JQKJnQdeHvTxtiGb43EyDn/MN/cMaG+t+t1ouYZP
	 XBe8Susi5uPNWgZwrXvGAYrWnmpq66SY7FPeyBtw4OSy1BdjDiB5vI2v99iFzMOk3Yn2d
	 93MBitJpgB/IXWUt1IylXi0SuSaKbRgmrbYkjDpqr7ITwsTmbgW/EWqA5EqHgld92gZDQ
	 1C2rEj8wE9JAmuySifs2n++hQTiPhsbyRiYmjkSUqUoWaEdoYn1tyCxgQXw1EG8iI3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103219;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=8L6AijwD1kXrBelg4PmoHNd6X0P3sJl4dvEdB5ZF1LM=;
	b=ZQJOikMTvzmDXUdtTCHuDwQFp3Wl+Hl8J9zAsNbBjSt0Q32wJJQgxHRC9jEoywo/grMT
	 0KTPXXfRYRgVuNYJR/moWYhgvUwUt4OE5HTQC+HAkAkD/IMW3shr52ThOuBYFmttTHNrE
	 ZeqLNKNXxJamlJTJl9T33h+w6Pn3br3SW9CGO/eRh718661Mmy6gJdRo+uAEM8fp2Wkxs
	 GjxuJlpBGe1BqYul+Jx4qlWm4E06MroLzH8PM56dFbdWupzMXG9m7X+3lh12rcBgEB4zX
	 gXhnq81jn3DaTWcqjTclUVnFNjj13nnmx+zMMsYDbWus3ehocpglhGoMTNXz/0GWMew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=KwZ5IHJL;
	arc=none smtp.remote-ip=162.62.57.64
Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D339060A2609;
	Tue, 27 Oct 2026 12:13:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D339060A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=KwZ5IHJL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793103212; bh=8L6AijwD1kXrBelg4PmoHNd6X0P3sJl4dvEdB5ZF1LM=;
	h=From:To:Cc:Subject:Date;
	b=KwZ5IHJLPfcttnI0o55svwYVJkZIHsd8LQAMGAqvn+0Xa3wUr69EcSGi0T2g+6v1y
	 ytCfjSjC5yHN5mpun1t5d/2m07y1xgrm7MchjCE1rNi006RKq7XdBDUKbLRAMJE/93
	 YHF09h4/Vv/fVXFFeeEeaWHIzoK5NK73AgP7HsMs=
Received: from kernel-lab.tail5e91bb.ts.net ([2409:8950:57d:63:2e7f:4b13:c1e3:e391])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 35D23E21; Tue, 27 Oct 2026 20:13:29 +0800
X-QQ-mid: xmsmtpt1793103209tx283cz3o
Message-ID: <tencent_3DEBF2FC84E9BFE7733228DEEAC31383A805@qq.com>
X-QQ-XMAILINFO: MrK54zaStYC/ZjACrlrxL+/8DoggdIeedUooH/w6x8b7wD1xUgjgjhMIYNjG/M
	 pglJ2ltlBo+EkjilQ6obgNFWlNgeg7C7pok22LXAFoP7cj/WLYSIVOBBiWO1ZWcZqBL0LrRRZ9+X
	 mF0aPE1bcO0st2cC2UvACncHpR0KP6iKD/uy4fo5aR8WmOBF5PBf7wai7f96IypdVNb3lkfNt4HG
	 VEXqQ4r1Zx5wbUsEG/zIvegnjyxmerGyI1WzwcE0KfD35eZfw0AP2ggn29dDwMtsd6eMgBdPWvoy
	 8hbw8kANaLAvS64pNe0NXOkuBlqDMYy3+9wErpssPlb0ppeTJ56be829H2csadyqe698dz5yhwEN
	 z/wlN1urs1LiEfPfx+fxe3lm+LRPJg4ridDLvzoYOiNAvs9UmrZz9iCkwow0xPzyDecI4FRpgY0M
	 /k7RSpEfSg05FhuhR6x5gS0KRN7aPPX5LRArIO1te9ajSaSnEqguq7zf059nQoQb/ksSzg+qp2Mh
	 cv5RGElDFICdO3S/cqdPUQgnCgM1kvxzK220c1zkTzWfxLRFP2N3eAlCdOFrspCRJAldXKnO9djH
	 9e2UerkHHdTIvmTl7j1H3R7E2YSGzwdysSItr6/et/gvSl/+F33l5g6oxY+xKsjoSVbem9Akv2Oi
	 MJyr+cTFGZ+JtmePtnMPAthRJWWcJHnFHn11BJZHq7oTpTItNibr3DHboxilzpf2CHjPew+cpJiE
	 bjix+CvmQB9hKqEQ4amHV5bazZ7rcMkHDpNOdGQaiH61zU0KB8E819LO7ANA1kT33VxRg/17P5m5
	 V8lFwj+umzx1QtEwevdRjwHKDzrBxwaK8+UtmcLASu5IDo4zexpbGl5onX/bHJb967vvlzADIadF
	 cby4JBnbS8olgZgxNic/r4sabIH6K4Yp1laqvOEigWfjcE/OHly7VibgUnQTdHL/86n4O2TvXBGv
	 fWvFhkKjxLG1ms3ohzXhYzxqtSz1Capnt1zS1Il0HExdDvbtU2paWrQBsa7uZRAsu/+DLERbGmP3
	 qbk+cIxvyXJ+u3lq6FjzAMPyEPeMOPxKbu9ZfH4z8ijnS6Si+fQiCOrlU37VIvXUh54CCfMAGn1p
	 LfgVwlgbwtNI6VCl9P+Ax6zd60lg==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Yingjie Wang <1075151112@qq.com>
To: linux-nvme@lists.infradead.org
Cc: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	kch@nvidia.com,
	hare@suse.de,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] nvme-tcp: validate TLS handshake timeout parameters
Date: Tue, 27 Oct 2026 20:13:27 +0800
X-OQ-MSGID: <cover.1793103202.git.1075151112@qq.com>
X-Mailer: git-send-email 2.43.0
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

The NVMe/TCP host and target expose writable tls_handshake_timeout
parameters as signed integers. Both paths multiply the value by
MSEC_PER_SEC and HZ before converting the results to unsigned timeout
types. Large positive and negative values can therefore give the
handshake agent and the kernel different, unintended timeouts.

On an HZ=1000 kernel, setting the parameter to 2147484 overflows both
multiplications. On the target, an accepted pending request can queue the
timeout work on the next timer-wheel advance while the handshake agent
was given about 24.9 days. On the host, schedule_timeout() can report a
wrong timeout value with a stack dump and fail the handshake immediately.

Make each parameter unsigned and reject values that do not fit both the
handshake agent's millisecond field and a safe jiffies delay. Read the
parameter once per handshake so the two timeout mechanisms use the same
value. Also keep the host completion-wait result in a long: a successful
wait can return more than INT_MAX remaining jiffies for an accepted
timeout.

The exact series was built as a complete x86-64 kernel. Both changed
objects also built with W=1 for x86-64 and i386, and the i386 objects had
no 64-bit division helper dependency.

On an x86-64 HZ=1000 KASAN/UBSAN QEMU guest, both parameters rejected -1
and 4294968 without changing the current value, accepted 0, 4294967 and
the former overflow trigger, and exercised the target listener and host
/dev/nvme-fabrics paths without a kernel diagnostic. The expected
handshake failure was -ESRCH because tlshd was deliberately not running.

A focused in-kernel completion test used an already completed completion
and a 2147484-second timeout. The wait returned 2147484000 remaining
jiffies, greater than INT_MAX, and the v2 result mapping returned success.

Changes since v1:
- keep the host completion-wait result in a long;
- document the accepted range of both kernel parameters;
- add focused validation of the large positive completion result.

v1: https://lists.infradead.org/pipermail/linux-nvme/2026-October/066911.html

Yingjie Wang (2):
  nvmet-tcp: validate the TLS handshake timeout
  nvme-tcp: validate the TLS handshake timeout

 .../admin-guide/kernel-parameters.txt         | 10 ++++++
 drivers/nvme/host/tcp.c                       | 34 ++++++++++++++-----
 drivers/nvme/target/tcp.c                     | 26 +++++++++++---
 3 files changed, 58 insertions(+), 12 deletions(-)


base-commit: aaedcff9014876387504a8b92d227766cb95015c
-- 
2.43.0

