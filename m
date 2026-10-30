Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793363813;
	b=NGQZ+aoHlGeW7LzwsZA4q15HjamEcMM1GWlqHJ4c2u7XgfT+P00+Mi6UmI7zdar/PgZT
	 1S1OWls7LsQTJRtDJhjOYLaCnhr0OZpCK9mXHSVoaUqz81dJmKVDUZ+MQ8Wmh3zfz6ngG
	 rXemXBL3ZHbjj54GZ10mhlQrsVXcZL6zVeHd5yryMxQi2R/V+k9pY5RfPVk/hJly+UYaY
	 RLHMKT7DQ1/itUryUDWvhuzKd8KVYYqDJoZ9dASeqoqbd0O+uzIhpitSK7NSYKoQiV2Zy
	 i7TxxgKfwBj7zhFFhoQZ4BgGB4V0qqLa25o3EGDnJWawh+1ChFvDuWRlAbhi/kwt6FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793363813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nK1hzdrqWbwHzyd6WzVscvUMgy8BAnwRp/DeubL9foY=;
	b=Vs/X3HZG2NnJxwR7KAO2DLIsyNRsTKRloGJ7bRr4JnQc/BKbqG5ory4nibuxkMSxS9LD
	 CEQ5Tkg8DqOoJXZUyspdxPgIvPdl3coX3zu1TGJVfEOEdH6VMEEtOnqHAuxhELvkA6hcz
	 K2zTO/0duLn+8cvcDh6QSI7sz5TGskoOW9PEGA5WnMJMO+mq1WPXDFpodzUl42wffMYij
	 wnLFxQwLoVz9vLPAYVsBVIlkM88d9BcMw+/4Jrx8D60DxYEUZ/yI7zPFkB+51xdGJIZzz
	 hE4Y+71RZ2TMcLOV1Dp5ax0axhps11v+8z3biGf0wXIfjo7iebKgPOZSqEVnZlfFfdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=itXUZYaB;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D59606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3D59606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=itXUZYaB
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c4d870d54so395703f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793363811; x=1793968611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nK1hzdrqWbwHzyd6WzVscvUMgy8BAnwRp/DeubL9foY=;
        b=itXUZYaB23SNEJBFGa83mQJ1QxVbDAtdEpAm+he6uriB122kbFUHBZuM2lN/ZWYkck
         9xcM2z7nj3NyejMpRmHml9c6Qe7YhU+gM1VTgKcqWpzwdb0GrVqa03/zfh0pO2KbT0KQ
         3yqJxnOHVVlyLd/hz+7pYjYldmGxhslFaCLoSrTtROxzZYhLtoNCHH+mS3qlprRvEqIm
         xR+5Hm+vkXyqyGVS4NIe15ag5a5NX5hK+QYL+tlIqTzEEb20pLWtApT+cUNWL/m3Mr8Q
         WtuMDwLM/HrCGSeODIMsm4DOANp5NxJSkev98Fv1aFBhVEYQvXsrTTXb2JH3ZDi5DYfv
         0U5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793363811; x=1793968611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nK1hzdrqWbwHzyd6WzVscvUMgy8BAnwRp/DeubL9foY=;
        b=iseAYQVJc+hQfpociB7hf0GeFVQlXdVYHHnPpd9VfPitV8TzDn8yo1j3FXgWKNIJns
         GIWHvB9P6sNWL5zgiRUjVizWCdECS1cpTXqILQn3HFZS/C0uPtu2lWZDtrHqrX4GY4IV
         NcW+7d8oki9wggyCUu/JhVI2jHY3t7cDVi8yrmzmpiPeYMBe8fWjGqfN/ZNybEqTCWZn
         IUuiiFMvyuAidIwBzKx/0l0KvUEg5j0mydhsustBxzGahqBOXxYlXHKrMWfJ7NhNFZcw
         EZyR5VTbbhM25ApbxWh6SyA2hMRgAQ7/ZA0AplyocyRXMry1IKI8w/F38wLXBsBF41O7
         aGiQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmP0p/132f7ngERV5KmPfC+ZnmoEPwtux5OdMgbEtZYJ+JyHw8Tojv+p5etfTz1PZQBClDM3xluHOTUE4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIifbNYOIeEbBlJHx3JinmmGjXG2FSpmiEqRdaVrvMqiZ9hGpgk
	k0TQO/jSr4L3WDhu4LL4qX8KJ9tyCiqV0r6jiCG1KXrMZ/ivG0v1mfep
X-Gm-Gg: AYBFou1TD83tSUeUimdGnhtyH63Uw6mEQwsFiNSIsE/H0k3voBZNlswDMpYPb+QOxbW
	qFyINVi1kE186cL2HeuBwHnI1yLrP2oB9xTMV5i4rVQjH7MjkQzkut9afaIbtGkTRyPuOWvjX6l
	x10xypcgsKBamp/Dkhp9EfRz1kiQLX6JKghJwRKpWmQq2t5UZVqVwnFgZHoUmpp/h1o7zYR97aC
	UCYT6147SAho2B2c/CrhDX34bkhv+/PcBmBb3mtoVa7GIzNhTe4SzBX3anmmpeKz74FhAk3/Cue
	T1XWVDCuUDt7cEqKlaZfTZ88taRyTf/ncdtQ/oGXdvMboQB6kHu8yBPh+FUtnfzdG08KNGE+w7N
	/i6NQm+RqqQYADsYcBKC1EZIkeJnKuOexBmRiOxN2MexJvX8kou+XprRCCJxjtlp/JR0rdUnSer
	NE+8uG7IW4wtfwgql/xi7lLOCL2kZLR2dBfPgZdj48ig0o0MB4494zCY1yNvtzhEyZivOr/7+b1
	Q+rin2ypIp4W7TMmnQsJRIaF+hv+dlLoY3SBIo8ksuBbL8B27ZZfIKEERnciQBuGlqXTs4qjLL5
	LlcR/RfqpOxUZhu7LfPsQ5wwtPfpHXB1nWBR+eVwNEp86A==
X-Received: by 2002:a05:6000:1785:b0:48e:3767:d885 with SMTP id ffacd0b85a97d-48e6e4f8c42mr5742675f8f.53.1793363811249;
        Fri, 30 Oct 2026 05:36:51 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4773:6f00:5a44:fb2c:3845:1154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a84esm3218339f8f.39.2026.10.30.05.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:36:50 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Alex Dubov <oakad@yahoo.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] memstick: tifm_ms: use the correct DMA direction on removal
Date: Fri, 30 Oct 2026 14:36:48 +0200
Message-ID: <20261030123647.2356647-2-thnkslprpt@gmail.com>
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

tifm_ms_issue_cmd() maps READ requests with DMA_FROM_DEVICE and
WRITE requests with DMA_TO_DEVICE. When a request is active during
removal, tifm_ms_remove() unmaps it using the opposite direction.

Use the original mapping direction when unmapping an active
request, matching the normal completion path.

Fixes: baf8532a147d ("memstick: initial commit for Sony MemoryStick support")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/memstick/host/tifm_ms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/memstick/host/tifm_ms.c b/drivers/memstick/host/tifm_ms.c
index 0a54586aa54e8..171aadd4ec71a 100644
--- a/drivers/memstick/host/tifm_ms.c
+++ b/drivers/memstick/host/tifm_ms.c
@@ -606,8 +606,8 @@ static void tifm_ms_remove(struct tifm_dev *sock)
 		if (host->use_dma)
 			tifm_unmap_sg(sock, &host->req->sg, 1,
 				      host->req->data_dir == READ
-				      ? DMA_TO_DEVICE
-				      : DMA_FROM_DEVICE);
+				      ? DMA_FROM_DEVICE
+				      : DMA_TO_DEVICE);
 		host->req->error = -ETIME;
 
 		do {

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.43.0

