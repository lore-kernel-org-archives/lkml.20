Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792512683;
	b=XxHCxWX654PtpyZjLSgFvK/83AiPWhvl6AjnOKZ3VrC9xrjk/n9sIJqbh68qX8AqnbHC
	 Qbsvm092fuJjElc9BP5F81iEuGgKqwR0uJi0uVKqEVj5hmX9wNoJZ/7Q0BVBhq1N8MlHn
	 36JPYUM/lAmChSkp5Fo+Ty5XYusE1QK+7wZnYf+jMjVDpnYVVn3Z8zLsYHFOKOsDnT/j1
	 5GK7+zqPO6POSAts3qjzD6Yje8SQz9aKrjFju7004HQAOzWrxhPOWyvfb3NaTBsV6DdMJ
	 swQeQ7YTAsi7vPRH/pafXxgUn0NYrX1M4k8KpNRTsuT1ALFE3B2isJdKb56z0bI9gIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792512683;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Message-ID:Subject:In-Reply-To:References:MIME-Version:
	 Date:Content-Type:Content-Transfer-Encoding;
	bh=FdKpeXgyqOVEtVxGXAfcleh4j7jtKB2IC4Gxgl29KOA=;
	b=h0DlXDND+g3hjiiAy7+HIPIdUqoJJxlJMLzlSKrDOWId3EMg7Hems84GnQ1DvjOHBs9W
	 FPQcjqfsQHiDXmii33rOKuZzAntizNtSHozbmdFEnMpTsXQK8u57wF8M/DNYqphOf1Ekv
	 9Nlek07yvdaA+FC1IpK6e6kmiFHhT0c0nINASDEXw70TRBqlkuxWPV94JtQg5dbofHSM2
	 lW5/RPRql7hud0gkdpu8ZTtYI45me8yUiVCa9FFJt10AyGmSDT74YiIkVWU9B/a9J3bjN
	 RpEiAfY8RHDqyB4TGkeztlTkXHgLjbv7chJGojZswvd78CA+HJD2z/MwbIYCNKxbTqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CuoxquBo;
	arc=none smtp.remote-ip=74.125.227.132
Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B532606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B532606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CuoxquBo
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-3ac96ba6a4eso510518a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792512683; x=1793117483; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:date:mime-version:references
         :in-reply-to:subject:message-id:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FdKpeXgyqOVEtVxGXAfcleh4j7jtKB2IC4Gxgl29KOA=;
        b=CuoxquBor9JijeH/KHLFj9U+Vm2XSz4NWdqU/UEtZjgpCp042Q+FKc9oHx5beK6lq1
         F+KUUtXSUbuywmeVZzCi0yNbz5gi8JlNgjS2O0aNWvURzdjmnVuATAaaAwq+6Kjaksml
         AkO1vHHkWEQTN6X3f92YpcaGjf9drKfVY6s4iCtH4vyEzUOpq9nk0T/VfZsIxsibvidE
         YpJA2Ei5PUqfCsQTsh8K309I8M5yEl96bwEX19Q5CvhXsbhaAgukW7JXAEUhOOb63lms
         C0nFzmcoYPivqysdbuEtoTRB4BDOA11gaNA4vkrMtArBxzfJjFOIZsgT3RoMGeo0VMVw
         rjTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792512683; x=1793117483;
        h=content-transfer-encoding:content-type:date:mime-version:references
         :in-reply-to:subject:message-id:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FdKpeXgyqOVEtVxGXAfcleh4j7jtKB2IC4Gxgl29KOA=;
        b=M4o9GosemCCujcVDlPi8MRJTMOClCa5dghTNZmUu0BdYUPaovy9INTMtSYyxQjZFTa
         7EkTodgoweWQGxUw/126/f1lwmkMW/jVEsfBFTFXFLyASJK6H1Bnm0kIFPhV8bHY6Izi
         w93FuhFs0RpxVtstIPBv/z+NcfYC6gN2KyyrQQRhchz9YC98Z9bDslV8nMz+lKAPEiIA
         Nac6yo1ZV5ganvsuVZ/umdKtyQDZlEhwGsG0LwMNdqOM9CvrtmfHMu0eGROVLN9iwVws
         J8BpENis3MSzNEBOzB2JIGJ3P8vAJyQcHlYPFlsxYCnscu8AGCtwMOKlW1/4jXi0m5bO
         RNZg==
X-Forwarded-Encrypted: i=1; AKwUvBza0AAtfPY38UJmR1d30xIv6Ut1VfprGTg5Hvho03HvB3k3aAkv9in1naTtz0YCPj56SWjJHb3lQRBI8cI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNmU74WYetWPv//T6TIzZotOdRF03zn5x3CTkjfhZWcQnxWgEX
	2wdwNFWJHN5cSu9p1WI9H1fAxegZh3tSq8KAvZAUiOxSFkgsboCHKfwG
X-Gm-Gg: AYBFou23UHW9s9QcS4N1ABz6xFxliWmGwgii/CwYusnXfiG7RwPBZM/NxIYOdD5BZwr
	o/jYRkzPDoiK2Q3MnZpN3cc5v5zuOp5EQpOK10jofjWP+WwF6VD2yf9RsokEohoteSO4SRTbFus
	xbYdDb1rrNrKVVx9MpBUOKNQlWvy2l6/a4RRcfw/Fjs7yfsKCACp2SmGa57poknXVl4HzaQB4f6
	0Wh8os1sNrqPgabhMtTi+tLl/hYh1BRAmZzQe1iZ5ZLgf9VEJZayKw9ygGfJ88NfCKZW+L+kP2U
	Vpsg+rGS+cwgLNob6Jl1Wf4pNwMq0VF2vUzCDsyKY+0Tyb7gHcR0n2Qc4++Etvf+7NOcmP2YS6I
	4jZI5XZF+60fNBb+iBdHzTAX4RU5DEVEubx8KjmYwSXDhkipHx9mOnszYQ+YfEmY/EI4KkJ/71N
	g5+LlC+bEk/RK8NfyONHgQ2aHyZN+h36NuwF3sD8Xw9kA6GNeHvcb7jemXdB4zLIeOtEgJUiCHg
	NMS8KzBpyyT67BTjEHHQeZFB4Tw22S/sQ7q2NfH9OWELmNB8Ras7FjWVv8tMQlGG9nx8jn2
X-Received: by 2002:a17:90b:5345:b0:3ab:be66:ddd3 with SMTP id 98e67ed59e1d1-3ad64bd668amr1739707a91.32.1792512682581;
        Tue, 20 Oct 2026 09:11:22 -0700 (PDT)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc9942956sm8903911a91.1.2026.10.20.09.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:11:22 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: SJ Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: stable@vger.kernel.org, damon@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Message-ID: <179251032453.2.9019098760697634552.damon-quota@gmail.com>
Subject:
 Re: [PATCH] mm/damon/core: remove unreachable damos charge_{target,addr}_from
In-Reply-To: <20261020023958.108276-1-sj@kernel.org>
References: <20261020023958.108276-1-sj@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 21 Oct 2026 00:07:00 +0800
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi SJ,

> Catch the corner cases in damos_adjust_quota() and reset the pointers.


The patch looks good to me. I tested DAMON_RECLAIM stop/start after
filling the quota on x86-64 KVM and everything goes well :)

Reviewed-by: Aveline Noir <jm5905938@gmail.com>
Tested-by: Aveline Noir <jm5905938@gmail.com>

Thanks,
Aveline Noir
