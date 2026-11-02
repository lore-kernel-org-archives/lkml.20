Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793607776;
	b=yDPkM9X/LaDByLZNg/FOkcgwGgcvKog4GXVjXSvbBhH1IH4ws2OBPo/qSPaP8a5hXxWj
	 HS6XYX1ZzGLuSuyCbKFmwvYv8QXFppdSW5f9kIpRUk50/0Tp+wHO5ndgeJv3l8SEiXkwH
	 mS/uhYbyM7g68+RvK5B5LKSzeXKfW1D6Zvjxg7hocaPiEEd0LZcdpQ/xWaUlwedhTeOos
	 wmik6CvTBlegTsu5NWdHdUtyYJyFjFE+y9fu2xg/cZs9UPFYTZcr/dH3coC71U2P6NDMp
	 GQGnp8Q6ocq7f9/xsxe35QOZIG68znIWLAGmLLdS4BBLTjjryqjzn3KPW3gbKxMCwjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793607776;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=5FOz0TiH9w3NcIetfR+dP6aB6d9nyP+PHblRoSTH/oo=;
	b=zafs/xodPD2vqlN2vWdjeSKqbBo6uj2IDzNkH5w8IPOWzhmSCr/f4Z03sf1Y2a9GP4sq
	 V/jWqDIxRWlcOvc8/03uueXs4CuZV5+PICNqkeVhp+wvfAsvCpyyieYY0IhWOuU4t2mts
	 KuYPLUVUmBXXHzryvNeB4hKUKbgGQzCK4yJvFxoUhYE6J1NhHqI2py8ApuPbRIYc8GXW6
	 fNZPkcGkMq3E0mO+AM+Ea++wfzEL17amJ6TYIiIc8vW9GMlHFaU3qISnCMb8jZVy+6oIJ
	 4acDkW57fI318UL1XvEnFLTgs1Ddzq2+G2CY/9qOhMF8DmdGa6s1Qnfz61xcVmWhcHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC818606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:22:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC818606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-547ae874949so4262931b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 00:22:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793607775; x=1794212575;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5FOz0TiH9w3NcIetfR+dP6aB6d9nyP+PHblRoSTH/oo=;
        b=LcwagrcO0dxB41sV7kMQgF6ISBdRjy011VwqT2gzfTFejZm9+jAFKYcF9h2MQiLe/D
         FWmpnEhNXgDdIDH0yic29tvTdGJcG8b9xaa3lnuskNrJwjcMSC5IKpZkCDOi5EX0nWlv
         sxnCoowWaYBhGxLXSLnJqfvCnMQDxcjrevIYMcoUH9waEwwSBHf/AYCGITsaqTDEZdS5
         33SiIPW404dQUVMDHQUKSy9Fii161Ty3pQ8T1nEChiS+0L2OVUx8A29jcOHtHyded4Hv
         5uh75s7ZZK4ItsoxgjTdw695+OnLkWoU8/Jeb2+Lfui2QODSkRlqHh1yurOUKzIeKaOc
         6mfQ==
X-Gm-Message-State: AFq9FYIc26lyN4bBaNDmQdt3IATxHkYIgZj3uLGGJ29CWcUn2o1CjInR
	T19eMaIzC6Rm+WM06prEcV0ZUkBgipuVx5QSlLUoVDLCgfmCUuQonwXpQQiUi8R36wQ4Zv4UfN+
	W86ewhXB/53GKbkCAuL1+Ie6KJWbC4nr97byRWcd2ZaEg8RV95SCidDTniT4=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1989:b0:4e7:d180:7719 with SMTP id
 5614622812f47-5640dfbd63bmr5515188b6e.42.1793607774821; Mon, 02 Nov 2026
 00:22:54 -0800 (PST)
Date: Mon, 02 Nov 2026 00:22:54 -0800
In-Reply-To: <6ad08fa3.a150a118.27e199.006c.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae8485e.6552420f.2a0efc.0681.GAE@google.com>
Subject: Forwarded: [PATCH] HID: saitek: prevent NULL pointer dereference in saitek_event()
From: syzbot <syzbot+eba2b3201bd25a97cddf@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] HID: saitek: prevent NULL pointer dereference in saitek_event()
Author: dlzhangak@isoftstone.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

diff --git a/drivers/hid/hid-saitek.c b/drivers/hid/hid-saitek.c
index 6fe7c087c594..7e1160a24230 100644
--- a/drivers/hid/hid-saitek.c
+++ b/drivers/hid/hid-saitek.c
@@ -151,7 +151,12 @@ static int saitek_event(struct hid_device *hdev, struct hid_field *field,
 		struct hid_usage *usage, __s32 value)
 {
 	struct saitek_sc *ssc = hid_get_drvdata(hdev);
-	struct input_dev *input = field->hidinput->input;
+	struct input_dev *input;
+
+	if (!(hdev->claimed & HID_CLAIMED_INPUT) || !field->hidinput)
+		return 0;
+
+	input = field->hidinput->input;
 
 	if (usage->type == EV_KEY && value &&
 			(((ssc->quirks & SAITEK_RELEASE_MODE_RAT7) &&
