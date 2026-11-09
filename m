Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794191223;
	b=gMaq9oAup2CO6IXvqv53qeRsk7V4UzTINUwRfScwwERfpaZEsm726NqB3MvF5G/ZVZ8p
	 iKXYKtxsP9s0r57Jdn7X2DpRXlrC5rMhBFwgW3ROsHLG59XtP9gNKDpGZyi6O/SDeAZOQ
	 a6icDh5M62CacQ0QMwoz3Qj5AFRMdmHcws0PgRy/AhmNJQmvjLv7MKKMvvG579BEIawFV
	 N3DgaCffwlph7FStA+Kba6AvIQXZoD1Zm9g70wrPKe8kEwSHJe7eF6dV5VlUouui/Hsg5
	 t2HCw5V2Z/2v6gkH1yZ91ytG3PQ0bkF07MB4QMPCfxvzoHmIEdiJEEW+Nl/2mqcvxUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794191223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DPGG++B01JHhD8ZJ8R5bYfPhVoS1brSducvhOfg3asE=;
	b=FgqY9kNlpbc7b73Tl2lIKTe3Dy7pdGcKfDqZT5uGHyT4bPP6jjOsHO+eUaxSR8CkMxCS
	 ykIK5UFSCppM+Z2m85AJTAOd7Ry9H3AhkN42G0lz6HPH8QOpj6EDYmKeUCpMqlu9TJSe0
	 WEMDCMbpzqrMFDEbwq7ZShbL152ffYvhAIfc6sizmJeIs+s1oOpRpokloLwlX6L0qmE2j
	 f9rCA7IsTX8LqIhrG7exktMJPzPmlzFO4HbROdWNQUhSjjxNB52FCPZQVv76Ab+Obc8yX
	 r0o8U6hmAW/qdhuugfXwSlmoz8FHgMRe7SzJ5iIasQ2jGZ3WPXorIThRB1zupH8U01A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wb03vt6v;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26B0606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 02:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B26B0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wb03vt6v
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e98798cbddso1357725ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 18:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794191222; x=1794796022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DPGG++B01JHhD8ZJ8R5bYfPhVoS1brSducvhOfg3asE=;
        b=wb03vt6v9/zSXNGh33lTgXVSa/bBYhlDP18nFDdTxm+MMZsqID0fsKjSZZiXB5S4hT
         ZJhH3yaIBXjtW43Q3XL9QiS4gmp3CNEX/zSxzfHJ5CaH2RcoyZXoNId8HTk8KVs4WHXS
         vBHNFcBjv3Pp8vLZdQlUOjk8gD1IRV7Bn2fKGjpyOiPqWxZ4HK7tMpI872Uy2Qh5qfGd
         Suii904EqKiPJvjoIDSO0GZoNFJC9wWkLf5Vej8/X6TMjtiODNe9qH1TiQNdwmRfhgLr
         I4Cn/fQvnQIK0NE8agfentBQxxty3bgdbSMMQ9ZfxpUKYh+VLfYBydBhU+fBTk1STPoZ
         SRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794191222; x=1794796022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DPGG++B01JHhD8ZJ8R5bYfPhVoS1brSducvhOfg3asE=;
        b=uazucCGLI2AG19rt91xmURMnkeBbiCjp1OS91kSAcynPE5hya+eD9jC3FFyMvbF1Fm
         j2XEuorA26Rv7rQBQHBelTYkufCv4ODYwcXOwYCwDWvuTIDkUjTZyf1ZysUvpKQtnFzr
         IYG8jPS34O2DA06/+n5So/3v1VB1OXeAKFd6EZhW2/5ScdYRq3DMWejgcvUNulpttiuI
         cIozDMxWyEcj1DQJmkHei+1nTOncAl70t3U+bTfSL41h4enjLRMgfrySQYHrWriJAIzZ
         QSRE70jJ/djQm4SVKsu/j0pzJRe441nL5kkEIhwSLmbBuzQNGgVTtNqvBHsmB1T1uGFl
         KYCQ==
X-Gm-Message-State: APuU4Z+t2MQ32NrilYtcGYGklTERwhizL+QTk5ay8+XGxAoJjWgpJWar
	Wo+ILashvNf/blkqffLFv/CIOpshPai04lr+vecJHf2xsyna/RQLM6VH
X-Gm-Gg: AYBFou3Q5PLq3SOSu9vWu9qUL/1OH6KAm0AH8YzM5pbf6+WdQJK8XXS+ADoF7osSZGo
	tNLg7CLHQLiX229hpAb/d+YD+yXspwgHapZ7CiUHnZ8bPmKRMppwRwkSvIgTD8Ecg1jyBOIAGcK
	NqSRNjVOY6jdqueCJusZAGU0tcnJQJtKunC+mZ3w7RIxqpBCbFyYI7TCkFICWfhHHXoIOo2KaHs
	L+jNTftG3F/lFwKjwUFedNaKl6VBL1WhAHyqtSMGx884ZJNzSFy/gFZMssSFKF3pGl1wYRfDLbr
	Lv4U8qZEyOe1ZmYMaER4IOVH8+Q3FlhLXX6PrFVlfDZ3zxnxv/CTPx1G5eEPJOcfoVNY0/OOSgj
	gNwTDIRyOA0ICeaZ05U1Anv3x8708qajh54It4jf8EnesWISf57O0kv8ePclF12Bh+5ksptSnG/
	0MHRl4qpJHT0fIX2z5RJ6PvwaGHUMN+EAnExPUJD+yBteFrZwN4mKryPsSQ5UsJLeMicshBLLKk
	Y0ZlHzSg9d+EgNC2JDnxQLWlc4pN/aPktfTjh7ruJmTUQaeibZVUniHczwVFafPMEXib2L7GKcw
	FM3d8kb04N8MqJlhi44ixOK/jXRTVZBrqw==
X-Received: by 2002:a17:902:ea04:b0:2e9:5175:2eb with SMTP id d9443c01a7336-2ed833c440dmr28589585ad.1.1794191222067;
        Sun, 08 Nov 2026 18:27:02 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81708c11sm7011065ad.41.2026.11.08.18.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 18:27:01 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: ben.horgan@arm.com,
	james.morse@arm.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com
Subject: Re: arm_mpam: selecting hard or soft MBW_MAX limits
Date: Mon,  9 Nov 2026 10:26:57 +0800
Message-Id: <20261109022657.2828471-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cb37c75b-51eb-48de-b254-0c495f3c543b@arm.com>
References: <cb37c75b-51eb-48de-b254-0c495f3c543b@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ben,

Thanks for the clarification ~

Good to know there is already a plan and that Fenghua is working on it
- I will follow that thread.

Thanks,
Ping
