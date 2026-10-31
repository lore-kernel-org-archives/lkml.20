Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463887;
	b=Lls+n8m3KMsVLi8iyAmnSEXMPBxSloxjr4WRcV+5SHBb8pc+cwxbXzW1i1USm1Ket5mB
	 V6rSierCu7FXLyStc4yyQZ33ngekwolQNYN2K/c+in8lZmnJ5hWcPsxUM9Qnqfz06OgBs
	 K0xf1+FS7ejzIC/wxQ0wl3vtYIMej+4Ux3hV865Q6SNBRHoE0y5NulIWTutGpYc55Y0vk
	 72SQ8Hzg3k0GkKKa/YbwnTWMscsLOsCowGaHDyhp3xU7puv1JnfQV9UhLMEsczqCrBvvK
	 gtMZr4X28CfveKX66tV8yTuDfbyQNBYptXQ9OuL/nBioToyulT+71PWi+vk10187GjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=lVq0Ao/ZWudJCDsBPok2MvDiDplFAhMivQKS/BD/5Cc=;
	b=U51q9+blfa3y4W8qnxtlC6ZEjj4c0iZIyBumAnqKP0mTMVzICpDlPY4JsIHAKW4hn1Ra
	 K79p1Zeaj5ISSKABzsJ0fGYCr6DRTe3zX2sXs9XWnTTusFSD/o47/8MFMxdrTaZM/5H0c
	 Ib4mTzqeQObJv066NCysf3CnWEIVraDr01DKRi9lbk0tR23TWUeqXUwCnbquoxf5DkhXN
	 1UYEC0s2wh1eZ13G7gdXrauTCLf7RrycH5H2LVFXFRQAmmPDahY9PrP8+lcmzSzdE4+Xk
	 jUPadNWnEd6BZS3GqYEDsgCFCbmP5e4jpn+Md+HZdrVEkZO8FTgK2Z1DrMbPOZQj8Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=juxvqAZe;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD82D606A324
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:24:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD82D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=juxvqAZe
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-930c0f9c1b1so182239385a.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793463878; x=1794068678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lVq0Ao/ZWudJCDsBPok2MvDiDplFAhMivQKS/BD/5Cc=;
        b=juxvqAZeU6BW3EHRo+t8y2yK+G2HZ6d+tJubNtwHqUxBk4qAFhERDeDoTaxkWCJ5B7
         R4n3vXsYO+7IhVOmUpxXMAdBBNG8w8I04UD/SBNgo8AohvDYwSXpNOnQC+73RFiCkvFT
         P6MZ7IP6bBEDjRio+zP3E+6FQr/3ymLxtYD75R5ZSGwIaP2Q+YRMJkLDIg2FOlvrToE2
         0LrIR+QJHDnD/3FgbKW9/CRf7FRyDvmnq19YzpuRqEyXW5dufQdA4TpPmqjlrmVco3vW
         SxhI7PofeO0zF2FjlDni4XM+v+ouU22r6xMhwA/ferzA0GW8iXIHihOiDMxYqqV5VLuk
         5hrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463878; x=1794068678;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lVq0Ao/ZWudJCDsBPok2MvDiDplFAhMivQKS/BD/5Cc=;
        b=FJaaAXDd5Hndv20Tx3u5BhUmfZ5yl7bixyneBQcOfYBwGk1GATg5jqf9HgpbVLtPTz
         QQW+KmxQ6NtpPT9PGaOuIhZAhDKW/8w57K1yh6EGjY/GtwSskcu6mKeaitrowXAE+NMw
         +FUJWRecDqkJRbq0wgvA6Nq+AygTSsm2DV4ooTp2t/1XRDGIgxlAm3EtWAiF7hdUhtAo
         5F0FkAC/uKG0v3Worb3fHB5Pw77OMtgwLjDEjfcyn0c61vqvogSbwBbdINIA0EeuuqLB
         drQiHl9Duddg1juu5rLN6zJClj0EGz8bPOw6EfzoJjVq/Z+tTHTtinRrekhJC5XfZnl9
         TACA==
X-Forwarded-Encrypted: i=1; AKwUvBy880dU9CWxE2RM2zYZpByWSFvrtJTDqP4MHNlKCWnhLLS4Cs+elxZ7sgLQOEQFbE83fZiYUSWVh3NnTnM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLr5EUUfGRK9WtO8+iVGztuOyBVhUj4pNzJkkkQ2fTb8Y0z4OGw
	lmmnsMg9eva8leYS/3uyXhoLbpRQuH/u/QC1SMWeJilXOMXcynvVWTD4
X-Gm-Gg: AYBFou2C6dVKATrNiqssNyv7DhQne8kQoGXkq3vd0oUrMW8NdOvtK1oAMXbMNuCAJ+j
	qTlPThgtfKWx4NCE9W/xJONBD3iNYADJsNA3Ld5J9NMSqzKjIuruJqcemDfUUAvDNdi0T10BUc6
	5hnGVPuT8wTslzkcM03lPNeCIKC8lCysDPQ9RFMnTkpeg/iBhGpBaYXYs3dbxsNHKNNsHOCv4n0
	Og7PVP4OlqrfEL58y9jHGaIgoOHrYRdJQDJo26H/A9iVRMUvnuPOTrB9LpDCcKHBpd6O4E91xGf
	/k9fBnjLxB4feIZx0+JX+dOajVhTcj9rOgmODYnhSXs4SbEZlAAcAUL9Xbw5PzXliDAPNLPQJw+
	eRSXmU7fJMNPQ+7xEBwew4S0h9mRWH/NdlWlZUb9yP4EbdYTOnf5E2DOZgznrAPriV+knSt++a4
	F2JeHRcXODJO+vRMji0W1sOV6gCOg44QtpoqTl9IQQcgBMwPmzkHLvWearkQ72/svTh5rGpMmRf
	yoOOMdDr3D09nVvTSLWDgNPHZ32NNYqLK2vpcZey1OGAAFNAz/p+DqXG0IC1eISWN/GM3PlHJRn
	lKP2n2BbRsT6gb04ylW8gRjtg49/BOmF8BFZ2+rpXFFKP0ZT5wJ2jHosX2xArIlMdunnTvc0aPE
	RKTuZaQ==
X-Received: by 2002:a05:620a:471e:b0:93e:3824:4123 with SMTP id af79cd13be357-944216fef10mr997085285a.65.1793463877786;
        Sat, 31 Oct 2026 09:24:37 -0700 (PDT)
Received: from localhost (h159-112-31-107.euclwi.broadband.dynamic.tds.net. [159.112.31.107])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94425ad7431sm414082885a.40.2026.10.31.09.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:24:37 -0700 (PDT)
From: Christian Cortner <ccortner@gmail.com>
To: Peter Chen <peter.chen@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Elson Serrao <elson.serrao@oss.qualcomm.com>,
	Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
	Jack Pham <jack.pham@oss.qualcomm.com>,
	Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] phy: qualcomm: m31-eusb2: Add register XCFGI_159_152 for SE0 recovery
Date: Sat, 31 Oct 2026 11:24:36 -0500
Message-ID: <179346368350.44447.7737375259522591871.x2e-share-m31@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027015545.2758784-1-peter.chen@oss.qualcomm.com>
References: <20261027015545.2758784-1-peter.chen@oss.qualcomm.com>
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

Before it, a USB SSD on a800000.usb dropped twice in a day with
error -71 and "not accepting address". With it: 28 GB written in a
stress test, and no such errors in 27 boots since.
