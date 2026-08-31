Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A183D9DAD
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788171814; cv=none; b=TxX/U6gQLvMJjmUqPwOLBQc15pIm4IVQha11NBaJ0DvRGZl4XlpV/pt89liPYxHEwYs1aDsgmdtyAc58nDAgOyiYTJ83xPbDj0euJ5n9dy8BhFAcDiPVGVu+pbP4Wc6oPnpIFad11YqzsHfQUbFg/1utM8FaabJOVNWtenO0gis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788171814; c=relaxed/simple;
	bh=wt/NCQ9rrEf14zO3GiGdIb4HU9ju8kjrl2E7dzq1UbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jkr70r8Rk41zAlcPhv2BeOD379yhxHW0kvadJjjPZEz2Tz1U0EaHqrqIDBAve/t7X+YTL/UAjD8pbdAcVV6d8EdSbjv+NHQm2ZMZq7tg/qXeG3VkMb9HXasQycD9pVVIs+HyzliN8K9CIuaRJaMfuX7frMTRewEcT+clcX4Axcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sUvhfHvv; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sUvhfHvv"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so24139505e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788171810; x=1788776610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2TZ6Fgc9jUQiAVNyqldWXM4Av0maVcK8yGE9huIbARo=;
        b=sUvhfHvv+Jg8bK8gqo7rXbturp4ezyGEe/HnSdj88VfdTWOkKK2FxI3WZuf/BvfxWF
         MNunFFLo1A8FGXtlehIMJz4h1r4bbFofqbSmzcwzddBo3onvpt9PQOf78CAARI9jERUe
         fQYESPq23hS75sFc6vujix4CQvfEhDmtRmlArX7sxY59du3YHRHTiiqo8Q4jqRJTt7lq
         7rPb3Q+Romo/4l/ggRJz1MDGimAA4hJhclGdMP8luv6jsGwj1b8UOauoJDk/eSI8nk3M
         mSgJZz1cRj8EulycpOAW9/bRhDNZD3DHpPv22VlGn6w2Wzuk8x2Mbb7L+WhCRdJ6Cz/n
         J+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788171810; x=1788776610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2TZ6Fgc9jUQiAVNyqldWXM4Av0maVcK8yGE9huIbARo=;
        b=Mb5Gy0GhFhVjQJ+HvC0EFQYImDSCvD5yS0V12kBznpHehbAt4OKTCE/J2wemzOVZws
         RpMkET/zIzkF33MfsBvof7aO9TmopjM7qptSoifLfHTAsvtEm/lyy4GQNNjks26inJ5w
         x1U6PHJAuQsG9VeM2/h6JO0Czm9qP+NmYjHM6OWcu/XuWe9NSVJ3eAeHe/7Jl8X0DbdG
         P1r3nnVySOmI9/ahNRRy6h8byZ+AouatSCQynVKjZYKUz4WPfLyjcBwEUPrJf7aihUWk
         p6hQV66dSu+44y/Z7j0TEgaK2O4km9Mzpf0++vyPXRCbVvIQgwl/82HQ4gV4YNP/oNfY
         HqRQ==
X-Forwarded-Encrypted: i=1; AHgh+RocKQpX/OyVVC0AVcK58Z6E1H4HUZl8YvdIGMMuntOD3aqWH3DM0ky7We4THa25prcVSoVZ4fOITGe08DM=@vger.kernel.org
X-Gm-Message-State: AFuF++k/3itT+b4PlXvOcjSvEFT1znFslusW0H1aA97zQVaIYCftFm4e
	47K5KeBSTgMXsuqNvtExM8M7eVfK6J15+qgQzgnKp8lEH/m75rMWGEY=
X-Gm-Gg: AR+sD10bwfiLJ6QyfR6LBX6/PwxD5w2zMdt1KYY8yMMrHOpO2UroyDQH/aW187uDBp4
	clkJjqfaJEWRhGTRiO/fKqIO5x2TQ2KKQCYjkmQCJ+GJFfeNqBqmFpnvtiPm+hofQP7zzsbuHp5
	HXoh5K2E31NJ8RJdgtN1Soyzu/Sph6uemVobypuM2TfNTRJk+eNuv4IDNOytF+fTZIw7LCiN2Dp
	yV8wIaNAc+5XskLDV1Pa6JOTs/qSjjtVRmXlQagNJkIxA1Jg8rF7UWuQu8h9FdnwQp6meUy2+3w
	dLbucj63NM14wHzPrwEPGgdnlSglH1iF7dG7ONowVYATImGyhEwugtNirAz8pDz0ZjSlbXx3UMJ
	fmjyYr5JhaxMuGUmQRAw2BZpg718/ZPD7dLLftRQmEpyFUXC90YNKSmjVhsAYh+tNcpyd7Q13Xb
	H6z0BKH4DzdC6AAAwu5xaQHKEGO8PZC50W3Y4bN+NghsKsJ6a7DTZWiXU2oVF7hoA/UYt2tmAUH
	9HdXM6Wi8s1Dyf6yZbBcLjbLQfJBkCqmax0V3emZgHu
X-Received: by 2002:a05:600c:528b:b0:49c:d818:8771 with SMTP id 5b1f17b1804b1-49cd81887f8mr65055955e9.7.1788171810244;
        Mon, 31 Aug 2026 03:23:30 -0700 (PDT)
Received: from surface.. (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm336393985e9.4.2026.08.31.03.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 03:23:29 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"D . Manresa" <dmanresa@gmail.com>
Subject: Re: ipu-bridge: software nodes are never unregistered; PCI remove/rescan of IPU6 fails with -EEXIST and leaves dangling properties
Date: Mon, 31 Aug 2026 12:23:28 +0200
Message-ID: <20260831102328.36764-1-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <apU1JxHwqGsQOIlQ@kekkonen.localdomain>
References: <20260827232636.93145-1-dmanresa@gmail.com> <apU1JxHwqGsQOIlQ@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[Resending with the lists on Cc - the first copy of this reply went out
to the people only, due to the same mail tooling error on my side that
Hans just caught on the int3472 patch. Fixed now; apologies for the
duplicate, Sakari and Hans.]

On Sun, 31 Aug 2026, Sakari Ailus wrote:
> I recall unbinding the ipu6 driver successfully in the past. Do you ensure
> above all sub-device drivers have been unbound first? I guess the V4L2
> framework nor the ipu6 driver necessarily ensure that right now.

Measured it, since the machine reproduces this in a minute: unbinding all
three sensor sub-device drivers first (ov5693, ov8865, ov7251 - each
confirmed unbound via sysfs; the VCM client had no driver bound) and then
running the same PCI remove -> module unload -> rescan -> modprobe sequence
fails identically, byte for byte:

  sysfs: cannot create duplicate filename '/kernel/software_nodes/INT343E'
   software_node_register+0xd2/0x120
   ipu_bridge_init+0x192/0xeb0 [ipu_bridge]
   ipu6_pci_probe+0x417/0xbe0 [intel_ipu6]
  kobject: kobject_add_internal failed for INT343E with -EEXIST, ...
  intel-ipu6 0000:00:05.0: error -EEXIST: IPU6 bridge init failed

Which makes sense: unbinding the sensors neither unregisters the bridge's
software nodes nor clears their ACPI fwnode->secondary pointers, and the
-EEXIST happens at the IPU HID node registration, before any per-sensor code
runs. A plain module unload/reload without the PCI remove does work, as you
say - the device keeps its secondary fwnode, so the graph is still wired -
but any path that goes through device_del() (which clears the secondary via
set_primary_fwnode(dev, NULL)) ends at the -EEXIST.

While re-testing this I also got a clean confirmation of the dangling
link-frequencies: with the creator module unloaded, rebinding ov5693 against
the surviving nodes fails with "supported link freq 419200000ll not found"
(-22), and the same rebind succeeds the moment the module is loaded again -
identical rodata back at the same address under the stale pointer.

Hans: thanks for the quick ack on the split. Series sent as

  [PATCH 0/2] media: ipu-bridge: survive module unload and reuse the
  software nodes on rebind

threaded to this report - with one correction to my point 2a folded into the
commit message of 1/2: the property *name* strings in prop_names were never a
problem (char arrays, already copied); the real module-image references were
the link-frequencies values and the "lens-focus" property name literal.

D. Manresa <dmanresa@gmail.com>
