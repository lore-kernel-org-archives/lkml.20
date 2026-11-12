Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490875;
	b=q8eegbEsJkmmkK1s9T7IFIWBAUJk1fwaK81kSoC9dfemnOZ6sfV5iIXUP9C5eCu/YW9Z
	 4Mmm8jqtS1FNCm+t4P7j/iqTm5uzNuOv0YjaVAFRJN/v6YRDyeoxmsMuxnwq2U4wqHsyJ
	 lYBqQ5K6U+vFpti68Y8lJtjCYqwFUCQNkx8y8PZGYQXst8y0HMHzJkqhX9EwsNVMHwScT
	 ckb/Kc9EzdDSeUwqYQlmKKVatIQF+cDU1YfYHkvOgjUjHTBbovaq+DGyQi4N8QjKHklhS
	 vSkgTwjT4MvtBbb2w4dpgBLhlGDZQCWOmzARDjQDjre7RD1jdc0moCsiUTuOe1ZvEjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490875;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=Cj/sN5gWLFL8+X6KNAdHeNr0leCmTaxFBgtc+cpBvcY=;
	b=ph9YwpIcD6iGdNmOURxMhz2s0mjQpMKFY9E+c0ox6DIAIu0tqY35q1F8yS10D7OKSAr9
	 CjCmrLyRbtLquuamvMR3qV+FMfReVSFeTycUq9y3SGPmuu+jfuVreiiy2D+k2SY/hs4/t
	 G0YJ0hfw+AIUCHBIxTJL4OwUaN0hNzRsrDwTwDAh9vCgeeLEEI9lDjvd7P/gwcHD4Z4bl
	 JEEx3wDabIY1xa6Mk8DlurI08dWTO6nDkYtxwnyadbMZRVpwRBOkVBQNEKoVBJumcdmAP
	 b3MxB3Mk8X4pFM2Vkns2O/mwi2i8qGsNKRWljHyVWz9vk5vxZiKOlttWvT/2nLQPNGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=mzwr5Gz5;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FC8606A333
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:41:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3FC8606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=mzwr5Gz5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Cj
	/sN5gWLFL8+X6KNAdHeNr0leCmTaxFBgtc+cpBvcY=; b=mzwr5Gz5+JBSmLX3b1
	kN4FToqqRmTA35yNd1GsjRnqH/yn+yrJiCOukawsS3gWQRcytZlQsL2zXyodlsWG
	O6sPc3nmYvCwSkOloxkBBpxuZkzLRSf6x5L2S4/E//YD4pkonTn0TREEQr3ZFudi
	2DT54hCZk+lGN5w1GrVpQrA2U=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgBHhIzjwfVq2wIkFg--.38929S2;
	Thu, 12 Nov 2026 21:40:53 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	ntfs@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v1] MAINTAINERS: add Baolin Liu as an NTFS reviewer
Date: Thu, 12 Nov 2026 21:40:40 +0800
Message-ID: <20261112134041.4133634-1-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
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
X-CM-TRANSID:PygvCgBHhIzjwfVq2wIkFg--.38929S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKr15AFyDAF13Cw15urWxWFg_yoW3Grc_Wa
	1fAw4I9Fn8Jr13A395Cr9F9F4Yvw4IgryYyas8K393A390y3Z8t390yFsYkw1kuFykKFZ8
	Za13XFs5JF4xWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbgdb7UUUUU==
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6gXBjGr1weXnbAAA3S

From: Baolin Liu <liubaolin@kylinos.cn>

Following Namjae's invitation, add myself as an NTFS reviewer to help
with patch review.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 05aa377ca912..ad9e52282569 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20036,6 +20036,8 @@ F:	drivers/ntb/hw/intel/
 NTFS FILESYSTEM
 M:	Namjae Jeon <linkinjeon@kernel.org>
 M:	Hyunchul Lee <hyc.lee@gmail.com>
+R:	Baolin Liu <liubaolin12138@163.com>
+R:	Baolin Liu <liubaolin@kylinos.cn>
 L:	ntfs@lists.linux.dev
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git
-- 
2.51.0

