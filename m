Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653096;
	b=EOYCSKu+d/W42dMMnOY6Xadf5n3U40PERDKGrftSHOPhkJzn9HSU1cwmMD6KJSf9Uzxl
	 fvd9x0P8cMHXB3rLlHqGCEuAqSyvQkT7S4oRNiAE0ruI5bYRYGdAARAjbLLT1AwAusC/z
	 +pjTqxDgQv/JD5f2tApf64lL3rwGF3tIRhvGsPx/vNn/82rFS6DYxgD116qkW2IolxCgy
	 xbyaXKVe5SOezqTmuaHC0IQ4jCSdCcEXjfJMTgaRxyZTGpyHtMShXdi8FPdRGtZT8Gzla
	 d+1/w87WnvcR4Jh7F0/t6+FKOki0NmXLcHn114ZJ4CefknUS/BycwxE4eKfxDTVZ0pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653096;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pvEhqoQU9qwof/ZCvruZqPsLisOWBTlPTHxj6hsS5vs=;
	b=AAqJ8cvf/SoOfm9kp97SJ0BjBwNybT6AZwBYLZv9758fAODfLLr7pDlDiwNmesJpzXJH
	 nB7zvy27T4qY7XNtRXLruXRVeLnLPd2KdQyu31KkPSFsbK1gZ9fziEg1Klut2k2O8HaqA
	 tYzMNK2q838haiLOQZv2lluV9VkIlzL4ggkspkFloBmIUd+eCx8RrKmujm3LyANYq06x4
	 qAVyQayH89MpfjuDRI0HF7lTpqJ4jh7DEgdjx8R3K0iYyFHizZhcpCTtE9LEYxV72pOZf
	 A/5/kzlzDgeSVMK0UEyHbs26ixMgF4vDNw5kKuF+9G7y6JEsFcKQFhIFOQv3Qvpgk+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sA+FXepa;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08775606CE14
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08775606CE14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sA+FXepa
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so18836205e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653094; x=1795257894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pvEhqoQU9qwof/ZCvruZqPsLisOWBTlPTHxj6hsS5vs=;
        b=sA+FXepaRIFoF2Cb9K9p78u6gEXNtQ0ZT8m1jbxnP4Vq1S+vwiXswlUwkJT6azScEj
         Az+YwHliRh8pIBnLqqwcYQP2jGwS1kdWNrQcVR7B7Cq/PVjmrwdoovf3KZ/bzoF/5Pvr
         yGM3sld2mHiLHbZeSrTe6C1Q2Hr4/eRsOfP7d+LL0MNa6BTBW0UZWtQpjaWmaTTBhjnd
         x/Yz7dguUlG/dXCE22wgKDkizjYb2Hj8SCv4F7Rh+lav6+PA9mt6IDDSAKKuHXwVltyC
         deEMFoab+XVaeTpmq0TdqGwET/K6B/mEX4VKpNH4swlKzVpCjhop5OzO27fZXzVP6reH
         JEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653094; x=1795257894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pvEhqoQU9qwof/ZCvruZqPsLisOWBTlPTHxj6hsS5vs=;
        b=Zdm6rqdt2g5RoJeW89An4CoRlb/pZzTGrRSkuU2jsMJ3uT8YK/dDAR2AYh2Do9h8c7
         /s0XyB25xDa3waIRBql9WqB52B8pclP05hWpLCtVuXiLhGU+fKe6bDK0sJCyTVjgPYym
         cT4ZG98TQp9SrAz6HWYtOIzhhGFnKS6gRXYiCMP6x2vVXaRe+0LsGzTz9qrY+rCeDnSF
         4Zo+MVW+NAYPze84Dtl9oFAsfv+xcOF2pXkzdAvZgLF0s7Sigu7ucV/A3uh9TpYxj41F
         6Y4tze6P+XpXsj3SEdIL5xCBhvJb0GuibfWf35Jxi5rbcxU3vPP7B+LgFZ2vIQo0majN
         yy3A==
X-Forwarded-Encrypted: i=1; AL+hErGJ6+XRDKN+vsJu1aVPb73mrhTE/ze6XZVOQ/Cjcsoo0PtiSdRjgiVyp4sQp4JfaePZ0LzYC2AaRLZ9Kto=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kOn5Fn/iHUaHCOXZ0zj4sRQ+SydLOePoOwkvyVLVgx0HHpL6G
	vdqDOvTjtlJHyR99Te4aWICC4UVBk0E3WF1umBMyRuWm46tm0hMFOGWm
X-Gm-Gg: AYBFou2hw2kM/MyLTzJnwSiz8KDfwFdmb86ibv/klQ0HVhlGPSWGiwXgCOe1+EM5kV+
	GYfzlxSW0362JoIiTO6nQraw0bKxC9ev4q8APkNjku4yMJhLaZyejET55yAsIFspgmDkHlms4tI
	xklYoRJMk3lNg5vm0zUAiB07aiuyjzOqkUmSaUZ4tCfVUF0OCUHlfI3Pp8+IoN0bHwHL9rN+C6K
	s81AdrWFw0mqDhUapLAGYG3T0NP/2N1wQUB86FdJCFkSRL+0rQORcTslzBKp9QE8X4HggwwvSGP
	NQn2oWY9qh897TTqzz/MYZS7ADry+8sq3GvwGF/zTP98OHp+rOWn/bwW4/EGd0VCs6He5AmC9On
	NOpvBDzfQ3Si0MlLc/4vZ42Z0Z0kAlH408iHAmvdgjkpAkyTaczMJwrbyUmLQeHJYgt7Z4V+O55
	t4PkHV66UTWD7e1iMcXcE4Oudvw3AAHPNR7KvlDHNcpHnX6m93HhtkhdZUteUH732vW/UrG1wiM
	L/qGaF4/Ttnd7ezfTrns7vV7NkmRTjdLsmYpfz/8Y59MXP98XPMGlsp/kkgOB3RM5/GTlOvD3/Z
	m80ha2zM7DXHNwoQ+M9wYndjMfNznU6aDUtRPS4Fo3n8KpBuEXDaZPQNaVEPJV+cPPq1chO+r1P
	7/ZdjTfsjfZGwRE5u65e1GiSzIgFaq8WhOA==
X-Received: by 2002:a05:600c:b86:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4bb55a61183mr111782675e9.6.1794653094230;
        Sat, 14 Nov 2026 02:44:54 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:44:53 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v20 10/15] net: Document PCS subsystem
Date: Sat, 14 Nov 2026 11:43:49 +0100
Message-ID: <20261114104426.235620-11-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114104426.235620-1-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>
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

Add extensive documentation of the new PCS subsystem and the fwnode
implementation with producer/consumer API.

Also update the sfp-phylink migration guide.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 Documentation/networking/index.rst       |   1 +
 Documentation/networking/pcs.rst         | 231 +++++++++++++++++++++++
 Documentation/networking/sfp-phylink.rst |  35 ++--
 3 files changed, 243 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/networking/pcs.rst

diff --git a/Documentation/networking/index.rst b/Documentation/networking/index.rst
index 44a422ad3b05..3fce8f6ac089 100644
--- a/Documentation/networking/index.rst
+++ b/Documentation/networking/index.rst
@@ -28,6 +28,7 @@ Contents:
    net_failover
    page_pool
    phy
+   pcs
    sfp-phylink
    alias
    bridge
diff --git a/Documentation/networking/pcs.rst b/Documentation/networking/pcs.rst
new file mode 100644
index 000000000000..71d1283a72cd
--- /dev/null
+++ b/Documentation/networking/pcs.rst
@@ -0,0 +1,231 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=============
+PCS Subsystem
+=============
+
+The PCS (Physical Coding Sublayer) subsystem handles the registration and lookup
+of PCS devices. These devices contain the upper sublayers of the Ethernet
+physical layer, generally handling framing, scrambling, and encoding tasks. PCS
+devices may also include PMA (Physical Medium Attachment) components. PCS
+devices transfer data between the Link-layer MAC device, and the rest of the
+physical layer, typically via a serdes. The output of the serdes may be
+connected more-or-less directly to the medium when using fiber-optic or
+backplane connections (1000BASE-SX, 1000BASE-KX, etc). It may also communicate
+with a separate PHY (such as over SGMII) which handles the connection to the
+medium (such as 1000BASE-T).
+
+Remark on usage of .mac_select_pcs and fw_node PCS
+--------------------------------------------------
+
+There are generally two ways to look up a PCS device.
+
+1. MAC OP struct .mac_select_pcs (considered deprecated)
+2. Internal PCS handling with ``num_possible_pcs`` and ``fill_available_pcs``
+
+Implementation 1 leaves the entire handling of the PCS to the MAC
+driver with the selection of the PCS driven by .mac_select_pcs.
+Custom implementations are required if the PCS is external to the MAC
+and needs to be handled by a separate driver.
+
+Implementation 2 makes the phylink core code to select the PCS
+provided by ``num_possible_pcs`` and ``fill_available_pcs`` either
+via internal MAC handling or firmware node (fwnode)
+
+Implementation 1 is considered deprecated and it's suggested to
+switch to implementation 2 and where possible switch to firmware
+node design.
+
+.. _pcs_fwnode:
+
+Looking up PCS Devices (fwnode implementation)
+-----------------------------------------------
+
+The lookup of a PCS device follows the common producer/consumer implementation
+used by similar subsystems with a ``#pcs-cells`` on the producer and a
+``pcs-handle`` property on the consumer::
+
+    pcs: pcs {
+        // ...
+        #pcs-cells = <0>;
+    };
+
+    ethernet-controller {
+        // ...
+        pcs-handle = <&pcs>;
+    };
+
+On :c:func:`phylink_create`, phylink will use the ``num_possible_pcs``
+value and ``fill_available_pcs`` helper function in
+:c:struct:`phylink_config` to compose the list of available PCS that can be
+used for the phylink instance.
+
+Phylink will then internally handle the selection of the correct PCS for
+the requested interface mode based on the interface modes configured in
+``pcs_interfaces`` in :c:struct:`phylink_config` struct and
+``supported_interfaces`` in :c:struct:`phylink_pcs` struct.
+
+A PCS is considered eligible when the requested interface mode is present
+in both ``pcs_interfaces`` in :c:struct:`phylink_config` struct and
+``supported_interfaces`` in :c:struct:`phylink_pcs` struct.
+
+``supported_interfaces`` describes all interface modes supported by the MAC,
+whereas ``pcs_interfaces`` identifies the subset that require PCS selection.
+
+For the special implementation where the PCS is internal or part of the MAC
+and a dedicated driver is not needed, it's possible to leave the implementation
+of the PCS to the MAC driver and just implement the ``num_possible_pcs``
+value and ``fill_available_pcs`` helper  function in
+:c:struct:`phylink_config` referencing the local :c:struct:`phylink_pcs`
+struct allocated from the MAC driver.
+
+.. _pcs_consumer:
+
+Using PCS Devices
+-----------------
+
+It's mandatory to either implement the ``mac_select_pcs`` callback
+of :c:struct:`phylink_mac_ops` or ``num_possible_pcs`` and ``fill_available_pcs``
+of :c:struct:`phylink_config` to use a PCS for a MAC.
+
+The fwnode implementation exposes simple helpers to parse the PCS from
+the fwnode :c:func:`fwnode_phylink_pcs_count` and
+:c:func:`fwnode_phylink_pcs_parse`. The :c:func:`fwnode_phylink_pcs_count` helper
+takes the fwnode where the ``pcs-handle`` should be parsed and return the
+number of PCS entries described in the fwnode.
+The :c:func:`fwnode_phylink_pcs_parse` helper takes three arguments,
+the fwnode where the ``pcs-handle`` should be parsed, an allocated array
+of :c:struct:`phylink_pcs` pointer where to put the parsed PCS from the fwnode
+and the maximum number of PCS to parse.
+Contrary to :c:func:`fwnode_phylink_pcs_count`, :c:func:`fwnode_phylink_pcs_parse`
+helper fills the allocated array with ONLY the available PCS and return the
+number of available PCS found. PCS that returns -ENODEV will be skipped and
+won't be inserted in the allocated array.
+
+A phylink instance may use multiple PCS devices. The maximum number is reported
+through ``num_possible_pcs``.
+
+It's mandatory to specify for what interface a PCS is needed. This can be done
+by filling the ``pcs_interfaces`` in :c:struct:`phylink_config` struct.
+If the requested interface mode is not present in this bitmask, phylink does
+not search for a PCS for  that specific mode. (example MAC doesn't need a PCS
+for SGMII but require one for USXGMII)
+
+With the use of the :c:func:`fwnode_phylink_pcs_parse` a common implementation
+is the following::
+
+   static int mac_fill_available_pcs(struct phylink_config *config,
+   				                      struct phylink_pcs **available_pcs,
+					                      unsigned int num_possible_pcs)
+   {
+   	struct device *dev = config->dev;
+
+   	return fwnode_phylink_pcs_parse(dev_fwnode(dev), available_pcs,
+						                    num_possible_pcs);
+   }
+
+   static int mac_setup_phylink(struct net_device *netdev)
+   {
+      struct phylink_config *config;
+
+      // ...
+
+      config->dev = &netdev->dev;
+
+      // ...
+
+      // Parse possible PCS and fill num_possible_pcs.
+      config->num_possible_pcs = fwnode_phylink_pcs_count(dev_fwnode(&netdev->dev));
+      config->fill_available_pcs = mac_fill_available_pcs;
+
+      __set_bit(PHY_INTERFACE_MODE_INTERNAL, config->supported_interfaces);
+      __set_bit(PHY_INTERFACE_MODE_SGMII, config->supported_interfaces);
+      __set_bit(PHY_INTERFACE_MODE_1000BASEX, config->supported_interfaces);
+      __set_bit(PHY_INTERFACE_MODE_USXGMII, config->supported_interfaces);
+
+      // PCS required only for USXGMII
+      __set_bit(PHY_INTERFACE_MODE_USXGMII, config->pcs_interfaces);
+
+      phylink = phylink_create(config, //...
+
+It's worth to mention that it's phylink code that takes care of allocating
+the array of :c:struct:`phylink_pcs` pointer for ``fill_available_pcs``
+callback based on the value set in ``num_possible_pcs`` for
+:c:struct:`phylink_config` struct.
+
+The ``fill_available_pcs`` callback must not write more than
+``num_possible_pcs`` entries. The third argument may be used to validate
+that there is enough space to fill all the available PCS in the passed array
+of :c:struct:`phylink_pcs` pointer.
+
+The ``fill_available_pcs`` callback is called only on :c:func:`phylink_create`
+and is used only to compose the initial available PCS list. Ownership of PCS
+is held by phylink.
+
+.. _pcs_producer:
+
+Writing PCS Drivers
+-------------------
+
+To write a PCS driver, first implement :c:struct:`phylink_pcs_ops`. Then,
+register your PCS in your probe function using :c:func:`fwnode_pcs_add_provider`.
+The :c:func:`fwnode_pcs_add_provider` takes three arguments, the fwnode where
+the PCS provider should be registered to, a xlate function to return the requested
+PCS based on ``#pcs-cells`` and a pointer to reference private data for the xlate
+function.
+
+The PCS will then be registered to a global list of PCS provider that the
+PCS fwnode implementation will use to parse it.
+
+For the simple case where the PCS driver expose a single PCS,
+:c:func:`fwnode_pcs_simple_xlate` can be used as the xlate function.
+
+You must call :c:func:`fwnode_pcs_del_provider` from your remove function
+on driver detach.
+
+A devm variant, :c:func:`devm_fwnode_pcs_add_provider`, is available to
+automatically release the PCS provider on driver detach.
+
+It's worth to mention that xlate function MUST reference already allocated
+:c:struct:`phylink_pcs` pointer and MUST NOT dynamically allocate new PCS.
+The returned pointer is used to identify the PCS across provider lookup and
+removal notifications.
+
+Late PCS registration handling
+------------------------------
+
+It's possible that a PCS becomes available after the MAC finished probing.
+Contrary to the usual producer/consumer implementation, when a PCS is not
+registered and can't be found, the fwnode parser helper returns ``-ENODEV``
+instead of ``-EPROBE_DEFER``.
+
+This is to prevent race condition with particular devices that register
+MAC and PCS with USB or PCIe and require the MAC to be registered before
+the PCS.
+
+The phylink logic correctly handle this special case and keep the phylink
+instance in a fail condition.
+
+The PCS fwnode implementation provides a notifier to which each phylink
+instance with a non-empty ``pcs_interfaces`` in :c:type:`phylink_config`
+registers. When a new PCS provider is registered, the notifier is called
+triggering the :c:func:`pcs_provider_notify` function.
+
+Function :c:func:`pcs_provider_notify` will check if the just added PCS
+should be used by the phylink instance. If it should be used then,
+it's added to the internal list of available PCS and a phylink major
+config is forced.
+
+If a phylink instance was in a failure state, with the just added PCS
+now part of the available PCS internal phylink list, provided all other
+conditions are satisfied, the configuration is retried and the failure
+condition is cleared.
+
+API Reference
+-------------
+
+.. kernel-doc:: include/linux/pcs/pcs.h
+   :internal:
+
+.. kernel-doc:: include/linux/pcs/pcs-provider.h
+   :internal:
diff --git a/Documentation/networking/sfp-phylink.rst b/Documentation/networking/sfp-phylink.rst
index 5bf285d73e8a..306505118eba 100644
--- a/Documentation/networking/sfp-phylink.rst
+++ b/Documentation/networking/sfp-phylink.rst
@@ -311,33 +311,20 @@ this documentation.
 
         priv->pcs = lynx_pcs_create_mdiodev(bus, 0);
 
-    Some PCS can be recovered based on firmware information:
+    PCS that should be recovered based on firmware information should implement
+    the external PCS as a :ref:`PCS provider <pcs_producer>` and reference it
+    with the use of PCS fwnode helper :ref:`PCS fwnode helper <pcs_fwnode>`.
 
-    .. code-block:: c
-
-        priv->pcs = lynx_pcs_create_fwnode(of_fwnode_handle(node));
-
-12. Populate the :c:func:`mac_select_pcs` callback and add it to your
-    :c:type:`struct phylink_mac_ops <phylink_mac_ops>` set of ops. This function
-    must return a pointer to the relevant :c:type:`struct phylink_pcs <phylink_pcs>`
-    that will be used for the requested link configuration:
-
-    .. code-block:: c
-
-        static struct phylink_pcs *foo_select_pcs(struct phylink_config *config,
-                                                  phy_interface_t interface)
-        {
-                struct foo_priv *priv = container_of(config, struct foo_priv,
-                                                     phylink_config);
-
-                if ( /* 'interface' needs a PCS to function */ )
-                        return priv->pcs;
+12. Populate the :c:var:`num_possible_pcs` value and
+    :c:func:`fill_available_pcs` callback and add it to your
+    :c:type:`struct phylink_config <phylink_config>`.
 
-                return NULL;
-        }
+    Refer to :ref:`Documentation/networking/pcs.rst <pcs_consumer>` for
+    further details and examples.
 
-    See :c:func:`mvpp2_select_pcs` for an example of a driver that has multiple
-    internal PCS.
+    Notice that the previous implementation of populating
+    :c:func:`mac_select_pcs` is considered deprecated in favor of the new
+    described above.
 
 13. Fill-in all the :c:type:`phy_interface_t <phy_interface_t>` (i.e. all MAC to
     PHY link modes) that your MAC can output. The following example shows a
-- 
2.55.0

