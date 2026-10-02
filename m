Received: from mail-oo2-f35.google.com (mail-oo2-f35.google.com [74.125.231.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA143B8948
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.163
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929090; cv=pass; b=PZtEq9I5sfnFcWMBu5ZEHqumi2uM6Lq0BAUtcA3y6Ad3tT5DPRpKC5k1+pWPzk3LBRN3n2WY5UvGDjB/9BAVHZMtUqGDGvGytQ9d+oRK3ZKGU4hByLSqc+gBtLPjtRam4G1SNgXLzChpagX68oCaNSZkktuu5oyk8pNeph3FHdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929090; c=relaxed/simple;
	bh=LJKFHSTiUvLAjJ/VIXM6YPJb+Zc8LgEWzbj49x57W1E=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ToItowQ6dw/8ODmey352EU5+V2xLj9kgIHF1MO/Sq21oeM1bfmvBXHVk7jbG3ZOzFV6dz6Bj/cE/rEX7V/4Re1X/d3OQaTPFRoc3DbBfNgcJPrP1bWZEektAPW/nwShLwK4nR7ozPFoTWgq47cZG4/Zgk/oe3d3hfxCOxX5Zrpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GoxLAo3b; arc=pass smtp.client-ip=74.125.231.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GoxLAo3b"
Received: by mail-oo2-f35.google.com with SMTP id 006d021491bc7-6de31c745c0so375474eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 01:18:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790929087; cv=none;
        d=google.com; s=arc-20260327;
        b=Wc1K8Em2Vduk3fG6ff/q4JX5yGZjsTMjhLoB55a+irWgnn4KiDD8+69AUoCreLMDIJ
         qD+P2L/sXWcTuKZOlflDbyyHG6qlhIzBO8d6At6s9qd5oeVXVSp/9ZD4ApLwi1FgDI7a
         SwrWK70Wbi+fQ73sX/+m7YWBN1bBQZsq6/Pv2cCKPrn9O6ZmH4mp/Xa+LxK9pfD4A6MW
         VUi2Ck4KFVnZSG+fzo386uYdV9k430qmcHY+N0Kr0A0/pdi49z3sfhcUPZrX/my852Ob
         Q6jm4elqNBwaezYmM/fOSSgeVdrIh208/TpnTp1/hTUu+tCfePF9wk8VW7jY3mC3G4Ha
         0fWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=v0dU3KDoaUwlcRWe6yD69OiYZX3sEVsHkRy8Aa+hH+U=;
        fh=sEAVl3kxCpkB5FcUzVUX4iCOq1N3WC7LcedG/kwOco8=;
        b=KSUTAhwqNoRo5To6jLQnWbXNBwPxHKDibtrGykGcyYD9nMnTElnSWv7xGYU5DnwLfR
         1YB8k64o1VVI8HfM+kVKCfh6WFhhQxMCUoJ7OAkioaOfqaf/WzawGc3hbKk1wZVcKoD2
         /xvypxnPOgAipTD4WBPPzNY13XabzqRIOXj7KHvkZs6DA8ukD4429twfsa/sKfu8O1GX
         gQzqaJjMF0n46W9XxLDuxThQWLymK9wMr48G+3lT0+kxFuGHkTtulOyck2zxjtaQ+m2Z
         M24HzNdJKNIfqJb+m37DhrbzQGXvgWyqmtb+V9TM4TkanRvcvBpDD+p7bixlJSB7LLHD
         FCGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790929087; x=1791533887; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v0dU3KDoaUwlcRWe6yD69OiYZX3sEVsHkRy8Aa+hH+U=;
        b=GoxLAo3b3I8DXrcwXxmPLGgf7yRDYn2c53XASxacvBOVj4//IuawGI9DOuQqYLRKQX
         B38/Bjb4ORjzq8ShyVhkbplm+ot7HtkWsGC9ZSG3SK+cF8UKbSEYcJNvLvxuHeRSgKvR
         NvnGWmQpGSwUWLH3AklkoWN8wPWEEEd1PNFEfIoVzd2my2HgJzSTAadltQGCRqIaoxrT
         Wx+bmJsl5s8JGTeB7n6nFh2mFJ3nC0/DYk52VoE4fcAFVF0voANWIl+1/IuVTvOdBPSH
         B9x1jey1XtbvFU4SUYq0AbRpH+uOIVuwsfO9hEiaeSB7+yX3L3o4Z5Kr4qzjNK9TC/o4
         v/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929087; x=1791533887;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v0dU3KDoaUwlcRWe6yD69OiYZX3sEVsHkRy8Aa+hH+U=;
        b=YwcO9BSuln4tH52h4BnFjGRIforHB5mQZTr/hTKsGI39rt87f2+pPBliuVYvYHnfqE
         5G0zbf38oYiqNX7mV0U1geAl+cP/6tTGgEf2LIlE+PaEY0LEGjSQt5JHXI9WPu7x11AW
         29QjhEW2f0l4zrHr/7q6sVQ8KiV3v4NSppKTe0DcWHqm2gkgxstWF/PM3UOAXLgm3xhD
         sQaBdXPRHEYu8p9Sfi/aSeHHAb8R7UTMepSbGuwVVQ85roZ8UgmJr5333tk8UfOfdGFp
         F7zD7aFiLpicplfCHZEf1N/cqZaKNR1s5kzrSA8ESMf0B7oFEavp4jVcRBm9fDiyk9HP
         +1mQ==
X-Forwarded-Encrypted: i=1; AKwUvBwuxMhIov0Gz/+9arlJyGtGYqsLDptiZkYdv2z85i1tDN4c5pl+Nbe4ALkfFo7esoc8kw9dgsqWjwK43G4=@vger.kernel.org
X-Gm-Message-State: AFuF++nmxaqahTRUhxRoaJbMdvdmPlMN5bY0VpBL5tN5/r7OViPbcZMG
	PW6PMpM8gP0e522qplBjQ6mVKXO/MNov2nkaRzDgb9DPs6/CODXfJ/Ai+FbWkkOY1fbvRqvzLHq
	dfOSFGpNH0Yn/IHv2m/GAMKfyiiwpn1o=
X-Gm-Gg: AYBFou211MSAgx0Ug3Q1dz2GT7DYBaGeMEumc54ExWdI4GwApq5snmzVjVayVb51cic
	svMCePGFsAHj71JFqT/eeHeGgXzBX16nffCArAoBNIEh0ETe1b1TRE9AqDJxX262u9KqfYXaVKH
	9d2qu9d+pUHUbKo5ATXclEBkV/aJ3Y3306Pf4nksE9KPOMdoK4NoNHRQIYRU5TJY1qv6ujhtO8P
	eetcGjVB1NN4KOEuFhDxcOBNIYnvbYWZKT9P2xxIPy8ps9Lyph6wuaUx3/VixgppStH1kyiDyAS
	dsfVBey6Ro+GGZauYAMrQBPny0TW6XyaXPxYexJEu/mKZpwmtDvT6MQJ3+XDG/PiNmDYkrgGxP9
	aQx60jkxPlWAhufMF0YpYbKVmD3sbPV2V/Q==
X-Received: by 2002:a05:6820:4b82:b0:6de:66e3:a1da with SMTP id
 006d021491bc7-6df34e6e7b8mr1524663eaf.50.1790929086699; Fri, 02 Oct 2026
 01:18:06 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:18:06 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:18:05 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mauriziocasciano7@gmail.com
In-Reply-To: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
References: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
Date: Fri, 2 Oct 2026 01:18:05 -0700
X-Gm-Features: AclHuK88D0NKLwKndTFmgE2vFrp8ERoNDOCao5xUibVGg-27A_K-DelGF2nwZkU
Message-ID: <CAO7O_xgAyCn=PeaEzoYqbe1F45C-hFsXKG2QbVWV5DUZMyv_DA@mail.gmail.com>
Subject: [PATCH v8 09/15] media: intel: ipu-bridge: select OV2740 frequency by
 IPU ID
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The OV2740 connected to the Cherry Trail AtomISP uses a 288 MHz link,
while the generic OVTI2740 configuration uses 360 MHz.

Use the bridge's existing PCI-device matching mechanism to add a
Cherry Trail-specific OVTI2740 entry before the generic fallback. This
keeps the platform distinction in the bridge and avoids adding a second
per-sensor link-frequency override path.

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM
---
 drivers/media/pci/intel/ipu-bridge.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c
b/drivers/media/pci/intel/ipu-bridge.c
index 62852fe1a406..1a133194cbc0 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -21,6 +21,8 @@

 #define ADEV_DEV(adev) ACPI_PTR(&((adev)->dev))

+#define PCI_DEVICE_ID_INTEL_ATOMISP_CHT	0x22b8
+
 /*
  * 92335fcf-3203-4472-af93-7b4453ac29da
  *
@@ -58,6 +60,11 @@ static const u16 ipu6_ov5693_ncont_clk[] = {
 	0
 };

+static const u16 atomisp_cht_pci_ids[] = {
+	PCI_DEVICE_ID_INTEL_ATOMISP_CHT,
+	0
+};
+
 static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	/* Himax HM1092 */
 	IPU_SENSOR_CONFIG("HIMX1092", 2, 180000000, 180480000),
@@ -112,6 +119,8 @@ static const struct ipu_sensor_config
ipu_supported_sensors[] = {
 	/* Omnivision OV2680 */
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
 	/* Omnivision OV2740 */
+	IPU_SENSOR_CONFIG_MATCH_FL("OVTI2740", atomisp_cht_pci_ids, 0,
+				   1, 288000000),
 	IPU_SENSOR_CONFIG("OVTI2740", 1, 360000000),
 	/* Omnivision OV5675 */
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
-- 
2.53.0



On Fri, 02 Oct 2026 01:15:55 -0700, mauriziocasciano7@gmail.com wrote:
> Add camera support for the Lenovo Yoga Book YB1-X91L. The tablet uses
> an AtomISP ISP2401 with an OV2740 front sensor, an OV8858 rear sensor
> and a WV517S rear-camera lens actuator.
>
> The series adds the missing ACPI and bridge configuration, selects the
> OV2740 link frequency through the existing IPU PCI-ID mechanism, derives
> AtomISP CSI-2 timing from the sensor link frequency, enables raw Bayer
> capture and adds the sensor controls and actuator driver needed by the
> hardware.
>
> Runtime validation used the same 15-patch content on the current
> media_stage.git master. The final media-committers.git next rebase changes
> only three source line wraps needed by the media 80-column check:
>
> - W=1 builds and sparse builds of all eight affected objects passed both
>   before and after the rebase.
> - A full x86_64 Debian binary package build passed and produced kernel
>   7.3.0-rc1-yogabook-media-v8-20261002-001605.
> - The kernel booted on a Lenovo Yoga Book YB1-X91L with AtomISP PCI ID
>   8086:22b8. OV2740 negotiated 288 MHz and OV8858 negotiated 360 MHz;
>   both sensors bound and AtomISP registered two cameras.
> - OV8858 digital, red and blue gains were changed during streaming and
>   read back correctly. Continuous raw capture produced changing frames
>   from both sensors (6/8 unique rear samples and 8/8 unique front
>   samples), including front-to-rear-to-front switching without OV8858,
>   I2C or CSI errors.
> - Both front and rear cameras were also exercised successfully with
>   Cheese.
> - v4l2-compliance 1.32.0 completed 47 tests on the AtomISP capture node:
>   40 succeeded and 7 failed in invalid-ioctl, multiple-open, input,
>   control enumeration, stream-parameter and buffer tests. These failures
>   remain a validation limitation; this series does not claim to make the
>   staging AtomISP driver fully compliant.
>
> Only the Yoga Book 19.2 MHz OV8858 path was hardware-tested; the existing
> 24 MHz paths received build and static-analysis coverage but were not
> tested on separate hardware.
>
> ---
> Changes in v8:
>
> - Keep patch 2's commit message focused on the implementation, remove the
>   invalid review Link and move runtime results to this cover letter.
> - Express OV8858 frequencies with HZ_PER_MHZ/HZ_PER_KHZ, name clock
>   tables by their input and link frequencies, and remove platform names
>   from the sensor driver.
> - Explain that V4L2 exposes standard red and blue balance controls but no
>   standard green-balance control, so green remains the unity reference.
> - Replace the per-sensor link-frequency override with the IPU bridge's
>   existing PCI-ID matching mechanism. Add an 8086:22b8-specific OV2740
>   288 MHz entry before the generic 360 MHz fallback. This removes the
>   associated AtomISP hand-off patch and reduces the series to 15 patches.
> - Add the introducing commit to the OV2740 group-hold fix and mark it for
>   stable backporting.
> - Use the documented Assisted-by tag syntax.
> - Keep the padding helper as a normal static function and avoid a
>   single-use raw-format descriptor structure.
> - Retain Andy's Reviewed-by tags only where the corresponding patches did
>   not change materially. In particular, drop the tag from the redesigned
>   IPU bridge frequency patch.
>
> v7: https://lore.kernel.org/linux-media/cover.1788360629.git.mauriziocasciano7@gmail.com/
>
> Maurizio Casciano (15):
>   media: ov8858: Extract digital gain programming
>   media: ov8858: support 19.2 MHz clock and manual white balance
>   media: ov2740: Use C99 initializers for ACPI IDs
>   media: ov2740: Add OVTI2740 ACPI ID
>   media: ov8858: Add INT3477 ACPI ID
>   media: intel: ipu-bridge: Add Yoga Book camera sensors
>   media: atomisp: Add Yoga Book camera configuration
>   media: ov2740: support 288 MHz link frequency
>   media: intel: ipu-bridge: select OV2740 frequency by IPU ID
>   media: atomisp: derive CSI-2 timing from sensor link frequency
>   media: ov2740: release group hold after gain write errors
>   media: ov2740: add manual white balance controls
>   media: atomisp: Use struct v4l2_area for padding
>   media: atomisp: allow raw Bayer capture
>   media: i2c: Add WV517S lens actuator driver
>
>  MAINTAINERS                                   |   1 +
>  drivers/media/i2c/Kconfig                     |  11 +
>  drivers/media/i2c/Makefile                    |   1 +
>  drivers/media/i2c/ov2740.c                    | 114 +++++++--
>  drivers/media/i2c/ov8858.c                    | 221 ++++++++++++++----
>  drivers/media/i2c/wv517s.c                    | 208 +++++++++++++++++
>  drivers/media/pci/intel/ipu-bridge.c          |  13 ++
>  .../staging/media/atomisp/pci/atomisp_cmd.c   |  81 ++++---
>  .../staging/media/atomisp/pci/atomisp_cmd.h   |   6 +-
>  .../staging/media/atomisp/pci/atomisp_csi2.c  |  20 +-
>  .../media/atomisp/pci/atomisp_csi2_bridge.c   |  19 +-
>  .../staging/media/atomisp/pci/atomisp_ioctl.c |  32 ++-
>  .../media/atomisp/pci/atomisp_subdev.c        |   4 +-
>  .../media/atomisp/pci/atomisp_subdev.h        |   3 +-
>  14 files changed, 605 insertions(+), 129 deletions(-)
>  create mode 100644 drivers/media/i2c/wv517s.c
>
>
> base-commit: 4a069a763e8a86821edac4159f7c59a20015631b
>
> With Best Regards,
> Maurizio Casciano
> --
> 2.53.0
