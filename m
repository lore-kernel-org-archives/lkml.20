Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=103.117.158.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794479471;
	b=gEb91EdIBvPqAFELN+ctSJv300whipYb/VCMT8xdAQ+uS/5IUkDZc6/+glnEn0WsFZv8
	 espAIq92U6axZ4tRif1BKqkvrZl19U9cC87CdyZIFnfVWztcdFZ6LkB6K/n1NoDlOoqvR
	 azTLsoPLwbYpYZtLvRPNCRNyuTqkD+il7r7n7bcD5mY1sMN1W9u5xTn/alNCm2BxKUb51
	 hbjUhX8u2SxvADS/9SdQ82lv2wmnKH6s/0ZVBBHX4g1bYAAnW0cQqunBlxBHWIkG65XAI
	 ZrVJKhRi2KzQWSwRb6dxL70fspeIQlq1oUKckHySaz5OdLcC3euF5I5qxmB2g2Xtgeg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794479471;
	h=DMARC-Filter:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=AxSyEXXUqTZvKwZKy/rcDTy0Q9IL0SHQWrsBeSHViUw=;
	b=uZaZIepoy/bF78Bp/oNX+aW9l8xTX3P3copckZxXV6lQsqW+M6FS+f4hFeNzUymBpAI2
	 TkSIq9GUK3KbQqAch6LUOjO2yeGFhS5dTwfRR4XaqkdHqRfHWN9RW0WmuDAwhFXhpc9KD
	 7BqBUNIdoTMSfjnck6nXLNo2CojF18JAeWCME4YOX0reW2q5F6O6vV7yOBPLkWAPY2RTp
	 ThNNqkf13DhqLhNIcwdFySwmMDxM/dEKfKOPP4xybcZTai0Z1PSqaaLYy79Cugbfs4Aj7
	 XKdk327UOen1HeT5v8DiI2B18K1LlA3EgSY4BDPZFGb94Yc2dhf+yu89Fpjuai6ZDdg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=inferno0230.in;
	spf=pass smtp.mailfrom=inferno0230.in;
	dkim=pass header.d=inferno0230.in header.i=@inferno0230.in header.a=rsa-sha256 header.s=zmail header.b=Zj8BCMoG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=103.117.158.53
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4778A606A31C;
	Thu, 12 Nov 2026 10:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4778A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inferno0230.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inferno0230.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inferno0230.in header.i=@inferno0230.in header.a=rsa-sha256 header.s=zmail header.b=Zj8BCMoG
ARC-Seal: i=1; a=rsa-sha256; t=1794479448; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=bWCzq/mUNyJOV+lmlddPlmRgQlH1OPUo5l2Kaxe5tz3YN4EmfJvGzKTDRbZTDkYEqBbeYrkP8nZ44YP33lQhI4OlMb5U7UJX13oLG+SNOkUeoYZ2/j0eK1UcvKys/xggfAK6za26alVpiCuvZgZscYjGVNDIU43ha84NKIXSewI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1794479448; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AxSyEXXUqTZvKwZKy/rcDTy0Q9IL0SHQWrsBeSHViUw=; 
	b=dkkDrXh8TwUcl49rdkcdO4mSeAudzdF/WYy7YgJtRoOPF4oCaopcNfORH6hLM99iPDtqQfdjYKrU4NHJPUX0y6quBAEK5SXCh/HZQ30EVBo97F+C/mety68dS0qC1bu8y40iTeTGyIwM3utZfdD8du5kaE+33um2m3OEe8aFrt8=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=inferno0230.in;
	spf=pass  smtp.mailfrom=mail@inferno0230.in;
	dmarc=pass header.from=<mail@inferno0230.in>
DKIM-Signature: a=rsa-sha256; b=Zj8BCMoGMqlI3fUfL9Kp6XwBWtxcp+D9TwL3t5xzXg0zyb+kdAzGE/91lRqYRtcDlAuC+xLroCETu4q3UCikXX9qBazZn+vkhc9NK1BYsJftawv9C0PolF8kA2/HZ9ITKdkyMTeuRWbXmh4Jf6EbyP7ngdVbkY2ynQVkc9+unfc=; c=relaxed/relaxed; s=zmail; d=inferno0230.in; v=1; bh=AxSyEXXUqTZvKwZKy/rcDTy0Q9IL0SHQWrsBeSHViUw=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.in with SMTPS id 1794479445218254.07992743648333;
	Thu, 12 Nov 2026 16:00:45 +0530 (IST)
From: Aditya Choudhury <mail@inferno0230.in>
Subject: [PATCH 0/2] soc: qcom: Add SoC ID for SM7550
Date: Thu, 12 Nov 2026 10:30:25 +0000
Message-Id: <20261112-sm7550-soc-id-v1-v1-0-57299906d81a@inferno0230.in>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqDMBCF4VeRWTuQiaZFX0W60DhpR/BCxoogv
 ruxXX4czn+AchRWqLMDIm+iMk8JlGfgP+30ZpQ+GayxDyKyqOPTOYM6+7TgRuirwL0ruKKuhHR
 bIgfZf8nm9bd+u4H9enfgPC99x78gdAAAAA==
X-Change-ID: 20261112-sm7550-soc-id-v1-c9fed53e91b4
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aditya Choudhury <mail@inferno0230.in>
X-Mailer: b4 0.15.2
X-ZohoMailClient: External

Add the SoC ID for the Qualcomm SM7550 (codename "crow" in downstream) to the
dt-bindings header and the socinfo table.

This is the first set of patches for SM7550 upstream support. More
patches will follow later.

---
Aditya Choudhury (2):
      dt-bindings: arm: qcom,ids: Add SoC ID for SM7550
      soc: qcom: socinfo: Add SoC ID for SM7550

 drivers/soc/qcom/socinfo.c         | 1 +
 include/dt-bindings/arm/qcom,ids.h | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20261112-sm7550-soc-id-v1-c9fed53e91b4

Best regards,
--  
Aditya Choudhury <mail@inferno0230.in>

