Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792441507;
	b=08mB/93usS8PLRxvzzsRft+YJbHqLOeVhV2uMqV33H3lZisQzBa1ySIuXKbM5OtXOmEo
	 k5aoDNqY8bzHncgjOUxofY07S7KvcPh47qKFxZJs/Q1+BEeIdeTZEb7PyVb2lioHXYM8F
	 wKRhrivpXyCtM5cQi7C9M8Qr2T2ANngYbc+IDZMhqXpaxvP6E4/G/383bvC32Z3rv39qR
	 Wt9igqX26s2rT/gSxpDmLjgrHXe1xYqGp/wxkKghjz+dSYxxahQXJtasVC4efb/qYhKjc
	 EdTtLwlFXs9bEdGDBo/TXBoKpTZS0zDZxW8Z127iQpyQ/2NjBM66sctH643DlJ2ygWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792441507;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=CYZTGOdlwMOQm8Q+o3LfRbkQ9TshE/oKmn4afUM8mfs=;
	b=hgmzft9jHR4BQOEBrOgkNNTcylqfaNAADFhnFlRbhSBQS812IjOqqSzJFnHk8ljgRdJp
	 mCxJS8n4qA018Fo9kVXFkNwPg/h7HcUxxhjkeK5XxeTSIIaF2CaY/wK04tHNXV/10LVj/
	 lMLXDW9wOIQb3v/UBr5Uhob/Uv22tyPBjicydsQWeKATq+9wP1TSgiR0sNRUudeWt6OEW
	 zXC+nNrlXPXhhenqxcfsuOakny7xGtDdbPu6fusJs6vogbnI1CFjZcSbjt052M1IbuN/x
	 pEFon/mCo5hoa4yBS9XkgwH//jBnsqb4iOMR6A+OetiJK2YiBFdmtIiXTuTiSFCXdqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TC4TKF9l;
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103AB606A330
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:25:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 103AB606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TC4TKF9l
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5eac925bac3so267129e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792441506; x=1793046306; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CYZTGOdlwMOQm8Q+o3LfRbkQ9TshE/oKmn4afUM8mfs=;
        b=TC4TKF9lY4lChXjrHgxF/o23vDcUzWCN0n4b+YcZCIMJhtZgjMOMRPnaoctqbMvD0l
         0hNIi8fQ6VgYTRwSGjqXlvHW4FGY/KhmENEPMUjjnjsYjSoUZcB5HAHzf8VORuXNvs7M
         iMUYzAlFB50t77pQHCk6cBFEyGu+hczE7lQWSc7PettrDxX4Yx345iTYNRElwSplYyT5
         LyyvsTkFotSaWdtki0h2oZ4tjiP4FLYsmgG/JruMRUhhbFU/FQGkcbdmaL0gSjJdmV5P
         aO/6pWCYVlB/Wckn8BIZ3Crc9F5BbDKZ7b37MPTdvahpBSQ4RY1MQ+GeJfINq0PMRN2y
         lWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792441506; x=1793046306;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CYZTGOdlwMOQm8Q+o3LfRbkQ9TshE/oKmn4afUM8mfs=;
        b=ZaRa4gs92+sIdjPFP6IK4AZiAxCOn63eJhe0FNBL0YCJrWwuxRFsLsIOB+AD1wmwQI
         JkWPgvYwQrvxhvdBrIUnrFjAWW4gf0sna1lLtBxBob/cCJukO3Vk7bXrsJyg3tIQTQzZ
         Ur+Bcc+9qgVVgc5PHdl1MEZzWEcd1Vv/I9LknUTvzlSL/n/6IXM5pNwoR10HbFqnHmro
         sdnV3ZsdvXx2JD7zISs2csHIu9DN2JLDaT0ssyugB83QydfG6KaL5VVmeVf27Pq+0tVU
         isn4zW4La7GC9ZLP0cuvMIuQKKOM53WRILx2s5C/hagvsUtlUddWnKTCMYOYT+hdz70O
         SD8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwy2dWJnY2WrWXwWUPbZsGigcYllcAy4D82vNjoZnR8RO6FHCvcVTFD9oHy7Ld4tt99zgEnK064anMT3DI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGbx+j22yo5+z5Wq1qKwDIi7jxONGTR6GBiVKaQx9jx/BuCj5A
	OVsIdycM9Sy2RiVwES90zeDjLHpj+65weCKZEU8nFpCX3Z4fKByXAJfw
X-Gm-Gg: AYBFou3WQ6cYpzFXQLw07MflqPnlFkiFEV/j/HUCQ91Y/gTjQwRPP8N+Vy07DRfDqkx
	X3759q8somvIvZDyw5r3qh2zmbe32xnvYRr0no+LjIzfV64Ix1WPgIZLkB1dtwnk0W8IwNIU3kH
	GpcO1ynbS2E+a9cVPLa2i1bgKeXyvt3LqXjZvXsZBPBF0VrKtLKLogWCKy3q3cIbRAwiBdJDY/D
	kBuKG3MXiOyoNGo4r6WXzWWJz6pOaduwPwhdi0oN0bo0bKR5YvCehd2tKPRuYmac9TAOTgGy7vr
	8oMSwo81mj0Dbgfhtb3q61Xn7jz2FvZkfNLZrZGkIBofISWD7Q9BayTCaqA1JoN5eJ+af1tEyhr
	tme00M+A85krSkb5f5M7kLc57gYcGB9ptqwDu/Vt3zK2auO81QAKwMCuBOGif1sAQ902rRbPPe2
	5a0bE+d6/3LckFjKX6uS9/31WdhWP9rvKOx9hGfpCEFKXv340oUWz/P3eNCuwPpFXqbdPx3gcJL
	Xe86P2M
X-Received: by 2002:a05:6122:488c:b0:5ce:b65d:22b8 with SMTP id 71dfb90a1353d-5eaaa6a8d9amr3168085e0c.19.1792441505981;
        Mon, 19 Oct 2026 13:25:05 -0700 (PDT)
Received: from maclinux ([2803:c600:9110:8ba5:1c75:eeaa:b22f:20dc])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b128725sm11194050e0c.0.2026.10.19.13.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:25:05 -0700 (PDT)
From: =?UTF-8?q?Francisco=20Beltr=C3=A1n=20Millal=C3=A9n?= <fbeltranmillalen@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lukas Wunner <lukas@wunner.de>,
	Farhan Ali <alifm@linux.ibm.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Darrell Gum <d@rrell.co>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] PCI/PM: Keep the saved config space of an inaccessible device
Date: Mon, 19 Oct 2026 17:24:43 -0300
Message-ID: <20261019202445.38259-1-fbeltranmillalen@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When a PCI device stops responding while the system is suspending,
pci_save_state() stores all ones over its saved config space, and
pci_restore_state() writes that back on resume once the device responds
again.  For a bridge, that means bus numbers ff/ff/ff and Secondary Bus
Reset asserted, which cuts off everything below it.  Resume can also
wait about 65 seconds for a device behind a dead bridge, because an
all-ones Link Status reads as an active link.  I ran into both on a
MacBookPro14,3.

Patch 1 makes pci_save_state() keep the previous snapshot of a device
that is not accessible, instead of overwriting it with all ones.  Patch
2 stops the link wait code from taking an all-ones Link Status for an
active link.

Patch 2 does not depend on patch 1 and is unchanged from v2, so it can
be applied on its own, as you offered on v2.

Why patch 1 changed
-------------------
On v2 I described [1] what returning -EIO from pci_save_state() does to
some drivers: stmmac_pci_plat_suspend(), intel_eth_pci_suspend(),
atl1e, atl2 and amd_mp2 abort system suspend, and libata and others
trigger the "State of device not saved" warning.  I asked how you would
like those drivers handled, and said I would hold v3 until then.

The Thunderbolt work exposed the same PCI problem in another path.  I
have sent a Thunderbolt patch [2] that calls the SXFP ACPI method on
Apple systems with Alpine Ridge before system sleep.  SXFP also powers
down the xHCI on the side of the controller with nothing connected.
The automated review of that patch pointed out that if this happens
before the xHCI saves its state, pci_save_state() stores all ones and
resume writes them back.  I found the same by reading the code; I have
not run that case without this series.

On v2 you wrote that skipping pci_save_state() when the device is not
accessible seemed worthwhile.  That preserves a usable saved state, but
does not make the Thunderbolt controller resume.  The Thunderbolt part
now has its own patch in drivers/thunderbolt [2].  This version only
does the skipping: pci_save_state() keeps the previous snapshot, marks
the state as saved and returns 0, as it does today.  Callers see no
change, and there is nothing for the PM core to warn about.  The device
gets the config space it had when it was last accessible back on
resume.  This makes v2 patch 1 (usb: hcd-pci) unnecessary, so it is
dropped.  The values written back can be older than the last ones the
device had; patch 1 describes that.

If you would still rather have pci_save_state() report the failure, I'd
like to know how you want the drivers above handled.

[1] https://lore.kernel.org/all/20261011210451.12129-1-fbeltranmillalen@gmail.com/
[2] https://lore.kernel.org/all/20261019134851.7496-1-fbeltranmillalen@gmail.com/

Changes since v2:
- 1/2 (was 2/3): keep the previous snapshot and return 0 instead of
  returning -EIO, with the check once at the start of pci_save_state()
  as you suggested.  On v2 I said I would make pci_dev_save_and_disable()
  use the return value of pci_save_state(); with this version that no
  longer works, so it keeps its own check (see the notes in patch 1).
- Dropped v2 1/3 (usb: hcd-pci).
- 2/2 (was 3/3): no code change.  Added Darrell's Tested-by from v2.
- Based on pci/next as of 2026-10-15 (732c4f7d2c04).

v2: https://lore.kernel.org/all/20260930141914.6678-1-fbeltranmillalen@gmail.com/
v1: https://lore.kernel.org/all/20260924124221.12374-1-fbeltranmillalen@gmail.com/

Testing:
I built patch 1 into a v6.18.49 kernel with patch 2, a backport of
e18d1abc3bff and other local changes for the MacBookPro14,3, including
the next version of the Thunderbolt patch above, with the changes Mika
asked for in his review.  The USB HCD patch was not included.  I tested
it on that machine with 30 second suspend/resume cycles and a USB 3
disk on the Type-C ports, which sit behind the two Thunderbolt
controllers:

- Five cycles: three with the disk on one side or the other, one
  removing the disk while the system was suspended, and one with
  nothing connected.  All resumed, and both Thunderbolt controllers
  came back.  The disk was read after each cycle in which it stayed
  connected, and after the other two it worked when plugged in again
  (on both sides after the first, on one after the second).  In these
  cycles the xHCI saved its state before SXFP powered it down, so the
  new check in pci_save_state() did not trigger.  The order of the two
  is not fixed, as both suspend asynchronously.
- To hit the case above, I also called SXFP earlier, in the PCI suspend
  phase, through a test-only PCI quirk that is otherwise disabled.  In 3
  of 3 cycles the xHCI on the empty side (each side at least once) was
  reported as "Device config space inaccessible; unable to save state",
  the snapshot from before was written back on resume instead of all
  ones, and the xHCI came back.  A disk plugged into that xHCI
  afterwards worked at USB 3 speed, on both sides.  In all of them the
  snapshot was one taken earlier while the xHCI was accessible.

There was no kernel WARNING and no "State of device not saved" during
the whole boot.  The series itself was built on pci/next with W=1.  I
have no SR-IOV hardware, so the VF case is untested, and the machine
never reaches the pcie_wait_for_link_status() change.

Thanks to Bjorn for the review and the simpler check, to Farhan for the
pointer to the 2025 discussion, and to Darrell Gum for testing v2 on a
second MacBookPro14,3.

Francisco Beltrán Millalén (2):
  PCI/PM: Keep the saved config space of an inaccessible device
  PCI: Do not mistake an absent device for an active link

 drivers/pci/pci.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)
