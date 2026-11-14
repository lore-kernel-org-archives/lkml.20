Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794661259;
	b=PX9ue7XEW1OVTWKOrYEOyxeep/+IE/8Lmav1r3dXuCT20S5ycvzEjxuMFLey4TqLxFX5
	 NrVRqGA9UX0L+clFRU6IE9OBxwLSYq0in1q+NLFGzKoug/XUONmLqS4ER9w7Ss5s2EpAO
	 U/Z95AoXCUSIiMt0vZ5iJjmrJpaYh7mQjW+dMRoyFiY8dsYOZRK758PhIT1fscujb2LZH
	 f7/ddYf9lvOf9d6kAiMngXlqxa1jik/eTEyDpXwFIdXwSXJn+uH+jTknUVU0pGrVyDJ3x
	 7vGFdPbpvwC5c66CrQBcFhjSxRUi35a8hYp66x/vrFZvPXs8mTBX8F+HLoOZJIoSRHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794661259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=fdAJLD4zNLOzYjD/OIT0sBm7o7IlZcf0Q2ErKxsWEBk=;
	b=yUwMD5YNDtgn8eTC+1QyEUBmylf6RNojBDPcDtiljELKG0Au52zNleLuo0cSduWw/Tcq
	 DxQ3f/zj9THIv3M8UoOf8nLRAMhaaopmZPVycfoFUwe/OH24JtNY7Kf74LKHl4kF5fgis
	 41ZhNZDCJUfCD1hvj4/bC9+epU4Nuij9YxlTuf3xtf4MS+d5C8wJYJk9PxOGtN7GpEe0a
	 /F7Ufb6OboIQfIWS4Fko/AiZkQcNiZRwSoP0/rtztJcoWznbA86Efsr2RVhDS1E2QG3SC
	 2gu+AXqUd7rxnlstZhCWvJaG7nfJNq7eoG9iN7sdmq8xuzwdBD4Hb4SlkIv2MVmmLQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T3jtUgYm;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4957F606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4957F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T3jtUgYm
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c50a4a2132cso242513466b.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 05:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794661257; x=1795266057; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fdAJLD4zNLOzYjD/OIT0sBm7o7IlZcf0Q2ErKxsWEBk=;
        b=T3jtUgYmzy9TE1gZDpvFRcansJmQ3vzKtwK60d8QPgQ5SWlX/aZeq27BC0DqI/TFfx
         uFUDFSX3yTC+p8x6+pivJVKB+D+ZYxl4DMzMAWD47F4cdg2NAPbNmPKBRhaplPFMHrul
         2ASkV7EMO6bMX9UWnF79ytpE6Bi6Qj+MBNuJ5pJbEK6COmFQ4wXRT50PU3azcWeBcMQy
         FXCKnwj773SUT2JeulyTkJtKyhOwR5cQE9R4RyYU2E7A9bYRlzAxZzb1Xioap1FM+60N
         kSWhEj38z1vs56jzff5a/4oyS58Jt9eU1mdXZxy+26vbcqFu0IPXbCrCfz8D6OP0ntbw
         3f8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794661257; x=1795266057;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fdAJLD4zNLOzYjD/OIT0sBm7o7IlZcf0Q2ErKxsWEBk=;
        b=HdnUB7O++I1PHXTIQR3NCOIdutZyzMZxXuA5bQWPhVSQPCw+xrdWDC51/SAx4qWegk
         p3/m5KP+D7TGZKhgcgQmyS+/H3izJk3UVQ+Yd1xgV8Ff4Oex2cxehkAffo3ViQgAC+BH
         mnDrRKiNsnGc4Ot+IlkONUWoLMmAqbbNkKHQdI89FdNxAk+aeZav1ZHn30+qZEA4tY1K
         gpCAZjBYWXIlo/m+eUxqyDLB07UNoCX9xTJic2dCS3bodXYUGxpQRG6ogQe23KvyRdc2
         jLi8U8xwrVpS0tqIBu1JpOzrB+GFacQjRRV0CqU15Mem1aWFu8Uk/7YcEOR1a6jR4T4r
         Mabw==
X-Forwarded-Encrypted: i=1; AL+hErFow28+sojpyFdygd0moTi7DCoDyfgwhRfHCltNFQdT9PvXwVVYmokBfkkzDV6CKWPXwLIdHg6rPYc7WyI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PSUihQW2FB6ECkVeZuvpoNsjqdOl/g341lkAuuQ1Z9QMzgizy
	vZO3Tw4W2xdgZE49xYC/D7/PYkOHuLZusbLHqlo49hVR6WY4ja/hm4dF
X-Gm-Gg: AYBFou0A9BfFUdyjuNuCed7LERVL3L0H/Ie1RHRwppJ7/s+BujhOn32UZR1KD1PjtT/
	uarwU5x2j3+yeS1Al0AiueDq87OypJcz0A4g7MDTfSyja8MNikJsPRLuiG5wjJTknPjo1xHri8z
	jVhNgtrQm7IqPxlNNJVcF3v2QXiAVFXZQiP6vGDcGxSmnIGSnmyg2PM1RtOHP4I8QKkHUkI05NU
	HO7zCCtm8c9HtR3j/IxSVhY34BdusozFt3Wgiyltvto40uSkYfMbtiM9Nb73xBu4Fe6NFIfiJcb
	T20J88Yfo9bcLQrdritlDlmZ5sBEbs774r1i4dNKn1/wG/Q982GJQUhj9Lj09FTC3NW8dmAx2iK
	h8sRcp4qH01Doo1+SIVGmBkgN6vCPRUHwhFKpdv8jjn2oRdKlHwihpO0IpsITR368ST+I3pR5iC
	Hk3U0fLdmjS8c0wW0RC6HSBN5Iqh9kmNoI2JSusRGLDvR2RkLcKv6J12xXS7oZ3JLzW9UKCbcQi
	mNTLwkiRK+sPjvS5pQCDgQ+CYnHARkLCT3C866znZuyy3J89rfy9Yo+NdRieGJkXkxmcbQmA4V4
	yejy5KMqLJSYpFSJaQ3UG2+y6dKLxf887dWWQiCSKfLvGlW39FqvAYoggrEaV+XUIZvsCmieCGK
	0qXHaEJcjs4ZCRV+SIoFw1w==
X-Received: by 2002:a05:6402:1598:b0:6b6:f7cf:8088 with SMTP id 4fb4d7f45d1cf-6b7c0c6f6f1mr4621363a12.32.1794661257359;
        Sat, 14 Nov 2026 05:00:57 -0800 (PST)
Received: from nixos-macbook (20-144-89-188.ftth.glasoperator.nl. [188.89.144.20])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23dde80sm2383864a12.25.2026.11.14.05.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:00:56 -0800 (PST)
Date: Sat, 14 Nov 2026 14:00:53 +0100
From: Jacob Procee <sn125164@gmail.com>
To: Sven Peter <sven@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v2] usb: typec: tipd: cd321x: replay the plug on resume
Message-ID: <20261114140053.0ad11276@nixos-macbook>
In-Reply-To: <3a3f5721-dc37-41d1-8ef5-9a5fdbecc446@kernel.org>
References: <20261112122825.7730-1-sn125164@gmail.com>
	<3a3f5721-dc37-41d1-8ef5-9a5fdbecc446@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; aarch64-unknown-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 14 Nov 2026 13:39:17 +0100
Sven Peter <sven@kernel.org> wrote:
 
> Nah, making suspend/resume work isn't the job of the type-c
> controller.

Thanks. Would you rather have this handled in dwc3-apple
(dev_pm_ops doing exit/init on resume) with atcphy remembering the last
mux state and restoring it in its own resume callback, or do you already
have suspend/resume work for these drivers that I should wait for/test?
Happy to test on j314s either way.
