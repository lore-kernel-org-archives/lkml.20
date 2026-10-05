Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510A74B8260
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 15:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214143; cv=none; b=YQizRczg88GFJdAIV7lwNpe+dDTBTy96hHZx0OnVNlIkFEFnwWWBiLAAw2stnk4LOFp9nVFxNPeankFy/UpU5OOUE6SR+0GPpuQhDY+Gage5Bzibt6vzmvPBxNGfJ3bYwCI007TS5sGOUvDIGxsTESHvy2mm4KqQ5Dgz/O2uiSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214143; c=relaxed/simple;
	bh=vFA7ME9MP4LGSTz36sJ7z7sOAj5+q54bsBjZSqQwOqY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JkR45koboeGozn7XWP980bLfdij3AEHbPFdx8k/NiI5bPpvetrQLjf07GMz1gFxg08Ksk0HdWrDwZ2aB9sYfMG1iHkse51TUawRw94ZozGwpCMk1uRo0qpoCo4M3lj5zGTBXTBF6f6k+d0Pfc/DxhYd2T58ymTjZP28hZfsRUTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K0fq8S9C; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K0fq8S9C"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-381b831d535so1738358a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 08:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791214142; x=1791818942; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2aphZCvPoUN2YtXTfwoMzpjA2cGTVD7FqrY+1u8nDJ0=;
        b=K0fq8S9CyMT7OhOXs2WXhLz+4jzypLJCIL8MoOApvQ1zN6GSwzqF9M4IfydxJG6Rjv
         zJGGz0CVOuJ1akvCTpI71a+00CxtRdOzFV9roLh1cTwmzbk54j8Azg5ev+LiDvbaN5yg
         AV0XZh85p/4I4f9J3lNlzQw4qRCV5l2iUx5fABMTYEFLOBM67Uk+kmoEABOKm/KZDbsv
         bCUNEBjMbPGnMx6E1alpQACiworRGwHjm/3d5BC4zIzLMLg0mb8fa6+LKB39Iuagx32L
         WGbs5hwv9csCz+4OqzsEZSutIwdU1/JPcapZz9croTz3EqgG1xIM1Yx/+D68FmGxoPOh
         rKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791214142; x=1791818942;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2aphZCvPoUN2YtXTfwoMzpjA2cGTVD7FqrY+1u8nDJ0=;
        b=JEZdURIkrz20d+dLLyKO4h878QZvs3CqA9zmkUrjtDHZBEEYq+43eCK/uf8mTwwhRC
         cSi3O2t7lUQ6h5fDzWwD1LhpRXFmL0H7ePFii/CCk268CsBD9BjYpofIQ8B+oX/W6PpB
         Ea7qCYcPuTTlGWc4Y2gmq0IE3CZB4L8dZVUGaj6UeP7k3FO+nma2L3c3t+TAYCr3642L
         Q0d32qCDxzms3msgeCRF1V5kM4Hj14j9m66tBWE5UZvDQnRn6X4jg2IeTu9yS6IBEngW
         BPv16kWgLI3DuJFPx2OwgxUFto/jqusohQoFfpc5T7gNWpnmC6GtquU9IbufJJXtCW7R
         jzBw==
X-Forwarded-Encrypted: i=1; AKwUvBz7VIno1/36FTA3oD7gYCgCm4dOTgc8vFfuirE5GwVCK8H6mgX7G8v3Wlch5pD4a/+20f07+AL6xvdD3PY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAGnCl7NNOCfQVr/2lCQsYdwKwop4oUGnWGrT08rZcnMlPH4+b
	y3qsLGaCWv6xiojgnj38LKuRqgyCR/XCKjdiDhpaoyFwidFIamNvlFIxfAhKxdF9
X-Gm-Gg: AYBFou18wUuDJpgJ025HgPZWtaWfUiRefiKqvbmuuSYCwsX8soshx7TGKnDVQ97dolM
	3QHgSlBszlPgILiaNQOPEvAzX7cCkt2S09+mdcgOLizNgncokOx9v0hcrBbh119D8U/lP/ofx5/
	flPy5igQm5g2HVC1x54mb7WeLDORmVvEKPX8drnmjvHbIWxzslsbZhHiKqHb5CGl9+NICLyjDpR
	LuCYqGL0kbeltUehduJJpIEp3szHh85XW7PYN9uqZ3f+B1cp1pS9A4w5vjaVJ2+AfSguefFP/YB
	p9kx5PPsp1ck3tP0qY3/BnlpJIZkqoQzM118qKKE2qAb2OH+YhPyOpQSIXFaxlS4+VUtjwWpsjP
	Cen9GES+1nK53uZ1igcV9QInVI3RMc0VnDCpp+1vq1sIpxDYhbesNgtPhn/PEFDvRcYbO+I1nak
	W16efOkY1+eRArnyDjryewGmzjma1BP/mWcJVXxkD6CDU/8KfXGEKEIoWxblykjL4XPLal2Y6AW
	FgaYVSZI5dC68/a0bARyNrwq+hVKdeyEhAuaUA5M7ooXtmnDH8hxkHYGgvqKj/WlCZvctwPCkAP
	3oaj+kFCPIuEcjGoJRpG
X-Received: by 2002:a17:90b:4a11:b0:3a8:13d6:f748 with SMTP id 98e67ed59e1d1-3a813d79022mr2275652a91.42.1791214140656;
        Mon, 05 Oct 2026 08:29:00 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([119.14.238.184])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a851630206sm29127a91.0.2026.10.05.08.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 08:29:00 -0700 (PDT)
From: Wayne Ho <wayneho219@gmail.com>
Subject: [PATCH v2 0/2] Documentation: ABI: leds: Document shared trigger
 attributes
Date: Mon, 05 Oct 2026 23:27:45 +0800
Message-Id: <20261005-docs-leds-abi-trigger-attrs-v2-0-c5f8970b1b42@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBBFr0K6dkzbCBFX3sOwKO20jAFrOpVoC
 He34AVcvp+f9xbBmAhZXKpFJJyJKT4K6EMl7GAeAYFcYaGlbpSUCly0DCM6BtMT5EQhYAKTcyq
 Llujapj0r50QxPBN6eu/2W/djfvV3tHlTbo+BOMf02fOz2n7/lWYFEuqTl7Vuey99cw2TofFo4
 yS6dV2/BA9UotgAAAA=
X-Change-ID: 20261001-docs-leds-abi-trigger-attrs-a20ed96981dd
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin@kroah.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791214138; l=1542;
 i=wayneho219@gmail.com; s=20261001; h=from:subject:message-id;
 bh=vFA7ME9MP4LGSTz36sJ7z7sOAj5+q54bsBjZSqQwOqY=;
 b=DriwyNpyG1YhnZYturYDPhmeFLOUu7dn6yELWK3IpU4y8bRaUv2ie/PxKf2A9rdbZsgS2RuvY
 jhKh2mwo1aVC7QPS/O6y2GUwEBtS299YfFjbJtT0UH2KvWI49CPNwbb
X-Developer-Key: i=wayneho219@gmail.com; a=ed25519;
 pk=j25LRSikYRlv0PpovZSgSrCQwsy7WDzIYum/mydUa3A=

The delay_on, delay_off and invert attributes are created by several
LED triggers, but only the oneshot variants are documented. Adding a
separate ABI file per trigger would make get_abi.py report the same
sysfs path as defined more than once, so patch 2 moves these entries
to sysfs-class-led and describes each trigger's behaviour there.

Patch 1 is a small preparatory fix: the existing inverted entry still
mentions the gpio trigger, which no longer creates that attribute.

Checked with tools/docs/get_abi.py validate (no new warnings) and
scripts/checkpatch.pl (clean).

Signed-off-by: Wayne Ho <wayneho219@gmail.com>
---
Changes in v2:
- Capitalize the description after the subject prefix, and reword
  patch 1's subject to start with a verb (Sashiko)
- Add Fixes tag to patch 1 and reference the commit that removed the
  attribute (Griffin)
- Link to v1: https://patch.msgid.link/20261001-docs-leds-abi-trigger-attrs-v1-0-54f0529bf0f6@gmail.com

---
Wayne Ho (2):
      Documentation: ABI: leds: Drop stale gpio trigger reference for inverted
      Documentation: ABI: leds: Document timer, heartbeat and activity attributes

 Documentation/ABI/testing/sysfs-class-led          | 73 +++++++++++++++++++++-
 .../ABI/testing/sysfs-class-led-trigger-oneshot    | 29 ---------
 2 files changed, 70 insertions(+), 32 deletions(-)
---
base-commit: 5dd1818b15d98d4a20806cd00b1b40320b06004f
change-id: 20261001-docs-leds-abi-trigger-attrs-a20ed96981dd

Best regards,
--  
Wayne Ho <wayneho219@gmail.com>

