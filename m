Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792526198;
	b=ztDIaDKisigih9M2VzwWQcPUQF29DBBtUCy9DIgWRf+z34TpoSybFw8wM+gWw9++/zlK
	 j0RvdYfHYNT/J87JU8wwS2IJKDLmPPjPOyaTyh3WC400+E4TYz6BUu0aegAcPGKmX7qFU
	 T+sIEOW6uBiowbd2oOxv+UEF7HVumacYcOgr2LuetftrBZLSeL+5eETsU1QXbEbCNO2CM
	 PaoSKE+1/oor6DsuE8xSUmo+qgZYMBMK94EdW3XXxwvDwmwqS0Y8em33XoMYGOROVqDHs
	 vgYBQiND/tJIm3eCMOPiCKoGCwjr9RJmCCEPu9P6VYKbjzyzspiBuR8z+hCmcF9PXLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792526198;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=mpQ3RiWaLmkacBrX11wLWQ7ZHjfXoVlldjLf+y4vUcc=;
	b=pQWuQQnWet1geP9Y3e9D49OZjERivIKCU9xwbTjf4Z6DDw9cjQQdRAEObImMjLgUh3kn
	 xDqBBacnbS0OtIKGBzh5CctIfFNhSlNOrf8IgC602TrBfNDHddhxmWl77nUHwKnuOS+2q
	 04bnrtPfvn3nI0mK5P//pmtuoKch8eiwPoQeY2N9mLR6PuuRf5q9ozpkjvF3y5kbWuAEJ
	 v/NGKQgfRUY7N6rwKoajobdyMfVbe5UfDC9GHillna1TXTA9J/apgFq+JNG6z4NevTmX4
	 Ii6zkRg8znJgVYfG1pGCkNY58eW3ePglxB+g8QX1WRxQQxytAPyqw11JsG5OmVmZIlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZwpWDIKt;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15ACF606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15ACF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZwpWDIKt
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1fa22006cso23155e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792526195; x=1793130995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mpQ3RiWaLmkacBrX11wLWQ7ZHjfXoVlldjLf+y4vUcc=;
        b=ZwpWDIKtt08y2XY2XJbdbDMsdI3O3ojs/U6Qb5zbdYWZiPXpPE9gF89HadmJa1jcrM
         8VeRguG42uIlGtJ93H16GwgPsu+R1sIK1VAUwBv8/9CfVvs/lP/7je7CL8uigPPekNo9
         szIUhsIU6mG8dyUKvAl49igo8+SXGa8ov9PBEmlGFLkYGEDoNly3aHI3CLcLGGH8vgXG
         XkMLBrXGCDWO7ZB5AhlXFvb+yI5r3kcK11X1HLs4podPeQxPDDbQmXqTasZ3nDU+jE2f
         KVTa9IiMM5wcSh1WUePySQ/cdhLDaZ0t6oFnmhimDtrPE1W0KRivezpX7LFnXKp17sRt
         b5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792526195; x=1793130995;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mpQ3RiWaLmkacBrX11wLWQ7ZHjfXoVlldjLf+y4vUcc=;
        b=neEyBmSClCBcnsMvDh3n5gWq/eztvxwVFf9iwBvVEYYJhnOrzz95VGFS5QmJuVp3gn
         d03HsNAw0vOzuyNURJ/TQ8ac5zm6ehPwRz5/4ujHvcS00+7kqd0+RV4k22jVhj62SWjd
         Ny7XbgHV3kf5HTtlWBznJ3Fr79XMmjZr/gtWYxSbZnR+O+3fCBdTx+Jnph++VgC8czQW
         v/QR7L0UVNwNS4C4p9apPbA+YLyki6dLeaL9JxtZc1ilGOO5PN91d6CEp25N7dPPhs0g
         FccJC1e1eVU4Uyzvf9pkaeLTzdJ8tqUaDQgnzNVs5evE68SbeYHAz5SW/nlWkMD/8cAl
         JV5g==
X-Forwarded-Encrypted: i=1; AKwUvByQQdnFuUGGFPisEWG55N34Pv2FfP1wb2if5apb99e5jD11OVz99rGLpxYXdqTsPAzAKd/xI+QTPhALcEY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrC3MyoMnEzo6SOaWUN1awGjl/c+mY/JhtThL6Z9exdE1rnW+/
	gRaBJklOBx2W3tR4i126ec/ucIlbjDY1PC64LNSlvvlS/STVEbzvg3Y2
X-Gm-Gg: AYBFou2UxmNNgNaKbU6N59ENPKymR1P8NH8cvyNM9dYyfNnWhDi5iQwIZUTn4w7Lhk6
	xb4QVLVHOvFu1NbEVw1nV6/S3V0Amz44hGQvRbAdFPzz7tzX+HYGhyb1En+QgWfKh6qPznT1/CS
	sHc0zUWWuJxUjPIGKCGMLKhX+exbaXmPcSxb5WTCZp4+s2LZT36kCmQ6zrRcVKcCqbu0OknhMDz
	eQyXpWC41xUqJE48pHDvhFuF6KTKIqB+aFOEmByYPnrWmi65uhxt3ONWQduoVaoDVYwvgxIVgkj
	oZ7ufCJhEEFs3KcCvrZPNELqQTlL90ctRVu4DRRugCcY+muvAjH8yH8ek0YdZRfWv2Wx+604CX/
	EcnYPv0bxmMmCm/QR/UsoNCu/EAneBxBL4Vg/8gagpQnIrja8E4NxgYDUw2oI0WZdehvGuA+WAS
	FgYOFXCeY5bSI5iVBEvz7M8OLOhfVMsEB1tTFoUm1BykuCfipKxXYuQToVzHxircMMSbn8XDVBo
	87xzwFEBxI=
X-Received: by 2002:a05:600c:190e:b0:4a1:90d7:88a8 with SMTP id 5b1f17b1804b1-4a1d76106c0mr259156705e9.25.1792526195325;
        Tue, 20 Oct 2026 12:56:35 -0700 (PDT)
Received: from ADRIAN-PC.lan ([171.22.87.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d699dasm103092035e9.12.2026.10.20.12.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 12:56:34 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
To: Carlos Maiolino <cem@kernel.org>
Cc: "Darrick J . Wong" <djwong@kernel.org>,
	linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
Subject: [PATCH] xfs: add __printf attribute to xfs_buf_alert_ratelimited()
Date: Tue, 20 Oct 2026 21:56:28 +0200
Message-Id: <20261020195628.248878-1-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.39.5
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

xfs_printk_level() and _xfs_alert_tag() in fs/xfs/xfs_message.h are
annotated with __printf(3, 4), but xfs_buf_alert_ratelimited() in the
same header is missing the attribute.

Because xfs_buf_alert_ratelimited() formats its variadic arguments via
struct va_format and %pV, the compiler does not suggest the format
attribute under -Wsuggest-attribute=format, and callers do not get
compile-time format string checking.

Add __printf(3, 4) to xfs_buf_alert_ratelimited() to match the other
logging helpers in fs/xfs/xfs_message.h.

Signed-off-by: Adrián García Casado <adriangarciacasado42@gmail.com>
---
 fs/xfs/xfs_message.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/xfs/xfs_message.h b/fs/xfs/xfs_message.h
index 811b885f41..bfae8dddc9 100644
--- a/fs/xfs/xfs_message.h
+++ b/fs/xfs/xfs_message.h
@@ -87,6 +87,7 @@ void asswarn(struct xfs_mount *mp, char *expr, char *f, int l);
 
 extern void xfs_hex_dump(const void *p, int length);
 
+__printf(3, 4)
 void xfs_buf_alert_ratelimited(struct xfs_buf *bp, const char *rlmsg,
 			       const char *fmt, ...);
 
-- 
2.39.5

