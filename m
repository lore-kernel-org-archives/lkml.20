Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB06A4B5157
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790278632; cv=none; b=U0ejTlFhhL/6u8ZtQ8v5ST8FeDKVyj7qRWcBEadn7OVeRNLn1z/O2/K03hVEsLAYho6sg4Xa9T8JoYTP3+V+f0kmDaqpqO8vGsqz8wBpWNSwj1dKsaOYKf/tN57cwWZfXGhO8ENYKJ5/roa1Vp7K/GZcBtdMZnxdrq/1e+QZoc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790278632; c=relaxed/simple;
	bh=Q9V/OyxnzpEXhb1+HiEXe9l33vd3hEia2l4gk0QcaEc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jqSNejhqAmVV0EhOYxEuJS4gpg4Q+r0QlEwZkEILOG+/SFiaNpYyaNGZ9oLWATaQiRCBKWaIl01Nm4QY4kx3HC2UsdKFlOaJyg2PmfrMfUAgI3es/L6BG5bYshpbAuTRU/1wIH+t/b2Qf9VvGLMD1V/QQTzDuon6n0FR+XQS3r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T/ZMRvqU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=VyRZePYn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T/ZMRvqU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="VyRZePYn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790278620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=faoj1Myu+9icVQdUpGQqIdpGYG/tK6O2kdZEgu4Y+4w=;
	b=T/ZMRvqU1Kr5XapwP+G631k33rsOVPmVjh3unw850MLfGjJ1+LbxycPFhq3YReMJ58a3mY
	yGIwUjGJEATykTquauyC48ac3iyjctjEJ5j7aS+lef1lNS18G2pQhMmozL/aQ7F+pbgKsw
	DbwaZxgqY9did09N/M3fayiN6tN4bmY=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-R67r9TVQO0avkklN5EkCEQ-1; Thu, 24 Sep 2026 15:36:30 -0400
X-MC-Unique: R67r9TVQO0avkklN5EkCEQ-1
X-Mimecast-MFC-AGG-ID: R67r9TVQO0avkklN5EkCEQ_1790278541
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8865abf21fbso2817247b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790278539; x=1790883339; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=faoj1Myu+9icVQdUpGQqIdpGYG/tK6O2kdZEgu4Y+4w=;
        b=VyRZePYn25jjRwexYbALRmCNDrC9GHE35CcaCAgLOlZW+7zLrq5pMTg0fQFqnnwV6o
         S1Ib5l/u42gL3DK5W3YHUOQcElC844LABzbEdVekhyGlLt79G0WluxQH2KKtCQYqbAbU
         4ljI7FOoVkUAD15VgkXbRHTDh4erudX4Xu9uaP7mHJ4EIQW9zjIkmLn/+sY4koA0quPB
         pSeNpXH29yJjioN+Jllzk42XP9/axysho0IbQ0xjk/IFnYekoMuS7hrO/AdjNZg7o1lP
         f+K8qM6wT//g6iK89IR/LRpDLHrK8C9a5nkFu3YB28R7t2dA17516KYFUHJLjdgmhhgP
         XPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790278539; x=1790883339;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=faoj1Myu+9icVQdUpGQqIdpGYG/tK6O2kdZEgu4Y+4w=;
        b=mafUXwCKRj5QL0XApmo1vCHls0hrD0OrYqT8Lw0T9+pE/nYXXYvnKXNtzA+7xVf+zv
         64ssPjX4L1M65DaR+erhk6PmI+rFYKAVcx1+y67U2fatfaGH2Pd6TrFmFk5tT+zbMLL3
         MNyGLWsKgn1jJwzqOgLx8m8iA3VmCxLKS7ZMdxw1P6clv7mmXisbQ5kiKaReR1GR3Y+Y
         poPsTpf9yI3flfVyyzqEJ4amNGS5mV0WkQA9ojGZPZbsBewKESo8Qdb5pKVJciqk3L0o
         Th1Ekp240PHRlzAeh4L1p2JySJOtjTL7LK6Vit4kO4o6CWXezIFBa+0RAFVCPQTVbV+H
         E9yA==
X-Forwarded-Encrypted: i=1; AKwUvBxepARAX3xjTrbB2b5C0a4IdcvNjXuVzqBVtntLKssB4ovPcQWjZPOxmCuW/bDyxQTJuajEHEeWKy5xJTU=@vger.kernel.org
X-Gm-Message-State: AFuF++lCPPe69R3lPniryBTQ4BIBlLToWRK80bn0UETc1y8EOPWl1Pt5
	WyOiQXvTrxKthphrDStFLY/j+Y6AB0kXUBAcN6NaPvHVYHaiB7OMWfcrMypW0XZr4WYyPHjBCZ6
	u7R9BBjUDmN/LJFfBKki0yIdjRVZJmIWoXtjYtNEs78DOCt7qgZygSxcGRLkVvEWPiQ==
X-Gm-Gg: AYBFou2fZ2GmAj4fhLrb2oqPQsUIVjvcxYZZDfcSEU1iUDCd4photjWgAtsCe0DmSri
	gQ+qj/wazzux7bFDv6Izqs0SBthkiJhVbrOeFJmpRafyzhBQxkQPEFt0z2nJ8Y5B0sHEbCRl6gM
	XGyQXWtmn8cNhC348O8wKSNCepF+n972hA2JWDRzjfgyFTLcmUhODUIsAx2OafLbYm/QT6G+i8s
	wyclvWQRSiaRyoCb/QJqqqvYieivgLpPN2/CHCA1EDNlZOTrOEj4jsBTXp61h4Ehx6btLoQxCrj
	ct1kW76zY6qg1qv5ChrMPKQDwAIuq8k8LYSxZCJY8Pkl63aa+tzAzWmcJYLV0bBfr0PRN6ebj+d
	DdETku6I=
X-Received: by 2002:a05:690c:e21a:10b0:89b:689d:3a73 with SMTP id 00721157ae682-8a64968736bmr19121867b3.42.1790278539150;
        Thu, 24 Sep 2026 12:35:39 -0700 (PDT)
X-Received: by 2002:a05:690c:e21a:10b0:89b:689d:3a73 with SMTP id 00721157ae682-8a64968736bmr19121737b3.42.1790278538479;
        Thu, 24 Sep 2026 12:35:38 -0700 (PDT)
Received: from [192.168.134.224] ([2600:382:8501:4f43:e566:7498:c7c8:a7ec])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860fbcb2csm997117b3.25.2026.09.24.12.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 12:35:37 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Gregory Clement <gregory.clement@bootlin.com>, 
 Andrew Lunn <andrew@lunn.ch>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Aamir Ahmed <elb12345@hotmail.co.uk>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>, 
 linux-hardening@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <AS8P251MB000199E5C86A0447B3FC48EDC8B42@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
References: <AS8P251MB000199E5C86A0447B3FC48EDC8B42@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
Subject: Re: [PATCH] clk: mvebu: ap-cpu-clk: Assign .num before accessing
 .hws
Message-Id: <179027850326.211017.6896107198657392154.b4-ty@b4>
Date: Thu, 24 Sep 2026 15:35:03 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=317; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=90S9+JQ9kh2224ZVg9ldJrz1f/1vkihNmKSNrXDf66s=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLK2Vrf4iC9aYqXVz71kbdH+Ov1saU+nCVp74zj/zdWyX
 mEz/UV/RykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABO5x8HwP+Xe94k/F3Qz7le/
 aWa/fb275ucvfCwNMmdm2e078PxT8TyG//k/v/++Pquid3fu0QMaWlpS1TdcLl8o4LMx/e64uC9
 zATMA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Sat, 05 Sep 2026 21:48:07 +0100, Aamir Ahmed wrote:
> clk: mvebu: ap-cpu-clk: Assign .num before accessing .hws

Applied, thanks!

[1/1] clk: mvebu: ap-cpu-clk: Assign .num before accessing .hws
      commit: b4243850393f2f24e21b9f4b2c56233e60c904b4

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

