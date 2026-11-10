Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285009;
	b=lWfsFm2mI9ADVqoVN9YTsSUkJwC26QCY0hRrvw9l0Vj8FXrXkPSEWoQP4oUYI1TIZ0kA
	 paI6HtEpfYnJKOVW/qM08Nmx5RbqyypwoIrXm7JRsyFYyrWb15FzRuGOszY7de/9GCuXc
	 QN1FLO1lkfUPHaMMy/fQNWNF9FTWdLXLtab6rjVOC2kcfeXchwJpoPVw84co9M7Z2+l1C
	 nqqJrwtm9o/W8KewCzeoZNiMLcPc0IaYwzoDkJnHDdx+gmFiglbK0Wgx7/JbuSYikrt5d
	 93S3ZDWjAuTQZY9MJn8HCL0o+9TQrjhU4HWCakUk/dZHboXTheFYZcs5TQzkvqRPF1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Mc6rPhZtcy7thF6jBsEppMpKqkoctKS795gM28YkdhA=;
	b=a3Z9w9jqmJ9x5Q2tIKN1TqLnpkvCy4ryBn3f0i+PO+Ad8viUcPKqyq3JMi6HNAOgNXuH
	 /YTrRLaK3QWGiReFdXSrKmK5Wz53YpTJlPklA5FjsMMTmBdCSrM2xMhN+zd4D8+TCJvUd
	 Mg9qF4qBqEmqdXAJJxlVLPvgtce05CoBOJ/KQdhm0WNNV9dwgP6ShPToQ+kqz+Gtbf6rz
	 SmbbK8V9Hlz/YbX35kXVgc5KjDXKGrmuwrWTTW6GJDzX/wvH6iCpdXVpg/+elUlPshiTu
	 yEPV7buC+yonJvmEO2p/tVHgD/t5fAJN6nwb7GtUaoH16hVCn0qtXNZXtpJXYM5VMxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tw2goD4R;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298E360A2601
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:30:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 298E360A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tw2goD4R
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93f1e5d7450so154846385a.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794285008; x=1794889808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mc6rPhZtcy7thF6jBsEppMpKqkoctKS795gM28YkdhA=;
        b=tw2goD4RZ/2tu7CCKcYLAvxfmyz4f4QYQ8A7OsaW1utqAFZAgbziDtsVqBNMvlpGET
         Te/vSDKbzo7q34BTmS9Pv5r4ds6z8orc8yvXnA6ne9M0GHXvP2jb9nbUY55IHFTrT7aH
         Wq3yVa1K4rG+nWmTA2nXQQfVW/rBtVkwjcx1INqPFxby1BShW16l4Z1Q7TGDYB2rfK1Q
         waw083QR7XlXSD5eolV1pZnKaOjXibjWhvN8JN0q/bZ6GgIh0zQgJmKQc9/26bM9rx35
         1HMbOchXb288maFkZD7b1GCiD+a3RLsvXYpMVV0IhUZevw2CPeddi2Ya68FZnklwUmc7
         PMig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285008; x=1794889808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mc6rPhZtcy7thF6jBsEppMpKqkoctKS795gM28YkdhA=;
        b=zaTdhcDlNzXpkECTGHyAL4B7zGXrdE7FkxqLOvGSQkT0DQJpUEmpv+MGboxyL5+0j9
         aUTvn/FeSTBdKCpB+O0lbX7f08k1bKVQ/gJvdAZueXBAEAMoRyfffzt4a401pXNgk3VQ
         +bimTnQAjrCn2lOhMVbstZeNTiPGnhGQfwOjKNVhhJjzMvajvyObKdIpPQks8wM8heHA
         d0U088R/kqWtHWq+UzAYZoaITdHNkzfvd7nd3Yv8q1oXA3x++47FDQ8eaMi+WzgP1vxS
         B+qqcMX/j4xvEbkUB7UeuiBqMmznh2ctG6ZpxO9pc2XBZUOtS7o7Pg4cUWnT49+IKqTW
         dGLg==
X-Forwarded-Encrypted: i=1; AL+hErFfrxOgwi8P+/re6XByW9Q5UFVv8s4h/cQ1CULNAT/ebYBND3mfQjfwwLEcJClkntf9xUrPDTt1RXAaOdQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z98vavNBUs0bwo3fFL2gWPsUCpmtepbRhC5/wZY9e2CqWz561oL
	e+vFVypey6mYAwAu+5f0cd4I9UhGanim+aVazNUi0G893+82ar9qHPE=
X-Gm-Gg: AYBFou3orE81Xouegr+ZefGdT/wOcLk4GVXjhR4frAIdYv3/8A8j6S6bYuTyz/e4XJV
	L+EDvJ1UHnHl5KwCkqojIZBpg4QzU/MHV/A2IVx+6EFG5fxW4swIWvva+dT9RL7Ep4TlNyxW77H
	ZqH4R9dFxk6XOH33CCZ1wPcG+Gy6RzH342U47EBi6KeRLvryygPasDhRANWuCCKDLwWMsJYrGNy
	u5SLK7EYwtsOBXL1IMZJvG5oJVejCubfZ5L+6eykTwyPydYtxjep0FhsG68RNmgKIAG2q/ltNGw
	RtqIBHdtZF8qrjcmo741fBk110g/D9AU76sONnyTkBmSdkDuKliEATbo1+HBEjSL9Kvt0TV9dC1
	JHlSAA1jxK9u6FeF5dkGQ+Ji1to33N3PfzFSrA0LeMG9dKgBNBDN8vaXJr6MOf80GbvoGgtb5nN
	Uw5p0913eqfKN48xMpge0g72QTAX3T4WFeza2Kz8SGM/AmoRccqwfvxRY7FkGk9YcrS1llEyGNo
	Frj8rUD7TrtyiIK1RwfE4ksBzZW3L2f+tldFRi2l/T5Fr2M+i5rXIXedDDMapCiDHyWTIAg8LVJ
	/PdzcGbLFwqsiq4ni2azfksytJ1HkapkYQm1S4GnFeBWMKD3Jp9+45TtNs5JmtkWWVPtjadzgk3
	13E2CgefV6pLPw4dRkVTmAfRyV5nUvF6sCsLnvCuUBvmntT4cL7DuqhvxOZegdOQT
X-Received: by 2002:a05:620a:6496:b0:945:d852:1618 with SMTP id af79cd13be357-9479f3eda61mr223680085a.70.1794285008081;
        Mon, 09 Nov 2026 20:30:08 -0800 (PST)
Received: from localhost.localdomain ([104.39.152.7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm134917585a.10.2026.11.09.20.30.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 20:30:07 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH net] net: wwan: mhi_wwan_mbim: disable rx_refill work on removal
Date: Mon,  9 Nov 2026 23:30:06 -0500
Message-ID: <20261110043006.56681-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
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

mhi_mbim_remove() cancels rx_refill before wwan_unregister_ops()
removes the links. Bringing a link up in between calls mhi_mbim_ndo_open()
and queues the work again. With the MHI channels already reset, the
work cannot refill RX buffers and keeps re-arming itself, eventually
running after devres frees the context.

Use disable_delayed_work_sync() to drain the work and reject later
queueing. Probe initializes fresh work on rebind.

Found by a static analysis tool under development.

Fixes: aa730a9905b7 ("net: wwan: Add MHI MBIM network driver")
Cc: stable@vger.kernel.org # v6.10+
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---

diff --git a/drivers/net/wwan/mhi_wwan_mbim.c b/drivers/net/wwan/mhi_wwan_mbim.c
index 336f89756f10..3b6b0066f673 100644
--- a/drivers/net/wwan/mhi_wwan_mbim.c
+++ b/drivers/net/wwan/mhi_wwan_mbim.c
@@ -650,7 +650,7 @@ static void mhi_mbim_remove(struct mhi_device *mhi_dev)
 	struct mhi_controller *cntrl = mhi_dev->mhi_cntrl;
 
 	mhi_unprepare_from_transfer(mhi_dev);
-	cancel_delayed_work_sync(&mbim->rx_refill);
+	disable_delayed_work_sync(&mbim->rx_refill);
 	wwan_unregister_ops(&cntrl->mhi_dev->dev);
 	kfree_skb(mbim->skbagg_head);
 	dev_set_drvdata(&mhi_dev->dev, NULL);

base-commit: 0edbc945eb9edd0086f25b151a79cfe4adc0dfa8
-- 
2.43.0

