Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793540135;
	b=gM4VuN9pl3cSFN26ga4QXw+hQK0R4YBpJp8DMF2ldepRp40Iv9nzeGlEfFbZ6AESfgJB
	 iApk4cxKRUg/h6qYE9sRCxM/VfFYu0F/G6u3xliKIhhQbVI7UT5b5CmjevjdiK9NUQN3u
	 JY5bDd1Plo+XLk9ww07SHm9460jmZM+tLcdFL54IbRZlmsb6pZMcclcrGNa0SVlqklgGl
	 ENZJLLvNiNGiGlTk+RIiG0JPM52yO2Esnw2vYcRGPtlf1d+wEvpRKzV9xrmwz7gduPHdg
	 wOSDD5ebRXRs7DdQUL8JiwRDBAPvsxnd8QwUs6etqQf1GwBan2Ct7TXUR5iB0JzObUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793540135;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=2j0aw3/fwYjSaUMy9PnObd47hX5Q/nwFx1rM+QDf2+8=;
	b=HxlGi1woyc7+wfFALHerxuKdSsxf6qMYJAGqJvjjGw0KBAgp1Du98d5hkNGYXmSHcg89
	 tBZrQHIChiCdquwbYtsKWvtIUhHJWgQsnOnIfYSJbSwJL4W81UvdmILQDgZP1WT+uGsp2
	 QCznegb1Tr8OnZWRvKG0lAvPPmqO9HxuXN/YXknmoby59sazdgU7hxtJCS4RJyEJUL/9z
	 c1x0Ohtwc9s6nk1S5IX65aJNVigaZKHK0idlxAO4iIifCfmQVPZdI0Q38dz22HZbfE0Pg
	 COGipM3I9W7SV+td7yW2E9ViT4+prYksYNZkUV6w6uG4Bd4N7tBvl8uN926ZLSzXNAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JCYwvM+A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A036606A32F;
	Sun,  1 Nov 2026 13:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JCYwvM+A
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793540135;
	b=g+N8uNK4pW2uEsDKruX9CgdrnilbDpfUYvqNDEnjh1NKcCsMHUn5k0x85H1bovMW+sX7
	 EbrmfAI7+fK1VMwoaD5/HHwXR8c2qh6LlvYR2tMMEQjsT+lCShnV7gQZuLKV0+rejv75l
	 /drE90Z8dcTL3MrKOWI/D2qcrB0+0/MyRzmNXE8PPOr37+IqphmA9NQPXQNPF6tbtUN8O
	 WQKbEx4IAgdlwLbpA8X0EFKDeRzK7oWXr34cUDBPPUfxKaOMXdZMgM7Ht5Ws1HDSR0Xqu
	 10/nBIdQjWZ6ZSDk/xIzTvLTg0QEg8Kn2xNDNarqNKBke6/imVrdzIo1HUXOMHZ6Qeg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793540135;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=2j0aw3/fwYjSaUMy9PnObd47hX5Q/nwFx1rM+QDf2+8=;
	b=mRtji1W0ELRncsyerfOhI0KlgdcmUhGwcMNzwILxhNhywD+8eA6qEPrCpBqaF7geM0zc
	 m0a5Kx9uyVbF3klrAT+FXgGk5tyC9EmOVAIqtEZWQRyrEKQcXM3sMLA7lOLcEWzZPzdEZ
	 q8vtjnK+JgHurq5aJxlaVuIzqngngdBYJ94AuClQcMpV1/YSoA9n4/hiB1usNc7CyV97X
	 nR6oNw46q4a/SLeJhUhnMX1gNQpPzOctJJ3sNLC2mxZDZmFkJ2gdCZgMfB33RuW2eLVL9
	 llBlvz9pPsE47mo3kD6/z8tdptw/saeuU+MWYCBYsUXWcv/ubI6w7mHp1tYiANLYiSg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8ECA51F000C1;
	Sun,  1 Nov 2026 13:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793540135;
	bh=2j0aw3/fwYjSaUMy9PnObd47hX5Q/nwFx1rM+QDf2+8=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=JCYwvM+AD0MYSuKs1MXKPTSh7etkftipl4iZ4IRRh1sIoUTpk9teFcPWj/3hBQz6j
	 bSZNTCuNT+6nVESMe1stUW0mlPyYhQi9tsg14znp8R3IQvrZ1BIPFKzHtXd3cNCZ32
	 glBrj4uz8kKoIJxsW6ncnGEuJM/mvhHD/dsSWRBgd2XlB8g23v0l5lxvFmW/8dBY86
	 hVxMrwAcqmDNQysG87pmcg+y5vGivhGkor9MfoceSI6UI/s2vRk4+uaSDyh8AG69bc
	 m1MV5N2Ga0TgBQHqcjvnsw0HM6PLKf2hv6JM6CBGfAobixRK9c7fTO7GCQuwb0LiqD
	 bJ12VT6/DAl1A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E1CF84617F;
	Sun,  1 Nov 2026 13:35:32 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Subject: [PATCH 0/2] riscv: dts: sifive: Add the missing FU740 CLINT
Date: Sun, 01 Nov 2026 21:35:30 +0800
Message-Id: <20261101-b4-sifive-fu740-clint-v1-0-b4821199a733@iscas.ac.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACNA52oC/x3MwQrCMAyA4VcZORtoarHOV5EdZk00IJ00WxHK3
 n3F43f4/wbGRdngNjQoXNV0yR10GiC95/xi1Gc3eOcvRI7wEdBUtDLKFoPD9NG8Yhqj52uQM0W
 C3n4Li/7+3/u07wddh7XwZwAAAA==
X-Change-ID: 20261101-b4-sifive-fu740-clint-c972e84f3171
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
 Conor Dooley <conor@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Yao Zi <me@ziyao.cc>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Han Gao <rabenda.cn@gmail.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793540132; l=659;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=zbiSOQWLdGE5tt0JW6MLdKrOIrFoJPTWAw/TL/wVUds=;
 b=HiUmzTmHTD+hCzm1soKt+gVyAuz6OzLSGaBME2Y8KVey3oK63FqARxKpGB4WVNO4kQgONpIw/
 g6yZvvpQZPXAnV4tdPN6zzPRMc/F2GB0hcJjkJ6stm1a9txHQFvLPij
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Reply-To: gaohan@iscas.ac.cn

coreboot and U-Boot already describe the FU740 CLINT for OpenSBI.
Add the missing node to the Linux device tree and document its
compatible.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
Han Gao (2):
      dt-bindings: timer: add the FU740 CLINT
      riscv: dts: sifive: describe the FU740 CLINT

 Documentation/devicetree/bindings/timer/sifive,clint.yaml |  1 +
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi                | 11 +++++++++++
 2 files changed, 12 insertions(+)
---
base-commit: cbbddb6b08cc9900a87cccaa9b22bbe06aa4f50a
change-id: 20261101-b4-sifive-fu740-clint-c972e84f3171

Best regards,
-- 
Han Gao <gaohan@iscas.ac.cn>


