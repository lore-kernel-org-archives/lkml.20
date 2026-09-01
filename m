Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9D343CEED
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277851; cv=none; b=Gv2xB52pBC2OTaBgWQdKXwRjcSh0bSbhQXoxzONDFAHM9LIDt8tbix0XM7vwb5ruxpmnMBhOsOS800nzS0kGIa0M3oiqvBVge2GLN5gN6IIpauaCizfWg1Pkx/QC4B0K8SHCNiNyHV3sGfY5ll82gYEjWG9QZi8H2FDftMpcEdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277851; c=relaxed/simple;
	bh=xUCke3sjfloFXK5xgzPFJXFZoorDrkSXZ+p50ZKJuys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qUWxYJ/ElGLOde5o0GTny50HAIWFwQQQATQDBLc9A/N9ykka2HLX6nDOGfEuGimoVZsZrMpDnqyyC3OTc2gy/f48ltMQQG0WfOBpT40vW5sZkI0iJTC65IU+XJd9Dgx341S+7s3Q2TiglZaz5oDmKJaxvb2AeETgO1BuNvjfuF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pJcg6OWs; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pJcg6OWs"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8549a96e93cso574277b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277849; x=1788882649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pg5APz92OrIInYvba8j1nyYuT4yBZOn6rThGWlzRCeM=;
        b=pJcg6OWsrbwEIw9H73QtQuAX+4Rf+kU5bBp15O2Ou9P/OejHZPuUxs+u4UvS+qNjr8
         FlCT7tuep0aatHlZCYw+9jQ9NHsgyEaoeKS/SoGyhnaf1dETtzNtdxfW2vGQPg7D/JF/
         Qah3K6QGmTLXHFowKC121W72gMP5phhvsK34ejv5JkFMlSJs1PW9ktxRAJ8l3isXEAqg
         kFzJ4u3/ijo2aMrtFuQdHpvY7KYbJbPBWG7QDRCDGiZ6FZl7IMmTiVDiGwZTrV8JvhTz
         NX0mQRGyp8kVin1b1QCqEEUqz8+cFy/Qrpivleaqw/PwaAOmm2ePBt0llQFmV/AzEAZ5
         ARTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277849; x=1788882649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pg5APz92OrIInYvba8j1nyYuT4yBZOn6rThGWlzRCeM=;
        b=XVxwD5ahLJOZ82GA6LeVqdUZIBCEqmKZXxAaxwiZh0SxrXoHcFuZajMPw7eoPVWZBg
         +kAlzpPk1E6lHx8x9AeTVyRz18MDtjqZ17rv+ajLiGOcwpp/Jj1U59dy7o0lD54LYA5I
         LkNJ+G0OBo/wKrdRnyh67v7vGcPIaJ66X4CJjtvss1R8OPhP6iiF/U1Bg9fHJH898L+/
         BPaGqkgLQSjmbvr7i4smn7tW8jjc824Ctyb3u+T5gHhTLCf9ljrLiZm5joe2/4xCzKIM
         OLE+0CzQkmsGr7s1P6PabO3uz3VAv+0oF4l0Z4tu+TeyXi10nPwlwWPeDvCrQM58pnIk
         0EBg==
X-Forwarded-Encrypted: i=1; AKwUvByiQeR2n2oKeL4qRBKUFSr0vPHuaO1Ri1/9G6eFXsgOEkcTqwSGAvMMzLHby8fq8IMGLXewLRyja5VlMRQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lVV6fsblvu6yWo1z4rbF0AdPlWF+xoz7gFBqZm9CI+1qe+oodK
	g7HdPJgZC1huE4FpllRmF1Jt02WmEKjOHlqbg7zqIFdCgWLPiQrFlq0t
X-Gm-Gg: AYBFou19pVS5r1BlADlqUEnDb9vI23ybbGjYUdDU2FA56hPlMlaysB8Nt6QBRCtSjvI
	uylxrNzEN+M4T7y5MEGhZda90+tTvps3lP/uguU7CEVRpudLdbCjFb5/jkovOkQeLn55NAxP5i/
	y9XHQQ0rqwlYAPJk/S+TKg/VJZZnmL0vNW+3Sf9buRDGu5ftxAexal3WYUSgb1TEt+vigdHcqDd
	LfS3uAXO7IhzdjFSy3d2utIBfNjA7BUlx6FLZlhU8RLN+iPe2foETULPxwrOnu7Za7wvTmvOKCp
	QNR1W/74qbLmjV2D+Hg1ot7O6IIlcYtod/qc1kmy7trS2/KluELUB1bE9OYCNZ8Qins0Q0idaYs
	yqrRTu3ZLrGQC/b1CIOfG/aPTogdziaUbACERv0vNm/Dv9eca+WjrVyUXEGqTHrblP+8njJIZe7
	IqqPOg1r8KwyJY03HsRyh2VOS7p3QyqLyn5udRlmSAzA0MXgK3QwIry4UB3CZY3mNGshVvLDpkt
	jUc1bJlaMin2lHIzYAp79KS9n5D/KHw9NnwpKWuYw==
X-Received: by 2002:a05:690c:10:b0:81e:8d96:a64 with SMTP id 00721157ae682-85d675383admr140102337b3.13.1788277848841;
        Tue, 01 Sep 2026 08:50:48 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e66abb13asm76661837b3.36.2026.09.01.08.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:50:44 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org
Cc: linmag7@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/24] alpha: select ARCH_HAS_UBSAN
Date: Tue,  1 Sep 2026 11:50:16 -0400
Message-ID: <61175f9015771b6a6d78624579ecc180f57d17e9.1788277742.git.mattst88@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1788277742.git.mattst88@gmail.com>
References: <cover.1788277742.git.mattst88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GCC's undefined behavior sanitizer has no architecture-specific runtime
requirements. Enable it for Alpha to allow UBSAN instrumentation of the
kernel.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index e53ef2d88463..1aa76a2d9750 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -5,6 +5,7 @@ config ALPHA
 	select ARCH_32BIT_USTAT_F_TINODE
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DMA_OPS if PCI
+	select ARCH_HAS_UBSAN
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_MIGHT_HAVE_PC_SERIO
 	select ARCH_MODULE_NEEDS_WEAK_PER_CPU if SMP
-- 
2.54.0

