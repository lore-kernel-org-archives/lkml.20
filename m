Received: from mail-oi2-f9.google.com (mail-oi2-f9.google.com [74.125.231.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0233DA5A7
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789594621; cv=none; b=lNWVj3Ls1kOmLaipYlwR2/AcyZAQD2yqvbtxzi4ZhU87qAg+fev+h2hJnQHHgQFTkGSmekkWDIP2alp1l97JRXbqlGE1ZUfuJ9JBXUHMjlu53ZEjN+PCkyytZewzAyKuFdgHBURHQg+XmW9aq6lvkLt1po7TsJV2V4Wp9xJpcf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789594621; c=relaxed/simple;
	bh=IyuajYzPnmD3io9Y6axVM5mE4O2sgF3cAAOwkQSlc8s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QIYjvVuFoEzA6dd/lH2yrNUXM0yNInDlh+9icBz8qKKucJHx4oJVmM9IQnGkHAOCxKLf8JuByCOeDyvuMvSZ/wXuPGLnT+e2eGGnmbyztdSitxDu5qlhy1QdHq8PpeR+BOtmpIXQJNgH0Wu/Aals4b7uCoF6qMftZn6eyzMpgB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=cpDtbHpE; arc=none smtp.client-ip=74.125.231.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="cpDtbHpE"
Received: by mail-oi2-f9.google.com with SMTP id 46e09a7af769-7f66624aa21so28164a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1789594606; x=1790199406; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NLbXNfixPvdVNUANDYuEZ718E2/Tpe1XaOhwQtbxwPU=;
        b=cpDtbHpEJwR7gpRgwVHreVgTdmJBBhBI+wBIZ6sGTepgmt38lQc+imlFToKILs8xMW
         cyzXl3z7d5ZUgOngTV7fL07Opfw+J3bEl6LcHEiqE59ctzpKSXmibU/lf5dYyayy9Dym
         HWMngn528aNQL6Z0dJO//8zyyhH0TtKKJEviVnQr0V00AxTs/HYM+pnfhGc9nIaROExP
         76yxHUaH+G43VuFLJTy8+zvxVYDu/sPKRqweltvwfkW8DK5JsOqgqNPrEEosdd/6Omua
         ZJApwaa2eIYC+c5i/+p7PlO6OwL01InJ2qu/N+1KW0/QTAYTFiednKlRGpAzJxZwzOVZ
         Bu6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789594606; x=1790199406;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NLbXNfixPvdVNUANDYuEZ718E2/Tpe1XaOhwQtbxwPU=;
        b=nmk4yOWofxLI6Ly9x0fHCICVjv7zvzB1+KcmuDSb06kwX7Uy6miv8zcJwQLhfc93qs
         jssLY+Yj3RSCHJha/WqHrrwcrYp/Y+5GEjn2prdC2iol/qxJh+CpGFQ9yuw/GqKLe6R3
         hiJcz4FGRW/3iJT5Cq6lgxd9yk6bJ7ciddKdM0GzsvqiFx9/XGsv5M5unlJBzP/lV9Rz
         SkYgO+epHsI+WqUcqiGfgCQ5W1a9RKTZXg1VNk6B2zSWj38h6fflk4yx+ViL2HNJwETp
         mz2qdjLgpzqXr5QG5GItEKm0V27OZXYkhnSBPbY2qP0uhtOBW1f+uC4DCszaJ7WuM/bU
         qupA==
X-Forwarded-Encrypted: i=1; AKwUvBz81j21wRnHVhe6U8i8k4XbrWT5NBSUslrWXRorIu6gXpcyEMc43dODjDb6Go4YZf555Ej2ttzoncUwK7c=@vger.kernel.org
X-Gm-Message-State: AFuF++m0QIE1E0dvxFIX7tH5fGiNbwpGH31PwOpVZ7iy3FZKmlgVCMj9
	X8PH7l1fw1rfxylTcy4FPZs+9xhf7PrOsTiD3bx310Hcnwdjn3GE+ILKqoeDpOD3iM8=
X-Gm-Gg: AYBFou31D0a+qJUDa2SPeELmbSEckl9axWsW0iBdulEs13vVI/t/oLTbTCHObqtqgQi
	LyIEEnAbjgu/gavD64Cis+kywe6xZ9Tj8TD+qfzuAf9HBoVCdGey/LiR/2VRgE9UpYnCaIb+Vsd
	BWd/fHE3hoqailBnTVmWeoojd0slsgFvH8xTm62WPpKU1tNxBM16lPWRmnKr9GvA73cTlTW92ZT
	ufAw0y72s4pS9ZvLs6eB0DTlA7rIz5KfCke9cO2jcWANDHNCqFF645YOlHssh/VqbJehVAONkdP
	QTLmuv0O94P0KlJxbrUNFupfRIgrc2Ma6G8yem83Z4Q44lmUirvuZN5w/XLLIK5EGFKP9AHo6is
	Tmdl6LJpogsK35j3CSnOOjAH/IXGEL6CySoPGbC8qwI5nMZdU8Rhei2BVqk898at2TN7R58XsAr
	w3Y6PaCVLSsLF5hJcBGxcxQAxmA2k2DO+oMf6IiEdIxceot6W29FHvoe2Rl08JsSbZDDQA
X-Received: by 2002:a05:6870:5ba3:b0:457:4470:96e2 with SMTP id 586e51a60fabf-48475e836bemr4313868fac.12.1789594605928;
        Wed, 16 Sep 2026 14:36:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a09:bac6:947f:31f5::4fa:4b])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4842a23e310sm3387557fac.12.2026.09.16.14.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 14:36:45 -0700 (PDT)
From: Frederick Lawler <fred@cloudflare.com>
Subject: [PATCH v3 0/2] integrity: Return error codes in audit messages
Date: Wed, 16 Sep 2026 16:36:36 -0500
Message-Id: <20260916-report-hash-error-v3-0-73e5d95e9efe@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOQLq2oC/33NTQrCMBCG4auUrB3JTPqjrryHuCjpxARqUya1K
 KV3t+1KUFy+H8wzk0osgZM6ZZMSHkMKsVvC7DJlfd3dGEKztCJNpa6wBOE+ygC+Th5YJAoUpE1
 TOi45Z7Xc9cIuPDfzcl3ahzREeW0vRlzXf9qIgFBbPNIBEYnzs23jo3FtLby38a5WcqQPhqpfD
 IEGo9kcc1dQ7uwXM8/zG9kvSCH+AAAA
X-Change-ID: 20260716-report-hash-error-5203d6fe6e4e
To: Mimi Zohar <zohar@linux.ibm.com>, 
 Roberto Sassu <roberto.sassu@huawei.com>, 
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
 Eric Snowberg <eric.snowberg@oracle.com>, Paul Moore <paul@paul-moore.com>, 
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>
Cc: linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-team@cloudflare.com, 
 Frederick Lawler <fred@cloudflare.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2513; i=fred@cloudflare.com;
 h=from:subject:message-id; bh=IyuajYzPnmD3io9Y6axVM5mE4O2sgF3cAAOwkQSlc8s=;
 b=owEBbQKS/ZANAwAKAasltHYDktNtAcsmYgBqqwvq9XE9AKDW+jkDoMPrQsp+EEVhR+0vyyfSE
 YsH584XbHKJAjMEAAEKAB0WIQTLNBqMVmu1PHvjOe2rJbR2A5LTbQUCaqsL6gAKCRCrJbR2A5LT
 bfd/D/9DyM794xZCuCYiEp8E5G2ZlX/+MtkM8PpZR9/dOjmllI/84wOLM7fbud6MxqB0sFqJ1qc
 iQfPLsd+8PaifD4msMqMG0phYciWNwaJsRzCafsPv1++FbcNW8UxkY8ToRHztgTlPxbCkmaBC0Z
 6pqBl04uIPonxe5C72WGGTLRkz+aXEO7I38ySL9ez+ZyP5Fs7pGKUzIwYZEj+SqbtexLQpcfjXI
 91damz+0ON/kswGm1HNvnpy480xhISbK13hxvZoumQfkOwcrp1DfZreUjRjEZ6Cp0LFxLnhr135
 LrRyY5+UnySsfVyfoWnhZku2sVnzASQLAeDxBW8Yn4w98JI+PNRucWA4J2OGb0Z95uvLtJet/S/
 +3RklEagyndq4uDeftKt+SZYAgr2Uo2MCM9mvlTNlAntjjxeESypLO/94JlVGYMDl6Lvu+e/oyP
 crNS9NjS7SMdGFyAMm+L7ud1licAoctohOUa146AKksNJznngrSF6eoYBAQE8x6N1YS3kLUJ3bJ
 Dro/dhx9K0dyuY32ihvbcOmZ17pxs3CAiHttYSPNzCxLDzV0oIx04ug6CFUkeS2o7+AfMQZDLG2
 x5Qwm+bHSuH1GkhMQXsM6YOQImjxWAr5PEfIaDfmoD5BUe0IlMaMbNm7QUwEeNo3eZFowa7PMvu
 F7VT2pXl6cmquMg==
X-Developer-Key: i=fred@cloudflare.com; a=openpgp;
 fpr=CB341A8C566BB53C7BE339EDAB25B4760392D36D

Commit 2f845882ecd2 ("integrity: Add errno field in audit message")
introduced an audit log function that can take an error code. It is
wrapped by integrity_audit_msg() that implicitly sets the error code
argument to zero. The problem is that there are uses of integrity_audit_msg()
such as ima_collect_measurement() that hide the failure cause for
the message.

This series aims to clarify error reasons for failures, and then expose
error codes based on the following criteria:

    1. The log depends on a result from earlier callee, and/or
    2. The caller function itself returns with that result

ima_release_policy() is the only caller I thought made sense to keep as
is. The message doesn't correlate with a return code, nor does it
depend on a result from an earlier callee in the function.

Signed-off-by: Frederick Lawler <fred@cloudflare.com>
---
Changes in v3:
- Condense series to two commits.
- Reduce review churn by adding error code to integrity_audit_msg().
- ima_write_policy() to report -EINVAL instead of result.
- Link to v2: https://lore.kernel.org/r/20260727-report-hash-error-v2-0-30e394f524fc@cloudflare.com

Changes in v2:
- Changes from v1 are now reflected in patch 3.
- Replace all instances of integrity_audit_msg().
- Convert to patch series.
- Link to v1: https://lore.kernel.org/r/20260716-report-hash-error-v1-1-ac19281112e4@cloudflare.com

---
Frederick Lawler (2):
      integrity: Report error code in integrity_audit_msg() call sites
      integrity: Replace integrity_audit_message() with integrity_audit_msg()

 security/integrity/evm/evm_main.c         |  9 +++++----
 security/integrity/ima/ima_api.c          |  8 ++++----
 security/integrity/ima/ima_appraise.c     |  6 +++---
 security/integrity/ima/ima_fs.c           |  4 ++--
 security/integrity/ima/ima_init.c         |  2 +-
 security/integrity/ima/ima_main.c         | 13 +++++++------
 security/integrity/ima/ima_policy.c       | 11 ++++++-----
 security/integrity/ima/ima_queue.c        |  2 +-
 security/integrity/ima/ima_queue_keys.c   |  8 ++++----
 security/integrity/ima/ima_template_lib.c |  2 +-
 security/integrity/integrity.h            | 18 +++---------------
 security/integrity/integrity_audit.c      | 12 ++----------
 12 files changed, 39 insertions(+), 56 deletions(-)
---
base-commit: 6903878d4654bdef4e08e38cdf1ae306ce7de5f9
change-id: 20260716-report-hash-error-5203d6fe6e4e

Best regards,
-- 
Frederick Lawler <fred@cloudflare.com>

