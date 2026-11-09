Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251104;
	b=rNEAusi/Lfva+OT24qhgRLKMRDghSTqmq5ngoF9PyX3xoEi2zPU8EinP3p1iIyqd+Q8Y
	 4Q5P454JNSkIvfBkSuFVYP4IuXK3bmh67DsBJtOG/P8OtpF2kEIrl4yFvZKdGtH5ndsLh
	 O2I/zTRTB1Su9aYqkwJngUIQjtUv8kh57FQI0ASRg1fCuiKQLoZTmw1igIfvlC4n1lJX0
	 i71RE36NjYQhxPshsWCoWmCvBoPev/XdN6QIhOr1lE1wIuTJGjCcdXYz7xJz+pFqiJgR3
	 e1dnlf33+96bi8wT6I9ZX2MB9Sfp8G2F7GNezQjJ5+rdqOFZRlNCyvoMhZ/nyfhEQHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6Ccwykaou03iEXdgsVl2ojrfIyiLm62r6nS34ODXJLk=;
	b=dbTusJPrjCfJEdn6UYFG3gvvW90Yhjs3/zc1ajVBV55q1qZuab7P5Fw9ddqvZRx3s6lS
	 5+Beb2VI9QwOlD32zjBoxuGJ4+TVW/cXucqXk8Kj96JfedacWPFdD/wSXZyq9Z8kRyyuA
	 8yQyw9gy4McStLf7sEYb1BrpvEPtdPLdq1KL2s2OLGlml2wZIb7G9bYsKS1vo0wHVDZh2
	 1KMZPLCbpP1JmIRjCqr2nZQSdn4BsNMkmhnI1XEAoOOQLhVL69LEGeroaTNGPyTX0mDGE
	 lXAYH8H23OrtTocHGIJdT9AX+tnSDDcUbYJ+vyUCGqO2ix8GrG7Y7lOXlCQYPeT75zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=jv7CoQJf;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E42B60A3820
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E42B60A3820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=jv7CoQJf
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so13519285e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1794251102; x=1794855902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Ccwykaou03iEXdgsVl2ojrfIyiLm62r6nS34ODXJLk=;
        b=jv7CoQJftGCU4PBxF1KDzpDlQUH9a8qKtj4O92bLRSO3djfFWCNS1FPah4as/ZdEgO
         p1HOwXwuJgdCE6rZXINhR7fxok3QUuovGgTfG+CGDPmFFhwd1p5bYlMIGp2TV+d87Omx
         VEqk2lwx+EYiC2G/yYeLVjsyJO6PHsmHkL1H8yYGfpOi3rApQI3lCnQMficcBNzs6jTg
         syLYLv1+W77kS1CnuO0iXi1LSilW3fO8LSsGTLA74K0rBtkCWq2aTpTCeFPk6QAv/Jky
         WCCMP1dmI3MmMIE2klExHJ+omw3u7NxIvq9kmB/BREtssb5sjTqHdJiTXxdok0QifDx/
         l9Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794251102; x=1794855902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Ccwykaou03iEXdgsVl2ojrfIyiLm62r6nS34ODXJLk=;
        b=QNYy1xQF54yjVDTTT0D9iTVeZRwYWD4eakqJRK/ZmPPh0zM1b5o5cE0w3IlGi7CY3m
         BYChANbBGGNwSaVdHjZQ8oaSHpw48KO5qMiHh/D6lPMfLHNtYH5zk4IjtRqdhkEMNgjy
         bKRGSD/8toKSLS+fBi5QQfmtdjZH5BdJuc44hYo/vEzF6YponLZ+rnEOEHSfOY9txE+w
         wfiMokj3XDsVNqr8LnC+blIpt9BImQGqai9JgeFFJyKbw2MvJX7jD7+C5Xjn79a8lhxY
         b2cbAiE3hvP+vKTN7tqZvObrOQBo9QTxEyfN1xqRtmFDkguvPk/yVBNsgu5JzYsOU0oF
         ML0w==
X-Forwarded-Encrypted: i=1; AL+hErFnkrLhCSWY2CeCk4lCyX7Y0Kp7TGUbxApyYSA+2E0usjz/yz2GYOjnuugeZr93Fp3rZMW3sTeVgGjqnSI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9Ibmh+Ax/0tOGK8ekHn8CwK5W3Nmnnvyjd4MsQ5CzCyVDO+iy
	9tTTDrCkk9GBLBhp0cpsX0L7hXlHHO4HukB0fRFE8DFq6zyjh9ENpdHyPbHJDPs2UJs=
X-Gm-Gg: AYBFou1rqtGJT3p9J9GRA0L1LkQNg1Bj5Xyit8q8L+M2ybOsBViKxwob4J10dXPNNQl
	bj+6WoErxoALCNn/qPRJ/UplMaUkxCgNFhFpBUIRhMq5uatzlXJmn452W4fOn9gi3HKslkpRnVd
	U3fztUUaFU2n1+AsHMhBfOyhKQyhADcMCnaoddLmn4ool8sdlIhKFCUx8Wpab9+kQ3PlZVQT0vc
	t9g/8Logqbv5dqCud/68n8Dz48M96kt4+/xuQsfGzN3vUUSt0JDU2DWH1L4WsjVK/1OqkHcwFF/
	5ZlGtqnu79CHeTLuG8FtY29B9gmX0PIl886qid+eEBjNW9T0grgMOPGi1VR7jz1ItNjwT6qgv7c
	CmnZC2b9kvkypEfLCyxrWzJx0L7Zr4bCJJcM/rZSZWcVJzYXF0fgqQ4MDuiWL1SVEqxQG1KFwZw
	UcCN6Aqv7obeSSZHwj4o5Ie8TavVMsx2hN2M1XWuYqFoO2+PIxHyNWPbmb2iJzmoe/s+I/UxFYA
	6KtDNRMi3VhpHV/gLepahb7XR1XCJh959ZCkNfTVPjWGDB2WpM3KynlbMORT/w93QvAXxNfIpzx
	gYvKE/+TjdDTeWpk8blOphabaR+iyuKxe0fBLAQ940eLoub4fOYvv3RrTjgRRB8=
X-Received: by 2002:a05:600c:6291:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-4ba0234ead8mr3131845e9.22.1794251102350;
        Mon, 09 Nov 2026 11:05:02 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:e834:fd4d:2ecb:b787])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585c4fdsm543440f8f.10.2026.11.09.11.05.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 11:05:01 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Andi Shyti <andi.shyti@kernel.org>,
	"H . Nikolaus Schaller" <hns@goldelico.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: i2c: ingenic,i2c: Add the X1600
Date: Mon,  9 Nov 2026 20:03:45 +0100
Message-ID: <20261109190345.61480-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <at8jCGfp9dKjieoo@zenone.zhora.eu>
References: <20261024212520.91401-1-olivier@mgcrea.io> <20261024212520.91401-3-olivier@mgcrea.io> <33b5ee36-e293-4356-9906-54e99ba3557e@kernel.org> <at8jCGfp9dKjieoo@zenone.zhora.eu>
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

Hi Nikolaus,

On Mon, Oct 26, 2026 at 10:54:49AM +0100, Andi Shyti wrote:
> I'll wait for Nikolaus ack/r-b for applying the patches.

Could you have a look at v2 when you have a moment? It is the version
after your review of v1: the spike filter programmed on the X1000 and
later, and the X1600 falling back to ingenic,x1000-i2c. It still applies
on i2c-host and on v7.4-rc1.

Thanks,
Olivier
