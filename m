Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794672595;
	b=MkV8Uz0YMd7IgeYPtfD/nq+CkkJkWOz8ke0RQ1dl2GT4JHivMol+qJnZb1qefjickxr1
	 g+qpYMmO+maZ3DcdSpBSAXa7AibM77lapBK/x53LO/uedThncehPeMJxPy0t4AEDoBnGZ
	 gNhp9tFNui86KrHkcoIwaQiT6DpOBg4Kq9AHEMfIIZQR/BOomvbzAov7clWrcvvhjaxiu
	 iddoJyLMtrhI3bfx6Mf1CSl2iE4iHTqVG+Z2cTfN8TaZ9vcGjOk0G3Q+Vg94TW9da1kqG
	 E4cI83/vQzyDt3osk+EM7SW+fkYOktVarHGChTgJI0cTQzTa49N1/At/Em6k3KOAOXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Jd91Zwd/kmiwKW4+PLimd5fenaYkPvHETCW1wh847os=;
	b=p2u1jQFQbcJdtvNrbcORPXDQ+GsHTX29m4wj1QhC+Cpy6CQ2Mfb+cDkhiXj9bbsXbMC5
	 de8LTdOa+wyeDvrw6CSbMpkFS/CqmAJP1KawhtxBNBhTLzxSHQ+eMu7C39u6MfwnuyauQ
	 AM+IcVJKXBlSBgrHPlSC8jA9lgPpAmYPSY1ySHvT3woGnMQpVvPO//OAz8eLiWepaUNp9
	 sNjsCWh4Fm0uRqruvir2Xn8/Oij8r1+wvjBFB0C39+zseeHdfp6vnm+uuxziqhIAiMHZ1
	 BZonHXIaCyICtufWFsRjFf96X3NpX8dHuytJ7o2+tA1OL3BniUZ1DwHxKpT5KrKQ8dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ixFnXvAr;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98512606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98512606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ixFnXvAr
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36f8cdd30beso2135538eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794672594; x=1795277394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jd91Zwd/kmiwKW4+PLimd5fenaYkPvHETCW1wh847os=;
        b=ixFnXvArZqS0nOjkIjfV31W+fUV9CVbdsukSilj8mL0nf75pnBQfkYbbeUnXS03uL1
         Ll0LVzsyivFQOIFTeOnzIrR9vhpgzYAlP3qGhyWVaAN5CGvBoC4vvKT07oI/FOtGKjqa
         UnrgtZ7bUQ3PU2yRRzK7NRoy4zWxkcESr2g8jVXu7/vguPSHcbCGX6vWkmF8/zG2e/Bs
         3WM2TlqMOJWqQOv0HQyB0xH84McuETFZLEXaTfc+U6c4hfIOPGNVzrjRw+bRdfqtBB7t
         cMMbxqGDDQcRSxEDoiO1AkMBt5b3kW6Yl3ZWJdBfA9Z1bB4eecyLwrwQJAaAHVWbxcAj
         nZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672594; x=1795277394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jd91Zwd/kmiwKW4+PLimd5fenaYkPvHETCW1wh847os=;
        b=umU9R5sXEeqMgDQy7AUqPzfBHgSkJIjYlSZ7Eex9ZeADL5ae0OpVmcGBpoOk474nK4
         LPP4KIIG2QTit/BXvItMDEqe5yrVoskhA9jjXTZLq3yaGLK6EdUbRXzfJGNA0tjKL8pK
         WNU96dLUsPUEBXmDy7fHwz6EGyL+/Nzp5zAD76LAs8OOxoUgCT9aiYBNVi/aKW45b/CO
         YGUl7M8ZkeNG8APWsDaJEV3bEff3aBxLsqr8j9CxQ7cfgFN5SvvJ3g0A7k7ZH7UPGaen
         +qTZVeYCaSWvALmtE+smhIs/BQAc9V42bVzCeY+ks5tAWr6ng28attJUOTuvvHRY/EoZ
         Sfiw==
X-Forwarded-Encrypted: i=1; AL+hErHo4wsvPmeuaDWqf89oAV/RYK672b5DXCAYuxZQJSnYbBfKELU5ND1VcCBCg29Qzn9ClTWnYI1YAZQ5XQA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NHyblr8JXyhjGrK8CiVeI4YkxgKkBxQJPdCP7VGC9owkpw1WS
	SvoNsAHCgzETfXLdvRo5ADg+NZUYwYngjf295+1q5vDHjeZyCHxprFU=
X-Gm-Gg: AYBFou29nBvMdXdoD+4k28sCQ2E+jJ+S0VMmSG215rl17OGbEzzP4SKPBu8wIBg7a39
	WaH7d3zWQNhETiuDJ2VIIkDfjlme2HaYyFmrmZqfsmTCewvpBVmdu3BjcdqrEgXoY7FhRJtdqQW
	5idDJk9wyD+HV8uj4lpHIQbCvRDZf9mHIPDX2nQ5RxFf8DTzdU//hwDVs2IAmqP+vCvboAD/hNl
	zk9dTBVi3gpTZJwsfB1ptoJ+dJaQBDQO0Pg4TBlt4fzWg4qD5trLzYS72bh8AWyGM1ofG1tDxCV
	Tq/heO2QYJKlY6G5qOC527275fm/VllmugWHBjQHumR2iSUueGECt7xBuE59802Ew+9SCL0pc4t
	OoOuFa78mX8upv0xSRfyqj3LLIjABAkyyFRSPRTh6l1zNJa+dJfyHTsXZJjcvjor0lnVvXAS/1z
	2jqmUU1cs29tVRpgPfy0uXa314o4dIr2pClUUys/FCUb8I7DCjuWmXrd3NyhI061vPsDdFeboRY
	El8SrKxsoOylvzCeRq1/0rOA6Heh8TKaGl73NxMfly9+HqCmlYToV2ezQVMLaEf+g8X5/ieRcEB
	SucpoTHL5uIkPFPUSNsXRtmEIi382cvQDcyFwFsRgj2G+GMRqQt9UDnXyABMlxjSuHm9jFEZ+Uc
	BO5uKpdWzlvI=
X-Received: by 2002:a05:7301:4d16:b0:36a:1d6a:596b with SMTP id 5a478bee46e88-379675feb32mr5897107eec.29.1794672593531;
        Sat, 14 Nov 2026 08:09:53 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.202.127.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0919sm17567582eec.29.2026.11.14.08.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:09:53 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H. Peter Anvin" <hpa@zytor.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Kenneth Feng <kenneth.feng@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andre Eikmeyer <dev@deq.rocks>,
	linux-pci@vger.kernel.org (open list:PCI SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	platform-driver-x86@vger.kernel.org (open list:X86 PLATFORM DRIVERS)
Subject: [PATCH v2 07/12] platform/apple-gmux: Add documentation about iMacs
Date: Sat, 14 Nov 2026 11:06:31 -0500
Message-ID: <20261114160731.3756-8-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114160731.3756-1-atharvatiwarilinuxdev@gmail.com>
References: <20261114160731.3756-1-atharvatiwarilinuxdev@gmail.com>
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

Add documentation about iMacs

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/platform/x86/apple-gmux.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index a1b7a4709..4f5c98445 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -444,6 +444,11 @@ static const struct backlight_ops gmux_bl_ops = {
  * switch the panel and the external DP connector and allocates a framebuffer
  * for the selected GPU.
  *
+ * There is iGPU present on iMac's aswell, and we can enable it using apple-set-os.
+ * But there arent any display lines going from the iGPU to the display. iGPU is only
+ * used for offloading then, it makes sense as iMac's display are massive (4K or 5K).
+ * A integrated GPU won't be able to handle that.
+ *
  * .. _US 8,687,007 B2: https://pimg-fpiw.uspto.gov/fdd/07/870/086/0.pdf
  * .. _NXP CBTL06141:   https://www.nxp.com/documents/data_sheet/CBTL06141.pdf
  * .. _NXP CBTL06142:   https://www.nxp.com/documents/data_sheet/CBTL06141.pdf
-- 
2.55.0

