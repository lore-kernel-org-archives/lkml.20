Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.77.101.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794766399;
	b=hZozDNYqGI4Fz0HCRmZnypMY8GxU2lbUse/Q4JVDukb2KfDoDDlvZflnk8silnDGyQVu
	 N0JebckXGyyijmgP3Tyj31dgxb211YJvwPx0Nf89rmrQw/Qtk1cGFvGYWv86GrNGfCgAt
	 v6pfIwUIplG7vRVKFqo3KsOjKRaZXwpFCh/kFhmnMHTzgCsO/OiKZ3Qv6QvxZzH5zEbD3
	 KYZchxJI9AKhrJUipEW7sE53jKSCjBR5Arix0bz0FYV6jAPBlGy/g22A1EN0IUmi2D9nC
	 RORgGd7YbkZTD22JTYw8e3vWE0/P5NbOtTkf2/8qPiDYHHV8Z3erx4/wqOx7/SauKKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794766399;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-WP-DKIM-Status:X-WP-MailID:X-WP-AV:X-WP-SPAM;
	bh=kK2frOMgBCKtDzXe5QocnQYkVRKVN6JDEORW9JLOVVA=;
	b=p7RVzm6073JcDOp5Y4xs8x43QDvyy4vFPYHsY9DABucfXO3UnZIdRosPQkNIwUbV4DgO
	 yStkoXqBy8FXd316IqDHgDlz/eUXiUbYP3cE1uLp77XFQtNS4+A4x6YA5NJ46NmDEEVsU
	 LBmt7C/pTPjAGbfNN+6HQUgTfplEGu+yVneg2ui55yiLzuboEQe0DibPk3mozstH4lPYG
	 51FXCPV6Uic6EDg0uC1K7EgmPXQC9fwvPJBoxYWSW6XBnbatqqcyUSk6KMH0ebs1YA882
	 vSskOWUpQPBD5CVx9BQ9/ucbqoOrlUB3bbgzpqQyFPsEKUmRsluBpK8TaMgYRYyuMzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wp.pl;
	spf=pass smtp.mailfrom=wp.pl;
	dkim=pass header.d=wp.pl header.i=@wp.pl header.a=rsa-sha256 header.s=s20261001 header.b=oGPo+Y6D;
	arc=none smtp.remote-ip=212.77.101.9
Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED98606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CED98606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wp.pl header.i=@wp.pl header.a=rsa-sha256 header.s=s20261001 header.b=oGPo+Y6D
Received: (wp-smtpd smtp.wp.pl 38243 invoked from network); 15 Nov 2026 19:13:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=s20261001;
          t=1794766389; bh=kK2frOMgBCKtDzXe5QocnQYkVRKVN6JDEORW9JLOVVA=;
          h=From:To:Cc:Subject;
          b=oGPo+Y6DNxFNR97jjN2+35Azxja31mxGMn3I85fKOWiJpvixUQd7x4eGESrAyhX/D
           z7LaB7iNKFOM+04Cn+xmx78FHPQc9uVTYoCzJPysgPYKjMh06PUHsOVwsVmv/spGev
           y3ByK+tJbZD4a0uyX0O/0d2MCPv1H6a5Ka1JsIDkRaiWeahVOG7AYcF8SVm95Rr+Ye
           FZsmAF8DmbKTHKdDu87q6CLdZJzA1qTSMV5PExbIzpDAk5ULwU35QttNP9mpennR0E
           Xy+5wKJvu632gEgJjZ1cEyikKPNB/pFUPhmBv9YB6HA77YwAVhy7NGej4UUyUd61Cf
           SoT7zVImQ94qQ==
Received: from abajkowski.lan (83.24.146.222.ipv4.supernova.orange.pl [83.24.146.222])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <andrew@lunn.ch>; 15 Nov 2026 19:13:09 +0100
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: andrew@lunn.ch,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH net-next] net: dsa: mv88e6xxx: Enable LED control on 88E6171
Date: Sun, 15 Nov 2026 19:12:36 +0100
Message-ID: <20261115181305.2860498-1-olek2@wp.pl>
X-Mailer: git-send-email 2.55.0
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
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: 2f515d80f9e9118dad2db32fa420577f
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000B [wRPk]                               

Enable LED control on the Marvell 88E6171. This switch uses a register
layout similar to the 6352 family, but has 4 LEDs instead of 2. Hardware
triggers are not supported at this moment.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 drivers/net/dsa/mv88e6xxx/chip.c |  10 ++
 drivers/net/dsa/mv88e6xxx/chip.h |  16 ++++
 drivers/net/dsa/mv88e6xxx/leds.c | 155 ++++++++++++++++++++++++++-----
 drivers/net/dsa/mv88e6xxx/port.h |  35 +++++++
 4 files changed, 191 insertions(+), 25 deletions(-)

diff --git a/drivers/net/dsa/mv88e6xxx/chip.c b/drivers/net/dsa/mv88e6xxx/chip.c
index 425fd2d22c28..ac25a6711ac6 100644
--- a/drivers/net/dsa/mv88e6xxx/chip.c
+++ b/drivers/net/dsa/mv88e6xxx/chip.c
@@ -4609,6 +4609,7 @@ static const struct mv88e6xxx_ops mv88e6171_ops = {
 	.port_pause_limit = mv88e6097_port_pause_limit,
 	.port_disable_learn_limit = mv88e6xxx_port_disable_learn_limit,
 	.port_disable_pri_override = mv88e6xxx_port_disable_pri_override,
+	.port_setup_leds = mv88e6xxx_port_setup_leds,
 	.port_get_cmode = mv88e6352_port_get_cmode,
 	.port_setup_message_port = mv88e6xxx_setup_message_port,
 	.stats_snapshot = mv88e6xxx_g1_stats_snapshot,
@@ -6014,6 +6015,7 @@ static const struct mv88e6xxx_info mv88e6xxx_table[] = {
 		.num_macs = 8192,
 		.num_ports = 7,
 		.num_internal_phys = 5,
+		.num_leds = 4,
 		.max_vid = 4095,
 		.max_sid = 63,
 		.port_base_addr = 0x10,
@@ -6040,6 +6042,7 @@ static const struct mv88e6xxx_info mv88e6xxx_table[] = {
 		.num_ports = 7,
 		.num_internal_phys = 5,
 		.num_gpio = 15,
+		.num_leds = 2,
 		.max_vid = 4095,
 		.max_sid = 63,
 		.port_base_addr = 0x10,
@@ -6052,6 +6055,7 @@ static const struct mv88e6xxx_info mv88e6xxx_table[] = {
 		.stats_type = STATS_TYPE_BANK0 | STATS_TYPE_PORT,
 		.atu_move_port_mask = 0xf,
 		.pvt = true,
+		.led_hw_triggers = true,
 		.multi_chip = true,
 		.edsa_support = MV88E6XXX_EDSA_SUPPORTED,
 		.ops = &mv88e6172_ops,
@@ -6091,6 +6095,7 @@ static const struct mv88e6xxx_info mv88e6xxx_table[] = {
 		.num_ports = 7,
 		.num_internal_phys = 5,
 		.num_gpio = 15,
+		.num_leds = 2,
 		.max_vid = 4095,
 		.max_sid = 63,
 		.port_base_addr = 0x10,
@@ -6103,6 +6108,7 @@ static const struct mv88e6xxx_info mv88e6xxx_table[] = {
 		.stats_type = STATS_TYPE_BANK0 | STATS_TYPE_PORT,
 		.atu_move_port_mask = 0xf,
 		.pvt = true,
+		.led_hw_triggers = true,
 		.multi_chip = true,
 		.edsa_support = MV88E6XXX_EDSA_SUPPORTED,
 		.ops = &mv88e6176_ops,
@@ -6291,6 +6297,7 @@ static const struct mv88e6xxx_info mv88e6xxx_table[] = {
 		.num_ports = 7,
 		.num_internal_phys = 5,
 		.num_gpio = 15,
+		.num_leds = 2,
 		.max_vid = 4095,
 		.max_sid = 63,
 		.port_base_addr = 0x10,
@@ -6303,6 +6310,7 @@ static const struct mv88e6xxx_info mv88e6xxx_table[] = {
 		.stats_type = STATS_TYPE_BANK0 | STATS_TYPE_PORT,
 		.atu_move_port_mask = 0xf,
 		.pvt = true,
+		.led_hw_triggers = true,
 		.multi_chip = true,
 		.edsa_support = MV88E6XXX_EDSA_SUPPORTED,
 		.ptp_support = true,
@@ -6500,6 +6508,7 @@ static const struct mv88e6xxx_info mv88e6xxx_table[] = {
 		.num_ports = 7,
 		.num_internal_phys = 5,
 		.num_gpio = 15,
+		.num_leds = 2,
 		.max_vid = 4095,
 		.max_sid = 63,
 		.port_base_addr = 0x10,
@@ -6512,6 +6521,7 @@ static const struct mv88e6xxx_info mv88e6xxx_table[] = {
 		.stats_type = STATS_TYPE_BANK0 | STATS_TYPE_PORT,
 		.atu_move_port_mask = 0xf,
 		.pvt = true,
+		.led_hw_triggers = true,
 		.multi_chip = true,
 		.edsa_support = MV88E6XXX_EDSA_SUPPORTED,
 		.ptp_support = true,
diff --git a/drivers/net/dsa/mv88e6xxx/chip.h b/drivers/net/dsa/mv88e6xxx/chip.h
index e966e7c4cc5d..deb32fe46954 100644
--- a/drivers/net/dsa/mv88e6xxx/chip.h
+++ b/drivers/net/dsa/mv88e6xxx/chip.h
@@ -135,6 +135,7 @@ struct mv88e6xxx_info {
 	unsigned int num_ports;
 	unsigned int num_internal_phys;
 	unsigned int num_gpio;
+	unsigned int num_leds;
 	unsigned int num_tcam_entries;
 	unsigned int max_vid;
 	unsigned int max_sid;
@@ -149,6 +150,9 @@ struct mv88e6xxx_info {
 	int stats_type;
 	bool pvt;
 
+	/* Support hardware LED triggers */
+	bool led_hw_triggers;
+
 	/* Mark certain ports as invalid. This is required for example for the
 	 * MV88E6220 (which is in general a MV88E6250 with 7 ports) but the
 	 * ports 2-4 are not routet to pins.
@@ -301,6 +305,8 @@ struct mv88e6xxx_port {
 	bool fiber;
 	struct led_classdev led0;
 	struct led_classdev led1;
+	struct led_classdev led2;
+	struct led_classdev led3;
 
 	/* MacAuth Bypass control flag */
 	bool mab;
@@ -810,6 +816,11 @@ static inline bool mv88e6xxx_has_pvt(struct mv88e6xxx_chip *chip)
 	return chip->info->pvt;
 }
 
+static inline bool mv88e6xxx_has_led_hw_triggers(struct mv88e6xxx_chip *chip)
+{
+	return chip->info->led_hw_triggers;
+}
+
 static inline bool mv88e6xxx_has_lag(struct mv88e6xxx_chip *chip)
 {
 	return !!chip->info->global2_addr;
@@ -855,6 +866,11 @@ static inline unsigned int mv88e6xxx_num_gpio(struct mv88e6xxx_chip *chip)
 	return chip->info->num_gpio;
 }
 
+static inline unsigned int mv88e6xxx_num_leds(struct mv88e6xxx_chip *chip)
+{
+	return chip->info->num_leds;
+}
+
 static inline bool mv88e6xxx_is_invalid_port(struct mv88e6xxx_chip *chip, int port)
 {
 	return (chip->info->invalid_port_mask & BIT(port)) != 0;
diff --git a/drivers/net/dsa/mv88e6xxx/leds.c b/drivers/net/dsa/mv88e6xxx/leds.c
index ab3bc645da56..925c120afba3 100644
--- a/drivers/net/dsa/mv88e6xxx/leds.c
+++ b/drivers/net/dsa/mv88e6xxx/leds.c
@@ -37,32 +37,53 @@ static int mv88e6xxx_led_brightness_set(struct mv88e6xxx_port *p, int led,
 	u16 reg;
 	int err;
 
-	err = mv88e6xxx_port_led_read(p->chip, p->port,
-				      MV88E6XXX_PORT_LED_CONTROL_POINTER_LED01_CTRL,
-				      &reg);
+	if (led == 2 || led == 3)
+		err = mv88e6xxx_port_led_read(p->chip, p->port,
+					      MV88E6XXX_PORT_LED_CONTROL_POINTER_LED23_CTRL,
+					      &reg);
+	else
+		err = mv88e6xxx_port_led_read(p->chip, p->port,
+					      MV88E6XXX_PORT_LED_CONTROL_POINTER_LED01_CTRL,
+					      &reg);
+
 	if (err)
 		return err;
 
-	if (led == 1)
+	if (led == 3)
+		reg &= ~MV88E6XXX_PORT_LED_CONTROL_LED3_SEL_MASK;
+	else if (led == 2)
+		reg &= ~MV88E6XXX_PORT_LED_CONTROL_LED2_SEL_MASK;
+	else if (led == 1)
 		reg &= ~MV88E6XXX_PORT_LED_CONTROL_LED1_SEL_MASK;
 	else
 		reg &= ~MV88E6XXX_PORT_LED_CONTROL_LED0_SEL_MASK;
 
 	if (brightness) {
 		/* Selector 0x0f == Force LED ON */
-		if (led == 1)
+		if (led == 3)
+			reg |= MV88E6XXX_PORT_LED_CONTROL_LED3_SELF;
+		else if (led == 2)
+			reg |= MV88E6XXX_PORT_LED_CONTROL_LED2_SELF;
+		else if (led == 1)
 			reg |= MV88E6XXX_PORT_LED_CONTROL_LED1_SELF;
 		else
 			reg |= MV88E6XXX_PORT_LED_CONTROL_LED0_SELF;
 	} else {
 		/* Selector 0x0e == Force LED OFF */
-		if (led == 1)
+		if (led == 3)
+			reg |= MV88E6XXX_PORT_LED_CONTROL_LED3_SELE;
+		else if (led == 2)
+			reg |= MV88E6XXX_PORT_LED_CONTROL_LED2_SELE;
+		else if (led == 1)
 			reg |= MV88E6XXX_PORT_LED_CONTROL_LED1_SELE;
 		else
 			reg |= MV88E6XXX_PORT_LED_CONTROL_LED0_SELE;
 	}
 
-	reg |= MV88E6XXX_PORT_LED_CONTROL_POINTER_LED01_CTRL;
+	if (led == 2 || led == 3)
+		reg |= MV88E6XXX_PORT_LED_CONTROL_POINTER_LED23_CTRL;
+	else
+		reg |= MV88E6XXX_PORT_LED_CONTROL_POINTER_LED01_CTRL;
 
 	return mv88e6xxx_port_led_write(p->chip, p->port, reg);
 }
@@ -93,6 +114,32 @@ static int mv88e6xxx_led1_brightness_set_blocking(struct led_classdev *ldev,
 	return err;
 }
 
+static int mv88e6xxx_led2_brightness_set_blocking(struct led_classdev *ldev,
+						  enum led_brightness brightness)
+{
+	struct mv88e6xxx_port *p = container_of(ldev, struct mv88e6xxx_port, led2);
+	int err;
+
+	mv88e6xxx_reg_lock(p->chip);
+	err = mv88e6xxx_led_brightness_set(p, 2, brightness);
+	mv88e6xxx_reg_unlock(p->chip);
+
+	return err;
+}
+
+static int mv88e6xxx_led3_brightness_set_blocking(struct led_classdev *ldev,
+						  enum led_brightness brightness)
+{
+	struct mv88e6xxx_port *p = container_of(ldev, struct mv88e6xxx_port, led3);
+	int err;
+
+	mv88e6xxx_reg_lock(p->chip);
+	err = mv88e6xxx_led_brightness_set(p, 3, brightness);
+	mv88e6xxx_reg_unlock(p->chip);
+
+	return err;
+}
+
 struct mv88e6xxx_led_hwconfig {
 	int led;
 	u8 portmask;
@@ -526,24 +573,40 @@ static int mv88e6xxx_led_blink_set(struct mv88e6xxx_port *p, int led,
 	if (err)
 		return err;
 
-	err = mv88e6xxx_port_led_read(p->chip, p->port,
-				      MV88E6XXX_PORT_LED_CONTROL_POINTER_LED01_CTRL,
-				      &reg);
+	if (led == 2 || led == 3)
+		err = mv88e6xxx_port_led_read(p->chip, p->port,
+					      MV88E6XXX_PORT_LED_CONTROL_POINTER_LED23_CTRL,
+					      &reg);
+	else
+		err = mv88e6xxx_port_led_read(p->chip, p->port,
+					      MV88E6XXX_PORT_LED_CONTROL_POINTER_LED01_CTRL,
+					      &reg);
 	if (err)
 		return err;
 
-	if (led == 1)
+	if (led == 3)
+		reg &= ~MV88E6XXX_PORT_LED_CONTROL_LED3_SEL_MASK;
+	else if (led == 2)
+		reg &= ~MV88E6XXX_PORT_LED_CONTROL_LED2_SEL_MASK;
+	else if (led == 1)
 		reg &= ~MV88E6XXX_PORT_LED_CONTROL_LED1_SEL_MASK;
 	else
 		reg &= ~MV88E6XXX_PORT_LED_CONTROL_LED0_SEL_MASK;
 
 	/* This will select the forced blinking status */
-	if (led == 1)
+	if (led == 3)
+		reg |= MV88E6XXX_PORT_LED_CONTROL_LED3_SELD;
+	else if (led == 2)
+		reg |= MV88E6XXX_PORT_LED_CONTROL_LED2_SELD;
+	else if (led == 1)
 		reg |= MV88E6XXX_PORT_LED_CONTROL_LED1_SELD;
 	else
 		reg |= MV88E6XXX_PORT_LED_CONTROL_LED0_SELD;
 
-	reg |= MV88E6XXX_PORT_LED_CONTROL_POINTER_LED01_CTRL;
+	if (led == 2 || led == 3)
+		reg |= MV88E6XXX_PORT_LED_CONTROL_POINTER_LED23_CTRL;
+	else
+		reg |= MV88E6XXX_PORT_LED_CONTROL_POINTER_LED01_CTRL;
 
 	return mv88e6xxx_port_led_write(p->chip, p->port, reg);
 }
@@ -576,6 +639,34 @@ static int mv88e6xxx_led1_blink_set(struct led_classdev *ldev,
 	return err;
 }
 
+static int mv88e6xxx_led2_blink_set(struct led_classdev *ldev,
+				    unsigned long *delay_on,
+				    unsigned long *delay_off)
+{
+	struct mv88e6xxx_port *p = container_of(ldev, struct mv88e6xxx_port, led2);
+	int err;
+
+	mv88e6xxx_reg_lock(p->chip);
+	err = mv88e6xxx_led_blink_set(p, 2, delay_on, delay_off);
+	mv88e6xxx_reg_unlock(p->chip);
+
+	return err;
+}
+
+static int mv88e6xxx_led3_blink_set(struct led_classdev *ldev,
+				    unsigned long *delay_on,
+				    unsigned long *delay_off)
+{
+	struct mv88e6xxx_port *p = container_of(ldev, struct mv88e6xxx_port, led3);
+	int err;
+
+	mv88e6xxx_reg_lock(p->chip);
+	err = mv88e6xxx_led_blink_set(p, 3, delay_on, delay_off);
+	mv88e6xxx_reg_unlock(p->chip);
+
+	return err;
+}
+
 static int
 mv88e6xxx_led0_hw_control_is_supported(struct led_classdev *ldev, unsigned long rules)
 {
@@ -771,13 +862,13 @@ int mv88e6xxx_port_setup_leds(struct mv88e6xxx_chip *chip, int port)
 	}
 
 	fwnode_for_each_child_node(leds, led) {
-		/* Reg represent the led number of the port, max 2
+		/* Reg represent the led number of the port, max 4
 		 * LEDs can be connected to each port, in some designs
 		 * only one LED is connected.
 		 */
 		if (fwnode_property_read_u32(led, "reg", &led_num))
 			continue;
-		if (led_num > 1) {
+		if (led_num >= mv88e6xxx_num_leds(chip)) {
 			dev_err(dev, "invalid LED specified port %d\n", port);
 			ret = -EINVAL;
 			goto err_put_led;
@@ -785,8 +876,12 @@ int mv88e6xxx_port_setup_leds(struct mv88e6xxx_chip *chip, int port)
 
 		if (led_num == 0)
 			l = &p->led0;
-		else
+		else if (led_num == 1)
 			l = &p->led1;
+		else if (led_num == 2)
+			l = &p->led2;
+		else
+			l = &p->led3;
 
 		state = led_init_default_state_get(led);
 		switch (state) {
@@ -805,17 +900,27 @@ int mv88e6xxx_port_setup_leds(struct mv88e6xxx_chip *chip, int port)
 		if (led_num == 0) {
 			l->brightness_set_blocking = mv88e6xxx_led0_brightness_set_blocking;
 			l->blink_set = mv88e6xxx_led0_blink_set;
-			l->hw_control_is_supported = mv88e6xxx_led0_hw_control_is_supported;
-			l->hw_control_set = mv88e6xxx_led0_hw_control_set;
-			l->hw_control_get = mv88e6xxx_led0_hw_control_get;
-			l->hw_control_get_device = mv88e6xxx_led0_hw_control_get_device;
-		} else {
+			if (mv88e6xxx_has_led_hw_triggers(chip)) {
+				l->hw_control_is_supported = mv88e6xxx_led0_hw_control_is_supported;
+				l->hw_control_set = mv88e6xxx_led0_hw_control_set;
+				l->hw_control_get = mv88e6xxx_led0_hw_control_get;
+				l->hw_control_get_device = mv88e6xxx_led0_hw_control_get_device;
+			}
+		} else if (led_num == 1) {
 			l->brightness_set_blocking = mv88e6xxx_led1_brightness_set_blocking;
 			l->blink_set = mv88e6xxx_led1_blink_set;
-			l->hw_control_is_supported = mv88e6xxx_led1_hw_control_is_supported;
-			l->hw_control_set = mv88e6xxx_led1_hw_control_set;
-			l->hw_control_get = mv88e6xxx_led1_hw_control_get;
-			l->hw_control_get_device = mv88e6xxx_led1_hw_control_get_device;
+			if (mv88e6xxx_has_led_hw_triggers(chip)) {
+				l->hw_control_is_supported = mv88e6xxx_led1_hw_control_is_supported;
+				l->hw_control_set = mv88e6xxx_led1_hw_control_set;
+				l->hw_control_get = mv88e6xxx_led1_hw_control_get;
+				l->hw_control_get_device = mv88e6xxx_led1_hw_control_get_device;
+			}
+		} else if (led_num == 2) {
+			l->brightness_set_blocking = mv88e6xxx_led2_brightness_set_blocking;
+			l->blink_set = mv88e6xxx_led2_blink_set;
+		} else {
+			l->brightness_set_blocking = mv88e6xxx_led3_brightness_set_blocking;
+			l->blink_set = mv88e6xxx_led3_blink_set;
 		}
 		l->hw_control_trigger = "netdev";
 
diff --git a/drivers/net/dsa/mv88e6xxx/port.h b/drivers/net/dsa/mv88e6xxx/port.h
index 5b6cde9f7406..45d062af50ea 100644
--- a/drivers/net/dsa/mv88e6xxx/port.h
+++ b/drivers/net/dsa/mv88e6xxx/port.h
@@ -317,12 +317,15 @@
 #define MV88E6XXX_PORT_LED_CONTROL_UPDATE			BIT(15)
 #define MV88E6XXX_PORT_LED_CONTROL_POINTER_MASK			GENMASK(14, 12)
 #define MV88E6XXX_PORT_LED_CONTROL_POINTER_LED01_CTRL		(0x00 << 12) /* Control for LED 0 and 1 */
+#define MV88E6XXX_PORT_LED_CONTROL_POINTER_LED23_CTRL		(0x01 << 12) /* Control for LED 2 and 3 */
 #define MV88E6XXX_PORT_LED_CONTROL_POINTER_STRETCH_BLINK	(0x06 << 12) /* Stetch and Blink Rate */
 #define MV88E6XXX_PORT_LED_CONTROL_POINTER_CNTL_SPECIAL		(0x07 << 12) /* Control for the Port's Special LED */
 #define MV88E6XXX_PORT_LED_CONTROL_DATA_MASK			GENMASK(10, 0)
 /* Selection masks valid for either port 1,2,3,4 or 5 */
 #define MV88E6XXX_PORT_LED_CONTROL_LED0_SEL_MASK		GENMASK(3, 0)
 #define MV88E6XXX_PORT_LED_CONTROL_LED1_SEL_MASK		GENMASK(7, 4)
+#define MV88E6XXX_PORT_LED_CONTROL_LED2_SEL_MASK		GENMASK(3, 0)
+#define MV88E6XXX_PORT_LED_CONTROL_LED3_SEL_MASK		GENMASK(7, 4)
 /* Selection control for LED 0 and 1, ports 5 and 6 only has LED 0
  * Bits  Function
  * 0..3  LED 0 control selector on ports 1-5
@@ -415,6 +418,38 @@
 #define MV88E6XXX_PORT_LED_CONTROL_LED1_SELD			(0xd << 4)
 #define MV88E6XXX_PORT_LED_CONTROL_LED1_SELE			(0xe << 4)
 #define MV88E6XXX_PORT_LED_CONTROL_LED1_SELF			(0xf << 4)
+#define MV88E6XXX_PORT_LED_CONTROL_LED2_SEL0			0x0
+#define MV88E6XXX_PORT_LED_CONTROL_LED2_SEL1			0x1
+#define MV88E6XXX_PORT_LED_CONTROL_LED2_SEL2			0x2
+#define MV88E6XXX_PORT_LED_CONTROL_LED2_SEL3			0x3
+#define MV88E6XXX_PORT_LED_CONTROL_LED2_SEL4			0x4
+#define MV88E6XXX_PORT_LED_CONTROL_LED2_SEL5			0x5
+#define MV88E6XXX_PORT_LED_CONTROL_LED2_SEL6			0x6
+#define MV88E6XXX_PORT_LED_CONTROL_LED2_SEL7			0x7
+#define MV88E6XXX_PORT_LED_CONTROL_LED2_SEL8			0x8
+#define MV88E6XXX_PORT_LED_CONTROL_LED2_SEL9			0x9
+#define MV88E6XXX_PORT_LED_CONTROL_LED2_SELA			0xa
+#define MV88E6XXX_PORT_LED_CONTROL_LED2_SELB			0xb
+#define MV88E6XXX_PORT_LED_CONTROL_LED2_SELC			0xc
+#define MV88E6XXX_PORT_LED_CONTROL_LED2_SELD			0xd
+#define MV88E6XXX_PORT_LED_CONTROL_LED2_SELE			0xe
+#define MV88E6XXX_PORT_LED_CONTROL_LED2_SELF			0xf
+#define MV88E6XXX_PORT_LED_CONTROL_LED3_SEL0			(0x0 << 4)
+#define MV88E6XXX_PORT_LED_CONTROL_LED3_SEL1			(0x1 << 4)
+#define MV88E6XXX_PORT_LED_CONTROL_LED3_SEL2			(0x2 << 4)
+#define MV88E6XXX_PORT_LED_CONTROL_LED3_SEL3			(0x3 << 4)
+#define MV88E6XXX_PORT_LED_CONTROL_LED3_SEL4			(0x4 << 4)
+#define MV88E6XXX_PORT_LED_CONTROL_LED3_SEL5			(0x5 << 4)
+#define MV88E6XXX_PORT_LED_CONTROL_LED3_SEL6			(0x6 << 4)
+#define MV88E6XXX_PORT_LED_CONTROL_LED3_SEL7			(0x7 << 4)
+#define MV88E6XXX_PORT_LED_CONTROL_LED3_SEL8			(0x8 << 4)
+#define MV88E6XXX_PORT_LED_CONTROL_LED3_SEL9			(0x9 << 4)
+#define MV88E6XXX_PORT_LED_CONTROL_LED3_SELA			(0xa << 4)
+#define MV88E6XXX_PORT_LED_CONTROL_LED3_SELB			(0xb << 4)
+#define MV88E6XXX_PORT_LED_CONTROL_LED3_SELC			(0xc << 4)
+#define MV88E6XXX_PORT_LED_CONTROL_LED3_SELD			(0xd << 4)
+#define MV88E6XXX_PORT_LED_CONTROL_LED3_SELE			(0xe << 4)
+#define MV88E6XXX_PORT_LED_CONTROL_LED3_SELF			(0xf << 4)
 /* Stretch and Blink Rate Control (Index 0x06 of LED Control) */
 /* Pulse Stretch Selection for all LED's on this port */
 #define MV88E6XXX_PORT_LED_CONTROL_0x06_PULSE_STRETCH_NONE	(0 << 4)
-- 
2.55.0

