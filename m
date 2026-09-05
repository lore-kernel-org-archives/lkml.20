Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E780F2F9C37
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 22:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788648759; cv=none; b=ikXFmBYJ7tB4zwEy4i4fb6cGlVRTl9VsM6XVZxaSv1O0w2KaIds2vOQw+Xg12wy70ZeVGgo8bqGDbKOm4cvsILLClQXjHCZ+NKQZOWnU0CDrjzx7L8/Cj/s/DoYZ8Y12li64GPDJbwABsVUInRmXPOBTA3A2rXhWRCaPzlre3MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788648759; c=relaxed/simple;
	bh=NpZyNzNUhutWagHqilNpgKZT91VlklsV6mHOKCKO/T8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZgFKibQYHkqO3nq7FqegL4T9gqv70dYUchwDtjHdy3xdiZSp00kN4xinXXgKNNLhVwyaeIvxESanlQ/fvq0VrbF2iz6HwKFv/vb6jisPEE/wPDssjJn5EWspvG8TrCIO2cK21Z3pmNej7XYKIIe97ZVm5YtXWKHMONWYLu6djn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AdCnBPKK; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AdCnBPKK"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-495437bb891so14216175e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 15:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788648755; x=1789253555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XCkBwlj1vCXbflJebDoML9tmLNIEB/3Els0FcjcXPJk=;
        b=AdCnBPKKjFnO5mDjXm1A8Tk1mdhVCnt2jF1Xdz1BUikiXUnUaJeZVJm99giZQOJOvf
         nAFIZe9PmtSZHa3xqsTRnxVZX4KPXMD8zP/5GvzNpvJsUOmkjweQcVdOJELvQ0nFntKq
         7ZSVwRrlGdur9GpOJlrnuaQgCcm0IEwjn2kgM4dPh/QRiQlXMfEfs+QI3FcarFlJhKk9
         OvR+e9AHESvsw2qTQeAmaWyPpruK5+N85rboHCgvVaeAo0Po8viMlJe0m4vcuvBMqfwF
         UN1R6q+IlId7uuUDxUnfSEbqfPweH7yGKIOXy8f5cKvLpGtwTYjSIclMInDkpwFgOcgQ
         hFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788648755; x=1789253555;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XCkBwlj1vCXbflJebDoML9tmLNIEB/3Els0FcjcXPJk=;
        b=mrte6EkeZmJWmtZjjT0cnl4sI/t8GhdDLGEC94XhOLZMXFu9vvf8Hwb0jKBQbcXeX7
         NufX4Y/AJ1dxr5PdNhhm3xR5f7ScmGnZ+2ERbGctvmN3VvjzI9ulraTB7cfLzG40ARnY
         FkL+DwCJy1T70zGDsPagLVTSejKcp0jjivqs0CtZyGCB1L4bB7OCdwhhqCD6jtsF4tzZ
         gi0e060gPbuYlej/1PxVwowbm+dTI++8DF1AFY6NKolxU/dGTpNUu1fMYjNzlNWrTKjN
         mHJFAYrzSIh44Bvnm4MjlDkz1xO+ZfeGwIM/Wr7j5EF77gRh+GNRDoC28zQrxSKiN7Zv
         ENgw==
X-Forwarded-Encrypted: i=1; AKwUvBx36EvygPFCV+QDlJ5cswqxLZ4JqIqrSS3hmE8jzsHtWziZp2ZjCesP9YCWj4eARFfLTKQhdfCWfGj5ICo=@vger.kernel.org
X-Gm-Message-State: AFuF++mHvTetvfpok3VcWxjp+sV939iO9j7VFn4HDm4XSTTXHv+N1TCJ
	99wiU4lA3FSeHKtPR7R7SmWb2JgOKIUOARwbopRUd8mHdfuHTLWVHbrN
X-Gm-Gg: AYBFou05jEIJ79tMakR0C74lG0RccgM6ZDDzvUzuFuZUwBkPCvxCRaLIJd8pw3I70TZ
	dftjDe+ceDGman3gzhY6JfAFL7N+coAdI8g09OVZMP4l6vdknOCrhWNN/D54YLri9MIGDEHSIz3
	ori98epIW6DxaB5wAqCh9EaY0OzuTeEcNDWvPmK6ti2mRpKvvjbQb2UgPAOmytR5gHfmyHSFZoA
	farxkDBXXiCSkyTfC40WYd3ymIpUPmsxdidh6aBcTOJQQzOU4CdbXOZMNYlK/w5HfdGjoE/QH8U
	HWS9GHF8nx6I58d5zoCEKzxaImp8A+g6ps6+WXamPpzOvUcp0B/aNMV5uvyPJy2sY40KBbozBAB
	8nP4vAmCpobjc2imYvzoSLT+deJF8Oatv8tI8x+l/Qpku3CSWsSVTwEQI/KQkMs9mOsXxqzCN18
	V6P3VRdLFue2B+kEmRLRsFikSKWhrfssbkFn6evxxBod4WcJVDaTEpyuVijQ==
X-Received: by 2002:a05:600c:3b0a:b0:49c:f13e:e4c with SMTP id 5b1f17b1804b1-49cf86f49b5mr128633775e9.9.1788648755042;
        Sat, 05 Sep 2026 15:52:35 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7740d44sm405224965e9.15.2026.09.05.15.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 15:52:34 -0700 (PDT)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: netdev@vger.kernel.org
Cc: david@ixit.cz,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>,
	syzbot+1e3df0852e82c21ca418@syzkaller.appspotmail.com
Subject: [PATCH net v2] nfc: llcp: fix slab-out-of-bounds read in nfc_llcp_wks_sap()
Date: Sun,  6 Sep 2026 01:48:43 +0300
Message-ID: <20260905225211.596366-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903165014.497490-1-omermetekaya0@gmail.com>
References: <20260903165014.497490-1-omermetekaya0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

nfc_llcp_wks_sap() passes service_name to pr_debug() using the %s
format specifier. The service_name buffer is allocated via kmemdup()
in llcp_sock_bind() and is not null-terminated, causing
__dynamic_pr_debug() to read beyond the allocated region:

  KASAN: slab-out-of-bounds Read in __dynamic_pr_debug

Fix by using %.*s with service_name_len to limit the output to the
actual length of the string.

Reported-by: syzbot+1e3df0852e82c21ca418@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1e3df0852e82c21ca418
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
v2: Changed prefix to [PATCH net] but still I could not find the Fixes: tag both in the gitblame and the lore.
 net/nfc/llcp_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index cac1b5487064..fda236e4d9fd 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -341,7 +341,7 @@ static int nfc_llcp_wks_sap(const char *service_name, size_t service_name_len)
 {
 	int sap, num_wks;
 
-	pr_debug("%s\n", service_name);
+	pr_debug("%.*s\n", (int)service_name_len, service_name);
 
 	if (service_name == NULL)
 		return -EINVAL;
-- 
2.55.0

