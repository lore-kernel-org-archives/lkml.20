Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606291;
	b=UY6DVR8cgws0yfC3nov5DWCbxspHe+IOoZkHqaUdLiluQyS/NnYknp6Aenm8iW1PSuJp
	 Z9kIxOykUNlbwZDl/N2nYE+ueGKcMNuRFMAiH250dTElJK7Qx8sCCdj8+GCkjmv4YJdSH
	 v3suwTULDXifxyM8LWGN9Rf83YeiGS3AZjmBQ3ybGCM1hiQxz9kSGYm+oA1U4p+YCaF54
	 ibEncLHXz8i/jTi8CKJ/oeBTJpYHkWUcUa9gmr9rp+/8Iqm0PTJAjmuNbmHQigSUB3vAB
	 5HiW3/O+ftsCDQ0IEQnICoLgHz2MPb7vNTki5oFJvbL5+MNKogy3KHfr7kaKhlqvMPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VSNciQwXoLzNC38H4Cu8pkuiuhLtNiZHzowcIJLxJLQ=;
	b=nOzj+nYmLUruEbmQNpIbQBGk7nfwjJU4KFJfPWj4wrm/FGNh3cBPdMUB2mWDEDy+u6Pb
	 GBgCBfv7VQ9YtziDLHGQXU1JQ8gz+1bbp8V3TSv7IvdOPgsn3uIX05vTbvyVgl0jDr3dq
	 7v5hWoq3YsZjMo4BK2lELcR8Q226Sdx+UwVtj9uTS4sR/VriW2+Cz4yMEKqJ0NqjnwQ6S
	 iZ+QuoUcwBL8d3gL/j/v0Uxre1ArYIj7UJdXulHi8pltJdEtkMfQjw/HTxz5xGxo4OpHQ
	 ApvQdHpH5ONkTUKirfvffWi+kUbtihzmtcEMiQE1UbF/YWmctKqAVgQsX7rXDe5Egow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="nhOwUvm/";
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D94606A330
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35D94606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nhOwUvm/
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1574662f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794606289; x=1795211089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSNciQwXoLzNC38H4Cu8pkuiuhLtNiZHzowcIJLxJLQ=;
        b=nhOwUvm/CbESYpvABc6bNV4x/SqUyA7LVECFI3YGDJDEH0wgu3eha8ut6df2uzN5bw
         o6Nc0gSzp8VX54fSjOyVQDKDWVvSHSHBkbG+EqDg5z6tAnAR3hJYDpe6WYF2PHIJBOzF
         0IL+2SuX6exmoNCwgbQxOKey405yshwiX7lL4A/kmvahqR8mm0pn4YsYlQnSNWDL9x5w
         BixJAAEASN/aPt+VKfmZzBa66+mrG58BGauwdZYjQFQZsCSBjxuOPTOBdxJK4c96Mdnd
         J/sAC9ZChBGA5OQFX6BdJeuEKL+iVapjlX2wXMViNzheJR0P/g8H9W4F0ZNtjvde4TsO
         Y0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606289; x=1795211089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VSNciQwXoLzNC38H4Cu8pkuiuhLtNiZHzowcIJLxJLQ=;
        b=Ue+jlCxWaCNuBcT9JLoHOiUymGgONBtrdYoZY+39zh2GUwQZE0m5yTgBiv1T0eLQSh
         TJgixWvtFMl64mJhTkLlHtgk2zW5ojkKwm163Dm6KUQXmIuY6vMPzFY5MLSSjyCG0FWS
         xXRF5GTaN5JIEKBq3crxyThYOCC+iMGPlGlyqYSKkweeGfYA15tiJWQcwDtTdsywIsXc
         u8wUvuF/s0y9WQ2xxuqYM2x917B1KmpyM7vHNCsTSA2nXGZ7toHy2st3XSC3heMmGQa1
         6qocFmo6Bn/qVRTY4edg+kTrSDQJsKfVSkMmL49OfCXyJEgu1bfHHDymID4KAUoqMzBK
         8KXg==
X-Forwarded-Encrypted: i=1; AL+hErFb2z118x38nqiP1I0eUuuPkWJpdDYckK1TH9LsG1mf3wij3THHVl86HCwtzoVDC+6Q9yfYeM87upgNl/0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hZGqjItz5tWhs8rOS3zvRv6pj5qlevPy50jPVCvFoNgZ+DtbM
	fQEkF3Yt4ani941aqszN2gtrs84zNNgdIu1mqiT9Al46tZp+1ZhUX9rQ
X-Gm-Gg: AYBFou0rF8mt3yKunw3ImhlPMbORwwGnNXJIgB/z9OTDcUf2LeVRlIQvciTvhc11GP2
	PE0CpxiUeYRLGZMzB3ewgrZ6JnPoN1At4acFzzcu9bLGUC1u1T5CPXwWc5JQ2Ko3dZekQ84CdKp
	lFazcQIWlv4tM4PWvLLrCxmUWq/XyfNX8qxyVFPbZB5OfIY0yH62iQljL2Lze9MTuvtMO0MWPT1
	POSX6dhYwxSV7QdkBDuxyJSbjqzN0hRMFoDWaWLKJmTqdhsExAGDrD1JyFCIhfwQW6Rora/dQvU
	B7sgvwpSa50X2QudUyX1/feWofkSf86Vrxi0rruLyOmzZEc6+KEXPfXjbZEbVNRvucR9gJs7YgR
	xbRzqu59Bg8KYrrNxLQmnuK7gydMNz/Ipzs5M/Pqdk90OZqsdMFVi/4vOt5AC2nFtegtlgwODPZ
	wVYvVQy5+xBC/rLTaGh7OAGzm/JQZoJQH03AD6gq0Huf2Cx+qzzrOSPQd80OK14o8ePK1rXxgAZ
	nHLlsLdTmtGAuP9wXzgJcQAkZ9kCO675O+KZu6YRzxc1BhZuLoFrDwi86kR5To5H51eb1WQa4A1
	V8QwWN2/8TzPxd0TWQsibD+d9QWEuPNmnjhi3e/FZ6C4lSDQ7V2hZR+0VXOk4BBaIxiGarY=
X-Received: by 2002:a5d:64c9:0:b0:48f:ead0:631a with SMTP id ffacd0b85a97d-49c72ba5d3emr8894959f8f.47.1794606289387;
        Fri, 13 Nov 2026 13:44:49 -0800 (PST)
Received: from vivobook-s16.fritz.box ([2a02:908:e843:f280:6cae:291b:a1:8362])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c8d286480sm11644595f8f.7.2026.11.13.13.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:44:49 -0800 (PST)
From: "Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
Subject: [PATCH 1/2] dt-bindings: arm: qcom: add ASUS Vivobook S16 S3607QA
Date: Fri, 13 Nov 2026 22:43:40 +0100
Message-ID: <20261113214424.220241-2-ingo.kubbilun@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261113214424.220241-1-ingo.kubbilun@gmail.com>
References: <20261113214424.220241-1-ingo.kubbilun@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the ASUS Vivobook S 16 S3607QA, a laptop based on the
Snapdragon X X1-26-100 (X1P42100, Purwa).

Developed with the help of an AI coding assistant (Anthropic Claude),
which drafted the changes from the Windows ACPI tables, existing device
trees and test logs; reviewed, built and tested on the device by the
submitter.

Signed-off-by: Ingo A. Kubbilun <ingo.kubbilun@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 7ffa4f69987f..2390568de805 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1350,6 +1350,7 @@ properties:
       - items:
           - enum:
               - asus,vivobook-s15-x1p4
+              - asus,vivobook-s16-s3607qa
               - hp,omnibook-x14-fe1
               - lenovo,thinkbook-16
               - qcom,x1p42100-crd
-- 
2.47.3

