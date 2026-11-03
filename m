Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793669686;
	b=PbrDIXSC6X7jsC1tDWM4wLTVNdrloyZyhOUF2+1fYOj+JA4jxsooNYOXCL9QNZIBAQop
	 KiQ7uZQXQTtVdvbQCCgJrwXD4Gq2btst53gk4j3PDVHY/63nqWsflA4ezVv2edV/2uWgO
	 tUpIi74lmbm6wMe5I5wkiMqUkM4KkSRb2lnqvpwF9WNUbEYS2jFesBQdnsk1E2KYLCjy7
	 6hdACiQxE3U8eUvMEnp6xaS5hlmM6I4Z5ItJfD8O6GpfYnCtJTDdpKXlgdJU3U1A7rUtD
	 7D1WQnNzo727+cTcnPizo8ZwehbHVs8IVNcLdKICxU7Qmo8IMJ7c7hefxvGRwHyk8EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793669686;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gVDlJuxO1aJ29OkzZ0LvZrlNFA/4PNrvnmKFmGqNW1Y=;
	b=2bjbgTqCMWmGSkzqA4Xe4Ejw4sQr6+SVy5TTQAEle2HDwz7S6HAKyvMDRNmZr/0rU4IH
	 xdY5j+kPbI1nB1L3mRku70pxe0c+zialVBJoc9PEIdqKMLAVbDmncniKy1jlAS0d5Eg8k
	 7+wMj+Q0+qF77rETSIrxrWb5JRpoMgT1V5FfxLzfw5GFAEl4Co1oFhUMWgQewi+DHRqyk
	 DpJAuArCNXtqAupscsEHGp+6TyCnuvjvvckaQ1OzN1wjlhVRYqB8A2gr9tvBV9v/cvXoa
	 u8ponYPlIDFQlXVjFffq1AHDBeKxouiLhiuIVHtVOiwMIf+xJw21Uu+LvGfjz5fBElQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Joc1Ic7l;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4747C606A324;
	Tue,  3 Nov 2026 01:34:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4747C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Joc1Ic7l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=Joc1Ic7l/b0pV1nB1uVV3Mux1NmYTD7WsI3korK0fF0ss8byrtsUz5i8IpljRJPNkMyw751m4ltRT
	 Q0kb8LRyq/hVXOVM01p2Sfv/d+Ix5E520VCsucV74tv/A0OnSeIx3+e0MFPCrRltJ2pViR9hAQeqYN
	 igCzJi4hWStKCDQY=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16ae93a32ed0-68e8b;
	Tue, 03 Nov 2026 09:34:43 +0800 (CST)
X-RM-TRANSID:2ee16ae93a32ed0-68e8b
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56ae93a31df2-e4dfc;
	Tue, 03 Nov 2026 09:34:42 +0800 (CST)
X-RM-TRANSID:2ee56ae93a31df2-e4dfc
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH] media: sti: hva: Remove bogus mutex_unlock() in hva_hw_get_ip_version()
Date: Tue,  3 Nov 2026 09:34:40 +0800
Message-ID: <20261103013440.1138-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
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

When runtime resume fails, hva_hw_get_ip_version() calls
mutex_unlock() on hva->protect_mutex before returning.  The only
caller of this function is hva_hw_probe(), which does not hold
protect_mutex at that point, so the error path unlocks a mutex that
was never locked.

The line appears to be copied from the encode path in
hva_hw_execute_cmds(), which does run under protect_mutex.  Remove
it so that a failed runtime resume returns without corrupting the
mutex state.

Fixes: 57b2c0628b60 ("[media] st-hva: multi-format video encoder V4L2 driver")
Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
---
 drivers/media/platform/st/sti/hva/hva-hw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/st/sti/hva/hva-hw.c b/drivers/media/platform/st/sti/hva/hva-hw.c
index fcb18fb52..bd33d8dab 100644
--- a/drivers/media/platform/st/sti/hva/hva-hw.c
+++ b/drivers/media/platform/st/sti/hva/hva-hw.c
@@ -271,7 +271,6 @@ static unsigned long int hva_hw_get_ip_version(struct hva_dev *hva)
 
 	if (pm_runtime_resume_and_get(dev) < 0) {
 		dev_err(dev, "%s     failed to get pm_runtime\n", HVA_PREFIX);
-		mutex_unlock(&hva->protect_mutex);
 		return -EFAULT;
 	}
 


