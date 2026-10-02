Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09AD2AEEB
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936000; cv=none; b=to2ZIJ7Z8GjuoY1mYcLsEL2Yr0Yxq95UQeDyzRiKQA7h7mNBzX+oKAyBl5oZfEwf8jKr0V9sQRhiTpYPQn83V8agorhWaJ/nJ5v6vnnI0P15vdsCzXxiZXa8s/Ivc4hf7RF/15MO7gUBCLyrcUIUkLi9+VUrksQz0fu0T5bxotY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936000; c=relaxed/simple;
	bh=Co+zi6gIccwdyP4d3DjRNKM61LWI1E/8iVbX657+J74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rEs6YmNl4bvIZ3zj+EUYamh2oaDOAR7y/o6j1WioutJcGphOP1dEguUkLLxch7LBaAGkvqPfZ9g99mCvsJd2m2f/8Ix5AUELsSJkPQtfM4fDwHEyxIStyMpSehl6NOAXON9BSPZsJr68lCjcuyoob/NY8PvlaXSOv1ndZMUKFns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oTXdNvXW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oTXdNvXW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28F6D1F000FF;
	Fri,  2 Oct 2026 10:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790935999;
	bh=zr/hLc+BZGvS83hj7dWx+krajHuT2tb3Hh+bPo+Zwk8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oTXdNvXWlr5ojNGgVL3XWLM1UlAAl+XToIhgGoBHnRyH7Gy7LqIeTW0GOnyQJmrXo
	 vSX/Oyo/6OCb+aVgqHJeX/DrQs6izUIVftOviLa8STtiYWOGQ394zJfYnXezfmrSeZ
	 Kcr/1HEJYK+LaN80RmLqG4o6ChZDgVgF8qvDDjAV3EKHeN5/MQ0zsRAv1vEmB8HfS6
	 D13vflyA4L4HuRlpJmu2PSOwH8XcYXtURaEJXvZoI70HuvsUFYas93bkJqLWh3IEwQ
	 bLqLXuThofeb7zEXvK8ozgSV8J6EgjjiiU8LfXgG5ZQLejTU7lW+36xjratAd1MVdR
	 as7Y9duQmnRzQ==
From: srini@kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH 2/2] misc: fastrpc: Use devm_of_reserved_mem_device_init()
Date: Fri,  2 Oct 2026 11:13:02 +0100
Message-ID: <20261002101302.1084243-3-srini@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002101302.1084243-1-srini@kernel.org>
References: <20261002101302.1084243-1-srini@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing of_reserved_mem_device_release() in fastrpc_rpmsg_remove().

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srini@kernel.org>
---
 drivers/misc/fastrpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index f40356c95051..0a3b6321ad0d 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2562,7 +2562,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		return -EINVAL;
 	}
 
-	if (of_reserved_mem_device_init_by_idx(rdev, rdev->of_node, 0))
+	if (devm_of_reserved_mem_device_init(rdev))
 		dev_dbg(rdev, "no reserved DMA memory for FASTRPC\n");
 
 	vmcount = of_property_read_variable_u32_array(rdev->of_node,
-- 
2.53.0

