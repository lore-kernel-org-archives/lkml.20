Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792459780;
	b=5FplJ/zAkECDcBMwpG0Dp4QK4QhjGxNAoHTRLK1o5QCRD1fMApPDbiGJavuVCaftBhF5
	 Bvy49yBixjKVBXboDLHhkdiL96AXMf7ZJT7Fo7hxSkNoNMLBcn74IzBWeOLhhpaq+1FIS
	 A0iqOGNNY2iY8a9TW1QePwtfdt4fR/QEWBVyW1h5pLLikL3g1UbkI+fBptEeQPvtEQQWp
	 8NlJ1dpI9zivBW9W/D2qfb+9dCOxRjRsGTrumMzcn1Wvk6H9Z+w5XFYHoWKecsbMpxNEj
	 eEBPQs2S0q6lgyE57NhwPYS+0wOw5M5Z6Qi1UZb2Lf4zhxXbX1ybA6VWT1MhEAye2SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792459780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=QT3eFXHVHoqDLuSaSFM8eK63zSLUEeeoFpkJDMWYrL0=;
	b=Sq3KZZjH0ddFc7gP0be+HZTLi/+ITAWkA9rD2CUJ9XTExaX3MOPocmUfrAAMml4xVuFk
	 0pibgWEkXCm5tkWDL2f4OyQ7tA9ZBpiBYXHIx9zvKGuLamK4pKBdY6XYUa50oDiRfCMzP
	 RfHTW9WNPzQxEJqBXFSVe9DilkIqez+j19WTo9wIGL2CCvLfn7ORjSf1VuDkUbwKSVK8p
	 gs7L2vtKM/drjBCVSlTtJKW26TAqDDXYbvV+ObzJq9v2M3sTYle/4SC1NmqvVFZzcyWPm
	 pusSoTXX9pDIEScQ6EIiTlkYb1C9P7YKzUAOxYQCJc1MeYWT4Ihi5ANECW5Wsp316bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XxUN2kZ6;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E2B606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:29:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98E2B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XxUN2kZ6
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-18cdcfc05ffso1328440c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792459780; x=1793064580; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QT3eFXHVHoqDLuSaSFM8eK63zSLUEeeoFpkJDMWYrL0=;
        b=XxUN2kZ6oEaNF06NIkbaryynlksV1cMlxhrkyWtOISac7KzbtvUgeFnp+pcITmQZo6
         7AFTE+xDCMWFB+Ka8hPWmtY2+ouBmJJsz7SFOycY9AVFqqjPFDTIu4Wqbu596LB/c8y2
         hw7uTy+fEPpI5avdn9oR0gwb+8dMYujIZ2owbXkrQh4NeT9ExNYRiCndy27rStV9CZ4n
         AJX8EJqDvZ6gUrRhlZce8XO2+M8PdnA+eHtnJu6gzYkAyBMSxE/HaqxBu8UmYooBsWMX
         Pwt+VbKoawGN1yuYtTfxtD4d3xHe2zuw3X+FRB4cRQvrZ6Iur5RSVRHzbUNmSWPRiGMP
         K4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792459780; x=1793064580;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QT3eFXHVHoqDLuSaSFM8eK63zSLUEeeoFpkJDMWYrL0=;
        b=OKsH5goa7WtlhApk/U2rrChfAVMLNlybaQ3gMOKegdgBnyw0W5iBZtIJDJjw+Eyec8
         hB7lUZpaAXz2F5btSxTsj+jpb9ZaitwEKscWrheCtOuVwCfl/JV8siFSmY6T/4ePeZT4
         zIQpNaCEj9spk/CoIpgq2kXHVe7geDuVbKrI3a1b8XjV3HGF0gapy4zdzgKHJXheBbx1
         EATRTnqitsqlV1cACmZnfMMx9/TCTql+dU7lXpURr/gkUSeCW/eUTP6dzdsHWtHGamfU
         UCqNO/5zxVO3F3Zg9j8oY4JvF4fi/GvGykkM6GxsUA5xndn8cfFWQQXiPOjMCAQx24L3
         bEFA==
X-Forwarded-Encrypted: i=1; AKwUvBzAP45kH02e9IZFbNOc4a816XXJcTNosFgxg5TxsihPok1TS37pyvNguUeBafDLw3mfV2wQ+dY+VOiofUM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhVE2T55I0QlHQAJ73rIQO1zagny/B4ta9/vDS0TxnVGlD0kLF
	2645zHhGpDzFc6aK43uyIGYnQ0NIUsJ9KC773FtrUF0Aq93fR6ctrTCn
X-Gm-Gg: AYBFou3W1gFMQ31pze8raC/NSQ2jqBOOlwKIxn9qUTOM3Ko5031AkyT9AKhWBCf1sym
	HIpjXHMSoCM6VIWJvroFHPx9Aju1zxVZJUeuCWATLv4oFL/DaFFzKbgIWdUrJq3tUGoxtl+606l
	tpsi2uIke+dsb/2m14QY5Sg7qnmZXvwVng2Gb848MdyfAknFBJ9EkkznB4+voU7YmsxC5Zorklz
	gDlXa1GKzuxiiVh1E0OETavrrr0qOcGmhmp0QYjhxAg8mfWFH/Maed//W+ijZj/H08kPeEObhNR
	dM4ZrlW0W4LGAurbuZLiLipHeKjz+aS0EHx/5cTqDZ5auNo4gIcyYqBSMYG0rVOeLrY5TDRSSb9
	HFla/N4Hzx8ecN1nmWRLWXucC3m5l+t5IgFNIyEnIiv0RVMLqGveunTHsO9MXXK6FfaQJT0Ldlo
	BB+qMr50CmyvCaatBN6/6pNeATCYCfI22CYm6UekhHIjg4ziJohw0ToR51ZgFXnn3vE4wAp1C+d
	nSj0iTSWkCx
X-Received: by 2002:a05:701b:42c3:10b0:168:6ad8:e89d with SMTP id a92af1059eb24-18511eb6876mr14641867c88.11.1792459779536;
        Mon, 19 Oct 2026 18:29:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm49277908c88.11.2026.10.19.18.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:29:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:29:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: qcom-wdt: Document SM8750
 watchdog
Message-ID: <10d6863a-67ac-42c4-86b6-aa3b0871b502@roeck-us.net>
References: <20260930-sm8750-watchdog-v2-0-b16fcda275d2@oss.qualcomm.com>
 <20260930-sm8750-watchdog-v2-1-b16fcda275d2@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-sm8750-watchdog-v2-1-b16fcda275d2@oss.qualcomm.com>

On Wed, Sep 30, 2026 at 06:32:05PM +0530, Komal Bajaj wrote:
> Add the SM8750 compatible string to Qualcomm watchdog binding.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Applied.

Thanks,
Guenter
