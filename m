Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204699;
	b=hpoiJ3kpM6Ydvrss7emryVjhCui00llddkU1hXcTdTzrB0LE1s0LtrRYebh1YPYoRJZE
	 sINcbrrofSTWV88DNVI+9HgJUW2Qkq46ocmA399FHw5dHax0J8aiqxiJ4oDlM5mR/baxd
	 BjsoJPYAHkxnEQ+IFpjW0PyulkC11eb+K+U7nLqXtBI70WYBPwPAeBOxmcTUpwyyIj1zZ
	 VvCAjhA+3z7BuY2ACLd+eOp2H/arVPrBccthwiJDS3PeuwLphFlvr/9t+a4oSL7GKKI9A
	 OiUCWcVuQyb9YdCRzPFxG6DbY5fG1E5m1xOdaxC4jfT+nrXtE7F3wJdAuCejy7/pePQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204699;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gH644WbN+LdnH6MmDYYCjv4JulA6E0qcVtYB6UbHl5M=;
	b=HBxB8MFGyULgLVX4Qy3FuaWHZ7xHLNJ84cUiXnNs1FyBNRQA6biwayfNubtbloSMAUG3
	 NfyqiVVVsnngOKHXtREZdIPMezv9u7BaxOR/iJcJIsRRmCrrUk+jgplrMPn+kNgyaITZc
	 5PHpI4blzbl8PQWee0hL2MA/VtUMheLSHqA0dFPMEM+8oYdVteAUCyCCAkxdHs5YnxhT4
	 5D+36jVBLXyzNqjr3zYTRzxPgtvKQH8/8VU5laKQUl1U9TPrOlbpQj1nCIeLG7rUtLRCy
	 dpVERScdxHaGk+QWUFBZES3MhuYdOAdLITs6IombOtg1d+6siiPWQR7rPqEmeLglSHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wFyaZKK4;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF67608360D
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FF67608360D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wFyaZKK4
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33fb4680717so1214464eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 22:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794204698; x=1794809498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gH644WbN+LdnH6MmDYYCjv4JulA6E0qcVtYB6UbHl5M=;
        b=wFyaZKK4rucwtYMp7L2CkJgKG4Cp88lxhnV7RiTy1OBV4s7cDRknWRPDtj20wLYzws
         SuTmKyy7hKNAu1ACfPhYmk9PiWLPkRPpO0ATg13LJje53hVh/6B5I6mJuXdV0wpVpfKO
         D5aj1SgOGVvynNNeyzVCt47n0fW2ZsWxiFpVrOa/75MMjiH+hXnV1Y7wUMVgS7rcM8Uo
         hZwcRZsdm3DNXvbF+64KFwWB7kNjOXVxKbZ4l1j9kniyB5PLmt4Q9TVwd4c6kvjuKAJF
         ywFR98i/Ydmo7RwNgmNz/+Eh8FiwFRTal8xqRbrlnyTIHQZ/g88kosqiUHgzr0xfMFhy
         jtQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204698; x=1794809498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gH644WbN+LdnH6MmDYYCjv4JulA6E0qcVtYB6UbHl5M=;
        b=XUiVPOqUitH3Je9K8dk9PaseL851bbpqFoLHLIL3Hi9MZz9rX3mfiOyONj+zFkmS6v
         ouUJyuzwOdksBp6kVKkaerA9BNg6VoFdBjO/T1K0Kji+REhxzkert1rgkl5mb9k5vaog
         G8CR3OhA3Xfffemgkj2G/bJxa2JTaf3MgijDM49ws/X42uw90GQEsGr8xqaYvTYnkaaG
         mGQB5031p8qSospo3xUzLTLN0ZHJuUMrK4K9u4DAvz21HPdVubpPbDm/zGMpQkSb8yPp
         3TvBB8wbPOJ3JXSXA5IyTp0fiPyWIavPBOFm9EHD08051NmPS+2RIkTT6kigrjw2miDz
         tHxg==
X-Forwarded-Encrypted: i=1; AL+hErEuBzmngbc4h1w+pbsjm/Y0pOnZLGohZjpPX+0ufxzmZMmclp+QEhco49QW1BcqDWCqeZMzcQAMU39ZrdU=@vger.kernel.org
X-Gm-Message-State: APuU4Z91iEfHKYTvNNrdkSmOkuugWqejUDGAX+hWSh7ykS/JrtI13fUr
	GRmpfblokLFrhnDbjU+YXh/jHcYInfE3lW5ExOcUB/GhthTtNvHyGI6o
X-Gm-Gg: AYBFou12W7bMN+kbBPm8oWRdWCp2zYJbXhtWTLAXeF7o4vw9r7lSkP3khaWCApPbjWs
	A3Nm76phFWO3z44JYHiWPOSLcBEVf45HybUCHqZX7eicO8Ha2NX/wQRO2yx1parMKdTYW75XUaM
	G3rRVt393uld7ZhO5LRlezNwSSqoaDBr0N4HKy5odS/q2huRyTn2mWrWAj9sc2BEW1f6wCPAX03
	hOjGj/GQdt+wP3rVXxisbBz6iTv360gFd0uwsA/h1M5kjQ6mxgRuxu2dJymONqkPPdfilgIABul
	EW9GNbu54YXltMTmxGJW9Jq8nRGZ/F2BzsDQFYwBPykLNBoIDmoqAvtEtpzLmGrnEyFivq2E2vq
	ic26Ig7bimku13QYSBVp+FEmxvEqV4sS5zyuEF3RgKWnja81SNEjFfCo6Rz8s2UoDLHXpGJGVFf
	WKSTkYte8JanZRXUW9RlVYzDTOPPZVPMB2JlTg+s52h5a1daSZR0Jks1wi9M7LM49eUNP7WypXp
	jlcYMvnduu0+zBT3ylo1m/mF57oyDdswuCnDXczFzfVin5WzosqYGCr1U/hPHE6C1ao0psBMoAj
	Km/v9SeideDKnNdHkt3ximTl/BDo3Wp9cS2VzLdNEZEIEp/scXbUO6FPQQFp5TFe2hjnUyFVix4
	vtBM642w1rFEyg2ft
X-Received: by 2002:a05:7301:dd92:b0:36f:26a7:968e with SMTP id 5a478bee46e88-372579ac6ccmr5593616eec.40.1794204698322;
        Sun, 08 Nov 2026 22:11:38 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:3588:b56:78bf:db5e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372661ede11sm12201192eec.21.2026.11.08.22.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:11:37 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>,
	Hans de Goede <hansg@kernel.org>,
	Edwin Velds <e.velds@gmail.com>,
	Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 18/18] HID: logitech-hidpp: manage ps_attribute_group with devm_device_add_group()
Date: Sun,  8 Nov 2026 22:11:02 -0800
Message-ID: <20261109061103.2887636-19-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
In-Reply-To: <20261109061103.2887636-1-dmitry.torokhov@gmail.com>
References: <20261109061103.2887636-1-dmitry.torokhov@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Managing the power-supply sysfs attribute group manually requires
explicit cleanup in both probe failure paths and device removal, even
though all surrounding device state uses devres.

Switch to devm_device_add_group() while keeping synchronous creation
before connecting subdrivers and non-fatal warning behavior on failure.
Drop the manual removal calls, eliminate the empty start-failure unwind
label in probe, and simplify device removal accordingly.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 7ff7b7d8e2d2..83a408f91d8b 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4739,7 +4739,7 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		return ret;
 
 	/* indicates we are handling the battery properties in the kernel */
-	ret = sysfs_create_group(&hdev->dev.kobj, &ps_attribute_group);
+	ret = devm_device_add_group(&hdev->dev, &ps_attribute_group);
 	if (ret)
 		hid_warn(hdev, "Cannot allocate sysfs group for %s\n",
 			 hdev->name);
@@ -4753,7 +4753,7 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	ret = hid_hw_start(hdev, 0);
 	if (ret) {
 		hid_err(hdev, "hw start failed\n");
-		goto hid_hw_start_fail;
+		return ret;
 	}
 
 	ret = hid_hw_open(hdev);
@@ -4811,8 +4811,6 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	hid_hw_close(hdev);
 hid_hw_open_fail:
 	hid_hw_stop(hdev);
-hid_hw_start_fail:
-	sysfs_remove_group(&hdev->dev.kobj, &ps_attribute_group);
 	return ret;
 }
 
@@ -4820,13 +4818,10 @@ static void hidpp_remove(struct hid_device *hdev)
 {
 	struct hidpp_device *hidpp = hid_get_drvdata(hdev);
 
-	if (!hidpp)
-		return hid_hw_stop(hdev);
-
-	sysfs_remove_group(&hdev->dev.kobj, &ps_attribute_group);
-
-	disable_work_sync(&hidpp->work);
-	disable_work_sync(&hidpp->reset_hi_res_work);
+	if (hidpp) {
+		disable_work_sync(&hidpp->work);
+		disable_work_sync(&hidpp->reset_hi_res_work);
+	}
 
 	hid_hw_stop(hdev);
 }
-- 
2.56.0.506.g506a7eabc5-goog

