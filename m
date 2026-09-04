Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34824485CF2
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525894; cv=none; b=ZVXiJ+pqByI8RYIDus9wPryALVUuhTqGM5ZereBmeiVmBo5TxxnXXM+ZWOgrKaC6761BHtOMxHaqyEvbaFLsTujrSmLTImDK6xEAr/y61UGNESvcj1yDsahQmTbfMmIJEcKnFZDc4J8fj2fpadKEDBm5XkTmht6qq+6h69N9NNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525894; c=relaxed/simple;
	bh=USyaP1c0hTWMfiIXxol/8YxXcSe9Nch7yzmLAIwCl3c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C/q37r8I6nM17FSVPAtptT3z5XTsCumOfJVPSszsCrbR4hVlhHhZDxKQlr3kxK/qXzhNGoeliObBip+PmiAiykd9VgakVbRKb211RY3JZT6ALUJbHBkzwh21YAqC4CE6GIPW6CIs5KvAmhAGLLIilfYzZXZb+mEvSpaLlJa/9Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jczB6ZGX; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jczB6ZGX"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7f4e596e393so1048339a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525892; x=1789130692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=afStDJ0p96QePHpdDq4rxwCyajyjIl0hbxi8e2vmI+4=;
        b=jczB6ZGXA08uYVCDzKEg0BtbB0NwEDL7RSoXSf/oJvH5/whzpii2KLXdQPOKiWC+aP
         L3exdaZYec/8a8qqDc/HSTHLQBJsb8i+mM36WRm5xHrs+DYwqOFp0ZDr/xP2mz3q6ObP
         FQ99Dd+5hy/yoD2U3Jaa80bl5JzyYoDMEEhX+Ufxvf/2Gs1SAoKlk8/d/SNucYDOeZor
         utK5Z3AcEXijWILODQX/YfCu665IJaj/5b3znjfakRbgN3osekICp1tV057K4Zl8T6W2
         iczaXXjqjbSCTJi/hPOd3hIWLv3nxyhjS4oYtURtAPYGde9Ov8t/JDgwYg+vbSXUjG1l
         Z5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525892; x=1789130692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=afStDJ0p96QePHpdDq4rxwCyajyjIl0hbxi8e2vmI+4=;
        b=cc5WGrLgX8VAST9OtrgK3b1cy1EDcRPjD59Ah2VTIjNVja82zjbtofUC1WbQmu7CUR
         JBeB3HMTLK7rzGLZu4BtO/QUfATByEayUQFNhLdGk009JqfBrSySHKPYUy02383oOsV+
         yjsMSXqiPXrxtDGcPkN02Oj51Eto51iJsbKQIfPNR8HUb5PruV4Nu4jwrOGPFWey8rPz
         aIExP1XbsSgJxWayoGz6y3DLotiNVz2kCTiAVMnqrlmKMujwL706u444cBva8ppdlz6H
         CxboVQG6gnya3lFk4g0BYcIqSH5M8d9Q/4/I6pzbD8vyPG3uYoSC67C7EoHZXKlu8rTY
         q90Q==
X-Gm-Message-State: AFuF++lHZyIYxAKEGJdH32pCkFZPkRtBqsJ1kTp0i7+1eRs/caNc557M
	6bC1DsOzQtMkRls3rgaSz6SuUZtTruyb3K/11in5594KCyS1+CJ7M5P8
X-Gm-Gg: AYBFou120isxF1xTIn16QND4kpjt1DREf1ExKH/O+jzJYwsicsQgKbCcdCQwRo4eVV/
	VC8Ie6CgkRnTc/fFdzUo7kzh9DvARQUFQlvYWPJofDgiVUPcmTxeKRXAWjw1QgnPKXFQxIkCFjc
	7e9rRuUYLLq5+vwVBD6f6iywI4mAxueKdpvlm1fIiHHO5wj7oE7AI5d4PWD1y+NFEfI9HwHtDj9
	k4cYBLpvzo9C3NxlkD+yih9+idaY7WLoLlFhNypo+gef2UAZqUo1XSXGg19i6rQFTg4KXYWS9jR
	QpNdAY4JJQmtMmOI7Z+hHh1z5y9gIzd19EUmPd5g8yn5RnIqMQAlcKRJM0gtGWWHYwjymkOxP+R
	XzkkbTaZY3yjCwN6lE93odkoSGOns1VS0Tilk+nJydO866e8Y47zY6P256RckpCDQ6oiy2NXNH7
	fnFpYmagnJlJd/f2mhTJmMx7rvmT+6/Pzu5nvHc8Gl+ORKv8M2o3lWv+HDU9R9rM8JqP2OdKKkt
	KGwDgHqtT+O6KU=
X-Received: by 2002:a4a:e904:0:b0:6b7:83c5:fdf0 with SMTP id 006d021491bc7-6b783c603b3mr1907290eaf.49.1788525891923;
        Fri, 04 Sep 2026 05:44:51 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm6805245eec.19.2026.09.04.05.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:44:51 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Martin Schiller <ms@dev.tdt.de>
Cc: linux-kernel@vger.kernel.org,
	linux-x25@vger.kernel.org
Subject: [PATCH] x25: fix typo "compatibilty" in comment
Date: Fri,  4 Sep 2026 18:14:46 +0530
Message-ID: <20260904124447.7040-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "compatibilty" to "compatibility", reported by
scripts/checkpatch.pl using the misspelling list in scripts/spelling.txt.
Only touches comments, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 include/uapi/linux/x25.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/x25.h b/include/uapi/linux/x25.h
index 034b7dc5593a..f0dca6c63f90 100644
--- a/include/uapi/linux/x25.h
+++ b/include/uapi/linux/x25.h
@@ -67,7 +67,7 @@ struct sockaddr_x25 {
  *	DTE/DCE subscription options.
  *
  *      As this is missing lots of options, user should expect major
- *	changes of this structure in 2.5.x which might break compatibilty.
+ *	changes of this structure in 2.5.x which might break compatibility.
  *      The somewhat ugly dimension 200-sizeof() is needed to maintain
  *	backward compatibility.
  */
-- 
2.48.1

