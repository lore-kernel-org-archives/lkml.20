Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810865;
	b=KjIWfauU24cl4BVfCcFTM+IzUhpE4wGiTg1OT1/E4nPxJHWcGS1gAwzvq4KDEXkdUrzC
	 cv8B8hLkPKbNfEYfL/gRAS0zH6x0BsAwMIkWZtaDprVaw4e9HpZXrH7IRaNE0YXI2qYr5
	 VenJduGxYycwn6B6xxT+FANXTiN6dcS+dlPmjj8DmA8uMkKcwUjB0gi8T7+u9usWEk+vI
	 tEXNTvXb+2WCC5dNvRDcV3fLOwVmmRhzgRlSadg14Qai6acg24IQMQq05oxhp6HjuhoFP
	 kiHtMxck+IBvfuBHSD44dF3cyONR9Dr+qozVtMzsy90aADeMCz+er6Et7YblkuyCBkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=U4fFdtJNvcZ6y6D1x1v24LO+4CMQIoUBaMtD1ZPuCLk=;
	b=NsNdt9N9X2Te3a46q+p65kU8CZuAlkHRXKNUX5g0vFPgRXLOPMxtGBWMv5PS+Mvix69Q
	 hLgnnZazqGDPZJK0FiXIgaYl4oeTyOGoRVxddAmdd3e6ojbGrbVzPqw+WPOa5gho45Eqb
	 seNQpO6k2qW96DFMeN1K25dgxVoSy9tJ+YYTphGGSwSxoWamYfZP9LfanX03sd71rpy88
	 FyXHHPN0ouhHQhn0Gzv19QNnNqQYXI7sM/D6Na/i59azn7BPDGrmTsDzetUuoUjHYZ+qR
	 Hrpzti8n/q+6yZYc5yzVpyjtcPu7Y/7B9bPTXnAw2CAvZuka4E9jzFYiE0aGG9/+86w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oDKTeHu9;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A94F606EEAE
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A94F606EEAE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oDKTeHu9
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15943c9c005so2295101c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793810864; x=1794415664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U4fFdtJNvcZ6y6D1x1v24LO+4CMQIoUBaMtD1ZPuCLk=;
        b=oDKTeHu9/D7LEgoLtX2Id9RcRVT+1ag0PVlRkJn6LRUJ+tPK8qy9UNhH2k58LkNP7E
         qwgy6EaLkLHJ5BwA5IvnkC7NrLSYc+VeBrciVkYShA1mSofVv9xqO2P4ZLrlUdVgesFb
         U4oV45ybr0Ly2k8X2vFleAjnX6CyM7N/Xgxg+9o+QTkozkOGqbyFkhZTJC0C66h8lVn3
         Ngdhe2KDalL8T+jNBgDzqtZqBlnUPLVnkYXrCHkELW7VjmOHykwjTSDbPWfceaQ8znz9
         Hm8qjdk7tKhA0eI3M5t6XXN9tlH8Ir7rgJs6gdNaxOal2rgWZbfX415OgUxvpsc1Yu39
         sfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810864; x=1794415664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U4fFdtJNvcZ6y6D1x1v24LO+4CMQIoUBaMtD1ZPuCLk=;
        b=qWpL75ViTJ9WmmunDZYDwWykETKoG52IUXX7tODi51rcSXDjilrYX7tRB2KFbrqai4
         XoHwCPKuPbqKgpnMuQRoNPC42T7NpQbWEodi58lT40FudkkCl3w/7/qxUFxMOEGTEEWw
         yvzj9zzYHRUufZyasFgUyKKGFR5Ir1uQ2q74au0KjfxP74WOarHWuSex/Um0l8cAOGg/
         kxtqyFh3tl1HiBaMSi7Pm8NcDN7yhd2bkAxl2b0mTrEGSjbGw1mXHoF+p2BbDKp4jPwn
         FKkaf3yWNNGPTb1ZnRcld6wb+i+Rc3eWuGFsut+SVcL98Kwuzg6047Z0j+sAaIjwHs9N
         h5mQ==
X-Forwarded-Encrypted: i=1; AKwUvBwM23TS52RUdSOf5o1uY7phQet6TAR+Y5Mh0FCJW9weahWPreWQFJ98BEgyOIQ4U2BloinVVkgrPJM/MK0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uSW/e4hTvB+xeoffofy9iwzKIj/ghmIho4MfNpQ+ihzcQmOFO
	9UkOwXoDt/Z+zq1+g6ucGXS7T1/8yat3KOPSDpc5xgFAxvBCq52+TokP
X-Gm-Gg: AYBFou0/C6jh9UmQaA4M/X+kEi/pS3b2JfFuXr775za99JdgcDiebCY0FzVSooGnh9U
	Zm/o7dY/HC56I+d4IZMcdIClNAO3BqFwaG/wLgqv8P/qxme/xxJKsebUSYFs/6vaFsBjESKu6QL
	T0EdDn0sO4hUcsw54JEEFMYQetaTdy8W9cLDp7z2I0LeQe0zEdjhujqxY25E7x+kJkszU0HNPvL
	e4h7lQIqKwH8m6Z0nSIcws1jpeLLvVvK5Z2KGOpUtZusRkpdcfwHGvzaR37Iw/QGHET5S9mNedv
	qRgVsGXPXfV3dN80RBHibrZVzklxNn3LqZSJD6AvxJtIbE0BRZP5qqE4DJfaeebRSIjUPvRdS/R
	LKHSdWYpmB0bL3ScQ8xPdXpUfrgt6uY6uXTZrcy43GBotd5NS6GiekPAM9MVuPpKPjHaZrLtB+6
	oLWlVwkNPUiy2rBsDHDdSJjOJwK+yG5+lgbuvC1jYg+r0U2AvU+nmZqlVj+lR71w4LY6OZXkJWS
	fodrVnj+JCNmXk3klewY9I7bXd1tHjOUKB0bnTOLhj6XBn1ef9yfz1QLt2kGFVy+fOZfoTgKgzA
	LJOaS4oZ6sQzsvJjbgDPjVpLn98qK5AEpGst0KXSukhTahq8Xlx3pRb5xvxXVH5ft+rtDqxYp9+
	PTu5t8P8=
X-Received: by 2002:a05:7022:418a:b0:195:e4b9:d326 with SMTP id a92af1059eb24-1ac5b9cb638mr35445301c88.12.1793810863974;
        Wed, 04 Nov 2026 08:47:43 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.207.207])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c57430sm10839666c88.18.2026.11.04.08.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:47:43 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Wed, 04 Nov 2026 16:46:38 +0000
Subject: [PATCH v13 6/8] dt-bindings: firmware: qcom,scm: Document SM7250
 SCM
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
Message-Id: <20261104-master-v13-6-355b65c6f764@gmail.com>
References: <20261104-master-v13-0-355b65c6f764@gmail.com>
In-Reply-To: <20261104-master-v13-0-355b65c6f764@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793810796; l=838;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=n/5l0LzNHQkrbMmziTZYOIF2FEcc8PMKPnj4oscjta0=;
 b=Sm+u4EHvzCpGgwZKZFX1DxrtxcvbrxK0wHlNVW12r/ijgENS8oSQFaV6rQsbmumD7aCwcC/gt
 fIcKsAunm2yBJViY0+UhK+wTGor9I9Ro18x6cbo/n9EqUuUrNeNrdiu
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the SCM compatible for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 40a267c54..ee02a9c20 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -76,6 +76,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7250
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350

-- 
2.43.0

