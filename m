Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380195;
	b=Y9WAuXKLm89MIAFu3TKOhAFch19qO6Qaf95UCrA7uXJXL4R4ltbi4V5SBXz/oxLROakc
	 13CDlhRYYpVaa1xrpyrCoCzJ+Yn6UY7cNrbl0jI/nYV2veYaxkAidxTPiySCbZtkydC/i
	 6z5jYtCSspZVjPr2mVHFPC5JJmuTyEl0VkBtfchxnLa7QdxfyVSr1Q5JoO2Wos2jwBjdB
	 1CjJB2bMGDI4eTK5FwPu4ZfSNahER7b++pyosdGIMnKD9OEoNbqJZWY2jRk2pe0lFenc9
	 yDXfm4XGWZFy4zUsH4kH79Z/Zt8XLSMr7y/8bapEmoOwMqvuoWDMu7DNNploZlZ52MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Z9ELgWrnKOJFPKZ1wGUXM5KOsvAyrSgvZfnwz6BGKEA=;
	b=YD59GE1CklbMh5L/RINieo6K/uzPmNhHqmt7fhREpb+QNodFQpSVLEjq+Pj6ca4p4oCz
	 vt6pQ2PF1BwZpoVMgR357rAcuzs/zwUJxnSCdH3LIN06OriVUo+cxITXAiPgXstXhIrMp
	 Fg+4cCR/opE0M2MdlHl8VAf18hAvggjiNqltMBUZdxZmSQl/9J+WkfGNyerr10vwzFdNp
	 k5ObuU8pB0wExpfWDxkLKI/ikmwbgFydh1LzgPgDyXZSUEWew2Pd3LSho+UdBfa/f1Pfp
	 azj/9sA/7GJ+VzRxNsuVWBw1wV2E+UEuFz2P+SyKp1haYUPMfKefVxhvEDX9Kywnxzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=alDg0Nkw;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C1660A382C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:56:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1C1660A382C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=alDg0Nkw
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso5872423eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794380194; x=1794984994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z9ELgWrnKOJFPKZ1wGUXM5KOsvAyrSgvZfnwz6BGKEA=;
        b=alDg0Nkw/Goh7tkzFfaMY2tWf9hxbbeUgJuknoJjkC9RHcCOsi5Tj4OduEHh6okdZe
         vQbUMgqpB9uKGBfVWNE9LREmlO4f33LRHjpnqPi3qFC9JmEfWxgDvuDuqkZA6di5HG2L
         +XO5DJhq+GlPLq9OoJy4HkCPEJu1rDsMTT8ADXuAw2sZZ71R+UUxOmvJtYukgcvrwLYA
         +4LZE8ZjATIpClxMTVruGIbHi5XV6yvTCDQYdhFswqf2ThdZ3kudeOWsGRDqCPsdymHq
         38Qdz9UkFc0eLh3anBhNHh3UX51cV/efXNIjlLckYBYw3e0OF2jsaQPfpHGBzWe2NwAH
         m48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794380194; x=1794984994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z9ELgWrnKOJFPKZ1wGUXM5KOsvAyrSgvZfnwz6BGKEA=;
        b=w1WqwWe7mAlpnIWqr58ED5e/PnM6EKxxWDhVRfoQ/YWwahbVaFl45ps8xZGLCE/BQh
         ECcQyvPY+QO/ggStULKcKEAT7x4n5aeCSbE5xdb3vLfT2ejg6U7MSX2s0jot1Lds1xfg
         Lmd8B726/rX6OJv3SXqn9gWRqBmQ9SIRDrqdRbZU2SicT2y96MsVQau40TKmXq9ZnKzs
         GvhnavdaE4C6DP/EN27l3YIUaCdThR/2jRvHDk39Ic9TuXJ/dNi7L+yLazBpHcUrF7p0
         nOqpD6TBWXnh6CLetem0FTB4Eg150vOla/AwJhyz01sAasMdL7JmPl0zGqTuQLfr/7k/
         h88A==
X-Forwarded-Encrypted: i=1; AL+hErEVn+nL8GoJWQJ7MfVT+6DIujlN00Rq0J1vF1hZSSwTuHUYfyZ8yQLsTx24iIfdbj3Hc78a1PfeCStExx4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Q1FqcvXlgCsVOeGo8NTLdzZZj7o0v+FCGBLUgQP6jyqn6PqD7
	XxNxuZrCTw9d7rNtfmC2i2qjrNJRFdx26O0OciGG9aFUpYjQUe/qvK141Drfdg==
X-Gm-Gg: AYBFou1qMKzcKk5OXb5qmd39w2O4nfzQW43VDQy5OF44iUEh6N77GpI6jzWd8iaZ/MU
	XmZPx4PnuyxEBfmG3chXxuy42173xkPQHuDMajiHPAnd3wGXSwFdOMIgInOsWOVcOCqqo56G733
	aUSpxPi20N3iFLLdMdjZxw5o5vOrYLIYDoRhhhBZLc1/H/yDiBM9gDb0GloMGdq1RDNVoF+cXNR
	fAu3ADw+hGbAlWjB9Q+Ha9rgfBnX+qSdyeZm2pROQIvp8yzbq7e4nE8BbgMfQq0SYs5/VSXxgtS
	Xk5q3i4M+KvSeuAX8HkMExA4OrbLtEdIBgwsHhnKNwj1DPgwcS+7A+aOScTxvvwrnnPiHSSbfHb
	kt0PNww5OS3XRAu/5H4aLLXRY1i0Sp0M3Sp0f9nsy1Ahia8enlFNF6J3NrmFag6Yx0SXkGM79ju
	6GFk0dxfke6rwwQwlRcfKnhKYMZzDvmeRWOHEH6QyVzrNbPxwvgGxzCJogNXs5F+LgX6+DpRx0l
	eSvUksHPF5X1t/K2g2NE7eOcq3XvMT0HgIhqKEtGgm3TEpWEZIYmQLqLdMIYiUs9FTh1yeDfFv8
	zmb3WkPQtMECddTjZCbNF07VrkCRVK9aQC+n0d697IPknHFbrxRVwEXGYFUy4n4ctCjylBvySQj
	KeEaDrevOO3Wrizp/lg==
X-Received: by 2002:a05:7022:e805:b0:1b2:558a:d769 with SMTP id a92af1059eb24-1b3c024e6f5mr1663279c88.4.1794380193835;
        Tue, 10 Nov 2026 22:56:33 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:311a:ad7a:93f8:96c8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm13858121c88.4.2026.11.10.22.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:56:33 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 10 Nov 2026 22:48:06 -0800
Subject: [PATCH v2 08/33] HID: logitech-hidpp: do not retry timeouts and
 transport errors in hidpp_send_message_sync()
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
Message-Id: <20261110-hid-logitech-hidpp-v2-8-30743e91d83b@gmail.com>
References: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
In-Reply-To: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, 
 Edwin Velds <e.velds@gmail.com>, 
 Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

When a transport failure or timeout occurs, the synchronous send helper
clears the response buffer, setting its report ID to zero. Because the
retry loop only inspects valid HID++ short, long, and very long report
IDs to decide whether to return, a cleared buffer misses both checks and
falls through to the busy-retry path. Every transport error and timeout
is therefore misidentified as a busy error and retried three times while
holding the send mutex.

Return immediately when the low-level helper reports success or a
negative error code, and only retry when the device responds with an
explicit busy protocol error.

Fixes: aba7963544d4 ("HID: logitech-hidpp: Do not assume FAP in hidpp_send_message_sync()")
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 0264e4541edf..c486488efe99 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -364,6 +364,9 @@ static int hidpp_send_message_sync(struct hidpp_device *hidpp,
 
 	do {
 		ret = __do_hidpp_send_message_sync(hidpp, message, response);
+		if (ret <= 0)
+			break;
+
 		if (response->report_id == REPORT_ID_HIDPP_SHORT &&
 		    ret != HIDPP_ERROR_BUSY)
 			break;

-- 
2.56.0.542.g3ef89b7020-goog

