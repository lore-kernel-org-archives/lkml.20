Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC4741D4F3
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 22:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788044255; cv=none; b=lWLGLki2dPCayFgyYE9CvG4p3SEBg4nU9HSxuwLo1hw5ffIcDYEJ4mEtlaeacFpdOjLDtidf5No9Xn4F/iyJvcWlOlcJYsBMCjGA3hkTax+Z/fRjf5spkYZ1RtPHrJh4W5X0mcGxcpiTdmDhHl8QGDWLKjNndd0x+OTUU7iHLX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788044255; c=relaxed/simple;
	bh=Z6iAHN7f3v2qJZDWLBrgfCSFCZC8Je5UhoAFvCrNcKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T8sC67/un4imX7lCpEeriSezWuIHS9OP9qwbq+fqEdyyg2+vpa4f+YFi6uGjo4KLSCHU2oirPPSjktGiLJdbE6MIuoM7eLUoiD8I+GVtbwXIega2BvsbXCRkMjCEGdoq8cBZCb+EFZbH0LKUxluiYxqBEoJ3imsKEcskXwCV8yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TEDQi5VB; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TEDQi5VB"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso8524125e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788044252; x=1788649052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FtlM88NQidqFT8NjUtWtKrEvDDJn026XfxLb81ixvB4=;
        b=TEDQi5VBqTiSY9vz4peEgTUhey2dAo0/WVKsP7wpP8tRNkF5IXVbWbRa4Cu8aX0EFy
         FL1nfs6ne+3AvZvOswUzuKmu15pL6RvZVbCwTlR8Fah9LIfljO6EIluQiQKLwzuayofD
         XGF5Q8U9iD9iB1d9Pt0V1MlHqbcI4VA1zWC2GsTrr61cuO472gP93a4CaB3vYWd4KQ/W
         WFLse14wIFBsY6S5lLUfouJxu61beRFP3Rx5afwvtRfKEi9KyDyx1Xye35KlydmWclH9
         n4DukdbIyqtg2aAtoV0SyRmSiVeeWG328k/uhXLLTHlpn42mpiL2xX7jE9ODpzB8/x9x
         WiYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788044252; x=1788649052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FtlM88NQidqFT8NjUtWtKrEvDDJn026XfxLb81ixvB4=;
        b=VDvLtMLYnDK6fxoKkZFLbUn1tAZPR/iQy6BEumlrxObKDTZbhL1r7ykfEkwhquvfH+
         phHt+YnVH/hj9xjn/45hW6CDgQMD41OXsoZcMHApW1Q8ir3BOt7lccbSoKgqlqA/qezi
         AMxWKTAK3ls1rJJm8qxYawR0Wwk7ftqDR/j3OrNQ3cQQnx4R2oUrq/QmE4/kscjWitnk
         jO2PqcArFaoVCeEc9+aM0P3Opsvh43vC256XdSjHQR2+iC/rvlRnyp1X/HQ18Ceomscj
         W+f/PABfVzqJPFIAwGPJNbnKnWUYVuy7MHWTcl9+IN44Q041aTd4ncte0dnZeyiuYroc
         dWjw==
X-Forwarded-Encrypted: i=1; AHgh+RqAvSmFazryr9qgSMhLEfXhlwMP+dJBD0kdFl4jZbCpDf+PgGJTAo6IPv9jHxu6JluuboZ0TMAbrCHmB6I=@vger.kernel.org
X-Gm-Message-State: AFuF++lQ5y6rqYxgbmUSviam9WiI4TDsZs/VcuewWxrOCrB6lC6mP8Up
	690EgYqlDz58kQXjNKuoSS3fU402I27ArUVPUjO96u0mqTIElFd5G9uwcYW7yOKx
X-Gm-Gg: AR+sD10wZFaa7bNbxVMBKP9popanSz7QPdv6bbD8rd/EVgqFfS+Co/r2Tdk3YtxHu2a
	IEyz/bcHMtnDDZDox7x+uEe2Nm/72TBpQbITUziVir2t31evJGns46NWbBzy8KjhRBGovnQ/QqQ
	VnFIK0/aJfRctH0PxL76Stcc2E5JFH/KI6v2mYDB4ljQubG25apIcKfXvgcA3W4N7024Gcb6nVY
	mzDaRwMcWqoBqVsl+xOW6RVNk2KGFx+LV1DhKSBY77tGLpabQSuzLhd+GWbBu82MCzcHSwBnbco
	GnC0fzH1biBRFU17rlBwj9oLmPDobSl8hzrkq7VTkAjQibaceft99DA+Q4dQteU3UNM7eVh/zUn
	oV3ehUaqYtEvJiJ4CoOl1g9TolbZYuR+/YkkK5ZOu+izIkS7+CVw08Fw3FiMRO5sjaV71zUbpfd
	u1kMp+LoPu55iwbJ9QYkl7WSklF+2Z+uzgXMTlzP/6TmXkjynBRJhWQ7uyxinHxPbU1WdHkRj2G
	EO4BL7Nlmw9JVIip8n6i/+ADGBdcHuquFXjDD69IiHq
X-Received: by 2002:a05:600c:a02:b0:499:da8b:1476 with SMTP id 5b1f17b1804b1-49b91c52579mr214245935e9.14.1788044251665;
        Sat, 29 Aug 2026 15:57:31 -0700 (PDT)
Received: from 1Z10 ([37.161.113.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccea6b814sm60751835e9.0.2026.08.29.15.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 15:57:31 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v3 0/3] platform/x86: Describe Yoga Book haptics and audio resources
Date: Sun, 30 Aug 2026 00:57:26 +0200
Message-ID: <20260829225729.395270-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <apLZF6b3F39z6bUc@google.com>
References: <apLZF6b3F39z6bUc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Book YB1-X91F/L firmware omits software properties for
its two DRV2604 haptic controllers and does not instantiate or map all
resources used by the RT5677 audio design.

Attach board software nodes describing the DRV2604 mode, waveform
library and enable GPIOs, instantiate the TS3A227E headset detector, and
attach software-node GPIO properties to the RT5677 codec for the second
speaker amplifier and headphone path.

Changes since v2:

- replace the RT5677 GPIO lookup table with GPIO properties on a
  codec-attached software node, as suggested by Dmitry; and
- reprobe the codec after attaching the software node so its GPIO
  provider is initialized with the new fwnode.

All three patches pass strict checkpatch.  They were built and booted on
a Lenovo Yoga Book YB1-X91L.  Both haptic devices played effects before
and after s2idle.  From a fresh boot, the RT5677 GPIO consumers were
present, GPIO2 went high during speaker playback, GPIO4 went high during
headphone playback, and microphone capture succeeded.

With Best Regards,
Maurizio Casciano

Maurizio Casciano (3):
  platform/x86: x86-android-tablets: Describe Yoga Book haptics
  platform/x86: x86-android-tablets: Add Yoga Book TS3A227E
  platform/x86: x86-android-tablets: Add Yoga Book audio GPIOs

 .../platform/x86/x86-android-tablets/lenovo.c | 188 +++++++++++++++++-
 1 file changed, 187 insertions(+), 1 deletion(-)

base-commit: 32e17ef088fc55858886738d0b904248e98b30e0
-- 
2.53.0
