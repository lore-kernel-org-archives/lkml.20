Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793645724;
	b=IPHwYeTZ9krdqki04kLYAp3sjEhRPwGTUrGYQXfuXkerQeEfdSILVVML80c/1djC1TTv
	 i8j8208Jeia2oUUEyRwTLxZzM3KRG5qh8gPe29b0rBmPu5E2H5aZcntjuR27ZDg333wSF
	 2KJFzNyR9yDDyCBZR3dOt4QfbyZcjlcC4zek65a9/Qr749Hv15eHanT9pW2mKLsKIoU0A
	 4cYEtaNHFMWSctCkP7/s2ghZ5SO0CEDK9zbClwpVCaCfcxpzeYNeRFfMt80qWL0pcecdk
	 +lmfNpL+mMNiBt6A1UPcVqIrcyx8/GoWlJtwXJPAFIa9FpoOSwYphqLdqA0+Dcv0IcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793645724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=tcBT7ZPA2W86pDvxdZgmP1F0AEFBUNIV5Xup6eF+HXE=;
	b=lovnFy/QBKvR5+nCxiptBWkTFl+j+p1kJ/4KqN7qvQsI7EAZ9Ry0ycrCQhj3GjB/Q2np
	 y6xf+SgaQgv9+XUUMFtQzLjq3sSegpGJfVh7zGodGFflJjI/uSY/iDWY+RrD32IoTmDxX
	 FRn1mbldKHN2Zp902Y3QYeAsjoUX3xGPUINIppDRSc7HlCCg7V5TOUKgl4h2UjAVRjQAB
	 HG6dSuUnjnmE3VPVKXjmx33hvCmf9Ysyw7noxaIOXZruZ3ajJVIGUniLfH/Tlj6kP5vLE
	 0Vl0MHI1LSVVB8XdTW/awk1Scl90G9bDuw73X6IEpdroEnPhvHEupNgOE4LY3pfIACg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iJI+zAaK;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDCD606D810
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 18:55:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBDCD606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iJI+zAaK
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso33964635e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793645722; x=1794250522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tcBT7ZPA2W86pDvxdZgmP1F0AEFBUNIV5Xup6eF+HXE=;
        b=iJI+zAaKhU+CrvqaHHMRjHGBbeC1FfSyn+BZbCBk05LHQEXJOSPQgobOc25w32FWoU
         dmhrDemPksBrVHUugONddhyKNor/Qo3yLRyguW66pbN1mgxFxsR31BSx4vHPNaVYgcAF
         9O8hbxTA4NULTrpp7F2OCq7llwIwX6rN3S8JmkFI683WXZrtT7bp9UhO3AyCIa/Txi7U
         c2jJG9ui2O/KlOtBg4tP4pKNKgcJpp3inYnVP0W8IUq+Exa3ywQOhrN5tYZAGNYdZonI
         bTbG7bsHlBIKTV+EvUIMyEWPuWj28Ea8Xhp1EQCg0f90KfkAP+hjkWUJbUA+qksqQilL
         djuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793645722; x=1794250522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tcBT7ZPA2W86pDvxdZgmP1F0AEFBUNIV5Xup6eF+HXE=;
        b=Dpjgw+oytUXPLxh1WRrSBz2ZrFQPK2MvKtIpaVAQFJJqL6geru+6SHBFxjtC9OHjuX
         rWw8gq64nqVy8Y2oMfi6oynfrpGOkGlFBp9Aw3cWZsoHnRbR6HPX1JyYTOu6QexorKRZ
         ksqfzcdzAlnpNQBy1Gw5SaJaMG5QO/I40fX9zQr9vOC1N37FdXgApvKqJmomZa6EVZbF
         MQql2y8PO6e9Q9mLR4Gk97CWBIatlhsfQu80QuH6Em4hZ6sDti3/6CaiejwUfyonR4+w
         P6hNHVTnHljvJRex5mdpF0+k6lvklOEBmxT6tWPgoWp/A030gLiQtvuwqEvMsJTe70qN
         eTvg==
X-Forwarded-Encrypted: i=1; AKwUvByYziwMi96WVY6QEVNk80xwruDigwyGtD8O+pgRnldDNCQHmCC8tK3qbi0E/fM0Ebr4V9br3n+l35D5YL4=@vger.kernel.org
X-Gm-Message-State: AFq9FYICyMTYw3QtxYhum7Cobylm1bfMa2FbQKeb4aCcCjO2OHwqOJio
	p4HpWAYJvzis7Wztng6LiUTJ9cnH7yj4asIddB2nPbJzNmPu7dndacHl
X-Gm-Gg: AYBFou3FhW567bH2IbLQ42sZsddRwsfuPE/QMATa3jGCxzQYW6iuJYvoF6RiOf4sS9h
	T+UYw+1CADht57GxTKRH+a3NfvslzeC/u8CMMBL99d1aUiIzySeyrQ+AYftmOmAE7qZ1vPqwE4q
	9/sObkHxldkLxz8pzlr3gvUrkvXc9ONM2m3r/cOOiTYhWhwD/8Ze8UaDAL/csoBaam0y5ArofPw
	jxkd8l1Dud5kKl3093vqcVnJjRjX9RN+ZmNe4jj81JbyoyPsPZloln57Dxsfbxztr7tU9FjFEB7
	po7XPoTfryYF5tRlXg+dcLmbAxo+GV2OitzlnCnRJtxRa59QFjCmj4LXJONofXSbjGczyi9PoX9
	G0zIof5E16f72WqT6nE4cmJ3jEKnBO53T8ufii6tWdwVQ81IHPGJWmfR/n38iJfnytpbSH3vwAT
	nUKXk9sE5ywJazchr+Y3hMLewJPn9ogbSLBLAleMka3gBOrU6awXUIYepaaLGXhG0yAMuE0Tzk2
	3pVxk12VsVgFQb4y8QQNaeLSFnl1+htW4vRdSUwT0pdwXy8TrjjNeU0I+RrU3wYdVT88N7JYxfI
	rYpY55V8OIlCJayaCubuTS4Fsox5r3eFs8rZsthAPBYTC1LdtGGbPdnTds8WBIgvRdi9v/bd9Eq
	OtINBbjBRk9NMuuayyR5sHc8q7LNwXsiNvuMqRHTrsSr4hl/YNgaJLg==
X-Received: by 2002:a05:600c:a012:b0:4a3:59c9:a747 with SMTP id 5b1f17b1804b1-4ac1793fb0fmr251061815e9.17.1793645721864;
        Mon, 02 Nov 2026 10:55:21 -0800 (PST)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b7815fsm21965403f8f.22.2026.11.02.10.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 10:55:21 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alifer Moraes <alifer.m@variscite.com>
Subject: [PATCH v1 2/2] arm64: dts: imx93-var-som-symphony: enable UART wakeup
Date: Mon,  2 Nov 2026 19:55:04 +0100
Message-ID: <5e9ae0cbf0b98898a8020bf3d8889fe87405a3d3.1793645417.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793645417.git.stefano.r@variscite.com>
References: <cover.1793645417.git.stefano.r@variscite.com>
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

From: Stefano Radaelli <stefano.r@variscite.com>

Mark the LPUART1 serial console as a wakeup source to allow it to wake
the system from suspend.

Co-developed-by: Alifer Moraes <alifer.m@variscite.com>
Signed-off-by: Alifer Moraes <alifer.m@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index 1f0954620195..47203811abe9 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -302,6 +302,7 @@ typec1_dr_sw: endpoint {
 &lpuart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
+	wakeup-source;
 	status = "okay";
 };
 
-- 
2.47.3

