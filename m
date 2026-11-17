Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794880485;
	b=NqV8NGuF8eK58EcnvZHtST/npg2xJQY7DljN+wMNtbDBANWVB4ZSb/in1c6PQPkapOdl
	 ptMT2M27sVTe5/8R5vrGUJ8/tTbV2mxdqWhrCGdGNC4ML10/7BZAyVxiI6k3CZN4nWHn6
	 pqDnTOYbPd0lsNASv8u27GhLxX8UU4bcXfE9tz7P1D6eAxCF2E/VGdBHUQ8CjzAgoSW3b
	 O8d1M/RbkET8aY14fshzvS2CAJEzN5/SfIFqZ6U+RPbLGSIl2UK8/ZmzkCWGWuw9TNu5D
	 NpUhF9PS/4LUGVyCl9/gY2NHp28p/CNxg4kKuYB/u8hCmzyz20VN5os5G8BlxH/fuOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794880485;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=elkgCBj7aFay/OU9BHM3KC6ZUvNspwV9FYqesvpWo0I=;
	b=kTU5ewkbBEGAGdNWnWbmOH/zjVZe6EwE0/mfLu9YljcpvFZ7ETUQwHbvOP0crup1+vxV
	 s4Bf7ifF/bwYYAq9tHTNI5AAtdZ86DWvyyw+/0dSK+cT76bYTYjURbMh7h46R6EJNaqqc
	 L1by/qpoZxU4Ep0K4k0+blKGGzN199uZgUsy1sohyCEiwhfr8M4lObTQkf1EQ4q+Qk021
	 PUB3DLYCZf+YqeiuIeQ0nkQluLymPodyPCz72z65gxAfKoVQx0ZDU5yYooRw94o2pcEJF
	 BiWnsPZKlA11LSFKoxVoCp+5d7YOSjk4uzE9zjTwHSVemC+QI/xCHByKw9SgQ/700tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hIBv2MBd;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A700F606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:54:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A700F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hIBv2MBd
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36e90071735so629122eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794880484; x=1795485284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=elkgCBj7aFay/OU9BHM3KC6ZUvNspwV9FYqesvpWo0I=;
        b=hIBv2MBd2fvE4Vyu417yPTLhgJkc40FmC1Wfo8/CALgriSL3fwBkrdtox5K//HFBrV
         CWJWLcx9M5xKuerupLWV7hYNFfmn32P9nwEvjTqM8lT4WO+rxTlf+rXw6EmRsACvbW49
         z1rfEL7tp3z/eTwcQWdUx+rvencAzjXAaJgt45glo8joyDhHc4EzGg6SWhYgLSgIdeFZ
         0VFRNQnCYl2AJ0q/eZgaN5/R4xMhbtO2ioaFhiUichv2RFJlJtSTpQlZuKK0dtG25+My
         mScA4X0JmVwDgaSu0fcjTblhJ27H9Bb78LIEVc7wMHYoYiRTKdaRyqFunaVnvkySEFmp
         36Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794880484; x=1795485284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=elkgCBj7aFay/OU9BHM3KC6ZUvNspwV9FYqesvpWo0I=;
        b=z6Zhym7Dw/7lyICtetjxZeauGw9ZZiK8r+Ewfris4lrpThIG8IW8sSxcl2Ml/jX57x
         ztICOvZ/tc7PA7jRAPGfdUhI3N0y1iDSWHcyt7FaRdy7OP+WZp6zafG7g00yxgl9GMGe
         FAFHeyx7PxZ3ymVUG9xO4E+8jI8DaACcWSbwoojWKDVAAsw2GmFhkQA0NpnHhyUkNqjM
         pFByETCXuuMeJ1dktAr4geqK7aZsDvc2D9MEzs2Bg530foh8h04Jjy+dMISrLPQvh2pc
         RobaoVz3ZDz56iXPKuGykAWlSE/A4wVLYjnDzWiCeiZC5j2aZC0EyWtT0zDuvfNDmgg3
         wX3g==
X-Forwarded-Encrypted: i=1; AL+hErHoHQw6OKxyA8yDwJea1zQ5Eyg2ZoYI75VgYdbjosdVwp5oIRJ0a4oaZAfuzsrUY0eB3xA2NN4rMtbNycM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+32NZSeBCPnpYcFad4m2D8SBCQrubM6N2kMGfvyxSFiIAEcOPY
	qHGShGd5EYuGojgwDvthu/Cu5SCkK0ay80FNE2/sda+uSg5mqcQjUOre
X-Gm-Gg: AZFdTZeXvazz3FLdIlZAoQedJbqiM2UIblumELmuQei88Bxw4gE3dxOEHJ+d+8R5KlK
	l2BbbwRI1OTbCMDv7hzrE2/X8MSqvkgUxLU1HarASDi6dCzC8Cp3xbE9cE4Yd4t2+0KA4dF60RH
	pCkiqZFuVrU9cMbH5WdYpbtho4mprNHRyvnPzDRXtaQU9CDJhZ+wFzTNYEoLps41jsFvV78kPAI
	zhRbXIbryx4ieCEUO94Bb8hjDdEdn4Z7yRGE6sJ+7h8vn3/wu0S/YH8ya+dsGCwvIdX3P8q8aXz
	Wm1evk6w7lVB6DFy2KY1h6nriRjTt7INraZA2unmfHarjfwhzEww2+mLZCyZG/IEwdl/cjlRIlP
	aA8O5trQuCoX0vWUxEh3hp3un4PAviW+UPa54tN8iiXcYLNW9uJLxk2/1awzTixW/y7lHD13PGC
	rK7AVe3qt6BNma8CUGhqTup4Vuj/RGZptrPif2rLsUcFLi8OVHubc1j/iDI6XHFIMue8/NT883O
	r32U1psYo/qmmv+2CN4wGr2jGGnG02fiIMCgZBbWm0Z/YPpTcAWNEEWLxZtPmV1dXv/1sRVZfZU
	cBeldnZxlZJuRKN3tknu1Yv43/tfxOPnFIBo17qsswC/u5sxu2LZi52gEOTPmmzVgdN5YMeJkY9
	mKaImNMUVQszbkpWOKlw=
X-Received: by 2002:a05:7300:c00e:20b0:35e:d21c:f33e with SMTP id 5a478bee46e88-379651ecb3emr20450412eec.1.1794880483783;
        Mon, 16 Nov 2026 17:54:43 -0800 (PST)
Received: from localhost.localdomain ([188.253.120.78])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332a77sm34139971eec.4.2026.11.16.17.54.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 17:54:43 -0800 (PST)
From: Qihang <q.h.hack.winter@gmail.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Cc: Qihang <q.h.hack.winter@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/2] iommu/io-pgfault: reject partial faults after the device is removed
Date: Tue, 17 Nov 2026 09:54:09 +0800
Message-ID: <20261117015409.25492-3-q.h.hack.winter@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261117015409.25492-1-q.h.hack.winter@gmail.com>
References: <20261117015409.25492-1-q.h.hack.winter@gmail.com>
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

A report that already holds a reference to the fault_param can still
reach report_partial_fault() after iopf_queue_remove_device() drained
the partial list.  The node it queues there leaks: the parameter is no
longer on queue->devices and its final put does not free partial
faults.

Reject late partial insertions under fault_param->lock: add
fault_param->removing, set it in iopf_queue_remove_device() before
the drain, and test it in report_partial_fault() under the same lock
that the insertion takes, so "check" and "link" cannot be separated.  A
partial is then either drained or rejected and freed by
report_partial_fault() itself, which returns -ENODEV; as for any
non-last request, no response is sent.  removing is never cleared,
since IOPF re-enable allocates a new fault_param.

This only protects partial-list admission; callers must still quiesce
reports for the remaining lifetimes.  It is not a general teardown
fix; the cover letter lists the paths it does not cover.

Fixes: a74c077b9021 ("iommu: Use refcount for fault data access")
Cc: stable@vger.kernel.org
Signed-off-by: Qihang <q.h.hack.winter@gmail.com>
---
This applies on top of "iommu/io-pgfault: unlink partial faults before
freeing them".

 drivers/iommu/io-pgfault.c | 12 ++++++++++--
 include/linux/iommu.h      |  3 +++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/io-pgfault.c b/drivers/iommu/io-pgfault.c
index 55a3c29..51d0d1a 100644
--- a/drivers/iommu/io-pgfault.c
+++ b/drivers/iommu/io-pgfault.c
@@ -64,6 +64,7 @@ static int report_partial_fault(struct iommu_fault_param *fault_param,
 				struct iommu_fault *fault)
 {
 	struct iopf_fault *iopf;
+	int ret = 0;
 
 	iopf = kzalloc_obj(*iopf);
 	if (!iopf)
@@ -72,10 +73,16 @@ static int report_partial_fault(struct iommu_fault_param *fault_param,
 	iopf->fault = *fault;
 
 	mutex_lock(&fault_param->lock);
-	list_add(&iopf->list, &fault_param->partial);
+	if (fault_param->removing)
+		ret = -ENODEV;
+	else
+		list_add(&iopf->list, &fault_param->partial);
 	mutex_unlock(&fault_param->lock);
 
-	return 0;
+	if (ret)
+		kfree(iopf);
+
+	return ret;
 }
 
 static struct iopf_group *iopf_group_alloc(struct iommu_fault_param *iopf_param,
@@ -479,6 +486,7 @@ void iopf_queue_remove_device(struct iopf_queue *queue, struct device *dev)
 		goto unlock;
 
 	mutex_lock(&fault_param->lock);
+	fault_param->removing = true;
 	list_for_each_entry_safe(partial_iopf, next, &fault_param->partial, list) {
 		list_del(&partial_iopf->list);
 		kfree(partial_iopf);
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index ef50437..5d56e66 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -846,6 +846,8 @@ struct iommu_device {
  * @partial: faults that are part of a Page Request Group for which the last
  *           request hasn't been submitted yet.
  * @faults: holds the pending faults which need response
+ * @removing: the device is being removed from the queue, no new partial
+ *            faults may be queued
  */
 struct iommu_fault_param {
 	struct mutex lock;
@@ -858,6 +860,7 @@ struct iommu_fault_param {
 
 	struct list_head partial;
 	struct list_head faults;
+	bool removing;
 };
 
 /**
