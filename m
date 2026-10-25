Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792894681;
	b=jr8u+Xn1mXYKpn1UZHgS/UlBMgW3RHMmfMafxpTl2WO0eHT5uNQIZD1/PZ4nrzJqVNjM
	 W/Vw/dnnzZ6huzSsNBYn/oXKGeRG0nx2Zb/LnhrMso7SdlaJ31CrKTQOxjWPLiJHJENGN
	 Fv8zK9DOAbJlZS7icpXj5gc4WtayJ3W3pRMWyMZQJ6LC73rx21wKwUlERdgrJLVSFMJSC
	 Mz7Oxeyb9K4TIPY/9N41hS/p/xOEyzWxbw4LX3OaGlPvu/cCs+/3cBcQ0MM5b6sO1si79
	 uiiEzug+y+sY3GFadw6fnH9mS3CIJLPIyoXWL2BcSmIVN+0aV2hqUhIaxLma54EYkDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792894681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=XRo+9xB+oh8S0Rx8RxvopOwEmLItymY1nHGmltPfYUg=;
	b=rrikYOsGfNP3Nq2pAHZHS9PUM76s9RznxLJ5LiaHc4bN7bONQYXEuLRhY0rlYEHRSHTj
	 aXXLrsVHouPw/Y29b4YXrryGIllN/cs+gHAMrG+2d0nFU0A6JEDjPxytereqbs7lQV5nA
	 ZWNnyz4TmGy35C5hDeGqeNk+8daYpUZdKw2OteuyD7zQ1TGBVj7Z9AlwWW4C2lnEEsRKd
	 BiViSH2NK8CEMOTtb2Cvbns/tzAsnUhgqUbq++epbTrL61r7yR06Qf8tH4hmA9e7E/MFR
	 yJFzarG4t59+0tmB9vfO0+RQ1bQ3beWAb9yA6ssyF4sJVj0hR0iHX6aSRaVdVZjDRsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oV6CHipU;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BCC606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:18:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9BCC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oV6CHipU
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-82109f51565so857604a34.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792894680; x=1793499480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XRo+9xB+oh8S0Rx8RxvopOwEmLItymY1nHGmltPfYUg=;
        b=oV6CHipUXqX3uSguvm8Foh58xy6rgrbqrlZCyHvp2uif8Utqxx/swkC0xoMHR9cEFM
         RvuWdAXYYgXfnoW4WzmedcxODWxOLutqgor/rmdQ5boa0qzgRFzgHH4TAhYtG788RmIy
         IOjefGKTm//12Dhds3W3zBUfAZz3HXMUCy5jUdOVW4MOKKdkd8to9VFPscnTeENi04Ng
         +jYBZxlJOc5hIcyOlxt6aSXQsEu8DYOaWDaM8BDncDSDDzMpoytHjrwhefYoDyXJJeex
         Yeg4fQXxJIVbOqYIZl3rNnOgW+RlruTTlvHpvb63KlFzxmR/qGjE3luzAQmGJtvd+mWE
         y4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792894680; x=1793499480;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XRo+9xB+oh8S0Rx8RxvopOwEmLItymY1nHGmltPfYUg=;
        b=10Bjdut9raYA0fyskb+vYzPk4qJ7DlRHmRPTs9xjHSZQh0dPhZ+e+JZNfrJ+1fKvRT
         i3CrffCnLKuZ+zTAbtikcauzUcP9t75cLeTNsTizRkldlFMThYqKE5ufqEIvly8zLP63
         fa/901pFApJbkdyEV0T+Hte+F8SD7XlbvzwBAy47EZJfC4V7rZ40e7261E0zd2Wl3h6g
         dJrUUEL1vuAJqWB8OwAjU27b1Pb3KfMngpAqOrCw6ZxO4cAOzeVNmk9tiptlb2jyMUc2
         m+NqVdS2S0wY1CxSObki/HOFM6Lb09wQ8xPa5u8HWAEQ+tHErJhcmUVFZdZXo9iHsRwZ
         UAhA==
X-Forwarded-Encrypted: i=1; AKwUvBw+ymLdHxijfUAqVRyU9O0+WQpfP4TG5ozwikNJvdDaVP57BPSQqlptitOyUPa7s2p2qGaFoDTQh2Piy2I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5SR/0fOeDFAsJghPkmKE4aaUDC08h71xQxXIWV5QlZLZIdTHk
	D/+nNlg/l5F6mcsFPLbTafqcXL0o4VNFF0/EMTzbxmfZLLYuu3xuksaV
X-Gm-Gg: AYBFou0HKNVj/I40/BqP1iB30s2wslzZs2PH0TBRxRetRcwl1Qss4Mmw8gnYVYusSxe
	yuPhzMRPiZg7ppj1YSIBGoN8QRjV6Tej08B3jPHxe7hm1e5HfXjqsqVfnd9Jl83jU+01UCOpBsh
	FT+sx1WhFNU3H8yenXcCpS720nlpvYHkAnVYrY81XimUQysbsLHREWrTtgUoNIBRNCmNONo6jwX
	xJucJQDUoIxqbdP4kfTud0OmF+zncnJ1oHqwwo6SwDX9HVSaxGwX3vRzc4ibKDuEba5XxK4f9wm
	GXpkjZ3oCJmVatRizFvf5h3LgeyKFSEzQKIz7UjvEBCx0JxCocKK0feEja4Fkj+PQmHn4GTUEv7
	SGoiS5Xesh7hk6JmT52ApoSeUX21R3aIVMg6a6eQFfNFRgwyo2TBAk91ETdvjfxvpb5Se5HljXX
	AHUTOvZ/L+kOq+kbQL21yEPOo8HNeRJAbk7IWnD6sK5SBHI0LmIc9hNE8bjFYCSfEIDYDN2X15U
	8Lrd8qBK/v7uyxJbBG/hBhRXu5ktmfiGqzqwd6G32VBp/crDSG+rDCTyP/EwSRiF4Hd46w=
X-Received: by 2002:a05:6830:4494:b0:814:b62d:3122 with SMTP id 46e09a7af769-850fe112da7mr2774207a34.22.1792894679793;
        Sat, 24 Oct 2026 19:17:59 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb64a8c4sm4058115a34.15.2026.10.24.19.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:17:57 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: dhowells@redhat.com
Cc: Leizhen Zhang <lzsx618@gmail.com>,
	dwmw2@infradead.org,
	akpm@linux-foundation.org,
	keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] insert-sys-cert: fix use of uninitialized pointer with an empty System.map
Date: Sat, 24 Oct 2026 21:17:50 -0500
Message-Id: <20261025021750.519884-1-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261008164137.3671294-1-lzsx618@gmail.com>
References: <20261008164137.3671294-1-lzsx618@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi David,

Please drop this one. The uninitialized read only happens when
insert-sys-cert is handed an empty System.map, which a real kernel
build never produces, so it is not something a legitimate input can
trigger. I would rather not add churn for it.

Sorry for the noise.

Thanks,
Leizhen
