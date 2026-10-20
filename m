Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792509876;
	b=jKSGK5nV/zXkO1CafQ1N8czfUtioqoP4mOFBFXFzyEU9TQQLOwvgrLrJz13NF52GnREe
	 YrsCU8JHTQfuIMGCGuhphAr7dbqDNIVqIfmX5eUKwiMXLmz38wM6RD7hDhqxhKL6OW8zV
	 Z2tIcI5EFt/Mj/rEIctzxtbx+f14MhyHY4W1Mmt2fbcx62ZOtZ8E+JtKXytOiu7QstkIg
	 u2m00IzPvlMqYfQ3zeYdC5c+x7JPtbxW1b/Ug1hCbuCG6EGMAykxHhSFHgQaf9h2YMiPj
	 TLqPMI2QGgm9YGlUED25BOQ2Nz7ttL+UtZ5YT2m4dxur5s+zT5ROjeHe0WGiVzD7mqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792509876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Yo7lFEBSYN02LBZv7O1t6La9fyqMBtHX6dJoSLmRutM=;
	b=W8CUmCg5jA2y4MILVHLa6EoIW5sMXHJr4Txm5kFBsi6eB5/hU/wZJzBn/sQsuZctT6u5
	 f2j+INg3Pmoq6+UwgimiXWYmvppBBpBrUwVxOoGDJkEqsZVWiW41j1tvwWfJo8EyFD99C
	 pDX5eEz0Hjz6iA/CeHVu6SnmPE8TVl/Bn8RldRQlbP+ErgVelm4OcVTBpaQ0AwNY4TxRQ
	 7OeEI2sAGHML/Dk6glxqWlDPvlNUwuFzdpd2Bg9S2E5QHgAtqbk8MoOVWuDGVsahr39k2
	 GayjW1jWw/+hVlZ5nnQZVzoKm88PEhUK+KexWdVJTtWA9Q3re9wDRJB5xcX0G1LDDSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VMGpowgT;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05999606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05999606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VMGpowgT
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2afa22e1dcso504153866b.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792509874; x=1793114674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yo7lFEBSYN02LBZv7O1t6La9fyqMBtHX6dJoSLmRutM=;
        b=VMGpowgTivqWykR+z+tts82RoCt0Akfn8flpv2XxtrBtP26GbPmJCZWmVTx8WbEFi+
         fioWB3I4YB+s3XApsYejzO4LJkwOyzOrLnaVLkTP3YPFHtaWEXo78twbytbLdwNsEM7D
         /x6r8bREvJmScJvoImna/VWFOA/LuVKhmJ7IfdeCw1ijNu6UaEYdC7yk+9nL/mL5Rz+5
         b26BR/j/icX2nurs1k/9nNU+7K89piSbe4xm3GOzBEzELxZJy0d8vadZTryCrnp78d7E
         N+hF4dGzbdlGX5K16Gy4iwcHnrlSUr8VO3QsSA8flZ0VR8s6OWH6iHj+xY4D85x8z5vz
         lFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792509874; x=1793114674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yo7lFEBSYN02LBZv7O1t6La9fyqMBtHX6dJoSLmRutM=;
        b=dijmDQ19ipTs8eJlOchjogIeJjqMFG5Zx1jAPN7M95LekPxZip9mJyQ+eP2kM7aYfD
         V0yzJEsywrB9Tqjg2q3p3bpLwXJ6xZzBsYLYpMxaV4q9Yl+3eC1EBFVFRQUSFh0sny4I
         oKxXrG4uB7NHBYtlctb0UPo7K9zpKPgUhXoyoVC7cpAYyr9pAsZZ8stbLH4B/I/qieuZ
         5YUhxyiOj8qHHEF+ZiKpjuTzwx2ThOI1OrmkLlOI/gpfgmE/TMB4+5+GCmjDnstDgLTl
         dybdTNFPLFVfMraGq7Zl7IC/ra9VgDjasORpDvaTs94t5Qg44YK2746FoquLofIwYEtw
         A7eQ==
X-Forwarded-Encrypted: i=1; AKwUvByO67/CS0HomVIgu+2b7LbpWaRDLpmRy6q994jbChvL/nAn9x5rYZEsdBXdguaWUjQ/kCeH6TRE7+YUD7o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5Y8iQacuzM48cuoDyqBiZQNadWBv5ImWADjClJReOBJEKgGnk
	7xb1l2zPeHX06a8vY19EgHthW25htDfw3Zw+QQAk/J7oDou+MDR0KR7q
X-Gm-Gg: AYBFou27SDBc4lgzJUhiweeycAeMKqPW7GKPhIXtlnQIwPhbx1uDiXytSV84BAw74X/
	/tORBNy8z+OgZTBCHsMH/HyF9RWAW2Ca488s3sjyDK8CRFdb+TZzlXxuVHFs925FhxZ+m0DargO
	jdS+p2vuTuGGgWKVzCKNK1ysrFKwPyF98FiUetp0t4drAel6qlBPqCA968Th4z2F+q0sXUZNHkj
	qWlqXfv54bTOLmjAUiiNJOpG+XBpyQG+MIKRvItZcmhHlB34XK6eZCJK5Ue52MlJAutzmA9VNay
	KLDL/DqcdG2thePFMFw/iwSgLQSR/jx+jmf6lNbUB+PbElzkAweqDpj5JCpfPpJuI1PZ/+iVaMC
	xBmbZmF60zdqqz7XWVqSSy9bkubdrGcy6y57aobg7ZG6+lZ73REDsUUHx3nKk4UXufZ6U93WyM8
	QIq/Pqf+4l/wzebmvL0HP3jh7X8NviYhu2eX5krcEERueriVpZB05Z7p6HgO+Gnu9QmGTelCkN7
	Luh7nEFHbSxAqRI9fDD3T3kmG3mKan0Ml4bxlq/N2IcJqO034WJ11fa4ChjDmLPx1sH6dqHZvFB
	1Qi5J2Ez0952qey+lszKTTc3Mx4xoWI3
X-Received: by 2002:a17:907:d385:b0:c40:b59:1b with SMTP id a640c23a62f3a-c419fefec7bmr807389166b.44.1792509874132;
        Tue, 20 Oct 2026 08:24:34 -0700 (PDT)
Received: from Martyna-s-A34.localdomain (ip-80-113-116-3.ip.prioritytelecom.net. [80.113.116.3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919bcfc5sm488110466b.59.2026.10.20.08.24.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 20 Oct 2026 08:24:33 -0700 (PDT)
From: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Mehmet Fide <mehmet.fide@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michail Andreas Michalopoulos <mike.michalo@gmail.com>
Subject: [PATCH 0/2] wifi: ath9k: fix WMI command response handling
Date: Tue, 20 Oct 2026 17:24:10 +0200
Message-ID: <20261020152412.95560-1-mike.michalo@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Both patches fix the ath9k_htc WMI command response path.

Patch 1 stops ath9k_wmi_rsp_callback() from copying bytes the device
did not send. It replaces the -EMSGSIZE approach that was reverted in
commit 90201351a862: short and empty responses still complete, and the
rest of the caller's buffer is zeroed.

Patch 2 stops responses from being accepted while no command is pending
(after completion, after a failed send, or with sequence number 0),
which could make a duplicate response write into the stack frame of a
caller that has already returned.

Testing: temporary KUnit tests (not included) drive the real
ath9k_wmi_ctrl_rx() and ath9k_wmi_cmd() against a fake HTC device in
x86_64 QEMU under KASAN, KMSAN, UBSAN and lockdep: short and empty
responses for all payload/buffer length combinations, duplicate and
late responses, failed sends, sequence number wrap, and a concurrent
stress test. Without the patches stale bytes reach the caller and KASAN
reports slab-use-after-free writes in ath9k_wmi_ctrl_rx(); with them the
tests pass with no reports. Builds cleanly with W=1 (GCC and Clang) and
sparse.

I don't have access to an ath9k_htc device, so this was not tested on
hardware. Mehmet, if you could give it a try on your AR9271 that would
be much appreciated.

The series applies on top of v7.3, which contains the revert; ath.git
does not have the revert yet.

Michail Andreas Michalopoulos (2):
  wifi: ath9k: don't read past short WMI command responses
  wifi: ath9k: drop WMI command responses when no command is pending

 drivers/net/wireless/ath/ath9k/wmi.c | 47 +++++++++++++++++++++++-----
 1 file changed, 40 insertions(+), 7 deletions(-)

-- 
2.43.0

