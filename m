Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792841094;
	b=B58rAbLDZw/3m/on5d0uLB6Kl0gSlgbHBsuMdS941YYv23rdoVgaW93m/erBBnyY7pfr
	 6gmgmr7rGAfFxafP2CHFIrqHTLvSla812OxpefuvmHRJzMMUPkN6hQsZGHGDhfmtHFV8P
	 YerEzrtf56SxZkB9iIzRZOQVpSlZRON/oOdi1Ng1mE6Ut4RFl0n5g0T1/pcR2aaiYteIK
	 EYfM5UvG7Ej1ZrjxQ5fKz7O/tb1aCrew7N4gunu0AWpNJNFu7/mobsHPDsvol8W2vAMcn
	 TBib+h6/bKDbCcouuQluvoxry7ZKfBKb1iznmJdAc5nKgsJd6BSHF2KZW8ts4iJNgvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792841094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ccO4w1k+Y3EfC/WaeLq+OkapA+2qhEUyNI9orMrY3f0=;
	b=mn2beaTYwS2KdyF92yhpfJEV75XdADNPdnS4n+SBrVk4ULUnESEOcQVHCGfT0mmjrTZt
	 i8IU9a87Z2gUowvWooFSvly+LKTUT1XX5dbXvFK/ecqEr3Tn5uiP66s6i4ZejpLR+wtal
	 3Ug2TnOJkFXYh9wczT7EbKWsVOPukDTnG9hOT6TudYMted8VDEqsWBm5SKWFCEo9ilAdV
	 7HbjlT1hLnyVli+5bUuuyZZ+5sNXQyK8p97aAjnmGrEVsQjmRUD3e1YZk1ksov0PEfQvF
	 2imfxAtNczuPMJlnMxYpwM/zygt62KdDnBL+W9RDZntc9qNIBbBFOgetJmWnitmxW2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KKDNcwZ+;
	arc=none smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E08606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 11:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2E08606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KKDNcwZ+
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67921b515a7so1615016d50.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 04:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792841093; x=1793445893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ccO4w1k+Y3EfC/WaeLq+OkapA+2qhEUyNI9orMrY3f0=;
        b=KKDNcwZ+jdvpv7WeLf27oreEM5jf3kzsC7ztePC9mz2stXoAOlK1zLhW4jJlpBIAoz
         I2bBj3LEnREMlWpM7Ou1W2rXZFvFIB0LqCDimbzn1MUOQtrqZBoFLmegG8CW7wrc3s4I
         favF9uDICrpD9rxd6/dzmxf/8p1/kBHEaopKHNrP6x3tWozW6sNSr277FJ9qo1kjmYec
         89icqK1ux4DBMbcGbBY+H4pAKucS1hp4bpJupSf/yBtsySB6swF/OcX/Krn++MGGBpLd
         KtXcVcDJCKnxRoYBHEI7TLs/4+wrwnK+ANxmUQSaGDzDOdUeLDTqoz+DokN4fmuoBEfh
         fg5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792841093; x=1793445893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ccO4w1k+Y3EfC/WaeLq+OkapA+2qhEUyNI9orMrY3f0=;
        b=xtsq/lRoxCiI5UVDbIK8yR+GddTpVYfdpCxWfN5fP8YRc5z56UVPXLwa1M/Wk51Ke8
         xaOzAwniTD+bF82toC6iuB6Hn7NRosWaQVKbTvYevtLiJsPH6i5jWy6ZnXf9t0fuN+bW
         wp7sM3u+wu9HqnRs95TZ64zzQ8fhjUEghcCRCupfIRSA6/PGdUvEuChPZ+pvMI4WHIfE
         QBIOTaDoI8qX0u+FV2BiYs8c3c6W0JT4K6PwzP6rkQQcuwvXgh4Ets3g8nZbbd3O3I+I
         1ju3OtZ3X5ok6PA/KQU7CPTg/C30EiQLqywEf15DoHrKUDtzdyvJ0Wn2Q38b90fHjUGY
         n/iw==
X-Forwarded-Encrypted: i=1; AKwUvBzRKgIAIbkKoTAccSSdtrwTD58OGi3fP33jX4oMpW+HKlVbvpnO7Ae0Fd3DmN8UlIeFU5yMkwAD4p7I8kk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxK5UWaEGp0VjIkKJTsvRwYqkQs0RI0G0p6mlW1dJdyA9V8oj2
	fe1phTnBFJqaVxNgTvM2aexcGiqtfg67IMbnYFQ/jjy4V/Z00SLrxfcl
X-Gm-Gg: AYBFou2QnDUmmuNtt+vTJOGTlvnrvV3K1tzc7YH5PXUpRCTBt0U2lTE9Bv57Hndfoe0
	/jU/RaX7Lgwx6IFc0pUMv4JR1x2/igZecVi2v28qMt6ddxjjPbuflBan0WrljxGfHRQM1q7J0mb
	fTwqG/LRtlWuxVuglFBu8ij9T/cILuq8ID2AfK4ow6o+6MwV7PluMl/9O73J2XWEOVyZ6eT6EnP
	5RWCjhmWVnTcNETxl0uxAmosOxn0S6qrgF5t6eqaMqbX+tcLrJ7GB1Xqwvpz6wJCKA4jio3FgXX
	YdnAC7d71nTs7SfcYRdSAfLLuaM9bnssUsMOV6dL9XtM7HAORhG2Ff68u1toEx1PKu2XM1PTXaf
	g2qHPOgsmhizckqmUZ48ZoB3m0lOCaGdLRt/mmJgGoPG6ceZ0Q+3pru3J7U/a5D244x9jcHeB87
	ry1CLGp3hMiUKfPlFGVnjzmy5ZHKBhmfHdc0bOG/mgZ6cmC/HMXHuVIkeHVTvR2sW152YZ01rTE
	8h6EAuaPhVnp7E8nb6zHpyAUO4Q5gGGe+5pTsHt/blMORo=
X-Received: by 2002:a53:ac8f:0:b0:679:a650:a09a with SMTP id 956f58d0204a3-67a45188986mr1404995d50.6.1792841092733;
        Sat, 24 Oct 2026 04:24:52 -0700 (PDT)
Received: from WillzDenali.lan ([2600:1702:7a80:3c5e::dff])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a4626cbb4sm855725d50.16.2026.10.24.04.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 04:24:52 -0700 (PDT)
From: Brandon Williams <turbine.bmw@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-kernel@vger.kernel.org,
	Brandon Williams <turbine.bmw@gmail.com>
Subject: [PATCH 0/2] Bluetooth: SMP: distribute the identity address when bonding
Date: Sat, 24 Oct 2026 07:24:33 -0400
Message-ID: <20261024112435.247650-1-turbine.bmw@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The Microsoft Surface Slim Pen 2 bonds with the host through its dock
(LE legacy pairing with out-of-band data) and afterwards only advertises
to reconnect, when its button is pressed, if the host distributed its
identity during pairing. Linux only distributes its identity with
privacy enabled, and with privacy the host scans and connects from
resolvable private addresses while the pen directs its advertisements at
the host's public address, so a pen bonded by Linux never reconnects.

Patch 2 makes Linux offer its identity key whenever it bonds over LE.
Without privacy that is an all-zero IRK, which the specification defines
as "no valid resolvable private address", and the public or static
identity address. Patch 1 comes first so that Linux, as a receiver, does
not store the all-zero IRKs that other Linux hosts then send.

Patch 2 changes the Pairing Requests that smp-tester checks: four client
tests expect the old initiator key distribution. "[PATCH BlueZ 1/2]
smp-tester: Expect the identity key in Pairing Requests" updates them,
and "[PATCH BlueZ 2/2] smp-tester: Add identity key distribution tests"
adds a test for each patch. Until those are applied, smp-tester in CI
will report the four client tests as failed.

Choices a reviewer may ask about:
- Why not distribute a real IRK without privacy? The host then never
  uses a resolvable private address, so there is nothing for an IRK to
  resolve, and the all-zero IRK is the specification's way to say so.
- Who now learns our identity address? Every LE device we bond with that
  asks for it. Without privacy that is the address we already advertise
  and connect from, so nothing new is disclosed.
- Devices that do not want our identity key do not get it: the Pairing
  Response masks the initiator key distribution down to what the
  responder accepts.
- Why drop an all-zero IRK instead of storing it and skipping it during
  resolution? Treating the peer as one that distributed no identity key
  keeps the key out of both host resolution and the controller's
  resolving list, where it could only mean "accept the identity
  address", which the controller does for a peer without an entry too.
- No Fixes tags: patch 1 is hardening and patch 2 a change of behaviour;
  neither is meant for stable.
- If you would rather keep the current default, patch 2 can instead be
  an opt-in setting that bluetoothd enables; I am happy to rework it
  that way.

Testing:
- On bluetooth-next 47d4d9f67e92 under QEMU (arm64, TCG) with KASAN,
  PROVE_LOCKING, PROVE_RCU and DEBUG_ATOMIC_SLEEP, with the BlueZ
  patches: smp-tester passes 10/10 tests in each of 10 runs; without
  these patches the four updated client tests and both new tests fail.
  mgmt-tester (514 of 515, "Set powered on - Blocked by rfkill" skips
  itself as the test kernel has no /dev/rfkill) and l2cap-tester
  (111/111) give the same results with and without them. No KASAN,
  lockdep or RCU reports. sparse and W=1 are clean for smp.o;
  checkpatch --strict is clean. The emulator runs used the same code
  before a comment in patch 1 was reworded.
- Hardware: both patches have run on a Surface Pro 11 (X1E80100,
  WCN7850) since 2026-10-13, backported to 7.2.8 and 7.3. The Slim Pen 2
  reconnects on a single click, double click and press-and-hold, and the
  Surface Pro Flex Keyboard pairs over its out-of-band path, accepts our
  identity key and reconnects.
- Other LE devices, on the same Surface Pro 11 with privacy off, each
  bonding over LE from scratch: a Corne keyboard running ZMK (Zephyr), a
  Logitech Lift mouse, a Samsung Galaxy Z Fold8 and an iPhone, the two
  phones once with each side initiating (nRF Connect and LightBlue
  advertising or connecting). All of them accepted our identity key, all
  but the Corne sent their own IRK, which was stored, and all bonded with
  no Pairing Failed. The Corne reconnects on its own, the Lift after a
  power cycle and the Fold after its Bluetooth is turned off and on, and
  the keyboards, mouse and pen after bluetoothd restarts, all with their
  stored keys. The phones also derived the BR/EDR link key as before,
  and the Fold connected over BR/EDR with it.

This is not a security issue: patch 2 discloses only the address already
used on air, and the all-zero IRK in patch 1 only lets a device pose as
a peer that uses its identity address in the clear anyway.

Tool use: the patches, their changelogs and the BlueZ tests were written
with an AI coding assistant (Claude Code, Claude Opus 5.5) in a session
that I directed: working out from HCI traces of Windows and Linux why
the pen did not reconnect, writing the patches and tests, and running
the emulator and hardware tests above. A review of the first version
found that Linux stored the all-zero IRK it would then receive from
other Linux hosts, which patch 1 fixes.

I found this with my own Slim Pen 2 and ran the device tests above myself,
pairing each of those devices with my Surface Pro 11. I have read both patches
and understand why patch 1 has to come first, and why sending an all-zero IRK
only shares the address we already use on air.

Brandon Williams (2):
  Bluetooth: SMP: ignore an all-zero IRK
  Bluetooth: SMP: distribute the identity address when bonding

 net/bluetooth/smp.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)


base-commit: 47d4d9f67e92d56ef3965f2727f9c98a5a611368
-- 
2.56.0

