Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380214;
	b=YnwsUd9nSM2+qfUXxQfTynMlH68hnEbzTd6+zocKKbCtBr+VuWMPYMp1bzLUAFABw4pi
	 XciCdvTXgHqsAL7Otzzkh9jR+U+xaohHcbxEJtsPE4q3eq8ldI2dXnR5hYja5N7WSDcrX
	 1Sdu8UPT+1dBeXhYCgq2S2wD8BqTOlS2uH1GHhEXSqAqqlyiNEgLPt6/0Qozp+0juz9zH
	 QlKhAkHSWP7W22by3MKSBEd/p/moKqWQJoM9w9UweHxb81NagRsOujqzT41D6llorBPn9
	 jnYRsRQe05vsoZ4ECnA9pusH7ZmvSp8uNhpjBg8qPjaHUhZkke6+z7oU4UTXhqlv0FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=zHuCr2plkvodUEXTgueuoO9GfK6YoD/oOJ8xzsmmCK4=;
	b=aqeCTKKTf0sOD4Kus2tlaDsV1bj4r5O/XSHzGEvFCF/DLe5s4wWsX7TWOGO/3gqMbYpi
	 5zoelCrGrxqYCOixSatPiZMDOEI9bJjYfOV54QP/7Hx9gRlcdrGHRjGCwH7gBTMaY/Jp4
	 cCvX+uekegAp1bfn3SrUgco9zZSbivHpVE0WvLLHQ5dlaxU4SAONBHTffNPbMZSSQyNYY
	 QmVIU/w3DducL48ahQ14/0lENb+6Bf9UIXPoD+4MG69OAVCf7GbKkunm6GsdQyzc8NJrt
	 zHVZiO+FNS69GJNwYoxq0eN/omE1tRW+WpcvCJNrz5SMiCF6VUsJ5yCbNwLuKLTwCEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jVe6Bdp2;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C159606A9B5
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C159606A9B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jVe6Bdp2
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1a2af4c8d00so2219358c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794380213; x=1794985013; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zHuCr2plkvodUEXTgueuoO9GfK6YoD/oOJ8xzsmmCK4=;
        b=jVe6Bdp2sNm0k+C/GX12pdk4KXYcOPsztyIv9so5EY6mqQHF6+kC3OFzO3Qe73FjoL
         1KbE7iEJpTp4yBSjx3UUh5DC3Vfq0Y3qeGu7RneFMCE5LQUMWzpPFqTVws3I99By16Ux
         S+XAOuVte8kVdmPtvRdLHUtGKdNMjDm51wBDutbRBjXZS/ERpliy3V9K7GAwadeCquWw
         JFT2g07mHtwjflMZ5PylOF//4mzOr5ktFyXqFLViZjlm/yocC+hMolFjSQFTTpFjWRz5
         cyo/Zdcz1RkZmgPXk2e9GSvF868xeVgGN+VD8jU1cue32+R/n3P0fBWjgzB9Jlu8YtSP
         kQSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794380213; x=1794985013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zHuCr2plkvodUEXTgueuoO9GfK6YoD/oOJ8xzsmmCK4=;
        b=h0g+5uHAhr+UV66JwQqrxdpAunEQMep23ku13OU9IaDkDwfG7r8kfVSthA3eJoqvz5
         7ZiqmP28aLzRW19ZBMBStpX+tmih3dYW7c7a5wbgaURAutTkrFqY02PMfx3z+8g5aSct
         20VPoY0CuLpGoDPveRoMW4vTM5TeziQyWmUcBXPQ29bnRozkbLIK1UW+jEO6iyF+rDsD
         mclnPY4xp1H9mqCqdcHhD6wzv9cqtLq7omeY8x3WbSYYdNS7mbDIRMEh/P0kl2W8Uxj+
         CTJU5mlJFJEXEmhtYiRGoyTCnvDJwtCljyQ7TEFuoZXUhvIlgWSGBIJyM95uk+m9JLs/
         u4uw==
X-Forwarded-Encrypted: i=1; AL+hErFBvkn79sKTXczON6uOS6p9QmjfMnQL7j6J73W5DFxWt/S1ScgEnH7dvssrTpcRaSPTjxn6MEefNEUvRAI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IIxfA6gM+klA71DutVDoX0b6Tp2IgRHy9d88JpG0GLNlEjHGh
	h3E2ygArMMnlwx+pjNd6NEga4yGX6UrgbXoXeyHzJ39lXPa+Y2V/tWiv
X-Gm-Gg: AYBFou3LCtL0vxu8aGl6reFubhu6v6R/TORCoQYCuVTVv8RQyCEENmkMGoCyGNl++et
	z2AZV/0o2NNFNATIX4OSQv7LbaJ1MKZ5+g3qXU4XZQVCvjqeHv50XsS9zNLHthOo7Zqsu0hrFnU
	4CPZ2uQDeZV6ZjxuYau8X54iTd5NEVnaMYOjs9QNMoQXwjSZmVufmrpAG3u1ZYFz/tMuGuj8kU9
	D8bAh3BCK1NLWXrmY2BGCOfCP4ewsDWxKr9uR0j6RLcrHMUJJ+w/DxxKG7JkHjva5Rz9g4R+W3+
	4XhkiwIShsovwMebroTr46Zqb2gRs4MzLE0W+aJ/eOMVYT9dT90PRzRq48oZjAibGrUWvt+otat
	eFi5jMUtvAGMXULJpKeRD8/vgyQ6dy8P13YMvdkQi9n1jQNKjvlq1OjqOVqExUzResx52+1srlC
	/ArXPecySgxhaMwHdPDXJMdX24HgU/T5ewSAWFq7MO+Z3BMqm4KKU5yVlqPkLBkVb8ndu340K+U
	G4VltlHNAtldyb4If3Ol4H7650dKJdbLGzstgwif4Jtk2/1rc0vdrMIbCbLoYVwQY0kokcEjSuC
	pKjiOHCNafpM+j0DQHbQ4XTU3ZIRTjaspBixdr/o3spcxxwa6N4pyNnRsKJmcvmn/A3J1U8m23m
	GpSZaPbH89HRCa7My5Q==
X-Received: by 2002:a05:701b:2903:b0:181:73fc:e53 with SMTP id a92af1059eb24-1b3c03390efmr1487945c88.29.1794380212739;
        Tue, 10 Nov 2026 22:56:52 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:311a:ad7a:93f8:96c8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm13858121c88.4.2026.11.10.22.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:56:52 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 10 Nov 2026 22:48:17 -0800
Subject: [PATCH v2 19/33] HID: logitech-hidpp: use sysfs_emit() in
 hidpp_ff_range_show()
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
Message-Id: <20261110-hid-logitech-hidpp-v2-19-30743e91d83b@gmail.com>
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

Formatting the G920 wheel range sysfs output with scnprintf() passes
buffer sizes manually instead of using the standard sysfs helper. Use
sysfs_emit() in hidpp_ff_range_show() to align with current kernel sysfs
conventions.

Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index bad6739c618c..03d2e9077675 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -2724,7 +2724,7 @@ static ssize_t hidpp_ff_range_show(struct device *dev, struct device_attribute *
 	struct hidpp_device *hidpp = hid_get_drvdata(hid);
 	struct g920_data *g920 = hidpp->private_data;
 
-	return scnprintf(buf, PAGE_SIZE, "%u\n", g920->range);
+	return sysfs_emit(buf, "%u\n", g920->range);
 }
 
 static ssize_t hidpp_ff_range_store(struct device *dev, struct device_attribute *attr, const char *buf, size_t count)

-- 
2.56.0.542.g3ef89b7020-goog

