Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793140383;
	b=nZPcSr3IXdA1Zm5bCfdln9YwhK5+/RplwgLBxXm/7sV37H7CPWwlujTDWfmnR3Ih73HB
	 KVm1vUfd+1mJEJfCWiD+3ioibS9kwr66sG1KdcZK5qVBdU21uFSov4CspElW2JTMI0NlZ
	 JPjjWoraoMijpn7WlPOYXobSGbgvOJBfn2unK5eh31EqpGcCj40VPtDluhVJJhNV5LT4l
	 UI4Ewmta3BanJwlWb9Gv7M5+mNh2354X/SArJ+JRljRAwLHmPAPRjFj6FsH7yoGbYSBdb
	 wyDqDjqfY5eV7Sw3HKgFk4SEf2cVA7fFR+vGSouQLdm+AUamUk+pZqYfQ4i1R4+94ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793140383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wPmToGC5y+VhdITU4V4ZbBMK8thCOWUoBfhcPC5IseQ=;
	b=XbdDNMcDY8k3stc11XaQBcUmbRWoC9853cTVtfaJTUD9mcHNt8nu5t0t1Y22BRxdDbMk
	 O7dG3t/VZoYOiV2NmVSsJMCewmC7VjyUQCYEbiIfsB6EC3TqDaCOlu/MRsuyi6tKyrvJX
	 enQkCzxKGqw/ax5/kW7/SNi6ieOyDNVcXJsRc8p5qI+smq3Ed9Rgz2KWNt9+G43K/01qr
	 /0Jpe4bcIAU3qHXo+FvSSb9T2NriLoiV1EVcZVXXFX4HJMEo6wV8qTybGTb1rxJAbLhDP
	 rmXHu6JnbRioV2NXWC+oAfW2sO8j6riJRZAdpAnYRSF5C5W8n5DpkSFBPBP+ycnYrmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zBiEFTwD;
	arc=none smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD529606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD529606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zBiEFTwD
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ab3dd9681fso2431631fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793140381; x=1793745181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wPmToGC5y+VhdITU4V4ZbBMK8thCOWUoBfhcPC5IseQ=;
        b=zBiEFTwDZwTl8cqFp5k7k9lXEehhR311ilAWjnRrXxSambh0ergvTWvJRuc4/FtJmp
         kmJDji2WGMdQ+3q6hJ656D9F4DMVuXk4BfqGPGJoP4myicn2yOJ0FH5ft4u8PuPkGPp0
         Jg0ReBQtCAmkkSUW4U/9/ke0JLfSsnwl1hjY8Tw06D7UTz1cW9kdHj7eNOU4+hSkYGBl
         k0PNgTPqp8GrIdVvNBoqjwvsQK4HipEKtnG4eq75bStxH7HpLNpau4ifJlGHrhMq5xUk
         5JnKXhGYVYr4dcDN6nf1XWXx2tZvqbqo4jFVm0wvpKBu5bqgQ1Cx0oHV4HpXxCmAQxnQ
         TSXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140381; x=1793745181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wPmToGC5y+VhdITU4V4ZbBMK8thCOWUoBfhcPC5IseQ=;
        b=kQYbkl7K9VnlFZGjWOiTiRV+j7oqF0BwkWosk7BCjThTumh3rNA+r4vT+ASXlkBauu
         7IGe1SinFwGVOW50RKA6DgFC04EedLJEFIZuhhKEncQ4rY32LqTATHLQEKVEhMmFnEec
         KouJl4+J09P1kjhILvkOK8YIxSxHNiQfrMRRAwCFMoB/YVh0c8akixRbY9gqzOhgG3C1
         d04HaEVoE03L8ZNNfl4ajQhPPHFBxTyqgLvfjH/HUWYY8hwhtTKtXq3r6GrfV2IpuLJs
         0RXLtTrj6PAhwgFp/o6t5qMNWENAlAy8ZJknGiIourCdmFvOcRcDz8ZnHsg0OcJta0Lk
         Rn2A==
X-Forwarded-Encrypted: i=1; AKwUvBw1qbJfJfL1tn9u/tNPO8I8uDIJylr7t9Dea/DOz7Y88sAa9J/VSH3XaOB9GDssaeR/FTRFsYwL8YJHqKY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/O/nOhkU5ZP97esAXudEnLqf5acmIKmdcAHK7Jx5AxarXLwZy
	X/X29noWA0F46qI3HDaZhirmSr/enGE0JSUYqDQRFbjWL/lknNRAqOOL
X-Gm-Gg: AYBFou1NssVMkTetqxZiF55oJTIuOB+4Tcg16KixkLZFtSE6GU1fDRNTehheq6wWAJe
	DxGKol2v/sKn8kBwzOsw00H2SBxrFoLtE6ODgTu0UUy6W8OxACd/EQNZaVnbRZhP/jVrbLF9A5e
	TDL2IQ2/8uC8P3JUU3Fa/MyFsRbxtjMeals1/NXSIBp8aE+dxjpfCncN/msWAVb6WaQkNLb8n5Y
	5qKodRv9xJW6g4UGdDnbvnZ+vuYOJldtenkzq/TBGiGIz6/j28eaqqj8ACZ6UvEn3CmWFDTWhOW
	G+g5euOOlyRkpK8/+icp0+V9oPPlJ4yr0HPvDVYxiyGMLelpTQjVjMZfWYT6QopaCF7UU2GCKSv
	Kz7QiDccSgVQVe/GwmvxGTe62jHLyre2xo6NDu1NBNU1ScVbb8a+ReN+Ntht+cJXPXyVAWaNhCy
	byHWq6f6siY1suXwaR1XlUH2IFdHou54KasQo73184nFGNcbXdwi6gWrzxJON/APRgl1oq6SUM9
	w/pU0a8n/dzS2z/kAs1OR17Z7xj9gy4j6IXwYFNMIIuYNgVC05N5Bo5cjTqgSh3+tHaqiaygXoU
	h7I0LM/o+v42LTFniRHhqRKrwoXQ4uUqtYyyE9+6jK4Tsij+6OD2
X-Received: by 2002:a05:651c:4216:b0:3ab:690f:829f with SMTP id 38308e7fff4ca-3ac9cf5b6d2mr759271fa.15.1793140380999;
        Tue, 27 Oct 2026 15:33:00 -0700 (PDT)
Received: from localhost ([178.214.243.78])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709d1c1asm27657721fa.16.2026.10.27.15.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 15:32:59 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Fangzhi Zuo <Jerry.Zuo@amd.com>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	George Zhang <george.zhang@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Calvin Owens <calvin@wbinvd.org>
Subject: Re: [REGRESSION 7.3] drm/amd/display: single-frame scanout corruption on DCN32 at 120 Hz since a637a140ab86
Date: Wed, 28 Oct 2026 03:32:47 +0500
Message-ID: <20261027223247.300463-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018223905.32324-1-mikhail.v.gavrilov@gmail.com>
References: <20261018223905.32324-1-mikhail.v.gavrilov@gmail.com>
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

Calvin Owens bisected the same artefact to a637a140ab86 on his RX 7900,
with the same parent good, and posted a revert.  On his machine the
band appears within 30 minutes, and the revert removes it:

  https://lore.kernel.org/all/25995707c39c0c191e3ac46c4813f55a7f928403.1793131583.git.calvin@wbinvd.org/

#regzbot monitor: https://lore.kernel.org/all/25995707c39c0c191e3ac46c4813f55a7f928403.1793131583.git.calvin@wbinvd.org/

A correction to my earlier mails, which listed the instruction
constants and the stack among the DMUB windows that a637a140ab86 moves
to GTT.  When the firmware is loaded through the PSP, the default on
these cards, the driver neither copies the instruction constants into
its window nor programs the instruction and stack windows
(dm_dmub_hw_init(), dmub_srv_hw_init()), so the firmware does not run
from the driver's copies of those two.  The windows the driver does set
up -- BSS data, VBIOS, mailbox, trace buffer, firmware state, shared
state and the rest -- did move.

-- 
Thanks,
Mikhail
