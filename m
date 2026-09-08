Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496AC3A6407
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854009; cv=pass; b=rxbA1qs6KTwZzCLSK1OZAIWL4c3bZL6TFCTPZJXqj4vawsXco1kqnTgpyNOl9BD9QqBHWVXTSUrTtMcMAlHtXAcQTVXFtP14SNdMg9zEczv1BTIZ+0g2zwwu62L1+QyNE5puG3cPqOJ8VZ7XYoJeYlZcRtB940Sal+GPsiequMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854009; c=relaxed/simple;
	bh=ShfAywpUEZoRZ1v2EmyNOETVC1aDGZFHIpuGbrjaL7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HPFKeuRSDa4qzCxDeYfZkMAvoWl5MmTv7nq8sTZO06MZh0oQ1EWlUnM2pFZMbKrgOANOYLK2oeArVmcHEV15FAgBQS/tK0uEsgyygxbEA+d86l6rlO02uPZrDYZUs3Nt4wUzSVXYI3P0sOhCAf6u7cR7elylKiEbl6QmLDWmfQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G2Sfcf+5; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G2Sfcf+5"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-857ff9fef54so37674527b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 00:53:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788854006; cv=none;
        d=google.com; s=arc-20260327;
        b=bYSzL5sv0BrXKsXXZfpne48MHPsi8iSIXa5BNzdOWfN+ljh9fZ8QJWLt8ULnbvpIbR
         xEZ3zoZTd6olNGQuZuKCK7n7qA/mwBwCgzfGjtoqOsyn4dRGSyoogTOodfEgXBKdvK/u
         1ybbySFmnC/XBGwD4po6/127XAsYME9j4Ks1p7j/nf7+ii42z9uQUoCv6iplOJKxyWzQ
         YKvyHPhb+bQZt46485bj0mRlMNVpbEGfa94UX5x4KC1wgj2+vQyGwutkdWwygwi5Dm9Q
         Bdld+lDd6+0kSOEdUEipme9dfXPp+MouhTYPNIOrTkgX6IlxvuQZeHbXLufgrHVp6MrE
         ePnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rDy5ySt2VKi39jsUV0PwI7yCvNPALu4E9wVX5UyrP4c=;
        fh=fnWTTNZuYkMjWtCCLPcKzNyj85GMJ3ykULOCjJ3OsNM=;
        b=dy9v52Jh6r32hQUtVdtvIi1J782Qx96YX0mBN8iTUHE2ofNSjlzc/Wicd0t0DrDa4z
         CYiRcwbSYaQg+8IwIUqK4alBGIj+BsGVRWylxLCT4ZvhOGEUJeTUq+UnTnI47j0mp9oc
         iK5gaPjxe0s6UeuTZe8MInOg0G0hVO32qp1gyQQUe5B+Sqr9aVFaLXPXtQbzR0m0KJ/M
         1CeDb1HUgaWQ444TGytOBaWkDwT8axQlZ7jtBo3aD7pQFwJn8cY8khp+IHngqhMn1FQr
         5ufjUq8yA24J6BHObPkP1UF1w7iw7BaXNaZtA9X+k6xpNYbLoKOMHNJyWXh/P4ElpRzB
         na5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788854006; x=1789458806; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rDy5ySt2VKi39jsUV0PwI7yCvNPALu4E9wVX5UyrP4c=;
        b=G2Sfcf+528ju185GWhS0jDRa32GuytwzeQ87OZqCfcpeCYaaQcvJW8LgDa7i+uW+cJ
         u1ynDYlW2fEdYxzzO/CVKdVhyZT1HRG2JT01z0c+F28KIMKvOBr4/f4DTNeDhqEKAbd0
         feo8EOfv+GOy9qaYjuooIutTE9np1DMOactufimtUoOPZaARwxfzTVr930otfl92S0Wf
         BXCJLbzIvVSxmdASIcYXQIZFepMicjVLe3F/xDNVbo4cTDOeHe2QwGutQBnmOLzrAVT2
         D3JfzEIDD/WhUTd4JX79S+1fZDCeJhYolyVUXoJ8Q/qhOw8SvgFvyA6Yqu3dtIPG8Mcd
         DwlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788854006; x=1789458806;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rDy5ySt2VKi39jsUV0PwI7yCvNPALu4E9wVX5UyrP4c=;
        b=ZlSRZIfQ0O8zu75M95h62QznHhqG3D7PHAqDZFkyawP6SwYtpxdUE/S2ttGUBHVN5x
         rS0/S4Po5fnR9PaMSEw9YabmHS7r70D/BF3tLkqPgHFSZClQI90EMH3zZKt91hRBCb1b
         OXA7/qO5uhwm+TmxUkytyUqqIS6+K8PEt9gXHwnfpuJSc1xFtZyHJXeQippsujYx8LwQ
         TwxkSZ+L8rd0QZv4c/ojvv5qkLlWnRg4VGNQLn8bQZXM08Rv/XIFbDTuu9XmU7dcJKmo
         WZMDs6ft6Zbm2X65AzZSrwCr8JD/UQlxq5SdxA62+W7f8oy4kDgPQrIYkR8QOgtATpZQ
         UzqQ==
X-Forwarded-Encrypted: i=1; AKwUvBynsYPv69nm3CJHUKB7JjI98bNnVjh/MnjiUjjVaBsrZYgYvEXBKVYOt2xY++JcYNJ1UVecqLCEkoC74G4=@vger.kernel.org
X-Gm-Message-State: AFuF++l+WkyRFVJ6hxhjmBdvBxjo24/QHDd1oAXNS/BLDK/KMAdv/gK1
	Yyy7BLbmI25ajF/U2k4w0Ij3yasVEIVLBRHBw46vwhvQWkhUigRMAn+U7xJVnR7RSCUXdW5ZGD4
	+ckUpIbV/rc8dnIH4vUJJzm9kACiIPGc=
X-Gm-Gg: AYBFou0X22HWEDX9BP9Zz9YWIgRTudB/7V0FVyQbafXk80Pz+yKc5zGFjPaENSgJcwl
	yxLAGQ657KmrKBSvePFE9nsYrdbhkOgUmdgKJQjr2bXegKGxOr2aYzP9077sSVh4uB5AtpiIQjE
	4WzRReUg88kEm/wJc/7x/WpCdlbfC4AEjPV5u2BGJmyTRXNRtcbEvHzfuUsJ3jiZ0s5n8ZTsxi2
	sgf27zdg0A2Z676jPsRzDpzqvyguYkr0u9a0CNWpUDYRC2OCb8CDoVYsD5rlYBiMroavpD66iLI
	/p+V6QXmbPAIm3F8ev2D6Ue56AwTan/Fl764oJbQe2O/wQ==
X-Received: by 2002:a05:690c:6801:b0:861:804f:32ff with SMTP id
 00721157ae682-8712800de8dmr93501437b3.27.1788854005933; Tue, 08 Sep 2026
 00:53:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJ33NAX8=B6zwXDfjTvyoAOV_=1NZADCzCjCk4xtoPLE==yiPQ@mail.gmail.com>
In-Reply-To: <CAJ33NAX8=B6zwXDfjTvyoAOV_=1NZADCzCjCk4xtoPLE==yiPQ@mail.gmail.com>
From: Anton Protopopov <aspsk2@gmail.com>
Date: Tue, 8 Sep 2026 09:53:14 +0200
X-Gm-Features: AcwNN1XXpiERcBCKuUGZvd9s6SxHvMjAfvtrIDm6NWiN9h70a0l5bzhtFibW1c0
Message-ID: <CAGn_itwxDRqpTgxfBV2rusBAQaKmyMAt4NQckt=nRnbEm+2Y6w@mail.gmail.com>
Subject: Re: [PATCH] bpf: fix dangling jump table entries for verified
 indirect jump targets
To: Sandipan Roy <saroy@redhat.com>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, ast@kernel.org, 
	andrii@kernel.org, eddyz87@gmail.com, song@kernel.org, jolsa@kernel.org, 
	security@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 6:55=E2=80=AFPM Sandipan Roy <saroy@redhat.com> wrot=
e:
>
> Resending with the correct Signed-off-by.  (My earlier send carried a
>    placeholder sign-off from a local test setup; please disregard it.)

Please resend the e-mail with the patch embedded, not attached, such
that robots can process it and people can comment on it.

Also, please add corresponding selftests.

> [...]
