Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623740;
	b=12Pztccu+mU9EvsGqmYL9IllBILUAdUbAsUUhnF7pauDGaKrZwTbfQdRVMPpoZlf5p0M
	 +M7+Dd3+hen567AbJJAwDd+XFulOIUcQ5HxFC/wBzw8+fywtUgymHBeChbn754h+jSpRV
	 asE5HIDXFaYDx8pWF3YzDZSdMC2f0BA+RmD/x3JWJvyruJ0s5s+hr7HF9EklMusXvn1Tm
	 oRr4b3VdG3HHWFKri57XFFD7YvGmLJPe6rJMCLjiEToLHr+PpkpCXfhubCiYw75bMrxPK
	 O0GIBq3AVXAKHXoIHJWHba1GtSIVZuWB5B0dTxmw/cEBB+yMjwqksx5aOrWQM04zIsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7fMnYg29griSNHAmS2PXZq5vvQiH2csEt2FfsLS60Pk=;
	b=E0+lp6xkDW5Amu2spq0V3L2m0zDrdO4Lm3ulDa//IUcsnKeyiIsBfwluZYp73T7hG4QP
	 ndYfcQnebLE6sNMtbSXRkZwXDPIFv1ROVtFOZd4EhhYJY+FU+jvo8TYftArViveUvrdxC
	 RzJWQFoQ/wqtOTOybErie+t5DRkS+DZaD9E8HN1y7A0fSCMyUTpYf2/g7tF0IPM8YgTr6
	 hfkeOtvxGrG06TsQ7MQSNCxSYNKSyPUB9IH1BjaL+cq7Dkr7YbBMqwncxoTdk08hC5fJN
	 MMb+oj+65bDYhuAEnv4y64wEi/bNwnwxjeeyfilBzdznOh6479cSWYuuM14S1KZ5hiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yJtfxzwz;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC78C606A332
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:48:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC78C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yJtfxzwz
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso2665454f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793623738; x=1794228538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7fMnYg29griSNHAmS2PXZq5vvQiH2csEt2FfsLS60Pk=;
        b=yJtfxzwzNIUacvigCQ0K79QD6En3ow4xtxinMtp3MyZ2olcaP6L/MDgkeUKqE80u7g
         idjkMxw6Q4RVuSuElOSjosUrBWMJrLihAp3AVT4m8E0ABHAs0dOdq4eNaaZk05RYNWk9
         enTiFAGcvD01XWhtWN8k07wUZZBDi1wwcw38xQfIuM3oZjoHua0xHlvD12ra3J4bCJeb
         S3+yCfIWAZPAMuvAVYuIBKpIwozkQgOIsNcKeQXKcJ2yP8wL8wa0aRupJv7m6tzPURub
         7TxopA1eJqCySzbWIDUpydf+idTeX4gp31xuJl7NclDuAybGdBIOSMasQvxLBPs8pqyM
         p54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623738; x=1794228538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7fMnYg29griSNHAmS2PXZq5vvQiH2csEt2FfsLS60Pk=;
        b=VTpBVz7oC5u1maJqQccytSontXVJiIyMsYiKqOu1sA7QAGRy3j9/JWR0E70riR3MnJ
         B4eL1OgfhifxnrIr6hYNd98vT8Pz/k8Lm2PXfK91S42Sw/zIgqRn0AGZD/PUlZ1fJ6QF
         oraTTCxaP+1s3MSeT0vU2LbHrtDpt2TuR79OIJe7hrZFzuKRwDD93qdg4+ieF4zchdz1
         9ekA3HvMuy0DIQYJwKPPX3j1UuBLFp97gkyo+Fss2ehS3mJx88MqrtkhSxgOdFc9c/wl
         zx11IcFhTfLHXwcj+MMaZulsB7ebEUUnXUb4l8mMsy0IaDqJQjujNRIpdj/I1Pm8vQN1
         oZ2w==
X-Forwarded-Encrypted: i=1; AKwUvBwrM61ElvQi6REU+DY8mcj3UBkFiy9P4cZSxJ6MUx3/a2z+s+FhBoaR45LUBNj5ZvDSvnqhgmEX+GbaKn0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EYvX0w6l+9zulwsRZcAVHwLLwPiCxZ/cXHe0Jm1Xl01LDgdsS
	g+CF4j+qV071EjPLgH/VnQHPIguBwg5Gg03dFN+pWeZ6a2orxNhg7VU=
X-Gm-Gg: AYBFou3IQiwdZxJAFypviD7E+36XFEx2jeKLaQSByyCvhCY6AwBGBMAh1KxIL9JXHEf
	foG6vKtIIOUa7lt+63nw2FrXBTJsoz/d1zh9vdeo29+dic+nq7COShxbUZqnDK0r8Fjo5MNffKU
	6doOBcWK5Hd2Mj16SCXaX2YzXkjFYKmgzJHH3KbRBXUtUpbf0yZtc1JF3kxQNWJQAApiWzw+QQp
	e7zD50TuVWE1r5Mxmr5SHi4bdSSJ5KULLNOjS4NHcNPkJKHpbJU1P3vUPcVDDSLGTOlPmoKHYX9
	ScU5x9bOsfQjKbmEOiDr9cl56dQlJIwnhsVmWl8ey1tqgWNE9z2siC0l/lFP4EW7O7EpnadZ2ar
	Y6RZZBrJ26OZQ/R48+PKValWjnhONtTxloC6O9M/GF3o0sjKCVtG26r2fMmAJSkydA/Ueuymfr9
	dNEdfRjMZ5bqkkaQYvE71LRk7JE2ypL2iTlTVi1OWhwTcr9jM72aCmW6cjJdAddO1YghdtClFWT
	VwYyQSuM31Tt49hcnKBn5pnCO0O7s/5enYBP1hro9TZgin/yCRGXzqXpCJrbLW1cqlnzzrG6Q==
X-Received: by 2002:a5d:588e:0:b0:48e:bf0:35c with SMTP id ffacd0b85a97d-48e6e4f543cmr20614479f8f.13.1793623738447;
        Mon, 02 Nov 2026 04:48:58 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723bfsm18719736f8f.15.2026.11.02.04.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:48:57 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Jeff Chen <jeff.chen_1@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>,
	stable@vger.kernel.org
Subject: [PATCH wireless 2/3] wifi: nxpwifi: validate ext_scan buf_size against event buffer length
Date: Mon,  2 Nov 2026 12:48:53 +0000
Message-ID: <20261102124854.325979-3-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102124854.325979-1-tristmd@gmail.com>
References: <20261102124854.325979-1-tristmd@gmail.com>
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

From: Tristan Madani <tristan@talencesecurity.com>

nxpwifi_handle_event_ext_scan_report() uses the firmware-provided
buf_size to determine how much scan response data to parse, but never
checks it against the actual event buffer length. A firmware response
with an inflated buf_size causes reads past the event buffer.

Add a check that the declared buf_size plus the event header does not
exceed the event skb length before parsing scan results.

Fixes: 73b01e57ed3e ("wifi: nxp: add nxpwifi driver for IW61x")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/net/wireless/nxp/nxpwifi/scan.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/wireless/nxp/nxpwifi/scan.c b/drivers/net/wireless/nxp/nxpwifi/scan.c
index f3becafb9c23c..e7d98463ad18b 100644
--- a/drivers/net/wireless/nxp/nxpwifi/scan.c
+++ b/drivers/net/wireless/nxp/nxpwifi/scan.c
@@ -2427,6 +2427,15 @@ int nxpwifi_handle_event_ext_scan_report(struct nxpwifi_private *priv,
 	u8 *scan_resp = buf + sizeof(struct nxpwifi_event_scan_result);
 	u16 scan_resp_size = le16_to_cpu(event_scan->buf_size);
 
+	if (sizeof(struct nxpwifi_event_scan_result) + scan_resp_size >
+	    adapter->event_skb->len) {
+		nxpwifi_dbg(adapter, ERROR,
+			    "EXT_SCAN: buf_size %u exceeds event length %u\n",
+			    scan_resp_size, adapter->event_skb->len);
+		ret = -EINVAL;
+		goto check_next_scan;
+	}
+
 	if (num_of_set > NXPWIFI_MAX_AP) {
 		nxpwifi_dbg(adapter, ERROR,
 			    "EXT_SCAN: Invalid number of AP returned (%d)!!\n",
-- 
2.47.3

