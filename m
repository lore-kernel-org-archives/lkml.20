Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793530034;
	b=ZvKGm0GMYC18/MJRfeGJGxambwUS6oO2vrTuEqH8oxrgPI6ONMPf6fV1qwtsWKKcqxmz
	 1UP0qAruB1XEbXTV4qM70vla93ioi0iWsnLEorWbt26TklUvNiPpW17JRVBPgGM0Or7c3
	 jtOgGz1Jky+YS+ANY8r5ZGADZVSBIF1uQzIdMWYlCXbP1iwW3wzebVB3Obu9dW7OpUYa5
	 wWOYj5nVumag4DDXqof3HLnAH9h6uy74nNHeRzM0O+ik9/au+QDhgA3MNc6ZgiPQL+R2l
	 gKm7Gt7aXD3VAbuYWaFq0azzW6EfGTlEU87h6mWhYulRRYUgAqdl8/pJdMK9basKpVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793530034;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=qFSdRjnuTS0M+h5Ev17ib7+0XkEHH0B3YdujUMLD5y8=;
	b=I4uz6gcRAG9T7onkIg26WnWliIWD7hlLSV9qKxhUd+qPlbrG9B+7Lfvv5Yv4qdYB8SIV
	 2j//H/PWqGrTJwE2EfYT8br5Ou9/AI8Wt7v9H5nwaO7euljDZJ2dLN5+qJ52WuX8CZ2GC
	 G+xzTEfJipSxdYw4ZDnYRoEH/4Rcq+NPdUQJ80Fu4TNjLv19wRzgxRY+OOHsAOYMgMZCH
	 dG14we+6pLTcVfp3sg3NC69YYTELJ1SZdKhhox6sPAHagteShU6UePzMS5/NgWQFpH/76
	 AzeFGGHw3RBiocVtrKDTJfTbcgxL8oxLd3tGqb1viSL3sr7R8htOLSsdZx1BBLIq0Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xXmtwACC;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEA0606A327
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 10:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BEA0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xXmtwACC
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so4013945e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 02:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793530033; x=1794134833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qFSdRjnuTS0M+h5Ev17ib7+0XkEHH0B3YdujUMLD5y8=;
        b=xXmtwACC42P9UiDFQGQH/f5u5ShBdLxb45g3Kut3u3uyd2Wp/E5GKjV/6nmKGOFcGE
         WwP2eFp1eLc7wwdwH0IzSHaNa3nhEite/NxAMWrpgskgiS4UEf8xe/vSI2aA+772Jt+q
         5kWg2NSHTtOZbCxE1Rr2Jz1z2O2n8EKP4MkV9ktnN5cNmlfxxrhYn18CKzjTJSsgaQbj
         gRDQnz0L5I+y4l4F7RE+c9SWMiGs5uV78TLxObgU8qy1FSisOVikcmrSqXrzlHmztd+9
         kyOGmOrkD7X0sg0LBfIabJ7ueX8vqzBdMUY2okQI3fAnNfXLh4S1tu+iyt9KnLx4Lw/0
         8J3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793530033; x=1794134833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qFSdRjnuTS0M+h5Ev17ib7+0XkEHH0B3YdujUMLD5y8=;
        b=TcEP3Zqw5q/ly1NisTBYvcpz0o6E3hulsrX07e7mBRFvjpZpgw54xom8leHjlCp5sB
         ucB+YnuiXFbS6qJRPi9pJz4OU+aZb+DJC1dJHuezKBOJ2v4yog1zWJmAC7lInGjV2dBw
         u9LzKmtIU8Xj/VHumM15kDTTZyZA4kHTqELRzfCtnOKoAWWOQ3H3eB3pp4GXe7T0tcf2
         D1u1UMxbnQ5kBUFNDbGdqlUy+OoEDeV018YltkobFe+MfxoW9Dz1kE9f6OviRDmJvQ4H
         t6tZHIjbB8RhWZk6CY6blTRWnAR4DLvmixlIMBhKu7mlS2glZKbRVLtAAT9i9l4bu1Df
         PXoQ==
X-Forwarded-Encrypted: i=1; AKwUvBygC6haDLa0GM62rT1A2ebGiSIln7X++DJemIfpEPxsEWypYtjHnnBP58gNxqiskSWZF5iCjEOrwJqgfFQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVwHw74Ti5z8652R4dYbstLdpBsw7PTCeImpttj+NLqQ3n+D1O
	f9HKUWF7PKQnRnZVHR35tFYgfIfwN+rng9npaG5HJRlrjcbubdtNJfZR
X-Gm-Gg: AYBFou0z0mlu++EwXONy0SIei99Two/GtP3e8t0VnB7GjtqE1Wg7QG7hbzoSj92Tyi6
	FYeO7dQYRSdToN+jFGpvE+bCKzIfHbL7ITA7DecyfOf1qP/9YxD0S89dqZp2PG3GtNqFzohlkze
	j7yLt6jVyqg1+WXPEv+bTdl7MVZUph/DOz98OJiNWwqHxqOFVEO7nTAbacJBhWCGhE7u2pI40hb
	TdUkxVXVWUUJy8YmrFXUqqYVaZ2jmmlj9EdfBRUCJXIh99wIFxPIsLxgw8h7TtJGcGo3VeJxsiv
	+xEDJPK1vtCMzgFDCY2+3lbMOfaCi124yiOo7Sy4B0H5Wb+kHxtxjDquGJO9sRlJg3ucGSHiDnJ
	wIATq6d2X3svzJm/SdrhOSTwNBqqmpmkqCSMdls4NvlbKnylfI8B7YKetPfu/egCBC6T16dPs48
	duPw6lXos8CquFjuLyeXxUr9mx4t9FhNFX4Gpt0QUDu8lKhBotdkD0XMfSIrY9fJLhftslqIUO7
	F0fC2zuT82XoBHVabrKQijCUeIZVA1zZIPxiJTqINzmr24O9MgJv/IKcTx9Pr2d6+kTCqceVKQy
	bR5mgvnXElw9f11AQszIFew5Ofs=
X-Received: by 2002:a05:600c:4454:b0:4a3:5a7b:6002 with SMTP id 5b1f17b1804b1-4ac17d19777mr157538465e9.28.1793530032871;
        Sun, 01 Nov 2026 02:47:12 -0800 (PST)
Received: from [127.0.1.1] ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm255602715e9.2.2026.11.01.02.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:47:11 -0800 (PST)
From: Bartu Alev <bartualev@gmail.com>
Date: Sun, 01 Nov 2026 13:46:45 +0300
Subject: [PATCH 5/7] platform/x86: asus-wmi: reject short fan curve replies
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
Message-Id: <20261101-asus-fan-floors-v4-v1-5-b8d1c31a99a9@gmail.com>
References: <20261101-asus-fan-floors-v4-v1-0-b8d1c31a99a9@gmail.com>
In-Reply-To: <20261101-asus-fan-floors-v4-v1-0-b8d1c31a99a9@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
 linux-api@vger.kernel.org, Bartu Alev <bartualev@gmail.com>
X-Mailer: b4 0.15.2

fan_curve_get_factory_default() passes a 32-byte stack buffer to
asus_wmi_evaluate_method_buf() and copies the first 16 bytes into the
curve without checking the returned length.  Because the helper only
copies obj->buffer.length bytes, a shorter firmware reply leaves the
tail of the buffer uninitialized, populating the curve with stack
garbage.

Zero-initialize the buffer and reject replies shorter than the 16
bytes required for the curve.  Known curve getters return 32 bytes,
well above this threshold.

Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
 drivers/platform/x86/asus-wmi.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index b6541183d4568..dc1e69b964c99 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -3631,7 +3631,8 @@ static void fan_curve_copy_from_buf(struct fan_curve_data *data, u8 *buf)
 static int fan_curve_get_factory_default(struct asus_wmi *asus, u32 fan_dev)
 {
 	struct fan_curve_data *curves;
-	u8 buf[FAN_CURVE_BUF_LEN];
+	u8 buf[FAN_CURVE_BUF_LEN] = {};
+	size_t len;
 	int err, fan_idx;
 	u8 mode = 0;
 
@@ -3644,12 +3645,18 @@ static int fan_curve_get_factory_default(struct asus_wmi *asus, u32 fan_dev)
 		mode = 2;
 
 	err = asus_wmi_evaluate_method_buf(asus->dsts_id, fan_dev, mode, buf,
-					   FAN_CURVE_BUF_LEN, NULL);
+					   FAN_CURVE_BUF_LEN, &len);
 	if (err) {
 		pr_warn("%s (0x%08x) failed: %d\n", __func__, fan_dev, err);
 		return err;
 	}
 
+	if (len < 2 * FAN_CURVE_POINTS) {
+		pr_debug("%s (0x%08x): short reply of %zu bytes\n",
+			 __func__, fan_dev, len);
+		return -ENODATA;
+	}
+
 	fan_idx = FAN_CURVE_DEV_CPU;
 	if (fan_dev == ASUS_WMI_DEVID_GPU_FAN_CURVE)
 		fan_idx = FAN_CURVE_DEV_GPU;

-- 
2.56.0

