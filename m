Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204692;
	b=qD2ZtueHUHFvKbKuqJXZusbc4dmtR2Yc8fGXEy9Ggud5gXjAv8FEdTXidLlN9sCSuRNm
	 ++wUI00QoP/wldTag6GICLIzQNHZG3hv5+DuJfN38nPDQCBtbKlNVeCaXSmD1rTyvNICg
	 9Cl4cWEoekYHs+9Uxb9RIpQ7ZjqC21c61PepFFI4FEhDrk4x+OeotVsQUUnIHeA3PvlQa
	 0VYIh8OWyzW6KVLaaJUvBQ3f3iDIBqXoLNa1GOF1P1ZTDdiHWAf5LaULDtXR3LQP6+cGG
	 wimhoS1WktNxNxJf9Wz/UJJ3rXNUTth+v3Uo9bDnO2Z8SAtslZso7CVqf5Md6SYsj9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nbvpG8myeOhBLoK99qyI+dhTbyOC5nEpen87dSCIGnQ=;
	b=VOWBV1GgOIORbtDXD8JSkKfl/Pee2FzgdEcd/saEX2ysdwwoogV79B/NGqjX8i7N2JT6
	 wMllkA99F5Azn3vRuVvqsU5NID5mPJvgJmEOYefH+UDxdQm5b2s/5QF6Sk4pwobkqE3eo
	 EEK3tBLO8i8EKBybeq6GYAGqVaWxlTGGB0a82HjPA1YBY+1CpHAYl/rnP0Sq7FPkECdVm
	 HgUrEZzmBaCfGhsv3nWI3aB5gbA19AAk4O5SdPSoG1nS/CpV6reTO8EVMdktsK4gjbWPU
	 Gu6eWlcn1/+EFWuJmA+Usen9+aSfEaXIiJJO5fcjSBVw4zO3u+iFoj0tmTOdAqOH6/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0S0JNXjY;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CF9606D825
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:11:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3CF9606D825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0S0JNXjY
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-37000e7234bso1688481eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 22:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794204691; x=1794809491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nbvpG8myeOhBLoK99qyI+dhTbyOC5nEpen87dSCIGnQ=;
        b=0S0JNXjY7oJ9KfWO5t0IwIwnrbkxF6BH25tLcHUmh4n7dBC4agciOhPfOSoMqii9wL
         wypk23adecTk5BAULlJQEFcN4Uy/dgBSw38KvQ/w9EpJb6LYu+xcd7Wwkg5jhA9/Fc0I
         z/sycY/LC0twI1mC/pEMLxZWbve59lrBoqv9R2ks9yyCYZUbfg6/yA+G6hE+iGaN636p
         L0OM0QnzGYPo15Tjt81SPlvpbIHcAeab0nzHcbtXcEgsLkS9XGhn9Ti+E1DUwZ6AjGaf
         7bijOnXEmFgMrfqP+YTdY3nXKaQJxYEBPSiX6pCCNBJF7NjaPX2X6+1Ph2yWq1ztyTYe
         XIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204691; x=1794809491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nbvpG8myeOhBLoK99qyI+dhTbyOC5nEpen87dSCIGnQ=;
        b=Waiuc9LiOE5L0NAl8a0S4czAgdNmdRKYHzd6h7OFTh1YpC46PXxJDFknRHkxYx818I
         nr+SYhvIUQseSUVtQIL6NXJFovOD8Ax2hp3SBrq1hXYw5/I+BupjsMl+2QKAEYP9vzWO
         fMKLTNB+D4E6DSAQDYbh3RT+vCEdS+YikXieTNndwbz67wmuWC071kh/w6DXIAZNiace
         HDAd/r8DNbxfr+awOUGqWX+omId7kH/RilI85RUh/UqUULv2sw3N7CfjTBJxPLsCH/xB
         liXf0xiA4OM+JP1bXDPrBYUu0dyQkHBd71mvthVEtBSQKJJhvgq5QS0jDN4iZ9KY+V4t
         kEFA==
X-Forwarded-Encrypted: i=1; AL+hErHIBrq0NXBIXSZmFX67cbJWixd1RYuZqIxG+u+myisyA8fllHQ/mfP7AtBS2OS+K4bSng2056uFDi3rpEI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8k6nkbfdsxjs+VnQiC4R/76LUFOy6mKg3J5KMg+Ss4IDVIi/DY
	lc5QaieoWwfJ1NiipF1k0KKgtjbtVqxnz9k2zCg+q5/NZ1p8lrKH6Iik
X-Gm-Gg: AYBFou3dJwiDjHdHm9DdK5+ea0IlnAjpUdRe50Pp4kqKHtCWLyLLjmKOi9wp/0WfOzP
	6hfOX3QVA4tqQQGYnPh6xNEgUCSMUzg6Fd82iH6JIoyoMg3Bh6Nu0oIBQVwpKA05idOmKet9DIB
	ReNNFVm/uwLKnHulTF1Y0N7YLVmYY4T/L4oIPc6yAvAhk+8SBB9gGhIAGHHYizIWa40KJxkYbix
	3Rp606JUUqzxeBYIvZinPJbLBn82grPxFwP7ZESNczsGOFq6v14n23mzBUksBQut9rd8c/+VUBR
	HNfj985aHDkOk74wHASVKVD3128rRpi1uocn7EmnXtj85wOOhViaA7SI+GzldlKMcK5MmqhMNOv
	xFkz4xOnCa9ZajcO6xCou759ejRV3/q1FnmrtdiD5L5mKgEgY2k8c2XXuAYjfA3wWHLp8KXD0/7
	QAa60wx1HnPak4JpMFJ99A7SDU68V4vjHBqnf76E2fq3nykv/Rf0PGtPR7rL+yUjsvEwAzXsIfF
	w1UlA+gCvpqH1qbWC4OxVVOTnabYvp4SQXk0pdAHi31DATM9WnW2Y8Xu/0yR3jCBRbPRH12r7LK
	VHmUado1vGtcg8gR9E/uORR0QB4L3lSlTzv0+/TRvy4h2u4i951uInPg487IIC+AlkNDjcvSwvf
	3kxpHwnGyfousO8lb
X-Received: by 2002:a05:7301:a0d:b0:36c:a321:9fbc with SMTP id 5a478bee46e88-3725302c0a4mr6307270eec.1.1794204690967;
        Sun, 08 Nov 2026 22:11:30 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:3588:b56:78bf:db5e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372661ede11sm12201192eec.21.2026.11.08.22.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:11:29 -0800 (PST)
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
Subject: [PATCH 14/18] HID: logitech-hidpp: use guard() for send_mutex
Date: Sun,  8 Nov 2026 22:10:58 -0800
Message-ID: <20261109061103.2887636-15-dmitry.torokhov@gmail.com>
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

Manual mutex_lock() and mutex_unlock() calls force early loop exits to
break to a shared unlock path instead of returning directly. Convert
hidpp_send_message_sync() to use guard(mutex) so lock release is bound
to the function scope and busy-retry exits can return immediately.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 3a3baeb9fbb9..bf13e5fbe142 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -361,24 +361,22 @@ static int hidpp_send_message_sync(struct hidpp_device *hidpp,
 	int ret;
 	int max_retries = 3;
 
-	mutex_lock(&hidpp->send_mutex);
+	guard(mutex)(&hidpp->send_mutex);
 
 	do {
 		ret = __do_hidpp_send_message_sync(hidpp, message, response);
 		if (response->report_id == REPORT_ID_HIDPP_SHORT &&
 		    ret != HIDPP_ERROR_BUSY)
-			break;
+			return ret;
 		if ((response->report_id == REPORT_ID_HIDPP_LONG ||
 		     response->report_id == REPORT_ID_HIDPP_VERY_LONG) &&
 		    ret != HIDPP20_ERROR_BUSY)
-			break;
+			return ret;
 
 		dbg_hid("%s:got busy hidpp error %02X, retrying\n", __func__, ret);
 	} while (--max_retries);
 
-	mutex_unlock(&hidpp->send_mutex);
 	return ret;
-
 }
 
 /*
-- 
2.56.0.506.g506a7eabc5-goog

