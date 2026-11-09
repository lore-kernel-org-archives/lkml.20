Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.86
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794203037;
	b=MT/nAyM+L0EO7JrL31w1Ka7mAR7Sz5gKAgEF5xstS1ler+xORjOxMxtWu9mm4Ap9ePzR
	 vYsYVhmYg5y6AnUe7tWzYP6GLBvyE1CKJF+uKkAjCJiGNtrZT5qqvqxv8ilQkh2rAyeFt
	 7xG09GXQPQA566G7ySlPelbVooP0bd0F4hkVolJHReih+HCyFlZv3hj7Joimg1h9qWikH
	 PKNh1cyuOZymaxytLt4UtzbNi2cwoJAU/FK4CV9pHJpI0w4BQjVPoW6rniLlIInDdNMYY
	 XwdpDazZlQoq7S1pyyJhUHdMWKDpZjwOvyg8BFyGwvtkJA+5OiuNA/1ORwuTA2+JMMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203037;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=7QnQYZGVKpOUq+Cn4ItFvxSn8Y1iyGaY96n1SQ9ct1A=;
	b=pOPaLrZrJ+g278MEfpetnxjUiSmGyapY0QyZ8mMdVhRkaBWznV8gbK4FhHGKLldVHDZM
	 KgP+us7fk1f32qsfC+lYSpeQOvsewdawLXQNTfJyrxCltMUcYheMSlNEaodyDcZEwQP9I
	 VLpnZjmkggq/1gfr5WWyq39SJeIYyZBW3VAy8mtXwq8P8HxR7KkFJweQ5dWIoNSvC/Xu9
	 tuJM9K2MmdVZBWerUMLYTIoeEJIvAx338KB1GcWkiA3qQC6ErkB7NvyH1yOfjYam/p0qz
	 LeeDasaVl3IDGMjTgbhuhWnHuH9anBI2UPxdzi/U3+DL1lZpbAzBK8Lfo8DEdt6LiUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.86
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023086.outbound.protection.outlook.com [40.107.44.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B53606A31C;
	Mon,  9 Nov 2026 05:43:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26B53606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nwxuH1HK+sTaqV9q1Z0suColMhYm+ZEzhn4npqgv7Qe1/Lv/el34/EGkoWmX7pUQNo21bQK5nakHpiHzuwMwLu3IqmOgn9SA0FXxVP++kGr8x3o0RySZzkMHSR7CzXNXN3ywuDZUCrJ66xTSXSC2mjSo5rdwFNk3/H2sjyeUhW8uUUlej92Pghj5Rmky2gcgMKqlbE5CMEKzFZmEhtKAzOpqU2bzo0rH7Z/z6kMJF/ySiWCluLCh623noSL1ryiUkdIhOnli0QPskeKPlqsBEQQf1xCqdlXUrIfb0f2BnJLKJ2tKLDDkSlekawZ7anLrb2fl2T1gs5MVo/Ij2VQr2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7QnQYZGVKpOUq+Cn4ItFvxSn8Y1iyGaY96n1SQ9ct1A=;
 b=hzCXCkUg70jHwRWlHk5uGOvPCm3kcnnnPvw/7y2ur21kZ3A8p2sQSt9eISxOYiqJVH45hLlE52Db7EF7lvbDlyVE9lDDgP52NkiR+OWstEeVY0JGPN+nb1mli+LJXFyTR3k0mUufrFqi51cGvjvS46Y/HxIy1KS8xzguDdRDmTXXLvgnu1h8LjNGDJufFFe7Wjgp612QHN2LRT9ClFZKN7cnG2/tpHij9dwlfRoYEtqs/pOzKoc1xbHtqf3P0T6+ApdX2+Yo/Z9UnbOiidDp/3NsMTpkVZUIrDs2O5ku/iKIWndU6oP9dJtMCuLHVfZLNm9JjMXzz8Dw0799+zX/cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP286CA0321.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3b7::14)
 by SG2PR06MB5239.apcprd06.prod.outlook.com (2603:1096:4:1d9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.7; Mon, 9 Nov 2026
 05:43:49 +0000
Received: from TY2PEPF0000AB87.apcprd03.prod.outlook.com
 (2603:1096:400:3b7:cafe::2c) by TYCP286CA0321.outlook.office365.com
 (2603:1096:400:3b7::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.12 via Frontend Transport; Mon, 9
 Nov 2026 05:43:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB87.mail.protection.outlook.com (10.167.253.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 05:43:48 +0000
Received: from gary-System-Product-Name (unknown [172.16.64.55])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 06AFB4102E61;
	Mon,  9 Nov 2026 13:43:48 +0800 (CST)
Date: Mon, 9 Nov 2026 13:43:46 +0800
From: Gary Yang <gary.yang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fugang Duan <fugang.duan@cixtech.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH 2/4] usb: typec: add CIX Type-C PD controller driver
Message-ID: <avFdktTtnReGiccu@gary-System-Product-Name>
References: <20261107011012.3655873-1-gary.yang@cixtech.com>
 <20261107011012.3655873-3-gary.yang@cixtech.com>
 <b214585d-4944-4c86-8ed8-58701974ccc4@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b214585d-4944-4c86-8ed8-58701974ccc4@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB87:EE_|SG2PR06MB5239:EE_
X-MS-Office365-Filtering-Correlation-Id: cd2fae5f-ed03-480a-1444-08df3e246dc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|7416014|23010399003|1800799024|22082099003|18002099003|6133799003|10067099003|56012099006|4143699003|5023799004|261028144727099003|261026121527099003|261102123227099003|261022075727099003|261022105027099003|261021121427099003|261026140227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	AjwyKLNA7TahdsJohp/RxrRbxrWEU1SpOCXIWc7sgA/JMo3czPD0KQpoU6JEUJ/r90Gg4vzup33ks1ABZFGiWQEqtn6X9ypAjFD83P6IKqTSx4K/ksIUnd5poonbM8eC+SvnNB9HOROJ8gVCEmsd0LtfVNcp9RcTfMV/tewPqWQ5w2WQWbNgdVP21HXp2XrCACp26xt5mFJDwn+EobYT0zOLP+TQoa+cLes2tFwIar+rK6hGq9oOhSAu5hrnVfGgO0S7u1XweCyu8cUxo5GPq6q5BMIOvntiZnx5Sq5rPJTRtRje/jPvGdaMF2AT8HgTrznCciv6MC8aNyz50vmSNAmR6WIKgQp/72V+LBuzTaUP1bKKDR1waHPthqIJyQhngrZof/zzqrehUDTb7cto88uvv7/JVgoXLqLRe9D/jvF6ATeaDjQg7AfcPIywfamUDN22nM2gGW7Fkej4bD6+FmVmz/Kp4lFGSxBBWd+/j7LXZpML2yJroBPRz4wcdQ2c8NJ44ezor0Nl1d+vPnxt8zQKGgwhncO6hA65BVfOe9Ci0c7B0icv4mgsHLvHumoVWrfXh7bKHTcJkLD+KmWa/AFIE+DtVMGnoEoMEarK3Va8Pscm1/CbW5+QdhexaRK92hfiUV8lD5QFl7BiesH70ahi4ikXypPcXV0zHLqTFUA+KxTUhSE66N0QldLxXcNeJTXQGdmL40Gr2Z8l7sH9Fw==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(7416014)(23010399003)(1800799024)(22082099003)(18002099003)(6133799003)(10067099003)(56012099006)(4143699003)(5023799004)(261028144727099003)(261026121527099003)(261102123227099003)(261022075727099003)(261022105027099003)(261021121427099003)(261026140227099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7ijXzE8mR6VovoOANziY/oa/4C6C4gtK1miT34W5vJtJ3iAsXFdnlzGS84hb2ClWQwFyGuHM+JFX+bPpaUJQ8VrtpATItiUy/gzhOtiGvoQsdLkdG3LWQbhw3cTSPme9wI3elEpPwbiV4slJcD1QW4EIUPPU25wZL87AzTWLwyFygysT4v/x1VmshJ1pG8kwIUGalPn/W3wLr2mc10FldVvJtPlQJKYKltbPJkW9YWP5P7AyQPfiEDpXg5+u7bZiC4Zy7bi5mePsD/0FLDgF3wWYTL7QxJLtaMYHKPUU/i4E3BNT5+cUq3S4KAUonHvKN2q8RtrtOxLhHvSL8+KOT+wNQjrHo5GoFk92jC7HtrFz71uOrumjGq8+hBcCGqT91+NdUg92dvpxYZoGGLjzWTsB0VQ5BJSAYkT897b6M5bayEiyqOpKsG/B73NJYfmG
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 05:43:48.9111
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd2fae5f-ed03-480a-1444-08df3e246dc9
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB87.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5239

Hi Krzysztof:

Thanks for your comments!

On 2026-11-07 11:56, Krzysztof Kozlowski wrote:

> EXTERNAL EMAIL
> 
> On 07/11/2026 02:10, Gary Yang wrote:
> >  CLANG CONTEXT ANALYSIS
> >  M:   Marco Elver <elver@google.com>
> >  R:   Bart Van Assche <bvanassche@acm.org>
> > diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
> > index 2f80c2792dbd..b81a0d946d00 100644
> > --- a/drivers/usb/typec/Kconfig
> > +++ b/drivers/usb/typec/Kconfig
> > @@ -110,6 +110,17 @@ config TYPEC_WUSB3801
> >         If you choose to build this driver as a dynamically linked module, the
> >         module will be called wusb3801.ko.
> >
> > +config TYPEC_CIX_PD
> > +     tristate "CIX Type-C PD controller driver"
> > +     depends on I2C
> 
> depends on your ARCH || COMPILE_TEST

agree. add it in v2.

> 
> > +     select REGMAP_I2C
> > +     help
> > +       Say Y or M here if your system has a CIX Type-C PD controller.
> > +       This driver currently supports the Realtek RTS5453H controller.
> > +
> > +       If you choose to build this driver as a dynamically linked module, the
> > +       module will be called cix_pd.ko.
> 
> 
> ...
> 
> 
> > +static int cix_pd_init_ports(struct cix_pd *typec)
> > +{
> > +     struct device *dev = typec->dev;
> > +     struct typec_altmode_desc desc = cix_pd_dp_altmode;
> > +     int ret, nports;
> > +
> > +     nports = device_get_child_node_count(dev);
> > +     if (nports == 0) {
> > +             dev_err(dev, "No port entries found.\n");
> > +             return -ENODEV;
> > +     }
> > +
> > +     if (nports > 1) {
> > +             dev_err(dev, "More ports listed than can be supported.\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     device_for_each_child_node_scoped(dev, fwnode) {
> > +             ret = fwnode_property_read_u32(fwnode, "reg", &typec->id);
> > +             if (ret)
> > +                     goto unregister_ports;
> > +
> > +             ret = cix_pd_typec_parse_port_props(&typec->caps, fwnode,
> > +                                                 dev);
> > +             if (ret)
> > +                     goto unregister_ports;
> > +
> > +             typec->port = typec_register_port(dev, &typec->caps);
> > +             if (IS_ERR(typec->port)) {
> > +                     ret = PTR_ERR(typec->port);
> > +                     typec->port = NULL;
> > +                     dev_err(dev, "Failed to register port: %d\n", ret);
> > +                     goto unregister_ports;
> > +             }
> > +
> > +             desc.roles = typec->caps.data;
> > +             typec->port_altmode = typec_port_register_altmode(typec->port,
> > +                                                               &desc);
> > +             if (IS_ERR(typec->port_altmode)) {
> > +                     ret = PTR_ERR(typec->port_altmode);
> > +                     typec->port_altmode = NULL;
> > +                     dev_err(dev, "Failed to register DP altmode: %d\n", ret);
> > +                     goto unregister_ports;
> > +             }
> > +
> > +             ret = cix_pd_typec_get_handles(typec, fwnode, dev);
> > +             if (ret)
> > +                     goto unregister_ports;
> > +     }
> > +
> > +     return 0;
> > +
> > +unregister_ports:
> > +     cix_pd_unregister_ports(typec);
> > +     return ret;
> > +}
> > +
> > +/*
> > + * The IRQ is disabled when either the user asked for it or the device is
> > + * suspended. Keep the disable/enable calls balanced and idempotent.
> > + */
> > +static void cix_pd_sync_irq(struct cix_pd *rts)
> > +{
> > +     bool disable = rts->pd_int_disabled || rts->suspended;
> > +
> > +     if (!rts->irq_requested || rts->irq_disabled == disable)
> > +             return;
> > +
> > +     rts->irq_disabled = disable;
> > +     if (disable)
> > +             disable_irq(rts->irq);
> > +     else
> > +             enable_irq(rts->irq);
> > +}
> > +
> > +static ssize_t disable_pd_interrupt_show(struct device *dev,
> > +                                      struct device_attribute *attr,
> > +                                      char *buf)
> > +{
> > +     struct i2c_client *client = to_i2c_client(dev);
> > +     struct cix_pd *rts = i2c_get_clientdata(client);
> > +     const char *p;
> > +
> > +     if (rts->pd_int_disabled)
> > +             p = "disabled";
> > +     else
> > +             p = "enabled";
> > +
> > +     return sysfs_emit(buf, "%s\n", p);
> > +}
> > +
> > +static ssize_t disable_pd_interrupt_store(struct device *dev,
> > +                                       struct device_attribute *attr,
> > +                                       const char *buf, size_t count)
> > +{
> > +     struct i2c_client *client = to_i2c_client(dev);
> > +     struct cix_pd *rts = i2c_get_clientdata(client);
> > +     bool value;
> > +     int ret;
> > +
> > +     ret = kstrtobool(buf, &value);
> > +     if (ret)
> > +             return ret;
> > +
> > +     mutex_lock(&rts->irq_lock);
> > +     rts->pd_int_disabled = value;
> > +     cix_pd_sync_irq(rts);
> > +     mutex_unlock(&rts->irq_lock);
> > +
> > +     dev_alert(dev, "Only for USB Compliance test, PD int is %s\n",
> > +               value ? "disabled" : "enabled");
> 
> What?
> 
> > +
> > +     return count;
> > +}
> > +
> > +DEVICE_ATTR_RW(disable_pd_interrupt);
> 
> You need to document the ABI. But really, we do not enable/disable
> interrupts through custom sysfs hooks. Drop.
> 

agree. drop it in v2

> > +
> > +static int cix_pd_probe(struct i2c_client *client)
> > +{
> > +     struct cix_pd *rts;
> > +     int ret;
> > +
> > +     dev_dbg(&client->dev, "IRQ %d supplied\n", client->irq);
> 
> Drop

agree

> 
> > +     rts = devm_kzalloc(&client->dev, sizeof(*rts), GFP_KERNEL);
> > +     if (!rts)
> > +             return -ENOMEM;
> > +
> > +     rts->dev = &client->dev;
> > +     rts->irq = client->irq;
> > +     mutex_init(&rts->lock);
> > +     mutex_init(&rts->irq_lock);
> > +     cix_pd_typec_init_state(rts);
> > +
> > +     if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
> > +             return dev_err_probe(&client->dev, -ENODEV,
> > +                                  "i2c check functionality failed\n");
> > +
> > +     rts->regmap = devm_regmap_init_i2c(client, &cix_pd_regmap_config);
> > +     if (IS_ERR(rts->regmap))
> > +             return dev_err_probe(&client->dev, PTR_ERR(rts->regmap),
> > +                                  "failed to init regmap\n");
> > +
> > +     i2c_set_clientdata(client, rts);
> > +
> > +     ret = cix_pd_init_ports(rts);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret = cix_pd_event_handler(rts, 0);
> > +     if (ret) {
> > +             dev_err(&client->dev, "failed to read initial status: %d\n", ret);
> > +             if (ret == -ESHUTDOWN)
> > +                     ret = -EIO;
> > +             goto err_unregister_ports;
> > +     }
> > +
> > +     if (client->irq > 0) {
> > +             irq_set_status_flags(client->irq, IRQ_DISABLE_UNLAZY);
> > +             ret = request_threaded_irq(client->irq, NULL, cix_pd_irq_handle,
> > +                                        IRQF_SHARED | IRQF_ONESHOT,
> > +                                        dev_name(&client->dev), rts);
> > +             if (ret) {
> > +                     dev_err(&client->dev, "failed to request irq: %d\n", ret);
> > +                     goto err_unregister_ports;
> > +             }
> > +             rts->irq_requested = true;
> > +     }
> > +
> > +     ret = device_create_file(&client->dev, &dev_attr_disable_pd_interrupt);
> > +     if (ret)
> > +             dev_warn(&client->dev,
> > +                      "Failed to create sysfs attribute, ret = %d\n", ret);
> > +
> > +     device_set_wakeup_capable(&client->dev, true);
> > +
> > +     return 0;
> > +
> > +err_unregister_ports:
> > +     cix_pd_unregister_ports(rts);
> > +     return ret;
> > +}
> > +
> > +static void cix_pd_remove(struct i2c_client *client)
> > +{
> > +     struct cix_pd *rts = i2c_get_clientdata(client);
> > +
> > +     device_remove_file(&client->dev, &dev_attr_disable_pd_interrupt);
> > +
> > +     mutex_lock(&rts->irq_lock);
> > +     if (rts->irq_requested) {
> > +             rts->suspended = true;
> > +             cix_pd_sync_irq(rts);
> > +             if (rts->wake_enabled) {
> > +                     disable_irq_wake(rts->irq);
> > +                     rts->wake_enabled = false;
> > +             }
> > +             free_irq(rts->irq, rts);
> > +             rts->irq_requested = false;
> > +     }
> > +     mutex_unlock(&rts->irq_lock);
> > +
> > +     cix_pd_unregister_ports(rts);
> > +}
> > +
> > +static const struct of_device_id cix_pd_of_match[] = {
> > +     { .compatible = "realtek,rts5453h", },
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(of, cix_pd_of_match);
> > +
> > +static const struct i2c_device_id cix_pd_id[] = {
> > +     { "rts5453h" },
> > +     {}
> > +};
> > +
> > +static int __maybe_unused cix_pd_suspend(struct device *dev)
> > +{
> > +     struct i2c_client *client = to_i2c_client(dev);
> > +     struct cix_pd *rts = i2c_get_clientdata(client);
> > +
> > +     mutex_lock(&rts->irq_lock);
> > +     if (rts->irq_requested) {
> > +             rts->suspended = true;
> > +             cix_pd_sync_irq(rts);
> > +             if (device_may_wakeup(dev)) {
> > +                     enable_irq_wake(rts->irq);
> > +                     rts->wake_enabled = true;
> > +             }
> > +     }
> > +     mutex_unlock(&rts->irq_lock);
> > +
> > +     return 0;
> > +}
> > +
> > +static int __maybe_unused cix_pd_resume(struct device *dev)
> > +{
> > +     struct i2c_client *client = to_i2c_client(dev);
> > +     struct cix_pd *rts = i2c_get_clientdata(client);
> > +
> > +     mutex_lock(&rts->irq_lock);
> > +     if (rts->irq_requested) {
> > +             if (rts->wake_enabled) {
> > +                     disable_irq_wake(rts->irq);
> > +                     rts->wake_enabled = false;
> > +             }
> > +             rts->suspended = false;
> > +             cix_pd_sync_irq(rts);
> > +     }
> > +     mutex_unlock(&rts->irq_lock);
> > +
> > +     return 0;
> > +}
> > +
> > +static int __maybe_unused cix_pd_restore(struct device *dev)
> > +{
> > +     struct i2c_client *client = to_i2c_client(dev);
> > +     struct cix_pd *rts = i2c_get_clientdata(client);
> > +     int ret;
> > +
> > +     ret = cix_pd_resume(dev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* Re-trigger PD event if PD event occurs during std */
> > +     ret = cix_pd_event_handler(rts, 0);
> > +     if (ret)
> > +             dev_err(&client->dev, "typec event handling error %d\n", ret);
> > +
> > +     return ret;
> > +}
> > +
> > +static void cix_pd_shutdown(struct i2c_client *client)
> > +{
> > +     struct cix_pd *rts = i2c_get_clientdata(client);
> > +
> > +     mutex_lock(&rts->irq_lock);
> > +     rts->suspended = true;
> > +     cix_pd_sync_irq(rts);
> > +     mutex_unlock(&rts->irq_lock);
> > +}
> > +
> > +static const struct dev_pm_ops cix_pd_pm_ops = {
> > +     .suspend = pm_sleep_ptr(cix_pd_suspend),
> > +     .resume = pm_sleep_ptr(cix_pd_resume),
> > +     .freeze = pm_sleep_ptr(cix_pd_suspend),
> > +     .thaw = pm_sleep_ptr(cix_pd_resume),
> > +     .restore = pm_sleep_ptr(cix_pd_restore),
> > +};
> > +
> > +MODULE_DEVICE_TABLE(i2c, cix_pd_id);
> 
> This is placed next to the table.

Yes, you're right. It's my mistakes and fix it in v2.

If I miss your any information, please kindly remind me.

Best Regards,
Gary
> 
> > +static struct i2c_driver cix_pd_i2c_driver = {
> > +     .driver = {
> > +             .name = "rts5453h",
> > +             .of_match_table = cix_pd_of_match,
> > +             .pm = pm_ptr(&cix_pd_pm_ops),
> > +     },
> > +     .id_table = cix_pd_id,
> > +     .probe = cix_pd_probe,
> > +     .remove = cix_pd_remove,
> > +     .shutdown = cix_pd_shutdown,
> > +};
> > +
> > +module_i2c_driver(cix_pd_i2c_driver);
> > +MODULE_DESCRIPTION("CIX Type-C PD controller driver");
> > +MODULE_AUTHOR("Chao Zeng <Chao.Zeng@cixtech.com>");
> > +MODULE_AUTHOR("Gary Yang <gary.yang@cixtech.com>");
> > +MODULE_LICENSE("GPL");
> 
> 
> Best regards,
> Krzysztof
