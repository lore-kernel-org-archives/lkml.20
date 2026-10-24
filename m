Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792841096;
	b=EfORYTwB7B8xPdIcUXy+cRZQ9LXnb3pUE4X/rsmj0PwXPP3F3Sy8Nqc6TAO9eJa1bB7A
	 zSTf9I4OdYeKLOa9xG9Sn/xahZRWrczL4E02rCIraxylc0pcwphgfCTy89FI/wKq9uG3J
	 tpNP0qBRAN6WHsN+HCWi0DMsVMkkL0DIULj7JOZzvu5C9ek9GRdMbraAnSydZVeNLuy12
	 XVqsumg6PXn0UDYssIIbZ+diy8X4eAamcZ1hKd09bH3ZbIcyVv9T4tllfoYwXWfuTvUXB
	 RMhTUrdP0LasVAPeGvehNvaIsX9CUt1cBIdDdsQJwXMfhPv425q/iVCj7bE9MEzCPFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792841096;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ta/hufzKWtQdh9GqXfEiUQG+bNrs7dxExPKRK806f+k=;
	b=yIDkf7GSTLpLVgef1uYnU0978RQ4NnS4R1zNzXAZMmQFO52tNrkVDEPlHowgPMJQM9U1
	 +6SuEdSPrJYYE+HCG1bbS3LMNssj9H+oQLPy6G+NhRGFg0Q8+4O1EZz0LBQVDpm73S483
	 tAkdeklU+fBgEHJJawhOp7/37aIPkKtqdBl4PBVxUO8o/8UalLCmr7dEaJyeYUctUIE0k
	 tvIHgZDXjOhVeEtkfDUoENs07l06Qbfcql7DTS9LsVUNax9RSs3yFyBWDv+EC4Xj5fJ+x
	 LSDQveIv/USNfCacZxEGjY+wOH955uTIRlr2e8tF66eu+vBRGSd13CCGq6N4+r+fZ1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Fv9jnZeB;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289D8606A32C
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 11:24:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 289D8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Fv9jnZeB
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8ac525c1f05so14161457b3.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 04:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792841095; x=1793445895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ta/hufzKWtQdh9GqXfEiUQG+bNrs7dxExPKRK806f+k=;
        b=Fv9jnZeBiFs2yn7IXMRDPyfXcDs1/S5gu2RQ/QFkjVKtDS/JN6ckELHI6s0qOfBUid
         KEGcLFDiCS2C1gip+EpNNTK1yDwCqmtYMhF4+k1Jo1N/U/qUExikrqiCjJBN1e4BkbWY
         q43+/ACdEV9E3h5Q1Fjmw5N5DUefSjmiBmV+BT+md2CuAIdydCdZq5eBC5lZlqb34+6t
         Hc05NUjT2TjAgPfplw34pbVoEsJEuwi4pp/WxPa4MMA9St+6+gCPh5rPEbl2FrpQ4uk5
         q6vuGKIi0FcNz5Pb/bd1oPjMt466qyaBLKoGqIibPoxCUqJ2+BjyXHPDHmz5Hp/uyDJM
         h8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792841095; x=1793445895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ta/hufzKWtQdh9GqXfEiUQG+bNrs7dxExPKRK806f+k=;
        b=hlBsBux49Yr4lA0FyhOd3dZQnOTk+VHJt/uO3sP2zk/yWRm/teHn6eLaPLU1Qhl2fv
         w58L7mM96KOmDvEEj5QInnGQ3kxRzuA8O0vCUm4atAKBv0u0gjplcdUgUZlAYLLaazJI
         skish23XYNL0CkS2+/xeCMKggC4v0gq0vPMPNNEG8alGaHIJ0TLEvzTDocjM/e/ZSQJ4
         d36aiOzW0WsX9e8Ll45ESUbOiDbh0BJEoc+ge3gEVhgqn0PhWyf3Ku7S6fEPrpznvRNo
         AdVAlIGIDLzvm10XJtFYXx69oJCnN35hW9EpYswR50+vTLLFxgq1Y0QpSESne3/A8Jpy
         xcVg==
X-Forwarded-Encrypted: i=1; AKwUvBxKb2//HwaytWdactTIUGRaiJGD2VlLAan4rWlv3gvneZTng9yIqPm+t5ny5n6mybXMZ8JfBvVfeesvGtc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFHUtZjJ39I9m7jekbJPJf8LK25oV6bp4Bp+zYPlwXnsuJZffi
	aLr9Sw+XiA0Eq19pFz878FtpoizgJ4qaVVBwPK/ogrBY9j0wvZi4ZsxU
X-Gm-Gg: AYBFou26noiMnnUsvbOAzm+uOX0yFC2kETA2+R/00X/95vq5ScO7QJqILBrrEfepj1Y
	tH+3HdD8yHhIkHnVF+ygWRgeRaf0vExBy3Cp131tIg/wYFahxdDWWcbDqgSoSQc1rzMkaaWooQZ
	dGpg+gUJO8BVgZlcDVsrXEJhDNShYJiH2w/oEj+5jspIw3t9kPyFPsX2wkVN5nG+xX3rI/PBxiM
	E8NdPn5ZmIaVBWMl56hgu/qvj0eRgT1J7Pfuak3aEPfPLo2Xh3u3Eetp7ogU4cBrfUOlgKTuogz
	HbOkqrnuP7oQi/s5seVka0Tem6ePi5AE7BZolN5kZJsLNEFNSQL0QknR2IDI4m7OA9urtgwMELH
	ljU8d9BZGL47vF8Yv58o14L02xJWJ9gSutFT5c6OZZMcrfkoy65fCXGc4XpcVvuA5UBiXz0sRfF
	nmQ7zREV9AvL1nOUO5rH1Bz3ia3V7QZOKTvijFDs3Mp9dAOqUWUQ3HjcJpGO+cBJNLeAjQhBopm
	KWfgFRyraUT0jIis6OhekmdQR7qCmWuZN7kDmIhOlCH6pkwZJa8JgLztEBKkgpjgo2a
X-Received: by 2002:a05:690c:c3c6:b0:873:5bb2:6c08 with SMTP id 00721157ae682-8b166c516dbmr10487707b3.50.1792841095062;
        Sat, 24 Oct 2026 04:24:55 -0700 (PDT)
Received: from WillzDenali.lan ([2600:1702:7a80:3c5e::dff])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a4626cbb4sm855725d50.16.2026.10.24.04.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 04:24:54 -0700 (PDT)
From: Brandon Williams <turbine.bmw@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-kernel@vger.kernel.org,
	Brandon Williams <turbine.bmw@gmail.com>
Subject: [PATCH 1/2] Bluetooth: SMP: ignore an all-zero IRK
Date: Sat, 24 Oct 2026 07:24:34 -0400
Message-ID: <20261024112435.247650-2-turbine.bmw@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261024112435.247650-1-turbine.bmw@gmail.com>
References: <20261024112435.247650-1-turbine.bmw@gmail.com>
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

An all-zero Identity Resolving Key "indicates that a device does not
have a valid resolvable private address" (Core Specification, Vol 3,
Part H, 3.6.4), and a controller given an all-zero peer IRK in its
resolving list accepts only the peer's identity address (Vol 6, Part B,
4.7).

smp_cmd_ident_addr_info() stores such a key like any other, and
hci_find_irk_by_rpa() then resolves addresses against it in the host.
As the key is known to everyone, any device can generate resolvable
private addresses that the host reports as the bonded peer.

Treat an all-zero IRK as if no identity key had been distributed: do
not store it, and keep the peer's other keys under its connection
address.

Assisted-by: LLM
Signed-off-by: Brandon Williams <turbine.bmw@gmail.com>
---
 net/bluetooth/smp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/net/bluetooth/smp.c b/net/bluetooth/smp.c
index 984b2d0b5e3e..fc75cf568471 100644
--- a/net/bluetooth/smp.c
+++ b/net/bluetooth/smp.c
@@ -2624,6 +2624,16 @@ static int smp_cmd_ident_addr_info(struct l2cap_conn *conn,
 		goto distribute;
 	}
 
+	/* An all-zero IRK means the peer has no resolvable private address
+	 * (Core Specification, Vol 3, Part H, 3.6.4). The key is known to
+	 * everyone, so storing it would let any device pose as this peer
+	 * with resolvable private addresses generated from it.
+	 */
+	if (!memchr_inv(smp->irk, 0, sizeof(smp->irk))) {
+		bt_dev_dbg(hcon->hdev, "ignoring all-zero IRK");
+		goto distribute;
+	}
+
 	bacpy(&smp->id_addr, &info->bdaddr);
 	smp->id_addr_type = info->addr_type;
 
-- 
2.56.0

