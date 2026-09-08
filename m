Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2DC3A784E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788855124; cv=none; b=Rol2fpH9exP0xjWyiFfVsB+Jh7GMGs6itfvZ7R3RGSbufDd7WuHQ5XQWe8O3sdSEF8B6+J843JzuA57Ciew4tJhVFGQyzr2goyQSMp5wmbSbDLe+kbbPonJx74GtSaZHGOeRu/kbR7HcF/+GBKoO7yKMoX/8mzvhRfsgS9lOX9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788855124; c=relaxed/simple;
	bh=Ob8WeoXxpLEJOGu3oc5akP43eFgM38Bg5bmqR1LkHEY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pdPtSS6v2bOZGusPdelrrW6LNvsZQNyNAWyq98K8pnMdkZKZme4LwnbOS5CpPEh9q6HJpziEihNa0NxyJgVaZvAHlgPNiDrtaOgLyuzdxLPzzAAlL2BS9EotZkeN2I5A1ityhct+bHr2nyg+pYaeU3da1mExbKVOA9njFx3zh/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cy8iBNSr; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cy8iBNSr"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c20e70a0962so540687166b.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 01:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788855120; x=1789459920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tc3w/tswhYMPPzbx1rKOX62Vnkfmu3CgvOLefEoDV8o=;
        b=cy8iBNSrktXaSI1ITftqan858dQSCsj5a/cA97C696Jxe/BJOYbKBb896pblayp7hF
         raYQuoXuORLM0HjSL89Ox/ikKBB+XNUY6yS1xNLxti1KLKGEJrCNREkpsk0aKeCJf87y
         41nCVN/yH0WTGSa/C2oPrmUOFXCvfAyxaGKl++7Y9xYiEmR5nlPpfne2rOuky7Y/QbgL
         oQMIvcVZztSZMGmO5QTL9yVhn0Zd2aS42nev5sNl0d/lKRWU3WVG1UOmfS7WwsMXtFY/
         qytrOw62T4vScQG2SJbAnzR+3Ah/nSvDWEmF6rEob5SPv068sQbRoXLaXALtcQKArppd
         La/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788855120; x=1789459920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tc3w/tswhYMPPzbx1rKOX62Vnkfmu3CgvOLefEoDV8o=;
        b=jCEByAJsYwZ2UVFOF2WMWiADo2ZG+er5y4SHogZK0/kLSwIdiCx03YQMyHd+cD5E6B
         e15365RbeG3hMiSAJMNYdbBlRyGozdpIQzLjN7iSqDaZ2SmSwhq0bQ6VnnN/UQrJ1OYV
         cswqy+58ou8dyEV0H3f9x67KPxR3ONcCs+A7rXGPUaWjmNxXqcIN+nRal1upsbOS7Z1T
         qlZQO2uzYyvmflZuQa7tlha6Il9klP/iEf85dLc/5NkPnDRKVVuUfa+gjdE4IaVoIO5J
         n0V0YCCM3qz/I7PM/qreZFxx6dZ5ZEpHXTgt0gVxuDULclFXsblNatBQqFy6sWWUzeSs
         KpVA==
X-Forwarded-Encrypted: i=1; AKwUvBz0EO4GA+4PmTRA75S4LuWY1d0bo7gy5jIgxTW3ihoamKw2Ogtjr0FEKf/sgtTWaktuVwAucL8NG9BCGA8=@vger.kernel.org
X-Gm-Message-State: AFuF++lRAzVMjh8EEHWqiCKWlHvV52uVDwuy4yxYgkoKqZZmVCyEt0MP
	xTGVAQPsLKFP2SMukoBscq35nldUHBzD3uirbjEb1O+JuE8YzI14GxOy9vwWMgiyxDeUXA==
X-Gm-Gg: AYBFou2xhIJscDtaadssN7JDuNUdCMkiweEFpBEE+Xev4aLJCMolmXdwgbTlkw0vyav
	O4eewIoc501chmz6XSFbhAdzOP8S+VqYqVztIFzPE4aKHR7w+btTdCousxLvUtbDHfCVLGP41Jw
	WkYcJOS9p5n7WmfDZv8yNvTMQMZvVRI++7inKR19KFmCOR1lz6IiWKITvIlBzBpWQNcankiQNCd
	em87tnIo+Lq4d4dl+bwhPvA2hqGwxLsv0R1T9daJWiQ29OJ3GQa5RylnJo2Heje7dLI6mbtnYCv
	690DLBv8IXf1uQmKt1UmfCJOThlXLQQFam+CfJREJMTcGWttF7lw91eJtjGSuxpFG3DjBd6Ks/e
	AFd2oGCvDGHqAlX+n0VfuZnYd7neEhi/qjl5xLM2XKIPJ/Y5MKoRbko8aB5fF8idM7tWLeKpv1F
	ZjhFDtJ54oHChPKA3tkvIkCf6ZLYYZKWdX/ZdwmkXWL/09BZA8XNt0r/jHpILK9sgAcCbII+u0b
	AaDKxSK5A==
X-Received: by 2002:a17:906:7308:b0:c20:9447:bd5e with SMTP id a640c23a62f3a-c260c8e77fcmr2227127366b.9.1788855120150;
        Tue, 08 Sep 2026 01:12:00 -0700 (PDT)
Received: from localhost (78-3-21-163.adsl.net.t-com.hr. [78.3.21.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c261f673000sm490389566b.24.2026.09.08.01.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 01:11:59 -0700 (PDT)
From: Dmitry Sinyavin <sinyavin@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mailbox: qcom: Add MDM9607 APCS IPC
Date: Tue,  8 Sep 2026 10:11:58 +0200
Message-ID: <20260908081158.2399852-1-sinyavin@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MDM9607 APCS IPC register is at offset 0x8 in the KPSS global block.
Its CPU clock controller is in a separate block, so the existing MSM8994
APCS match data can be used without registering a clock device.

Document the MDM9607 compatible with the MSM8994 fallback so the existing
driver match data can be reused.

Signed-off-by: Dmitry Sinyavin <sinyavin@gmail.com>
---
Validated with dt_binding_check, including yamllint, and positive and
negative DTB tests for the compatible string combination. Existing
MSM8974, MSM8976 and MSM8994 APCS nodes also pass schema validation.

Built the APCS IPC driver for ARM (multi_v7_defconfig) and arm64 (defconfig)
with Clang and W=1.

 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 39bc374300c3..e87373054d76 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -33,6 +33,7 @@ properties:
           - const: syscon
       - items:
           - enum:
+              - qcom,mdm9607-apcs-kpss-global
               - qcom,msm8974-apcs-kpss-global
               - qcom,msm8976-apcs-kpss-global
           - const: qcom,msm8994-apcs-kpss-global

base-commit: 14af7a96afa39f4f3c1972705489b9ba15c01857
