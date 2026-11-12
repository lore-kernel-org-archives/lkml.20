Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794524682;
	b=JuGHL/EczoITd03FUYIfMNPXKd+E042ovU6gVxBE2COCVtf1kgsYcFq5yi9jqZG+jTVu
	 vtOQJCxFf+KGeqVR2Ki12bKhmUisGK35K9e4Hgjts6XVmiv9a3Lrobv2cvWYaDsscvrho
	 VFs++PtAVLAUVLDwDF6DB7JXxiQfE+j8p8sr/wyXCyOY0v9cGFWqTNuS56LuUY35rAAeA
	 xhE4PbsbZl2KHaxENDmzB6zhn42RjMDOAHGHqbjOd6PxpQSMPea99SHyHQKBQ69drWAbG
	 1EbLRa9/cYve0mJ1TghKm8GbMcAMMmCQ7LbEOdCieZPyMnFggGKfEzeOkgf6W9upB1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794524682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=f+UcsNuMg4Yueaqy8xslzDAXYJR5HIy/+gngqmLcoZw=;
	b=vNptRlVmOZSkz4PzHgQxlsmkBvr5EsCUjYr91KAHcGsovpx+2Y9YuH/FrbqB4aeTfwi6
	 xkdEUqbsB8i//WHoXMBjwKh221vN1lrOnAS5aATFGROVCWYJePGnGpZ2X8W5nzav7ELYT
	 +R/ZuubE3gIG0yTT5H5Jr1reA3LMETUmz3emLHY7mkWhjw9L4c4N80dimfvcLz2Y5sMA2
	 jYUd4V+nV1rJZrxuQHRewnmSzvX5bG+2k3hKPAF0MBQFOSkHh0tppVdIkxyMXRuUHk+D6
	 5ujgKZoacSuwtr9VdtAuh2TCp9DlTUvuB+8sb421VfsKPNXFrE1tww+XNjtPvtnsghw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=DzqJjArN;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D30A606A880
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:04:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D30A606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=DzqJjArN
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a214af2076so2192235e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794524681; x=1795129481; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f+UcsNuMg4Yueaqy8xslzDAXYJR5HIy/+gngqmLcoZw=;
        b=DzqJjArNYGAIl6zdpt1MVlcVMAEg3i9Bv3igbA7SLQpdqnWFXwXBIDoQmHcOaUQOI5
         564kWKL8biyZ8H5a0RJMzUAhoCEe+QwyXKnkBTwV27p6z2IhtXINSncQL3faneIi4/Sb
         BE2XXkUX4erjZ6Y/gbInxffZHcTwtXemwmio8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524681; x=1795129481;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f+UcsNuMg4Yueaqy8xslzDAXYJR5HIy/+gngqmLcoZw=;
        b=AxDzHL397A79dUPAb0pM2HwyOK+8gg0rFIxREKRzj3EuDfeI1Z9ZD4T7rOodpbF75P
         +/ro1n3EYctBar/rFGsS6s4pEr7DJ7z9SKAiYSLoUTdzve4HDBwnB/alJnXnbLmgavBl
         Eoeu7E75H0CIEOfE02uH0sKA0adbxH4OobUaPyKcjeSrjdubqEYrh6GyAmVjNfPZRDdy
         gLXmlWhn5+aJeW2kkqoFulNiJqmL1EJWIQOuqPcQL2Edy8M525fOEHV4P0ImngI21eCG
         M3Ah3v4tijUHicdc3KCNxMGMMvevRho01vk0rvRYkYkqzkF6lfMSrOcSuhh6yndRALZL
         STrw==
X-Forwarded-Encrypted: i=1; AL+hErFBKBqq09QDuvBxTtr3oHbkwBpv84EH9mvvJ57q5u1A7M4qzH23dP6iy/u+F75b7k103r0GBMivjT2w950=@vger.kernel.org
X-Gm-Message-State: APuU4Z/h/OnzyuGXvjfeoSNVeVL5HHg+bMS071nm51WnUfIaDmxQXTi4
	0PLXYAQkRn3RobL3HlK4de0w6Q7mc1omxkJ1SgpCVjGjAjuWtR5/s9M6ylq9tAEYhkw=
X-Gm-Gg: AYBFou1hMaVZvOfi2IKYjzJVe8CbV/JNYrBwSyDA0dXaAGS7hrNgXyRPNoMi05sWPQA
	cTWxRugigdIua5/vdy+jUMxxkeQlctwPBUYV02VoDtsmVAeK/62rKRVxp3EfQq0bryt4cIjNHWo
	2+RTocI70b2SMmGpyfyf3llochnGGZiJQy5s4A4LOLcEVco8jogKAlTXQULESSrdZmAJV2hI/4K
	jxgd/UklBffcfe6kPk8rczmHHx+crQ3n1cA+XeheZjJGmQgnKHC3kjmksw0fNCXUNrKiawvS+Ss
	av/pyXe9ZIf8h/BkHlWbNjizlDsLH6k7FRSimKKFaY74sO6k2So2hCmfrlyiLphfXhQP7LZDOVj
	izMb3ggcMAL3Fw9l/rBXFNhlULv3hxFnqjwZclyatINFZ3AXrQuiXsvTxSHA2rPwrcMeY0kw/Gi
	9OSEXskRHvfwHewKEXQXrrWXKjDebL822MYu9fFRP179JLgQKj+yLBrkmNG4Nt1vKsmFz2bzAvT
	1saHN1SqXHs0JaiwU2gHfHdJyoyFF48bfhzuA+1FYeQeNznT0qoW0raqjZiezd3345aFyIjAL4L
	AAEuUnPK/GhCNf6FJwJcRQkOeE5rPSuqFOWAD9Cefbzti05ts1E77ZxraDKyrZJHfLTkbGvsoAp
	RKDL7rcXNHOVLkZX9BRBdHvMRTmX3+OR9M/ne6kK2c566CWXkqHkRXiLL9BF7RcVdsXqegpcOAy
	Iey2P1cG4ZNYEl0f8rWtiZzeUwuMnXX7QrAvVd6ldrgxzxc7LQp+pof0DJjQ==
X-Received: by 2002:a05:600c:c84:b0:4a1:e57b:667c with SMTP id 5b1f17b1804b1-4bb55a68429mr14978415e9.26.1794524680651;
        Thu, 12 Nov 2026 15:04:40 -0800 (PST)
Received: from [172.18.0.2] ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608d10b2sm2213849f8f.44.2026.11.12.15.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 15:04:40 -0800 (PST)
Date: Thu, 12 Nov 2026 15:04:35 -0800
From: Chris Down <chris@chrisdown.name>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Marcos Paulo de Souza <mpdesouza@suse.com>, Naveen Kumar Chaudhary <naveen.osdev@gmail.com>, printk@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 06/17] printk: Prefer the console either via name or devname exclusively
In-Reply-To: <20261111154816.71103-7-pmladek@suse.com>
References: <20261111154816.71103-1-pmladek@suse.com> <20261111154816.71103-7-pmladek@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261112150435.fede0e5e012fb9c6@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Reviewed-by: Chris Down <chris@chrisdown.name>
