Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039126;
	b=wwtc3WqyU/1xC6Hejb6NG/aimJUoHJufnieyY8I9FlOQjuflvXjWLAhR4zwSFqmr5t9i
	 g2lxVUVbH5Efheq98EYC5jUNbjQGLtRhx+1OT87FNfvwCfU3KYfRz9XjYXsXHc6u76weR
	 JwrrV1a8VfZ++x3yWfn001qkHJUOtt5wx4f3gUmef10ErjnRX9nfk20cfGUI3wdAldMgK
	 ea0XZCGbekhu6qBLo6c8d8vuWHTgo+foTxLuIGeg2lOT1fb/+t939pmxY6dTg/d04GE8R
	 +ZC90VQw39uFLplfkiyqE4JT2cAMv4IED1dmtirNFc0LGeHWewcemOBAzogh3SHmGNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=as4dLySM74JHCwhJBoWvbRErIcyVkS/DDlAos+E9LjI=;
	b=DbT3XdYhnMOaJuUuQwXn2FPrvrnrpx9qhDaI3CUJE4eOlv3xWJFRRpQLajxlcvgMhInm
	 Ib87mDnnUHkffv3VetGTs77JsC1Pbg2bptyZjPKFCEce5t0WfLgIl30dfLfnAS+kiTPeX
	 gVsr8fzucj41+Ap+pEq5enubmBknm2KYOECW8Jzl148HNIpjrm0aZ7MulLahXkxFratOg
	 rCBeXx7tAi9Lj61yRatszGA5IbNjxPrVIZiCP49+EJ226gKAQm1jVkW1vm2OuDPhEN3Vy
	 OBuyGXHsscxQioQO6/e17NM3luyZrbdnqR8mf2SxKB8y1cXyr0fGY+zMR02N+rNXkiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nk91qd8p;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F29E606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:25:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F29E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nk91qd8p
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a78ec32fadso1114485e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793039125; x=1793643925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=as4dLySM74JHCwhJBoWvbRErIcyVkS/DDlAos+E9LjI=;
        b=nk91qd8pvq8xezj42jZxVpU9jl2j+zvLTxTLxQaFC5yOZ3jXkqg0FxUHD5bGNKy4ng
         bXso+D+pCubRwg66hAUHUPLmXz072+KDsyJVA81SMQ6MrLOAwfVVjnhJzFLTk+rhPLBC
         fs+lvQGpyDFxCpVGZudqvbszxGKMBUofGnliCV6SwHp0/a42GoWXwjNNn+8Y7SooXhF2
         lrEiApXOQH3lQAPVHyq87TSfRRdPs4tXVuPUF6m4Jly+x9BtO0LwRiGZmri2hpoH5Sth
         E/WPRLAD067fNpM4yu33TQtBoTsoo9qZMip5ARq802PkC8FuQmS+3VOXM7DJOCKElzYy
         GxUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039125; x=1793643925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=as4dLySM74JHCwhJBoWvbRErIcyVkS/DDlAos+E9LjI=;
        b=KFXQ12QQcSitVKjrVbCGjTB4cp1h/csMqchFuaoXCTHNflv7HYJ9pcHyQSDHuq5tDz
         JEF2WQVGVVc2OQwIBZ4P6/WT8OjTr1C7/R4VCnKo8AKDks0ykrpC/AfNC/QG71P2f0ii
         cS6+Kaak5r0hxF0ynmyYIrVbxTphJ7levc9zDodh2dBpUd6hdKAYmx0vgK1ywq4YEw0f
         RhQAdIsGY4bRFpPyqC4s5omqCrdnYhW/acJNmecsGO6Q9Y8RvS64p55Yiu2gB4apDTjv
         jy9mKLxpLiAuSCeRHiNfph1FAH6SJtkSOcmTHdMl2IAB14aD/f880zwl+ElkhHU7+DPy
         MGNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFt57YmpIHwgm+GMBh4v4hCwyLjCluzZkmjmFEXWnYYZh2/6VwTnD44Yn/epRuU3/mtNf3P7xmYep989Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVrF4jKU4/jVF9qITofooy9hXZiXt3nk5t2NcVOuOT27JFPuqf
	KM884OIGXWuPDZ3erxcgcbqpqZ80f5RyZn0owvqKu2+YuPm96FCflFtk
X-Gm-Gg: AYBFou2dTidV5q2J8HshLmxIVE6UQb/5aC+OQf+GXzcdYYQDybQxmCOMN9/ZWThvUPd
	UOzpfoMYpy4A2u+sa2/CFk0FjzuwnKVprFwyW2MqGpMqT4BA9scBj3nahCl8RzaIGpHMDmM6E9W
	X27P4ar7ZD1CdC3gW0V6ypglmIGz+IGUa+xcJ0jXXgL/V2+rTkg0tiZpqunhYo55oxaYCTZcULM
	RDqL2+8bFGDuI4BjeiHdpZVoK6QPS93ADpQhp7jjslu3/9eQqXRSr89x3FHZFVBgy/O68I21+lB
	l0cj+JQXpl6o+/wHRpMNcd7LShXRU1BSK/rMtGh2zKU6o8iRNG/kwC6oaQQaLgz1DPbZsExvS8N
	uIkxqZpAgZcV1PcdDHppCbmd9YJFGctF2aispjsMAm98Rf1v59uZ4A6xmO6N+35+/ObonQ1E4ba
	4flrGsuktm+pb/0A0DhFNvGBmMsPsHlI6oM7Z5kIMeEGMbQx7nCSL0ycuOBVqM08vhnr9r/H1DQ
	GE0Iftlq3Ly9JujNfE2c098Eh3EpsZG6iLCaAcJXR0JbEodmt6r/aBopQYSOQ==
X-Received: by 2002:a05:600c:a114:b0:4a0:1f9e:5f78 with SMTP id 5b1f17b1804b1-4a35aae5c22mr101769385e9.0.1793039124430;
        Mon, 26 Oct 2026 11:25:24 -0700 (PDT)
Received: from Termis-ROG-FLOW-Z13 ([2a09:bac5:521a:254b::3b7:76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a30e22csm211673245e9.2.2026.10.26.11.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:25:24 -0700 (PDT)
From: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
To: Bin Du <bin.du@amd.com>,
	Nirujogi Pratap <pratap.nirujogi@amd.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sultan Alsawaf <sultan@kerneltoast.com>,
	Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
Subject: [PATCH 2/2] media: amd: isp4: return capture buffers with V4L2_FIELD_NONE
Date: Mon, 26 Oct 2026 21:24:42 +0300
Message-ID: <20261026182442.229869-3-saif.elden.hatim@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026182442.229869-1-saif.elden.hatim@gmail.com>
References: <20261026182442.229869-1-saif.elden.hatim@gmail.com>
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

isp4vid_handle_frame_done() marks every completed buffer as
V4L2_FIELD_ANY. V4L2_FIELD_ANY is only valid as a request from the
application; a dequeued buffer must report the field order of the
image it contains. v4l2-compliance therefore fails the first MMAP
streaming test:

  fail: v4l2-test-buffers.cpp(419): g_field() == V4L2_FIELD_ANY
  fail: v4l2-test-buffers.cpp(1280): buf.check(q, last_seq)
  fail: v4l2-test-buffers.cpp(1735): captureBufs(...)
  test MMAP (no poll, REQBUFS): FAIL

The ISP only produces progressive frames, and the format ioctls already
report V4L2_FIELD_NONE (isp4vid_fmt_default). Use V4L2_FIELD_NONE for
the returned buffers as well. With this change that test passes.

Fixes: 2ccf48af2270 ("media: platform: amd: isp4 video node and buffers handling added")
Signed-off-by: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
---
Testing and AI use: see the cover letter.

 drivers/media/platform/amd/isp4/isp4_video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/amd/isp4/isp4_video.c b/drivers/media/platform/amd/isp4/isp4_video.c
index 58ea8d6ac..b8af3c766 100644
--- a/drivers/media/platform/amd/isp4/isp4_video.c
+++ b/drivers/media/platform/amd/isp4/isp4_video.c
@@ -72,7 +72,7 @@ void isp4vid_handle_frame_done(struct isp4vid_dev *isp_vdev,
 	/* Fill the buffer */
 	isp4vid_buf->vb2.vb2_buf.timestamp = ktime_get_ns();
 	isp4vid_buf->vb2.sequence = isp_vdev->sequence++;
-	isp4vid_buf->vb2.field = V4L2_FIELD_ANY;
+	isp4vid_buf->vb2.field = V4L2_FIELD_NONE;
 
 	vb2_set_plane_payload(&isp4vid_buf->vb2.vb2_buf,
 			      0, isp_vdev->format.sizeimage);
-- 
2.56.0

