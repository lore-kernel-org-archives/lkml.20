Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72925511E71
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677925; cv=none; b=gKmUqCHvLBF6MFbTOZErINBCMvc654aLitDkkfkEFbIjENrZ5w2ktHIfrTuEIxY340XpW9l05W3wE3VqIukhILBImuRG/qdLERQF6+C4mfTSPnD/BiL3RiXLo5naGVnCSu4gplCkxvvnHQhOU/IZwvzCBA00JXEFcgnLAmyx/eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677925; c=relaxed/simple;
	bh=ArQtZ+9cT8gS6u0y+rbtGV6l7T9LtDxkG5F67zh2qbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EyzgNbwM5mHO/RaHgxd8+Q76PLCz0y6/qE3ayAPdC9cqPDsoE3GVXmxACRcnv1chyqIC9QYl4+zMMhmawJLxX9TCX6CqWKvgwWiuGBQhOuXVs3kMKWaKzKfb8ux/suLlG32+RnpgQkeBhJKEcjO44JYxeNUKSe6iPgnund9EKBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=adkz0bBT; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="adkz0bBT"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff23d81cso2693885ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790677903; x=1791282703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9gKgYa/panWCzY7t8wKelcXz5le9XR8NMGeIjQu3y4I=;
        b=adkz0bBTmbl+aNAMAWwPNelIdldyHnQrmqhkfOFHzNifJA4hvd4D/ImXavAgYmoQTe
         yC3pIWz+qMs/WjSk3EJcjYdDzmMhYa5QFej3LzcuuDzFf5SxnQbXt0O91HEq09z2lJHP
         Lgnly6nhU1vhAqZ2dfXmA69Pv246l08EYNjFE327oK5y4DWrsrGirggK0u8uPUzBPDql
         8C15kYaGp2132hnhcbObVv0JhOP2jaF+kO6x/aLaQnBpVZN5pG1adf9pYhMcpgthM3MP
         30yPKo4nJdoYtfFkrD/NtD4foOcRMgAjUMSAiFFSEasJ+0FABrewsKG5L5d5ScCJW71s
         7aWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790677903; x=1791282703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9gKgYa/panWCzY7t8wKelcXz5le9XR8NMGeIjQu3y4I=;
        b=T49HGRZAUXdM5jk+vtgNYfKWnrQZDW4R0XBiNSl+VQDDIsTudd6gnSqhvD8/ixpAsd
         rtLNq+eIukN0zUV87rxUnlOCu/ZiNk+F0yzyPZssPW3UTrhVCDA0yrL88TSvBxrNxymw
         zKu5eW0fa/Xknn+zXUq9dWH5cWytN/UTA4RbgM07ZzjWFhR260bhfXjtY4foGUK35NgN
         gGSsTddggOl6vJEaHu/R8cSTJzJ5f9q8Z7j3jAr30OB8NfloqfhKhemwpT+NK+xDjI2G
         xKxAKjpS85RDe07tT5REqlv5HuFeEfV2XOmV/r6OidB4HyAXt4OtnCDOX2AYsiOpg+Yd
         pbcQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+1JpVyy8dIMVDddWt2OOzZsXN3tP8s2EhNrTSze/NQrFEIji8T8xATc8wrP6I6XeThOqMlHl0t/FI4e4=@vger.kernel.org
X-Gm-Message-State: AFuF++mLTeIwksOE8c/pS6+uDY31crn9sfModo5GXAX22NBlE9TyJvtA
	DBoz2wVDAGYw2aJOaZgtxED4iImGHuhYufB9NnYgTb28SNpXk+4mxP4u
X-Gm-Gg: AYBFou3TBppBf9bm+9K27awJKY0utV3YRxMeMOzKvc9cCagwxNmomlbOMT9HabuqJWQ
	z6w29+4IcwIHIw1XMTKY/hyZHLzp1Z8E5KJ1mYaop4Meq0w449pyFcPJ/MTCMkPVndODFiugFDy
	K6F60isT9W7u9y2lp0C5x/R3J0YXN2nsH5AhTtj6efCwqI+sxz/j5wX5cJO1F4+s3Ql8D198WLf
	XBd3t4ep+dzf9XotNSnW86eIrVmtDQ3UOd3runRyMIHKEeDGFPfXlR0WPpcqFAbZpYK1bmlXENW
	3gMFDpf0warrB8A3LTNKs+Py/mN3biUk26/6bOWu35L624dkBU8vrPJPklVNX0ppZCgwYuIdXL5
	OXueOS6F8TQmuHfL4BUzf8PQJndjuEywky0pmU8BTcW8UkS0+LQOcLw8c0zp9dKgGxJgTBvtwYL
	kl5PcPXBRDMj3rLUqpENbBdF+bU+A7XxgumIMd9X+XbfKqWwBxH/CkyUREam6licWv2TlL7unnF
	hrn0/A3lK9XIQ==
X-Received: by 2002:a05:6a20:e212:b0:3de:50df:7faa with SMTP id adf61e73a8af0-3de50df9a66mr11320741637.1.1790677903224;
        Tue, 29 Sep 2026 03:31:43 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc78791c3bdsm5901239a12.13.2026.09.29.03.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:31:42 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindings: arm: qcom: Add Acer Swift SFA14-11
Date: Tue, 29 Sep 2026 18:30:26 +0800
Message-ID: <20260929103053.10241-2-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929103053.10241-1-liujianfeng1994@gmail.com>
References: <20260929103053.10241-1-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the X1E78100-based Acer Swift SFA14-11.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Changes in v4:
- Update patch mail with commit changelog

Changes in v3:
- Change compatible string to acer,swift-sfa14-11.

 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index e6b123ad58c79..651a89b258351 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1204,6 +1204,7 @@ properties:
 
       - items:
           - enum:
+              - acer,swift-sfa14-11
               - medion,sprchrgd14s1
               - tuxedo,elite14gen1
           - const: qcom,x1e78100
-- 
2.47.3

