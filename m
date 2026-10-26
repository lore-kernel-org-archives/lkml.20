Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793042303;
	b=PZB5oZ/CijH/6BI4pBqD4/JOD0iYkmqwC2VM6IXwLDlOKFyEuS9oR9P5zRgEnki/Oz5R
	 CoRzPugmOGshcbndMoNMm4SqSsMb0ZUzgXnbE3F00JzS5w21UFd3XhJPZfNgRq0gknbq1
	 k3NTPKfwgpUhvI4PPayVWXFc6btXBlQM3E7DZprHrrbe2uAegWREA/EhaMvDRE99pSIbs
	 TIQxMapo77DUpOe7qpRQ0takEoU8TPzK4o9RzfyG8t74bZtsh//vgxoQzf/WnRdoXE60y
	 wY/Gdll5eTQVtS0PAOxBzFb4eVbUYbTqdQszZ24ZZbdkvfVtlkPLvuFFTvpR41OscMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042303;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=p/JejeyXs+a2BV9S3GP+DdWRq7anNloDPZ8ebf8LoQg=;
	b=R+SarVvMGgIURHJ9HGdSBrJmXbvY87hEsTUOJ7gU+jxRfpFDdbPffhKawZrkltqMLe3H
	 VEJ27I4ozWJiZssNL7g8X8LJ4JvNhAwCuEesv9JXMYZQkye1SlOszOy2ydJS3CExF8xxZ
	 NKuWH6lXSWQBQm3aj9AAxu6av0tDHP9gXdNRKLY3QOo/Q5v43xAalSi/38GbMYG+qo/EI
	 QafWGNRTb7Vzwx4D4JLcNVQlQKzCL10N/wKbHE9YmOETyimSoaHUdGhoXXsfQSMJwSKtR
	 GyLHKV+RNlsULWppNVhOfpJs3EAa8Hbx45K/WzMnIZvH63DmbybCGd3r7doAAYh3hKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=FLfzHe1d;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EDC606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79EDC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=FLfzHe1d
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so3333558a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793042303; x=1793647103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/JejeyXs+a2BV9S3GP+DdWRq7anNloDPZ8ebf8LoQg=;
        b=Cm0JGtfjCRWc+dw6r6NxRo0Q+le7CrrHroYCm3/R7/iFHmDjzFnNVzdNfwCIJ/2r55
         4mTunBeNieyXeu/grnfI5gSVND+KSXlabIPWPYiujlwGFQVjGGLld5rynfsllM6BK54x
         ueex+hUx2EI2WCIcIWnHbTMMaCLZnMa3iK3qVgUytCpfoac8pUW8cED/0bw3ThvdjYD/
         MP7Xa5b5eW5n9aqKKajJ+/O70JsjC7GrcpFewikJt3nA3kxR3NVFFmkG9mn5JowX8g0o
         Pl643rIZXD6CGp9j7H2xwc6ZW8i7vWY9OOwkfCy69erPY28CBm4uiOKP+nZSRxB+e1Uv
         nc+Q==
X-Gm-Message-State: AFq9FYK0Lbhf6kOnMr1ybPHhcCuNzkyXoso/GcdXrZRdSlOCAMx7NRuU
	8Cizu/derJ9sOriTttWpjqZWRzY57OX8/D9PJaws3nfbQOIfv3ub39nbAHW2AZJfuzF/f7uZfQe
	eWfYRmmFWyWGbIyxxXXDhQRFEAJ0AUrCDxACYhBK7G3xgp9z2KlSMaN11kz7P8kFIMGyhYRgiXR
	zTTlJsKiW0SNsmpZFAje4XRyDONuZccMrV9/b70g/Vz3dgFUBVLtHNcLa20WDQLk8XWgkxSf7YV
	I9xFWzjG/v4SGYFX8GxLhetFkY=
X-Gm-Gg: AYBFou2kWc4hWDzgJbgRaUNwmeVyFdn5RQbpeBB7bNv41WpgTtt90hQ87EubdnMLOuS
	B/uasHW2G0IEuAG5amghPJmbObkcFuseftOrwP91vvmQSCHv1/3E0oZOQkPXmz49dpklQUu/oh5
	d6BkfNZFFOwquWCYtI9BCHLnVuRLU2kgSS9ngiiNoWzE65zDePf3FPDSmtCVE/KOF+spHjrBThu
	DzJg2tJbi/ImTH7LHJrIZN4sA/OhRj3ZN1diQAIXL/nOd5c64uKvis2g8cV9rVxJflJE31J/bni
	MOWPHkwLmFsy3VPqXlTT8TSfIp7ut8ZhHTleNfR1/KfWC0K/fxnk5f2Sg4Z+HOF3Zh3CVreqy7H
	xGWsW4rCLZcoc7QTkrKT8Lc4B6a7o40Qp11VFS8pGoTR9MQOfWoEtmShuZsqTKQ07RYRs6BmKzW
	IX/w574Kcp1t8Vp/ezqCbGYjATWxQqKImdtgYDTlVGd80=
X-Received: by 2002:a17:90a:dfcc:b0:3ac:d79f:8229 with SMTP id 98e67ed59e1d1-3adeafc6fe1mr6639974a91.61.1793042302845;
        Mon, 26 Oct 2026 12:18:22 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae405f198bsm362532a91.3.2026.10.26.12.18.22
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 12:18:22 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5337b591609so38678861cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793042302; x=1793647102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p/JejeyXs+a2BV9S3GP+DdWRq7anNloDPZ8ebf8LoQg=;
        b=FLfzHe1djyrgGknLnrbV2iyn0+b7P45ZbcwPQY9TJIge9BC+PjqDclYVFX53hnY/4r
         Z/EDK3eMtxCGXBf2VOcnZMqfR9xiouD/BGIe+aNNV4ZRE7dI/R8iR9Tza07JqWPb2asA
         FSNMuEHOf9KqrEl+KaaqlEpvvvsSlbxB0THAY=
X-Received: by 2002:ac8:6546:0:b0:535:a5fa:ee0c with SMTP id d75a77b69052e-5383b66652emr111406641cf.76.1793042301632;
        Mon, 26 Oct 2026 12:18:21 -0700 (PDT)
X-Received: by 2002:ac8:6546:0:b0:535:a5fa:ee0c with SMTP id d75a77b69052e-5383b66652emr111405901cf.76.1793042300941;
        Mon, 26 Oct 2026 12:18:20 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c62063dacsm33430996d6.37.2026.10.26.12.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:18:18 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	linux-ide@vger.kernel.org (open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM IPROC ARM ARCHITECTURE),
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK)
Subject: [PATCH v3 6/6] ARM: dts: broadcom: Enable SATA on BCM958625HR
Date: Mon, 26 Oct 2026 12:16:18 -0700
Message-ID: <20261026191618.3178830-7-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026191618.3178830-1-florian.fainelli@broadcom.com>
References: <20261026191618.3178830-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Commit 77416ab35f57 ("ARM: dts: NSP: Disable AHCI controller for HR NSP
boards") disabled AHCI after reports of boot hangs. Both SATA PHYs
remain enabled, but the disabled controller leaves the eSATA ports
unavailable.

With explicit IDM clock/reset setup and the corrected shared PHY
register aperture in place, enable the controller on BCM958625HR.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm/boot/dts/broadcom/bcm958625hr.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm958625hr.dts b/arch/arm/boot/dts/broadcom/bcm958625hr.dts
index 53acae385822..f6717ca76aef 100644
--- a/arch/arm/boot/dts/broadcom/bcm958625hr.dts
+++ b/arch/arm/boot/dts/broadcom/bcm958625hr.dts
@@ -184,6 +184,7 @@ partition@700000 {
 
 &sata {
 	/delete-property/ dma-coherent;
+	status = "okay";
 };
 
 &sata_phy0 {
-- 
2.53.0

