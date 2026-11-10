Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794275223;
	b=gbks1NTOhTVIPhMPeiXWg0JtMZIORRvH0LE1c5tMLXS0U0dJ6AeueIghpyO9RuwC0tNX
	 CZh3UrKKEdHba+T9wSctAX0jg0gDR5o3uNaVC4XSGpBUTzkvaiTBV8xfRCud3cyE93eTd
	 PhWCzXo8QnCJq+uXOqhmxEASCvcm2FleRJvkU/lAnH46KNkmUttPUfHodnPf0TjvufM6L
	 js2C0fw4IvcGSyaO/hLPa2JJtqElC3XlZgrVQskCnhj+jcKPgPpf6zdcHz9FGG5a0We+m
	 k19iRBOC2CY3PNPHr5VRqOC/OXeqp02efKdch0lhjzs6x48tqESBylivJBgck4j3/+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794275223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=vr6olQf0uNc0/a4nGcpEjf8EuC1NH5KXo4yVBRGMbwM=;
	b=zQ3A57+rFI9eMJ0U4sD/lgMwUR1+Cbqt0TUJuRiPMDhgDqB00KCd4Ju0h+2LpORlTmyX
	 m6VvBGD56DxV92XIvpKSdeWjHjMfDNmgs61kdiiSxSAM/3CZBNofeofVqSW9hawDTBkic
	 6sVkcYiCNUSpzUjRvMZ9OG97+LQMqI853crpNXfb9j5YmdQwyKfIarrdDjMlWs6uWi729
	 7whVzUgfJZZRX5hAkLSkk9Q52OgoKOt0v6xXCd+6Qt6/nWuJv7yqm80ERdvWYRFNtstXX
	 zBqyb+dwHTR5Qc8jMgnG2oAMT89T29h1KUZrnTMaIXWVE+Db3HaCvI0dFimA8q2IAbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x1az3SLi;
	arc=none smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316D2606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:47:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 316D2606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x1az3SLi
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67c24619b19so1483169d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 17:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794275222; x=1794880022; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vr6olQf0uNc0/a4nGcpEjf8EuC1NH5KXo4yVBRGMbwM=;
        b=x1az3SLiZi9fHGuFSM4mz7cGDNoBz0aADFQxFbVaISc8xoLmBE48mfr0I1WagFutg7
         gPB91nJZdn3VyUO1rg0joHsvIQA+Sklck6DIfAWMVh/4nbavM1qZJBV61jsSeTImZG+d
         doaEHm4ysob+e4YeMYpO33rbrCSzrUVc8BCr69t/89E4hIPtg46XVVHw6uhJXfY4CVnM
         aWobSeTsXK015uBq8ZR7utaJYEmuH2jl5W29V59AzyFwsXA78WPypxF/lM4p+Qgma0+S
         ekO7rz5jbTYmbBZlbHDpGalInf9y5bhoOLF8zyOvCd3mjD/RKT3gOFALUoQ+zqbgmXW4
         MDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794275222; x=1794880022;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vr6olQf0uNc0/a4nGcpEjf8EuC1NH5KXo4yVBRGMbwM=;
        b=dv6tp+wyxst2BXe7wfcksx/TCm8827lnyj05gAs4Un1kYddsCRUvl9nKKabloYzTs/
         O0+zjZRcxX+r0jqlPtPMNxJG82DENvlwk1QhRV/TunldhEbsq6exRJZFt1qD0pzeHQQp
         hJ72dM7rihZ2d1/h57dGmZza+526zMFXzzCmPdw6N50n7esxl2gUora8e+GOCLSpQsr4
         kL36ySVuGiIMfSSddcZwlAxbAaELQQl59t8Ke5cgAKw1EWcML0HQVlUpH4mYS+4suB5c
         BaDFoDQ0MWYsCRlE6aBrLjYn7JvkMNWwvFsV5ve2Q3REaBw9G3GO1dqEdKFZeqAiChpF
         qs/Q==
X-Forwarded-Encrypted: i=1; AL+hErHx6v85DQvUOITVd0q4TQL8PcN2OHVz1EPP/k0ZqxO4UaONHGUbFDabVzE9KQQpX8lJ8GJiw6E6h8xrRmI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ulq9MH6ApzcC6zDqstahekXtoeci2ltQfIlfiQlbjFAvkBHi7
	IcvKb32Kfk3Mlks1K+VYws9Glhro+ED3OusJSJdOgzCsZffLHwDia2nN
X-Gm-Gg: AYBFou1lE6cm5wSk3mPojj2jUQ5cYKJuWgNcoJtTNCHe95jhj0OHJfYL+rdYRJT0HCI
	GEmrgsTmnNpfpxrTt3fuYkac0vzdIwq2B8JhFSbMcVifHoE87AYMvkvdxNr9Vy7sISD67xYzCuy
	bZ47W0njERIDQ4UF7AsiBjCZISmJF40MPkgTw8QkkWnNMOTcNlwcLJClflERonPrl/P+Rovg8vG
	HW0lnnKzBYSedYUa2voZufShBh/50K5wmbiTKMvMJHl0Uh5Lx+3AGCDIY0+16+hKUT2MCU2R235
	o3M0QeTB1jG8hVmpnJvGtE2eaXIr9bRL3MJtM8+uZsh1ZX5uLMYi1hqSw642vQ+YBDBpOttLYQc
	quP5OWOzDNQZpBxcyziFINTOG/pwp4mYNg0+kCp4wwb0hdFVsL1pyWlK/FzV9j7a+TtZLQodJ4S
	UMnaT9hBLH4b4LVMmd3XOwnXyrgcOKYPjQ9HAImt0rzMgHPC345mrdu+Wy4fk41WPnjEPWWKqZ3
	eYan3kx+P3cpKMLlQ1smKwsrUi7rbbrVg2dvHx2ZA3i8i0zNKSLocwjesQoPP7D1LosLL8POcQA
	k7mAMzbacoiFSQskuuIfEw44vitnbEIUhSKKC6Ff+YMZn5exNiwEFcaalUnYQLTabbzRFdFmZVD
	eQAANOH9vhg==
X-Received: by 2002:a05:690e:408d:b0:679:ab08:5285 with SMTP id 956f58d0204a3-67c568c72e6mr963184d50.82.1794275221980;
        Mon, 09 Nov 2026 17:47:01 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589c6f24sm692080d50.12.2026.11.09.17.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:47:01 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH 0/8] powerpc/perf: mpc7450: Event fixes, SIAR sampling and
 sysfs event names
Date: Mon, 09 Nov 2026 20:46:59 -0500
Message-Id: <20261109-ppc32-perf-v1-0-a6e8a55b3b48@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MMQqAMAxA0atIZgMmioNXEYfapppFQwoiiHe3O
 L7h/weKuEqBqXnA5dKi51FBbQNxD8cmqKkauOORqBvRLPaMJp5xzYF6DjRwWqEG5pL1/mfz8r4
 fI+XZ9FwAAAA=
X-Change-ID: 20261106-ppc32-perf-bfa132a142db
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, Paul Mackerras <paulus@ozlabs.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1783; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=+7BXvgmmUAJktVVUTJnPsJZ3PxH3Hy9JzygYzXxr5Gs=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLI+lU/2/FN3Z1FD/i6VJ15HRA/MWhaswvJpz8Wd2az/L
 Fknr5rv3PGRhUGMi2GmmCJL3HpFllltO5b6nJb+BTOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GQIZOkbxEDk9Bo3M4uLS1CLdtIIih7z8ksSSzPy8Yr38gtS8gvQCvbTMtJKMjPyi4lSgEXp5qSW
 mro5uRoYGJpaOFmZOFo6mJs7OToZObo6Ozq5ORpbmJgbOlo4mrpbmDFycAjDXzLjE8E+l8fUT64
 syu28nLq8Qmb3l6V+LqX8KlDZNeuWkc1OtyoeH4X/0mgm9vXd8v555yX/29fy5/hbb9umZJ5WG+
 QUIeFVf2scLAA==
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Patches 1-3 fix the MPC7450 perf driver's event tables against the
manual (MPC7450UM Rev. 5, chapter 11).  The worst is patch 3: an
alternatives row joins three different events, so perf can report the
count of a different event.  In one test it was 374 times the real
count.

Patch 4 fills in the L1 data cache events, patch 5 adds the PMC6 copies
of five L3 events to the alternatives table, and patch 6 adds a format/
directory.

Patch 7 takes sample addresses from SIAR on 32-bit.  When a counter
overflows with interrupts disabled, the interrupted PC is where they
are re-enabled; SIAR is not.

Patch 8 names the events in sysfs.

Tested on an iMac G4 (MPC7448).  The 7448 has no L3, so patch 5 and the
L3 half of patch 8 are untested.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
Matt Turner (8):
      powerpc/perf: mpc7450: Event 0x30d does not use the threshold
      powerpc/perf: mpc7450: Event 0x634 counts L2 prefetches, not L1I
      powerpc/perf: mpc7450: Remove the snoop retry alternatives
      powerpc/perf: mpc7450: Fill in the L1 data cache events
      powerpc/perf: mpc7450: Add the PMC6 L3 events to the alternatives table
      powerpc/perf: mpc7450: Export the event format in sysfs
      powerpc/perf: Use SIAR for sample addresses on 32-bit
      powerpc/perf: mpc7450: Export event names in sysfs

 arch/powerpc/perf/core-book3s.c         |  55 ++++---
 arch/powerpc/perf/mpc7450-events-list.h | 250 ++++++++++++++++++++++++++++++++
 arch/powerpc/perf/mpc7450-pmu.c         | 118 +++++++++++++--
 3 files changed, 388 insertions(+), 35 deletions(-)
---
base-commit: d68ce4e71248e1ff5af9654b407541d9260b3ba5
change-id: 20261106-ppc32-perf-bfa132a142db

Best regards,
--  
Matt Turner <mattst88@gmail.com>

