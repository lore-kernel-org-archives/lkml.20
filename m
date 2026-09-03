Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBFF3E834F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 20:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788466215; cv=none; b=ifkexkbgOb6oWL+xZxZOqF15SdJ/+dQE7eB/s247Q8stqKJemyCdrHKsXs4IzkiHpa8Sjt5At/RF/+PskgoWkrA4FCxkviqjQ0Q69HaubMNeVso+2NPt1ltkRMvgry9bJ5jS/19KFqCmdmWHWKxoYVEwSffvcujnR9s2IAoCqjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788466215; c=relaxed/simple;
	bh=33gmwnaoOgewiIfzCE3tR2Aa3m4ljb1ArNTdi+ongu8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=E1+5Bj3XUTwEYZIUJ5a96s71ZM8B8O9JJ//AyWKV3fyb5CHDW3HIfE6WsJgU1SLpj8Df9j3Y3g+ctqThlh6CMNscGbVA5iQiTtKnhQqj9IMgpHEsZhhVLTyak33s8mPMzgfGh1bUXPxLrhPEkRS7RPWtJArkR0CaA45PsNAMdhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WHxYIucw; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WHxYIucw"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-48a0ca07c38so266680b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 13:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788466193; x=1789070993; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JWJmyHh0/BVQQFMvbAXDDBvFjk+duepqeHP4tC9bWq8=;
        b=WHxYIucwKkn67UMOB4DS+x/eXuT70korgfOagsgZa2YosSuGl2X/Q7EGITzjsWSYnr
         jODFwD6dBCFYaPTCNSoytAfh2uNRAJm8iRgwNIPjGVHZgHy4QbT9ZapT/R03fQx69Z7B
         tsnjAjsHJWYT9Ml+NyabuTA4S/7ssrU5hrx33CAdhEbtCtvK66A9yuIYG1CcNcuQL/DZ
         9DBDP7l0lFaF70kkdIYJ7ggozlZ2g8D3CJE1T4vYuzfS1pdoGpZOdHfjy7SppcWaJHk/
         +wgBMe9PYkNZCoz0lTFFzjdNuqzuIbwKRpUhhgYDcrrCBbgieZfCmCJkWT5GCvbUiL8X
         8SNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788466193; x=1789070993;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JWJmyHh0/BVQQFMvbAXDDBvFjk+duepqeHP4tC9bWq8=;
        b=pPvVhvmCjUZseazEiP7Wrt3LXdVUBKLeR6CxDfPh6cfT17HulDKbvO4kGMX8Z2GdxJ
         n4P8TqVjvM3QFs1DCkpGp+bmxaLihyvYcGZaAlK3qAP2oJQ12xOPqjkb/zDEt5FGPEng
         OG4aLuPU9dYug36qB4nALC68UGinw1ZZK4gmkCOks4HFN0EYypw+tVnXFt57jUitqPpp
         GzJ3QEQ+GJJ88o5fRj/ye0vWtrofK4pn2wTX/xmpDoBQBV8RQoceE8/Hiv5wzhA+gNHP
         7AtB16p1Fdy7T9mU79rjqP9qPw5wDsc65V6rd0wQGWtqZPcD3nO0/MSEJvdh7Fh+b9IC
         IH4A==
X-Forwarded-Encrypted: i=1; AKwUvByeKlyoVgWwy4Rr0vJ5QgPIBMme0FBWvda9nZ+sEE2PRuNjHsBMirHw2VBjwfIf9VnlEtAkictuL/Pn9ck=@vger.kernel.org
X-Gm-Message-State: AFuF++nTKiQ7y3cB5yBRquzqys6+xlwl2ZeHGdO8PYPp2fs7VFwb+U49
	haD5uUpjpE0AsbN/RWu+IWtH+6LW9xkT3ubBuYTKv8MKJJJXj0mPinRaae+96Q==
X-Gm-Gg: AYBFou1x6W6gEhw83iLwdOpAu4xFewZrnnAHx6N/K81AvaWEtLPIDZQlf90yWjTSKDa
	BsEz0ZdEkEERXRi7qpmOj9FF/qbeQN+aTt8X35oOwmjK6LDPHGFb+qgT13UswWFSdXT1rWaIAuf
	Yn5wCEOiDNBh94120OJxrfF6DfPM2niSP9bzUPMRIZz3LqlaoB2hLEz2AfhC4vgWxTDbmyrn2T5
	2yf3MjJe2BJZV87SUnnQLcJpSPJMnVU1qp0GCzr8RRULUgsz+e+GRhQMJZsluL69ZV5u+hjmt69
	7TJnffT7NGJW7RJUrrF9EYUAyE7W3M71jHGngCTjdyLwpVXSxLSsC/9BwkwgQpDYwsnSXGeYgSn
	FdSgiiYM76gxStLhFAgeLANEBaSO8nXhOqxfX6g5++n+xdx0WkFxaFr5hxijxLtkEhRTJnQGxCL
	DsnArSZQU5WB6V2HvezYniGPKLUmxHvkhcPQMJCmGUNCsJJmPbJuVxH4ZI3zl9bJwoVaobo0+hQ
	a+gngJF6bQESx800F5KJVT9cKnaSjvi0imWJWtik/6idzii5Zsli4fVH9ziO3YizJ1ylSyJH714
	EmQwBDd22IvfA9W5B1vFZGUI0kFAxT9hsBTTIJ3uv1oDka4s0zcvvaotFSwNbuvy5jKoZ85zDCh
	g2g8d7as8foBOTZWJ2aA=
X-Received: by 2002:a05:6808:159b:b0:497:da47:df5f with SMTP id 5614622812f47-4b9623ccb8emr868245b6e.17.1788466192869;
        Thu, 03 Sep 2026 13:09:52 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b971246d9csm252885b6e.7.2026.09.03.13.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 13:09:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v9 0/4] mfd: add X-Powers AC200 support
Date: Thu, 03 Sep 2026 14:09:39 -0600
Message-Id: <20260903-submit-ac200-mfd-v9-0-6b7ed278989c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XOTWrDMBAF4KsErTtlNETyqKveo3Sh30Qhtovli
 oTgu1dOCwltoMsHb743F1HilGMRL5uLmGLNJY9DC+ZpI/zeDrsIObQsCEkjSwnl0/V5BusJEfo
 UgJ0NOqCJxEq0s48ppny6km/v37ndHKKfV2dt7HOZx+l83axq7f3waG78qfFjgnAebJ89VAlVA
 YJLViZWkh3x6663+fjsx16sQ1XfUY8+rboBXjlJhjxvzR+g+w/oGsAOdVKK7DZ0vwG+AQbpAcA
 NIGtRd4SOrb8HlmX5AtPRB/SPAQAA
X-Change-ID: 20260811-submit-ac200-mfd-8bad6d09e285
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, 
 "Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, 
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, 
 mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

The X-Powers AC200 is an I2C-controlled mixed-signal companion IC with
a paged register map shared by its audio, video, RTC and Fast Ethernet
PHY functions.

Add the parent binding and an I2C provider which enables and rate-locks
the shared input clock, initializes the paged regmap and deasserts the
common reset without resetting state left by firmware. The common reset
remains deasserted during removal and shutdown, so unbinding the provider
does not disrupt independently enumerated functions or discard wake state.

Describe and instantiate the audio codec and TV encoder as MFD children,
and provide the shared regmap interrupt controller needed by the TV
encoder. Only enabled, DT-described function devices are instantiated;
PHY-only systems therefore acquire no unused platform devices. The ASoC
codec and DRM bridge drivers are separate subsystem work and are not part
of this MFD-only series.

The current regmap consumer is the separately submitted AC200/AC300
Ethernet PHY series:

  https://patch.msgid.link/20260818-submit-acx00-of-dynamic-v1-v9-0-b8c8d9ad0d83@gmail.com

The PHY remains enumerated on MDIO, its primary management bus. Its AC200
package node follows the x-powers,ac200 phandle for ancillary I2C register
access, adds a managed device link and obtains the regmap with
dev_get_regmap(). This series and the PHY series can be merged in either
order; AC200 Ethernet support requires both.

The child descriptions and MFD implementation are adapted from earlier
work by Jernej Skrabec and Andre Przywara, with their authorship and
sign-off chain retained:

  https://github.com/jernejsk/linux-1/commits/opi3-eth/

Public AC200 documentation is linked from:

  https://linux-sunxi.org/AC200

Validation included dt_binding_check with dtschema 2026.6, a W=1
x86_64 object build and strict checkpatch checks. On AC200 hardware, a
writable common-register marker survived supplier unbind and rebind. The
provider and PHY then completed 100 overlapping bind cycles; both MFD
cells were removed and recreated during every cycle while both device
links remained valid and the 100 Mbps full-duplex link recovered.
Afterward, 100 pings in each direction completed without loss and 8 MiB
transfers in both directions compared correctly.

The available board does not expose the codec, TV encoder or INTB pin, so
the functional audio, video and interrupt paths were not runtime-tested.
Temporary child nodes nevertheless instantiated both MFD devices, and a
temporary probe driver bound to each and read the parent common-control
register as 0x1.

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v8 -> v9:
- deassert common reset without first resetting the entire chip
- leave common reset deasserted during removal and shutdown, preventing
  supplier unbind from disrupting the PHY or discarding RTC/WoL state
  (reported by Sashiko and queried by Lee Jones)
- stop storing the regmap as unused driver data after dropping teardown
  callbacks
- describe the audio codec and TV encoder MFD children
- add the AC200 interrupt definitions and shared regmap IRQ controller
- register only enabled, DT-described codec and TV encoder function devices
- retain Jernej Skrabec and Andre Przywara's authorship and sign-off chain
  for the adapted child and MFD work
- make the base provider depend on COMMON_CLK before child support is added
- require an upstream interrupt when the parent is an interrupt controller
- credit Jernej Skrabec in the module metadata
- exercise child enumeration and parent-regmap access with temporary probes
- rebase on the current MFD for-mfd-next branch
- verify register-state preservation across supplier unbind and rebind
- Link to v8: https://patch.msgid.link/20260902-submit-ac200-mfd-v8-0-2aa06720b8ac@gmail.com

Changes v7 -> v8:
- identify the PHY series as the current regmap consumer
- describe future MFD children and the MDIO/I2C split
- store the regmap directly as driver data  (suggested by Lee Jones)
- reset the chip from the remove callback  (suggested by Lee Jones)
- drop the revision log and inherited-driver attribution  (suggested by Lee Jones)
- add Krzysztof's Reviewed-by tag to the binding
- rebase on the current MFD for-mfd-next branch
- Link to v7: https://patch.msgid.link/20260811-submit-ac200-mfd-v7-0-8b06f552a4d7@gmail.com

Changes v6 -> v7:
- drop the managed external-syscon helper and AC200 syscon registration
- leave the regmap attached to the I2C provider for direct device lookup
- reduce the MFD series from three patches to two
- Link to v6: https://patch.msgid.link/20260811-submit-ac200-mfd-v6-0-c5b1292c8498@gmail.com

Changes v5 -> v6:
- split the MFD work from the independently mergeable networking series
- put the merge routing and shared DT design at the start of the cover letter
- rebase on the MFD for-mfd-next branch
- Link to v5: https://patch.msgid.link/20260809-submit-acx00-of-dynamic-v1-v5-0-bfa1f8518b28@gmail.com

To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
To: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-sunxi@lists.linux.dev
Cc: mfd@lists.linux.dev
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
James Hilliard (2):
      dt-bindings: mfd: x-powers: Add AC200
      mfd: ac200: Add X-Powers AC200 support

Jernej Skrabec (2):
      dt-bindings: mfd: x-powers: Describe AC200 functions
      mfd: ac200: Add codec and TV encoder cells

 .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 186 +++++++++++++++++
 MAINTAINERS                                        |   9 +
 drivers/mfd/Kconfig                                |  15 ++
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/ac200.c                                | 230 +++++++++++++++++++++
 include/dt-bindings/mfd/x-powers,ac200.h           |  13 ++
 6 files changed, 454 insertions(+)
---
base-commit: b07adc1a304c7ca9ac25a01051561538757363c9
change-id: 20260811-submit-ac200-mfd-8bad6d09e285

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

