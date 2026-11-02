Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793607700;
	b=dUkWm76b99Fdh5eGnUrgxiopqWPwWlGQnNK7iSJXmCmHQa7Bs5gWkRL6zx9KP5Ym3Hzm
	 Q/hUNMimixJxRW7rlN0ZXLWnHp4F6rqsU/dcAoyI6nz9VEQvR2SdNpQTvV5iSa5f1hId5
	 GjGkDZ/MNzDcMdZQHIENAMY0fyQtB3KA32Q0bwQeMfNMDHuSBukFBnMLyrT9tQQVOg+MW
	 FIGQAPfWZfGLIedb+h5XFLelhZp4wKo9lY68CoX76wnGRvQp9RTO0FuTW+tzZdGwTCXLZ
	 3WKsuTsLd3qqQGqlsoAnkbIyG3miO3mi63jjHoPMQy6wrAn7BQAKXOL6q/frwId1b+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793607700;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=5FOz0TiH9w3NcIetfR+dP6aB6d9nyP+PHblRoSTH/oo=;
	b=O3Q960lqe7oeSWgJjhkYHu1g+GS0jlL+LUWtn+RAosyAWP0P480UYCjflvn+mV81OcRC
	 EVRLPG1nhdoBudvNvyDRZ75BJ7hPHMkwgFJ2jebfsXPTW+l5jAuIH8avgl7BGUncnglgj
	 hLIMmyKs4GCZ6f6tNvrOyUu8b47rtbSvR6VBwPVaf5FGT30GUYinsrOONwaVBvv1jeDfP
	 H/BUD5nd9yNpI9CnfsZsLTv8VHns1T/RFLsEvqPEBBE5OmcICzC7hXiz6wioivK0CK2UI
	 S9LxxTBm9Yr2fRpHKNx+9KwpU8tJn0fzjP/heXNcuZgzE3o1pjtRMrDwe1+jV+1tuiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.161.70
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D181D606A334
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:21:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D181D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-70b8894d6c1so3606553eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 00:21:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793607699; x=1794212499;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5FOz0TiH9w3NcIetfR+dP6aB6d9nyP+PHblRoSTH/oo=;
        b=Q+Yk2LDvjNd+ZXNBD/K2W9vjDlBkF0tvhMWKhcxb0yU+gSkznfXHQrZ12KmdgBG2Qu
         8vdRJ3jo5e1z+oF0jzaWiFlmCqZNFjIC3xMdmmZk6rtvhERTFPAhndq+jx5L275GQYeP
         R/DIOiMQYaZF07HeavLSYe7jvwWwm+q+kWNn+eTF5518i5u9nP869ASV/VoGNjXw5NsH
         YM1ZXiYX0zzqQvRB0frMqoZrQ8vAT2ftu8nI3iUT1NNvZ0BM67i0Dbp5enLCFxoRFTzN
         Bc4CVun4uppDKMYG9gN1MTmfB3GiF6sUfXI17LGT4zi8aItmL5DJ91W6uynZPiDlRyjB
         DI2A==
X-Gm-Message-State: AFq9FYL9DoPDDMjNHeNd6jAF9wIrqPJDynGBNYbsY+F/989pPw0JNPgb
	Km7ZLl/tUUxwRnw/ymA6e+L3LiqB7bIVfTMGB9+l78RlB4hw1KFr6UNhnqwM3e3Ny7CcChkfoba
	bAZDYR2e1Asd8Eooo3dXBqsX3X6PUXNH21KWBzT+lj/qIQzV3GssXQIRAPNM=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4d02:b0:703:6903:75f5 with SMTP id
 006d021491bc7-714ddf5e83emr6540810eaf.39.1793607698827; Mon, 02 Nov 2026
 00:21:38 -0800 (PST)
Date: Mon, 02 Nov 2026 00:21:38 -0800
In-Reply-To: <6ad08fa3.a150a118.27e199.006c.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae84812.6552420f.2a0efc.0676.GAE@google.com>
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
