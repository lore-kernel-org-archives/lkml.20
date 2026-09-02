Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F39374721
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788361704; cv=none; b=YCPoKEFSbWl7n+v8Y8980WjtgqMOuyE64jbtimu0SUoGL0amiPGywfsYsNXZGz1NJYLZFFyTjpFTOzF28bq5/+cBAxPk8eTNjQetGm1VolHuOK+PSxw/lM1T2R/2PGHQpNAN5K8SOnQpuJb0c6DoApG18ayKL13ZB2nKJrVuvDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788361704; c=relaxed/simple;
	bh=l7ZwSjQgUOrndePWgPw1DNfTC3+Zu49Xfw8/OOEu/MM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jyDnEvX8xLuSbkT/S+kOqEqK4e0swP3eSO4vSScnFQV7Vey8dm83HL+8EsGRroBxoIk2xi4T/L4B2WZz1qy6Eg6O+n9zPlT0aToJLeWfNpZpU77FxTcGLWpcuAyQ3JwtJEWw1BamGg257LvLN2B0P3YezBwH3x4AUWoJHhe05os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gWkb/rIB; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWkb/rIB"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso17274985e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788361701; x=1788966501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ycK1MrIvVrQE0I5CTjXsTFUVNIDifR0haCk+RMqWznw=;
        b=gWkb/rIBGKTu5cLTvfPW1Utwr95p8/KU2cf+6nkTcMNcgMlaQbGI5sD3BVoa3ma+hC
         of96uprue4P6Oezww0i9yntlFnI4tKnuFuiOGRrQhD47NojNJuUfQoMnrVAjt1CHCB8+
         qaNO1kXv/kxvNgBiAh0t7CE0IG9tdEsuzoDUtg/P6cF+rKmVAoKHniJZcWiiUoJbXZBh
         xm+adNRNInhwbcF4sVPtk4nhSSJaKzhcSFkkCcsZPbi8sWiihFPmstL4PwcG76NWds4T
         qtWoq6RucvdgF3vPE778MBAiIdBH1MlNVYNKL/58dg0FlJdG4+uQ5kColbOw5KmbzVs6
         oIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788361701; x=1788966501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ycK1MrIvVrQE0I5CTjXsTFUVNIDifR0haCk+RMqWznw=;
        b=X/tobmH2MR0u5ZPC3vtb3bE4Ppn2KyUHuvrNC3+n1B1SXeMd59VmIKSeP7RVUteVFt
         0157TswLeD//eqa7qsxZT60/aiEvXWACAa1049yG0QqyaVsoi0uibMNkmAT9JOBDp+r1
         s+Ey0+WyvcwR8n7a1Wfd7RRg99lEjtoueMLeqd+ZtZBSy13oBaiBp5oZfZmLAi4GoU+w
         XI5V38nT+erXkRHgICkg29fzMoIn21TNwt/KJX/IJ58wAJCxzNu64WGZy1vahT6KKtNd
         7D1ucH6jo4MyTcmhGTq1MpFhKyB/OCDlsStkRTeCgXbuLn0GT3FAKzh1iVxB+kiOc1mL
         OXMA==
X-Gm-Message-State: AFuF++kk/eKtWn6W4/Ybiyjx23XUVYrn/pxYgYT5s/0Z5LeCtX79bmGY
	+anjXxTXG0Yfh33xKl4NlL/I4fqw03zM1kJ4S+MURQtmYhu+rEGv7CIU
X-Gm-Gg: AR+sD10r59wdUwIHYk3/Cp9F6zl0L9nFNDbVTO80nAaKDw3wqzhwNjvxWL4Jtu5Onim
	KPkHbp9rMaMS33vsoPuBXv4Ds65fLYh5UgZhdurLVGUfKaoTHGQwDokuyBlP97HeSTAAcJUhq94
	pgENbw9vD7VFnZdKc/d+UgeUq+iAs1u/kp1pzCH8F8WFAFV83RYRVSwe3udnWXosr5VHgVcTUHg
	gaOQ1CFgX1XTNTLG+BnBAjv3DG7RVMoJ6qQZsP50FjWDa1Mz1cLHYlLEF+ScWEDZttTSgOxti8n
	SUUx9cs27/fASqRuytHDYxRjWDhnb39MiiKGObQZ1ZUHYngadeX8ndX2YWs1kW8fAx+CXmd0+7C
	5pfFN6BayHDBpx38uyX9yxdULr7N8QQGpPy0gqyxHOtEOKidb1KM34kdhqGewEA51K2d1EoL0zp
	8yab7XaiRcDFenUnbo7vOoQMTri8WnRCnkZftDHsJXR/ECF77CuPeimOmm6Rmn8g5W9vwiG3iYz
	QS4/PvW3mMm5xv+K+Xs5ql35WpWnY3aLFl2hIZ423Z7XvWaWgOfpl+Fupjb8HOnf2MyVVptSI8u
	aB1wxcg/
X-Received: by 2002:a7b:cc8d:0:b0:49c:edfa:15a with SMTP id 5b1f17b1804b1-49cedfa0177mr10580455e9.13.1788361700924;
        Wed, 02 Sep 2026 08:08:20 -0700 (PDT)
Received: from koolguy.fritz.box (dynamic-2a02-3100-1a72-6e00-ef52-6b66-008c-4439.310.pool.telefonica.de. [2a02:3100:1a72:6e00:ef52:6b66:8c:4439])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce3e0desm167404405e9.11.2026.09.02.08.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:08:19 -0700 (PDT)
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH v4 0/2] staging: rtl8723bs: Changing two struct members
Date: Wed,  2 Sep 2026 15:05:40 +0000
Message-ID: <20260902150542.2746-1-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715171634.1550-1-fliegbert2@gmail.com>
References: <20260715171634.1550-1-fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch changes two members of the struct adapter.
Two additional patches ar made to fix some checkpatch warnings.

Changes in v4:
- Rebased against staging-testing

Changes in v3:
- Rebased against staging-testing
- Fixed building error

Changes in v2:
- Rebased against staging-testing

Dalvin-Ehinoma Noah Aiguobas (2):
  staging: rtl8723bs: change struct member bSurpriseRemoved
  staging: rtl8723bs: fix Alignment should match open parenthesis in
    rtw_mlme_ext.c

 drivers/staging/rtl8723bs/core/rtw_btcoex.c   |  2 +-
 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  8 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  8 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 80 +++++++++----------
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  | 12 +--
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 10 +--
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  | 12 +--
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  8 +-
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   |  4 +-
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  8 +-
 drivers/staging/rtl8723bs/hal/sdio_ops.c      |  2 +-
 drivers/staging/rtl8723bs/include/drv_types.h |  8 +-
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 10 +--
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c  |  4 +-
 .../staging/rtl8723bs/os_dep/sdio_ops_linux.c | 32 ++++----
 15 files changed, 104 insertions(+), 104 deletions(-)

-- 
2.55.0

