Received: from mail-oi2-f6.google.com (mail-oi2-f6.google.com [74.125.231.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DD8370AF3
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789709796; cv=none; b=Yh4t4VdOuC+nBIGIt8b+7vJZ4uoK+sfQm4Q+lUjj3csqU4QQnf6W42RPbCRXK87vsVI0jZxN9xY8dQxcYJ9ocmch9C8hQP1GvvNo2sVeiz178EMUd72B9NFqOaM4mINunk4kMn7QG7NK8PlffKBfC0nPOcTdaICFtPSCJTE+YqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789709796; c=relaxed/simple;
	bh=NsABBcb3EIyxT70PI8GRlp7BkYxP4/kjhi7H46Bdmcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=m4Klx93HNI8iM8dirZtIfit+Uegzznhez3iKohmlP9fjlDkMt5LY87vJcqscCHTzXkNAP6qXp27bxdxu5DjbfxIBuGVQyRHu2d9UsjnIly3OuOskW3xzA8UQKQShKbMwInarhuq5v2+3QvcPnm6L07mHgJm+zGDfbvLoYm/FJCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AV7+b2kh; arc=none smtp.client-ip=74.125.231.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AV7+b2kh"
Received: by mail-oi2-f6.google.com with SMTP id 46e09a7af769-7f748fe2947so105624a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 22:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789709794; x=1790314594; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wzYREWP6rj7hgGP9HuQBvFreYOKOzskxVTsd3aB8HvI=;
        b=AV7+b2khtmkzQU/ptzlZIYf67PGTb27yZFWmZTAZxmFJe8iHNs+ZxjWSy06dCZbCQx
         FhqjN3w+v5VzL6VgHwT81GUDpmRFlLA49yDvtmJxmuWexgdW2Su6qPqNlAmjFONE+wDK
         E4Gztfv/xLN65+lEJzjiE0WjEPq0N7cOeM3QOa2LfNBvaW+zUl7YwwgDEJHBOLeecgGh
         T2HVKAUa62dBPmGILbigcg6cCrTOYx18VzmxJScEeVkWLwbAyv6tDq5TmlbCJBI9NnC/
         Jxm497Vx38N4UwBnoQj3nFOWKLsTNxZBcoSUznw5NEemZd+xm/YcdZDiuLBfsa+9o8xv
         992w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789709794; x=1790314594;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wzYREWP6rj7hgGP9HuQBvFreYOKOzskxVTsd3aB8HvI=;
        b=gSWG3r8B9JKd6aHJJzDm8j5lqqypiDPooLBVgXW2/gioatUyXOKumLhY9u27jViuWF
         4DRHdr38+nsv5E8NjDG5aNf+Sew7oIfCf+hNP9WdY57TIOL4ke66w5/WYQcZrvFyWKW5
         6DalZsNOw33jaz19Mwo86sxqJSy4if7hnq1+vR0pb3ZRfwvIWaE7JbmYvgkNhWKCw6R/
         ENmksQUnit3LyVkcv6qy8SO++9wDXVogV+RS9hZnWP4g62vR2T0X8ZRf1rHVsqUZJlGb
         5iK9EP4nov+p/QNg1HAwKzuwnAfXxDEN5M0rYJD+vgqrPT6IusQkZkg+u3gh/BXpMHhq
         ckDg==
X-Forwarded-Encrypted: i=1; AKwUvBwXeYmwH1rs4p70SiwPngkk4IU36K4OVZ0d1YeYin+1iKVdAyuF6qdUjAb62emaXjvWnej3b7kQdNahf7M=@vger.kernel.org
X-Gm-Message-State: AFuF++kxZ+7n+9B2P80WVF5eAf9ydPBTiAXZ8VQfer4EBBcaEpmhJjmt
	wsdZ7r2yPdTwKZElOvMEjzNG4DTnuS8Zxy6CFLEQU02C3rOTe2xi1RmZ
X-Gm-Gg: AYBFou1Snmd3b8Lq/QrMbQ/nnDf2UYHGGXKlbWVJrcFVvo0oU6D3N6os1P+olkOQmYs
	3czIsyJmqnCGaA8s/ZYZHreJkmCX9+rYMZRDwQP7LjMuOjrAdQYIyQJPSuv0DSIpolhNjxahNJg
	PT5ZwK0u8ML20zRmxmedisBsArv8Vz0k8DbQn3exUegdogq00M+v66fexddNLAGdx6+O/is3M0U
	8mFnkhdH3Bgw48Nuvvc7/MbvIPX9vxULgmYWCHc5gmU6+wVfXOZBgdHoe8JBVvkdmDmeW6L0lzC
	V1/Ler39+ny5LdjxHqOp2oBxNiD8YxbGezzfvb8LeewGpimzqpkJqOTZ3HFiZzmya9Hc6xNT6+3
	lL+LNgRY41cgEoNE5cMCOh3Owf2aoQU5uB1w3HAteybs+vVHrwFSkSjNSVohAHnLkZrSVR5x6+r
	jCpTI/9AmGVAb1ewbvY7ygLg2a5ZskjyZFAzcZMbvvAQhd61IKVVXfKUJczFoG7ZDF6Q==
X-Received: by 2002:a05:6830:6616:b0:80a:45e1:7677 with SMTP id 46e09a7af769-80de2ee8133mr1570219a34.23.1789709793953;
        Thu, 17 Sep 2026 22:36:33 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80e5226786csm591006a34.22.2026.09.17.22.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 22:36:33 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 18 Sep 2026 00:36:31 -0500
Subject: [PATCH] dt-bindings: power: supply: battery: allow longer
 ocv-capacity tables
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-rbrue-suez-upstreaming-battery-ocv-table-128-v1-1-f477ef39ef0d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NQQqDMBBA0avIrDtgErCmVyldZHS0A22USSK24
 t0bunyb/w9IrMIJbs0BypskWWKFuTQwPEOcGWWsBtvarvXmikpaGFPhL5Y1ZeXwljgjhZxZP7g
 MG+ZAL0Zje/QUejd5ZxwR1OSqPMn+390f5/kDCOWi4H4AAAA=
X-Change-ID: 20260917-rbrue-suez-upstreaming-battery-ocv-table-128-9ba83f9313bb
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789709793; l=2304;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=NsABBcb3EIyxT70PI8GRlp7BkYxP4/kjhi7H46Bdmcs=;
 b=8RcHojJeCCDh+w91/otTDYKnBOGvtzo4VWyFpp7W6H8wedK1LB8MqkV1m88L2p7oVOhXRrZpp
 NzZxm4zVsEXBwHXt+gQVmq2MsB/VBx7gt2LPyURgsFXfS5pjsz9KKTb
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

ocv-capacity-table-N has been capped at 100 points since battery.txt was
converted to YAML, where the limit arrived without a stated reason.

The MT6397 fuel gauge is characterised per temperature by a table the
Amazon Fire HD 10 (2017) vendor device tree carries with 126 points, of
which 122 are expressible here - the remainder are greater than 100%
discharged, so the binding excludes those points. Boards carrying this
PMIC fuel gauge would need more than 100 points to describe the pack with
the generic property. Raise the cap to 128.

Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
No kernel change goes with this. power_supply_get_battery_info() sizes each
ocv-capacity-table-N from the property itself -- it reads the length with
fwnode_property_count_u32() and devm_kcalloc()s that many entries -- so
maxItems in the binding is the only cap on points per table.
POWER_SUPPLY_OCV_TEMP_MAX bounds the number of tables, not their length.

The consumer that wants this is an MT6397 PMIC fuel gauge not yet posted;
its pack is characterised at 126 points per temperature in the vendor's
kernel (Amazon Fire OS, based on Linux 3.18), with 122 of those points
being expressible with the generic property (the rest are greater than
100%).
---
 Documentation/devicetree/bindings/power/supply/battery.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/power/supply/battery.yaml b/Documentation/devicetree/bindings/power/supply/battery.yaml
index 8ebf05d9497c..a6d4822f591c 100644
--- a/Documentation/devicetree/bindings/power/supply/battery.yaml
+++ b/Documentation/devicetree/bindings/power/supply/battery.yaml
@@ -154,7 +154,7 @@ patternProperties:
       of the battery and corresponding battery capacity percent, which is used
       to look up battery capacity according to current OCV value. And the open
       circuit voltage unit is microvolt.
-    maxItems: 100
+    maxItems: 128
     items:
       items:
         - description: open circuit voltage (OCV) in microvolts

---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260917-rbrue-suez-upstreaming-battery-ocv-table-128-9ba83f9313bb

Best regards,
--  
Ryan Brue <ryanbrue.dev@gmail.com>

