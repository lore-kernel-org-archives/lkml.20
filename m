Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794229196;
	b=LFR0LMX7wB8MZPxvLKY/HGWAuL0dMOHJ8vZ152+2NNhw2z2I1cac4P6A2FQGaBMsHScq
	 /2d8tEC1E5dRvuZJX23iMIO78Wv9FXiPU+wMMaU9OR4A6ZNicrz0TcJTbErxh84a4Wq5b
	 H+cXlGL6lUaFDj2X7mVDpbgApHnqC0Y5Lp3Tn5oSTQwbw1WfTYxyH/l1ugo4oeoFOPiMg
	 sPh/D7qynrFU9S2w9R8Kf5gOlw5qKb808FuhFzPe5CbyPXitWKN5DMTP8WVcPIvlN3a41
	 gsn1Ox37pCyBkjN02c5n0e0GOSJBeWbpIxpGVPqlJhzyBGmIjSQS2ktYyIT15hD164A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794229196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=aMEQbLRWx17UCfhc8SBN68gRj/bApfnEMsZRvsnpiIo=;
	b=F6Mtib+NL58/XstHC/p2msjkPtYKjCm0Pwjnm/g5E6Hp6YqdEcvXpQAPPa0MOrHVYkZu
	 YH2IZTETBcjWN8GIf6oOyMnvlLk5/ZyK0ATUkCc585GPYDeyfTSmW5gkUu0XEhZSGWUWH
	 Kbzbojg6n1RWczjIUpJ226U9ynK7OX+qb2NgW9t33LlIEphdFgeiRDwQhuTc1dc3pNA0b
	 58Viut3Lrh4Lwab9skyrwWSbYxMER9Y6kv6BuKLHdwCgJs1BWRCBpS898C9cMGU9Y2bVK
	 9MMd/SlEl8LMm1pEwEHCB5i9uvUzwbFFyYOXl20d6Inp3NDt54SgDbSbQpya/4VD39Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=doiTHSSv;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B415606D815
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B415606D815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=doiTHSSv
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3acb1224533so86706a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 04:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794229195; x=1794833995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aMEQbLRWx17UCfhc8SBN68gRj/bApfnEMsZRvsnpiIo=;
        b=doiTHSSvB2o3/0cOmhkLHZM+mrUrp33VHW5YXgurmMGPltIigcPtucKoslLyLxgAli
         4Cz8ZwVMZpV3Bo8Oe4sOrZqro0l9A/vLpIFELrEvuk2qfrSYvcVAmU2MGtjb2O3mvM0E
         gZpm4ylzCEbL2YSCu96rmlqeQ7x/UDJjggwz3wfeKuh9Rq7isDu5lrXi/xDvCo0Go4AJ
         m/j9UPgAXftrnpLcJK+nKIRpEdokqTZjKJpGjJtKLNsbRyNxvLNDAcTg3jChYb4T7HOQ
         MzT3B3p2aqDRz5a40jT99sxNw90kkzYu4oaWB5DQETel0FCOBzxkkWYlVC3W8rACKd27
         PY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794229195; x=1794833995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aMEQbLRWx17UCfhc8SBN68gRj/bApfnEMsZRvsnpiIo=;
        b=bgYDx3c7s1ikQ0zSFRrgWH/qtgRfc5WhzBZT+YwZTKHpNbigKqhCJ4OCFBd5ZojsRk
         /q7ODX3MVxWCTkGEIoI2Hl69AJQKRklM6u7aGzJ8TJoQpxiUCx1cN1Vd/MQu+ZlJlmhp
         NpUzRvjKVtC+zAJjabItzyMQRNaNUgc8T6ThbqS0FSk+OHAni5babFuVQN9m1A/v7mw7
         FDsg+zZcNcG6WNqECnZhIm9JQur2OjpUR/0PZyblAncqu0X++zQ0bygLVqszvFmQA9h8
         gghWyfemNvcHBLWQt/K3s/ZziFGkR3kITM294YyI/xYRKNJxmJMrBcE1yDfnZnc96W3X
         HyKA==
X-Forwarded-Encrypted: i=1; AL+hErGj2gfRZE7cidTjgmhzYLt+BJHRFQkNKEKOSZxS7jhLEozGE+SSlnJ8U5hF97VIhjJ0YXM7Mgqj6AE4/yk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sRG5T2mbNtWlMPGeGzxdfu4IddpILDkmuHr/20gTJrd8u9yjJ
	UK09e2jK1QsFlTTa5MdEye9JQOSJCM+GltTHP3cnKahlxpWR2sZhmdhk
X-Gm-Gg: AYBFou2pukJERqn7RnsQTfl/Xcfwv6DL/8y1u0C2a3PmphDGCfFYi5OmCmILPLxS83Z
	dNbcVxsWvH1Cv5SixtgHH1U4nPqKLKL4ieYdj5iLQWfcVG+roCHXQESQiAEdge6zAp8+du5KXPq
	w4FKvSfbS0+fqNVveLW2/vP6LeZJD4ATAu/UoObHgtz7B9HTX/AnC4KI5jxLqOR3J68YBFyFZM8
	ToCorsA0hZLpHrjK3Hk67f1CE7cBC8bpb1Xgq8TraSjf2vQ9OMjZePEW7FNPdiX4wlbTgHYqaIw
	fAp3pfHihqbVEBpPLwWT/UpO7N6Bf+3J8FkNiaZNx6OU3XuXjZQ74dKlr7ajYASNDFeQgHo1BD4
	TXrs3tmfHaUbFG1wQg3EZ6dPzcRZWjE1+Rg28t0MrxUUq2fWSady2vdVFpaXNS13qQsqNZhKkKA
	DRh5LfW7YbQyqJX1KVGi1Fg6aIqXqgtjVwqlGghdmH7RkLNtPTxNKrx2xfsXUGAEz3OVfpCEFTH
	rxbnsRPhw/IsORAuQd9GCZ3Mf62fYggINl35zRH1u/Jjz3G1cuM58lUWHo1VHsrjK19gzzJRl3e
	y8XfyW316mhEwaUsROYRHiFGOt48w7CNguBnnziSy5wi5xkuCQBMXO52D6dPmdNzQRk=
X-Received: by 2002:a17:90b:1802:b0:3a0:238b:db4d with SMTP id 98e67ed59e1d1-3b12d44183fmr6666950a91.5.1794229194774;
        Mon, 09 Nov 2026 04:59:54 -0800 (PST)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb969694aasm1534153a12.25.2026.11.09.04.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:59:54 -0800 (PST)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
Date: Mon, 09 Nov 2026 20:59:31 +0800
Subject: [PATCH v2 3/3] docs: zsmalloc: describe statistics with
 CONFIG_DEBUG_FS
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261109-zsmalloc_stat-v2-3-caee41684aba@gmail.com>
References: <20261109-zsmalloc_stat-v2-0-caee41684aba@gmail.com>
In-Reply-To: <20261109-zsmalloc_stat-v2-0-caee41684aba@gmail.com>
To: Minchan Kim <minchan@kernel.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Nhat Pham <nphamcs@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Xueyuan Chen <xueyuan.chen21@gmail.com>
X-Mailer: b4 0.16.0

Zsmalloc statistics are now available when debugfs is enabled. Replace
references to CONFIG_ZSMALLOC_STAT with CONFIG_DEBUG_FS in the English
and Chinese documentation.

Suggested-by: Nhat Pham <nphamcs@gmail.com>
Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 Documentation/mm/zsmalloc.rst                    | 2 +-
 Documentation/translations/zh_CN/mm/zsmalloc.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/mm/zsmalloc.rst b/Documentation/mm/zsmalloc.rst
index d2bbecd78e14..8c61733c6749 100644
--- a/Documentation/mm/zsmalloc.rst
+++ b/Documentation/mm/zsmalloc.rst
@@ -33,7 +33,7 @@ proper handle-based APIs.
 stat
 ====
 
-With CONFIG_ZSMALLOC_STAT, we could see zsmalloc internal information via
+With CONFIG_DEBUG_FS, we could see zsmalloc internal information via
 ``/sys/kernel/debug/zsmalloc/<user name>``. Here is a sample of stat output::
 
  # cat /sys/kernel/debug/zsmalloc/zram0/classes
diff --git a/Documentation/translations/zh_CN/mm/zsmalloc.rst b/Documentation/translations/zh_CN/mm/zsmalloc.rst
index 4c8c9b1006a9..d163f4aab341 100644
--- a/Documentation/translations/zh_CN/mm/zsmalloc.rst
+++ b/Documentation/translations/zh_CN/mm/zsmalloc.rst
@@ -32,7 +32,7 @@ zs_unmap_object()解除映射。
 stat
 ====
 
-通过CONFIG_ZSMALLOC_STAT，我们可以通过 ``/sys/kernel/debug/zsmalloc/<user name>``
+通过CONFIG_DEBUG_FS，我们可以通过 ``/sys/kernel/debug/zsmalloc/<user name>``
 看到zsmalloc内部信息。下面是一个统计输出的例子。::
 
  # cat /sys/kernel/debug/zsmalloc/zram0/classes

-- 
2.47.3

