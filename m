Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912213;
	b=XwqenOOslfbWf962IMZ6Izs65RM3LJpEp0xBQTcgwVFdpJ2ej7x2pG5nonyU+8VBWUcD
	 7CuIVks+4jYK8HVrnEOtj4YSZk3Gyf9vFzyAyzjEl44rMzrKEPAnVain6eMb2FT2hrivm
	 N/D9n4n/jA04MpLCibrd/ORSqffSYbcWU98p+sSTCEHJT8U0fa+7ty1sZJXJVmLblswv5
	 ooryYJt73nd5DDQR0i6tupMwpoNfVCe4HkEmEKpnCxPuO3Ngm/zuqUa3EBNA2O+o1EPJq
	 /oGBuSsYTNKpnza/QJ99LJGIaQqY5ucghzF8Tk/HYYF0WZs8SW50Rt5cfFoi/Fu4JgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=fWKlG9ut9OnjMEtwMHS/T3DByfAeHsUx60jI3HbYtPM=;
	b=QIueQxYgaulfBEcYQJuBCXlEjhlxb5Fa5SIQNInVskrLcSudryeFij2wphosUEbMT2Hs
	 5cknbBZ1jE83J9g7IZ44/lwwXkVCG0x1lq9cgFcCfoh75Qude6r5b+oeFUypbcKz2wfmH
	 uOVs30BEQqARhAzDBFxP9HoEArsBblDF3BTXicJ+Yt0MhbBwnTeNMMluv9KgkU0NdHwPn
	 IgX17B/4kbVLdJ9RNkoSbJW8GE1vh/yTDEC7f/HHvzSkPdH0khcmNf0ki3O548Exvwx5H
	 zee/Ve94NqESVTOBhrTs9za24RhA5C6co4mvRV71yeDSWanrTCMRuJvkRWFYm7F2mew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QAnPmUwK;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FF7606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6FF7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QAnPmUwK
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-49d64a88222so458834f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794912211; x=1795517011; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fWKlG9ut9OnjMEtwMHS/T3DByfAeHsUx60jI3HbYtPM=;
        b=QAnPmUwKicRTx4iRInpZcqPhNbEAaGbB4dWv9Evoal4CifofIpC6D7oUbrgXVF+6MO
         joZGzr6V/UDwuCGmlky5/aQKoVaMeVuu298kOV7dQdv0ox/yWFwlHheivp7PtqAuXhOo
         Ou4M4a5/AnL0x0L2HRDIhN9b5qZhyVspQbyd0bXKE53abcuORMwgdu80RTT3EwPQwwW6
         wIU7cFLLlraiUQSvOBJ5DpLsJ51Wh7NWwJ3UmOGIVesJOO/gXcx5cqELSviO70/xi/BG
         y1WknTjvwugybOPGG0ovXe2SupMjJISN9Mr2+SGkB9wGTQFvMSUTePlTM7qabndTqJCD
         b24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794912211; x=1795517011;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fWKlG9ut9OnjMEtwMHS/T3DByfAeHsUx60jI3HbYtPM=;
        b=cnuZSiNAzvweSs+Xduckk7g1dzqQcFJr7SwIG6F2Fy8ER+lnFTgyvjrRa7c5phQ+oD
         vqecjb4qQ4cWoP3JEeTiJPaIDJOqmJ78/FEZ+FBFm41yEwLNTQbVrc50z9U7jp4YWDFy
         bSstRrLh4Iu8ecdWm5VHWR2HgAwFnukFuUp/QqiIYJbx/JmRRGxETvCmC+JUa/HwpHce
         MhV+COD9bbrWklz/dPjNbpVQNlwEYX6d7szuvSDUdy07RyR0rN6c5IBNRpxLFYO6vSP9
         Vpq6vA+PYWOfk+d0DXfpMZh4b8a/rSjgSagqYnusKnZ1bAp9YSgpE43smwpSwvr5jFi5
         BISg==
X-Forwarded-Encrypted: i=1; AL+hErHiCZgh0W++DGJauUL5SQ3EvQxFZ0E9WfeJVdpci1+/9U2feUK/zOndED9PyVg+C/fswOa11SP2j6E6oKs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rK10oeupXbJIqdzcxH/lkhbZ0oRuYDj9N589pAaZ6rpsFMFwN
	/3IhrN+8tcmlNIaUUsVui6v/zNqfi9vskc8FW3Eln2GfgAtrOgrcGbtt
X-Gm-Gg: AYBFou3QCpY0UP6Kxbq3vTMAz+G+FufDWhJo98h2AO59YjWmLSXz8RN4Ax5StncbuxH
	oCezaGYsAVGBvI0ZVQTBO3heDfql019EiwsQVPJ965s5x9xJDBLILsAksdzbOev7/+5bYVpcPKN
	IEeNAJ8CxgFPz7sG50qaGAJQt+SZlKzeNSJRcGXNthK1lya60P06M6ySnc4f5ZjiXpqqspfDrMc
	kl8ce4AnmPpYWqkuQrkVnefJkAtw4Oqppz4CL6cTTt5PZsGNRoAWwbbAGg9WG1/q4rxQvtZOet9
	qdyzm5RLl3BiL26c31Z9bTteDCMdGkeGLcba8E+J+2uOqt/k7jvDcEolayrhNZX+v1pvBhlCEbr
	nHrKKFTP2cS93teKJWPtCpneSzP1CtH+H/xlmU0cjKnbbEJgXew2Uuy0wYoEjSCo8LDPZYD8sM6
	yitWyr0FogFh7le1sLGYNwpHSo4dxAxicT3xpQjNdQ8TjGZ391W+aNtM/uT2pTAFnRpwM6AX+QW
	TlDSOhIqijsSbSufKqMMmkzsV4Y+/sm2jMZZlX0c4UkvXohTtREtQgEZHr3Lkl8u/xrAuYysvNb
	ZC1FCfLr1io=
X-Received: by 2002:a05:600c:c176:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4bb7837a1d5mr49452725e9.5.1794912210884;
        Tue, 17 Nov 2026 02:43:30 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783e9288sm61091805e9.15.2026.11.17.02.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:43:30 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: sre@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
Subject: [PATCH 0/2] power: supply: add standalone S2MU106 fuel gauge (Samsung Galaxy XCover5)
Date: Tue, 17 Nov 2026 13:43:26 +0300
Message-ID: <20261117104328.1176951-1-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
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

This supersedes "[PATCH v1 0/3] power: supply: s2mu005-battery: add
S2MU106" (https://lore.kernel.org/all/20261116074000.355176-1-tadilhusrev@gmail.com/),
which I am withdrawing rather than sending a v2 of.

That series extended s2mu005-battery.c/its binding with a
samsung,s2mu106-fuel-gauge compatible falling back to
samsung,s2mu005-fuel-gauge. Sashiko AI's review pointed out that the
fallback is unsound: a board using it binds through the plain
samsung,s2mu005-fuel-gauge compatible with no guard at all, which
still exercises s2mu005_fg_get_voltage_avg()/get_current_avg()
against MONOUT registers the S2MU106 doesn't have, and the resulting
garbage current_avg can flip the reported POWER_SUPPLY_STATUS. Patch
3/3 of that series added a has_monout flag to keep the S2MU106 match
entry out of that path, but the binding still allowed the unguarded
fallback, which is the actual hole.

Rather than patch around that, this series gives the S2MU106 fuel
gauge its own compatible and its own standalone driver. It only
shares the S2MU005's STATUS/RVBAT/RCURCC/RSOC register layout and
scaling, not its device-tree node shape or its MONOUT path, so there
is nothing to usefully fall back to. samsung,s2mu005-fuel-gauge and
s2mu005-battery.c are untouched by this series.

Both patches were drafted with an AI coding assistant (Claude Code,
Anthropic); I reviewed every line, built both (arm64, 0 warnings),
ran checkpatch --strict and dt_binding_check (clean), and tested the
driver live on a Samsung Galaxy XCover5 (Exynos850; re-confirmed
2026-11-17, kernel 7.4.0-rc1-00023-gdcb8b91fb779+ #30): it probes, and
/sys/class/power_supply/s2mu106-battery/ reports plausible voltage,
capacity and charging-status values that track the device's actual
state, confirmed across a flash/reboot cycle.

Adil Hüsrev Tepe (2):
  dt-bindings: power: supply: add samsung,s2mu106-fuelgauge
  power: supply: s2mu106-fuelgauge: add standalone driver

 .../power/supply/samsung,s2mu106-fuelgauge.yaml | 47 ++++++++
 drivers/power/supply/Kconfig                    |  8 ++
 drivers/power/supply/Makefile                   |  1 +
 drivers/power/supply/s2mu106-fuelgauge.c        | 240 +++++++++++++++++++++++
 4 files changed, 296 insertions(+)
