Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794507086;
	b=baNtkPAEYLGmLhmmgZ2jXMLLM/MU3H+qhfPvfn+Oz65qFnkG8MUoD4InXaLNLNFYyfWa
	 yX+Jw8Cy8w1tdLeweZZTX4W3+Zhob0iS2TZ3PedrfbFWshy3OArLsM1eu9qjY4+62BA4z
	 If0JboOBgd9OTegzTz3IYc0thkilCq5CPqbW2ahd2kW1hynat+BedBmMhnZsyFqS9Jfw+
	 EtjFroyDsd5ILw0rdWA0AKrQ2CYJl3HqR9bh4fdhCs5/MMXGf7qYqANxwQvh+nRvY+f82
	 zJ0/mTcIE1tjYQO8BJVh7ISh+Kr8n4744SGrvrq5DLseQtZs3movqcJpQuiC8I11PxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794507086;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=h3F/2mZ2taGXkpMtbtIAiV+m8bah+vcbwSZcHemW22I=;
	b=05i6urTzFiqYrTk5cETAkySVUVzDv1rKFmulU71VER9CgyQHLnWfSVfEGpFTNWMRkChC
	 K+CImbLHnOaV4XSBd0H+lOKAd4ohDJ+WE00Oho9tNY7OYH58K1HtXbRi5nRLof/x+VP+H
	 SWHc8Nes5+VmUvtA5n6OY9UYjiQ4rTItzXlQNedQHLg04xssq+ZeyieoQiSh1I7tVnQfx
	 GHKOwanNuHaHh8gA6Pd1iH1nS1ryhWjPwc1slR/7h2LJOpqTPz5vqWSSq1vL76OxdxVzq
	 D7RDPg9NW10kJrTZtc+JWIJ71UNyq8nyLnuQ7l4N2UfXIzRku7Lq+Wofy1Pkcke20xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V76p3xkm;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019A0606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 019A0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V76p3xkm
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36a315ed211so99925eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794507085; x=1795111885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h3F/2mZ2taGXkpMtbtIAiV+m8bah+vcbwSZcHemW22I=;
        b=V76p3xkm/46ZSUdU6l+M8k14Zk6kK+BM6b6JdhDJ9ccgYu9DviRjsfmv+nBR+OXvJN
         EvAbsyIUk3zfxLbZ8+tNgfOPuZob3Pk0o3yiybl/aLi7m9kYa30ZdxdNdB/WaBFAC1nq
         KTAUXv5rVWFZqYHw2CzTjKkxQQtdgusVHGSHEWedOPoTfOy/yOOhQvGuXWxFzoIMAWKX
         hfxdd0Zdox2KJteMi181hwXiMcHAvQzbD0yiEmpUlZQianqNUoyeZo+kOTfvWVgrI7x+
         bnVfrfkDbYz1Dhn6k4+q5u5bmaUvDaK4i6sPDXpoR1Ige4Ek57b3RGg9ZJTjc15yA8TW
         co0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794507085; x=1795111885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h3F/2mZ2taGXkpMtbtIAiV+m8bah+vcbwSZcHemW22I=;
        b=0rzu94XfdIyYjzDd5hbPsNM5yk+L/1goQQ+PLM6cSQnXT3nSML2NyhFepXj/hUGsnT
         2Cy/8m+Y7Pt5G/0+invOHrQYjzCclC22UUbK8QD4cGs6W4JHzVDFDOB4ex/HrPSwokdO
         f/cA7ZnKuVpQxPCgDCWQCZmS4xZiYoZqcnjCga7hPvpqyerU5f09ADkYm97IL65HHZAh
         g1O5bxvRjO47Grn3YYRfmJ4oBFlAb+Xo4ZCHJEiskKIKi2RmLvB1+izIWxhgcYmOfaO/
         e37daWv0yhwULOTcGvM3Q+Wa+rzOAJAqiG60AqHtlDqz0Z1lGikyZz4i65e7qQhsZVJz
         Bodg==
X-Forwarded-Encrypted: i=1; AL+hErFEJ+hFk6YyVBOJbF6Ei9MwyKT8k/ztHxqL7+IXbpVE1fwRx+4JRtJLebXkm3X++YnxTvMS/WxTEiL9wVw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZZKycOCc5RpnqtUu8aR2hr8fcgX19KmDZ97Dtucupxe/kucjc
	E3XWN6IvTqDVb105F1KR7H86RUXfImtsUcROnUPOowHNuQXgN5GhFXFj
X-Gm-Gg: AYBFou2XDnJuFI+7NxSSvCnil1xbVlTpeOmQSXTUAzAaiyyTWc5vdMs93f01zjNj0tV
	vOxVEe+OPbFhGs9RMDXHK3wDTlioPb9Gv2NkzknOvjry6iY1GfIASBtNSAX1HIXjju691L0bzG7
	EoyEy79ofeAfmLvXfUTBtd5RvFo1yQPPECx48utUX3N5pBPjVSNKoNbVBvxOgWWIwcsnE0g+HWl
	0+oblovqPOzl9PpbvpbQVehPGk83Zha3q0eIWaHgGSbu+djv2Z4Ldg5BVnnP66K7kyJLVqsZmI+
	nZmrcgEWzYskkF/l3BMyw4DrqTyvT0dYeCAhKYO8VqaK88G1OeNgsRvFxeAedCVQFOvKHyev1RE
	9FTzjBysSTOQbaVCC8RdX7aLPLHiWARZwU3xmjnxwmpc+CLSe5ATeOzXsBycVYhcAI69A1MK+1C
	bWXS3SqWIVLem0kWxvxkLrftSabKCRUhPCgUpwV4azWcV18fg48pPi9OPnuHuaVvMJOM/s1hpqA
	q5gE3QOUbh33l/dvsekxFYSB/1QpzPc2sRdEuFrkiZoIonOfJKEHrKFTfv7z254sbGl5leVi0Cu
	EA1gkFbnxmrhQijefvW3hUWAn15YMB6RkUfEXgAXSQ==
X-Received: by 2002:a05:693c:8115:b0:36d:bcd7:2347 with SMTP id 5a478bee46e88-377e093db88mr2800214eec.4.1794507084838;
        Thu, 12 Nov 2026 10:11:24 -0800 (PST)
Received: from Alienware-m16.lan ([79.127.217.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332a77sm215678eec.4.2026.11.12.10.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:11:24 -0800 (PST)
From: Andrew Luebke <andrew.luebke@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: Aristeu Rozanski <aris@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrew Luebke <andrew.luebke@gmail.com>
Subject: [PATCH v2 0/2] EDAC/i5000: Fix the slot loop and re-enable the driver
Date: Thu, 12 Nov 2026 10:11:19 -0800
Message-ID: <20261112181121.565824-1-andrew.luebke@gmail.com>
X-Mailer: git-send-email 2.56.1
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

In 2022 i5000_edac was marked BROKEN instead of taking Aristeu's fix for
an out-of-bounds read in i5000_init_csrows(). Nobody had the hardware to
check that the driver handles both single- and dual-ranked DIMMs [1].

I tested on an HP xw8400 (5000X, four channels) with v7.4-rc2, KASAN,
UBSAN bounds and EDAC debug. Without patch 1, UBSAN reports at driver
load:

  UBSAN: array-index-out-of-bounds in drivers/edac/i5000_edac.c:959:20
  index 4 is out of range for type 'u16 [4]'

and the same at line 961. With it there are no reports, and all eight
slots (4 x 2 GB 2Rx4 in slot 0, 4 x 512 MB 1Rx8 in slot 1, both branches)
show up at the right branch/channel/slot with the right size and rank,
10240 MB in total. On 7.2.14 the same holds, also with 4 x 1 GB 2Rx8 in
slot 1 (12288 MB). A two-pass memtester run with the driver polling (two
DIMMs) saw no errors.

Not tested: two-channel boards (5000V/5000Z) and error reporting, as no
memory errors occurred.

Patch 1 is Aristeu's patch as posted, plus my tags. Patch 2 reverts the
BROKEN marking and adds me as a reviewer in MAINTAINERS.

6.1, 5.15 and 5.10 do not have the BROKEN marking, so the out-of-bounds
read is live there. Patch 1 applies to them as is.

Analysis and test kernels were prepared with LLM help; the tests ran on my
hardware.

Changes in v2:
- Patch 2: add myself as a reviewer in MAINTAINERS (Boris)
- Patch 1: no change

v1: https://lore.kernel.org/r/20261111232529.407154-1-andrew.luebke@gmail.com

[1] https://lore.kernel.org/all/YyxpbRkuLPIcW1Om@zn.tnic/

Andrew Luebke (1):
  Revert "EDAC/i5000: Mark as BROKEN"

Aristeu Rozanski (1):
  i5000_edac: fix slot number passed to determine_mtr()

 MAINTAINERS               | 1 +
 drivers/edac/Kconfig      | 1 -
 drivers/edac/i5000_edac.c | 4 +---
 3 files changed, 2 insertions(+), 4 deletions(-)


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.47.3

