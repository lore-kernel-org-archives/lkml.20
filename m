Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792810630;
	b=AfAo24U6WkxUDzSxYDNRF4OOUphS4ggjgIC/RBHHqB5Q15q62w/3r3PQDwGlWHxTfjbH
	 5UDVHczUQuWyL8+mGMfhaKsBkaO/UL4JylCtZlVoSTV3uPEmU8uPDGHWvWTmxEZgFXi0b
	 EVEl6eUqs2bEgT1kNJrXkOxIkHhlAqJORKIoB2qvWZ48O3PZ95Muz17C5tIDKCf6xWhPh
	 WDPOvZ8jMaq86n0MpjfyOOz8Hueaf/Srgcbc7s8auTnZy+rkHrLLpVa8B3NAUn3mD1Ddw
	 F8iv9aKi6fpQTAq3vbSWgtSS3KrxKDbvshXeaJLeOhkix/i916Lk/ZD8YgbapwZ6ibw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792810630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I8fxW7vrt77kAEgSKRbYezNY7nlUDAstQ7iXToVpRQs=;
	b=kqBN/5BV7s7CO5aW74Sq5qiunmGSw/cXzyAeN1njU380ZntPas+M3E1qJyGRLWBF/meT
	 lrI/dyzIOJqpYGdWxyGlZOYcS7CXZnYuOTIKhldZyfJ8T3BcFgxf1NS/fJFaA8x5oeaWM
	 Z/4enf5lEZYnMpUzoABxqtmTCjOZMfCfmFk75dNn1PU4wHGYQ7PiCpiQlc63kjWrZ6IIe
	 9/8h1Z+DZ28Pj+MU+91BQx02bxBOMAHkdnnFwcwax7tfBYg433EzLk/vUS7xEGG6up0FP
	 CRRQBh2r6lYJVEGzngjuX1+NA/o+JsXuv4pPTnbjHOmwBMbTzs1p2ZRmYtY5uEfo2Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BPKmkzCh;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C22D606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 02:57:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C22D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BPKmkzCh
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7fccba9c675so2917560a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792810629; x=1793415429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I8fxW7vrt77kAEgSKRbYezNY7nlUDAstQ7iXToVpRQs=;
        b=BPKmkzChoKihc6iAdO5T/4xW8IiSD0BpwDr7WBsQBZL4PXTDwRMCy+lzq+uPmGvqIr
         AUnED5rV31sYOrzGpYJ074dWRG4GcWokzHAg1E+dNLtMDaqZV/suF6LoSMmEmbzSjhsN
         RWWVeWeP7IKiYJvmz8nB/gsaRpSFOHvr0+dUo7V406exuh4ZPqU9HO/qgRMRXVt4Pnog
         BRYfkbjuM6NbS4+3wY2UT3BZd8iiNENu5X7XnCEnTUH5Q68bsKy2c1c6NQaEQZgRqE0N
         N0davRMG3jx6ku739UiCyitbJRDNxddwR+iBXcBeVIw/LRy5ASqUZCtAlwDX0ZH3A/ss
         +Vpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792810629; x=1793415429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I8fxW7vrt77kAEgSKRbYezNY7nlUDAstQ7iXToVpRQs=;
        b=oEpb5yxOTizl6EN3xKuToiRHOkiHEYlaRTHZBGbJXShwmMiQGLq4IXP5+PJS0nmSW5
         ZkzZ1Li2SloxjwmCHsHQfJeaFPvDUZsEnpH9b1tDrPjPMKHWzByMpwafhaW7crFkdk5a
         HVyNx0BITsQnVBH5sElMMLQusru6nwOMTTy9h+ZP/PxTrH6P3ING2s5YHcxxB1izq4BA
         REYGSRZOzZXoLM68bLTqQohwtY8hR3UDBbRb6QPku6Rpu5CpNoO2LNmKpaJeMkR0x9ZT
         1NInwrdnRqUmfd0PuImA9pP+bODdCOA6YQ/7zBvwy4Lb6jVQAxy6m94cqHN4DPU8Nzfc
         1/jQ==
X-Forwarded-Encrypted: i=1; AKwUvByADPBcQyzjhhDUalH/JfHegKg0lWexld/i/5P3XlvTQ3lqB3K9E2ICcjYCaB0FrqueB1N26HmPkCKbXdk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJloLJZgpRPNpr8Km9FUMXsN6otOpmkCG1HkU7xjRJWwDlFezRx
	2YfknXBdSn/iiAFNM64vQ2eH0KH18M/zRDeD49dKwP9L3PrXlw/L8iqS
X-Gm-Gg: AYBFou1IqO/tXnLXIVeteBV4DjjZ3QDc4MyUpY8Wa81UP7R/Iqgq++30VlzBZKQbAbQ
	Jxeu7uEihZlx7TyLz49HS10mGl16/LdkO29yjgyzXKkHA6ANm7ZfO0S4MINICOqHOku9mj1+k6E
	GXU2q7gmJiYPjUUF1+ZehVXVUYdP1ehl30h+SWzs9pw5RlrvF7AhKpN4LtTWqzLclfsoBnymH5M
	E0WrCSgBZ4tinn4BqYcBOzjGqa4rZ2n9Q2c0iKN+0nAjajk4hBgEKeT3wojcypcyZlKS7CC4jBK
	XO2eitf+shbW7thkEDbhxwhuhFdj2jN1JuqsKrBmYNpneDOPEfz+Td8nT92zm+sxhqJoNGRCKAY
	kOTSrjd9LSTDfh0b85puPsR7Uu/B4QEdLww3bVg5Z/AOhFq5ijgr2JLVINMsGjfBDtgFiLw1e7s
	TOVwEO41YXwRXeSr6zerKhV4nyDURmqipTyLBL6UL+GVsrS+7OtM6Jkztzl2N8//ynsz3EHQeqm
	ws3qkth+M2eIg4Rz+yy+Cbig5/iP3v/CHVzYlAaDNB078S7m086xhocTJCjDU4O1MbdVcLfylYS
	pivz
X-Received: by 2002:a05:6820:f008:b0:6d3:abd1:9b90 with SMTP id 006d021491bc7-70ba0fcde9cmr288037eaf.54.1792810629029;
        Fri, 23 Oct 2026 19:57:09 -0700 (PDT)
Received: from jeffmr (63-152-17-145.cdrr.qwest.net. [63.152.17.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e04aa58sm1060327eaf.7.2026.10.23.19.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 19:57:08 -0700 (PDT)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-glymur: Use PWRSTS_RET_ON flag for USB GDSCs
Date: Fri, 23 Oct 2026 21:53:47 -0500
Message-ID: <20261024025526.13339-1-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016-glymur-usb-ret-on-v1-1-1790a523fd9c@oss.qualcomm.com>
References: <20261016-glymur-usb-ret-on-v1-1-1790a523fd9c@oss.qualcomm.com>
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

On Fri, 16 Oct 2026 11:58:44 +0530, Jagadeesh Kona wrote:
> The USB GDSCs on Glymur are currently configured with PWRSTS_OFF_ON,
> which allows the GDSC framework to fully collapse these power domains
> during gdsc_disable(). When these GDSCs collapse, the corresponding USB
> configurations are not retained in USB host mode use-cases and this breaks
> the resume of USB controller from suspend.
> [...]

This fixes the usb_hs controller (webcam) dying with an SMMU context fault
after s2idle resume on the HP OmniBook X 16 (X2 Elite, Mahua).

Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
