Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85A13859DA
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 21:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790459529; cv=none; b=u79mls6sxnUza/OhLbE1h8xvKRZ9zlajE/1MXPAkPsKB+XYxV2C/LDDN0MdLOqi7EVWzyaHyOjDX0qQkyNs90YQeS3sXcpIi7dWWqHwe7tUat24vJIdfLcepgJ2nVIr3IMxrqOmiZEUjKCYiZ30zeALT46VTlfsIForYCs5HbaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790459529; c=relaxed/simple;
	bh=nozFzjCHoY9nJR0dTI8x7puPhIPAjPpq12LYsWc3nm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dtcw6IWIzCen95gdiNgQC/JcdNyle4X2znVLlojtEo8ZWsVwaVsYw86cxHeDaW+97Cb+k/sOhm4UOo+cHJ/T9iL0CiPaZsjtaawXVcaVnpv2RKUpUwSWKj+eP8sN05jpiGL2o+ZXv5s4vVXADShh5OSwLVDli5nx0m+nsUsSg/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h2bdXPk+; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h2bdXPk+"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2940ef15d3so234554566b.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 14:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790459526; x=1791064326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8GTHY8dj9isNKlVEtk2ciNN+C6fWLQRwd0CxCymnmGc=;
        b=h2bdXPk+25Lg/c1XQ2vrZ1RzVvvfKgplaPbXHVXmYId2D4zNJ7UfZbW3lttaCft+As
         E2FqJqX8eEzsfDcEBsgQHcoARGLDRg3HCgEXfxK5YVa09nQiD+mH90ZC83Wfyz0OTpId
         +tJOlvJc1x/Ko9bMCfk94TPnAkiE8+4XFGZCYMG1YlVpguhpVvzR+Ahryn6GxrH+sYkw
         ajsbcTObgpgyOC5FnbqdPp0JqMhd4QEqHIq9cYuE+X1TEeHc9unAMOf6bsTbZZ51ceGp
         sA1MnpEwK1WiZg/MJmvUUHTeaX17CD+5/vAZu1Hmqvb2gp41gyh2bI5rMzbIiUtvWD+u
         aRBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790459526; x=1791064326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8GTHY8dj9isNKlVEtk2ciNN+C6fWLQRwd0CxCymnmGc=;
        b=SsTAIZ8Hr1t3enuC1cp2CSyiC/EK0WCSMFurq9uRZCRC7LNcVhPK6J4UkepOQdAdaQ
         1owCuhgJ7N5WUh9FhEL2Fz6fXw5rGozBwPnW2O5410JnTdWH76FZRqFrDc5cfTNztYA7
         HLMu2rCkLzvIqvim6gY9JV0AZy5v9pGXPEhXPztVCMWH+jPaixh+5ovTqqp7cacjD7Dx
         7VheuEJU2DP7J/yncc1FedcJIyWBWmcqTq+LMS+G54KyGliId63cS+UFgsui+ZwvIPI4
         PPnRiwtFZOHA93P/k7629uHjhfDgtIzbkxMOX++c9no5bGAWq7e3mfwD/jQACKN8or75
         yEZg==
X-Forwarded-Encrypted: i=1; AKwUvBzSp6QzCyrwiaRDyfqqK3hA59o5bXQyr7/opqNrwCd8I8Vdk5xvfS+yYVcC6ziVoxvPGvm/+h3+Xe+peew=@vger.kernel.org
X-Gm-Message-State: AFuF++m3/k6pvrLVxSWPk0ZWxSMlhqbWGZCdZ68FgK2hWMlHiL4wdSo9
	mfis2sCWKR8JK9pqwExBljQmajePcl9V7g7MC8dvDAZ/6A3OQDVnk7DM
X-Gm-Gg: AYBFou0Yd2nFJ1gCH0ThYOu3vZOvZqYYaa+UM1R4O1+yIvv3owLBJ6g+Qkj5goWxajU
	0Bb0VSyGKL19JrpEMIi+9F77qn95VPX90/i6eifx0TIUsje1WWNSUzy/J0gQj+UUZALKnG7nXiO
	IOpRRrk0V/R97VAU9MX40gIl7CSf3ftvrLKDN4O8THFJuUdIgg0oKPTpUIe1tjL+jDYq6rU3rcu
	tSVfDjB40xn6GKxN1H/sts3up7ao/5E19rYLKRXzq1u4I5Bjg27HFL1teqtDxLeOScZJdYD0W56
	9Zi90FHV+YwnS5hfAsTH7cijQTqoj7PDXAA+QTqkF+/1Npx44cTmJCIVJhxpQUeGh/G0FyIS6V5
	9bndeghXkt7oFJtlSzgiwwfwSrBqefTmJR1lN31Xu/+2/Oi3iOKIiRJ5bHzRkQ0/AS/cW9kBqRV
	f0NwxlrfWqmYrjv/l1Dl0zO+vkVLuaS944MRxxul/GVejNsQQgm8wMi5YyPHxqo/O9ULklAPZuI
	+9HJSwLS3XT2tNn8hnfMi9IXZnvZ74w2VDmgERtZKhrj43wsYJQxtYxsGNm2sX+bmfB7Hor4hT1
	LCPca7rzv2wNw8nyk7ke
X-Received: by 2002:a17:906:c115:b0:c26:22ae:b66b with SMTP id a640c23a62f3a-c2ac2328075mr821985666b.15.1790459525741;
        Sat, 26 Sep 2026 14:52:05 -0700 (PDT)
Received: from localhost.localdomain (83-233-221-53.cust.bredband2.com. [83.233.221.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae7353f0asm274704166b.15.2026.09.26.14.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 14:52:05 -0700 (PDT)
From: Yongzhao Chen <yongzhao.derek@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Ziyang Huang <hzyitc@outlook.com>
Subject: Re: [RFC PATCH net-next v3 4/5] net: dsa: qca8k: flag QCA8337 internal CPU PHYs for SmartSpeed
Date: Sat, 26 Sep 2026 23:51:52 +0200
Message-ID: <20260926215152.376-1-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
In-Reply-To: <426f9dcb-7473-48d5-a473-4435cc81312c@lunn.ch>
References: <20260923215858.1653-1-yongzhao.derek@gmail.com> <20260923215858.1653-5-yongzhao.derek@gmail.com> <09d669ff-7aad-4414-880a-21c2e7bf2cd7@lunn.ch> <20260924234814.1734-1-yongzhao.derek@gmail.com> <d2797713-9b92-43c8-a26e-bf3bc9817ad8@lunn.ch> <20260925210153.8717-1-yongzhao.derek@gmail.com> <69b36e16-eece-4739-9208-96bd8e60943f@lunn.ch> <20260926082129.1632-1-yongzhao.derek@gmail.com> <426f9dcb-7473-48d5-a473-4435cc81312c@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andrew,

> The IPQ5018 PHY driver does have cable test support, have you tried it
> out?

Yes. I ran it seven times on the IPQ5018 PHY under OpenWrt 6.18.44
(NSS build). All four pairs reported OK each time. This was a working
link, so the result does not show what the QCA8337 sees during a failed
boot, or confirm or rule out insufficient attenuation.

I also ran an A/B test on the OpenWrt 6.18.52 backport, using identical
kernel and rootfs contents. Before the initial PHY software reset,
both paths read register 0x14 once and unconditionally wrote it once:
either the original value, or the value with SmartSpeed disabled.

Across six alternating warm boots on this board:

- Writing back 0x082c failed all three times. PHY4's CTRL1000 read
  0x0400, register 0x11 read 0x1030, and the CPU link did not come up.
- Writing 0x080c worked all three times. CTRL1000 read 0x0600 and the
  CPU link came up at 1 Gb/s.

The pre-reset value was 0x082c in every run; the two written values
therefore differed only in the SmartSpeed enable bit. Writing the
original value back did not avoid the failure, despite the same MDIO
access sequence. This strengthens the case for disabling SmartSpeed
on this link, but does not establish the electrical cause.

I'm open to selecting the workaround through DT, so that it is enabled
only on boards known to need it. What I can document at this point is
the PHY-to-PHY connection, the reproducible boot failure and the effect
of disabling SmartSpeed. I have not established whether the cause is
the board's electrical design or something else.

Would that be sufficient justification for a DT property, with the
underlying cause left open in the commit message? If so, would you
prefer a generic PHY property to disable downshift, or a
Qualcomm-specific property for this workaround?

Thanks,
Yongzhao Chen
