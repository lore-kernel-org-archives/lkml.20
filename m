Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794753477;
	b=YC1m1POSsXv9T2CqQBJzazvEKH8w3S5RD87KZ0cJNLymvToTzrC/rNItw4/G/I0MRGia
	 bfQZvkKXnOtf89mnd36n58YTXRA7oLeH1/qXVxB6i46m4KDJxG5k8psaYbYJioPbM3gUj
	 Pxc+WUcps+QJCgSu3AArt5/7Xk94s18v2yL2NCdqdjghcehr5+btNr6n9b5J483nJnz9K
	 TOoM3OqCdo7SjDfqK1IlQuu8JfIt0WwTbaVlPWfpZ11hEFfflfYJqtubqvQpXHh38q9ok
	 noO/MN4bpMSKNu1AqdeiDJbIRnQbSFHqyL/8Y2ZnYNZsmx0jSKJ2mpL/CWS959+p27Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794753477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AvIS5md/ELelQNeUHVBEavNxoknEQCRB1v/ojNbvo5Y=;
	b=oSGZf0U0s3XVgAr/2XsmmI/knCtuoI1lG08KR7Lvpfbg2WfMXhUuH5TKSYOCQo2L9GoL
	 Bu8OLcbsXV5TrUWUk1Em1ddgfF1pfCcUU9si9tC1UgVUXJePzYlAx6jN4VlSk88NaoxlB
	 hg1rBaqWDEk/XT/1RKpnKLHg4V+B0L0MZCJG7VSl+K3E2yJZP7lNfbOzfE6TBlLgZigvt
	 vWMW6kpnVY4+MBGzGwFBSEWi8athMYf81qE8XADl2eHrT6K48aF8lIrb5fcwAwudoH2rC
	 5O2+JBYm7/nSiHLYWzL6qQ3A+VYVXmBqwKqGRLHk03GOnB+7XFnx25aZsegsNYi8Q8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wgMM1oCm;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38084606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:37:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38084606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wgMM1oCm
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so33894225e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794753475; x=1795358275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AvIS5md/ELelQNeUHVBEavNxoknEQCRB1v/ojNbvo5Y=;
        b=wgMM1oCm19H9nkfpQbqXJxER76d+59wyUvMYQQhTVXQpWtQ5/IJums4X9JieCNAkoa
         uS4TvuU6cFBvxMyzTZMkJYuYCml8vOkWVNUNobgQlAhpln0BktuIvlqeM8yjdyEneZAN
         FxmMgwOB28PW+97NS0GJbnJJ2gqsQF+QBmow96yCpnSgNylEfzANlhJusG2LWYZXpjkT
         XC22o4ftVL0r26urVxpoQ3FuDKXFnxY8JmCue7hV9D4bDKR2Mo2iRts2nrQky5a/kt4O
         8VXHZfE2tDqN06BXri9YI62j2zNMQheowcBlAVZF/822McJEXAjbHbQ1ebGPAul3q4So
         1mwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794753475; x=1795358275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AvIS5md/ELelQNeUHVBEavNxoknEQCRB1v/ojNbvo5Y=;
        b=y5sQK7E41ya1dxC798ewdyrfYPd3P9nZqRg3yy3eLsjxNWQtfXPZec6/mZa7i/1ZAx
         6VE4oCAWAVYntgU6+2sg2gnn8ocvCBDxE9trEHXPukeqTbF+wnZdUb66qK6obXFYDgT+
         t+mBrygigi0XAdntxGRXx1IMCU78YkRLmhakL1ZxI+CWNBDNx9xyut/qxXHBBzIAVzs/
         MNSWybu6BPm5FQ3DNE0Kh+7nD4B44c3Vg2ZvZjbTAct0IfwfEs8EFik6xSFgATNi0sy/
         DItdjlz+8CHZ4Mee0RRjPK5zsBHrqDXG55vYsww9ScD47HbPNObDFUwufQ5V2KGyd8f1
         S+Zw==
X-Forwarded-Encrypted: i=1; AL+hErFDk9IVbtMwmWtAulNdLDevRxGKFakP5ExeV7tgfAYWqonLBPq1is5Wms3eru02e6ljh45gEv4eYhZwuTY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WG1omIUPOML31wx206+9WCcfRj14spfImTPwsQ5xFaLfag5im
	Nu5cup4z+8f53PHN5N0sbXJuHHu6j00l5qNtzLAnBqiiFzUkwByN/OyUqswaP8RAIPpHhQ==
X-Gm-Gg: AYBFou1JcMILag7/metuR86970NsqmoBj7Vy2ofIMpaqnra15MbNO85urtyhrIdL96m
	zLSWI3oGhmtgIGGxoOoJgpdnjYGE5HT/3raluqTrwqwuRsWkIcbuPZUu9zdoYZElHWZQrVITAhU
	IBJ3iPT7HwTawRDy3+YlhL3bhlQxYOCCENwdVEFxVLhir1K+20hYqdx06hWfwN9qpaMiuKtHaqz
	DLfzcWmyIQS2FOMfT14FrX4wUYxT4MrxaayKz87xKfVevQ8auOZY1FWbWibxAYcaxF0u1IpHb/R
	ZopZ/G7ocaIr8CZLeFx5LEUASkObHehOhi1fUOx4ckANzJrQHHSqbWonmFWtSe36Yi4cYI/qAim
	AY/YRx/geE78zi4ASEZkn5DmMPt5eel3gwT0zcj69dvpzFofZgGqEc5H4n+tNQMhIVh+0RTkSv/
	579qWwInc6kEmVODwgnlCJiOxIF73STJzMw3dNiUtS4o63DSb9LDp1CsFLtzTe4rh1hCv44/dEe
	x8B8TtGi94+7oari8JpsUU7eBMIAmV7oK8fH/RnBAIQsHz9X4nIp255QYkkTDJruhBWdPm32qW8
	Ypv6rhqNKF2cACIo3qd8W23AaG9s7NLk9245uk6PXzbRCpEcvNOToxXbVryN4+j83MHIpWQdqOE
	uCzbzo+l6n79DhlQ=
X-Received: by 2002:a05:600c:4e0d:b0:4bb:69b2:d3df with SMTP id 5b1f17b1804b1-4bb69b2d82fmr44982955e9.25.1794753475500;
        Sun, 15 Nov 2026 06:37:55 -0800 (PST)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ac1159sm196174025e9.4.2026.11.15.06.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 06:37:54 -0800 (PST)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] hwmon: (asus-ec-sensors) add ROG CROSSHAIR X870E DARK HERO
Date: Sun, 15 Nov 2026 15:25:39 +0100
Message-ID: <20261115143708.492883-3-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115143708.492883-1-eugene.shalygin@gmail.com>
References: <20261115143708.492883-1-eugene.shalygin@gmail.com>
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

Add ROG CROSSHAIR X870E DARK HERO board, which provides the same sensors
as the non-DARK version.

Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst | 1 +
 drivers/hwmon/asus-ec-sensors.c         | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index b22bd5c8f491..b3a061bd10db 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -28,6 +28,7 @@ Supported boards:
  * ROG CROSSHAIR X670E EXTREME
  * ROG CROSSHAIR X670E HERO
  * ROG CROSSHAIR X670E GENE
+ * ROG CROSSHAIR X870E DARK HERO
  * ROG CROSSHAIR X870E HERO
  * ROG MAXIMUS X HERO
  * ROG MAXIMUS XI HERO
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 6c4565b0ce2f..d86f3614d557 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -991,6 +991,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_crosshair_x670e_gene),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG CROSSHAIR X670E HERO",
 					&board_info_crosshair_x670e_hero),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG CROSSHAIR X870E DARK HERO",
+					&board_info_crosshair_x870e_hero),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG CROSSHAIR X870E HERO",
 					&board_info_crosshair_x870e_hero),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG MAXIMUS XI HERO",
-- 
2.56.1

