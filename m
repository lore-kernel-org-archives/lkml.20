Received: from mail-yx2-f10.google.com (mail-yx2-f10.google.com [74.125.224.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E2A305692
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 06:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791180035; cv=none; b=AhnpdsvohQVAmJ1BIWkX7HuPudlnmg70nvzoSxDH6RJAfVW7reR9xB+GQY84ZfFlMy3ztKGRDFM8k4uZbac1OJJCF0cEjcOVlLhDTo8qVcUpaK3vA9qvEkKNImmbH0HsQOPgofy7Sfe2u2t72K64+zbfHQEg2EPm8G5ZXsrcEHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791180035; c=relaxed/simple;
	bh=ZsHnozCFRe8N55w99HabQxN8D2KdU1j/ypL3jxREuRY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CsAav1K3//+lIublTRnJlpnb2lG+kSyqPVh7ihdytGVcYAOb6rnyyLF+enRI+FEaXtUhfgk+y22KyG4tVxTcF5eu8+iMRan6fikaiWnthWveb5+XFP79lTwwKXG+jFodWMRrsNIF8ZAe1h8AOoT5sMbKx3K7c72kDx44jzcYte0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gRYULtAt; arc=none smtp.client-ip=74.125.224.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gRYULtAt"
Received: by mail-yx2-f10.google.com with SMTP id 956f58d0204a3-66c711552cbso589906d50.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 23:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791180031; x=1791784831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SUcUukBNYZdbFMBXRaDby96SHcIwSALeSewClcQZ668=;
        b=gRYULtAtKBBOgGWAUJrpuqkvShG5GGPH+lwl9LqyUW9LL/567VtLTRj3cC16sAQlpe
         1y+o53sdU9IkQSnQpdf6BUekiZVQB0313pKBHkMcGCbJTbH0lxN3KU08swiory2tgc06
         XeJ/Jv/FbrGWkgtKWpPuQHzLm/W0DG3AdTKZErPxaujZaT7XaYrD6DG1B5gRi81OINT1
         Zs6w47QjWG/T88Dvqauzvx0GQJHy+YSdkm/ubS37p+J5mCM6yZK0yJV0i8HyiUpK5d7+
         RHftWIBYS/aY/okIrhc+lMbezq6/ThqXUpWJY47JU4MsKE8Mqpex+l1iL7zttfVyi9zg
         P7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791180031; x=1791784831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SUcUukBNYZdbFMBXRaDby96SHcIwSALeSewClcQZ668=;
        b=anQGtd8aViO0fQ1+Yq2BBoE+rNCdI/PfetwirZLX9OZWmA5PS/xQkGFheOdbNiAXuD
         +H4WpyYYa92WNORrxpdqhoxCBbfoS3zdS4jDEW1jZHsvDMJCdEPE9j8ekrETIyUR98va
         rNaFe7JISiFskjnhpBln0yEvJpEDfysVoBdejg8jRy7FCRFisTtGsQivtWfsGK13H9ma
         cOdgbYhrqQPQNX6Ebg/2hgOT6VrC60q2x+9lMaiHz9KGfwADvhEfAwmJzWJxMZs3tx23
         GUSECofuJlWos/KN5V71VEHkiLXTKOS+JUz/T4kSNGefCoyopdDKqz6HSXLZvRXzPTjS
         s4pA==
X-Forwarded-Encrypted: i=1; AKwUvBx1C1Z0ywb/8SwHhkeNEbCYr6yHAdnYrX3enjWAsVVLSOUV0/Uh+uxk4A0xT/53jn/lYj5/PHX+Qmpzj64=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqNE/HPw+EiVQ1mLbr6Zt2ygE6C/jWe5EuJOFL17yXKPWRyp37
	lCtr6lHZAjqIfirO3VnucVDscmPjwuk9N6yXoOVT9DOhT/NLXR7maZVO
X-Gm-Gg: AYBFou1T0DnYxDusNVHGPe2BhmwsCRx5cElMpAN8cA6//itBwHzjinhWJg/zex/8fub
	nuZPeMhr7gtZtc2ohlbzD9lJZaiGyz06F3AZDsVbqQ53vDGpf1ibFscpGSV91S8NPouWdBquf91
	aCemNvW5rmqDT4TsSZTn9w6d64uxOFHlyKEk+G/tVFCN3GPU2fPZ3AHMKvM0+NcPWmavz1Re533
	A+DV8nzaRu4+UBwFR3y+/PvwEDckwjanoLRKCNvnANlp6yszc7mIK2dX/dbM5OCoXhURh4ULro2
	QzCFkB+BRd0bskK6Xh4LOkWE0E7PLbAQKk3TY1yV8j3UT3mvzRcw9WNuUsSFMdBoBIkeRNDEApx
	yxyQtybcuEINuC5QP9sV8Jre+lY2GwFNc5PZm2LV4iKO5gZs2aMw7BmDKXSa+2ImQYO8XTJEI+1
	X90ALPf//ywLAIXGciGLSSiUAC+KysAsuiYdjN23QLsIDjThO79z4ncj46GEBaP7iZOY7gC6S75
	EzUmCLfuHAuP0kjJ4dSNm5RB0GQ+0NWtu5JunTe0nRboLdkG8zd
X-Received: by 2002:a05:690e:4090:b0:677:c85f:2abe with SMTP id 956f58d0204a3-677c85f396dmr1858797d50.7.1791180030581;
        Sun, 04 Oct 2026 23:00:30 -0700 (PDT)
Received: from Xinshengs-MBP.attlocal.net ([2600:1702:7d20:7d20:edd1:61d6:442f:e3ff])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8ae33fe81fdsm35786777b3.47.2026.10.04.23.00.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 04 Oct 2026 23:00:30 -0700 (PDT)
From: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Subject: [PATCH net] net: usb: r8153_ecm: reject short register reads
Date: Mon,  5 Oct 2026 01:59:43 -0400
Message-ID: <20261005055943.35180-1-xinsheng.zhu.ny@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pla_read_word() and pla_write_word() read four bytes into an
uninitialized stack variable, but only check usbnet_read_cmd() for
negative return values. The helper can also return a non-negative
length smaller than requested, leaving part or all of tmp
uninitialized.

pla_read_word() may then derive the register value from uninitialized
bytes. pla_write_word() may include uninitialized bytes in the buffer
sent to the device during its read-modify-write operation.

Require the return value to equal sizeof(tmp) before using the buffer.
Return -ENODATA for short reads while preserving negative errors from
usbnet_read_cmd().

Found by manual code inspection with LLM assistance. The issue has not
been reproduced at runtime.

Fixes: c1aedf015ebd ("net/usb/r8153_ecm: support ECM mode for RTL8153")
Signed-off-by: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
---
 drivers/net/usb/r8153_ecm.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/usb/r8153_ecm.c b/drivers/net/usb/r8153_ecm.c
index 8d860dacdf49..0988a3444c55 100644
--- a/drivers/net/usb/r8153_ecm.c
+++ b/drivers/net/usb/r8153_ecm.c
@@ -23,8 +23,10 @@ static int pla_read_word(struct usbnet *dev, u16 index)
 
 	ret = usbnet_read_cmd(dev, RTL8152_REQ_GET_REGS, RTL8152_REQT_READ, index,
 			      MCU_TYPE_PLA | byen, &tmp, sizeof(tmp));
-	if (ret < 0)
+	if (ret != sizeof(tmp)) {
+		ret = ret < 0 ? ret : -ENODATA;
 		goto out;
+	}
 
 	ret = __le32_to_cpu(tmp);
 	ret >>= (shift * 8);
@@ -55,8 +57,10 @@ static int pla_write_word(struct usbnet *dev, u16 index, u32 data)
 	ret = usbnet_read_cmd(dev, RTL8152_REQ_GET_REGS, RTL8152_REQT_READ, index,
 			      MCU_TYPE_PLA | byen, &tmp, sizeof(tmp));
 
-	if (ret < 0)
+	if (ret != sizeof(tmp)) {
+		ret = ret < 0 ? ret : -ENODATA;
 		goto out;
+	}
 
 	data |= __le32_to_cpu(tmp) & ~mask;
 	tmp = __cpu_to_le32(data);

base-commit: 6dc989ea46b96ce170840174b4a38c4a387fb005
-- 
2.54.0 (Apple Git-157)

