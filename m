Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8910845D18C
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791364920; cv=none; b=fQfhEp/vtK8xnCzPaGrwf+djmHiyEvXtcWAvNjOkjjmUHOVNyBtFGuveYxuG9MVhlj98vyfSNgbuPPt1hEbLXdvaxdVFl/fg8DZaLFVDnWIP0SfYRbSXlc3OqIf3bOqGg8bAUh7wcsyxowtrv5BW9eFaXuGjcmXFHpcKNXinru8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791364920; c=relaxed/simple;
	bh=rLAfTReqQBy5oHycSykWo3YZxdP2tCK7HFvuwX22jJc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=McZovECdRAjlFfPkW2g1zmXa+0u9tP4nuv6IPtUno0pMv+E5MdRI7wPKWkWRVj44/DpoC5/+ua/EmyBiOqQDSooGqKdpnP8C3OLUyFETuSsM/NK2dIQngE+IdJRdFyy/FC9C3rmLY/E3rUp2bLchWHxXKJtUp3MBAxd+JmQrvig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jYd+cxhP; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jYd+cxhP"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so1269739a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791364891; x=1791969691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2e78eUVa9cie6XDXt1bL14kso3QrI8dR7GF7W0M/Zv4=;
        b=jYd+cxhPdI4r25f+KRwanWzxwU4IMvHgx4WXaUHdp+0O5SoheHqTRVsAO7Uv7t4MKq
         eRg73GIb58n85q4nhnIK1ib7YfMeOb6IuhpVELlsmGaSi4ZPmzFcFprwClqOMIYYtn2H
         c2O4l3ansNYvi9R0VHQKBioKNmwGY7MRNuPiA57YWmam9sD/i6dy9ibB+YC4qF9C+4Qf
         60K1e49QxihPqBf6siteTLRwLcK+I5g/M/Fqq0EaEv18SDQ07APOGL1wIQXErtafVYWU
         hG1cd3xK5fnmdlHV9aGWoA9HM7Z/VfJe4ENc1+epPwW7X8qKjtFqr8Zk53dXYn1hEqYe
         1jtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791364891; x=1791969691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2e78eUVa9cie6XDXt1bL14kso3QrI8dR7GF7W0M/Zv4=;
        b=C+VYvY046SUShK7dOwwN8Z3QXd5qVySRJQVqRl5l+/hTLVy5n55+QSyMeOVRxtMRqB
         Ou8wQ7edlMs2XswpqKSjgVTq6JHlICOHnOFdZxhvJITPsN3Ve/PS++4d7cGz8q8PN2Me
         qeJ1rYAHSrQbFbxq4j8lEQ522B1Gl7iFqOQ6ricRWSctmWBTE08nWTQIsyi7lcNNSzi3
         xnzIpLwP6DkwE5GzWSh9RROR8PFPcho0HmHRIAjh+1/Ud6KuoMxdQhs8Ko2/iJ80Kcc/
         rQEocIlkOEmwCtS5XceVx8sGj/aHg3Z6Hd4wcOnCYXf/RacM4a9FeXyWTrCFKs/1Ns1f
         8UnQ==
X-Gm-Message-State: AFq9FYKaZd20GOjuptUo0Aq8VzsV5fMKV11129OlLwqZKeODdxZvlznD
	KkX08g6jM4kF0/qPbBst8MZCIyOK1qE8BMu6LKgVmaJ9rL9pd0TCR42H
X-Gm-Gg: AYBFou2O5PZStH2FSkb/8X5RvXl8AYOizB0hcFcri4T9QC9IeEV1FqzpAn8op/4TQSB
	58up9nC+ccxzvMZCE3NVJQhl2A0QDg/ChcEZk1qRLmk3MJ+6ADiavOsYvUAJ/8ZKKhj1B4W1Ljo
	q78dk0EQmkSe1URrcohd7BfrkjUWA1IjkISIFj3qJ3MJXgOeIhtByDYw41pfaunzdzQGcR/GT9i
	El2AkbkQpPa7h7jiX9ai85y4/50tvmSJ5pXHIoT0huVU5AqIIlSIwyiSb9jilHSwJwoqvE957bS
	RkzyztHDf/ulAazwXO5RPzi311Yzb1IV/j1YMB5vKutGP++j4h+WEoTkGZNdrmBX7jS9xY47S74
	zgwoVmK5Ds/F3e4DsxVx+GtKbxU0USUI93vWnnpy0Lk5zSSnMJV9HV635QVJtQ3qve/2R3Lbh7y
	kWUdZbfUiigeQnDyW7hNXA93jMW+L80PXfYhxs7o4DO41ulSEYYWoiXDzDyy5TYsUraBIRlbCwi
	lvXuLU/tqOwar8VHyQwfKgAp2H9p47kzIjawQPl
X-Received: by 2002:a17:902:ef4f:b0:2e6:943:39e0 with SMTP id d9443c01a7336-2e609433caemr10540805ad.29.1791364890628;
        Wed, 07 Oct 2026 02:21:30 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe0e8sm7180675ad.25.2026.10.07.02.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:21:29 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <a0282524688@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v8 04/13] mfd: nct6694: Ignore interrupts without a mapping
Date: Wed,  7 Oct 2026 17:20:53 +0800
Message-Id: <20261007092102.3768818-5-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007092102.3768818-1-a0282524688@gmail.com>
References: <20261007092102.3768818-1-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Yu <a0282524688@gmail.com>

The return value of irq_find_mapping() is passed straight to
generic_handle_irq_safe(). If the device reports a hardware interrupt
that has no mapping, irq_find_mapping() returns 0 and the handler of
the system's IRQ 0 is invoked instead.

Use generic_handle_domain_irq_safe(), which ignores unmapped hardware
interrupts.

Fixes: 51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694")
Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v8:
- New patch. Use generic_handle_domain_irq_safe() so that unmapped
  interrupts are ignored.

 drivers/mfd/nct6694.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
index de0027c98726..4f5a5b855de2 100644
--- a/drivers/mfd/nct6694.c
+++ b/drivers/mfd/nct6694.c
@@ -227,7 +227,7 @@ static void usb_int_callback(struct urb *urb)
 	while (int_status) {
 		int irq = __ffs(int_status);
 
-		generic_handle_irq_safe(irq_find_mapping(nct6694->domain, irq));
+		generic_handle_domain_irq_safe(nct6694->domain, irq);
 		int_status &= ~BIT(irq);
 	}
 
-- 
2.34.1

