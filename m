Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFFB45519D
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 15:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791560373; cv=none; b=DPSAm54oDP1r8xrF0ql9kW8rqkXLfcVOIOAW8PaP+DdwHEzAvvOdUevMmJrquspx92XCyp5xcW5OkLE2ivux8+hwEmbwalu8NLROdnUbbY4kLnSSujJGAeI2VtEh/+E7GfXqqotRehTIERTHYP5j3CsokayLUXjClQSrFb2gHdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791560373; c=relaxed/simple;
	bh=+Rw07kfriWEyCGpVzJxK6mSgxAao1ypqtfUdivitgpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GfohL0pL8vsdtnnGfioclKrRdjWDndoaPpyloxmv9u1oX1jfRTtIYK3isrlTu3zPamO203qUiL/HuIxzzvfE2QUReFEZhG8qAaj24hgXYPxcXIQegAif80CJTsWDlO/FEoEL1tG4p7Utq0pwUb4yHaxbwbmqUa0NztHRNpI7W6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l+gKCYCV; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+gKCYCV"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e623eda81cso17877885ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 08:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791560371; x=1792165171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PkPwa+ResHmZ7LdsIwsHxXNe9JhyIG2QiRNQ9+4WsYI=;
        b=l+gKCYCVj8nXUEbO0Hae6rZRRG7s4s11tdi/lvzr8hFHp/fw9lE5VM4S76329J6Wh3
         /mIDw5ZO2CrKPDcf5E/zOJeVNOfYWQ3UfJHfPk/iOzTY7ZHkVSISpadRVuxlvqMCQQ/1
         fka7uyzyq2Uo6mK3qsL0hxXm52mb8GA9w05MUyh2G47SgKWXSl7yHfV7+UI+8XDt1dZA
         1BsWap8lH83x0PC/pLjlFZlMD5EtX46tcwf34mBNqqfF/FGIvj1p5p92l1Z2cwnIsQ6e
         Ysq5fu9hFTsHR3Wuzi92OEQORbUR+ED1kPGXZDjOVqKV8lCJfSbEY/UjnOzj+LFFJskx
         XCSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791560371; x=1792165171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PkPwa+ResHmZ7LdsIwsHxXNe9JhyIG2QiRNQ9+4WsYI=;
        b=Bdn2F+o2Yr2J5xbxLHRFl0tp6XLp30+Nl1fKoYC1JJpVwAm+LAKxtZGFsu4MzkjiO+
         mSJOSfSPzwfbEWE5AFzN4LNpC9SO1ogfy7xKcs3WtN7TrEODSy09UMqThfVrirt8MGwy
         sX/wMLCJ+jdv829+l0PNdc1SsrewqSC+M6vrOPk1BF740qYSUPH5WYe+csPGXwomsclG
         5nVHwWYy0NgdpJSRNs/EsWpyhpIzWDyKc05whNp2YTVc7j27n+auKLC/3KTYtD0hjp3p
         CXtxwUF9oQPdgxoea+V/IrUraayZJrmTrLBF9Joiei9/pmutrEIE/p3LhtmP+OK905JJ
         7MOg==
X-Forwarded-Encrypted: i=1; AKwUvBxJM9q+Fm9AVq2DA4eL2CLWjPI9J/ySiFcrli7PCBQbkNQ/P8sTHQYSrnEm8c9HnmCCIuvx8ZCe/1IsDxc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhHWYP1SdjSFjj+9jh0m++MuCa3vJBTuEKZaKz5MjfqQ76ZsDw
	3kK4zbXo0IN2uOgC20suE4EXxVr5s3LE+7/Iba0tbUS3VlJDtkJUvPeF
X-Gm-Gg: AYBFou1TMElruPKBOw6uCX26ySqUvDYL3xTOiQinhMDwg4rmgpsRcL4WvmjqcdhRu3r
	YDHvLmBz60g0SOywHBIA7dyLeeqnBCAzVkySa0/N+q/G4Nclg91Ay/sj5E4ImU+aHW+e56V9wy2
	71yLN+4TxzkBb6gaBypeYV561kTn5QMF9V9M//xSWdjt9YlBo0BVQ3sx3+CT/6T61h3IQk5KdDk
	9+uoqi5utSP2t8RaMDyHb7v57uewHeQy46rDB9JiucMZ4zG5YTOCcpB4MAArKE+3DCL2bJl85Y0
	BB4U80cYucHgSD6DB+vBx1MNPbEL7Ph6G4iKlkTkT3khTa92FPpktZ5N7akUfDHhBeRb8k2Pw+6
	VFYZCrfnSEzZ0m/pj1qEHa2OGHxvpUw/jfwz3lVm+CiBX9OwwNHhaNyV1kRBslpnHWBreMODZvc
	1g2p12oaPjgrfw+H2y7o3n6vHbFOAunl5DSyPJs7tPJ/Rq5PrBjTGXHAR9LT5bdUAQm8F5qQ==
X-Received: by 2002:a17:903:41c1:b0:2dd:c053:82f3 with SMTP id d9443c01a7336-2e842ce20a2mr18707215ad.42.1791560367626;
        Fri, 09 Oct 2026 08:39:27 -0700 (PDT)
Received: from mincom1 ([14.67.155.18])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421ae999sm11847705ad.31.2026.10.09.08.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 08:39:27 -0700 (PDT)
From: Jihong Min <hurryman2212@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-api@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] hwmon: Reject truncated attribute names
Date: Sat, 10 Oct 2026 00:38:43 +0900
Message-ID: <c9a2e5f5a8bf08545a999c6ab70aa058eae947dc.1791559095.git.hurryman2212@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1791531025.git.hurryman2212@gmail.com>
References: <cover.1791531025.git.hurryman2212@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Large channel numbers can produce truncated or conflicting attribute
names. Return -EOVERFLOW if a generated name does not fit its buffer.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: Jihong Min <hurryman2212@gmail.com>
---
 drivers/hwmon/hwmon.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index bed16cfd4f1c..288f356980e4 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -553,8 +553,12 @@ static const struct attribute *hwmon_genattr(const void *drvdata,
 	if (type == hwmon_chip) {
 		name = template;
 	} else {
-		scnprintf(hattr->name, sizeof(hattr->name), template,
-			  index + hwmon_attr_base(type));
+		if (snprintf(hattr->name, sizeof(hattr->name), template,
+			     index + hwmon_attr_base(type)) >=
+		    sizeof(hattr->name)) {
+			kfree(hattr);
+			return ERR_PTR(-EOVERFLOW);
+		}
 		name = hattr->name;
 	}
 
