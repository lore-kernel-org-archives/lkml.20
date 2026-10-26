Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793038404;
	b=3OVF4wjEU4gI9OjtJY/vvv77vZN5yq/anBnft3bAHGYUqbHjbxruYTBlUaa6hSKetOPN
	 7tZ60+xZ6Snswp0jj+Xfv0jcX3k590NHFfCV1YI8ihTUWjuVu3LwRNAa4l0Z0VLJZQIIx
	 2OEkof+JEn8GNaJpNk2cwM3GiQpZ+N/ye5Fx8Pgwkona1cgSdf8jW9gwQ+poen8sXSKSn
	 /YkW96+KbzL2/tP6x5OufZNaNC+J4Z6tej6xsMkKTvjIDgberV0UpAOOeYLQ0eyfZ8crI
	 SpnZ/zXZ9SLKH22eyH8//ArmYEEeEMCsX4YTqHNqUVv6VEsD+rtJL1Sq7Ly4c9CL8Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793038404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=j/PGXyV6/Wt6qi/8E7+ZLUzJWYcL7XXDLU8lYYkrrcM=;
	b=umbhj0ZN/+hiNshN/C3cU1TQY1nRDe7G1PH5/63QywCLtglRFcy1aoCF+a3xl1PtT4l+
	 DCKG7XeA5n7l+MkM8JXnjHWna6jxxFzcrHVe2Xb+SrzM0FTP0C2Qja5kxUkdGvWe5Csit
	 UwNtW6wQW0YC3BgjuztmA8+1Lr0Qq+W67LPDNzLbSVnW5vaj8tFBsv+GI5jCUQWH2Y6Wo
	 kcEYlfOBy8gsGaMLzVPCIglToH0WdGiJ9GwrrloWOxNdbZB0hqu2UnBTgbm5cu6SPluJE
	 ilGSPQG88avtSQAD2fAJudbNmoEXzcQbE2qJy5XmqySWWvcVNzGHBjVU1+TvXR4q72g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=OXZAXbFm;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895AE606A321
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:13:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 895AE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=OXZAXbFm
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-18cdcfc05ffso3993380c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1793038402; x=1793643202; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j/PGXyV6/Wt6qi/8E7+ZLUzJWYcL7XXDLU8lYYkrrcM=;
        b=OXZAXbFmxu5N5tro2yRXp1EQltbtiVnGSO8vBdyCYgKSdgLXFmmaXw9j7eahoJEJYA
         dMwqGL80wIUv7bsjDO6wLee9Yvn7ZiqrFZROKvKeIRzd6ymmHBsRcPVsP/PhcrFcjknJ
         UWdfIv2ri1QY7PgLz7f9h5EmdMIZY4jHYRX7LJ/owzSYJvKGk7Su5hSq+eUs4k2vmZeL
         jVm3HuQuEodE5LCh6pqEInivyw9t6apxMVTiWWd7W9L1q5LaMqBtQjcJ6yDRkl4+BAMp
         OtC10QTQlyP1zdGZeT9M+4tphQhERT0Onu8ZpzfM+Jq4T82429meKUuFbUeAMZu+TEfg
         1Vgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793038402; x=1793643202;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j/PGXyV6/Wt6qi/8E7+ZLUzJWYcL7XXDLU8lYYkrrcM=;
        b=wcqod4brqrTGBhJQZW6n9HzOAu6rxcO+2f1/+C+LPa0aOVb5gTYPV9H9CjPB2DxjDp
         MyppN415W5cS6lucjRqSu+46qfx2tv3PkER9qkrXikEFRAgdvPi+y8Fhalh9bFDb6Vl9
         b4NoKkD6vy4TtwaAmz/q7m+dTs/3fkdk7QNFJriNiAy0iluiozSkLucQKixg9Cqc/CrK
         EwrYwLyimSLDOvdgEnYU2fohNaAXy8e2WujxSD8bbykvSx8myV8/Ob0j5sbKryrQgjik
         LUWpCMoE04NuDieund0SkGl2Y0A8pIJK9WA4r1nWKbu5Fatf7EPw2r46CAc4jpYD6G+z
         oGQg==
X-Forwarded-Encrypted: i=1; AKwUvBwj0yl7iQ2fJfCGbVsQvs8zDa0seBOgsT4ag59mf4gqN9GXmY38XD2LwS2iUDR7OQ8OhBlwFeXwfXmDjy8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHIP5qhEE6o9+BV/buM9v9LqQRohlphzGYFs+fk7kQ/p0cFi8x
	+zvjPy5YAqkLWMTnChGOmUf/v0t1U9WS8sLQYPYg6RgC80A/0gR1I3GylWLY/g7ax1s=
X-Gm-Gg: AYBFou38xFS3TCc4os12Yautihv2TsrMxXYmEPnAPG1yf1BMqC761M8Ue0W0bvsuQ1X
	BArWGEuBOoYKmGG+fhpeEFhZSN4/mkErCAHYTQE8C+skOd02ZIjlSMuyJIdyjA3m71SND37iFET
	WfC/0yHtetiJt/EvraHufEYqOQzG+0g+mV5kLQ/J0KRX4JaXgBbKuyYk+/D64xptD/xxLXPZ5eh
	LteO8p2JvPUxOfewW/zuYeBPjom/J87aDt0M47uUf8dlPGxLHp5jv3C5ibfR1v8JVelsoWtpRvE
	L01Y6qc2tu9fwAn3mnxUWwsBav3YIYpChI1HIczg8hwiV7VtO+bGefFoJnhR8xXBswcrRDFDhD+
	plWKmIr4hDuE+QvQ6Xb/62OeOXI5hlii9FCoakmW1gZlOPfUWvno5gwAMV/tokU+csAExjoyKA6
	hd2nSuiW529aTo94tzXCn1Evq7ivGTdECTsikH5jOwQwBDlq3IScnKsyrC1pVNQckCPzADwYkDK
	5wJ5m0nifnqKcbal2shvT4jvQMH2SV6IkqNZq01i7mZ7IXINwD0cxTBcGzxOaflgWKxaSWoGLsd
	jZO25NpRPnRPVoZcFYBfIOB7gpFtrakjkDuZND8=
X-Received: by 2002:a05:701a:ca07:b0:176:a225:e364 with SMTP id a92af1059eb24-199374f3d28mr11671343c88.35.1793038402460;
        Mon, 26 Oct 2026 11:13:22 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee5asm23576455c88.8.2026.10.26.11.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:13:21 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: TJ Adams <tadamsjr@google.com>
Cc: "Christian A . Ehrhardt" <lk@c--e.de>, Christoph Hellwig <hch@lst.de>, 
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260929160813.1599129-1-tadamsjr@google.com>
References: <20260929160813.1599129-1-tadamsjr@google.com>
Subject: Re: [PATCH] block: advance iterator after copy-in for
 SG_DXFER_TO_FROM_DEV
Message-Id: <179303840146.792754.17618533917461283198.b4-ty@b4>
Date: Mon, 26 Oct 2026 12:13:21 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Tue, 29 Sep 2026 09:08:13 -0700, TJ Adams wrote:
> When a passthrough request uses transfer direction SG_DXFER_TO_FROM_DEV,
> bio_copy_user_iov() sets up a temporary iterator iter2 with
> data_source = ITER_SOURCE to copy user data into the bio pages before
> execution.
> 
> bio_copy_from_iter(bio, &iter2) copies the data and advances iter2, but
> the original iter is never advanced. Consequently, iov_iter_count(&i)
> remains non-zero in the caller loop in blk_rq_map_user_iov():
> 
> [...]

Applied, thanks!

[1/1] block: advance iterator after copy-in for SG_DXFER_TO_FROM_DEV
      commit: 82e72ea18d0af724914c31a1f274c1aef452aad0

Best regards,
-- 
Jens Axboe



