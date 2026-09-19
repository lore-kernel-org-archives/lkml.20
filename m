Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB2D4734C6
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 10:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789815129; cv=none; b=CQ2cyzAAFTSXqtJp+0QEQmz8cW4Fv7PRZkhvWZ2kmmJD8WzM1zNSdViKivA/WphvN1i8uzZnIPP0Osc5EiR2vzmV08URWJ8MrQ0CSx9QZr6Y7dR/lptgN4m1jYMZhYTVi735is/Lx3pHQuk1XJa3OPAFe48PV/DuM8EHQ6QLrOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789815129; c=relaxed/simple;
	bh=LIw84W8I9k+LuqPfSmXrRVw8sCdAF6oA5St7rGy1o+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EiBRKRXk1wQQ/gE7eTbkMy3de4gRZhzB4dek2DgRBe3JSCpSz3r5RiIut1x8NcuhNHx8IGvHBo5OJQsX4YTkiyR/i0iSoBJfCfLVOuhknMwO2H6GejJDNxG92nfhct55MnitRMd6R2RZvRlA9NC2pjbud5u1eSxEbzd5dcEWJhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZLsWhU4H; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZLsWhU4H"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-482f635552aso1257720f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 03:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789815125; x=1790419925; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yBLQW4VRriwtf+wFPBRMNLBW9l69Xiae7tic+lQ/H3g=;
        b=ZLsWhU4HWRk+4Yzs0yAZvn4brNGHz5Uzaovx5peaD1+COeIXG7PFiCDpjaHJ3cAEKb
         TzHr8LF47ChslBJpm0g9By5K8FgJfi5uCNvXSNpSW8S7eJCSRdDPK5m00LJkmjWzYsim
         QPn4uEfEe8aW48Yc/EkCP25nAtfza5y7VUt8MHtxF2naw4iKsguhWWs9S9cnvubBnJJ/
         rpjT30ldmdNLRzFT3oF1UbvVWJTmJkxj4mN0j8LqcLNc07TOFdX+l+C87yaWVvyVwQ2I
         tZ6Jjbp3xT0x5vV5Okqg3OYc4F7gc1wNOHqrN4FMSzU9ncwDNQqApytmuJHbk8Vlwufr
         J+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789815125; x=1790419925;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yBLQW4VRriwtf+wFPBRMNLBW9l69Xiae7tic+lQ/H3g=;
        b=gL0k18+mPaOEu9CF4PT9fnNR8EYDnd5Yn4zERyg5rpzyoN91BWHuUS+N/iQ2jHmDk7
         K080NC6iZv+xxZgeAPwqRMbaFcCkr9rL62jNMGHxR/aaEeHxFqRcJf3h+GyxPyd1NIuA
         9o0F7TNMHchYKSqg22lyMg7D36C3yqJmI1HokJ2QwKm8x0mEa+SQrDHTTxUqHhzQdtYC
         tsd3c01qSmgP7NHSwxTu+VYZQPi4T9CVMVzeedshmP8CcG+R8PTAd1/kTUyoJOSwJ6MD
         jaHoHp8iwl5vtvKC8r/3zO2zKpI77cuXxpzf19nR30o4DaNQkcA2mMz0p+w3+eA/g8QA
         tzLA==
X-Forwarded-Encrypted: i=1; AKwUvBwDoM1d98TsMoMTdETeWDq3TdMStBYBiAhfjQ5aGq7rHVSKsHJA8RCiQYWE+2hJGbOPw8mLItIe/4uL+q4=@vger.kernel.org
X-Gm-Message-State: AFuF++l1QrKqSlf9FN3PMkYVnUQQlsUXRmzWbEoFElwraULKF3IIXhxY
	3OuizX0EZghf1qnpd+NZuxrQDA929b+QwHIS6eCeUOVqlvUqujhCRiV2MGLG+Q==
X-Gm-Gg: AYBFou3fzM57yua2T5BwfU+dfINehsDP8wItqa4wwibqI6K7lfnrQ9jQD3y/Ah5swl/
	vYLuyn0OfzApNez66ADRX8UKKCozBvUN5fedOrNq/IOolEFwdUukAzNdxLWvw75ID0paJ12gv33
	lZPFsbYDywHy2an4K+ij+M3nWdhtB/NHSWQmrXDI+cq24R2T0JIkBLFBKvFhof7WrDwzSPuJEbS
	nafYwR5QJPUOEMzE2q5q6xCgO9a1G+1+w4/Zea6RUINdbuJZ7nks+aRtTEGTxWjsH5wjE+g4XKm
	Zofyujk6CrZdTIRdn3yEtonyuNhaCR/YHHHO+M1JaA7JNHGplBi35B9HC8HMAJWq45b6zqCP7Ui
	C4gduZ7op4d4/sZiZE0UVUaQDL/uLAJvIS7WWy5PckGcOnSwjX3aw2pdbChyT3MxbFvf69uW6Td
	gdt0TIBplnA7358cQBun08BqpBPcDQVal7AhmA79j1zInh2DJhc6mm7+cbqphwzUNMh3jbpw==
X-Received: by 2002:a05:6000:26c7:b0:487:f37:7ec4 with SMTP id ffacd0b85a97d-4871e25e47emr7454274f8f.24.1789815125076;
        Sat, 19 Sep 2026 03:52:05 -0700 (PDT)
Received: from localhost ([5.83.201.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724595289sm6399768f8f.29.2026.09.19.03.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 03:52:04 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: i2c: os02g10: Fix spelling mistake "foramt" -> "format"
Date: Sat, 19 Sep 2026 11:50:00 +0100
Message-ID: <20260919105000.1875554-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/media/i2c/os02g10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/os02g10.c b/drivers/media/i2c/os02g10.c
index 141b7cb11fc5..7d3cbf3d6650 100644
--- a/drivers/media/i2c/os02g10.c
+++ b/drivers/media/i2c/os02g10.c
@@ -488,7 +488,7 @@ static int os02g10_enable_streams(struct v4l2_subdev *sd,
 
 	ret = os02g10_set_framefmt(os02g10, state);
 	if (ret) {
-		dev_err(os02g10->dev, "failed to set frame foramt\n");
+		dev_err(os02g10->dev, "failed to set frame format\n");
 		goto err_rpm_put;
 	}
 
-- 
2.55.0

