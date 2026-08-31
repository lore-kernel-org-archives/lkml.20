Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA9C405C29
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199878; cv=none; b=g5AlzLZRZXsT23DXHUBX7PPOyCibrxoXQLD/bKh7yJrRJ+jrlhCqmrD6dVVaQexEDLy4ItkhaSkdWv6JggSdODkvVDD9ZUShogG9vUzfnwinT93VblxRc+7Yz2lEdiNgkFYzNfRwq1Z5fJAqO8sejxOVXqMMzOvRvuGQUwabozw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199878; c=relaxed/simple;
	bh=bFwA0sriWkTlKXRDjn9IKo6h/KLj+VklQAPyEN2y9fw=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=L+Ix6fvsKiDmCiRySw2gFXFlZkBWEtMxbHrJZdG6FYOdvOHyJlVTTbUYk8d0PQ50TXZZ3Hj8TrK+9I7yxGyzT04Q2gklAO0QYlFdCphmymPb8dQzOWuFAee9LUqgYfHSAGAmWrYe/CGPazz7ZsmUU5JLmATBYoyFlGBmnXRX/2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=YXX+AqM1; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="YXX+AqM1"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8534d507f59so4213273b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788199877; x=1788804677; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qPRLJsmBIOe0A/ppcX8+UUJeiiOHfTZv4IvoKZ5g4Q8=;
        b=YXX+AqM1DIvN/VJGXXE+xbzosC/g9aU1PuKZFMZcqT5veZpSLaZDLma2P4IjEXsM4s
         aSeojHdFdc21MIGB795dL9VLuXYXjzrpqwGTivic4J1ufbeBjaXQfVfnC3iThmX4rJYK
         Xk+96FTfYz3WjpJxEB99Q0GTCtAwC9LMKpusJNug8MDMu4+V3QhKoQ1m/fPy6eL4ZwR0
         xXs2YriHfyl3JsJARWvfMQiG9WHVYLJrc6UWF2oubjQFR5nMdEXbOhmNBpcgprGXiqdk
         Ek7qyAI16VS+YaCqu1NfovXxzSNPIDWNXFD8SvT+OhAntxYitvcGNmGe6xAuXj/imijI
         LJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199877; x=1788804677;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qPRLJsmBIOe0A/ppcX8+UUJeiiOHfTZv4IvoKZ5g4Q8=;
        b=rBMB/CFLmxTXYHasixg9izLnVoYVr5dbvw7LcJvMwqngCz/jpXBwN3dP1vvBGGvtUt
         /q2rh61Nqo6Gl3m158IRGZFfV6EF2mhoKARXQLvLZ9p20FQoiiZRAC9NFhPewIZElJT3
         ci6Qanhv8JnTCkYjeH+VjUXZLmWC0PatCb3TiNN7JJDF7Btw7dFxv6vicrPHQU2DC/70
         Qac0eilX05mhABrSZsfxyJGmC/zm7Cgaadyu74YE7eGbQKU0matoJ9XP3akaPkhhGQmY
         QNWpzckfQImgFMU8phAKapQHW2oekJjyAneVmxeq0VlzUanAgsBLQSCN2K4axOIfAUr5
         HZ+g==
X-Forwarded-Encrypted: i=1; AHgh+RrXOBF4WbK3a9+BiNYDtv/kGIUTz92ZqtLeK2pHFr0UmnA+3tRU7bxBEaKXB5jVD8vXSUr3kRu6FmHO8+Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lETLawQnhSsw6a4OZjWt5v3/1xnIBJaAtISpoXUeOSn1QpjjeN
	NZ3XhCzJG10mAAHl4WqWn7c9IxByvtS7E1gJsb4mp+Vm9ft/WFq+pTxjf1UxBfqhOHfaYYmGG1y
	FUzN8
X-Gm-Gg: AR+sD12nDi/qRhIIY1eH0INAPWS/SUhIN6ZnyMVgaVC7A6i7HrS5GPiBxwNbEmkgQC7
	xdgquhDH49RCrkiHaer9lI0kBQMQNrqj8DUycn85m8uVdRiqMQ6+jljNlErYHIW8WveXke+5Ijx
	Otwz05gCAaRoRsRd4o37rULX3y2svDOzK/wTZE6meXztXLd+tinruxtCSWCUOcy3t1E7WunYVVh
	7oEKVE8VtBg7KwTRTWqidbP4GL2dup1LAxKqdO51OkhlU6j4APeMz7k8+3qy4aXDHewU+MXW5hA
	Y0P4a7KLk78EcvhCbUQSFQuKURYAvzD5x5B5JP1N5HfW18Sg8sph8A27h1k2dBJBw3aC+oy924t
	F4EtvAxTfjE+Ougd1yU1I411u13JLpIck6shxFksqJ+0AOV7CTuGuNqoxsUEDf89flAzb5Nyj+s
	XxUOGiqpR3ZkwJba4D9fVd3gdEI8O9jU0QVYvNh7xt3a7Yy5YVYPiYEqPU1Q==
X-Received: by 2002:a05:6a00:348d:b0:857:7337:5dbb with SMTP id d2e1a72fcca58-85773375f79mr30960283b3a.25.1788199876932;
        Mon, 31 Aug 2026 11:11:16 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-8569fa79d0asm4201641b3a.14.2026.08.31.11.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:11:16 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260806070306.40285-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260806070306.40285-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3] ARM: dts: ti: omap: Correct white-space style
Message-Id: <178819987124.2869653.12350593238892028766.b4-ty@b4>
Date: Mon, 31 Aug 2026 11:11:11 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev


On Thu, 06 Aug 2026 09:03:07 +0200, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like missing space before bracket '{'
> character or spurious space, which will be flagged by dt-check-style
> ("redundant-whitespace" warning).  No functional changes.

Applied, thanks!

[1/1] ARM: dts: ti: omap: Correct white-space style
      commit: 0fe80eafa36a20fec620ba16992016137bbf3d6a

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>

