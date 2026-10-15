Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887844F798D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792107233; cv=none; b=pHfPmuFaZ0Htso/JVVo28GwV1ONjnFqxqh+017v8ZVDLyKDRLalsnvzT/X1HKa22ZMgmPA/S+mBCQS5a+ma51AeEZ2Yq98HMRYFRso+6ZkTVmNpu/U6rW/s0PRONsONTg1kzZvYErTuX8R6fAdM2vY7O8SbdpAC/cEUBynB6ZDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792107233; c=relaxed/simple;
	bh=BSZQsz4AaktraRMPo+kte0Fmcp27FfRs07kAnpmG6i4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EDAfSXTi92kLMNwf4p9EVPiDyfUpmdo32v7+Py550HAQmQNPkxTnLJ2T+hvugrD27dpKp2cnKnCwzlQz050F9RnVgwZzb9mRhBoFQx5LGK+KdTiNoQ0OcGVpJS0LXBNvZAaKjOMKlM42LLrXsRT+x23F3U4aredB1O9sHxCMpr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KLrDUoUW; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KLrDUoUW"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6c8f6a53fabso474135eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792107226; x=1792712026; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8FV6Q2SmXqF6b78Av68WgjEHjZ+64cqPVR4bTm+D2U4=;
        b=KLrDUoUW5UT88MtsY54o7EK8IOXjZdJzjSN3Homu0icuHQkEZkepFPcG++9YNAYd3E
         j89y2OU8i74DE+SEVCSUxtOJS/VDHAHw0buG30mUS/MuydKr47LZ7rSoIKH+NelwOxOH
         vzw4UH+RKmpdzMdHJ35aOkYnCfJg8KvCqbZ2zhq2G7X3zfxGAJsy0l36XEipM5Wao8d0
         +UlQjaAlRxmr5s6duDEoDPhdTB++3J9mvNIkwOYiN+AiJdL65nK34eeR8v4yMbPtoqQW
         w9kpMXRQYQSIjZgt1+10KIlQP459WU7S/qc+6zNL3hmMdG9paofiW5uwIOJXDmzP+d4w
         9gaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792107226; x=1792712026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8FV6Q2SmXqF6b78Av68WgjEHjZ+64cqPVR4bTm+D2U4=;
        b=bJmatkpVIwYzicd8bppihFZXJcAJ3kFF4HfivYP3bHj8K5ecXu2PnQQAnBNLyJg3TO
         zuQAbgxCpSRcBToifmNRQ5mhGl7oREeEamrBbrs8cKnC/4lUseS5OM17yDaRnOFLUiR6
         fByQqOFIUgk2xbk/Xgnl/6Z77MWDKNYVovcdne05SkD3KH1Ph3+UkkZJqw23FEsPtFS/
         tyTkRbLn1vcIyq2RaNTb7ajRveSxU07GZeiCEgV3gW55T0qNNOIdtKYpqsQexXHE0h4K
         wG+Nbonu1g/gE/E6jhPp7sLLyR6eVXySmH3LFRFAVqzp+ssdClssYjj3kxKa1Ppg2wVN
         KakA==
X-Forwarded-Encrypted: i=1; AKwUvBxmHwwywUbdHz3yM84IYAE57tF92hXtoi03tlbjsJQT4u5QWvGXnFCRW4XT2mTqqczzFBrkkCypzQdfcfE=@vger.kernel.org
X-Gm-Message-State: AFq9FYISDya9pD761jCSJciOkYvJ70Y18VIIq1n5DZ4BS4ucnvTVqMPZ
	SEcAsjcKEVAu6jRVDV/X73z4ZvLsKyNeRfn8BgY0+1NL2iaYfaMWe92N
X-Gm-Gg: AYBFou1rXsrZyrYFOCuqtb6Ieu5jZhqweqoAvTOWYEIIUvG1NnWMmvv+6xfj4dUQ49F
	pHBdnmnjQHda9WCfQfSFctLYD5YeB8jqHffI3usohtAyeZdFeMOqBoqeVe78qGvj218bJsrdp+2
	7+8uiAjo0vUUSkxWYD6PnVk7duaT2LVYwnYWUio2MZZ6N9BuhNpJy1BKJQ0/PWnlKQbXTr0Y9j9
	TtR1kZqhAWz7LQuBGDkFh2q7DlUhavtUsph6DhAb5ByZG0g1PY91Fxgpf7728AZPdzEGyUzJIdx
	a7S4Oqj1Bdgnh7AmdblpAqyGPuPrNy6W5HJ20hB/91rPBVxmrrVARVgBBELQ4LR1PoI6fUdz9MH
	lcC/zG97SLDp/iQMvfdB6/qW4i3hxdvHvkMkjAjIByNZLRiooOtIzo1PAPsEBaeUxO4EFQJaefX
	CVEiZfcIPckYxr4Y9EQZ+2audxObPXHnYLk016gs9ub32Glc2voX8fK4c4nrNgnizKtghyGs12l
	5FvrO9XnKAsQTZR6AiskXhlVLEWezpMdm6r/4BDsdZ2fJyOsWJzeoPBxStY5LUKHcW4PnWn3A6Z
	CuLqGllnXYegwggcwNbu0vzPM7lsXmHFPb+AzK/x9uZ578HECNEAu2aT3VbMZG2+u0McTeewY74
	FROAxDZIG8QBMpm2zIP2D+g==
X-Received: by 2002:a05:6820:83ce:10b0:6f7:9fc6:88dc with SMTP id 006d021491bc7-7010c368679mr753319eaf.1.1792107226429;
        Thu, 15 Oct 2026 16:33:46 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70188bd9ecdsm525519eaf.2.2026.10.15.16.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 16:33:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 17:33:35 -0600
Subject: [PATCH net v4 5/5] ptp: vclock: preserve missing hardware
 timestamps
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-ptp-vclock-sampling-v4-5-cba6ffc8ceb6@gmail.com>
References: <20261015-ptp-vclock-sampling-v4-0-cba6ffc8ceb6@gmail.com>
In-Reply-To: <20261015-ptp-vclock-sampling-v4-0-cba6ffc8ceb6@gmail.com>
To: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Yangbo Lu <yangbo.lu@nxp.com>, 
 Miroslav Lichvar <mlichvar@redhat.com>
Cc: Eric Dumazet <edumazet@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, 
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
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
Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/ptp/ptp_vclock.c         | 2 ++
 include/linux/ptp_clock_kernel.h | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_vclock.c b/drivers/ptp/ptp_vclock.c
index 88161be5eabc..39c3276ded77 100644
--- a/drivers/ptp/ptp_vclock.c
+++ b/drivers/ptp/ptp_vclock.c
@@ -312,6 +312,8 @@ ktime_t ptp_convert_timestamp(const ktime_t *hwtstamp, int vclock_index)
 	u64 ns;
 
 	ns = ktime_to_ns(*hwtstamp);
+	if (!ns)
+		return 0;
 
 	srcu_idx = srcu_read_lock(&vclock_srcu);
 
diff --git a/include/linux/ptp_clock_kernel.h b/include/linux/ptp_clock_kernel.h
index 36a27a910595..56f6ab1855d3 100644
--- a/include/linux/ptp_clock_kernel.h
+++ b/include/linux/ptp_clock_kernel.h
@@ -496,7 +496,7 @@ int ptp_get_vclocks_index(int pclock_index, int **vclock_index);
  * @hwtstamp:     timestamp
  * @vclock_index: phc index of ptp vclock.
  *
- * Returns: converted timestamp, or 0 on error.
+ * Returns: converted timestamp, or 0 if @hwtstamp is zero or on error.
  */
 ktime_t ptp_convert_timestamp(const ktime_t *hwtstamp, int vclock_index);
 #else

-- 
2.53.0

