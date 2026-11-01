Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793496489;
	b=TKDVPfy29YNSFbqmg6z9AxRbdKTrCocdg3EoYLIVmh9imncU43cUuCaFVLvNmtdTNix/
	 XquDthG7bXZsTLI3RDF2m2XiDAHbmfkVklSk1vlCHlVi5pHzAywgz67O+B4T9StKoVK2F
	 f+ZdRhpq9rakWZfTt0nn239bI7r6xZk0cUJUC9BKBkk6ZZxvDviu5+1wK5lCzInpZe7wD
	 AbiUIP5cOdUKZkX3u+4z0PeYwlg89NFZJCB69dyVLMAYicA9imBLXlb+y2WIqjZPEHGm1
	 kLvus4IAXOuAHg0FaxDkesOVg3mltCcwVjLwQsZ+pRDW+1cV4e5ZXz4OMN+HT0jNtjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793496489;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=7LrPxy9BAKXEpY6N5O++ZaxG2WFSWYtlj7o2XKSx/mA=;
	b=XqTssfshePMg6MvY9LFtQPJj8WSv5av6tWZwZh1ZSfQV5VvPJ8vkgZa4pSTbsQtvYOQN
	 UK8yKh22OvHZ7lRe336f3hGexa+92gHwO3eixfNxtQ3rPN7g26JmK+pMC6PiGU5I94shB
	 SsOleFpZipoGYxwH3KQEuXBQuQPqIBMTP/ujjbG7SDaK4lX/Jnv+p9SwQNheocs+aPrXW
	 gB5Wn8WPurW2aS1ajTUxh60bFZE+XFWplh3ny8V+1Sjtm/JAeB7KKeVgTufZqug/KQpEm
	 3+B0JGN0FqSatoXGLyhWK4Vi22/XI3D8Hzeof5rLSdnq0JDCOKxqoWLQwXhOYoc6jEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e7QGLOUt;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D57606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 01:28:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2D57606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e7QGLOUt
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ea7190aea1so9036655ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 18:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793496488; x=1794101288; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7LrPxy9BAKXEpY6N5O++ZaxG2WFSWYtlj7o2XKSx/mA=;
        b=e7QGLOUt1jxbs51TNaA0p1UUxmGARGoDenhBRBvjutBP0RHrN3UgwV4ztk4nScfO2I
         CE0Khf/XsabYm+Az0Fh2deLwMw4WrujKvXwboO7GN+8g/mw3DBwk3vAe2ccjnq0v0y8K
         m1GbyoFMkINnRyNsmQx2GyNiWksPqWZd8cZg21VJhUR9Utr5VjzGL0yU4w6zsqwVVekr
         8JaIez//EUyXR/rRBaNHY3y98GohEKGOtA09sJN19Od5PNGhCKHglo8MNnVhwLeIJXHS
         1ll7DAejSrLUJGKn2R8vIExPLwpt9dh6o+h4OeI4WLiPUCWOy2DmJbDq1x39rNKV0usU
         QgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793496488; x=1794101288;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7LrPxy9BAKXEpY6N5O++ZaxG2WFSWYtlj7o2XKSx/mA=;
        b=bTgBIs/JPRhY1eyRs9PH+dM8iI4FVC8OY/tZ1wvUuiX3HCIpiw279na8pmcFFkygL4
         EyoJnB22G6VkQ+EeH0KusuLgtFE4J7Kh/hycmDdrLViyls+CncwcND5vLJt2eiLFgG7y
         gFhBNsnErVKoiQ/bOmJBLvshkM8QxP0Tjdg7rtakUqRB4tR+pRsCzGMSHBfVe2+MlsE5
         P+dj/ug3ICUwyn9Nyif7y7hcjCmZWcCbJx9vNIyqx13q5cy+SWHDU2vFt9EeNN1R3GeL
         tVgG1fwnWgEaN5mjlWxINft9E5lHtgQumj7caPv55bQ2PduLWUs31qr1pB6Z28jCWFVZ
         AryA==
X-Forwarded-Encrypted: i=1; AKwUvBxiQffynZ44nNlOdk2e8A8RvxCLAHSR5SGaQJ7U4kymrynvgsyIjvyv+wn2sH1YDor9qyVFUwINuWOU5j8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UKMQIJm4tQEnY3YeZ5y+ii2760ft29Fu+Cuk08qGQzg+XAqT7
	w3l93rEbNNEsWqFfYzQBNjsAWZn9n9+4h8bjZM2tiWa4crOmRzV1Mada
X-Gm-Gg: AYBFou0M1SwW/Bfd+PPkCg6MpUIU7jOVVXklLkWcQYBBKz0FUV67xs5NKxMQSa3Zw1/
	MSUMAlMk1YBRaaQNa+pExxILFV/ApityNVrZTwGJG7zjK7pf+As/D4pk6Ylv4XnUcMWheRNJ/yu
	Y03caBrhw22ivzCVgv5K4KQZ2oL0NsLmmk2A/kqwSCyNzwu+e1HOWi3XkiCYg4QrbQXAp79gN/v
	GqXK6wQ517JF2IHoNqDlVtwPNr7E9wRw/BPsbnlQHq2ifQaYWppa1sgtxfbKIg0gZ/YOgTQCE4U
	7TeMPbS72dCSTfm32DwqM36wYVW1z3seTc5Wh+L6qYaZ7TKV6wymsCT4FIEmEC9Ck5fGhb4Op52
	NoAwJ8L8kbzaYkSHm5A8KNkaHwnXjee972f8wSzTjGk0iIymhgqx5C2PsjfFTFOQq0rLAKoLRJD
	N8jnmWd95bpRnjgdtAw4mPNVRwjzN9EgpoXq08U5aV/8MKvAkuufceZvraBM9tiByh7QI2b1wnS
	WY4lGt2hggX8ItBc+Yuj7Fg7K7jUds8o32oLVbjq9Q0+uplag1eNRK49LOSIkD1cbd1uzR3VnQb
	9eeMoF/BuK3GKvFCEsdjevbzXkNeH4/c8xL5AHCIhlJCx1Jd29m2I0l4PLbAyxYmnhpiR1YNLf8
	xZLOzN4kGecXbALmn4/EGLBjmWE3lyWeIBg==
X-Received: by 2002:a17:902:d585:b0:2e8:422e:19c5 with SMTP id d9443c01a7336-2eb3647c0b4mr52613375ad.55.1793496488003;
        Sat, 31 Oct 2026 18:28:08 -0700 (PDT)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39298329sm16832345ad.61.2026.10.31.18.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 18:28:07 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Nov 2026 01:28:06 +0000
Message-Id: <DMJHFZPKETD8.PUM30IJH9D66@gmail.com>
Subject: Re: [PATCH bpf-next 2/3] bpf, sockmap: Restrict iter-context
 sockmap updates to iter/sockmap
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Michal Luczaj" <mhal@rbox.co>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Shuah Khan" <shuah@kernel.org>, "John
 Fastabend" <john.fastabend@gmail.com>, "Lorenz Bauer" <lmb@cloudflare.com>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Sashiko" <sashiko-bot@kernel.org>, "Jakub
 Sitnicki" <jakub@cloudflare.com>
In-Reply-To: <0bcebb4f-4b36-4f8e-a3cd-1eb0455081a8@rbox.co>
References: <20261016-sockmap-update-limit-iter-v1-0-23fa946db59e@rbox.co> <20261016-sockmap-update-limit-iter-v1-2-23fa946db59e@rbox.co> <DM6O08VBRY20.1PFUYACCZ38JL@gmail.com> <a9ba4549-4bae-4516-85ef-ee38f13551cd@rbox.co> <DM92JCFA4X4U.30MTDH0KCPTJ@gmail.com> <0bcebb4f-4b36-4f8e-a3cd-1eb0455081a8@rbox.co>
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

On Wed, Oct 21, 2026 at 04:12 AM Michal Luczaj <mhal@rbox.co> wrote:

sorry for delay.

> But, if I understand correctly, the removal of plain PTR_TO_BTF_ID will
> make pointers like `peer` inaccessible to helpers. And we just accept progs
> have to deal with potentially stale data, e.g. the value of sk_shutdown.

Right. Then the lock can go.

> Ah, sure. So the same bit for unix_reg_info left for later?

Yes. iter/unix cannot update sockmap after this patch.

> I've noticed commit 7cc639dc45c5 ("bpf: Don't take an extension for an
> iterator program") got merged. Should I post v2 with the env->prog->type
> check dropped or you guys don't want to restrict iters anymore?

The former. We still want it.
bpf-next doesn't close during merge window. Only people that
can process patches get busier.
Pls send the PTR_TRUSTED part in v2.

I'd also limit tracing_iter_filter() to iter/tcp and iter/udp.
