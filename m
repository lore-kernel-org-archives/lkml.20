Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B1E4D9572
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789580093; cv=none; b=JQ/U0gGuYd/7nhmX46l8WJJ2BHiH3o9kzowPE/jQ3D9t7bhda4AdCMMObQk19nriAjWfyfC2kwhM1+CJj4XeQwD2OdjdnU/7IOsaDGwgx2TnCzoJ2iDb/OcKWIBjhUFMxu/fkxxDa6CoY7XasOMuGuEbgXF2GBiJtne45cqLjAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789580093; c=relaxed/simple;
	bh=vfPgszcrKMkOdEiihjECb4jnRWMn9BoIETfDExylycs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hfw6Jqpcq1JPdJRkSLOpN+hHVpEQ2XQJgnljViWAgCAMZ7Mt2sDTqGQ/cx/puS/JQCdeThet8BgePag7kYn71j7/cg+fUWAup76f2NSGBQP9A7xX7DnLFgCtYWmQUODCYiqlqr3X9RcO0E7ij1qEOhH5ejc4qz2j8ZyWmsh7DWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FNAu4/xG; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FNAu4/xG"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so46365e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789580082; x=1790184882; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EXWmb7VjjlkNtn1q70BvaaY3UDnd0CfPKSfQaqn3n2k=;
        b=FNAu4/xGxulIBRs/0kFJf7a2BYLWyLH8Ui09Gy6NQYKQX/14DScyW77uLKWAVQoFIV
         AWwSBIlVmQvk0ac+q2HW4Ps98Wgk9thQXe64WXzkVTkRLhX/yFLx/C948BM/A7B7XZNE
         aTIxua+aHaERYrjHyereN+fnSN9VSSRwLrtc5Ml7NcCHBvOEmAb6AONolgw7fbBcDgAR
         aQB7O3kYFvZUTACTVeM7Um5OljEKpDLK2XAfPtOp394skWEN0femRjwxUx1XHGz5iZHc
         6zU6I3HVVuglk3AGlcofyYtUEi3Ow5au+M3tt6GurXBLCnaTgLYA1wxyWCqmx/S4jF5h
         b9lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789580082; x=1790184882;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EXWmb7VjjlkNtn1q70BvaaY3UDnd0CfPKSfQaqn3n2k=;
        b=lNmUAbfvrcvlZimIhzKGi9MEONUyEKOIpn9EsxbzwV0b2XHxjb/c4dCDKJae+HBm+V
         fUuVvXo9aKUFwcb9ExOcEFR++NhThPIHZ+Nfn9/krpuI/trPbAzNErCodPnxKRoHzb1T
         8LofltbuSu2ES8O9/yOMsYOzXHEJZ8AYntL2WXXr16uEOjXytk8YwRFYSIWY6q+BIYdb
         3ZtoR76GbK2LlGfF2GYg2AtE2moLdYoFpug3y6MSoIChKy+BiLvmPqYrKOGpfhrJfOWC
         7GjZKHLnpl1hXWLQkeJ+2tsupPEET/eXTPYHzhUNrtrKNT0mVvaFRd44+wwbYuaubL/t
         ZU+Q==
X-Forwarded-Encrypted: i=1; AKwUvBw77c1wwMZkJjMvPgQVmbrZGpdvp+NfuU+lM77RziiB57zsoGa/tOn6f3DeeJPrakzkpy+Zw8K5vHIYX94=@vger.kernel.org
X-Gm-Message-State: AFuF++kwtW29NAKeVN9haUi3sbx1TYLjzNLQF5m1Vy72zZacr+n2dhWh
	+bQ28NhxKZtusFKgo3gC6WVZtT462MCJ9rV38JVSo6dQ4wtjnoLq/yQNrPTj
X-Gm-Gg: AYBFou1MA4Pz/73hs5IKGwux2hmo2H04o8v5SKNXhChC2pAjBxEPwg2vd3y/CaXZVD4
	eu8v4E2V5NWQUvBr0zXl61uy1rB6AmZM7HX48XWeaMcDwcIcMtWpH41i3enhtfb22NsaoAxNqGA
	gakIS564FJbQAErH+BX2fRSOfvsLqEt9rkQ/PuwaKtUU42QSbxzktM0VZQEk8oOZTA+tn0fj6/5
	A4Ge1t0e6tiDZc9Xd5LZTxzOdhNqsD47UcKU3aGrBHtfxjgDtcnu4irrK6Qcwx+eC/Eb8gIBq6B
	3Ovwz4E8NV9KD1fhk+uysqaZ1U8N/nrDJj8c1qVtziSHyv45eAaObgGjGQCMSbswOlKZw8D/ocP
	C6x6QZ+9m4N4fHYWKk6191TYKt8CnRUh6QJeHFzpGhPW7HncWnb7HNRdtYqn1M/icxnJ7dXcAEW
	dIxQ9KhgAdRtfqAW6ZbEQsPL6u/i7aCa8BYyU/5t1cm9aR6tblQuvug3ZGsuEbeL63lU7laZic5
	+4PIPOObrGYBbEfuA7j99QsmONFVKqzRGctb4DskoQ1rgvbuf2b3pTxfD3l2/R3/2ZXI8e/CPic
	8DL3bqQVGMXDuPA=
X-Received: by 2002:a05:600c:c8f:b0:49c:fc6c:be15 with SMTP id 5b1f17b1804b1-49eb733c62dmr44718705e9.27.1789580081884;
        Wed, 16 Sep 2026 10:34:41 -0700 (PDT)
Received: from nn ([2001:1ab8:1003:0:f23c:f0c3:c09d:d6d6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf27ce2sm8987544f8f.20.2026.09.16.10.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 10:34:41 -0700 (PDT)
Sender: N B <gen.benner@gmail.com>
From: =?UTF-8?q?Nerijus=20Bend=C5=BEi=C5=ABnas?= <nerijus.bendziunas@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"John W . Linville" <linville@tuxdriver.com>,
	Simon Wunderlich <sw@simonwunderlich.de>,
	Oleksij Rempel <linux@rempel-privat.de>,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	stable@vger.kernel.org
Subject: [PATCH ath-next v4 7/8] wifi: ath9k_htc: pass CRC-tagged spectral samples to the FFT parser
Date: Wed, 16 Sep 2026 20:34:28 +0300
Message-ID: <20260916173429.403889-8-nerijus.bendziunas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916173429.403889-1-nerijus.bendziunas@gmail.com>
References: <20260916173429.403889-1-nerijus.bendziunas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The AR9271 firmware reports a frame that failed its CRC as a CRC error
even when the PHY error bit is set too, so spectral samples received
under interference reach the host as CRC errors, and the host passes
only PHY errors to the FFT parser. ath9k reordered the same check in
commit 3a325565c7fa ("ath9k: reorder error codes for spectral"); the
firmware never followed.

While a scan is active, also pass a CRC error frame of FFT report size
to the parser, with the PHY error code it expects. The parser rejects a
frame without the spectral bit in its trailer. A monitor interface with
FIF_FCSFAIL no longer sees those frames.

Fixes: 83fb287ecd8a ("ath9k_htc: process rx spectral packets")
Assisted-by: LLM
Signed-off-by: Nerijus Bendžiūnas <nerijus.bendziunas@gmail.com>
---
 drivers/net/wireless/ath/ath9k/htc_drv_txrx.c | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/net/wireless/ath/ath9k/htc_drv_txrx.c b/drivers/net/wireless/ath/ath9k/htc_drv_txrx.c
index bed7ea2425a0..23d1ef2407a4 100644
--- a/drivers/net/wireless/ath/ath9k/htc_drv_txrx.c
+++ b/drivers/net/wireless/ath/ath9k/htc_drv_txrx.c
@@ -969,6 +969,25 @@ static void rx_status_htc_to_ath(struct ath_rx_status *rx_stats,
 	convert_htc_flag(rx_stats, rxstatus);
 }
 
+static bool ath9k_htc_is_spectral_sample_len(struct ath9k_htc_priv *priv,
+					     u16 len)
+{
+	enum nl80211_channel_type chan_type;
+	u16 fft_len;
+
+	if (priv->spec_priv.spectral_mode == SPECTRAL_DISABLED)
+		return false;
+
+	chan_type = cfg80211_get_chandef_type(&priv->hw->conf.chandef);
+	if (chan_type == NL80211_CHAN_HT40MINUS ||
+	    chan_type == NL80211_CHAN_HT40PLUS)
+		fft_len = SPECTRAL_HT20_40_TOTAL_DATA_LEN;
+	else
+		fft_len = SPECTRAL_HT20_TOTAL_DATA_LEN;
+
+	return len >= fft_len - 1 && len <= fft_len + 2;
+}
+
 static bool ath9k_rx_prepare(struct ath9k_htc_priv *priv,
 			     struct ath9k_htc_rxbuf *rxbuf,
 			     struct ieee80211_rx_status *rx_status)
@@ -1052,6 +1071,16 @@ static bool ath9k_rx_prepare(struct ath9k_htc_priv *priv,
 		goto rx_next;
 	}
 
+	if (unlikely(rx_stats.rs_status & ATH9K_RXERR_CRC) &&
+	    ath9k_htc_is_spectral_sample_len(priv, rs_datalen)) {
+		struct ath_rx_status sample_rs = rx_stats;
+
+		sample_rs.rs_phyerr = ATH9K_PHYERR_RADAR;
+		if (ath_cmn_process_fft(&priv->spec_priv, hdr, &sample_rs,
+					rx_status->mactime))
+			goto rx_next;
+	}
+
 	if (!ath9k_cmn_rx_accept(common, hdr, rx_status, &rx_stats,
 			&decrypt_error, priv->rxfilter))
 		goto rx_next;
-- 
2.55.0

