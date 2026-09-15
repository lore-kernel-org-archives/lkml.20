Received: from mail-vs2-f34.google.com (mail-vs2-f34.google.com [74.125.227.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280F32EEE7C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789488014; cv=none; b=iDpOiQqvTgNtMALPrgF6NKMHVs4PUPmyyTlH4JiVqGgcR7b0umlr3oA5XjNMq5MsEULOzDpZdcKPrbYTVnWK8Cnv1W9vjgtZWdPOLPy+G6i3lnMSUPq9DoTurjSSm8bRxHqvakbLFJEHZdiX5IWdurTELkIMzeU47mB57T9kPKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789488014; c=relaxed/simple;
	bh=c5rcdDdlE0FtYLAQf6VE6WbsbI2ilBQWR013Nj2HKGA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tR/eLwApBxS3d1nXdfEMauppwWpNcNF4sHzHPkvPmVko2HSXebkwhDe3BkTGavxxnLCY5rlDJZn/XstKwPVhI3BVcn9RB0QnQDdMCfEv5aAXY3/LydzZlfL1Qn2ELMx+PKbNjP9qSwvmXKPnfNTxBYPpw2okbjpEm+xVPXtX92o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BBeaedNa; arc=none smtp.client-ip=74.125.227.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BBeaedNa"
Received: by mail-vs2-f34.google.com with SMTP id 71dfb90a1353d-5c67e33b917so314017e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789488009; x=1790092809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jBwXWyCEkSTnm4vqQrbw6NCM+Mqq0U3bxGvHWqgfP9c=;
        b=BBeaedNaTksirHZrxy24M/hSXLmU9eCYHTAGP7qx6jeZMdbGHh9LTP4HCCMGbdlb0R
         AnGuJChstU+nUoHxNaLlg4y32rDHGMquRNT4hqb+wIUDDXvpO24UQwQjTY+jknIj90G8
         HPD+MkG2aoO0ukvV+GiCz71MukfDhxzINdXtZXkvwSDOBL4OrRu4eijvZtOZcoILMblM
         RzYo51DOSZLiIdtSkipIO+/Hu9YzLtwBVT1MUikgKUFMY8A53dFDzBcuajPK6w2/ufk6
         nEeLP9+Fdpm9EFC5H+2+SiwJBVHOUgRrs+s3NKmHKtrU0xttCy41zTNWaqvm3mYRt4nF
         Bnbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789488009; x=1790092809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jBwXWyCEkSTnm4vqQrbw6NCM+Mqq0U3bxGvHWqgfP9c=;
        b=Jz2e49qtgcmK+IhrodNzFbA7NZKtW6a6IB6UMjo6iwimCdRfRFP6oJU0NS3HLKADRh
         EeJ/joik4NyTmK4pBQ9RZG40z3nc2HdS39L0ZqFPCwim24w2WiiGxTOnW2X7ihm3G+8e
         eH4rHdvq6aIRI+oAjlgdt9LQBxcoOXHOIRdzyPAiFBbfHEQQ6RY05J5JLcF5NTdntCrP
         57+QtMUh0RgPO3YNAR1yIBjhnp9kEoceBGeXjHP7d/qJuFMi1oVdIFdyCCQkC2A6JRK/
         cpX1oetF38LrdVop2LKPxRJvimdfjoi4MxMF20YxUWWaiDOFmQ3EluuNQkj2jLEq1ZL1
         KV3A==
X-Forwarded-Encrypted: i=1; AKwUvBxWb2tlXWwJpjrqL0jI9vD3vqSEVjalhaGC9pmNcqIJggrxlAoZzSVurcBmnFejkJfTaoCJwHCD7MimJP0=@vger.kernel.org
X-Gm-Message-State: AFuF++nb5yRu3mQDg6Jg6Er4FMBkE20nYlmniAif88nNiNn4xH3LUx2X
	Gq1jx/fIkVBeypr4kw7S+zrGuIsS02xwLZXHdtGWL6VWoOKMBIAI6GBo
X-Gm-Gg: AYBFou1Bsk49zocyWWaNfCXQztyckHLZ+3JCyCVQiGuRJV3Pe2PZBfREoM7NW4E4gQE
	uJ1e9uNBJnvKmtzAvpQF1DscWs93sVJvXc8Wcq93esR27q+mM8QNiGAn9azMaeD/hSj8oRHNJ7i
	IHY0YG6THHPWWvAibS+bD6OT82wUzhTCflE2XwkvElH4oUXO0oY8xnnvSD0HdvhUUmCCRWkLBN9
	r/PwSVNQpEpLomiVThCWuoXqZu9kB6Ewpg/KmEKGR7An//7T3IovNn4VUjmz47/D1342bTJGhBU
	Yea9bfXc4ZG6Jqu+DppUtVzXoqp2wg3JlSK9/y7m6KNVJLm3307DuJBTUs+iWJYu+ND852emO6n
	gchD8NU7P+ICeHJkbXMEOxKtMcomo0aV17HykDzH2Tm9MjPrU90EgGskdVvKP2Ul0O8xEzFpzlG
	e6hP6tVJsAPqtGz/4EuftxvmsU2C536ljlo0cBIrMc+n0tqt4a1j+tU3V6JA6to3/noQ==
X-Received: by 2002:a05:6122:f8b:b0:5c8:2852:36cc with SMTP id 71dfb90a1353d-5c993c0c8c3mr3364356e0c.4.1789488009295;
        Tue, 15 Sep 2026 09:00:09 -0700 (PDT)
Received: from beelink.. ([187.13.206.89])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c99149d764sm1485543e0c.3.2026.09.15.09.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:00:08 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH v2] Bluetooth: mgmt: fix race in read_unconf_index_list()
Date: Tue, 15 Sep 2026 12:59:52 -0300
Message-ID: <20260915155952.3104711-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

read_unconf_index_list() counts unconfigured controllers before allocating
its response, then checks the device flags again while filling it.

hci_dev_list_lock stabilizes list membership, but it does not serialize the
per-device flags. During asynchronous controller setup, the worker can set
HCI_UNCONFIGURED and clear HCI_SETUP between the two passes. A controller
omitted from the allocation count can then become eligible for the fill
pass, causing an out-of-bounds write to rp->index[].

Allocate space for every device on hci_dev_list. Since list membership
cannot change while hci_dev_list_lock is held, the response remains large
enough regardless of flag transitions. The reported count and response
length still include only eligible unconfigured controllers.

Fixes: 73d1df2a7a10 ("Bluetooth: Add support for Read Unconfigured Index List command")
Cc: stable@vger.kernel.org
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 net/bluetooth/mgmt.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 167d75e34..1f6691278 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -496,13 +496,9 @@ static int read_unconf_index_list(struct sock *sk, struct hci_dev *hdev,
 
 	read_lock(&hci_dev_list_lock);
 
-	count = 0;
-	list_for_each_entry(d, &hci_dev_list, list) {
-		if (hci_dev_test_flag(d, HCI_UNCONFIGURED))
-			count++;
-	}
+	count = list_count_nodes(&hci_dev_list);
 
-	rp_len = sizeof(*rp) + (2 * count);
+	rp_len = sizeof(*rp) + (sizeof(__le16) * count);
 	rp = kmalloc(rp_len, GFP_ATOMIC);
 	if (!rp) {
 		read_unlock(&hci_dev_list_lock);
-- 
2.43.0

