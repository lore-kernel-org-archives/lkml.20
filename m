Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935213;
	b=s4Fbv7Zaltv3kqWuWUmO+7pX4NQsK5h9vSNGNEviUy3sUaFAzIoKA3tiw3zX7kR6Y6iR
	 4CL+20gJgd0iVKFhLfp0s69Ef+Lj2s4VNfrJKrVNumXBAptUg2BURMSZuoqSw08NGB3/n
	 EC9bfUAwTz1iR5rYhNoh1W0z87awyCCXhwqlEH9s29P1t5mg6SS0/rBdwQ4Rnv/NFCMkP
	 g88+eedvuCMdpqXMnaX0Px25JlMGRPPvAbFKsPQ5D4ezNFqsifq4ulTfufOadRFDM3u1d
	 heKAP3+1rWLaWDlP0UqV+VCo8pGvP7GpHOdgG43Rf3XhZEkn+3oJkp3RXmjRlxyrFSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6uErhzU3bHynlM3I7dAH3Yr/9fx8LzPRyuOlHjQzOjY=;
	b=eIab6eov0dq5HJtDy2HwPyVmxd5JWKSpUk0u60oYp5c3CFFNNnwMJhceF1nkgjHGYMf2
	 k4xlYyvsKb2D1fzI9HEWBGFatCFVUVoOYaOSbq51G58/3mmp0jXigl8bjddpg2445lfcK
	 WwZm9b6aqvnsKQaId/igvq+T/F1v+lSsA8LqQRFTP3Ttd9Yy0UqsKTecCtBLXuQRAJhSU
	 WLKQcBknr66k7KIXRAB6Z4uO7aDb4boTLUISUi61IjmHXE8zAoixuLYUuXKmNLD/r1TzH
	 VCuWo2ULkLO6D6ivwhegGw6iXCVfI9AT6Yld1UA5tBQO/8+HjaXuQ+I1KfcaYEC01WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X6tFlaxZ;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2010606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2010606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X6tFlaxZ
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so62570c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794935212; x=1795540012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6uErhzU3bHynlM3I7dAH3Yr/9fx8LzPRyuOlHjQzOjY=;
        b=X6tFlaxZuDR40ko6g5iFL7bcrlL6ZQjTualEr5WKAIDyrpPqKehCjY0FTWXEUddpyY
         dBrvr57yIqOavU7XMCUONJwNzE9d7XuCGAsR1zeDGtXWcr0K8CRfSl5ZgW8PVNKn66JT
         gcvHXjlrHOLsHrYCwylaoTT9kNW8ZWzThoPUIghbA85SKDQ1X/7GutH4Jb9x48zXH5zC
         7L4QP2T715X81WDoBS4E5IK5TqYMrh+791u2J/1SYbyElQ5EAc02/YI6F8miC5I2LbPH
         X89FwPLF2mo2Y33MBjPsIxcd/u6alESX8YIDiCgCYAAZTLeWlZtNlFQ7Qjicd6Q4pJkb
         MjFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794935212; x=1795540012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6uErhzU3bHynlM3I7dAH3Yr/9fx8LzPRyuOlHjQzOjY=;
        b=GY4vxT71U6d/hEb5zyTLHOCtZcxBPlhZrvoFE/DonFm8HqOl5SWvciU2zN6PI+2lwN
         hWnjhg15xiYWiSr4uNZOhPyVhGYqAcRl1/9gHcwMCmfqRcoNAotA5YSkeHpsMI79lCCP
         DJ32pOJSKOk+2FbLiMGgJ1TuEaXqzBai4lXPzmAP+E8zy++3JTg9rZ4C5Hdtdvtbf746
         vNWX7taW0esZFQiq/q9RtA8F4cW/ogG9lPFKdtZOoSQ5lGTEjeN2JaOOwTT9LVtgBriD
         ZfIc5RYjf0LWaFjEQf0d6WneKsuz4sIjK32BNcxQkTZwaK2WwvULO2LeqrtvyewsXXmS
         BX9w==
X-Forwarded-Encrypted: i=1; AL+hErE+C3vCFvU2NGD8BZj+RDviCERXfKco7awmn5VSN1bQms/oGOlG1V2nuJJuV8WAmCiCaC4eAXmwMcdBt3Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yL9nnUT8o2DmgFHdKCQWepBgck4h1tkNMzIa9sQzu0A2pJTGV
	ag1yalc9B2z4rbEleTOaYF7gBAcWGEvztpcgUd+WTOnoPkPBnzBtNg1T
X-Gm-Gg: AYBFou0e7RQK/J59fOFQ9ke1G+zGag1gs3o4YxmcXrTSMSWZAYgdAP43f8MO5aIZ9hx
	7WaYJg1G4jv4oyMtI0cw4udRSk2+gHwCpsGEnHYH/+kvX29PFx4/wtlyi1LRhRQ6pHkLZL+vzEl
	xHaR++65iz7B/KUJB/xRj2eueKEux1BfEVc4mwuOPq32ZzNtM+xfJD3uF9016T7wJe+03sl5LL2
	mIj4pMQRzWMxlCC48YR4bwR5TzEDmLN+9tm6gZDAYQdKZhrU6wFYUukDjdhA3lcP5FRXon618l3
	E9/hkbDUPpbSjT26AgdeGjZdnnlHbrYr71AKEALdraqPaNsi95ReOnhFdzNST3Tqntee8v/aGtT
	fZXoXWC+oWS/P8lfbocnc9CAAD/mwQjb+7IDJtXSI8jJIEvzklmMNpEN+rDD/CT+4LK/7X6oD9Q
	zzsYwBQUVY1pa/+ZLngaIJFUFs3XsEzewXJ6WLfVtEdRc9FGld6DcJ+fFJ41l7SFKj1Rj8wqvSV
	JMNbCSO9EIa90A8tvli4syNtHwUvLFpHqxAjuaJdTGAwIzZHPVf9WZdHxszxqHBza9qUq37dpa1
	VfNQsvDFCKY29p/HET3uCvy7IMYIEKTmYlc8gfvLW9g4uIFW39RVcpMC7MXVPolZzqHyFV22SKZ
	fjXcD4BiK7o5ZD/mtnvfsexzPwNQNZAiR6aGaV6GY7iExOTpyKshCzVC8UJWMS73lQHM=
X-Received: by 2002:a05:7022:7f04:b0:1a4:c892:b14f with SMTP id a92af1059eb24-1b543d3bb52mr146484c88.29.1794935211973;
        Tue, 17 Nov 2026 09:06:51 -0800 (PST)
Received: from localhost.localdomain ([203.92.58.30])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319e381sm42046436c88.12.2026.11.17.09.06.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 09:06:51 -0800 (PST)
From: Shivani Patel <patelshivani2283@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Shivani Patel <patelshivani2283@gmail.com>
Subject: [PATCH v3 2/2] staging: most: video: Document locks in struct most_video_dev
Date: Tue, 17 Nov 2026 22:35:58 +0530
Message-ID: <20261117170558.33844-2-patelshivani2283@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261117170558.33844-1-patelshivani2283@gmail.com>
References: <20261117170558.33844-1-patelshivani2283@gmail.com>
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

checkpatch.pl reports that list_lock and lock in struct most_video_dev
are defined without a comment.

list_lock protects pending_mbos and mute across all callers. lock is
assigned to vdev->lock and is used by the V4L2 core to serialize ioctls.

Add short comments describing what each lock protects.

Signed-off-by: Shivani Patel <patelshivani2283@gmail.com>
---
v3:
 - Reword list_lock comment to "Protects @pending_mbos and @mute" instead of
   singling out the rx completion path (Dan Carpenter)
 - Split out locking fixes into patch 1/2

v2:
 - Add a commit message and Signed-off-by (Andy Shevchenko)
 - Use the "staging: most: video:" subject prefix
 - Make the comments shorter and accurate
 - Drop the outreachy list (Julia Lawall)

 drivers/staging/most/video/video.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 92d5fbc9a..02a44659a 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -33,6 +33,7 @@ struct most_video_dev {
 	bool mute;
 
 	struct list_head pending_mbos;
+	/* Protects @pending_mbos and @mute */
 	spinlock_t list_lock;
 
 	struct v4l2_device v4l2_dev;
@@ -40,6 +41,7 @@ struct most_video_dev {
 	struct video_device *vdev;
 	unsigned int ctrl_input;
 
+	/* Serializes V4L2 ioctls, used as the video_device lock */
 	struct mutex lock;
 
 	wait_queue_head_t wait_data;
-- 
2.50.1 (Apple Git-155)

