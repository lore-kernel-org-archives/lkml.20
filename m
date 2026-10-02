Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DBB472F73
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934338; cv=none; b=rS5H60d8+Nw5HbtearcxUmASJEGNqKo9EZhHM6A8Wb7eoCkgDVXY5SleS4pFpRcLS4BZQ1VsU0cpasaMY429HeZx0gZY/Gv8r5ho8NBagdAVDuRkbMFYUtK0GKtkNrYtb2xzVGfeLJi/groWL8klKcU6IhPSqtO9E1gjw6+JNdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934338; c=relaxed/simple;
	bh=k0vf9IJe5mr2xZ4za2J/iwlEqUm4UT3e4X4gEPnokc4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XBshMmJwYnea4feCUS+qHzlYO6SZ3vbdlY351ocwOEJ6UyecYZ7NDZZK3nkhNQI8iLbz7aHm6I3ucWm1vRqi9eGLuFbvuNd8xrQVHa+8FdNPzwHqCY5PqwOVZGmoJpb+VHejwsUjQwcny3byhR9dGWhQMqSvibsE1RCH9DWkW+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TCFjZQmv; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TCFjZQmv"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48affb828f1so2704074f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790934335; x=1791539135; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Whs608MpQHn0fcanZf9ChaNVLNdoG4FAnM1K+j26AR8=;
        b=TCFjZQmvRCZ0Ac3ECygeznRIGOnnIp7bn2P/4uVqZEKe9K+atDHW9uRtG+oKvEed78
         jzVsiyObjXzmZpBox2DvTqEEvphnqOGm7fdo2BWWwbIzTToAeHV3Xk2LbR+XGXj6nrrl
         uUs/jY/UmENn7JVFZi3bIZm18V0iiKcFWZh8XVFwi0Nt+trAhY7yPD71QoFwu7fw2HPj
         f5/GAq6A9s2Ji43qQLVFGcxCkTITfm4SI5gVzQD4w8RsdtTkQIpKM6PgRj2v33/ZKitZ
         frgUD1MVoHxQNyPshcc0ou/jVebRJiLWf9PL5nwaH2rJydQ+fqACKJ+JzJatHRTjGiHT
         HTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934335; x=1791539135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Whs608MpQHn0fcanZf9ChaNVLNdoG4FAnM1K+j26AR8=;
        b=oHPBKCmJTu1D5aGEjz1oU/kwSPD8e01+NcEwy8NrXAe91A5n5swh2uiMgpBXkMp/dM
         G1iDlkpiwAYKw6PFkPKekIil3F7fNfZFfhjH4GLguiloG2Q7gNkZD4WUj2hHu25Mq5kd
         jtPC39bNyAeMWhBS8dzHUpxaOJKTek3QECfo465htvYoYWUXxbJFn8CZ2WEZGjdo+K1Y
         UDQcjqsNBV7ieOcwOMDmuH7xjg06c1lSg74Oehacw05UaImN/6dVfApmD4ILbcTWZ5ir
         pGJGHKh0G71kn9y15GySKgMKjx49CE5tv84f/AZMYN8Sfo5sNq0ILnbruDgp+zzH56mw
         ad4A==
X-Forwarded-Encrypted: i=1; AKwUvBzKj3mfIad21bmy6uadakzuytPRu4GWrJnkSra9mitBfT8KiQNSRn/+U4hMfe2S3aJxP5XESpb8Si4s+C8=@vger.kernel.org
X-Gm-Message-State: AFuF++miPb1colOIGX3GF0PC2t2XK+mNHhvBMkn+WmS8ibbRmFVhOz1s
	rAHk5IcMGtkZbPa1/rb5MgsVItIayOD8iT7cnHMCGkUddcAGUuEqC9d7c7j62/NZ86UfGTW9Ysm
	Groy5
X-Gm-Gg: AYBFou2rTg+pRBgKwUVabvTiAyjym0iTdV57OTHnxQKa6zccU67HqsJgOf94zYfbwSc
	XYLLbnnpuPW/Hv9QbgjM8q4tiosWWabeVenkh4EJNoVpLk5v/r1Kc7wZLONKWTWR8zDxPJdFdvM
	68EV8lVwWVMC+Yb3WD8aujB6vFKqWH3tOy2Y7F/ymzLDtXSx/7hTaare3k3ewk8KTo2measS2rz
	4PJMrQDuvYz5Y2sR7c05YzfWnezP1+xL6verA5bJdN8nRw48jPbj3cZgii8isxueX9w/EkwfBJO
	tDazWueYu+JVooEeCdvMdq2M9pBMqACuGN2Flym0R9TXeKSFdAy7f8kmoL7bS+Zhk1w4jo3dsDg
	H5RNJakls+z/HcWC1yX5qsVgmKAONHknETIEnSNJ5jZGEAB0XXjq2vOFKO33dr0FQ5dXOo9rTxD
	Urm10N+G0cpEWN0e3KXk3IzlRYxwzgoP7RybKhfzj0w+OMSffu66jhf7gJzVsb/cXGHAxErW9t3
	k7GC6RjPTtO1NXzNtY=
X-Received: by 2002:a05:600c:a10b:b0:4a0:1c94:7042 with SMTP id 5b1f17b1804b1-4a027542267mr31818345e9.8.1790934335444;
        Fri, 02 Oct 2026 02:45:35 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280c8bb0sm72705635e9.11.2026.10.02.02.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:45:34 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 02 Oct 2026 11:45:28 +0200
Subject: [PATCH 1/3] dt-bindings: watchdog: qcom-wdt: Document SM8650
 watchdog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-topic-sm8650-deckard-watchdog-v1-1-7d7f7d71d88a@linaro.org>
References: <20261002-topic-sm8650-deckard-watchdog-v1-0-7d7f7d71d88a@linaro.org>
In-Reply-To: <20261002-topic-sm8650-deckard-watchdog-v1-0-7d7f7d71d88a@linaro.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=838;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=k0vf9IJe5mr2xZ4za2J/iwlEqUm4UT3e4X4gEPnokc4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqv307o/zudbjHuKF52tsKRiGR41jSsZ9EofxSYEwF
 u/xRq/SJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCar99OwAKCRB33NvayMhJ0RGTEA
 CSXVLhNJEeYoozS8xgfYmrDj3hHsVBLpx4GKI5vRjOQ9brQbqDsuGZFB0I5ZmzGnSTD2igOgP/UYAL
 WWfZbaHz1ZEqsJtAwkybzyZ5FVU6+KHdMjigaScGB7Pn4PwGsfe8ZVIiHO1OA/1CutAxdwxkz7C0z2
 QMt/zlnNVSHzb6H9Okg0BPOAaPM5ZjwzBkliVk2E/n2WB/VNVNkuY/0Pw0k3YbiACwiRfjayKy+9Ug
 OkeYhdi/OkLSsTx0kItUuMbB6v0yH1vwKBeS/Fol4kd9I0cq8EOX4ezKuIBT8H2v5rKyJbgvrisD2G
 Y7sFhEXb2f37kfoQZEIDqYi4sK3LtDPdeAg6Qx04lTPnEuUnPAXYNrhuLoMUX/OwggRo8WxTDbu89W
 MmAC2WGh2M1eG8cTTS6VImknxL0+AcgiTaBJRpj+WDMUpMmH7pF2yY3Twqjc90jVgKExJfPdBAYx1m
 Fk8P4DVcy7i1ZMehyFwZ7++3ajmuOGuZLSxI4TGranCJDCDLyJ1zp6PhAzmlZSBSlXUNVss0h4u03l
 B9hBdn9rvRzMFHqSVlozPelFM9dQgXbNitIKBhLrrOH/novqCMWWOCVy/rG+0Ktk2nB+tuPAGQ5g8b
 srnX3VvChZH02a+1glJ+98c3rmKIUywD2R2SnCbv4fo3WwEZV931zBs+m5LA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the SM8650 compatible string to Qualcomm watchdog binding.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 4ff61102e407..31f9dd24c29f 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -50,6 +50,7 @@ properties:
               - qcom,apss-wdt-sm6350
               - qcom,apss-wdt-sm8150
               - qcom,apss-wdt-sm8250
+              - qcom,apss-wdt-sm8650
               - qcom,apss-wdt-x1e80100
           - const: qcom,kpss-wdt
       - const: qcom,kpss-wdt

-- 
2.34.1

