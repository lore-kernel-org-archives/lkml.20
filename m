Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E7C4BFE86
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790276207; cv=none; b=mR0cYfFznGiz8+yUNPRhw2mK26nsTQokSCGhrm7X7H+87cCHJPspKZghgQqrFJAXKkU4U90D3Sb4Upt4aOLs3YjboYFeGLeW6aws558uKCSst0JPENiJEzrPYSf0+jmp0VKvCp8GKc2OjH0gO85yCk9g/lKPE2hnh8tFhotRERE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790276207; c=relaxed/simple;
	bh=8FwKlIoS1YJr20q5/GeHL/Z3vtXW795veMaqn77uBQo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tQo1bB3Vs9hmTul5d7AaugNjunXyn4n4EnTKk+Q7DfNOpHSm32ym7E2vRb8Q6rIf/zjEznEUFuIuqwAfTAa7kbRxO1vKxPToAQsImWWf8Q+n36JZoaQnlWNn7XAf1vfVuXm/qq1VOvsroeo7vCbNcTeMmD3wzGFouoA7CI4q3/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LuV6eZKx; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LuV6eZKx"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530d8a00bcdso1414551cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790276204; x=1790881004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u7if64GBDyZRxjhYKdKsp7wUaEGoHDi7prbfVqVtWGk=;
        b=LuV6eZKxUNbU6vMEM/jg3I6yLUVOcymB6k600VuDJXdIIRUIlmHuxWRcDL8MUbPFAF
         z0rBDLqvyGI53WoQLOU7n3EKJLsMJHV2F3uzEftp9sQRn3625jofBxVpXptoC1zVFYjL
         Smgv8salaZoCmzGNuEUm4LnupsmPdp06UqMWMLS4TbeAgOfY9SVxqa6ioUj41hS0oUuo
         grq57IgejoKSHiAolUB+4aBrdI/tEZ485dQVe/n7qgt3Jyb3/rjlnWmCMntfBxl1ZpEW
         QNIontV0nwS8XqJHduojGRWg85EyDihW1fH1z8TfKaIIxsEiZTo4FhDWhFn3gACN64Kk
         RuFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790276204; x=1790881004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u7if64GBDyZRxjhYKdKsp7wUaEGoHDi7prbfVqVtWGk=;
        b=yYWanWFWWwNtlV6Ftdm2vki8H4Ss0VMZSp9NrmMdrSNhiSRi3pjmnBYPheXjy/XCHh
         U7zTu4bXCpiBqIKWkiU17yCAA3ZOELaayh6KjTEKrwjoi1iUHFDv72h4RthGnKBd41Ly
         ST/xlyMUM7P4C8+BZhp4uclPfvd2KrRadEvWJW5F1/ZoHZNro0jkcHjPEdLs3GVaPd98
         zhsPrlaBQsP7n3m9IIpRoDgKoKcBmbTMq+Lx/N3jp9eAJA02swCCIZb9l6yZj2Ajm8uA
         zOED220yq6Mmqe5FbfTaQQ8S0aGDNh7oerQw2DRBcQRQPNcJGBa0SCt/QdocGJDOUQ2m
         aiqQ==
X-Forwarded-Encrypted: i=1; AKwUvByMjR1aUCr09v/ZwumTSM0UIynjhZY9wd9nz0KmYiFw1jZCzo8DVJpudmlz1/dzlS/OL6t+2msySr158OY=@vger.kernel.org
X-Gm-Message-State: AFuF++kVnx9QoYxExr9laslVH31q7BA2Ox1m8tpxPoZjOWOZtrl3+xxF
	KjN7YHJj5zReslqFY02I/LnDbBHcONKY3cGBnN6YQYfWjxdH9NS7b463
X-Gm-Gg: AYBFou38G1IjN188YJtrWWYj2nQwlz3V0CTMCdjl8/QQ1iWEYNTHkE5a71/qGsi67uW
	h6/8K3lh7YYR4O4ggcwasTb0p9TLZcsN3Hz6zP2tbLls4YoB+jOO0uDfih20PrdOgBTSoEnZK0Q
	mlPwX8S+Py0w32FJLDdxDegMOD9h0VmTqYHF8j6QizhXNkHH826jL7ZjUdz8NX0WRoAvKe6STw9
	trxoOY2XS+1prVxjE5r4RNJYH0gY/AOmxLxjftfsM5aHOymubP2Lo+98VspyWfng182FQb1EMtw
	H4uWXN61Y8xMjfrTqkHuAV5FKCbxmNytoIc6xkPqYNPqHDOuhT40q2Nr5tex1C/LIIIAqATykC4
	kEbHUtO1ZvslPeipe6sAnx4OOxqcVqm3BMiTOoskguvY4lfEUQMzJB0TaSEkqgHYsnc0SRRw4AH
	iX+2twveDOyj/II1KmQc+BhfbRdvjO+XA3OWIyp6EA5F6uKWrg//oMvJIp2J1oYPkRr/CuRu1oK
	WX886ccpvfVvAI+C6QgomGeA3C8gAxDK3vfL8ITqm1mO6XDSRTH2/0fsYQ832r1ob0WWRGEQMjh
	dUInptMebMa+3wQ65bemCjF5VhLpr7uHcwlQXUqDhDDKaFvov6cbAsyu0LQ=
X-Received: by 2002:a05:622a:130e:b0:532:d743:33e6 with SMTP id d75a77b69052e-5330b5881b9mr3667121cf.9.1790276203621;
        Thu, 24 Sep 2026 11:56:43 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5330beed557sm286031cf.15.2026.09.24.11.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 11:56:42 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: mfd@lists.linux.dev
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Lee Jones <lee@kernel.org>,
	linux-omap@vger.kernel.org (open list:OMAP2+ SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] mfd: twl-core: allocate modules with twl_private
Date: Thu, 24 Sep 2026 11:56:39 -0700
Message-ID: <20260924185639.30913-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a flexible array member to allocate the twl_client array together
with struct twl_private. This removes a separate devm_kcalloc() and
keeps the module data tied to the main private structure.

Can't use twl_get_num_slaves() for this as that bases its value on
twl_priv->twl_id , which is unallocated at this point.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: don't use twl_get_num_slaves().
 drivers/mfd/twl-core.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/mfd/twl-core.c b/drivers/mfd/twl-core.c
index f86df356d658..0b78fe30e047 100644
--- a/drivers/mfd/twl-core.c
+++ b/drivers/mfd/twl-core.c
@@ -159,7 +159,7 @@ struct twl_private {
 	unsigned int twl_id;
 
 	struct twl_mapping *twl_map;
-	struct twl_client *twl_modules;
+	struct twl_client twl_modules[];
 };
 
 static struct twl_private *twl_priv;
@@ -770,7 +770,9 @@ twl_probe(struct i2c_client *client)
 		goto out;
 	}
 
-	twl_priv = devm_kzalloc(&client->dev, sizeof(struct twl_private),
+	num_slaves = (id->driver_data & TWL6030_CLASS) ? 3 : 4;
+	twl_priv = devm_kzalloc(&client->dev,
+				struct_size(twl_priv, twl_modules, num_slaves),
 				GFP_KERNEL);
 	if (!twl_priv) {
 		status = -ENOMEM;
@@ -787,16 +789,6 @@ twl_probe(struct i2c_client *client)
 		twl_regmap_config = twl4030_regmap_config;
 	}
 
-	num_slaves = twl_get_num_slaves();
-	twl_priv->twl_modules = devm_kcalloc(&client->dev,
-					 num_slaves,
-					 sizeof(struct twl_client),
-					 GFP_KERNEL);
-	if (!twl_priv->twl_modules) {
-		status = -ENOMEM;
-		goto out;
-	}
-
 	for (i = 0; i < num_slaves; i++) {
 		struct twl_client *twl = &twl_priv->twl_modules[i];
 
-- 
2.55.0

