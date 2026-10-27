Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793087750;
	b=1QoXYu/W0kANZEmCsUjhFlpGk/In3jbHBxX+7oLxLED6R9SIWPBqiFflwWJSoI9+GSoz
	 m+F/tByXFvixj8L5ey6blqLxd7dE4166ONhg6/D2OEN10sQwrxTIvcKdSrdoXWnLZe9Zc
	 lrw6bulgnE5eQL/wm6GIEJHPwuT8jvcM0Oo7PKNfC5G9xT7VPZoIX5n75ffd/vjzZfX7P
	 1cSuMyhw9F43QLbdt1+huldj4S1n2DS9ji0VzrKDOkMtqI76GdtAUfEiB20ZlBqYxfTqO
	 ApV9MSq8emvURvpCDqWgIGal5Lww5NqCzFFEVuczdOdAh5d4KdRPBW4Vfmt+/UfPvCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793087750;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OnjgAO2S1SeHeUnZwhglBquHq1CKNVlZfv2BuRKP7G4=;
	b=1RX67zb9iirZRG5iXTe+xi4Yzms+QS6MEjeFnTZayT0M/u13Ay63v+j2gm8Jmb+OARBB
	 gL4BPiF7OJR0Ll/9RIhTNYeIZGyGfBjLDJ/zNoEqQESVxiUhz4QV1NpXr2y9TH++eT3bT
	 oACeGqwkv90QOtuha0KjXjOfk4pm/xPXJszhtqdISEjTO5RIViM3YfEJC/YGT3U90Rc4C
	 FOWQZ/M2mFm0Jf+C5q133TKJokJhlTKpM721Qpsy6RZYs/+tw7bCbWzk4bjkBIUj7Qjfq
	 pL/mId+HnUFP47ztusPG8Hu+ujEh+hI+lFzyE0KKGXR3ev/X9etRkbAsSF08fxl3YYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=fIati4go;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CD1606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9CD1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=fIati4go
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b3dc272dcfso5069490a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1793087748; x=1793692548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OnjgAO2S1SeHeUnZwhglBquHq1CKNVlZfv2BuRKP7G4=;
        b=fIati4go/bYB9eSeVe1UvlGHHtQAjaFS/HqN+tmOfODSCAV7d0b7tG5X6jJIHTdZ93
         UphzDs/PYSsCPAGcv6VhD4noEFF5nPuMH46QFY65/MZsIK/T7K0kSTy1ptfppEJJoQgX
         skjIwx5Hz7gxEiA2FU5xB/t4MdLU5Pd/VLk3/1bp7MM330Djf8w3vo4hxwi8tSpypMFD
         AuJdsVMsh4uMy8Rp2bPWmJmKpDVuBAeqKhdD+Voe53WI5e2SGEzIb4p/PG2+ug15s2Wo
         GPT+JBV+y9oqzbAovSxbEJ71WNU84cYrYqtQ9lFUrBhhQB1XCRz2su/ddPHJ3Fh6KoMB
         9Fjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793087748; x=1793692548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OnjgAO2S1SeHeUnZwhglBquHq1CKNVlZfv2BuRKP7G4=;
        b=kOXyQpUzz2UU3FT91tUPsgl07VNDCLJPIuMJsP6aZrSiIgpu1om1aeAZWVHCPMyKJR
         kKR6fEWdUXegMn69ovKEoOoFTnAC+l1/L8RB2QdZMk1oDJbb01L/tn/ClmsWKH5IzLr1
         LFCNUOfaQQmZP+HcoN/iavMNhkOZ0+PLJ5uWSNkhMb6unMF48xMBG3TKKQIAJyUu79Ub
         y78hZZzzJsi86n44NK3VH4B7jOGSmsDQB75yBrImDIQEPljFJu2puMJpm5tNMy112rdD
         b2raNvQA/JqvPriiQTbLZ0LSlZzvnMg5S4+RA5Gksog93Gz86s9L6872zNuu029oWBvg
         q62g==
X-Forwarded-Encrypted: i=1; AKwUvBwo9PmZK3Ldan/faXWUUfeQFUHoQxFI8dEAlpAQuW3/c1DLJ30AfYKrEEsiAtANdESscMguBa1hf3HcQsE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrzoPRvj641E8DAKnCF2xoIRcCZn8jsk9HSRny2k1RByOJqjis
	kwGaz8JVb8BWkdPCtA1z1NGHM/5mm5aqbEsk6056Q4U7HB2FOObRPqBnm796vf1xwg==
X-Gm-Gg: AYBFou1yn5sO46tZ1jVzvalmORUsv7XOoTmW+z/5HlCQgqxTLSKAzRxQx6B9XOvOlV4
	FNnfM9TfFQ3hHahn6y+a9vUPDOAGExckVjrBPaLS1JIjXecTnyCGmnOI3e4WV9ufMDYvN3oSk5m
	q7lUuB//S7sQHShz/AOMzIAyxUq86rjpi7s1NQbXhrH0HeVGWeWGCPE52K5I2d6D4GSVVEOWNJm
	q48Sq4NwnErYRaubmZ1x7eMEpGtpW7huebLqEpIXW2HMIm93tJcCOmAuZVqNYSS3s3U2WILBn41
	Pcgr4wdmlBVpu1iWF6XhqEwaVXS0UZKjXw1JTgSrjKLqMEv0zWIJtDZrdA79x+IwoMeeUMfyFDb
	UkS9NpDPOt4CM4vw1ozGXuRFTXMvlWgRXnSXhfCGcuPqsTpVtlq73zOeTJbQIBL2qTvOKoUptr2
	37X06fA1FAsraI8r2zhRisSjUTO+Ny2h3DtKWhrYeggnGqQ/lZTvKZbGvNsX2qfI4LHmS5ecUT0
	bQCu2rNkvrFXM5Jx8fi0kXozkifI9Z6aWrMDWX1k1ryoWakX02Byyb3BMEznwlPOPKZEsJ7Bzob
	OJXj3Fdaid/QiP+2c51ry/7hWrZNGKMECGxHQ2tLEa02BbzCi5YZHPGk6KZl0MWaNZJ104CeGTT
	BqSBH9fzvNAwQVC8MWJYp3QvlhgKyhCasfQZFIpPtQUsQ86KN7gsaU+c39VuqwtD5p2M84T+9sp
	gwDlvoYaXGAXeyWZXs87FJXUx3DPrLvfFoZRTPM8q3sRoeSzvxze3NNWK2KFKJoIqUtqiJ4PVgD
	EfI5s4OISA4wFcjWJmSQYwMigYiEw==
X-Received: by 2002:a05:6402:1502:b0:6b4:2b70:4a7d with SMTP id 4fb4d7f45d1cf-6b443110fbemr6982638a12.40.1793087748266;
        Tue, 27 Oct 2026 00:55:48 -0700 (PDT)
Received: from Desktop (pd9513dae.dip0.t-ipconnect.de. [217.81.61.174])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445971a9esm4669251a12.19.2026.10.27.00.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:55:47 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Semih Baskan <strst.gs@gmail.com>
Subject: [PATCH ath-next 2/3] wifi: ath11k: ignore regulatory info of phys outside the hw mode
Date: Tue, 27 Oct 2026 08:55:43 +0100
Message-ID: <20261027075544.19144-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027075544.19144-1-julius@bairaktaris.de>
References: <20261027075544.19144-1-julius@bairaktaris.de>
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

From: Semih Baskan <strst.gs@gmail.com>

The firmware sends a regulatory event for every phy it reports, also
for phys the selected hw mode does not use. On the Zyxel NBG7815
(IPQ8074) the firmware advertises DBS with phy_id_map 0x3 and DBS_SBS
with phy_id_map 0x7, and its events always carry num_phy 3. With DBS
selected num_radios is 2, so the event for phy 2 takes the fallback
path in ath11k_reg_handle_chan_list() and hits its WARN_ON(1) each time
the firmware starts:

  WARNING: CPU: 0 PID: 0 at drivers/net/wireless/ath/ath11k/reg.c:828 ath11k_reg_handle_chan_list+0x230/0x2e0 [ath11k]
  ath11k c000000.wifi: failed to process regulatory info -22

There is no radio to apply the rules of an unused phy to, so drop the
event, as the single_pdev_only case already does. A phy ID at or above
the num_phy of the event still goes to the fallback.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Signed-off-by: Semih Baskan <strst.gs@gmail.com>
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/reg.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/reg.c b/drivers/net/wireless/ath/ath11k/reg.c
index 1030e119fd903..37be563d8de68 100644
--- a/drivers/net/wireless/ath/ath11k/reg.c
+++ b/drivers/net/wireless/ath/ath11k/reg.c
@@ -910,15 +910,27 @@ int ath11k_reg_handle_chan_list(struct ath11k_base *ab,
 	if (pdev_idx >= ab->num_radios) {
 		/* Process the event for phy0 only if single_pdev_only
 		 * is true. If pdev_idx is valid but not 0, discard the
-		 * event. Otherwise, it goes to fallback. In either case
+		 * event. The firmware also sends the rules of phys that
+		 * the selected hw mode does not use, discard those too.
+		 * Otherwise, it goes to fallback. In either case
 		 * ath11k_reg_reset_info() needs to be called to avoid
 		 * memory leak issue.
 		 */
+		u8 num_phy = reg_info->num_phy;
+
 		ath11k_reg_reset_info(reg_info);
 
 		if (ab->hw_params.single_pdev_only &&
 		    pdev_idx < ab->hw_params.num_rxdma_per_pdev)
 			return 0;
+
+		if (pdev_idx < num_phy) {
+			ath11k_dbg(ab, ATH11K_DBG_REG,
+				   "ignoring regulatory info of unused phy %d\n",
+				   pdev_idx);
+			return 0;
+		}
+
 		goto fallback;
 	}
 
-- 
2.53.0

