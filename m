Received: from mail-qt1-f228.google.com (mail-qt1-f228.google.com [209.85.160.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2371C3CB547
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789169752; cv=none; b=hbxQlngbDHyiNpf8xTserQyUGMzIXt56n4XYymi067KcyZn5Jv72rwc0UNeJGelXpoXVmoLmHcbKN8DqE0/NxnGqbCbcVeIdPFEyyHrG/Hh044y+P95q53ryopP3OBarO+C4R8+36XfwEFTjBNjBmstCO5aCtgLCYWD2l0S7Uzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789169752; c=relaxed/simple;
	bh=6vGIDcmhazuSg6c294X5jHvcuYI0emXRsQHd63WgHcc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IeyesnEzzNmbY3vlbGzG0IAhjzA+RegOVoBxEDDlFiU8J8FLCmd/1e1u4V5yXojZx+5HawPY43kETdEgH7OQWlE/D1QmW1qt7Jqi0rNaK4ySNaQwfVBOxmj88vzHarBd5QOGV+H1sMLNIor4UuqKLOIIJI+peVzKZht0OEB2fhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=YIbgXCMM; arc=none smtp.client-ip=209.85.160.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="YIbgXCMM"
Received: by mail-qt1-f228.google.com with SMTP id d75a77b69052e-52ff0eea420so12618421cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:35:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789169750; x=1789774550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rotk05yu0Xd3HMjEskHty3X9+grsIXwKqieBRwiJJGY=;
        b=iVGiPZgwtzb3dm2FT3YKMWvp+ejxyyGxO+3Ej3gerV3QtnXE55mb8NtMq4M86PQ1/o
         qCbPB9lQ7R29itxyPEJ4B3XYxH43UuFxxmyrrxUhvDj6XprhqZEF74LpSYMRJEW5BE5v
         ZE2Clbmn6g88Dat2GlOWm13HwIi1EdPUWzV+5nkFJPubHJBRMEACuA7/crEFNbqImjGm
         osvXEVuyWwWxkcF8sX5hXK1ADOqLfQ6Gt3sZnfCIs8ssdg61skeeaCjtnZvO3xd6nxPO
         RO0gxAcGSYHAp3DaUfPgaRDMs56jLpfWaSRATsnwkYhNGmWDm0DvxN3hKZhN9pXcBEC4
         H5Bg==
X-Forwarded-Encrypted: i=1; AKwUvBzU9PM88RAylxPfI8PojUw6Tba5Q3GJoxyTgGXzyrnWIAp7a3jdoYE9VqVqau1+201sjWJXT/+q2U2PGyI=@vger.kernel.org
X-Gm-Message-State: AFuF++kbXZcpb6g92tHwonAGfFxpsFW76d2xN0jCdQ46Fnm7iwC+s/9L
	lePgEqOwBW20fcYpmuF8wWFF5+QPqdj050D3T/x10dMFjlH9yKRXQ7zf1oGzyVXjR5en0iQL5o0
	Zl1i+VI7aC65kcyvZze06bsoexqy+zJtTQOE/Q30u9PKYWGReBkU+PNhE+w8ZvtbhITfeI3YpNd
	yXVcnE6ocyuxIk22XIgXAiy8EGi4VknLVm8J4h8tbY19hTUXyfsut/ERpufI6q1yFov6SBoLV8K
	YGhvu3zeFngB59w7BUh
X-Gm-Gg: AYBFou0Drb15E7uyZ9QLDEfZlk1utLsoKktbr59UL96xk1T9qZnKVgMrBdGsg4nKjws
	PhcK+WnNUiw4kbnkn+BuJjPfoc9v13hzZW7s3+4+644ZSy4N6bSd7TnfSHO/UKc7SamyfDfGfLp
	KrYSSw6QSXnp5m08EvykxJh4M1k22g992xM+A91lwcKZHf1Keqd5F44nSXo/kfvqYGJ3qD5GqOv
	/d5OVHcJwWaKf7P6UlFLlBfJkLsHxGYX8UWFqbygrdMD00TM8GFNW+DpGVjHlommev3SzglpB7c
	NFSQma2GLNcRc69kUBeajMfL2GpvJWYsxwS1iMUe5ficFe43U58DEWe5mrxR/PLkSlxrmmCbdtF
	3WUT5eLizB7AX37NtXLv/a1Mju48AOZ5VE2bPyvY4uTYq7jl0Sd8aJGV+IAshFe9tCfaIbKYfbD
	yXem/aaO8QBjOj72G8nKpn07YOccwrhFtbDzBn
X-Received: by 2002:ac8:5f4d:0:b0:530:90a6:d28b with SMTP id d75a77b69052e-530c8533b53mr80352201cf.8.1789169749891;
        Fri, 11 Sep 2026 16:35:49 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-14.dlp.protect.broadcom.com. [144.49.247.14])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-530ca6374cfsm437591cf.27.2026.09.11.16.35.48
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Sep 2026 16:35:49 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91054f537f9so36980586d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789169748; x=1789774548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rotk05yu0Xd3HMjEskHty3X9+grsIXwKqieBRwiJJGY=;
        b=YIbgXCMM0BUh7+jvZ3LZbDclyIQjnEk7LXtHzWoU+v+zVJLCDWiL4iGID8/xOzI4f2
         5h8yPZLRGwHjVR0qwNb0l3NsHBUcg+ZdBf1UOofGzs7NUOzAa6zEOiOMu5r/V6i7OyZ4
         hYwR7Kr9KdiL8Eq+3RWlXRJ6eR3SeYO+eorw0=
X-Forwarded-Encrypted: i=1; AKwUvBwa87u/BRB599klKzD5BO08bRO+1vsG8kkujxxflGA4vcnevs1MQ+2jjH/zMVvHcuIj/qmTlLiRxr8EyMA=@vger.kernel.org
X-Received: by 2002:a05:6214:40e:b0:910:6686:1542 with SMTP id 6a1803df08f44-9120289fbdfmr146241136d6.8.1789169746813;
        Fri, 11 Sep 2026 16:35:46 -0700 (PDT)
X-Received: by 2002:a05:6214:40e:b0:910:6686:1542 with SMTP id 6a1803df08f44-9120289fbdfmr146240876d6.8.1789169746357;
        Fri, 11 Sep 2026 16:35:46 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45ab71sm31717326d6.12.2026.09.11.16.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 16:35:45 -0700 (PDT)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	Rob Herring <robh@kernel.org>
Subject: [PATCH 00/13] PCI: brcmstb: Stop using chip numbers for conditions
Date: Fri, 11 Sep 2026 19:35:25 -0400
Message-Id: <20260911233541.1650895-1-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Much of the brcmstb PCIe driver code does (essentially) this:

        if (pcie->chip == 0x1234 || pcie->chip == 0x5678) {
                /* ... */
        }

when it should instead do this:

        if (behavior_xyz(pcie)) {
                /* ... */
        }

This series does the above.  In addition, some other minor improvements are
added in the hopes of making the code more readable.

Jim Quinlan (13):
  PCI: brcmstb: Remove redundant const specifier for struct fields
  PCI: brcmstb: Use flags u32 instead of bools
  PCI: brcmstb: Add Broadcom quirks macro
  PCI: brcmstb: Declare and assign quirk OB_WIN_32BIT_ADDR
  PCI: brcmstb: Declare and assign quirk OB_WIN_MAXSZ_128MB
  PCI: brcmstb: Declare and assign flag IS_BMIPS
  PCI: brcmstb: Declare and assign quirk 32BIT_PCI_OPS
  PCI: brcmstb: Declare and assign quirk NO_RGR1_TIMER
  PCI: brcmstb: Declare and assign quirk EARLY_PERST_ASSERT
  PCI: brcmstb: Declare and assign quirk PERST_PCIE_REV_CUTOFF
  PCI: brcmstb: Put max_burst_size setting in cfg_data
  PCI: brcmstb: Use order-0 indexing for inbound BAR window array
  PCI: brcmstb: Split up complicated function into two variants

 drivers/pci/controller/pcie-brcmstb.c | 267 +++++++++++++++-----------
 1 file changed, 158 insertions(+), 109 deletions(-)


base-commit: bc35965f6940a9bf834d54187b6088b8eb09206d
-- 
2.34.1

