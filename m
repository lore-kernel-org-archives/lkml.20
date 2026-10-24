Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792821121;
	b=qhSecHPT2L8g7Oy5OGheNjPzAYTjQiYnw25fCBWYLHWJ9E5mQLJnaLvFD+gvyNxG/1Ae
	 SWGCFFsK6zZOitBLQQQdXUuy7RdshuTQDiHQ4VqvlvESzheEkNDz++SQNzRuLrNyk7ap1
	 mRhKhuVItch2ChgKix07+tUJ0iRq5cOzcqNpCd7qbcy2jdNx2ObvZf2p2iA7u2SZbHqt2
	 JeB1Amob+DNqFXHdvsBD2merxaFC1Bv9wWRmZHoOXkuwyYgnOA3s+5NEoN7fSJKbEEUbz
	 z3LmoEUxoBh8l0bML7K5AejRZ+2ag4QK72Ke+Bw50StjVuMN+wMvh79ersfKSSvbvCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792821121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=Jlpo7fIcByTBeMoPijrvjPiifrT7FNSteMRpBZdk4xs=;
	b=3qom56daPOMlXid/t/6V1aGNPjgePMUH81TcW2zp7vG+1jee99T/V/IU5GjyHhJEFxhq
	 2Cx5XnFAiJo51ItzB3B6ado8OWMpr20Upf0p2HLJRzQIgbrEisrdcF4Ryfv/0JfAMIq1w
	 GTQYqrY/l71E3844DhxE/g6FzKubQodbWruMkt2gBHSyG5Pe6hK9lPNFJe7866D4lcjwn
	 5pwiK7MIgmkBKjpXwUVqppl0EnhloVWpQGfuVucAs2qWuC+lx43m8uKofe5noID8tMM1F
	 US8PDjILjSxOasl3cvkZYoM+diVIqIqoemlP73kJ7eWbsmFEyF8GgGbEYJ5fAhXlCCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hkwChsJm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362DE606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 05:52:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 362DE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hkwChsJm
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6afa651700eso2096908a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 22:52:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792821119; cv=none;
        d=google.com; s=arc-20260327;
        b=E5MTKNAQu4Et1u1H7uPCVOEu6Od65DjQb1KgV0h3Vooo44tjT0d1iuo5Dx5ZqXZ7fU
         o2iHaZR32p/kH0crFOghzFoA9RGa56Xw+cXJXwtX+3J1ALqevM1MxnXXW/JVtHnb1m42
         /bMHvHdiiKP2RMkAL8mBe9PgFGoot8bcUbkWFyTUw4yKtU7WHzqEs6xgHno/YLntuBpt
         jxOC1H/DclABvxGdNa+6zu7oL1TVAukRo39ma6djCj4AodsLLNIKntTdzHMBbT2c8V7C
         7rQUllJKEaUdsN1so6FK55lJBGrRCYcCPojbLv+lZ9apR/H4psH7nKMwZiydTLe3tUO9
         xIlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Jlpo7fIcByTBeMoPijrvjPiifrT7FNSteMRpBZdk4xs=;
        fh=80gD9GkCSSWpUX9oL62x4lIaUY/6x14uGYOfipvD/hg=;
        b=i/yqr241VfcifqopFhdDh39Bl6GPmtLdbazFSbFl1i6l3Gc0s0qESyJzkoC8Uoxr4l
         gDrSzSd2kxVmHHKncRyazfH8EZX2HkfdFQCicl11dmTRxneucuMFzIwWa32fNC95+t6K
         C23pcYFRFfClLZEKksDv4yT1CmXVGYN6RkzRgAvgFm4Eg4O7MyVFd1UsoIrxBAdoCrY4
         wsg0u16ApabDLbqRlFcHBtw+F5eBryD8fD3FR+sonvUxlhum3DyIuS2i1RaU1Buyn0rI
         4o6Wch3Xm+xe2uTRHTBQAf0CJgp5bt3UeZsKOGLkdVKGtSjn8bY1VFf6zfTdhydbmKH6
         5iFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792821119; x=1793425919; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jlpo7fIcByTBeMoPijrvjPiifrT7FNSteMRpBZdk4xs=;
        b=hkwChsJme7QNNH3tI3Fn3WXS/b/Cb1okFbuJGRBy+gWkbKI2D9SJVisKv6upNvjw38
         cfjtsaNP4sbWCV1og3e0OBcGXzeBbVOYVGxGFWA3eaVm5RHYFY8X7vgjJ2GSI+8Z/wo8
         nltNHiXpc31jkjw9kWA8NQJdJXf353M93Kod5PT2lyFca+ilkNIsoZaWQmRPhx4lhlvt
         VOTRxA/8bRubllssJD6iO80kki4GcUUn+I7AvMpY2wA47VoIGhUIPV5qjqZ5QwkBrE9c
         AjAZJBi0m+xWRHgzlHD5CzfWKBvRYuGcSDWktlGP1fycJdGWW9itIBhjOIFXMVs0/+ha
         AsvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792821119; x=1793425919;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Jlpo7fIcByTBeMoPijrvjPiifrT7FNSteMRpBZdk4xs=;
        b=VwIK//Seba8BXAr8VbkmWIuc8JxfIP7JJUlF//eBak+UIyQlh5E/SVGCFNHfG36HSj
         REJukdeD5p5D7uXyPR7ENx57OdRN19Ei8eDKXsHMD18VJCGNK/Y9j5dcoXT9vUctEpF/
         lufPy85iXmj6FdaNZo+/uSj+fDMKFaWKEQJSUoqOaqv6iPfavY4zmdcXhBBRyxpiF9nk
         94G7kG3wmzcQYtUg0/yJr7uo9Hew9BYJi5RL3lx6DphZLggldJv0ZOS3mt7AjONRukfk
         ZXSt9T36N2C1XpqgIjWqj1Uka5BQXBL/gG09+2zNB9PGMt6u2uUtnnDC+O7W9SCiEqiu
         LYHg==
X-Forwarded-Encrypted: i=1; AKwUvBwk4UJkDBj4WvEAnNmRiYBADRdt4+3UpfUt4tIYKQOdEpJQgiI5gC3rUrIbpE9BsAdGAvWJgVpDc4VyoLo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRGmB/d27hvF8Wcnt0CRp3Hn4EWaK3nvQlaN3crr1b9Drp0Mc2
	z3m2ktmXukxlNDIbphzIKRQfAnyk++/IA//BMKXCYIcdNcM8y8OI/Q9qhs0ro1Er4eZ5u/noCcG
	uO6J4a5eraWmVjK1gtECNeDFrnyy/xMY=
X-Gm-Gg: AYBFou2Hx8q0EwdrDPuys04ihiZOAY+8Ffxl4op31l4HCAm0Nbr0o31+/wYr88nrq2r
	ceZ4fqpmucepgyPhD29jpgLcFStzc798+ojhAwCHeDy26xR/r6IDv32OkzzstvEuB44LR7+21ag
	fPcJ46ZUyoopw6gDrrX7oH0CGhNGsomlecxyd4jyPS9Xeqosmk7nfqzQ5wFAy3enYSG+0XoAPs8
	dFhUBYZdn3S14PQvxhrPA4Y8XhSTM4CbOUMuhPcNCWyVVJbwvY/0fSxrTun4t+w0uYtsBha9A0n
	GlX/gJySlTTKI4bKKetnLw8mC+ScbunJNN9whYuKnkc8mJ1hge3nxaFt7QdXYkEvb9jz2pDQUIG
	j/M6LaUP+YmcLFqU5kTCpnp2CfiqC3ztR51d9qVQKufhZcwc4AxgOgAwL7zhG0rYEr9jykHi0J9
	dfB8U7LKZEeRBKKB5Ke2zjaRFWKyKIJkkbzQ==
X-Received: by 2002:a05:6402:42c9:b0:6b4:201f:17e3 with SMTP id
 4fb4d7f45d1cf-6b442fd51b4mr1581114a12.16.1792821119296; Fri, 23 Oct 2026
 22:51:59 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Elliot Alderson <hackerowskiy@gmail.com>
Date: Sat, 24 Oct 2026 15:51:46 +1000
X-Gm-Features: AclHuK9YJjm5GNixWxM7scDTrYw4REFQPygYXTy9slYfpoiG72e8KjMFOVfyw1o
Message-ID: <CAG2k5NBDNqksjd+FUHXAcC-pHwadLzwobr45pTXuATqQ7shyPQ@mail.gmail.com>
Subject: [PATCH] usb: gadget: printer: clear current RX request on unbind
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+ffc483dc87891d3c107b@syzkaller.appspotmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

printer_func_unbind() frees current_rx_req but leaves the pointer in
printer_dev. A later unbind can then pass the stale pointer to
printer_req_free() again. Clear the saved request and its associated read
state before freeing it.

Fixes: b185f01a9ab7 ("usb: gadget: printer: factor out f_printer")
Reported-by: syzbot+ffc483dc87891d3c107b@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=ffc483dc87891d3c107b
Signed-off-by: Eduard Zateev <hackerowskiy@gmail.com>
---
 drivers/usb/gadget/function/f_printer.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_printer.c
b/drivers/usb/gadget/function/f_printer.c
index 1857d786110..11471bd065c 100644
--- a/drivers/usb/gadget/function/f_printer.c
+++ b/drivers/usb/gadget/function/f_printer.c
@@ -1462,8 +1462,11 @@ static void printer_func_unbind(struct
usb_configuration *c,
         printer_req_free(dev->in_ep, req);
     }

-    if (dev->current_rx_req != NULL)
-        printer_req_free(dev->out_ep, dev->current_rx_req);
+    req = dev->current_rx_req;
+    dev->current_rx_req = NULL;
+    dev->current_rx_bytes = 0;
+    dev->current_rx_buf = NULL;
+    printer_req_free(dev->out_ep, req);

     while (!list_empty(&dev->rx_reqs)) {
         req = container_of(dev->rx_reqs.next,
-- 
2.55.0
