Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794430117;
	b=JBbWaMtKDrknLohNxdLhZwWW01yJs2m5D6s58qjbcimbGyo5+PEunvBkQcw3rAZafZDI
	 jGsA6pSYPeABl5+yTgWpa2ejKTjN9cIf+mUD3OEXGJbnySGFx76bL7zmBYJjPuWo+bsVf
	 PRBjUbeive2j+MNoZRtNom15WsEvSy9q0i4sYeunmn//IdI/A/1By+0gy622SuBO4AFoa
	 /kdL7AIfgEUsuq0xYcrCHWFga1/NI27o2Sl2tv7nChDoQq9x7TQhEvADUY97wxjeaEajS
	 canlH9C0e5S24c6ssm4EVTy6n8CwAcbTVXFDMIsKJlRLWYqs7LKAJ4h5GXn/VDzvwNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794430117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IZYnbqYkHqkELVkKDLojhWjQ3BIxvmQ0PHO33MEnp+4=;
	b=lyKnnAOVrEGDFxacQP17WISTAKbRlyV06DnKxxNdYZBKiXc5mr2QbESOj3+Eh6cLk52o
	 oVRHXJhxxBGBuZu5JrJYAoG3gLzBi0gIxKPoAfsqSur1jAE4gjbmYxDLyYZmHeFjnP6Gz
	 h++7GkntD0333i9q0H2fa3KAZKTJmOU18MNedWeLMcDZbmiokFqeTZ+32DomNNOiwldv6
	 FeJEpJozd+sCCH4nTVa/L1frxQudOwKoAquMgod0zusiodjNvmTnAKd9cIO+0LyTn5kIw
	 pXa/arQfsvj6CqNmcBCDn+NNCTqVasE6PwO0Z5VlvbSEfPyFiqyNnuY4Du5M7S9O7yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yAzlYn1S;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81955606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81955606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yAzlYn1S
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so36244045e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794430116; x=1795034916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IZYnbqYkHqkELVkKDLojhWjQ3BIxvmQ0PHO33MEnp+4=;
        b=yAzlYn1Sm9ckYmfdgpgSMaY7CxevFGTQY0xRQ+HNtnVifbXT6qkTqts8ZLWCQLzIey
         0yu054+3aQ5KnsmcKxCQcNcqDArGWnOiPEEjn5Sg7Ni4lwEdZc4z7slBkIQle4Z1rCmc
         MUwHN68L/6pwgGxFRro5voYsBibVqB/d6qE8Ghu4Oefc6IfknySLI95lqEgECv/7YI25
         yCHqAlcBhD5M4c/28q4+X3pYJUBpp60O9jF+yVSxy7XTstNb9xT6uuOv6ffE0K+i5bgO
         jxb47SeBXWn37oHvCgPyzNb+gyq7a/Gqi+wakKtIILMutPW3sdRGad21TYDH4L+33Pbt
         c3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794430116; x=1795034916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IZYnbqYkHqkELVkKDLojhWjQ3BIxvmQ0PHO33MEnp+4=;
        b=NZME1aM7FvtoL7Kr6qYxpYucdeR5l6C25W27dbk+7lPYeScgliqUZZWYHGjHkYnpu8
         Ft7Cj1ye9kULiFZ7HlFsOk0vrE1aeq6ysq7qjfMBWrb+tIONLFkchOYXDyLVv0YCtpiW
         /HeqakBnDnrCR1Swxqdn8oo6C1KOvBuloNy/AbPjPXJJMY1u6Mx2IJc9QBUGoTFhndHH
         OMIvDQMa4Fr53uBrCZw4ebxpg9fcTBlWoeZ4jxMkSfaC4xp+svFGok2GDxIUJv4o+CYP
         pDgWieSU8Rr7kxFDYO4If3OON9diUojOUCdjb62Fhv1j9s3xEmxvLeWOA4F8GcfgzJvt
         3eJw==
X-Forwarded-Encrypted: i=1; AL+hErGgaeMxvEM+vBMAEogJ5soMFggtJLyppddcW69iLzPc9jSUOeVyRLJwmNHocdm5ipLRs5ETi6b/AVRhRPc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8w+By9GhJNaivT5wV5pH/JnOfcdHtVyrtjiQUWlLZiwP/Yl/OA
	BGD/TokQ9f2Irf86Zg1P9+X2Wl3C+hqUPm0f95YUo8KjIyOMxeZkmzpD
X-Gm-Gg: AYBFou1gB8fNtQ/3TCURTaJZ7a3Io833KWSGITjLkec99/8Tk667yaJuxCBfU36SPMg
	vkRXiBYVfbn8B/m/tF1DKetxzmsJJL5vp1VFeOg2X4ZlT2EEmE8dgNkudNFciLVnx5QBCwW/gfG
	l+cggAAR/ixtA9TUeXzBhiuCADHECMPbvXGxfpkd9MsSF9oQQ26qTPShodF0WFVPZoASGUGlITw
	zrMpQY2V5MoZdKIFvvRoaiv/+4k3sWANwf32PmDt8nuUlB4tl6Sk0gnptecilILxqetCgGlm4Ch
	z1vWfaRr8/IPKkCosa+/Xlh0XIAYd7Ur3AvkNBR7QVA//FZ7Mqu3pMu1r8iUKmLxub/LR6qei3R
	2Kgj7hile9tiQL6tuxDp39IG3JxuBydeFYX0SQajluzwcQfp7nOHHa31/CNG5xHd9Eb4Bd16DmC
	sZ82x/xpesNrMrkBc6Q3gEWYV8DZ6HhZi55Wz+1RXoeD4G3RXNy4TDJMbuqqusbudEVCsLEEZzb
	QnqugYnxQG0j7vdgmpVNKaf7xGdZB2kyQff+6XJvcTdhCCXn2iZcLR+Kicf2vZbwyOK207N5MZL
	aEw8NPGwvkt+oA8Elt2nqopBXaC/ZYdJDciTJ2E2Ai09WsyGCDk1KWgPDRlMty1J6vaLNjxKI+0
	Ae2gQgk8KEM9qPj6DQNyjFpxuRPiRoSKUBrfJ9D+tHwc/kQhFX5tTBumyznS/vgLD8Jcy6ZXhUp
	k2o4hZfggJPCVAMNLbqrSW0M4S
X-Received: by 2002:a05:600c:3551:b0:4a6:b49f:9ae5 with SMTP id 5b1f17b1804b1-4ba0938b879mr61055775e9.34.1794430115719;
        Wed, 11 Nov 2026 12:48:35 -0800 (PST)
Received: from ADM-D9YH122JTV.home.lan (58-119.dsl.iskon.hr. [89.164.58.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2842e6sm15063795e9.4.2026.11.11.12.48.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 12:48:34 -0800 (PST)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next v2 RESEND 0/2] wifi: ath12k: PPDU stats user count fixes
Date: Wed, 11 Nov 2026 21:48:21 +0100
Message-ID: <20261111204823.88785-1-gsustek@gmail.com>
X-Mailer: git-send-email 2.56.0
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

This is a resend of v2 without changes. The first posting [1] reached the
lists on 2026-11-09 but never showed up in patchwork.

[1] https://lore.kernel.org/r/20261109225355.23161-1-gsustek@gmail.com

ath12k_htt_pull_ppdu_stats() rejects PPDU stats messages whose common
TLV reports num_users == HTT_PPDU_STATS_MAX_USERS, although that value
is in bounds for the loop the check protects. QCN9274 firmware
WLAN.WBE.1.6-01243 sends it in BE MU BSRP trigger messages addressed to
two Wi-Fi 7 clients, which makes the warning fire on every such trigger
and fill the log on a two-client AP.

Patch 1 corrects the bound and keeps the warning for larger values.
Patch 2 fixes a related off-by-one: the per-user slot finder and the
per-user statistics update skip the last user_stats[] slot.

What the data shows (diagnostic build on an AP MLD, 5 and 6 GHz, two
Wi-Fi 7 clients, 2026-11-02 to 2026-11-09):

- Every message with num_users 7 or 8 was frame type 25
  (HTT_STATS_FTYPE_SGEN_BE_MU_BSRP) and carried user TLVs for exactly
  two stations, with up to four user records per station. num_users
  equals the number of user records, not the number of stations.

- The same firmware advertises max_user_per_ppdu_ofdma of 8 in
  WMI_SERVICE_READY_EXT2, so 8 is the largest value it produces.

- Rejecting a message has no functional effect beyond the warning: the
  user TLVs are already stored when the check runs, and the per-peer
  statistics are applied when the entry leaves the list.

Changes in v2:
- Keep ath12k_warn() (Jeff Johnson); only the bound and the text change.
- Add patch 2 for the slot finder and update loop.
- Base on current ath-next.

v1: https://lore.kernel.org/r/20261101203718.60679-1-gsustek@gmail.com

Goran Sustek (2):
  wifi: ath12k: accept num_users equal to HTT_PPDU_STATS_MAX_USERS
  wifi: ath12k: use all HTT_PPDU_STATS_MAX_USERS slots for PPDU users

 drivers/net/wireless/ath/ath12k/dp_htt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)


base-commit: d0fbb39d65dc9dcb4175fa6b23e473dec3670f4d
-- 
2.56.0

