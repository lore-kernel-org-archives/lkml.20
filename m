Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CD63AC0C1
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790692663; cv=none; b=Ky4zmDwW0KibAv2w9wls0E+o0xN+txC8SMKUJDI2CcsYhvV5WdUnoMjsnk4GTOksTAFjEe9Iu7UWbqjIpvf+za0fDOhe/QeYlzFtmO4sCbEx2n5pC2ERRLt3YzVMMNfKJxS0s8NH1C68yZ/oZzPg2ra+dlsRJIMydDfwTtRorlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790692663; c=relaxed/simple;
	bh=9u3a2NWAPRmai8vcI0/NGUrf/F7BbV2a0ai78l+zKMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P42kyUBg9vKQmg/wB9tttlZ6+jy7AB2rLPO3LSnW1GFa0b68cZ9qcCU/CAVrcyhZjYNOOSvg2FxXveN2ey+AIdr0XzJ7xUeGfLcTtpDtCmTn5Xaie7zUoDmktWCAMimBamFCg2IWGI1RCgO8b6+RwUfQypaYt8xDHZ0zheRgCWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O4VBhVZJ; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O4VBhVZJ"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so26603855e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790692658; x=1791297458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jy7sEpmEwJbZl5O5isZiPG/sgCmuKe0E6KT8jBOOk0U=;
        b=O4VBhVZJyV0UQgvfbm1KW9DF4eXHUY77nfwmjXxavbuewBG1ijVmlttnopGNNRP1WV
         xXhvAR+nU+VCNqqfbflvAEKnnMuIbodlhCXYK/FuyfONNazfsNWAPvzzNnYhOR/JmjBl
         fJ4C0QSwu4Mi0OWinAave6799AGaHx5vQwwb8gT7I2nulGbA2VtAx4R+5uejT05GkM9Q
         GFfWIDn1exX6/gSeQ05/A/Z32B+O8Rc3ZL7YhAR8uwPZvjIwO68y36/szzA/zMryN+lQ
         JpSUmI0eIvUChKiowun0eAMN39uTS7nFGK4z3CNNjrANYeJO6r+E1PjOwTimJMN7MeOP
         IDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790692658; x=1791297458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jy7sEpmEwJbZl5O5isZiPG/sgCmuKe0E6KT8jBOOk0U=;
        b=2RbE+FSBdQHkOyVujwrTJdOSRNsdhuFH83M4EDZmuKU9Kw+WA4fIm86W4qhC9uFkey
         kWiJh7aDoZvDg8viIqTlvJH2yGhybL9jdLgntiHyrYSGLDy4m7WeDUc7DqkhtemAUyoU
         Tgt8UL2IhgEg7Y4pdv0ZpemEFweDa21BZTuSRtS1k0SRJ4Uz5iPDaH01CfOZvRKtTvkt
         5yuVpYIKN6ILnRqD0B6tgIqb0aZTaxJK4EGPVKd1AipWULqQZHjfJvxeqNhFtgczOKd3
         m5ii7iXmITtgyp5scOiyWaCxurG/hQr09Kp7fh9uW/E2DcCQ1HgO5Oyv+R9Rtu/pfWuW
         LsEw==
X-Forwarded-Encrypted: i=1; AKwUvBw0WQcIY4F4XIOzP4sZ/k/dT4IIWb4nDwjyuOaHK5584etDqLOcW1IJmD6mAWjjCStqJmvBayAdSVPewxk=@vger.kernel.org
X-Gm-Message-State: AFuF++kG796YWYpk3M/NteKA02LCzuEy/0fCpF5n4uidDTw0fbuYf9J3
	si3+cVcsUi+DCxI+7m7t0N0Y34iyq7X3XMqY8so9ubpRhCM0dFd1X2E5
X-Gm-Gg: AYBFou11x/GK6GTfEVBu8HONeMbVs0AhPbviZu9Xay+7mFZrfDQp86IcvnF0a5uzrAA
	KtlZDFQC7VeTpu41hUJUYNvxhD8oZtrFufBPe0meXuRfDlabvI0cbwu9lmNdkPhk7wioPycIFMX
	dThxYZwZdc5NDwbtHv8nP8NLdGSGeCHAQuVv9Paoc7bBZLHLCqwadQdCtv/JVWoZ+EzbMvkYPrK
	IifF8e5aSGAemiYa3A95ZsVVyezqIZFRD74B1znydkfKghEc0Qat30XX2wCdVxeO8eHeZsWgf34
	5NLH7ZL2UnOoZt5U7XI0u4tQqLrztDpgG5EPgeXnPHOV5gsu2Cmx9lv+5rwVVCuGHlP3DL5m1Km
	WHC4iuZ5PVdFosCA4qSk5sc8M0WRwEye2qjoaQ8abH3iMdA/vu2e780zclILsAYgqOXAfrUrha1
	48WdokkeXXdn2zN9trHJsK4vw9jNW8/JB8kpYAznw8Q6oxIYhfJbH+6FJjgD3Jm/xDzLz3iVWba
	r4qOvTjGJskmpnm+El9+NjTpjunhPdXw36ilJh1KWmz6dUQ8ZxjBiwKHEU=
X-Received: by 2002:a05:600c:530e:b0:4a0:13ea:2ec3 with SMTP id 5b1f17b1804b1-4a013ea30d3mr4647925e9.35.1790692657899;
        Tue, 29 Sep 2026 07:37:37 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf8f93csm89716995e9.5.2026.09.29.07.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:37:37 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Sarang Sapre <sarang.sapre@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v2 3/3] media: ipu6: Check the ipu7 output pin queue before completing a buffer
Date: Tue, 29 Sep 2026 15:37:31 +0100
Message-ID: <20260929143731.43358-4-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929143731.43358-1-devnexen@gmail.com>
References: <20260929143731.43358-1-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A PIN_DATA_READY response for an unconfigured pin dereferences a NULL
output_pins_queue entry in interrupt context. Check the queue like the
ipu6 path does.

Fixes: f268203d74ff ("media: ipu6: Add ipu7 isr handler")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
index 379a84b595fd..d92d4cad30e6 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
@@ -644,7 +644,8 @@ static int ipu7_isys_isr_one(struct ipu6_bus_device *adev)
 					   struct isys_fw_msgs, dummy);
 
 		ipu6_put_fw_msg_buf(ipu6_bus_get_drvdata(adev), isys_fw_msg);
-		if (resp->pin_id < IPU6_ISYS_OUTPUT_PINS)
+		if (resp->pin_id < IPU6_ISYS_OUTPUT_PINS &&
+		    stream->output_pins_queue[resp->pin_id])
 			ipu6_stream_buf_ready(stream, resp->pin_id,
 					      resp->pin.addr, ts, 0);
 		else
-- 
2.55.0

