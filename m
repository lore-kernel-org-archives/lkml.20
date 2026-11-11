Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367314;
	b=KmMqKdigEo4LwFgRbCHq4ke7raRpwbX1yp4GB35CUmnCzEnt5hpmcyhvEQDyfL3tcEvF
	 FCUpB5rWIBPbgziOgN/K//OSCjuzB6yVHTNTS47RNDOqMuKRz5QF0+MT4HI/TObDZqF1k
	 mkQ6wBe4xAkHsknWtu0hbnV6V4jre6big22h0otR+5L83OnwxScaWCSaXa5I9Pu4Wihpe
	 5JPb+TPY5B1B0RKH3rJF3fpufBEggnJu0oNFL9yXeslZpCDEOTj6U4NmPkHswjjkQPunV
	 dGstS4Y8HmGuqmrqj8OiOsn/Ww6BkWAFjKtv1TYCEyUe5rS8/Dh3oE5RynXcCl0tQtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 Mime-Version:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=/4/b18xONg/TjeQwy2IjOoUIlFYOpF2rQUSoZ4nHhKY=;
	b=P8SFO4tD7DUOvmSgcxYZW4nWI3mqNKY4NeJDU0ja1PAnh5DUzlw1t7bPVbGRVcKS7cQc
	 OCsY+eEtgecCcQDjfvSlPTPOKiJxCiviQV3+FRdHFQvK9JMFza6qyDwADf5Mfj0JK/+Q4
	 n7HUnc9xERj32f+cgNEhGHSQ/uOtK32+OdgMnJo5aZ12nTHg7D1CcWvpUxexcsqMAG/R1
	 e7pGZSnrRPOBhDx5XcCEhpEStcfM+sFnTPm0uf7BnBdsLEN0AgLooj261E4atPZy2VM9h
	 SHpFFLDz0FizgTHwJ42MweOGPlWh6N9MiXrU5WB919olKVgOi5fiIXAxLC1HsGz7AiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FrU9LBlm;
	arc=none smtp.remote-ip=209.85.215.199
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F70606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89F70606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FrU9LBlm
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdba0aa55bcso1658923a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794367314; x=1794972114; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/4/b18xONg/TjeQwy2IjOoUIlFYOpF2rQUSoZ4nHhKY=;
        b=FrU9LBlm8MLY/US0EdtNgcWsRfNYQxpoBBeb929r2EwX09owXcs15woBd+/VJSBaFo
         LYyVIMzB+LQSB3SLbcLvOKHS9ZTg5v19pSgSFCOlrinjY1nZ0ICxl2EPA50EVkyPo72J
         Dm7blxhkCYsKqdo4MFJffP2qhj6GtdmG+faaS1omx4Szv4ivBbHNVkv8HbKdVKlJB7AS
         B18sEh/Utc7AZ4VBtwkCQc+j7d413/RQsqfJLf8Wl7JOpqUCotnoV3RrMhtxqDgbpWY/
         TqPKyLxuoINUJqPTLlyLtDc882yQFGDc7EftXu1fW/oYZxV4+yulpEni3Vwe2VRgBotr
         Pd7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794367314; x=1794972114;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/4/b18xONg/TjeQwy2IjOoUIlFYOpF2rQUSoZ4nHhKY=;
        b=lUSNkI907xjKwEL9Z8uSVdusc7jV7eC4I40yTJoL3Z8aSVv1LNvpyMNpHijDJ0Sbq3
         CXIvGzj5MlfpbdbDsUCuhYNhILiZOfB7WszPjda5OXsst02tIwC2mc4V41qooJik26dK
         C5wizHkND2PQQzl9FhhxQkNACAjUvZLsB5Q4QA/2xmzEbcJQdPrecCryiyJ5rUvMQUzg
         wGOgIj/b5EwAB1l428GvEfTcnMb3oo4J2lP/QKTl2hgvbxle5ABoVJwWbrvOLEPOyIOW
         cny7mrizSNWpih99EKoe6jmarAl86oPzUauM6yqrtNSauelMwOkksbnRKV6i52MEJvyB
         Q63Q==
X-Forwarded-Encrypted: i=1; AL+hErGDahapJzYlePM+VnZu7mM9h3X74J1PbvJxCENnL//gqLK1JnUV2A8FlYcGsNDBLBlA8CAplfPWxjyaNQg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/C2FnQf3k0dBHAjcD89BL+NfwfHU34fxk5ZTJOO8U959E98/V
	ygbghQ7ldjT59j1ZcDmbsMki3ZtdvPnxwJQdiRjm73p/2RqVq9FjKr4sKYFGVR9C89sD1PTDoOJ
	HJZgCIQ==
X-Received: from pjdq9.prod.google.com ([2002:a17:90a:2e09:b0:3ad:32d0:ca0a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5110:b0:3a0:7261:d58e
 with SMTP id 98e67ed59e1d1-3b182f65fcemr1096371a91.22.1794367313660; Tue, 10
 Nov 2026 19:21:53 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 10 Nov 2026 19:21:47 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261111032147.166134-1-seanjc@google.com>
Subject: [ANNOUNCE] PUCK Agenda - 2026.11.11 - CANCELED
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

PUCK is canceled for tomorrow (today for some of you?), as many people are
traveling for KVM Forum.  My apologies for the super late notice, I completely
spaced on sending the official cancelation.
