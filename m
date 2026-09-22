Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059D85226B8
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790111718; cv=none; b=bpEGi2p3BEZJQbl8h7lPGUuhRrLETr6dgmiR9UbaDlroE2Nd9wpN9vZoSwuemC0AvJIXO+G83xu7J3QJ/T774GrXYKjgZhm8HpbmTWaLo6X3r7akK9NauKfRom/DwJtbkUfkcIKBoN8vjXSQjlux7HbeVWPj5SSvrv+xEyMoLqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790111718; c=relaxed/simple;
	bh=Lw8Yb7xVAhpvlEPLm9wgPbWJkXwWjEC8r3YDgzZq79k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eDTylqQz0/oercMU+yIJCjzvT9PN/CaPFqYekgfUi8280Rfh3AQqeMH83q1+TnMs9087iYw5K0M4wuIPm3CUILXFF37noHE178RNnUbFs15BJLMOiRzlWjEZTLpMJA0aNi2yyWm3uWapDI36vpxvjt/9YqKPve4/kywAFcQGORU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l7QNS3qF; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7QNS3qF"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso1470505e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790111699; x=1790716499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f1EGyKqJGOqV+4gQSvb2+qMerdBN610hrMl24gBiU1U=;
        b=l7QNS3qFVAfv5tDtjmoVb24sAtX3dcWMEso9HiTWJN72YXRdFdZCsDLL+GT5hRUI/g
         Hfa33uzxNB3SO71Y3GoHCYShYIAKPK/k2teOpC3+Om+9s1Q0AYO3njMMzM7buXF+WpMh
         V3oGInOqYOvHCSNGv3A/QKmzp3mWGyytNElvD6yTTe2IHLO2kJYKwFOddvBqN8bpDqUP
         5JbzoqocqKY4dkZdJpJ9gbEFPH47aHn68rGNoIUJJCuDQAXtdb4HhiC+YQfCjRI5CB5Q
         yVg+d1uuzKyrdb04CNLQpnjzcQgDWFN8pS944cUNg9vtLhhmBwXJDmXV3h3Ha4H6pXW0
         k3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790111699; x=1790716499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f1EGyKqJGOqV+4gQSvb2+qMerdBN610hrMl24gBiU1U=;
        b=E46l06VPb9hIzIrVxRWRovKawlu7Y8t9xJZIacE4K0cyVuBlQbHiTQZrjqdt5RSoe+
         Wtz/aScA1w3jxrlCV4D3AhfLQ11bqznf+WdSGIXC5gjQ0PgEh6p/46AYx1+YaYztHKXr
         Pf9kTbSEVgkyfIBHDiVykdt5WtOBPYTRbofp7zfdhvH/XNdySKRjlX9Izk+doOqlV2bA
         VZHCS80qTPz8GfkWg3m0UtODx/Lz1imhHVz4WDGULeDf5Xdxe0cLqeGyUvEZo9YUkapk
         9HvBh6zjTgq/Kic9R8oZ6x3/70p9FcaSM776XE1RM6Pv4cDm7un4N83wpZR//85ceNbB
         Yc8g==
X-Forwarded-Encrypted: i=1; AKwUvBzyr0UTYdrGTMbjCkXcF437El5PRG0FB47IZBzsksG5qb54dmTJmIEENwJE/nPX7mjvlzo47shAcivjepI=@vger.kernel.org
X-Gm-Message-State: AFuF++mceJzaWOVI0xAx5C5+oCBBL3PYzR8c0Flxv0d3TB4K+EQs9E3t
	pSLm84yTdK/SB4PD4rrfSEE3KMcnRD5osJvFZPrIzgeTgvq8Xz/B7DIM7EoZ9nW3IFY=
X-Gm-Gg: AYBFou2TXhNGT+Bc8dECUHVBvVPlazT5sQHDS9JSGdLN4r1Gf0KSFRX3jUUkhEfsa4U
	leQl+02H77vtKovCX+rMGtp8bArfUUAHF+Re6AV3d+BhQCl4l0kNoUWiXeVgSqVxoDlIlY+FlGa
	HR5xoywWedugZ1GZoKiBqm10ckoLIpDx13EeyG4eJB8S0+AQFdbAbaeX+YGEA3sPEaMgMyr6p4P
	YukqsfbZiPJjWJz8uaSw9VKZ4g4okRRT2kqm9f7N13AWUmERpoUo9RfC/k8I0KWFrW5rA+FzK0b
	SRyIFYm5wYB4sIJPBy1nU8LztnooUKtHf03Elckall8ncbPn0pMY6wc+52eFkTtTw8+0js6QMHt
	AbYzdW+2PCzrKKk1GHgyWbLicjJnOn5pI1yugLGWCisHn/vSbu3N8XDlgvn6UWiUsWZnNW/xTob
	MUi0nZUjFJKkHY8TJfh0Ec4QXPJ+RjegQdnPPsYkeOST853tlW3u171FnLlMqs5k6LqwbbPgfu+
	rjWLcc3z+lXXHOoUKU=
X-Received: by 2002:a05:600c:c492:b0:499:7a15:fcec with SMTP id 5b1f17b1804b1-49fdf103f38mr5120925e9.13.1790111698725;
        Tue, 22 Sep 2026 14:14:58 -0700 (PDT)
Received: from christian-ThinkPad-T470.. ([2a03:4460:170d:5700:7168:5af1:a975:cf85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488682673bdsm1221672f8f.2.2026.09.22.14.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 14:14:58 -0700 (PDT)
From: Christian Melendez <chrismelnu@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christian Melendez <chrismelnu@gmail.com>
Subject: [PATCH 1/2] Documentation: dsa: b53: fix stale tagging-support section
Date: Tue, 22 Sep 2026 23:14:38 +0200
Message-Id: <20260922211439.369917-1-chrismelnu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAOiHx==_ixY-VNWX=XxqCFoJvE-80i+r2y6SNnxwQe9uZQJL6w@mail.gmail.com>
References: <CAOiHx==_ixY-VNWX=XxqCFoJvE-80i+r2y6SNnxwQe9uZQJL6w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

5325/5365 were listed under "Configuration without tagging support".
b53_get_tag_protocol() assigns them DSA_TAG_PROTO_BRCM_LEGACY_FCS
(commit c3cf059a4d41), implemented in net/dsa/tag_brcm.c. Move them to
the tagging-supported section.

539x/531x5, the only chips left in that section, get no special case
in b53_get_tag_protocol() either. The section and its config examples
no longer apply to any b53 switch, so remove them.

Link: https://patch.msgid.link/CAOiHx==_ixY-VNWX=XxqCFoJvE-80i+r2y6SNnxwQe9uZQJL6w@mail.gmail.com
Signed-off-by: Christian Melendez <chrismelnu@gmail.com>
---
 Documentation/networking/dsa/b53.rst | 151 +--------------------------
 1 file changed, 3 insertions(+), 148 deletions(-)

diff --git a/Documentation/networking/dsa/b53.rst b/Documentation/networking/dsa/b53.rst
index 1cb3ff648f88..b67864b2d314 100644
--- a/Documentation/networking/dsa/b53.rst
+++ b/Documentation/networking/dsa/b53.rst
@@ -23,9 +23,6 @@ CPU interface, conversely, the CPU network interface should insert a similar
 tag for packets entering the CPU port. The tag format is described in
 ``net/dsa/tag_brcm.c``.
 
-The configuration of the device depends on whether or not tagging is
-supported.
-
 The interface names and example network configuration are used according the
 configuration described in the :ref:`dsa-config-showcases`.
 
@@ -35,149 +32,7 @@ Configuration with tagging support
 The tagging based configuration is desired. It is not specific to the b53
 DSA driver and will work like all DSA drivers which supports tagging.
 
-See :ref:`dsa-tagged-configuration`.
-
-Configuration without tagging support
--------------------------------------
-
-Older models (5325, 5365) support a different tag format that is not supported
-yet. 539x and 531x5 require managed mode and some special handling, which is
-also not yet supported. The tagging support is disabled in these cases and the
-switch need a different configuration.
-
-The configuration slightly differ from the :ref:`dsa-vlan-configuration`.
-
-The b53 tags the CPU port in all VLANs, since otherwise any PVID untagged
-VLAN programming would basically change the CPU port's default PVID and make
-it untagged, undesirable.
-
-In difference to the configuration described in :ref:`dsa-vlan-configuration`
-the default VLAN 1 has to be removed from the user interface configuration in
-single port and gateway configuration, while there is no need to add an extra
-VLAN configuration in the bridge showcase.
-
-single port
-~~~~~~~~~~~
-The configuration can only be set up via VLAN tagging and bridge setup.
-By default packages are tagged with vid 1:
-
-.. code-block:: sh
-
-  # tag traffic on CPU port
-  ip link add link eth0 name eth0.1 type vlan id 1
-  ip link add link eth0 name eth0.2 type vlan id 2
-  ip link add link eth0 name eth0.3 type vlan id 3
-
-  # The conduit interface needs to be brought up before the user ports.
-  ip link set eth0 up
-  ip link set eth0.1 up
-  ip link set eth0.2 up
-  ip link set eth0.3 up
-
-  # bring up the user interfaces
-  ip link set wan up
-  ip link set lan1 up
-  ip link set lan2 up
-
-  # create bridge
-  ip link add name br0 type bridge
-
-  # activate VLAN filtering
-  ip link set dev br0 type bridge vlan_filtering 1
-
-  # add ports to bridges
-  ip link set dev wan master br0
-  ip link set dev lan1 master br0
-  ip link set dev lan2 master br0
-
-  # tag traffic on ports
-  bridge vlan add dev lan1 vid 2 pvid untagged
-  bridge vlan del dev lan1 vid 1
-  bridge vlan add dev lan2 vid 3 pvid untagged
-  bridge vlan del dev lan2 vid 1
-
-  # configure the VLANs
-  ip addr add 192.0.2.1/30 dev eth0.1
-  ip addr add 192.0.2.5/30 dev eth0.2
-  ip addr add 192.0.2.9/30 dev eth0.3
-
-  # bring up the bridge devices
-  ip link set br0 up
-
-
-bridge
-~~~~~~
+Older models (5325, 5365) use a different, legacy tag format, but tagging
+is supported.
 
-.. code-block:: sh
-
-  # tag traffic on CPU port
-  ip link add link eth0 name eth0.1 type vlan id 1
-
-  # The conduit interface needs to be brought up before the user ports.
-  ip link set eth0 up
-  ip link set eth0.1 up
-
-  # bring up the user interfaces
-  ip link set wan up
-  ip link set lan1 up
-  ip link set lan2 up
-
-  # create bridge
-  ip link add name br0 type bridge
-
-  # activate VLAN filtering
-  ip link set dev br0 type bridge vlan_filtering 1
-
-  # add ports to bridge
-  ip link set dev wan master br0
-  ip link set dev lan1 master br0
-  ip link set dev lan2 master br0
-  ip link set eth0.1 master br0
-
-  # configure the bridge
-  ip addr add 192.0.2.129/25 dev br0
-
-  # bring up the bridge
-  ip link set dev br0 up
-
-gateway
-~~~~~~~
-
-.. code-block:: sh
-
-  # tag traffic on CPU port
-  ip link add link eth0 name eth0.1 type vlan id 1
-  ip link add link eth0 name eth0.2 type vlan id 2
-
-  # The conduit interface needs to be brought up before the user ports.
-  ip link set eth0 up
-  ip link set eth0.1 up
-  ip link set eth0.2 up
-
-  # bring up the user interfaces
-  ip link set wan up
-  ip link set lan1 up
-  ip link set lan2 up
-
-  # create bridge
-  ip link add name br0 type bridge
-
-  # activate VLAN filtering
-  ip link set dev br0 type bridge vlan_filtering 1
-
-  # add ports to bridges
-  ip link set dev wan master br0
-  ip link set eth0.1 master br0
-  ip link set dev lan1 master br0
-  ip link set dev lan2 master br0
-
-  # tag traffic on ports
-  bridge vlan add dev wan vid 2 pvid untagged
-  bridge vlan del dev wan vid 1
-
-  # configure the VLANs
-  ip addr add 192.0.2.1/30 dev eth0.2
-  ip addr add 192.0.2.129/25 dev br0
-
-  # bring up the bridge devices
-  ip link set br0 up
+See :ref:`dsa-tagged-configuration`.
-- 
2.34.1

