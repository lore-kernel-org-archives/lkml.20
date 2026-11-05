Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873573;
	b=nQuENeF+2s2b1C/kypx7ujWHfV6fVR9qWRnkup6hudfLvJPdv/MW0ljllIU1vJIHv2iy
	 A8VXpIgxzmykTDAz8lSV/i/o44wLa2+xbgV6BOJfwY4Su4kuFrfJ2FDCj6SnMReMw7kdN
	 Rd1LtzHPXpJeHO2dmkRXVL6KAKdYxPJIxcVKdzWMEm8MI0RsJ+BCycUSyb0JJLsjl0XGn
	 wImuUtRav0n7LEHsc6uGmfpy7kF11TeUK7jSzcd7OJoOpFlBCYuh0FCsSNHsxcEztKbIm
	 y3GVd8sCKY7nqRiNStv2ndcZQJSoSQ6+F4Fd9PN/NT+NWyIdslF/XsNJDef4YsY/weQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=P+/zfjidL1R10zub9C45JZCt5+i82Kyb9zsDu0eixEE=;
	b=MkF+c0rpsiblBi5UIs+dRuWz3Pg0IBw6srz9XxWDoeAOHwDnZOO1L5KjpqgmlLraWKPn
	 NdWQoXW+sWejZj+D7N687VRx8SGUxX5izR0F7CqbghtkTHLhXOZ3VhPCz20EbIw7I3r7s
	 +Y7iB+IYSxRDswRwrZQdEQHWLzUP6cTIlL+5UGec+MbwXjkZpiBubT222K9Pfwc7sYzWU
	 q41ZlembKGhnH+n55iFUtHUseKxX/SVUvzDyFQr6en/3RZw1fTRHBnVLEy1O66jJkYSlR
	 m+KFAso74lgVl+7L+vnUrmohh6BxyRC/9MPHzCshUYcM8T7SKPB/Tfhrlp9icX0SgDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="M/pr9jGn";
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CA9606EE83
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2CA9606EE83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M/pr9jGn
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36661f953e4so2325174eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793873572; x=1794478372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P+/zfjidL1R10zub9C45JZCt5+i82Kyb9zsDu0eixEE=;
        b=M/pr9jGnCF1iVoZwhVgridaqT02ih1W7zyYI5DXxSqrCovIW1RnZRT9zcMmQ5kUELu
         6PzxQoehk4ct/cg03DxTwM4+0luGGrzC4BYLdoulVkmHcKwZuwW5kw3E/7XnQyoYc8ZK
         f/bK3kLKywPdLsA/Z/sroL2xYX7ho/QrBxK5lDgsyM9NN/SJn4bUMPVscR17jaM1eAzs
         TxjvouGvvbigqJ4QUa8bGw+op16hZMXarPLSpQ4UbF/uH4sCQCRhzmdGam5aXg0iR4ZU
         9+SAheFg5oAtClvrBmetjPdZ6f/sFXSlwLcRDHmE/2g1yGNGT+zVntmXOFqY4ppqP+67
         n9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873572; x=1794478372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P+/zfjidL1R10zub9C45JZCt5+i82Kyb9zsDu0eixEE=;
        b=vd1sA3Z3CAbeL93GfHhJcyrkSU9OqkuPfKrGU8CO++931QRIUgKwPttJUOdnKItO8B
         SP7a5ICzay06D3lifzxJ365motgXmDwFPV1dTXkI8/QwAWAlRVmgpkjGkkvj2EPQTfqn
         BhzkVUFtIw6uUXxII/WA7NC0Dg6rsfocKeIgFCyoEnyInym0yVNPMbH3UdXfwGF9PsZt
         fA15ldec1PLZiVoLlp2hiVIrNoxxKcPGhThNFry0kIcCic1BfP+keu2yZ80xF+RMw4ry
         Hq6rLyv3qXBvEYAMXYEuH1idBRzySbcRcJo0GrHREJJS0vCsILL3ESlSaHxD3AOqWmUl
         aAMw==
X-Forwarded-Encrypted: i=1; AKwUvBzttJ3FdsIU+dfq9GA9ExPebOKXe3VPB+jMJTOWS3KKp8DWBSJxl9R66zTXtR5PUVGZI3ksNhaBxE9qtP8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IvhdG/BdHqM6v3pqMbiFsioJ47dFxRgtJH452VU/qqrfQOCHA
	i2mFKbfVjh/VovFtl91DdbeXsIJtnoExy9b64WyA8IMXr+hxbW6hx7+b
X-Gm-Gg: AYBFou3vLGCdqbDvGer2UyCVLbnMCimwPh/Tisy0RZWbPZqP6tlrEI9LTs6B9MGkjZY
	NPmX0+kqtrwangDM1ZHdN8P4FeLEYL4GpBmYHany+tt6dbLA//f6Se04OI8JvMnqpTSg+uwOCe1
	ZlIoOC19diOZlDDpnsDUyABNh+U0eiRXo2ZjHzRbieEaGxPwFKOVCUZcDWxci5RU9dyYXMUbcue
	1pKGkDXpcO3OdObKW8DGfpmF+bI4MZo9Epcfra8j1oVO39cUTpOvhoAQhakxg+YgubtQMh2bhZc
	707X8cCzGgi3dlLkcEoku1bjy22WjcclHRdI84bFro+VxYKeJwiSAssFeQHgTPuizpgoyK6gXwm
	VW5ZOBlK7STK35lz4oqzbqqB8U5UQqou9JZ8IOADR4QLfpW46zDmkwznQ5/xbgRpf0B7H5d0iMA
	K3H3BPqHLWt3nVWHbrXPBFBWQ/8/6zWsaFSX7E6mhupjDEPQsshKVGR57bFMD22VSUHv823opRM
	PLfLNEVFZgYO5CAP2bZEFLO20vulcmmfb5u/NKsmr3Qq/M6SSD7W0IpyNlsw8u9sOoUxaz9KqLT
	e/nn91Pjm4J8rDyRDOhZ3V07c887v6ERU5x/2T52ehIDvAaZO50=
X-Received: by 2002:a05:7301:d589:b0:36c:9e26:88b6 with SMTP id 5a478bee46e88-36c9e268949mr9074147eec.9.1793873571639;
        Thu, 05 Nov 2026 02:12:51 -0800 (PST)
Received: from Anonymous.localdomain ([223.181.63.2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6d3dsm18812234eec.7.2026.11.05.02.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:12:51 -0800 (PST)
From: Hussain Sitamouwala <husainsitamuwala21@gmail.com>
To: outreachy@lists.linux.dev
Cc: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hussain Sitamouwala <husainsitamuwala21@gmail.com>
Subject: [PATCH] staging: most: video: document lock fields
Date: Thu,  5 Nov 2026 10:12:22 +0000
Message-ID: <20261105101222.5478-1-husainsitamuwala21@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Fix checkpatch.pl checks:

CHECK: spinlock_t definition without comment
CHECK: struct mutex definition without comment

Add a comment to each lock in struct most_video_dev describing what it
protects. No functional change.

Signed-off-by: Hussain Sitamouwala <husainsitamuwala21@gmail.com>
---
 drivers/staging/most/video/video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 3a0445ff62f4..d60be8a741ed 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -33,14 +33,14 @@ struct most_video_dev {
 	bool mute;
 
 	struct list_head pending_mbos;
-	spinlock_t list_lock;
+	spinlock_t list_lock; /* protects pending_mbos */
 
 	struct v4l2_device v4l2_dev;
 	atomic_t access_ref;
 	struct video_device *vdev;
 	unsigned int ctrl_input;
 
-	struct mutex lock;
+	struct mutex lock; /* serialization lock used by the V4L2 core */
 
 	wait_queue_head_t wait_data;
 };
-- 
2.53.0

