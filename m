Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792741997;
	b=raGcVm+xK/PelsDi8wlZ+KQhzQ5vs050ueFI+9a2BpBfO1gv84wBBHdHgIqZTXOJgUTI
	 aNrB+NeqdRyBEt0loakfwwcUJLs5ziZahTyEkW+omyJ7adMLqyYagP0nGDSmTdWQouRN2
	 oa4UzzK3qaHMttslSeWzTdMBxiuyAPd3ubNBmNMwq8FWrZsGxksBRqTAZFKQP+zGAdm1q
	 kl9PaGxpDfc/ZdgWn1jj9E/c2rXukIStG2FcIslk+yR6mqjVjIDGvhhodJO02ZIDeM4lt
	 5Lx+3oMyI42MX2ESiYls6WAb8XjW2jYWLfkRukZA3It6uj4AFwSKsdzIY+cofxOUxKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792741997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gccHhk1zXKvI2lBwqqMmtzgSCLGdxT+o/5IMCODfY24=;
	b=aO2bTedmwmq8NcGhUxZovGxtB19rckwyuh5jEeQCHr4t1PzPbkC8c04lGJxi02TgKE9E
	 dm61FVGBg8QtgqaVh8dnaGChGPu0PBOY0o7ZfKbiIM4wY6uQQsCkW4lO2q41S0lw1klS4
	 ROGOzPXMfh0zGmXwjswqXjc6S9m/hIZCX1EO3Gfc+r8lb33USPdqLdz/32H8rXtu/AvpP
	 NmLX+qtByqccomuvDk+yO9/4NTEF0vSfPp++uDuq4rgFfmGf058AWRo90jSPjUHT7rinU
	 NuikngKltX06lb2wwHrYGOOGhVI2CH/VN2jTCWT1Ek7H/uldJgCVlypJWmvgIvPMSvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LBWfTOJH;
	arc=none smtp.remote-ip=74.125.229.135
Received: from mail-dl2-f7.google.com (mail-dl2-f7.google.com [74.125.229.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC736606A336
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC736606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LBWfTOJH
Received: by mail-dl2-f7.google.com with SMTP id a92af1059eb24-13985f8229aso501945c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792741996; x=1793346796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gccHhk1zXKvI2lBwqqMmtzgSCLGdxT+o/5IMCODfY24=;
        b=LBWfTOJHBn2220bqeCMn50DefPC2tvZT67Uro55yezV2FbLKmnjdRUloaKJ4dKiayW
         4uzH0rAH3os/w7/fGkmpHkcwQbXvytbB8XBTDrWEC+OM1EOVF8zTLcteWo3zryuyl1rc
         0QNkJHrOdTUl7ed+bKsJQDP+4++awIpspLAgg2xlRwhFcxcnoBNbiKVc/7LlqD37F+Kx
         7aTSxz+eAcElZzgccyegYhcUH9jc4P7MUjJrXEZKYi+fd5Wt4ybdqmW6hywEcuMn/6Qd
         /yJ6fEUYj70ULTJxrNxO+vv0hIpkW4AjgiD1EO/uBws/ACPtWoEhXL1Ziuk8+ZFSIlIL
         vhGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792741996; x=1793346796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gccHhk1zXKvI2lBwqqMmtzgSCLGdxT+o/5IMCODfY24=;
        b=X+K87YCgDPwoKQQs7RVLoB2PFNJRriWMpOEZx7V5RtHOkswMHsOIGNBCZVzdH9ws9F
         3u+EUp77yTFtgW3vTUPiOslOCT56xJ5cwi4dcRELre1J2ZYSPC5jh/8lvcUS+XalRk9F
         UpO+VmKnfDxBH/e+RJo9OYLU9Lzs805eFjI94vB6A7iLcYtW20zmKhjlr9EXKMy4trn5
         ZlXjDX8nC3Xb85Q5y6n0bpLl18RlnyrAC7MyZZ8MSFI2zP/om1ArQKWHZsiMC33T3MUJ
         lj7nXqWIo5dfS6AdHhDfB0lizhA8ht3ISftbXjkxJlwO2+9DbqD08Ed/2cCrmHYHmYXm
         H6lA==
X-Forwarded-Encrypted: i=1; AKwUvBy8tXXkiv/GKPgB5yQQ4vsAoWyFawFc/D9IrmFgZ5auPn/Furl0fD6o0EoX321RRa4JIOUdC70q0LL37o8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3UqtUc3T3YuP3rrMUKFuIuv9dB2wWo+DCM3Jfd/FLfVtfogv5
	mOfbOLVMFLnfCURtpBmyTyaNiBN4fdKysnCHr996Pwad5Ir9SJMme8Z+
X-Gm-Gg: AYBFou06hhpEcGNijXuOzGyhhOPddtMVmu/Iq0k7u5USIDkVrh1FlXok/92j8YF7uGw
	EcGGuySToUG6tcJ7HjEP16uEsnghO/Ol85ydz9XPjJT10N35yMHXTsjrcmPcM3G2uYddGwnHlLQ
	XOUYRY0g1xZQg/Ex6Dbihq3+Fz7L5De6mu6pTyCg5v4comcCX6xj9YQOn3FQxrPAa5iJHzHyzTU
	ieSPc5HusZYo0zdIuJm/hWeZAL3Q2H2KSxXg5BfYPYCV6Rjf5fHRkYSrmrLLChgYnwJQMe0G9Ww
	Kmmck20jg3Dl2a7S4CZM3HPFZ+5hn2eTi1L3cHVoO0yeaYynDEZSXt4Ix3Ax4ixU4UrqrpNF1pf
	JR5qMTfdjkOTQTqxz+37ks9Qb0g+SWXS8SD2CObniaikY98sQac+k7Ia2CtCTh59cq80dU8nPTd
	XoyGhrNobxSFtYdgWMlYkDBxTqA6r3pPu4ZKUidoMukUDPnfOAqsmctzpH5Mwj8T0eJplZEjHV5
	aQOPQbk9+4+Q66+3SbLbpthWmKzmaWoJELlDRhHS3ebDQNdQFC6VA==
X-Received: by 2002:a05:7022:e803:b0:165:4b88:abc2 with SMTP id a92af1059eb24-195c1e5520fmr2349281c88.26.1792741995686;
        Fri, 23 Oct 2026 00:53:15 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195eae0e830sm4122132c88.10.2026.10.23.00.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:53:15 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Coia Prant <coiaprant@gmail.com>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 4/4] MAINTAINERS: list DW XPCS platform driver and binding under XPCS entry
Date: Fri, 23 Oct 2026 15:52:15 +0800
Message-ID: <20261023075214.1793922-6-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023075214.1793922-2-coiaprant@gmail.com>
References: <20261023075214.1793922-2-coiaprant@gmail.com>
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

The Synopsys DW XPCS entry covers pcs-xpcs.c, pcs-xpcs.h and the public
header, but not pcs-xpcs-plat.c or its DT binding. pcs-xpcs-plat.c only
matches the ETHERNET PHY LIBRARY entry today, and the binding is only
matched by the generic DT and networking rules.

Add both files so the entry covers the whole driver.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7336600952c8..4f24656f7653 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26729,6 +26729,8 @@ F:	drivers/net/ethernet/synopsys/
 SYNOPSYS DESIGNWARE ETHERNET XPCS DRIVER
 L:	netdev@vger.kernel.org
 S:	Orphan
+F:	Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml
+F:	drivers/net/pcs/pcs-xpcs-plat.c
 F:	drivers/net/pcs/pcs-xpcs.c
 F:	drivers/net/pcs/pcs-xpcs.h
 F:	include/linux/pcs/pcs-xpcs.h
-- 
2.47.3

