Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6216149739A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591405; cv=none; b=BBPA8HOOzPVf+8UBsA8r0LFiOV+21c+pv+SQDgdZXH1WcFovwcRk1slfyb7GJaR+NBInX41+d7BtmJ+0kyYzm+yMGUYxcqyajcqFdAnOp+KeNxKNd3kKuqqcTf4CNKFfG0pg64KSxfICzFNKdTDUE112bXAEYJLCIHNr2sCKuMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591405; c=relaxed/simple;
	bh=8VfTkBWkjpfaxQV9oS3JobgsW3qmhQOCv+ke/kOugew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d7C07ZufVyWPLXTwmKCH1E6I8yH1GQfL+JyXfVL14ppfsrb9AmbR2U1iEh+8H59VJqrweqMM3Wea2dNjxZ31bR5yvQHNl2QfUovyi7+c10QSmRuedM4k4+EQPFHYvubhrHrkGrS4CEsxIFXv1pq7TLojjmmojLc6rU4KScbolzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FhZOdN+q; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FhZOdN+q"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0af6f9a1eso186303a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790591404; x=1791196204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pw8TmXQHwov66WertzkfdRoZYT1NeXWw60nKcTPEtnM=;
        b=FhZOdN+qu2lgeGJ3qj7dthFz7cjNFqBAT7sHZE0PHazbwum28aqAUcca/wS1UKsTBc
         XXiNCzd0rA054uLqTcLThtDCxoRn69iUGftV4zUKdIHu4QOepmN1g9VMVhKsH0fMb+/k
         kOBwSqOESRs9smKYt8h8jaRNTVChBdVl0wbpWe7SrwOONl+D6+2TbgJ7kaKO4ItnJnAA
         dQ4hiBLed1vJ7IUbE7R6iVHhF6pJPAxnatsytHf2dIiMk5Czoqhs/yT6SKPrA05oZjst
         2fTxfAZo1RvMH79inv8pPiFwlp6jfyrl/W3dYtCDor+VCEgG/XpKa9pqLElfrDXKhPau
         WrOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790591404; x=1791196204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pw8TmXQHwov66WertzkfdRoZYT1NeXWw60nKcTPEtnM=;
        b=lZPRWM2JrVfECbmZ8WpAFMH0bvjWYPh8JE3B/AYYEh/6glrEmDX3hDFhB28E2h0cO/
         0v000PhFUkGpMkZMV83cSMlni2GAaZVZOop7ngpyoZWOq1Th7LLanzACaKcD+Mu/jUm3
         /bWI1Law4AcN5n1Li/bnnS5UFISfAFUZkcIWChYquFfPes8Fr77SwJJY8wkdpyN8vWvZ
         0OOsv/fr2yYvC1tgf63+VzxXpCB8sjms9kinQNOo0Y4zTkIajYEZsDpYDP9DGpi7How2
         K6tvo4EKuY1l2A1ZPbGEnj+mZCYVWmNJ3hltI7gUFEfTaqMTJP8LvNc7AqkDw+k4+UZm
         RH+g==
X-Forwarded-Encrypted: i=1; AKwUvBwXDqXfDRjoPaTkg6cVB6830r8zlNW3r8TEx2rwDqwwnUSKLVvnOo96BvFfM9Gy8SpdQZkr3AJxyLK4K6E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGchTx/1x+Z5Q9+vpZ40+A5S3JwTNajqRWWZ8f2W3+xUL3Cgrh
	PReZaRttJ7eN6FuE89BagqQINwdq7YH4l13LUzku9iyylq1Qs7/Y1snO
X-Gm-Gg: AYBFou2Ga1UMqJiE2YuipocUVaRNTHSIT8pQOfzLvMoh1W39YNhSyc4z6YK7RWcWF9S
	7ZoaibWrVvGV8alsB5xHMyLNIivtxM80dZAh+Iza+I3e1FNdY9+ZMveqs/Wn6xnOY1pBil37WS+
	2MzunNe7w5uixljmiIS2Dx161z1I+w0og4v5WIN5Tg440Z7ECxMwj0f3mVdU3vH0cnOLcrSIkc7
	Z7CcslVX0lFv+O3dcdtWVtyQsX9UU6nSpzEy+XKTasAOBvBomUz01m19ZrwMgfmCxK3yH4bwIyb
	KZjHilZfC+IfhU+fBvjHlQk9aDOsWyBz1xKKP6P5msFbqcFzi0LOXiLpQsA+h9mFb7l3DG0tbV2
	oPZTwIrqpZu8O2BL4Pc0m4brtn5zZQ/n5wxvYwhDP+IfjPvx622ZuvqWkagoKxTPHujypRVssIp
	5ecSv5/aKSS3M4dEL/Xu57pqdV0l3F8UR8yRr7zIw/r6FaGu2KOVFd0dDP/FsABf7auQmGwLhoX
	BWSKjRd111v+Q==
X-Received: by 2002:a17:90b:258c:b0:39e:2f57:67c0 with SMTP id 98e67ed59e1d1-3a0b2123b70mr11848301a91.0.1790591403694;
        Mon, 28 Sep 2026 03:30:03 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9355e49sm20234282a91.4.2026.09.28.03.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:30:03 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: arm: qcom: Add Acer Swift SFA14-11
Date: Mon, 28 Sep 2026 18:29:41 +0800
Message-ID: <20260928102951.18369-2-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260928102951.18369-1-liujianfeng1994@gmail.com>
References: <20260928102951.18369-1-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the X1E78100-based Acer Swift SFA14-11.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

(no changes since v1)

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

