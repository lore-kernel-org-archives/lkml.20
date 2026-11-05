Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892781;
	b=UcvAKH6dEpxIZ1QawhlJFn7JaPft1PIX+hR3m7c1RpqfVnQoTeGM9j1D0hGEuCCpAHWQ
	 Xx+KiKPlVMl1Qglip7Uv5eVyG95DmOwFcfPHbN8nnqG3FJ4ziuneSJUMTjC+Ms84Aa7aM
	 +JBFKs1GseXKIEdoLs08IKnC6/EjztXdRcep6nnxg/DdIXuxFA+3+7K6vpfAlh2t5fK3j
	 LSqPKRYu52GZ49Qy3Cx4TQtzAa4Xglo7L3Qr6BKs+NVuaAEHt1MJ39PY+zKS6IbK/r3pc
	 vMFLkiy0e86tHKfMLFutH66MUwiKQSXxiowysb1HEz33GSHvdbYsAEhMTIm95JawotQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=uuK+rC+pImDa1yKVfuZPUdIKUxMs888mCbmWCUYCr2E=;
	b=u20j7uwmMkDtsXZPook7c3Bvjvzm6MpB4qriq7L1Is7kxSHJQaykVYSgK045LdnK5Sg9
	 Mvi8tBwMNTt5F8u9/wEOwFacTNAAR0RAiPjuFGAkEZCvc8e0scUo+tGHKKvs2IZ3gRZt4
	 VThtu+sJXOMShyrrgcKcjfDBNlZp1W2MA6FoD/1lVZj0Xk078pW7Hv8XEK75a1w5AtEr/
	 fpmsY62C1itqNfYzOt1PyIaxswxC3C6pkyxYHaX72YF00JszjLikjdy3OBiWojdZGVYLr
	 v5h7REOYGWmA8j2CKvQK+Vu9T0CPuiGr1+1saAJPP7jgS6lsmVtfdeNaVrc4Ze/GFbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=cQPvhp7m;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6BC606EEA4
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A6BC606EEA4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=cQPvhp7m
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-945ae2daa3eso238851785a.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793892779; x=1794497579; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uuK+rC+pImDa1yKVfuZPUdIKUxMs888mCbmWCUYCr2E=;
        b=cQPvhp7m8BX+lPfKLlWHCQ91glFCJotQdDSPuAKrDP1k6PSvzB7KcdbfsJbu9SwkKL
         JP8ha48FLZ5ddf4+Wc36+U7H9xAH8Ah1A0E4mrP+V6xWskCJjWey3qM7j0n7CVSlsI/T
         oK/7bXWoNmgN2VbC7Bd8FpKBNiqUFtA7ydN82CaUXZ3AafMrPaKmzpsSLL4oL2p8yYKK
         2zQCGRdLg1/t9ZeVUGuUzRSvdVwVaruzHJ5dtwR6nOaRcSCCsU3qFmB223boHyuSc3Sr
         2BesPaaJf9D3LyZGt7IjCOM0xSgZrr/mcy36+UIEzx82mhe1QVEFdxirx3Zt6yoDBWBm
         ykWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892779; x=1794497579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uuK+rC+pImDa1yKVfuZPUdIKUxMs888mCbmWCUYCr2E=;
        b=ppHR20M2DhNlBslIKk6YEufTv5yzL3sbyfMNuqw2F9+xoZcdf6s6yDZy8e3ORpOQi5
         hmFF9PD3YqMrL6aAix+uPfMFoEH0vVoXctTSgjWHsxFq3XVt0K+DFXTl9+R9Z8pr+Xce
         jU1vBbqQ824cDE+oq9QSWhSJ38oc+Joz4qRr0vjW0de6HBIAUt455SHUBQprG4P9csbB
         hUtUzhFa73YiPshA3V1sFPHzzOXIwQLhBejiGC+MH4yswuU1us9Lpltc+1qFU2w7NFf2
         f91uW2p/mvzgzWjFBcx9xWWH0YPuAmHWojS6sqxGl+NCGWC7oh7XeNp+gws5DzWsXo04
         LNmw==
X-Forwarded-Encrypted: i=1; AKwUvByLpcd1TDVgjWcvD5YjmlACQWR3eFpd7wsQuMfGwYXxbGPtuYqyWFpl9oBQjuoJf64Jrm6tN3Zpk7ioOgY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vvd3QfwU4ih/V9SKWFXg2gO529OSkzVNogWtOfwemCOQtTG+L
	IMvT3jdW0Vi33CWVwUHkYeo9MgGCs1zaqCrOGdOvUuRRG4Ite7tfG2jOWfogXVQfljY=
X-Gm-Gg: AYBFou2ILYNLvcDis2M7xleQCDxMKPwDeHIk2egiU4MN6S97iOa3NH6WSuX7zGCoHbg
	C7npqS82lep32mS3U/7n2ARYmJhSTcCmK41Cqo6qwnX263Q4KeBSYnJntgX1W9kAj7bqNukyx0E
	dhBpPhOr79jhfBDl58gK9wpCZE/cEWdnSKYBmrirCH7uwwzaX0sNVads0DOW9FuXnOhOe3oWgb8
	LBB01BWPIzetU6KkxgwuhfdCdm2SjzwPXSVFldX/8QIekhvZT3LuENBB6gtVHaRx8ky+UqPmL8d
	uo6VIDy1j8Fu//2qWKqCGg5P7xgJVRKidsXDeEhEL8loMliDTsWBHbVRpOvtTacraBNWKeav8AE
	rPrWNVXfNrCqbXvHidCq9oIJn8e45J9b/0wRWRREqVsoyN2NdD2mtWBxEdq8xK6ZXMq47JnUNhC
	8iZIXwkFMt6StwpxdYQVQaVsnbFReEaIq9o2d+nT7uR1u2ZmdXqpA5WrrieGwDMgHor/lAt8bfz
	I/nwfKTQdZuRgFQ6utjCHZcxkbQW70cAL4rOqHDtM/YGwCN0Cqek2p8nl5q96oKeIet1A9ExBdF
	6TgYvPcj8oWGGqE8Nhnzsd64irFHezwJVUBSfIV6QLUJUw==
X-Received: by 2002:a05:620a:2994:b0:940:ed45:c8ea with SMTP id af79cd13be357-944217ee79amr3102793285a.70.1793892779627;
        Thu, 05 Nov 2026 07:32:59 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.247])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e9378dc70sm28503746d6.37.2026.11.05.07.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:32:58 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:03:21 +0000
Subject: [PATCH RFC v3 89/90] MAINTAINERS: add an entry for cells
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
Message-Id: <20261105-b4-cells-v3-89-bc9095937a84@toxicpanda.com>
References: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
In-Reply-To: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
To: Christian Brauner <brauner@kernel.org>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 Andrew Halaney <andrew@amutable.com>, Jeremy Bingham <jbingham@gmail.com>, 
 Tahera Fahimi <taherafahimi@linux.microsoft.com>, 
 Serge Hallyn <sergeh@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890936; l=886;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=bxVFmIQz1A4OV16tOPOyHXBpf39eIIIpZCBMevyfB4w=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFfaG6B9Qm9dwTtpKW0qrQ0wZCihBzNnqkbl7ieEgqy4UhVlxmWdPOoZon/zMuNEBXMWXEVK+uo
 PlLl/5v9RBQI=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

Add an entry for the new files.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 MAINTAINERS | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0bc2c39eb417..faa9f1cc720c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6173,6 +6173,20 @@ F:	arch/powerpc/include/asm/spu*.h
 F:	arch/powerpc/include/uapi/asm/spu*.h
 F:	arch/powerpc/platforms/cell/
 
+CELLS
+M:	Josef Bacik <josef@toxicpanda.com>
+L:	linux-fsdevel@vger.kernel.org
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/userspace-api/cells*.rst
+F:	fs/cellfs.c
+F:	include/linux/cell.h
+F:	include/linux/cell_ids.h
+F:	include/uapi/linux/cell.h
+F:	kernel/cell/
+F:	kernel/embryo.c
+F:	tools/testing/selftests/cell/
+
 CELLWISE CW2015 BATTERY DRIVER
 M:	Tobias Schrammm <t.schramm@manjaro.org>
 S:	Maintained

-- 
2.55.0

