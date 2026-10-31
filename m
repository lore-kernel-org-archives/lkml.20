Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463880;
	b=L4WHJZp1tQtLgmdUjshjfqJE+2KOzyOU5rxXaHnB6o4pnJ+7UGCPzr1C9KLxmxKiJ6wo
	 CIBpuCaiuFgPKRCz2SE6mFYOeEck13JgJhNyGeYeax3sPUuY5isuUbCF2anKZJnn58v7Q
	 c+sQjDG09Wljb3zBVLUDbA8ZhRGYaUPGq5dp80IQSCeIoYWKI/emMDD7B50sjXKMpMjl3
	 9ghIEKnE3mgrVV1iNiRCqiUi3XwddwN5pB5zjkb6Qg7Ku6n/eTEGKnPTtfWx49O/147gA
	 GPvku2J7N0WDLX7VE7um2yKteqQ1Fu59ZjCiyb7JGf6DWvOXsavs0NUJgcmgFNMFjVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=RUAmFD9Oafnzl8e9wUgKXyASSE6sDb5DqBio2IgezSc=;
	b=OIpeqhbUeu6QfMNCOO5KuOFIFblpIwohunqDs5xTc2XKphjZYkVlLeJUFf+y2g4iBM/j
	 NlwuKKilVNQcjlaqZRL98rT3mZ08tQlBWSBzHpjcGGyUNBV8PXrXLHDjdFacdjq9cL0WR
	 /8OUEh/cyfUTtnEDiEERQAWv74vxsJ1oq0SMi0x83Edk5Z173CcYPjb9NHDO0m8EBTRXM
	 H2molym2UN0K6eBQeBlPUy7uVgNMlKz0jp5oQaxGRFnZ/fOUkIot+fy7AkZYsUCqVuiSu
	 N5K/5XnTFMDqC5FQ88QOSm15AYeUv478vLqLSCyaRKOJ1btXkMPY6TRdsnervcstQSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="yq/pWgdi";
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAB1606A32C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:24:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BAB1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yq/pWgdi
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5364c951da4so16568341cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793463879; x=1794068679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RUAmFD9Oafnzl8e9wUgKXyASSE6sDb5DqBio2IgezSc=;
        b=yq/pWgdiyCpd1vdvfsuGa/2o7ID9ecW4qEKgJeLhtCzJ8u6W7o/2nn5EQRsUMfyasd
         KjIPYEP0mDurwMzq8s72gSr1/YDrZ99jDbc3EcJCeNh8yADXnWZsPGuI/croyX/Z5RgP
         GkD/GLq4Bp/cljhrcS18pT6IhYrIkwc+5+2uU2KkhOrXdbtkEvynKLV2OVVUmFR3Jivd
         me5F+C4IEgS5BDzoPITHTR0Sjbutsa8TmkfYSWcg+zYBUbHFifAAi+UUNViALQWSfj0g
         nhbfQ7kFBpQZEGgLgK2Rt0oCynFfPFVWO3J8+ksCduLC4MhpUaTJRLlv+Caa9G2T4YMW
         DyGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463879; x=1794068679;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RUAmFD9Oafnzl8e9wUgKXyASSE6sDb5DqBio2IgezSc=;
        b=vJHVvhFIceq+mdAOZdWnB7yfCrc4CHBA4X9t3POLPkTg0D5FnP1+irQU/lsSOvtHSj
         B6OM56liQ3IsKVfTDpUnXWqFl7ZbT/vJ766Fgn84JmF+vkMUZWseJYZQLgQ+s8pCgz/B
         7qxzDA+hge9I5ybKKgUVCikJy6zaSzTzLu0ftu2Lsgd+JoiqEkX6gvYphGIuYnJ79asV
         lWQG+GHV1XdTn7E5tGS7g/ljxlHe6CBDjW+FGYOh7w5f6VtgGmPOdzkaMAiClkWB9YbR
         qinLwjDUifrTAdGYZQHcJOgEbqcnIy87M/4nQ+PyC0qlppme1MRTwkAOefTuYPtpLGOb
         SzkA==
X-Forwarded-Encrypted: i=1; AKwUvBzekfNSlH//61louLxl6aTNjB+sV1D4b6sdQ4FEXYV2TOu9kNT8gBT84vQM/Osbd0seolk38gTTua/YmqM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZlMoSCor6ytz8cZwDv+mvKjnaXfhEA3tAmXitarAo0JzUhQn/
	gymimrNFQd+bN3hHFncFHNR4f6eLwidvMkA5nyB2OeYtegI081s+ULAx
X-Gm-Gg: AYBFou3GnCUzH1UNcxY7/ZJfagAVjtkeRsQWJneT/TZsXZ156xeLErSktm635Dvw9/W
	qYpDCVkI+/9hDVYoO2/gQifaf7ObSyuIeWJQ4zpuumIJo5IIrxHyBdaqPbU32zooxfGl5Mib8tv
	29eQjuwc3KfGkCWThLl9rSpZycG/7iDZpLSjh7qMbQiWglRvvGtBq9aPkqUVV8GCKmbLl93CahR
	mtM3lbmW9IPYNBg0jYK5C80ULzJpXFY8fRjIzYWKqkzWCFpYqs6RqnvGbMgOhOQ5b+ZW62OrTUJ
	55HkK2H0zaupA9NJzYZwgs9Ar/qHxAXYXgbWnqPYbVEAQGiqDxsSAAhTrvT5SuwpAFsm7SQaKnj
	BOmqbZ9ti0+csxOll3cG/Q2bV9UJHAfclNZbq1OA9+x3QRRd5M/h9Z4sVd+WZ/zsJAr4oyAQo/8
	hZgbzOKDzS4ifAixPU/S6ry9uDaoYgdvRDWfGlPc917ITM1NJcyNSWLePPuEwyShB6wbs1N9wQo
	sPsmGop/eRswWPYtVv3yhF4+hHC24v6tHn6uGkCeo8n8KnfAt24PxYlzC7JyouRotFklSG+zXyg
	mQ9gPSjIsHxtdVKbF9zGVW00qVLS9cEK7d6hdHVjLJuML7hKmeUVYSRLurtandQEb1Uc9mjI74f
	bf47oYQ==
X-Received: by 2002:a05:622a:17ce:b0:532:cad2:539f with SMTP id d75a77b69052e-542b7b0a59bmr93775091cf.53.1793463879448;
        Sat, 31 Oct 2026 09:24:39 -0700 (PDT)
Received: from localhost (h159-112-31-107.euclwi.broadband.dynamic.tds.net. [159.112.31.107])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54312a5943csm41374121cf.24.2026.10.31.09.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:24:38 -0700 (PDT)
From: Christian Cortner <ccortner@gmail.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-glymur: Use PWRSTS_RET_ON flag for USB GDSCs
Date: Sat, 31 Oct 2026 11:24:37 -0500
Message-ID: <179346368381.44447.1485218660714919850.x2e-share-reton@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016-glymur-usb-ret-on-v1-1-1790a523fd9c@oss.qualcomm.com>
References: <20261016-glymur-usb-ret-on-v1-1-1790a523fd9c@oss.qualcomm.com>
Content-Type: text/plain; charset="us-ascii"
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

Tested-by: Christian Cortner <ccortner@gmail.com> # Asus Zenbook A16 (UX3607OA)

Without it, s2idle aborted here with -22 from xhci-hcd. With it:
19 suspend/resume cycles, no USB errors.
