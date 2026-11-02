Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638240;
	b=Siwz/1vxnoDAWgUlK9nM08S4IWllnJ9duYIG7iyucxF106hFxSAWiUI0A0Ehb2LicGom
	 AzylAQ3NLZL6Lb57AtBBApEZQFWcFqG+W9muga/yVbINAkKf+Id93nS4jzP+2K4qryvZB
	 U6lSXjdgFkqVZoe4JC6x6/hECQsirLMwShV2PFe+vS/l5dPecpNre9VISe4I2LjewOq0f
	 tamwrFpV4TPs+V+JNoH/RQu0g+mGv8mRNXakCLM92Wd95b2uqZjKZoj0/o8+FsJapJnw8
	 Vn7jGY8UjHAIj4AqlLcVa58GslmYLWsXGuuVkY5+F52rzFIQL5vtmYDidryxeIaZwwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=I+MJWuTHvHgN/FhY5omphd4Ba1tdxtV5zHdjWOwg5V0=;
	b=cM0M+GmS241U8uEVrE/GlAOLCIMntTIp9IZEs0qCru3CySJN9bMl/Muo+T7DkR29im//
	 Wzrkzr/L8mXZSvFFopE9SE24wliD8VwqecteHnUWnOPA72qx3MFRfXvLJj+mQKK1T1aGQ
	 rc6LlZkpAr97B2uB4ulUL4aizaKXniEdwqxTOx4V0rT/cYNLm0rkuqMzIXXcvFFitl4OQ
	 3sfDe3mkZnufE0wXIVZ9tLBxQiw88ge9WQNuwWC/JdehsaDUgjl3OnlhLBIbYwrPqhUq0
	 8j1yuRW1AMXgv8buQCMQNSpoGZfH4QhkbMXTGlNB+0PzbnCnxg96ee73AwoBNo5gV2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bS16b14r;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27E36076FA0
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C27E36076FA0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bS16b14r
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso1488394a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793638239; x=1794243039; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I+MJWuTHvHgN/FhY5omphd4Ba1tdxtV5zHdjWOwg5V0=;
        b=bS16b14rPOrL3wo4ue5Txv+qnV3i3hmCoMiwjUFcZ2NO+0DnPvtzWW4UzXlRcRDmED
         8lghrxfcDBb/NrgVeaPkPP1AMRPtPXwrMCqbr7q1u02svA+63NbtsPLtZX6YsFyMlxba
         LjmHqJnMdbwsoPeLBe0PgE1EE779Fx7MslOYPUxveDssom+iac/04doEZuQmrlrb0+w6
         nI5Arqpu3To6Pq7TUFHDlMe1+k/YUumGYmRgLvI8M8orbsAMeNRrIvyRXUYYuHT3FLuu
         s4/65OwiQ6Q+KBGInUl7DEEJofV2FMe8Tc0iEFliJ5Y+JTHyL3RTfcFqHzYdZcS+jAE4
         Ix7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638239; x=1794243039;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I+MJWuTHvHgN/FhY5omphd4Ba1tdxtV5zHdjWOwg5V0=;
        b=pwF+YxUEHybjQ1KXG8X5zL+Ooq5w5elNFLkcxgeB4X1yQ8WF4gFsDZ5LkTmLvO4cjk
         74VrCrnX27S+uav/h8OMklNPTG6l9L///qQeKD9Nhp0GJZySC7fHKxK9mIsYdTLkNU5n
         s87Yv9o/jICj1GArO4aH+F7uxM2RPRYPcnWJw4AfQYR2n2h4fZwXMOQTJ42xqrzEibmI
         L+3+KyEeezqpovB7k+VDqh/qIWVFh7HAY2owcLLqpHilBLhomISGNEIbijLfDMdZKT+C
         jUNDHEZsYJuWnMyqQhfOaZjhtuKQf99Ys0oFQVj5JTq7yWAOfPWUCDvrYw1qADnHJbDh
         Tqgg==
X-Forwarded-Encrypted: i=1; AKwUvByFUCuay1t+5Tb3Fy4DYOSi+VC3I0ujT5kfiWXYl8In36iZp3GfIhjd0H+0MVLRRgdVQ9gBdcsCUNTyo7A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+l5T5UFa6XArNpl+qX6FSXWMpcaOWu1Iyd7Zew+XxfkqL5UxFP
	5Vy3NfPFx0Zl3Wk4nah4cDEWMKywz8hPYyzeySLClwllceNwW5TiIc2W
X-Gm-Gg: AYBFou3U5jmGGQVaE4r3dv/YoUUDR4l3yYGyVrp+Wdb2RqEyR8j9cF+KSQ8aX9oVmGw
	5UkE7oEXyc/uNbSwyzz+8ldhHZyUXqw6PsD4XRfg2hPbgdjbLEncI48yJZPslAqSWnjzWpVuTgq
	i0go0pN1whHB5QSHbEjN6rLY8RLbvJmSTmSHL1mrKosOBP7I/tIFQOaqSmxd64QbwvQlMNoquXY
	nuBxlHtMh3vF0OhZlUlhbXuixTlhvVUAwxZ1ugr4JhClA/x2mh3RmRp7fprEz89A3vlUzE4d0J0
	/m4Plub7MlspfCbfNF8HDWHocomFJmin/zfK+UBLpx/8WaEnvZCWxm+HnKxQ2WjYo6Vw1f007b+
	C/aiWQ2K4l/jEpU5qEqXyODrwsvB+7M/4lPXYLcrCc3Xwz1y6XyYDzRJ6NL3Vj6S8kvMeyPOJRr
	e3pO3eZSZdzaweglJRNAfddMvtTf0ZcGYgb8KzGw1poRe4ez56rkh5Va9+rdtntYp5sRvX1Hv6v
	RDwQQIyBbaObUsklU23KfT2+wL+zK5EtzON4ykjMnZP5uc5thGiKpVaD+ZJEAf4MGmOHAVscLio
	j03ylmkcbU83HzSZ0S1Oq9/tE7uYEDtvBTL4cJojQYBMDSQcTn05lVxo1lwiL6UUJWnR5XYOf9R
	n8yEc63obbaIwP0ZG+l3nlF6HgawMd4Pvxw==
X-Received: by 2002:a17:90b:2d90:b0:3ac:9e76:aa9b with SMTP id 98e67ed59e1d1-3ae8957cca9mr8105797a91.7.1793638238825;
        Mon, 02 Nov 2026 08:50:38 -0800 (PST)
Received: from localhost ([153.61.198.255])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae84542a13sm14956309a91.5.2026.11.02.08.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 08:50:37 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 16:50:37 +0000
Message-Id: <DMKVOUX2GDZN.2Y8MKLR367NU8@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Jonathan Corbet" <corbet@lwn.net>
Cc: "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Shuah Khan" <skhan@linuxfoundation.org>, "Randy
 Dunlap" <rdunlap@infradead.org>, <bpf@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next] bpf: Use "new" URL to show if net-next is open
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <20261102111509.357269-2-u.kleine-koenig@baylibre.com>
References: <20261102111509.357269-2-u.kleine-koenig@baylibre.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, Nov 02, 2026 at 03:15 AM Uwe Kleine-König <u.kleine-koenig@baylibre.com> wrote:
>  For non-subscribers to kernel mailing lists, there is also a status
>  page run by David S. Miller on net-next that provides guidance:
>
> -  http://vger.kernel.org/~davem/net-next.html
> +  https://netdev.bots.linux.dev/net-next.html

The link is not the only stale part. The whole paragraph is wrong.
We apply patches during the merge window too.

diff --git a/Documentation/bpf/bpf_devel_QA.rst b/Documentation/bpf/bpf_devel_QA.rst
index 4729efd..f6b9533 100644
--- a/Documentation/bpf/bpf_devel_QA.rst
+++ b/Documentation/bpf/bpf_devel_QA.rst
@@ -231,19 +231,9 @@ load or urgency.

 Q: Are patches applied to bpf-next when the merge window is open?
 -----------------------------------------------------------------
-A: For the time when the merge window is open, bpf-next will not be
-processed. This is roughly analogous to net-next patch processing,
-so feel free to read up on the netdev docs at
-Documentation/process/maintainer-netdev.rst about further details.
-
-During those two weeks of merge window, we might ask you to resend
-your patch series once bpf-next is open again. Once Linus released
-a ``v*-rc1`` after the merge window, we continue processing of bpf-next.
-
-For non-subscribers to kernel mailing lists, there is also a status
-page run by David S. Miller on net-next that provides guidance:
-
-  http://vger.kernel.org/~davem/net-next.html
+A: Yes.

pw-bot: cr
