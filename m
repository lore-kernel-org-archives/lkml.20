Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793258437;
	b=TZjcLBTOUXln/pwRlYDzc6LAfRMKA2gl0ldrvqcz/u2PjLN+2kg0ZApbO09b6OPcW6h3
	 s9RQvMqpWCto93SY2iHI6vYvKtTthrqouN32Z/wWq6xsttVmpjmIAIvPK72wSF6MEgQaX
	 7sCoKdwEUQuEp+bQB0cjnYOWZqRIJWuAtgv+ShqgB+IDWQzVkzyNk3cmn11eUAWNy7MGy
	 F6yZA8IFyoT+wy3I0BY1HK+B590W9pSKSLvobgSQhdsPPnpPNsc+kJBgIusjnSORRiKLq
	 9LTxrpfVURx6hAnI1vNrngFZgZwnFbITfAASWER0/tIMj/ENqNuLuZbUEDedayuAdBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793258437;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=FTTD/S+UNPlifc6ePjk5iJlNvpEw1FV1wU8LTRfDAVQ=;
	b=fBgT4pvAvWICOx4fDBCJHnJyC6uimFrKPxJhNfNcXVJTxdW4bJ5AanUkhHXX+t9Fxbg3
	 95hwTAMdCV5JsHfX65kAMs0lMl9dzQ35OnpG8+TEToSpuOBa/MdOHx5v2WVaY5NwJWxV5
	 YQpadFJSLgFZTY7I5EjE4ssKnvr6GuGMac9odU/ggtjfGLcdbB82p+qBdgMJodGMvD6T9
	 5mCGUnkjexxeHoUyAu6vF+78zPzD+aOCMjsGf+n2G4o3AYkdLgNLS1VMCSf1ulr7yvXIj
	 UnJjELQ2msBBRIIMWfLIpgZBXT+2MVGX8KvqjCCf3I9sSAQzngoCZkbPA24R7CvLmwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=bKb2acJZ;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433E6606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:20:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 433E6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=bKb2acJZ
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2eb18f4da15so2863975ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793258437; x=1793863237; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FTTD/S+UNPlifc6ePjk5iJlNvpEw1FV1wU8LTRfDAVQ=;
        b=bKb2acJZHwZBJ0Tq2SOyhFwZcSuNugyACDrOSYbL4TkOg7G+d6+QXHYrc4afjFamnB
         RRioAtN7CXFf+dyKN5lImEdZv80w9DXWNMLMoUlsTB6mGSyxm2HN0ZjTB+2BeInlbuUG
         y+FPGQyBu8quNdHU0qdLJqFJQYhKC7tyf0xCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793258437; x=1793863237;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FTTD/S+UNPlifc6ePjk5iJlNvpEw1FV1wU8LTRfDAVQ=;
        b=Qr0Mv8RMHOMK/hUdRprOj6CSnF2gO74lkWqc16N+jfWZWrkLvq6nzei2bNFnmM9172
         Wt9mJtdLTloZj/Tt6vqgEBk6U/H0UJ5v8+0G56IksvnkrB2HULE99Px/QXplsmRWTe0v
         inq5MwwbFpTl/YTw3bY1aqcTiaG2ZT/ivsMhtzkfyDiPpZXOdyEN/G62QKRrWGfroF2c
         mh86qHCmBs+nH1qbFO1I0IRarh8G2/7GCA0ufhtizNHu1yxGceQY7b6xq2hx+FdN2ZwS
         FuQhCeww8n203q2HFYwLM4yx3BeiKOAR29+f7Eu3CKLK9gCfIQIEEwfiAMp3h7NsXEu/
         NWnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXRkFCFktqs+lBP92hykBbH3xwn4vW1y5QdBlCnEE3uwtnl0uJ98w8upZcAAjGwRNfmyMkVHQotE1rvdI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4YodRbVJF4RURnsV9zMTu2JA1fUc3d/D+GMrlFWbepf0joKFi
	e/Z1wgooCig+pvLp32OC2I4T6Rm/Q0tmf+uBdknXPM7jaVxQcln4/+1u66rE6iqF38Y=
X-Gm-Gg: AYBFou0UOLYJZFJMaBztMakrdwEUT0LN0m45xNtfhV7Y1F8nl/NX/rWDbFMFjNLKHEx
	WfopOixCR8aA4H/qONTwbnpvOuB4GYZb1ckvQe/e1E7vfwgOhiVsWDJPumcbD1Zyhjq8r4hztpA
	+9pnnsQmhQTXGAZtkb4+5xYOc8Q9Aak+/qYeWnoeYkmO/5RyXPT5m/qRPAtGGjMUE59FriE7Sce
	i03rIvTxusR4u7Bk7D+K02+gnxbBDMvOxWbG+XAK8nIprVuZqOJxyr6IGUrq2tbu0cDmiPvIvfv
	PnYGoRp+dJcZH1XVKfCghyva+TbFW1GsZz+7S9m+ZT9tcHMjIX9TZBjk2bTjXGF0HTne7Duwsfi
	dPbPMZ5OyT3JVZwPbdVmz1xwWyzBjNXY4ggfE2XG9cp2YejtW8nzdCmBnhMPbrIXxp5aLhIge2u
	Mz/WTWlXzmtvKEWT1Jd2QfgHIqctZOTgs9lkUsk75H3qAKgKTsiS33TcQ3WO1xWrcCSgQjgbgw1
	1csp07Ytl6Rog62bdEjyzCVWOVTNJKvVXyeRZiby8bF7Ur5ntrOYKX9I1QYl5siDZGwwCikwhwA
	6c6Hh/WzAlntdcQAiBnH/vz9oRbK5EWIP9neGS4RWChIfUW5xESHMxr2eNgUPIQ1w5SGednOGgh
	e8KNZbGLBjGJxztsWssSvHCHPF2WT7SbHUEWk25m1lVJ3/4bSltQ8jlp+5cFpckhGXPnqq1+v
X-Received: by 2002:a17:903:2311:b0:2e9:ca71:45f4 with SMTP id d9443c01a7336-2eb0042c50amr37191315ad.33.1793258436686;
        Thu, 29 Oct 2026 00:20:36 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b774acsm29333125ad.22.2026.10.29.00.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:20:36 -0700 (PDT)
Date: Thu, 29 Oct 2026 15:20:31 +0800
From: Chris Down <chris@chrisdown.name>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 16/16] printk: Try enable preferred consoles only when
 there are any
Message-ID: <auLzv9oFYmYTlRle@chrisdown.name>
References: <20260929120546.328616-1-pmladek@suse.com>
 <20260929120546.328616-17-pmladek@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929120546.328616-17-pmladek@suse.com>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Thanks!

Acked-by: Chris Down <chris@chrisdown.name>
