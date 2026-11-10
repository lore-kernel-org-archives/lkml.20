Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794276703;
	b=RK+44QOwkuhpN3FEYdOEu6fdTGwwDNH3Y58alrQnbA1dZtum/h1As9xGJlDniknOJ8Hp
	 gb6RB/fArsPPruqHMvr2k5VHMBwd8GMdoUpt9kQrqUzGw1hoWHgDelf8uCSBLoduNBDBa
	 AiSckBf134a9lmwPp+r2050KLwwcBoEUXFCsenJS0nzYsjwVF0gXwopBibP/FF3EV5gOm
	 GDgt40ljuAIoaPRXJY4Bgy+qALMlXqrHDO0UeUMT/tlnRpjrS30rBAhTPIOy+uB1KcTk7
	 27/yLZ+aJUDTbAOXjxkNMeg6BZw5IKfoInUN2auswLOgzIk4J2FtUUb/DeC0Y5rgqhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794276703;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=MXJ3yo+U7Doz0e8n3cFxrPAtyC+QNHJu/0qF308IqpM=;
	b=r7i9tyh6LcUOZ853SoFCgOgVAxbiSHCPFOs391jZPSJKwwzzHQn0/sAoCsdzUiDw3AwC
	 cuifQhxkLqS7jndEzjUP/bQMagHDuINQYZfeSCz1G4h2FbSQYxozwkGCoE0Z+R5w4aHEM
	 YLLNPPNHfs5AMnVONTVSTm3xYFq6OBCHM8H5Q46PN3KWN5A0fSiFTFJAqTNNJJuS3Q50Q
	 FouCtl4Rsx1KPCvw6aGVAPsSpb3B6xabW9q3nCxQc97GNaTveSeoXEDj9br1rxrrYhcx7
	 g8/EU2QZNw5LgV94h1RTabXgXEpqXyg6Q98kqKHy38WolcsbFpw20nekY3CyQkyO1ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S57ojBSr;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80B8606A33D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:11:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E80B8606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S57ojBSr
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6fe4372c5f3so871246eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794276702; x=1794881502; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MXJ3yo+U7Doz0e8n3cFxrPAtyC+QNHJu/0qF308IqpM=;
        b=S57ojBSr37GkFksPWQ7mHSpA6EgjGnCvU7bSS+RLF2Lbj2lioYPgT7ZGOGhZzRjtpN
         UJl9dOi6OEhsYIWXS2/wsKd+wpyJ2lIEYivNQ9Qo8V0FMvugc9rgJhlMk4fNmx15g5JB
         0Mm6l2rMMl1UXClBrlhtIDkT6A+5KJPPYJUdtdLJ7STwjJec+QjQBPc+OWbZGtqfYILW
         t7U6a/4qhZYnWQV3qRwcCikCTg39xg+E3g7VpT+euoyvL8RMwW4TYpyslbpS5Qe0p834
         96r3H+JZOPoO1/G3HEki9QCKpd9KTpIbSTso0NafGWu9J4Yc6Bi8kcqDiWFMAi05Um9n
         JDDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794276702; x=1794881502;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MXJ3yo+U7Doz0e8n3cFxrPAtyC+QNHJu/0qF308IqpM=;
        b=fAxGny00UEWYp897JcHo4kOPOgj5ZyJnxZFzVkTcubK0EhV2rQ3icMCRtXUzsAO0FN
         CJLPBsma0b7wDqhMBt/TcHu0s5bF00zaC3LKkMtF0xv6oAzIcU+G7bQf+9QoVGAMhD83
         OTjVs/1gd6UPYFhzkakObdm+S16x5iXsk42JGjrKdMtbIEH+JX4ct+yby6TscuWJyBiF
         SGBLkBVRr4ECARh27m3XmqAA8novoJnY//SHcv/lHtVSqOSmlzL2bfDQoBUv3EaDt1H5
         YJ8qDI2aAVzxICrV6l+3CVdFSQrHLU+lUnwOvhMQPhfGxiHb7SV11m6q1Kv2Zp5+OJOQ
         oI0Q==
X-Forwarded-Encrypted: i=1; AL+hErHX/Xn0TdsqGscX0wZjDytiZLmhjClfV6ft7R2SSXc1i8+2C8HouPDOMNhTRsCFuPukNiRZots4OfppLw4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GMocD7zUt94kPZME3gBU7XLBXZdXcC8CRa/R6ptVxeFncNK7s
	nPDjhzUllPOyu9yr0k2kLMEuTQ5lVaPtDhdTv8DL1D7Hri805rh0Iu86
X-Gm-Gg: AYBFou3ZaS5WNE888r9KU9gMYjw2FGdl/WiMQxAnXjWTv04wHY8lZWeMLoJuwzJPPwY
	qstdOe2XkNx73TFy2KBPIVhJ/qjnX+wKy5ryLxG93TcSgLnJu+bBTIcfriwQsRfTRYAHqwAu3E1
	HGSLSLhfAR2igaX5un52UyyIkTDzUTjKgXFBOxzs72UGCluAylzIsvfwMauJ1cxf45KNq59WMSS
	i8FLGBgM9CxdUOI6RnfftEABIjMphlrxl8Y0FRjjXTWHUjz+vviioi4lO9gjWnyPBwkcLAzqjpK
	FKkhDEAHN98C5WcnlaRXFasoElbiCJltDowmDsJFKTU6RC8kkP/Q0Ya8ksfmyG1WUX5Q5R+cK42
	C1bPeH0rMY3OM/K8c3zxWdn6iLOIuoIjAi2RVr2kQNRMUmfUoRAaY5GfwPixSqxae4evxE17zPI
	NmDZfuI6zzipL+JuwuyvaSde3ODmApSEzui1u9sm03JxIXOwgHPK8E02LpmuekFEX/qbNdD3faE
	mleVr09JlWlwPxtz1f40zU9tie4D0RP46RuzUz5+guN0L32ZDPLYKNNYyJtY6Jss9q5VPSuUvyT
	H3aUQMl5ecNlBtIgZ4FZlbMceKzH8ABnrDfOmzl3edRozsTW/F2zhVaxww4duimazi16UEUdQ3U
	J96RL7g==
X-Received: by 2002:a05:6820:f00d:b0:6f5:a49:616b with SMTP id 006d021491bc7-7189e73a44fmr602567eaf.0.1794276701742;
        Mon, 09 Nov 2026 18:11:41 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718aa034ad2sm663402eaf.13.2026.11.09.18.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:11:41 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com
Cc: linusw@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: sunxi: preserve A733 firmware voltage modes
Date: Mon,  9 Nov 2026 21:11:39 -0500
Message-ID: <20261109-a733-pinctrl-v2-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107000135.6b684277@ryzen.lan>
References: <20261104-a733-pinctrl-v2@gmail.com> <20261107000135.6b684277@ryzen.lan>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andre,

> I guess this has been written by an agent who like to talk?

Yes. I use an AI coding agent to help draft, build and test these patches;
I review the result and send it myself. The v2 description was its draft
and I should have cut it down; v3 is much shorter.

> So as I suggested before: please introduce a symbol like
> BIAS_VOLTAGE_PIO_POW_AUTO or so,

v3 follows your suggestion with BIAS_VOLTAGE_PIO_POW_AUTO, setting all
two-bit fields to 01 once at init in the generic sunxi code for both
A733 controllers:
https://lore.kernel.org/r/20261109-a733-pinctrl-v3@gmail.com

Thanks,
Enzo
