Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602023;
	b=wybozjPh7q7TmmkZXDQRpBXNYqvO8eOa4+hoEA0i8YF49bYTxjimYireERAS7PxJyT59
	 yZAwOjupaTirpOkTLio71Ffu5DtDydOJR+fXvf397Rwb9m3frLkQyriUFZ7rtRZwV2/X0
	 WEZx54VGpQv4FsoiC/4wuhfBcC8s7UYytPG9TaY4RcyXNmqcxLiYL0EJJZ7BTa4735ggO
	 v+qMkUDEc/OogAkWQ4gzkFQ12FngY7sUUB1g2XNi5wqCk9skLoBrzW7PClKtJGxMoXjEb
	 1+h2VO8u/EYBSCQi5kp+4oouJfGFaSuO0VcbcVUCIpl4Obk199mfqH0V4O5TE6UeRmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=Zd4UttbjYo11JO+n38BQnbl9AC/v736sfpYh3d6fEf0=;
	b=lpQQJGnMZbU83re7flD2f0LHLiMsDevuUw7NJj+sXzyNjTgMqnBO+6TCP9XdUZBjl5BW
	 5pidbDz/tA2QXE5sAos/iERg7jrFxct27kncalZketpo5FSKf76r52e/acrl5WWE+ba7g
	 EqAgStYPPNkKg1t85f8lrSV+gb4QK3SgRufBkyg2GiWP3m2LQKhK6qjCXcqkU6OFwXusZ
	 EUXNVKmnSPIXIEx5e9giq+TiJ/q7M9fjNatyWGsD+s6uSm7htaWOYZEs8c9c0njsvT57q
	 tgfWrrq5zJKf8wMT4iAUjCfdT9xN3jpoLSvoxnso4aDJepau70oGoi5l3/eO6VMjlbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="KaTGq/QM";
	arc=none smtp.remote-ip=74.125.225.130
Received: from mail-wm2-f2.google.com (mail-wm2-f2.google.com [74.125.225.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42548606A335
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:33:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42548606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KaTGq/QM
Received: by mail-wm2-f2.google.com with SMTP id 5b1f17b1804b1-4a21339d376so701155e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794602021; x=1795206821; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Zd4UttbjYo11JO+n38BQnbl9AC/v736sfpYh3d6fEf0=;
        b=KaTGq/QMfrG+ztyqqp3U0jtvWTe7IwQIm0sWiGKq5xEqdbcADVGHsW1K3+5l1JwC5K
         uHSztfhTvNp2vKDKp1bxlN/IMin5/WBE6tfJZk8LKSCHgdM8Ai+rVF54UIO6sInKx835
         WimUBInSnkClOn1EXHV+7yIlbF5GLHQ+e2+EEYb/DOZ+JDG0Bqj7Asy1GrNc9nQwrISX
         IZj93ZttSaYcOGwhZJEvqWteyXrl5KZV6pXCrypVtNiGxHZwjY2ANL1xGDMmxM4ddPOj
         dfBedUknCHSsgYG7EnWtvWZJc9ZD3MFaKygDW6xz6gUAvkoirnq+uCQQZmEo0KXCYbV0
         kIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794602021; x=1795206821;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Zd4UttbjYo11JO+n38BQnbl9AC/v736sfpYh3d6fEf0=;
        b=UzG+jXAmjQTzyGE/BD7X5KMFw9L2mqV2hPzn5e0K/iQnB91m4Do61z8qt2G4OsuMbp
         p7ZQQpN6VLqKfLFr7x2nV+5vNpIBPlcnx8IcICuuJr+IetH3uoeV01siurHcQOHo9lHy
         LaHnD+EKe6aayBm+rAMU12wcva5al+LKS378r0+pxzLG0blWHSpVYVVm7qkzOQrNrRW7
         tGn3P1waHbKD2RAImX90tGrpU9gWCaSsdFY0skkfz1pWR0743PwvViLgWKXGRjolW3VQ
         uNsa9EN7W9CPNuHx+AXDYUcdQazsZjG2bgMQc2UIRqJKmpryCa3GPPR174itD4gDrjCm
         rm7g==
X-Forwarded-Encrypted: i=1; AL+hErHq0JHZ7k48SF2hNds58FejLeqvQ3YrrM/i9PdAyQ2amkQq5X1u+3oqzJHHmyGHKl7ReuTs/7xMvdgxsl8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mG9iXRM1datT9+TLMKRu3U5r4VNTg1KuT0OCCznOhXGv+iwYr
	9wbUH/wEZSNUMKc4X80xvPA//SAg0kmMS//m4njnC/5+E4UUOepj27HR
X-Gm-Gg: AYBFou1nae4adqm79zOJ0KxWqOJ5VFLLdvabUOLnmKheDC8KJROLJ21Z6L9/R9ssIAK
	qRNEIJVoVyIh+8P1BKquXnvWoMqPAI4MYHds1rcsvHOVPMl6v8ZvDfR/G1hXSKU3GS44XAVlvQQ
	Uld0s5lFrYtF7eQw7rRGYgvFpEY4kd1nkQ31sT3NEHKbBAOQPx3LXXou5KwIkYv8n4AEJ7q/2bA
	ET6eZ9gtOLjZOhYmnGkysdE3N8c4FIq8c8O50pcwIboAgI4nXwBziG+dL4D71KZuAjp1b+ld1Ri
	l0y5dn2O6ZJaaL13BwTe69cwwq3Nspb9OiFgly3sYwZDlmfnhIUfAHuupzABr7r2oSQjAEHE/UG
	RtAEFRqZQT9l6C+UWIlHTGIeuQWdECFEUUIoIC1wAWkdt+95P5ysum4Z9naOQfYYshJtC15DHb/
	OT8z66VjGmhE+b7zSc6WIIXuPKuzLPBa/T92eQCrPJjk+HsIDuIAJd1erTtNYZpH+5elaSQcUGs
	euX6SK7PysBf+xt+O2K/Czz5HfSD0qWySj2ABGz1cNLhyDgZu+N
X-Received: by 2002:a05:600c:34d6:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4bb5599801dmr79325435e9.0.1794602021647;
        Fri, 13 Nov 2026 12:33:41 -0800 (PST)
Received: from [127.0.1.1] ([165.50.16.69])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5667a8aesm59897995e9.1.2026.11.13.12.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:33:40 -0800 (PST)
Date: Fri, 13 Nov 2026 12:33:40 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Daniel Carter <yass27106@gmail.com>
To: krzk@kernel.org, andersson@kernel.org, broonie@kernel.org,
 srini@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 vkoul@kernel.org, tiwai@suse.com, perex@perex.cz, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com,
 abelvesa@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: [PATCH v2 1/3] dt-bindings: qcom: document Asus Vivobook 16 X1607QA
Message-ID: <2c4a807496c04047b6d5735e3946dd16@gmail.com>
In-Reply-To: <9032798812284dd2842cbf003c75cc0b@gmail.com>
References: <9032798812284dd2842cbf003c75cc0b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9xY29tLnlhbWwgfCAxICsKIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcWNvbS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2FybS9xY29tLnlhbWwKaW5kZXggMTIxY2E1NTdjZTEuLmQyMmYxYjBiNGVm
IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3Fjb20u
eWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3Fjb20ueWFt
bApAQCAtMTMwNiw2ICsxMzA2LDcgQEAgcHJvcGVydGllczoKIAogICAgICAgLSBpdGVtczoKICAg
ICAgICAgICAtIGVudW06CisgICAgICAgICAgICAgIC0gYXN1cyx2aXZvYm9vay0xNi14MTYwN3Fh
CiAgICAgICAgICAgICAgIC0gYXN1cyx2aXZvYm9vay1zMTUteDFwNAogICAgICAgICAgICAgICAt
IGhwLG9tbmlib29rLXgxNC1mZTEKICAgICAgICAgICAgICAgLSBsZW5vdm8sdGhpbmtib29rLTE2
Ci0tIAoyLjU1LjAK
