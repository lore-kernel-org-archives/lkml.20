Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.145.95.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794848063;
	b=uxaHmIVgucoYPOSPt0ZnRDsozQoucLWEae5kP7ARJEmcdZG3/zfmwfKjy/Yp6LPvlbfr
	 BnGKf10NI6EkPGQW3B6cDCPP4khC/vmjm/pjNP7urENS7vBBr3U1tpzxR0+u12gOcZNiw
	 /V9gVIQ2uEKVMTtslbejCe/CuXSpmA5Sv4QbYT6EbNQ0WOsn5Cjieb+qWOM6c8u2Tcx1V
	 gRICIE4vyY7RXsE4U0blTe+GM3radu7yXEPt3CHgnbpYj2EFGDuA6OoWiZdnKQxLh9pPO
	 WSAOi8SCUgpGvukscvtA+RBmqPKAvDGSIT+/QdXUj8fhOV/d4sWK5geWfx3Rkwhc7dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848063;
	h=DMARC-Filter:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Subject:From:To:Cc:In-Reply-To:References:Date:Message-Id:
	 X-Developer-Signature:X-Developer-Key;
	bh=g2bMUGvso2EopptviFmGmpAGzqB9d8UHay8nBNWY3BI=;
	b=f888H7p4DvrcPM1pZ9PsebqPh+mFhhhHggkH/5xuRhLrDUV1JUR2wvP8NRaoLiplhrvX
	 8Yjmhai0DhCXEFXWgxFH4yXu2Uod2hicfyz/LsCaRJSQanH/Icc8BM6h/0PSoEbX7TJNr
	 1KkL2T7+LSVou5NQv9DGpAP3DahP9aSqwndP198hULCNB+fGk/148O0k+fUASWemqKsus
	 0Y5KDBJOeYy9ebs2j39W83Z/LkEfHMFcCDoZIdaNcZ/KVfcf0ogLPGCmQo5j4UufQ//rI
	 jUYKRRegVYBmBM9SuTSCQyP5nu9n+SRn9rn3Mvjz1tgcM2uEGAnF0qoB8darpZa5IUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=toke.dk;
	spf=pass smtp.mailfrom=toke.dk;
	arc=none smtp.remote-ip=45.145.95.4
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA020606A889;
	Mon, 16 Nov 2026 16:54:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA020606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toke.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toke.dk
Authentication-Results: mail.toke.dk; dkim=none
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
Subject: Re: [PATCH ath-next] wifi: ath9k_htc: count a frame as queued
 before it is sent
From: =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>, 
 "John W . Linville" <linville@tuxdriver.com>, 
 Sujith Manoharan <Sujith.Manoharan@atheros.com>, 
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mehmet.fide@screeningeagle.com
In-Reply-To: <20261111215902.574916-1-mehmet.fide@gmail.com>
References: <20261111215902.574916-1-mehmet.fide@gmail.com>
Date: Mon, 16 Nov 2026 17:54:06 +0100
Message-Id: <179484804679.162984.8852491396666803433.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1024; i=toke@toke.dk;
 h=from:subject:message-id; bh=8CDScnrc+u2+KS5X1F+G0yapJarHlNd9hz38/LGMcyY=;
 b=owEBbQGS/pANAwAIAUNeEGz1+utPAcsmYgBq+zU2aIXV6ZSE0p2AI8+ANaKYi1h6HWeuO6ei5
 BGL0mGgsReJATMEAAEIAB0WIQQQshMTMFJycn1q0JtDXhBs9frrTwUCavs1NgAKCRBDXhBs9frr
 T8cjB/4q0/v/LFwKNlKjMQAraNTBFvCJngkTQv2IBuz/oDpoTJRY6MVU01g6upwLtJiEA88uZLK
 FJ5xGg0BP4sk0vNDElFPX2eeO59xNpi/9lVJ+eRPRsmxIXXOGD0jn/VZ+szNCCf9ePeB7uP3MPn
 9VuCcj4ebXQFIHPNq7X9nTm+waMbVgQuT+B2yNLiCD0hqp+5VK83r6C1MFoIl6dT7GRbuQ+R0Ph
 TJKhC3600w8hZDKTAh8o9qZKsQZ4tsh7nAVd0xGYn1TyAAiBqneiyQB1jAI2rmnZrSCLYbMc4We
 FTv/KIulX2ycBrDw3k4KprlrRehtfKKO5UCd77FeDI3lc692
X-Developer-Key: i=toke@toke.dk; a=openpgp;
 fpr=DE6162B5616BA9C9CAAC03074A55C497F744F705

On Wed, 11 Nov 2026 22:59:02 +0100, Mehmet Fide <mehmet.fide@gmail.com> wrote:
> diff --git a/drivers/net/wireless/ath/ath9k/htc_drv_main.c b/drivers/net/wireless/ath/ath9k/htc_drv_main.c
> index b46be3682f21..9467b8e512a6 100644
> --- a/drivers/net/wireless/ath/ath9k/htc_drv_main.c
> +++ b/drivers/net/wireless/ath/ath9k/htc_drv_main.c
> @@ -888,17 +888,21 @@ static void ath9k_htc_tx(struct ieee80211_hw *hw,
> [ ... skip 14 lines ... ]
>  
>  clear_slot:
> +	spin_lock_bh(&priv->tx.tx_lock);
> +	priv->tx.queued_cnt--;
> +	spin_unlock_bh(&priv->tx.tx_lock);
> +	ath9k_htc_check_wake_queues(priv);

Hmm, so this results in taking the lock twice, once for decrementing and once
for checking. How about we define a __ath9k_htc_check_wake_queues() function which
takes a boolean "decrement" as the second parameter, and does the decrement
under the lock if set? Then we can turn ath9k_htc_check_wake_queues(priv) into a
wrapper which just calls __ath9k_htc_check_wake_queues(priv, false).

-Toke

-- 

