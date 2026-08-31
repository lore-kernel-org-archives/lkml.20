Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A994E80DA
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186770; cv=none; b=UNocTWUTuNnJ+qXmbAEqmmvTLboon2oCetEWOZrTEpi81Ak+V2xUFtKzguX9kd+MAXKlTLKQSAc1dCmxfYjkMDGJROCavOFMBLketiSmaBPe+jGemebkjjdxK9V/MqasbSVkKYGsQTuzLzRhXaEu/7XeA2UkzPRKOFevJ9Yc3Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186770; c=relaxed/simple;
	bh=QjMSkXe0n6TBETzI3Ha2tiZ8wGiaGM9B4fBWkY0BniE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Uf+jwhA0tLygNNiYve1pJ+uKsUYDGbN8juUZlsdvlkiEoi8X7H7WozfQjwh4Qb+qZ5G3reqrNPfegAMfw6vLrIsfd980HRJp/VuoUmtcJlLBFPF9JJc3Oo5lVVLudjU5oTYrstJi5HgViack7Ai94fUCDvc1m3/kdvR+Igk1VcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJnW45oV; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJnW45oV"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4956869750eso23182475e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788186767; x=1788791567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GWaK2495asznjoEZZji7S7Kk6wtOsxYz8ipCUtATvyQ=;
        b=MJnW45oV/XbuoEXUI/vDyeIcwima7IgbqwDMnXUeA9/qA00WI2LnycOSpegEfjJ3bi
         S1l2OLs1aGxU+0h/CUa6vz8m9sMSYJBZzxdx7lDCCFZrHBRXqx2X9dbeF37ywz4aLyFs
         svOD5aWoe8Wi0PpjMjTLOF48AnhGbhzaNjLZ7pQGct4J26cb4GQnS6E3CdGCLXZQjL8q
         zr0Jc4kmjs+j8arYX+UYQq6cKwYODMTavh4E8/aW/6yuqkRRl6TPYgCVo5qAfFxPKC7X
         Il9T/BPZK3G/HB36augVssACj0reTm/X1Z0iDnDkdBsZHEQmzjac3rhGQTE1ZDhxjbYv
         +4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788186767; x=1788791567;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GWaK2495asznjoEZZji7S7Kk6wtOsxYz8ipCUtATvyQ=;
        b=T7HGnm34+Ljn7Dd5G3ev1vvc6zeJzuX7by+jvabf7stApmoiyECjs09A/sOrR0LRKp
         unhFoj64O65gXAOPtEWDhnjVcva6zvHOw8ktyZAetEYAJGE+34zKVHk2wpzs52VpQjoi
         /WYLSJUxzdYg2M3pI5pkoV/T75kMqexQY31w84C/x0cffQdf9u+eTF1Ey5n+X7sZqdhW
         WzaR2rLXL9AMYxyQaokzoRQ9A6m8KGP+7iBRzoRKVkb0YJhCJESLjriZn1l7+DrgwAC4
         iyL2Kbs8+OeDarsb19eFJNcULZhYyR2QQ3X0pf/HgNg/C6v6naOxT/L/lCgazJ3gUJjf
         ecqA==
X-Forwarded-Encrypted: i=1; AHgh+RocnSvhgNwErZHvyh3DOPs/jPvo1IszovGkJsQEucWQWw2oeP7mo3saahTBxx8XyHCeQbNvc8gScWbMeuY=@vger.kernel.org
X-Gm-Message-State: AFuF++lylKxIdoP1dInOrF6RdQ0Tj7JTPKD1e54IZFPrG1qwBWqMSsbI
	2vIfcOeG/UJC/u68EZc0j1PvS/kHjVglRMZpamIT7iFatYVGQl0zItuX
X-Gm-Gg: AR+sD10RXrYXMFxIfJFoqMIqMiR7rYo7ukcyMKkhmZP9rvtWbMFo9HUqXUXn+hHw+Ov
	MLwGvyTbqRVdKxUHJsuP7KJtlhto6ocgr1ILULYxTnkdo7yG2KaJhtYY2r79E3W8j/hyCFwRnsq
	nZugIVN8x3rC8pGO2P8DvQ7MtZDJ543TW2cjP4GJiFxO5dRhQj1yWo5p6Ku6a9JAZqMDWq9lZb7
	ROV+vPjTQu8LJNq0xZudEH0HVIqXRBKVbXIchOQF7q8Tr+1RXUaq/Xu9yTjzQSlzI1Va0k2zpjo
	w4mdLPKkiItGOT1kYUw8+flU29g2++6vwqd4l2RRmgl62zKTLQ5mgXfMLhPe3tKlaMhY8qCzQKf
	1F2nlifVNYgGp8BB63ihdXtvAm32Go3NEEdhIjfWMoTruAoEJoFE2a6NPp1rtoEFhZEZgJKnCvx
	wT4phAjHFjfWc4H9ky6UcE1buHyYtQ8rFsZIp9zjoKKJWonG1yywIwweDFeLk5O81d+JXcRMRcV
	ihq4L7D2v1iAGMISOpq5lMU
X-Received: by 2002:a05:600c:c494:b0:499:8aff:59b6 with SMTP id 5b1f17b1804b1-49b91c486c3mr330092135e9.14.1788186767364;
        Mon, 31 Aug 2026 07:32:47 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b945816f2sm344786125e9.8.2026.08.31.07.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:32:45 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Jason Wang <jasowangio@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH 6/7] docs: ioctl: fix stale NVMe registry entry and note N conflict
Date: Mon, 31 Aug 2026 11:31:24 -0300
Message-ID: <20260831143125.151360-7-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831143125.151360-1-ivanrwcm25@gmail.com>
References: <20260831143125.151360-1-ivanrwcm25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The NVMe row pointed at drivers/block/nvme.c, which no longer exists,
and ioctl numbers 0x80-0x83 overlap between ntsync.h and nvme_ioctl.h
without a conflict! marker.

Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 Documentation/userspace-api/ioctl/ioctl-number.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 2fc53093752d..bb7004e6043d 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -181,8 +181,9 @@ Code  Seq#    Include File                                             Comments
 'M'   01-03  drivers/scsi/megaraid/megaraid_sas.h
 'M'   00-0F  drivers/video/fsl-diu-fb.h                                conflict!
 'N'   00-1F  drivers/usb/scanner.h
-'N'   40-7F  drivers/block/nvme.c
-'N'   80-8F  uapi/linux/ntsync.h                                       NT synchronization primitives
+'N'   40-7F  uapi/linux/nvme_ioctl.h
+'N'   80-83  uapi/linux/ntsync.h and uapi/linux/nvme_ioctl.h           conflict!
+'N'   84-8F  uapi/linux/ntsync.h                                       NT synchronization primitives
                                                                        <mailto:wine-devel@winehq.org>
 'O'   00-06  mtd/ubi-user.h                                            UBI
 'P'   all    linux/soundcard.h                                         conflict!
-- 
2.43.0

