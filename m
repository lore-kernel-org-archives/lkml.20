Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793850558;
	b=nBg0ifMTRlu9OL7N35ykQN56W35fM3DQGfqydn29ix1Q5+OLMaZEeeLEAGptDupMpQms
	 pxhsam5paJsUrCRCuknCszgm3fhat4NDKdoroQnPam4jyozbAb0iMNunx3NyCP9pAzsSs
	 EAlaJsa2saoJeS4ziPGyfHnTqHrwJJAE1uKLm+K+yUlEQ+aStXR8l+n/M+iaIwluaHW5l
	 QjtRMDF7pQ0rBe8x/lcQSZjxxAnFZOGw83TUF4IBpbhscq3AEijY1g/Eoj8X+sXLwhhG8
	 aolfb463Pr6fAYuzBK/Tfhk8T9pnQcfVH1dei/JGkU30wTTJ4FB0VBTtBdFUrfmb4Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793850558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FTQt/DKzExkg2Hajv9Ngnf1BFMIHptWE7Rva4W1+tQA=;
	b=qTuT97PM7KWhNCq86B7aZrqJVEWrwJK9KHWL6uaYhP6hCutJev268H3Py3QZiNsxuaSh
	 h/u5UWmnSAKsrrzUVDUcCC91mm5Z6F5pGcJRu86i+q6iohqJNmSXgTnzX1O55/J6Z58UQ
	 1VoVj4yVlcqStKg0CTZVUKXv4hjXQHvu77KuTi9gNfkzpDTY+jKdbVR9IpcbRHYswCzZ6
	 lzbyezHaCSfvqtC1IBPIWdpb45yD8jaCz0+sOK/Iv+zxmB3yHOd/IkEnWbVYohPtKEsKj
	 8FHO2YGNR+khxAuPWy+esJxdAeO2tN+XE9cKmTI3RfjVPO/JU2KivzGPOWEY7ky50SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=reznichenko.net;
	spf=none smtp.mailfrom=dpplabs.com;
	dkim=pass header.d=reznichenko.net header.i=@reznichenko.net header.a=rsa-sha256 header.s=google header.b=lih9eOOT;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93633606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 03:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93633606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=reznichenko.net header.i=@reznichenko.net header.a=rsa-sha256 header.s=google header.b=lih9eOOT
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso314873a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 19:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1793850557; x=1794455357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FTQt/DKzExkg2Hajv9Ngnf1BFMIHptWE7Rva4W1+tQA=;
        b=lih9eOOTmw1z0fUo7FCWm1oacDIHX4dduaVV5EV5pZmV11z7jsruGIlv+QsQ3Z1bSt
         W4fMqBpMHXM/J0ZmJ6Eoc+dU4en1t5mS+5XH85blXagVK5pjuaiooTlHkpUnqaSa3Xg5
         l3PA6O2P9O3uO+OWm33skUnh801r/qgWQb7Agoe3h6tnG8HDTYJyOkf3fcdMzQ/h+Qrz
         +NkHmyTrIsX7VhLKUX10FvErp+45ZsN08oI5zhpmzVeB5YiaVxoXzhtuCfxCsKT7zWsc
         2cmPGIt0mbUJC58koO3bPZ/5E7w8XtXfNX4R4o0IrulwVeFlxfjKBrNiU5tLCGiJe1Hn
         JVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793850557; x=1794455357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FTQt/DKzExkg2Hajv9Ngnf1BFMIHptWE7Rva4W1+tQA=;
        b=j/6iBz51zKVVZbArhlMRRp3aJEsOuJlxkTJQGc1s+NUBKXosdeY1TJ041b2y+vuZW8
         RVdCZFKmKQEA9cS2eFzyIiD3HzWSONCcppriSA0VPWJ+t4BKQFyyMDBUM7wJzdguD8y0
         7VnsbUMOgyZEoK1gaLqPV1pOom4C6ExzWaqJLGczHVrYxVPLuV53HozG0jQL2q5eCJ/i
         jQaJ0vV6ABzmrWLfie/Y1pTU5wN/CoSU4YYbFeOQUniQw0KgFv7MH+zvMQNO+06uxKcS
         z7g/cO1mykslt003ZDTFb34+ngB4hfWKYkJfNCyMrNLLWOCrooq7g3f404KCLiBMnlEg
         v1ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVTMJIgEpwvwfWJfdhZVkD08ArOR0AMsd3nCVFSogEPiIUrkh9T7XUZS6C15Hd8AbTgGPyv9dvXAc/Z38=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KDn+QRC3xzHnirRhyRgtSFfxT2vCW4U2f5yt6nh7qfFrBR9tK
	aWazN4yfMt6QUQ7+fqo9wA3zB+gQLhmlj6tBiVwW49CLC+vsIqIxiIUT4H79nROjERc=
X-Gm-Gg: AYBFou1BnUXvfasaZV86+Lwskiwifvu2Av5r4I4exdnMNDF18Bs7w/a8wDSAoVP6AT8
	sfNCPF/r1jF9Ot6fL5m9jbnPdrJYjY8+5Xjz5bGt3SV51ZB28bhZI2U4bpmsV6e+/P2P62TxTeu
	6RRVeWrZseEvfUAZtlL67V7veVYhpCRrPK9dop6zb4tS8XggAWhXwjQ+PzlhX767ZCougA7TD9W
	TPGgw4TEABaMIp5yNXJV83oH/1WjDhl+FoqSOR5baaQR0aqRA6zSGlA/Qtw8ytHkDpkAK5uFW0n
	Ug4F2s3BgZ9SRpASKJknPxFZXiyt5QM4ufHo6yNjIKo6aPrak6ULsJM93pgJWsuNpwBUNO0H1bH
	5siw+Y/qo2XCXhVq2q+YHQUb9vekF55+1gglsECSJkqxpqzE9vLa181q2IkY4pY8UA8nBZtr5n6
	8i6etGEES48O6p+932TBvEvDkNUnVa6LP+coMj/GSLTilsu2UrRrOxMDP/XEREY81I+xbW1qkE6
	1/uvAPGBYhjGfUQlStc2mO4MEVU3OUkocVf5Cw0EbduDIFroKqIzOVI38WD0hHMrj3NcK2dMcsk
	LIHpa7JfkO4IE/uYlylEuI8qMIhsANLvNWtekQGqLQ==
X-Received: by 2002:a17:90b:540b:b0:3ad:eb15:aed9 with SMTP id 98e67ed59e1d1-3ae8957cffdmr14128129a91.9.1793850556806;
        Wed, 04 Nov 2026 19:49:16 -0800 (PST)
Received: from z440.. ([24.21.231.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b094ce9f65sm3564391a91.1.2026.11.04.19.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 19:49:16 -0800 (PST)
From: Igor Reznichenko <igor@reznichenko.net>
To: romain.tisserand@gmail.com
Cc: airlied@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	igor@reznichenko.net,
	jesszhan0024@gmail.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	sashiko-reviews@lists.linux.dev,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH 2/4] dt-bindings: display: panel: ilitek,ili9488: make the port optional
Date: Wed,  4 Nov 2026 19:49:13 -0800
Message-ID: <20261105034913.25463-1-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103110524.2812831-3-romain.tisserand@gmail.com>
References: <20261103110524.2812831-3-romain.tisserand@gmail.com>
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

Reviewed-by: Igor Reznichenko <igor@reznichenko.net>
