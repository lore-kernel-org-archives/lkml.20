Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782971;
	b=uCpVBErODuVwfqdpMz1P0Z4nckHGczPasW1NyzHMGo88s7VpZ1QPAY6B4x2cExakqwfR
	 PBa45JkXTTHKSr4PIeEyw130MbXN9Y2cLNqQpwfjDVC6Y1NWUNmKiw+NPfIi+AcHxA4Cp
	 f9atWsp76ES8/05I36PfoLpqdV9inQrrNHfBx4lATgImg3IwLpGEfGe2y1lZ95I0Rkyhk
	 yfplJNeOkeS+qqWV5e3TIjORcAGYQ6L1/u05mZRvIXsBfFoSxvCXd1wAP/LSGzAiHeiYg
	 qGAX8D9wYLm6vySao5oAc+57qLhrziIy/VCe2p6QWTf/E9srtWldg1BkwQ+3mijrWew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dqcRixLJmkkcy3eiIFpsvvSqFHhQ30OHANn9yneJXuM=;
	b=AfSnCY2l8PYr7E95rjk0XlR+EsEACV2il0p+YR83sTdeTFud2oGb5blh2sbRZdsDVilQ
	 u8FVq8hp6NZoRqoqXZC8fp8EesrrtGypE8tFMyM2otGe1DXMNneIjKIqFsscO5tSjvJiT
	 tDXuhqPKpy8ZKBAtD5ePMaw3ta0exJNQVxTCjSAsErCU7lOv8YcwV1TeMobFQYSFpb+qO
	 ObJz5Srt1vl9YcKhFIbJf4diQ/cC+ir5MwfQ+DG3gekW+hgoJV6rJeNCyr0sY3ODb6JOl
	 16RVoadA2goiqBr6T3T4aVB0wRR6yq0BtuXsghWdMHFzh9q+iJIpIKiMdJYWZV4bVEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sdHj2hcj;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CE7606EE92
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03CE7606EE92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sdHj2hcj
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35c76e9614aso559871eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793782965; x=1794387765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dqcRixLJmkkcy3eiIFpsvvSqFHhQ30OHANn9yneJXuM=;
        b=sdHj2hcjewu/pJjLV1f5snSmqxrqj5pa+YnHcZCyKRhPc2yThYFp9l4BVSfBQBWT1O
         oYH+RsVaoYO3KDk6sK28SloHyXxEvzVOtW7kkmZTJL6D0y+rlZTeS17A/tkKe2LRTjeq
         NjtxLteDJw25juRUYKsPtM8v1im0cqA2Qronv0T568l6Y5RfM/zqWe/65FZkPRB+Ok5p
         9twJOwmuZ+YTQwBDUl2Bshvh1461x1DDHOO88x4VarTg/p5irmBSzP2TN8o01mhrhR7e
         Fp3t5N9bm0GoApWLiXZCuCNKHhDQY/7EI5yf+bclgTcgtaNwkY359quU6U4thsbTZmgI
         hZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793782965; x=1794387765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dqcRixLJmkkcy3eiIFpsvvSqFHhQ30OHANn9yneJXuM=;
        b=G7n4mou9Z0yqQ5MFb9H1FvVkiraymJVFnfZ4ixw7oVTuAf5HSWzbf85TR8DhM0w9W0
         2aSnWZ0nFWCVlN7oF04Ey1umkxJo9kkJIEjLJIGubXwNJdkP2ZuvnHZVjCxeluoWZmvs
         49Lk+PQ0VO9FNZOwdc/9O/e0Q8JQW6uwbhvHfSbFo+y4KUJBCow/QKX+tn0yEglucIjC
         ir1NgYt+2a/2oXUdmYVkk+OjRrleztaTVo02Gm9VzmIWdk6g7DYhHy2W0cuBRTWa+lEg
         Id14nE1hQ2/Y3ne9ulpFsp1JXcqBZXqz3KNN+Ex5bEfbIJu7knWpDhJC/cgciS09VJYY
         r6ag==
X-Forwarded-Encrypted: i=1; AKwUvBzSpCc9NlkiIe62znJIbk7YVZI42A8YIMrmVvP5eJa3Hyue/s41rba3dkgyHPMPXvp1iUI4AgA3bU9gEUo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9H8TjXZofsrZLdoYcKYn6bfXjD0gxDYlShEvfYPI0o8MQ1xjUc
	hE/xvoM5FYtTOcHQLUB4+WEW2ixV8Ejv7ptg96+ITB0FUrKXGytoNj69
X-Gm-Gg: AYBFou3SzH/+rS5erFQLshMQdBY4b0oyjR8ayJb2lKUOaGyS0kyrOokIHRbVXrsFKfz
	y77GpC/dSHBSzMeijzGhNmc/mZsdiK7qXsmRDyO4PNdl34yX53Bao+9C+24y7Xr2O426aHWl7qc
	1ekRCtpx4gv/0ofb5RdRexibcOHNk5v1E5zDWqy9G85WqcHVOMwWkdoA28IjP6o56kXUh9XOrtR
	RPLl0JLsojdtKCkn35ppDxLi+G8LNwQ7q7aiQBIuVVg53NVibriPsfK7J6oTRb3uDMFjkzMCwx+
	AesOmDwEK6x4yDmUfrNl1J/NCefjn+xj60V5cDDhcKeYqYrdVEC7e71AJAb3JS85t0XHoiS7X/J
	eQFM1sbgE7NtGlm/lWM/uAtcSxBixC7F//7ZWmKamCTyIfxELYGdX+4/MBotSWG5lH/kh5KvDqe
	8P//d6z61co/YRMfUTvIhs6iixgWGTTZ20dTT6Uue5i4r8vhc7GwHLbxz+uJSkYeJVBCauz5dtf
	fuFQEZktNgrla7SZbhQA9QOtqVWB9xW5T6RNRK3kLCqvW9QEJmBC2JGvaxdCnlBqPMcM3m0DVGZ
	2CIWTV7Li2zTnudf5eUd2xazByjUP6Z1tXsoeLCo4LvfI1CZ+kNqTBF7+4w=
X-Received: by 2002:a05:7300:c00f:10b0:36a:1470:da0e with SMTP id 5a478bee46e88-36a423bececmr28116053eec.29.1793782964775;
        Wed, 04 Nov 2026 01:02:44 -0800 (PST)
Received: from homik.search.charter.net ([2603:8002:ad40:56f0:37bc:b892:b6fa:fd6e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39c5f0csm5182375eec.29.2026.11.04.01.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:02:44 -0800 (PST)
From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	kees@kernel.org,
	justinstitt@google.com,
	morbo@google.com,
	Mariia Nikitash <nikitash.mariiaw@gmail.com>
Subject: [PATCH] media: siano: Replace strlcat() with snprintf() in sms_ir_init()
Date: Wed,  4 Nov 2026 01:02:39 -0800
Message-ID: <20261104090239.311074-1-nikitash.mariiaw@gmail.com>
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

In preparation for removing the deprecated strlcat() API[1],
replace the strscpy() and strlcat() calls with a single snprintf()
call to construct the IR device path.

Both the source and destination buffers have the same capacity,
and the return values are unused. This preserves the resulting
string, including truncation behavior.

Link: https://github.com/KSPP/linux/issues/370 [1]
Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
---
 drivers/media/common/siano/smsir.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/common/siano/smsir.c b/drivers/media/common/siano/smsir.c
index 283770d583d5..636ff228108b 100644
--- a/drivers/media/common/siano/smsir.c
+++ b/drivers/media/common/siano/smsir.c
@@ -55,8 +55,8 @@ int sms_ir_init(struct smscore_device_t *coredev)
 	snprintf(coredev->ir.name, sizeof(coredev->ir.name),
 		 "SMS IR (%s)", sms_get_board(board_id)->name);
 
-	strscpy(coredev->ir.phys, coredev->devpath, sizeof(coredev->ir.phys));
-	strlcat(coredev->ir.phys, "/ir0", sizeof(coredev->ir.phys));
+	snprintf(coredev->ir.phys, sizeof(coredev->ir.phys),
+		 "%s/ir0", coredev->devpath);
 
 	dev->device_name = coredev->ir.name;
 	dev->input_phys = coredev->ir.phys;
-- 
2.43.0

