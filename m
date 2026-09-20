Received: from mail-lr2-f24.google.com (mail-lr2-f24.google.com [74.125.230.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E841D3D8912
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 06:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789886008; cv=pass; b=sG2jS1fdD+gHq12Wyo5IxTatwC438U31YMsJc04ljzZSA6lTOZN2hhQIHfE2bD69S7VW4og7IMH245VceTNakJqX56qnwQXkg6gnzLyS5mWNgtbcqnZXopVo70Syt2Z+VlZ4SZEQSu8eeBrfuWTZNWnDzXl9CLq+Kr++QGGDips=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789886008; c=relaxed/simple;
	bh=zSVFVOdh1zsub7yTm7mZlMF70KBbf/y6lmir71eMvcw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=WBO8NwAymyIQxVQ2/FTt4Os6QikZ5U0g8HoopdkY1leG4eIi4H1L0b/j8KUHFuA9sHgjuCn75+UYFuz80rljPjujki5PFgVgSfTWAkdb8meSNyaRj7vCgVhe56EkNuLjKsa9K4jNJSC1+bM3+cl9K4I62COE9uIO9wpv9dGN/NA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DyMDgRUN; arc=pass smtp.client-ip=74.125.230.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DyMDgRUN"
Received: by mail-lr2-f24.google.com with SMTP id 38308e7fff4ca-3a2ff163f65so13929761fa.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 23:33:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789886005; cv=none;
        d=google.com; s=arc-20260327;
        b=rPzKYbiOiTGOHsIpppn33XJIErm1y1wTL5I1ta0Zk45CVHueGfGsnZpxdLjLBK5Pr1
         qcSTwpHbI+WJcXOTqkfsjzCANeX+KKFRNl8zH5LmWCABQk0j6Rxbn0/MOiaFSsMSSmes
         reF+gIasp2Y6zl1+ryQ6goLJeUzUwsOwIYAhTqt2bdllytLqajIgl/Z5FHeOP5lvPCeX
         ehSGS/xvZ8Ma9+WI8/J9WG1eYC2Tc9ilwgRBbIPAch/E7l3nJFaBgr+BVq9vB3n0dpM8
         adPmd8DVtLl8LFXA5OkSc1Y9QUXxXeff/UB1uauYVFPsvvSAtayN9fjoisaWegsWeFWV
         IOFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=YCaFJb32tWeW2ZLjK9ZpU6RuTP5xgMmLUszdPvYrcg4=;
        fh=dKZETbZeKK7o8LkbIJQTmGU352M9FR4/OFWssaRxqm0=;
        b=UJM/iIrq2MUKydWDO8qJHUlwqumh+v1PXAXDKi9GIvhg1Ed/xBBpHkG06snMsBkh1M
         Lqkw16/atcW2vKJUHUeYJt5V9JFasa32iT9cw1UGrLcX0SMOue2SNDntJxE+JsoFNT7z
         erSD8hB00qtoUf451wtADHoJN092blIk4V7yw+6+PzKdG9H8fGRW1OujwFoa3RfKCfmC
         vmNIgoIMyqAe4D3K33GpEepEFUPc2TveBbd8m+gij3qAFG5D4v0U/TCK84d7QHQmPso8
         Mp/Os+aQ2Oy23nN/+yxH+HncXzmHvH0MTBMHj2Wcn18lTXd9xjvAHq9bGyu6aYz+llSo
         wVwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789886005; x=1790490805; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YCaFJb32tWeW2ZLjK9ZpU6RuTP5xgMmLUszdPvYrcg4=;
        b=DyMDgRUNWnRz0hCzTY6uLJ9ep6YoXhKVuDrK6VOU28lZinrunKWu6xEC7NwwdHrMqo
         vDtc2z8ylACEmcZGHldUWcIqoxaoWa/MyZ8Q0AnH+QcfnNuUXszvcFIZqm4gLJBuksbb
         9Aj6Ov3Dot59kmzjgDB2hewMdZD0mCdOkqE9//+1IFM1po2IJQctR3ClWpYWfLEYIGEn
         Jpi8b2kPfYfEhNh3yb100TIiQ2Fl5a5cPO31mDACoUZMplYUD2v2ozHua3dgIJB7L17d
         nYGthHlf4LfG+72mrmjvP32cp3rKXkocFd+5yxD0GcUBbE1PC4kJ5EMDxt6glADD2Q9G
         dUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789886005; x=1790490805;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YCaFJb32tWeW2ZLjK9ZpU6RuTP5xgMmLUszdPvYrcg4=;
        b=G7BJXQmMTvpR5Bcb32SRWj5UZxJehYSLVPbRx9GDFuiU/aE7u/OIjkjogYVtFSNh/C
         GkAfnJfhtEEaUwW7HzuY0wKYJJ+d5ik4wUabbpLfuJU/wjdjvLYjj4smbqG1A5FFM8Vg
         Rsy1hTBO3PLeqVqZVHU4PEOmLWOf9doPliVQxKqdCAcRf4eYD27YeyL3VC9GUJ1c8JFA
         XVUt+czj5C4vGrUBmX2k8xz+vuMSBRKL7t8d3mYoD42Pob09DkEDEM5ksyV7r00iUFwU
         In1ITKTz9eFtzxSOzeq/gN5DTSQhuLR6nqDlIbCH/J0RlRwEVnahAFXwa/VMvtAh5Wis
         ddlQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbx5O1CJQlVnb3sLu9VZWic9xng5kyfs/l3ADg0f76P8RAcPzYNaxYm6r6fUrqiFJEKCNIERcNVo+pfDs=@vger.kernel.org
X-Gm-Message-State: AFuF++mnq+hwudKhVxvufuDlkeHe4CzByBYOru0bR+9ecDqziIRlJi1h
	2J+Og5fXopMcoZFy602juigyxCMMO7T2rvEq95ev1Cc15qthph8lbNBNUKweipI3r0SX3R/AaQd
	R5ov3VSxMk96IcwpG7l8d/Ee7ecUluTE=
X-Gm-Gg: AYBFou3XSjv4OBOCSfhzhTpecC0tpimLq4O+rHTMXftvHrngc+2QmnsP8YMd4ummN9E
	yIvsqMO1Z8DpWn9Ze7XZna2/WYwN8Jy/UoOxa6lOC8Z/e9mmY4VLaX+qaSGjI6FICzQlWd7vwKi
	qWcPUDsGdhdSRHvpurqOnNSCFHqs38y4sL5P5pObsg0ig6iOHZ3d7wGvOJGhNfdh8N4IU0gYu3Y
	iMwD7O1Ghu0N6c1UyaT8ZV0WcYA2uyKyOzqq+EI92zkeGr/Z5RPJzYuHC2dHHaZkCLZvsyMQ7Um
	OovzdAIIC/x8V/qVgGsj8OEwl8UK8f0LE4H4FzH8STab5roPMbw=
X-Received: by 2002:a2e:b8cb:0:b0:3a5:a54d:c8cc with SMTP id
 38308e7fff4ca-3a5fbfdd6d9mr15728441fa.23.1789886004561; Sat, 19 Sep 2026
 23:33:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Delton Ding <dsh0416@gmail.com>
Date: Sun, 20 Sep 2026 14:33:12 +0800
X-Gm-Features: AcwNN1XBxdlrbnq0M3C_4Z6yGT1NmGRFssrIdBOlYnMsT1u8vBXvDFIZpg8SqPw
Message-ID: <CA+mXNo2bBZg69RkKYauV_+K5zp=1kuHm1xLPwD6_ihZ_MzL0SQ@mail.gmail.com>
Subject: Re: [PATCH] tpm: crb: handle ACPI NVS memory region overlap
To: jarkko@kernel.org, f13208471983@163.com
Cc: linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jarkko and MicroFish,

I'm following up on this discussion:
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2652132.html

I would like to add a Fujitsu/Intel platform with what appears to be a
related NVS resource reservation failure. I have not tested the proposed
patch; this is an additional hardware report.

Hardware and software:

  System: FUJITSU FMVU14003
  Board: FJNB2B5
  CPU: Intel Core i5-7300U (family 6, model 142, stepping 9)
  BIOS: Version 1.33, 11/25/2025
  OS: NixOS 26.05
  Running kernel: 7.2.5 (NixOS build)
  /proc/sys/kernel/tainted: 0

On this machine, the TPM2 table specifies StartMethod 2 (ACPI Start).
The control area, rather than the MMIO range reported by _CRS, lies
inside ACPI NVS:

  TPM2 table (length 52, revision 3, checksum valid):
    ControlAddress: 0x000000008ff6e000
    StartMethod:    2

  Relevant /proc/iomem entries:
    8d77f000-8ff7efff : ACPI Non-volatile Storage
    fed40000-fed44fff : MSFT0101:00

  The TPM SSDT declares _CRS with base 0xfed40000 and length 0x5000.
  It also contains:

    OperationRegion (TPMR, SystemMemory, 0xFED40000, 0x5000)
    OperationRegion (TNVS, SystemMemory, 0x8FF6F000, 0x27)
    OperationRegion (CONA, SystemMemory, 0x8FF6E000, 0x30)

The kernel reports:

  tpm_crb_acpi MSFT0101:00: error -EBUSY: can't request region for
resource [mem 0x8ff6e000-0x8ff6e02f]
  tpm_crb_acpi MSFT0101:00: probe with driver tpm_crb_acpi failed with error -16
  ima: No TPM chip found, activating TPM-bypass!

Neither /dev/tpm0 nor /dev/tpmrm0 exists, and both /sys/class/tpm and
/sys/class/tpmrm are empty. The ACPI device has status 15 and an existing
platform physical_node, so platform device creation itself succeeded.

Based on the ACPI tables and source inspection, this appears to reach the
iores == NULL path in crb_map_res() when crb_map_io() first maps the
48-byte control area. That area lies outside _CRS but within the NVS
reservation. This is an inference from the tables and error range;
I have not instrumented the driver to trace the call path.

Earlier boot logs show the same error and address on BIOS 1.10, 1.30
with kernel 7.2.6. I do not have a known-good Linux kernel on this machine,
so I am not reporting this as a confirmed regression. The TPM works in
Windows on the same machine; its TPM firmware has also been updated.
The vendor of the TPM is infineon, but the exact TPM firmware revision
has not been collected here.

The missing devices cause systemd 260.2 to wait 90 seconds in the initrd
and another 90 seconds after switching to the real root. We have prepared
systemd.tpm2_wait=0 as a local workaround for the boot delay; it does not
restore the TPM device.

Does this look like another instance of the NVS mapping issue, and is
there a preferred revised patch or targeted diagnostic for this ACPI
StartMethod 2 layout? I can provide the raw TPM2 table and TPM SSDT,
including its disassembly, if useful.

Best Regards,
Delton Ding
