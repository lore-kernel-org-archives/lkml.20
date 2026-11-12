Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491126;
	b=zyNszujj6voVN7lREzymHT2fVaFQOuzFogSKNBnseafvb14Svk0KnF0qEobKX3+vAWKJ
	 ZhhaIrQzp21tWM47YolSUzXlo4pE6cJPjXEtYGn+aPFsRy5VdnOhc+Izkf7UrYUv6NiAv
	 gl+q335LbJNbEwz8iZsawDtk0/6/+A+njRLy7HFHjsMaNlIXAubytGdps58aZ+lIgPVEN
	 NO65HEYQZ/yrdq6Uk7dJS5VYGDwAwvwkDbzR+OHRGOHg8zGefdKbHNniNk0G1X4hw/H71
	 Rvk8EJFy51mPjxI2F63uX1bPiGpWaLNI6FbtQxbfN3MVR7OUsPYN9XIvXhWaV3iKFag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=muUv3N6Cj44u4/A9nUxipF92QTXzboxZXiYL59wGe5c=;
	b=wN31ZFRClstvwkUxlzGK64VNGcx8iRhGXqmYakSMW4iPK/nHT6Uzhi+QqyFdvww06s3Z
	 L9tW4vLa0Vx8AKDqmudXKeiSr6V4fwTnGRuwfkDbaTobOin6cRYm/7S2GouLxVbt+z1kB
	 UbTXs28OUOejklBy0hGi1DPbwaFM/FFJoRxnFjm+GL43Wj9Ej66o+AtNVblQRzkp1l88U
	 J5BqkL+xUA1v+YOUvb6ffcnvZOaFH7LKBkirr4ZyE7WRIYtarlQTzLXXdEhLibvJcxtgX
	 Omo1ZDrgZsd3JR7C6mVkbN6Bx3pFh3t5Kuy7EycbWZJXLNAJEh/mrdu2biRvoeX1wEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P8dATCcf;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5231606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:45:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5231606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P8dATCcf
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-533861a59b8so50222001cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794491125; x=1795095925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=muUv3N6Cj44u4/A9nUxipF92QTXzboxZXiYL59wGe5c=;
        b=P8dATCcf8CLzyHUo8HmJNCe24SdvEA50K/+Z5DCE2FSx5qTZRR7JAI6o0OHd5yjJBL
         Tt7yAP6ciEID2EXvMwao+uHdujA5iRnMlCJGg6GcnF/ULN3F9FG1iYQ8NBoCBYGsWC9L
         66PdPvsAYOJtsH7pjQbQGFSswB29EX4UKCVOkANBz1vYa8/IQxWhcBolAMZ1VvUWZ4ON
         ar7VDQWZ293is5D+yrQCxzkpbCtfMJffl9WqEY7yxrdQgcIrPgBfhrU5uGpSkmiPIHiX
         HCJf8Lwc7WQnLajl1eHbpd44doLpoB05rYGpv078ij/8WuKdvt0iY6dq4Q2utwOmSrCB
         BsnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794491125; x=1795095925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=muUv3N6Cj44u4/A9nUxipF92QTXzboxZXiYL59wGe5c=;
        b=bwY2tP3pRmSl4UFGG3/VJwL0/JSgH1GqgzRs+d7cWLTrSIJTYtnLZ0lpJwNkiDpHzs
         5OYTzU+oOBreo9RkdRyYA/wPA08Nb1+6eobWFuuoXNgIlooOFMqJkt61VkE5S5qf9F8J
         u4bwrDMSRnUGLlE/pxaDSJtxGXJQnmOaUAvvu5nxec9IhQDnxWHL5iTbpTWpErLj0TNM
         cme0H/YxilK0maqaoTF4x79OtFWjlYLBun2SXLjg2B9JtFko0RfZf/pa5uPrtdV44mjK
         lMSGRra9uhMtPdGKwxd+y9I6iNzhGZdS2leX/r0/U4qNgWK/+autrA6rW+AuWmvS6p/d
         FhOQ==
X-Forwarded-Encrypted: i=1; AL+hErFWjGbZRlhisLviEIV7shCc//BXIVh78aMLP09P9lKBCWj2SOJUAa6rnI/VbUA+m3dstGgkI10yo7vJ2ng=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KOacQVU1YfgmkPENmjol+BdPdo9bkq9SGAJK96LJJFyQSM1GU
	YTDOU+3F0jnyhXX2UKSz6yiv1P/p85SC5H4CTiISCOUjrYI4b2+7dstn
X-Gm-Gg: AYBFou1Ga6VWN8ddwRMXLC2A8lX1JQS7UTKY0Yx2s9h4NA2fKd+zKzHugv55AdKZQJQ
	BY0FRbSVKlWh7q1/G7b5ARTUsLkHyPYqkvZXmyUx/cjtyYLI6qjEsQup8letmD39Sy8obJe95ZI
	1dTwllQ3dEAHgecp+EE/1Wz3r/NTvqq5dIBfPAgK1vQXu0mnGXNCXOEeb9I7QzI2BQxIExLjEqE
	PzUbAPkkOcOQk/2L+pgj2rwPZLyvNQgPfXEuP6LTiPuiUAUTanZ+g4arrjgTGQRRU+/pQfSGKCg
	xwpWzlOcs3ROPY4OinwWS15lcxySm1vvMdzVW4jsKcis/FyqMiwnXv0u9DjH3IJgGxxmK+bnZ88
	syJYBw+mo8Op3O7YYwDYiKFgUyE/btJZB3sa7EpEGxlZYfwaO36EllxLdAPzns14Jg8c8I5deZO
	EnOqKcJfKI35g6TG8abvoCAmcI+ejQO80sJBhK6fTQnnOBmZSonAi7haRLMPmxHX532EPgtPk2l
	DMVbhVCQcUPiH4vxVzIFwiKHl02OMQQrrY4/RiS1C89zJqB7bPwgS3D5DA5A0051RGRveyNpdbP
	zJK2pIjV4hGWmreAsbZosd1gnjPeZfVG1RUGe7d6s+J6Qj0dRw==
X-Received: by 2002:a05:622a:1f99:b0:51c:fc4:a144 with SMTP id d75a77b69052e-556bdfd1fa8mr89199291cf.4.1794491124502;
        Thu, 12 Nov 2026 05:45:24 -0800 (PST)
Received: from ubuntu.. ([2405:201:8026:213e:cd0c:f17e:7390:7542])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550b9438dbsm75155071cf.19.2026.11.12.05.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:45:24 -0800 (PST)
From: mdshahid03@gmail.com
To: maddy@linux.ibm.com
Cc: mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ritesh.list@gmail.com,
	sshegde@linux.ibm.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH] powerpc/perf: vpa-dtl: fix resource leak on allocation failure
Date: Thu, 12 Nov 2026 19:14:55 +0530
Message-ID: <20261112134455.6880-1-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Mohammad Shahid <mdshahid03@gmail.com>

vpa_dtl_event_init acquires dtl_access_lock when initializing the
first vpa_dtl PMU event.

If vpa_dtl_mem_alloc() fails,the function returns -ENOMEM without
releasing the semaphore.

Release the semaphore when buffer allocation fails and no other
PMU events are active.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 arch/powerpc/perf/vpa-dtl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/perf/vpa-dtl.c b/arch/powerpc/perf/vpa-dtl.c
index 3e3d65b6c796..20eafeaffa6b 100644
--- a/arch/powerpc/perf/vpa-dtl.c
+++ b/arch/powerpc/perf/vpa-dtl.c
@@ -396,6 +396,8 @@ static int vpa_dtl_event_init(struct perf_event *event)
 
 	/* Allocate dtl buffer memory */
 	if (vpa_dtl_mem_alloc(event->cpu)) {
+		if (dtl_global_refc == 0)
+			up_write(&dtl_access_lock);
 		spin_unlock(&dtl_global_lock);
 		return -ENOMEM;
 	}
-- 
2.43.0

