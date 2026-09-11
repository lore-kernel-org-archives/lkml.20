Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222F14137A1
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116664; cv=none; b=c1uxs6uzt5soXr4JaDVdZuI3qVAuNg9d+ucnD41iIoYGUAuZHeuxRoBf1hwMYj+NO2sJh/k4iYPIZQ5QcXjmWUtjkUx1X1rmqax43o78MLua3PY0UtJnutGOBVFp73GijCs6+2Os05T2ddi6xL55Yl38iTZJYXL3zTwBnI5tDI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116664; c=relaxed/simple;
	bh=hCvL9PcI9TWfpOhh9o37Dw6oug4YMsAi5AjWTQF7rn0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vFNbWwmpgeElZ0DairL0W8F38Arfsk4rjDUYgIVQ2szAAdkmUsc5bjoF49fkoKxlezE1CLmGKQDFiBEQfVsQeY4k8LPXHVISJdaonyhV2maKZE/KTuR9qojvaW4lV0x9abHlbfMp/MO5zDdBTsu6cTIcHA0MCubASHQq/kBabnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yp5WQyvp; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yp5WQyvp"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2dd1dcdcf95so5815465ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789116661; x=1789721461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U/TcAfpNy9eIzFLTbXKaYNl6G8XOWTQ5TXRvEfw5GE4=;
        b=Yp5WQyvpA9c2xY6an67/XrTRkozSgkftda8lI5pmUq43GgpxNDmH2I1OyNvowvYP6P
         UwG9/9+L9HCGWjHXsm30MX4v00BZHKNNS1SPjag5YHNn+rl1X8rEEbJ/Vp2h9M+ONzRI
         tHbrsQuMC9p2HW+a4/aQxfsahKrBUUdbQE6nnp9LVypo1MF63hWmAr6OIzPbYIPx5o+H
         kth3lnpNnO9ZHo2057F98aJ3aQwS8r4kgjfx0W/wRPBjmwSDsZvBi34y7vo6lrzhxdld
         Xbl+fRhVWpqRPcdNAONQgvxusbLW6S2IdJE8jo/XRTcl6zv7VgHANf7A0BguB1RTYJK5
         4Jug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789116661; x=1789721461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U/TcAfpNy9eIzFLTbXKaYNl6G8XOWTQ5TXRvEfw5GE4=;
        b=GkUkQ3YRnO0pJ688UUCR6sLHHcxeuVtv1JkrABFQt9wM0haYEMzaYsU1jeFxJDZHF2
         g0Xq0YVTyE6bXi95KvM/TTJOEj2m2vLuqvnVjPXwbtBag7WrqkeVmORRwW0HjIcVPSQr
         hH91N01pg+qD2NZeq3+qJT+L0DWQnRVPVmYv6kOpf/+sQ4ItzS50J1yG8GIq9QvgLSca
         t2C5Q5oF8SLybPPRGoGAlxoxVlXADxaPmR6CYGPBqqCEtr8RJ/lnBNyQFtQcj0rRjhr4
         dBCrvUQ7nqJmX5BOX+hAIQyLhWKa89HJF6g6SA/QJsn/exFpBb+3ESmmCOzpArWNuvdb
         9Kng==
X-Forwarded-Encrypted: i=1; AKwUvBw5VuJAZMUTHavt9OIuEX2FD3rVlYWNp+LZ6O3dF+kaftq2FeLcer/d2SRqRxKs9kusbs+5n7BoWi3+TXI=@vger.kernel.org
X-Gm-Message-State: AFuF++nNIqg9Bd/W/XJNwl8f/fWjEOYsCI87302OBIDaF4zX2vqwPhaQ
	cl4LcryrvgntlTeWhFg8jJNHdf1FQDMfCC3jl45Wif2gtRnAkwJXhLuU
X-Gm-Gg: AYBFou2dDFre8dKQARez4umvn3CulEI4KcS5kVGCMuI+Pp1pPaf0ziG6C5c9SoCZTHj
	aWyThmSmEdWOha5UOawtW67JooeNLu3rXdMpBTDLuxaJPv6O4kMMeb+PDYxpnpuVucRWrQxmBSj
	AC4SW5vHLRW2qesxfaEynGcEP6zrBzkAD3S6iiLQNxBkSCOprexHyVOFX9sQVXx58kr9jllMsUw
	YNDXughFUhLPMY584tcUX642VCo1SouOFFyBvwQETi2dVv77TJM6nXlETRjqB6W5XR419fTBOIw
	RrwRNbHZhRE0hgVWsnJcloPI2M+Zh9rlFgYv2g5r+bVwi7d67h/0HARp/E2uK0WmZ4LXap1F0ez
	TrHIlTr5sh7MAwvMeZO12NPOMTvRKXSU+tUA6xxPbopxrrjaaw1zd0uyvgSMb2PVOa1Os4v6FwG
	c8YXEnUS2CHp14C95YCeFH/rT/eDvirhXA3aQeJKGdyTldeNALwN5adrAcnc+N7iJdhAAS02mth
	Cd3tDEaLwYyNcw+loI5HMgwnbk=
X-Received: by 2002:a17:903:4405:b0:2d6:fddf:a890 with SMTP id d9443c01a7336-2dd0e9e5fd9mr93067975ad.6.1789116660866;
        Fri, 11 Sep 2026 01:51:00 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e95075sm4715294eec.11.2026.09.11.01.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 01:51:00 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>
Cc: Udit Kumar <u-kumar1@ti.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] soc: ti: knav_qmss: Fix typos in comments
Date: Fri, 11 Sep 2026 14:20:55 +0530
Message-ID: <20260911085055.715191-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "specifes" to "specifies" in the knav_queue_open() kernel-doc and
"accomodate" to "accommodate" in knav_pool_create().  No code changes.

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
v3:
 - name the driver as knav_qmss in the subject rather than
   knav_qmss_queue, which is what the recent commits to this file use
   (Udit Kumar)
 - dropped the Assisted-by trailer naming the model

The diff is unchanged from v2.

v2: https://lore.kernel.org/all/20260910044551.50308-1-hemanth.selam@gmail.com/
v1: https://lore.kernel.org/all/20260907062247.9994-1-hemanth.selam@gmail.com/

 drivers/soc/ti/knav_qmss_queue.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
index 3e4041454f69..6186454dff51 100644
--- a/drivers/soc/ti/knav_qmss_queue.c
+++ b/drivers/soc/ti/knav_qmss_queue.c
@@ -509,7 +509,7 @@ static int knav_queue_flush(struct knav_queue *qh)
 /**
  * knav_queue_open()	- open a hardware queue
  * @name:		- name to give the queue handle
- * @id:			- desired queue number if any or specifes the type
+ * @id:			- desired queue number if any or specifies the type
  *			  of queue
  * @flags:		- the following flags are applicable to queues:
  *	KNAV_QUEUE_SHARED - allow the queue to be shared. Queues are
@@ -805,7 +805,7 @@ void *knav_pool_create(const char *name,
 	}
 
 	/* Region maintains a sorted (by region offset) list of pools
-	 * use the first free slot which is large enough to accomodate
+	 * use the first free slot which is large enough to accommodate
 	 * the request
 	 */
 	last_offset = 0;
-- 
2.48.1

