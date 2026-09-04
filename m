Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7B74483A5
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524865; cv=none; b=eTivh2xtuHNs1/qsmcM3WVcU6u/gFjdNiwyrsym587RnvCoz45A0DH8lN2r4TN/WjJoAvvmfed0u38kmKhWsz0XHUDKxTOUvha475oG+Zosq4yroiAnCvwdxFePsbNyP+RK0HtxwpQbO83VmBkoFNMtgBSAQiwHcWZkpm44ra+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524865; c=relaxed/simple;
	bh=MdMkvdVRw0ZgGHAVv7qX/N2NDQEYvDYBnx81INEUBWE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I1yU3lE2QlHNVYHFkIOA9tQtBjQYXAlmAJGpw4HgLhe0XgyW98JMtsH4h/wzm5JoeISfxAS6bm/JTT/vXnYuuBAmQQUfisv8sSHf408dxER3UacGg8kmC9+BDfnHbjaq7+8UtmUbYjiwAK20EeAwFeveQsD2+MQn/Bj2SGjch44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dOKdpSYS; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dOKdpSYS"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-465cfc7e33dso519794fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524863; x=1789129663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yGLh7xQtAAd514FqEegVwMoJiuYXFm4/mjW3gIL28o4=;
        b=dOKdpSYS3gFeMwOr110VZLMbLV6xIXbeIdFgjN9Kt7XbaVY4HjkdlfdGJNDYmdveQi
         wLdRw9ETxiGfCfnT3jgltIgOZuhEmFphVxN+qDFurZkj54L/DaM0tSHRzNuKrVsZtHK1
         omH1o13ijo4WN9wWXqdiJgmj/EZS5NFUI3ddG67VyWST5L2jF88eDqDSunjewgdoAAFY
         h6LulSOLUH+PTeP4w632IWzftBnQeFuNOd0DzRGL10zt9Z+/lIyXmYOMXbjy61jI70qc
         9bTKpC3kuzRslK3tSXvI9hSxcIJeB2sDqacMnOcXc0kwvr5iAioYsZCZaEJZlvuhluMA
         sUeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524863; x=1789129663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yGLh7xQtAAd514FqEegVwMoJiuYXFm4/mjW3gIL28o4=;
        b=cIgewS4xVkst6gUo5c0O89/t0oq8+C8VCCVBwiEDtz4lDoQLTj9r4UDiUn4wEXFhS7
         QyfKOKO4hsd/KCstU72+jKF3qoO33KcURjWFz0N6zj8cNniE7femhi7EYoYtv/j2UqII
         rOapj8urbmJw3F+7KvvAJDXCwr1Mf/GwphLx7AUuGQZtTDXIPIGLrXRmHnS1oZf16u0J
         uVVqAbsiZR4eWRJmKpQE4zUfLEnmzoe9j9b6ioA/SXGuvKUmO62WfeA5cNX0vMJgGDCK
         WELqpf9817knmeaejMh0sbliYlKjSFL0grSaIkRWKGwcDSO29ODS7cqIV5mBcSoJXX5R
         lDYw==
X-Gm-Message-State: AFuF++lC2LWWtDfVLRlQ/LHd9f1s/YZBh6g9fiBOlK7lEfCmWGZ84kX7
	zzVYyXMhL6NpazJsC1JlFF8qBNocTU/P3stm/A4ihI6CjPiQ+G8KfSNlDWlMSgAJIhw=
X-Gm-Gg: AYBFou1KuiMn+EHCcDKJHV6NdNfvvtOx8E8jxEcP93+94AbulnL/KVKZfLXFCLYBZfJ
	pAU/NJig4+GECXJkysu9FBXU0fIpK/SL9VV0TuN6eaYxVZgD9CtcLb5AFVIF+p5kKqgVAYXiuld
	tPWgT0GZleSXip7ebS29TLmfepNqjDK3NzniBN1WTlLcnbZ0rkdYjdW5nKqA3FgNx4zsLGv/z+s
	4ZHaN3qkS3ebX8DLbA/bjtM3DAeSmsDexpWovbFf+lEr75zx+PcfXzaRrICenhplvNV/gys4cZX
	Ab6X0PlhvvbaDej/bIRBWq5RN8pgkWw2FECuwokJhto4hiMt6gxYDlFH80HxTDjltYqUJPqK9Qn
	TSAe1aKTXOfOSPKzWksq8LRNrptKwo2qdK2wTzjGLk5LXq7h9j4QnpU+TZbNUmUySd3POgF5AJh
	gPjJrLskwwipBN8LMjTUl82BidtovMQGM/hw9sQ9DMcBKxkRP02F1/x7+tUKR/BPhf9+TKxwV8E
	4CW8Wb2PBwPKLs=
X-Received: by 2002:a05:6820:198c:b0:6b4:117e:543 with SMTP id 006d021491bc7-6b6fc5dc03amr4605135eaf.21.1788524863132;
        Fri, 04 Sep 2026 05:27:43 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa36b37sm6347207eec.14.2026.09.04.05.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:27:42 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH] leds: fix typo "retrive" in comment
Date: Fri,  4 Sep 2026 17:57:37 +0530
Message-ID: <20260904122738.33145-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "retrive" to "retrieve", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/leds/leds-ss4200.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-ss4200.c b/drivers/leds/leds-ss4200.c
index f24ca75c7cb1..c782339b1330 100644
--- a/drivers/leds/leds-ss4200.c
+++ b/drivers/leds/leds-ss4200.c
@@ -339,7 +339,7 @@ static void ich7_lpc_cleanup(struct device *dev)
 
 /*
  * The OS has determined that the LPC of the Intel ICH7 Southbridge is present
- * so we can retrive the required operational information and prepare the GPIO.
+ * so we can retrieve the required operational information and prepare the GPIO.
  */
 static struct pci_dev *nas_gpio_pci_dev;
 static int ich7_lpc_probe(struct pci_dev *dev,
-- 
2.48.1

