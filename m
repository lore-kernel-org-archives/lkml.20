Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0096B2BE033
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 00:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790384304; cv=none; b=W0kZRTTNzIs5MV3p89m0PEkEJi+PDLqw2QF1EdCb1rdZX9EAlbTnUqmpqZRZEkuY4yWPsg43N3BafaxlyhLs/zn+lrxQDaJxMP+tvbXrE5JD55BwYU7OThKBu4MZ089//7Ep9o2ija/fS+lXfXQOFj6nxy90IgcC6l5ppbEttqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790384304; c=relaxed/simple;
	bh=HPr8/2EtAeRAkpW50wA3FXIhEB229L1oWQntdtEa/N0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XEqZjgpeUTi63APUz9gSXrlOqPeBdxIzl20/6+LiaXDGp3YewliM7HVljnyMFYTyhWHs0uejRCICHfA0mWRxq/jriIRqmD9GVuwRtMe4o3Aw/Gr69IbkMMMpDpEmOQVmfFPdwaokZtLxBQjvoLlDi84vfdB6YDJZXqrN8b6N+AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UEQq3Ypf; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UEQq3Ypf"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887f690df6so827594f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 17:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790384300; x=1790989100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8uSW8OZsYMIZFbWWsjbfvd+eNMCgy9dlKRXhhKSm1DA=;
        b=UEQq3YpfarkfetrkVv+0KYrJLbfQfmPwE5lovfZo1ABJg6qxn+8JP7Uu+dcOjY8GbW
         OUWozJ8rJAJ2G7RIraiSCT/btLbWsKDSc26hWlBOKp0rzD6gKOXBSp4mwK7u7FUKYSzz
         st+zIhA1u5zICyOkXaJGGemKUVqvlQmWvcdduDjZqDKNfptvSEAeiFq12z62jjV2YPl2
         6HReHUoIQFvK4i7V5OfP3gfoOpdIsEl4GHPzb90HzpX8iZ59s+uB24HtPheeaEqzgWCA
         RkWD9JBGWl2Y+WmruRmtH5p1M5rfHCiSYQp2qRFKmG/wWMezkrlj8BfeTav2/LfDHBI5
         7WEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790384300; x=1790989100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8uSW8OZsYMIZFbWWsjbfvd+eNMCgy9dlKRXhhKSm1DA=;
        b=Q7dENmuJhC3jmOPo7jv/3ldB+fNxjoXPd2poOVk147h6edDTW2+s79OAGr80WyTd9m
         4HiS3DHcD5VXkzyInweajaGxGlIrIGRlZ9yNqDVnxcounUoz3lilpn5k5wk0T3T6KxHa
         EAHf3/T9pmWxrft5EGB58bdbtJUDukq7nEDtoFV0gwvp9d2EmHNS4ffjLhLz/aeqa51o
         +PJjaprMKnfhu8PU/LAVC2V80iU3gXE9nTu2tJEPjWe6pVzNnqqNq1nZtAD7sFfcGH3k
         9G+x7D0emzX+5YP+lZ+P+odCnLbWCTkqyfn+120TkPJNA78Ys9HSS0FIt6tRFZjgegKS
         YQCQ==
X-Gm-Message-State: AFuF++kzFyill38rNSy04T0LnM8q+FeCV4Do7F21bzKWHuolUy7Ko5ov
	t4Y1QJY0xgtDMrimJhlrycd+bB4zsqbYho3XjYrJNntlm3jUEnEAP/bG
X-Gm-Gg: AYBFou2dfhCnvC658lwPus+1Wh0TQ5kK6El2dwGuIaWeq2L2z9DKxsGfLayuN6Aeou0
	Fh6HBmApyRD1Lw2CE0H4z15bWLpeooLtAHDoQJO6CGqyOJx/RBSjEETYAgrlQDKESYJmziXJ2dc
	QVF7aQxjlPnJdVBkdSd1Jv3xLwUD/gFihzpbxfQmXqaA+IjFkcqEd2TmT206TgdhD60npDXTMhm
	QKcxh+Iw+BBof/vJf2yNsG28M0zbHLufmSFV0z63nym9FlVT4Z/mCcfV9Oh6fRoSUKqM20JKW/v
	V+fpIl+0um6EtAyE5IOlE94R7GCNn8Xpgm3zw/VACfDuUqcY7ue9Hc2e+uLOmZgJatKqZzwqvTH
	ICqjEW0ZXO1J1+WOaSYMUKbxKjSMbJlB3n+IPPn1jw26is8xV8+Bw4z8Gkw7D8M0exh85/YCSLM
	cGZ0ID21xZaBZ9apMn/+KeNGeuKO5jNZgSitgH1OOgyDCkZ6hJzGA4z7AQIFqp
X-Received: by 2002:a05:6000:490b:b0:487:27f6:a4ce with SMTP id ffacd0b85a97d-488828c8ad6mr4522670f8f.30.1790384300031;
        Fri, 25 Sep 2026 17:58:20 -0700 (PDT)
Received: from ASUS ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a638sm10195890f8f.9.2026.09.25.17.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 17:58:19 -0700 (PDT)
From: Bartu Alev <bartualev@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <benato.denis96@gmail.com>,
	Bartu Alev <bartualev@gmail.com>
Subject: [PATCH v2 0/2] platform/x86: asus-wmi: Fix TUF keyboard shutdown naming and add RGB readback
Date: Sat, 26 Sep 2026 03:56:23 +0300
Message-ID: <20260926005625.171560-1-bartualev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925200744.129714-1-bartualev@gmail.com>
References: <20260925200744.129714-1-bartualev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes the historical misnomer of the TUF keyboard
shutdown power-state flag and adds sysfs readback support for the
TUF RGB mode and power states.

Patch 1 relabels the fourth state field of kbd_rgb_state_index from
"keyboard" to "shutdown": BIT(7) gates the keyboard backlight during
the ACPI S5 power-off sequence (A/B verified on FA507NV: bit set =
keyboard lights up white at power-off, clear = dark shutdown).

Patch 2 adds readback support via DSTS 0x0010005B, which evaluates
the DSDT method EC0.KBLS() and returns the live EC RAM state as a
16-byte buffer (mode, R/G/B, speed, power flags). Both kbd_rgb_mode
and kbd_rgb_state become readable.

Re: the cmd field question raised during review of v1 - the KBLS
buffer carries no command byte. "Immediate (0xb3) vs save (0xb4)" is
a property of the write verb, consumed by the SMM handler; neither
the EC firmware nor the ERM2 mirror retains it, and both verbs result
in the same applied state (verified by writing with cmd=0 and cmd=1
and reading back identical semantics). The leading '1' in the output
is therefore synthetic, chosen as the canonical input form so that
readback round-trips with what userspace writes.

Changes in v2:
- Split into a 2-patch series:
  * patch 1: isolated naming fix with a Fixes: tag for -stable
  * patch 2: the readback feature
- Renamed the new DEVID to ASUS_WMI_DEVID_TUF_RGB_READBACK to avoid
  confusion with ASUS_WMI_DEVID_TUF_RGB_STATE.
- Documented the synthetic cmd field in the patch 2 commit message
  and here.


Bartu Alev (2):
  platform/x86: asus-wmi: fix TUF keyboard power state shutdown naming
  platform/x86: asus-wmi: add TUF keyboard RGB readback support

 drivers/platform/x86/asus-wmi.c            | 87 ++++++++++++++++++++--
 include/linux/platform_data/x86/asus-wmi.h |  3 +
 2 files changed, 84 insertions(+), 6 deletions(-)

-- 
2.55.0

