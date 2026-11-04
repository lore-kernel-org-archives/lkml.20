Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778429;
	b=SgxTGRA/8EkHSc92OnlZ72i+V59aUfF3vXd01J+7VZr+xml5LfnU1BWARfMb2llwh2ga
	 sUiu5/W7cHbwe6VgqKRYErNLY3qZfQeHWFs1MgVtnm2mVM8jwUw8L9+7TdRZSpe45Q9Ku
	 HBYIWEK7oJwo57QFUkGG4NNgE5qXVtimgqEmffKSlVSoy0o0DJy5vNqRBGXGTc9XRf7SX
	 kleCutd6z+T7bYuj8fv4tleMaBAP4JUvXeACwdfXeSh49QSZM6JeMzSyg5wBnJhGgBYcj
	 NJiYS4d4XvJ8k40pmcRDKDjdoKz2QldFhYMXCH0QMgl/9jRKgHyHk+b65Ae6YDMtNrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=J6yu/WA+9/TduvIgw8i/6/eU7fXdqXxpE3Xb+fSN5P8=;
	b=qBIBQtgKgHARhn5XtGbO8CAGrXO/QcGL/HO8LswjoJq3h3jZer0K1oHfHNXxUD7eCrIH
	 yuGOGSXsVyLxWYwwG2Y/iQu5eS6WryLQHLZKF71tgeG/5wILFvBT0Oij++47b+qxeHIfH
	 AOPkLNi9BDHBwCBvEG/AZEjbq4xN9ooUk7ESoVqaV5oDKPErKIlhaReCIW0xayZ2Zgtkn
	 dhCu8Qe1iiHyJ3rrEDGZD+EMPu4eCEPJtm1JxOv+9X2XAGtGJ8VClDiq1YY17dA19+oyZ
	 4GDBn3ckg9BGXAsS+SvrnMg2PsQvvjGmX6bYP4ITx5QS8W3Ozttn24LjslvVmHr5Kdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sl8t+O+K;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A633D606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A633D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sl8t+O+K
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35b2c599f43so801190eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793778428; x=1794383228; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J6yu/WA+9/TduvIgw8i/6/eU7fXdqXxpE3Xb+fSN5P8=;
        b=sl8t+O+KsQyQ5DSrejOdiSjykamgCVW3ly1JTuZRkT2dhUs4GoP9/ThyCQGBq/XCCp
         U98webc/Ysmoh7c9MJY3B5oI0yPCgntB/GcL9AXhTlIWSK5dygUBPvtaa++R2IgqaOwc
         zncsdYfkB9nhgfUkuqV4dxLndUwnHg2X9ZS7Nm3H8HIkAU5e6QZUSZrWfK/IGGrwpORd
         vlEbLyuIsO+aHaGtUKKT0QXkAnEyY83eAafBQ/gK7LcQOXlhYuE1e/IaBdGbUobFbizJ
         gKELP86j/916+BNlfrgufWSt7aL+7ggPX5PPBcSFgpyaQEhlHk4mx2oV67aPqyfjc7sm
         /gYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778428; x=1794383228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J6yu/WA+9/TduvIgw8i/6/eU7fXdqXxpE3Xb+fSN5P8=;
        b=WZUUEJYShYaQl5hPMipr+8iXJcygOXGgp+98rwOOvPZJquTRRwfABO3N/qyuHMQsB9
         poj1b3Bog/kyb6a/nn1YWR2OuwF61Uo8OC5M919WR3DbLDesDRb4x/b5HXbFs43ipSWy
         s3DDNrhMoGf+niQIzs1yBy/6XqhSPoID+0OUrjmJVZP+OVI2OrlLU0aOnCnWv1AtcN/q
         qqlkMVgWmTfkN5G5jQGk7P9yQ6Vn2uSqmBfCCJ4zu0wVGj1+oSqoKAvsTMmU/VO1nTfx
         2sB5VtiAioK4JZ1EO0Wn3r8FysN1OMlKqR3D7tc0n4rEZYUYySQYlxt8YGB40gwMPCmS
         CxDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwptJGRnBmS9PbUgzlXVAYM6vPPjaystPL/Li8ZHjn3nY3uuQHpldbTzOvtApQg1TcR+Y3EozwRRTmWf8Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dRqNRAzZM7XL2Z6gpZQMtee23Tk1h4BfzNg6Q7gWnVU8rf15A
	AHbkiXoe2foBQh7iao9DQFBYUOuU0UyGNsrAbgWn37vTq4UkkmctECSKr1E0Ow==
X-Gm-Gg: AYBFou2dyTAJOg5zTRvVqBS7y7YvBmR6LPxXkUM8KpCmjAMoOUrT7RxrPSxU/RciCpi
	7KSvY3Of07WVUR0So2yS83HXidyhQLBs/Gy5ZTHao4vD7/ORUcs5Kl43D83AWhVo9EOvqiaFrRu
	M9JqS4aT7j17WrQ6EmGY5VQ6BXgf/kPvEZ2BGwv0g7g4jjD0WjYHJmz/Fw3vn6b7fhb59/heV8q
	wla1ZPV6J8kzSa9sTHT9TNeEoBL5rhnHtoMfJ65bb7lhfNqs9kLyoNMCOpyD9TiTSnpkjLWCvko
	S53sJuk/hSYrbe2umA5TWBE9sRFkoHrfC+fOyYnG9XTXJ8gE1rJaHnNWBrlOnI3Ny7Ymp+jULe/
	boQpmdF4HWWu1knztAdsWlmkVPMXFwHGXpRUCL8vXkqMxkmKKwKlMv9hfw/+c3l8DvKkG23k7ZR
	oenRjx2s0Em8DxMyUTT4PZYFuGsAvpS50LZlC52L17HRzHq/RgZnX5kQZvHUAomifW3qwBEsM2k
	SfCIFDQPPQqh1tl/iUiWpwDCgWnMgA1U/frz2/Vw1/74DavlnxNIikxsHCDve1VLo4BERvfiw2F
	oPPR9TwzAZ5MgFEl4O436ZYVnOzR6jYBxzAFEG22ZIqS3ZTmW+WbItQ7bNY7CqYD748E8XsQF0r
	f8Uq14Q==
X-Received: by 2002:a05:693c:6316:b0:36a:7bb7:4609 with SMTP id 5a478bee46e88-36a7bb74690mr7403733eec.34.1793778427751;
        Tue, 03 Nov 2026 23:47:07 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.204.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a67edsm4566016eec.8.2026.11.03.23.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:47:07 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Wed, 04 Nov 2026 07:46:08 +0000
Subject: [PATCH v12 5/6] dt-bindings: thermal: lmh: Document SM7250 LMh
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
Message-Id: <20261104-master-v12-5-57fbe9eef978@gmail.com>
References: <20261104-master-v12-0-57fbe9eef978@gmail.com>
In-Reply-To: <20261104-master-v12-0-57fbe9eef978@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793778372; l=839;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=I+Xei2sZyAD45OKuTBmy2G1nFWggAI0hWE7RAd9U7rk=;
 b=GV9sBUWE0iEAWwIlPa/SGOrrN0lri3O7hQcwiFcVGn9liKszfRaOKsyvnpyVcbDKLNf1fDcL8
 39Nm0QD11IADHiNAZse6CTtX0O+2atStZ6s5c7Npz6bntVLNBEkGcjo
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the LMh compatible for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/thermal/qcom-lmh.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
index ce72347e2..b8da39f8a 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
@@ -26,7 +26,9 @@ properties:
           - const: qcom,sdm670-lmh
           - const: qcom,sdm845-lmh
       - items:
-          - const: qcom,qcm2290-lmh
+          - enum:
+              - qcom,qcm2290-lmh
+              - qcom,sm7250-lmh
           - const: qcom,sm8150-lmh
 
   reg:

-- 
2.43.0

