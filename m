Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794033258;
	b=Aq40Epojv8MFcR3f+yD6PyhWEvSUYoVN7Hj5oSoXNEZJmLii/ROw6tP12tEFlU+JDIXl
	 dM2mD7w87xwt0OuMBEAvPks7jrv5fka2jJ/iUuW0YEEuA2HoKps6SXGL20nZnqwTzTNno
	 WQB7qmMTckOOQ6WNXJ3p80bn7UPhHRppSmSJBmIkTZAiIabr5aDc9FiJ5ElyZ3P2oeOr7
	 6kCUnPtxrQiVbe9ZA4U4hQt+5w2tcv51D9UfGWnUmUA3QfH2DXaz0jzBSNv/C/HEr8YYY
	 9i9pum+M31qoD2Pr+sOsT81Gh9ZXNY178jjIgfsvpkY8WgaxHMzIoGmZEprmGNvOyYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794033258;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To;
	bh=rCSoVSPy0ubo1scrbTANm6C4v1LOJKhrmcmQgcyDlL0=;
	b=SGRRqhQqkyWmqF3YjxkiIK05sBMLLnXpvqmB9ivaR9vbRtI/WrVHkMjG9MRCyUa+1Pzc
	 bTrUVhwNni59DLjgJYxbos1ihVac4wawosOq7/pj49tQrfQDREbXuRDmEdieMaW6/kT4E
	 BniApaSE/J0MFB9w6X+ln39BfgZUmcczsl0xDtnxa3Bi4bgotwsMYCqBgpUix9K5SKbn8
	 zYaH+HCjHfoavjvxLOgvUJy73c05E/KJQNmtTM3dneNU3EPbBWQP8fKA7etrF3SoIhoUu
	 XWjNM/lecyEovfHC5Dpyz9l4hRFhFWeINqHL1HR1kJp6Ew/UkYZugG6fW6onGBITxmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HjV0PxxO;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36303606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 06:34:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36303606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HjV0PxxO
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so559221b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 22:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794033257; x=1794638057; darn=vger.kernel.org;
        h=in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rCSoVSPy0ubo1scrbTANm6C4v1LOJKhrmcmQgcyDlL0=;
        b=HjV0PxxOIbBvldJAgzzLKy0ZCL17XnRGDQdZmTIs7KrpTSrEpqoMxSI2W6p+EpUGXB
         p0IhsQN61V3Rz1XqMucdyPMehfZjlp7Lespn/ooyK4RuLZAI+xziKZISNyqPJ4I1nPUk
         n9xbEibhPlVVdnYhupRu5LrLhqT1B6tm7o0QbnAFdNu4wLdfh+SfApc/A2rkZt770uaD
         s7g6XOvZ4GivjK7cYBMF/4gdvGuWk5UYAWiQmMNjGAOHluw1Pc0QTE6YKSwLa52Fs4X1
         vwMLTB6jJXkgjxUMbuxTYuxTVwQlSj47oInU8tSffOVOY13vbERRzXkTb37DxsrCMgMV
         tm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794033257; x=1794638057;
        h=in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rCSoVSPy0ubo1scrbTANm6C4v1LOJKhrmcmQgcyDlL0=;
        b=y/K3G/8dPnRZynC2JyWQ3M7tiS40wo9hbcJ0VQo4Hj/z/njpPcEQYhcqG9tvdXYlCY
         dIh/y4ZM1inPnMKZ9VL87LDlcBcpwLwEp6BmQ0JGjq348OWwXkRdN7UVtr0jFHMazBZt
         +IE8VPIAmhKYv3vBSc2A6yF3AIy3x6tCSrWJDXcsfmZtvgH2KX2PLdcRiSuT0dVk4tmO
         mS+aNrh9qrH8wuURJYDFW4j4SnfEy4XO0BQT4emu8X2YDu5SAKZ2dCMSKbFbo2bb+kb2
         TLSgVRNJuorwMWwBqTB6mYojxBja8sjPx+M6I31PkeQOJNi2fdLswf+ffERlFRO8j7oB
         UKdQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8Mk0w0fxkt23VBiijDXYCXDRbjtYM8bZ6NUVXuSkFa0SAkn6D3TzF7hyOOJQsiG7H+1zq79zqOhxMIAc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9b8ZbPLr94ZrQkpP6ibpNjtK4iK0beBToLQOlfEDFNAbbDEW10
	Dyh5s72quxJlSMldUXHe1voP7tSZpXhEnhU36OBD7nsKXne7KTP2aoom
X-Gm-Gg: AYBFou0a6+PcSk84MHRsQ9VinrEJzHqyU/K+PHc3pGS2KWn88j25cakeCaL08Z7LCIt
	rquRZRCRUDCBNNuH/VKpqgGQiIYwzv+Nocb5b+1AoZKAa3vofMDjhRAF/zOXHXf/+hrHtsupr+0
	UyIEVDoXev0TR1VLG0zACuoj6NBDf/Tlm0aSJWrkFgL677R4LEpmCuuH8Gk5mEpLXoRFQbUi6vz
	Vl1aryMQGqWapFT6D21anc3OB2UVfUaD+ooJHlo5q2wqo5W4QFz0NJgz+EllthC6QAbiZ7PFKvc
	iMcVO2H+BeNTbjAFvwidM51OJXcr1TB8gNfcLSS0d1kLeQJN7Oia+s/ffVFpv5j5XW3GLiU9J4J
	8p5nhwGTUtzPI1zK4TSwadAyoqyMt2hxepjX3KPgtaV1fJSvVFBzD8TBWyswZI5W1uOzTh/wxl0
	Udqy5D24APjVJXKQmz0VrVKIepDOUj9jpqyO1ZtSYMEbWR4pm522WEuuTzHhhDz9hwZ25nBzZY4
	8ihfzc1ymM2BrnthO/HyJActfnZdlG7oIEcq1FmyvM0a9pZ7pYIaeWNaLRSkKICBded1SdTR1DC
	ErFoIio8HesSLxesT5MuxepTSZhvHXCrLlvpTw==
X-Received: by 2002:a05:6a00:188b:b0:881:8b53:f64 with SMTP id d2e1a72fcca58-8b37cdf8de2mr4176428b3a.59.1794033257505;
        Fri, 06 Nov 2026 22:34:17 -0800 (PST)
Received: from [127.0.0.1] ([152.136.45.109])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b359dc7805sm1149089b3a.40.2026.11.06.22.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 22:34:16 -0800 (PST)
From: Qing Zhang <diasyzhangqing@gmail.com>
To: iommu@lists.linux.dev
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>,
 Krystian Kaniewski <krystianmkaniewski@gmail.com>,
 Tal Zussman <tz2294@columbia.edu>, linux-kernel@vger.kernel.org,
 syzbot+fe84fc6a684e0beb86e2@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com
Subject: [PATCH] iommu: Fix dev_iommu leak on mock fwspec initialization
 failure
Date: Fri, 7 Nov 2026 22:00:00 +0800
Message-ID: <20261107140000.1-1-diasyzhangqing@gmail.com>
In-Reply-To: <6ae402bb.0c1d3ab6.e3d48.006d.GAE@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

If iommu_fwspec_init() fails to allocate the fwspec after allocating
dev->iommu, iommu_mock_device_add() returns without freeing dev->iommu.
The mock device was never registered, so the normal IOMMU cleanup path
does not run, and releasing the mock device leaves dev_iommu leaked.

Clean up in iommu_mock_device_add() while holding iommu_probe_device_lock.
Only free dev->iommu if this call allocated it, preserving any pre-existing
object. Check for NULL since initialization can fail before allocation.

Fixes: 2a918911ed3d ("iommufd: Register iommufd mock devices with fwspec")
Reported-by: syzbot+fe84fc6a684e0beb86e2@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=fe84fc6a684e0beb86e2
Suggested-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Qing Zhang <diasyzhang@tencent.com>
---
This was previously sent on Nov 3 through syzbot's forwarding to this
thread, after the direct submission to the list bounced. Resending.

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

 drivers/iommu/iommu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index b486b8bbd1fc..207241a553b9 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -379,10 +379,14 @@ EXPORT_SYMBOL_GPL(iommu_device_register_bus);

 int iommu_mock_device_add(struct device *dev, struct iommu_device *iommu)
 {
+	bool dev_iommu_present;
 	int rc;

 	mutex_lock(&iommu_probe_device_lock);
+	dev_iommu_present = dev->iommu;
 	rc = iommu_fwspec_init(dev, iommu->fwnode);
+	if (rc && !dev_iommu_present && dev->iommu)
+		dev_iommu_free(dev);
 	mutex_unlock(&iommu_probe_device_lock);

 	if (rc)
--
2.43.7
