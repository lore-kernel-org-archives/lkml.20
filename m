Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012048.outbound.protection.outlook.com [52.101.48.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D276D4AC164
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 17:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788368923; cv=fail; b=q4n6vPbDrP2qKfIz19PspGAUdCOA/NBGbW4UrdT7s6cOdOgse2MDgLyLPfeXu09NkWInho/A0kdnNQrjErqc1yb5ZTalqIT0AeRN41WOIO5C02UNnCCj2t5DFZ4nE16oZDe6P/JoRxqmcf6qLzfk8ZwNHznlrtHbHOqtOl5lbqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788368923; c=relaxed/simple;
	bh=IzjuH8DvCUu6sJ8VhIryZMmCzRT2SKKooGaqKu4BiNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jrhbU1cI5F22wbalANvcl9T1psYwnymbRNu5BGT85RJdGuRZQ4iTRBPqx+inCGPxmpMH4MQ5Csm0lmsHyTgb8qQzrKUqX7GSNL46Z8rHNeark2/j//bHRIfrYC8dmWKsqRHhIMAfNv0lsG14Mz60WNd76FJ2arQ2DYu/iiwxgzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=SPUcsT6x; arc=fail smtp.client-ip=52.101.48.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="SPUcsT6x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PmfnVoCHrDYLzRox5i7lovMNTkYeeA6vudlJsaJQHSNhIfVu/ow+qgYZARTzwg1Hx8MaGHH8igRHcn/tg2ZDLOtLkUaI52SEZ9TmT0/WvgyEaTLmD+bST5m1AOxxX3EJ/Sn4aAZ7qQFZDlp4GG8PfXLRyIU6WDCk/c/MVVPL+LgmC3taTNqiKqP2HDSDfN4Xbg9lI0JcKFcN+jZY7UL9E+A2jzG6nhx1nG/nQHJmCMWxOv5fdaKyBDq5NOFqG+kQ1JzgMGgLidu7xlgkInyRCBYBb1odkk1OrU3fuQKrvwMW1tziwAJ7w3VVhBzAVVb/QPpqrq3Blxkyhx+DWdcUKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EztI41z35Q717jaClwy2Nn6oM53JvXcVD9WfgGlShvc=;
 b=PKJsXPiLQ3zPsQG3Zm6tp/0NaByQdLdr+s2nYP/zeJ8hKOuIEMGNgAa/sj7NBBzIX3VcwjVNeyjSiU83eWeDDZUoqbtczQBt6INvY7Xdh9/zoY/Q2jGxa6qzwCeAHYSWo7+44tgP9O/+wiLhYZ0yHFPU91R5PK56yLRMJVfP94UBVrJMPLRlYHQxfb2G1dtrXGjPWgAi/2eOyxn2KDtkRIdQitCht1sXSPlrFv/Mlgl5qyRgNDAC9dKEdtnEp2Rsbr8uZbcmq6/QvlBEm0jLJnQjkE+6twTyFzPZw5PgB8NpHcG1Nfs2r7ectBYqiC1EfcO4l2RwpC2XSf5T3jHrOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EztI41z35Q717jaClwy2Nn6oM53JvXcVD9WfgGlShvc=;
 b=SPUcsT6xnKZaJXl4jdqbC/gm6zcECVPoEzCyXs5Pt2uZ7rkT+zalW+bhUi2ng5nqjQgnX7DW5shP/vhmuTvmf0S48GzsGoE/dB09YL9PXyIY5/5zPWPf2UHN1AwzYWtC448h8eBVUmgCcfT21qYGMgX2fQU1o4z2CMRRBCMEhw8Es25MoRfXAEJ2OrLQZBz2Php0U3QTqGcMhUk3ExS48CYKcWJBhkLy5c7CrysHg3ilFOuq8hANVW5rMqLDsX8kkS7vCzvPsrYtIzy+KmSYmrYN1Z5hw6HLFkOA78M0u4fvEm+VtVZ0s0ssfffdohZzOoKPM281JC3YAwN+2Pwm1w==
Received: from IA4P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:558::16)
 by IA1PR22MB5954.namprd22.prod.outlook.com (2603:10b6:208:463::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 17:08:39 +0000
Received: from BN1PEPF0001806F.namprd04.prod.outlook.com
 (2603:10b6:208:558:cafe::30) by IA4P220CA0007.outlook.office365.com
 (2603:10b6:208:558::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 17:08:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay2.compute.ge-healthcare.net;
Received: from atlrelay2.compute.ge-healthcare.net (165.85.157.49) by
 BN1PEPF0001806F.mail.protection.outlook.com (10.167.245.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 17:08:32 +0000
Received: from zeus (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with SMTP id 396C219244;
	Wed,  2 Sep 2026 20:08:28 +0300 (EEST)
Date: Wed, 2 Sep 2026 20:08:27 +0300
From: Ian Ray <ian.ray@gehealthcare.com>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Lucas Stach <l.stach@pengutronix.de>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] drm/bridge: dw-hdmi: optionally ignore rxsense
 when detecting hotplug
Message-ID: <aphYC5J0ggfKzLZJ@zeus>
References: <20260902130117.2731-1-ian.ray@gehealthcare.com>
 <20260902130117.2731-2-ian.ray@gehealthcare.com>
 <7b26a257-534b-4bb1-a6a4-17d3d41aa374@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b26a257-534b-4bb1-a6a4-17d3d41aa374@kwiboo.se>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0001806F:EE_|IA1PR22MB5954:EE_
X-MS-Office365-Filtering-Correlation-Id: 25d2f942-8a73-4af9-a500-08df0914d133
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|1800799024|4143699003|10067099003|6133799003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	de2/5vppBC7nPE+e1a4DoLmW8xyuKCNjXiuAK+F7X0lHTBSdh6I64IC3H/Jut70O4Pl6Wc0fcZKjAR29SsEGZ693k6oXr4415PAnOack8eAHw8HWxzTn6LUsOzCwD9aJzIQq5aa5OkRte1yHAO8yy3oMykABdVtjncr2+xbAh4DMOPWlbpE0Cci0/iBhnQUfc1s1uE88JDRb25M0h5YEUWL/NanpZVGKk768jCLHLTm4dT9HdSM9h/OiVGqPcaL8VgaUjaORj/m9YyeNsLh1SrUWGCpPVEM8nJloou3RsOxI8NEk8WEl+Mqc6Li1RihZhVKM+vi8hzesCl8cJck1iCsur6iVddrJlsSNuvuCzoCxehLdpEoIZ3aoh1GM5om9AFp3pWLJAdS6/2gcL9jPwW0H6IeZ4tqnwlNmNqK7S4GrgxLg4jImSKhgSPVavfwmtNk+AcuuumZzB5NrAn2k8hgYsRlcyDb+iVVxLLPCVXqt066zAaVTS/U2dhsKBw7A4VJwwEwwfisBIAxzPr/tl+NrC6zJkJR+tsIGYlSPuys1e101ER/CSQ1rj6omAPJlnAZBS9jdF97XL8mjyUd7VjxPojzm+CV2HFoGDvERnK8ahnuIZPWY7D3qWc+TpdvZl0s6mW4JAu3ly4PgniH5XUievItJMcjso37+ecTmnRylM7HOXthx1xVinhm+lt8FztE3WOlQGzrXpkXU/4aNDA==
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(4143699003)(10067099003)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SMS3aBAdGbUkAHh7BCtkW8+IX740lZZo30hRN1Px2Mo1DoJExo4DCn31lSKgcSBs7mYzcAlWHz/de59BU5B0ofPZ24m/q9DuJcglAgGkZhlGy7cOA2CkcU0nmh2F4Qdbewwryg/IRE0fZhfnLihgJeDqF1onhLAIsVXaJyoAmeyp3z/GNNv6uLd5ngDDthhc3A3abENct+APVFg9i0Yrce+/uHu+EmMN5r+bOaU8KvSZaviFRHzMpsuWfsyyZPPWiNzLwoO/DRTd4f0KiQrv4f9VLvHUJ1B/oSXZiWgKZdC2jfhX5faFMckRGu3XQ7Bw7UMhDmmiw6WjpacFFs7JhTLiG6WPB+5rTW6PgMQYR8KqnpPDaGmgIVYY93Vo4KXhxGUdRwVRm7azS655belyPGKcvt+JC3ZxaU8IP6grE+Zv4VFZ2Rrv1BphCnWeuZPc
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 17:08:32.1079
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25d2f942-8a73-4af9-a500-08df0914d133
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF0001806F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR22MB5954

On Wed, Sep 02, 2026 at 05:38:34PM +0200, Jonas Karlman wrote:
> Hi Ian,
> 
> On 9/2/2026 3:01 PM, Ian Ray wrote:
> > Commit da09daf88108 ("drm: bridge: dw_hdmi: only trigger hotplug event
> > on link change") changed the way hotplug is detected to take into
> > consideration rxsense.
> >
> > That change is problematic for boards where rxsense is always detected,
> > such as when an HDMI to DP converter is used.
> 
> I have a series [1] with a patch [2] that tries to fully remove the
> rxsense part from the dw-hdmi driver, any help to test that series is
> welcomed. Should likely solve the issue you are trying to workaround
> here.
> 
> Planning on sending out a v8 next few days now that v7.3-rc1 have landed.
> 
> [1] https://lore.kernel.org/all/20260518180206.2480119-1-jonas@kwiboo.se/
> [2] https://lore.kernel.org/all/20260518180206.2480119-21-jonas@kwiboo.se/

Thank you -- your series does indeed solve my problem.
I will reply to [2] with a Tested-by: tag.


> 
> Regards,
> Jonas
> 
> >
> > Introduce an optional property 'ignore-rxsense' to handle such boards.
> >
> > Fixes: da09daf88108 ("drm: bridge: dw_hdmi: only trigger hotplug event on link change")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
> > ---
> >  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > index 34c5f583e910..a9337d1f4b88 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > @@ -171,6 +171,7 @@ struct dw_hdmi {
> >       bool disabled;                  /* DRM has disabled our bridge */
> >       bool bridge_is_on;              /* indicates the bridge is on */
> >       bool rxsense;                   /* rxsense state */
> > +     bool ignore_rxsense;            /* use HPD only, ignore rxsense for detect */
> >       u8 phy_mask;                    /* desired phy int mask settings */
> >       u8 mc_clkdis;                   /* clock disable register */
> >
> > @@ -3156,6 +3157,9 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
> >               if (phy_stat & HDMI_PHY_HPD)
> >                       status = connector_status_connected;
> >
> > +             if (hdmi->ignore_rxsense)
> > +                     phy_stat &= ~HDMI_PHY_RX_SENSE;
> > +
> >               if (!(phy_stat & (HDMI_PHY_HPD | HDMI_PHY_RX_SENSE)))
> >                       status = connector_status_disconnected;
> >       }
> > @@ -3362,6 +3366,8 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
> >       mutex_init(&hdmi->cec_notifier_mutex);
> >       spin_lock_init(&hdmi->audio_lock);
> >
> > +     hdmi->ignore_rxsense = of_property_read_bool(np, "ignore-rxsense");
> > +
> >       ddc_node = of_parse_phandle(np, "ddc-i2c-bus", 0);
> >       if (ddc_node) {
> >               hdmi->ddc = of_get_i2c_adapter_by_node(ddc_node);
> 
