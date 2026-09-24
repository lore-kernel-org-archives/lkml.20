Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29B4415B8E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790238821; cv=none; b=ZausnMf/h/FhSjB0ePRLxnrI79ExdtN83I0AuPE1WlBSanSnyTPidxsYclN3YCl+TyI2qtmfbwaFwscAFRSTzduxjxBMvTY8AfPdEk3LPux1us6UkCAf7g/ZuywSNdW59a+SU9XSy0BDCA5tCZ3uj185K+WE3p9NGJ0e8UuAVOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790238821; c=relaxed/simple;
	bh=WBX3aGhtFyipRdYPJD5smARBTFyQZ6xFL1EZ6dKpOJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TjrMALe5dCPTLpvzzv59RjkE6heleHhvw2v5gEe1Yj8iKQD69i+w1xm80JFT1ImO3pABZ+ZckaC42Tvv4HWVINwK6ZLJQTF6dz0LsbX2/E/8T7MCEMoyKKJczcpefqkktHW8/aj8Z4d1Zu+PN41M1VTFU3UFGttR7ygBwnD0JCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C61CjgpR; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C61CjgpR"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff2f2c4dso2713275ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 01:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790238820; x=1790843620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ob3e92w6cY3QcE+pXNGDPAL2QL78Cpj7aplaysdp/W4=;
        b=C61CjgpRj1fxc03hbUUrjN/ciREaxsOiyEiWQDFqWdxi515dvcZPykUzJHEz9d9QO5
         2qAmWa5JIEp0pzdUYBttuaCe5w4SAY4EnOv1tjfCH2DKbOnMSgYI+ZjB8n/ee38tU7lk
         cQlY4SMTigEhicB2lSUM9Td9Ku0knTLJtkBIk11QLO9ziJBTvTKdLmMWUqrBLygYcNdz
         36zMko5BtxOcV/FL2zyjBVUiraejrb0XkUdevfS8Sk9qYeOn0Rto6wwOmVmr9Hu66fvQ
         9EgPkMVO60a861eLH1MwIkQuYafUi7+EJ+dyrvL3VCze451PIOG+1vysDa2o+iNUfMTc
         Dz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790238820; x=1790843620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ob3e92w6cY3QcE+pXNGDPAL2QL78Cpj7aplaysdp/W4=;
        b=adibfw+kLgC/CRaUybRWeMI9iEcaV9TqMdAKVSXJyTkTiQTXmChdEYlJckm5JyXEgm
         ri2gttmd9A4NWXsN8fHeEJEWJzH4+Yw742qMXZ+QaMhQFudHzUOy52G85pS9fXjRAZbH
         s8OGvE0xWF5CsweyHDHVmkIAlJyCq2ovIQ+r20TddG79y1OzA7KOhXgwIaU1lwWNrfao
         iZGkAhIvaJEPRggV9hVlqYyOPjtmb0FvQS2cUpxJq7y3t62GfNsz9gumg2AANn0/fONF
         EJiphf3cgZXTFZ0I7/Y7hGkAP3qraR80Zz+EQ1PdpN4zijxTir5pCGy8fAVbCekeKzvt
         bR9Q==
X-Forwarded-Encrypted: i=1; AKwUvByYROQlyhhC6Y7Mg4ylPgyxp/Ml1uro9sAcjf/HkmOAF6v0NtoN80VNQvLg4UB1+oK0+52T7b08x0wh/P0=@vger.kernel.org
X-Gm-Message-State: AFuF++kfgmDWza/zu2g4JV/cD7A427Z3WJPpla0LXj6c6pcVLXt/wjNE
	P+YEpuBWdPwsgfPSQstZ6G85C5CST3H0mgV02rGa70yzdk4VRZuw4OvJ
X-Gm-Gg: AYBFou3hfhk1LS2YvU/2ARs5qtj59aHNqXHnDXfmWcuNGW5RBo+ldfxiMWUsWHAeX4L
	GDewDgsIesOEJmy/FI1t5vQ5Q+A0LlnVEiVWjmEiyUwvUF/drzghZ5a7yeVg3OlheB2gxdfaSJF
	A8Weup+y+JS3RLIu5SNhqiq9u2zkkLj3FcAg6Ivs1vd+13U4l+8dPtPf7kn7dyiXfwkMO64qAA+
	JlU0VTKVCvDDVaf+I7dmDzZ2cK0Bb0lpykYivYM/Ti8cr3KgQ1Sv+010yrUtWQeWBqxkKHD9uiq
	4S4/d9fBebsmgb3rq1mMdKOrR5BguaskRauoUY3MBUkhvSCG41UpqzZ3sjaeBTp/iTEjatlDhaM
	OwVvpYtFXftswIuunNKbzi1UDgHvqYv8QCkgiwSif8hzOZ9msRd5hnNToASVKyBdnvkUCtkbPc+
	v59+ZPx75A6tM75l0Y8WdnhfT42QqDt56WzyVNjZd+rOoTBwvuhScMqb+6HpW5knXLUrP4qMwUI
	uLUtvNH+qRwqw==
X-Received: by 2002:a17:902:fc48:b0:2cb:2b50:d9da with SMTP id d9443c01a7336-2df7dc4be1fmr23757885ad.3.1790238819897;
        Thu, 24 Sep 2026 01:33:39 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a516d8asm22659015ad.9.2026.09.24.01.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 01:33:39 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] firmware: qcom: scm: Allow QSEECOM on Acer Swift SFA14-11
Date: Thu, 24 Sep 2026 16:33:03 +0800
Message-ID: <20260924083321.33129-4-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924083321.33129-1-liujianfeng1994@gmail.com>
References: <20260924083321.33129-1-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Hamoa-based Acer Swift SFA14-11 provides the same UEFI variable
access through uefisecapp as other Hamoa devices, add it to the
allowlist.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

Changes in v2:
- Add power-supply for the backlight (vreg_edp_bl), matching the T14s
  LCD variant
- Fix swapped vdda-phy/vdda-pll supplies on the QMP PHYs, matching the
  reference design (cf. commit 7c1d0ef2969e1 fixing the same issue on
  Purwa boards)

 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index df20773dd7541..e83814fa7766e 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2215,6 +2215,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
  + any potential issues with this, only allow validated machines for now.
  */
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
+	{ .compatible = "acer,sfa14-11" },
 	{ .compatible = "asus,vivobook-s15" },
 	{ .compatible = "asus,vivobook-s15-x1p4" },
 	{ .compatible = "asus,zenbook-a14-ux3407na" },
-- 
2.47.3

