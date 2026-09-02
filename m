Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893642F7F13
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 03:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788319856; cv=none; b=C2qV+plL2CO0H0Ou5VjekJpfZSOnk6h9O+PGW7+pqCUZu8ZaEScldqmbHJ9Lg0IkldcKUfHZZ1M7XU9I6LfW5+m2U4VdnVd8ENFAmf4sBG0ioiVuxMpBiXt/fXT85+wD45WvMAc5quvuLf0nOtopywLcixTeuoBHOSt6lAQ6Lkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788319856; c=relaxed/simple;
	bh=VIGO6DGsEkOu/UJJxuvGP6NIDvkxqmeSyOcYk+gkWo0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZIb8eU+BGqh8ODKIOulm9GN6P4ynth/O7PVPr4Pj3h6E7zJTSO61czgmt77thHYkXlBK9MMW4gaYmzTLpey0nbGL4gPyTSOiRE/6DAxs3KVZ1IdmvH486CxFB3U8qY651ljGv7P5gT5oUom2pn7gzQ93C4I+CRGvT5hth5FIwQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j97+QvCy; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j97+QvCy"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-783047c8464so552226137.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 20:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788319854; x=1788924654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PXNFQ3gLjer5xNcb0OpQhe/yIgTct7Qu/iF0tp3Lcek=;
        b=j97+QvCy4Ynm01tJsd4qoMEqbYCu30/kQkcT6ttBSmsOe8CjvucMvI0tAwufParX+P
         87AtlizOD4pTspb4xlbeFbd7+M25p7Vx5BvsrXfI1f4hM9gkZ5U75b8mxXFQcMKv+nUo
         aQQOIjQueVgs24m3ak5vaT/kY90XhT9C16h/Ur/BuHc3+yyWdK2O01BRZ7elAvsr0ZXY
         qAPOnjRU9N+wNBoYmprfnOjZm0dSkxzlT6GDBc+c9HTguzEky7hBeP1nHpj51EsL6nVX
         TcITm5/uQPsk49DmlL6CM6nuc7Nab/tfOR7rxX6BAgvoPOygHQlJZoYyYt5QFeWAw2Hy
         +m6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788319854; x=1788924654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PXNFQ3gLjer5xNcb0OpQhe/yIgTct7Qu/iF0tp3Lcek=;
        b=NaskMRhp6QxZqZPUD+guBZfxSlVO1Scjv/f30PyVTBMnBMlO2j09whxnVuYdsj4SJB
         RQXgxH/hijZUtzjfKcyx/ewyL9uB9qAE0G0dCq5orHemV2819nCLnutcPEfTdzzClf1R
         9KH2yNriCmQL01jC0N+5DfZze3wvBSBEvSVMSwpJlfa0TGOB3etO081FMNCnWbI2b09U
         FbqSCojLweOz2SrAm0qyQyjHTUxJaq4b3tWMka36d82rl1ZYcmqXC5n2SExGPWExlNUX
         NXLTWZTGBvnM9qqibSKm5JBl1+k4LWxTwJJNIBpQsYNHYtnqeIQaou6ugnJr9CNFY26w
         svLw==
X-Forwarded-Encrypted: i=1; AKwUvBz/pc76vOHFwd4K1Oj/hHVBOgh5PnahJaMJ0SxbGdyRHh/qJc14DV3iYcGQwYFu1QMMq2HjKOHo9DG/jEg=@vger.kernel.org
X-Gm-Message-State: AFuF++mEJoOGvRKdTaSCIE6j0/wJLkv5Bjovzpf2EtK7w/HIWUaX4Uav
	00unEyhbrM6ddUcF2cfCQ8GITifNkQmgPKpMfT1Y4QCk5mSE/A/mfNd2
X-Gm-Gg: AYBFou0Vo7/BGHEihDp8ueRaSxUpj7UOa6NW9sL5K/oirSmbvy13tEDrwvM4jSUILIx
	LIHEuU95pUitMDZukM9J9JABfZ/ITixguRJ80KPNKLjIAPbdC9LiIdjOI3YF2HIJfal1qFO3mwp
	fIg4iinfWKw3Tg1m63pWCpMET2KzFAagMFVB5iuHvnh1tHkcArWFkbM9keTJc6KHkoDmjeYavdB
	I1fXhXC4SBvjK/QVFV6x3CGxfIeL5mTDeN8o+hc00GMkFzQf+RHP/cZB96ZdX2CQJgWPfbrxHlj
	yFHNsO+jLpgNXTP5FTLH7vw/8PDP/jz2GHuO0lT6sEVIVA8hIEVwvM7wjhivZgr2S5dcHkN8Hru
	WVaPIqlx41SN8udjhHMGBvPi07xAOiL4UFAeCJ2DuQmX1aheYcw14PLhQ7oEQsIXTJSIJfnoaox
	dQTVrug6ddS99znmBpeKdr3r6Fizje0ihHBOtM/QRZZ0GAWcMOym0a
X-Received: by 2002:a05:6102:570c:b0:785:10ea:be93 with SMTP id ada2fe7eead31-78a1f230b0emr760581137.4.1788319854364;
        Tue, 01 Sep 2026 20:30:54 -0700 (PDT)
Received: from adriano ([190.215.95.120])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-980672f9fc1sm1384076241.7.2026.09.01.20.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 20:30:53 -0700 (PDT)
From: Adriano Cordova <adrianox@gmail.com>
To: johan@kernel.org
Cc: elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Adriano Cordova <adrianox@gmail.com>,
	syzbot+2fd6aefc361af86911d5@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] greybus: operation: fix out-of-bounds write in message allocation
Date: Tue,  1 Sep 2026 23:30:16 -0400
Message-ID: <20260902033017.40290-1-adrianox@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The incoming message size from the device header (header.size) is
trusted without checking that it is at least the size of the message
header itself, but a value smaller than sizeof(struct gb_operation_msg_hdr)
underflows request_size in gb_operation_create_incoming(), wraps around
in gb_operation_message_alloc(), and results in a tiny buffer that is
then written past its end in gb_operation_message_init().

Reject undersized messages before parsing the message header.

Fixes: d37b1db13f8b ("greybus: refactor gb_connection_recv()")
Reported-by: syzbot+2fd6aefc361af86911d5@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=2fd6aefc361af86911d5
Cc: stable@vger.kernel.org
Signed-off-by: Adriano Cordova <adrianox@gmail.com>
---
 drivers/greybus/operation.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
index 7e12ffb2dd..df6daee4fb 100644
--- a/drivers/greybus/operation.c
+++ b/drivers/greybus/operation.c
@@ -1047,6 +1047,14 @@ void gb_connection_recv(struct gb_connection *connection,
 	/* Use memcpy as data may be unaligned */
 	memcpy(&header, data, sizeof(header));
 	msg_size = le16_to_cpu(header.size);
+	if (msg_size < sizeof(header)) {
+		dev_err_ratelimited(dev,
+				    "%s: malformed message 0x%04x of type 0x%02x received (%zu < %zu)\n",
+				    connection->name,
+				    le16_to_cpu(header.operation_id),
+				    header.type, msg_size, sizeof(header));
+		return;
+	}
 	if (size < msg_size) {
 		dev_err_ratelimited(dev,
 				    "%s: incomplete message 0x%04x of type 0x%02x received (%zu < %zu)\n",
-- 
2.51.0

