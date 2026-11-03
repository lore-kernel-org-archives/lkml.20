Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713848;
	b=l4drapp8gfjWXU6mlJL8XJYC4HQzlg/AKai2hjNkmaaeDcuYkIuVT7odIY6l3aYKC8vh
	 I9ry/XtOXA0haA9rYFaLEFD8UGw0oAj7jn42EtGgi2yTCanr2JmV+amLD8XTAtPVe1XcZ
	 HDbMFuglzNBBdDWr822l5J8LTydmNBOB18ZMj06JB8mhq8Ejz+c1hloAec1F3vjTLYRel
	 xb7gf3+21P5nBpOWgtVXKsI/4fl7f1dDYni/RsdW/N9F7i7xOOWltP+hd2u5hX9wSKkGp
	 S5EGRYvHU8NcL5xX+ggTysdDUyUEFoN3aMb7w+rGbVAq/tAb6CBZato6OPauJXZ2rrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iz8THq3Ta5/c6lJGQpR1glZjC7mwlp4rMFLr7kynKic=;
	b=V6TfSoiC2gzKfwWtyyUXkm07/fL8PU31sp1F6cILNT4HXDpS6C94NdRsOBLkyZoxnI98
	 U01roWSrzZKsOiMiHP7aFqN1fReuJ6IjgbUmmhaZcuGzVkM2Nu8jyr4aMJlpE7mT7iz1e
	 X0Um8ZQ9sGHEOXmepMH4Xmtp8D65ncaTYyVmF4Sct+QwrUMy6k2b3ZEgThui5OiYgFxSs
	 ZVZlFM5bJGG1pwwLh9bqTZfiLQolVd7ioYMn/g0XdHa7ba2dB9TtQnwzsOAQV/cX/psht
	 Nv6k9fcpmKhXB06YZ6a/xQJo/h3yI7U+Q7cDo5ycp7fyRKNZ0y+BypEpQjiN6Gbf+pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m+cGWw8H;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C961A606D815
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:50:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C961A606D815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m+cGWw8H
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-14fc585291cso3308053c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793713847; x=1794318647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iz8THq3Ta5/c6lJGQpR1glZjC7mwlp4rMFLr7kynKic=;
        b=m+cGWw8HKJ8o6/4u8Q6E0ZLb/I3Bj5h5DWw7ICnAPKp4/EwJAuPzCkuy23H8DCc+dY
         +ND+UCXf6Isyw+r9M4VIyJd0A5TIxxqKpl5jqd7fHPQEa91T1xMUiSPei87Zz7ootcdQ
         lG9gX376h8ayU9xs+y0y9pq5tA6m824QkSwLuKCHYVAXxbjDHkpPFDX/Z5OZkFef4fUW
         GEyIa/KesY/b2Ohn15JyLZQdVnjWGaDWS2METlbt/acCnqqCGhZdAshzTbkNqTVCWiLK
         v+2b2rxqZiWPFWNMRMzUxzqEmT8lBACT2/nkzmcrejuwEcHIoV/92SB3+Bn0oQZ4JQIw
         XQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713847; x=1794318647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iz8THq3Ta5/c6lJGQpR1glZjC7mwlp4rMFLr7kynKic=;
        b=khMC7BbGWECb4R8YXnMVbp/SFKTZnPC2prPpBqDK2nxgrXPjvcUcd5pkiQR5krSqZk
         dP30FoqxhHeWDx/Jd0ibXcfBEmGfu4z1H3Xg4l0gzksrgVp35ArtAiCILc+jyTv9LdHN
         G/0apUftcDCbiFwtsUWRlpm83hCdUBvPADr/CLy/3WWE4al8riPL0GzIiZ3XA0Noh0Qp
         bQMoVqfKeKQor8yuqinCsDQSkUWttrxiFt9TC9jIDdq9gV9SPnOEh4+NDLKqy+LgQZP8
         cT44Ibn29ZvTLWl00op4JbloOCaN6mWRZkg4yDqlSO6pkPkTC4qD8WdL1WmGT/s/s456
         bR2w==
X-Forwarded-Encrypted: i=1; AKwUvBwASgVRVzUeEuxqdrFGo+kiB9W7/8LfSdtqSPajpIu2OvCSORuzxy2067BXm8QrCE5e9Ow84Z19vEXp3Vk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XIxWjGe3M7Z7Ywte3Am/o9D5GGIhTY5kPG/UNaxdgjKHcdrpQ
	oZvHUf0zgazMdJTMJWz7oQxz0oLY9sTe3uzSHRpfAFuB4+yGeFwqcyCV
X-Gm-Gg: AYBFou2b9BxvkJ+b4ATacIOM8OJmmOw1T6ph0TNcBcJkMVQU2gjaBTE+Y69/hHVEH8A
	y1l/12l2FCJ4aRdJM+3czOUl1Qg+0LK4ltEhdImDXE7agDdDe0FAVuVJxIYTgfsWc2/PejXp7v7
	cACigDezKFaivo43q+xvnAcR7PjmnbvQrD84BTlMqZVtGb5tlN6uqJR4DwA7AbCX+mMnI/Ysz85
	RtGHm7+VfEg7CHNZn0a9AppPAXKm0mjPaSAmsRz35Z01/snurodiTCd1GR/i8GGUSzL/3fL0pEb
	x7hlQ8sL9bPm+8N3siYa0UXiiolGV0Lx10dno/pUOYXq4rFKbP+nTCu685Z6GvaHmeOBT6LX1LW
	jaqJ482OPtfweX3wpsK9byX71cH91vhrX0j4fF9HjwQvyW4P/QnpRyE2k2zgAMi6JMZPu5DvhBq
	tmQYrjM8w8ipLkJKkTPR+rsdF2OYC2/qQG5KexAdSMAgc6egtB1oXJuSeFZuYxa93aXcVJr34SO
	8bFmPiN6UbBnbD6gIDMYx6bSM96AU+sCV66olBIcKtA16v/kj3Qpt67RC1TAwuDO8Oroe8r+WcQ
	eQSei4zlVaJKSVhJCOLfOZrnf1dwLWL7PmJ9wWBAsS+voYX7ZcXgRQUx10b82HA3fg==
X-Received: by 2002:a05:7022:ef12:b0:14d:ef19:246f with SMTP id a92af1059eb24-1ac5f36d5cbmr21734399c88.45.1793713846762;
        Tue, 03 Nov 2026 05:50:46 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac0e738445sm44055965c88.0.2026.11.03.05.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:50:46 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: neil.armstrong@linaro.org,
	dmitry.baryshkov@oss.qualcomm.com,
	tvlad744@gmail.com,
	linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] usb: typec: ucsi: Leave the mux to the altmode driver for alt mode partners
Date: Tue,  3 Nov 2026 22:50:46 +0900
Message-ID: <20261103135046.1654-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
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

Commit 25a2bc21c863 ("usb: typec: ucsi: call typec_set_mode on
non-altmode partner change") set TYPEC_STATE_USB only when the partner
flags were exactly USB, so that the altmode drivers set up the
switches, muxes and retimers for alt mode partners. Commit 226ff2e681d0
("usb: typec: ucsi: Convert connector specific commands to bitmaps")
turned that into a test of the USB bit alone, so a partner that
reports both USB and alt mode now gets TYPEC_STATE_USB as well.

On pmic_glink platforms the altmode driver programs the same mux chain,
and the two notifications are not ordered. When the UCSI connector
change comes last, an FSA4480 switches the SBU lines off, the
DisplayPort AUX channel stops working and the sink is never detected.
On the Lenovo Y700 Gen 5 (TB323FU, Kaanapali) this happens when a
DisplayPort sink is plugged in during system suspend.

Set TYPEC_STATE_USB only when the partner does not report alt mode.
USB4 partners keep TYPEC_STATE_USB, as they do now.

Fixes: 226ff2e681d0 ("usb: typec: ucsi: Convert connector specific commands to bitmaps")
Cc: stable@vger.kernel.org
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 2f9adf4f8bde..395554ba0312 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1356,7 +1356,8 @@ static void ucsi_partner_change(struct ucsi_connector *con)
 			typec_set_mode(con->port, TYPEC_MODE_AUDIO);
 			break;
 		default:
-			if (UCSI_CONSTAT(con, PARTNER_FLAG_USB))
+			if (UCSI_CONSTAT(con, PARTNER_FLAG_USB) &&
+			    !UCSI_CONSTAT(con, PARTNER_FLAG_ALT_MODE))
 				typec_set_mode(con->port, TYPEC_STATE_USB);
 		}
 

base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
-- 
2.43.0

