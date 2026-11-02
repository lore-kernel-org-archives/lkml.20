Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793611606;
	b=L0AHcEZeejo5z0I5aV5TJQIYhHtq6eA7873hBR9mYi9OYPyCK5coM1lzorrxtrc9/T9W
	 UQ8lu+w+EV5uLhZKgHOpFR7qK1E7hcbDF4SoXLbVIzfBuWIed1Tjq45cpCOk4jCxVYKs2
	 RoleXQc9k+1ZCpJ45oGr6OJGZNOFax/657MJ8f6Cni9amipJp2cAFTn4E2yh1iGi1UBWo
	 YbTUG7OZgsLTazMDQKhr9BdoQAc3q8Wq4Bd8HNr3HqWNlix31kjH+xoKx7LuvQAymp9S4
	 8rOprrgHdXLq5nDerp3AM5CXLb0Va9SuL49BDxgE3YUgcq5GVZVZSS29hLklkwa865Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793611606;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=8IY/E2yN3Ja5yBKCnA9ESi9ehmtpzrqGCJOdKGsQt1I=;
	b=HNVWg1nqFH8lul4RSLXg7IenzdGjcUBNnMm5TH2LxqyskcMpt/+bBcUd4Mwlzg1Vs20S
	 WeCni0EyfvbwKAYEMKmZl0EwS+HN7RYNI5wBTDOTA0HER0NT/yNxlqGMDBX3Wl/1zBmSu
	 0r2NBNXOTk/pQ4OX1l0cjsPE5UvoI37onTRK2hq3i8tdcrlSB9B1XMt3h3NK4+wLtzvr1
	 79N8fmVa1ELCf7A+Ve+bdcKdOjfQgL908WFze12bb+w4iKJiW64q3YHHOQTkS+aKmjnUw
	 /V4ixyTmp65+6+7OEmuLItnwy2Fjwxq0JFiVrqMcTTV9fGQkPaHmzPtHXf0Typ0j2eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iqms9DfB;
	arc=none smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA3D606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:26:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAA3D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iqms9DfB
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ab3dd9670bso24242871fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793611604; x=1794216404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8IY/E2yN3Ja5yBKCnA9ESi9ehmtpzrqGCJOdKGsQt1I=;
        b=Iqms9DfBe+kkxgLvnbKFeFZcvJOyCOw2PsZvl9V2/RJ1x6U0oRDnEXFRVScSkud9oC
         ylSO7yRyS0BzQhWtITExjXek6Ah5UYgtaiI4ZlntQA0EuYhGXQY2va5Gx7yKokjVn/9z
         SkiUmsm+lauyT2Tpa5KMzyFcuBxr3HHJVY4z5pGURgSxmw8obiUrbwM6WMFaqxXtjJTR
         tyB76JT5aw124kR2nZGqgtmhjJvVjjYiTPWjGs5KVRMTpc4uI/jLjvRc4iMCaG9vh7dR
         BQP7yaqqCVtRGdntrLchArcA6bexBIBKHuIOdqu9z3t2pOh7ZnaNffvJmZ+UNZBp8Zjc
         eaKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793611604; x=1794216404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8IY/E2yN3Ja5yBKCnA9ESi9ehmtpzrqGCJOdKGsQt1I=;
        b=2E1efbK1OUh02AS/G8PID3mhB7+CcoICDc/esTSowQORI3haNcoobH1SNOnr0q2fo6
         xccsm9DUiyzTsGJrfDP6alpjDtAYgFCcLuQ36IcgEyHjd/o2HCsjNHEmi5veAWPxcH4e
         az1uK/cLgeGFPCGoSsFsRtEf5VLftEnMalrEu1+5iRQaQC1Y+M6o1Zd+Knma549l6uGK
         u8BVYcDNbxv6+m47UpfvCxwF0cQhpX8/3WNhMEptyut2N5hzKErvKYzaBLpCctIC2V/h
         XxX/J7wjiR5UWbHgG7ji1KbGgUR7MlOomOID77f1mYPkKjyshu6fpSbrRtkoLGDyx+G7
         UQaA==
X-Gm-Message-State: APuU4Z9NBWiPB5mz6vTilpE6aBOTaAwFqUPDB1AA9Z35V2pT/VQWhD6c
	McWPBVDOpwVQqy+jWPBhGbuKbPRWD8aoUa5YgxyU3270tNK0uSj7e6iV+ad9UTImSA==
X-Gm-Gg: AYBFou04te0LQHvw1kD2MO0RTdFnsxJ1vj7PM4s9eGJGJR/+7BOOv5l08bKJGFDuWtH
	zfB4uvrSzTm2QqdOhlgYQ9ama4W1xMKF/boQgGbL4p2765lYLe7g0lRvmhglzppg12buqTfFFq+
	S1y3u/pts3E+1SbBE0Q+btZl8mME8vYjJwjm4yyYBghZj8X17e8KR8ex2uUHbuSTyokv/3ABeCv
	Ws4Au7bWuW+xe8zoJoccSaIbqqX2hFeAhV0COFTMrjkBlerudrspBYKWQ0A6Ignw9AEdMo4eGxZ
	DfX+uM6/bGWlpZ1xeoDcAv5mVkGwOqr+XYph9q8UPiLS8obbv3JPBE8TRSitElQOi5/3lZ+xRV8
	qSH7NsbNLf//XblymA/iEV+VtxKxC/EsV1BogM4omd8u0V2PtQqTj+ZG6ZuZWsEe8jRxzVsyU6U
	UZHMTwmQU+Gu32zbg5u+utS5F/5WuBjHHCH2UZIvMbqMHd+IU+Hz3I2nHdpmY5lvVaI3+V2HcA4
	+6V3MNanJNnKQbC3DVMhmqss0gMi7tDCK8sJ+6M1poVWFSuI/+nPyp4Fqq1u1hvusbj8i8hXTM6
	hH2LLJjPiwwx6XhFhW+2RpKSA5ax52IPtVxA2Tc=
X-Received: by 2002:a2e:bc2a:0:b0:3a9:707e:ad88 with SMTP id 38308e7fff4ca-3acb7962317mr22667461fa.2.1793611603878;
        Mon, 02 Nov 2026 01:26:43 -0800 (PST)
Received: from localhost.localdomain ([31.185.5.121])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbefdad8sm21280011fa.24.2026.11.02.01.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:26:43 -0800 (PST)
From: Linus King <yaycaphone@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Linus King <yaycaphone@gmail.com>
Subject: [PATCH] ./include/uapi/linux/a.out.h: file size optimization.
Date: Mon,  2 Nov 2026 12:26:21 +0300
Message-ID: <20261102092621.5319-1-yaycaphone@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Linux project size optimization.

Signed-off-by: Linus King <yaycaphone@gmail.com>
---
 include/uapi/linux/a.out.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/a.out.h b/include/uapi/linux/a.out.h
index 5fafde3798e5..f1991ce3f85a 100644
--- a/include/uapi/linux/a.out.h
+++ b/include/uapi/linux/a.out.h
@@ -141,7 +141,7 @@ enum machine_type {
 #if !defined (N_BSSADDR)
 #define N_BSSADDR(x) (N_DATADDR(x) + (x).a_data)
 #endif
-
+
 #if !defined (N_NLIST_DECLARED)
 struct nlist {
   union {
-- 
2.55.0

