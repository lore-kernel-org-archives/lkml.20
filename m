Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792689561;
	b=t3xe/UO52ADuW2bZ4VuXsscgDEOcS2O1ROOKGTp6h78ycZXx60IKHYkA8MFbhPYyfoWb
	 u55RpOVRRXlOFBIQ7LmdLT+PiEgkpEY0HuGRQqSvUD7CWXoKXhnxhjIdyP/NyI39rJ13S
	 K7Hx4uWpDR2g13ZtKI1QhZRkY6mgj+edmrTV1Nb5T+Lcq3OBb+gH/3kQDxSzT8S0tUPWj
	 229feQIvotQ3dAtAKA+S5U8bIi0cRGMfFcSIArAchddGfK4wWqpzb6n8NVrQppilgJYCN
	 49kSEn5htg1OPpaccCmYghyT+Bln9v9TiF6FM/4f+g9hBsmaRV9or5QGzJDSaoSWvIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792689561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3bKtw6qQows0gC9AWiLOpi7gTzdWw1rlVgJYihuA+WI=;
	b=LgWzt053XjbcsZBINk7wt1zqBZ7vCbXhpfNRL/B+uZlHM1MIknQQ7LcfbIXOKjSFo4C4
	 UEzgTX6M+/zxSZQPbDtsUOrJvpaxDNMWN/okWMEoH0b0jvBT9yfdQftMXfb15f5s0psqX
	 5Mou5LsSvJUKRAsSVsiUmuss+wFRyGr3lBvAV8a+MBTI89furvgQ3ZQ4mAaUgVe27OS7m
	 Fv7JctaqVjrAIgHsesvGEYS0OmP/N0DIDcSgic3JNOeT/2+yuKe4yUSyVUSPVXoCtzgez
	 vAQy/47Egv7MZyxBNRNT9bzM5Q6km9eGI1UsyHKyWMbv5pHeUjWEFQ+sWzU20DwKgsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=n7aCFcVH;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398CB606A324
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 398CB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=n7aCFcVH
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso753145e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792689559; x=1793294359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3bKtw6qQows0gC9AWiLOpi7gTzdWw1rlVgJYihuA+WI=;
        b=n7aCFcVHIf23YD2ATN1+PCpQCnZBs2/F56exZPhnkZiPsC5VMKba+7OTyZpvruXwqI
         WVKjZ2znsZwvAbcXkSWTastisZkY8WhRgvf1Ev2LWX0R4KPLVDr2bK3nZdzx1DlUdciS
         6+kfF4W1odMzMGdWut7hpELHRSDCouivKghnpk1Lj2fJWLYTUAHcXgqVZ80fTYuwB37a
         s/eEimdQld2nvKHScW/NbxfGYCXKLStY/Q8tB38SZFGh/V4xhGh8GaL5CQL8OZQfJzK3
         2ZglVMVNbmh1JhFIhEf7cVqhDP31ySbUoVPn7UhYhAgCNsigYvVienBgptWGhYwwIcX+
         CCJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792689559; x=1793294359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3bKtw6qQows0gC9AWiLOpi7gTzdWw1rlVgJYihuA+WI=;
        b=XRZZcfC6sv4lQkbjZ/LZFosUfqqe+kLcKEggrWZQlM+TCqq4bYNgitOe635XeOQcbp
         eVJcsm+YocT1L0B7E9FqcMW9uBdhgWII2LdwqiFSYHz0+9HK39gLJqdRsKJTNXjXEVQf
         6EQxApE4kbGZGFBQE/dP56gayIG9x6WNIBCiQejnsD7vefYYgv8HxHWAW9Zp7vw7lD+2
         ftHddNNZlcC7E/QpLz8wbh7Ep6O3TASJYLEkjd0iiOzQZKmwKRwTpf5bSa62e7NekwTU
         9kRuEzKZoKVslKHGfl32gGX2FuOTdIw+pN29vZSyhiwgDIr081CqM+7DLoTJ9UswiAOt
         AF9w==
X-Forwarded-Encrypted: i=1; AKwUvBxUCioLjzISOGJ/6DG/jNzVbAsE5E1Zavjq05+JWa3C4kevuo1rT5kpcWdT+R+BNrUGj4tZ0udO97/kJSw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIx187Ia0cRJQDuh/M1XeNp8SQ3IH2pJQTRBmvupxjCN6DvBYL4
	TfQ3LE1d+LNSUShzKfx5aXFi4f8utHhXbPtJSqS4y72Ywy5sQQOnVxEL
X-Gm-Gg: AYBFou3WoeDSJ8nBp0sjqH16OvxcPCfXCHqFXP5Q5xgy2kBuU+Dk08171DAbUEn/kDG
	lb5/Ur2rYL+grKS15BeOhqVrEmiRORwH1Ym+b5LnTliOpudo41vC2i0ihRYGbUqex4IVPYN6Ycm
	WArm8pZ33Vs2Ej/CLEWuh38DVdhDCT/oPnrkoNeYqSIhSss/qcjOohIclTdg4yY+Bk1kbxLk8ql
	xivj5GXM9bvuZclGkG3fadigU8QXxMQBcaiCyBksOobueF3bOT5QqNv9j6ccgCUFTYxy2VCkNai
	zmh3bOy4jQcsocwgjzaSXBqSFfJpypPthd/vC2iM9WFsmAF3WJdQ5B/EJWB1k4mY4fnayOAFS1I
	XDAievrFd15kPnH1LZg3u+HpkwdRo3k23thLAAH2DqGBuy3Ao30vhvzSivyqLQg6AKzmwOqGR1q
	6jeOREq4f7mKryCAvUzy8rJBzrkJAj7xjRUKr5lCiEYnAii4wTPHBxdV9wqi6e/RD2vlFuzPL0B
	yNqlLfkDkM+SwRC7uo9EdUQDoJhpO1hv+qM7oXJu4loQY3GBYWpiSSlHodG3Ho9/FMKm9XbGvJN
	J0NBmg==
X-Received: by 2002:a05:600c:8b4c:b0:4a2:729:f7ce with SMTP id 5b1f17b1804b1-4a20729f92bmr51922995e9.8.1792689559453;
        Thu, 22 Oct 2026 10:19:19 -0700 (PDT)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21034d740sm11288215e9.4.2026.10.22.10.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:19:19 -0700 (PDT)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Joonhoe Kim <26rote@gmail.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Casey Connolly <casey.connolly@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladyslav Tymoshchuk <tvlad744@gmail.com>
Subject: Re: [PATCH RFC] usb: typec: ucsi: Schedule connector worker on freezable workqueue
Date: Thu, 22 Oct 2026 20:19:07 +0300
Message-ID: <20261022171907.2021-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <20261020132432.998-1-26rote@gmail.com>
References: <20250205-ucsi-schedule-conn-worker-on-freezable-wq-v1-1-107d1356b77b@linaro.org> <dp5ohy5piss7osycibuke7kwnfl5elnmc6gfvqgfh6mzzrldla@sru3ylzrtuea> <20261016125044.1085-1-26rote@gmail.com> <20261018150136.5896-1-tvlad744@gmail.com> <20261020132432.998-1-26rote@gmail.com>
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

Hi Joonhoe, Abel,

On Tue, 20 Oct 2026 22:24:30 +0900, Joonhoe Kim wrote:
> Abel, the RFC has not moved since February 2025 and two more boards
> now need it. Do you still plan to respin it? On Dmitry's question,
> 7d0767c5cd87 took the same approach for the altmode worker as a
> stop-gap until the PMIC GLINK rework, which may help here too.

I have sent an RFC for that rework:

  https://lore.kernel.org/all/20261022164151.592-1-tvlad744@gmail.com/

pmic_glink holds the notifications back from ->prepare() on, and
passes them on from system_freezable_wq after resume, for all its
clients. For a notification that arrives during system sleep, the
UCSI connector work then runs only after the devices it calls into
have resumed, so this patch would not be needed. A notification can
still wake up the system, if the client's device may wake up the
system.

On SM8750 the series avoids the reset on an unplug during
suspend-to-idle, also with wakeup disabled for both clients, on a
kernel without the dwc3-qcom fix.

Joonhoe, if you can test it on your board, that would show whether it
also covers the FSA4480 case. It is on top of next-20261021; if it
does not apply to your tree, I can send it rebased on v7.3-rc5.

Thanks,
Vladyslav

(I used an AI assistant, Claude, for the analysis and to draft this
mail; the tests ran on my device.)
