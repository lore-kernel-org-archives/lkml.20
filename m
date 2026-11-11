Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406376;
	b=sFlsAuuqFP+M0QBoDq8gvOLojjdIwLOVrU8OVGLIuKu4aGFnpQijdF7IN+ibC66H070R
	 gyanQoWSQVgqh9gxz3dajOKKwgCNGI1kGJtPKcp4uTmZeLAGL9wiGLn3tD8ZDVXBX6v0I
	 oP/C/PWPQSzQN6AizQZtdTZVFZ2aaN3kTN36HRD+t6rb/2N/1YEJ0hKshm+uF1rkrrtAP
	 y6UHtiBla6KGq3gw6UnntRXGGLxIipM52cItDjIaVs/2dGnL6j9cfJF6fqrw/xGixrt7i
	 cx6wS9XdNohZFy0EWoABqc/1jguI4BRhC2bcQov0nI0KwO71j+E0hbqCkmWyiMQLecw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RyaNr0cCFD9SOnyOAkomip6CQoV5it2GgjFP5fUVLZc=;
	b=QSncnqfMvhcuGB0l4nJ4RERhJpBsvcniJnp0JCAI1swY3TzMsylMT5RpiNbdGudmK7Tv
	 KA4vlXXb4PbkQMCVG79dyCkAS62q+AX6uMitkCgnTcnOPOH6c7CowTtEeGCiKQNpYz2Ht
	 xyIRulBN2FwdU9yuYxtYLE9tG0PSKkWDZNbVBwc+/JD0CzBPfTFNRKuHfUWI+EaOBk/YG
	 WEPPeGsGRkpeKS2LRGaxzCCcbvQM8UFTRDyf9ujkEJ491TpSOxyJxFGfedvIV3+wUsvXM
	 dsy33nCfwWDkN0r1NCDiCAgAcXIQLJetgi63M2JZb7YSYRSLG8Bfi6kO5x3iDTxQQBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I4WFNAqw;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF775606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF775606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I4WFNAqw
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cdba1b5ed8dso1511271a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794406375; x=1795011175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RyaNr0cCFD9SOnyOAkomip6CQoV5it2GgjFP5fUVLZc=;
        b=I4WFNAqwqxvempASyT1z5T5B0ADkS9xre7QOdQZk3GdZ6ziNDcILW2I+2oAUcOQC42
         fUqhbc1kg/i/ozB/syT3mj8dMDUAQeIwXw2BmDBQhhsrCfKNOFD5qGns2o425Y4tf+P/
         76qBL1XJ5Oi4iCIG8F7tDRTkcEqVnuwEcmwT98kCwV/kJsWDvIA8E15FMNJuM4iuuRNI
         p1iNCvUArJj9drgyee1kfju9vAPbJBeb3EhknHz/ErPwNjq21CnD6N8ALvilIQPqJARv
         4xw9JrkarAe/dP4f9szVM1u4fk41Rpz6AKhl+KbJ19Wf2DHS7XiN7PqoWF5Eqi/l4tkx
         V8TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406375; x=1795011175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RyaNr0cCFD9SOnyOAkomip6CQoV5it2GgjFP5fUVLZc=;
        b=l8tiYSux8WN7zBRiDB34dgZKtp3Fp7UgJkYhhzHoPXyefBuyiErv+2I3Anu6t2bDlX
         ci3rexjrzArBZVCt2vOv50xcVk9QOh8SrJ6b0MiNA564K2ihcZV0RHq4XWyx5/hThdyh
         /s3XJnFwrWaVHLgtDgtolBwMns80bkj7gi5OfBlVJl4nDwn1mAZ8XulrMWxSOzvJ18Pm
         VRYJCVxJc3vLtHCTK5p+wI3Qv58Pr6iLo58v8kZBpfR/0Vzdrw2AjG0SkGBKb9/wULGj
         44LAn8jYJh35JMtCPqJCPdAtADtMfmJVKN1onhKNDQtX1cNNf8j8zKEyNfyOV+oxjJRX
         MqBQ==
X-Forwarded-Encrypted: i=1; AL+hErHqRewJPEz6CeZmbKEOsDDkS6Xi817phoUQvW+iv0j/fChY8GKCLhJZwoeLkAyjpDY3jdXCcaaFd/QWzG4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iAqDeIGVM4zECYiDzRytWZmidANJhdHW6qjcEdfcFFg7RH7wb
	FDpFPYrw5yAwb+EV1ZkgiGfe1hBsz76I1HqkC5RjuaPpdFXFSzuhvvaj
X-Gm-Gg: AYBFou2nJO3lAa38uJtaNOQqirRPLTlMuKjSZPv2A7MAuGP5srRCQHKwCn+aAleN8Bz
	57slHiWyhuMC9B2GBlA5Rf7r4Cd9/xGi+bgjxep22K22T9VTx6e/fRIVIru77TQwtzyZlrWMJqd
	M2tAwEnrMjEss8+z3A59rJIEIkNxjJSgE+tFCnPhzYxe+OxQyngjA4JNb0s6RCK2dhtLUX2Q2J9
	Bb956iSW7HX7MK4mNPxIwZuR9xJFNoOMIxnJM2NlWF5mnNrPmw0PV/uvuoEGr6dai63CIyXMFcE
	tAWdJq9wzx2fCbj29rwkUmiR2H5SMjSjHDA1tnNFgartveAGBkiHEw9vWxgvg4aN9KH22XTh/Oh
	b8fL4toRV4C6tuJFfNdR6fP2Qumn3bHiSp2dcYwVvo8Ebn9riBrGPgVOXxT/vXO9AUcui1o0dwV
	BvHSP4NkEcLVWhIUP34tyXMikmPhQoBGX8S43aTFFrDCLsN4Pc3Puop8alHpDUmFhVh6TbdOYoV
	aNV+AUdRn/t2q+OYbgP83eaSCEz/7QNSUKQa5O5ueteOfoPNhqsh87NttqdddMFOASigd9dWNxb
	EEbt
X-Received: by 2002:a17:90b:55cd:b0:3ab:d26b:c2df with SMTP id 98e67ed59e1d1-3b182f2d866mr1703829a91.27.1794406374864;
        Wed, 11 Nov 2026 06:12:54 -0800 (PST)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db319bdsm4789970a91.6.2026.11.11.06.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:12:53 -0800 (PST)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Anton Karasev <uselessfire@gmail.com>,
	Jame Jao <jaojame6@gmail.com>,
	Serhiy Shliapuhin <shlyapugin@gmail.com>,
	okluar <okluar@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v16 0/6] Merge redmi-wmi into bitland-mifs-wmi
Date: Wed, 11 Nov 2026 22:12:20 +0800
Message-ID: <20261111141226.9482-1-qby140326@gmail.com>
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

This patch series consolidates the standalone 'redmi-wmi' driver into the
'bitland-mifs-wmi' driver to eliminate code duplication and centralize
the maintenance of overlapping ACPI WMI event streams.

Bitland is the ODM manufacturer for various Xiaomi Redmibook models. Both
platforms share the exact same keyboard event stream WMI GUID
(46C93E13-EE9B-4262-8488-563BCA757FEF). While redmi-wmi previously parsed
the 4-byte payload as a bulk u32 scancode, bitland-mifs-wmi deconstructed
it into discrete type/id/value fields.

Redmi operations were not contained in this patch series, future reverse
engineering is required.

This series introduce a newly reported mic-mute hotkey definition
for Redmibooks, dropped the previous redmi-wmi driver and intrudoced
the quirks table for the bitland-mifs-wmi driver.

I don't have a Redmi or other Bitland device. So I cannot work on the
real device.

Features are working properly on my device (Lecoo Bellator N176).

I leave the future reverse engineering work to the community.

Tests are welcome.

And by the way, the no_set member in bitland_profile_entry means a
platform profile is only report by the firmware but not available for
set.

v16:
Rebased onto review-ilpo-next branch

v15:
Fix the build issue reported by kernel-test-bot
https://lore.kernel.org/oe-kbuild-all/202610270608.l51GVbZ8-lkp@intel.com/

v14:
Drop the accept_zero_function quirk based on Chris' comment
https://lore.kernel.org/lkml/CAAcRvKPSk5FYzZGkw12cPVGkxWVGFACwRvupBDDNae7B_JwF0A@mail.gmail.com/

v13:
Fix the zero function value problem find on my device
Fix the memcpy size issue
Remove WMI_EVENT_PERFORMANCE_PLAN_ALT in the keymap
Select BITLAND_MIFS_WMI and deprecate REDMI_WMI instead remove the
config entry

v12:
Fix the issues mentioned in https://lore.kernel.org/all/20261008152647.1510152-1-uselessfire@gmail.com/ .
Copy payload_data to output->data at bitland_mifs_wmi_call, not
overwrite the entire struct.
Correct the key name (Mic Mute) in the commit message of
"platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries"
and my device doesn't have a FN-ESC key, so I renamed the enum variant to
WMI_EVENT_MIC_MUTE.

v11:
Add missing return_code_at_end and accept_zero_function logic
Fallback to balanced platform profile if resume to performance failed

v10:
Replace the previous "profile table" with dmi quirk table

v9:
Add the missing feature introduced in the commit
e0d6312578e1 ("platform/x86: redmi-wmi: report EC state change events").

v8:
Correct Ilya Gladyshev's email address in the MAINTAINERS entry

v7:
Swap low bit and high bit for WMI_EVENT_KBD_BRIGHTNESS
in bitland_mifs_wmi_keymap
0x00800501 -> BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0x80, 0),

Report KEY_FN_ESC when WMI_EVENT_FNLOCK_STATE events received
Rename the reserved names
Use Xmas tree order in bitland_mifs_wmi_notify
Collect the Tested-by and Reviewed-by tags

v6:
Drop the wrong Redmi ops

v5:
Correct Xiaomi DMI vendor name

v4:
Map PLATFORM_PROFILE_PERFORMANCE to wmi performance mode if the device
doesn't support full-speed mode.

Mingyou Chen (6):
  MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
  platform/x86: bitland-mifs-wmi: Merge the function of redmi-wmi into
    the bitland driver
  platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
  platform/x86: redmi-wmi: Drop redmi-wmi driver
  platform/x86: bitland-mifs-wmi: Add quirks table
  platform/x86: bitland-mifs-wmi: Fallback to balanced platform profile
    if last performance profile is not available

 MAINTAINERS                             |   7 +-
 drivers/platform/x86/Kconfig            |  13 +-
 drivers/platform/x86/Makefile           |   1 -
 drivers/platform/x86/bitland-mifs-wmi.c | 353 +++++++++++++++++-------
 drivers/platform/x86/redmi-wmi.c        | 154 -----------
 5 files changed, 256 insertions(+), 272 deletions(-)
 delete mode 100644 drivers/platform/x86/redmi-wmi.c


base-commit: 5680519168f65666d2c03cc6ed8fe2b7052aee12
-- 
2.56.0

