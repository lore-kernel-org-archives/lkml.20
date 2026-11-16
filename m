Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794837903;
	b=bvaGMnOw6cWcdjfA+37FLz1amIiA02RZAsMV/XSRcwkV/vvkkhB9OuM9liMGIpJT/7ml
	 CQQ8LyWXkZoslcFtr+tZzc/Qe6eYMa2ZhFSKIXIa1dGc422aUosFkZUfJtCJemzuEhj+B
	 PyrrUtgqFybVjYTNKh7UWZ40MCoh+SJPwoQj+/raQqrhTaxPbgv6PISSZtwvSahNKQhMM
	 x3dYJQLoO40P/mqnrKjjjR5cC9XncIh8PSFsdKWGu6pg87iQg1c+q9HwHFz60sFCQKlU+
	 +4ZIULSg/RCoO3NGeGU82g/f6KAPHh9EA6LISa8JBrTbLfB48J249GmabxOKMEixCZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837903;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=IiIU9t/pme/D3WoLNwnnikBF+jtcauKxTw3ofmYpCiU=;
	b=zZSLrSCBB/OZavTWrHlnP12fFipzeNQlmpO7BYoH1ZF3wBapw8WDrdOU54QYQs+peLXC
	 mLSZa9EMdMyqF0tBRAYSheKlNZZPEbprN+vlDvvFNuGYSmXzPj3Md00x44VOZdVY+knbT
	 7dtyPL3xK9paigbYIbJmEajtgukI4Uf1nO0j/Yc0mVH726Ha3f4O4q0WAffwy1qrRRcIY
	 B3OUZ6Yuzt+mxV6qKOL47lk6RXyJlWBvU1avqAfR7h5Al3YznUiqITlG0WpWHjxoQSc1I
	 lmauN67AVJO46n7SU+7HhU3IIC32bNSN6XjMWHL9uKFlnHcIrZPB7ctv/akoo6XN/bg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b="RDRD/OcL";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6101F606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6101F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=RDRD/OcL
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-86103aaac12so2929772a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:05:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794837902; cv=none;
        d=google.com; s=arc-20260327;
        b=QPVLG8M30dAgH9LJPZ8oOkQNHG5lnHTOV9CX+B+/AK4jujhNhTzIEVOq3yiTjBGFI7
         OnxSe4hKcCSDaMYGin+kBqm+z6D4dJByu4OjHutpw7mdF7wlxZLcaYotddmIdFKHonay
         PhSxa+3KX5892xBXxb7mjDLCz1qrNAmwklPiDzxApOCVoROu1nY0tvxhn4j0Z3hu5Trf
         oNNQDzxxWwZMKnRgqnpa/WOUblVrXshnIViIgmiTY4lDRvSWbztx/H1jeC2Wf0PeUo5q
         eofenvDb4/VNF/FGsjm1bRXlTWi9dJo/ilg1zuJ6CIvLs1wxpJlSNO3UKPhHht4dBvy2
         gMBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IiIU9t/pme/D3WoLNwnnikBF+jtcauKxTw3ofmYpCiU=;
        fh=Bvh9HimtznSLJcp/4aV7JXkF+Nyl+gFWZx3rLtTPLP0=;
        b=nijc49r2rPj03xSDh8DvlB6B5Ya3xWX4bKRVXc1JvuDzskREHflKet1gu0jwwrFba8
         yHn4s9jzBcoeNRDRZ91R2mzGv0TFXNG8zcqkmYTWlLpNfnNGKpcXnEaSPhOonm5tCPD+
         TFbOTbnhNQqdvFxaQ/lqMb6HDRHXLEgp4Tdv/1mEneGCBq9XCmaUWJJ69tHFm0KRt86l
         Iv8xtCwfF0fmJdwzrWEtFX0rs6UkqOXN88HPkm5xCeJ2E8qJKLOiGfOjNz2lXwLyiAJI
         ZHCGjS74ZGZXm+qX5I0WBl9tm2UVGd3THUg+Jig/5brRfBEPptQKEX+8qOppqXdheaDM
         mvyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794837902; x=1795442702; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IiIU9t/pme/D3WoLNwnnikBF+jtcauKxTw3ofmYpCiU=;
        b=RDRD/OcLdIq6BBPMomGGzPawAcj++fY9/uI9T/1dA72dsAu8agY8Cu6695ALuLwM0n
         8y09N3w3OnPRYtLA+0e+4U9RcOnky1LhgUOxXzhjjfWtcgZu2/11KvN+/ArJuO0D3/uL
         AyPFayZijP6GzDPeUrJPAizS+wLTSC4SmUVsvfBY1Ile6aaQ9CPg/kv99IdzqKSiLgcp
         KkL/sqlkUbnuggAYKTgRgmfPG3aEwE4AOQ8e2We0/RHTjfPWdEnjmhtf16f6MefhQPs8
         wjXI5xul/QtA/M+DzPqpAjwMvOpyB7m+LDtVfZ6yuRFcXnnU7LE7HpmL5egmcfFarZcf
         uaBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794837902; x=1795442702;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IiIU9t/pme/D3WoLNwnnikBF+jtcauKxTw3ofmYpCiU=;
        b=C+FrrHJrai4tl3C88+JdY1dVc0htfq/4Y55tVPtHkCe8/nFpi3n/kzzVWHykkNlyt6
         dV3J7infCYlH3YCq4pe7eP3CaJ59tlR7O+4iTgmbLsyZHs+VUBjl64RP5ODZc8CSFtic
         b4Z8m3fFXKNdfliGh/X2OCYDeqsVlbG/3bH6BK/rS+oA+z2BTXAmL6fXxfFbWpgB//+c
         e6BI5Q7od6gAzBZUe4JOZx1rs68hZN9PIL/EkplR8aMknIS+ynMhcTbzDg1O6KqY6cnH
         JjSHhcMWocm9P2R/HMtEy83IW0IGuBwmRlrIQHgzQGvRId2KUSOeWjaBdMbc5ArC3p3Y
         ixKA==
X-Forwarded-Encrypted: i=1; AL+hErFcCAxKHQQJ7JdBg5yqcQax6BqA7w5BRDt+dvoWIOMt9z2kKUYZH6vC71fULjwQlfeO+3f2eM7apjvsf8E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+f/bB7eTPnDVb6tQV/QtRBaDHMzx4XPNNV+jAkyTu+4t7CX10C
	Wq7YPTDbaz1oFVAN135mOwgwCC3OZcKQKqc5FiA2OB1UXJujlSIv5FjIqLxKMSgEVQW+XHE3fph
	k+lAHLyLnmmUnyuLggppE4UUKiRCpAOTyFpcJJgy8/Q==
X-Gm-Gg: AYBFou3z2Q0iE2PFkhMSXdDcsKstPDHI/dgmmuTPfsfwYkfvYe8i/eHptxh80xqBCvG
	ImS3vckFCW8cIMtIGzZBGF4igrKqaveZ26IkbFobXL7gKJFZ9VyekGR9w/z7XC3fWEqWOy7MGkl
	CF3ZEyuuJNrYE1fdDLDo45Z8pUI6u/YolfvDjT/Xb6NR3CqNGbvZ9k4fgutknIg0lqHgQj7QnZM
	Y15ZoeKwln574K7eQvhI4beIkOgIeVap0naMNDNmVdU+WKHGu9g+wVvDZemXStXopu3afltndd3
	0GeL/GPo76TOFKAu/QT6gSiFKFMSXyhkXZUGskPbP3AYrKc7bI1B1wn5EP7w8kKe/ASLlYkaKbV
	lZ/KYQ5FCM1Vob+hF/iDcLXp6ZrFLgrR4T6wsbH06zDqU/BdyUfDQ4SkGKA/NGqCsrKS+OIBSwq
	zLh6/lIncx1EvGqHSkzFKPwT/bh0BbbQU=
X-Received: by 2002:a05:6820:7093:10b0:71a:ea6a:4f51 with SMTP id
 006d021491bc7-71aea6a5809mr1437630eaf.14.1794837902102; Mon, 16 Nov 2026
 06:05:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAG4wq-cd01i7YrcFPmma=BXUcwn_PK=wneKW=vyEBYzQ3Bn7QA@mail.gmail.com>
 <20261116084107.6675-1-emmaonana18@gmail.com> <20261116084107.6675-3-emmaonana18@gmail.com>
In-Reply-To: <20261116084107.6675-3-emmaonana18@gmail.com>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Mon, 16 Nov 2026 14:04:50 +0000
X-Gm-Features: Aa3M54qRdeOnU1gJ7x3s56OW-hJCPdbvkrK8BlxFfQsIh19-OFAy7vmiVdSA8Lw
Message-ID: <CAG4wq-d_30-B4wQZu48ZQXAORM4QxRqPfmYsmoHS0hiYp1EtTA@mail.gmail.com>
Subject: Re: [PATCH net v3 2/2] selftests: net: veth: propagate bad-settings
 check failures to exit status
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 09:41:07 +0100 Omokefe Emmanuel Onanaroghene wrote:
> -             echo "fail - set operation successful ?!?" || echo " ok "
> +             { echo "fail - set operation successful ?!?"; ret=1; } || echo " ok "

Two small suggestions:

1. These lines are 85 columns wide, over the 80-column limit.
2. The style is inconsistent with the rest of the file. Other checks
   use if/else instead of a "cmd && { ...; } || ..." chain.

Cheers,
Tianyi
