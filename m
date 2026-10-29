Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793237931;
	b=SG41I+QM/y3H27q478g5TMNjK0/8SrbdBVDFiVHJOZmqBGbZkWekFAnv66KgIPE/OrB9
	 vDc/V1X7aGa2A9DSYFSaxG8zN6lpSrgbc3F5bKtyCoCV9Rep2BLpwppZSezcXSbvZcZgL
	 LfA4js+HEXdaAQa8u6Ll3GEcFjvbOFZGA1yDh0YXr9IbAYdEjjHxVjuOKXxKmmJ3H59IJ
	 QhGFwDoUtIvKhlLBztRHM744MEC3LitdUMipgoVnnvhGHxQgc/zZXeyS6lW+JfuhPEoS+
	 0+hF95dYaLNeQvaNdiGB0q2nzVTznjn43/GcFe9ZyK5Tw/HvRk6FlSomCERDftPtrkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793237931;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=0KsyXXIFVna264wri09byyhn1O+wxVThq4z4asXfPT4=;
	b=aZaJo3iGkaMol3htQLGSHVCSF3kaQg8Rdxa7ECzh1PYPDo+cfbjW6mbc5+h+eABq2/hF
	 I/DFhhjTSqOTSVT/7euMaA+hME3lQsOmG+TdjpNDGvSpexPqk9fC9xv2coHZxwkh8Dpy8
	 NouhDu6xj5FtD87MGqyDRd8saNYXmMkLiWuMgO8pBCLKjc+jBSBjzbicDukLRVeIcVE8U
	 IM074JwtjZKsEZKm7NcncEZhtqAleT9/tCGL8gttlQdO7u6outthRoCC52uBdJnJ08uCV
	 0ENGjIhue/nU+su/J7duNQbVBP1xRPbCvj4nWqLx55iXuQUc1N5vJ9gOJJ0qhoUGdqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n7XoVKul;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF28606A327
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:38:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDF28606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n7XoVKul
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so15476455e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793237929; x=1793842729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0KsyXXIFVna264wri09byyhn1O+wxVThq4z4asXfPT4=;
        b=n7XoVKul3KL3Ojs/PWKNAvh4PJguO9+D+Osf7JERMdiK3/5cyLV+vIUzyaRYZrpy8n
         qFbMmLYuUNodhwV0Pa+WDQMCf528Ezj6VJWmthXRGg8SnIJuamtfJwsyglLOrqptwn4X
         dDjpWZD6QkW42TzHWea4dtE8He6kBF5/PO1c+7eu/CDWiWFms3wynh1GAufNyh71Pw7p
         exQSWYMStjedYKSm9nZfAI2ralkHSIajUb7uMhZMtkONvSSKiJJ61nOInyQsPT14OxHn
         MgVKuGqWqwo0lg3CxzUVYEM3pSCdfK0xT5vplYzXNphfPiyEruta4BoI8t6iJzcM6Lsc
         gO6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793237929; x=1793842729;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0KsyXXIFVna264wri09byyhn1O+wxVThq4z4asXfPT4=;
        b=oMeOsWs5lck8XaWeDSeb3B2Xok1m/GnWkExZXWD6YBF4cAOa1LdIl5E0dik6PTpVLJ
         Z6XAAV/pjPBfYGI42ikdnGc8ftmayKwpOuQM+pEGnEePK1c3emw+tPIW6FtYRqyRpWgc
         O463e3hADpGim9dXq5tbtMkL2nCzDGRMStOANHLOY+XgZu2te+DLGkzm9kvdfW5ailaS
         HYTy4o4yDCuMy9QhcZR/04vTK8gNH4DSnsxeg9EroMxQ19E8Zb8d9dLgxZV9aMnhnaZu
         bPPd9xsyqZbeJ/e3VKP/hfi2gWI4/p2B9wvc1mPD4mdWGN8RPfLHBh0gKaBeYZDjltSz
         8HWg==
X-Forwarded-Encrypted: i=1; AKwUvBw3+xkPMhX3mYd8mmY19lylBRZhCJPrVIvklPTlLoYfc6IC9/VDjtUVJiGarZPu+yQrPseTUFdfG8+Nkhs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIEqG6/0c8YFkos0+EXY4cmIG9M/uMrEP86OaZgGMWCUPCkP1DC
	0wKQF1TjZT9I6o/uNZRLpE13HNuxUl34Gk8Zh7mGLGu/9ZAya2PvJyXE
X-Gm-Gg: AYBFou0o6i2NxdRReqUfF3LqZxdwDWIQDMUuTBe3gflNIBlzhiU+E3uA4eDwnXSPiww
	GBQDOuQRbpoT8OjGTRda9cAqjskTfuMHoZ/2wbbYQH2ZUJvoFlu1NoCtxSZ1E9LsV/5O385MIiY
	d/qTAyOpxxELbC/K67gswB2LbvhWh1uMMjJgcrRYcVMc+WfO5TDkByIyrqjtl4KHzjG+METggWE
	ufVZQnIw/ufrqRpc7gajilfQZAdOlI07+BYtUyoNP2gtYAZdjLuDd+evDEbQzPN90Cqzwazd+I2
	fVRoxE+bNe5+GWaVu3hjt4QXhJMLw1CZpxKqmEald6ipz5dQCfT8kcgI0P9O4f0MTdBnCNU1BOQ
	sc6huxJ4S3JyUJKhdvxjJGgTRQj/JyNujW8w8Fd1gQHHb+cSRsJIIfjEp5xIWfGLh5o+S8t4v2j
	irAtqlp/zH4ecfde3mwWIQ5SUPf5Xs2k5n9jtRhjebJdQlg3LPLmDKi4iE2DltMSSM6gNsNd8+P
	umsp1iFTMKY4tjriAMX9hSn+cd7c0+pjtfBk6evOZabZflSY5v2Bsq0IYkj9iDGqQdcjxdbt79v
	ywl3fV1c1gn/aVgjKVfJemAsYQM8kZRafLVpETHYF4WUnP5Mfeajb9gYLh3AsegwT8NzwS4KAa3
	9m9bpfT/mY9lbC3gEDpzs5eyImCzhwfkWBb4F6DalaoQhko1O5SC4i9ZtMIYZBbgDfAFpS6tK72
	qUF2ck0dv/42kHVKR2kBtIobY=
X-Received: by 2002:a05:600c:1c17:b0:4a3:59c9:a756 with SMTP id 5b1f17b1804b1-4a965dd3247mr94503715e9.6.1793237928948;
        Wed, 28 Oct 2026 18:38:48 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-077-007-226-156.77.7.pool.telefonica.de. [77.7.226.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8ddasm34154098f8f.48.2026.10.28.18.38.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 18:38:48 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	=?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-pci@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v4 1/2] Documentation: Update after split of <linux/mod_devicetable.h>
Date: Thu, 29 Oct 2026 02:37:16 +0100
Message-Id: <006464b404e9836e64c22689a8cdb4c34f43c87e.1793221199.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1793221199.git.kmehltretter@gmail.com>
References: <cover.1793221199.git.kmehltretter@gmail.com>
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

From: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Most structs that were defined in <linux/mod_devicetable.h> before were
moved to a bus specific header. Follow the movement to get the struct's
documentation back.

For the list of device ids in basics.rst use an explicit list of all the
headers that have kernel-doc annotations and that are not described
elsewhere (i.e. pci and mei_cl). Leave <linux/device-id/acpi.h> out:
only ACPI_DEVICE_CLASS() has kernel-doc there, so including it would
document that macro rather than struct acpi_device_id.

Generate mei_cl_device_id from its header instead of keeping a copy in
the MEI client bus documentation.

Fixes: ad428f5811bd ("mod_devicetable.h: Split into per subsystem headers")
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
[Karl Mehltretter: use the :file: role in pcmcia/driver.rst, explain why
 acpi.h is left out]
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/PCI/pci.rst                     |  2 +-
 Documentation/driver-api/basics.rst           | 31 +++++++++++++++++--
 .../driver-api/mei/mei-client-bus.rst         | 12 ++-----
 Documentation/pcmcia/driver.rst               |  2 +-
 Documentation/staging/rpmsg.rst               |  2 +-
 5 files changed, 35 insertions(+), 14 deletions(-)

diff --git a/Documentation/PCI/pci.rst b/Documentation/PCI/pci.rst
index be35e9a1ee75f7038539a5f162f621086cc3f495..71c42b0bfa8b3b30b63935b7f4d96e56e9bfb302 100644
--- a/Documentation/PCI/pci.rst
+++ b/Documentation/PCI/pci.rst
@@ -84,7 +84,7 @@ initialization with a pointer to a structure describing the driver
 The ID table is an array of ``struct pci_device_id`` entries ending with an
 all-zero entry.  Definitions with static const are generally preferred.
 
-.. kernel-doc:: include/linux/mod_devicetable.h
+.. kernel-doc:: include/linux/device-id/pci.h
    :functions: pci_device_id
 
 Most drivers only need ``PCI_DEVICE()`` or ``PCI_DEVICE_CLASS()`` to set up
diff --git a/Documentation/driver-api/basics.rst b/Documentation/driver-api/basics.rst
index 3b182cfdf13509f1ee8306cffaaf8c99c337270f..84f701b84e4fc517ed12fcb7001fd1f90252784b 100644
--- a/Documentation/driver-api/basics.rst
+++ b/Documentation/driver-api/basics.rst
@@ -10,9 +10,36 @@ Driver Entry and Exit points
 Driver device table
 -------------------
 
-.. kernel-doc:: include/linux/mod_devicetable.h
+.. kernel-doc:: include/linux/device-id/amba.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/cdx.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/coreboot.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/dfl.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/fsl_mc.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/ishtp.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/mdio.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/mhi.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/mips_cdmm.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/rio.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/tb.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/tee_client.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/typec.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/usb.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/wmi.h
    :internal:
-   :no-identifiers: pci_device_id
 
 
 Delaying and scheduling routines
diff --git a/Documentation/driver-api/mei/mei-client-bus.rst b/Documentation/driver-api/mei/mei-client-bus.rst
index f242b3f8d6aa5754b6064411be360442bf443678..d46c0d0b3540afd6fb85baf0ee51ae5032b6e5f7 100644
--- a/Documentation/driver-api/mei/mei-client-bus.rst
+++ b/Documentation/driver-api/mei/mei-client-bus.rst
@@ -41,17 +41,11 @@ the ``struct mei_cl_driver`` structure defined in :file:`include/linux/mei_cl_bu
 
 
 
-The mei_cl_device_id structure defined in :file:`include/linux/mod_devicetable.h` allows a
+The mei_cl_device_id structure defined in :file:`include/linux/device-id/mei_cl.h` allows a
 driver to bind itself against a device name.
 
-.. code-block:: C
-
-        struct mei_cl_device_id {
-                char name[MEI_CL_NAME_SIZE];
-                uuid_le uuid;
-                __u8    version;
-                kernel_ulong_t driver_info;
-        };
+.. kernel-doc:: include/linux/device-id/mei_cl.h
+   :functions: mei_cl_device_id
 
 To actually register a driver on the ME Client bus one must call the :c:func:`mei_cl_add_driver`
 API. This is typically called at module initialization time.
diff --git a/Documentation/pcmcia/driver.rst b/Documentation/pcmcia/driver.rst
index 5c4fe84d51c14caed1fba614934b37bdc51b4420..0b6370c1d52573c5b48eb8d7d577a6f363997e4d 100644
--- a/Documentation/pcmcia/driver.rst
+++ b/Documentation/pcmcia/driver.rst
@@ -15,7 +15,7 @@ runtime as shown below::
 All fields are passed in as hexadecimal values (no leading 0x).
 The meaning is described in the PCMCIA specification, the match_flags is
 a bitwise or-ed combination from PCMCIA_DEV_ID_MATCH_* constants
-defined in include/linux/mod_devicetable.h.
+defined in :file:`include/linux/device-id/pcmcia.h`.
 
 Once added, the driver probe routine will be invoked for any unclaimed
 PCMCIA device listed in its (newly updated) pcmcia_device_id list.
diff --git a/Documentation/staging/rpmsg.rst b/Documentation/staging/rpmsg.rst
index 63612b7ee120ad230e6f38983758a5a35ece3b0d..ea0eb19811248132f9a221dd49f421f80fcbba06 100644
--- a/Documentation/staging/rpmsg.rst
+++ b/Documentation/staging/rpmsg.rst
@@ -224,7 +224,7 @@ content to the console.
 ::
 
   #include <linux/dev_printk.h>
-  #include <linux/mod_devicetable.h>
+  #include <linux/device-id/rpmsg.h>
   #include <linux/module.h>
   #include <linux/printk.h>
   #include <linux/rpmsg.h>

base-commit: 5b0764a53235d3c77e1ed674e836e1b3fe1a4b1f
