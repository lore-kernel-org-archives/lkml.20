Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794245938;
	b=O8Vxa/BQje5iOQiOgW6DV300M3aqiFJcHNN3lOB55pNgwX0dS/gHvYmCjZjmn85g4Pvx
	 HbmjGlhztj1syE4v+WYt5LFMlEXobtqMemgOy+jUzJDRu6SA4VWgnhJdCO5rNOgF4PHcT
	 ACGw6tn0zaGjI2lNx/+5Kv08brOeZijHDLfrSGgSYreuFjNKyz/+IkXGYl4aLRVa+84GV
	 S15tEhgzq2NXxR+2wYKdaYpv8THfx71huseD53geFhTGsbOzuht5q5UyuV8/HK8FoccCv
	 VDoMjPeI9n8iMSHp30r2ddH21Jy1cXJuRR9MLLnUUyCcN+1EIHfJXsFlXUab6ICIquQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794245938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VSgAu1YCz0/TBDQtz025D2yh3sRQq8BFfiF0sq3qrAw=;
	b=1WblQKd+dE9qYzju98FMIg2sosHT0MahnmTnzHWpl/G+jwRs3VKa7fgzr1xzARL2zHLb
	 NVrv2Z6MSdsNUqjUGLOgaBkNAIlgnIVFTKXGhO+2gA6IjdfTHh+phhM5v//Ft+asMQ+U7
	 YtfZXjwzGxjBysjcakgI7lZ+uaTBY93VuSnR+wbgxQvclS1VIm53WQhglgSb589I2aCfX
	 4ZAEOju8uxw/zvwMSl0gJnSicEk5CkN3BPpWf4p4cDd9MKFBZjYZ8CqN3ljf1GboBo0w5
	 +cv2VOdGxsUq7+v+E0zsUZYYRa64CIQzHcTs7ULrzW1CbxTm1eyaAQT+XR/MT8UEmUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ET4UmX4l;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149AA606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:38:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 149AA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ET4UmX4l
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so9893065e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794245936; x=1794850736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSgAu1YCz0/TBDQtz025D2yh3sRQq8BFfiF0sq3qrAw=;
        b=ET4UmX4lnrqCC21B5oGoVYsMQvX/uO5ZDK9wo7RPCXLUSHAzor2KKP7C7D4g9dOSKl
         T9tIynx1iZ7nScEbu/rROoW0ihwiLqJhnnQ61YL9jqzvok+DK3S1a+gguxLlBKC8w5O1
         moTFTURhfavgIUyQOJfzNwN7KB0x4LD4UGwaMonewXo+m5sWjx57U6MMJmglEzxfuxMO
         LmUAzY4EtqQeiNxES10G3nMFPkiJj/jPtOOkesOWKBy7x6Ryd1/Cph6kqfXQpWmPijOY
         8IbZFuODa/za16J/GDh0DmEFHyP77cWRenI/CjjMSrzXFx4Mn5aU+7EARh+lKdHOYquD
         rC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794245936; x=1794850736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VSgAu1YCz0/TBDQtz025D2yh3sRQq8BFfiF0sq3qrAw=;
        b=IGcO1rc50hhdDwpO78fSw8UNYSYg6vUbfa1ejmeYzxdHGAPsLoeEIiaH39zgW8R7lx
         fMI6U0Ijvl4aL7gme1siJvaFjDax9j+LPe61gQgGlL5CIi/i4EwWhI+echJHLEcZIFuD
         MMhQttoqfC60WI2XxorVVMEr7t6b344go9q1x2ot0WbrugLirJjUFybecLgEdwGeGGta
         YdiQGHp4FYA0uQTqZ6rKpns8iggxuUmE3S3Epk2UAOPIYlGy1WmLGz+lxwx10r0+ww0T
         JUTnXtxeVzyJ0DX2M0hGlq+q1hJzKiYYNyvDXEAGIDl0c36D6+fF4PKkBhIg3qyC3zKM
         fYSw==
X-Forwarded-Encrypted: i=1; AL+hErEj70X4YJ0Y3iRjtgNCP9+V4/C3cYGAzaDz3dww2Urq3jawViq+v0jfuW825sboSYTHNcvFyqNbZGtFoCM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GN7FjZDJBdKgxi5PhfW3o9lQb1hAbLxZJWdc5V8kkky6UHeaX
	PU1nHs4u5GufF/LTZ+hm7OytmVAvaPtG8EnU1KhxWeQQ8aR2NOd8ckdM
X-Gm-Gg: AYBFou0qy86IOGNtUrU2J5Mvs4fp6pLaL9yrmm6vsQokfK3cSHEFZSG0qJyt6nTJcHw
	fVnkbPVwPwy+6k8uqNySHQZ/uu2OnEHCMDSl9d6nah3t4vMOWEwBfKKGMj84qJVWlkMQyTH+dFH
	q0tHpCGyLA15HoUNla5jIvC+K0RK7zimIzP9iy1HKSBqMds6w7rD6Xc+v5eOFsE+e+qI6AfPvHP
	oTMJSNrT4dOl0RYU6c0Y1CXy6AAaAR7yQzlKIYKeLg3mGUIqsq2FNmQNaxMeTMnA5rE9HV8Lc2s
	2bRu+XFR7lhQd/WMbW34nyXKjtwvLTD9FM5+Vs6p9RPdfQCRcerWETW1+5aXIkJel6fetPgYcMh
	D9E8kwn3yAcsN8pp2mtC/APrY5sGEzq6bLBzBuejUuV9fTddLQTWf7MORSHmoD16RhIsH/YWRJ3
	F4bCJiWAoSWyi8JBLcYF6EpzcPKOLnk7x6YnIcMVW4FBr/4+qrrLnUsYc4QdQPU8VfjC9UoXrg1
	WdfcETIZRK3sEQFYDh1kCc6sBbjd+h+4c+kAW+qRf7vlqdeCAaXHRY3gWr9pPdQGT2yNfnUfaLn
	Rz4/Qcp+6ZUrIycLVLbDz1tceI4=
X-Received: by 2002:a05:600c:608a:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4b94d76329cmr92154365e9.1.1794245936334;
        Mon, 09 Nov 2026 09:38:56 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0157b707sm2522005e9.0.2026.11.09.09.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:38:54 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Lee Jones <lee@kernel.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Bean Huo <beanhuo@micron.com>,
	Stanley Jhu <stanleyjhu@google.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Georgi Djakov <djakov@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 01/17] dt-bindings: arm: qcom-soc: Add Halliday
Date: Mon,  9 Nov 2026 17:38:37 +0000
Message-ID: <20261109173837.2084788-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <78a88d4d-11af-40c1-b063-b6a4d4298ecd@kernel.org>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com> <20261109-halliday-dts-v1-1-289114ab8197@gmail.com> <78a88d4d-11af-40c1-b063-b6a4d4298ecd@kernel.org>
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

On 09/11/2026 09:25, Krzysztof Kozlowski wrote:
> This should be squashed with patch #15. Also, there is no benefit in
> organizing patches within patchset where patches to the SAME subsystem
> are split all over. #1 and #2 targets SoC, then there is a break and
> again we are at SoC at #15.

Thanks, I'll squash it into #15 and keep the SoC patches together in v2.

Stanislav
