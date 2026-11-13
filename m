Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599430;
	b=4UrdNv2TjP6J+VkPU2BV9YeWoOb4r7ZbZ0tXInJ3rkjWrua3pJ62hZkAGwHwjfxn9oAG
	 JWOIEUfGCfbg2MtO9POOsU/41rLIiFXCWtESaPPoc/VRfKMNK5OIASqzcVfodXxAt2XxE
	 0FIwPWyz8uYTK5wOzkeKKgXo5mKV469eCoblzP/ocG5L+i+JqILMNvby74W0g+ADO+zDS
	 bXDPhjAVaYP3yFrNSgTElhHPKG2d/tkDmtLUzh5OgO3NHN9Oa7k3puf4zxtJ07A5d1Kib
	 cOKzDwMFvWbhq6x9QiKL91I8J9BqpzqhFxsVUMf9HJ8f34LmrTWQss9755t/1qiwijw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599430;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=a2cHGLKa4ChBnuzA4CAjFivDrSBNfot35o4OmhNmk7I=;
	b=qNS5d/V1qhVwh39kvl+8nPKQUN97uB2kLY1DRAypmMF90HWjNX1QWdRbYZwEV1oKa39l
	 FIRi1kemwiJaH5Hz6L8EEEVVRpver4g7r8GJa+l9X0xo24szNZVpPkFzVGJCvZCCOML8R
	 9ltbhe6txU2Y9BlPOGmC+401cekXYc5Iu3exAPG2OLCTPJiqBfQMterYf079A74cgXAhl
	 MJQCU6oNDOLuAwrgrmBFyhrbIBFZcG/qaOhkjqtdO/XDobw57IM4OfI78BNsmaLFs9ulP
	 sAmzBQ3cgIPaysR2255EWeKIMfDSb4ITZHOyiROlUyv7UFgPt6riIKG0dplI6NK16NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=XJxNNhwt;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CB4606A335
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84CB4606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=XJxNNhwt
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso537905a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794599430; x=1795204230; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a2cHGLKa4ChBnuzA4CAjFivDrSBNfot35o4OmhNmk7I=;
        b=XJxNNhwtP8bo7X/MfuL+1ly6k1wUKRjBUk/gv564/quCH/tLGcASLoIlXSZL56/mq1
         zB+VsAIT5RaCLIzbdjuGIQYE2DOO51CLoQKlalLNVK9Vht2KF0TQfC+6kuQl7uXOB3Kv
         uZfcpMYYRKkq/xR5LQwghiOY6EaW/Lb+TSNrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794599430; x=1795204230;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a2cHGLKa4ChBnuzA4CAjFivDrSBNfot35o4OmhNmk7I=;
        b=hkJRf0IP0AbX68KmZ2D3K217U/7VZr+j63DN3p6VCMLQJ93p0f30OYGG3iXzExESfH
         jBIGFUzx4bH6nq1lAE5K28EMRERfrbbw8/HfKbhLC/6VBx+0r1AeNEfZJx9wCalgTGYE
         BoR0UWN6+5j9pR3dV8iqr3kFApsdqInYLWFHzGHRInCWPX/zxLy72aP87tqPA6aRz/g0
         ztX5X6IjFP0qlGnYMgtt1NCpeORp6TlvLDhT9KQSsTuCAeax+cSEglBa+HCHkETPc4yg
         S0mA0GjMoadF31kHr0730RwrniBb6eYYVHxIbD4keS/CI04h5kkzRYj6MlisV8YQP7g/
         vZ8g==
X-Forwarded-Encrypted: i=1; AL+hErHlGg6tAdp3+to7tgHRhOzUMTlAx30HvUX+24TLKR3iXGQZYLr/RGfX3MckkCMrG73niftUDjGZmLJqtP8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qDBBpgTpqhW15eC/Pvj8i7tfu3dchyG1zyzQ6gmBcHcsZj1Oz
	cYCux3fsnHWN5Q7m57enAyl0whcGjx5XMqSC4zv8TzjsaPRu6pzN2j6KX+6f08Gkpzo=
X-Gm-Gg: AYBFou38gQPD2C8hXhLDFkM6/cFjT9y1b4e+IQd41DdoPWexhQMuE3suJw2gOAZttDQ
	1bIk1vaQAAYfWFkBQ+2INS0/caRvIP1TqkW2uCQT2GrRa8dz3vxcEaZ3cMxYtbq1HgGLMVysyCm
	OZKDeVeOOWqcMMouAsYxP4AVeqiRnkvAsKYvGJUqju+l4SpSsRPqCNZb/543Umdz7WFmH5jBvS1
	tHn9K6jcPEeEFJ/e8ogrmOfbLVvQ7xJIf66cJFQp8yot5+WxtUQR+Hoqz0/rV344Ds5vU7+EcE4
	fVVUymBQ/gugR97IK6muhIdKELY9WehbVCXz1u5lNQ8AiQCawcTmySCQiy2pzrGRqdTqMf6CD4x
	Th9bNstyRItEoO9NwVSlBCscPpI9HYUApuUKvhtX+ETRK7ek1qc1z94unowakURBA+DV8q+24zl
	4txCuhMbipHDPjv0jlTsz5SSC/JWTWZAKo5sC+vDeOtW4hrjjycEzDOxotCOhTEmm9Z/Kk842YP
	7fCLHnqZl/nzat1BbiI1etuRGPix1PQReCcyVUmXhTOvqOVB7jh9TpGBjQeh1GtzMyaYqQqcYIs
	snpIEXNzP3LNpIKPJSy3EoQQh3SdLN+zJSowDBc06A3LruGPcXUg/e9cPbE2WQAYU4IMwt6wseK
	LwHCMVrbfXo5mJn02QB/1Bw5tPJkqprlgc6WSlLCo+FyHDxl2b5O0X5JWg30fqRvRjNSgVtWOsk
	EbRFZenEdh+xXnNTz6MlU47t5OhOxJWYAB2wyxHfqpXB8c5E4arYUAYm1Bgc8s
X-Received: by 2002:a17:90b:134f:b0:3ac:b048:fa13 with SMTP id 98e67ed59e1d1-3b1b0cf9ad5mr3440579a91.67.1794599429822;
        Fri, 13 Nov 2026 11:50:29 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18adce4sm1656569a12.23.2026.11.13.11.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:50:28 -0800 (PST)
Date: Fri, 13 Nov 2026 11:50:23 -0800
From: Chris Down <chris@chrisdown.name>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>
Subject: Re: [PATCH] PCI: liveupdate: Factor out pci_dev_ser allocation and release
In-Reply-To: <20261109174009.735309-1-dmatlack@google.com>
References: <20261109174009.735309-1-dmatlack@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261113115023.0690d833fdabaa41@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi David,

Thanks for following up on this! I've tested that this works well.

Reviewed-by: Chris Down <chris@chrisdown.name>
Tested-by: Chris Down <chris@chrisdown.name>

Chris
