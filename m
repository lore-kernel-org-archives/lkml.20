Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794549399;
	b=vUhz4HYkqmh1mzJ5X3Dwshpcugz04xBTV6z5iR+bOMjwmBjGI7N4WG8jVKkEIzL9mgjH
	 UJPCJ4uwJyLj5nPrPoCnI9iB0CGqwZ2+BkEq0J2HXSVQvTsqZos8m8jR3l+F1iA4bNA9k
	 6V82zEy8diI4a4UBbOruR3TnUe6gG3hd2q3p9XG60NhTMVwm1p4tl6WfYFQ5Y5L2lLU96
	 znKaUP4pX5aolyVFClyYpuumFlc/Tj/eYsqhYU1DF4wadzfdH6AdhokAUxcN9XNofr6rR
	 Lj3jDE+wCpj2qdx5t52KZQOC8kQIj0jrgPhLmN0NYehkizag+EWQheAqZKVTdEVfLTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794549399;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4lQDrfrdQF+odj57Rd/7QUj49vlFmnUO3XKdts9D4TQ=;
	b=sgHbhppcNVQuTNmoQZwMwxcqrMH0o2OIxk4MPGOPzXSEqeXnhxrKQVwXKnjgoxR6g3EC
	 tcQxgIokK+w8HAUiWSDJ0Ys0uUt3aZ3ZJqrLWosloNnWlca0HkUm6C+ZuArQrVDwyHxDm
	 C8BhcpiLMTEZuRv/dhobBiy5S2S4XRVxEOWLk19whXG0fyVfMA8m7ZhaXCEEcwBi0p4CS
	 EseA6iAB8Yn9UXhzRI11VzCrkP650jF0pZ2x9i2GjXaHuv/FXReFn4MydagCXtNc2f/ki
	 YArb5LbG9tyz1ZqEKQcQKBoYhBRS2asSBpQDDlYCDy1H3ynIa/ZcLG6UUsAiE6LxLAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E46lI7vI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F28606A336;
	Fri, 13 Nov 2026 05:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E46lI7vI
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794549399;
	b=on1yyvEiiv7JwjazYYZAd2kX2UGSenqDZiPqmiHPWRyBNLf6ChDEh8/KR2gnyfZ9nG3A
	 MSHiJIU9PhZ0Hiw7QCQsM5+eyK2h1w2AignxI1WLE3CMHX0eT4KRCxn1SOG424ElQIS5N
	 ekiVF+a0wWovXfgU2lCPxyI0cKISpCrFQdJEsIi28bcWRqU2IoBB8Gug12YQZ54YhRKnO
	 2UTojCbcsdFT35Zq9gmyfYIKJsURgcmxiaqF7o00lFg2mQX+w+C0R0t29N4vuZrKN49Hk
	 JNr3kQuLkmqj5C404e2dLgIuvG3T6BwfSx5emeNvgtqZO3JICWQIHoC9o/7KtnvScoQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794549399;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4lQDrfrdQF+odj57Rd/7QUj49vlFmnUO3XKdts9D4TQ=;
	b=bIQDcxJUHikq8lxv1SOJS+ghbi/sa2zLiweeayd1/5WAWAQkF/40T+lBFKCAXHY3ZnlS
	 MxXbo/0WYQQE3k+B3+Sde4UTq1cjG2gQc5NVT60Rc8tpqH23koTNxuoDzk2gFhtvsC+4m
	 xEa1oaWnYoWRybxX4+vjBHnpSpyRLG4zF0T5k91v+MWhU3kCyl6IqZC+wfIoI3q8zvork
	 FPFUxU6kDikv7M1JLqG+093Cs+oQdW6are9DweWXueZpSjJkmUJeU7UL3BJrTT0Hn39qa
	 TizAsIUdrBuGwkWOZCfYMa+eTL09c557OtVzGWzfzvDIaYy0jksZOYmxFuYg6rmL6iA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1CD6A1F000C7;
	Fri, 13 Nov 2026 05:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794549399;
	bh=4lQDrfrdQF+odj57Rd/7QUj49vlFmnUO3XKdts9D4TQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=E46lI7vIdAOyBIKFN+EcJ5FNx6CJYD9M6A4YCcymsDv/87hn7DTXa3znyE8Bxc2iR
	 NTTfOsUkPzgYv2k/UD8cxBCP7N5TqfrsoC3QaY6nW8gq0G01JqvW0yTOoDCR0tQI2h
	 bcpAin/DjZSqd+RrF/RofC86KoPtsNmyAa75+CW98wMe+JP3XMfEDnT+D5Eb5uZW89
	 XqIasrNEfHHFxLJO/ytcFzDKj5++AQBNHdtXgTUpzPYvgYs/Fczo1IHgBYx/0JoUkB
	 LAKECCnzuU7HM5q4FX1y049va7nnTHJTR97woOYGKZRJrHv/+fASbQRNlql+vr63in
	 ygTJHyhklf/SQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9B8024760F;
	Fri, 13 Nov 2026 05:56:37 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Date: Fri, 13 Nov 2026 11:26:36 +0530
Subject: [PATCH v3 3/6] dt-bindings: display/msm: dp-controller: Add SM7250
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
Message-Id: <20261113-dpu-sm7250-v3-3-30bdec59d204@brar.si>
References: <20261113-dpu-sm7250-v3-0-30bdec59d204@brar.si>
In-Reply-To: <20261113-dpu-sm7250-v3-0-30bdec59d204@brar.si>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Ishu Brar <patches@brar.si>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794549395; l=963;
 i=patches@brar.si; h=from:subject:message-id;
 bh=AcZp8+cV6TDy361VSXZ9EuoRu2qfcwVDBf4K2rgS/Lg=;
 b=49nL62R2ZVcoSVeaVUn4mObj6aSRGxlORdsPdZDMjTPmVGcEYUcZFnc0f84FgzFxsM0D+zXw7
 juLSrBFAyifCoPiSOYtFrON21pAhV5ctpDDFYkDbS1SqFiMnSZM959U
X-Developer-Key: i=patches@brar.si; a=ed25519;
 pk=Ds+E23E3ntzjPzuBDyVRkOouclcNI5k75R+N42yJtCk=
X-Endpoint-Received: by B4 Relay for patches@brar.si/default with
 auth_id=1189
X-Original-From: Ishu Brar <patches@brar.si>
Reply-To: patches@brar.si
Content-Transfer-Encoding: 7bit

From: Ishu Brar <patches@brar.si>

The SM7250 has a single DisplayPort controller, the same as the one on
SM8250, so add its compatible with the qcom,sm8350-dp fallback.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ishu Brar <patches@brar.si>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 094a6383bb77..d535e090ea2e 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -53,6 +53,7 @@ properties:
           - enum:
               - qcom,sar2130p-dp
               - qcom,sm7150-dp
+              - qcom,sm7250-dp
               - qcom,sm8150-dp
               - qcom,sm8250-dp
               - qcom,sm8450-dp

-- 
2.56.1


