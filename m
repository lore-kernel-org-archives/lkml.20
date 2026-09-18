Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF2E4A33EA
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789716361; cv=none; b=hQ0ITO6LJAAeLUx0OaJCp0WVfAlNuWsZrLh3cZ2Cqobucq/G3L7LXzUFqWM/yYAl7R5KdAY6uemGjL/AVtR2p4/ljWVTVtki1/6iUjAXebwp9ffekcamp1lgTfT/44kMMJj1w5ZCRXMzlmdIx8RUc/OxdcBGQHzHJtpGWPgZO6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789716361; c=relaxed/simple;
	bh=pCk2J+fgptwUO4ZKmoJEpMZTEt2qL0pw+tfe5x+LU3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eL0aMfiNX+7a/R1oz2HMG8P776Ev79oA2sDn77jPi+gvPQTQlSUvLEDBQ1MKye5ysTYOBak5axZd59See+9yKCAFg00mKwcl+3hm4ULKfoq6AkMqg03PAO3pixXbmGDftogv0bn8yFEPfmLDL5rxat0UGnmeQ2n1LMYvmytcV6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K1890ecV; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K1890ecV"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so2338585e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789716344; x=1790321144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r05tTilDhW1mEwckTpWxKtNRtIR6JTrQLuNfaUJ+HZk=;
        b=K1890ecVGbPQleJ/P0SbVIRca3Cq1bmFIZRaGbe7atg5XqcjRaWOkW4FzheXCLh1Ay
         /XUxqsM16QYoyXZODrHjHwwCzWFqjqdzKDTxz8vQ/ZOssRBpOPOkJtEzBlDiH3X3xUxX
         SEkd2dQoA/B991B8OkX0IEPvznvwpMVSVLBWFsKzIiqp2/OnN0STVyT7yTVaVAM/javQ
         bauIE39xvpL5+r6GMl3tMeDze6wrGSxLBh7+AXpT7rA1bKxx42U/JG7zD1VEPB3tAFet
         6I5zP/8v8NsJr+w4nJ9bhCZI7Puqz+EDN+G2/8KAgmGlsJWsF3eJKGp1WJCvT3ZucPnz
         li2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789716344; x=1790321144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r05tTilDhW1mEwckTpWxKtNRtIR6JTrQLuNfaUJ+HZk=;
        b=PL/yP/7MFxvhEonfHeu+nqvWmN2uN9Nw2doG5P3jxvrolUR3eCJuXLZfrMAbiJeJCU
         re2/11B1H8daJnS1cEj6Hq2v1zrsAyBzx20TlNMSymdyyfk6gH9ljyH2WakOUBBq8pcC
         uAY672zDkQBOsa6IFwnpmPmC1HjUm1ZKEMtgumdzd9JNTTp7hrWyOQpGMoyxA9Iko8VN
         Ok0duasvkwUPHrp7tQGyF/SjwtKeDgDAauLMWCKLgdNcVZcPsKYZksyYCDbgU/C8agXv
         AtzyEN7Q+R7iqmgItgWSnJDXYHzNPmPzJBYUaIUN06jjTVY7Q3eiMcXm4iVq18DDDQf4
         RPYQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3E6A8648x/OKngGVzeft95JEjZ4KBEAsk2spCPS4hI8bQRKL8TQUZC4TlWIYGPxffBrvH3daSPSHL2zg=@vger.kernel.org
X-Gm-Message-State: AFuF++muIW4uczwRm1BDv21/rV4EdiaAEE85Xi7mJtHS5mMZEahnorxb
	nyczODwPqhDqvCGwomdBQpqBk07nd1qq0FeSnEkAsRSF4dNTVyMr+p/DBbxvzeWNhSsZ4BBipsz
	0fKYS
X-Gm-Gg: AYBFou2TiPEWXVYbCzriy0cC8qtq82iblHGfTxE/+rQyyFy9+1eLeXQAoovsXaPoCkC
	mwgKQvJUbwP8ckxqveqFecy0RZTjZF6m5N6cVxiPXdJpmw7Vpq6R0ZPJjRLuGO18w5yVxxM/zFQ
	7B6RWVHQXO32VkFYIkcisSh3FupQUm8LMHhmadjqO3Wxr1eRJeKmmyK/DbV5KVL6HudQf1/xjN1
	+nXMvva/VoM33q+EX4OLdGbDd8R/IO8nz5nv1cFJq8opC2dn45YPWBsLF69UE//O5pothjtSxWU
	KwQ/J5gHNH1wdpKc6k7905UXLZqbviHVY9B6cxPjNzG7cRDrIY0ZFxg2kyMPrqRj8E5j8Nz0Xuc
	BGP9qOIntN1hVU6+SX6xs1xcj/LXxbz4pL7/8i/bNInIFDvLDmmuYaIbx7FQdL2UFh6H/4kx974
	A2/LZhtL/ScbNGQDhP8yaRXtGkugUvYykBu7Iy8MmiGB+nwnX+1Fl9VPdcOwFF5U+fwLPhJxUqB
	7CtUNeOZ4EBDw==
X-Received: by 2002:a05:600c:5489:b0:49c:dca4:94c with SMTP id 5b1f17b1804b1-49fc573579amr35922575e9.13.1789716344041;
        Fri, 18 Sep 2026 00:25:44 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd2160c2sm139523555e9.6.2026.09.18.00.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 00:25:43 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 18 Sep 2026 09:25:37 +0200
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: add vendor prefix for
 Nexperia B.V.
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-topic-sm8x50-nex10000ub-v1-1-5afe06bace03@linaro.org>
References: <20260918-topic-sm8x50-nex10000ub-v1-0-5afe06bace03@linaro.org>
In-Reply-To: <20260918-topic-sm8x50-nex10000ub-v1-0-5afe06bace03@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=863;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=pCk2J+fgptwUO4ZKmoJEpMZTEt2qL0pw+tfe5x+LU3Y=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqrOd1Jjz+DH6paCzn1qzvrr+PyJ6xL4NrpJvUIwUN
 Nf2nocCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaqzndQAKCRB33NvayMhJ0ZeqD/
 9th+1lAA58IGfrcp75YdhYNAWOkJceB4fI2cgJgbGfF456B5mHlAQoRDFa1p1+5b4r1qB/wsVRR5Pa
 IC6iN9qr9oqEg2pt7GfQTMN0Sg9VGt9R6zyFV3XpWhR8aJfRiLU17ju+1uFAbNidFOqiQnTxiKY8xZ
 k6Lb8yk9o5xamipkTgrMzPBGEKQ75iFpoiPa/7XSjvaWvy+uapsI+YVsWnupkHHtGoP5Uy7+4yvkym
 ewhYmnlbzoDmgHV5O7+acnZ6cPANw0R/cWmWYz5K09eAFOHS3ZJs3ZIia2kS2nCn79PKxHsivNDB9u
 zD9qgo4yRWFtlR6xibv7JnFMvbC+shmKmlgxq0b1yBQDecMGMYBYnYfOmjjdJIIuhdmJCglUNKmLA/
 pFLOqfjWqQyYqh4ZHNoiku2bGKes5ycfvrDOdK4gZg/Bigcmto8PNE2xF+fJsZAmrqwoM63O1tIgYe
 MbQUqi1HGR48AAIZnLAOfQIQemiDhqc+G6OcCkShzCj6z0NTpqxc/SU640xaaXAXp30srJCNpiAPFK
 kaABxcI6KvSOHGoSL8suD7ljStIYfNOvxdheb8ugFsT9vWaRbhV8Zm4t6P1qVWLLtLxHyvWKFX0slC
 5imtmqOli7lWNUngPPtQD0jOinwYV5vGbmHFOPQ0igLxvhYH/vUxbKizeRmQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the vendor prefix for the semiconductor company Nexperia B.V.

The company website is https://www.nexperia.com/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..9103ced78b91 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1192,6 +1192,8 @@ patternProperties:
     description: New Vision Display (Shenzhen) Co., Ltd.
   "^nexbox,.*":
     description: Nexbox
+  "^nexperia,.*":
+    description: Nexperia B.V.
   "^nextthing,.*":
     description: Next Thing Co.
   "^ni,.*":

-- 
2.34.1

