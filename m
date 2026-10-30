Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334402;
	b=UCUAbZh7fgUIAyQKjMtec/gHA6mGrtTwS4bseye4Ob1h2Hz5ALm+XwCVGAvsBJlpdpjS
	 aKKj3Xn2nMgbCA+uWCQydQRkQVUxMHJQFGeMyarDnJwHPQX4kJH7cFUHgI7AybGB50Edd
	 lDGIKfKLTb8BOvSdQhf5HRIYSP+PiczNfN49Hu1ImgtMkOX2aw0rFCd3a8Z3fY3WoQ9p/
	 CkipHIFImJsR5HvUb3xhjKUs3MVnavRH0JhSZx9zdzY5joFktGAl+WqZJlt2+KnE7XcQg
	 R7MC4vS+4PZYCw27vASEKUp1FNVwLDJ0Iv7/KMu+2YoM4ciZFmuA8t3sOZeVsFJ5R2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vjV3ThcETJTQohEswOVEipA/50M6i7Rw1D6pUxeaH6o=;
	b=utk9NwM1hgS8ZOO4LVWXuVI79lGA81LnbtvRZLeIoj8dZwCo5G000G2OX7UH2KClz08r
	 0BVtFG8SHRW9ucK/ALqbkUdblJ3F44ZdmKzvm444RRbEOzYtae6rEDQQk510MI0B5aFHv
	 awNUQGC+VIUv6scT8Bgg05q+iowuBnROUD7ymvjb7rADix3lF0iAWpyx1T6UxZMdboDJT
	 Ra5uwy23hlokJJxr2x0UGRXUDFQw2GCbrcJXhLK+TV7dv5Bo1wes/fRChf1G3zmY0fiaD
	 JCC0LK6hUmhJt11sa8A1o6h5D2Mc+CYhGnObCHEKOog9xn753KuCmu+P0zPU4WOJzEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OOGfl08i;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEAD606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EEAD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OOGfl08i
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e9e53d011eso2748725ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793334402; x=1793939202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vjV3ThcETJTQohEswOVEipA/50M6i7Rw1D6pUxeaH6o=;
        b=OOGfl08iTrDcSP5CRoXDmSVya4AolyQdAG5OWHgE9ofXhHL55pCqAnLRy3QOWArl7Q
         waeVAr4qZkWUShO1RmfxQqhrxoPq/ZSnc5SpnwuVgdXh4uUo3uTMWH2m3jGzBhUOoKFx
         piwI3wn6MAqmd1Jhykxn1EE4vgfRhKxFaW6GtH8BDqaTg6lhfH+PQ4OKYqKo0UaA/SHn
         G+h4ly81vQPBO+1raeS2XxMsGTShwbFSSrem/WohBifnUltiwlf2RuGeIQYnhL9m3Aq7
         m0V3jj7XEILRpMI0/2a20+1yKez2+/pkZAsbweZ62X9Oq2XkzL9wOS2u7ALkWWYDls5i
         Qy4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334402; x=1793939202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vjV3ThcETJTQohEswOVEipA/50M6i7Rw1D6pUxeaH6o=;
        b=WHAv5qv5Sm8xUFnPpBG0J4Vs0C/3PzObpBMwIS/+bKHbvLs/UXSkVsW7Xta42AmfdX
         oaO2A11fkvICldcqt33nwWu3N6LfGE4fzrFDOANIYq/H3/AUyZpl0smRFEZN/sscRRSl
         S8jQjynXc8oDa+rYgGN0t2/F9N+AznWBI7SlRBXGASEh66BqbsuLuJQdFe8/qimTbsT5
         SDx93zTETV+OayaIewJu2N1tX1nOa1wqdq8QEOVmlMpmNuCWWNDZ9xM/9HJ95RhUKxZI
         QXDrZ16VUFzLWaFGM1KP4GpNxZoLgykRqY4llhWYkM35OO1UpLelzFg6Gr2CVdffnG10
         vDNA==
X-Forwarded-Encrypted: i=1; AKwUvBxsndTN2KTkS13RgRBJMtK+DVAGZu1gI+MsmnlWMVtPgy8AnjI5nNVJ8NgPctfyaOxa9RJHMlDOU+i+aPk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsuAj674C2CMIHTBRFnq6IjjClA+awTImflmN0bahf/SsKHnFl
	dAuv+uhA1HmPOi9f1fYzMOFJNSkx/cmIG3z1J0KHRFhFye7RrHCiZGs=
X-Gm-Gg: AYBFou1cpUYW08S8sFrl0qs7TiRhVewxCxq6NBuGFd9lqPbWhL+p2jl7Qw4tcOCSjJ7
	XC0A4Nc4oqtRoZB0CjzEHaStTIFa7KsDLVuzeeicgiH3+VAEGZ5LfHGgaJoGGZGMlKXWjjPtWmQ
	n+fON+f8FgR6nc4w4Q0/ZN6hqbja5KSLshJGL7aRWv6q+6HDWsuH67u4FmNacuoQuZXl+mfWh9u
	FGu2icbJVc4In5jjKdbjPV7hEWY2cRrZ+43IMSO645BdjoUZPSoPcdD/tFLKiXY9TMElPyBZe9q
	JVu4qJxovwjiEpI+wGZ8DzsYxoxoxDweo7iDwYXBUglvyfkG9SfrkbG7XRU063UpoimbXR0KogV
	gEdxnPCSx2n+J0rMYhhqivV9R7FwUHObxxPnPZ9zCAipEiVjcgirmmfq7QsMzTM/bBXkP86pqpo
	keuXcsb0iSWRNq29p8nOZuueviQiY1FdYO50X7HXhzsR5SiinqbLZSDWqnyYV6k8+vZ9UNwYAZh
	yR9n77/IwV4Nz+YqrFNmQaY5SqyJeMNzpHMbX4oExAia3bW/lAFoPxx1sT1LmCxTsk0djS+qI5I
	NtPJEioAI55rU85lba86PMj+ENSN/M4DZo5OKpS/0FMIerZB3Gsmx+iYkBhdcAZM+AVM
X-Received: by 2002:a17:903:faf:b0:2e9:5eee:e087 with SMTP id d9443c01a7336-2eb364e553fmr13990205ad.43.1793334401915;
        Thu, 29 Oct 2026 21:26:41 -0700 (PDT)
Received: from freddie-kane.lan ([71.212.222.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3922fbc4sm1965845ad.24.2026.10.29.21.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:26:41 -0700 (PDT)
From: Burke Cates <burke.cates@gmail.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: glymur-zenbook-a16: Add Embedded Controller
Date: Thu, 29 Oct 2026 21:26:27 -0700
Message-ID: <20261030042630.2744339-1-burke.cates@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261015-topic-asus_ec-v4-3-af6305ffcb10@oss.qualcomm.com>
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com> <20261015-topic-asus_ec-v4-3-af6305ffcb10@oss.qualcomm.com>
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

On 15-Oct-26 10:55, Konrad Dybcio wrote:
> The Glymur-based Zenbook A16 features an Embedded Controller running
> custom ASUS firmware [...] It provides keyboard backlight control,
> additional temperature sensor readouts, fan speed monitoring and a
> number of miscellaneous functions.

Tested on an ASUS Zenbook A16 (UX3607OA, BIOS UX3607OA.312), on v7.3
plus out-of-tree Glymur platform/board patches, with the v4 driver
(2/4, now db3a9dddab5f in mainline) and a local change that leaves
the keyboard backlight to the HID driver:

  - The EC driver binds from this node at boot.
  - Both fan speeds and the EC temperatures are readable via hwmon
    and follow load: under an all-core stress-ng run the fans went to
    about 5900 and 5100 rpm, and both fans and temperatures came back
    down within a few minutes after.
  - 115 s2idle suspend/resume cycles in one boot with the EC bound;
    its fan and temperature readings kept updating across them.

I didn't test the EC's keyboard backlight control, because of that
local change.

Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)

AI coding assistants helped run these tests and draft this reply; the
results are from the hardware runs.

Thanks,
Burke
