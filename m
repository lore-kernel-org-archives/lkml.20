Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794743770;
	b=qDM2c6KBeV0IAxb6dwT5GGr2sEhD8qAU1SjUE2pQJNFqt5iqUmgGKhkxpHiEL0/SzVQ5
	 XKVjJEZVXWw1bIw/4erMcJoDnqBB2rRTVdiDNY9ob9dAOegZLXB9tCsFl+BDMxIhAcQyZ
	 QI3gq8xosK9RGvM9soUXqga+uRkq9q/1806951UkCCD9hBZUFfWh+d5B03i9EJceXqGJT
	 6vZq8ycip2JRJnY4sr5LB0xF/h3IUZxk9KsgyxdXgX/CffR7DLkif4l+V/7FSc6TTZfVY
	 45Vg/DwPDtrnuVbmQVzH0ZmMNtB3z0NJVdZb/OY6FjchH5ty+Q/VVwUKjGZpRX4tIEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794743770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=a5UPKbjeaPw7wY9xTmJ9YNuUlgr3mb8CPRr9BZb3ueU=;
	b=aXICkadJAhxwC21ULYTsHu2O2SSQZf78ciuL5HCR8daz8q1Zv3JSdP8yLK6M0MpOzTiL
	 OtnCAVM96VRy2jry1/K/8RcEhL2/ut8jc74t33+XM1jzxW7g+zQ6atc8nhMEjXcVg4RZu
	 kcht6lT4QfIt1aXztSM+5xIU0R7qf352UMvevuqT5k3Tg3Iw3lkz4ppfPJbIshFe9QJDx
	 3QMKdA2/V96+lYMt3yhz+sOOZpe7hDXT7wSgxmBe87TYl9YA6XHD3GoNiebRw2FbGdZVH
	 D9AAICRfGb07xCxkESxHGEfhfj8X+AcVBUUwCCFzCdDIECtGHdMbHGxHnQkh/OxFc2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tz4TNrH0;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CE6606A329
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 11:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5CE6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tz4TNrH0
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso2158954a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 03:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794743769; x=1795348569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a5UPKbjeaPw7wY9xTmJ9YNuUlgr3mb8CPRr9BZb3ueU=;
        b=Tz4TNrH0Yx0Pyd4OwiFfRzsZ7irlGRKKhBrKALoU5QPFaDkTtTriYP1WDKSh2Yd7my
         8VKvnk0bK8yjdN1SRukUaaIDzZZFZ5YOy5XfPsZ8wjlC69QfE+QGeH4Cn9KTiV9fNPII
         SxTCEPSM7FEeM46qWdD/OA05OdcjBVu23BWSl+KNUP7KO7VoBlOiqA6ojpfRb32sv9cC
         px5xQKq8e1+NCAKV5oIperMHAaLk7ma/8PRR08KRk+tpASXLsB59FBS4L1zMaCNYqu3r
         qHo04TFSoeQi9gFROKY1wgb9xh3UdzxEcRmAwVRwUFck+psQnFu7jBfa7G9hzjxz19YY
         5IHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794743769; x=1795348569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a5UPKbjeaPw7wY9xTmJ9YNuUlgr3mb8CPRr9BZb3ueU=;
        b=sraukHJlY4O/d6U0UJt0+EZZeMEu0qmDuIgIf1NrxYuQtdZe2Lgh/oVn/lfZzccuv8
         1C8ufJOthPbDyQn4FzcfZxAK0HFeW/D2TeqddU5SLPhP3TzXpU7L9R1PJwuPbBi+lLwP
         CuKh6dz+MAJ9Xor5as28dPU2ss1XqvHk6u/eFL9+xZGt11JoChOMRrHdDbRSwwceQEq6
         +I3KhV/17YshQ+TZ3p7JC+qRiaBAMjaBObOHQ74UJNioWC9Ma47miNyRP57oa0EE8jhV
         KTFAJtXHomEcKsG1d197SAboiD2+5IM+X5gVPihHhlovXWYHNHAzfVqaI2PLHHPlWNoY
         zrZA==
X-Forwarded-Encrypted: i=1; AL+hErErtSzzrTCkTBMtS/qB99AsJv3vgKDMIzYVV7D1+4zXUlouUY1MR3bzRJg6WpO+eSHF4SJLlyrERj09q6g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uWFB3/ZI7hPL48Gyl4WSHoijzG8qzSfN2Zfgp2N+arWCdYXQK
	M9eToPqgUoN4LjIfYZiYP22xsMSFmevXAyMHNoXv6Bv9dfnJwwGUYmK5
X-Gm-Gg: AYBFou3IATLh+xtz7elqPCRgedqfW4GHRNgfLEjvkiErQ4NeIC60t7xkpQUfFK5CwSn
	6WIm1ts6Oxq015PJptc/mkLPkM/zer77Gts0Z8VSnNvNf6DFcO5TuuZv02tFlMhpWfRy4X74o9M
	xIH5ar+B+oh3db50T5EA2bw7ELtdWxsYFao4frT0a18yn1dgaGcuei+8j2tYd4m7RSNPFEAE7pF
	G/y39wLqNFDGdRoKG1pZQxSP4frMNA3N+bEDrjb+fQkB6NVJAghdMSMb4X3WU8H9sLqAMn7ZVIo
	yj6oYfMdTzadiQN620VevtkWcCCH/SsyFDceJmQTrkAEYbDePzEfSo6L+xmsPWMlv1a993jNbNE
	BGfsj7CaKqMc0Jo1KF/qcwDWANR7Bng4m+opD1TapkZuUKWI8pXomGp1LSaB+pqwffxTix6v44b
	7jSU9CmZ/DchQjLdmgfVZxLSUy5ptOex03LA0dWXCBQNoGrZBGOwaHOeus2q6l8UhXYS0crNPHr
	PlLoD7fM4Kjh2E4QTxL/zsaxvVbm9mtLyeqlaoKPGxgdhNTBGflmyv7u+OPsE08Z0jrdWRCN3SQ
	8/vX+bYiUJqElR1rZacfxElMUeBiQWna4jAsQGAKYdCyiAHW0lEH3swY9IYM/1iTil31F5MCHXw
	OB8UOYIZr79SydJDL1cHMu8T/aByFF3fn3EJzTgyfprc=
X-Received: by 2002:a17:90b:1b02:b0:3a4:b509:88bd with SMTP id 98e67ed59e1d1-3b1b087c16emr5013019a91.2.1794743769234;
        Sun, 15 Nov 2026 03:56:09 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:5ade:5fb:5602:326b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3ac294bsm5853901a91.2.2026.11.15.03.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 03:56:08 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH rtw-next v4 2/7] wifi: rtw88: skip the dynamic CSI rate without a cfg_csi_rate op
Date: Sun, 15 Nov 2026 19:43:28 +0800
Message-ID: <20261115114336.1739863-3-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115114336.1739863-1-hjf3108@gmail.com>
References: <20261115114336.1739863-1-hjf3108@gmail.com>
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

rtw_dynamic_csi_rate() runs from the watchdog for each vif that is a
SU or MU beamformee. new_csi_rate_idx is only written by the
cfg_csi_rate chip op, so on a chip without that op such as 88xxa,
an uninitialized value is compared with cur_csi_rpt_rate.

Return early when the chip has no cfg_csi_rate op.

Suggested-by: Luka Gejak <luka.gejak@linux.dev>
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index e243738809..a8a603aaee 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -174,6 +174,9 @@ static void rtw_dynamic_csi_rate(struct rtw_dev *rtwdev, struct rtw_vif *rtwvif)
 	u8 fix_rate_enable = 0;
 	u8 new_csi_rate_idx;
 
+	if (!rtwdev->chip->ops->cfg_csi_rate)
+		return;
+
 	if (rtwvif->bfee.role != RTW_BFEE_SU &&
 	    rtwvif->bfee.role != RTW_BFEE_MU)
 		return;
-- 
2.53.0

