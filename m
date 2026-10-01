Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C2F51DAEE
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865036; cv=none; b=qqdziJ/RBPYhvb2mtVFiRmQPLzwRn1dxtPefgLBE9c53a/+h9QYbaReRSAKTn04nNoVdUTs4tYqNHrmnp4C4gqWXEaWlxzpICUGh1DxohYAvgJVWeWws2+S/srT5YuWleHcH+4QJQXvUrHGZyo/YTIClGptaxKLf40qAxWkJOG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865036; c=relaxed/simple;
	bh=ACbJxeoK+tQ0jwduxNk/3YbWQ2yNLFDFuyI87ek85gE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EnAhk+lFCfbspym0yF+RMDO3qTt1cHnEyYSuMdnXDZtP/g57wqZ+SrZ47AD7HSPRikT8ofFhCZLwkg63o+GF2pPPq069e3WWlrCu43PFi0OBWAvdh2xnf8GvQxXzYxm4CsHCSUj/iPwOvE5G0tfrHkIE2N5yUIZdDXibE69tj6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YUqO3d06; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YUqO3d06"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b017a3be3so1626997f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 07:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790865030; x=1791469830; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6uQT/hE7wfllb+ZxQNIrp7uXtAUN7ODmert/inI1vO8=;
        b=YUqO3d06tWFjInOiBkYIK96bHknJpRQ0HKRZ4JbmTcUxVoLWNOWC1Gg0QhZkbnTCQe
         Zb9yHnl3xKEU/3Zri7lEv5ugWoYrbnORetZWBsX6+Xr2TikHLxSU27KUF8VFz5Rt29Yx
         ftOp1MPnFn2s9vY4+spDKaOeKq51/4acH0vKaZ0pqJTe8iZA99LCIGrbNOBW9lXYvyu6
         ZtUp3ZUYI9l0c5bdyTl5br87Umi4cin0VI0N5qRlJA8qS++FFD4fU18MHmiJVmRxm2j1
         PME5HVrqUwz05+RyPMSXH56z6zJCoQw461tcDC4fIRB+YXnqzsvUucFvO3WLS6J0fdUQ
         4b3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790865030; x=1791469830;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6uQT/hE7wfllb+ZxQNIrp7uXtAUN7ODmert/inI1vO8=;
        b=zqUfsjEe1NTwA/7DUIuCva8JmIHuyfPmw8ffKQjeulmsz+k9SEoCTR9atlrHV0TrD0
         pSjRY4d7Ibfl/dfWCrGscUnjPraZ3+qREBN/jGa2HIJwq3Nuzgsnv4CUTK7M4oySTjAb
         e6dUwD2Furw4Ch+Ql8BKr8SdOLivuYOj635BydUbV9fksDJ7GTOzeFc0gva9QAHRYId9
         a8LdDxvW4S6tAX1OB+nwB6G/sEMp4xSRij/9fGGKpTwK9wUWrZ0XF4TF5lpeJp2eFR6l
         u4qSs4mPyhyjmLtcS6RDVcpY8M/mDnaUZU7ZYqZK31N5noeLIyQfN0Rg0rjuCrTdOZVT
         vg0w==
X-Forwarded-Encrypted: i=1; AKwUvBxYy95eIwRoGgvOvq/4g4Cu7/oVln+fOOe0kV+aR0BKxDZMMpPAkGGLC1GSfAIs7ZI3UUS0Gy09tKEbgSI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL44jZtZkvKGGZIRlhLK3QKelEz52aC7bpMfXAaaxr6Ae3BLRET
	x/WkU4OEz9c+cHI1m83D7BXbSNYLfkY/F2etsd1dKprcQ3tNezdfWZQz
X-Gm-Gg: AYBFou2tq7VrV2y8aiMB+GzxfbklK/GNpo6ep5VQhFPnUCpx6JjVvXSWJcPzBGbgKdc
	5Z9tGw27/iyLhunoWyHccslT0ju68jPl3BFWhtaL1OwSNETCTW3wgRNoE0xgo/hjfdIpxzgSOOM
	cKE9Yd+caxGhD2GrHgeOLFpck7larAy00KBcPPcCLcQCPT0vq+bXeKl7c/N4IKmHvtO2qBvIEwS
	ZS2CVa9aw2xn5PH+tJLBmNu94cxR/GM2GA2ZJlaSNJaxrazLtnoqywcsspMlH4iCgiMCjELMvhY
	9kIkeIdGo1djb28uhLJwM/CDFRvIE7yL/QRefLu+aBIkjcjpYfrpzNWbGqgndXSzFB2MqAfzPGX
	E/2LGvcJSN2LhBBrj9Z+Yy9g0zIW+enKAZIeJSojIGADWDeCmiGxh//MNFt+mCZF1YbZ/cKL1vW
	fZfACtlGL5vUW/+8jfJIp9EkWejAS4nHExx0Qzv9IXk1z8Rgc2y61JQKrOusQrOA7opI/eDXeJ3
	nwJUIc=
X-Received: by 2002:a05:6000:40ca:b0:48a:f571:7b50 with SMTP id ffacd0b85a97d-48b024d7284mr8291147f8f.27.1790865029297;
        Thu, 01 Oct 2026 07:30:29 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0691c4c4sm7548232f8f.22.2026.10.01.07.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:30:28 -0700 (PDT)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
Subject: [PATCH] io_uring: fix out-of-bounds bvec access in io_vec_fill_kern_bvec
Date: Thu,  1 Oct 2026 17:23:54 +0300
Message-ID: <20261001143003.755790-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

for_each_mp_bvec() dereferences src_bvec[bi_idx] in the loop condition
before the body is entered, with no guard against bi_idx reaching
imu->nr_bvecs. iov_kern_bvec_size() stops iterating when i reaches
imu->nr_bvecs even if bi_size is still non-zero, so the fill loop can
walk past the end of the bvec array and overrun res_bvec[].

Open-code the loop with an explicit bi_idx < imu->nr_bvecs check before
the dereference, matching the termination condition in
iov_kern_bvec_size().

Fixes: 1045afae4b88 ("io_uring: support vectored kernel fixed buffer")
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
 io_uring/rsrc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index 51b46e624..3d29a0c7b 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -1614,8 +1614,13 @@ static int io_vec_fill_kern_bvec(int ddir, struct iov_iter *iter,
 		struct bio_vec bv;

 		bvec_iter_advance(src_bvec, &bi, offset);
-		for_each_mp_bvec(bv, src_bvec, bi, bi)
+		while (bi.bi_size) {
+			if (bi.bi_idx >= imu->nr_bvecs)
+				return -EFAULT;
+			bv = mp_bvec_iter_bvec(src_bvec, bi);
 			res_bvec[res_idx++] = bv;
+			bvec_iter_advance_single(src_bvec, &bi, bv.bv_len);
+		}
 		total_len += iov_len;
 	}
 	iov_iter_bvec(iter, ddir, res_bvec, res_idx, total_len);
--
2.55.0

