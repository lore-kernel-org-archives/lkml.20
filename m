Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30620380FFD
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792132703; cv=none; b=IieXrPormwXqyjRhREC/69Pn9+Vy2LmEPL40M+1S+H+CoMy6Juhk316DfjpW2iQeu4uPMV0eorJWQ27KXAlxPxzhQX+t8XVBWx4P2gAb6EFzr8kHMKiTwEZ4l1+5mpygJeFwZ5IpxFD8/PPN8b8LiEnX43cIpDthM2lfb0Hn78c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792132703; c=relaxed/simple;
	bh=zbBYNRqIpU/zXlbS3PL2t380sFU4bLeo0x/J25o3/Yk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TXqC/H3p68r0SkmFEJGV88mBfRn1cjWXBZ1gb94IiRi0jrsPNBoHUj587Uc+bZyTXh+x1dwr5mqfK7uJ90nm3hHDtNjiV8HUiDjD9EAlcJf6lf4A5XL1JfNEu7jr14KjTIbqv71NQve1ZDtBjwrDB7OavTDBe9Qnwb/JMlG+nps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E3DXmfgw; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E3DXmfgw"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35b2c599f43so2290153eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792132700; x=1792737500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zozTgap9/7XkjDcW6YDxcMncGVIIlLjENhuebqzWUwg=;
        b=E3DXmfgw8Dj1wT02wEE5t7YjMuE4zdH7znDclOe3bDWRpO3nVfwmL0+/JwuvdyNTw7
         D5ssn6Ia3Kom58Gy25WdJw/xOxkVZUy+XI0OSXIqZ5Z0uCef7bxlNTCN5phHLfqifE1G
         bO4dl4FwuG4rOsyDd/yt+ynMBN+h0EP2+X73mMH6pBYDZC9B0ClBfwCqUm08pg2IEINw
         b0HoAII4MrkqHkNiQsUjibIufAp/Ht2Watbquc5ywDNoJn+6UYN/kwV5pbtX25kdCQ5I
         maXGlskNebD0nGmwMg0KupBj+HHviU2lfRi3pvU49/bvIZBog9oEvh79ZSdPt60kgbQB
         F8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792132700; x=1792737500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zozTgap9/7XkjDcW6YDxcMncGVIIlLjENhuebqzWUwg=;
        b=dn6S0IPxZ5wUbHvsDS+BsZSf7Kh4+pEILCfHIHVK3+N+/gMpTjfOFoTz2x8eqAVdsU
         bp3ZE5DMFuDJ8lTRO0GAJfDWKxojjdxea5lGAO+Fhpr8vlkAltcIBUL2m1AOOR6iXCKH
         LyFgxGzb4XmAH2UUT7Sy+sLXE7KslXuyF8k0yjlHlTeMNx/mmxnMuHMNi5GntM72uFsl
         5h5QyegfkCHRWHeE/R5o2ZGYhmteB64HUd2jcBpcvf4gb+DgY5X0yCveXNgbf0JGhb4w
         2WI9DDxPfkli+z8xQPbh3u1rj2zTqVzXHg3zB4UZ0LcFeEsudkgtMDSwAHHApB5p0CRv
         +sAw==
X-Forwarded-Encrypted: i=1; AKwUvByg1EO5XMyRER2JuLTIdjTu3rx06pV1d7yq0m4wJcGSHiXoNbUuGhkOfSsNW1K1gIoq0kpF83yAXm+LZEw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsz9dGbDlQwGwjkfUDlrz+BnZcRC4A0ZrBNkC+IIhNLpmZGCUX
	Wzh4wV6yJlOqFXUorUdMJCY8VNeK3hATTJ3i7KwvrHoseFcHlrVW2ODh
X-Gm-Gg: AYBFou30SfpIsFewBoGa4Q7IrShrVMYN/6lvO2VbNsvhcUXsgWZhhnHxeQemM/lGN0+
	Se8J8p1yRZZC1yjIBh0Yp5bmzLDy1nGvusxguQW3WAdXc5sO7066thqGW3iIKaw876bpn876AYj
	MjeZt1njdFN8rYLJAzfI4vILfYGUYkKQwHbf8BBooY+nQF8d9FR90hUaWQmdpIhQnWlTa1ZQGd4
	YhIZlxa3s0Hn9YWp/CXZSFHUB8Z1kPpUZYrbeYf7bGnqo0gamwxI3eDHB+h0DJ/j80HWLlISQEi
	1+wdUxXNr++RYHjFRRRNngpaOqs5CcJ+oSQOCX2B4v6RawlgtsnhCxVY4NSIdQGwOOietOSQ50Q
	je972mxqx6XL9okL/wimdPKV78KZCEmLGrSkLt/c1hKEqDjYZ3NorFAVmq2oYQFNi3HJf4A5Ktw
	QrrPvmGBJuhGqUJLILZQh8oFqm337Ct0vYODc4rpgpFqFV2nqxMdD3Kk5SDTuolD0cxmGLw2Ci7
	1rV/w==
X-Received: by 2002:a05:701b:2305:b0:14f:505d:813 with SMTP id a92af1059eb24-16a60811423mr29806233c88.41.1792132700064;
        Thu, 15 Oct 2026 23:38:20 -0700 (PDT)
Received: from user.. ([2405:201:c052:b00b:78ea:36df:1d29:86cb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18319d3b880sm2650986c88.10.2026.10.15.23.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:38:19 -0700 (PDT)
From: pavankumaryalagada@gmail.com
To: pure.logic@nexus-software.ie
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	rmfrfs@gmail.com,
	vireshk@kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
Subject: [PATCH] staging: greybus: Align function arguments
Date: Fri, 16 Oct 2026 12:06:48 +0530
Message-ID: <20261016063648.22795-1-pavankumaryalagada@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

Align the function arguments to follow the coding style and
improve readability, addressing the alignment warning reported by
checkpatch.pl

Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
---
 drivers/staging/greybus/loopback.c | 3 ++-
 drivers/staging/greybus/spilib.c   | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index 2a623fc2e99b..0f699afc10f2 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -653,7 +653,8 @@ static int gb_loopback_request_handler(struct gb_operation *operation)
 		}
 
 		if (!gb_operation_response_alloc(operation,
-				len + sizeof(*response), GFP_KERNEL)) {
+						 len + sizeof(*response),
+						 GFP_KERNEL)) {
 			dev_err(dev, "error allocating response\n");
 			return -ENOMEM;
 		}
diff --git a/drivers/staging/greybus/spilib.c b/drivers/staging/greybus/spilib.c
index e4d1ae8308aa..c1982f3fb931 100644
--- a/drivers/staging/greybus/spilib.c
+++ b/drivers/staging/greybus/spilib.c
@@ -160,7 +160,8 @@ static struct spi_transfer *get_next_xfer(struct spi_transfer *xfer,
 
 /* Routines to transfer data */
 static struct gb_operation *gb_spi_operation_create(struct gb_spilib *spi,
-		struct gb_connection *connection, struct spi_message *msg)
+						    struct gb_connection *connection,
+						    struct spi_message *msg)
 {
 	struct gb_spi_transfer_request *request;
 	struct spi_device *dev = msg->spi;
-- 
2.43.0

