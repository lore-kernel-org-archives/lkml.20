Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3DF434987
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789462151; cv=none; b=AFs4TtHasbIkt57yXAcIZp6qvtD+FARV+9PeFCr5CxePeF7WvVpEMN22IGhIhGJh7p69TmS9EcWLErMRHQ+EGiAHKmYt8r1c8hrYSwpwSLc1diK6yU4Ov02twtyQh/oFyavwsQYzeu3aGoQflvTHsO+Q2PXCI13oFZePh25K3rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789462151; c=relaxed/simple;
	bh=Tjd+qqKRlPATrV03pdQqCuwbNQZAlKYm8gvQMT9w2Dw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JMQ1X9laNLUB2Qf4pDfEK5vfNtTx4lE6XpoR78uoUY2z5VGgiYASbHNk74y6Q+OYTzPEkLWFq/Ougx/fTF+8FMirLjBtdsmTvS4C5OFW4Dkov0bqZQfeURaOKkOi2wTjc9XzSz71trVLiiLUCXLijt4Hf+xpwhEc48IdyYDJvKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DpsIwwIR; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DpsIwwIR"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa663c1so396353966b.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789462146; x=1790066946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lw0S7j61Xivg5Kyv67PljsWbYXB5K5jcfpwkKzbAMRA=;
        b=DpsIwwIR1aRjXWbrBHfODdRB6u9aUKN/BjDVq0Nm/KbMjM7ID8ZHrbToOWKGsGmt/Q
         TpG3+U4fFRmEKKMXHM3vjlmIehEW2eO4NRBxbjKwIP+Zh+wapKXDz0VG/hyOeyvlCqbc
         lBbE36PpF6Z+zLp/51s/Mvz90i+mjILvzwMJ01hDb7WCkx+LUo50ffLVY06ca/mMwtMm
         8lKSJEYDmI/ggbJdpmqwqn/EsSEMv2+74MdrLsEvo/ebYCR3Gdo1cl4SWHUl7q4ZLkz+
         uFJ9znWENOSPGyYwpko2vp9ghnypxR02h1dAzhB7iaX2jepUmIUulAfW5sx4zP7qis6I
         xN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789462146; x=1790066946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lw0S7j61Xivg5Kyv67PljsWbYXB5K5jcfpwkKzbAMRA=;
        b=BmqB56S4qCN0o5pE6zhM15kwHQ1tdUE0I706P0UX3J1sLYyA3TriJGe+CbC2zk9T1j
         MNNOWTQZTMg6vdMJHXFkneMszW9pEtnvSSum984NAflo+cAYYKy4Q+IUOhgW5YoPk+IN
         YaIWoLBZravIt5vz3yDvJwSjEAtH6NeVlLMbDIHAr7QVifj0ZSfiG5omBH433+bbl4rs
         rnDrEga2SnedtqX3MPW2QVDQH8viL7ZsttbkbHhZWYztguEgGH14m5PZavKWa8tzepcr
         G4KxugGwxE6xzG7uLTzbOkBmW2958sjkcBiujod1lbxLKQV3INswR40SqqQzlmbUbQxy
         iVcg==
X-Forwarded-Encrypted: i=1; AKwUvBx1Ey3G88UTjL71YA3TkuYKquk976a22TAzPrKMaM2tuZVfcrDv7UzIW33JW8iRlYi+ZEEtuMphwQDhbbA=@vger.kernel.org
X-Gm-Message-State: AFuF++lYXegxnkqPKlJ5vel3CkfJRm3NQld5XP5C2X0sc9HmyEYZu5OS
	G0xDh+gIb8EG6P9dD0pfsFAWqR2U7IxcSu8JAiZCNjQZrr/5KU/2/YkA
X-Gm-Gg: AYBFou16RWHCCQX9G2wTb3ci+roToQrE+09LtIeWSWquJoT/Dwfo+vqXTvnfiARhkiH
	c0hyGg26O+FI8bCZn7Mq07bTxnTob+s+FMqM5CDCgZX58UYyK55Kx7a7H7yYwxGnP2N3szbDWHl
	n968DMX7SLcyjHIw8kAGph8FtDoxGDdlgmlsJjpabz0RnXWmX1xHKC4Tkridzrdpi+I8/q/dCop
	ezkc/oBp2ha1mVuAetFZ1P8Hl0E4ADHnIs1AIHFED8pPZHp5jdQVhbOmZTUuU/JvfK51bM95SDV
	U5hh7miVZSSSNZXUhkBQ9MOztmbWdwu8atV3eoNWLsIO9szFEfETeQePFfgfq5CvVWK7NsO1Ioy
	tpZeT808Scac1rmKaOt6gkr8gtzCxo1P3Aoq63/w+SwdHeoq0wxl0yAzcWoJ+SQNTrV+94ZQZMT
	oN7cOpYjAt/icG+s1gFHsgRGjW91a5lB6P4CvfSs9U3qfqPr5pDZdFLRQDBoqZ3+i7m2Rsz9WN6
	of5UWNGcI9k21RmuFfuvUvxfurtnqydkQ==
X-Received: by 2002:a17:906:4fcb:b0:c26:22ae:b66b with SMTP id a640c23a62f3a-c29b86b7565mr667871766b.15.1789462146179;
        Tue, 15 Sep 2026 01:49:06 -0700 (PDT)
Received: from workstation (161-53-210-87.ftth.glasoperator.nl. [87.210.53.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966067101sm552702966b.35.2026.09.15.01.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:49:05 -0700 (PDT)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [PATCH v4 1/3] dt-bindings: soc: qcom: add xiaomi,taoyao-pmic-glink compatible
Date: Tue, 15 Sep 2026 10:48:59 +0200
Message-ID: <20260915084901.56622-2-zstaseg@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915084901.56622-1-zstaseg@gmail.com>
References: <20260915084901.56622-1-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible string used by Xiaomi 12 Lite 5G (taoyao) so its
battery manager can be matched to a device-specific variant in
qcom_battmgr.

Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index 16ad4f5698fc..8ca057c4e3e6 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -41,6 +41,7 @@ properties:
       - items:
           - enum:
               - qcom,sm7325-pmic-glink
+              - xiaomi,taoyao-pmic-glink
           - const: qcom,qcm6490-pmic-glink
           - const: qcom,pmic-glink
       - items:
-- 
2.53.0

