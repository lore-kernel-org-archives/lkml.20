Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792875435;
	b=TxshfqYWI/wBNv4Ccd72733RR7N1QTenruihDKxRiXPvdcOk2FQWAUKgvXsn0PVPyWew
	 JxAylTQln0aTECNXOP1tNeuKrUgHyUh7yx9c4cbzkT11+1imHtUvqnsiQgrH7dANVQST8
	 c/zecKpsMDJfA/U9DViJCsWElDPMQVS/Xz/YmFsHb1HNULqMNA9YhfzyREVoJRX/79l1X
	 r3DzQGO+VJlpdpYY1JbN72x1YH9yIr5ZPtJDykky8uE2MnmgTkf52Ikf3KB+TIlGVo4uv
	 kkAOMDB8X0b/zPFuohOc7RdCj4H6OcTMdxk39Ve5m0XxE/Sxb9HeNzYHoy8YhIlmPUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792875435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IV1NP8FklaqMSKF4K9LgBOKBFJvutUzvKwE1feKuMJk=;
	b=A5gkYzlBDIfqFrdcOtkLWvk3ltaftOtvsse/oRpvxOE5VJdw7QxE14sT8hH5JDnmjnon
	 or3Gt4wXKtzahmqbSyWPZnwVA0c71gcI3mhZqF0XYhD4wGz6gJa5aa2lElrSu6o5t0QrD
	 JSuyWXgxb0D9+F/YT822xdz6C3uFQABztAp6hWKge7Y4zbJUDxaqzMc6EIHCK4fofXUdM
	 BpKSs2AVzQCWF6olwSfv1V9SFDl2nMzLFtt5r6oieZ+v6h6HzE5gC5yfIbHVh0p2upoi8
	 BGbYAKiNGeqlva/Q9lPMx9csxbiKUwEuQURAvhlt2GWS2+7obEIWhjn/Br0iyRUYvrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cujVOZbH;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B750606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:57:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B750606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cujVOZbH
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so17757715e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792875433; x=1793480233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IV1NP8FklaqMSKF4K9LgBOKBFJvutUzvKwE1feKuMJk=;
        b=cujVOZbHlQfToaTJYXhFKOmdi7F7oOBIQEBzgQxzq04TO0nTp0Pq4Fjx7TvqFwJAo+
         rtcIxzzEVRCOJL+qbkO7vsdqGmkWd7a1ZmcgO5X1cP7xTlh9OSE5Llx6uAXIpyDv2s+R
         +4+0G/CJ7Fbmn9B2UnEh8oa5f1g1v6p3DLhEH8SVzMbhC5Gs+fTfKyELTeYwVwZPCjjl
         jPSXetjPqQYQOuPvzQsk0KyuA++u2bNlr5pee1UQHQH1aIXdqId1LFX1pY9P/dg0e3L0
         aBBjA6wFF3NOPnmUx3d8PoHugujtju7/3pL0j6Z4ZiO4xR60k6FdjHfE3etuNPQov2Aj
         ffsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792875433; x=1793480233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IV1NP8FklaqMSKF4K9LgBOKBFJvutUzvKwE1feKuMJk=;
        b=GeIFCVo9f9pgcrS9t8Ylig8rb3q6wC9PSpqJBACsXh0cOsXqBEz/K57yrJl43w3H4o
         Lzqj1ZK68MxhbQUJSmo1sSD+5cXX0dT6L5DfJuSy8nh04MmMBWr9gphs2c9es/RgwZgz
         Fn+w2UGMzH8IHN4d8RpiNE91HB6PAf1qPLYytEK8yMNQ6kNe4pFT1BPUEyZqwJZwo5S1
         MSG6pEmo+2vJ5GfI9bd0wSIQ2kMNywaa5UfA1fWvblQGT4RSnZ+pa6MVNkTnJACQIVGb
         AkODkFvhTRw7cyuaQMWcIUtj/kckImJxTYndfd//jg00hJkbbKspqWKapt9RgeEIlmPA
         FIvg==
X-Forwarded-Encrypted: i=1; AKwUvBy4LLCXgTL09dlL9nXbgTzfn0dDqEbYuRVFJz3eXuqywuTeBvdBsB+IfiEuWkLhOKWkO1j2FvxJ4qZnabs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGYSuqrmVJC1vYEr45Owz1P8YwUY1bEICtLIk4X9OsJNyBjlsD
	GsEpARCaYmPVyfW67a7SObXbHWqQddCKVkJaTFYn4T4duCxwirkYL96BEB1S
X-Gm-Gg: AYBFou1EvKGUipyAcelkRQepHpAYNDHpNSZ/gmsr2UF5wubw6sU+dGCz0eR4vdpSEYy
	01neY638KlNYwvmuKFDtfaibx7xaCTC8PfLMBHYVFzwflLLoLDHEqk3c8DIC/12C/lxnoSyDQsp
	qNLSjTwkSyCCESz+o97eldRALpblwheNUkU3Ku8VJ5VfZ1GkfqbxAZYmy314utAXTqqfW4D3Pxa
	4IWEBdaztyhTS7+fmY4LRXxi3fSXZJqVV+UHWHiW6FRmzFqeiEuAOaHq9Res2AceWlUdLJdD3bQ
	CEe0UbCtnbkBvkDnYfCrvxkuEloXwEefW+PX83xdz9WaxqPtORwTLd00aN9w/0j0QpzxxLvBMGq
	IPtdadtG2n85Oq8SjX5LVLyTgGk0xlu1lEgSPqvqCasvK5WLytfvYvTPmZZRQKAYOqeWfHx38Uy
	irl6YiTEwnTO5cFIF5rvMPojo8G1klZhUQV69HPV/m1jpghymRL1MPSr2tUezoL5O4UlBiZKCE7
	GXIxQXmu8r5218JBIrAqz5z
X-Received: by 2002:a05:600c:4f89:b0:4a1:ddaa:571e with SMTP id 5b1f17b1804b1-4a35ac9d018mr45023005e9.15.1792875432943;
        Sat, 24 Oct 2026 13:57:12 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35b4a8bc1sm33788405e9.4.2026.10.24.13.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:57:12 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH] media: v4l2-mem2mem: cancel job_work in v4l2_m2m_release
Date: Sat, 24 Oct 2026 20:57:11 +0000
Message-ID: <20261024205711.4041369-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Tristan Madani <tristan@talencesecurity.com>

v4l2_m2m_release() frees the m2m_dev struct without cancelling
m2m_dev->job_work.  If a device operation schedules work via
v4l2_m2m_try_schedule() and the driver tears down the m2m context
concurrently, the work fires on freed memory.

Add cancel_work_sync() before the kfree in v4l2_m2m_release().

Fixes: 7f98639def42 ("V4L/DVB: add memory-to-memory device helper framework for videobuf")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index a65cbb124cfe0..311e2e08d066d 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -1207,6 +1207,7 @@ EXPORT_SYMBOL_GPL(v4l2_m2m_init);
 
 void v4l2_m2m_release(struct v4l2_m2m_dev *m2m_dev)
 {
+	cancel_work_sync(&m2m_dev->job_work);
 	kfree(m2m_dev);
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_release);
-- 
2.47.3

