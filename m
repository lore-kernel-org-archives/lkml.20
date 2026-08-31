Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAAA3E451A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170390; cv=none; b=KUmwTM1vB+vd96Fg5drdCGKz61oJgR469k1w85+fdrd/NeaMufIVQSXUVdQrWi7ie4G1XSaQ3UR0X8oEf3UrxLqLejwswpDgr0FyG/IjyZZOPi2ix6gIriRnaewUYPZF68a2fomkvxtlRX5n2dDoD5MLesW4zDFT5heMxC4efwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170390; c=relaxed/simple;
	bh=lKg7QWSQkaKWdhrt/8jU5HFtGKDAfOSrr1yOX51qu/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DLjz7CoSbujCNN1hh+FhYVLKZJZcqa+kq8FDQlB0dDzwppOH35E2F+i9AzO5QVJZw6qJI3oloxk4U3j4IEqhx4Dox3T7SUN1tNV+nV92pRSCFBuW8F3Uht6ux/e8QzCMQ2rvIOB4Jyk/dDrWV7J1OGhU6vaoPhcCaxNQBF8sUAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bnYTqLXW; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bnYTqLXW"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d560775ca2so22559175ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788170388; x=1788775188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+g24sLj9lBZO0873hmeHK2aiHPKKlVEYPXZG2TjfcJg=;
        b=bnYTqLXWwZI2aBS1Er2KsJK7pD1DHlD2vczNkNlliDYvx9v+S9WsdrzJ88h3Y/ZgDT
         IvwMiPGlAADNsHqgA0llcTccFIqjnyNJ8z4xlTRVB9Ko9RbFe0cqTGqvIoXT+kHPwCGe
         4PSY+RJWxjr9x1U9+lxyQRhDEuHvlWdWnDQBJqfcAMG/eVBJR6UT+Nxpdsqk5W0KcdGb
         fWEvH84Qs/okWOpa1B4wuohrCUOsSJ3DeZ9ySKxf6TK3tnfAd5XStWGjcZhr1P35FicA
         nkLKmFQ67Xuqp85OVfprJUhfK7tIUobPHZ6vNYPJnDYSnAtw3hC8spd/zNi3WyN7w8ZH
         EMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788170388; x=1788775188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+g24sLj9lBZO0873hmeHK2aiHPKKlVEYPXZG2TjfcJg=;
        b=j7V8GSRt09LogfMnNYvO4eUGefTV4T3X9WpEwTPx42UMOlZCY3iAq5oC199+p4gz3j
         gSPX/G/JnAMrv2sDBUyR5IdhYwG7OTftvqsSpyIdby4ltGr9EeaIlko446VBzGOFd5HV
         UmKxrxbds5ypH5SUGiTaI6RbO1kjnIeyCv7T1KXgDWhleInR8t4ufKwx2YZa5qs/1AAm
         a08Hy+9XJGemETbVca3JJcxckxMEgra4PupMxkyIkljqt/Upa/hDvmZrvxNLAx83OGVx
         1f04RLzZNIv3pR80INul1pkBA1hYbfKIXCw5JHngAvI9002GIJUvtoEhGsibZUR5vrW2
         +dgA==
X-Forwarded-Encrypted: i=1; AHgh+RpTAKTUXmehDsXMEOzq+I+3r89WM42b0RZ0mU2zZiajWqw5Vs5BmiiITCSQ+pG9AbJNhjCH08vTaWMA03c=@vger.kernel.org
X-Gm-Message-State: AFuF++kGGWjdNkufHrhqLQEq0idU/5RN01kQ0C0dNBfBFU9u0hk4Q0E7
	0NS2LonPi22d7GxuIUDv2MxZxgxQWcj7I+mUunB+MnW6foUNjVC3O1xq
X-Gm-Gg: AR+sD12H8uziPKla5o6Lzr3vZVrfsIcynIQeRvjeosfoPqp2kz1ggpq0EqQbKcBmMwU
	W3Ra0gr1zN9CcUppjED7oHvv9FaObYAMPbtJkgb/Mno5aTaH8gCT6/1NSCBtPgp3fWrmIn20g1h
	8ZDzP5bXy+w+zf9Ra38d/cD/snO4EhiRJNm58sVFWMqvQ7iVlJZ2RdGTq2Aq1s6HBdbSGAmvYbx
	m5YGlqaLtEj9ZstzUVF+YuI1m3+QGDq9K0UpC1LyAVaZ0sJTAl2tjtC6vR0K9DgJLTgNMIznqDb
	s6IOcOLY09aYDAcjGElkRtRtpm9qCT2Me8DjgblEm//VZ69eNtddb6D2mGGOgGTME1P+KMyLjlO
	uR9wVJqb8go9DrNCLxGCLgcSxo8q04gj0qYmMFLnfheUwfQWQDCn50ai9Sk4qSOLM6O5+Y6LpqO
	br5JK0pRtN1kVO3iiKKd1JAgs9JASVAXl5pO0/KO2N2Fex8d4dDZw/2ffNoSImQr3oyW/VuTDQD
	i/KJAevh9CnWSOqgVR9sMV4PZ08JBXlipIapgpJ6r4ICQbdh9fE1VNMgW7gycs35KeOgohuEqUD
	nm7qDYLV2Ni6rPG7sO8CkoGfJI/wurCpsyjnCXZ3NVKKfCq+8j1pov51bQm0AUghJKjLwuo/bkq
	KiupyPmzTqWhlhRJdwjXgQpCZ5Jcl1pDt+0gbOvageGLTa9A=
X-Received: by 2002:a17:902:ec82:b0:2d6:3c2f:6a4 with SMTP id d9443c01a7336-2d74df293c5mr315489125ad.13.1788170388180;
        Mon, 31 Aug 2026 02:59:48 -0700 (PDT)
Received: from localhost.localdomain ([101.251.7.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d759640becsm32270775ad.36.2026.08.31.02.59.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 31 Aug 2026 02:59:47 -0700 (PDT)
From: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	linux-kernel@vger.kernel.org,
	ali@iusegentoo.com,
	kiraank@gmail.com,
	kiran.k@intel.com,
	ravishankar.srivatsa@intel.com,
	amit.k.bag@intel.com,
	Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
Subject: [PATCH v3 3/3] Bluetooth: btintel: propagate version TLV parsing errors
Date: Mon, 31 Aug 2026 15:44:23 +0545
Message-ID: <20260831095923.18830-4-acharyalaxman8848@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260831095923.18830-1-acharyalaxman8848@gmail.com>
References: <20260814171503.42684-1-acharyalaxman8848@gmail.com>
 <20260831095923.18830-1-acharyalaxman8848@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

btintel_read_version_tlv() ignores the parser return value, so setup
continues with partially initialized version data after a malformed TLV
causes parsing to stop.

Return the parser error to the caller so an invalid response fails setup
instead of being treated as successful. Keep this behavioral change
separate from the bounds checks so it can be reverted independently if
an existing controller sends malformed data.

Signed-off-by: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
Reviewed-by: Ali Ahmet Memis <ali@iusegentoo.com>
---
 drivers/bluetooth/btintel.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btintel.c b/drivers/bluetooth/btintel.c
index 887170534..964d2de30 100644
--- a/drivers/bluetooth/btintel.c
+++ b/drivers/bluetooth/btintel.c
@@ -723,6 +723,7 @@ static int btintel_read_version_tlv(struct hci_dev *hdev,
 {
 	struct sk_buff *skb;
 	const u8 param[1] = { 0xFF };
+	int err;
 
 	if (!version)
 		return -EINVAL;
@@ -741,10 +742,10 @@ static int btintel_read_version_tlv(struct hci_dev *hdev,
 		return -EIO;
 	}
 
-	btintel_parse_version_tlv(hdev, version, skb);
+	err = btintel_parse_version_tlv(hdev, version, skb);
 
 	kfree_skb(skb);
-	return 0;
+	return err;
 }
 
 /* ------- REGMAP IBT SUPPORT ------- */
-- 
2.51.2

