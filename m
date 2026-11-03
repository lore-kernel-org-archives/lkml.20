Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793710364;
	b=m4nATKbnHWpmZsiOS2pUHMEh+7YuLNVVgO4XUJpiLRBy3C7dRWa/7se7JFTFwxQUas0I
	 pj4hST+c3hUwK1GtLRMmHvceF9ayqOLL7xoaKZuPPAV+f0DeSW25JqKiNYi2BIZgLSFIE
	 S7YJmU/fZ3z1at0q2yocXXPRzwNv2P1YzweSWosP7in4a6yAGRPVMXw5HRDlIBLzKak0p
	 UYa1LmLO2p//ZBl6Qdt4MzM5srA6sjxUads3bjM6BjoFbafetvhbosJQy2XO58WfqfNI/
	 zVka+SpmDgerVYZqHCy8SpSp81UEdaRkfJLtQQoiPPI0Vnarn5Gy9/rqxb8ORdmfhIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793710364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OxChCZD2o0yQGRgsO2CGIoKtpGo86ALe5rnyFgOgtTE=;
	b=DL5acqo1zjdkakLLg0oHwf1BAEhLMqaHiyn0b1sUrE44Pb/w9hVOcTwkg0bsnnGDLM8W
	 OMJ9rctysEW1z+rQpGFTjVmTwj+AeLV93pZ+MKGDEdAvw4A3YdrMkZudZxv4gqvfHKGn1
	 XTziVbaRxxDMx2ES5hHaiX8B8nIKnxk+6O2gyw6mx8rTZvcAe8st5Pw6uWLpuAPCx08PI
	 Z/dXMnMMTRBR1c6StE64Axk3A+hGYRGjstlrzEKF2IQEcshWGWZ7ZhRMd6QSczEWG1P98
	 pVEwYT20Geoxf+Pa/y0BNE7lW9QcTb0UnWTwtd/koFxzSJvVjtARrd6ACOAVLfVoQqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h5LME5TA;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23926606A328
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:52:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23926606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h5LME5TA
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3550c917fd3so5635592eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793710363; x=1794315163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OxChCZD2o0yQGRgsO2CGIoKtpGo86ALe5rnyFgOgtTE=;
        b=h5LME5TArfJBnxSoUoZoGTGBbOAQ8cXaX8FXX36hNeDm7KxiIgxeW8yJvVjI+BXbBX
         eCQPc79CPCNshV94OejJVsBbYxzBFyrDdS0dt0lVfKAMgl3B4bGZOmflC7yYVmznRkYm
         dflLBFS8FVPXZCvJqHOZWSSN+/EB4MK+URtSTWwxvX5JBo9rKGb5U4UDCNFc1mwhcnuh
         9lU3VHhmZ9HBRzUh8msVdzk+RCVJNvotW1jyj1snEHD1mEKgEjkPqdKdWRa6w/3py9op
         +W6FkYNxcy1SbZJGDgiWaPIfskdVx2lfjwkGXaizOIvk5eC2hF8d3VgRpiBx0280bk9p
         t0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793710363; x=1794315163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OxChCZD2o0yQGRgsO2CGIoKtpGo86ALe5rnyFgOgtTE=;
        b=sUtiYUNWD4WQdY8zHJqcXxDcbiAj6FRiMc+aRw5diksxeIowk7/S0PBcmDB9lXQIRE
         EfMJj6VNCj4IkNibOBs4/bOTNAJOrT8aOUdZdc2NXTTqGrDzbcB+5YH/qAO51vC/MJMk
         e4vD4kut615xUIMg/h8+HoD+hoAFGbYmQk0vtOYj/AdM2xtAqUJ8UoKdcBHaqcZSdw8k
         Mo8jocNanhcoVor74aYGLsFGj2c1yzWMfTqvOOB6Nek9Tlnrn4lWDq40zdRcb97QJRTw
         bja1578GkV1q1EA43TQnPBo2asr9X0touKKB8MPvHhfW+ZxCM7Fxe7MKvVt6qjgtDvU0
         j9AQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+x5mZq0mcb2nXWD+wH2PB/5P3oHu0iBzaZmvJ3lyTl3mkHfWdZWLHRme6x7e2FuZSOfIKwH6CxirAW3Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sQN2S7glSDs7ysP1zISvKQ/KK7R558Ao0JM5QFjvo79WL+v/O
	UbSUPkL4sqyTP9mQn+Zm84b7iUH5x/XKAzSzbR8ziMloMCZO4ebeuKfK
X-Gm-Gg: AYBFou248bO3rXysKD+2R11Z/SlV7OiJkg+mGrWCCdfta+wKxAd+rryplu8DrQt1Hwn
	S5LCB8mt83eUJw9DCOlBipuZbNCZh9HAy7piKK4cXB/ty4Lmj+eCDZzEwXTxbEg6n+kJ96OMNtJ
	qHvxZ5a4jt/oUnwbBBVK2HRdcZR/yaHfLYVHP0tf/EEJAlgZBwiRhDfoTO6tG+lOK1o+N5+EHM6
	GVaBy763KHQIFN2bE0CgMajyWD3j1j3Xh4D/4pZxuNEsf6//CKSnETkIoONxNIW9xgSNCLzYrbK
	gXR4dEV5sUniEc1REOGjPnyv0eAzzt0w7HTM2qZe0/aE/czj4BC0p+xr+G16PH/oBgym6uX3h20
	YlMbWxCjkHEfRtZHW9NxWBi8ufhU2WSQcLKSZaJ+S0pZUerJnKDxDL5LU/Vvwb0OKw24E6rj5//
	eOMeC1xONDKP9qbOCmptAtDv8wiLM3Qt0jVbP4XLuVHL/hC6iexHcLB9thfs+/Ca3Rvh89Hqs2B
	gvzAgmXWAeMVet6uRC+n0y9kzaFfVll4z5vmsVVD2wDM5zhbLkWTrjy1X7Tc5MS2f8XtPVHDkAE
	6P2Q1BIF184ox8O3psasmEU2oGyMlVZ853Q3o+3RyJiyYjtU3PM=
X-Received: by 2002:a05:7300:d58d:b0:35e:f1a5:9ba6 with SMTP id 5a478bee46e88-36a4221aca2mr21618441eec.5.1793710363113;
        Tue, 03 Nov 2026 04:52:43 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.93])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429000f8sm48196220eec.13.2026.11.03.04.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:52:42 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: cezary.rojewski@intel.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	rosenp@gmail.com,
	sreekuttan2156239@gmail.com,
	tim.bird@sony.com,
	tiwai@suse.com
Subject: Re: [PATCH] ALSA: pcm: Fix source frame count calculation
Date: Tue,  3 Nov 2026 12:52:11 +0000
Message-ID: <20261103125211.3484-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87pkwn8ebe.wl-tiwai@suse.de>
References: <87pkwn8ebe.wl-tiwai@suse.de>
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

Hi Takashi,

I would like to kindly follow up on my first patch.

Could you please let me know if you have had a chance to review it?

For reference, here is the patch link:
https://lore.kernel.org/all/20261102135034.2751-1-sreekuttan2156239@gmail.com/

I would appreciate your feedback whenever you have time.

Thank you for your time and consideration.

Best regards,
Sreeraj
