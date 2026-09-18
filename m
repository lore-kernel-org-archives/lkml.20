Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0101F351C3B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789695228; cv=none; b=hHiWYGQh82WkEW7iDz4QdeLnz/XIJ0XvjdP2LUxdW74PREktP9QrOwPgfAodG7yvyi0Sx3Q/VF6d++0plBzcvhfirqCmdKBDrLv0V/R7CZDjFJ9fXMQnEm+l4Ea9R3lebbebPqNoJy0c46Hfksc12tHJ0CLIsYs0LWq1/3V/K8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789695228; c=relaxed/simple;
	bh=vQ71nP81xJIGLGl+WldFcoeRSyjZOcokzca2ie96Obs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xy0ho+43FpictNDJIkwcmun5hEbRyTVqOiz0vxb4Wm34noosDpA+oKFSBGZxpPG03HrUajHCYzVtuUackXBRVRB1JuH62BlEThZsUwbEYrw9nkWrP011p/bcXIUjxrkELbHpFrW8PtTN7SKoESuvhg6rE75WZjKbLU01Cgyp8Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9KplXRv; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9KplXRv"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2ddb44ad1c1so1272985ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789695225; x=1790300025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S3eHLQ4W/b80X19nrEr9wAXnZ5B6H1Ytyc3QQvQncgw=;
        b=F9KplXRvTQLO1Vy0xt2ZkpkZHJZ1PGLY0ON/wd2amdzH1fWFOunOdY0HeDoqiqpVDw
         VH5J3wFaRxfo0xtb8Oa0V5kB/AoUwBQEMJYI4Dy+6z4kTVQEFWh5/KsFhydbZDC9GT+8
         4ZG7NVjJ8YxTP3E9OygkS0j/muscuf4uYGmdENq5prt/QfRKiv00EaNMialvt9gFztux
         k952Cqtr4OEqofuN3mktDveL7bJmZGlEMLo6f0/g2tLeBxGQ5nB91SMT1OTq1Bib/c82
         fuqasDib/oxt0h3KcySvI8WIwTW2nBWlPfi2A9Gx7mYRh2G7mC6vb5sEutFhVBWrCPJ4
         KD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789695225; x=1790300025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S3eHLQ4W/b80X19nrEr9wAXnZ5B6H1Ytyc3QQvQncgw=;
        b=utCxRMv6YKL9RS4UY+WvJ3fFF3WicwRkab4hXTlwzGTxnNlF4EMeckQVkV81YJXrtp
         kANK2lnlmxb8iy1FEFe9vzFf0N9YBt1IY0l5NQeh0A94yrYG78nOXbuJjUypMfxZzaJB
         JaOQ9kUpk0Cs264apQw2gkM4PCmdUjhiqa1FAsFqkRZFOU8m7v5HXj4gXuudNRCof6xm
         tdKp0hRHLvYcdq7NdUTREAoccWgaHlu1Al14ZLDPRuO701zaV8ItZwkOslgiIKodh6vg
         ejm6Mqf+Gh8jI5ntovsZ/RJkEayB8qBoGuyy8vYkRSg1KMSPZqZS5UUrNOH1FulHjqsR
         JqcA==
X-Forwarded-Encrypted: i=1; AKwUvBwvgAavQfypqsE4E5Xml1zGiMQ7rIht5QgaQ9gmkIEg9NKbVAZHx3ADS7oSfZ/QKX/pJEdJtu1S0vMK938=@vger.kernel.org
X-Gm-Message-State: AFuF++kTqNjwouy8l7VjofJy8zm74o2AEimBasvOMcYzkTcGVOJf4Zqs
	2Ug7sthVzF7VLVZwzRt+78dKIGrpZ/MD1XMHVCACfhBWAghuyLs+u402
X-Gm-Gg: AYBFou0w+w6K+kmTTJjoS52jMn5BdMBSqDH+NhB1faKPr2ylKyUi6BEoaH8k9QfOEju
	Z/lJZ0d866DH0gZVw1qpv/OeYS7xqIBvsadtXTWwuHgwJALXltbS9Hpx/TA8Kj6W0/juGmWUL17
	B4PR8fCsGn8GvJ6ETxSTskS19PMCBSoJFWWKqPmgxhDyoRdNdsw6hPTAt2MZ0U7MG+O9xUdA0HJ
	YLjue8DCIi0NFA0L+wmNvEsLmTXMgQvFYSALdgXwDKbnoFovvRLuU9oZ5xAFCKhO8TU8yreeXUN
	HjFMafuAgwBuvAdRcoBp/Zu3WKjC6tASpGNZ1G82zFidNI9DiGKs8f6Wz9N4htAHBL+qagDgVmK
	pTV9XoP8mo0/X1MLTFuDTo8fUB4Yx69N+kcQCHTeidABsJOnMdM/3ocjr4Q6QPKLvKQfFDqY0N9
	7dcztYRjZF2ebBeW+AjAIlz4L8Rjy1psQ4IYRHE8xJbJosoN5QBOaegJLLN9GQ/iaeEOG+eZ7yh
	r6pXdWjxzz0Re8ng2R5ukrcIIeyhIK6jfAT8Ng=
X-Received: by 2002:a17:903:2f84:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2ddb1af51a9mr17366565ad.13.1789695225346;
        Thu, 17 Sep 2026 18:33:45 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:e17f:a362:fc0a:a2ab])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c2872052fsm40520eec.11.2026.09.17.18.33.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 18:33:44 -0700 (PDT)
From: zjamg <ndaugoing@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: [PATCH 0/1] nfc: nci: ignore unexpected CORE_RESET_NTF
Date: Fri, 18 Sep 2026 09:33:36 +0800
Message-ID: <20260918013337.82214-1-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yuchao Zhang <ndaugoing@gmail.com>

Hello,

This patch addresses an issue in the NCI core stack where an unexpected
or unsolicited CORE_RESET_NTF packet can prematurely complete unrelated
in-flight requests with NCI_STATUS_OK and corrupt protocol version state.

Problem Overview:
=================
Commit bcd684aace34 ("net/nfc/nci: Support NCI 2.x initial sequence")
added nci_core_reset_ntf_packet() to handle NCI 2.x CORE_RESET
notifications. When received, it updates ndev->nci_ver and manufacturer
information, and calls nci_req_complete(ndev, NCI_STATUS_OK).

Unlike other notification handlers in ntf.c (which validate ndev->state
before acting), nci_core_reset_ntf_packet() does not verify whether a
core reset request is actually pending.

If an unsolicited or delayed CORE_RESET_NTF is received:
1. If another request is currently in-flight (such as CORE_INIT,
   RF_DISCOVER, or CONN_CREATE), it prematurely completes that request
   with NCI_STATUS_OK, leading to state desynchronization.
2. Even when no request is in-flight, it unconditionally overwrites
   ndev->nci_ver and manufacturer info. Because ndev->nci_ver acts as
   a parser and packet format selector (e.g., in nci_open_device() and
   nci_core_init_rsp_packet()), unexpectedly modifying it can cause
   protocol format confusion.

Solution:
=========
Introduce an NCI_RESET_PENDING flag in enum nci_flag to ensure
CORE_RESET_NTF is only accepted while a reset command is actively
awaiting it.

Testing:
========
Verified with module compilation and checkpatch.pl (0 errors, 0 warnings).
Empirically confirmed that unsolicited CORE_RESET_NTF packets are safely
rejected with a warning while legitimate reset sequences continue to
complete normally.

Thanks,
Yuchao Zhang

Yuchao Zhang (1):
  nfc: nci: ignore unexpected CORE_RESET_NTF

 include/net/nfc/nci_core.h |  1 +
 net/nfc/nci/core.c         |  3 +++
 net/nfc/nci/ntf.c          |  5 +++++
 net/nfc/nci/rsp.c          | 15 ++++++++++-----
 4 files changed, 19 insertions(+), 5 deletions(-)

-- 
2.53.0
