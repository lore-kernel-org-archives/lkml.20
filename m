Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794880476;
	b=gO+rSFmtkhCM+DuJH/pM8536/3xiIppLMWTVxxqNOhE7hNrfEPNU1JEJYSfTABOKw5cl
	 Nk4wVuwwVWADYSCdVQoInCz7CkbzxoXd33veoZe4tjd/SzwitCZj6t3QGrNSGYbmPSsCf
	 b6nzjjskDrYytaL/sLXNOtD0Wc9GkeHEX4Z8eem1oCSPYb78/EmceDotgOHiG+z2cC9ND
	 L+OKWyEbm8jBNOhI2oApRj9oBa5kAjNYByw2+xwxapRZ9ZkOv+JXFj41ds7AnjPqhoSuc
	 FwLWJKo4DdS7KDnDfhS6kN5CkeGCShk8NlHnBh8WlJVDTDD+yaGSHezkwHY8UhVOhBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794880476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FE3DBp52FZtyFrsv/66l4xMtsZMQ5Rhcv6bIeoPewWE=;
	b=G0EEAq6XZtk9JCSPLFCRv09s7dqmAjPh4w3MTx19SmBLRRwfHcDo/rGmEBJO1O3jR1pU
	 caaFtHqMuUSZ5F4RFaaqtBdZ6Mn+83NSRZUHDkQTMReZ9JKgo4ySpWb2UvoGe+CskYdmW
	 Z8fr0i7zO+fDtyi2TEDmJn1Q/EkLLHNRXeKhCZikp9jAT/2I4JsooJlE7T5wxnfMiOToK
	 wTREJ1xPxB0/7NIQB17NIEbIrmN/38kwywpFigClEq/slQ/wzMXmuosfFBA69m4Q085Iz
	 adIWxWDNEPA8BIr6XSthfRnnfL4K7RjzMdDHQ2ALYnYHpZ0MVdqh1DmYGILmXNleHzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IrmUa9eo;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFE2606A334
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EFE2606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IrmUa9eo
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33bb5afa736so406528eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794880475; x=1795485275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FE3DBp52FZtyFrsv/66l4xMtsZMQ5Rhcv6bIeoPewWE=;
        b=IrmUa9eoYFeis8Esr7n25k4HrHbH/LcZHw0yYRdA4sj2+6Sr4caNhM3N60DO9Idurf
         uaIQFZgDZ1nFpxlOtNV3svg8ufAjuBIK7Np/QULiysSmdJwilQ4I29EhJUxmSTbcKbbA
         FCYscG1G361lIP9MeS+QBhWN4J0twWh0CRrYVjCRAh1upb1dSQ4KEIWy2IL6ldo8LLdt
         u8sOeaVFih6h6glJ1J45c2rrGOuXVDsV/6VIUbLoGMjcs4bFVuw68IKqpeUBNhwLnEME
         NfuRu0zv+bznSdKP1MiTf+5Oyj+SAkZJQFcX4763W1M0JSftpMQz8t8NkVevvtCeWTYw
         yyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794880475; x=1795485275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FE3DBp52FZtyFrsv/66l4xMtsZMQ5Rhcv6bIeoPewWE=;
        b=KEQqhAWfGxqcMqW8CV1V+OGqgmbjbEeHC+48Jlwfi1AZybewUmsJWP+fXpFcvhX0Qa
         L8ttRFlELPR2toywbSCj9ShqlEuUpfVugRQ8f8hMsK+cVKHLFaIbv4n3jbwuLcOEBYQM
         Qz9gOZ9PqNLW4/UDXp4rukT0UrVMN946mXRiYtjV0Zhsy4i1l3PwPsY8xJOlPZ+MAWES
         L4oeiF6DvLriRdADJcFHlWHdcaeKHMd2VkrF3i0wAVq8SR9yjET938arwpWXOjyCF0Ve
         fpC9vpqax2klBez+Z1ZSob4NPOxbQDrpOVYDMCBhtWjT45StEKBG39s7OqK7HqT7Iz6k
         Gxuw==
X-Forwarded-Encrypted: i=1; AL+hErHBso9WNeUSGqIInplz0eCZgiS8CkMfTM673JUh7J5973N7wh2g3zojDZHzwXB/Xjlm/Z6mlTC6sHiol8I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LDPwqex+G8MrZdpLtMTeh6BT6zbm92LjETRUNLiOnhrvhEmbd
	PYgYry1lCsELTDe9eKua0elJfY02NZ8n2xkQeGda+NURNLvrS7/0z7kQ
X-Gm-Gg: AZFdTZdqaCRlVKTyhuKdS/9aVOWvMnl74MbCUPcZbljBt9CPXptZJ0AVN+fIr++dE6U
	VZngpjvra3Dz6ROSQ+hnP4ZAqPOQYpjxfr7hLdcYmxqmzp2A7EcaDwvWiFhCZlvNAyYHVHS4CgF
	JlAil7A5BDJqkmbey3Yv2drYCVn3xzDccMoqcirjN9ew5X8rwncbtz+hN+RXeEq9dlnL4ZyYGa4
	hg5qAnZM68iQqp7cl1xybYpzOiKnneq+ut0O1+tmc5QF633s02Bnf5oux/xUnu/yZgjfzTl+FZw
	NdBCjz8ODP6msDnaomWejBWf5AwTV/JNukLwcZR44UGv5CVgfzpoLSxskEKKCPYXmn/ysoVGB+w
	oAebyd4a9N0SyA1i2hDMeLEROah43nqSKEY03HgiA2Ce6sWlWGAgYGkAXD/ZwBactBp0QTBZzQ2
	e3hWCGbLRyJuNN6UPW+6AP89yxeeirGpa9b0ZMMHhwlRhjgnoWT+eN8XHTqJSuozUcY0YNH+DlE
	VZHEhVTkjZMPOs8oqhKQ2nt93EgyzyvE2SsPhJpiPy7eD5xwf07AcZgbXpGp6YLb2mXeGI1O9j5
	et5q3+pDGYUUI/tj4fHB/XcYcCLHFGuZCn7u0ZM/OuGG6q5ZOcHf5WWZ9xtUSf/TO4fJsPE0Rpc
	Hh1GXDS60TeGTN76Y0As=
X-Received: by 2002:a05:693c:881a:20b0:36e:66d8:1424 with SMTP id 5a478bee46e88-3796047ff23mr17786935eec.0.1794880474975;
        Mon, 16 Nov 2026 17:54:34 -0800 (PST)
Received: from localhost.localdomain ([188.253.120.78])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332a77sm34139971eec.4.2026.11.16.17.54.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 17:54:34 -0800 (PST)
From: Qihang <q.h.hack.winter@gmail.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Cc: Qihang <q.h.hack.winter@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/2] iommu/io-pgfault: unlink partial faults before freeing them
Date: Tue, 17 Nov 2026 09:54:08 +0800
Message-ID: <20261117015409.25492-2-q.h.hack.winter@gmail.com>
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

iopf_queue_remove_device() frees the pending partial faults without
unlinking them, so fault_param->partial keeps pointing into freed
memory.  A report that is still in flight can then list_add() through
those dangling pointers.  The unlink has been missing since
iopf_queue_remove_device() was first added, but the race only became
reachable with a74c077b9021, which made the fault parameter
refcounted and able to outlive the removal.

Unlink each entry before freeing it, matching
iopf_queue_discard_partial().

This fixes the dangling-list access only: a partial that arrives after
the drain now leaks, because the parameter is no longer on
queue->devices and its final put does not free partial faults.  The
next patch gives such a partial a defined fate.

Fixes: a74c077b9021 ("iommu: Use refcount for fault data access")
Cc: stable@vger.kernel.org
Signed-off-by: Qihang <q.h.hack.winter@gmail.com>
---
iopf_queue_discard_partial() cannot be called directly from here: it
takes queue->lock, which iopf_queue_remove_device() already holds.

 drivers/iommu/io-pgfault.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/io-pgfault.c b/drivers/iommu/io-pgfault.c
index c16ff1f..55a3c29 100644
--- a/drivers/iommu/io-pgfault.c
+++ b/drivers/iommu/io-pgfault.c
@@ -479,8 +479,10 @@ void iopf_queue_remove_device(struct iopf_queue *queue, struct device *dev)
 		goto unlock;
 
 	mutex_lock(&fault_param->lock);
-	list_for_each_entry_safe(partial_iopf, next, &fault_param->partial, list)
+	list_for_each_entry_safe(partial_iopf, next, &fault_param->partial, list) {
+		list_del(&partial_iopf->list);
 		kfree(partial_iopf);
+	}
 
 	list_for_each_entry_safe(group, temp, &fault_param->faults, pending_node) {
 		struct iopf_fault *iopf = &group->last_fault;
