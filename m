Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610143;
	b=uS5r3KHNRuYJzY0BQmyQKE1atFZiGCTdgxDxGsRFiL8hjmTq54OkQkXTawIuf1dhinaD
	 0W91wgGBrB+jdWa/8F/LJS3vGM9FKuK23JKCmH62uRqpu8RW4R2XsdCc9BAUFG5y8Kxxr
	 7HCsy+4jPNLOpswYteQczeC8WiyEgdaemsbfR5t9tswnk7JcN80o+Mu5Y4OU59gb776iY
	 whzM2WscCPkHpAWf/fJDlylKknmPrahgsmw9xDOJjsgUatZEMg20pCqssQJMoWs+BKdmk
	 hhfqZRMlOLgWRWpcG3VyCnwDBXakxXLZ4Bx1Vx9VdmVHJ5OaVkpEIO2Ct4EIArHZdsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=yJCWLcVlTtiQVfwuNd4Ug+QWJeJEHbdAzaMQBdZ49Qc=;
	b=oaWGwahYss3jjI3mY4ddi/1Bvn5jaOT5MTePsvORPAAt75dOhsGazqqnm+VJcaVAUGir
	 qLwKAOkQJIzuuior0/gbrpAQQkUnkdBQG4+oWcI1lwdkUv6QvydXf463gaJVFOsg9iQlK
	 HUGznKVqY/HJQocTC6tef9dctfEebIcZ56K81xXxxJxSldXgHPTurqRVNb0CdmRJnggPp
	 lHuSd9heIlLgYpgY6gZOQP2giOEnPPu7Q8zAu98TunN4GuE21BgUEr/MmaqxxYmkZlC+B
	 c2EuBE0rUyuKIfKU1UVsrW8xBSVKn4Bo0ptj8tKfozCuvVk6PAK6+20SEBgSkdGzHJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sergiiushakov.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HKdXNGRd;
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087FF606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:02:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 087FF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sergiiushakov.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HKdXNGRd
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e6d6e780fso1271883f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793610141; x=1794214941; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yJCWLcVlTtiQVfwuNd4Ug+QWJeJEHbdAzaMQBdZ49Qc=;
        b=HKdXNGRdXq7vMXqBG1gfBNIajHsmS++L02ycTN7DQLBoyMmSLPIda2fem0StuK97G6
         Ztw9wCzmv8IAn0bBvIKcutXR6Qgomor0OlkbooPphQlgheALka3rM3WWsG9slsNNVf8i
         RH2p76chU+R7fe2Tu396Q2ykpss24VunWqvtSke4b3YiXcqlAFio4f62IIjoUmcakC2w
         I6DQJ/zThJJeOk8dzIGaPHfUklnlk+qFyjx81g3mOzeb4lLXkqunNlOPkqw9pjiln7iL
         qw6SSydMRZ1w5E+kQkR8AFj9aW3Q7BXnjlOjc/h4dC/HVXQymS0hzZyi7Na6WgeQq8ul
         wufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610141; x=1794214941;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yJCWLcVlTtiQVfwuNd4Ug+QWJeJEHbdAzaMQBdZ49Qc=;
        b=MpTt1785/cNnriu+hGbpg/j744JuKWYtUz2gMjkup2MIu4RnZ37XUREssPnJInjn0Y
         WGVsdqyNFdPgjvxA50sI+Cz7sWeeAqdY5I40S5JszCTP3uUFnqsR3viDdlbrnTreD16E
         Q1qTyAuZcPjDEt7K+0IWSKFNcoWgSMe/8TrRXpqyflYw9u23v/nOUvAqTYZ/jCLIMeNA
         Tb8RGboCNaOPe5VJQeg0vA4zscGmge/1nm1xZUDqeZKAuzrJkGaV4pkSt7mtPA88uZPY
         U7FCmv3dmDWKMIo9TX+Oamv7BvCrz+1mIMI4LvGT1W11e3w1MbC4e4Il236HMT2gI/rI
         mWDw==
X-Forwarded-Encrypted: i=1; AKwUvBytZp7yiC1+nbbR+cdpKRBZfGcDi7oNmxLkWKn/VTtCeQJw9cyeOv51Zt93bsFRUz0hyF29No35LV9LU2w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/G2S0mV7J2I05WrPbt2kQusQS2lt3/46podZ/s951l5r7/UgHs
	LWq4WFCv0XRFCdfT3zTLx/WxoqDFpLR1i4eaipJo8PiOnsgfGbnpsGR8OpQoB+WYWk8cn4BTElE
	LTQJW2DxXlJAzfF3vP47UZyvEhRM4AoFU/Q==
X-Received: from wrox17.prod.google.com ([2002:adf:f0d1:0:b0:48d:f214:2440])
 (user=sergiiushakov job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:e001:0:10b0:48d:f470:6b3e with SMTP id ffacd0b85a97d-48e6e30722amr15896125f8f.13.1793610140239;
 Mon, 02 Nov 2026 01:02:20 -0800 (PST)
Date: Mon,  2 Nov 2026 10:02:17 +0100
In-Reply-To: <20260918135120.1261150-1-sergiiushakov@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20260814105954.4060627-1-sergiiushakov@google.com>
 <20260918083557-mutt-send-email-mst@kernel.org> <20260918135120.1261150-1-sergiiushakov@google.com>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261102090217.3324999-1-sergiiushakov@google.com>
Subject: Re: [PATCH v4] virtio-blk: clamp max_segments to virtqueue ring size
From: Sergii Ushakov <sergiiushakov@google.com>
To: mst@redhat.com, axboe@kernel.dk, stefanha@redhat.com, hch@lst.de
Cc: virtualization@lists.linux.dev, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jasowang@redhat.com, xuanzhuo@linux.alibaba.com, 
	eperezma@redhat.com, pbonzini@redhat.com, sergiiushakov@google.com
Content-Type: text/plain; charset="UTF-8"

Hi Michael, Jens,

Gentle ping on v4 of this patch:
https://lore.kernel.org/virtualization/20260918135120.1261150-1-sergiiushakov@google.com/

All review comments from v3 have been addressed. Please let me know if
anything else is needed.

Thanks,
Sergii
