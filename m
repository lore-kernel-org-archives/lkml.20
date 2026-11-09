Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794264849;
	b=jzZ0lzsCc5ViOU4RKEnSGABIbsMrK6/7F3PCZBFc15uMH9jeurqY0FquwYamw4zpsP0S
	 uJJ/ltoz5rprx43N2sCUFjVUKxXtyPFckphGqB+ySWVp7EpBM52JnwZNB/ODJFU+w3mGz
	 LzQU/GhmDFUM90ONEcVJWrHOFUG/5R9s3D9RrAHRNwx11rYYHeGF1t+pE7AwcaR7keNIy
	 xVQHXzJg4xeBBIXNFykJvuxliKaLt+R9gnbPzhKzr11v1XAgzePtJYtua93joJrEphIoI
	 khlQh+WNouqLQnwWSR96HuitBWlYwjqyP3Qmk5oyCBDALUKfQkmlD3Uq4c1e3PRDlYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794264849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8YKt/mxN51KEu82BTf2/x4XlarXoVG+PCXLXKuY4w3c=;
	b=nHZAtsaDY+iOGB7GShzVY4C9ea9wNb+hq1xKvPD/9Mg1uSnHW4y9sZXcLQQP+iwMVRBU
	 1QIEYcq3Wu7O+3PYmiB55f1A1oU5hErb8bVxDcBhp4DfdK0NNUUJnPz1OlfH4yqygm6xa
	 vP9wRlAg5O892RXvm4fOQGG3I968RJeCH1HhgUuWurnjVOYhootys0vnre6wBhdUbYVMA
	 lIE48GJHGFtVqSEv2gVxrwnQxAhBsPgw0BejsSgqJS3iBxgbLBBbbeXskjZqLukCTv1ir
	 1h3OB2LbYEUH29+iNS6NJ+UcQ05WMKbBCfzu3AX4tmeFInlMjMXjdiwuCyHXe3UPsXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CcOFuXJx;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E5B606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 22:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47E5B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CcOFuXJx
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so16948365e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794264847; x=1794869647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8YKt/mxN51KEu82BTf2/x4XlarXoVG+PCXLXKuY4w3c=;
        b=CcOFuXJx5aWpqmcP1OCTOmOPX1dH9kwI9qwT1vsdHetkX4VMcj1hSt+/09citz1YEi
         MfSdm6U6mAc+rdb33fuNchc92cZS+Vz8qysZbECRkBzEz90aYnG+LtUFIAQMeC60hu33
         WexhsB58DqaWzOAE3Ub+7iiAuEP9GvlQgZEZ7C+Tn/l/tZQ+0/+D/Y2FHNPGQszbSJfU
         ft86gHKEQLC4O/+puc+2Jcdu7j2pOywH8sLdMuYDtmqb4Q+qbkoyQ7JlSoKqnZ1m/e/J
         dIcZZTF9EazdI32KKC/Xvrpes2LSpbRCj+MzJVgEcltBbsvcfi5cKHsLZdDheF/H8hWb
         k7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794264847; x=1794869647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8YKt/mxN51KEu82BTf2/x4XlarXoVG+PCXLXKuY4w3c=;
        b=TJJwfl81UNjfwwuNznRM3V1RWIjUSzpyS78EMg6zTxLNAbV2+CCJ3/BtLEa/rJvafi
         Z3cWOHsa5/fGWkiVNR7onvbQH4kCdulKg8R644b/GiL2Pk9/5998aDFmIFhjj9+bgvIh
         bOidp61ZAEgWik9KTiDvNoC1C8GSoOU82nWZwNTahWkKU7Tz4mgrtSg9dndEXhMAbAGe
         qwS95ZrCXIL6xNdP1s7iYHN3iOSgdWWHgpNZAuaVZ2nIBI/hUyKjUWPu1ounhakWSddB
         n4bqtp6YMUYW9rTh3wJnvd35Am17AYbzgEOcOu0zkQiZe35zsg4FUeQvrBV5gSGSkPgx
         TWYg==
X-Forwarded-Encrypted: i=1; AL+hErH3xfGz7pR6QFqNfvaaUXAyWO7UFtmmvKwsr2fAZGOjxW0vmqoTa1Y0/wdGI6N6m01vQhpZrOMl/CCvNx8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/++YPi/aM1MbJLnL02Tk6AnirJ3KW/Nnv4V211U9/n7DdGBDsd
	QMPZ4rVEl3AcNep8I7hEgxuElVc79PZVnhhX1jry6H9X+/qX6NHgxZRuGTTEss7QnCc=
X-Gm-Gg: AYBFou0bErDBU5AkOXnNZZMgDlivtV0u08y7svAHpSPn2UntT5uNiq07tuqx0CI7st+
	D+rhQoMAmbFZOLVsSr4aZrfLm61wseYySQSxgoo6xLyw3bf+NBoNP5NbpJ+Fg3Q/CfPOo1imjOG
	1F9bv8EJ9nkyhmqcwCI/PlfVJRBh9AG4Pf6EDJQoA5wfPcQF57BAcdL6AUS7zSfDrGTRsIhcSI6
	Wf3U1JijM+O8q4SrFVqJGBFHDlfaDU2Znskth5o6NNVbcR9PuxFheWTrdYNUhlEbtTkTQRo38Qp
	pUmJdESb9vIDi+4jJnEnL19h0R7VXYRIiXzytyFTeeLEfvg5iF3THK/15LWN260TXkB11rskqzQ
	MwRznakywul/OwxVCH0vbx9lSKS4Z7E5IATzdFI0UmIk/QPFMMmycCjPMvd/u9IhiQ5AzmuEu7d
	QddeUAvdtwcRmSiUI8VJLusk1xZ9CSv5h5GXDrxwsXFam+8zIHArh9KaW1VUnuTlrxnr9teoirt
	fIMrwzZBCwPowB47rA5ksP0yGt2xHJCcCpthyDzJ6zABPUNhUJQhmOZrVlROAM3uBMtEEhhrIv9
	23pcHxHfKXFB0F0yUtovZ1pTsnobZTPsom6AqDzCwyxsBl05Ci8tm3/486mNcFmBWsRzDJh6ZF1
	fYlhyDI6XxS2u0mUlZQVZLNt/pwy2hu/FUwCcVEQtVoFMHB3WBtoSh/D9Vd8p8nSyAQJoKimaNI
	xkDPddc7W8Auywp+9Va4nfkkw=
X-Received: by 2002:a05:600c:b90:b0:4a3:5991:719 with SMTP id 5b1f17b1804b1-4ba02350f77mr10169475e9.31.1794264847422;
        Mon, 09 Nov 2026 14:54:07 -0800 (PST)
Received: from ADM-D9YH122JTV.home.lan (141-136-138-190.dsl.iskon.hr. [141.136.138.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0204342asm21435365e9.6.2026.11.09.14.54.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 14:54:06 -0800 (PST)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next v2 0/2] wifi: ath12k: PPDU stats user count fixes
Date: Mon,  9 Nov 2026 23:53:53 +0100
Message-ID: <20261109225355.23161-1-gsustek@gmail.com>
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

