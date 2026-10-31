Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463657;
	b=hjpCTG1h1A29ZhkW2X9JNNOG1UTtP4E+GkIrOHWnahjXfswGIOODNn0w0Vc1/MlaepP/
	 ezGdlE7Hs+JfL267ywUkAM8FWnTA+jpyc05FUUYmq5m4H+4qDlTEtz5SnouqG11q+s1R4
	 B2yB/BsJ1k50klO8yL1exaiYnVsABcW0Kdx9GqmymzDRlqbJ3G/a0GxZs/aYTu7Klz5ML
	 rUWtn0a6eHNS50pu15emhVRS8vi7wApvNxtZAajB1iJJWp+kMJ77APh8gT/EpW99zj3zv
	 wxCFzp28Kl4rd94GygZHbthelnXQlkSKDg+e00FdlvGb88pb4PPLdQhDy8cWzRSmHdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=KGnofmf1/TUmvz6/LdHCt+9mScC85Mc6Sony5/UMrQ0=;
	b=jZaLDznoNE65qFqXtO4X8Xmnj/U585kdAmLTPo8w1Zy9DkiqOq9Z0Y6eiaP3VeeeTtTO
	 dCzuigDVnyybPVGE77Fn8XMKmwx/v8to0Tun1I/dSjLcHkoI6Hcg0PuU5nQbKXSXcwdGv
	 bo8I3F8+I5z3Y/pfPPL81iiAEFQM9d38vMeHVqPNy0fEVLNHw/BPOjm8ev7Eqh0g+TDC/
	 m3OI8bGOeuiZAT/NeNqCPKg6fl7AW+g96aszqaf7+UgPMRVp4RlHmJW8ltUStoATXRLZS
	 Wa9XR33cn4I0UkuDZbE5QabVdCxKX9JwQhxQYHuVjlq9Wcdt7Pjn2PL3+zQlsbc8S3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b="Fw0cT/vG";
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45CA606A330
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B45CA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=Fw0cT/vG
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3550c917fd3so2299007eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1793463656; x=1794068456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KGnofmf1/TUmvz6/LdHCt+9mScC85Mc6Sony5/UMrQ0=;
        b=Fw0cT/vGyZayC8va03gwO+veLsYq8NZOPMRSvDZwENiAFeGWMa1Cavf2vdNTLUNvot
         sb6377hQM+HMiMke1b72BPkB9gbJFp0fKx++of3dYgvDWd5ulCZyuoOV//ORsvKmWZO5
         +cxehdFCEb99oidhIgmzFTV1txwbutqk5hlXVsnRxoTvJS7NbFNyqpCovzMFgeKZcbAf
         SzHUZ2tkhlAcsxfDQsUpC5QnU0G1DfhICKwAOOblwY7/1Tgtcj+GGm7Ujixq/+7nL+ZZ
         4gkR73XlCuff/YjrIlvez6OK+B++Cfwwi3AuCaM7X8xW0YSoPkjK4AlLzDHotqapPY50
         LTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463656; x=1794068456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KGnofmf1/TUmvz6/LdHCt+9mScC85Mc6Sony5/UMrQ0=;
        b=G4dWXXqhhrwjsSl+0ZeC6U67vtxRXBvQCJKblRks+/a+IanFt+CMkUzKe7bwX3CaYp
         0a4UATH0ayRGTP96j0P+5H//qSIv/eQEZToD/ffHPr3ANWh0Up92TJw4sMh6DxpijL3E
         v8F3IVSE59wZ0FwFw8OhG8gTLZd1H/kX0rNljuVyt1uwgM3HzRylhAJKM9IlOnkyegB1
         /Zq3mB0nuqL213w7xhmIE6w5vMa5i9gAsFBpAJ0Zao/ukG2lHFzSYixNSBXFQKPAQADG
         K6w6PcCIRGm/YTvhIjhfIYJm1Foj4hj9VY7BMO7acPJ9IU+24ZDpwpcxeczdrTjPeI69
         9Wug==
X-Forwarded-Encrypted: i=1; AKwUvBw7vLzA02TxZ/vlQW9J7HpbnAacFKTfPdRmV7NCfNW0r0PQxM/XrVuPtZtaNTAr4+nZK9WYH+92Xj/qXhI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMRqY4HcOKW9rnLmZtvUTyHaV8qGqdExzWlI+O8sac5PWWoaxW
	h89Z4T703iXqPalvgeHDdjnannfE+ouDkpRr4/zNLF6iHUewe/RYm+qXn3LN/vYxphY=
X-Gm-Gg: AYBFou3yJtvPzgbDXdii9x+8uzw1aVxUrsy7x4WWsOhdwGmJB/zfvx5mM818WA7TLXS
	dlHQG6I8ZrgVVvPvYbwji2Pz+ZJ2rm+OPLOJTBrSK4w0uu+Yx7WMieLTGtLmmT065/Sk43UKCxz
	yYgDIK1R17xB7CNj2M/M4hO4YFOJFebkVkfKQ4WwdIph3cG0cS1Q8s/c3P8hzEFBA+SWoJcankS
	T+JsJDKpec5luFc2uTDR3mVS4Q5UDu+pIirKkUM1E9rHSlCozMiKMoMU5nAwvHworYahNrhPCw5
	H/1XIvbjkvWTHtmZORYIpQX7zMthSNx2mV5quQvbC2+T+7EIZfqhAaDihWKp3nZiKayV6m63DRZ
	0Cx3CCEc43wqGGU9kC9xYtYSrhpRpbn+j1jyPLlLkMC8kWrYUmlJVhNUQ7hASMORfgO/5gxFDuO
	JbHZ8iTzKKpZM/Ih9noCDWgE0iDo9K9VABOkxfLM22bqpPxM1SioafVsD2DYpjsRL4HgdBfKoPB
	DCNrGGWXU/ePh9fWl+y5VWBFJ/vL43bHCXfjsgVXR16r++1FPNHmxH9Ln6o844XwEuKaqowOvJb
	hCmko7eXnBUd3shjyz105V2hRq7gs6d2jbs/YXCfq6eBzTiqB0Daew==
X-Received: by 2002:a05:7301:22a6:b0:369:f9c4:1fda with SMTP id 5a478bee46e88-36a42489041mr10383429eec.27.1793463655579;
        Sat, 31 Oct 2026 09:20:55 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428aed76sm19185195eec.9.2026.10.31.09.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:20:55 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Sat, 31 Oct 2026 09:20:51 -0700
Subject: [PATCH v2 2/2] nvmem: eeprom_93xx46: add Microchip 93LC86C
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261031-eeprom-93xx46-93lc86c-v2-2-d37331af73d3@nexthop.ai>
References: <20261031-eeprom-93xx46-93lc86c-v2-0-d37331af73d3@nexthop.ai>
In-Reply-To: <20261031-eeprom-93xx46-93lc86c-v2-0-d37331af73d3@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Cory Tusar <cory.tusar@pid1solutions.com>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793463652; l=2481;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=4jH76N7hz1AxW1XPeahTW+3Gh4aa+Q7uWx1sNvUiNXg=;
 b=wkYGYywy1SPJC3HroZOXMaD0DamdopNMoTM0jt9Lu/ioTtnDuIQ3bdc6Vj+l68NfFN+pmfsiY
 4w2uKfitpdUCNsb0UI+WlyC0cgx4S3bYKe30Dp/oj9p6DhqpINNroRw
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The 93LC86C is the 16 Kbit member of the family: 2048 bytes, so a
10 bit word address in x16 and 11 bits in x8. Like the 93LC46B it
clocks an extra cycle out after the address during a read, so it
takes the same quirk.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/nvmem/eeprom_93xx46.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/nvmem/eeprom_93xx46.c b/drivers/nvmem/eeprom_93xx46.c
index f9c3ab52c2f9..77fe1fb641aa 100644
--- a/drivers/nvmem/eeprom_93xx46.c
+++ b/drivers/nvmem/eeprom_93xx46.c
@@ -29,6 +29,7 @@ struct eeprom_93xx46_platform_data {
 #define EE_SIZE1K	0x10		/* 1 kb of data, that is a 93xx46 */
 #define EE_SIZE2K	0x20		/* 2 kb of data, that is a 93xx56 */
 #define EE_SIZE4K	0x40		/* 4 kb of data, that is a 93xx66 */
+#define EE_SIZE16K	0x80		/* 16 kb of data, that is a 93xx86 */
 
 	unsigned int	quirks;
 /* Single word read transfers only; no sequential read. */
@@ -77,6 +78,11 @@ static const struct eeprom_93xx46_devtype_data microchip_93lc46b_data = {
 	.quirks = EEPROM_93XX46_QUIRK_EXTRA_READ_CYCLE,
 };
 
+static const struct eeprom_93xx46_devtype_data microchip_93lc86c_data = {
+	.flags = EE_SIZE16K,
+	.quirks = EEPROM_93XX46_QUIRK_EXTRA_READ_CYCLE,
+};
+
 struct eeprom_93xx46_dev {
 	struct spi_device *spi;
 	struct eeprom_93xx46_platform_data *pdata;
@@ -389,6 +395,7 @@ static const struct of_device_id eeprom_93xx46_of_table[] = {
 	{ .compatible = "atmel,at93c56", .data = &at93c56_data, },
 	{ .compatible = "atmel,at93c66", .data = &at93c66_data, },
 	{ .compatible = "microchip,93lc46b", .data = &microchip_93lc46b_data, },
+	{ .compatible = "microchip,93lc86c", .data = &microchip_93lc86c_data, },
 	{}
 };
 MODULE_DEVICE_TABLE(of, eeprom_93xx46_of_table);
@@ -406,6 +413,8 @@ static const struct spi_device_id eeprom_93xx46_spi_ids[] = {
 	  .driver_data = (kernel_ulong_t)&at93c66_data, },
 	{ .name = "93lc46b",
 	  .driver_data = (kernel_ulong_t)&microchip_93lc46b_data, },
+	{ .name = "93lc86c",
+	  .driver_data = (kernel_ulong_t)&microchip_93lc86c_data, },
 	{}
 };
 MODULE_DEVICE_TABLE(spi, eeprom_93xx46_spi_ids);
@@ -482,6 +491,8 @@ static int eeprom_93xx46_probe(struct spi_device *spi)
 		edev->size = 256;
 	else if (pd->flags & EE_SIZE4K)
 		edev->size = 512;
+	else if (pd->flags & EE_SIZE16K)
+		edev->size = 2048;
 	else {
 		dev_err(&spi->dev, "unspecified size\n");
 		return -EINVAL;

-- 
2.54.0

