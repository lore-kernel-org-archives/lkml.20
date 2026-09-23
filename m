Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C447941DEF4
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790185603; cv=none; b=uVeqeEynvHxSTVVhin+Q7az0+dWW3bC/78PaRxo1u4pei10OiHYjgjuDT4bYoCwRadzlWL1Dqz8i4v0NRtZlsBwU0HT9dVUJ9TYUrYE2vLRS22RFNoapphHL8FAtYlGuyOpJIz7+1dx45e/SHCb8Xyy/tqmTWXcr5ONYMk1WKSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790185603; c=relaxed/simple;
	bh=pKShmDVqStSX7rWs9+GfQqRrXJb3K11WmiirlUbxU4I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B3ghOmjoxreQ/qrB93s0yg5B5Vnlfha/icsvn29OkFpm4Ba05ReRqE+X37W8Q24NYcnGKCFngp3yBcgzi8swGj8gMQhYqaB+2lHKx6ET1ZAFkZmsvySmSafl+9zuTogpcJ2bbSYXwcQEZddTDH2M8yWj/NpOfzBSy9xjWk8V0vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kZr4HKbH; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZr4HKbH"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aab226e7c8so2217621a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790185600; x=1790790400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3t4X/MajhkMQ+hwNOwBD1gS+C+r4SW5/5xpUj3WzyoA=;
        b=kZr4HKbHVXMEftd3Vm2TJNqEiq9p5pITwZIAOP33pBdeKRwFrnweE+lQ1s8lrnN4dc
         imIyZZ9rhxigPzjPjwP7YFCn3dh472bzZLFbpeEL6MHqKQBb4w0fUK6CktyEoJZX/ZCe
         tDf5N1fJBmO9+JvtK9zMAWohbiPNbAu8mS+QijzsUCZJF/UHCl7Fd0Mx8l41Xde7faq9
         7DMDDFy0GJoaaaV4dUQ17IATGiro0z6vxMIfm991se6e3GSMWAI/CVTlghmOkMJcpjbO
         Ohmgl9BBxYhrz1evoewFxLVyHDZ1ZQP6XirwgI7MLXGmAv+kjiY+ZoSxl4o+pBUJNhQb
         8Z3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790185600; x=1790790400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3t4X/MajhkMQ+hwNOwBD1gS+C+r4SW5/5xpUj3WzyoA=;
        b=v3Rwk/H5xw0T0YaKV1yzHQPVn3Qs1EydydjTHmrmSS3LculiNmWVwrYU4Hh7mMMmjz
         s9Fu40lB6v3XmrhWK70I7jJ9NmezsAy7PNN/QxPf89xFDRn+/o56lDCrfHzQ4/WpuWjl
         27ACTkVBPD31ykqy+SpbL0PcG3AoDAi0mvSk0g3DRG319vzKRxbf/jmzT6kloTyl17ab
         Yav26S+WGgh3zbq2YTucBRP1BGAM9JWVRP+jPsuCDXDHrVMxbmPdRQ3WkDA5wDVnNYXa
         dy9aoy8uKv5JHMKm+Igx65khN8+0KA/s0xf/AP9hR5zSDG/nWrIgmV2NVxKelzi6gIBt
         H1YA==
X-Forwarded-Encrypted: i=1; AKwUvBzHqHUlICWXeBn+PHlQAfEZ163GOQtic3+JLFyUNN2DrFkKZJQdmQSUo+JATLyUQBOXnmWCZQCf8Nwpyus=@vger.kernel.org
X-Gm-Message-State: AFuF++kiRYgc5OOWb++2AJnq+wlvzpawcArFfuxnj6TM2gW6UVz2iI5C
	dwWrBtCrX4ZmC1ZnKnDJ4kx5PIDecyR+Vy9PosNXLWHFGBADK8tCPDw=
X-Gm-Gg: AYBFou0WJKQoJjS8zsPkXDnhmw5xLLdro4L1/05/pO6FqHJ0xrkcA8rqDe+6OzlX+ao
	acEk2HTdlvWRb4inGJY2L0HZ/GtO2Q/K9110zH8Jc4ewQS43hQ24aknE9AL8FkRy/4uWzVbLq7T
	OpK/5pqdLAE3MsmW/LJTcscRIYXsUFT53BD85aGgMxl2fbZI+osH8PcgHVPzc6SMMgtr7ba6Sv/
	ocry1ERJ/p95vdQCmINVJKJ4Ck8CzwtuVu4/7X2uRo4b4/u9IMbES5PQTavSg8eS4shi02D6keL
	tW6tzp+SsiYYa3YMRfjdQ3kELqhNjCAZ+70ME37/0YFeiNa1hmoXfoSpMuCxRybdbQOuo5LPPQ3
	AOUr/KeetNGJd/hjPlGa6C6sTF3j+ZV8h3Q6ygF04Vn3uFfk2z8siCf4NNJDhCZszYOfVz5yTlK
	EvTZN9mYodoMSey2IfCG8zQhIQ6g++4rExH/C8KPW4hZkcUMTGp4RDZUXJs69jy4cfh5jjvmcxE
	wk=
X-Received: by 2002:a17:907:1b20:b0:c29:5021:f6f8 with SMTP id a640c23a62f3a-c2aae329a1fmr257657966b.36.1790185599745;
        Wed, 23 Sep 2026 10:46:39 -0700 (PDT)
Received: from okuroshi-laptop ([154.47.21.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae6ecd17sm167185266b.63.2026.09.23.10.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 10:46:39 -0700 (PDT)
From: Artem Maksimov <okuroshioffc@gmail.com>
To: jorge.lopez2@hp.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Maksimov <okuroshioffc@gmail.com>
Subject: [PATCH] platform/x86: hp-bioscfg: Support allocations of larger data
Date: Wed, 23 Sep 2026 20:46:33 +0300
Message-ID: <20260923174633.12163-1-okuroshioffc@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Memory allocation for ordered_list_data and string_data
can fail if contiguous physical memory is fragmented or insufficient.
Switch from kzalloc_objs to kvzalloc_objs to fall back to
visually/virtually contiguous memory (vmalloc) when
physically contiguous allocation fails.

Signed-off-by: Artem Maksimov <okuroshioffc@gmail.com>
---
 .../x86/hp/hp-bioscfg/order-list-attributes.c         | 11 ++++++++---
 .../platform/x86/hp/hp-bioscfg/string-attributes.c    | 11 ++++++++---
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
index 5bf8d40bdf81..80ac15435a18 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
@@ -98,8 +98,13 @@ int hp_alloc_ordered_list_data(void)
 {
 	bioscfg_drv.ordered_list_instances_count =
 		hp_get_instance_count(HP_WMI_BIOS_ORDERED_LIST_GUID);
-	bioscfg_drv.ordered_list_data = kzalloc_objs(*bioscfg_drv.ordered_list_data,
-						     bioscfg_drv.ordered_list_instances_count);
+
+	if (!bioscfg_drv.ordered_list_instances_count)
+		return -EINVAL;
+	bioscfg_drv.ordered_list_data =
+			kvzalloc_objs(*bioscfg_drv.ordered_list_data,
+						bioscfg_drv.ordered_list_instances_count);
+
 	if (!bioscfg_drv.ordered_list_data) {
 		bioscfg_drv.ordered_list_instances_count = 0;
 		return -ENOMEM;
@@ -438,6 +443,6 @@ void hp_exit_ordered_list_attributes(void)
 	}
 	bioscfg_drv.ordered_list_instances_count = 0;
 
-	kfree(bioscfg_drv.ordered_list_data);
+	kvfree(bioscfg_drv.ordered_list_data);
 	bioscfg_drv.ordered_list_data = NULL;
 }
diff --git a/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
index f3dfba270f7e..095201004d87 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
@@ -101,8 +101,13 @@ static const struct attribute_group string_attr_group = {
 int hp_alloc_string_data(void)
 {
 	bioscfg_drv.string_instances_count = hp_get_instance_count(HP_WMI_BIOS_STRING_GUID);
-	bioscfg_drv.string_data = kzalloc_objs(*bioscfg_drv.string_data,
-					       bioscfg_drv.string_instances_count);
+
+	if (!bioscfg_drv.string_instances_count)
+		return -EINVAL;
+	bioscfg_drv.string_data =
+			kvzalloc_objs(*bioscfg_drv.string_data,
+					bioscfg_drv.string_instances_count);
+
 	if (!bioscfg_drv.string_data) {
 		bioscfg_drv.string_instances_count = 0;
 		return -ENOMEM;
@@ -390,6 +395,6 @@ void hp_exit_string_attributes(void)
 	}
 	bioscfg_drv.string_instances_count = 0;
 
-	kfree(bioscfg_drv.string_data);
+	kvfree(bioscfg_drv.string_data);
 	bioscfg_drv.string_data = NULL;
 }
-- 
2.53.0

