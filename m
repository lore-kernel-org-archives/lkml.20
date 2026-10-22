Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792682238;
	b=lcQyoJvEhSz0klPenP8MGxTF3ME4Vt52ioYSj2+NiY6T49R5n02ZZWC41MnUVWElFtDS
	 QrDizJo134oeYuXTtP5pr8+GH2A5cYXuoU8wrPT9x7M6CNSIaHUCirZxctOgI67Al36Gq
	 gwZAE4o8D6dd2498h8d+o3P0/22SxG38RIgHrX+jhMR2j8/7oCsxf517e6GXQtHSCjia+
	 XM4mrza4MfNFojIifKDtiOaub5L6KggqvOwPtaODrlx7USZ3olzOyvHr4jLHE5kCSpuM4
	 mJknN+CHuQ8ZWFpaWXHpMcPL0TnHiBGT42ZDvDYloO2qgltYqesdc3gr4BBZ+FhI0MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792682238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=BMS/vcyNjL65g3dFxx4/6BCGx6UhCt4NMD1MWFw7eU4=;
	b=eYOwxOqm1mHgklhlUJt/OjnW+XvmKYBGv30+SoIg/VgIjdvKaoqhj5u6+4btDQ43X9i8
	 nmDuyKLDEi+0yjqhosGlKRHaA17lBQ9a4AOuqjVP6dvLC/xbm3Z+ATDBEzYhqBCgOvLse
	 wtTNb6/hIVQLVHPqyRQQxTmCOSxQdWU0PcLCoaWpaZfasZzRzZjmdkkzVmnt2PK7mQVDL
	 8GmdpRCTbZ31HMLmnnHtT5Gabz1UGQYpI0V/CZSSrzW5HG8JljCbKQ3kUllMjNhezlTzj
	 xdyvsjAsiocMhsYMqyhZU9RsaAcN34k3JdjS1YajW1IndymlIROU0mxVcwKH1raOm6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Wx1O1+FM;
	arc=none smtp.remote-ip=209.85.160.41
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D23606B3B1
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:17:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5D23606B3B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Wx1O1+FM
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-4a77dcc4ca0so1010291fac.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792682236; x=1793287036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BMS/vcyNjL65g3dFxx4/6BCGx6UhCt4NMD1MWFw7eU4=;
        b=Wx1O1+FMyZDScU8yOmfV1Q9LgiIGBYATJsmvHDSdfQLw9D6zzhLXOL4WRUMvRWCk1N
         BOUparZ5VbQsgEyxbMXvQUiC9mtbfJwGARxaVpbhYWjSz5CB5eidZ726LXeO5Hk/J48x
         5DTFUiVaRM19shYNGeI0PMqotn11D/oes60yH/PrzEUZZpeb9jntHVL7EkrAuuilPJ3x
         bA7kzxZlBuwnnXjP2clrGR2l8qNs8zCnZd2noylOWLMnNT2sBlqiHTXwyWzEPQd0j66J
         +T2lGLzOp0FsepD/IPAv4T9zk+JDuDd/kUxqtcZae1+UT0haTHRDw+Yz/tK/NYD5TPP6
         6gXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792682236; x=1793287036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BMS/vcyNjL65g3dFxx4/6BCGx6UhCt4NMD1MWFw7eU4=;
        b=FgZM06nNFSEqRxFTpSvZDdcyn3o2bUPMoQlFvjFEJYoFO1J7XQ0NcE/Cy1V/rDFVXh
         266q7+qnC87XcP9aCmw6jMWpSeQe4FEeuntpYWZZEZlcTwNEmGuDrBONRVYzE32ai692
         ywd2gCK9vOT36NVpAgTvZdi63T39TiqZzSxS8ywaDUFtvP1D+ztqBMMNtxrLd/vK9XKc
         4HAWHPkqjpewAtchpaSgtVGsjv4OvG1qv+eFvuSuWyKGWM+/ETuOJHI48n85K1rJPex2
         M1MDEVStYX3ia3HfPIlW2V0NF/FqgB8w81fljLiMCPDgAo/oYtUHSf3bnJyDQjAR6Fbv
         L+Fw==
X-Forwarded-Encrypted: i=1; AKwUvBwP9pVklLZbHzv6s4oOuHWV06HnhxNrwjvDyO+LHqyo/e86Hndx13VbVYIKGudVR0logBMbiQwtQeweOi0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3jSmaQsHqTBTcFWr3FAsCdmUIc7VDoHmge7uEmHQ6Tn3/dAi6
	qaQGnF2wN03gImhLzvfY0QK1fhM+EYkWI6KdTTa4Ek0jSqmySoZDqGYX
X-Gm-Gg: AYBFou0yOEjw5BqW2QpKiMe2kCqVvjH/OP/83VUU9uaPft18GqfK33zwvdcvaCyDuVu
	Idd79P7+RJaIykuoXRGbrwBByZx0A2uuAeWCmIVR5KFLOmoo2JiNhihMEFP2Wh11x2cbqUWwDkI
	XHZAc3SIQuL5s6wLiM0KD67jBG3v8OwdAV7ORvjqyQGjcp5ZmwPMMTpKTDCJe4c63UEI+PXtD29
	jc3Aa7QCNbhcezzAFlznxKYmjbApepBQtdIr13PvgfOn8aNQRFwjny2QxDvrxL0pAf4GBaWvbxY
	/8Wt9WyT1h+ScibRCx0POPQ7p9/hiyKq+M6CE1L9MZr77/7cJih8ZUxFWLQ6VQohpPTg4Oij21e
	eahgZphWG/d78z6mrTcpMPCgXzUeZM37xeZszteQpysnlWbEFf0Rpps2qMfEfaXtAVC+R4Ok3xU
	Mz+MLiZJIoRhbvd5fBXotj8K7hjfEtOCLggFmZrAtG+ITcwUUgblum7VLeuIoPu6gQ8Hxh0nRbG
	Rx9ib1PtRwE1RdB5/4d4aedUys8OO8I6VkSG1N3gClQuJ9JJTEj82/TvY41SShJQ8fgFepJ3HZ1
	n5Bnn5OoW8gx1TlPXUKX8gFkrHZOKvqGMmLihTPf2mmYeVBitMlPDRrmYsWfHqBOtYQosi+2ZQn
	AJ2PKhzhBm2MOsPmeoxgXXdxn4StJ303A7IUJYX3k9aJQFAGqLKheGfSLv+8HSdahOmq1oWG7Gf
	dehfQCdWOuI61MnohY5UR+Mrft
X-Received: by 2002:a05:6870:888d:b0:49e:45d7:f3c with SMTP id 586e51a60fabf-4a7dc214264mr3893477fac.28.1792682236551;
        Thu, 22 Oct 2026 08:17:16 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a7d5eb8fc0sm4685631fac.1.2026.10.22.08.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 08:17:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 09:16:45 -0600
Subject: [PATCH net v5 5/5] ptp: vclock: preserve missing hardware
 timestamps
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-ptp-vclock-sampling-v5-5-06ceace17bac@gmail.com>
References: <20261022-ptp-vclock-sampling-v5-0-06ceace17bac@gmail.com>
In-Reply-To: <20261022-ptp-vclock-sampling-v5-0-06ceace17bac@gmail.com>
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
index 4e98f119de72..b863880c0541 100644
--- a/drivers/ptp/ptp_vclock.c
+++ b/drivers/ptp/ptp_vclock.c
@@ -320,6 +320,8 @@ ktime_t ptp_convert_timestamp(const ktime_t *hwtstamp, int vclock_index)
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

