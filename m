Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06F047209E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200269; cv=none; b=nZlek+ZW0+bBFXBsIJmAz4lHeaq8u3EyHSeWThihZ8Zo9UMJS2hSUjkPwbZh4Mwf3EpcMPue3MqMaMGHh9tWumP+BabgOuovyaj4kXrJpsSyHJNL0i4Kb+y2QiMwqd8/UeYPJy2xkDmmyoWV0n8oMbLWp+1kYljceTldN/3i1wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200269; c=relaxed/simple;
	bh=OeOMtRVxvS0JeyYlF9MXmfz45YZ/wT4jtknpmDobNLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sfZLVCOnYMvlPOfaFbp+rjlli3V5w+RMmaE9H9lO4yFWZQpRxP5XnoAxZe4Kdo8p6dL1VJQIMc7ALccLkJSeCqesdZ3okFSrRSztgqplyyxJmWiFAtfIY0A8Q7SgSJEIO7ZANSkxYtfnQHV/Toz/HSq9eyU0wVC6HtgFqgacxSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WuG8Dfpk; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WuG8Dfpk"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49557167508so40640185e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788200266; x=1788805066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WyDz2nLkbWYY/AAdq7qnbGHGgMcZjHLpY7/Qvzyy3GM=;
        b=WuG8Dfpkms36R4jaP0aMajSpsqLNnzYM8SQrFS8lJ1Ti7XlTyw8DnTiLDwXaYDZ8f5
         qcVPTNmHwt0UWIBLGV9HG4+iQ4NimzIq5dU55/XRng4urgQeGQEyqO+jdN5pMbJ7jKyd
         kwNaqgCAkYoQ+66OyJkFzwvwMR4n3SMhO/Ar/1O67eyNHD6tBL1LmqzFTwn80+nul/ey
         rOHGuNPwp2z1tOCYpfyjhfr2L4N8LiXIsojJF39Qy9D8NPiCNi31epwxgjZ4HxI2wsSu
         1owDsZkDJLKCQwW8sLThStNppsmEAAib1JP6n8ZmEOqKslYxeVXGULb9+Ez7uapbYzBe
         3hEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788200266; x=1788805066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WyDz2nLkbWYY/AAdq7qnbGHGgMcZjHLpY7/Qvzyy3GM=;
        b=IUZe49i5EMR1lEuLKiHR8GAhKC5OMqBqPm9EKBDANvitcA328JGacOdG0qR2oqSCzT
         hurWr3M0TDedu3gno+x1qt8quiyPnb59UV11HZ9FDR62Pzrwq1JuDM+AJwKxkSS5zvWk
         Qnl7QnWn94S2G7cqo7Zdz8qACSq5awwMVfY2pYqE7R3WBmn9FC0on0lnaOUMDnXKBtTh
         oxnI/XmLYrXhyJzcm91Ct9SOmaE3/1kPE3tm3/19/tk7DfSvDv3gZMLcjCRbO9YvadFF
         T0nmvOjrD6DUpGYHSFgtvnCeHTfEtnNBC+R51bBMPI8sICoXPzUUatgZgTr9FGK07qGA
         gy0A==
X-Gm-Message-State: AFuF++msiCAIJrZSL53zQV6TyzE+KuazO2W8ulYOFG4K7SJODDpuo34m
	DjomgktM7MCfG9rfcr0qvm5+ZSqZBOz+Mp5bLfHK9xmpZgM5hyyf9Q/1
X-Gm-Gg: AR+sD13N7KxjnWMoueXBsZ8TsCQd6KLVbBYJSBD7RQurP6/i1TTGQRO7VAATfgnnnvC
	MZX0YJ8Y+7f1ZcfGq76qYUsJ86yR/R7LG4VpR7qfaG7BgW65MuHce/8WvL7W6Xi1FlGXBc4XKLB
	ReSq81pZfdz+JWHSuAZVL/zCUrWaSJYsoSRDi9oNZv5nezAk4EE02JXFn77FTHpAyb262MFPmGA
	3dLtw2WzqhvPxR/D+WHHGMBhuNLWj/qk4nJXG6EThTfsNu9ttqAADH3z8x/kVl94FeW+1pkRn4q
	833/szJ6xZ4Se8Y+iBbITtCIgauSqAnbfVZt/Pl8bIbviTOj+MmxT94Zy/AD8lgr3BqctP596V8
	Uxqjh0AaMNsEdcNMd1hN2rk7Ay2Ci2CN0YgmHvvS/caApzdTq2xSiru5168+ur/fYrV+LbiYuZ6
	UiCO+LQZZM4Gzx36nfla8GMrKKgPKtLgJnlq9OlY3wU5mU8edxOMY+Zz4NXKsxZ8zTqf1U0RidS
	qssATJYsYvBbhtCgu7xUz0=
X-Received: by 2002:a05:600c:34ce:b0:49b:9205:45b3 with SMTP id 5b1f17b1804b1-49cdc572c7dmr47404135e9.15.1788200265542;
        Mon, 31 Aug 2026 11:17:45 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:5d3a:fe75:a74b:bc2a:bdfb:30ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cca3e642dsm184579205e9.2.2026.08.31.11.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:17:44 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] media: ipu-bridge: Request non-continuous clock for ov5693 on IPU6
Date: Mon, 31 Aug 2026 20:17:39 +0200
Message-ID: <20260831181739.320972-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <amr-HbyocAh4lHSO@kekkonen.localdomain>
References: <20260717132021.18034-1-fernandorimoli11@gmail.com> <20260720163819.104130-1-fernandorimoli11@gmail.com> <20260720163819.104130-5-fernandorimoli11@gmail.com> <13d6659f-4b51-4041-8aff-70b991ac306e@ideasonboard.com> <20260720235018.11077-1-fernandorimoli11@gmail.com> <amr-HbyocAh4lHSO@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sakari,

Thanks. Noted on the line length, I will keep prose to 75.

> The support for non-contiguous clock isn't mandatory on either side
> (whereas free-running clock is and should always "just work") so as a
> whole this is weird. But as we know the sensor works with IPU6 with
> non-continous clock, that's what I guess we'll just have to do then.

Agreed that it is odd. The sensor side is not optional in practice here:
with the free-running default the IPU6 receiver never locks and capture
times out, so on these devices the "should just work" case is the one
that does not. I have no visibility into why the receiver behaves that
way, only that gating the clock lane is what makes it lock.

> How about adding PCI IDs (for matching the particualr IPU) and flags to
> struct ipu_sensor_config? I have a feeling we'll need this elsewhere,
> too.

Done in v4, and it is a much better shape than what I had. The quirk
helper is gone; struct ipu_sensor_config gains pci_id and flags, and the
ov5693 becomes table entries rather than code.

Two small deviations from your sketch, in case they were deliberate and I
have missed the point:

- IPU_SENSOR_CONFIG's expansion referenced _NR without it being in the
  parameter list, and forwarded "..." rather than __VA_ARGS__, so I wrote
  it as:

      #define IPU_SENSOR_CONFIG(_HID, _NR, ...)                       \
              IPU_SENSOR_CONFIG_MATCH_FL(_HID, 0, NONE, _NR, __VA_ARGS__)

- .flags = IPU_BR_FL_##_FLAGS does not paste to anything for a plain 0, so
  there is an IPU_BR_FL_NONE for the generic case. That keeps every
  existing table entry unchanged, which seemed worth having.

The one thing I would like your opinion on is a semantic that comes with
putting a PCI ID in the table. A sensor with both a specific and a generic
entry for the same HID matches twice on the specific IPU, and
ipu_bridge_connect_sensor() would then enumerate the same ACPI device
twice and consume two of the four IPU ports. So in v4 the more specific
entry wins and the generic one is skipped. It is implemented as a filter
in ipu_bridge_connect_sensors() rather than by requiring the table to be
ordered, so it does not depend on entry order. If you would rather have
this expressed differently, say so and I will rework it. An explicit
"generic" marker, or resolving it at match time, would both work.

ipu_bridge_ivsc_is_ready() also walks the table, but it runs before the
bridge exists and is an idempotent readiness check, so duplicate HIDs are
harmless there and I left it alone.

On scope: v4 sets the flag for IPU6 (0x9a19, Tiger Lake) and IPU6EP_ADLP
(0x465d), for both HIDs. To be exact about what hardware stands behind
each: OVTI5693 on ADL-P is this series running on my Surface Pro 9;
INT33BE on Tiger Lake is the register value, confirmed on a Surface Pro 8
and a Pro 7+ by linux-surface users. Jakob's Tested-by from v2 covered
the Pro 7+ but at the old value, which is why I dropped it. v3 matched
all of ipu6_pci_tbl, but now that the IDs are spelled out per entry I
would rather list only what is confirmed on hardware and add the rest as
reports arrive, Surface Go 4 (ADL-N) being the likely next one. Happy
to broaden it if you would prefer the whole family up front.

> You could also switch to dynamically assigning the property index so
> there's no need to rely on a particular device having a list of link
> frequencies. See NEXT_PROPERTY() macro in drivers/acpi/mipi-disco-img.c
> . That should go to a separate patch, like adding the above mechanism.

Also done, as patch 4/6, before the mechanism. It is a no-op refactor:
the endpoint property slots are named in an enum and assigned through a
bounds-checked running index, so the array is sized by the enum and a
conditional property no longer has to sit at a fixed slot.

This was a latent bug and not just untidiness. Because the property array
is NULL-terminated, v3's approach would have silently dropped the
property for any sensor with nr_link_freqs == 0 (INTC10C5 is the one
in-tree example): the empty link-frequencies slot terminated the array
before anything after it. With the running index that cannot happen.

v4 is 6 patches:

  1-2  HID enumeration, unchanged (both have Dan's Reviewed-by)
  3    ov5693 clock-lane gate, now bit 5 only, set with cci_update_bits()
  4    ipu-bridge: dynamic endpoint property indices
  5    ipu-bridge: per-IPU config matching + flags
  6    ipu-bridge: use them for the ov5693 on IPU6

Each patch builds without warnings on its own, at W=1 as well, on top of
v7.3-rc1.

Thanks,
Fernando
