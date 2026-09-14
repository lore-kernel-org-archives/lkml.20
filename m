Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548234A0148
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789418519; cv=none; b=Vl+zofKkoaA7G9sL8HiyN6eVAn6lY5PtHunRX01PC1aY96KaXFdyH9tSmTnbJwe/7E6N50hLahJymF0ldJAmC0Vu83DZmJkd6Wvs/d6t2GOYmymkf3vFjZVQ18hpT5FvNTRAWd86g1kC5V/nGo8aWBBa6rqbxRp0wv1ja1/nUqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789418519; c=relaxed/simple;
	bh=7lTv3k07zA7RFFF2IudlduRWQ6nXWPTkRfXfmwqrpmg=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=WGVIqKsuBdYAc1KA+nn0IJVEVPVbkr77RshlM1uFp3X+NO7yGgniWIfrR4rLy2EzMrfRERwd20wZgY/es/ZZ4dWJykH5SWKQLXF2gBKtyMzuQZ1A4h9fFpnecaic+TJGYKMhKhUqBB8w/4yfSaPLTkj5X8F91vaGHZoPk/i7CVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=SEF5ugga; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="SEF5ugga"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93a1118fbb8so220431285a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1789418513; x=1790023313; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=duuPvdB4qaHPpjjbBizZlT/PQ2qkQWx6bSPOOeU9NRQ=;
        b=SEF5uggay4dlMAl2tPfntHb/aTTPGNwMmCpQFP9rIrryHgaD9+ElcAjxeQeSlL0wWB
         FHwUilZr0oeZ0/3tHgRUypLNsyBQxCZqIoE3FyTrv5LigFRVsXrLoA326XyHGSXWq8+9
         bIyqu3Cv0iD0gFra2rJom0neFV65HWZtehniWcLOBV94Z5FM98Ratkge6pgUXbAvSoCF
         Y1D59GV+/EOd5G9Q6YuKZtFg3ft4mAkXeWB5bi7L8k0JQ+F4hwV1xbnBh+JWpKLg0Glj
         0Bf3GJhDJmXL+AjMo/CnNCG5Jif8SlnrCcn+fOQuoKaIZBRwpEfLbL03JljI5vey+N+L
         MM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789418513; x=1790023313;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=duuPvdB4qaHPpjjbBizZlT/PQ2qkQWx6bSPOOeU9NRQ=;
        b=2HWHpipiTCohXAFyDarq06Z42TlYurliyEfKC4QmlCSZVgL3gCPrdjvr6StDjWQ9MT
         0VZplAzG/GHRyYDAa7lUtk1z++pZ5TdL2FX//BLCKxc0nYF5ANulE7WblLHCymy2+EkW
         k3t6YN3x001q8hjCdloQSwcWC/06Irvlkr8eovZheXUGw/hWbkTk8No8JeMHSNOkKA9f
         xU+7CLS+/C5xOdR5amtzVsyXJZpJyd/5VReI9x9GxuTxXysUb5IUvrKO7XY+H39ffPDL
         XfI9biB39LROMtjgI7UCVQ49npEn7hMp7Wv0RocBWWt91MAPFXjTUqgzPRXKKUukvy9E
         mLUQ==
X-Forwarded-Encrypted: i=1; AKwUvByp0l2Jfo2giuH4s9RE+5RQEuzfuY+Q0FlSwlYolhTVBS7sl8PuEBgFtATSBZwDAxPdqg5mgZrAYgtYlM8=@vger.kernel.org
X-Gm-Message-State: AFuF++lm8s9t5zb9H3JzwW3JGfqvDdRk/ppJ9TQJnGnTn0UOMisiPDvt
	7MrIO9xx2uzcyS1ZPmko23iqGoCmgYqn1bfCTTTMDMo+dASAHbYxpSAR+GG32a2Rdw==
X-Gm-Gg: AYBFou2/EmbdlyerqyN29ggfqqvUel+Hn5NkRudOyB13pY0NXMkDNWyDy/i3XwbcGcU
	XAvZT+4Pp8qoEQ0xU3LudV66/Qu4b9upgIvyM6/ZKpniTYfjDCbMC4msncU53h0fsAnFpJRJ1y2
	mQJwDB46VXkuZW7Ezrov0bqSl74n/XX5PrtUXNPXP893tP/oTgueFRsbwOJL7UHhcokoHMfCSgg
	6bZAyTW9Snt0UaOnGdteS/R1UAvIij8Fr39sdde/NjmaoMAuI4BFlN3y7NScZs5Enr5CtndBcFF
	Ab6K1RNvqFbZRc0AN0hrG0gKitmkEfjm3GiALloarlxrW5KI3a4kCztKCD3qhIao2RlgwOZiWvq
	jHxMOhaXa5h9pukELY8KbPwYpySo8MbaLrLKMApyS6ShUSvFe04Cfq509CnIbidu6tPnVnVIsBk
	JhrjLm38Y/RhD+pot2e3PwPDCiszcNixUOZBUSjx1XgtRfmqcz4cPculcCc1cw9Ta4zdiWt6zQS
	kqQ2d07fh+9G0VqEDZne3DIG55rt7iYVUxtGmgCaAwy6Iz4GB1/nxjcX0NgCd9D2xy85KnxomgR
X-Received: by 2002:a05:620a:2707:b0:939:bd4e:b2fe with SMTP id af79cd13be357-93a29a12d15mr593158585a.40.1789418513279;
        Mon, 14 Sep 2026 13:41:53 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939ebda519bsm1046663585a.26.2026.09.14.13.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:41:52 -0700 (PDT)
Date: Mon, 14 Sep 2026 16:41:52 -0400
Message-ID: <506803b6b6c4a74551bc5c0d6e31cf71@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20260914_1619/pstg-lib:20260914_1251/pstg-pwork:20260914_1619
From: Paul Moore <paul@paul-moore.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>, =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>, Jeff Vander Stoep <jeffv@google.com>, Nick Kralevich <nnk@google.com>, Ondrej Mosnacek <omosnace@redhat.com>, "Serge E . Hallyn" <serge@hallyn.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, audit@vger.kernel.org, kernel-team@cloudflare.com, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: Re: [PATCH v1 2/2] selftests/landlock: Check full ioctl commands in  audit records
References: <20260910144837.381855-3-mic@digikod.net>
In-Reply-To: <20260910144837.381855-3-mic@digikod.net>

On Sep 10, 2026 =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net> wrote:
> 
> The ioctl audit test uses FIONREAD, whose command value fits in 16 bits.
> It therefore cannot detect truncation of encoded direction and size
> bits.
> 
> Use an architecture-independent unknown command with set upper bits and
> require its complete value in the audit record.  Landlock rejects the
> command before the device handles it, and the existing ioctl enforcement
> test already exercises the same request.  The new expectation fails with
> ioctlcmd=0xfeee on an unfixed kernel and passes with ioctlcmd=0xc00ffeee
> after the shared audit field is widened.
> 
> Signed-off-by: Mickaël Salaün <mic@digikod.net>
> Reviewed-by: Günther Noack <gnoack@google.com>
> ---
>  tools/testing/selftests/landlock/fs_test.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)

Merged into lsm/dev, thanks.

--
paul-moore.com
