Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8377A477985
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934340; cv=none; b=ATDAb7kliwylfDCpxqlhvHFtuaFLGXmMMy3xgKnHRjyyJwDaOMBMXN5uZ0BJkI13eiRqHAY8XwLF6EBed+kv8PJnA7h6DlhACqXtz5j9FAa9AHww8jwo33nHsm04/2jw09nuzcBKe5C5rWMLa0UABtw36ulpfvgNgJjy4FbG9OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934340; c=relaxed/simple;
	bh=/e4orqd9ooo38fMCjozQMvU6+3FatBrm2ieDXdrYcoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YWuXlgqdgNxCY/nCkF7QFgqgOD9rwnKXDX8HC8rfvxmrNgkJrYxjnVC+Lr99xgqUTJj+MamEWrIwuoznNiTEX2IwN2JoDTqks9EuzaYLf/gqvjjTKNwqUpzVDTmWdo1ct93nsuvceegNFpOh3/bv5e3b2hMM90avY+OIsG92E5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FEsD6mN6; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FEsD6mN6"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ffbd83a92so50273335e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790934337; x=1791539137; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pXyCopQF/wJtpOFJwcicNfvyz+Xom9etFu/usBJbflc=;
        b=FEsD6mN6b4hoOsXKlWQWyKHoR5wT/Shlga4jqeACmIJlhlYFxlqH8/uQkF3MJwrNDH
         HdEKS3EOQx/2hdlIZKFMlkW1Mdeigtlu2EU7Hp4Xt2pCbHXzUts1oWATM3sIOS6fILf9
         6IWg2GTH1zBUeyqk88pAojmEd22p3k2b/c8Cyho0wQqHeM/WF9i0LWosU6rG7bAzSqGx
         qBWGhCdvGZNlvFJ8tVajq1fezwme00Rtdon1/JJ2m7sHmte2Ymp0KIQSmnsu5OeKhElV
         CQFaakzgWPYXIR+hyYzM77xpBMek6ikA0y1KYACk5qYh6O4w7XDqdwuH/Nudecqzxr6E
         oFqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934337; x=1791539137;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pXyCopQF/wJtpOFJwcicNfvyz+Xom9etFu/usBJbflc=;
        b=FYx5q64G+bknNxp1xiSH/0b55kmk2EWfV5MdTh2STR+qBAKIrLx/oNJ4f1jRQCIiOz
         fG3k/db3VDQShmxPfgcmQk4VK9fGTSZlMU1qOXOGi4cvAa18Wbu9+MokLjeCv1VQm8B/
         H37tke8SNBRfBfzDFgfzsegPOQ+Y+WVXd9FZafdHJH4VFUizZS5BzJkuqxU+fdt55r78
         kkIWUcR/hYNU+7hmi9qh/FS20OBGGopKSMUC0Z7CaeqsRcn79wpicRFx3AIn+Kvaqjmp
         CFU4iaJcSbmndjlr3Ghhhtvp6FnKGhBpjkzHfoxozvzM4CGj/XsdblSn5UrgG3tUgZBy
         Rqcw==
X-Forwarded-Encrypted: i=1; AKwUvBykHXNS4kA/TTzfnuq9NsM8UflI4Z8aft2dzCItJ1U+qOV9yIvXcI9IUjNW/mEOSiYbkWdAv+hUelsoiRk=@vger.kernel.org
X-Gm-Message-State: AFuF++kAs80SE8chXMMEwQjVlv54D3Hl4IWtEzKH1m8jwzJCynHbbb90
	0nwfrNgORCc8TscNPVCdCIq/crmRlPh6xrKxcpRqr9QgO/VenwKi5Uk3vVxDVjrSE0g=
X-Gm-Gg: AYBFou2ecahK6ZPDoIV9Sp4oOBbGCIdaxhTabea6bDsjMa5rJFZc38Z7Su2tFalBoIs
	DyvE47gl7REWpOBQ1z+64XAnU6MQC2vNQsJ/xcTdCZ0/kx9Q3cujRun2xPEMXmGWI+OofMYHY6b
	VzU6x9dXk8ZoW+yYmpwxS6dZS1RAepIgx5Of7fDB2rbxvDLmPZmdzuvueuLRNFF/w1jqTUj1/FF
	Zbbt6Kk6C1QYtZaIQisojTEo0WKkLX5/d/VCJwD2XAQZ0DcV1uhMme/Gbjt8263ySEUN5DnhGfr
	gPS8qR0WcvRO46XN/1FK5dH3+sCIPCqIDh3FQsjk6nfELVK9OqGabHKjSPASxfCAXBD6UuPVPqT
	8gAIJIT9GTWaC3gSifyLOY7OodXTIAJhjjq/JW0SpFY3DycklqN8U0uMxHV9SYy76uuea37npCp
	A454SizE/Z6aXalKN0pEcdqdeWMg9PthU7HOIi4qQhh3/k/JDWkoKK9rMykKYShpafW5mpJ06R4
	rRt3nB67CNx3/322UE=
X-Received: by 2002:a05:600c:1911:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-4a02756643dmr36113665e9.10.1790934336410;
        Fri, 02 Oct 2026 02:45:36 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280c8bb0sm72705635e9.11.2026.10.02.02.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:45:36 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 02 Oct 2026 11:45:29 +0200
Subject: [PATCH 2/3] arm64: dts: qcom: sm8650: Add watchdog node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-topic-sm8650-deckard-watchdog-v1-2-7d7f7d71d88a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=989;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=/e4orqd9ooo38fMCjozQMvU6+3FatBrm2ieDXdrYcoY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqv308OwQAnZXSbRNTMIeapM4c7xy5yMn/SJ1QPHKS
 9tqeGFyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCar99PAAKCRB33NvayMhJ0afWD/
 49+j359tBNoaoTP2dpGyr7V2h1+V7ETZt/I9IbCy7h+K1zMBL2VEZcSzn+7AfuqRsBUMgbNq7qoNKa
 oUwM+iO1qsvnFXsJ9es56nD3FrjJs8TnQiFsflT70lje53mcuAjb5ZKuSyAHlLm/3y6Knyw4NG5+lE
 Z8jDNqxBhXi3Cre8TfyaA9eE1BE6FmuKLfW722xI475w+VldEx9KQYWcnLh454z4PKud3AzYoRO0TR
 7iRG3ela28g/qbAvCaASvv2KWDipb4fzlR52KAtIuIZx1kA6FxtC2zXfob2kMKaAISRDCtB3BYHOOv
 9TYQ6gHcrOInvr2HJJIBYKUBYDmMqSkVdHECnMYMpALqhwC+TE9PkAvhE/PT+uD6b5eSWv33XdosIx
 40oSkIrWxjTHW8ky3ByVIlHkG4MMOAau5jfje7ut/IUAEw5Adi2nAD9St3LYVHn30rSwvjfUEkUMXb
 /cJ7A6wMeH8jCckpLBpGlTx1BuuNN2FuWEGw8Pro+atfQ4k/kOYg5gr334hs0J00MX9F5YDgbhE72t
 b/UXew1dMOZBYl1WvjTl5LQr8zFQy+qUGvCP1qss7YpR0EqF2NPkbzeg7+pCpnANthYt6iA4gowY+4
 KEX2O+M5PgSqYzk8rmZwcMpvSaYTgMEpWblIrGTm4Di+dnVPffxyHKEBdD6A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add a node for the watchdog on the SM8650 SoC, the node
is marked as reserved since on most platforms the Watchdog
is owned by the Gunyah Hypervisor.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 86fbb0fd6472..f33ed7909a8e 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -7311,6 +7311,14 @@ gic_its: msi-controller@17140000 {
 			};
 		};
 
+		watchdog: watchdog@17411000 {
+			compatible = "qcom,apss-wdt-sm8650", "qcom,kpss-wdt";
+			reg = <0 0x17411000 0 0x1000>;
+			clocks = <&sleep_clk>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING 0>;
+			status = "reserved"; /* Owned by hypervisor */
+		};
+
 		timer@17420000 {
 			compatible = "arm,armv7-timer-mem";
 			reg = <0 0x17420000 0 0x1000>;

-- 
2.34.1

