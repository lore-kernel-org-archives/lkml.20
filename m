Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978806;
	b=0IUihQB2Nn7vDqlY2c+sVbO83H29EiFROp2w4RFKKCWDVXxQwI09Vofk0wmX0RjWd8at
	 hKweIGQo+J2/QdA7f7z3wDlCD0lELFGNk7hGEOmf51gs1N4u+j+TDDsMGU0n6rqs5UTFq
	 kHtxDWuY+y6tTWQks49q5p/IwfG9RjTJ+e0GV/ThnvsiAzDZu3Z+h+SJDyN1DxEucd4Mq
	 31BGW4PDxZFur4Kw16iViiLcnCgHnZtzbWLsQ1Kj3P+aKXlWeSJ2cRBqtqNskGMksqRUG
	 Vgd6utDnCloZKfCsN37iLuK9JibjlaToo89kZVjPvRizI4g4NVeVRFnGqJ0ZZHX1l6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=PmLNQiM+b/i4yqiaouUxqW99UCTEdSgvgxVnHneaHPg=;
	b=GXn816XmTpPJiGZtFLRgSdcuDCeplgH77SVjrhMm4W/4UuoQX7iTwoQLTJ7kbE5CDAzK
	 oEmMYiZmOdUPZ8lzNbMavaISBMdjfP19BSoV6f4FePX6FJUBgM3Wlw33Ehhi4DUCgSax0
	 6sdz12mUA3aAsQJ0Erm7u3SzHQMQOuC2tkvaOu7blYkqFrmb980oKCdk2CxjzFGSlbhoa
	 fkaFXy92NzCCwsoQxX0ryPWt00n6pO2EzoP+HL2JOKpuDUmYPc4g8u3b1uMQK2X6Eob7+
	 VrZi6K6pmEvpHBAYwxH+HtWTRBu6dCATigfq3jfKzuCLnwl8Wya17a57g7NkxzplNCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=exabit.io;
	spf=none smtp.mailfrom=exabit.io;
	dkim=pass header.d=exabit-io.20260707.gappssmtp.com header.i=@exabit-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hCkNAcN6;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88031606D82F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:26:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88031606D82F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exabit.io
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=exabit.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=exabit-io.20260707.gappssmtp.com header.i=@exabit-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hCkNAcN6
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso298537a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=exabit-io.20260707.gappssmtp.com; s=20260707; t=1793978805; x=1794583605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PmLNQiM+b/i4yqiaouUxqW99UCTEdSgvgxVnHneaHPg=;
        b=hCkNAcN60l2Vf8447IZf1hvw6DltriamM4yE7Dvse2dLymANc9tml7+AoF28aZovRF
         oYxUPZ0IZy8oNqX1yM8/Uu/qfVn8U48ADg0sPwQhLD4NL6iqjPQnCQpO77Dd0uHD30SJ
         YnvCHIBodcy47vLzcl+4bMySjQsxIxJC2YZ0ApUrBdYb6+tSBi6L8TIkr4Fvav6cUAQs
         YEwx3EdorBEs7iddltZUscP715ujCx/exiKC3pX8sQFSLRQqxcksa0iuNYuzQPpH6joc
         pM2DVS7KI4AXhylI49qlcVcbg4Y3UE/AaFglnvfGjBMQpnLtm2FCGcfcmdjNzMh4kCQl
         rB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793978805; x=1794583605;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PmLNQiM+b/i4yqiaouUxqW99UCTEdSgvgxVnHneaHPg=;
        b=YjIZjfvk8cp3Th5yF/D1On5gnyBPQ+7D3czLKf4pcHorpH2YfRpHtRbfdXeR8WY+Dj
         dm7k8of6/9UY44bnfItk4Ur6GYLNKS397WrYxrz2/CPFKS64hhVDEBv9UNLCWayOMo2q
         M5fJjLd/Lu4ixuMHJEfNMhprTZLq8gfk8WpEqbFdHHqoGTF/LVbn4kvcZ3pzaxgezZSo
         KGcQTxCDordW9IvMRT40dapm9MD7Acjv5D7dFQNX/0mEDSkvdZTS9lZ6ClIMuvcq6aI+
         bz98UfF2fAn9D+e4ya4OeRW2fG+DbTGJ7Yyj5oIWmFlrWGqXJdC1Ij6SJvwd23DVD/r9
         p6pw==
X-Forwarded-Encrypted: i=1; AL+hErHwiZllofTmqsdikCITP8KK4XccinDpq48QwOrczW0PUwDsTl7t3CKdQoLjUsjkYcYgarh/Mb11fS95ilE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eDkw/vYgWlTAMjk1cDMViVSzKm4cszPCfcplLDGJ14j2XMDqQ
	HU0IoBEeX4ajOOKb7M1SzGANlkqyAYSFYeHIm3YDdFqHOru4wH62offvdPbjFZqVQVQ=
X-Gm-Gg: AYBFou00XHuGMeV/LkSsioDKKKExSOEwePL1dTOkKe5UbTjCrt4pZMmbflMTJqokaT3
	aPE8w5IjOseEo2OSnRksr1O8a4ONRupj6ccieHm0qZAfLW3466mcgJ67Y2AD46nADkM3/s+wwhJ
	SItWzJ2pEgAcq5COrBgZKN3ZrhvJfAfqLSzK2xFzr37J/aTWpps+nQpOXZ+OLojFjYgYTH7a2iO
	QJr5BZ+EE6rFzjL9vVWQ9RsycahMNVi/YfpaHoKwqXKIkwqyb+PkmfqLc8zy6x/Yeb+6khmEGK6
	4tbY0aoxnRyGV2KOKM4BjnsR0UHwPEC7wEO1NVAkj+iTmXMm8OEulRagmXAXyHLKCo2q3DWC0rM
	Q5Yp9fMzLRGLm0+M1J/5hiMhc+VvVMPrVxTX94nUu1vIYdfTkY1vbWoXb9iSzwyIP6auHxTQs5B
	qxetKq4jL4C6XjcYt0l874AWAj0XeQRUZFENDM58wzKDGbGrnJM9HkgZ9eEkyNAxDCQ/UFW+GEC
	e26PWtt7lEVh0gb4CLdSGQcy42x0A+PPbtGZ3+GINzJ1yl1kqB6AVV/vblkm+DewXwwhLsYtIGt
	Km7w6nnFbx04tzfROR4GZD3OJfco8jUNxFEpjsgbdNcsNGYE8WUGMM5PpEOvXfiXjk2i1Kn/2nq
	+0HXNCZxUt0B4TMofRQH46gI6EqjiAD5RLPZF0PYsTmXzTgdZrfyqVQ==
X-Received: by 2002:a17:90b:1802:b0:3ac:80dc:f407 with SMTP id 98e67ed59e1d1-3b0db71871fmr2694763a91.60.1793978804517;
        Fri, 06 Nov 2026 07:26:44 -0800 (PST)
Received: from macpro2019-01.. (c-24-20-225-94.hsd1.or.comcast.net. [24.20.225.94])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323c18fsm8112112a91.4.2026.11.06.07.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:26:44 -0800 (PST)
From: Nikolas Joshua Britton <nbritton@exabit.io>
To: Ilpo =?utf-8?q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Maciej Grochowski <Maciej.Grochowski@sony.com>,
	Geramy Loveless <gloveless@jqluv.com>,
	Eric Auger <eauger@redhat.com>,
	Alexey Fomenko <alexey.fomenko@intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof =?utf-8?q?Wilczy=C5=84ski?= <kw@linux.com>,
	Mesih Kilinc <Mesih.Kilinc@sony.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 00/14] PCI: Resource placement algorithm fixes
Date: Fri,  6 Nov 2026 15:26:42 +0000
Message-ID: <20261106152642.23118-1-nbritton@exabit.io>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106134341.39493-1-ilpo.jarvinen@linux.intel.com>
References: <20261106134341.39493-1-ilpo.jarvinen@linux.intel.com>
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

On Fri, 6 Nov 2026, Ilpo Järvinen wrote:
> There have been major changes so any retesting is appreciated (the
> 4 candidates patch is largely the same so I kept the Tested-by tags but
> everything around has been changing so even that is on the borderline
> when it comes to the validity of the existing tags).

I retested v5 on the Mac Pro 7,1 from my report (two Vega II Duo cards,
four Vega 20 dies behind two root ports, BAR0 resized to 32G on every
die).

v7.3 and later don't boot on this machine for reasons unrelated to this
series, so I tested on v7.2.15 plus 5012a6953208 ("PCI: Do not add
hotplug reservation multiple times"), which 11/14 and 12/14 depend on.
All 14 patches then apply as posted, and drivers/pci/setup-bus.c and
drivers/pci/setup-res.c come out byte-identical to v7.4-rc1 + v5.

Every BAR is assigned, both root port windows are 96G, and all four dies
get their 32G BAR0. The first root port:

  pci 0000:06:00.0: bridge window [mem 0x9e800000000-0x9ffffffffff 64bit pref]: assigned
  pci 0000:07:00.0: bridge window [mem 0x9e800000000-0x9ffffffffff 64bit pref]: assigned
  pci 0000:08:08.0: bridge window [mem 0x9f7ffe00000-0x9ffffffffff 64bit pref]: assigned
  pci 0000:08:10.0: bridge window [mem 0x9e800000000-0x9f0001fffff 64bit pref]: assigned
  pci 0000:0b:00.0: BAR 0 [mem 0x9f800000000-0x9ffffffffff 64bit pref]: assigned
  pci 0000:0b:00.0: BAR 2 [mem 0x9f7ffe00000-0x9f7ffffffff 64bit pref]: assigned
  pci 0000:0e:00.0: BAR 0 [mem 0x9e800000000-0x9efffffffff 64bit pref]: assigned
  pci 0000:0e:00.0: BAR 2 [mem 0x9f000000000-0x9f0001fffff 64bit pref]: assigned

The second root port (14:00.0) has the same layout at 0xbe800000000.

Compared with v4, the two die chains swapped ends of the window: 08:08.0
and the windows nested below it (09:00.0, 0a:00.0) now sit at the top,
with the 2M BAR2 at their left edge. That is the case the dropped
nested-window fix covered, and it still assigns without that patch.
amdgpu binds all four dies and compute across them works.

Tested-by: Nikolas Joshua Britton <nbritton@exabit.io>
