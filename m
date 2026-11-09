Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239157;
	b=Jn2u9zLdMTXPTYT7l0sAkkmtUf/49XMeAZLljxCQXgtWvrN33xupBl0X39rCnwbVEiKc
	 yQ0YiYAkZ3WWLsO674hfsZoTFJM2lUqMm26ARMCsp09gVmqk1EfAEPrumONkbG5C1oY/D
	 kxE5QLKZAzAKo1g3bNIoqctL5/DfKeJKYeaEqu+F6MIfowXR3/mjg3FtR+b6Q2urlVSi+
	 cjYRYk6YNLwuwLJFE723x7DH1XSvrEyGnUzOMPYjl95FK70EB2M2vf82GQgfgrtASe3Sd
	 cxdSO3tNeAtPBQ4g3kNkQFY0SveYFFSB/cqtn2239Ve8eqDWfmEgQy73Ng6DJypl6Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=6LYtK+tbTD2I98lblh8z72sGlAc9Xb6Dd1FXdrWY3z8=;
	b=szHD4D+mP5Yn4vbtNBv7Gj28ctvxWAQBimNINP8OzIVF+AF4Ey+UtSmVcsLXrK3fTPr3
	 lr4T0rRTPyRsT5PsnEsZIJzMv+gAOQK6W3dQ9ffqM4QA/Rh5EBsTAJd7Rxhth2hK8gFJN
	 c13a2CP47FH64dBIUGF5PwVOLXu53PLoKW9V97KKo/bTNXGidkR4qF4dtZ+5WZMaSyoVl
	 /pF6HKLkP+8n4Shqhr0+9J5nSd4l++H4RURsai52gL4CzB8oWfrpYtjO5yn8gOBSNE/d4
	 WRw6rdJmP/hA2oNw60vqlCafnZxUs8ekkjDQOlVuH6Fv/2DQaTsth2bW9lP8rbaCVyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IS0pGvnj;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34648606EEB9
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:45:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34648606EEB9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IS0pGvnj
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so9325945e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794239156; x=1794843956; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6LYtK+tbTD2I98lblh8z72sGlAc9Xb6Dd1FXdrWY3z8=;
        b=IS0pGvnjEz37wBiXQOYf3x0I2gJ4jbH5++Z+bigFH8M5+TA1apPL7XOFUnkMsCQwgj
         J2qfzClny9+VUCYmOQPUhWxjpOgDkeg0yyCUjmjfociANFiVvb1C/F69PMBboH387fgt
         KNKB/KwKQykquYHCx5kghGSMVuKiwKOc1eCTjXbwLrVH5366g5JLo59gWpUjPPz4Wwla
         +CAyYZ1KxHBgjmMoKfPwo5c4CU6MbMv96GhY5zQqNKWStLHBGKVY9pemH3VL3n9R6/D8
         3BvwEw1ZHN1RsKd3Vj7VRHVTjvLUYastXNs3Dt4FJBYSLi/JFXpsUKNjcqz71Jgrs38n
         9utA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239156; x=1794843956;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6LYtK+tbTD2I98lblh8z72sGlAc9Xb6Dd1FXdrWY3z8=;
        b=ngKKQX5uxNyCXlTSHRAcgfPB5Dzf5s3jPDP3GRzGX9/5A1XEkMFkn308JYdIqa7LWC
         ES8uIVemUvDdXiojvF/xWJ1Hk+QV33yTddCpL6S2v0HseAd5ijjr3xC+fc7RSSF5zs4U
         TlUNIXF4Q+2ZqFsupmj73PGJ5puCSpP8hXBbl6Kjsa+3sb2NIGY0UIOT1WwwSFOMwfjg
         IB5HOnE5MdifUR39WJDIg0uL1W6VzCL7RW6NkJxX+Z9iqMQO0ZgTJi7ycrD3FC5IIxX8
         G2dFDi0JTGrKDfGf5qwERCGWvo4VQW2KpsVZzcFnjwW1zJ9joCA1Fr+dnWWVu1TkiafF
         ILgA==
X-Forwarded-Encrypted: i=1; AL+hErGm1LA736HCl09cQtU0aMnxVR5Fe+3B+VUv1P+z07y9SnP8CZfzfUHpw9v7nK6JUSKVoGWhU3gOEj9myXY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MZFL5NA530DgN0+camRHJpf0aIlSlBGS4O69vSJFSvhq8OnU9
	2pAxXYA+VixLC4mEQbrOQFicMklGI+uLAe+cgQHnk+vO7UnVFJiT3qXAX/j5SgBGHOM=
X-Gm-Gg: AYBFou3237qc1BDL/wX/ZlmX5JMRvPQgYxLxBkUMfhY1sw+QQdsNZ43VRsADi7twrlB
	O+cduhMi181ej+JY5MUqBN6MzgMJ3aMV2RHtFc/ZzMbVDXrB/AUlGS9Wg+4Rf/Jnr5vOc4cx232
	6Q1MdNkAIMHDUglXy+h6ZIwFacdI7L9fPFDMaeU1U4G/IsWRai5tiTS7LY06fCNH7A3uRdo6gFz
	tKQl+2nYfvZ+YNEUWgjBaxpRXzf2YD7KWN57a/45LuLoK+on/d8zF9UWMurTu2UpPFU4owWACaq
	Eg76rjY8lAsZvB3dC6nJlfQU3T2C0pepHwI4jT/jKrCiulAHJob5+gNzjmxZ6Yy1OLFiIkQV6VS
	saoAuhl518vhx+fIPhtleuE7fqu/Di+gvtvt1u4dOsMDkWgqfOxAjS/D1rrQulJBOO5NRfpTIHx
	ZfOyn+tnttrahaQuGrtg3e9OXfWUo/9iKOZnaOdtfavnbpkV2HoGQsCWW9wwF7cQ5em5bT8Gu06
	B/WwpGPHP9/FuPvvrKU2+TYup9UNb0PIUCanwyfh3WUHMlGmp099ciEiYp6/58gDDFYqe1eOxlF
	r0LCjb42LIaP1CCfTUDGKgwefwECCA==
X-Received: by 2002:a05:600d:82ea:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4b943f76d81mr99129045e9.0.1794239155647;
        Mon, 09 Nov 2026 07:45:55 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7d54d6f93sm397296675e9.0.2026.11.09.07.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:45:49 -0800 (PST)
Date: Mon, 9 Nov 2026 16:45:46 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	printk@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 00/16] printk: Clean up preferred console handling
Message-ID: <avHqqoJO8C15LkpG@pathway.suse.cz>
References: <20261106171952.207909-1-pmladek@suse.com>
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
In-Reply-To: <20261106171952.207909-1-pmladek@suse.com>

On Fri 2026-11-06 18:19:36, Petr Mladek wrote:
> Hi,
> 
> this patchset does some clean up of the code for handling preferred
> consoles in the console registration code.
> 
> It is a prerequisite some more patchsets, namely:
> 
>   + for Marcos' clean up of CON_ENABLE
>     flag handling. It should prevent regressions caused by the
>     hidden effects of try_enable_preferred_console(), for example,
>     see https://lore.kernel.org/r/89409a0f48e6998ff6dd2245691b9954f0e1e435.camel@suse.com
> 
>   + for Chris' per-console log-level, see
>     https://lore.kernel.org/r/cover.1764272407.git.chris@chrisdown.name
> 
> and maybe even some more.

Heh, Sashiko AI makes things interesting. It found some real problems
which I just commented.

I have the fixes mostly ready. I wonder whether you would prefer that
I send v7 or you have already started review of v6.

I do not have strong opinion. The changes are rather simple. But the
code is not trivial so that even small changes have surprising effects.

Best Regards,
Petr
