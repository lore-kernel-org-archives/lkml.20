Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793527378;
	b=n/y4ZqwsGTsUe9d5q0QK7EPhyGmye0sdXtGTxBZFH20H6NS2H3K6hfNiprAWRnBnKcGt
	 Uc2dfPnYmqn9Lg+n9Tq2sdTpI5OEGGiS6gNI6Enh7GKzm495eFEH8JtAgxCom9k1MYYlh
	 yi/4SKnLrrFAV6ZNh3aZCb17s6elUa2C/LyyPS0+ug2CYnjXOHBmiex/1YxERPyDtlqQi
	 jUbNBXHJhsByzer+lGdkcSFXXoPNv3rFyIyLS/9GnX9Dg2C7NYggSeF6oMPUh/8RG9Nr3
	 eJZQsor9SGVbS0p99NulvctVAU4nmHv2leDcMy+f/IJ0PRzZg/LUXo4fRFrcLotJr7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793527378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LugNflWSTGYWWTtxsSZYRFunR5npiQJObm4IegZVYlY=;
	b=PO9ioqMhAGyGq0Y/knkYiWLnuLorfPV6dBXVhz70JVFa6LJq+sIZ76nOJGTKMfxGZppG
	 yJ4drbM0adzIbc/MEWKg59ePoZYpRbtHsqxccGBKjgO67VedQOWErYC+WB7u8FIcgTDwK
	 MxHSgBTdOx4xKHpZXtRhH/3cuohXrqQSNkJO7F+nG1D/RgxIdd2DVgZGMT9XptI9gwu4e
	 n8eleMq/Gsxu4k/ecDO/cBxJohOVfJG85KhO3xfhmLpzh9XhyEScAAbTo3pfIxT6+zovx
	 RKHdf412OfrwjHbHMrhLuyQ2ImJ4ZG8JwlGPQWQglGy7cV795oEo0iqKO+SQz0fkPdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ABBzA/E1";
	arc=none smtp.remote-ip=74.125.227.129
Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40171606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 10:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40171606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ABBzA/E1
Received: by mail-pj2-f1.google.com with SMTP id d9443c01a7336-2e85fb35300so3473685ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 02:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793527377; x=1794132177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LugNflWSTGYWWTtxsSZYRFunR5npiQJObm4IegZVYlY=;
        b=ABBzA/E1yzC/XyNbaXLATPDWKlLSVhgz9WDD6gJQXh5+SyImZxFMRf8wMbqdz8um8n
         vH2Kt83PfykJPKhdkAtM5dhKf+1DLnKouyBXZ3lZPSUKuFT7+AzMfsCkYq2Z7ys4DZRU
         0Iw+as4m+yH7pHKCtk74wB+05etUgxOmkl+p5W3qn6I+Flr15fU6Z+39Sd/ufb4eXhsQ
         ujE2k4Sfk/hBv786opeI/diPCPoCpl7yazZWgH5Nq5sgB53uHySnvLEYjqmAdT5+rMGD
         wH6aGH1hFQ0j/nbZLltNvO39LNZ2sbEO/wq4XyP9wzpy0nYzPKAPUuSvNWzciKxc/sNt
         y+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793527377; x=1794132177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LugNflWSTGYWWTtxsSZYRFunR5npiQJObm4IegZVYlY=;
        b=zeI1VP2fz5Ph8MZKqjtAni6hvB3vqTK5OQ8+CsEMb4vnWKsT7r1Gz088OJWzZVry8u
         /Ojp8Stb8vsYUG0OxIOKsXB1RPtjM+x19ay6pBbj6xOPhrQ7U1D0+ojPJ3ao4cKhxKTH
         87qR7dIvv7oa8QQHFOCtUuyU7trA23bFXlJDm3UflhRXaNsRVEQ696MFMENAlKVPqRZ7
         2SRNUt6r/KIpWc/tLGphync/g19bstb6nuITI2TBbFOEqxTz0FgWaK7DSnUU4geB1aWR
         kFbarrd2dzfnlOzVQXpHqAqbfbaF2T78i6XwKu3u/ugE3AZ301zUQMrtR3DfFzzpdkel
         xuVA==
X-Forwarded-Encrypted: i=1; AKwUvBxYGys4sK+j+Gj0myqwuBx84zDBgf/S7wXNC+GNHO6jWkpUZqFj7TD/MX9lA0ahE8TlGpZ0j1z/mtcq0io=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Z0QgTpabxNcAqh4zkZ/PSKmCyF+bb47VrTiwE0qyXjrtUW6K/
	zlHM/0krDRNTbKwiXOuh/sIjWILTLAKcf5PjHONvkGEYKCtzC2MmX1Ww
X-Gm-Gg: AYBFou0+xfwwf+noH0Ff8NNLa8WBuOXBTDci0y7DZsl9BIC236ZQvGQ8LHqxMJ/4kP/
	MNlaPHZ2dhqnhAERp9T1kscNIzWzKOgmJ2Bu3DFtX6dqmGL3AYCeKrViK5rk/n4l7eoOQLTpJ9R
	K2+ODbv7zLb9J73Z+57vQiqUpddN9bJL1+m9PdSf47zCPbpYtF91saB780gFZx6yfBxzlylG7Ll
	pnhWj6iAGev3PnqhuUmXWTcT9djpyfUqt+RkM3coxCjfmkKV2eMmkOhwJkDlqDtwkE0s/8Ec0CB
	BbiumauGJi47CMhReKEkXZYIn4ei0MMTiHPTBFZLGgYZj/FDUO4uBnX8XhRZ44GsUZhUzCbJzpV
	kuDJqkEwnQto4Aou5nMADymKbwi8gAOw/LBjSBbD3oOeg+3sjB/4aqiuyi2hYTl8PycrGeqqgba
	lsu0+vjSgyMTWFMAKfQ5fBiNCMN300k2iCfklgfcds0kS9BD8rvHc++FdriVjXZXdbWO8n1JyHl
	xSn0acVkRodyEKIkykenVl51ZMwU+bE3U7qrL9Sqlhr9Ox8sD4VaekRzv0HEzjnXa1ERizczCe7
	ByJIq41I+lZden6jCDaulZl9g1U9bp6N0Q==
X-Received: by 2002:a17:90b:57c5:b0:3a4:b509:88bd with SMTP id 98e67ed59e1d1-3ae89559f3amr4097204a91.2.1793527377532;
        Sun, 01 Nov 2026 02:02:57 -0800 (PST)
Received: from ThinkPad ([240e:46e:8710:e4e:e10f:cd51:e533:58a5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e99b267sm14314906a91.14.2026.11.01.02.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:02:57 -0800 (PST)
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Griffin Kroah-Hartman <griffin@kroah.com>,
	ibm-acpi-devel@lists.sourceforge.net,
	Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	vishnuocv@gmail.com,
	vsankar@lenovo.com,
	Qiling Zhu <kmatzkaczor244@gmail.com>
Subject: [RFC PATCH 0/1] platform/x86: thinkpad_acpi: Add support for auto keyboard backlight
Date: Sun,  1 Nov 2026 18:01:22 +0800
Message-ID: <20261101100123.28749-1-kmatzkaczor244@gmail.com>
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

Hi Mark, Ilpo, Rong,

Recent ThinkPads with an ambient light sensor (ALS) support an auto
mode for the keyboard backlight: the EC picks the backlight level
according to ambient light. The mode is EC keyboard backlight level 3,
above the two fixed levels exposed so far, and it is reachable only
through the Fn+Space shortcut, which is handled entirely by the
firmware. Userspace can neither select the mode nor observe whether it
is active.

This series wires the auto mode up as a private hardware control
trigger, "tpacpi-kbd-auto", on top of the hw control trigger framework
that recently landed in mainline [1]. With it:

  - selecting the trigger writes EC level 3 (auto mode on); writing
    "none" turns the backlight off
  - the trigger state (bracketed in the trigger sysfs attribute, and
    the new trigger_may_offload_to_hw attribute) is the userspace
    view of auto mode; reading brightness returns -ENODATA while
    auto mode is active, per the framework semantics
  - Fn+Space keeps cycling through levels and auto mode as before,
    and the trigger state now follows hardware-initiated transitions
    automatically

This is the thinkpad_acpi counterpart of the ideapad-laptop wiring
from the same framework series, which is still queued; this patch
depends only on the LED core parts already in mainline and can be
applied independently.

For background: the February discussion settled that auto mode must
not be exposed as a brightness value [2], but no agreement was
reached back then on how to expose it instead; the hardware control
trigger approach was established later by the framework series [1].

Tested on a ThinkPad X1 Carbon Gen 14 (MT 21V8) running linux-next
next-20261030: 61 scripted user-visible assertions covering the
software paths, the Fn+Space event chain and the unchanged legacy
behavior, plus manual exercising of both the Fn+Space cycling and
desktop-environment brightness controls; checkpatch --strict clean.

Deliberately unchanged (details in the commit message):

  - max_brightness stays 2; auto mode is not multiplexed into the
    brightness value
  - writing 3 to /proc/acpi/ibm/kbdlight keeps returning -EINVAL
  - module unload still turns the keyboard backlight off

Two open questions, the main reason for the RFC tag:

  1. MLCG returns capability bits in the upper 16 bits; does one of
     them indicate auto mode support? If yes, I would gate trigger
     registration on it. Mark, does the EC documentation say?
  2. On models without an ALS, the EC behavior when asked for level 3
     via MLCS is unknown to me. If it is undefined rather than
     rejected, optimistic registration would need a rethink (e.g.
     DMI whitelisting).

Rong, happy to rebase this on top of your series or fold it in, if
you prefer to keep both wirings together.

Comments welcome.

Regards,
Qiling Zhu

This patch was developed with LLM assistance; I reviewed every design
decision against the framework sources and validated the behavior on
real hardware myself.

[1] https://lore.kernel.org/r/20260618-leds-trigger-hw-changed-v2-0-c28c44053cf3@rong.moe/
[2] https://lore.kernel.org/r/20260203232219.11683-1-vishnuocv@gmail.com/

Qiling Zhu (1):
  platform/x86: thinkpad_acpi: Add support for auto keyboard backlight

 drivers/platform/x86/lenovo/Kconfig         |   1 +
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 104 ++++++++++++++++----
 2 files changed, 88 insertions(+), 17 deletions(-)

-- 
2.56.0
