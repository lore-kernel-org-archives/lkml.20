Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792683848;
	b=qy8vLb/b7GHY3VUZY6l1/rx7UfHwSgBj70aZhPUR/djEUKD5zjCd6fK1UtM6Bg/Zhoke
	 RjAetOg15q5HmTPNBg23uyi/uwoaqeZG2/0jVUWEbZmhNeBsGk27IPDdTU8GscGsdkHZW
	 0mcN4U6BFvEH+vk4CjCni4e6yAZmlUu6VuwpWfa4a6rIbGQi9W7QfTY/zdr+G2kPutvA2
	 T5NkGn6ru6oVeWmmw/x1JjkawJuYAscYl3ftqeD48VBJj/uomYbJLRCfpKoIfLAjIhkeO
	 lFW/xVN4Z2YqLsuWQW0T/5G2Chx8zaOriIv3l8R9DFKVrxS1yoZTbwrbPpKoJSZUR0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792683848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=doGDFu72fntktSMaYIfbAaZUxiOF1i8vKvNKZvEixJo=;
	b=i+L0NtQ/y8/NOc7c1x2pfCqjwa4ibWVkCuwSM1RgsS4n2zph5DDwfmY6N621QPteVwZV
	 uOF+u1FIS8EvxCUJqi4GeI8XD7YFB+Mhus3PGdTA4ID9lAJNbHUKGpo40DoNrkfWS1rws
	 fV2fFWmHosrChnMaPRLoHS45wwIRzXqL+Dtn/ImlaJYYinW8ORa5sSoYC1XK4LLEi4iPe
	 1lHjIcXhG/MFkjth0Ph7g3jZOViCT+MLNJhAjZrGAlLVFdRhlcPO3lCuiQ5oMS3NBy3S0
	 7JUbNZeZ1Cih/uE4CTzQyY1AhYdlEWjCyPGOGzTjFxzEBxukBhFSHt6JdSdtXbrLdAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pW219Xzh;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D804606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:44:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D804606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pW219Xzh
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so3512511eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792683847; x=1793288647; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=doGDFu72fntktSMaYIfbAaZUxiOF1i8vKvNKZvEixJo=;
        b=pW219Xzh+aEdlSC+vVl0yPy7km0/n8uw8ZrED2cVEbi8joL7ypXHbP9ilLCwvEVy2O
         UB8Ed/asc7hapoCb1pCOhiVJJRrXg72GS6ND8pS0pb1umj6eFTDA9/3gnNziSIzfq+7O
         eQwIsN54ACAWmtTtWgt/iNTtZhbnN3IfxH9YSrKNmmoSU715jqJk8ftoSgYPnISxxfbt
         lU/onYEbn1aVhyW7gGq9/uwQaU2Za4HWKMyD388x7/UUDP003FqS4yBg3WJBKd850BY4
         T8HFws8rpYIS1uofypw6PMTs08POOKfO/7zNkYnGd1dUP/g0jrt1QthNJcfdxDV1mNeJ
         P/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792683847; x=1793288647;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=doGDFu72fntktSMaYIfbAaZUxiOF1i8vKvNKZvEixJo=;
        b=XREkv6B9bGiGGploQ9hswi8c5relNftX2wVXVPTIMIlwDIEkHei8pzaA70fFebg0rO
         sHW3o7KAvlwjX+CHUpAH8U9KCIcQCzbXel+hmwOjBTRpywzBWcoiOwZzJmhtsVZZNRbk
         rF7TVrujfCaqNOKz67K8nTpfY+c+BE7hwxw4sm9y+NoGagvIYAw2maD7A6zGA+1gWJgh
         Mwhz9Bx8XLsaiSqXyIKIe2uEBLyJ3R8PNKwLhuUv5D7Zkv3hl1peaNcKh494bczHngmS
         DZ4o8lj2/GNnRXijmysJy9/N5yz9BbeWmMsEmyOyCM4GIfM1yXqjoo5mbFDBr+YefSkl
         c5aw==
X-Forwarded-Encrypted: i=1; AKwUvBzgT+htLykWxNvV8uDPp/jPxc3Ldvp8QnhPvmJHr3o80uMh3H27UMctpWtK3rM/ddQ/5fe9F6VWTxxnX5I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfOPBo5uyOXl9Rha8kA9Hc2UL1WYtkJ/NqqlIs+NUf7KctCjaz
	DMMsSd+gVPdWigckLPGcVcvo/depgOUL4cWE04wFbI0hz5kkghjNMVKi
X-Gm-Gg: AYBFou1Ks9yJE2ZEk9Z43DKj7RbKWZmk33Ptr4hRjiX6cJojDy5QwABYdb8eHXOs50d
	BnaVsh7NsLnEFMzASrmjrYS9v3ZndVwOsAkhEZfimx2gozPQQIS0GlQfttzy0HogNuDeJg0COXg
	2WbHPmW2+oq7jvr9keZP2Xt/3SDLvTBM9DSrJIlBdLanZY/iaG1WRlijTowsLKp60sC09zzJqRG
	nB2cZzg+tDTun3YqazHWtbr44T6LUJMom747xGPgCM/2n16tOUDythl/xJ4hiijmksVyt0cPFKm
	ir9dgxdRyzCFB2cmKt04bxEnNuLg140IqfFWbTGvaE5uggOp+YNsWlRToNrZaoYA0uEB8eyNsO+
	Hp2204HDt2M6viy2P95/++B+f82PdNqwy8cYlbtt0vZmznmv4ekzeBqQlBBhJ5/r4OlnFBgmrYy
	GTYeqnxXMx2AXPQgAXuI6JTsRWKj6KLOxYstnGN91T7y9wTrTq1spaZ6AhsrZJPiicDqRZNENwJ
	hbrgcFMgDPUEU5tgHdPdFFmYIgnLC0SfjFkA3sDoJHGJKo9EZP3zaeJMokIN0jgizd+a9Uh0o5i
	iKXqowDkMgWjKWAZDqLPSzyV0A==
X-Received: by 2002:a05:693c:8955:20b0:360:58a9:2704 with SMTP id 5a478bee46e88-3674c63d542mr7841871eec.6.1792683847346;
        Thu, 22 Oct 2026 08:44:07 -0700 (PDT)
Received: from [127.0.1.1] (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e153519sm18526695eec.3.2026.10.22.08.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 08:44:06 -0700 (PDT)
Date: Thu, 22 Oct 2026 08:44:06 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Benjamin LaHaise <ben@communityfibre.ca>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-aio@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [BUG] fs/aio: io_setup integer wrap can exhaust global aio quota
In-Reply-To: <20261022152305.GP8374@kvack.org>
References: <20261022091748.3653127-1-teel4res@gmail.com>
 <20261022152305.GP8374@kvack.org>
Message-ID: <179268384018.50580.15623131516982541149@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Ben,

Thanks for the reply. I agree with the security triage: reaching this path
requires root to raise fs.aio-max-nr to an unreasonable value, and I am not
claiming a memory-safety issue, privilege-boundary bypass, or UAF. The impact
is limited to global AIO quota accounting under that configuration.

I do think there is a factual mismatch regarding the execution path described
in your reply. The validation raises fs.aio-max-nr to 2147483649 before
dropping privileges and calling io_setup(0x80000001). In that configuration:

  1. max_reqs retains 0x80000001.
  2. nr_events *= 2 wraps the request to 2.
  3. The wrapped value passes the ring-size check.
  4. aio_setup_ring() creates a one-page, 127-slot ring.
  5. aio_nr += ctx->max_reqs charges the original 0x80000001.
  6. ioctx_add_table() is called and succeeds.
  7. A subsequent normal io_setup(1) fails with -EAGAIN.

So, in this tested path, the ioctx is not destroyed before ioctx_alloc()
returns, and ioctx_add_table() is reached. The ring is small while the global
quota charge is large.

I agree that this is a low-value, configuration-dependent correctness issue,
not a security fix. My point is only that treating the configuration as
unsupported is different from saying the wrapped path is cleaned up before it
can be installed.

I will be more conservative about AI-assisted findings going forward and will
set a higher bar for preconditions, security impact, and whether a patch is
worth maintainer time. If you consider this configuration unsupported, I will
withdraw the patch.

Thanks,
Cheng
