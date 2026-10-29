Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793279557;
	b=fplEE66rk2ckvSToyQtShFNt5ga0vrxljrzKn/QaDc5ElCVpELy65/GLxpvvHrRxZ9yi
	 xsHcmSizahOIXBiMkd5TjNC0hapm9IC0LwC4GYTL+FSCAiKbiQ2CK1u/qASFCKazE6Okd
	 Krs3/U4ZDCv9h98rmet40Sue1a6gYvRNZfh8ZRojgmfcCApoHftUCh5T8+4z6PLS3oBNF
	 2Rb2sgiaXcShhMNEsKhBaRvpc+E8OBX8tPcwj0V9oZRz0wUALV3XaAVG45qzPOCXIvwCJ
	 i4CRqYI9ndWeSk0qc+XG6hjiN8ZP1lDoqk+Qd1A8141DoMnNm4M6kqjMy4tFfFZtCkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793279557;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DjZU+GdqFfRghr8ivEXQmw5FGmh1wu7Sy+QCcEjKDCU=;
	b=oYNGmUQqnu8JeuomOdY5VIXxeX5Nphp2TQSdf3FHSNnLf81mFwnR+oU3JDwhctfpdtH8
	 xucSWUO7lZBzWfaI3mA6h2NkcmkAMwNN6lrZGM4GlGwB1qTQOclhbskvRE0JPu1OA4luM
	 SUeCDMGo2xvKMSQwIngjIBA1CjgLl1yTdLGAlTeyUtYvosWnmHaLpwYI3dYn41M57+WtA
	 rgDpJWwL9ywwRC2XQvfUng64Lnqm6ge/6tXakkcy7Ywo/8fEaJPvjAbO6QfLb842cqFdJ
	 uWX1UzuzAiTLYvG2jcUCbKqBg/PuUsRoaqzzcwI27Ks5u5l5OwsLZRXdDciPrcB/Wew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H7Y6oAmi;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA23606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:12:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEA23606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H7Y6oAmi
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdab9e9761cso1159478a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793279556; x=1793884356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DjZU+GdqFfRghr8ivEXQmw5FGmh1wu7Sy+QCcEjKDCU=;
        b=H7Y6oAmidjacGix85LBwbQL68Hm0G5p+X2mCCNtspf+lGlgOHODyLn1vyFcNqFLXAy
         cO8kreUaI/lctpK5t3gQUYIlsJkevK7vJi5COlrIWz+4fFX7HxtBkezzHzLjNnv+Wtz/
         knt2HZFPpmBCz2HakKYbPsCf7ttkSikj0hDJnP7oBvyUuhLJU6D8+qCAKNnPPZ2DiC8y
         xD4+tG+7IbrVleKPHgND+8OSFSm6kj1REBpegbR+9HcgD7rjQdDmaat7hj3AODzxe/Mw
         7NDQjaD04YKqNLvlRXakQxT/7Gws4/7MoJLMwj1K2RrCALfuHVSVz/QDvdyyxdRv77v0
         rkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793279556; x=1793884356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DjZU+GdqFfRghr8ivEXQmw5FGmh1wu7Sy+QCcEjKDCU=;
        b=WIeY25pQMYoxorg04jPhsEg0Dw1ZgEfRm5vSqiIwmBRViMzLTBw1j/f6yLhjWJnrRl
         osBDRF3Dhj5HpiLO35JAemwkCzJ3lwSjpgxVUt2fnYVlAB+Qbfg1CZgMH312ekSwTUgf
         U60TwRCmGZJIFhCRST1iHqypKdy7mkYptQnBeu6353ZMMnbDm2BaYK/vf8kztkZ4UpCt
         AcaNh+jOxbSXmc3J2Vw4Brb0dR7l+MK3sNxnJhvCcoLjFwBIx8Pyrey7MBn5Z9VlDilB
         cVm0Yptk/8yfLePPO08+SVc4s2h/u/6lukGKE8pBPUhtHjlWsnXgCJRTOfzNy4mZLkYQ
         BmYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSQp8E8c84uhiz2AysZD2QbXlFsliFc6Oe1g4y0nDTXlvgl44mShUpu1uqKjFoqPWX2/Z9P++AM/avF44=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVPo0TdKvZ0KPmvpH7uY2JAY6IClkJa0SEHM3xVXyVUN2NzW8j
	+UUyC0+0GLX4eyGGCfXQVk4g9B8Ikippg9GyHTP2Yh93KygFK2392qBN
X-Gm-Gg: AYBFou2HuJAmTqa6aVv16GX7qohGwjhZCNPV4VfRHEaseezgD8faPjWHOddmahJkzmx
	7z5jgnnGsSQz/qD1lWjQod2S2MGzIThsH3BYaPI+jql55tJwbMAR9fpsKiwltLftPiZALJAA3Ju
	IXU6ccJzgZYZZekg4N9EoUWsaqlILWXHkj56AGmG9QWzSfBE+/Di3+f2TTywKWz00m4NToyN7vx
	eQ88ylI7jSk8ufbAhNSuD0Glg9FG8h2wMeQnOhjXKgrg8Eoj5gx41LTGGR9/E6/XB0YWAninLmM
	335sis7WRtn8+aM/46SwD+tpfJUN07mM1YNWTQrQho5zAccfG6I8SqpUrxcBal9rrQzYTG5vleE
	XmVF6ZDKTdCZaqevovMljRVhyorML3pRaDlsm50g81UXuGLxEq+oRrfhHKIKtHiEhaO+53Ir5x/
	BRuPdYO5SetCx34MQ9BxVuT6vatn0BVLt4twuQyiOR/aXUNnW2LTbTq/ly4uM9eK+yj11DhcdVg
	LzeaqVaBDvFgHEBDwsd0966F1NemF6ZxgZRL2aZCvdbb4nq3N3QRiRJQTf0GvSU4suiFn6cIr/l
	9ZEtryuhM5jh1edpxIOtwhoj
X-Received: by 2002:a17:90b:3810:b0:3ac:eeb:e0ed with SMTP id 98e67ed59e1d1-3ae5828771dmr4642335a91.36.1793279556148;
        Thu, 29 Oct 2026 06:12:36 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae55d555d4sm4090445a91.1.2026.10.29.06.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:12:35 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH 0/4] Bluetooth: Keep borrowed keys inside RCU sections
Date: Thu, 29 Oct 2026 21:12:25 +0800
Message-Id: <pm-bluetooth-objects-candidate-0122-v8-952ad9eb0ef59367ba6a-0@gmail.com>
X-Mailer: git-send-email 2.34.1
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

hci_find_link_key(), hci_find_ltk() and hci_find_irk_by_addr() return
entries of RCU-protected lists after leaving their read-side sections.
Management clears and reloads these lists under hdev->lock, and
kfree_rcu() frees the old entries after a grace period. A user that
does not hold hdev->lock must therefore keep the returned entry inside
its own RCU read-side section until it has finished reading it.

Two such users have already been fixed this way in bluetooth-next by
commit 817cbcab91fe ("Bluetooth: hci_core: Keep RCU protection through
LTK filtering") and commit 4b76fa362110 ("Bluetooth: hci_sync: Protect
IRK identity reads with RCU").

This series applies the same approach to the remaining users that run
without hdev->lock:

  1/4 hci_find_link_key() checks the blocked-key list after leaving
      RCU, as hci_find_ltk() did before 817cbcab91fe.
  2/4 sc_generate_ltk() derives an LTK from a borrowed link key.
  3/4 smp_ltk_encrypt() starts encryption with a borrowed LTK.
  4/4 hci_le_add_resolve_list_sync() copies a borrowed IRK, as
      hci_le_set_privacy_mode_sync() did before 4b76fa362110.

The other callers either hold hdev->lock, which the management handlers
also take, or only test whether a key exists.

Each change only extends a read-side section over code that does not
sleep. Every section ends before a synchronous HCI command or a
GFP_KERNEL allocation. The patches are independent of each other.

Cen Zhang (4):
  Bluetooth: hci_core: Keep link-key filtering inside RCU
  Bluetooth: SMP: Protect link keys during LTK derivation
  Bluetooth: SMP: Protect LTK encryption with RCU
  Bluetooth: hci_sync: Copy the resolving-list IRK under RCU

 net/bluetooth/hci_core.c |  5 ++---
 net/bluetooth/hci_sync.c | 11 +++++++++--
 net/bluetooth/smp.c      | 29 +++++++++++++++++++++--------
 3 files changed, 32 insertions(+), 13 deletions(-)

---
