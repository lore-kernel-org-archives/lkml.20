Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263745;
	b=mQU5H1dPPRazCX3aLI4ikm8+Hi6vtrPrlP/8Ne0Mt3igWy7N4GbvYY1P/NIL6aAC1zxY
	 KSmaINdmZDSjkiuEJZ4M62ImGBO3fIX01foSnEV5u1GgWzzTkBYVT38DiInc8eVwU6HCM
	 KCD0cE6POj52WewrWBFa0u0gpA3Sky7J8WTk54cAXvbPAMxijGUMSObKtPyU4l+7R+gAp
	 kajiQOi6Vq9m9pWh1hRmzei+YpfcMEQj0x6swUrD4/X/rPKHUg0EPirQkVetat69QnWU+
	 9tLvx2ZaPtF4N+0qHO8u65W7cKrV5AnaC7xdrsDRiAwljlhGx9HZUqkMfMOQea3LAbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ZVSBDtL7OhsiZj116ks6zPwmky9iXriM5zcraojnfhM=;
	b=ormQIX1EoCTiRGe7krz9eC2PvbG6tRL7ktYxbAkJCO+sQhdIB5WR8DMjIJ/Y1qDG45DQ
	 LfmP1PeQ+pyM5di16xxLfK3a5zpOmzP4ajwsraL8PkbKburfZh/ukkE5qpwbSJy6t/UX7
	 T0u8edc2Yu7wrvhcffYWbNMkRR4Vu7xmqWqe28YcCeEj4k7ZXzv8GMrxEPvPOAUJ3532T
	 rYmxx4oiS0IbFZBRyCvjZLfdPqs5jeYN2UCIf8OHGU3ADg6iialSqWB+oO0WmdSKPIBU4
	 FlFUsg2r7LSzab/puD2up8Y4BvaKjiPDR1Cjp1mQWGKa6pQ1kGfbHQMHS+1UG82Guxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=czjBm7tY;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C458E606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:49:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C458E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=czjBm7tY
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e10a70540so1180634f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793263743; x=1793868543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZVSBDtL7OhsiZj116ks6zPwmky9iXriM5zcraojnfhM=;
        b=czjBm7tY8bV2SNCL4VVRPaMFNIJp7XUbxELNfMqCtYf20R/Q9VDJ+q2Av/xu/uBTY+
         NetaS8UTOWLazdQNFQ66paQpbkSbFv8/f5f5IYfb8yQSOnQp/b1VEBMNTVN/077fRZ/7
         +ZVajgaMKl10XyBXsbfDSm3I1bn8Sw0kigpyuRgwlFI8U9xuOlKi+htKr36Xsmm9MFDD
         2X4smHzPKtSvSbgf3MmSCWOAAdaBx/hmKKCiYc2iTCcsQP09gh/gQzVSJKKvXhz3m0Ca
         a3sSHXhP9YFI49CTeF/OLLIlgouHqrucIBGpXTLcGufwydC3qGJRaIKofOMELwAK8rtv
         8D+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263743; x=1793868543;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZVSBDtL7OhsiZj116ks6zPwmky9iXriM5zcraojnfhM=;
        b=Z4Jd5RsXKrvLjPui08+FA9GQv8LCdp6XCB1DVQAAbgbUyLIeohkeKr9YB5kER25W7D
         e0qm8dmqsNUBhh1S3PWswASM3ytVAZc4Zcq2VKOIG4kIrxv4lEqK4OJd6HO5VSod9o3N
         YbN99DK0YdrNKT3YwzU48dKSGHO54gRn32I8fEVKHiCRjufYS4yO1Pmt9nmYjKblXOvh
         WzEdvt/ET68rQEx47lCyvHnz8FFCPpV4/42kc22WlRDrV4C59YVM4CRjBaKmHoYRUUMP
         PQciCQD3L7OrH6SOvGw1PUQTG5AX0WYiB8rKykJi5Ttznq3JngpJzijoMt2T/6lvc1yu
         +U1w==
X-Forwarded-Encrypted: i=1; AKwUvBzM01lwStEbYXVHBdvaVyu4LOCKxB4haQ/YaXQwI1DU+kZSsIENXrw/a1JpInzlItUZd9spkDabkXBEfCA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgMZi79VQ53PiwcdFHncAg8jldT7B4ocJnxcTH7jq7O99SiGkZ
	yWUot1PLOTjBDOAeB9+yz9qigLM8iLWE7BhuLom1YYMVktEf/ZmoDdVh
X-Gm-Gg: AYBFou1pgrYVka1vHr6equTnGmel6mhgmgs5nlagKsR7rZB8dEWrO61g2v6pxhZHjOD
	Ho7AmekusB1bUu5n84GW9putLAS31Gz2bjAr/It+HiJQpAvJMLMjbywl1iqPtGIuzR342iDJBtI
	UcqfRUbj/1XIzgm70xpzBv4rRf4eSVltbGDc2xkNDFv7pPtbNLD3nKt8uVXDcgIMYkujU2ltvnQ
	YD/HmV7DRfoq0yhg+J+RrVxwV6Q97qCe0q3GYv1Pjm94iTBrBX0qJsKanp14jFclbwuDACgEWDB
	SzspfsUbsR8r1Bbxnj8S8P/+Geqi+6bieVXs4kxWmVbD0pECRuzN2lG3P1UqYk1EGhgR1L62R3o
	dRxRicg9dcwp79lPo0R4IM0ZgE1cv6MQCYpaN8b/plkS+/N0kQtqjJ9zW4cqzlauo7S1wmtmCUl
	2iJG4FYx+la1gdU4k+/0IoKN+cVi5qFiAIcjEWS4wiWWWXo839p+ePxpCIQet0uN6RKlQ301ZPS
	fl3K+OA/mQMqkgj7v81OvWlkjmWERK674EAMGLxMg49iFzwpm0f1LxFt63o7VcSCiObDr1ppfBZ
	CjCo6/GQjqEn/g2nEVB/Mlzru97rx2hPIcH/QEeI5QaVa97T6JoQ3mPfdUwf
X-Received: by 2002:a05:6000:b85:b0:48c:43a3:6a74 with SMTP id ffacd0b85a97d-48e5d5c3a6amr8761707f8f.12.1793263742917;
        Thu, 29 Oct 2026 01:49:02 -0700 (PDT)
Received: from SurfaceArch.localdomain ([207.188.128.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm40025617f8f.44.2026.10.29.01.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:49:02 -0700 (PDT)
From: =?UTF-8?q?Antonio=20V=C3=A1zquez=20Blanco?= <antoniovazquezblanco@gmail.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Dorian Stoll <dorian.stoll@tmsp.io>,
	Tomas Winkler <tomas.winkler@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mei: me: add ice lake point LP iTouch DID
Date: Thu, 29 Oct 2026 09:48:59 +0100
Message-ID: <20261029084859.4537-1-antoniovazquezblanco@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028221017.54426-1-antoniovazquezblanco@gmail.com>
References: <20261028221017.54426-1-antoniovazquezblanco@gmail.com>
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

Add the device ID for the Intel Precise Touch & Stylus (iTouch) function
on Ice Lake Point LP. It appears as PCI device 8086:34e4, next to the
regular MEI function at 8086:34e0, on Microsoft Surface Pro 7 and
Surface Laptop 3.

Without this entry mei_me does not bind, the touch controller is
unreachable, and neither the touchscreen nor the pen work. Users
currently work around this by binding the device by hand at boot:

  echo "8086 34e4 ffffffff ffffffff 0 0 9" > \
          /sys/bus/pci/drivers/mei_me/new_id

where the trailing 9 is the mei_me_cfgs[] index of MEI_ME_PCH12_CFG.
That is fragile by construction, since the index is positional and any
reordering of the config array silently changes which config the device
gets.

This ID was first reported in June 2020, together with Sunrise Point's
0x9d3e, in "mei: me: Add itouch device IDs for SPT / ICP" [1]. That
submission was declined over the server platform ID conflict, and the
Sunrise Point half was subsequently added in commit 372a829862e5 ("mei:
me: add MEI device for SPT with ITPS capability"). Ice Lake Point was
never added.

Use MEI_ME_PCH12_SPS_ITOUCH_CFG, so that the device is reported with the
correct kind and the SPS firmware exclusion applies. Note this is not the
config the manual new_id workaround above selects: it reports kind
"itouch" rather than "mei", and it does not set up a DMA ring.

Link: https://lore.kernel.org/all/20200601155954.764558-1-dorian.stoll@tmsp.io/ [1]
Signed-off-by: Antonio Vázquez Blanco <antoniovazquezblanco@gmail.com>
---
v2: use MEI_ME_PCH12_SPS_ITOUCH_CFG instead of MEI_ME_PCH12_CFG, as
    requested by Alexander Usyskin. Commit message updated to say why, and
    to spell out that this is deliberately not the config the new_id
    workaround selects.

v1: https://lore.kernel.org/all/20261028221017.54426-1-antoniovazquezblanco@gmail.com/

Notes for review:

Built on char-misc-next (x86_64 defconfig + CONFIG_INTEL_MEI_ME=m); mei and
mei-me compile clean with no new warnings, and checkpatch --strict is clean.
The emitted table entry in pci-me.o is vendor=0x8086 device=0x34e4
subvendor/subdevice=PCI_ANY_ID driver_data=12, which is
MEI_ME_PCH12_SPS_ITOUCH_CFG as intended.

I still do not have Ice Lake hardware, so this is NOT tested on a real device.

One thing worth flagging explicitly: unlike v1, this is a behavioural change
for people currently using the new_id workaround, since that selects
MEI_ME_PCH12_CFG and so gives them a DMA ring where this patch will not. I am
following your call on the hardware, but it is a real difference rather than a
relabelling, so a Tested-by on a Surface Pro 7 or Laptop 3 would be more useful
here than it was for v1.

 drivers/misc/mei/hw-me-regs.h | 1 +
 drivers/misc/mei/pci-me.c     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/misc/mei/hw-me-regs.h b/drivers/misc/mei/hw-me-regs.h
index b9a67629496b..3972f9504f12 100644
--- a/drivers/misc/mei/hw-me-regs.h
+++ b/drivers/misc/mei/hw-me-regs.h
@@ -94,6 +94,7 @@
 #define PCI_DEVICE_ID_INTEL_MEI_CDF        0x18D3  /* Cedar Fork */
 
 #define PCI_DEVICE_ID_INTEL_MEI_ICP_LP     0x34E0  /* Ice Lake Point LP */
+#define PCI_DEVICE_ID_INTEL_MEI_ICP_LP_3   0x34E4  /* Ice Lake Point LP 3 (iTouch) */
 #define PCI_DEVICE_ID_INTEL_MEI_ICP_N      0x38E0  /* Ice Lake Point N */
 
 #define PCI_DEVICE_ID_INTEL_MEI_JSP_N      0x4DE0  /* Jasper Lake Point N */
diff --git a/drivers/misc/mei/pci-me.c b/drivers/misc/mei/pci-me.c
index 790a4647811b..cfdef9531ab1 100644
--- a/drivers/misc/mei/pci-me.c
+++ b/drivers/misc/mei/pci-me.c
@@ -98,6 +98,7 @@ static const struct pci_device_id mei_me_pci_tbl[] = {
 	{ PCI_DEVICE_DATA(INTEL, MEI_CMP_H_3, MEI_ME_PCH8_ITOUCH_CFG) },
 
 	{ PCI_DEVICE_DATA(INTEL, MEI_ICP_LP, MEI_ME_PCH12_CFG) },
+	{ PCI_DEVICE_DATA(INTEL, MEI_ICP_LP_3, MEI_ME_PCH12_SPS_ITOUCH_CFG) },
 	{ PCI_DEVICE_DATA(INTEL, MEI_ICP_N, MEI_ME_PCH12_CFG) },
 
 	{ PCI_DEVICE_DATA(INTEL, MEI_TGP_LP, MEI_ME_PCH15_CFG) },
-- 
2.56.0

