Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348635;
	b=tuWN8wF1WQ2j2AEkrds/q0p0a+saqx1kh5+z39ZJYXFgPM05jeAmhOmowMn0YXATPmKn
	 2ZswG5lUyFQZxr2V/g2c3yqpyfMeUrpVjiC94imSHNGYH5kJ7lOEt6pAvfKIlqoT5i3ev
	 gFym2ZPT3UmKKK8VjSlYLbm6ldB0JbFGZE1S3var5ByXmOeitcG/4LFZSdY5wx6dgBh3o
	 zY1+m3Qkp5c9LXBAvm5IZNfkaSfrIEhW8y8ZNtp8UExjVw0+Z6tQm8IIa6urDOoegHDzW
	 sKBoOMYFhdyGGoesRO8K6q+Cvgq+/cornQeLTex2BI7Q4iX/yL/Kf/5Pk9nPpQ6DOaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bqzCmvhaNWcuJ+bM11VMKpyipTAsKmtuL9+xfzPfDz0=;
	b=0n/mZ3X+Ll23zrOe1fPeIXhzfiWS3AR++nwjaFiWOQpng8oiYOlFbx8AKoHqdnX1BQ5S
	 47bRtUN6QPYG3XacsqeyooJEHzPEjCjJBmfE7e/Ab6ouyNup+aZ4CP44d4gfMu/UYSrtP
	 AUSDaQlUb99jRq7xe2vp5yCmuabEAv+vNm+dut/SeeEw2rfMgXLydgTCaz7iI1lHVV1Ku
	 zH7QCqId3xDdj8IXEpDoJup9NH7NsN98lVtgZ1gT4U3DMIn+WseFkOXFQCNunNHDfCSLR
	 UX+7YJLryHYyzXXmBBVXNJu3hGyg6uPripndHbT66CH4kupraz1LtkTyva9U6+DJuog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LpZj5rMI;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FED606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51FED606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LpZj5rMI
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3514b90bb89so895318eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793348633; x=1793953433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bqzCmvhaNWcuJ+bM11VMKpyipTAsKmtuL9+xfzPfDz0=;
        b=LpZj5rMIFJPAg5A8Z1AM6kCvG0hisKEA3dzYDFsL4EiASeL7Pqw3FwXZKLJ3nj/Etd
         gPmLPNQPcQuyBfeUFvKYkGqrj5JO6UUMgRjAMJM3d35diccuohJAjaBbtr3elkzcaVfV
         Rp+dXhyhP3ramHiTHQHd6+YgVbp3myCWT4ykkrWUKK/JdYEwqZcMJs1c6gQD9CYoO96r
         FjE5vU2D0t3mBj0quPr2u4J9SgU5ZUb8Pdw4vpf+ZcP/qdoYzCwlAZPGJWtrodZic0I/
         h1m91pzAqK5q+b/wKAzK9iDqeenqqrzZoKrLjEQ5mGSwJGU4+NwAm8sqitKBX9bCLumK
         kQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793348633; x=1793953433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bqzCmvhaNWcuJ+bM11VMKpyipTAsKmtuL9+xfzPfDz0=;
        b=IEFzOdZR+ovlQnAaMc2bVx/R0zT5YcyVTGmPYxrBKq1HsWTIneRtf9uaU+zq9+dWsU
         2TJbS5RzdajMbg4PuQyMegG82a/oYUfNxim9ZxlLK0s+/LWTZ6hoDNigEobqRUkrhzrB
         yNT8fQSanOEu7lzsQNUPCiyocCBhpmuy7+PlME6HIMac2nrDJzvL5uswH7ZLxBBU/wvz
         8IwddGpReT7+kB3SsJwZN5OQAEIuHyDOnkYNapiUGN56QXE5F2QIfQGcedP8sPxV+cYD
         RwzRW4L7c8VD62Z0nN6avfu5jpHWQ4w5NiRiVPcV8GypCoxGNZ67fziGmcpTTsvu1gKu
         TR/g==
X-Forwarded-Encrypted: i=1; AKwUvByGHDP6a+TYumxteA7ONn7gz6zaLHFJ2rFbmQ5zdYLch1uKcDvDMK/MeADHS9m0iK1sjD+P6DwLPsFQt0M=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvCusIel3u74IYxzFfTiqtmdkYTA6I/ps0RlYqPBo4faXsF8OV
	gUcnWjsXPZipJOZpBlHubfhfhgNMVfKjVTVOqumX24fQgBVuKvEuGiY1
X-Gm-Gg: AYBFou1G7MtWT9zilSJWklDDa6scivWUBAGM65Q5qwwsnHrxDxeFHvnqHN1jtxmmvP3
	255VWehojwVfJoTpZeZCjQtsEI4iWczgJZzI0KNKJomzRvAKhVVo6JOjU+wlgOzD3Sb10knuXx6
	7nUVpq52ae6emu/1S04XIyg9pKV7vM31IcWm2GK+a3lqT7aGcCRt5EzgaBHSo+yNLL0vIGaSO9J
	RFR2LcaBweEhlwVYy6X26F4JjdC5lVffjKkvyzXrQPlXI5bRBsDCPW8BvpjWOvkYtQSnBh8N3G4
	BScYKBZqLjVocX/AIgbF7/5OHcpBcffr3Lkf3BszHIrcPene2TD4N2KHN/PCGAbF08udZUps10Q
	YvF6kqt1YLc+LpyRm4vYHb3Hqp9JRX4t85gIBOY6xNG8pesfGUQ8mkqAC6tqK1i9aNCRmDZfh4a
	rDCfy9qRou7Hmd64QFdIAyityDpwkN/kOdYSWtcqoTNnIqDTuP3RXAmfZV9Dtt4OEwI5Db7aSl8
	rUDYdqICQ4vjk2eG9yrHanB7J8/JNoUXTM1WhUWZ1x3LZ03UeTnMCSHz4uRs/AxUvmM0FzqC8l+
	C7d7xPOQLL4QvrCwecYDGJFrRV6n6w8zAUJQ8oZmKyhz6K1Pd6zg3QypQTDWVS/fvA==
X-Received: by 2002:a05:693c:4159:20b0:351:29c8:643 with SMTP id 5a478bee46e88-36a423a8b7fmr2874253eec.18.1793348633406;
        Fri, 30 Oct 2026 01:23:53 -0700 (PDT)
Received: from chitransh.. ([106.221.205.232])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm5999986eec.26.2026.10.30.01.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:23:53 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com,
	srinivas.pandruvada@linux.intel.com,
	david.e.box@linux.intel.com,
	irenic.rajneesh@gmail.com,
	qipeng.zha@intel.com
Subject: [PATCH 3/8] platform/x86: pmt_crashlog: switch to devm_mutex_init()
Date: Fri, 30 Oct 2026 13:52:57 +0530
Message-ID: <20261030082303.284271-4-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030082303.284271-1-chitranshmandhaniya@gmail.com>
References: <20261030082303.284271-1-chitranshmandhaniya@gmail.com>
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

From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

Replace mutex_init() with devm_mutex_init() so the mutex lifecycle is
managed by devres.  This removes the need for the manual
mutex_destroy() call in pmt_crashlog_remove().

Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index d7018b495217..1071320ce6be 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -591,13 +591,16 @@ static int pmt_crashlog_pre_decode(struct intel_vsec_device *ivdev,
 	struct crashlog_entry *crashlog;
 	u32 version;
 	u32 type;
+	int ret;
 
 	if (!pmt_crashlog_supported(entry, &type, &version))
 		return 1;
 
 	/* initialize the crashlog struct */
 	crashlog = container_of(entry, struct crashlog_entry, entry);
-	mutex_init(&crashlog->control_mutex);
+	ret = devm_mutex_init(&ivdev->auxdev.dev, &crashlog->control_mutex);
+	if (ret)
+		return ret;
 
 	crashlog->info = select_crashlog_info(type, version);
 	entry->attr_grp = crashlog->info->attr_grp;
@@ -641,7 +644,6 @@ static void pmt_crashlog_remove(struct auxiliary_device *auxdev)
 		struct crashlog_entry *crashlog = &priv->entry[i];
 
 		intel_pmt_dev_destroy(&crashlog->entry, &pmt_crashlog_ns);
-		mutex_destroy(&crashlog->control_mutex);
 	}
 }
 
-- 
2.43.0

