Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793257440;
	b=aWGaWpQkU3mCaXusE+LXoMi4QcHoHzXaZdd4Fv/HRfu0qhVVDHIBFQAMtQ2YO0IavVwa
	 C15sQJeEU6i28+AlXkyNmlXy+d0/RUpUUX89xImKl13ieQHOSrX5+bOwWAX31iU37Er1s
	 tqNbG4gKGx5zneuIDif2FprSa0tn6MIkWWmQL26dSMZwEpCmEtB6N27x6q+fyZXJwuiOZ
	 fHtmkfT6ypQbySwfIqvQGMjKz0ce9LPTIYCa4UqyLuTo02zdtvsw9GqoKEtBA9hhHTiN9
	 +bTLThsL5ZlRIDQUdJ7wVOUwUt3R9v1ktmeKQnouAGP9ttqTFAZDhK8xkvIYsOgDbeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=uLXUgShYuzqF4ZAuBg6KTg6ZZ2I9Cs8fD8/hYe2JXyc=;
	b=U66WsXJlX0RcYnIgXsYkDO7Mrs5r1dPufaz30tFE4OycgS/Wrc5KnY63qPEqO7OUBnE/
	 3hdPIXlY621J7WM1KBzAAWYKNSFb1xcM8ybkaXeWIf52+Vvgb41OReI5ePriKY36yHOKO
	 Q1WsfH8KOeosnihrC0IlHZaLeIq2K58gdQZIfV53pPGoWPv5Ei+zFbLrk+RfVskE/qpyU
	 J0srWX6+AYXQdGvFVrhPLJGVs8IkRkIPxb9KbBPFMmstLQ67njJ9+FblR4IiEgU3vA/Q3
	 PiZhedWgXoYCdeYSsymux6BqeBEeq1p/CwH/9+v+soNxAfiwE40uKowg8/nEk361Z/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RwNoZ4Cj;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8EC606A327
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:03:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB8EC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RwNoZ4Cj
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1a2761c69fbso4335808c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793257439; x=1793862239; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uLXUgShYuzqF4ZAuBg6KTg6ZZ2I9Cs8fD8/hYe2JXyc=;
        b=RwNoZ4CjRuYkg/jasy/Mjn6HOQL5A9DiWfE94RbDJRoMBIXOa8tue5p1UA1PCBjNZg
         9pTEnZ1J8+Nap8yqIUe2E018rdqcdBP2Z2l6pgc5BghO3yb7IRMemJfa5nC1ZKO7Ags3
         QnSoYq79LIDVDMnxJgW2vBfTNhvDlc07kKp87hfd0su92VhjpCSkqJo1wAaSSF6LCT6e
         7Wo5UFuWTCyP8d082kzIEGc2gIYbeBi+Jy/kvyB5Vojav+W3TvejUZ11XSWmbTEdypki
         YgC/ofrBRKlR0nPcrpLSscwvR5e7KdPY4zccsdGIh9U4+KLaTWfC69e4L7gajvFk5Di+
         Xw6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793257439; x=1793862239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uLXUgShYuzqF4ZAuBg6KTg6ZZ2I9Cs8fD8/hYe2JXyc=;
        b=0Gzbk46MeV4jJlgEopMAxMwSXjRQm50FpxRV+5/LFt2MdW0gqTqpQS8NK4th4dJZrr
         XWYDiqkQsPrMdFIsJF39Bi8ThrXyH4IpGkBB62GXNGmifyI+PWGCdXEiW1ziTw9C7S/i
         IUKbTT9jKK6D5+HFUEEoxxXrhJX0E919EA7jd2Ghj+9nTlGdFapEspsABHtl//LwG8tQ
         5HgcxlDPqNKeEGgCByhRZNHvcEkMaT5jTAJ05WsZS2mJdwQ3x0eLM82pqMubVSgqXZEm
         5FhM1VMWvg5RrNRGyyuPHci0LiBQxFwYJ37Usqvca3kFicZ8I9gHnQpiZ2MhdiEXcnxC
         airw==
X-Forwarded-Encrypted: i=1; AKwUvBzCcjP5beaBEPdmdZclFUfxrKNDSbbnJAY7FlX8YFKK5Bq91knJVTVsxbSc0tZ0xr/FRaaSkfQDRFh6CMU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSfSepZqEFAR07CDPRMvsLVNmfjxUzwaHfGZsF0lyI+oLA0p1A
	Rt0kDneDQDr9l2mT0Og0HBdCKIIl+ELXcsGRcHU+ATqbhPXIoWxzAFBp
X-Gm-Gg: AYBFou1mviNgb6FLx4oGQxNJW84TXg8DLyeHZjI4G8HAgNYuPqGeuzbfk+jORB6yaIL
	Xy92VGTEm1Cifp9/wSZylEzI4q/v0WpZKYPL3XW4/rPT0N8QS6n7ws9p1C1r7B6NglmgRU+i8al
	oEiNR3hpGylC+aNWur+/Ws4fvlrZ6zocNlKWatHtOiok4C4GKOUeBzphdb89EMRym9buag1BtUZ
	UFE/gbKjt57aLUZFc21eMxjWx0pp0vzvvx8u6G5dPltab4IrShUz3UN6jry0AEjB9Mg9rxT+Jam
	meDpW6ufwgMVsqmiANKIZhlJbGUp0T74mKkDKI095Sz/daspgnyMMIGCMdfuZaWn9TPMuuRO5DM
	wEZHs58Q0/BpSuxdP1euDJshvcBv9MC8fPyaL4ah0tLJerQH6Ku5orJpXu2u/moK5o0JcsxvyD8
	smh0atxK0Dsov6TyYYWePYyus+GUXS1Ej4oQluqq3R2DdJbD/I/hPPPR82kczm7uDZo+oh07Osq
	2Ov755A1BGcMUm085tpN4VBuBpmUIR0BXzQLGGgnfYvUAwHQlBSo+omoA5oTCWDbzmSBPf/nIjU
	H4+2BYxoJiuFHRcQ4qw/yv+pk6d+evBv7qTdJw9gpOCspJ8pk65EasGV9+bckAUj9ZpfLVVNFwg
	pGXt99BK0Hrd+p1XzaL0sTZamW5aLjg==
X-Received: by 2002:a05:7300:cb0b:b0:351:4866:255c with SMTP id 5a478bee46e88-36a204a1735mr8418969eec.32.1793257438736;
        Thu, 29 Oct 2026 00:03:58 -0700 (PDT)
Received: from Sobhana.localdomain ([152.58.200.233])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2398fa4csm16955443eec.24.2026.10.29.00.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:03:58 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Thu, 29 Oct 2026 07:03:01 +0000
Subject: [PATCH RESEND v11 4/5] dt-bindings: cpufreq: qcom-hw: Document
 SM7250 cpufreq hardware
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
Message-Id: <20261029-master-v11-4-2c29e382162c@gmail.com>
References: <20261029-master-v11-0-2c29e382162c@gmail.com>
In-Reply-To: <20261029-master-v11-0-2c29e382162c@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Danila Tikhonov <danila@mainlining.org>, 
 David Wronek <davidwronek@gmail.com>, Abel Vesa <abelvesa@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793257394; l=949;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=x7hZEQOYoMz/dmWpmgNA+PhWEJ3zQC81cV4z3jRraIo=;
 b=ufsKTZU+b0OXPb0mc4gZE8Nc3udFJHAZgWNoVr7Lb6gGfhe/dXr+syALCRixe/7+HHnMIsdz9
 7leJLrSZMDvATc+wj7zQErP26XHUzfF49khI1iWjHMj/aRS0k8/yGm4
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the cpufreq hardware on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index 98eb36bff..2dc2c265c 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,sdm845-cpufreq-hw
               - qcom,sm6115-cpufreq-hw
               - qcom,sm6350-cpufreq-hw
+              - qcom,sm7250-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
           - const: qcom,cpufreq-hw
 

-- 
2.43.0

