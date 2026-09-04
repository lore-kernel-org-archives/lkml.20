Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C707A3EC2EA
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 03:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788493617; cv=none; b=TDggVsZL9tRJoVZI73FGu7emmf1FSAqEykoyCSo9MBxq6MTQWVUwSdR1jN9+sV16cyMrOy/5nLcy1PyjofCTomCdKifzKtWiN6ZsFlm1rwoKT/Kbz+rGGE3xtxrsJ2R3H+4ygHA94Q0HTyfov5xns71NmFgJF7X6Kv9SqYi1KSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788493617; c=relaxed/simple;
	bh=oXR6+xqPTMqb3aR18JnMKEzkM0xnrSTREI+nxlj5VEE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qVH4S2vPGujy0ezeieeEiWyst1zVR+5/nFSPjEJXw4KW95TsA73Hpox7yTN70vlWsjUh3kV4tJFz7eI+WUpaxgL6DOMXMu3p+dHUNagd/y3yH6l4oxnqAIXNQYu6AUs/Q/RkgvpSbBreZFP+tox2KpXidwW/9XSVoI1T1KFw6j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T1A1a8eH; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T1A1a8eH"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d944747d41so6750305ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 20:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788493615; x=1789098415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZelkIrSgWf1S/hUetmKRMP63MReDb+xb23Q9Brxld/s=;
        b=T1A1a8eH+/Tdt1/EKewx6DDsLWdnl3rtFgIvYUHII00zRCKwxn1640VzQEM2icKjfr
         9QkUNO3KhXf9LX476ImvJngH1WeJjpSPQSvyM5zlDwXwbv3VPij8gflY+q+zg/+lYuA1
         JAiy33m0PXJ25WUlJpwhGJhcgoIjuBiMq6CENdxPahk8GRKYtYCD4ApUfkpUIhTLPoRy
         tHISO5Sl3pX6/okoGbeCqHLn4fWWh+iXaaW1GEwxmr6dsL8AZtTtl+73KB4DbApHYKKU
         OR6S4B+7GxFKHMdOzPSp3xRLO8mqgkvNSlKktYIBgzz4hBkFDh+IOmvDEHtzAbLfVZtB
         kojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788493615; x=1789098415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZelkIrSgWf1S/hUetmKRMP63MReDb+xb23Q9Brxld/s=;
        b=gbiETVNTLV3p+ZlNuokC4KFzgEZw5mT9U0k9n7UZRQOoUD+Uc4RgbZjzfCzCTHsDHV
         ojuELqN0FeA/Jd8/S9nVdkkJg0MvbLH8uM+tZ5VdUGJN5Nlj5Xfkc9t+PKAXTdXe9qol
         gPpdp9HPz9kjLjeSLbJq7McK0XZzrvhNzXYZiqc8qaG2zSNlPB7XWWPeGeQUSnH81hSb
         ZzrL+D6JDXwB2vaEiawy2OK5z4ZYRlBJVwuOCVmPKb1ooSh4ZgAfPdd2zgHhvz43zPtK
         1SLb18TQNMp+9chY64uZHq7i9A44ot49C4ohEg6lOZvCnxpMkF2H9tirdKoanyzFkpC9
         M0uw==
X-Forwarded-Encrypted: i=1; AKwUvByCBM5M4mUHfZXo+L46n7xjMhsoc7c9FZTvoYrmWrG19gZHvTdev2L3Jj/wrZsGYdaHiaKXLU/AoE9Ebl4=@vger.kernel.org
X-Gm-Message-State: AFuF++nrlDhuhx9EAUINOqEH0m4HKp5mKspR1q+0CzBZAleHqcNnuz0b
	LLUjH7KIyUJzYE8qox/gf42xwrNMlybcFWvVy4jjUUZBGSj0PYUfBn/N
X-Gm-Gg: AYBFou3RtB5JF4wnEP3M3BettlSJO31wG0MYh2H0T0dHbs+r4p8LjfeD288VglHfbIf
	4hZZnBK5Vli32naRh95gg8G8/eQwwTqN/tqlyMwBjG2VgprgcxQII0l12rgZRe6VN/mnj4bog1K
	5yYQnvgWDjyIUQJrRAyISuPB/EDTNxN/RbcMOUsERqw53ZrglZ3gN7/uYPpMuq45tdgNtNG2unC
	h3jgsJQnt9yoT7FyE5bUxFxiyqLmUsGETeRZrMSOfKROwkSql4GVluGNoVznpIh2cxBvlCjAHCT
	dr2yt9i55V+XGvVuJ7+dZIVDVPGM4MuY+m7ZOyF7PxEepJmhGGD0BNaqYJcY/G2D++5Z9ZL8/uq
	350G15h9Q5s7aLZzFX7+9KDN7pRK4IPSlpjwvKfNrMv8+cP7jrhJ9AM5RH7LAXNm3yaa0//1lj+
	DOwZ0gcpeGjBaKbhEHlRs8Us+hjbuc6gwMp6vcTuOeezeEd1DsplNJYPm1sahYzE7kMOgG7ooW+
	oQFlwrAlq3fNl40sOQwUgZ/LBtDAC2Rmo9qvBb5pQgYOj7sm4rwLAmxTME5Ew7Fzd7UDEHU/Nzz
X-Received: by 2002:a17:90b:268f:b0:398:c3a3:dbd0 with SMTP id 98e67ed59e1d1-39b2612eb96mr5652582a91.8.1788493615091;
        Thu, 03 Sep 2026 20:46:55 -0700 (PDT)
Received: from hacx.bbrouter ([112.134.221.144])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b25c974cfsm2148062a91.0.2026.09.03.20.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 20:46:52 -0700 (PDT)
From: Suraj Theekshana <surajtheekshana1111@gmail.com>
To: vireshk@kernel.org,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] greybus: cap: bound IMS/auth memcpy to ioctl size
Date: Fri,  4 Sep 2026 03:46:28 +0000
Message-ID: <20260904034628.12376-1-surajtheekshana1111@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cap_get_ims_certificate() and cap_authenticate() derive copy
lengths from response payload sizes without checking the response
header size or destination capacity.

Reject responses smaller than their headers with -EMSGSIZE. Reject
certificate and signature data larger than their fixed ioctl buffers
with -E2BIG.

Signed-off-by: Suraj Theekshana <surajtheekshana1111@gmail.com>
---
 drivers/staging/greybus/authentication.c | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/staging/greybus/authentication.c b/drivers/staging/greybus/authentication.c
index d8f2cd4..cbd28a3 100644
--- a/drivers/staging/greybus/authentication.c
+++ b/drivers/staging/greybus/authentication.c
@@ -128,9 +128,22 @@ static int cap_get_ims_certificate(struct gb_cap *cap, u32 class, u32 id,
 		goto done;
 	}
 
+	if (op->response->payload_size < sizeof(*response)) {
+		dev_err(cap->parent,
+			"invalid IMS certificate response size (%zu)\n",
+			op->response->payload_size);
+		ret = -EMSGSIZE;
+		goto done;
+	}
+
 	response = op->response->payload;
 	*result = response->result_code;
 	*size = op->response->payload_size - sizeof(*response);
+	if (*size > CAP_CERTIFICATE_MAX_SIZE) {
+		dev_err(cap->parent, "IMS certificate too large (%u)\n", *size);
+		ret = -E2BIG;
+		goto done;
+	}
 	memcpy(certificate, response->certificate, *size);
 
 done:
@@ -167,9 +180,23 @@ static int cap_authenticate(struct gb_cap *cap, u32 auth_type, u8 *uid,
 		goto done;
 	}
 
+	if (op->response->payload_size < sizeof(*response)) {
+		dev_err(cap->parent,
+			"invalid authenticate response size (%zu)\n",
+			op->response->payload_size);
+		ret = -EMSGSIZE;
+		goto done;
+	}
+
 	response = op->response->payload;
 	*result = response->result_code;
 	*signature_size = op->response->payload_size - sizeof(*response);
+	if (*signature_size > CAP_SIGNATURE_MAX_SIZE) {
+		dev_err(cap->parent, "authenticate signature too large (%u)\n",
+			*signature_size);
+		ret = -E2BIG;
+		goto done;
+	}
 	memcpy(auth_response, response->response, sizeof(response->response));
 	memcpy(signature, response->signature, *signature_size);
 
-- 
2.43.0

