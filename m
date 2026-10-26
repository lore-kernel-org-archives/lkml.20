Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793034744;
	b=akE24SWVeaUErENsdfP2yyEH+VoOTfFUwHhZauspx4xE3Sh3ou8vUfLk0vz+nGZYXcxD
	 ixBNpcjPsqGrV3PCY/bQVM74VnYKuNjfGxAM1q29yUsTC1R2rOrorGY1dV/3pxTFIQ1pc
	 gl1qGqD3DWNq0zNMjx6Q+qaIP30MIBK5W0ytERif6CmWbNQRbDHtheyC2ekQX8RqdlNz0
	 Sj76HKfoTkXyno8CzXeQeZ/LhRxnz0uPwRWF9ccF4wzyeHBPvL62AjayY9pGC5CcAtNTn
	 vI89F7yI7oLYa1G7D47OapDJlyiTZs2YoRXCmoY06dina0Lo5VM3Xb7QNlOF/h2k7Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793034744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=b6QlKpdKBnOA1PZgABGSyhkzkddPIRKkAKkI08GA01o=;
	b=ScKfrqPaWUh6c2kWW6YoxOQluzCHKPG+aPcFzPR+fnKCq6ZM1U4PBTAsrZ0siWrv3r+T
	 rzCjU4lbU2ZsXbsvOoZTSiJZmg2w5DRVCRBsCBZVCs7lZOmJWILiFPvHN+U4W7njT6jA0
	 iUnC5k+9+5uBGydZhFElOaXYM/icjNPkVj2tYrp4B0FCJohumCUtMise02lx1Gz6pHLp5
	 bc9Hkv0x6idr+FM+n1hB8ZUF8fiX2nLBwmk+lr6YRdLviCShzG+drDPulHI8d4W9t36gC
	 VNPgM0VMGDceFEl+BdgQrIHxQ/FgQzHOTGfyVeMAMEhomEXXFTeydyTuvrudwi30lOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qUreiEnW;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EF8606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:12:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01EF8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qUreiEnW
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35c76e9614aso5204231eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793034742; x=1793639542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b6QlKpdKBnOA1PZgABGSyhkzkddPIRKkAKkI08GA01o=;
        b=qUreiEnW3h0QVdWTZGDUoNLLWrKTkTXRSfFaPfpqpznoSZGJz2itSE0XQa2Cq1ckbH
         zbjUd3tvxT0LyGqX/J5hW9aNOPlccb+aw1XOawgcWIqPmFUJhtO9XaGJ1UldmdVpPyGu
         o90CaGoqMomlJAsVJks60vRdEvrCpucNX0ru+nkcnJmjW3+N2GOpteIAB7oNLtfcPsaL
         grO9HrZ96bMSvLXh62RRnaczwVUzLXZNFivP0YV0rWrXxePZ3Cyss39U3ezuGtrCXnI9
         cb9yCaxZgTylWitHb87JGUztOgski5N15eEFgyWKTd6f1BYQoSa5TyQOgIAU72O5CxLA
         aKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793034742; x=1793639542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b6QlKpdKBnOA1PZgABGSyhkzkddPIRKkAKkI08GA01o=;
        b=AeNmB9p2dlxiQ2asLu+Cg5r5B2kyqVfjUHu6srWVxF2m8DKDrU8Z6UsGs3acnmmY5h
         4u+GVIXPfjvxvM45460u2TOntWJX+hnu44NrjyVgheoYzCA4d/l7+24vta6M/6fBrkSs
         ZqbFkfKJTqZTzNbJ0oUjJu66rhLZyirtjRI2Z2rkBKQLNblx7ArmiYE7aTzrGjftxJpC
         LTyObpbbGyiXCi5M2WZ34Oy3hjqxYB65Xw9sqKZckkDuiKEY9X66H9hly3I8y80Ed0tq
         CpPP8YRsQBfzOGIevjAS6JCttlfpvgwIbrPuWaOp7uPgz1xcCbaTIc8CVROtmPqDenzr
         8Abg==
X-Forwarded-Encrypted: i=1; AKwUvBxN+15DdA7HAdb12qfQ672gVubAy7ahbOCW7vKEq+rUhV4UtxMXB1DBLC0g2pOUJgmBOcBiUzSeVTbPWWM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKbD6f+6eCHqQKukiij1YQ6ah9CIzJLNvn1pRPipQ0gf2f12ik
	7fqvhckStF0uaQd+SL9p6WiD1+hINTr7u+JWiWRQFC/2f+cdDbNvxhdg
X-Gm-Gg: AYBFou0ilwRiHDo0zfOnSw8s2lrk4D9x3C1gdc84yRwww2dxHQQIj64VLWDRoD/nCxN
	eciOA1aJ3F7nRQEJx8S5g/bogH+hBWn7IX7minIFqR/fS8T3VJiw0MGkF7pnynjsHRc6MBx+S7H
	aNoeaY9BiuJgxeneWUBSRVUb7pZQ4g1KGL/ejMvxUE8Qlfgj8wzkfXc4xOusYUmudXD0A9LDLga
	ruAVx+0P9mpINNhsVDjOh9q2595H3tVxvbA9SshsewEjzbHg3WLGEtk++4yP95JxqGSHnwh6xsU
	eSEyaLes17WEq7Jk6cUy8xSbS5gWMpPikw+hkho9Gj0bs1O+24QcCAFkMkjhJuUFoqv6SCZ/WvX
	fMj59Zk9Ez7C8cZaiezbKRfb3xSVXTL2coHZkDysbNQErmn3XZsPCgiGiwiwyy3ltdiO13hG/Mm
	nt9rhs/BxMD8/AMAlNZ7Xt4sNpocdgVcHrsNg3VKIJrWqmsyKk5QioSrmnlRzpSGd/oYE/tSNRS
	JBPAnhGJ/WalNN1Fp4zyMQHiBqXkL6apuWYvUBzqjaQOgt97B5LgvYzMYfD6+Z77MoXMbgSDEES
	oyUFMQ==
X-Received: by 2002:a05:7300:8816:b0:369:e930:6bc4 with SMTP id 5a478bee46e88-369e9306c7emr9453497eec.30.1793034742388;
        Mon, 26 Oct 2026 10:12:22 -0700 (PDT)
Received: from eldorado (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f27d5bf8sm24878750eec.4.2026.10.26.10.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 10:12:21 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v2 1/2] net: dsa: mv88e6xxx: fix 6351 family statistics snapshot
Date: Mon, 26 Oct 2026 09:47:32 -0700
Message-ID: <20261026164733.737299-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026164733.737299-1-f.fainelli@gmail.com>
References: <20261026164733.737299-1-f.fainelli@gmail.com>
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

The 88E6171, 88E6175, 88E6350 and 88E6351 take the port number in the
low bits of the statistics operation register. The 6320 snapshot helper
instead encodes the port as (port + 1) << 5. On an EA4500 with an
88E6171, this causes ethtool -S to return physical port 0's MIB counters
for every user port. Traffic on other ports does not update their
reported hardware counters.

Before the snapshot operation was moved into the chip operations, only
the 6320 and 6352 families used the shifted encoding. The refactoring
incorrectly assigned that encoding to all four 6351 family chips.

Use the unshifted snapshot helper for the entire 6351 family. This
matches the Marvell DSDT statsCapture() implementation, which uses the
raw port number for chips outside DEV_RMON_PORT_BITS, including these
four chips.

The original 88E6171 change was tested on an EA4500: pings through
different switch ports updated only the corresponding port's hardware
counters. The other three chips have not been hardware tested.

Fixes: a605a0fe7115 ("net: dsa: mv88e6xxx: Abstract stats_snapshot into ops structure")
Link: https://lore.kernel.org/all/404d5f2d-24a5-4edc-897b-b1b3c54a20e1@lunn.ch/
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/dsa/mv88e6xxx/chip.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/mv88e6xxx/chip.c b/drivers/net/dsa/mv88e6xxx/chip.c
index 7f68a0c55802..675b82857754 100644
--- a/drivers/net/dsa/mv88e6xxx/chip.c
+++ b/drivers/net/dsa/mv88e6xxx/chip.c
@@ -4610,7 +4610,7 @@ static const struct mv88e6xxx_ops mv88e6171_ops = {
 	.port_disable_pri_override = mv88e6xxx_port_disable_pri_override,
 	.port_get_cmode = mv88e6352_port_get_cmode,
 	.port_setup_message_port = mv88e6xxx_setup_message_port,
-	.stats_snapshot = mv88e6320_g1_stats_snapshot,
+	.stats_snapshot = mv88e6xxx_g1_stats_snapshot,
 	.stats_set_histogram = mv88e6095_g1_stats_set_histogram,
 	.stats_get_sset_count = mv88e6095_stats_get_sset_count,
 	.stats_get_strings = mv88e6095_stats_get_strings,
@@ -4714,7 +4714,7 @@ static const struct mv88e6xxx_ops mv88e6175_ops = {
 	.port_disable_pri_override = mv88e6xxx_port_disable_pri_override,
 	.port_get_cmode = mv88e6352_port_get_cmode,
 	.port_setup_message_port = mv88e6xxx_setup_message_port,
-	.stats_snapshot = mv88e6320_g1_stats_snapshot,
+	.stats_snapshot = mv88e6xxx_g1_stats_snapshot,
 	.stats_set_histogram = mv88e6095_g1_stats_set_histogram,
 	.stats_get_sset_count = mv88e6095_stats_get_sset_count,
 	.stats_get_strings = mv88e6095_stats_get_strings,
@@ -5380,7 +5380,7 @@ static const struct mv88e6xxx_ops mv88e6350_ops = {
 	.port_disable_pri_override = mv88e6xxx_port_disable_pri_override,
 	.port_get_cmode = mv88e6352_port_get_cmode,
 	.port_setup_message_port = mv88e6xxx_setup_message_port,
-	.stats_snapshot = mv88e6320_g1_stats_snapshot,
+	.stats_snapshot = mv88e6xxx_g1_stats_snapshot,
 	.stats_set_histogram = mv88e6095_g1_stats_set_histogram,
 	.stats_get_sset_count = mv88e6095_stats_get_sset_count,
 	.stats_get_strings = mv88e6095_stats_get_strings,
@@ -5426,7 +5426,7 @@ static const struct mv88e6xxx_ops mv88e6351_ops = {
 	.port_disable_pri_override = mv88e6xxx_port_disable_pri_override,
 	.port_get_cmode = mv88e6352_port_get_cmode,
 	.port_setup_message_port = mv88e6xxx_setup_message_port,
-	.stats_snapshot = mv88e6320_g1_stats_snapshot,
+	.stats_snapshot = mv88e6xxx_g1_stats_snapshot,
 	.stats_set_histogram = mv88e6095_g1_stats_set_histogram,
 	.stats_get_sset_count = mv88e6095_stats_get_sset_count,
 	.stats_get_strings = mv88e6095_stats_get_strings,
-- 
2.53.0

