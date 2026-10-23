Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792757800;
	b=gugroFWDN91EgJYETpsFRIfb5qmp5aWMfqmBBuPNY2RMBKKBCT8rECsUjvLTojPQB4j4
	 lFGiGgYfJyLoRwZNa/jDAgN1w07dZiq9FiJLsMBCtdSU7Pgb1Z+8ytYTBIVmIXPfu7bB5
	 a2w/VuT37zS069MwlOJ/kXDlATEfu0zU2NWINppqAlJBjgExKwRjvp6xkIfqzC07IGXfj
	 XcdP1h8S5h/AyL8RkseGvi0h7Cue+Ons01ydBLd0gR/Crz2jNPpBeeJwGx5YunmNElKiu
	 DqyxpvlB9d7n5LhamnQOsMpfcOwXIwQmmumcf7j2BfZtMt+jHc1JuIroU01nfJjBrsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792757800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pH7C+Ic+skXIiL+8yDLrJvoIJ/Xi8EZtJUFQlV0QBE0=;
	b=JGlb38dfW3i1w2tAWSJBxrYtbb5NhHdnmE6uFITyNbzjzqtPnksTScvTcl/2z5ZUwmI2
	 YwUDaoQK5nm85NvA8klhnUOs7hQB9qVzGml4lJQr0cHFY54tyqnUfEbQuRnH7p3WETeKp
	 ZWJrWsTFxvyeyCMylIQE++l0Ov4YFnRUM6iqFpztoVXkcdtUTJEoOXAcBtyQMbSjcrMOa
	 rijOCa4JRaHiKzVxPnljlcwARyvDtn2YzFV5I1pdndftXL9NADeJ1MxtqCFVe0S6pMIM+
	 IiCkZx5xQQOOJxwQPL6NsZ1bOAqcyC06dKIAeWxPaNvMN5M2WQ9p0FXRgvTRDCwzm8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KW995WiV;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2487606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:16:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2487606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KW995WiV
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4322d310e7so122989866b.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792757798; x=1793362598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pH7C+Ic+skXIiL+8yDLrJvoIJ/Xi8EZtJUFQlV0QBE0=;
        b=KW995WiV+2FKvyP/wgDtPTisweGN15FcNyMcGyClqJusS2poI0hz2xccJKOyCiI8Pv
         MqChXnM36N3LKhLeA3IZ0Xk4pnF8RWFkyj8Q69NAruevjjSaB2ttKASmsWper5vSfGhD
         Jz55nnvno4+UoxIFirw6wrTT0NMXfzI0L1sUd9/cmYHESFmkqHBm0sTPd/Sq9yEv7JC8
         8ZKUjFoprG35SN44ahrR4rNebW1k3645bCEZt+RAn4PufSpxNXeTdhzh32T8QTsaWlka
         twwdtrPXQaN7hhH/6wfANSkuq/zE28bvyJBU9X+tGSK0eSoVl7zYGk2/bhim0dny6MOx
         KiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792757798; x=1793362598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pH7C+Ic+skXIiL+8yDLrJvoIJ/Xi8EZtJUFQlV0QBE0=;
        b=Tt2M728SXZtAvqB9r89LPK4t13JLJIJeAGkWcQER1dsO9VfmsNAjUW7uU1Z5+lBobA
         PdbG+r63xAE/C3UcOaZiheY2b2CvLprmC5V1+bAF5FKj0vvd4RD4SL5Ya3hFTpoHJL/E
         F/10EHzf3TnuHpAlNaOHQ75I015DtQGx57lmIz31sqbq4NK8d3z2nthPhPN+xkqq4pMk
         xjjmKhptVfqrQ0WLWzsqdX9Z6jH73j0nCGEhyutYon3J5TWASsXfqsH/hv1YEquvNOvd
         3Zz4FVhSmWgqHljzug+i0lgh2Pjvm9Gy3pbT1b6YpjfNpZRGoRwiid3cGfSjWlZ1mh/T
         FUGA==
X-Forwarded-Encrypted: i=1; AKwUvByeoUQEWqWj536PIDkamFzPGhdO9gLd7P7nVYTwB/7RYHk9CaHgseqGKPMQ0LPTFoujxcltls0FQbWC0EY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdvKYxcovQN8h3ip4IPpQZDMgoqd9OrWc3zY6Nb7cQvlnBXOGC
	/5JpP7AsRwJ4da9n0hdIzaejbB+omaB1vkjA0a5KJyCfkWFnSlDHOyNa
X-Gm-Gg: AYBFou0JjfSAy02WsHYfoGn+Tu4V9GW93adOj546b06iVkNpjX2yY3Lo5UZIG1D5zHB
	4BU685JSAUr1fOAGgKOaZvOBXse9J1dfKvTG5T/5qJKw3kb4jiM+fH0w49I3XLF81V4/5378Udk
	9k+LFlQw0SNgdF/JUGEyDfVT0YNyCrIp9o6tsW1fZOFdIOpo7LZxMauma7RfqWQByAlybvWzFA6
	8ASsejXhl9qMrz2MEo0TzIpjOJ3hSBm6xpVh2OWkgMUCb1atlv5HUvJdjqcS7ewPNn9dX4Rb7s2
	PRJfs9a5PwHkqTZ4rlUKOba7jy7i55dIrKB/5+I4xccMsaEYaYmq8n/qo/99+jPRFUtvCpkPM67
	CWxXGEcKaFDY2ryrUWUnvctBVcTu6mfkARDzJajvVaHoUS+FTcD0yyFdOVyITCa0hFoDSz9k7cC
	+M3d8TFaezf91X+vKtgoiUnjiUWEquit7qhzENSr7IYVMy25rR6vqYrctuRqJpjifnFGQdQD37t
	XiSgGDDP5jCDX22QKNIyKzYyokzzjPrg1Kxg+lJDxODpGDx1A==
X-Received: by 2002:a17:907:9309:b0:c2e:63ba:1f90 with SMTP id a640c23a62f3a-c46a92d5849mr287640866b.48.1792757797774;
        Fri, 23 Oct 2026 05:16:37 -0700 (PDT)
Received: from localhost ([2a03:2880:32ff:4f::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5cf5540sm95824066b.78.2026.10.23.05.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 05:16:37 -0700 (PDT)
From: Vlad Poenaru <vlad.wing@gmail.com>
To: Jinqian Yang <yangjinqian1@huawei.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Andrew Preece <apreece@meta.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH] irqchip/gic-v3-its: Enable dynamic MSI-X allocation
Date: Fri, 23 Oct 2026 05:16:35 -0700
Message-ID: <20261023121635.2190639-1-vlad.wing@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261022193620.2152038-1-vlad.wing@gmail.com>
References: <20261022193620.2152038-1-vlad.wing@gmail.com>
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

Two updates on this report.

First, a correction: it is not specific to our debug config. Our
production config hits it as well, on every Grace + BCM57508 machine
we tried, at the same point in boot.

Second, the root cause is in bnxt_en, and this commit only exposes it.
When the channel count is raised, bnxt_check_rings() allocates the
extra MSI-X vectors before firmware has reserved them for the
function. On BCM57508, writes to MSI-X table entries beyond the
reserved IRQs don't stick, so the message written when the vectors
are activated is lost, and the entries stay zero after the
reservation.
x86 never notices because GENERIC_IRQ_RESERVATION_MODE makes the PCI
MSI domains MSI_FLAG_MUST_REACTIVATE and the message is written again
at request_irq() time. With this commit, arm64 GICv3 takes the same
dynamic path but writes the message only once, at allocation.

Instrumenting the driver showed it directly. After the channel count
went from 18 to 32, MSI-X entries 18-31 read back as all zero, while
the cached msi_msg and the ITS LPI mapping were correct. Exactly the
14 rings on those vectors lost their completions.

The fix is posted to netdev:

  https://lore.kernel.org/all/20261023121321.2127263-1-vlad.wing@gmail.com/

With it, the same machine runs cleanly through the channel change and
the ring resize. I don't think the ITS change needs to be reverted.

#regzbot monitor: https://lore.kernel.org/all/20261023121321.2127263-1-vlad.wing@gmail.com/

Thanks,
Vlad
