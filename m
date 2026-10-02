Received: from mail-ej2-f40.google.com (mail-ej2-f40.google.com [74.125.228.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715D543CE7F
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790952605; cv=none; b=taeuyEiJvnitZ0M2U8DN/teRCVDemA7yCuNaJCwvrcZj58+aNmG1YXhKfJI4GjNVuDIKSNEDXbDQVio+fpZOCH5923savPexAY3TW62vKLCIL4rew54mhLkdQXuSxdnpf3mUOl7JlcGM72dEEmsg7mmA+G73pkqTB7wvxIeInz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790952605; c=relaxed/simple;
	bh=KsRR3Q6/pxPTL+LOpQhlv999N3C0D2jsPRy7RKoQGk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bmft8/Lk1hoFNP6xY+1zaL0fsOF4U3kG7hjLbd2hGm14NTcc0nXOxHI3XH+6D+Oo2NYr3n6DJ9yYatuhLhNYfY009XCurbdk7iDIcEbuZSmZyihd9dhuhn5J+aKDJpNTrT5IKwRh3c4+wbUEU2JFgG+ozKWeDdY9N06Dn6BKMqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=QoWFJtJ7; arc=none smtp.client-ip=74.125.228.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="QoWFJtJ7"
Received: by mail-ej2-f40.google.com with SMTP id a640c23a62f3a-c2e402001e8so22249566b.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 07:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1790952594; x=1791557394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=azHVxl5Zr31CbdI5TNnzZtKhiO2dgRAGT9lgdHF1uxw=;
        b=QoWFJtJ7DADvRhIvCRMxgtMiYgqRaF0ZUCVCahEPv0wqLXdEu47rK9cK74yLvxt1O/
         Hy5Fbb5pt/6kaIJftFGfhP/E7Gi6WsjH6vdc2V3v4StJb0K6pLVuCcGk7/4ee19YS4xv
         qLT3PjhSRqrx5wMfgs27B7SR+tObNEZYTBooJyoJV4sE5Pcj7WrMUHT8aUJiOhOeY2aE
         3+B3xkdrha3/1LBcDsdguzj1OjOfcDcv4uak68TUrL19JhjGpps6Ng7eLQTAjpbRIVKp
         OlGdbTaCvg/APBzy/f2Q7OrJG8KLeL1akaCaenqrtnlgU5cTJvCBGi/CJs/MvuAv13w1
         5knA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790952594; x=1791557394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=azHVxl5Zr31CbdI5TNnzZtKhiO2dgRAGT9lgdHF1uxw=;
        b=i5ZchEE0m+djea1yp7IdfZb4qMTPwbc+5v0HonHQT0fDubLgNateLU96AMoPAOa6zX
         bOFWBSJaQ8B1lSI5yAhCm4oS9kEUwE4sYVhLtZK12jjzfPmPpnZeqXuaF98BzXadxjmF
         j+deu5Gn+8k4WXtSTOHxDYVZatUPAbIVLRipb1sLkLe/y0dj94KeTZWzxz6YvtZFuwib
         zZyJHuvrWMyFQXX5Wo51eK7or4YvrNDWvaipec9JKQS44EOQrvrjit5owPNMPipw7Py1
         FVqbbaogci4msR3R116VzFE7yxOGr2mgZwDakD8lPqZdhWia0wxHfEbE4LeYj/4HWFvB
         3wkA==
X-Forwarded-Encrypted: i=1; AKwUvBwdl9w5un3sJP8GKwxem4imxXDzxjYwYW7I758xRydvui3uqdRVs/Ekg713DOE/vAkt6Ms1CaC3YhtiLNI=@vger.kernel.org
X-Gm-Message-State: AFuF++mFqJaJpAuojo9IJNM4FtiNZQIrhPgUfBwa+p9ISn8X0CQ29Y1M
	XuwIKF7Lthl/9KK0+IoR13HWLq2mWxiga1KSrucqjdflraFwQtSn6yVipVb9cPDcgFM=
X-Gm-Gg: AYBFou3RWPaIKh5unodTc+Sr4d5iCbP/1MT4478+eYZGFfxlq5tX/5NZKGBemMkofb+
	NmtLDil2BTiPL1GIOqrnteP+Sr1FXGqD4WhTcWPqg3Zv2mfxE/H6huG8xESTyERGTQF8ymoRxBp
	wKV7uMnBrik1u0oFlWKYBPDi/Q4S0x6cltdrMFW57/0Muu/Gpg9gM6AfekvnE1iRBurxXOtwJh/
	YX+fEpn4yPezJApa8f1UKJOCJpt/2gHhqxNYRPLHEoz9eC5thMAo+3y5zkae164tjULeKFdG0Bm
	GVOyfMdC4Chk7qe8J+INAPcOAbEi++U+QBW29P6Ni00Zt1gn2sc7cXY/ovtMr6pdpdDGRw1sC+5
	YIVy5TpCfAwHw5nwakkKg/pr1VyiaBomKhC7vacjV4VdnptPH0ohGCLyC8U5Byf1hWyrFCmZud1
	tDTlO33qfLsEE4ekudpg/bnxq9tRnbyc87D3+cw5x9Vr0wk5EJcLlFopge0n0G2ytKe8NwYxhw/
	N/Qvvlol5WPOCondZwr2ae5YkF7lF/VRPbn9UGx37dGdqil4s4k
X-Received: by 2002:a17:907:9403:b0:c2a:f8e2:4233 with SMTP id a640c23a62f3a-c2e4af31f56mr209928066b.19.1790952593938;
        Fri, 02 Oct 2026 07:49:53 -0700 (PDT)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cfa656bsm94539066b.74.2026.10.02.07.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 07:49:53 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 02 Oct 2026 16:49:50 +0200
Subject: [PATCH 1/2] dt-bindings: display: panel: himax,hx83112a: Tighten
 compatible matching
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-hx83112-compatible-contains-v1-1-d558635ab7fc@fairphone.com>
References: <20261002-hx83112-compatible-contains-v1-0-d558635ab7fc@fairphone.com>
In-Reply-To: <20261002-hx83112-compatible-contains-v1-0-d558635ab7fc@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790952592; l=810;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=KsRR3Q6/pxPTL+LOpQhlv999N3C0D2jsPRy7RKoQGk4=;
 b=d1WlKoOFC109aIkEZsjUlraQFJKKd8F3U5nRRs1tjiGq40q6Pq3YfqVmFt5pLUIkq+oIHMRia
 4hFq1w3iyYqAdDwXY5xfl9gr0XD50R9ZuRDHegvB59n4o2aUr+lAUDW
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The compatible was defined too wide, we just want "djn,9a-3r063-1102b"
and nothing else.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml
index 2c60d0cd704e..3dd9b25ff13f 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml
@@ -18,8 +18,7 @@ allOf:
 
 properties:
   compatible:
-    contains:
-      const: djn,9a-3r063-1102b
+    const: djn,9a-3r063-1102b
 
   reg:
     maxItems: 1

-- 
2.56.0

