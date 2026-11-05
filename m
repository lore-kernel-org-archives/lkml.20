Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793917484;
	b=xUx6IUMNQoQpGUxNbFqj0Y7VRc/WGQunZghp2P1wXkziWvYgLD/+1SsOi0irHuay2MS+
	 oT0Gf20iubDY85BmuG5BnoTd4kSkrqcKXMIszSGNjET+KPD5Oaat/Ag6QGLSXNM7X+p/b
	 lvfnJ8OvpmRsxMtQJTQ4k20NtO1E9FccamweVbsdh5238Buao4drXrkaaRdLU826Uruya
	 8xGqizZOMcIV9MhAGyTZkmVQGVKH6dqrMe+5Q7bf98r+5pgkKVrx3LeDIchBxI7n4yiGN
	 jJE7hRgrQLeDSG3C8vLCupHtzQXQWLXTwGqP1QUu9Y6Hi0i1qLQCcH7GQfL5JFuXKGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793917484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Z9XTrE2yrR3HPAGKN8cfazsOZArS5Wy1dlBvlHzw8y0=;
	b=glyffy9ermxN2CyU8TWy7HSrioLYBYJ4h+lS3eiLTABWbWS95UL5lnd4TMcW6aDfWzyD
	 nIDKxc6y4iwAc7DxEyPdmlQqjpZUz/hmkp6p8XmRZdjhgKW2qYiB2oB6Zl80WcTjQu4OP
	 91vOp58Zvndf1K232h/rHbob2Zn0kjjqTR+K7/Tkjzhfnq7g3+F0rK7OeSyaBzhsGJqQI
	 cjlZY+TSClCHAuvKBMtFxqfApWo0WA1PR/VBRyiwBWyVew4NMp12nmBj/25gLU9ibxBjH
	 tNwKlD26sa1rFEiiTPK0RN1nwNmI8O9cK4rbeTuwEYkf5kQqo/+1EWpkX0PzPhOFiEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GnGWqdjO;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60419606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 22:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60419606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GnGWqdjO
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b570ff3dfdso1940260a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 14:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793917483; x=1794522283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z9XTrE2yrR3HPAGKN8cfazsOZArS5Wy1dlBvlHzw8y0=;
        b=GnGWqdjOEcjf/+4W8F+F9FVjds3+v932m9PLoYSn38RfJhSVzDzxwCGKWm04TwwmY6
         VxL5eFs9njfpPRpQrH0Y6uCv5kXKpTPOWuNwZk7N+Yr+MMvOnPFCCmv9qskltSEdnJ7q
         geBsjgL0myKHYhfZrQFSev+kBK7WaEBjO64OtPz2GnEun/eIdhSMVeDKOrF/XTFXgKTK
         b7yALxR+N/CVuzhw2sHyro3oh7HpJwXH48xJDWMrLi7LLJ6EDhSy0Xb00kjqM+PJ/fXo
         in6YoOuerlF62CFYLxYfNdcZhs+YnfdJfKBNhqmA6YvGL1WJvucqNPpXQEjArCIoP49u
         Li7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793917483; x=1794522283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z9XTrE2yrR3HPAGKN8cfazsOZArS5Wy1dlBvlHzw8y0=;
        b=OF3rfrskQFvvwqELQIOBOdFqlKQd/6oxQnABq6pG31PT/lNwtob24Lv5VqCvr99S/R
         kBKanUl92Wdns/3zMAHeD3q4YJtWcRsYUOBghzU0WZT4OaqjmS8sMVxw+IkfAslzDMS1
         UipavxQ4A63BsMu7eebxZnUIgsfYidHHvMA7Nmi1e+i4BQfFbriRXHadXegQjMRzHFHz
         5UoZJCN1Ose7RS9PRzXtVNHc2hpH727TMyqzkdAMm23oYUaj1O6fPp+z4YhP+KWvf9ZB
         971X4N3n9IR4rHviRFzUVR5PhNqoOMrdZnnVHAK1lyrP1DT4+KF3HG6FTF0hEn/0LMYL
         SPbw==
X-Forwarded-Encrypted: i=1; AKwUvBzElpgnbQ7ZD4Q42RgLNerxM2lAsybk+yodaq2lZXGdfrlNxNutE7zbbO5/rK9zdBhQ5WazMR+L7xTDJOE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BdYg2TxK06hqErDSqlbmowGoL4Bxlt/0/eiKEUIj5tEOupZqm
	LovbwQxY0kqw7sBQzXZjKBJaq/fSDJmON1h6zBtuvyrf7bmK/rABy1LN
X-Gm-Gg: AYBFou0qfH9D71m1G1CFl+iXWylNON1UljO+eEG9UBcETxexj8fdpVT/SMPpvF2Se4L
	JIznse0+k/AUApTezEgh37gKQ2KDyE7JsKfRUOgq3CrRRjDWL6BPCL98DNX5aDgQFZMlzv1+YgR
	4tmRQtdPwqsFzbTLVhF25P8GWevQiLyToHTLyTZKSma3M3Yfo68pCIG50nA9IfIAEUYUDtTlL/m
	tt+tiIJqah4nRBneb6qkIhOr89+XD4mOlQ8i1SkMl/Tvp7F6HB/AiUahVIeFtkI189gbdCMoUHx
	g/zUW0kRp4VuDn36c5/zwZ95Mjw3D+O/gQOa3EMlWp3OL+rcOK0vnMJQ5jDtKnFEl7DYNa9tGzp
	o2dPiNhAzDDCmu4JwXgIIIh2yfEEliM25ly37C37LKxAVLt60YclMNmLnykZeMKxSesjp9kVIxL
	uwyXtjh6BVZi6r9ZcOSplgCXyPRzVWtszPVo99WFmya6qDQhmvly23q6zcWqjBP2QOB9l8cNqqG
	6CRZ4qYNP87vrA4Y0NgVChXjrWN3R7ggleFB/sbnOuRsf6XsKU0Zk+8DO1xwB7hUoh2TajJAFfz
	ioOUu20dwrxFHhMYvdOe/zqza/JJra/wp/SPANpp72ZahnkdEQ==
X-Received: by 2002:a05:6402:5384:b0:6b4:d7fb:affd with SMTP id 4fb4d7f45d1cf-6b5977de20emr411756a12.12.1793917482391;
        Thu, 05 Nov 2026 14:24:42 -0800 (PST)
Received: from letov ([62.41.24.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac57b9csm2103697a12.15.2026.11.05.14.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 14:24:41 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Alexander Letuchiy <asalde.le1@gmail.com>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible for MT6895
Date: Fri,  6 Nov 2026 01:24:34 +0300
Message-ID: <20261105222435.571449-1-asalde.le1@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <xUMh3NwVp4cBhFsWWFE2Xng4h8YH95iJM37_I158WAyVmsRCPbirWT1iU8eMFeiSFw8xco0X45o-2NOeB6Jc4_nWAg25pFPgDMwK3mKzm34=@protonmail.com>
References: <xUMh3NwVp4cBhFsWWFE2Xng4h8YH95iJM37_I158WAyVmsRCPbirWT1iU8eMFeiSFw8xco0X45o-2NOeB6Jc4_nWAg25pFPgDMwK3mKzm34=@protonmail.com>
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

Hi Roman,

Thanks for looking.

On Thu, Nov 5, 2026 at 11:50 PM, Roman Vivchar wrote:
> Does mt6895 actually share the same reset layout as mt6589? Given the
> generation leap between these, the former is very unlikely to use
> the same resets.

The vendor kernel for this SoC binds the watchdog with the same
compatible list ("mediatek,mt6895-wdt", "mediatek,mt6589-wdt") at the
same address, and its register definitions are identical to mtk_wdt.c.

The TOPRGU reset layout is the one thing I can't confirm, as I found no
reset table for MT6895 there. This series does not use it: the DT has
no #reset-cells and no consumers. If reset lines are needed later, I
will add a dedicated mt6895_data to the driver.

I also tested the watchdog on the device: while userspace keeps
kicking it, the system stays up, and once the kicks stop the watchdog
resets the board after the timeout.

Best regards,
Alexander
