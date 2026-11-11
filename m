Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398992;
	b=5cb4xR9jazqYmhCsoHmfoKHcCoV7nsfwDtXfxgcGlmw2Ep0mqDnrrMhaTBm/Oo4yRej/
	 0RjObutbI3RoTu72CFyHY2Wt0lsRN3+p/aZdLr4FeQzBfbU9cXKGpHJGcurb9Iusnzm8T
	 4g7HvzkSyydZN4z2fWUuneGIm3Vm4kL8TBQ1iRuBRQeGojdDNQjSFiEnKnhdmsVfTF++G
	 28H/xS7CO5HLQhv2Lz9+Q9CU1EQp2LBJLBz7j7htRueatFUIHGIV59y9mVD572ik0BATY
	 FH4Np9X9wmPkJyNqh97Y/ztwaJVfdU64vCdtU3sy5QXcwoV4ZwplS3RYXwukuOV17eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=8kDTQyiKQOfIkOGO/u8mg2T8m6Y6HEmmU0F0HKV40UE=;
	b=q8woGIa9PHkxgNp5QNTzCW67UFip3/+nBTFfD9qM8E2iC1OUrRKa3llttBq+yQT81iXz
	 2KsgZrQa2h4SKeT6tNyU52kz1kVLHPOqAzO1SXBn4qIefvzvl4VJNf6Y3xQ/EtBFV6Irs
	 579YB0YAKB1dV+yxIjx2aX4XfCq4riYMIDEUxmTOS432SemufMeIGhipRmljw/gLuvyBO
	 TJ1e9JaA08FEpUDvWkEWF6c8qvHzuXduZ4AKUZ5uy726//KJvpgoEy0Aie6XVSrdpzufa
	 52RjWgGyjMbspdsnc35nvBzPP8TCHlsyPEqMG3LTsu8I6OEIoy8gKYX+ngj1HDUOREg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k5TWTw6+;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20B4606A88D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F20B4606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k5TWTw6+
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-55e0090c580so990793b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794398991; x=1795003791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8kDTQyiKQOfIkOGO/u8mg2T8m6Y6HEmmU0F0HKV40UE=;
        b=k5TWTw6+QRchA1PQTS6oYaZ4PuODw3xmmgrU9JTcYXc6nGWjpHL8uSg68S7qe7XTz2
         oeqEBJrUspxe+o629HHec6dg4bPIG+7wI9+glwyPUFF/iYZxZjTqTO9QxjbzGSOjSONZ
         FEjhF/qIMBX10Evv376qVg5lfidCBavTyDN0E5tbzevNXotJVr33CrDxQ5FNkACBc/Y1
         YXS/V0hJ6xz/e7KW2Dh5fsxDh14z4P7rhUrBnYunE/EF2M3y3pNUwpbMvxh40VwgBsCH
         CoyQuMqM1hyxsDn9wzJFA0cbjJKL9dsJRW1fIKpN1mNhQvI9PpYTrdPdKe0qq2X+aJiX
         QzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398991; x=1795003791;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8kDTQyiKQOfIkOGO/u8mg2T8m6Y6HEmmU0F0HKV40UE=;
        b=cCXSJ51A6bCfH2yxcf/vVmnlZGnZqR0WIJMLTEP+0IVfmI9aac8PY+p1oGzTeXe7Fq
         eMrk/eCBDf2nACbr3NUKnDRphCPOzBuofvpn2L4E/f+gxfffHT6LpCmBs/8vtG5BDaFt
         s/zpWcIyPPxWGv1tQmCD+buRKn21mFqH5wZY9CcxAyqcTJhTIG1PDvBK+Trvoe5SS8Qw
         g8bShiKUSYK242YLnCmncvI+tvvOBU1NfTdrmOR4xa5U73vAqpC0rUBEdKojBTxc8Nuq
         6jJxxQNAsmJt+NO4Mna6C3AxcIBU9koJcSqEDYxRgMmUH6JSdUeQI9nEB4Gcv0am5psW
         r+aA==
X-Forwarded-Encrypted: i=1; AL+hErGPpV13mrNN3TL9uzTiSEVXLfaZjcK/6DheSeInRKheexIIgDez10Evz0bcRhZQu6K4AXtaf9lxRLHoYoM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9S92Lja7w17SZzF0Zus/qGdGgY9WfcNEtHbK0DNn82zcJJuUSC
	WEeq5IKEX+britFXAbK+LBy353ewmAP+EMuvtnuTxg59IqQPj0VFKJjj
X-Gm-Gg: AYBFou2YEAfzag55WrBngMEaJY2hzMBfEPGLzsehWzUc7aK7HreOEDjdkyIL3BVF8Gb
	fGzeUDv/bn+u8zbqiYVQw2DNMkRtm7Fd+H6qMp1oRsIWPoYFk7knUVppIy6JPc53AQZiYgAz26H
	5BK4uVX2hx+LgpkrcM962d7zwxvi+4GsML3IYgCmXa5MBJ5/0Vu3aYu8IV2ydjjTOsF+gP30zJ2
	NYLGqfJ0Dnhg3/tbNwtJeQaIH81sDwR03ngSpGf0HrV0l+0IbLcRcj740j8VxkO3fX1K/jwZeyF
	sJPKQoGugKX471Fwe8+7H8u9Ww8I/ieQd4aifPV+HCb+zpO6Xy1PP+FmStn7WXrjhh8Yw1UTq1u
	oF67BR6X7Xcn4N8VGSVx6OelK0Hqe8DL3h3AcxdGxuQx8zSWVcPrCKzrXv41zSZR0bkI/fixG/p
	cL/rSjkqfamPa5YStUqZlIw92skpRbk5AS72JPyXhDv83D79RYridVs4cLeidRBInYMoq+ZCk1J
	kqAN75sFkwhZuwjTCcjnKWoRCj6pwN3JNbV4nGJKGpuQUOtOUGNzoqSpxXqJrnCN4a3RV8P4ga4
	M+i9mBRR8n8K7pByiliCttxo/dQZfGfeVn5LJ8/c//V9AHhMa6u7IF59onGaAzKpzz5i+t1062o
	H5Q6Y
X-Received: by 2002:a05:6808:244f:b0:53b:1d13:dffd with SMTP id 5614622812f47-56b92c464dcmr1457460b6e.7.1794398990670;
        Wed, 11 Nov 2026 04:09:50 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm4958534b6e.3.2026.11.11.04.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:09:50 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: junhui.liu@pigmoral.tech
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Norman Herms <dockseed@proton.me>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: Re: [PATCH v6 3/8] clk: sunxi-ng: a733: Add PRCM CCU
Date: Wed, 11 Nov 2026 07:09:48 -0500
Message-ID: <20261110-a733-fwclk-junhui-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <DMQEUUHANG74.30N8VT6UGHO0M@pigmoral.tech>
References: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech> <20261009-a733-clk-v6-3-ae8178fce7e8@pigmoral.tech> <20261103-a733-ccu-v6-fw-clocks@gmail.com> <DMQEUUHANG74.30N8VT6UGHO0M@pigmoral.tech>
Content-Type: text/plain; charset="us-ascii"
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

Hi Junhui,

> I'd prefer not to mark these clocks as critical just for the vendor
> firmware. You can see my reply in v5:

I agree that native PSCI and a future OR100 Crust port are separate from
the vendor SCP on E902, and that future E902 remoteproc/mailbox drivers
should own these clocks. Vinicius's native-PSCI reboot report used locally
modified TF-A on A7Z [1]. Upstream TF-A still has no A733 target; its port
is under review [2]. The immediate problem is that the new CCU's
unused-clock cleanup breaks reboot with the firmware these boards ship.

On one Cubie A7S, RAM-booting v7.4-rc1 + CCU v6 + DT v3 and its dependencies
with vendor boot0/BL31/SCP/U-Boot and no clk_ignore_unused, the run without
critical flags stalled at reboot -f. With only bus-r-riscv and bus-r-msgbox
critical, two warm reboots returned to vendor Linux while r-timer0,
bus-r-timer and bus-msgbox0 were 0/0 (enable/prepare); five flags also passed
once.

> Since you've already submitted a separate patch adding these critical
> flags, I'll leave that to you.

I will narrow my separate patch [3] to bus-r-riscv and bus-r-msgbox.
Chen-Yu, Jernej, Samuel: would you take these two flags as a separate patch
until E902/mailbox drivers can own the clocks? There is precedent in A523
bus-r-cpucfg (1dba74abf3e2) and Meson AXG fclk_div3, kept critical for SCPI
firmware until the driver claims its clocks and a handoff exists
(drivers/clk/meson/axg.c).

I have not tested power-off, suspend, either flag alone on A7S, or other
boards or firmware; Vinicius found either flag alone insufficient on A7Z
with vendor BL31 [4].

[1] https://lore.kernel.org/r/20261011200153.575096-1-vinicius.eduardo.pedrosa@gmail.com
[2] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/55200
[3] https://lore.kernel.org/r/20261031020640-263f7b05-a7s-clock@gmail.com
[4] https://lore.kernel.org/r/20261005183038.417798-1-vinicius.eduardo.pedrosa@gmail.com

Thanks,
Enzo
