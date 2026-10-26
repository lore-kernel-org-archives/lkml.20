Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793028341;
	b=pr+IXxobHjqxuSUgJa+7a/oaVQVODpLP8s8Z3QdvpZh+oBq1l7rjICP6pmjLsJR6scbG
	 15mWC8l14kUDTFRDJGCVCRVnoh9LxzWzW7PbXYrIUysduoA4olAE14+z9qSl3CUH5/sgK
	 n/7GsbMDmRkPps4ja7dVTuPP5qe+NXE4o1mJbbP0hJI9SVM/p1HhZuuiuDKUy4cosOv9G
	 yFqcvZWpA7oHTU8cxzJa7dzb68G2HMv6tSJGOASI//B0J3LALZz/wCq1lfikioblOMaOK
	 1n30/Ai3JFu5/8ab7FJSTBhgxamY+KSMjoANqor/9c04+YmxSHR/gszn0MTUiLyAztw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4YwDROZjw8lJkfVsNq0JU1At6fg3SRg612YAoXh1OEU=;
	b=fCG6F2bI/ALFErJA0E9juP/ZG3IVDoWyvBHG9mTBDsr7Aql/9pJZ6Aplf70MP1u9PuIy
	 U6Mdk1s+Awc7FZrLqXS24/y2pYqUOSGIev4a6VWp8HKqGx6jk9So0s59+RjgG4crI5baK
	 NFgy5BGpNgnkFv15mX46x5OKZD+Fs16TzUJeOaFO7IGyIs9rA/uL2Sc6di79EBZdvpTye
	 PJwpql85p0Pz5g07lqdRcLzX4IUDPWOl9ONtEHl0xDHMtVmS7YobySpYy8u+Dwf8uTCVT
	 HdmXWCKwGEzlQwyFBnjpaBGFyzdW9jEl2JBOI3fiiB0Ego4AWfcnwEdgIXs0BMWS7Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P4YQberJ;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30534606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30534606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P4YQberJ
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so15011815e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793028340; x=1793633140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4YwDROZjw8lJkfVsNq0JU1At6fg3SRg612YAoXh1OEU=;
        b=P4YQberJdPZJpMvUqWaUC8q4sGotadpwikV8wHwjBJhqrPe98kDTlNIu3aGRXAG7RL
         hbWtchVT1zjIDyKKFqTn0IBSTFm+6hrP3xhwj5/uZPd/CZ/nR/ZLmIZcJDYOqP307q4D
         NHTt2cWS/5iuiBFQZ5AJtcQ6awsqLOSldFlv3DqPtoRmdmBpeaTM9ZU9U/3sS2uX+Wrf
         9e3a9BJ1kmDzgLvFUHwdVdUuJTI5SxdLdjqVWe0oJHQUCzyQ4f8qDXDOFXv1q1dSJAar
         ng+hCpg/wJHzjOSTTvOxEzRvFDPRBrtyWRlXlnihC/Oux0McFYEEkoRx8WEKwz6u0PyH
         9XEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793028340; x=1793633140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4YwDROZjw8lJkfVsNq0JU1At6fg3SRg612YAoXh1OEU=;
        b=Kgpj2DJiXOh7JDPYNK7I4N8NrjRFGsXY88+xRp+oYHv0AkKYZhngdbqzaRru2U0gWw
         X4Fr45b9Pgt0va7MkG0qPm48i7RhPnUrchr4Se8lsIi7akB8su+CJ+yNccMP+ekgOs2o
         nv/g8hJPEM6AiTVa18qka4w4cbF/6y3/T4tHlfgAeYIdV8/ugpsCcegKYzdd1QCDbowc
         GOPLEbQiaDkCcgj85NRwmsbYbBXmpexwgyXYrGp8r8d6KSRZMwWOXQgpQ6CElWyNxCyB
         iPKcCz0QUIbBcFikJVykc8/n2twg4DocNvq3hEwJTtkclEc8WYvrzupjD1hgE7Gq1tmk
         CaZA==
X-Forwarded-Encrypted: i=1; AKwUvBzr4gL/X+HB4ZU9EeZ9Rz5yhUCwjtq6bde6wbvMk3haKdLo+2Dqjv4H1suCKMLP2zYUTw/vGKxECvW6iP0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIEEr5p0lS2UfwcPEc130a2V+hhq8k5itxZ3/FhJI0lplqMykHW
	DPdGsZ73+Qt1Idd3N2TQriMrA8tZi+2H3hLZaJNLvA62/WeAocd+Nl+W
X-Gm-Gg: AYBFou18xwYV++RzLIPPteXxG48vOMzli874ydiZr+CuSbc/TxumSaZaQoT5uIqiEmP
	/dKyrynmHu1An9LblQ16rufCeWRLo4TzBovqoZXJWoQACuOzFKObePRbSTNbd0aRc4ng0O5rlZi
	ZOisEp3KI1DeBvsZJb5fzRiuDVGRFss+Ht4I4mrqmNtTfwrD01TvUAQZNuUK0jHUsKB8YpLVGEP
	E1e3oOQhw6jDpMpNc5nxubjSZkR9smNaMJszvw/MRIUtXavRrVmL8ie/KzTPXmpW25jVkmGPvBN
	k1qMYuHDedLoFKopqMdi2mTfxeSHvBph1c0PSf6Jc4Dpf/p91auDzjEW/8iqu/s7HwN3oOa3q/l
	Dy/ieF5g2yFRrg8aufnZSE0Qt2FxfUGf4KULFxiKLJIv82lprO2znio4NFhyJPN/gVYoI6GxcnE
	o3/4jl0zhXFrmlAdBQ5S2KQGGpk+u13QYYWJ2h0PbF4Sy/FdenPEdhHh6ZMoMwEJTxrrCUm8Ci3
	ozTvjPOq4BhIBZ67959wjRSR8sdXARtm+MWDN1Psffilx7bOFRgI7cHFmXHBA==
X-Received: by 2002:a05:600c:c095:b0:4a6:44b:2593 with SMTP id 5b1f17b1804b1-4a6044b27fdmr53438845e9.29.1793028339458;
        Mon, 26 Oct 2026 08:25:39 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a08643dsm159615375e9.4.2026.10.26.08.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 08:25:38 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH ath-current] wifi: ath9k_htc: clear csa_vif when a switch is aborted
Date: Mon, 26 Oct 2026 16:25:37 +0100
Message-ID: <20261026152537.1272836-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

priv->csa_vif is cleared only when the countdown completes or the
interface is removed. When mac80211 aborts a switch and stops
beaconing, as ieee80211_stop_ap() and ieee80211_stop_mesh() do, it
stays set, and the next switch on the interface hits the WARN_ON() in
ath9k_htc_channel_switch_beacon().

Clear it when beaconing stops and the switch is no longer active.
Off channel, beaconing stops with the switch still active and the
countdown continues afterwards, so keep it then.

Fixes: f0e449627e4a ("ath9k_htc: add support of channel switch")
Reported-by: Luka Gejak <luka.gejak@linux.dev>
Closes: https://lore.kernel.org/linux-wireless/c8bc5affa75d7519b424ea98c07c1d6b65942347@linux.dev/
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    Tested on an AR9271 (firmware 1.4), 6.12.114, also with PROVE_LOCKING
    and DEBUG_ATOMIC_SLEEP. A mesh point left during its countdown and
    joined again hit the WARN on the next switch 3/3 before, 0/8 after. An
    IBSS does the same with [1] applied: 13/13 before, 0/35 after. A scan
    during an IBSS countdown still lets the switch complete (24/24).
    
    [1] https://lore.kernel.org/linux-wireless/20261025193615.1123718-1-mehmet.fide@gmail.com/

 drivers/net/wireless/ath/ath9k/htc_drv_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath9k/htc_drv_main.c b/drivers/net/wireless/ath/ath9k/htc_drv_main.c
index 0d6272ac0dac..8080fff765e9 100644
--- a/drivers/net/wireless/ath/ath9k/htc_drv_main.c
+++ b/drivers/net/wireless/ath/ath9k/htc_drv_main.c
@@ -1569,6 +1569,9 @@ static void ath9k_htc_bss_info_changed(struct ieee80211_hw *hw,
 			priv->cur_beacon_conf.enable_beacon = 0;
 			ath9k_htc_beacon_config(priv, vif);
 		}
+
+		if (priv->csa_vif == vif && !bss_conf->csa_active)
+			priv->csa_vif = NULL;
 	}
 
 	if (changed & BSS_CHANGED_BEACON_INT) {

base-commit: 9d8ec0b5b5295bd23d979d1b2b905de25c36fff2
-- 
2.55.0

