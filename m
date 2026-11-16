Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822777;
	b=oU4kTuWnk6z6Km60Vy7pUMpN146EWQb4lODdPHDXc5R6VSfUeqa5ZU0LK0pph9FnHbxC
	 0sCu0Ut3zxT7FsFJtUxqysJ/bhJOk/LXQMKpfCVSy84ta4poPsLO8Y3sveYQc1OItQsby
	 xxnoiYSOrL/YeiQKlAj6OIKxCppsEBHtBiqZNMlNnvk/hc0khbowVI7FvburCBPHloH+x
	 3bk/IUuX6CxmonSuFeqzs5wuS9p5p6Xa2KVKOsBtp/4E+GGK/gxeY/4KkFjk7LSK+9ji4
	 ekjFc6Gqlhkd/gjKKndw5b/auAedVKm7qYMQknVtO/8r2ytfnZ40I+bH3I3PXaoIIuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822777;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mV9swtsoL3o2EMx3J+Py97A7P4OjFHHdOEE2zPHNifo=;
	b=OPoQk1MLt9vLOHfO+A6AfsQoEHm4tQf+5HCLDjGy3vIZhj3lLv0xyI9T2yLy2RirDrJB
	 wLFY2Ww+4S/EB+0ivVkUBeKHaa8QWFbqO/mjuQqMhqir1eU3njjU2Dxbr0k3og0jCoX8z
	 DOefh0Pc38bXSoEsTtGlDjwtIe47UR16EGPpztqAU/aiB7PR2XbBSNm+jmSFPXYFYTG/Z
	 i45IoOIkycADtsqSSlxR9r79cjzWx2syT0vfN/QNt/7vQln19ttsAAGagZaZnWGa9nodQ
	 sjF388IlXHCuqz2VGj7GgQtBZZLYOlt+OzSSD5OVChfIQfeapl7p+5UJVgF62pDDkWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=NX0AFeRu;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38DFC606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38DFC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=NX0AFeRu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=NX0AFeRuBGf8xNILELAWCIgB8/+mUnQIrjXoiDyA5jHR8jfUeT+jIRVtoZ7wjs7NkMFaJsT2GpEDE
	 9DdHzmM/YGtTBkWdoZiMSyABSi2lSBzTsDBP+/DQ+T063Xv0fNjOA8Py2GXshQACA7ohSFOl+EOItH
	 oFeIajgECZNS7K6w=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26afad27357c-3b7db;
	Mon, 16 Nov 2026 17:52:51 +0800 (CST)
X-RM-TRANSID:2ee26afad27357c-3b7db
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16afad270b12-87bf5;
	Mon, 16 Nov 2026 17:52:51 +0800 (CST)
X-RM-TRANSID:2ee16afad270b12-87bf5
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/imx/dcss: Fix clock leak on blkctl init failure
Date: Mon, 16 Nov 2026 17:52:49 +0800
Message-ID: <20261116095249.1519-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20261030111304.2205-1-laixiangwu@cmss.chinamobile.com>
References: <20261030111304.2205-1-laixiangwu@cmss.chinamobile.com>
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

Hi Laurentiu,

gentle ping on this patch:

  drm/imx/dcss: Fix clock leak on blkctl init failure
  https://lore.kernel.org/all/20261030111304.2205-1-laixiangwu@cmss.chinamobile.com/

dcss_submodules_init() enables the five DCSS clocks before
initializing the submodules, but if the first submodule (blkctl)
fails to initialize it returns directly, leaving all clocks prepared
and enabled.  v2 jumps to err_clocks like the other error paths and
renames the labels to the err_<x> style you suggested; it carries
your Reviewed-by from Oct 30.

It does not seem to have landed in drm-misc yet - is there anything
else needed from my side to get it queued for the v7.5 merge window?

Best regards,
Xiangwu Lai


