Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897572;
	b=bD1lN2iI8oOIH2WsSak0Whvvp6QgBI7kyDTtz2IU+39JkkSbPJKMwWSCUZhwZt9WDXJO
	 B9kN19Ok+TCsPhdFaHBu8QIFXoUUcaR9Pk/Pe1zLiVt8Ce3Qd99C43GzICzq/1dmJAkIL
	 y1Lj+S9JsKb79r61AvOerTtMOF+/kW4Ji5QeMOBLoICD4alID333GIg5+apCQ2BX8qXcu
	 QbMSA+D3aXqVs2JnLA3tIhh7cVF9PDt/PMahXnWhy/XYPQrYJUPP6wSwwBIBkR9Br4nqV
	 zSaHmwT1Z9ztcG7gOeu5vy3cDJ69JgLICpKWqQ7/ROC6gRRG4zAxlUO4GPQOnQQtaEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=jIsXoLD0V4o6ZxF6ixggOmISmDc85kM+xsblptZ7vmI=;
	b=v2V+p3vQBkC1pwzHQ31KiL0qCZAZrL491zTXQRzY0Hm6daTQMKaufNibjVLxqlTEQ/Ph
	 VGe5fSqJhw8StXMkaUSaYsTxNe/XQNudAXpycVgI5+IFPraoY7rkJIWYITSMByRD7rbRA
	 j5plqNsq1Lau4fX0eyMNQnKlKgiIy/0Foo1FMpPNuldJlGpENwuZb00HLI/VaeTyB9L14
	 5WMB1S4ZjstBASU0zUR3Z8xe7X5lRQpniRM3JNo2IT+gNaCTK6JzWEd2Vo6nlLQ1d2Xxj
	 XwdBha7A75jqN2u2kf7DdQNVWDxMbE5z2AiTh0rJ0uybBEE8hxjBBUy+Yl+K0o40TxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QOo6BMPa;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEAC606A32D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FEAC606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QOo6BMPa
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso5363512eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897572; x=1793502372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jIsXoLD0V4o6ZxF6ixggOmISmDc85kM+xsblptZ7vmI=;
        b=QOo6BMPatC5jr7ThNSI3tBYm8oh+BIlOLpbNGLIQuqlUu/ci7WDqrs6w7WmyOpO6sX
         79kG4YFpk0ELRNWUQ1uJhIa/mxvUw1O80sddaJG66ZKNyb/Z95GuUggbdS68cep5jZag
         x52rUXulleGyUWdc0mGqxQmmXzGdp/v5lF3/bAoUgUa8sShWpSF6vgvNfTQJhZGHGSm6
         hYuP+60G+gw9MvSTbV8cq+KjRSRNtDQazN4iaKYS/wTaMi7UO0tuD+IsmZ9pIZl7KV8D
         gHNHmTBjqfk2TlSwIE8cbIzNED35n005hAOi3ov3V5kz2b+l7xXdHbjDe/eBHrsw1ubm
         jzaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897572; x=1793502372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jIsXoLD0V4o6ZxF6ixggOmISmDc85kM+xsblptZ7vmI=;
        b=MY77b7hKlVeYtZqnew5h+dNJORRH3o+bj4HrdfAXqyckF7ujqGnjvQephhUTamY7yp
         fNYdlyroBqZObSEizKFIr3t9CfsPkNhIDE6Cul3GV3epe0l2HPL0sZ4VYg234XxkWDeS
         KQD7BJWCH2GiioVssmRKLBWE1ym+UB5oX7JH/Seex8NXext57nPWLN1dr05KTnyIF6ke
         pgI57dlaCX/wQJKoBwcwq5QLZetFEkOUPlAIto1OsNwBXLwWxZjet+VsPNSBTcVFDvLx
         YBfSRHGqt3aMNBiEs+ipjfEgwkCooOiZVk2t7lWJIMHLmTVbOZ8TFJCbdPyUwDpWjEI8
         TSeg==
X-Forwarded-Encrypted: i=1; AKwUvBxWMKR/neeCWqC/Fx3HqCU2f0tfGdJePj5ze0WL9ZeU04sk/5/N/MDmov1qfLL2xWk4wAp4Pvmz/HarQEQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFT7q+6psiZ3a9w8mzxhGQCRnsl5rK5bh1OWsSLssIUNt1FmLZ
	Gjt2JiXH7x7IgVNKZhiP4TLqJbr8aoFHD+yU37lIBq7FSsf9EBa37ifO
X-Gm-Gg: AYBFou1rxidF5FTQkPZs/pgFv4wu/heHUE+ue6ujryQiH7vE3hlQS0NH4bvPPinP1k5
	Xo3QctL2XIKzRGcZcFEVcpKcVg9UP+Ut1apNnImSlAvbQ+GadZzqhcbRqy4GK9lnVPDM8Pfpc0n
	yTSpVBuKd1v6ZXdeyEesVOVEBCYcZTIek341aqjIUeG0yQBnqty4E8dIJ3D+ReudnSYcgfoJp4a
	5knIVMlfq0BCcCJEdg/Zx8wzAR3vB+jbY4GXZTKwi4t66u1o8JrYzhmzbDPBlNhovXVYCoFUsvd
	KvvZ26Y/lCVv5oqBqSRA7BVyApf+JHyjulNkRi0l9A2M8ngG0Cc+mZ1ZKDGNBegKc1loxNK9t4K
	L5bP1XeIuTOgRcztYGz2IsHkB7VRnMFEgDy3r0l68soEljFElEHiTx6ZjfjPy9XYG4mDi50CLiw
	Ann9Y4cB0L9QVtm2FDRkvzFBkJiT8UTED3JxbKFBD5mJrrLoS0CzWJUMiJbKIV2eJAeAkdSLdiH
	oE0H6VhiGZS5MOt/LfE3j+87Y3a2efsZOe8RZfeoQp7t21UMvcptRV9qbT4QmBfTagXN1beAYF3
	//DqmR/6dPwbXgNdA5+l3aHDzHAviZX+k6/QJZc2gvw=
X-Received: by 2002:a05:7300:2442:b0:358:2e30:8e5 with SMTP id 5a478bee46e88-369e836b382mr6015233eec.1.1792897571529;
        Sat, 24 Oct 2026 20:06:11 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:10 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:05 -0700
Subject: [PATCH 02/31] hwmon: (lm93) use 4-argument
 i2c_smbus_read_block_data()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-2-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Andy Chung <andy.chung@amd.com>, 
 Ninad Palsule <ninad@linux.ibm.com>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Robert Marko <robert.marko@sartura.hr>, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, 
 Daniel Nilsson <daniel.nilsson@flex.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Pass the expected command length and destination buffer directly to
i2c_smbus_read_block_data() instead of using a static intermediate
buffer and memcpy.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/lm93.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/lm93.c b/drivers/hwmon/lm93.c
index d58a3c2a8593..2cbf0af22f61 100644
--- a/drivers/hwmon/lm93.c
+++ b/drivers/hwmon/lm93.c
@@ -871,8 +871,6 @@ static int lm93_write_word(struct i2c_client *client, u8 reg, u16 value)
 	return result;
 }
 
-static u8 lm93_block_buffer[I2C_SMBUS_BLOCK_MAX];
-
 /*
  * read block data into values, retry if not expected length
  * fbn => index to lm93_block_read_cmds table
@@ -884,7 +882,8 @@ static void lm93_read_block(struct i2c_client *client, u8 fbn, u8 *values)
 
 	for (i = 1; i <= MAX_RETRIES; i++) {
 		result = i2c_smbus_read_block_data(client,
-			lm93_block_read_cmds[fbn].cmd, lm93_block_buffer);
+			lm93_block_read_cmds[fbn].cmd,
+			lm93_block_read_cmds[fbn].len, values);
 
 		if (result == lm93_block_read_cmds[fbn].len) {
 			break;
@@ -895,13 +894,6 @@ static void lm93_read_block(struct i2c_client *client, u8 fbn, u8 *values)
 			mdelay(i + 3);
 		}
 	}
-
-	if (result == lm93_block_read_cmds[fbn].len) {
-		memcpy(values, lm93_block_buffer,
-		       lm93_block_read_cmds[fbn].len);
-	} else {
-		/* <TODO> what to do in case of error? */
-	}
 }
 
 static struct lm93_data *lm93_update_device(struct device *dev)

-- 
2.56.0.257.gf7497c7d27-goog

