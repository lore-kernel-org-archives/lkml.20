Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00190415B92
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789488226; cv=none; b=MIEFHWOgFlluhEweQ2ZdTJtNIuTztWxibp4/310ulzQfL/z0spx/3gGN55OGcS5mk47u0hz6JIjliojv0q0j4AAyATH01XwAN+laRjWNFhHSSM0irG/QsbcB26Zo7qnSHDGWiH239mHWH2vGM+YsU3/taYmLWdBZqqmTvNAsOOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789488226; c=relaxed/simple;
	bh=akz6aUJrU9noL7BHsmdBLUbZm7ypb5K09r+URlU8H/U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LHejehyPTBjilqe0AWukFcuMFYRiY9hFc2vkZNtWlijLMg6Q+Pu0v0LI202mlf64LXPdD0+FFRPv61L6zJstHfnoAArIy0WgnORuUsbHunFhRnIaRX21WysrHPuisgE3tzwhtzv5HTRDR2qy1vi0u2GuvklQ9QBIYG1rB89ulvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UKlTD2QQ; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UKlTD2QQ"
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-78564421fdbso1000526137.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789488223; x=1790093023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9GyNMK0fri713TgvmOq1tEC71eXmhUWip0yVYKcndwI=;
        b=UKlTD2QQWoHcDSAKORijE3T5SpP2FC8yLQKha3P6ZMeIkiesNHf2uohZzct0ioprHU
         wZRj9C/Bbp+824m3Vd7tvtrl9pKlfK7+HyN01c9TvgPYcB06pEjeshEPW/yYHVF+Syi9
         SQ6zFZ/5pnJOvqiFNoSVfSap3U6ZnqkuId4eVvzNFspVDPfo37dG3cQCcBEeq2rJ9aKb
         5wIu4y0f2qssdNG7sX/AnBcfemh4FvBcc7A2wUHJO6RYPzIQI1QlNACaSZ708Q8psEYC
         +rvZ+n4t5j7aaX8bF92ieZBWR3qTyyMecE2ESSWI5koc3aYumm8UjHpiQcI7xAk0siVk
         3Vww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789488223; x=1790093023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9GyNMK0fri713TgvmOq1tEC71eXmhUWip0yVYKcndwI=;
        b=gWmvSa94hfyq59ogpUS18qo5MA+uC3zHWSlDVW+Nh4n26KqjYsiRGUONUxkFspi2hu
         OLp45zlHWRRt5aOj3w5Kl8fERzYgjHe8HDE6TEzdn9xD0+Yp3XnvY8DiJWwSI9rMh2qq
         kc5dvLpPJA/EfXAPfRCFSAx5zhxZSCfaBYUCIGDq+FnE2oVTXPEe0avqNbTbZOk7TmLx
         TEuyljl9NOp8iZ1/3elJUXDfbtYrs4aCWso9mhYqc2OPswshdvovFaSZXusG4W0wZ3dl
         NdKwgdJzFEHCsdBoNWO6c7lSRJqdOo2V1dmb7Co43opyTpu8DJ58FuwFOWv74jimJldO
         Pqkg==
X-Forwarded-Encrypted: i=1; AKwUvBx6ArDe6D7MlzVwlKcH6W2M9aaPk9OwqIdH1kmqwEEOfR2rkUwjsenBSUQ8DSL85Kr4jmT4IVR+K6yGX2A=@vger.kernel.org
X-Gm-Message-State: AFuF++kr1Ke9CLQD78KYgSLSZBTig4C0EvBHTnviIB+5tsNSxXYrchCu
	//YiGOLAEcHMeDDpqhiHg4LopR8kBuVJPsXnoSLjlhC+kQSJVYzb5Chlafj4FqKsj7M=
X-Gm-Gg: AYBFou3PzR1kyxYpuTvgFlGcPQVJJw034svjgiLlUwA5XAzT6IWvlOs0q8zZuEMF8n9
	zjZrZzZHxjorrnvZr7rtNvUOb+C+qKnJiHD8WLMSiWsmsnUDvkBhI61S0EXJcIlBkWmCLD600r+
	B0I042A6JnYkItMzy++QrJOgenX4U2vsgLszI8gJ8THZIIBsuPZO0tIjnWjaF4aQpeEE0CglzZQ
	NhyFdU9vn3WOlZ9A4gUHVp/qFupaPHZtLZnTLiKCg5ZFjwhoCG3yCMzlqxtQFXQnW5uopDyh33X
	QhOBcRpmlsyytMWSWq3lxg3iII+z2arLEtfFSsOWFvd40Kzh/sdo2gsVIvPzV9+P1+R7JRfqZTE
	ZVJTqTEJlNiPIAo4UjJnZSJC/LmENl5ot+wibGqp1OgTiFVXq9OrOx5cbHejhwfTF23KmOfUoTU
	0artoIqDnDuwT3IgU56SSvh1O0q3xPCFFjpyVs3uFL+mqAG3AJqHJgSe+ewnRzHWBa
X-Received: by 2002:a05:6102:a146:b0:79b:b389:d6db with SMTP id ada2fe7eead31-79bb3a86689mr2219117137.2.1789488223464;
        Tue, 15 Sep 2026 09:03:43 -0700 (PDT)
Received: from beelink.. ([187.13.206.89])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-982b9fac504sm15052563241.8.2026.09.15.09.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:03:43 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH] Bluetooth: ISO: balance the parent hold in hci_bind_bis()
Date: Tue, 15 Sep 2026 13:03:32 -0300
Message-ID: <20260915160332.3107274-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hci_conn_link() takes a lifetime reference to its parent with
hci_conn_get(), but only takes an operational hold on the child.
hci_conn_unlink() later balances both a hold and a reference on the
parent.

The SCO and CIS paths pass a parent acquired from a connect helper, so
it already has a hold. For an additional BIS, hci_bind_bis() obtains the
parent from hci_conn_hash_lookup_big(), which returns a bare pointer.
Unlinking the child then drops the parent's existing hold and can
schedule it for disconnection while its socket is still using it.

Take a hold on the parent before linking it and drop that hold if linking
fails. A successful link transfers the hold to hci_conn_unlink().

Fixes: fa224d0c094a ("Bluetooth: ISO: Reassociate a socket with an active BIS")
Cc: stable@vger.kernel.org
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 net/bluetooth/hci_conn.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
index b1f911fd4..09a6e0240 100644
--- a/net/bluetooth/hci_conn.c
+++ b/net/bluetooth/hci_conn.c
@@ -2342,10 +2342,13 @@ struct hci_conn *hci_bind_bis(struct hci_dev *hdev, bdaddr_t *dst, __u8 sid,
 	parent = hci_conn_hash_lookup_big(hdev,
 					  conn->iso_qos.bcast.big);
 	if (parent && parent != conn) {
+		hci_conn_hold(parent);
 		link = hci_conn_link(parent, conn);
 		hci_conn_drop(conn);
-		if (!link)
+		if (!link) {
+			hci_conn_drop(parent);
 			return ERR_PTR(-ENOLINK);
+		}
 	}
 
 	return conn;
-- 
2.43.0

