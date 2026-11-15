Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794757376;
	b=sMleCc3E9P/AC5zBDJgtviubhzPGg66Eb/lYKXOtiJONu14N6+lWxrCbgoSK/q/I4Ji5
	 YQuN5OL2EwPOUzsk8wom/jhOq2Fy4J7U2lZ+sLTqatOmAHt6tM3W2zsC3c+pBf4donBTF
	 i7DwKrqkRzyK+AOtvthOQtB+ywROyn99Ik61S9Rb2ju6nSjLvKjzaafoq3R65+JixP4l6
	 XKZlm/9MER8/+45dnQYraJBu3nJB0nAGySl2MjEXUzAh56nfi6eE6zOubxrCCerviwE9T
	 47MuzIJRHhG9fR6H8st6o/EMkWniUvOG+6GXKxvOhZbl2ka47Nroa5rPb7vXnxfK2KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794757376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=DejR3krB2UUOuNcnZkNWRCdn92MbyftYbWjEZOleI5Y=;
	b=Yw9ugsziDiPwowMSMlg88YtSqwCqG3/w11vaVyVAMl6QvPERaC9feTzdPoye/WLt6Tnn
	 l58YAWmKz/50S2D0P8AY9bXfaCn7XKoNNSQMJK6uP4xX2PHORN2Z/4t/ScFaesK8xJr92
	 +7X0myBPUk9u1nZILnUtTFVgWn/Ru3rZW2i/poHr+HaDresa3reNSUnNbI2OSwwk6sY19
	 zhG4v2KqU5ourztSMeD603E4/4i8HCZzNtxJElUPN4hsTBpDqyI+dbGuJCoOnN8v2mgEg
	 8gVVSEqUKpwdSwuPyZJ2L+xrY4OK9+PSq/mrBpb/WbKN1VPbvkh/0n7AmpweR6+IqdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Bqsx4zwI;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE870606A329
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE870606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Bqsx4zwI
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-37f14feca60so267405eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794757375; x=1795362175; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DejR3krB2UUOuNcnZkNWRCdn92MbyftYbWjEZOleI5Y=;
        b=Bqsx4zwIkginSB1+zS+iluuGCfsoh1lrWajyafASq7xICgRjN0kfnmGca15hg2kFDO
         zGLbMdOzRdMez5mqA7M6NRrW/2rPqwFQRH59SPER0s+ejRC3ZatkxI1kQhoF+C2f9eLs
         hTf8xRi9NdWyUvE9Hsl0gNkRYU5b1VXB+zpTf2a9FpwTTIFXT8dO577Krmi6HQs5l0UY
         gdYwSFY6GxIxcxenzWpXUdgNsVAS+GG/SAOH+YwLn4cIH8oMz99cTANdyFo+7A3V/CmP
         bQWbxa+vZv5LF+BswRa7OdGybOcMw2STtXJ0u3oEhiIyM+U9ssnyfUhDjfFk7rrQl9iD
         Z+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794757375; x=1795362175;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DejR3krB2UUOuNcnZkNWRCdn92MbyftYbWjEZOleI5Y=;
        b=J3jzoXHfyQm60XpWRzgnY+9S5UyK2V2nULJI5WUNuegVJGBvvpU5SCQq2MsgFW+vJo
         vIe3sYn6FzrD9QLG7mQvPyqC6j6L08w5zdZH08CTpxvuMnOwgN3ZGDoXfttinK1gpf8Q
         Xt7FIyUANgZbbUCqZGdze7wn659x6YQ10f1I0w8TPLYnn54ct2ah80THnvqbVfqcBePX
         HwsANrM7/UN/YwLFgMS1oCa5ZvUbC2Uf8D34EqgGO9i76LbFTBz7Js6zDFThQq/v7wu4
         ghhG5rJQZw/p+SQ38c0LXwi1Ip/dkKqGV+RGHFhjQejHPUIQZ2JA+KkooIEDnc2DKCzy
         ax+w==
X-Gm-Message-State: APuU4Z8oHmOWQVoi1TJxwnrTCIE4+ZU+bN1QsjXgrKGABvKzy2juZzzj
	SmQWrJa5TIxLcuD2/U9MuexyNjqhfLVY41tAQd7Zv6fbjHTiXZh3hZbrqFHGX7Dde5fM0w39ZW9
	y+VbQJjs=
X-Gm-Gg: AYBFou2k9BNc0XT4EfklecEXrMAHU/1q9pA6sOt80goLC3kQSpzP9/bY7/50VzLDZyb
	M8Av37WuP5p+TTBviFqyC3Wd5JC+D2k02L5ZbgD5flMzFarH/OEKzoYAhM93p7IJywLCeAIJrvJ
	dgH5jr6e4Yn85n0pwul82z4AIbF4zpBqv0zcHPP/fG+pH27X2k0SkJERYZ+8YQZdb6HfYcCKR95
	8q1e7qzO+8CptUdmLmhymxo8W2vJfbP2qjB9zFSmyxDVKA7CuLH2NzRHUFBtSGFWucBm+z2z8up
	+DpRXlJvYyCfJ0aR3VVPKG4N44PzzVmOmwbksTf2IfUtgVvZA8q7zyM1SeBuadx+3D9GysOEjnf
	tNa5YZUvNOBIUp2knnOc9YiTLCbKIX3pgDr1Lv9loqdNbg+mWgdxnZz/GGI6gZ1Km/IjY0FMksf
	FqWfcHWVbxUMfglgPb62G/i4Lflr5aRnWpIRUCmL1t+AnfxCiFXZUrc4MetMuMvdS7moM2eM9M+
	/XOcU9PJnrY1u+axf6fJBem5GJGHRSTxqBCeSiEN7S3srivO4kvqH8m1DR4mbbsQGa2V1yhyyvo
	CGw9fQ2siMP1Z4sGocKR60IlRImw/8I4RzXTSAC0l8Fw+lNYod0s52thzcQhYBW8Hhrky4pVurF
	Mg8qhRmeh1xE0
X-Received: by 2002:a05:693c:69d0:b0:36a:15ee:c20e with SMTP id 5a478bee46e88-379675fd90bmr8136632eec.33.1794757374739;
        Sun, 15 Nov 2026 07:42:54 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379558231eesm25665134eec.12.2026.11.15.07.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 07:42:54 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: tom.leiming@gmail.com, linux-block@vger.kernel.org, 
 shao.mingyin@zte.com.cn
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20261115003352168cE_tyVxSyZV124AM31htL@zte.com.cn>
References: <20261115003352168cE_tyVxSyZV124AM31htL@zte.com.cn>
Subject: Re: [PATCH] ublk: dispatch the next fetch after a batch failure
Message-Id: <179475737404.32615.15503411123776192792.b4-ty@b4>
Date: Sun, 15 Nov 2026 08:42:54 -0700
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


On Sun, 15 Nov 2026 00:33:52 +0800, shao.mingyin@zte.com.cn wrote:
> When a batch fetch fails, for example because its provided-buffer group
> is empty, ublk_batch_dispatch() removes the failed fetch and returns.
> Pending I/O tags stay in evts_fifo even if another fetch with usable
> buffers is already queued. With no new I/O or fetch submission to select
> it, that fetch and the outstanding block requests cannot make progress.
> 
> Claim the next queued fetch under evts_lock before completing and freeing
> the failed one, then schedule its dispatch in the proper task context.
> Marking it active before dropping the lock also prevents cancellation
> from taking it before its task work is queued.
> 
> [...]

Applied, thanks!

[1/1] ublk: dispatch the next fetch after a batch failure
      commit: a6f37fb3f5747bb7cca5cd6630dfeea4435022a1

Best regards,
-- 
Jens Axboe



