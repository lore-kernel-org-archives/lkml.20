Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59738453A29
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774836; cv=none; b=j+4KRlTLakYSwbH3P1SyTIDZ6Ve/Ob/WiduiP79URAWRX0/10NxxxlWVIm8IOpC4P+jeI0Gi6i5a++ulMZsvH1vOrFpXx7qJyuRo14oA+aoecE/37DBt2LNrsqpSguKpb9kAiiFMFEOUXUIarg2Rs4riDKZytsXT8V9/asSdhuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774836; c=relaxed/simple;
	bh=+lpKN+7kk0XQLmKmDa/X+MHwJM4Lprdnc/6O/rW48J8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TmTxpbKVkBvKqaMVm+Jqkx9bmU0hvLcwRRAFCnfW76YCAgCP3KkSbkBHfJ/xZA27ufIdxGsC6ZHCih0SQvfRpmktLUwEHf9MmVQgqYMpt43ekfr75ndSrmPXR/VVf8X5eUASTpytER2Xp420JBP193ADvQVv1jCsCxObaXV8OZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZdTC6VC9; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZdTC6VC9"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc1b838f9b6so3659984a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788774835; x=1789379635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MI9c5a62kcyuONjdN9EmIeefQ4BKelQM55jDPn+nu9Y=;
        b=ZdTC6VC9kRA/Mpp45BkojuatmfS/JbOLWCFVDNAs9zkmcpppENvmx4kUfH29y4XmcL
         2P5C5Gb8WmbcVFPRYpi9c8W0iUygJKz8ENEOHBpaDaNuxkMpytjenCytnIGZcsGbuRdC
         ulSf2aET36+K6GCBhJYx1KywuEmA1xiEYU7OQtElUM3c5vg/ozjzYkUdGuWB/6uviEj0
         oKKLOxtkrQYS4esa2IMZPG0zy4zOr3IrF/WhpTrNQlOblkcsxPpxLqSHYSWnFXQD1+UT
         kXulsMjjGtrRHZOR6hDnVNdpXjxSSltT7GM9fyBp8ynt3FphVAakggF1awvJ7nWNXpbf
         mGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774835; x=1789379635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MI9c5a62kcyuONjdN9EmIeefQ4BKelQM55jDPn+nu9Y=;
        b=ZV4lxhptRNnpRRIaBmjoYxrO00qKzxt7nSALl5CnUgsjF3H1SVuXu0NB0D5XYZlfvC
         0xAvZLOBPKJ3KGJ2otQoW1Bwforadnu/LkogQxQT/nFcPZiloRJBWw8v2Ztoe6MsX9a3
         R7JbWL82uVfn/Eu8F4IiPTbwcjeYQVe9Fhv0IegnUIS1AC32p61fp3GwSExYp2uQuWPZ
         xNNPqYhLA+2fFYOY7o+A4oWXLqDVhGf7kJRaFWRZCnyz8WTxn/Si5XCrRqdWivjTcjv1
         IAROSa3hMmRTdvlVI4CP7XQJFKLz2vuaAjMtV6V9Mj0dVphvFxXGz2ockYkGHBfJ2K+A
         Lxqw==
X-Forwarded-Encrypted: i=1; AKwUvBx3+cjWYejSYvkR2vIOL13F1MklmDVb7yViDVa1TFSzlBRSaCU67yyuPui6cL7XB9RmNudTcXyty+CTYPA=@vger.kernel.org
X-Gm-Message-State: AFuF++kyOul8WEpXnToEjHiTa8dSuMZ/96FkHSVnsCJYTh9LVBrKB+gO
	PqKsd8jPK4+m8yqnWraVNF6pEYPP2pCNl6stfUv4IDO4kZUIZ1JT3Xoj
X-Gm-Gg: AYBFou0auazdJQZWfG4nT7i/imLBthCJDTmIgfNCniQ5ju4R92K/Wefc4M1KPy0e5C0
	kXD7oHvY77E5iW4G0Sr9XilEtYyZTQd7QsGoS/tzCInro5cAQBOQkc7FCjQE3qXw7Vdq/My8zi0
	13SYzjrL62KoJfX/AZIFuNiNw2Pxn0eJJ6huDbyLAnpWfGKKhdGwf4akcrF3oQQnE87iaQqn6dQ
	d/qZf85z+Pvyhz76mFfDe3gsFdHAF6T4pkpA55kAiWyiYOi/q/98iw15Xzs5Uav+/ubh1xcoozh
	W3b5DJaoy4Vb/fIPaUAj5X1sZWPd4N2dZ84nRzLvetqR5VB0B5q5amWkYayVCS+PIuuV208ef7Z
	tgzr9jBfvU9qpkulfXBJrKidSooYrcZBCNtKyO1DqTDfWqaMmx6owLpAtqfLyB07Ae8j2dd/xxu
	hSpQvCb3GrDBxvQ8roz/NR0x2z+WsrdWMxAsWW3nQ0857oHmvmbq6ptHscba4W4QM+k2MZxSbSq
	0p8XVDx8MLw1g==
X-Received: by 2002:a17:90b:3a8e:b0:390:8361:a532 with SMTP id 98e67ed59e1d1-39b260d2eb3mr33006922a91.7.1788774834673;
        Mon, 07 Sep 2026 02:53:54 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm30377066eec.21.2026.09.07.02.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:53:54 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next v2 1/4] wifi: nl80211: vendor-cmd: intel: fix typo "firwmare" in comment
Date: Mon,  7 Sep 2026 15:23:45 +0530
Message-ID: <20260907095348.26094-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907095348.26094-1-hemanth.selam@gmail.com>
References: <20260907095348.26094-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a typo in comments, found with scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt. Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---

Notes:
    v2: designate the patch to wireless-next and use a subject prefix naming
    the component, as maintainer-netdev.rst asks; v1 went out with a bare
    [PATCH] and a "net:" prefix. Rebased onto wireless-next, diff unchanged.
    
    v1: https://lore.kernel.org/all/20260907061417.33729-1-hemanth.selam@gmail.com/

 include/uapi/linux/nl80211-vnd-intel.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/nl80211-vnd-intel.h b/include/uapi/linux/nl80211-vnd-intel.h
index 79ccc9401d50..602862503c2a 100644
--- a/include/uapi/linux/nl80211-vnd-intel.h
+++ b/include/uapi/linux/nl80211-vnd-intel.h
@@ -37,7 +37,7 @@
  *	8) The CSME firmware grants ownership
  *	9) iwlmei tells iwlwifi to lift the RFKILL
  *	10) RFKILL OFF is reported to user space
- *	11) The host boots the device, loads the firwmare, and connects to a
+ *	11) The host boots the device, loads the firmware, and connects to a
  *	    specific BSSID without scanning including IP as fast as it can
  *	12) The host reports to the CSME firmware that there is a connection
  *	13) The TCP connection is preserved and the host has connectivity
