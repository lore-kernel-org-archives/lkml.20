Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B6751D533
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755821; cv=none; b=ZYnarm6iIN31VHcD1NUU9LpZK932ejN2PBsM5f4F9qVZtQ69U1mPPu8bO/YQ/P6P5WHFzt0MamlRAbBxJKB9/bo/mgxxWQ2slPG+y2s5DjWyLYynd5q58Mb3AB36HRExfyk/V3tB42OR2nmqaF1IMrEfdElGOx7g/zQaKy8//1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755821; c=relaxed/simple;
	bh=WAJrSEZkQYTEDq9vyw5OAkxECQ/CYjweOnUO5CKaYkc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FYkCfa+fpx9Ev2XZZT1THEnDYYSDBJVnoyBoD0ci9tiCGdvZyfgmdWDV9qHejYuaArKKyuq8lf4JRiPg1bB0JgH922Y8B8qy5Ah7xQTP12oiaR4uWKQ4CZ4+TwCNDkACFciJDHe4Aa2MxaUCAEhLXbXgJlzfxn0gBexY42GhL8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=j0iTv/ug; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="j0iTv/ug"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d822dso7715585e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1789755817; x=1790360617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0tZDlqxie/qCNA8rlhQkqn4p9JhLuqDdva7s2f0qY0=;
        b=j0iTv/ugO+bZmAnCrRAs3Y5Q10OWOOc0wzKUp2TZ0+1QlWfOZZI0obAoMfphNVfPsA
         1jhMixnCcp6226zZvTjGJGPPm5wMgOcYe0cK9kwtJ0FMrRq4RUtXVkGrLHpk3pOqpGun
         EmXHXKNeypXpe2DEYeiys/EzonrFn3Y+l87XevDrB0Y8PGeJxfg2ABo4+v60YVnqfuf3
         7U4MOj9dcoLKTJScB7J2ePqGnSxaoIagSiE6aTFyJosR5H0atmq3PaXUlgJI8r3N9hy9
         VoxiP4aULepAd+lSsl6ydRf/O5HIm+y1R6tBmp2HnVeN/Cfv0U/We7sUzphRWpqjYh5/
         rk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789755817; x=1790360617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d0tZDlqxie/qCNA8rlhQkqn4p9JhLuqDdva7s2f0qY0=;
        b=sTRLdTDi+k01X1aad7UmVHTgt/hiyyyofwAK+3D7rg3ej1DvEXxQQYDYwL2iNDdSXe
         k39Gv7ePurZ6NdwVyEZJ9KyX1px4QxK9D/fytmQaBOrLHaguwtr8cH1u8nfLThEQVMjI
         MU6p91ZEfvff5KTQApVAXXNmQaGoqn47iM8qSREreC/SHobMnpizBNuD0kT6VyXXuIR5
         XrNNXEdkC7eYqfoZ0wgR4+ybSD+mVubzE+uNFn9pNFj/OJoU/Fl8wf3Q+E4i/VQwP8tm
         JuLZ0qPrVbn7QpLeWwCNLFtwET6/3sAmx1uvx8054kk3WptzdJ4uDaS33aAKmFhF2RhI
         fJYQ==
X-Forwarded-Encrypted: i=1; AKwUvBysvTu9hl8mCTfS1KQ3p0NHeCp5QKcak5WPujpljwM+kOf3R9a5UnatIfrl1u4pnlLoP2I9CYR7nXlq/HM=@vger.kernel.org
X-Gm-Message-State: AFuF++k34Qw9egBIjDw0O/zUlk1Hfr1k/hOU+43mDOsGD1NN0DziUu6A
	ukYhLffqrudkZtkBCljGrkje12tAYzgMU9zLfrFvSkZJxmGyCk3pwooP45g1WjNy9hdgMkQPzov
	9lsiU4PhiEA==
X-Gm-Gg: AYBFou3jbKkDFGc3/SgYLzhxqqs9b/u9xSVRp/3PrwD9glTGvpgtn4yRjBfuj58amF2
	+Byacxn2m+72QtweI7DIiIwV4MmrYifksIRp/tZI8rC9QuiDSBfAtnFVeV8e0HQT2r4Wk/3B0Jy
	+JTXm5N6Uoyvam0+0OPP+33x3p9FReueFAfJl+LyxKESS8DQAkKRzoPMyC86oGK9tC5EJxQuK2F
	pmADh6ti/MQfutjy8uYaGeFQjl6lcYLdUlc9eCaYd2DoHo6LgPBu6GotAGNawJiHaY8ii1LCrcE
	ogmQAnF7TmG1JE1i0Ji5gCt9FIMf3sTig8BGczrJHI3gMyYIWkP0L3Nmd0co5hAy/NJgWBjOxZ6
	FbqC1DLD8x53DOl7gF8oJ5pu/VYBDUGQfWS7+X77OsiRhDLR2L+7Sm46P/GkvLZe83g08PkEbXZ
	9f67feUYxNvTl/lN9CfsQbIxa/B32ziInpPQo05U/iMA+lDw47fxpxDKRIEF+E8svh1Te+d4RGU
	z2RebjxJae7KA==
X-Received: by 2002:a05:600c:4e16:b0:49e:8377:c880 with SMTP id 5b1f17b1804b1-49fc574a641mr39896255e9.33.1789755816874;
        Fri, 18 Sep 2026 11:23:36 -0700 (PDT)
Received: from Behemoth.triland.local ([178.135.16.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0735c9sm12159755e9.6.2026.09.18.11.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:23:36 -0700 (PDT)
From: Karl Asseily <karl@asseily.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Asseily <karl@asseily.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/4] dt-bindings: vendor-prefixes: add ESS Technology
Date: Fri, 18 Sep 2026 21:23:14 +0300
Message-Id: <20260918182317.143223-2-karl@asseily.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260918182317.143223-1-karl@asseily.com>
References: <20260918182317.143223-1-karl@asseily.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the vendor prefix for ESS Technology, Inc., maker of the SABRE family
of audio DACs. The prefix follows the company's domain, esstech.com.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Karl Asseily <karl@asseily.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Notes:
    v2: rename the vendor prefix to esstech, after the company domain

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba200296937..ff4a85f4cbd 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -559,6 +559,8 @@ patternProperties:
     description: Seiko Epson Corp.
   "^esp,.*":
     description: Espressif Systems Co. Ltd.
+  "^esstech,.*":
+    description: ESS Technology, Inc.
   "^est,.*":
     description: ESTeem Wireless Modems
   "^eswin,.*":
-- 
2.34.1

