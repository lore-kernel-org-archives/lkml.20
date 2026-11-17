Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925013;
	b=FOyg8nNFk6v01f8jV6sJTBhG3aC6sa7HYpOcioGXW4eCaFJFYIDSrjy5kGr18sm8bjb5
	 Ke7lEAzhG6E2mddBJZg8LklGcqi1+AbUN1Mo4GkNi9R8G7LiLv3hEgzc6OMA0pZdP2ABN
	 B4UCgPtVlc/0x8xnV4a2ADyb+4d4NhLKAXafxMfj02vGAi/lgy+jfPVBObZsSAqZ/BbYm
	 0RFUx79LmrpJNciDXOqRSwDz/zU+dQ7vdUH1lL66ExYUMTLhTP2yTiesqb6VEXuNfSXwG
	 Mrne2fNQoGxK5MfCW3U7Ae6CX6eNx7STmnz+Qe3GbTEWf/grhKwOVp147A/NevA3XJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=SoUaO57cW+qqkOEye/VOIeEzhg9zr3S8sinSgtnZuIA=;
	b=Zbop3LPQ7qaGj4r8gqnJKeJbMAPdTgV6CAnC2j/drpicmV0aUBSoZ9UAO5b3hH/ejiOG
	 olpW8pBwCbKei6mBHxRwcOEkQEc87h1G1BS9hHONDlUbWxYIAGiCRuVXxOemOq5tNHzoJ
	 4/RLY0tM581Dk5RpHJhQlIYCW8PpEySLXtK2w6cgMVuleGZoRDWLBI/jHHfBTlUooLohK
	 9gsetyF8uniCa81h+P+doaBwgA19xoM+kzqhrBMtPVPZ6nvhA7WsekCt/NHUDMlP8j2rF
	 4xn7Cr35vzXM3evlRIoTonXV7keCHgftP5YmTaZ2TVYlgZrGDvwo3qIjkLDxe6tRkLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Wb0t6x2z;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B95606A893
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:16:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96B95606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Wb0t6x2z
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4bb64c99bb8so25444715e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794925012; x=1795529812; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SoUaO57cW+qqkOEye/VOIeEzhg9zr3S8sinSgtnZuIA=;
        b=Wb0t6x2z0bJUOeWrNkngiljOJZt4w2VXLN+M4uSRv1VdR88KzK8RwNj2dgBroLNDNs
         wRdKE9QBHfdk1CDuiuOVengp2OblJVPYmJ0rvO3IquYPE+w2ikGta03f8IbNg7vYJUM+
         iE1IfLcV0V9itpOfTA9MSb8yVbUSAqzSOkUbAlxwBNzNkCivTsVbjRMW24ul5mqZEmQH
         LSfn/Tpaq1v+r0R4UWhcD+NEGaXB4Hd4XrFjnT58UbRr95j83FNWCAJSCfLsqaUzrCF0
         7pnDwM2f5GGJCNbc1W2o/5xZlIV3zgMbc+N7lf9dvQpR93/+USvioFVPcMklolqu6l0g
         wL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925012; x=1795529812;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SoUaO57cW+qqkOEye/VOIeEzhg9zr3S8sinSgtnZuIA=;
        b=osG3+63+o6HbaM853xEwmjtHO4sLgnPjbiZpriEHEUdWc8OtKjsbhMxUlBYWY435+e
         MAmx+eNA0sm9M7dcntPPbfcE624bGCRpxanX+gBBJavHyB1UbjOXs4fqLYkJTV4zmJIw
         QxtvMWcR4UK5a/9kWjtTNu5009u7hoQc6RC5XGPAXaDMbSvbUL846wpXLyxX/k0cGzfy
         ukaRrI9pC89W8OUph9DYbQbWf6SqNiZqzDZ6TQ925wUOR3TjnUl9YuTGjLpIC2k8C6RP
         JBr8CmD+Fo+3DMapQXXpDLoiaFEVzoUvHNkQwb1//ddymLhilCCetL0ZooalHSLtzyBX
         bt5Q==
X-Forwarded-Encrypted: i=1; AL+hErGqwyez5PgDTaZVAkIx1nta4I9D+OBUqx1qgu5QzzUUxGSXcbxryssmeo7jVI3i7fBBh0sVuh+kB4YV34w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Y7UxNlX1MtWrM4gcXZzS6RJrfRwaRGucUhwe9+OP94kYHzNVR
	mxwVuP15nz++O/C+vXbAwJvhEzv0Ia7afWGRREadaxy/kRTlcj9CEsA/SDHny4ONA1HWhR7Vk7B
	NC1oRc2SPHnI3TEZm9Q==
X-Received: from wmbjj17.prod.google.com ([2002:a05:600c:6a11:b0:4a3:5d5b:9ad9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:670b:b0:4bb:7987:fbbc with SMTP id 5b1f17b1804b1-4bb7987fdc3mr38878595e9.1.1794925011619;
 Tue, 17 Nov 2026 06:16:51 -0800 (PST)
Date: Tue, 17 Nov 2026 14:16:50 +0000
In-Reply-To: <20261117001507.1611984-4-dakr@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117001507.1611984-1-dakr@kernel.org> <20261117001507.1611984-4-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117141650.2992151-1-aliceryhl@google.com>
Subject: Re: [PATCH v3 3/5] rust: sync: convert CondVar and PollCondVar to use WaitQueue
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, boqun@kernel.org, gary@garyguo.net, 
	lyude@redhat.com, daniel.almeida@collabora.com, work@onurozkan.dev, 
	ojeda@kernel.org, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, tamird@kernel.org, 
	acourbot@nvidia.com, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	jack@suse.cz, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2026 at 01:14:44AM +0100, Danilo Krummrich wrote:
> CondVar currently wraps a raw wait_queue_head directly. Now that
> WaitQueue provides the same primitive, convert CondVar to use it
> instead. This removes duplicate init, pinning, Send/Sync, and wake-up
> code from CondVar.
> 
> Keep the wait logic in CondVar since it needs to release and reacquire a
> lock guard around the sleep, which WaitQueue's condition-based
> wait_event() methods do not handle. Use wait_once_exclusive() to perform
> a single prepare_to_wait_exclusive / finish_wait cycle with a
> caller-provided schedule function to implement the lock-aware sleep.
> 
> Adapt PollCondVar accordingly.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
