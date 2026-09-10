Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD38481AB5
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789065198; cv=none; b=BlhaRIiW+DYtK6d/TkO5KRHIwYs3QuIZON00D/NM0EH79B9b43/EE5zsqhXmKvJgOFQD/XHBlAiRRNKYc/d1J01b2TrvOe1oIDaTozHeQqB20vXuzBgGhcJNFf56rwzq/h4+jAu2SEnVXQv3n0Isgbdd87waFjX6jApbRrkcmZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789065198; c=relaxed/simple;
	bh=RD1JdQ4ANBusO8i4TEYoR0PsbDDRPyuOySGPUMHj/vI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KyRXGWD/sJQKTUXqcOtG7sCdTo55K512LFt2jHUe3u274mVGoirBkCC/6g+XRnn4SFIzQNIGAoFCscy8x3qpGkgHd60MCc3aM9WRLi6TeBvnVKhFOPOop6IjN6e4oRC5DrtMkS9lZdxSTPA+/csuQY1pjfogXhwWMrPE6uoaR6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1Jx7X37; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1Jx7X37"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso1708685e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789065191; x=1789669991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ECgfRQeUaZbHy1kJ8X3Qsii4ER4T141Iol6nIkF+8Yw=;
        b=Q1Jx7X37Ig+1J87o6B75Yql4oeZGe7GkfdAnU/jksSLVaZdM3x3vpp9kjJpnl6Wp4V
         z0F64f25ml8uXauMEHFFct8kDI0SC43qpIbIsCPzJ0qhd9quzgIrVHRk+kzQhy4Awjfx
         WGrABtDx0FcDybuoY5GM0IgGgCmmFzBS7JL8WReRVS0YFuAs9oJjTRrYzvjgCviM6Voc
         R/+z/DJenTK3jGooc4GHc3XBlbMoMusP0VMsXHGynjP1+2rfBIwCiWnPC/EuEBixbNKD
         2DmKXZH6zwugswms7jXUHU/4Dlr5eqzypwCym2cDe6AIDssb5UM1uW8T3xjfCP4Grtt/
         Ldog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789065191; x=1789669991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ECgfRQeUaZbHy1kJ8X3Qsii4ER4T141Iol6nIkF+8Yw=;
        b=BK8hDilQlq53UOXZkTNnwPT9cWojXvJ9riLQEtxg+cWwKUbP9PcjRsw0IgK2CWfJu8
         Aa7uMomDwgCZZkUrg3OfTlYagGXSAuwjgRefUoCcmz1YiTfRpVzGjP8+WbfLvUuR8nnz
         oqmlZ+G4VtKj97oZKwhA3hf1AuwHKlqTu0JVTxtJCxrCbT9JgL8h/Ydy0zXW2d8d8NJr
         HGJ8P1AA8Wtx27Ag9S15gOJl81/SZP/9mn2kTbjmt5RnDLWHYOD6y8+Agopc8YFXLCrb
         aCkLNol9fun0B3qCExBCHJ3Yph5VXRBvaaxheG2XmrdTzKmCxfUle7IqkbbrZA7526AR
         0NxA==
X-Forwarded-Encrypted: i=1; AKwUvByQ68bpeo7Nm85yoddTjtA8XhMOabhC72XHMN3TxezmRxzBb5WGCIHdd+p5EHyI1l1QDKWIIHuqS9ddsdw=@vger.kernel.org
X-Gm-Message-State: AFuF++l0cSPGFtqhLyAwpIikb/B2y+Oz4ZbB9db53k65IdzBw5cNTdlL
	R1ssPpjUqlaqV4qY4SXoM8AeSphaLbE0lB29gaWc/Gr1JE6xKXdzuEnq
X-Gm-Gg: AYBFou2DWYNa3s2F4Y/FBaUUeo1gqJSE4h0fqIq/1670jtg4sCmKaf7ne7ui2XeOLB0
	THRXFsEAdsGKeMMTUGnX7xdPzlg7dI4hTXakeX7QL1EOoLaeX2XRc2mIZC/w6j+IL73tTqkAiqd
	enLldJyckMSXcspcdBlWoo0IIGVlhFvyAcxMQeN0/I7crrrIn9+UTLU9QeZM8pdfR8gmZPCKOYp
	yNb1SzaA0k+fW2mZw+51DDASxOrYnGkIqMy9Y0ern/K/t08NE7CuSjPU6N5CRNQdCzp0hILxRCP
	sK8eTOlEekcjpzMAPtPXUWrdDFS1euBGS4vt2yfAMGvn8bQXSockM2y3zE9zL33C6IngfH6Ofjd
	BuXo3rAcW1awOKUevmh/AfTEekFl+7YgyuFZz2Hu4FzcBUlV/yRedvB54T6hGSv2n6aW5BN59R9
	mUJNZoEGxwZ7uvn2q/HZyyaIaCF84rjEm3z3RzOfqvkgPbbvFTkdGIyvxo6atvrI55l9r1vBURo
	kAERq1hjUZHPY1ujQXpO8Eio/7uFqU8VHBt9WZBoOi6nnKTkpDVr1mAIGNcX91WxJT29H0H5cN9
	ILf/HEeTuq0=
X-Received: by 2002:a05:600d:4453:20b0:49c:fed6:cd3f with SMTP id 5b1f17b1804b1-49e619c4d59mr2746015e9.23.1789065190532;
        Thu, 10 Sep 2026 11:33:10 -0700 (PDT)
Received: from localhost.localdomain ([41.90.145.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ac42b9sm12541115e9.6.2026.09.10.11.33.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 11:33:10 -0700 (PDT)
From: Kenneth Kabogo <kennethkabogo2@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: qcom_pd_mapper: SERVREG_LOC request handlers do not validate the QMI sender
Date: Thu, 10 Sep 2026 21:33:04 +0300
Message-ID: <20260910183304.76926-1-kennethkabogo2@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Flagging a hardening gap in the in-kernel protection-domain mapper, found
by code inspection (no proof-of-concept, and I don't have the hardware to
test on at runtime).

qcom_pdm_get_domain_list() and qcom_pdm_pfr() are the two QMI_REQUEST
handlers for the SERVREG_LOC service this driver registers. Neither
validates the sender address (struct sockaddr_qrtr *sq); it is used only
to address the response.

  - qcom_pdm_get_domain_list(): any local sender that can reach the qrtr
    socket can enumerate the registered protection-domain / service list
    for any service name.

  - qcom_pdm_pfr(): any such sender can submit a restart/crash report
    with attacker-controlled service and reason strings. The handler logs
    them via pr_warn_ratelimited() and acks QMI_RESULT_SUCCESS_V01. There
    is no check that the sender owns the domain it is reporting on, and no
    recovery action is taken, so the practical effect is an
    attacker-influenced ratelimited kernel log line.

Impact is low. On Android the qrtr socket is not reachable by untrusted
apps (SELinux neverallow on qipcrtr_socket), so this is gated to
privileged system components, and there is no memory-safety issue. But a
PFR report in particular seems like it should only be accepted from the
entity managing the domain being reported.

Two questions:

  1. Is get_domain_list intended to be an open lookup service for any
     local client, or should it be restricted? If restricted, on what
     basis?

  2. For pfr, would you take a patch that rejects reports for domains the
     sender does not provide (or checks the sender against the registered
     owner of the reported domain)?

Happy to send patches once the intended trust model is clear.

Thanks,
Kenneth Kabogo
