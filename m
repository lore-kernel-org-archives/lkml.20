Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4190F3E3152
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170385; cv=none; b=vDlfDscPqHpVe8r/T7QYQcUETcRt/nqdcfMzw7ZfZa68VtcTSkTBYyAAAtlvdKWGa13L/8tk1DgCaq2+Kk/USHRSv8so7+eD8QBOraQEpvtrWpj5KnSJgF6w6ay3JceCaU+9DSquxqyv+jrJheGCtxrs283Y3tcP6arxF6eQAO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170385; c=relaxed/simple;
	bh=MzFCtlg7NQAurQZpo0kH6aO7FER+9XzqIwyG0ItL1QY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k6tNz1HtaTPf17ZyWOTsYJfkBCVN+pvrjjGNEQefPIWMahMaUmD/GpHmd9y7iuvjFVB4PK3KJpWAERiU6cMY48xkIHA5IT84A88LS7rTPVMPVWJQGsAzOFKtF3NGzLiAHU2dfWdgaMP2NNheJUqT97TI+Cpim6d79HOXO9cwLtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FmnRR0cR; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FmnRR0cR"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ceab75934dso37641805ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788170383; x=1788775183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JWug8GNdY5MzAA3B+UQMoRVhKpGdZFi0ogypUl1fSBQ=;
        b=FmnRR0cRIex16fT5cQKbPdU+e1z3okzFfXGz+VYIIRfRqQmYqqt4MmFXPatjZx880Y
         kbWYUzSLVo0iH19Uty/972VyppFc6pvepefxo5unQqJnc9T3qVpgPWzfeVhqibAo4lqN
         FKdz+4I40CFyo/5kZCtkq9vogCd4aIFsHUadfglH7qD5gv6XXHFFSQO3gfDs0eT1B2UO
         ZCjAo2H267R14AFB6Bv0cr0WkPxrkgdu6U7zAinobXv+LKBxOwooIhM5PY/TWwVYqLDq
         xNg43j8BE02QtqQqYFV+ZL63Wr/B2V8iBxLtWMoXtgRMj8dk+/5gWzBJKaOquj228/T3
         F2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788170383; x=1788775183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JWug8GNdY5MzAA3B+UQMoRVhKpGdZFi0ogypUl1fSBQ=;
        b=l9IT62D/pcbNyoRqucDfWtApZ/J7dPiwIbBc+FBxrjlBU3Hg6LghoweXpF0cR3gwO4
         ashsQoQvzgsiADlT4V24tjXZboYHVJNg4kJFN+WAJ9QcEduDKR00tUe8hjCHAbETzcJr
         J3gGgKA8XyjERXCubBTS2wHsxHLEmgSPy+mcuH5X2iAnCD61LPf9djlc1yEOIXpuBjOU
         8W92duUQKXJQkubRPFXyW57r6rBzK4Y6O7yOM7/8+/0QJNmDzDPkeN1sZMrDbrL7P8Qm
         /sGMdvS9mMsXSyQ1duzuM/NduU6JvWnyY0Cp1dndczV/wzFFsG1x5lVuhu+ViYqhR4fN
         3taQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro0LwN9fEfHV3h4Dx5jiwzrvmX9QGA1bdHV/tXYLfm6mA73KzxJsssHE9+tlWvc+4SIj18MtYF8njvmKYc=@vger.kernel.org
X-Gm-Message-State: AFuF++nSdBWxk76QbSOs9PMakL56heITbwgVJbX/gjNdN1muvl98hVyZ
	eqzkpwt3SE93K6A/DBPJPkjSilBIj18AnE1wDxq1xchA9Acy4FM246Q5
X-Gm-Gg: AYBFou09UdtGGZns32NMAO3I+L94ehCMpvBkxov0ZxTmBQUBZnD61d8qx4LXjLROcc9
	8PfEtjHTJVzZa1iuSWYAhmnnupoGnRxoo3hdkKtijh2jtNTrSWqc9UOfdW/u3OYuOXoUdJuMFjY
	0kFOwldJhDWvI5/I1A+40MCnPK0L4gQ8HUjdQ6u77bNBfBOv5RXdsupjrVqRR3E6wyPMuy8/51+
	ejJa+2IU2UlKPlml/8Y5xGf33wzcfPSSoGtS4XTbt+EsHU2FRW1hkbAX6GWtkzn45d2ylyMCyM7
	X2Glr4algUKoCAXgu+T2UIqy/7hO6Ha0kiNdAslwPCncn5zv411EmAaUPN6/A3b5JgnZDL7dBYp
	QNzra5pRBBwksihRHnBotk+ulIr6E5i6eq7byaFGbDautOlSR5u44xfaiCFP7zOdPeHy/pRIHGc
	GLbknOoEKCJpJu+Y5TUxEpodPn6xQ2nTriUKqV3RMkPTjUFXPt8mb+MveMeCExXrcCx1jmGpfcV
	aAbgutb7YquuVMZyTECUBwtm3XUoHP/poUweyCPZaPS6yFtXL6f0e3xxcNrdeLRLvnwnUKbWYAN
	FCNAluXoRPgz1gckk3kGX8T4qfwZmszq3xUyC7+vyyqIKx0H7t/quL0KicJ5++Z3AWVT3xiLal/
	JOsCc++Mc2aqfVJ2VpW1ya+jLa9XRks6WZE38gV/XvX5mVkZ+F7wtY1aF0w==
X-Received: by 2002:a17:902:e804:b0:2ce:9c48:22d3 with SMTP id d9443c01a7336-2d74df05f9cmr355235905ad.11.1788170383473;
        Mon, 31 Aug 2026 02:59:43 -0700 (PDT)
Received: from localhost.localdomain ([101.251.7.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d759640becsm32270775ad.36.2026.08.31.02.59.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 31 Aug 2026 02:59:43 -0700 (PDT)
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
Subject: [PATCH v3 2/3] Bluetooth: btintel: bound firmware ID by TLV length
Date: Mon, 31 Aug 2026 15:44:22 +0545
Message-ID: <20260831095923.18830-3-acharyalaxman8848@gmail.com>
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

The firmware ID is treated as a NUL-terminated string even though the
TLV length is its only boundary. If the value does not contain a NUL
terminator, snprintf() can read beyond the received response.

Limit the conversion to the advertised TLV value length.

Fixes: 164c62f958f8 ("Bluetooth: btintel: Add firmware ID to firmware name")
Reviewed-by: Ali Ahmet Memis <ali@iusegentoo.com>
Signed-off-by: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
---
 drivers/bluetooth/btintel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btintel.c b/drivers/bluetooth/btintel.c
index 998c99b17..887170534 100644
--- a/drivers/bluetooth/btintel.c
+++ b/drivers/bluetooth/btintel.c
@@ -704,7 +704,7 @@ int btintel_parse_version_tlv(struct hci_dev *hdev,
 			break;
 		case INTEL_TLV_FW_ID:
 			snprintf(version->fw_id, sizeof(version->fw_id),
-				 "%s", tlv->val);
+				 "%.*s", tlv->len, tlv->val);
 			break;
 		default:
 			/* Ignore rest of information */
-- 
2.51.2

