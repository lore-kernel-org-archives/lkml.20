Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A67D4973A9
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789720878; cv=none; b=TJc3h6ZM9hrfzBSr3FhyaqwQNCWzBfC5i9+RXHWfRZOa8pdhYDaVQhLfO5G22bJ6MZCbUI/fuFqUZ2bdtcXFLs2Q11N7VAuG8EaA+WZ3U4MmpdD/VQVi1OwjcgBrtpdPB8hTjc7nlB0n8o/iVYiM8ZPK6DDWxC+AC4DvTfDB/RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789720878; c=relaxed/simple;
	bh=wrkRKuHru9tDnAksOKICjvX2eXVZPnIV0pkf0wg10Ao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D0285P8YLI+Hbo1nAvpZOCrH4i+5tKmqljH3+hL3vLJuIhBvAKQ/vHs/r9CdRSIe7nnw/uzuTdurJtUYWp1pvTxPhbTje7TTe58Eby73RtWLXvgvR2MY3ZGJaQY71npD8cE13MiosLkoiNIG4qCKjDyIWIS67pgxSTQz+MYT41g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hg/jOWHP; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hg/jOWHP"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccc09d65so479445a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789720876; x=1790325676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GxDmGUi2C59ZkDrEBuMyQkkkrDWgX+iuYFMfWFNId3U=;
        b=hg/jOWHPlkv4fYETiJx+uSqvxJOYvUBk8L3ZNm0Qm5jVa3Az7SxZnV018vVEMxB9vk
         qmY6gQqU6WWpy/qd9DpKsIAUBhSwkNh7vhDGrYwnbLrgePitxgPFib29lbHjt3eULWV1
         +LQHOatYT1wcTLM+6koOOlssHLx8+bqr5y/Zy0KF5jhg7KuI9m15V+01svN/9YNIyw83
         +efVVmQZsXGo53yXtSjzta4kt7Sjz9tis6kGfcechcKLgofgxOsvjC9ygIHpnfk3PCKv
         lwZekC4mEpq6Wc1uTqMmhzG+NDBX9kDuGPbJSxvJsVzzVSh1K02BgWyhYNnq2LElZEfw
         SZ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789720876; x=1790325676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GxDmGUi2C59ZkDrEBuMyQkkkrDWgX+iuYFMfWFNId3U=;
        b=oqxrAudSV6j4CgNH3dK4/aMHgB1A7wLiOBG8THEVcI6aN68pksmPzOmli32tWjdZ/T
         7Thhn7dd0lpvenLRbUfJELJXfaQSPli7IX6dTTup8bIFBRLy8A7KabMCn3Nw8Il5xc7T
         C4maNq6qnuqpYA52Pu0BmJ+xZhQTikAwzWwrjZOX1baLVnQn9p4rQd90C72n2stbJvW8
         aok4KNh3w6+xlrVbDLqQKdAhkdiZ5obOeU6uI424agrVHOdYrF5iAb2tOuuvepiGbubi
         AJ2YDLI36P+nqAgneasT0fpZmYPaWVPbcM5pwFztNBz8byXmf7ju+MNwA3GqViHKyqjj
         LKnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgx66/jAJdPC0YyseIxRwjfrBKZUoXggx0LYLoavcq3UxdVNSjbUvwerpq/ILTrhXhJum9PsruZLOVFPE=@vger.kernel.org
X-Gm-Message-State: AFuF++nflhwAKHVGFzBE3d77tpqd02326XF5BVe6mYYGll549BSZ9mJK
	/AXdePRIhCuRFRew/X0CvoxUjRi8KkzuUM7+TqfFsr5WdXvHp0C+ubw6
X-Gm-Gg: AYBFou30zXuKKdyf6lXfCYYv3fvzQfd/uvzF2Ogv10sOYJurmBukYznZgUmgXhR2wxl
	BE0yOlA62/NxN16ufJk+XrI/6W6evr1iFMmPZhjpEElqosl9t94+Mjk4vc1spWd02bqtUFPFM8/
	7X3yD/8nDmjU58ofrIGLXQE+p9uFzGvI/inh2JOsZaRuiAFLWJU2sCsGrRxzpjaQJFtUnGfIZTe
	4XyDkYe2lSXNPOnnksVlMjSDG6QOG9rq+Zt5khxzL9P5uicpUsVg6/hr8yEcGMsZ0dVtYujkOXp
	7tOhiHdy6XCGbXm0EfJbLZ6FW6chqxqMTwZD1PNC4kmFRNRCPhDQiNU6DKycKuSkhgUTo4ESNTb
	JnT8iQc3QJLRkbJ0w0ZEcrHQyIV3FJAQxcm83JQeGOUou3q1iaOttM+GC9Mbo77/piDs5n6KNP1
	RR9jMm5TL9w4KGVcY+obLQvaE7Th31xBuWg3GWqbMZ3Abd73I32dOdqREKKqlyIHqyICK/gTgjw
	3aZ0+JD1bTuk/wx7hpSl6pfYiKD+1vbsh2sta3gDgws9aUtihT3r9CJdP5ngo2a3//BeIF+Oa+Y
	ug==
X-Received: by 2002:a17:90b:574e:b0:39e:1fb6:9659 with SMTP id 98e67ed59e1d1-39e54f0772fmr4397778a91.22.1789720875692;
        Fri, 18 Sep 2026 01:41:15 -0700 (PDT)
Received: from cs00-MS-7C09.. (2001-b400-e35f-d966-bfea-f724-5ada-7374.emome-ip6.hinet.net. [2001:b400:e35f:d966:bfea:f724:5ada:7374])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e5a50d332sm2093716a91.9.2026.09.18.01.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 01:41:15 -0700 (PDT)
From: hsyemail2@gmail.com
X-Google-Original-From: syhuang3@nuvoton.com
To: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Cc: Sheng-Yuan Huang <syhuang3@nuvoton.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: hwmon: lm75: Add Nuvoton NCT7715
Date: Fri, 18 Sep 2026 16:40:40 +0800
Message-ID: <20260918084042.19541-2-syhuang3@nuvoton.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918084042.19541-1-syhuang3@nuvoton.com>
References: <20260918084042.19541-1-syhuang3@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sheng-Yuan Huang <syhuang3@nuvoton.com>

Add the Nuvoton NCT7715 compatible to the LM75 hwmon binding.

The NCT7715 supports an ALERT output, so permit the optional
interrupts property for this compatible.

Signed-off-by: Sheng-Yuan Huang <syhuang3@nuvoton.com>
---
v4:
- Split the devicetree binding changes into a separate patch.
- Allow interrupts for the Nuvoton NCT7715 compatible.  

 Documentation/devicetree/bindings/hwmon/lm75.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/lm75.yaml b/Documentation/devicetree/bindings/hwmon/lm75.yaml
index b48bf3fd721f..d55b8b7e49c5 100644
--- a/Documentation/devicetree/bindings/hwmon/lm75.yaml
+++ b/Documentation/devicetree/bindings/hwmon/lm75.yaml
@@ -31,6 +31,7 @@ properties:
       - nxp,p3t1750
       - nxp,p3t1755
       - nxp,pct2075
+      - nuvoton,nct7715
       - st,stds75
       - st,stlm75
       - microchip,tcn75
@@ -78,6 +79,7 @@ allOf:
                 - ti,tmp101
                 - ti,tmp112
                 - ti,tmp75
+                - nuvoton,nct7715
     then:
       properties:
         interrupts: false
-- 
2.43.0

