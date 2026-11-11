Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434493;
	b=poDHSFBqQapLdlEhzI0DMQjt6anDInWnzjj6XoWRJHTVFDiZM0Yv27/IcKUYdjpzsvtS
	 wFCvJNbNAtSnOZtVgn2QYqlyVpY6K9y2QfoMq8rholnrwl+3lqEvvZg1ZB+AvbcWmKvfh
	 u1gqLLBY8KCCuWLWjCrh/t3SkeBRrbFh7Op4qdzhw8w0m7uM2OTom6nnvzdM1naGb1hRM
	 bMihg6FJTh1fDTyPThvekzOR65xUxD8W0/XUewM+qZIolSEumAdBkRQ+xBFnAP2wYSjkC
	 DnshlHw2b92pJfP8UTwzEqhvdtrS20WwpOn527STA5FMnC98No8lDfReUO4Q0hkMcMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=al3+UYGejhM2clXNJw1k1TrZPOssla3woPAY3sl2LlI=;
	b=hdzAgWenKTiKh546q3FRYcaIWN9jUw0SNdL4oT3NYNWjrNymfFFh/k9EfAeRLowIoFxW
	 3yWio5xyabu8R8InG1IPR6QVh+wDfyVsYUlLQUMWnPOmj643J2PGu+lapckZxm3H7s8dT
	 aY4bXcfrODQi7oqWkis8DeYhaCn5w7Hsmr6iPLMacBcOFgHGRgE6/azMHYTQqzHg9vt7I
	 77nXChaifS/URt1dsV9mwWQSZy7ysFa3Pst+uSfa4FTqNqAKCDRdq3TOd9kTxQufEjadp
	 tNFv/yg1um6mjbWnCQa4YwoagCZYkAfrh1er+C8xO5/gKdmPljfDc4lK6GBUVmgPGZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FvCf6kmj;
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE294606A88F
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:01:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE294606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FvCf6kmj
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5eac6c5f927so1450914e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434491; x=1795039291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=al3+UYGejhM2clXNJw1k1TrZPOssla3woPAY3sl2LlI=;
        b=FvCf6kmjezTgywV1J/MpmyaJ0lph3+ifxVPpAHHYyNcJkY9STu+SFeQwZPFlVBwSFV
         9LR5av1bk5YMGmg23GGES6gyyBAbf8LZIkAdaUsYycg8aP+6zXi8cZXOZo1sA4R6VoMB
         jqFOmfqO5ZxFb9UAy5fP+z+EBepFtJytpKBYPZxuoAl25Ln6ZlTpFYI1ug8O9/4FiKcw
         J9iKnJfJnfnTG4jNRLNR1Ic8hyfOSbhITcA+6QogW5QsXvu6wQsAEk9D5wvskyfJMyE3
         DTFqIAuyJRYcpIZOa9fwWo1ZcSRGPNmNgVIIScDXV11YoSTU0P74v7OUuIGfDbgO0L0x
         1Vfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434491; x=1795039291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=al3+UYGejhM2clXNJw1k1TrZPOssla3woPAY3sl2LlI=;
        b=J2RmafHJtd5L1AouVZDdLvW8oTIJ5z+0cXg5uQ6nnAHERNj7Se7Sh0KiAxxI1jaVhg
         RA4HjYA7Mo6JwqUf0HMxpkFCy2fbxkDH9pU5+3coDS9JzItgpNDnoUCIBafOlSbUbZBv
         URAB9EZEJwL4ldn+wo6zZit+cL55bJbm+7KDhy+56Flg+vn/IQsZPZmF88/bCzynkFsd
         aIp0JlE3tdJCFYEQY5A7UQoM9Ioh309iGRupydD21RP0VF0B71hS9mpo1Nq1zSG55cTV
         U1PqisOlla0rf1klDVoj9iRJVz5TOhLhuNUz+zVmwkQAHQu2B9ENWrDedG2CVoGSU203
         9pRw==
X-Forwarded-Encrypted: i=1; AL+hErHmD3OkZ0XCUaan0rKPGVMSLKfu4bNLBTV7HMB30iHjS7j1XiJrO/zEKNxgVzZYAd3XEnIhAFenwcxBTyg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PalPSnWSpoMYWxD/ge9hamROV6c6Agv+cvUfYvqpzAKyvUNy/
	Kn2NKGwWKbf35oKRSy0fhpFCtew8KlRi/a7rHYq+UnIIzIYVcMRP4rc=
X-Gm-Gg: AYBFou3Ufrt+ZjqD7z2Lhj/JxRzAt1VQaacvIQ1muqvagP5ullWM6dYz2etUJrVQrEK
	LuBvMIdTEpHE5EScE5a8ijOKP7cKtfo7Ce7hwmf3qgZha0SROUlK0sregtLtsADWjN5XO6ycYxU
	gYwvcr+p5P1jEjAQQ7xv/2DBcz2l/6vCzf82xZuaL5dz7W/3KBAx34Qjj9DapQgkfvxIC6RKuz2
	nQuk8NKN7claas64Sp4XKUiGQ4XM6atHjaysstcy5zvQFFvAxngsH15Gt7PfmkqlzpfLrF2EmJu
	AuT6J2vd6Tbcp269ETubXRzePT163fdpnWwCTPUu92xSx1FbpTN+wLq1EtDuJRwv52xGa8EZRwO
	c7GTLCopsdFp7GhOLAu012mEgn+EuiisgRYqDn3umFiV6Ty5gB6PDeAJOyt4CollALpwlyINnOc
	Uctb/wyRTFDfhI2MclOR8snjCTpdtcLKgzdiunE2WRMEgGDTtnjG+/j9cqsscadWLXrQxCVQmWd
	5RdznCjEYliV/acuHztc9WH4lNZcAXSoFTfz+omwvoXiuhc/olH5RUBi0O4Not3bc19faccUZH+
	OjpGHaxe5YA2kw0iYHpHTU00ki94
X-Received: by 2002:a05:6122:130f:b0:5ea:c6c1:8dd4 with SMTP id 71dfb90a1353d-5ee1c3e700dmr1467380e0c.5.1794434491451;
        Wed, 11 Nov 2026 14:01:31 -0800 (PST)
Received: from Ixchel.lan ([70.49.63.180])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c1fffe63asm4557992241.4.2026.11.11.14.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:01:31 -0800 (PST)
From: Vlad Banea <montrealtango@gmail.com>
To: netdev@vger.kernel.org
Cc: hkallweit1@gmail.com,
	javen_xu@realsil.com.cn,
	nic_swsd@realtek.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org
Subject: [RFC net-next 0/5] r8169: RSS for the RTL8125B
Date: Wed, 11 Nov 2026 17:01:09 -0500
Message-ID: <20261111220114.3863505-1-montrealtango@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Enable RSS on the RTL8125B (RTL_GIGA_MAC_VER_63) using the vector-map
interrupt model and multi-queue support added for the RTL8127A.

Patch 1 fixes a race in the vector-map TX path: the TX interrupt can
arrive before the descriptor write-back is visible, so the end of a
burst stays unreaped until BQL stops the queue and the watchdog fires.
The fix copies Realtek's driver: read a register and look at the
descriptor again. I don't know whether the register read is needed or a
short delay would do; I followed the vendor. The vendor driver does the
same on the RX path, but I could not reproduce a stranded RX descriptor,
so I left RX out.

I found the race on the RTL8125B with this series and have no RTL8127A
to test. Javen, is the RTL8127A affected? If so, I will send patch 1 to
net separately.

Patches 2-3 make the vector layout, the RSS hash types and the RX
descriptor type per chip, with no functional change. Patch 4 adds the
32-byte "type 3" RX descriptor that the RTL8125B needs for RSS. Patch 5
enables four RSS queues on the RTL8125B.

Thanks to Javen Xu for confirming the RTL8125B's vector layout and
descriptor requirements.

Tested with two RTL8125B on x86_64 (KVM, VFIO passthrough) and RISC-V
(SpacemiT K1): traffic spreads over four RX queues and link changes
arrive on vector 21; x86_64 runs at line rate both ways. Confirmed that
without patch 1, we get TX timeouts with bursty TCP traffic, and no
timeouts with the patch.

Open question: the RTL8125B can stop receiving when its RX ring runs
dry, until RxOverflow is cleared in IntrStatus ("r8169: enable the
RxOverflow interrupt again"). The vector-map handler never touches
IntrStatus. I could not run the ring dry in testing; does this mode need
the same handling?

Vlad Banea (5):
  r8169: recheck the TX descriptor after a vector-map interrupt
  r8169: describe the vector-map interrupt layout per chip
  r8169: make the RSS hash types and descriptor type per chip
  r8169: add the type 3 RX descriptor
  r8169: enable RSS on the RTL8125B

 drivers/net/ethernet/realtek/r8169_main.c | 309 +++++++++++++++++-----
 1 file changed, 241 insertions(+), 68 deletions(-)


base-commit: 368fbf5d82da9ebce309449c74fc0b128f7d0219
-- 
2.53.0

