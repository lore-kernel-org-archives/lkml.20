Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392734CC273
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791828676; cv=none; b=X3WClwAamc/pT2+y9N37/BSBgCL+vbt5uWPTYByUWPILxayRVXMLjCmXbjjWJjA4+6gBEpHv3dCIHFqz0YSDPdZlk657Qdtd2Y0mNLI4It6MYOjqGzvcjTtfqpRUObAPSjcNVa57+fG0TCcuybYY8QrvJTZjXc6TKpB9sxF/LD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791828676; c=relaxed/simple;
	bh=aTUa7IEtoyVwyYxpXeqEYAviexKN4tyKhS8parfMx7w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LlRtCiXPENUUvKRCraM+QD9iV45N7u3gcsNDU1X9bRKu+5hIzopDjVw5mfrVA4me3jVBMK0fqYYXNWvLZvvXoJAvjT4NyOTBK5FLjb0QZDBRnivqctSc4LNQJ2qUEOsgKvBUYIC/HTPB1v2G/klxN6xQ1+TzdwN3kE7ovdz/DXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=MvucV9gs; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="MvucV9gs"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c262f1186f0so282293366b.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1791828672; x=1792433472; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bnEmVKkg5cFu8WsjlyBzfJa9upBux4p0W3hKHpQdaIg=;
        b=MvucV9gsf8Kh3rjcqRDyPDDgweTQPs+p/FPF0pehwcCfCfuYiYSxKRh/KoMkolWHXk
         zQDLgkq5VkrdsnurPBirRqM2vfDXK/yaTarl/argOVuOB8TIiaPOnl7wQfmJU5u0hAJH
         Z4tvnYbU+LXZWqhw2LrlOU4o2KnJSkcfWC7PvY0k9D2RSCWcNmWe3gMMX/S2QNXOO3Z1
         P+0t4CXc76uD2P7HGEecOc9bBZuA49gcst/UtNOIYl6hWwPiRXdx7IYUrNgI4GIbRkDH
         PQhq4K9lRGcJs7PlCKc/OnDu7q6KUWrwBo0bDmIWIo9P/DUTHy1UXsRqFxM7Af61NxYZ
         7tIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791828672; x=1792433472;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bnEmVKkg5cFu8WsjlyBzfJa9upBux4p0W3hKHpQdaIg=;
        b=OLrJq09ZSPg/3LkGHfCGiWwYLR6udExD1W+bVE6GSrzxXwMEllXAkKJQjy9dxblgre
         VDuUvD6npuZZft7H/BmN+HIfgyPAr8YfwS0QWNQuTMWz8jukRgd9XYR9jIZUMprpSAXa
         xU9LlYshJc1TtVwwADVe5rPRq5Ye9My8X65phfcH4Ys48/hsTmJHxMgnEFcDWV+kjdyO
         GJfRC88Ny9NBbCTdeChtz5OhlamxttVIWrDcX8xSUeLsCuv3XQpUuHhZ8I5VaHmZIezi
         4p64MM21cuFhwiO2olgswwsrFsyY9ptWXzSV5O7sQleyU9znRZgC7XhQM9MfoYbOLbfR
         UoFQ==
X-Forwarded-Encrypted: i=1; AKwUvByYY9G45MM5tGjBSBWs1CMy6LQz3XBIwvGPNwr0hBfFRNrhhlsvu2LZElX/ktAXTQstQ+fgUDILNSM0fok=@vger.kernel.org
X-Gm-Message-State: AFq9FYLp+YP7BgtnsfYBQBogPOYELCVK2+G56OWG0BsZhiMBwWtGtQb7
	1UaXPlRXbL5yoGCEQl3vSXN0rMwZpUne1uAtsVD7Mnayxz7zReNP0Pvn84tF9Ps+AYc=
X-Gm-Gg: AYBFou0to9jd01yrAQYDQvS+NcXWOh9TpQvqKVBiJj98UUQ8n6FveCTv7nsZimWZr7k
	4MxUyTkHs3yLDbXnDZEMm4YTRJHxsMsi+7VVjUc0tAir2XS8ao8H3RmgcGfG5gwYUBzOr/gTkL7
	9YFuN4NVu7OebkmNw/2KcOQWXack6th1Bq4ycGN7SbIxE+erZFsKgvCfORlDpuR0oGKk6DoK270
	5vJuq1J90ZUPqZkbhGpOBgoQ3k89IzN6L+EkG6VxawtQ0jfa63g26W0XVQVvcOlCriRbyxWwweC
	ZJQdJtf629/rnd+dmvUle6YWQ5I1hqxKJJg1gIc1RNq/ubMirO5qck1KXCoa6P+qIV5gI3d8yhJ
	nus6lcz2FX/gIiylcb3Pm9DeNoSzKOo9uX8/Sn4iAv76e7hOvTcXNJUt2pBgciKLWK9G+hl2vlD
	kNMxraXDt7fqWv8GZx3iYYN6FKYzTnbaGUCaTweCliJwtMDKY+NFlDe/dns0/3pDeyt5BL9k7RP
	0G74q1w5uv28zR+2BHinQEpylBHGYJrgpTc8LifAHLTIXHn3l1LF2sJ8Gh9nsj8GvDWxQ7GDFyN
	ffvLBSxVte3zZDOug38=
X-Received: by 2002:a17:907:971a:b0:c2e:378c:8cee with SMTP id a640c23a62f3a-c31aa05bf43mr948779266b.34.1791828672451;
        Mon, 12 Oct 2026 11:11:12 -0700 (PDT)
Received: from [192.168.101.179] (2001-1c04-0504-7401-4b2e-1820-6d24-b264.cable.dynamic.v6.ziggo.nl. [2001:1c04:504:7401:4b2e:1820:6d24:b264])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac924dsm498415466b.70.2026.10.12.11.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:11:10 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] Support for the Samsung Galaxy Book2 Go (SC7280)
Date: Mon, 12 Oct 2026 20:11:02 +0200
Message-Id: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0ND3aT8/Gyj9HzdJINUSxPTVFPjtJQkJaDqgqLUtMwKsEnRsRB+cWl
 SVmpyCUi7Um0tAHSvcVBrAAAA
X-Change-ID: 20261011-book2go-b0e945e53fdb
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, Jasper Korten <jja2000@gmail.com>, 
 Luca Weiss <luca@lucaweiss.eu>, Federico Amedeo Izzo <federico@izzo.pro>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791828669; l=872;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=aTUa7IEtoyVwyYxpXeqEYAviexKN4tyKhS8parfMx7w=;
 b=DnBnnWdN69x/EgtwVUigFuygLAgoZ/D9erZU7A/iJC3vkzP0Nrd+22v1FASSvO/66n7Lf31Bk
 55R0Z3Ed//nCdn42fMg60F2hOzAV9xtQk4lKpZ2SZY9YQXp5BOgIr9f
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add basic support for the Samsung Galaxy Book2 Go laptop. Basic support
is just eDP panel support, devicetree bindings and a devicetree.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Jasper Korten (2):
      drm/panel-edp: Add AUO B140HAN04.0 panel entry
      arm64: dts: qcom: Add Samsung Galaxy Book2 Go

Luca Weiss (1):
      dt-bindings: arm: qcom: Add Samsung Galaxy Book2 Go

 Documentation/devicetree/bindings/arm/qcom.yaml    |   5 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../dts/qcom/sc7280-samsung-galaxy-book2-go.dts    | 643 +++++++++++++++++++++
 drivers/gpu/drm/panel/panel-edp.c                  |   1 +
 4 files changed, 650 insertions(+)
---
base-commit: d970aefaa8160df2d536a71cee2d3df9ff65889c
change-id: 20261011-book2go-b0e945e53fdb

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

