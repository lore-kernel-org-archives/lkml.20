Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE2B453C3A4
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790701081; cv=none; b=GjGwGsEJHWazvXFptYrkuZEW+xxSdpyn2NsDCXOtJXjYP/eXK9YM32pgtKllsLAPCWLcsA97x44Tj6dMdFpIqUUm86ib5Nj5r9eiMMweld3vFBvJaESsViivNBbDXgomgibXEigRpcKX+r06qxBvDM/H6AwXDHtnrAN8RnHUHyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790701081; c=relaxed/simple;
	bh=8/ii0boc+Wr1gECVAD56hkDwx+W3ALDJGSxhMWjK4Q4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Enq19IFrZ+q3H5DreZCjM7sdEsPBNHDBJOVtj7MNcQIES8iYlY0YoyML02RKGQkzMRkF7u0Wm7pwwPXJslOnVOls34Nv8H3kzdKDpIn0O99g/oyI//PXv33tMhy+rTcrUobfcnrtWLG0EH00ajsXlwv5qSnE2QBnESTQEKP/rfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=vq4hh4Qo; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="vq4hh4Qo"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8203F1655;
	Tue, 29 Sep 2026 09:57:55 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A3DF13F85F;
	Tue, 29 Sep 2026 09:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790701078; bh=8/ii0boc+Wr1gECVAD56hkDwx+W3ALDJGSxhMWjK4Q4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vq4hh4QoKMd0y40A7V+vz0nffbqxaJXXDHv36hFvqL4DOjOgDDKaGEWRfJQLONAYZ
	 n2AmEQBNS2Sz8x133ZHEJFQ2F7EEMuG6Q6M6E85oy7PbD+7CeDWbK6oXO9/mm2xZ2c
	 6815C+lK20rkJPgPkGpuqTmngJCD1DWUzYeC9QT0=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Tue, 29 Sep 2026 17:57:48 +0100
Subject: [PATCH v2 2/3] arm64: rsi: Add realm hash algorithm defines
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-arm_cca_mr-v2-2-1d98bba187fd@arm.com>
References: <20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com>
In-Reply-To: <20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Suzuki Poulose <suzuki.poulose@arm.com>, 
 Steven Price <steven.price@arm.com>, Sami Mujawar <sami.mujawar@arm.com>, 
 thuth@redhat.com
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=818; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=FfOXThD9R4wtVSi683fbHgUMp6vZ0Nc8qMZ6sGLDiq4=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqu+4R60ni2U/2k1o+iyk21hhFcXyv4ei7V1ZJl
 FqJOjtCwYeJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCarvuEQAKCRBt1cPRWsUx
 M/geC/4in3WY/gH409hn0NxDEtK0g4vqFASVS7OaKtLeKNBVR4rDytf0wLfx2aJb6tfC0jWXTZr
 fLCI484nqBDA8eUNYg/8V9xkyCGDu+w+iRazMUggi1BffUPeulIt6PxJjPx/QEDRJIS1iU7Xvtq
 6tD28nUWQWpU4CdzG2WNfpWPSXy9EO635dAjRGvfiySuzAH8a+ME7qxTs7VrB+E0m7dxr59tCEb
 wk0Ut2GXmX0Rlg4cNoq1BoG232fhmeYnq3NbJ44JINKWXJsTIKmZu70liHVTqXIjlQoiCODuM5A
 IokxxZ13MlDRrxDvac7CwKGEgB3DV4M96cXsP/X6YvBvQ5cCFDzoUFrIRBdzHjwjN6SOggUYlxb
 BFsbb4He6FIfX93lXAWgyHWjBd921f6K6Nh9DRzjo7NN8J8zxabHkG2Xs9hpbh9phM0wB7Ku9yh
 tur8xc91wMwSwiec5a9nXd8PoKhXHkRIoybKmiwwZ4bCmOw+YrMY/oPz7o9nEV/RyQpts=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

From: Sami Mujawar <sami.mujawar@arm.com>

Add macro definitions for the hash algorithm identifiers, as
specified in the Realm Management Monitor (RMM) specification.

Signed-off-by: Sami Mujawar <sami.mujawar@arm.com>
---
 include/linux/arm-smccc-rsi.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/arm-smccc-rsi.h b/include/linux/arm-smccc-rsi.h
index fddb77986f70..a83df2655808 100644
--- a/include/linux/arm-smccc-rsi.h
+++ b/include/linux/arm-smccc-rsi.h
@@ -144,6 +144,13 @@ struct realm_config {
 
 #endif /* __ASSEMBLER__ */
 
+/*
+ * The RSI definition of the Hash Algorithm (as specified by the Secure
+ * Hash Standard) returned in the realm_config data structure.
+ */
+#define RSI_HASH_SHA_256	0
+#define RSI_HASH_SHA_512	1
+
 /*
  * Read configuration for the current Realm.
  *

-- 
2.43.0

