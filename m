Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E034E4483A3
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.180.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790241191; cv=none; b=ct8DEy0Km7Acyr+sHHdQTiacRALpaquSsYPwu3y9yfFZ/fPQL2nXVYhfUZ4nARJ41V0rhQgw+6ccVgtUqg9FOe7hjL2OOfvYV8wHFPNjCBbCju8FTbFB7j5ITl+fad4nB6RF2M3d/kgzjlqS+gaZ21CIovCVDQTET9Lng/u7PqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790241191; c=relaxed/simple;
	bh=DsgX8sKYqOUQfD2GAl/9sJ/6QDlRCfoRrWzAnKZ+ssU=;
	h=From:To:CC:In-Reply-To:References:Subject:Message-ID:Date:
	 MIME-Version:Content-Type; b=d2szglNTGc2BEW/XTZvWeeBZ5d13CLhYE4RsMUeRInMJBiTiPmluYIC7GLiWOGG8fWKZcWvEqL6SLq8XCIRY8qMKV5XuRHSRyniJg+/ORM7IoTlSGNCHi7MFdn/LZE0LLVLHQQbfPgUezbPXmO8+nPkD0xwkxrkPq1RgG6p7ez4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=t8akxkkC; arc=none smtp.client-ip=185.132.180.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="t8akxkkC"
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5d9SA4069889;
	Thu, 24 Sep 2026 10:12:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=I
	vV9nIx63x7xryW05OdL9UQj/QwWnzjmTZP5R2FSNpk=; b=t8akxkkCdXwFxbnkh
	Gm7G4trFyK103dLz9g5EG1d2qhbWoec4xcpz7osJyKzW6yEC8Hl1F2V4ID/6Mu32
	oiUugZd8WKl2tCzlLXnKtIBLO+osHKYTsggBVmhfRPNQAoAX9DOaGDRYWdKH1CQS
	YzKvtE/SKqW7AxUShaO+mc6E0RahvPpOFkmg26PuvhpfFbKzNVdXwyfEBB0uqJ1F
	Rv8bg88Oz7Ldq+GzL1JzUX3RkP856QJ4XQwin8WvwYCiwB09p8qT3I1POfTqzOE3
	6CEyx6g41ObAv0eQD/T7NG2rkeQOwDTR9SDZyAcVfG0SHWHRB98wEG0BB06M9QDz
	4RKXg==
Received: from hhmail02.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4gsjftme2q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 10:12:47 +0100 (BST)
Received: from NP-A-BELLE.kl.imgtec.org (172.25.6.65) by
 HHMAIL02.hh.imgtec.org (10.100.10.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 10:12:47 +0100
From: Alessio Belle <alessio.belle@imgtec.com>
To: Luigi Santivetti <luigi.santivetti@imgtec.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Alexandru Dadu <alexandru.dadu@imgtec.com>
CC: <imagination@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
In-Reply-To: <20260915-b4-do-not-map-if-structs-unnecessarily-v1-0-a0e2ccee154a@imgtec.com>
References: <20260915-b4-do-not-map-if-structs-unnecessarily-v1-0-a0e2ccee154a@imgtec.com>
Subject: Re: [PATCH 0/2] drm/imagination: Firmware interface cleanup
Message-ID: <179024116716.119261.1458066617782762587.b4-ty@b4>
Date: Thu, 24 Sep 2026 10:12:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Authority-Analysis: v=2.4 cv=GPKdgeNK c=1 sm=1 tr=0 ts=6ab4e98f cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=vyGa0AGpGpsA:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=2WqR7jsGcocNzpsniPgA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzOCBTYWx0ZWRfX3BZd3CxBcLAb
 Uk/XC7VBiqqG5kh5RsqmX3wMiBWrUmKhghRUcFC0HpBSJzslVxNSy7L0wmfpCWd5E0tYWyIHxBW
 DSZe+KJzDvkcDjAMUHwxe8uAEZAsLUDg0+9JpCes/HNin/iYSzjbVj8KqmKJTIh/55lqq+Cv9Ut
 rHA59PnGCuolG0VP9Vz7HXVW1h5x9AHc4iUSzM9U0G182u/7DSEQGiMvPxvPk8iFmMD79EAyVH9
 3rGB9QMDs3Cc+Q2U8QM8o+2G2NuEiIuymmHQL8agaTu3yA7jP2KOuYZ2vhbWyakYUcUNmPrv1xm
 8qs46RqfYWhQteahzJFZwEAG3SBG8o3wg8eOc0W6ewqK7nHxuaC41gpZKrYBt7qS1d/kUXHkIHV
 oSVa8sS3ybMNf0udaoEbl6U6ufuZuIxhKaag7aeJSntjRa1Mv8Wx9xD5XS5Q0s57QsmGAs0+mzO
 onSmTYdi6EiVDneJKeg==
X-Proofpoint-ORIG-GUID: mGOAWd1n5ABkaW7k_bEpG3m8QV_3dxGq
X-Proofpoint-GUID: mGOAWd1n5ABkaW7k_bEpG3m8QV_3dxGq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzOCBTYWx0ZWRfX4Nop44qygU1c
 iCRCS5xTfBhIS96OcYIKI3ogXehnwHbwmkcRcHDOZTQJh6xg0h1PSa9bwpf1fCIWUqf5llx/cTS
 QRQxeokqmP91nQ3z4+nau8+SP/wOTsM=

On Tue, 15 Sep 2026 11:03:44 +0300, Alexandru Dadu wrote:
> Series contains cleanup commits targeted to FW interface.
>     - Firmware connection ctl moved in the same place as the other
>       firmware ctl structures.
>     - Remove unnecessary structure mapping.

Applied to drm-misc-next, thanks!

[1/2] drm/imagination: Treat FW connection ctl like other interface structures
      commit: f1db0120f15da7c6000b9f19aa9e15e6ba8afb2a
[2/2] drm/imagination: Don't map FW interface structures unnecessarily
      commit: c4c54ffd65555ac5316f8faf4d7dc8c815877937

Best regards,
-- 
Alessio Belle <alessio.belle@imgtec.com>

