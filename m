Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794513456;
	b=Ascrmi73X5j4uxpa+8vxK3U2N28B987c3GBYgLyNJ5ewMtKu1SBiuMoKxL9R0w+jQSiF
	 BtteYJZkq/CzuMWEz2ysL/KGPNocu9jDtCoH2vr+BtOiC+DaMawIUdbzDPedf22t62oEL
	 5wj9m9aJf8RrQv7v6WIXj8GtebtB9dIVvbzKfuLtLTJt6k33fERBzGKTApStvsZ/Ys2rA
	 OiOkxCAyo8ip6lp/e3xm4TtY48xORSoGnfz0pN/gUhwK1C44qFJ9MqGzZmPPERieSPOC0
	 M2jKBhevbnSmX9eug4ZiEWcMIuotPBTfRIer13h/Y5g1HjJbZ6lxxjqFhkoJIJVqnmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794513456;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To;
	bh=nG/lLkqQ0rdJBUmgF+0ZHDQjmdqunn63tZ9hH/Qnp9w=;
	b=uTf1pK3r0SNrZNw8EU76LPRJKAnF+WzuI57WkmjukGeP1Ma+/uM9jtXcDB45C2sSMWUp
	 +aWm3AJnfJOmiTVmilZim+1eaUs1dTLbOtFXGJNqkhW4L6mnYw9ErwNGV6Sd2Py519gpr
	 ZqOr6F3c5DpRdY0yOh4347clh1/+V8M35lL47tfdZDTyT+or1xdajJWRcWZBJWc+z9iSc
	 UEFMHOG4oDdYcN5v1L8SplkKIlzifCzDm1CFz/I4cUm/EcnTlbD+DAymClYOzpHEBvyRa
	 qUnZTJaTR0Gec0+sIwprlrVW6Eu0uS1q5djlUVstRjMs8tf3Ui37gwY6rOfCogTuYBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YwtQlMy8;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977A4606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:57:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 977A4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YwtQlMy8
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8b2f59de176so182604b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794513455; x=1795118255; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nG/lLkqQ0rdJBUmgF+0ZHDQjmdqunn63tZ9hH/Qnp9w=;
        b=YwtQlMy8tzw38kivYwSxsVaNkC48NjO6zR8HMolDidk13wZwdwL8G/pT8tl/GFrfTG
         u/rerWG2qSjiC3eGgoV7XJBnRYu933lNqf5mqTQE9Z1LonLa1ldVJeEtpCDScXlV/u7T
         a4iklcV9UQfu/chino4vWs/c47DgX3ABVgT/1gCYj95tTh/kF6piFL97/1YEWUHAztky
         FBO9nwTGkihc8nXWTBcneYJBqT4vj3d9kj/uwpci+pshkcSThMNHate41TMitBuvpu6I
         j/eqehGvkpxbrTAiz/a9gbU2f5M6+k3yBvijC31uB3NJi3I4uzcxiNn5J7IMPlJH1KBY
         LjMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794513455; x=1795118255;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nG/lLkqQ0rdJBUmgF+0ZHDQjmdqunn63tZ9hH/Qnp9w=;
        b=WWA3txTHVr5iOgnBevP53BLtt4tBaYHUpMQWiqtcBH6OVJhyc5Qj5BI9Ysk8JW8K/5
         tY/438Nn0EYq6o8r279RczhIBv4mQyWVPsv6MeU5+t1OP94J+KICot5YPETnHJs2Wh7i
         SBbj08cFKlVLFp80K5yGqkOC8Q4uXCIKXuHfXWZb+FMk7wvxOKBIIFiO6hXbU60r0q77
         uxlpo8d0bA7UrfmhqwIdoi7B1MvuuhgIl/NW6KXR2xq4RL1u3lYc8zFjHzNRTtJya6LY
         qBWvyQ2Q9YFTzmuDSofo4PTpE1enPGlrHUgJ6juD6LPZLtcW2NkV0MQWuGrV4VSmPwmQ
         9jVQ==
X-Gm-Message-State: APuU4Z93/UOKeV5ey4uV34MwLvemAcH/nP04FJ7zfenLKznIjN5yngfZ
	yGqeg5LjhzyObJrExUMct4m56Yns5hE+jHJlupZMhzHrpnqBm2yhKu0V
X-Gm-Gg: AYBFou33koSsXqadekdYgQy4iZiivmuHcZnEOWPm5X+Cr24bTbNq+FiTIgUzDuc3BVq
	Pd2Q0x6GywFH2mXO/q9D/W+3Hh14JLs5+THDan84ISIFjAaQ/3SeWS3Wu+cXhdbzHuTyTAZgoER
	Sfvysd13rMsLUusKgo16paGwWAejYljp7vDcrFarFYwrCMr6YS+U7iDmuOWvbbEOxDY5G2bbcj2
	C3VpObDsME/L5kB4GJ26rfZvH1WG4FXVNy20i8Nl+WAbXHrJyPSb+oHM5l+ayVmnTRFb97gkhjW
	GYkD+9qEc66JLCA3vIOnj5JbfmuAvfOZfLpMEefDld/eQV8T1FPmY0B2ZAplMRi3xH+HSV3CkCK
	Tcg6k5Kcd+09z+HAMggNr1vqVMX6b63JdtZC7kVlEOPVD7ju4JdoP98RNN/wcEtVXPojn/W9esK
	V643bI23Gf6efl9fKa+Imew+ZsxW41b9v8Po+jiMGp3fYdJJMBG9ypoFyEA/TYxs0FvE6rvHpbj
	kf7A7TsxDIDUm1PAQ/D95qVcsUdJnEPNke/PT79otot4DuslzdJdcyQ1OSkVJp8GjMj9rCwesHi
	PMy6Shf9DvhiSYONrkqWEoFAfd/5yeca1jCKzRU6S84DZ0XVUKUaEm/AtwcQeUYbzqYZbKKpfUz
	zvC6vwaAIkxfyjkMQ71SPzKNJL+pcR5sjxfk=
X-Received: by 2002:a05:6a21:6b05:b0:3e1:8300:f6d with SMTP id adf61e73a8af0-3f7a8cd3babmr195219637.59.1794513454592;
        Thu, 12 Nov 2026 11:57:34 -0800 (PST)
Received: from localhost ([153.61.198.251])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2d11ac8sm91909b3a.55.2026.11.12.11.57.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 11:57:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Nov 2026 19:57:33 +0000
Message-Id: <DMTHXFS504S9.2BU4PDLEWG3PX@gmail.com>
Cc: <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>, "Alexei
 Starovoitov" <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong
 Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Tadeusz Struk" <tadeusz.struk@linaro.org>
Subject: Re: [PATCH] bpf: Fix cgroup link update after a failed effective
 array rebuild
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Shihuang Liu" <shlomojune6@gmail.com>, <bpf@vger.kernel.org>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <20261112134942.288831-1-shlomojune6@gmail.com>
In-Reply-To: <20261112134942.288831-1-shlomojune6@gmail.com>

On Thu Nov 12, 2026 at 1:49 PM UTC, Shihuang Liu wrote:
> replace_effective_prog() uses the position of a cgroup program list
> entry as a physical index into the effective program array.  When an
> OOM detach falls back to purge_effective_progs(), the detached entry is
> replaced by a dummy but the other entries keep their position, so the
> list position no longer matches the array index.  A later link update
> then writes the new program into the wrong slot, leaving the old
> program pointer in the array.  The array does not hold a reference, so
> the old program can be freed while it is still published.

I doubt you managed to reproduce such scenario.
So wont-fix until there is one.

pw-bot: cr
