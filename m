Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575AF4C9DF1
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 21:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792357319; cv=none; b=cKoSmi8Dqj9rU7FVnjwhwOIcFeZSLHADOuh0Ug+pE54/acEqvfdiWkNzwbxsIe+0VMQD1rnWrrQp4AITl54hfhcAxcvJRpo1AmAEBkFtzNL5okYgb/RSh6viOh13r9LsrLIsSaTljnfO3CpEwC1oWRkprVCS/H2PyiVpDxg2GI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792357319; c=relaxed/simple;
	bh=1E5iTU5FazhIcF7rD9PxkaayP9e6WL2hr+Dtgh0FYjw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QrxPYZ1irGI28R+CCI/yjv4hCRi+2NWcHOp/1d/j84ZIcKDfC896QRT1zYpwjRrp8Jeou7/W1uVgM8vy5HZHaMpNelIzQYqIy/WQegihuCRmZhN8USphYSXbww2R54Qpy5Otovl6ZyNuazt3qIVm9lmaxZZsAOi3e7JWGLsIedc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=xf2hAQg5; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="xf2hAQg5"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2dc63f8d8aso229552566b.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 14:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792357316; x=1792962116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p05I9ZTr0xocFHcXHKxdWxiCmf5s7sTPdQviWKawAQI=;
        b=xf2hAQg5x7sIlyD4ZWv/CfFGZsFumkguLobN2UcY9gYu76rfeDuqocraBsLtxM6h+J
         Kujzma6O5O82SqS7rd/Gwjg/gswVwFZrenHNMaZ0fZDG7l8IBOnN87dIonPaAqxzXyun
         u77cpNcjlHd0Lxa+obgyrDddX1sd52uh00lBcIAXVhP+uYoUvwtzDKHx8M+3JgIsT3VZ
         errILGbwVEtSHWx54b/8lQVZkT04HvpuIkcIyOjgLmOb+Qs0mlTQgvc0ixz4hpaCBYVV
         AOhKcFqcLsQNeL2hr1gvrQz7oXEfL5DO9ZiNclY2oyqJCtWhbYl8THChPOjDCEPouF5y
         gVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792357316; x=1792962116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p05I9ZTr0xocFHcXHKxdWxiCmf5s7sTPdQviWKawAQI=;
        b=s0wrugvn/5cThal2RabbxkxBJ0qlx8k6kvPMD5AzxqEVddO8/ORN8JIo/0AwaY3hvL
         UeNg5H5azPuhMbsnMqhOVy5IsRsO/TVBycbSshbtuInpJB5HsJBNkvJRd+WCElG6NQVh
         pV+PYDKulKCs5iDQPNdmNWDNzD1Td40VTEQFbPDsZQm6gR7OISyrTzr30ZzcNrto9Vxl
         sam0Je6YdJNUVfoxSmZNN1rbrlcID0TAd4W9IC/fzmtQXsrz4DrqRo7Z54FtU1bekRW6
         a4V0ute9R53LXm28nel11k05VEkOjSuV8R1QeYa8f1qO/QhwTxKBkKum+V8naw/9KG4W
         HgZA==
X-Forwarded-Encrypted: i=1; AKwUvBwHmr49f8ftoUZVd3HWMdyB0TWV/fgxgFM63gcqhLLHJH1kJzoT/KymybtZOWdWbbTp0ws1CXOv+z7uQgA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3qtbuO6HER/MR1RZCL2x4T0Adky406fG0cgPghJLul7kHo5Y0
	+k6NgI+g1O/7rUGUu+F5Erbrcrh3dtD1l7oNXBYpYKY2xHDkDnlGjiGOheTk8TxtBA==
X-Gm-Gg: AYBFou1J7azkWco+o5xt0P3CiuygMikZYnD0QC6cIJntQQFSUSLi5umY1N7BELmsiim
	luAsb/oMGrDQbvvfBicnWq9acF5vzyHR3OpKp521obmGUDPfAW698InRfRgdvmnw79lnojWNaIk
	kV0saR98P9u0yuj7Yv7B6+7izHzCiJWUrm3Pbqo8Nh8axkb+lAJfKldywCXVx8pOxhO43CDu/ss
	GBlqxJLP0N/NxCNEL7hNvxjjFDDCKsKqzFZOvn9j/G53zvLyFIy6sWNj9G4EUBHvfl35f5DY5wD
	dpBo/wBgtoT1uuWaYFP4GJV4dZL4CNtIkw/Ibut2trrFCBKxWVUOjTUzUI0k5it8XbqbzS8Y7rq
	ufkU1eBvVM3QrDjkrYjPBawbxRhraOWUJmNvH6+vv0XFGvNG1ml+BJw1t+tPiSDfS4AETexPl+Y
	Z1Eb7XGdJhSFIb50PGzKlxBVHBQxbLoVfLtwr7GbyQPy5M/LNBp+wDThz6WpKHMSIuTgJCfzGDv
	QPGk79OVRnKNCwumpRVf1I7SNkH0omvD3xAMgZaURsp0Q21MzkRB/HE6xmYze0lpongqaOmuPWq
	2a0ov4VD6R7ufrhiy8Wx4W3eq5PpiHpbRQC56johJa+rsONPlBI6Ucm4IrNRgAayGh/21bhIgpG
	P+vRyxFEa0xHb/s7HJ1Zyj4dHZvr36Ue4Swba60PMDNmKnoXX7hMXSqzvYgOZUxhNLv6l6jis5e
	bgU6u6DU/xhA==
X-Received: by 2002:a17:906:c150:b0:c3f:d8f2:f08e with SMTP id a640c23a62f3a-c41a01f2fd9mr408627066b.44.1792357316312;
        Sun, 18 Oct 2026 14:01:56 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912cefd4sm291618666b.35.2026.10.18.14.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 14:01:55 -0700 (PDT)
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
Subject: [PATCH ath-next v2 0/5] wifi: ath11k: firmware crash recovery fixes
Date: Sun, 18 Oct 2026 23:01:48 +0200
Message-ID: <20261018210153.1925962-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Firmware crash recovery on IPQ8074 resets a waitqueue under a sleeping
WMI sender (1/5), frees radios and ring memory still in use when it
fails (2/5, 3/5), sends on rings it has not rebuilt yet (4/5), and lets
cfg80211 commands crash the restarting firmware again (5/5). Patches 1
and 4 are v2 of the series linked below; 2, 3 and 5 are new.

Tested on IPQ8074 (WLAN.HK.2.9.0.1-02146) with the firmware assert from
debugfs. Without the series, every recovery reported list_del corruption
on the CE waitqueue (6 of 6), an RTS threshold loop during recovery
faulted in ath11k_hal_srng_access_begin() (3 of 3), and after a failed
recovery the next crash faulted in sta_info_hash_lookup() and rmmod in
ath11k_dp_rx_pdev_free() (1 of 1 each). With the series, 12 recoveries
(5 with the RTS loop, 2 with beacon updates, 2 after a failed recovery,
3 idle) showed no fault or list corruption, a failed recovery recovered
on the next crash, and rmmod and reload worked.

v2:
- 1/5: name ath11k_connect_pdev_htc_service() and ath11k_wmi_connect()
  (Baochen). Add Reviewed-by.
- 4/5: fix the recovery ordering instead of testing srng fields in the
  CE layer (Baochen). Drop the ath11k_ce_completed_send_next() hunk.
  Fixes: the first driver version.
- 2/5, 3/5, 5/5: new.

v1: https://lore.kernel.org/r/20260805192129.61113-1-julius@bairaktaris.de

Julius Bairaktaris (5):
  wifi: ath11k: initialise the CE descriptor waitqueue once per device
  wifi: ath11k: keep the radios when a firmware recovery fails
  wifi: ath11k: keep the srng allocations when a firmware recovery fails
  wifi: ath11k: clear CRASH_FLUSH only after recovery rebuilds the rings
  wifi: ath11k: hold back WMI commands while the firmware restarts

 drivers/net/wireless/ath/ath11k/core.c | 21 ++++++++++++---------
 drivers/net/wireless/ath/ath11k/wmi.c  |  5 ++++-
 2 files changed, 16 insertions(+), 10 deletions(-)


base-commit: cd026e68fdbf88b9cc522b76c7a9d92c9a41f709
-- 
2.53.0

