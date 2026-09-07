Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72569367282
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788755048; cv=none; b=MRvhoK176bBObfC0zBij9a+VUFR+WTvZoeKwyjL4QkFKwLhyolNA1kU4p6FGUgjpI7J8lQAF2Lrq2eaoi2Ne5IEhVNq0MKtfc68P2rAjTRNwTU5u3vwAl2i5LTC7bIz9IQawKpOIwqkDiP2f8iWUcwbTI/QDFoGKGh1cZ0UbBFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788755048; c=relaxed/simple;
	bh=R+A8dMaXFxdbcsFjBMtXwL5GweDtbHHod78ukPv4YNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ckB2hxLug3pgaXW0NMK4xRJzOx7/hORNPRN+2qEVYTfxQc1x+gVmU92j2NFQ4keQ9JRr6sk3D5cB9tByLjgUPYza2G3zxbdXrCcaPqNDPjmt/oVrhpVm8GGL3XCiPZJBGc7G38nBUF21QUjkZRH9139JipCqwOkoPdoTE7sfJ58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rurCVxe1; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rurCVxe1"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-863c229c3adso1056635b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788755047; x=1789359847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=14CJ4Tu5pYZe1H11+5RHeMosW5HNmPDGPE6+5ZHEgPc=;
        b=rurCVxe1xU+lcNIf7l0/zeivLEnlwnYh18w8Q/tan/i2Nq5m8xGOiU6eQP58Pcy8kz
         fHpQixz1aEQvys6eXMZq5bfaIEjPCzM5zaOj69047gKFW20QLVb0SF/ysSQkCHmmzhxE
         fqs5GkUNQz0yWyHV2t0RFaWr1QKlJdVrDPMyo7qYppBw8EFg8ufRAn+s5DVcG4CKKU/7
         o8ntPMDeLXUUiS7kReRwAJ/at3hF5Z0+IDuwZ+r389Z2a4hKLM3s7OD4b8p+gJNvUp9p
         FIWUYlQTTtarGOqkXE+kxan9eNHVnwYE+asVqx72lqqNCQQx1gPuqvogvretpAQV9AGy
         B0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788755047; x=1789359847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=14CJ4Tu5pYZe1H11+5RHeMosW5HNmPDGPE6+5ZHEgPc=;
        b=XXxKjJ1Y7R2SJwVucdLg2oCjg7MZQsavIfgxIHkBnN5AGSDGmu77iYZm9KQh06uU8G
         ZL8xF1KMRNq3ndWMRHDWDE3AOlOhQbihnyjjo8Tt0n9czz1NDQhNAHRZYjlHBrq1x+DS
         f+mvqMgc9gOuFKSZp8TSylviVML4Kmqxg3JwxlGIp6qf5qakp85sCrXLVyfKXawW5gQB
         rGoxHsyeSgs2VlepDYSgtpMy8Row+saKdYLMryPs0cf9oIo5KEQkPcPZC1F5rvSotQG9
         FrWO2EDZD4UkJqreVYUtqzV0vza0wLR3Z+kWW72vi17Jyzv7rq+EAOC+dVS8iXd6RHA1
         rcDw==
X-Gm-Message-State: AFuF++mbEULAUzzV9/7evt+QNbcbmAKQNalE1+RO7Ri5nH8Vy8b7nLpo
	D1xMOHreJVoTLhJgX1PmSU4RwSUAblfqZNiW0IZRZbMsSD0YRKIYyVeE
X-Gm-Gg: AYBFou2K+LjDtPNQW6agjo6IvGcHvTTK08X8xY51WwtkUfvcqDR+65Ts+fEu5ToWIvu
	dOAAuATzslNr9T2U69DDgRzb+LCq28wMp978LleC/YuWOZra9+i8d5kEzdWyX9neKVgRi2XkKCb
	Kja+w8syGOWnYLBZhMECb/WUIdxzOK05JlY3TWI53G+zRREV87Yh/suJL6D+jQhBexzrY9Aq9oC
	3a0mbkZeKjYWfcIrLXfBMNVWTDY1UEGazel9ZwBGAiE1InhUJNuD6coH+VXZJq93DMpU7z0z7x3
	D9cdqYVOqJ8Knl/TKRmb5W81t2BlF5rlfwsc5LYJK7yc/yeqSmy1W0wh4ImtdCoD/cRvrcel+5N
	263PdlfU4yqL0aPGZmm4o1stzNzFyNVjh6iohqMzHGfY5s3XazReeiphxW0Edr+lD2tgV5UUfGk
	/z6f69516W4Slwr3tE3jzcpSdxgLH0XG6SQ8pBAlwavoLFoK9jNYYcSHfndpzwjaKAxeIt1zaoO
	AuCUhPOrkTIMw==
X-Received: by 2002:a05:6a21:3117:b0:3cd:61d5:f342 with SMTP id adf61e73a8af0-3da39d147b5mr32361470637.9.1788755046721;
        Sun, 06 Sep 2026 21:24:06 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3342af0bc08sm22629643eec.17.2026.09.06.21.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:24:06 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Phillip Lougher <phillip@squashfs.org.uk>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] treewide: fix repeated words in comments
Date: Mon,  7 Sep 2026 09:53:57 +0530
Message-ID: <20260907042402.12893-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904104639.21537-3-hemanth.selam@gmail.com>
References: <20260904104639.21537-3-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please drop the include/uapi/linux/um_timetravel.h hunk of this patch; it
is wrong.

  "the calender broadcast the message to all components, and if a
   component receives it it should act based on it"

The two "it"s sit on either side of a clause boundary - "if a component
receives it" then "it should act".  Both are needed.

I can resend the remainder of the patch without that hunk if it is still
of interest.
