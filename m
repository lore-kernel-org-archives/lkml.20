Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864297;
	b=mnMOws9roi9HuB60RC3nCugatpUO/Vvgxtn4Vjf3xq1PErnxxWBqyfZF6cXUaT40drhG
	 dD+jO6j4AZIvuZ681MjYdMzfBwRXXsg0MTd+ZuwZ1Sq3hA46lipua4PS436IwZ+3BSsJ+
	 g5ZM+F1Aoz68n+GO32v7/9eBFD9OohOYtyh7yKYGjSntNTASwRa5pL8YjZ59V85sy/jRO
	 mtb84pYFAXgFf7v4teJ8CrUe5N14w8U8t4evSBmv0cLXt8dE1iHSo0WlUYDe3ZfArRywV
	 E86dtbtN2LWXKqHkDe+gR3o+WN7LelrXROVPbThZeQgW34YYr8q5vJzzD264pn7s+hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=zekaG0muTTzzy3RY0PTKHkYNAiqpI6W9p9ARJCHSRoI=;
	b=AZb6KBRyFXul4a52E56EPZmU9EqgxxyOUrI91gh7xtremAlXTmp1Z6btD/6t8HJd1Bpv
	 9P9VJhQqU5lRG9t/SwOaoL1PFBt1jBejjHqADzJCb2dVlCaMOk3mAIawFMAsQcN7mBUSz
	 icE7OiGvaxEIj+B6rxScdCgT8Q9DS0nwc5KC6aPhGuAP2AdjgVzgK2H0LEEJsHqgJ6yx1
	 03RvcXjM4FEZBKXtLhyW0wNMHwD9q9oOYxrAe2lCguLUsAY7P66lxQcgGRNaQjlaDvnmF
	 K5M6HWefIWTANTfrMQd46rO3dOZaWn2aenBSHbuSa+dpfj/RRM2t2FzCM9mh99WErzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IeCqbRnx;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C09606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95C09606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IeCqbRnx
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so11314595e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864296; x=1795469096; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zekaG0muTTzzy3RY0PTKHkYNAiqpI6W9p9ARJCHSRoI=;
        b=IeCqbRnxF94DUqJYYO/cNbEJZUkAo8BEg4L2CCqEm6Ly8QG4wYND+m8ruBuu8kOCC3
         IPlHZw3crOR0jTR7n4QV8y8/y9d0c+WalEktJnucuMj8hrz+7M+WSGsyhWXDUZ9jze6T
         wOysZYrejwWqIoXApXpznQFNuk1ut2ZtBcWN0N4FLUi4iTCjINcj8JWcz97tZhgYjHak
         re52LAY6dbrjxbSEwJ74Y8b/pPzk/w8lvO89ipHjlptTLfa9PfVCkCUnxLp3HIulQkqj
         KJPL6WSyStVqYYjaz66BVXcODoWNX1EQpCUw3QK2RvRtY+J/+O7Fi+d3BZtTi6Hu7Fm8
         VtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864296; x=1795469096;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zekaG0muTTzzy3RY0PTKHkYNAiqpI6W9p9ARJCHSRoI=;
        b=aLTjHr2GwmKlVsdrtOD906ezjWLMyM5fstDlnJVWEvOS4cvDWUiteAPcct79aCNPRQ
         umBmyYzEJJqiu5+bK4AAV0CI3Bp3aP5crmY/DNKvl6bJbK3coQrV8tjdziidEX7Um45P
         ZfR01bcs/+c6J1pBfC71ixrV58pJQMkxs1v2gfSWf7/dOW1iWPvv9kltuVddHJW7dTG6
         ShW7xdjqIgZSwqbG3LiZ3GetWchuAwoMQs1lHGv0VVhI7ZYS5uSHtQ1aQwSUZhj5/9cu
         7jQj4GqLblF70daK1o1mHcirHcb3IE1TPwBHfT9yRU6dWDMvkCJ3Xs2nXanEfiDokorq
         +arA==
X-Forwarded-Encrypted: i=1; AL+hErE9hDTCaQcPzSU8R0vhYFAb3vlSGJDOc/EAEn+MyRct7DhQpioOiR3hO7q3/9WOLAxa/o5CKAZxNW8LzgE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6SCcb8ZgYS3f29mXToTtKD4tZX2K3LyWODwuCb7Diy1Zfc+y0
	e98n7XvndTjNgK95HS1eFXPvTUlC1WvWWkCTlBW1K68WWU4sYx9HkmWB
X-Gm-Gg: AYBFou1svwZ5APXD0USBHLkp/KS3zsGOHkJV25LgJhFOj97EnVCJW58QfvM3MCln24o
	YonLUAWw0+utNNE1IalaYC2IIx0xsWEi3aRrjOv0Y8V/jvEN4jT3aWLHfwVKitMbFFBS31oSKAE
	g/YcRRs3D5+NAQtw9JmFoIknZQx96Gffw7x4XSvgq10jLHNfmGtjCdygXQZe+YinpBM33+iUWQ+
	vyChK5G/B+9xzf32NOLFW7sf9zubeX7XxhKruYnEYd8MJ3ZvK+a33nAjnJTr//alrkgVa5ClzmS
	oEjNbkrUeAjDOKXkEOfSKgNJoLsUXLinP1I9A5YVyCcWu0H0Szn9X5SkNlX4reNOao3tpwxwZpC
	+p3TNKsuZqt4lNbDjagOkwQgC1W9ErMHsvC3MnvClOiYyMKIiNBCa/f7dgVlcyw+klKEgVcT7Av
	QUVBvdI+LF9069mKqGmDQmEOR/17Kgpx59D3UYvoZ7vukuG0gWg3cd0PNuDMDvdjklKnBJuDvdM
	/GFHooG00a7/cYa6E0WYEqrh9Ey/iCK896TM7kNgtJLEC7eEtAwyjY/rLCv3rt5SScvjfHtUD1Q
	guRzPXRjqvtiCYN3uHE5/atN8L4kgP9YQk4K5pTu
X-Received: by 2002:a05:600c:1c0e:b0:4bb:6f45:2a79 with SMTP id 5b1f17b1804b1-4bb6f452d4fmr123535875e9.22.1794864296120;
        Mon, 16 Nov 2026 13:24:56 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb734b9f44sm61928305e9.1.2026.11.16.13.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:24:55 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH v2 0/3] Add interconnect driver for Qualcomm Halliday
 (SXR2250P)
Date: Mon, 16 Nov 2026 21:24:49 +0000
Message-Id: <20261116-halliday-icc-v2-0-6df8fc0e0620@gmail.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKJ0+2oC/1WNyw6CMBBFf4XM2hraUB6u/A/DopQpjAFKWmwkp
 P8uYFy4PMm5527g0RF6uCUbOAzkyU47iEsCuldTh4zanUGkIuc8LVmvhoFatTLSmuVSySwTDZa
 ygn0yOzT0PnOP+sv+1TxRL0fjMHryi3Xr+Rf44f3S1X86cJayFk2hTVHmppD3blQ0XLUdoY4xf
 gAYm7z7ugAAAA==
X-Change-ID: 20261108-halliday-icc-65a5442be859
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864293; l=1761;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=N1nEq2VfMFE4oihSgkAn+u1wXc3t/ieMcwO9xQMMdlw=;
 b=tvgA8nzb0WtJsi3f0O4AfkPb6zoQycIfw9woR3cY50dSNNhHx1T5EJSoEqPwBX3jrOYkpQD4k
 K46KghG77mgDLVD+bDqpDb7C6OZCl6wwPEo897wMT+7cxIR9ugHd8Z/
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document and add the interconnect driver for the Qualcomm Halliday SoC,
and document its EPSS L3 interconnect. The display BCM voter is left
out for now.

Halliday (SXR2250P / Snapdragon XR2+ Gen 2) is the SoC in the Samsung
Galaxy XR headset. The DT changes follow in a separate series.

This work was made together with Claude, ChatGPT and Gemini.
Reviewed and tested on my Galaxy XR.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
Changes in v2:
- Add the OSM L3 binding from the DT series (14/17 there), so that the
  interconnect patches are in one series (Krzysztof):
  https://patch.msgid.link/20261109-halliday-dts-v1-14-289114ab8197@gmail.com
- Define the nodes after the nodes they link to and drop the forward
  declarations (Konrad)
- Link to v1: https://patch.msgid.link/20261109-halliday-icc-v1-0-def7cf786f75@gmail.com

---
Stanislav Aleksandrov (3):
      dt-bindings: interconnect: document the RPMh Network-On-Chip interconnect in Halliday SoC
      dt-bindings: interconnect: OSM L3: Add Halliday EPSS L3 compatible
      interconnect: qcom: Add Halliday interconnect provider driver

 .../bindings/interconnect/qcom,halliday-rpmh.yaml  |  131 ++
 .../bindings/interconnect/qcom,osm-l3.yaml         |    1 +
 drivers/interconnect/qcom/Kconfig                  |   13 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/halliday.c               | 1781 ++++++++++++++++++++
 .../dt-bindings/interconnect/qcom,halliday-rpmh.h  |  158 ++
 6 files changed, 2086 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-halliday-icc-65a5442be859

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

