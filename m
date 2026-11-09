Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204675;
	b=YvLHGiG/EHr53/lDQGfKhb354raLJYeiRktuvKcu9rc+0tL+FUb6zUnIQqBDBGin89kW
	 1GmKBNYO7cbjgSBkKbtmE1JWkVHYsWRfEBBRS7iPmiogA9PJBBrxqBEs85b7si6WbzRQS
	 mRunzoxxMvWe+cyyi6YIQ1jCsy95PEf3mf0JwDZpvK7k19P8qnTP6NihaQ4nZj1AgWsrq
	 UG0I8yJJJ4s/cZ7HqDMnU//an4Hi7Zep3yjZlvAsJN/gkE5buDQMmsMhDigmko0ovR2y2
	 iqfk9AaHxBYTSihORoeeOCLxDX/nFv6kLNKlsRi1nlDZ/T89S79OIuWBtmi/6WXJtgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=VK23kdoiXM00kINqQ8TnOTuQlGrAahz8GOHBdkyawfw=;
	b=QGj9wUo2KzDOh0mhWZdMfs3cvaY+5ZLgu2Sc2kcrpFxlp2XoaxQAGiF6s/F2cO1ZRmOT
	 M6mLcwS1HiCxouUjbKI06egtm/gBbdHVWKTt7jHomSR0ZPeESKxCXUiX+4WK9g0P+R1Kp
	 L1BBuYzXCuWLWgeuAJkbF5+afbT8PhpZfhJV5a131eId6j9eDK6ZdhAO7EdWRYfXoRt2U
	 UWY7FxbQ7+wPK9okEZzbJsVY4rRij4Za/PZwmIEqDKA95fu+dFDidiN6FyhF23hOcMpXv
	 fthb2uBxRKFcJkRVVc0WFG00iHqoSrqPY6qPy1QadLXR7mPa/v9IvytqEaCwfI1nSNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L1QAFeYn;
	arc=none smtp.remote-ip=74.125.224.137
Received: from mail-yx2-f9.google.com (mail-yx2-f9.google.com [74.125.224.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C37606D806
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:11:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72C37606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L1QAFeYn
Received: by mail-yx2-f9.google.com with SMTP id 956f58d0204a3-67c23293d12so370928d50.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 22:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794204674; x=1794809474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VK23kdoiXM00kINqQ8TnOTuQlGrAahz8GOHBdkyawfw=;
        b=L1QAFeYnMMDzXx7wkd8cNEbCum97AHJd2IgVHO+1lvx5pv3mjHsAVdXNuc3cGEeBY7
         0f9kGK/254NHsvjpu61tzj5I8+P0tMR0ay+reDpuxvT5FVhJlHHW5U5VSzdsf4VWSe/8
         wXOk5WXIkDcq2jb6WfPRh1sIzudTKwkQeKYohWWwrHk2o4Q1Z1K7VoaX1Xw70F0pqXTR
         ThPjxis0wRj3PXj5tPrMEtCFki0T/PT5H7+xoqAK+wN3BIYfCh8qx5CjBaxQHaJlelFf
         GK69hSsNWXlwC7Kv1zlw6suKnAJhxCXnAqGeQglBlnt2ke/phVjVLdJFCNn9vUUFTGxY
         K0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204674; x=1794809474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VK23kdoiXM00kINqQ8TnOTuQlGrAahz8GOHBdkyawfw=;
        b=qufHXQBBrGfS03WNDFKHua7iOVR6ZjeTJOU0LOBPut+OWyNrn+Se4xv+DUx1ZKyVWs
         5WTCzmVlCmpqqWO59OBsdtD3xr4bpEwgFSLj7m/cMKB6xHHTCTuwh0bignYrv54Fvdpq
         xSMyV6etHSzaM0NS7TCXv+92b+UNi+v9lq7RMoye4/FZjrxPVvYKwJXhRXzKdBtPNKxn
         7X1E2RO9zFmXMxHzQcEvgaTkMMHqu2D6rZn6u2XT7UNNa+2Uhm5sfVaYCZ+H/13WFbRM
         PYYnuXXln2XqXFRkDb4yJ/KMX/WkSo7kq+Ornl2OH3KjQl0/wwROURYXv+rvsqugLpDC
         qpCA==
X-Gm-Message-State: APuU4Z/OW4ddD9nZjzUGnn8+TcT3rwwAW6PVqG5zzKv1q2skMU1DOJP3
	gTbt6ZTvuRxBMVnDJ8WO0TVOrnmXLGB/mIiWzakx7T2/iaTzLgxK3BEM
X-Gm-Gg: AYBFou1X1RymR7sLymwThJbjVglylR3+0qKrZJL/uzErBszPXZDiiF8hCiCDUdn8l/h
	2MPD+AxqDvd25eoSjt3v725yDCvGX14YjeIVgtKpbLUhH1BMQYsQLLt9AuvmN9EwfESN2LG6qtn
	w6md1+evP0xv6x7vQNcjTPbbUnPx/rGkBTLIBTUhGlkh1EFCkXT1OViFirzS2zzIYDxL22NXIQR
	ZArLFugCCuehBj3lMC9y9/29StFyMYyTg3tvQuNKLb4fkx7Xh7tUH/ioKeHcQK9k3tXjYjhYww2
	v7D0anfDIhL8cP0zbl6A7iam+ffwsVvGNIizOvBAxkMTTPZ5YY3eBCMPsxbha4ovSksKLaqiUym
	7DmVGso3Tkq25tamAdbhYJGXbaCokQBn8VDdYA2uJ3ALNzP16HZYbe0CXvxiVcLTNyvfbt6r2ru
	r8D2oTHKmkpzjmsW59vrc6Gkz+HbmiDy3KbuqTPosc/xeJ+fOdnXu8vJXEnNJ7odMK+V1a5kSmX
	ptNiPZTfly/InYJX62RhkiFvAqTFuUmsinv7gTIenEhYg8qa9u1kW9fdm4hikwimnu/I0O4V68Z
	/Nbbr8HGl14EZD6OpvgGd7jcblYt0w4no6qFlPuHY09Q+dCracmiFMGQRDHEXPgznXuUNPRiads
	64rFMiQ==
X-Received: by 2002:a05:690e:11c2:b0:677:c8f6:8d6b with SMTP id 956f58d0204a3-67c3d9e381fmr1922614d50.50.1794204674168;
        Sun, 08 Nov 2026 22:11:14 -0800 (PST)
Received: from Xinshengs-MBP.attlocal.net ([2600:1702:7d20:7d20:f9f3:ca9:791a:3a8d])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c3b97e6a3sm3255092d50.22.2026.11.08.22.11.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 22:11:13 -0800 (PST)
From: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	nkapron@google.com,
	gregkh@linuxfoundation.org,
	khtsai@google.com
Subject: [PATCH usb-next v2] usb: gadget: f_ncm: prevent double-free of OS descriptor table
Date: Mon,  9 Nov 2026 01:11:10 -0500
Message-ID: <20261109061110.80422-1-xinsheng.zhu.ny@gmail.com>
X-Mailer: git-send-email 2.54.0
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

ncm_bind() allocates an OS descriptor table only when
cdev->use_os_string is enabled. However, ncm_unbind() frees the
table and resets f->os_desc_n without clearing f->os_desc_table,
leaving a dangling pointer.

When a ConfigFS gadget is unbound, the function object can be reused
for a subsequent bind. The OS descriptor support can be toggled
through the ConfigFS os_desc/use attribute, which determines
cdev->use_os_string on the next bind. If this flag changes from true
to false between binds, ncm_bind() skips the allocation and leaves
f->os_desc_table pointing to the previously freed memory.

A subsequent unbind may therefore free the stale pointer again,
resulting in a double-free.

Set f->os_desc_table to NULL after freeing it to prevent the stale
pointer from being reused across bind/unbind cycles.

Fixes: 793409292382 ("usb: gadget: f_ncm: Add OS descriptor support")
Signed-off-by: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
---
Changes in v2:
- Add Fixes tag.

v1: https://lore.kernel.org/r/20261109053440.49156-1-xinsheng.zhu.ny@gmail.com

 drivers/usb/gadget/function/f_ncm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index 500c9c19c78b..685152ec9a5d 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -1741,6 +1741,7 @@ static void ncm_unbind(struct usb_configuration *c, struct usb_function *f)
 	hrtimer_cancel(&ncm->task_timer);
 
 	kfree(f->os_desc_table);
+	f->os_desc_table = NULL;
 	f->os_desc_n = 0;
 
 	ncm_string_defs[0].id = 0;

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.54.0 (Apple Git-157)

