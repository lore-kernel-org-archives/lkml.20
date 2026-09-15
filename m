Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042803DB647
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789485258; cv=none; b=bpm5Fc1w0lJAZYnHOHweuuG2uCcbD7sAsUEGmCsNJyO7Lq5jt5yL6a5TCeZPBvKWZmZON2khSKHtHQsd2hixee/KfFWgtNggByf6C3vzKtDJmVyd+rpSnDQMS0kap1BrRUWWaDA42RQZQvpOlOSYEDEbEQryxdfjskaTbvZh7gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789485258; c=relaxed/simple;
	bh=O/u2LqMK9mEpIGTOo0wjp8qIenl9WJGvZxfnR8eeXjI=;
	h=From:To:CC:In-Reply-To:References:Subject:Message-ID:Date:
	 MIME-Version:Content-Type; b=ckFmwUchV9FnZV9dJhIgX3obvgVfEcFMZK9Rrg+WqzHZjrznYPfMis2yWNFfm/UVUQjQ7mKQf1CFs0pAWr9b1CO/HAmRnUfocVQF2b9yGHDIqUSKA3DoT/pkxEiHSGqa+wHKmVf7tlO6lfiM4RpbaPy4aHV46heOTA0iFl3HDW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=qRi7q+W5; arc=none smtp.client-ip=91.207.212.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="qRi7q+W5"
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFA5L14098599;
	Tue, 15 Sep 2026 16:13:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=5
	K6zZa3P7X8B+zOZxUpJN/bDoduNiVUvaoJP/bC4qKE=; b=qRi7q+W5bZ/SYcfYG
	tbxXD8nbU/Ho4RrZWENdu+q2NiXBYutVcBj30agm/pCR0cgYnFX9JLUeWy3lRNRy
	V0WB+Jw0yv2CZsq4EHZfzLPDUMmZI1O2WZRU8IyvXtpj6rpMzMqe5VXhu9+tHlEa
	+nhcfAYxkDFg+hK5GuI/UgjIRcYSPK2rLZjsqLCjk4lKdKQHviMlYEsyPm9IQKaG
	MdKr0cVdsvpy17jkY9iSzg5r8IQQWHBjpvoWXVpZ9OAqoq1pM8dnWXK+kQU4IW8C
	Whz3e7Q80UCLNLnrxiumZT9zdOgIN7MoUZFcS0Y/RrlVy0TnR3bqe8h7btUz8P5a
	qtamw==
Received: from hhmail02.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4gmw0q2e3n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 16:13:40 +0100 (BST)
Received: from NP-A-BELLE.kl.imgtec.org (172.25.6.60) by
 HHMAIL02.hh.imgtec.org (10.100.10.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 16:13:39 +0100
From: Alessio Belle <alessio.belle@imgtec.com>
To: Luigi Santivetti <luigi.santivetti@imgtec.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Alexandru Dadu <alexandru.dadu@imgtec.com>
CC: <imagination@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, Matt Coster <opensource@mtcoster.net>
In-Reply-To: <20260914-b4-cached-flag-on-meta-fw-v2-1-160b0e4e160f@imgtec.com>
References: <20260914-b4-cached-flag-on-meta-fw-v2-1-160b0e4e160f@imgtec.com>
Subject: Re: [PATCH v2] drm/imagination: Explicitly set CACHED flag on META
 FW
Message-ID: <178948521993.153878.5682027313344126894.b4-ty@b4>
Date: Tue, 15 Sep 2026 16:13:39 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIyMSBTYWx0ZWRfX7mJJfkGFy6db
 aFf/mCBW3nWVMIdCyCb+5N+qFgnFqNyCt+m40NETazlU9RZd/ztYcuLJyMTYux/kdcfjqu5phZj
 hc/gYrkHFWuuG6ZiXGCfbf6HHNa6NLC1wD8G8ECaKz2j3TtX68mHPZrt8pi95OsTjDCK2jbXfu0
 uxafwazNmaXKpuKLfE8EinTxF74X796r72NsqqlhXksUDgCPuWjS5l1ES0+RrnCNc4oeEZEtyUq
 tUSdMILUaivW+M4X9JnVPRhyufX/nlPJEkipV1vEDdIBEEgjKgU2ewuokpDQfljj++3yS0QPgXI
 jzM9nQoMQ0lP4vNgZqc/C087La94ie6aIn6b90LSohrjyv3rp7pvDkP7KdJdgQopyw0Rlm5e5Ij
 LfzXo2uD2Om2l7cgcQvyh7PXnry/OtyzCowYkBr2FiKhGxfnmjOp3YLBAHn2pjfHkh6DdKY6uo+
 fqE9P30C4eoShxVmbAA==
X-Authority-Analysis: v=2.4 cv=c8M+0h9l c=1 sm=1 tr=0 ts=6aa960a4 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=hVUt1O5AELcA:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=r_1tXGB3AAAA:8 a=VtXfOe-dlvuui4HyjV8A:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: 9KaTco0h3DWfBiDe_tGU3JITYgThrIK0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIyMSBTYWx0ZWRfX18CVGJrR8VeP
 N+vdWvB+CFYI5e0bPuQ/WbB9ht2iYInoigUslIgYQ1y0dpN5rklMyFi8fdS8hsLGYA2qCfbk1uY
 FSc9f8XExemTdfjJ+T3z6rcjabNolsM=
X-Proofpoint-GUID: 9KaTco0h3DWfBiDe_tGU3JITYgThrIK0

On Mon, 14 Sep 2026 15:21:37 +0300, Alexandru Dadu wrote:
> For completeness, OR in the CACHED flags when we're not ORing in the
> UNCACHED counterparts. One of these is probably zero, but (a) it isn't
> evident just by reading these lines, and (b) the compiler will make it
> disappear in that case.

Applied to drm-misc-next, thanks!

[1/1] drm/imagination: Explicitly set CACHED flag on META FW
      commit: bccc174bdf1af621301a9b3924572b44d67cd334

Best regards,
-- 
Alessio Belle <alessio.belle@imgtec.com>

