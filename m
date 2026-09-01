Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F2049CF20
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 20:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788293740; cv=none; b=DMNwyZgeUOOoUW6kqIX4255TgI0pW/4jyL/MqsZQ1riuureV9LkhIb9uIk7qloML9aIo8WEEX3K90NMwhkJKoSVgG7w1QbqLhvA22ee7gMv82ZzJesISTSX8IR6HmCeaNnRZbqQ4hg2CX99fGoPpIsXln0K7RR/5HFiRXtUekfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788293740; c=relaxed/simple;
	bh=cJOwANXsns+yJs5nTVNXvONbCvG3P9x+z8ucm4oFG10=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NY6N77aggIJDfLlmCViGKnFuW7r17JcstY0NxuDL4Bq7wV4nb8DA4CvH2OKeAkY5iiwQzbGnRHeFAJGuaPb0go8+DQZamwxW/jB8EUzgveNHD6BNyTgjE9gOwg3vUHgCcfth2oyqCwiCQqwLCQsOIpe2dzBneHyB5nu/ctA0qiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gs0nxSH5; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gs0nxSH5"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49557167508so2090345e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 13:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788293733; x=1788898533; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=k//5+ex1wv6rehYjvgeSrN8I8SE+YPxfqJSZJxeYEAE=;
        b=Gs0nxSH5Dr0xjOgFBEZXKttUWbb5mvzJ6Gtsbna37z+XuM7qahVQ0Qy8iVniBZEIzI
         zzLZjqis+jT2Zkfe1b7dFZIPVOdyU13Z2wW74nDJt7aqPrE7ccTeZLJpq/y2evOojvd4
         yJRdtUPIog3gHt32NOkvZCbwgqMIN86P7X+ILb9sbz9CykbFGfYYc+w/Nw4Y/7m/NDOD
         4ILp/M/+9u93ZGeM8x0uWPmif3wHcjWAxIK02JYxWUu0kkIet8vL6sZzv7oxZ/bbpfqy
         VyWviwZyOQTmWTiPdHE5b6zBIiDOf0j90jNGViMxftI3N0cIwK1eHq2x6ouy5gCjpjot
         XIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788293733; x=1788898533;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k//5+ex1wv6rehYjvgeSrN8I8SE+YPxfqJSZJxeYEAE=;
        b=U8NMCwHj+0689h/Y2n6uEB0hqDWu9TAeXV4GtQwtCTYBmVedLHIDMDGbax6kV3Oi0V
         mnjNMxhSD8vCTw6nR8ascoeER759ayw1QqoRBHup4KiWhvh1sWp9lJdNyPti84kH+l9O
         8hzqJTdC0s1ji1muiozEZeUpx42T1+s/0bs6OU5uKDMjiN2OhyTLybPeiKSLdDCB/lnP
         9ScVXtrcCPQna0zNKGGjq/yeKeVruBEIc6ZO9+Y+UA10J+lasuUrYjGwI8OTOz2tXKwG
         pmyGe7aZtJaz2LZpIZ4NpFfH9pvFyOqXRa7CsreitFR3BXx0mkDjMW/U9y45wJF5j0jL
         s7Iw==
X-Forwarded-Encrypted: i=1; AHgh+RrqF3lLoRFW2M311yPLsYvCBc/GA55MGoS4f60TOboB6e2y/WLdGjOnHNhklBTc0Vu38Led9oNvKnPk4E0=@vger.kernel.org
X-Gm-Message-State: AFuF++nvk+OAr2cQ7SCthARIiUVNpTnZOf5ShyOmpGVpVEP4npvo/CBs
	ZsdHKo3cKIUcEZzwtFXQKNvCT3Hd5hSVKp+Mx+ANyWTQIPy2UlthfKoCd6KDj0tzu/U=
X-Gm-Gg: AR+sD11Ox/CWRzuVZwYH+lLfnMLpbetlcO6hrkOJU+9V784622ZXSgBEnqy6A9XjP2E
	xhWXRvAszBP53sXzDKqBQBj+Z/2YmejdVY0vlq5Pv9l2KmbXjK5cwa+MjYbo3Qk4OrKWiyuJ3Fd
	/fQ+/ZnZEfYh0kBqt4Q0F8t1qQTDilti1UO6nuulxWVVDY4H5BJrCj56PUGGz0wvCR83ZMRDBhJ
	ZKrrHMnGyJdi8ccL8sdx4It4bq/V9LAWgbMvgVhbyRY+98D2czciqG6zurE1JWalYAGQY6Xs+4J
	mEnZIfewQnepBTbRzK0Le3jl7JexAVsXD/KAT+qsxAmiLRZ8ZzbPvhFvFkW4BnT1wdhDbG3gssU
	kjIB5hYmy2eowixPGrO2FQG6xWUSgW1LnQVHKCN6dDPikCJ7O0I2peB+PC9HClwyl/wom9B66nE
	eP2N2Hk9/aVLHjzI5kxkrbh10wZzfFv295O0l55mOJWKjYQVeW0SK72zLQzLW8JHYIGd/RxbY=
X-Received: by 2002:a05:600c:6388:b0:495:52a5:8829 with SMTP id 5b1f17b1804b1-49ce583e8a8mr1925755e9.11.1788293733306;
        Tue, 01 Sep 2026 13:15:33 -0700 (PDT)
Received: from [192.168.0.35] ([64.43.35.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce478daf6sm19909445e9.15.2026.09.01.13.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 13:15:32 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v16 0/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
Date: Tue, 01 Sep 2026 21:15:21 +0100
Message-Id: <20260901-x1e-csi2-phy-v16-0-dd863b929080@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33SzUoDMRAH8FeRPbsyM0kmiSffQzzk0y5IW3alK
 NJ3NylIY1I9JvCbmUz+X9OW1iVt0+Pd17Sm07Ith305IN/fTWHn9q9pXmK5mAhIgUaYPzDNYVt
 oPu4+58xSSM8Ko3BTIcc15eXjUu/5pZx3y/Z+WD8v5U9Yb/8odMIZZi1d8F55ZPJPb8verYeHw
 /o61Uon+tEMRKrTVLVWnKJnnZwdtGg1d1oUjZgYjFZWIgxaXrXAvrcs2kIASyCMMXHQqtFDb1V
 0wTnorALg+G6+akXYaa69oxbR+qgjjZPrVlOndd2aDR7JQHaRB21aLTptinZGMRupbBlt0PaqN
 ZhO2/puQvB1dTLkQSM0HHte8gOz0gROl51bJUaPrbe9x8vmwGGKwILGX0P619fEhaAFYvnTeOP
 fsIlcmbP3l8wxBIFWGcM35pet172vqSNdGmdZgm9v+CZ2Wgz9a+4yGYkCY8Lsfvnz+fwNH5ton
 xoEAAA=
X-Change-ID: 20250710-x1e-csi2-phy-f6434b651d3a
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=16104;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=cJOwANXsns+yJs5nTVNXvONbCvG3P9x+z8ucm4oFG10=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqlzJh/UHrmijjnAvSDlLEToCN/8wZpdIuzG8d6
 A9Srm8TUPGJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCapcyYQAKCRAicTuzoY3I
 OhpjD/4tKixICfzyIXsXJbh3XodRtEvQwtI/HH3cUrK/hlzRSA2zsgmTHpZDO4KIIYgsUnOOHiS
 N+iWF7vzZo+W4zS7G0/GHrLaiIEXPbXS0MxBd2K88Pp0vN8lc/ukglAkcZ+tTlnUJGK3E8x+RZj
 T02NyQ5x5v9mR83wrwYy325WWUv5Zdx8wvdU8MwBmAKwM+pEB+tbcaaCtLxmk76mpETR5ALAp+Q
 LQAIKo+qFJdOK9JCmudpekZCFyfHyjkTrEVgPtXk+z8qwyLeIBbBiuB8snxWcIh2AExkU+zDHOc
 xX/9QNdHNUTxgS5gOcMba6QcGkTCg4s602dPj4S06QC9S/rnm8cmf7gaILgjJN6BzRgY8HKYw7+
 WjsR8JhBdrVla9RoL8l8ejaJ8pNRFp8kiZuD4oKqS9yVIIBum9fCaXadkn6phVMh75YkDT6qq1N
 kjZmyIGAz5Hq7AyLzUO0uNHBTMnn4ddpB/UX/eC2UZIbUKIhU6AvlqLozDBQqfGHV4uHDFeFV33
 JLWhjMhucuxXoEFLDd9tx8cwl98435UxOnidIrfdxv2OQgVH6H7/O0CkJGYIP4U+WPg8v8bKkXh
 Is2qnD8QgbKQzrMW5fytMJHKHFc6xazMmTXMlpTQbPcnrq0XlP8JUdMC0Psqb8w9hu4Zrue5xwi
 JsiBCLKyVsN7xGQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Missed last kernel cycle, received some additional asks on data-lanes in
the meantime, reflected here.

Would really like to merge this in -rc1 so that a lot of other CAMSS work
and SoCs can be unblocked.

Changes in v16:
- Switches to data-lanes starting at 1 i.e. data-lanes = <1 2 3 4> - Neil
- clock-lanes fixed to <0> and <3> for single/combo mode.
  In default DPHY mode the clock-lane is a dedicated pin for each PHY
  something like DCLK_A(P,M) on PCB schematics.
  In the alternative mode data-lane #3 becomes clock-lane.
  Representing this in the yaml means clock-lanes gets included. - Neil
- Fixing clock-lanes to either 0 DPHY or 0 and 3 DPHY/combo per our
  best information this is the only supported split - Neil, bod
- Changed comments in yaml to reflect changes - Vlad, bod
- Minor change to driver to translate data-lanes from logical
  to lane definitions. bod, Vlad
- Link to v15: https://patch.msgid.link/20260730-x1e-csi2-phy-v15-0-f284131de1fa@linaro.org

Changes in v15:
- Defines combo-mode as 2+1 or 1+1. - Vlad
- Updates data-lanes with more descriptive text. - Vlad
- Makes endpoint regex less broad - Vlad
- Adds Vlad's suggested-by - bod
- bus-type kept required can be relaxed later
  defaulting now is ABI - Vlad, bod
- Changes include-order in example - Vlad
- Link to v14: https://patch.msgid.link/20260727-x1e-csi2-phy-v14-0-27d1bf477593@linaro.org

Changes in v14:

Discussed outstanding review comment resolution with Neil and Vlad.
Use media-graph not phys = <> to find nodes in dt. Small impact on this
series a new helper added where it is used in camss series.

- Drops phy-cells.
- bus-type used to derive mode instead.
- Includes relevant video-interfaces.h where necessary
- set_mode - used to validate csiphy and camss agree on bus-mode.
- Reverting to of_phy_simple_xlate instead of custom xlate.
- Minor schema change - dropped Krzysztof's RB.

- Link to v13: https://patch.msgid.link/20260720-x1e-csi2-phy-v13-0-160c31958863@linaro.org

Changes in v13:
- Fixed two sashiko "high" flagged items. Hopefully for the last time.
- Added PM_OPP to depends - Sashiko
- Link to v12: https://patch.msgid.link/20260719-x1e-csi2-phy-v12-0-cc7311326d1b@linaro.org

Changes in v12:
- Fixes indexing for data-lanes = <0 1 2 4> which is out of range - Sashiko
- The rest of Sashiko's review rebutted on list - bod
- Link to v11: https://patch.msgid.link/20260719-x1e-csi2-phy-v11-0-9d0a1ed0632d@linaro.org

Changes in v11:
- Adds RB - Krzysztof
- Fixes div_u64 to div64_u64 - Sashiko
- Fixes pos * 2 reg offset - Sashiko
- Fixes devm_pm_runtime_enable. Missed in v10 - Frank

- Link to v10: https://patch.msgid.link/20260718-x1e-csi2-phy-v10-0-5720a7888953@linaro.org

Changes in v10:
- Rewords commit log of yaml schema to read more organically - Krzysztof
- title: Qualcomm X1E80100 SoC CSI2 PHY - Krzysztof
- opp-table: object - Krzysztof
- Example opp-table in PHY node - Krzysztof
- port@1 uses stock graph.yaml - Krzysztof
- Dropped redundant remote-endpoint declaration - Krzysztof
- vdda-0p9 - SoC pins are vdda-0p9 rail is l2c_0p8. Named as with pin - Vlad, Konrad
- Retaining #phy-cells = 1.
  Rob gave a steer to have the consumer configure this via DT. Not the way
  Vlad suggests but I'm sticking to Rob's guidance for now - Rob/Vlad.
- data-lanes - retained as per CAMSS existing.
  Nihal suggested, I agreed and Loic added his assent too. Vlad disagrees
  with this. I accept Nihal's suggestion though we should remain
  consistent. - Nihal, Loic, Vlad.

- pd_data = {} - Sashiko, Wengmeng
- lanes_enable() failure unwinds - Sashiko
- power_off and error paths drop OPP rate before performance state - Sashiko
- probe returns -ENODEV when pd_list is NULL with ret == 0 - Sashiko
- Move to devm_clk_bulk_get_all(), timer clock taken from the bulk,
  clk_names indirection removed from soc_cfg - Frank
- Drop static CSI_COMMON_CTRL5 (0x1014) table row - Nihal

- Link to v9: https://patch.msgid.link/20260708-x1e-csi2-phy-v9-0-0210b90c04cf@linaro.org

Changes in v9:

Key advantages of implementing this logic as drivers/phy:

  a) Per-PHY power rails become declarable and enforceable on a per-PHY
     basis.
  b) With future adaptations of CAMSS routing the PHY output to something
     other than the CSI Decoders becomes possible.
  c) Standard framework contract. phy_configure(mipi_dphy opts) / power_on / of_xlate.
  d) Introduction of CPHY in this driver will elaborate CPHY for Linux in
     general as there is currently no mipi_cphy_opts structure.

- TITAN_TOP_GDSC retained. Further elaboration in below link. - Vlad
  Link: https://lore.kernel.org/all/d5407ab1-1af7-4678-ae67-5cf30ce8fa4b@kernel.org/
- Consumer selects PHY mode - Rob Herring
  Link: https://lore.kernel.org/linux-media/20250710230846.GA44483-robh@kernel.org/
- Incorporates two comments by Krzysztof I missed previously - krzk
- Changes 0p9 rail name to 0p8 - Konrad, Sashiko
- Uses port@0 and port@1 to denote input/output - Vladimir
- Label phy@ instead of csiphy@ in example - Sashiko
- Drops additional entries in example opp one is enough - bod
- return 0 on timer_period_ps < 6. - Sashiko
- Use power-domain names and a "scaled" bool to flag if
  a power-domain needs to be scaled or not. Allowing the code to
  attached to all PDs, GDSC and RPMPD alike but only scale the
  RPMPD. - Sashiko
- Fixes error cleanup flagged by Sashiko.
- Checks args->args_count. Sashiko
- Performs checks on pd_list == NULL. Sashiko
- Makes opp-table required. Sashiko
- Uses const "core" and "timer" when getting clocks. - Loic
- Adds AHB clock - Vijay
- Revert v7 lane-enable change, BIT(pos * 2) is correct: data-lanes
  are logical indices, CSI_COMMON_CTRL5 is a physical bitmap - Nihal
- Adds a comment to explain clock-lane - Nihal
- Link to v8: https://patch.msgid.link/20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org

Changes in v8:
- Fixes two dt verification splats I missed by passing the wrong yaml file
  to my checking script :( - Rob's bot
- Fixes the polarity offset error - thanks Sashiko.
- CONFIG_PM implies CONFIG_GENERIC_PM_DOMAINS no change - Sashiko, Bryan
- Implemented suggested unwinding by Sashiko
- Leaving the flagged settle_cnt alone. Requires invalid DT settings and in
  addition the result is just a long settle count. Not real bug - Sashiko
- Link to v7: https://patch.msgid.link/20260522-x1e-csi2-phy-v7-0-79cb1280fad6@linaro.org

Changes in v7:
- Made CONFIG_PM a dependency. Sashiko commented on the pd_list being NULL
  and suggested I check the pointer but, we need to ramp the rails when
  switching clock rate so we need CONFIG_PM full stop. - Sashiko.ai, Bryan
- Added unwind operation for performance state error path - Sashiko
- Made clock-lanes genuinely optional for the supported use-case. - Sashiko
- Fixed the enable of lanes. Thus far we have had forever it seems
  val |= BIT(lane.pos * 2) which I've never looked at much because it
  has always worked. But looking at how to switch on polarities I realised
  the relevant register is a linear bitmask without gaps so the correct
  method is `val |= BIT(lane.pos)`.
  This needs an update in the legacy PHY too in another series - Bryan
- I opted not to do any of the "but if DT send junk into your driver" fixes
  from Sashiko since TBH I think the code would be Spaghetti afterwards.
  We trust DT and if DT is wrong we fix it, we don't try to graph its
  relative (in)sanity.
- Fixed my example in the yaml. Sashiko
- Link to v6: https://patch.msgid.link/20260521-x1e-csi2-phy-v6-0-9d73d9bd7d20@linaro.org

Changes in v6:
- Taking feedback from lively debate added ports and
  endpoints to the PHY - Neil, Vlad
- Detection of split mode by way of which ports are declared.
  port@0 is always a sensor input.
  port@1 is optional and if present implies split-mode
  port@2 is always the output. - Dmitry, Neil, Vlad.
- Split mode is left as -ENOTSUPP unless/until someone with the appropriate
  hardware can take on responsibility to drive to completion.
- Extending phy_config_opts dropped.
  I think this is a worthwhile extension but this series no longer depends
  on it so dropped. - Bryan
- MX/MXC.
  Two OPP tables one for CSIPHY0/1/2 scaling MXC one for CSIPHY4 keeping
  MXA at LOWSVS_D1 - to be implemented in DT not here. Taniya, Konrad, Bryan
- Changed MAINTAINERS from Supported to Maintained.
  Hobby time for me right now. - Bryan
- Link to v5: https://lore.kernel.org/r/20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org

v5:
- Adds support to apply passed parameters for clock/data position/polarity - Neil
- Drops GEN1/GEN2 differentiation this can be reconstituted if GEN1 ever
  gets supported in this driver - Dmitry
- Drops camnoc_axi, cpas_ahb - Konrad
- Renames csiphy->core csiphy_timer->timer - Konrad
- Renames rail from 0p8 to 0p9 schematics say  VDD_A_CSI_n_0P9 - Konrad
- TITAN_TOP_GDSC dropped - Konrad
- Passes PHY_QCOM_CSI2_MODE_{DPHY|CPHY|SPLIT_DPHY} with the controller
  selecting the mode. Only DPHY mode is supported but the method to pass
  CPHY or split-mode DPHY configuration is there.
  Since split-mode is a Qualcomm specific mode the PHY modes are defined in
  our binding instead of adding a new type to include/linux/phy/phy.h - bod
- Depends-on: https://lore.kernel.org/r/20260325-dphy-params-extension-v1-0-c6df5599284a@linaro.org
- Link to v4: https://lore.kernel.org/r/20260315-x1e-csi2-phy-v4-0-90c09203888d@linaro.org

v4:
- MMCX, MCX and MX/MXA power-domains added - Dmitry, Vijay, Konrad
- power-domain-names added as required - bod
- opp-tables amended to capture RPMHPD deps - Dmitry, Vijay
- Switched to dev_pm_opp_set_rate, dev_pm_domain_attach_by_name etc
  dropped inherited CAMSS code - Dmitry
- Amended parameters structure to specify power-domain name list - bod
- Removed dead defines - Dmitry
- Noted in CSIPHY commit log intention to rework patterns of
  PHY lane configs into loops/defines/bit-fields later - Dmitry, bod
- Lowercase hex throughout - Dmitry
- The yaml and code in this driver doesn't care if the node is a
  sibling or a sub-node of CAMSS confirmed to work both ways - Dmitry, bod
- Link to v3: https://lore.kernel.org/r/20260226-x1e-csi2-phy-v3-0-11e608759410@linaro.org

v3:

- Resending this to make clear this submission is additive to x1e/Hamoa
  The existing bindings and code will continue to work 
  Bindings are added only, nothing is subtracted from existing ABI.
- Link to v2: https://lore.kernel.org/r/20260225-x1e-csi2-phy-v2-0-7756edb67ea9@linaro.org

v2:

In this updated version

- Added operating-point support
  The csiphy clock sets the OPP prior to setting the rate
  for csiphy and csiphy_timer - Konrad

- Combo mode
  Combo mode in CAMSS yaml has been added. Right now
  no code has been changed in the PHY driver to support it as
  I don't have hardware to test. In principle though it can
  be supported. - Vladimir

- CSIPHY init sequences
  I left these as their "magic number formats". With my diminished
  status as a non-qcom VPN person - I can no longer see what the bits
  map to. Moreover this is the situation any non-VPN community member
  will be in when submitting CSIPHY sequences derived from downstream.

  I think it is perfectly reasonable to take public CSIPHY init sequences
  as magic numbers. If someone with bit-level access wants to enumerate
  the bits that's fine but, it shouldn't gate in the interim. - Konrad/bod

- Sensor endpoints
  I've stuck to the format used by every other CSIPHY in upstream.
  Sensor endpoints hit the CAMSS/CSID endpoint not a endpoint in the PHY.
  Given the proposed changes to CAMSS though to support "combo mode" I
  think this should achieve the same outcome - multiple sensors on the one
  PHY without introducing endpoints into the PHY that no other CSIPHY in
  upstream currently has.

- Bitmask of enabled lanes
  Work needs to be done in the v4l2 layer to really support this.
  I propose making a separate series dedicated to non-linear bit
  interpretation after merging this so as to contain the scope of the
  series to something more bite (byte haha) sized. - Konrad/bod

- Link to v1: https://lore.kernel.org/r/20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org

v1:
This short series adds a CSI2 MIPI PHY driver, initially supporting D-PHY
mode. The core logic and init sequences come directly from CAMSS and are
working on at least five separate x1e devices.

The rationale to instantiate CSI2 PHYs as standalone devices instead of as
sub-nodes of CAMSS is as follows.

1. Precedence
   CAMSS has a dedicated I2C bus called CCI Camera Control Interface.
   We model this controller as its own separate device in devicetree.
   This makes sense and CCI/I2C is a well defined bus type already modelled
   in Linux.

   MIPI CSI2 PHY devices similarly fit into a well defined separate
   bus/device structure.

   Contrast to another CAMSS component such as VFE, CSID or TPG these
   components only interact with other CAMSS inputs/outputs unlike CSIPHY
   which interacts with non-SoC components.

2. Hardware pinouts and rails
   The CSI2 PHY has its own data/clock lanes out from the SoC and indeed
   has its own incoming power-rails.

3. Other devicetree schemas
   There are several examples throughout the kernel of CSI PHYs modeled as
   standalone devices which one assumes follows the same reasoning as given
   above.

I've been working on this on-and-off since the end of April:
Link: https://lore.kernel.org/linux-media/c5cf0155-f839-4db9-b865-d39b56bb1e0a@linaro.org

There is another proposal to have the PHYs be subdevices of CAMSS but, I
believe we should go with a "full fat" PHY to match best practices in
drivers/phy/qualcomm/*.

Using the standard PHY API and the parameter passing that goes with it
allows us to move away from custom interfaces in CAMSS and to conform more
clearly to established PHY paradigms such as the QMP combo PHY.

Looking at existing compat strings I settled on
"qcom,x1e80100-mipi-csi2-combo-phy" deliberately omitting reference to the
fact the PHY is built on a four nano-meter process node, which seems to
match recent submissions to QMP PHY.

My first pass at this driver included support for the old two phase
devices:

Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/a504c28d109296c93470340cfe7281231f573bcb#b6e59ed7db94c9da22e492bb03fcda6a4300983c

I realised that the device tree schema changes required to support a
comprehensive conversion of all CAMSS to this driver would be an
almost certainly be unacceptable ABI break or at the very least an enormous
amount of work and verification so I instead aimed to support just one new
SoC in the submission.

I've retained the callback indirections give us scope to add in another type of
future PHY including potentially adding in the 2PH later on.

This driver is tested and working on x1e/Hamoa and has been tested as not
breaking sc8280xp/Makena and sm8250/Kona.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (2):
      dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
      phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver

 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 222 ++++++++++
 MAINTAINERS                                        |  10 +
 drivers/phy/qualcomm/Kconfig                       |  15 +
 drivers/phy/qualcomm/Makefile                      |   5 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 385 +++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     | 462 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  97 +++++
 7 files changed, 1196 insertions(+)
---
base-commit: 8dac27bfa2f994ecb11f01a63641527d17d48fc1
change-id: 20250710-x1e-csi2-phy-f6434b651d3a

Best regards,
--  
Bryan O'Donoghue <bryan.odonoghue@linaro.org>

