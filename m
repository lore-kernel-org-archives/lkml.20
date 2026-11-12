Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474912;
	b=aXba1PGPy0K2eUIVB6PvVPU+w8AGh0OvZRrtM3bZDpxb296JSaMqe4B7wHCyMwk4kIC/
	 auCN6oOOISAFKDAKv8YhfxTZFwgdcwMNyqqMEY23RMsLTVxXNJhryhS/R3p/2o8lE9AK4
	 L1M6HFJHJlvmGhw2CFNqd/VCQ0Q0VMy/2hz32fnsPhqldshdDCyHcUQVakpteF6e91ubu
	 kFpWt2kX1ND6BpoVgL7yh0HTo8tsJIBjZc9THdPltRvzdfdX2AbRX+iEuTV6+zaezsyGG
	 A5sSZc5Ix0Pmk0PCdTa3Z9C58zlWHD+eTwAAsXoJrXDR7z9wyRtZiHTMhRBNmmcbg7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GsxQU7PCIOfVFnHVCuEFA8lZ75gTP1s3K7X0uR8/ZKs=;
	b=c1N5/JLptgNVrk67mWxK1KD2oW/0HtKHPlhPdjGMJJBSQLI4RuvenjebipUTezTB+9nR
	 isTlnBnSdgHfnFiyGUk/0aJ6BVr0cnb3GC1c/9FgjrMJ4KCO6nzYmFMMOuRjKhabqcJD5
	 Xxf4DE65fq12Of7HylbMi3mUu3e0IuJDSpyZUYMqFGmcpIa4rXoaGmT13RbeoDPCkyCHQ
	 2Sh/uPab/1hRTTFSaft6ulAfoMh7mGOlnd7Ek3C9uso41l6WhmnP00/5cCOtoZmbQ4DEr
	 oaLeIiwwfzLXzTSFvzZcCRxDSGGmYtkY9SkdakPQfCUSTAs66/T87wc1ea1hzialLuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ok8nSORB;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EF8606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7EF8606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ok8nSORB
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so7407261eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794474911; x=1795079711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GsxQU7PCIOfVFnHVCuEFA8lZ75gTP1s3K7X0uR8/ZKs=;
        b=ok8nSORBKrT1BcKGw2b5VQkCgjetLaWPtoTx2ZcMID4k6GbYbbqMm+sbb5WByp/mqb
         BPRjbv5vaFBwW2u5IQh71Nmt3/9GoWLb7yMhHLVwVGOj5BvTR0M4CoK2daub1vERJCE9
         Er+g5HJ028l6yoc1pFkpaTu6+zwsvyUoXZ+VAf5pUu3fMSTHKCoNBsRhbw7HX5wPpSSd
         YezEVKYY7wXOJC8kac08HlIIrdgp/nM1cB1rUJngGaxmsQ88n2axlN7p4/+Wu9swielx
         usuXHrot8mo+oI0hX/v8t8nH5j20M+kIAM4DhNx2QEh7hM2iCco7Jytq4m3qTj5s3898
         hrtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794474911; x=1795079711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GsxQU7PCIOfVFnHVCuEFA8lZ75gTP1s3K7X0uR8/ZKs=;
        b=xAXFKKdf6XXkBsrjM1UsJ7MYpUb3TkV80n9g74XL5ipqAHDbeK1roz5DSzDrElZYYb
         c6DJ1W0pArCtEaTRpdB5I6oKORhbcyhQOFBW3g9dg6bQ969NowOprvsCs+GEaQrk0PkK
         zo5WwFlSgf7FEDGYsvvuHVvWX94s8PyCp/h7+Moa1VJKY6uoeAUtX+L+Mg1b4TE8nvPu
         tbxWYqMhDxon2vtTPcZAbK9bKbA9wwj2QKK4r3b3wYenhkIaBbKTGE/BFmgz0Q8DLqX1
         jBM7dM8piKaldT/t2mZV997f4fhYyYza6qhyjn/UGUolTrXIcYoHA+yMv4RORaUxqu2I
         Ha5w==
X-Forwarded-Encrypted: i=1; AL+hErGBAo3Dss4n5dloPK7+h1CPSsQ3K+AZGBvznXM+A3YkG/uDaCI3S7XfF0cAJB6SQu0L/36VLebb1BqnMXc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/OplN/MZgMJYG7uzuV0epfWRlPo3iQaX1lezRncWa07AJv+Wi
	xL2CqRz1URLWbayAQAT9Cdcz7KZveaZ7e7u0yj0FQMjO0dUQM412YxbH
X-Gm-Gg: AYBFou1QRWhlz9ZsjvZcW0ET7b8vAD46QX8/FJz2NP54zxpgoDtJueB5uii9lYyuuci
	6/CER/dTWrIRwPsAR2e37ad4vOrMyA0RnGMRN/n48o0e/wNymzgokFf0dZbghqVsaXgYlPXbMi3
	hPkDyoDKTRgJaCQ4JfyuxHwOeme+V0kmFMpvPq50bEly66SwY+vQ1TiJ/s40J/AWIAiQaYwrfln
	DOT25bhlUXFEhSu2fSO3ryNrYAeSJwNoMVaIlrq28i4NzyaE5iVysnrtex/pNd+lwrt7/mszyGL
	slOmRyELiMynj5sB1Ll07rojBb1hDLsAHb9Gw4CkqiB/4cn0kPz4hGaBznpIGkE+NJiw9dO5q/S
	Kzfs/mFK+iOSiSmNo0rTz35THWBoxVtQ1/x1Esf7Los1gaVfy4r0Pxnl2EEM8MvaW28603KkzKO
	5iybF1IaHsA/sDDL4ap2lpimJWCMVJwWi/Wqu1HGo8QCN7IsoaJsnE5UKWckyxFENPyT2+slnHz
	UzLzuEGTEtwVE9RnHa1vZnQRVgWwqTDbuRdMs2QgB7g4kBn1vRG+98uV8ZryDgqn9PGFUOlNicx
	EjzgFSSkYAp86K4nwiavcIwkJt3Wdas3PErRn52Db6/H
X-Received: by 2002:a05:7300:547:b0:376:a6d7:8f51 with SMTP id 5a478bee46e88-376a6d79070mr7136789eec.12.1794474910716;
        Thu, 12 Nov 2026 01:15:10 -0800 (PST)
Received: from localhost.localdomain ([2406:7400:51:27a4:c2b6:f9ff:fe77:10a0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e7d24sm40096319eec.22.2026.11.12.01.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 01:15:10 -0800 (PST)
From: Amaan Cheval <amaan.cheval@gmail.com>
To: netdev@vger.kernel.org
Cc: joshwash@google.com,
	hramamurthy@google.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	bcf@google.com,
	jordanrhee@google.com,
	przemyslaw.kitszel@intel.com,
	maciej.fijalkowski@intel.com,
	pkaligineedi@google.com,
	maolson@google.com,
	csully@google.com,
	willemb@google.com,
	yangchun@google.com,
	npl@google.com,
	awogbemila@google.com,
	shailend@google.com,
	nktgrg@google.com,
	maxyuan@google.com,
	bpf@vger.kernel.org,
	john.fastabend@gmail.com,
	hawk@kernel.org,
	sdf@fomichev.me,
	daniel@iogearbox.net,
	ast@kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Amaan Cheval <amaan.cheval@gmail.com>
Subject: [PATCH net v6 0/2] gve: fix RX page refcount overflow with the pagecnt bias
Date: Thu, 12 Nov 2026 14:44:49 +0530
Message-ID: <20261112091451.22969-1-amaan.cheval@gmail.com>
X-Mailer: git-send-email 2.49.0
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

gve's GQI and DQO-QPL RX paths bias every RX page's refcount to INT_MAX,
so a single get_page() from the stack, e.g. splice() of received data,
overflows it: splice/tee fail with EIO/EFAULT and GQI can reset the
NIC. Patch 2 lowers the bias to USHRT_MAX, as other drivers do.

With the smaller bias the driver gives up its last reference on a page
once every USHRT_MAX handoffs instead of once every INT_MAX, which is
only safe while every consumer holds its reference until the buffer is
recycled. That is not the case for an XDP_REDIRECT from DQO-QPL to an
AF_XDP socket in copy mode, a path the driver never meant to support:
commit d8a8ca14c937 dropped the queue_format check that used to refuse
it. Patch 1 refuses XDP on any queue format the driver advertises no
XDP features for, today DQO-QPL and GQI-RDA, so patch 2 depends on it.
On GQI-RDA it also stops XDP_TX from writing into a TX FIFO that raw
addressing never allocates. Trees before 6.17 still have the old check,
so there patch 2 stands alone.

v6:
 - Patch 1: say the check also covers GQI-RDA and why that matters
   (Sashiko). Message only; carried Joshua's Reviewed-by.
v5: https://lore.kernel.org/netdev/20261109100437.331423-1-amaan.cheval@gmail.com/
 - Patch 1: check dev->xdp_features instead of queue_format, and
   reword the subject and message around that (Joshua).
 - Patch 2: name INT_MAX in the subject. No code change.
v4: https://lore.kernel.org/netdev/20261106114551.212675-1-amaan.cheval@gmail.com/
 - Add patch 1/2 blocking XDP on DQO-QPL (Sashiko).
 - Say "overflow" instead of "headroom"; use USHRT_MAX directly instead
   of a macro (Maciej).
 - Say which trees need patch 1, for stable.
v3: https://lore.kernel.org/netdev/20261103090651.35399-1-amaan.cheval@gmail.com/
v2: https://lore.kernel.org/netdev/20261102112613.18334-1-amaan.cheval@gmail.com/
v1: https://lore.kernel.org/netdev/20261031173449.2439047-1-amaan.cheval@gmail.com/

Amaan Cheval (2):
  gve: refuse XDP on queue formats without XDP support
  gve: fix RX page refcount overflow from INT_MAX pagecnt_bias

 drivers/net/ethernet/google/gve/gve.h                |  2 +-
 .../net/ethernet/google/gve/gve_buffer_mgmt_dqo.c    |  4 ++--
 drivers/net/ethernet/google/gve/gve_main.c           |  6 ++++++
 drivers/net/ethernet/google/gve/gve_rx.c             |  8 ++++----
 drivers/net/ethernet/google/gve/gve_utils.c          | 12 ++++--------
 drivers/net/ethernet/google/gve/gve_utils.h          |  2 +-
 6 files changed, 18 insertions(+), 16 deletions(-)


base-commit: 21f57ec673a1917547c808cfa81890485fffa03b
-- 
2.47.3

