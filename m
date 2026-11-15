Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794773975;
	b=rqzUOXUGTNjtfjVHi+S11uJf52SJkony3jjs5oYyXs86A/PMe7xdnHmcgZiRRxdlX679
	 fYc6GlVWoQ1od8y7NUl0TTAlGdx1dBIBXEi9/uUfGvvIkDZB0k72RfM6d3a8gAl0/xnCG
	 NWeabJhW5YVcOC00EsEEx9eAIhCQTLNyn8HiQOHGdH6MxUE//QrzMRW4vZI77rTWHf7be
	 Ai5lVn0N+DkE6T0LEFnr70aSyaQ0khFboT11lmbaBBorZWyGrvY0Mv2AzcklZZfZDIqBy
	 46u3YFxy7ebjumPffp6Wpl9ffeHmX+fNusKStOUvGvblda17Yx9VmN7duIR6PjoSr2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794773975;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=jhp3k4po6AbyaH0mBS8WipM7wihRu2Y9/YVwU1QZmTA=;
	b=XQxz5QscHnWUPyiZ5c/kfMeMPWNfrPiya3yo8VQm4D/x9ahzlN9/Vjb8WX32mfXdRKB1
	 H4XcMhmPxnoAOqdcUE7k27V8gXnzi8Fnr51scfNUQitgYOEj33w7Yo9DlVrA4UpqaMj4P
	 ntCEenGs+LfPN/WrFDlRn1CmXva6mM7JPLt8H8CCC554FSsiNy4YQbjrJIK3Sbot24zcc
	 6gC7KvkdnQB9KoGiH6MpkGrtqDd0lBT4PX/QE+Ml6dcFnZCQDmPmZndC99QfEECgyysN9
	 fgJEhtYGKLeFiMjwIkEHoEnU3uMy54Tnm+Y8vCogB4y3bTAhdQj3uuePDsZS6GCCp2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YwZKyvDP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E2C606A329;
	Sun, 15 Nov 2026 20:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YwZKyvDP
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794773975;
	b=ydtBmbCad2eGsFmjQpBoDmSBTzh1KwdLi0d4NGcwY6Qtwk1QT585NGN5n+0mIUMthwB5
	 owyffZEPvbNXDBSdkzhXYUy6Cy3UwT/rvy7OZ8Nk3B3uEAcW/q9OQLVNAp3utxmirwuMh
	 zAxuNqwQPzK0Fl2S8nwAI9TfmgKcf6nL5Uv/TrfX+GHtuDLd+Autw0Z6JndRdplsPOZEg
	 pO8l4RwJnP08jfgjWfNrI16W5+RweMrsXnUmbK05b92PZhskLKnEw8vYIY4Hqh/jd/huN
	 zdf2IYIHWNTTjjBjGXwnjybcOrJw7BOkDbVIwqW/WhShXLYLq7B7J+KO1NhYfGB0oMQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794773975;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=jhp3k4po6AbyaH0mBS8WipM7wihRu2Y9/YVwU1QZmTA=;
	b=UW6U0ZaUeYVQLdnluh9lF8uffEZowaKvwtgy9lDTNMUaCQy/g4IZ2fzkahrL7oVDNM8z
	 Lf57iOl5zkJA19I63vWOMD5Ey12StWfFDmtVBrHWH6zbAsewYOlzYER7pqL0CubqHCuAP
	 1s1SYIhhOZngg/ao/ZBq+qBTyqvYNjv1VMB4iQETRoY6KO5uKMnI7NH1XFOxqHgGCYmNG
	 kMSyCbSeHS6pVVW4eDXvcfhp0IK6n5/gdZURZiqcI4SLuhNToYYJubcZLaMpuvyAWMgXv
	 FGeBxvRYnywftNRuDgq3dQJWLYqFb5ESZp+J81rxsXfewf2XY85QuX40tLQ5BE5N9iA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5E6881F00936;
	Sun, 15 Nov 2026 20:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794773975;
	bh=jhp3k4po6AbyaH0mBS8WipM7wihRu2Y9/YVwU1QZmTA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=YwZKyvDP1+OtQkIR/LQRbYj7aDImNeXuJjIfDzf/13FJ31Ng+AYru+gmpFt1hMXbp
	 Fr15hGVbhofNpAacgEBRJj7jkJITLlTzbENO2gySzCwufIyjgZ0BTzrb9jmiZIErYJ
	 pzaTqsMwWluC2WOqwQzdSjF3gc17JgttRkHP3qbJpfMCkAe+AO8WUyjP/UW4j9RwVq
	 IG+V5Yc4wKBLe5bJ0/fTrSIEzkGLN8CFhoEYLHyOFf1ULKiCf4jPcCaONeP0pcX7gO
	 F1YSClAZ15982+ipPsJe2a5gk+0xZCoJAJR70Z8dzLIVx8AGQ56/a5RRiVng35OqrD
	 uIByqZL1gzrMg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E0B8D4A19D;
	Sun, 15 Nov 2026 20:19:33 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 16 Nov 2026 01:49:33 +0530
Subject: [PATCH 1/2] dt-bindings: display/msm/gmu: Document Adreno 829 GMU
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
Message-Id: <20261116-molokai-a829-v1-1-fb3005bfa921@yahoo.com>
References: <20261116-molokai-a829-v1-0-fb3005bfa921@yahoo.com>
In-Reply-To: <20261116-molokai-a829-v1-0-fb3005bfa921@yahoo.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794773972; l=957;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=TNHI6kB8zkoWb8BkFCvBAj2zzST5XP640DJWWay2WF0=;
 b=YyrTg1dR3H584kp7wlreUdxhNEmOLN6rx+w4322f/WFiX1ukgBrO/CTkwFfGC8W4gIQLZvJyK
 Jn451Z6VA7rAsLlW2C4uwV5qcpB0lroI3RBckRGKVnsmf7kTXaYJ8Nw
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

The GMU of the Adreno 829 found on the Qualcomm Molokai (SM8845) SoC uses
the same registers and clocks as the Adreno 840 one.

An LLM was used to help write this commit message.

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 07f0e547b43c..2599eca08a36 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -337,7 +337,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: qcom,adreno-gmu-840.1
+            enum:
+              - qcom,adreno-gmu-829.0
+              - qcom,adreno-gmu-840.1
     then:
       properties:
         reg:

-- 
2.56.0


