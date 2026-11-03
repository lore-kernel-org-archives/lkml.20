Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.194.254.142
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706109;
	b=YIi6Z8eyHvu4yoRlr6WsjSAtSMBpmvZNUtjGdUd5rsrZOk2jW8sgSxIGAWSipsZ4AyIi
	 aHZJLM/6zL/X5cHm3fBdhJCarD8iBUmSo+fMFV7MLB+jT4ROARge6DK/fXl999ZPiKWOE
	 6KYZvbwFalIW8RsaBDZP0C7S7+XLXwglFCnm+pqtwBR+4W+lX1vCpLizt/uLCCqTRd2DT
	 YWOqm4PlXgRoCf28n5JlBxp/p7yZb+2QqGx9uqIil8ee4IBnDXky8G9lASBYBTQu6ETj/
	 n7n2qI2fGeOg51GAqUBRDWJBgcVuZa4ScQiF2Wo4JkT2bFI52VUTRwCNu6HdOCNgQwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706109;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-QQ-SENDSIZE:
	 Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=jjfU3ITG+1Ysae0i08XoA5rOkoEAvvwcgiCSL+a+RQ4=;
	b=nmgVlxbd3p+ugZXgAEQWYE9HqChsnF0pXC8jB/z4V4i8oGx9cZ6CsQKe6CN0ieYm8EsL
	 fbX3XuBpCOp66cZJMfHoilErkCOcah4FR810ELzzj87J9dUqOKwy+/Wlr/Gwo34yeC4X2
	 Cq7Lhf7D4bSkWszzRo9UUcQKEmMa6arz2qkcABxKxheJ10lYTePQSHaTeHsED50qEm8S6
	 spPaHePT9vrCGpiLW+m1Bl33XMJXQnOq8JTPVnZEiramiZiDR3+ymVxz+SkikgSF87Uze
	 9jv/xXSEJcboc8kHLpzLCAK5knd9V/aCcOQzw8g/Wsbed61tCuVT384SxvbQL/YTDOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=smail.nju.edu.cn;
	spf=pass smtp.mailfrom=smail.nju.edu.cn;
	dkim=pass header.d=smail.nju.edu.cn header.i=@smail.nju.edu.cn header.a=rsa-sha256 header.s=iohv2404 header.b=PYuWLUIz;
	arc=none smtp.remote-ip=18.194.254.142
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52A4606D838
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:41:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B52A4606D838
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=smail.nju.edu.cn header.i=@smail.nju.edu.cn header.a=rsa-sha256 header.s=iohv2404 header.b=PYuWLUIz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smail.nju.edu.cn;
	s=iohv2404; t=1793706060;
	bh=jjfU3ITG+1Ysae0i08XoA5rOkoEAvvwcgiCSL+a+RQ4=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=PYuWLUIzxMiDAAvt1AgZQ0doYcrQQUxYsIfVWO1vzQH1m+2BbtHIBL7SITaRF2zlJ
	 th/TcXHGXrmNfz5PPX0H22mzHdVILJa6ihb7DaNxCeHS3fktio0AksSsZet17Sdgxk
	 gUBfqarxO7+bPq6PGHLr/TClDgi2DpiH91IoKqmU=
X-QQ-mid: zesmtpip3t1793706055tf286fde0
X-QQ-Originating-IP: qDU+okGXTubXWh454M3F6joKk3mhoSRF6jYFHwiqPck=
Received: from workstation-Precision-7920-Towe ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 03 Nov 2026 19:40:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 15823312286614678572
From: Kang Chen <k.chen@smail.nju.edu.cn>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/radeon: reject invalid ATRM results
Date: Tue,  3 Nov 2026 19:40:53 +0800
Message-Id: <20261103114053.73761-1-k.chen@smail.nju.edu.cn>
X-Mailer: git-send-email 2.34.1
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
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:smail.nju.edu.cn:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: Nu98wWQiOS3A6jKSlsZhyW5ctN2VIsKQPBgt4YGFkm1Txtf4cn2hXZCO
	sZPKvbcuo/JbiH++rrHjayaCvCriY3QXZls+w7E+K+sxS5bVtfuJ1y6sQnAiFs0fbNGH4/8
	CeKjp/JfdcDff6d/hVpYLzcU1c5ROxfJEn+lq0gZgSuJn9U5wgOVchLJjk0cfls0wbUZ0Do
	6gYFW5P2ZrUvD5cjgCK7Mw96wOFL/4+hobCooQaW6YXWeuGDSt384mOJbWyTGe7WUstQ0ma
	N6lrWwVETIUEZAMjcSLExd6pRd621cRlNpbJ1k1vTqvH4x5Q6ZWAlsnH1uxmHgzJYj0LhRf
	UCUcIWMA6mo6ZJltc2RDs7dyW1cweEMd3VErEgv+BioLNhedkqO7XuJBGfQSNsHsThNlNur
	BOwODYr84GTYCzuj9z0Qb37rwF/dDr74OTq0RzWS4BO0RhiblBbBn8Bautv+aD7RYabm+KF
	llcomKALw2ThnrTw/745j6SDsJB8fHHhanalUl7XuwXouQ82d2QY63cyhJtDqnrDyLwPU6r
	tC5PyBBTwEKpk4n2ucomNu1gztrqW+IgBTL+oAI65pj6BUzB27AkADwdhgH5yWySr5olykj
	VPNTfYLH7hDhITWHKo2b50KuGpQCOsPx21/zxt2NSjOJRwocLbDfOgIZMpdgdVlAUyPPWYr
	eEtpW91fdnWJVcwOpCH0Z/OCIuOTy1hk3G9izT0WBCIAulsi4YejzSAmFniKuNHbFUNNsyY
	k60bTYqa5A9D6NdCxKlm/NLZeI5kNzMrW7JvjIddlNGUfLsI02PhjiBTVQXLknaBEcKMlUj
	SuXoCOAzS5Rx3jYFeYQmBodB+DxjnVSVLefttSiYQj0UfvOFrnj5HCEiuN4yNVh3sFHhYPu
	BJjrbNfdC/Fvrytq5l+8qYApSIrY/KUROizDOxnODvToOYmgnxa0WgsCQUVmXF3Ol/ZextD
	kVoLw68YOtnLFoVuZhs13WYy6WHKKbqpWj8FHYLZ1/ll7Oa8lwVVDE+q+90JPrWOKr9P3tI
	Ja3VoggyDr/ptIiojc8R1QKSd8Z2QfRCS7z4wISw==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

radeon_atrm_call() trusts the buffer returned by the ATRM method: it
copies obj->buffer.length bytes into the VBIOS image without checking
the object type or that the length fits in the requested chunk.  A
firmware-provided ATRM method returning a non-buffer object or a buffer
larger than the requested 4 KiB chunk can write beyond the 256 KiB
VBIOS allocation.

Reject the response unless it is an ACPI buffer no larger than the
requested chunk.  The only caller always requests ATRM_BIOS_PAGE-sized
chunks inside the VBIOS allocation, so checking the returned length
against len is sufficient.

Fixes: c61e2775873f ("drm/radeon: split ATRM support out from the ATPX handler (v3)")
Signed-off-by: Kang Chen <k.chen@smail.nju.edu.cn>
---
 drivers/gpu/drm/radeon/radeon_bios.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_bios.c b/drivers/gpu/drm/radeon/radeon_bios.c
index 1da6bf1c17ff..c23892470265 100644
--- a/drivers/gpu/drm/radeon/radeon_bios.c
+++ b/drivers/gpu/drm/radeon/radeon_bios.c
@@ -183,7 +183,12 @@ static int radeon_atrm_call(acpi_handle atrm_handle, uint8_t *bios,
 	}
 
 	obj = (union acpi_object *)buffer.pointer;
-	memcpy(bios+offset, obj->buffer.pointer, obj->buffer.length);
+	if (!obj || obj->type != ACPI_TYPE_BUFFER || obj->buffer.length > len) {
+		kfree(buffer.pointer);
+		return -ENODEV;
+	}
+
+	memcpy(bios + offset, obj->buffer.pointer, obj->buffer.length);
 	len = obj->buffer.length;
 	kfree(buffer.pointer);
 	return len;
-- 
2.34.1

