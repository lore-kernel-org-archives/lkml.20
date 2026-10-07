Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B743ADBA4
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791373742; cv=pass; b=iOeaxGs6d86ag7Yoy6kQSumJVD7iQAV0KbRd/AxbwDpR6KzK1o9xSUNRPQrwH4odhKOIdMieQNFEnO/FlujWCq3fhlEKExK7nFShc65XDbRO3mnDo1KLbiUUwj8hEyrn4WGtJVd4bDG/dA4GxhuvRmYvLrxv702pgS5Cln1Rz3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791373742; c=relaxed/simple;
	bh=7FWLm9S8z3Wn+76Q3KTUuDdHF8VZJmncRNJYgwn122c=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=LLbSNGfTQ+SqRQ7UtB2a/oF0foKDzFpG43BqbAhWitPUQV+AfWQWIf19+nXhAIYNXPMKpMHLrJbAaVO7w/lE8dX2ZHjGDIJelzTUDacPH3ENW46nRSmuXJSLT/bMiF0smaMJ5iUCsmHoRwv8Ga8KkIwQg2nZomJJibPpuwAHiDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=juBweC1V; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="juBweC1V"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a629a806d9so13778811fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:48:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791373728; cv=none;
        d=google.com; s=arc-20260327;
        b=HLUNVGGkQgTUOJijevF12FZilOi5W4ni9U6c4Aym9t5n+iB++WrvjhrNv9wasmvkI+
         tfMPlBRbP/5rS3uNuPSORUJTee+mrPEC5zu+LQyeAhWfHuFEtM/i+VmJykyyi1LMdaAH
         6KighuyjEiAfytzJ4k/jqycVTtXbyWQjkKb3fLKQiUVmY5Tjv6JEBMk8Qu94jpwTAo2y
         FpffChZw0vB61+GLhbTp5v1dZAfvTNnLas3wMdjvebGSubpx7TlcTgeS6ziB46cyzaQ8
         f+SwPjXOg4UTANEq+qabRnzG9hh1vCddiFu7yOBSl/VRjyZzzbRG2NiDXH6a4VEPIDx6
         yC6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=MMp/fB2bF0FOpRT8S3ZoiXJ031erOC0TaJgD5Ref2ZM=;
        fh=FdBOdXYpeKUoj2HCnqbNHigALWDx+G/36b0aWPJGUY4=;
        b=FX9QmDEPM3AO+pLQNKISy06OA80Jf72EItclQxV9nTBmV17sw+bW67bz/QvGFC7sp8
         y7ITf5DF7qfnIo6pIHGWyC5xySgmbbpswuLGrNxxggsfIGOXJcLTZOMxUTYVIr+bS5BQ
         62ANAXJF3c9WNt4pDGEkbQv2f8gNNK60JpvFbWjTk+Q2q35y3ZR7U0sZhIdZHdwJ4gy8
         a3XEFPButktzHK0pEilBHGDn5v8eqiEPiIs4MJUbe+Vq5t5teWKOZWag4tE7w3DeM+0I
         99q3FwpbHH2f1H11UYlgVHLI2WyAjBOYpY+rQw3govTNOmdy4t0S5zJyGVBi+rQ+eZ+P
         xHCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791373728; x=1791978528; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MMp/fB2bF0FOpRT8S3ZoiXJ031erOC0TaJgD5Ref2ZM=;
        b=juBweC1VMFQgV2CAyDrq7VuSs857fT2ABY/UsV9+2v6whrWUnGcn1T0W5VwNUXoRVM
         BMvsCaB81jfyGxswRPQrS5nik1szk4QBMO87CgOrhoq5MXjpWJLPzR0iYfEbmCKqUv3q
         nzJiYyLOj2s1KP5/wS3XwYC4wGX6ivy7cHjl4yg8RyqUzOmO5VQE4eXx9EvFplNVb1s3
         rVuVVT6OxFErbh3wUJFId/NY7XyTzF3J97DF0HNuO05HPiUi9qNyGOGpBgwsSIpwAYZg
         qOplbSN6BQI6Bfz7xFHEwDquX1Zby4TdKDOdtnUGGgIEvt3J+YRstDP1KThKjVGH6F8H
         4ibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791373728; x=1791978528;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MMp/fB2bF0FOpRT8S3ZoiXJ031erOC0TaJgD5Ref2ZM=;
        b=perXxmdNMhrJB8wjT+1UXK0Ytw9aSgaZsH0bNv30m/REf9n9e4td/VliGkMwV72hs6
         T/tf7Aiku4pWrHJyDCXgTaoJjfWSNb+0i8mAFsiJ2bnJJpLHE0Tb2DSZJGSgFjhRO2vY
         zy+kGC66hH4nE8JxvVaBlm8NiHWaTB34Rl956QuuiSyBiyIPxPDre1+IGZNhEnuO1jcV
         BNqxehwn6BC/C5MFjN+NGz/g1SV9ggMgQlxqt4T59t+2YUfPwWL5JvNmVvBxVk6YW/RB
         SUK+8qGb1D278ShYP5R7MaiF/iI5nTGK213BGNwpgvpGQUtQWgyVKf/UCfO9ubjmQoSp
         XgfQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqUGrYAwGuyA4FmmwyTnGsV+styHADXFnk7N8DasETxw1p+iDUJg0n5+0OTzCYD/uulQRpDe6m+thS+9s=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBLmuY6rpgA0eVuj7q3MO+IiTSioU+tOPyxnnqXEwej9T6n1Je
	0RFi/XF00vyvBJ2XRfYF0fy1AQhdEQLkCZ5/yK//vGOl3uaptZI6RIGPqZyqEm/VlrpnMh67/cu
	MyYQewHT0itOFoe+ULG5da3LkgS+b1Xs=
X-Gm-Gg: AYBFou3S4UaIUH08rxNM/nTPkdoZu6jMoDIhgxpcGK4JtPEX5iMZOZ7fF5anUv9ako0
	1M+LwOUizYFA8ppN7O5cbGhzyM/cirnwEI3+I/kWtXqaBK8NvFsS4aGf6jND12Y+jeBFTSuLtwi
	7pkimm/daTBCcoq4LrlOK5TXExcvL+LsT93CNWau3OQGoLbg3yy+6qIJl0xS5WDz8GltfE7hA5E
	XlDA4JmWQXLl+sXM7uWIg4VeX/uvJaGeAY6koR7Kf/tDIDgez0uif2N1APY+00Z2ehjHLX44ZIS
	N429uLdAsrkjc420sW5a6TASPPy/zc5L230mmyCNwkj3auri10GbE/QVP3iVMq5c5Ykm
X-Received: by 2002:a2e:bc1e:0:b0:3a9:7b33:d54c with SMTP id
 38308e7fff4ca-3a9a2d1389amr4848071fa.24.1791373728449; Wed, 07 Oct 2026
 04:48:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jame Jao <jaojame6@gmail.com>
Date: Wed, 7 Oct 2026 19:48:36 +0800
X-Gm-Features: AclHuK9FZ7fB97lPoua-UMQ-KklzfyfCbsv1Vhg0DHJLajhjUcabWppkw66nqSs
Message-ID: <CAN52AYsyhwGvKnzPEmrONyyBWfkgTN6YhE8VrVLasnDsdGc6HA@mail.gmail.com>
Subject: Re: [RESEND PATCH 0/5] platform/x86: bitland-mifs-wmi: MIFS v2
 firmware support (Xiaomi Book Pro 14 2026)
To: Yuming Sun <wolf109909@outlook.com>
Cc: "Cc: Mingyou Chen" <qby140326@gmail.com>, 
	"Cc: Ilpo Jarvinen" <ilpo.jarvinen@linux.intel.com>, "Cc: Armin Wolf" <W_Armin@gmx.de>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Yuming,

I would like to add a third affected machine to this report: the REDMI
Book Pro 14 2026 (board TM2426, Core Ultra 5 338H, Panther Lake), BIOS
RMAPT4B0P0909 (2026-05-21), EC firmware 1.9, originally running
7.2.8-zen1-2-zen.

It shows the same MIFS v2 firmware behaviour you describe, and your series
addresses the two things that make this laptop unusable for suspend today.

1) Suspend (s2idle) is aborted with -EINVAL by the driver's suspend hook.
   Every attempt ends like this:

     PM: suspend entry (s2idle)
     bitland-mifs-wmi B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B-4: PM:
dpm_run_callback(): bitland_mifs_wmi_suspend [bitland_mifs_wmi]
returns -22
     bitland-mifs-wmi B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B-4: PM:
failed to suspend: error -22
     PM: Some devices failed to suspend, or early wake event detected
     systemd-sleep: Failed to put system to sleep. System resumed
again: Invalid argument

   /sys/power/suspend_stats on this machine:

     failed_suspend   4
     last_failed_dev  B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B-4
     last_failed_errno -22
     last_failed_step suspend
     success          0

   Since then I set up a disk swap file and verified all three sleep paths
   locally with a minimal one-file change that follows the approach of your
   patch 1/5 (never propagate the perf-mode query error from the suspend
   hook), applied on top of a 7.2.9 tree (Arch linux-zen packaging of 7.2.9:
   vanilla 7.2.9 plus the zen patchset):

     * s2idle works again:

         PM: suspend entry (s2idle)   18:13:51
         PM: suspend exit             18:13:57
         /sys/power/suspend_stats: success=1, failed_suspend=0

     * hibernation works and the session is restored (same boot id before
       and after; ~63-94 s offline including firmware POST):

         systemd-hibernate.service: Finished System Hibernate
         systemd-sleep: Successfully thawed unit 'user.slice'

     * closing the lid does the right thing as well, with logind configured
       for HandleLidSwitch=suspend-then-hibernate and HibernateDelaySec=1h:

         Lid closed                                 18:31:00
         PM: suspend entry (s2idle)                 18:31:00
         PM: suspend exit                           18:32:01
         sleep operation 'hibernate'                18:32:02
         PM: hibernation: hibernation exit          18:33:47
         (same boot id before and after the whole sequence)

   I am happy to send the one-file diff, the full logs and the /sys/power
   settings, or to test a revised version of this series.

2) platform_profile registration fails, exactly as in your report:

     platform_profile: Failed to get profile for handler bitland-mifs-wmi
     platform_profile: Failed to get profile for handler bitland-mifs-wmi
     platform_profile: Failed to get profile for handler bitland-mifs-wmi

   /sys/class/platform_profile does not exist, so power-profiles-daemon
   cannot read or set any profile.

The firmware side matches your analysis as well - the missing ECON symbol
shows up 40 times during a single boot:

  ACPI BIOS Error (bug): Could not resolve symbol
[\_SB.PC00.LPCB.Q_EC._STA.ECON], AE_NOT_FOUND
  ACPI Error: Aborting method \_SB.PC00.LPCB.Q_EC._STA due to previous
error (AE_NOT_FOUND)

Both bitland_mifs_wmi and redmi_wmi are loaded on this machine, as in [1].

One difference to the unit you tested: TM2426 does expose an ACPI lid
device (PNP0C0D:00) and an input device "Lid Switch" with the SW_LID bit
set (capabilities/sw = 1), so patch 4/5 may not be needed on this model.
I have now verified that lid events do arrive here: logind logs "Lid closed."
and performs the configured sleep action (see the sequence above). The
firmware still reports a bogus lid state once per resume ("ACPI: button:
[Firmware Bug]: Unexpected lid state reported by firmware"), which does not
prevent the lid action from working.

For completeness, one more observation from this board (possibly
unrelated to MIFS): ACPI init takes about 6 seconds here. initcall_debug
attributes it to ACPI object evaluation - e.g. 0.4-0.6 s per power
resource, ~2.7 s in acpi_processor_driver_init and ~4.1 s in acpi_init.
If the ECON/_STA problem is involved in that as well, I am happy to
collect whatever data helps.

I can provide further evidence (acpidump, full dmesg, DSDT disassembly of
the WMAA method and the QFAN-related objects, longer suspend_stats) or run
any test instructions you have. I can build and test kernels locally (the
verification above was done with a hand-built 7.2.9 plus a 10-line diff),
so I am also happy to test revised versions of this series, including on
mainline, and report back.

Thanks a lot for working on this - suspend being blocked was the biggest
usability problem on this laptop.

Note: the local testing and the preparation of this report were done with
the assistance of a local AI assistant (DeepSeek Harness WebUI, deepseek-flash
model); every command, log and result quoted above was actually executed on
this machine and reviewed by me.

Eason
