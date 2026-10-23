Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792757762;
	b=WEjfsh/JXbtBvPfMMKsbL0W3uDgd8PXGDBKzKlA6mpBqb+uAgebP5P7B3JoeiBU/FGhV
	 a17S30hFDS35R0IJyA+RYbczo76D5iwZvrsv20Mi459ufJmkk7x5cxXnA8bRt+pJPvfJ7
	 3UtPKKZN8eQxLGpJgWypnO3Mm9T91lRdNGlkGL8ppIW6eOyhrgjgSduU9H03R2aWRxape
	 riYvpLSXMOM3mSHxbOZgabaUUF1GiZv3oDHmS6T5VzXvI6R+YVOW5OX565+6+gidKq7Fv
	 b5GwKuaqBHpaJafJLSltJ5RC9Hlefxfcg9aPihdWofyx6sNXucPsGykJ1xJO1fUEdSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792757762;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3GORZK3c+NktRNRYfOm/wPyfDuSwND35reMdEvDAno4=;
	b=c+l9rmybnC6ZBPcpKHa6LBXinxvHTU42xE12aLLUKXeFhaBdqjYz4v07gIR8iCekdvZp
	 t+qNanMh/Wuaz3gNvTBmHNiBYuABMdy+Aajo2w9FPGK5I62JH8L9HswAi/6pifLchwrq0
	 WPF0e1p+e9yLdFyVT4i9dFtZCgGtIEIhWWcNwv4IB/1sz8iJbF2YIY6n16tgJXdlihGnx
	 HWyFZPvMQ6omsZ1bpDT2oVJeyf5xZU95KYK2bHuwIR6jYtq3TmPAzrdnlS5Upickt26g1
	 ZgeiFC56EGyu16QIO0UNPlZMz3VjTawZ0ULYtz14/T3B+kTm417KaT2BcW7C4EfaGYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TzDwF0LP;
	arc=fail smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AE7606A31E;
	Fri, 23 Oct 2026 12:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TzDwF0LP
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792757762;
	b=Z1iC9sX/MAWEfg35U3y5jscHrYoQFobKvHMajNFvO4Zl0p6/KAg/UK9vjyaxTS9fEEcf
	 BuCn3x36m4/hZ+g8n+/+LszO3ts/amprfUliL3NJ+U4LV5I4xWKWsctBfdwQ/JYvQaI7f
	 aTyuSmBn/SNR+WxvC7gMQnrGzfV8t88/Ibn+ecrVmo+w2jpxg8ClnerRhMZuWzB1tqxDB
	 mSyYr3aJZvlpez8qy5Fy3gJ5Ym04dn88EVYP8DUdRS6nNQMkKlgkyuhqOS4nDEYHrOR6V
	 4gFYNoxhqNywuJerEw9f2RZYBrNPGzdOamRrWwuw1gRBIDV3r3geb7Hc5bTIpilUmWA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792757762;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3GORZK3c+NktRNRYfOm/wPyfDuSwND35reMdEvDAno4=;
	b=EwWpnxqph64h5KlU+vJMtn3UyUhdQyzaqQt4EZ6g9iyojvx9Sal2xHSFFfhXtEdd/cJq
	 7DyHSaUGU5H3b6rbB5jzskOxBFrx19d0fNfg+Q2ewEreh8HIBTNRx33yOmPaAec2Y9oOx
	 IVb8k8OurKtAzfh0/ikbG/0/JtKp4WBPjJMQlv1YiDViP++DNF1psSJHkYdVFk4MqhQgX
	 45ZyNnKXtvXw7QhqLqbehgsXK7ZOz6VPqSwvJY9h1Cd+fTom1jaJs9RNQZX6LpWU8D4EW
	 P/dFxYUx29r9kzopJFY7ZL4weHSl9HoXU8Lgm7+Ets7NHmxFUwXJYb2GDFVBG7kEpPA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 503E21F01829;
	Fri, 23 Oct 2026 12:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792757762;
	bh=3GORZK3c+NktRNRYfOm/wPyfDuSwND35reMdEvDAno4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=TzDwF0LPq4Q3F00AlEHx2fsvcdK4e7cM+ftvcVfHU4jQnHcWePlrRMpRgfh1ObduM
	 KAQheeozgJrdd06q2pl0BYAJwqJRMCypmrQQNufZp5gruehhsLCmQ9l6NQh/RCAWlR
	 GVQikKA4MI6A3T44QxTX8QruTLWDs50hz4tbqJEyFYozuMSxeHmj4Zdj5sz7Rnc62h
	 P1aD6fmAx20OxAIfq51ZTav9VWmni+2EzpB4ZO7MdGrSNWgeDKlo3JU7cHHyDtqfkJ
	 3sTwSYRL93t6Vc9M4C1ME4Nm0fgz0GR/eUufCj+dzzGbgq8Q3yy9O9jyfuxmcKg6fd
	 V2kdqsKbgCebQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B0A21444EF;
	Fri, 23 Oct 2026 12:16:00 +0000 (UTC)
From: Massimo Toscanelli via B4 Relay <devnull+massimo.toscanelli.leica-geosystems.com@kernel.org>
Date: Fri, 23 Oct 2026 12:15:27 +0000
Subject: [PATCH 1/2] usb: gadget: f_ncm: do not notify from ncm_set_alt()
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
Message-Id: <20261023-ncm-ecm-lpm-v1-1-d01e81fbf460@leica-geosystems.com>
References: <20261023-ncm-ecm-lpm-v1-0-d01e81fbf460@leica-geosystems.com>
In-Reply-To: <20261023-ncm-ecm-lpm-v1-0-d01e81fbf460@leica-geosystems.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neill Kapron <nkapron@google.com>, Kuen-Han Tsai <khtsai@google.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Massimo Toscanelli <massimo.toscanelli@leica-geosystems.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1875;
 i=massimo.toscanelli@leica-geosystems.com; h=from:subject:message-id;
 bh=hQVH6VWyCLNHwuW5Htd2QhnoAZtXU6Oc3of/HZbqcLo=;
 b=owGbwMvMwCVmIB2leGXyl1LG02pJDFm3/f/zu3VdWDrD6jX/nPVeKoGmfmu77WfFNXW2hllnH
 ss5wNjbUcrCIMbFICumyHJtS/j3CNvcsB1ZXatg5rAygQxh4OIUgInoL2JkeM7+4frpyfveO+xN
 r7h7tWRid2B9xOGHrD1boyYIrNhqwMrwP31+d7vP86AJ8unNsrfP7P9Y2V62+bGdqmvRNyWuE6s
 6mAA=
X-Developer-Key: i=massimo.toscanelli@leica-geosystems.com; a=openpgp;
 fpr=D6B457F7583D6D56B86A8AAA301B5A21D493F475
X-Endpoint-Received: by B4 Relay for
 massimo.toscanelli@leica-geosystems.com/default with auth_id=1289
X-Original-From: Massimo Toscanelli <massimo.toscanelli@leica-geosystems.com>
Reply-To: massimo.toscanelli@leica-geosystems.com
Content-Transfer-Encoding: 7bit

From: Massimo Toscanelli <massimo.toscanelli@leica-geosystems.com>

ncm_set_alt() calls ncm_notify() for both altsettings of the data
interface. So a notification is already queued at SET_CONFIGURATION,
when altsetting 0 is selected, and it waits until the host reads the
interrupt endpoint.

The USB 2.0 LPM ECN (section 2.2.2) lets a device answer NYET to an LPM
request when it has data pending for the host, and DWC3 does so. So
when the host loads no class driver, like the USB-IF test tool, the
device never enters L1 and the LPM L1 test fails.

The CDC NCM spec (version 1.1, section 9.2) [1] asks for the
notifications only when the host selects altsetting 1. There the call
is not needed: gether_connect() already calls ncm_open() or
ncm_close(), and both notify. The extra call only restarts the
sequence while the first notification is in flight, so the host gets
two connection notifications before the speed one.

The old ether.c also notified only for altsetting 1, until commit
da741b8c56d6 ("usb ethernet gadget: split CDC Ethernet function")
moved the call out of that branch in f_ecm. f_ncm copied that
pattern.

Remove the call.

Fixes: 9f6ce4240a2b ("usb: gadget: f_ncm.c added")
Link: https://www.usb.org/sites/default/files/NCM11.pdf # [1]
Signed-off-by: Massimo Toscanelli <massimo.toscanelli@leica-geosystems.com>
---
 drivers/usb/gadget/function/f_ncm.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index 500c9c19c78..0c7ec74d390 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -921,10 +921,6 @@ static int ncm_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
 				return PTR_ERR(net);
 			ncm->netdev = net;
 		}
-
-		spin_lock(&ncm->lock);
-		ncm_notify(ncm);
-		spin_unlock(&ncm->lock);
 	} else
 		goto fail;
 

-- 
2.43.0


