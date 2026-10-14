Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39EC377A96
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791946412; cv=none; b=d8WVxuTzSGe6GKvehR4zkTybhP3GfzZ/7DCtIarGwsEfcjZTHLN3yz2ykykoadvV8CU8USoXvVfM0kmA/99tWNHe7Xb3b3YUHGYBGAikK0gzhID0F6oZH/KxhVjdc0L+gBLYT9FwK7DPo1sZij9SdgAOJUwvAs0yQeljA0oo6oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791946412; c=relaxed/simple;
	bh=/Egt3tz5Hs7aeJWjwPyFfGyEMQF3bDb+gjjLGnhPmKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gOFloyA3lh+PkEPNurGHOJjpZjwzrPapRwTQzsU24tHZxOC3L2QPw12RO9xKu7UK66HlQchEcViivPMrrpqHcrgOMwdaBxWSDkPsTg7FLLZ4+pT7e3aZaRjREkZ46DFzv8zDns+v47L8/OdcsTunS2yfwsu2TB9kiF0LefrKZ6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg; spf=pass smtp.mailfrom=gt.tech.gov.sg; dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b=Add3QjnX; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b="Add3QjnX"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso2562135eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gt.tech.gov.sg; s=google; t=1791946411; x=1792551211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SsN0OFGAaeGLWTKOy2XE6d+vAOcJRUzLtjGQFjg/b5k=;
        b=Add3QjnXYaqUvTsMSReWqQanja9fMKIbAa8bauuXutrNcYz37zNKh3tO3i43lqMaKS
         hvy8fTQfdkUmJwdV/bKde3S6VL3FG9orHJLNgYZ26/YoU27w9Ti9zg3qMIGBSgqc7SFl
         eGJMiyT8DdrWXf0T3oF6UmtmrkS1+xxrVTPZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791946411; x=1792551211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SsN0OFGAaeGLWTKOy2XE6d+vAOcJRUzLtjGQFjg/b5k=;
        b=FRoBFNOg/05Seh+DT7iIFrB6C5Yn6Pgm2PXyN9YEVi1d2xlkVMh2z6AW/bPmmmEnWF
         LqjHY+GtAZcRBk1uQYtVl1Vdrkmmq+oKlJIUTMIDfLauU3riY3tUe9+lZApNCPzlz301
         8vGZEKel9vgw1igmfYdS7vGP6BmIusym064sIXlngYW22rVQjc8RH5Et5h/ULGsR/5RE
         udx7M4z3d3xBuXDwAmVKunEy0wkUOTk2+p68KqEqho782uwqt68kfqGgS+QvpIhUcdje
         4ZNFhccvIINVjVuLkwB1cUC0lK+XRrGMAE9//oTHjxJKEjXPE3Z4ooLdiLQAifFkrUJ0
         0Sew==
X-Forwarded-Encrypted: i=1; AKwUvBwXZLFLxoBE7nXEQUZ75HK9JaEymuCyMCrZ5MwYghP4waBK8fjfoh3Wx8GOe4zsZab9LvfvQeV4atkvhjA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMgrobAFyqQAcN4rB4P0ZpRxlyJfyVa6c3FOMMDjmlDuYWcl9d
	wlwIouLtAsg3zJfjyVmKAU6f5EhdHeN5cfSAxDGmq9btZYZJZ9VW9zb4af2bt0UAr1w=
X-Gm-Gg: AYBFou3WK8d9aoQ0XE9VD8kzQdmny93sV9GRlm5SkKdwuAzAnIojSKSkve39Rcyot0c
	1mKZ+GU3kmWHsm6knyGetYBJL6FKWg2cN3qbft3JZE/U+ZAsvROMT70lFnpSZgOKj6kzhLciOmF
	6X9cyxKJPEd+oX7DFWw+NYItItagivbcTCix/zFiWRRLtxeTj1Ug8kkWnmoYYKW62U5g6/aIqYS
	/5D+PT25YWHbvzjyfVnQ+xmB4hct7P305iLS8UhpJCJv78WE40WVyXFb9TbfVIWevbQGUhSs1MZ
	pJw95A2bfq8cueVr1KuY1Z8OGXO4dy6N4bTeZM57yo1j7p2vaUA2jkUfbKSCRPZITpJZmDqsWqd
	YOBCyb9+g2r24HeLZm5BILz85xF2tS6KAFxWtUFy+x+1YfAybps60KsrbYDrmchEOiC2ykIJ0lU
	OlKZyWdq1zR1clnZnhvSCd7AZlnt/B35Uc3FC5yYK9elmAkp0sG3TH0dzXe0zRsQA7caiaUDh1L
	l1X5dVrC8aQP5yYskcXXpB2JZFx
X-Received: by 2002:a05:7300:2c01:b0:35c:1567:7966 with SMTP id 5a478bee46e88-35c15677c5dmr6988514eec.27.1791946410151;
        Tue, 13 Oct 2026 19:53:30 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain ([129.126.57.197])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb2fd33sm46522557eec.28.2026.10.13.19.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 19:53:29 -0700 (PDT)
From: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
To: Petko Manolov <petkan@nucleusys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wei Jie Law <98lawweijie@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net 2/2] net: usb: pegasus: check rx pkt_len against the received length
Date: Wed, 14 Oct 2026 10:53:07 +0800
Message-ID: <20261014025307.25233-3-law.wei.jie@gt.tech.gov.sg>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014025307.25233-1-law.wei.jie@gt.tech.gov.sg>
References: <20261014025307.25233-1-law.wei.jie@gt.tech.gov.sg>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

read_bulk_callback() takes the frame length from the device, from the
receive header on the 0x8513 and from the trailing status bytes on the
other chips, and only checks it against PEGASUS_MTU before passing that
many bytes up the stack. A device that sends a short transfer but
claims a long frame gets the uninitialized remainder of the receive
skb delivered as packet data.

Drop frames whose claimed length, plus the 0x8513 header, does not fit
in the bytes actually received. urb->actual_length never exceeds the
PEGASUS_MTU sized transfer buffer, so this also covers the existing
PEGASUS_MTU check.

Found by code review with LLM assistance. With an emulated USB device,
a 101-byte transfer claiming a 1500-byte frame was passed up as a
1500-byte packet before this change and is dropped after it. The extra
bytes happened to be zero in that test, so disclosure of actual kernel
data was not demonstrated.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
---
 drivers/net/usb/pegasus.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/usb/pegasus.c b/drivers/net/usb/pegasus.c
index 7c7d6b69998f..7bc9312eaa9e 100644
--- a/drivers/net/usb/pegasus.c
+++ b/drivers/net/usb/pegasus.c
@@ -520,10 +520,11 @@ static void read_bulk_callback(struct urb *urb)
 	}
 
 	/*
-	 * If the packet is unreasonably long, quietly drop it rather than
-	 * kernel panicing by calling skb_put.
+	 * If the packet is longer than what was actually received, quietly
+	 * drop it rather than kernel panicing by calling skb_put or passing
+	 * up stale buffer contents. count is at most PEGASUS_MTU.
 	 */
-	if (pkt_len > PEGASUS_MTU - rx_offset)
+	if (pkt_len + rx_offset > count)
 		goto goon;
 
 	/*
-- 
2.43.0

