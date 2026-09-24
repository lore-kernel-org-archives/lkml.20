Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2139A3EFFA6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790242790; cv=none; b=I15758N5qJUja+NHiyCDo/SoC/si5wBwn3c/BNDnPkrN+1HYZmxHUW4XPshHOjCBZENzncGswKu3srLPyxhbkxalhTHZD8A0+XoRkf9iawpKiY+AfRR6m4vFfwHpdkzwUqBCmwDDIvuSjuhAt4LzSpal2e/FBhFIJPHqERxA94M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790242790; c=relaxed/simple;
	bh=hnBdYELiD8PFKIc5On2U7Pu8QFwZThZf5vuQKWxljH4=;
	h=From:To:CC:In-Reply-To:References:Subject:Message-ID:Date:
	 MIME-Version:Content-Type; b=mLWnx43qVNhSdM/suSi5yVnAdMLfBNoaZRzvTOukdvl6PZmjPMrYcAwICP48sgoAZxxmylaFaODU4/SHFJaDbOdCpeThsdfBma69aoJkb3a7dF7MwX1RCMfHVztyczSNbXRi0RzDL+URI+KRkDHkAENB6VpAT1sDpSdrNFtn3Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=wK1CbaEm; arc=none smtp.client-ip=91.207.212.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="wK1CbaEm"
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5e27e1074552;
	Thu, 24 Sep 2026 10:39:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=D
	vi8Bk0c0gZ4b3Rdnv5Maoxs7wf6Qi2ycroHnKrTZVg=; b=wK1CbaEmSalL1wgg4
	eNwoechyXEHgDzTdvv1l7SAqomjzW7Gz1OQI9llJ7/KcD9R9o27+LyX4x4c2BLMP
	iM+8Cxbu2jtDbR3pQD8mjvBe3bWiX2X9qDyyHRobeZs2UkJE9vY8Sg6VGZN5nDy7
	e2ffho+flMzNJl7fK6s40oY712qWgPpce/tpcG10fOlzg7gZlqIvNiaHtMR724U3
	dCRcAoOQcIQR/Cky8yM784v/21/WTmZ90/qUC+EseWJnYgGw2Iu97j/8AK7BQHS3
	Xkp+XkU3UHP3DvqqggtPXNdfP4387z5ttCOM5pghflefaQ37fR8URpd2r26/zLG6
	/4KpQ==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4gsgnq3yuc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 10:39:11 +0100 (BST)
Received: from [127.0.1.1] (172.25.128.122) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 24 Sep
 2026 10:39:07 +0100
From: Brajesh Gupta <brajesh.gupta@imgtec.com>
To: <alessio.belle@imgtec.com>, Pengpeng Hou <hppiscas@163.com>
CC: <luigi.santivetti@imgtec.com>, <maarten.lankhorst@linux.intel.com>,
        <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
        <simona@ffwll.ch>, <imagination@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <frank.binns@imgtec.com>, <sarah.walker@imgtec.com>,
        <donald.robson@imgtec.com>, <boris.brezillon@collabora.com>,
        Matt Coster
	<opensource@mtcoster.net>
In-Reply-To: <20260920034329.16614-1-hppiscas@163.com>
References: <20260920034329.16614-1-hppiscas@163.com>
Subject: Re: [PATCH v2] drm/imagination: clamp freelist reconstruction
 requests
Message-ID: <179024274745.675834.3394325502267389542.b4-ty@b4>
Date: Thu, 24 Sep 2026 15:09:07 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0MCBTYWx0ZWRfX9/jqAlKkCOti
 Wsfhxe3j2t1dgbIom+c3JkyoerZWMWFMujMA0OTtwD0txy43numujvugC+U0JYAZBwi1YYZhCYz
 jAGFHkZvsd93DzROgiV2rwqu4CI0cv1LdPzoIIusOI17Oj8c0G81f0d+Ln8Q/WYt4YYRVo2Ubp2
 lEpkYsCzyWgzz7XLRS+nXM3LXXEr3rHxtOvS/TC+i767xb/wMtgLT9n3ctheG1iEz+qez4q9k3s
 DdT7gak1QZ0U6c19DE1Jok74Vyd4E7RHeuCJtPbzmpUTYYOsAq48e1O5YzDnA7XM8z29yoxrVPU
 6JPnlC38m4bXCy1aqUxuOOUZlaSVQSb4Nvpqwiy/zv1iTSPKWueWGtSl9+NAYRxgKpa2LVpytPn
 ESzSk1xsbxtk7lp5XTXSaQgtszLaXCLFTWKC4PPByVJUzObZVWlJQksontzEVKFkTcVvSslyq+f
 kN5Zl2oAN9iJkjRJ/5g==
X-Proofpoint-ORIG-GUID: DEXg7CalG06H8d678iYhiwteMRWeSWL4
X-Authority-Analysis: v=2.4 cv=fYs4WEQF c=1 sm=1 tr=0 ts=6ab4efbf cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=Ofw6MtmsdEsA:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=r_1tXGB3AAAA:8 a=hqhwyix-PhX1pF1cW_YA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: DEXg7CalG06H8d678iYhiwteMRWeSWL4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0MCBTYWx0ZWRfX9j4GlUgsr+re
 E819p7xDd1BlEuNcFEGzBFa5b7Ml/NFa4/IX64n3SH8AP4fetxV1Qn2AB2lfMKGI/efWA7lGs1I
 rAk9hxAOS2/ofVyM3CCwHTCG4BBxvlI=

On Sun, 20 Sep 2026 11:43:29 +0800, Pengpeng Hou wrote:
> The firmware reconstruction count controls accesses to the request's
> fixed freelist ID array and the copy into the fixed response array.
> Neither access currently bounds the count to those protocol arrays.
> 
> Clamp the count to the request capacity, which is shared by the response
> layout, and use that count consistently for reconstruction and response
> publication. Keep the firmware recovery exchange instead of dropping an
> oversized request without a response, as discussed with the firmware
> maintainer.
> 
> [...]

Applied to drm-misc-fixes, thanks!

[1/1] drm/imagination: clamp freelist reconstruction requests
      commit: 45585c3aa285854face65293acc95eff73063d6d

Best regards,
-- 
Brajesh Gupta <brajesh.gupta@imgtec.com>


