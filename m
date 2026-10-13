Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAE653FD3D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919199; cv=none; b=AW1m0su85+NsP/23IaKVvUB5cNyF7oMD3BRR7p8SDfzo50NKSRga3kM/2taz/sQh4/m+EVmmyoapodkP7FNkqAURKW2dFQAByNqORV4BuGpq8tpvZJnrAEXoiniepRdYhnG4qQQgMOo1/Hnj1sLD7K6t3IRGjwQQg8I3fuibcKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919199; c=relaxed/simple;
	bh=/ETSF3lZyVUeslXXshMG0qVlZ/o+jDPKRJEDhxYGtNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f851goOzfmxCNLQIWTGQwJTqYphkKg9STFOEPkbqepzNVwME+gS6ywWKgKgcDwf7+cwpz3QyIXJEnWPzrjc5nE6FsREkGmF/T+iSxxHSeM49m19yDZeyzkvjxy/YVAmxmKUBN8+3e2/O6AQPsj+HLJr3yaMGiV0V+h0MuyCbMq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=geLDVsNV; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="geLDVsNV"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6dd059478dcso2354506eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791919193; x=1792523993; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SBxyjlKl2tsAQ3iOaWxN0He7F0zON2T03lxEbKDGG0E=;
        b=geLDVsNVd/TtbtMD3PCnRfg9ie/eDj8tY+gJsy47rhUIOpRNtQsvAgoyPnA0S8TT6A
         81jghnNsV45eZ8uCI/D5ITDkYvCyurQLPviLbggX+Xk5XqC+/uxHC9AC10e+fNF+TVfR
         8FWP7l+HP3Oix936LP8J1THAJtpzXYtIE5TyaTizrQWqNBCqEZQXNt/u8oJ0GPp2zL3w
         oOrqtVtg3WKy/Kvij8cFGCp6TU/ymJGoXhdq1QUua9qHrIk31ay9zMSPaCsSnGZem2CP
         XzWOVE1ktLG42nD9FpQs3wIP2PDBphr/j4LONc420JIQy6Jk1UYS9sgRmKxiH6ACFySv
         WmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791919193; x=1792523993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SBxyjlKl2tsAQ3iOaWxN0He7F0zON2T03lxEbKDGG0E=;
        b=uQ9CcXu03jnaG5wOT64e7X18nZibXoGy3yoowx3aoFDl8GUF+t/SvPAu4upEz/M0ku
         lgzk+iVPrJD3gwFOmg2CsU3AMzeAp67exwRMonk4Jw7JA+VDFe9b43YXPeOy+jH/bYKJ
         8AXVH5pCTzuQdPX/oCy4DxNssPOKfLXDoOoryYlOgQUnQHgNE7dBdn3bryWLM96EFf5l
         r42IHbUnaQDXe46oK5TR6J4xic37byKiWzYak4FGsO2oXAMECB2Y6q5mwiS9LSoB4Gw6
         jp5WxJyQYwA/KydV7fHkKAwMSzmKfNqPpT9u5Qk4QaVjYMTOmylMZacfmIrQBUYK1W1/
         CR4w==
X-Forwarded-Encrypted: i=1; AKwUvBxrzwpZ1X9WWkCkWmZCBXg+PTAXoJltlCQMPzNefQ7RrgLuKAVv4qLq0PRYklyhzaR0/tiqeJXHQq92e34=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPlnFZUBGAi6eRAhKZ8/Jnf7yXBIV07LwB6hKoz+y7bEf8p2IP
	TwFc5wWwQSg5taiYKwSKyCK1gtfrOg71f70yQiv1f9eyf49ywc6E2TFX
X-Gm-Gg: AYBFou3/K7mxlqCI6l8ECFcWrJIfs/Fh8Oej5bNRHn9nHi65LfycKTh4TRuOvwR1u2M
	ohIHOEb0PTUq1SwDKLSb2LECArapQJQjLO6Otm9yEebA5veZJeiYKsG7pJv/jIEs4fAO9vtIvgb
	T9aS69sPOpW0yF0Retryy+wi5PM+ddS1DV1dNu9YIiJqRzo+Pqifk6Ovv+e4eKsxjl/0SuPCsgX
	tdMIUEqLzbBIZ7QnFyMWDq13xQncrAqsZFT5GXbhpLsSCbhmZQNMHZFDQkCMMD+oGT6+FQaMbQb
	3YWz/I0QL2vvIS9ae0y7MnFOJXU5eB6+fu34W0HfMSQMnoJUQtbHl/jcZ5ljSt+A2Mn1NHUV7me
	io3CsbbGMlJtTLuc8VJ8Ik1wVIwq2WrGOLr3Iw+GBfTaLKp4qEz6a0VOR15VN+y8SCdpJnvRC7C
	s4ESa51pUADfZOH/N73Ig3MNpXX6Eq6Z5XPW60ltv3andAlTUN8j9SjiT09hv0fH3evjfB5Nidj
	0lqIFAntv950iWUdvupqjdbsmLiadZdXQcG/6PmBmpQjpBrOH8ThIkeHAh8HvMGJ14od16U3Sdz
	Mp1ue8tflwm4x1mz5NuHZTxNJyuZs+V1f9QBskVT2pHwiZdttpaCPW4ikL6YzU6NkP/g6TN0pd0
	nwgzw3s5DTwQF86wcy8Q6
X-Received: by 2002:a05:6820:4b08:b0:6da:29e4:35a6 with SMTP id 006d021491bc7-6ef0eec6e53mr10221552eaf.52.1791919193469;
        Tue, 13 Oct 2026 12:19:53 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-83039a3dfa1sm13280507a34.18.2026.10.13.12.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 12:19:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 13 Oct 2026 13:19:49 -0600
Subject: [PATCH net v3 5/5] ptp: vclock: preserve missing hardware
 timestamps
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-ptp-vclock-sampling-v3-5-d3ee4ea62fc6@gmail.com>
References: <20261013-ptp-vclock-sampling-v3-0-d3ee4ea62fc6@gmail.com>
In-Reply-To: <20261013-ptp-vclock-sampling-v3-0-d3ee4ea62fc6@gmail.com>
To: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Yangbo Lu <yangbo.lu@nxp.com>, 
 Miroslav Lichvar <mlichvar@redhat.com>
Cc: Eric Dumazet <edumazet@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Socket timestamp delivery converts hardware timestamps to a bound
virtual clock before checking whether a hardware timestamp is present.
A zero timestamp means that the packet has no hardware timestamp, but
timecounter_cyc2time() can turn that zero into a nonzero virtual time.
The socket then reports a hardware timestamp which was never supplied.

Return zero without conversion when the input timestamp is absent.
This also covers skb_get_tx_timestamp(), which checks for an absent
timestamp after the same conversion.

This was identified during review of virtual clock sampling changes.

Fixes: d7c088265588 ("net: socket: support hardware timestamp conversion to PHC bound")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/ptp/ptp_vclock.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/ptp/ptp_vclock.c b/drivers/ptp/ptp_vclock.c
index 6675466bc307..4a62047f0ce0 100644
--- a/drivers/ptp/ptp_vclock.c
+++ b/drivers/ptp/ptp_vclock.c
@@ -307,6 +307,8 @@ ktime_t ptp_convert_timestamp(const ktime_t *hwtstamp, int vclock_index)
 	u64 ns;
 
 	ns = ktime_to_ns(*hwtstamp);
+	if (!ns)
+		return 0;
 
 	srcu_idx = srcu_read_lock(&vclock_srcu);
 

-- 
2.53.0

