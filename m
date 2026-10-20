Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502679;
	b=bXe+PcagHhI3g02xxZmGio1Yenxz8S/HIzrlpfi6k4EhksRKdwLJUuAO29kGjsh9SHZK
	 vDAhosuFzNwDiW5sdtr7Eckx/1E8H4Vo/AedBBN2yrmDE9UvOG8aRb8dObuKo/5Tqgk9L
	 SrcPvZLt4s0N2+zEq6OQntPUR227rlNqmYVUkVzXTBBE2RWLXb4DYJeFhFSTFMzLCvhx+
	 LuacjCfSQJAYPcy2FyD/RdeWNg6cId6fmk24mFsIYQznRg0x9Nv6RzgtUxuW194vV9fMC
	 5u1BHvSoP0crKMYpci5mdK7d30FZqHUhFfyhT/jasoJe4y1YnkVu3quGTk/K5vdM1Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502679;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cbkSJksY8o+Ofg/AeXbkqolH52cZOpuyoJMWdVSYS2g=;
	b=KecL/rd9VoIuO8v0XNplbCH+qjxNXQ4UDvMdk4Ik2DDuzNPup6ZROtC+piVR7KMsPMkr
	 Ek4R9/3ah2iol5bYn6NKrko+ifA/UR+wIltrCC5NDS/MOpCQnqeboNUyWOBTKSjIWBclA
	 4EchoERxGp1X5ziKvDlYZHFJgHyWrQRY8vj04JNlABD8MWPqv31D3IHl6fp9gmRG6IKNL
	 Y8klhLhvfHwCI/6Hg2RYOG3nDBWilabIHhcG5ICjBEFonCBv2dWVN7rm+45c/daFkW5yV
	 RZnvTitpBErt5S7zdfHNK0KvTrXyFBgSLLr8P1OuZTvkiwoeSp8/4Pg9um5tLqL8smg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LM5bjUL3;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE2F60A2601
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:24:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBE2F60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LM5bjUL3
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a06b436dffso743478b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792502678; x=1793107478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cbkSJksY8o+Ofg/AeXbkqolH52cZOpuyoJMWdVSYS2g=;
        b=LM5bjUL3+mj3TL6zTzf0NObne+OV9vWzb6zKGJc8M5qxVHNdtxpFDxYVG2tm7XZ0l+
         frrrxmC3qwL/RNgt79tE+upVvNnNly2L/kiG30GEpdYfAVQv8hyyHbtMJC3CwVpQvMmP
         Cf4MTp7HwiMuP2tliuH3qIot5CeowmV8D1foCvDUcAUI/tm39YP9rubXYgwPnos4/odx
         O1C65UUAjcHY+DENihTLTlOEY+TBma6z94QNPmFUaxX87US8lQTidF3yJqrzaPgjHTo4
         6kTj9D/5Q3an7MC9qbBpo8toDPjp1GmQzgkSIXzEyH4j2rIRZ/LUcpsBRtdMVEcZeMcT
         H5Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792502678; x=1793107478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cbkSJksY8o+Ofg/AeXbkqolH52cZOpuyoJMWdVSYS2g=;
        b=iK8bBZiRixt04P6PfhQRIBPu4LEgNNr8LmO5fc2qw2sduu9pEO/GvMFHL7z1ePmycJ
         50Kx+ftN+PJlmS7Ybj2E61C/6UYerXT0SgHC1iAB5CluGYCL1OZBht3jVahBbTqjXWCT
         O32NioCov69c4gZzIMJid7TTwHIPaUqvqCb9GwB101lIHc2EZElhOHcFGyI8KAWNwqQe
         ifEmSr/zwAkqgjB2eS0imNvlxiQzE/xGofz3zrC0tHYPBjYVstlVe4QgaTYB7HjRxGCt
         AVU7IhBQxcF/mSlifays5lkB41dAo4K8YC5UEQyrDZCAK2vC2SC+yD80tJ8F4f3s83ez
         xrkQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhCxoHczp2WoOpAqtbwjsModSOcz8Awl2v2n0fRPljG0Tf6VPkjvWX2QUNNV5TJSk2ECbQFe1ZMKCmVE0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWHGlFt16dEjIFzSbuADCRq8YrAD6gMqR5X4YDEBYLqf7+NC0p
	qfkf8MP4LRhrGt1t6EZrMBd+rbMjoJMK0ilZ/vGirMwA0dCCN4C/ytlo
X-Gm-Gg: AYBFou13Zhez6fQ/UQsuy9SccrvRMqB1ByU5cZUD0uInI2Oxhf9F0wA41imPFxfSblz
	FUIwm2vc4yDC8oqibYne6hDtKK8WNYOUEx4TYoNZbrldh/vtAArrgBAEnd1JE0fIEg2fs+WadUj
	wly8rIpnEUJRhExcg006ILXkn3J03qDiYQ3RV26ktu+KfTzsxKqYO+93CL7cnEzUTyxrvJtedFh
	kiIqHXArC/FLrrH3y2kRR3lnhaf8PAcXCO/0CkeaekQ5C0f8qrmza6WB5BG1LHfUA3jm0ShyOJB
	3W0wrKu3MNRosrRDpcUO0elzrPs0hctt/HdyCPqB7yjAmKSmCBB1APK4QD3DjfR8U3XreGDAOVR
	ShCCKdfKiI2TwKJ1KMEDh2AeNPRhC+KZVQxd3r/NPIUVDGn4QpEU/T+rrCCsn+3HPfiCigM+rCh
	rVvj9QkOzdXKxz1+Y3smRvrKL70WMNPVe4hZiH4WZDMORomCBNe+5iCsaH9D/sg5CVn5apW3vI5
	RXSwErwYtu/glBjdeTvW6uv
X-Received: by 2002:a05:6a00:a8d:b0:899:53a9:1dd9 with SMTP id d2e1a72fcca58-8a04d34d8b6mr8875311b3a.57.1792502678125;
        Tue, 20 Oct 2026 06:24:38 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f56c8b931sm4779680b3a.9.2026.10.20.06.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:24:36 -0700 (PDT)
From: joonhoekim <26rote@gmail.com>
To: Vladyslav Tymoshchuk <tvlad744@gmail.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Joonhoe Kim <26rote@gmail.com>,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	lumag@kernel.org,
	johan@kernel.org,
	neil.armstrong@linaro.org,
	casey.connolly@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] usb: typec: ucsi: Schedule connector worker on freezable workqueue
Date: Tue, 20 Oct 2026 22:24:30 +0900
Message-ID: <20261020132432.998-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261018150136.5896-1-tvlad744@gmail.com>
References: <20250205-ucsi-schedule-conn-worker-on-freezable-wq-v1-1-107d1356b77b@linaro.org> <dp5ohy5piss7osycibuke7kwnfl5elnmc6gfvqgfh6mzzrldla@sru3ylzrtuea> <20261016125044.1085-1-26rote@gmail.com> <20261018150136.5896-1-tvlad744@gmail.com>
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

From: Joonhoe Kim <26rote@gmail.com>

On Sun, 18 Oct 2026 18:01:36 +0300, Vladyslav Tymoshchuk wrote:
> With the connector work on system_freezable_wq, both unplug runs
> resumed (2 of 2).

Thanks, Vladyslav. So the same connector work runs before the devices
it calls into have resumed, and breaks three different consumers: the
FSA4480 switch here, the PS8830 retimer in Abel's original report, and
the dwc3-qcom role notifier on your board.

Abel, the RFC has not moved since February 2025 and two more boards
now need it. Do you still plan to respin it? On Dmitry's question,
7d0767c5cd87 took the same approach for the altmode worker as a
stop-gap until the PMIC GLINK rework, which may help here too.

For the RFC as posted:

Tested-by: Joonhoe Kim <26rote@gmail.com> # Lenovo Legion Tab Y700 Gen 5 (SM8850)

Thanks,
Joonhoe Kim
