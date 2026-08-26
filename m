Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7905C3AC0EE
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 18:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787770092; cv=none; b=nPSJfGnqojzyejikPRWoBCD9gpYtkXRh8hPVWlbEsV7Ih1SkArILi1t9yKQXbCPkeR8kHOZ5G8Uc3NPg4lTVnY9SkHtH4VScSIg1p2bgpFjkSQdpgKNV3PeuPOOkK37wtlTHqhDoetUqhmUlOAzi/wC9TYFFfgUMboHasoGFvLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787770092; c=relaxed/simple;
	bh=3zTrUNP97wjygcEyxUmUMs4ernWyBlapMobTCcEOsLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cvZqdoUXORYoGmAMvQwV9CT3x+Mp2LcyQvd8+CRStlzqQINPGelSOYxD15dUD+lGnCoa+zINUCNHZMhi64bN8RMnCA7F5FUkQ//Xd6rAgY4Ie6Ni3NXHO08R1Oaov69yqINUbZcGdXnai+PiSqw8FjqqUJYZYPzTt4j4WISh3B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h5LWND5o; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5LWND5o"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a18840e2abso2135409a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787770078; x=1788374878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yNGuRramHsyQedVrqROIzZg6iP7sI/lSPknDcuWVUUc=;
        b=h5LWND5ouEDslBg7kR3By1Nd6rW9nS2zBCTUjBfNhU+KfI8IrzPndcYemsqZg6Q+nU
         wN/r2nP5LILJsZeBFvHP/ZzDHCtQSmInciJeQYHkxaoBzuezuODM9lbSgn6t3/8z051P
         QJfB6/7ZllyUYLjhBmFjAHD2+00GUSSKuexpR795IKNisRUqeYWWk+fXUDJ1520sKjDP
         1kY4nP+Lz7whfSKEiQfozgAhRSuDWhe0m6iS0asQuqE+o0bl31G3GN9Y1ZrDtAFh199N
         gLHwfyx71u+ecnWFqFkgFYdgXC0rIJ7TY8RD2okHKDADZdhcyYCrlN9YbPChLOjlbyfC
         vP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787770078; x=1788374878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yNGuRramHsyQedVrqROIzZg6iP7sI/lSPknDcuWVUUc=;
        b=glgdzehzjCV1PNaHrIqoN5q9o9CVh4u2lKLe598RQspbVwRz80L0JVGs77fed+6bUU
         k85f5Lnq9jwUMm3aDCqTzjCOe7LnB/JpnGDuR7t1MBbjf/7SjixfFiVAakpJt0w8IX31
         Mytgxn+cmVFR5GopHQw/zixlC8RFFzhL4yXTcZqTMG8WF9Nyieefy7fMSFhSNNEKYn91
         R+6rMYHc5vNS6o9Q94XTSRy50txyvolTbpSHBE7eVjWZJjgE+8UNyiGTj4ykKNFSrKtu
         bWNcRyE815zNX6DHvAsDhrcgDraY20sgyXEg3grAYbMvgFBVpoqreJXAAvyLpODlz0uB
         oI4Q==
X-Forwarded-Encrypted: i=1; AHgh+Roo9xjRaoPayAv9UgxJVyYHvlPE3ELSPKQzU0HWFEY/YGjbGxtUqchy8xeTefm7aeHgF3XrWhr1ph/8YDw=@vger.kernel.org
X-Gm-Message-State: AFuF++mfwPMtq6kW5wAU3KszoYXF8wmH7qaZNzAuoAWshFVjSnSeAdAq
	FINnpEI72c0InOqM4pdamSGaPjl1RsM+j2pHoj8DuAQPACZmwVxhOrTI
X-Gm-Gg: AR+sD10o9f6+YrTnfImVpK94EXW7ZkmSqf67vAO95Qdn4BaHkgHo7x9KJZakjCX8ifg
	F3TmPTP7JQQ2RuxI+GLIUZt/yWm5D149v+BezLdL+k/kPgptQ2AYXnpU1t0GrD3gKRm7Ui1gz1O
	TH5Bq8XAGHC2CVOJoZKs9xA42mR1qy/MWsgfYKxjVkWjVFo60PO6Z3w3qV7YpC+gmapEIUN6XZ5
	yfbvd/e8z7l2wa+gsfzvZ7Qc7zyMq22T4HLX6YCxq/TEiQ7k6zSKm9QJV50iiTZ9/aYehJeAUkb
	nvMV7Ph+2blY1a1u+cTVvteCLI73ozICCadVtMH0CZGEFpSfVzohqSk4JqEaqcDpomue5mdhT4A
	YDrH4nbYdclQy6AjUPsnGprn9/OIEinvRZ/M81z5ZmgkjBgCNv5DnD0t+44X0wEAv/MBego4fhj
	9qRF0ODhtyKzDhacFUuWaqAqbgdKBUiJewgsvh/ZARQgrey1dstNRaaZORefDMAqtlBh08ALsT4
	YeDVRRcTNNkwuxWQqgobPANQ/uChvK1Zu0e5YT7q5r9c0fP
X-Received: by 2002:a17:907:a713:b0:c21:8a0f:56dc with SMTP id a640c23a62f3a-c250c449b8fmr1129537766b.4.1787770078207;
        Wed, 26 Aug 2026 11:47:58 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.67.216])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2533945d0esm114523366b.9.2026.08.26.11.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 11:47:57 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] hwmon: (lm90) Reject channel 2 on chips with only one remote sensor
Date: Wed, 26 Aug 2026 21:47:49 +0300
Message-ID: <20260826184750.4798-3-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826184750.4798-1-flaviu.nistor@gmail.com>
References: <20260826184750.4798-1-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Validate firmware channel definitions against chip capabilities and return
-EINVAL when channel 2 is configured on devices with 1 remote channel.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
 drivers/hwmon/lm90.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 1c603272538a..3faeb2c6ab01 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -2712,6 +2712,11 @@ static int lm90_probe_channel(struct i2c_client *client,
 		return -EINVAL;
 	}
 
+	if (id == 2 && !(data->flags & LM90_HAVE_TEMP3)) {
+		dev_err(dev, "channel %d is not supported for this chip in %pfw\n", id, child);
+		return -EINVAL;
+	}
+
 	err = fwnode_property_read_string(child, "label", &data->channel_label[id]);
 	if (err == -ENODATA || err == -EILSEQ) {
 		dev_err(dev, "invalid label property in %pfw\n", child);
-- 
2.34.1

