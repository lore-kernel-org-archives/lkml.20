Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380209;
	b=WVgk1H6kg1jctilR22Fqkyl3/EVd8VHIAGh+LXR/FznW2BeQglaf6lgol9VNdpY9sT29
	 k5+hQBajWYpyL1z0hnY+Dm2NPUO1u/R0pS36BA4z9u7xHQ+LGsQhVIdLM2bJ+71O40KnX
	 P3lki1T+pkRKzGv6uxYYZ0T/nC9L+DD7eHxTn8pelPKeByzUQmBNk9OXDsUTGE0RN74Pp
	 cgTrpEyTGBnrJzrKWFoYi1VGNxF9vj8wAAp4t1P/AvfzJFrTP6+fi4GmuCn4K7zom5ETm
	 zr9KOHqTVvii8kt9fwGKHazJx9bsE1sPf0mCaSWj2qnV9ZN6ULerFMQrfZ7Rh0Lz/Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380209;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=4M7nJi8IiH7CMDUuicQQJv0+rBT/1hrBP8Gb/geFbRs=;
	b=VMvoxTKwh3hJdlk8hpGvzhLRbWMZwHc5fRbQC/sbfGW+7x7SYspfFjos7EkfF8nHqjxO
	 QbbUop+VsOpQDc8N3H9sLY3nFhTVYd4Xes8YdVJGOvg7ItArfdxBdjic9Wl/3Uet1LkQv
	 Pt3RTnNW4QNmvUDshelg/LAvsIQy0Ax8OzVkR1XIQZeSxWIiXyVDgXfMvXoSmSZlk41Zy
	 rKQJpuK6TN327lnFTZddZVkU5iGXW2lbGmhWWE16N4KrmPEPJgVvx4gqtfjOAyElXDQwD
	 j9/dq8nN65PjR6e37RRqNfvxFyDy2nfaVsjmmqs9Z1djwy+p4UI2M1DHPrp4Hx5j99Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nmBV8nFI;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E054A60A2635
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:56:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E054A60A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nmBV8nFI
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso4176264c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794380208; x=1794985008; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4M7nJi8IiH7CMDUuicQQJv0+rBT/1hrBP8Gb/geFbRs=;
        b=nmBV8nFIjkZ9LKM+sU2s2JOyR5oMeFeEXSlgRz1aLnfGjpGl/gtBFHyfMKfrsk4KEJ
         LuagfGM/KFg3AH49CgkoOGyiE1dgzUq8G/czOAvKWiQwQa0czkTe7tjMm3asDH9OiyQV
         sppD3hADC0svpLfCSslUAu34KLzh5xkvl8xuNw5SX2mxsT790hE+q/W9kiz7zeKl0jFm
         oYTBFxbNUVWZOC1ZpyTNAqYMbaX/1FN58sAJYJYA5Q3ppzEm2/QehJPJGcALSrWQXIvT
         hOMw+v65e3lzMsYchmZbqRlswb2zOgBPPK1qd1Y0XA+AUxVkUJ9RoEbNrsh+3Zcb8DOr
         p7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794380208; x=1794985008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4M7nJi8IiH7CMDUuicQQJv0+rBT/1hrBP8Gb/geFbRs=;
        b=a2c4yMxnCIyEWQKCbrK7nogtvmsK8FNfr8SjeRLdCbGEdctinhmNl8PdS2ll+vljvi
         Oc2HXw54RNPvojL2qFQMWYs6sFio94cxZij+KWX0A8Y/x5u8zk0/fhIYVCcpRVay/Lcz
         GJwlUZkikQXubUSEGvIS7EE2zKA7JXiGDhFKzeYek0eXzVdbC4RMJ6WvXhv5GmQUnZA2
         wOwStZDrv/7SBcVI1aa23nppZEa1/mOMHzXHPReTEkA6KLQ71IotooW066qjFR+woz+J
         EJVtJkLD16uEKxcGQWsFxKzX5GGGJosZC4obqdNQ5+64Fbz9xismn87gZAX8e0gCDhLs
         WNSA==
X-Forwarded-Encrypted: i=1; AL+hErFt4tUd8mL5/uIOtkUlfDFdc+jJsB08Ldy/rXYC+liOSwC3NlFr8cAAtH5/E+2Ee/4npiFOaafkPa0BLGU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NJnIjoFt+PDOMr6M+8K185uFaxQp68ZcYLNnyRmCIPMmhi8Cs
	/qy14KqgwqMa+dXMwIKwch2jYYbx4xntDDiIoJaA/70ehsKsXSOa2apS
X-Gm-Gg: AYBFou1KB3yk0a+jVvn6ILeVjcBKZh5A4keB4o+HZ7S2rtncyKuRhltb3af7t/q5rr5
	wd8kQ1izU2Gr6kwVzJaaGAEGC7xpt+y8MzFPLNf461guccS3N9QzAim0WeiBcWVM+JuOtPSlvT2
	xFZmtioosSqXyjFNtozE8z0Hkzt2EJFdV09qaAC6mBx0u8n7qquXYXWO2tQM+dTjmfAI9A96tS7
	OYUp8ZOVZh6oTsAYiwBHJUNf+5s59b8QLZDZbXDnsTEhu5NVVFsYdYMAXCf6gJ2bklNqvLZUtNQ
	k3GSxV4X8qUNNy8xw0htzo0rGvbv0YYpoimTwrAqSPXDGNcxsX90uzRnpRdcji5AkTY82+LyVWx
	s3gCoqoAEHigbwwrDZvBP+98WdDNZztAWmSjoL086v0swgAG3F5/ouDy+hjyU+iHzQ/eK+CWHtS
	aa0mX1q+6hLsJdOvGxrFuKpVZ+La0Mx/GyjLfAvxqqfopWmK/65VQem1rRaaNaN1IalbPEn1s8l
	ScPx26iGzKFbw8E/raIxd/6hvdRc8RyPHD+LYl8phk1Ov8JuM/ZTi1I8BKry9KMx2xxWFFFboPi
	0W4d32TNq5RXnA7Eca+ZYY8HvhJSInCb+fQw7bkTWhUjD+avR/jtCjtoHbuEmcQ1x4uZZH+jO2B
	IuJRi60VhwS+p5LjzyA==
X-Received: by 2002:a05:701b:4541:10b0:143:2967:c0b1 with SMTP id a92af1059eb24-1b3c0318589mr1481679c88.25.1794380207843;
        Tue, 10 Nov 2026 22:56:47 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:311a:ad7a:93f8:96c8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm13858121c88.4.2026.11.10.22.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:56:47 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 10 Nov 2026 22:48:14 -0800
Subject: [PATCH v2 16/33] HID: logitech-hidpp: preserve transport error
 codes in __hidpp_send_report()
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
Message-Id: <20261110-hid-logitech-hidpp-v2-16-30743e91d83b@gmail.com>
References: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
In-Reply-To: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, 
 Edwin Velds <e.velds@gmail.com>, 
 Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

__hidpp_send_report() returns -1 (-EPERM) whenever the underlying HID
transport write does not match the expected report length. This discards
genuine negative error codes returned by hid_hw_output_report() and
hid_hw_raw_request() (such as -ENODEV, -ESHUTDOWN, or -EPIPE), masking
device disconnection and transport failure from callers.

Preserve negative error codes from the transport call, and return -EIO
instead of -1 when a short write occurs.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 15fe9dcbca6c..3745d95f5bba 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -279,7 +279,7 @@ static int __hidpp_send_report(struct hid_device *hdev,
 			HID_REQ_SET_REPORT);
 	}
 
-	return ret == fields_count ? 0 : -1;
+	return ret == fields_count ? 0 : (ret < 0 ? ret : -EIO);
 }
 
 /*

-- 
2.56.0.542.g3ef89b7020-goog

