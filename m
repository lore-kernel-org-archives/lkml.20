Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A614D98E9
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 21:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792357327; cv=none; b=msDLbBh4Lk6NcqLIBuLgfncn4eLJuV5bR7BaZ72kvQraK1FDmthtEzKw3Ben0ZnKNu1bpGKvkZkFAr/WcEE4/wo7Exd2GkZChDV9ymgw4IoIqIJa/SNIc/oItZ7qk8uOgFKOC6XmKoow/J4QahR4UgPcHB6fB0Isfztf65oXITQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792357327; c=relaxed/simple;
	bh=j/1zUQRbqig05cvA0Htabmv3HK7YvRbrDkDYd0qo2AQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HXhot/fH7OB/61wwC69BXepBvX73e6a7nV8nT2tga8GW0gH3wZWm9eFVCKqgUhphIwtWWU0c/7nPQ0j6YCb1yQ17MYji5QNFiA92umXBchAaz+98/I0u8ynDMPX6UZMzPmhgpTdpytEpCjvvY9fYg4Y49/9YpR/kFVqsq4Bga30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=PF8GPzdi; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="PF8GPzdi"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c418e215671so170382766b.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 14:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792357324; x=1792962124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=14A6w5xPMpUCV8gRRYD7ibxrUfMizPY/0c4dLS53tf4=;
        b=PF8GPzdihEqQJrpfmWYPrU56/jXKvhq+qkYiOudH6qnnQgycarI+ku0YCo699fOw42
         lWYnBP2han5ho19fgY5Uik5kB7ja5OD91OfmpFMcVfZAQXTPENk8bF0CFHYsjgDwL/AA
         gYRLq7o5f3HszapXbGgQJDreYdeZ+6ELUIl3ZudxMIjewOe+a1JTIdea+HutN+ComxNW
         uN4F/HTVtSOaG0HjKKm8TS29HeHZccovM1gfKtJdnRKCo93dA7HTDLReHpDSENxCAzRv
         +Mq8VAKbvLj/V/nxozp5MCyY41cP249mWSCBJmzqYZw4J2Hc1puPhcui1x99C5QsRPQ+
         w5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792357324; x=1792962124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=14A6w5xPMpUCV8gRRYD7ibxrUfMizPY/0c4dLS53tf4=;
        b=cpfOEHNjnzrz+rcFCu7nl6fPkCkAQTuPvyfqn/FkkmKZLWe7pFqnb+BomtQIFeGrx6
         enp50C7j3NDsDM3ZPYl9qxUDVOzLJbvdM1Y/XExFMmnlYqMUqQtzyhrfSYNuhgi8+bnv
         mK6xJTn9/eLFotYmmYt2ES7BW009aqgFvq3kT4JnSGglaISBH+zdI1qnJ82ZgFLiy05Y
         JHc8nGX0KRIaHXjMT4rXo9DbsSRI5cXFRQ8atDGIliHvJKt/Ok1CjsUyx9DNnrf6AsD5
         RsIkw0zS5JKY283+5pFumzFaTWDGw25UcPp+cDlKuQTWJdPHhbFkNHhSb8CaCfY2FeW7
         87YQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkKRqnjF85/PWXk9ouDGVZWKGM41vwYRXDSxZauppQyCH62lUe4m7B7ciieWpkpdTY+/8xtu9WAADuKIo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeCZ7SE7KekgnoKFGpoQWc70AwQwbYw5AQzzHt1LnffrUReLms
	BhIJPURbepvLx2gLMiFlQVR6doZI4yVvAzehSIEMb2O5IYqRP61N911LENLL9+5R4g==
X-Gm-Gg: AYBFou3G5REcbtTgxF/Hs1Jo0pehvtSb4fgGEh/M2rj8teitVFwK44XCeTg8rHOkY0Q
	Gli7Rl+1weIM6yyWK3ZO/iaIt52PHj5nndpdYIGTZDZfLSxpubLkuJbeJQd2xG73Rs8sNeIYF5L
	SLfutsnRU1OzVgJ1Cl334ODrqGm/iYStnfam9G/M0xpAEZMPceHRtlARL6ZkuQradGaPZ0o/AA0
	obQdHreTh5HUSormti06Ys+xJoE9CP1t/esALMlPHHnhCyNCKqSFGnht9z5aC1guQzyBCT8HP9u
	nIK5SDy2PWVsWRJA5+tTp91feWw2NGEQkR+mN60fGEG3lLh+6aof60nf1XhV/OlIvjB++h0Y66O
	kEkrFYHIPS9tCJAVjhSBoHTNc0JU2v0oYWA+sYX1hYYDq4O2+K4Ht9O0OFAUPjxvf8BIBQqt8z0
	ddCy0IyCYQ3Yc7BzFTbQdPMUYw7npQy15mDQeEl2NotthV/jzxUW/ZqB00NQ2zJ155t2hjRdqnn
	6T1T8spEytnuImeEYT3lbvdOTn0TwNgo9cVu7TI0ULPnU/XU3OgUQuVxIHDU92G3YNKTH5qoI/G
	4TwvDyBQq3xmS4o4ePM/gSuoEOtc/v5EGAlCwbAqqkP9xWTL36X09B2SLDca1rfLsPjEbWqp3y4
	LUQqXh7miTnNz84vImmufvWF/7r8ydYadTbpLK97WK+j6/77PlpRa2QqTskU4nQZ87UCz9m35UH
	O42n6nsr6x
X-Received: by 2002:a17:907:a2cd:b0:c29:8a0e:4458 with SMTP id a640c23a62f3a-c419996fef0mr351005766b.7.1792357324577;
        Sun, 18 Oct 2026 14:02:04 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912cefd4sm291618666b.35.2026.10.18.14.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 14:02:03 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	John Crispin <john@phrozen.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>
Subject: [PATCH ath-next v2 4/5] wifi: ath11k: clear CRASH_FLUSH only after recovery rebuilds the rings
Date: Sun, 18 Oct 2026 23:01:52 +0200
Message-ID: <20261018210153.1925962-5-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018210153.1925962-1-julius@bairaktaris.de>
References: <20261018210153.1925962-1-julius@bairaktaris.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ath11k_core_reconfigure_on_crash() clears ATH11K_FLAG_CRASH_FLUSH right
after ath11k_hal_srng_clear() zeroes the rings, but
ath11k_ce_init_pipes() and ath11k_dp_alloc() rebuild them only later. A
WMI command sent in between passes the CRASH_FLUSH check in
ath11k_ce_send() and dereferences the NULL tail pointer of the cleared
ring:

  Unable to handle kernel read from unreadable memory at virtual address 0
  pc : ath11k_hal_srng_access_begin+0xc/0x60 [ath11k]
  lr : ath11k_ce_send+0x114/0x350 [ath11k]
  Call trace:
   ath11k_hal_srng_access_begin+0xc/0x60 [ath11k] (P)
   ath11k_htc_send+0x188/0x3c8 [ath11k]
   ath11k_wmi_cmd_send+0xc8/0x2f4 [ath11k]
   ath11k_wmi_send_peer_create_cmd+0x78/0xe0 [ath11k]
   ath11k_peer_create+0x138/0x500 [ath11k]

Clear the flag once the rings are rebuilt, before ath11k_core_start()
sends the first HTC message.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index daa3751d75233..4666245aee36d 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2294,6 +2294,8 @@ int ath11k_core_qmi_firmware_ready(struct ath11k_base *ab)
 		goto err_firmware_stop;
 	}
 
+	clear_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
+
 	if (ath11k_frame_mode == ATH11K_HW_TXRX_RAW)
 		set_bit(ATH11K_FLAG_RAW_MODE, &ab->dev_flags);
 
@@ -2348,8 +2350,6 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
 
 	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS(ab))) - 1;
 
-	clear_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
-
 	ret = ath11k_core_qmi_firmware_ready(ab);
 	if (ret)
 		return ret;
-- 
2.53.0

