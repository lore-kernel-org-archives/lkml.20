Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007C734E744
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 22:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791498195; cv=pass; b=JZmGhQxC53nvLPBLZmXMQrUOMD1IiAItNnTqwRUwaD60CgjOe9KP4mSwpqJ8jFeZIYM9Xnbj68CV8+jdTL/RnLU638GA2TgGIMSvhSMJXXuueCd2Uj7bXnsLefcf4I016IPxRzQ6CQYkavNem0cSBpXrljYYJZhYO2PZ1sbafRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791498195; c=relaxed/simple;
	bh=w+GdNA5P+DrEfgYC/fH9Ya+8/r8tR8bpwFXamzFHVWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kfK9OXnsSzy/zrOAFgm91ZFSWDoZPpJopI4qqThHa0Kq+GVR8YJgyGl9rphpk+oKnq+Fbs6byP80e7/7XsLE6qWhVwGZGFoS8SrcnrqKDYpikyD+aNnwZx9IgE3gvFYj1ManNIP+2XUubhOYDawIOQWeALYb0oReC/mxAm5QwNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuro.ai; spf=pass smtp.mailfrom=nuro.ai; dkim=pass (2048-bit key) header.d=nuro.ai header.i=@nuro.ai header.b=O/IPrnXw; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuro.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nuro.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nuro.ai header.i=@nuro.ai header.b="O/IPrnXw"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35115b52125so4694758eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 15:23:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791498193; cv=none;
        d=google.com; s=arc-20260327;
        b=UfMeNGQZQ0cLJu6W8W30H48GuV4rByfkOHBXid3lpapOlhG/BcYhYT0zIyGpH/rwCI
         8ejZwW892OScPVcBWbLwn1pYr9YpMdTL2mDX+c4GbHpaueTH67d/YZRW9s8I7F0jTbfZ
         ZSooQVIcEENFxQ/1rcqQZya83gohTfjW7bwrMXmKHseURLupp1A7p4saCeVEdrJt4Ex0
         hXVTKxkYD9si/d5rLwAOuRsv9+qLrrPH2Y8mXZABzYMqTkeGB42VnQyyMeT1fUoaElGC
         eMLUjx709ntdUA8fEt1kIxvAbazNVYgNgUl3AezkLUAm21BYeVbwGqWyRY9LrGP9lpBX
         P4xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VSHSXGo0t4Q/EUEgBQMVKzpQrM64wVJhdXCVhdhUM/Q=;
        fh=ko14VejzIQJjBkT9ZbE3nfTFiWMfjwvKuflnu+m3tiE=;
        b=IwofS6cNbX9MKb/Jb0tre0SjH2cpdKmQCJ0AdGifl3vsoOH21nsA45r4ynkNxzEte2
         tC7SayNXsJLA4/knGREW3LUIeVCdMxsTvdasERif54+LvrQCfDAYgc4wXBDqjVjPYFdB
         rXBHXGNCuBUgLVMas+mToxSeT14KHowCFSsUX2nsApE5A/8wRsMIp6aDvIY9Qjr9ZQy8
         P8SWthC8KdExhQMVg6TGNR58QDcJc+li1uaYLSLR8qN/HJ++MNcCAoa7RFq6TGEyGImd
         IXVqwH65kcXLRSd8ST4zEb0W2dvEQBjTrxVZ44pLnSKx3AQWnRkyEJNKr0c6iS8IdMek
         xbhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nuro.ai; s=google; t=1791498193; x=1792102993; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VSHSXGo0t4Q/EUEgBQMVKzpQrM64wVJhdXCVhdhUM/Q=;
        b=O/IPrnXwfo3kS1UUB/IiNRZQLnXJH8WML8zKGKjCXDyFEnBfVCZCumvKpvPzFkQ9e+
         eXtiobcwxqUgXuRWLZcwBK/vGfE0vJrbU3mZ8Z6dYzGvDdkTqwxJIqXbDSb6m/eMdpzV
         OUpzGo+yIMQFdQ9N/Jxsmn/986Lc1XfQ9TVkBAQhEchmUytWyox6kUUTu/uk0z+yx2kD
         iBRLPY1QXw12KY/0xqWwUr/ii1GkztW5atdWa+LxuYEL2PVQ/jQ9SnOzPEtY3s/N3e9J
         hxs1RXoidPkBU3wa7F5Pg94uge5Jzh9tUAyWJwI4JJ/hXc2DAqZTDPW6n4wgcOqUOWhw
         yiMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791498193; x=1792102993;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSHSXGo0t4Q/EUEgBQMVKzpQrM64wVJhdXCVhdhUM/Q=;
        b=tUt6Mj/aJwm3ySpYDADDWIUbfXOXsPkzO2ie6MPzyQD8xRVVAVr2nStjILz74cSq+Z
         aoEN/QfHZmAUB0uiNti/BnSWWgjCZgavYjrn8DxTPkcYk39ZmLvMa5Uar2T7XVSSwzGh
         VpepcM9/m2+EiO56/eoTSQajxxLnfBz3ddvGBzuh2uRsYjglUu4/naOtvsFL72nkH4ii
         /TBXEoz5BHp8Qm0pTz6L35kDFMiiMk21b29jCEV8Yxm1dG68wEiNfJtJHIrpdZ9WEGdS
         tZEvTO9Ny1j6xr4cZO3LjgUHOh00q396J1X397LRQ1S/aZeYOH1HZgHbqCzzNI1CPLYZ
         2BHg==
X-Forwarded-Encrypted: i=1; AKwUvByXTaHT91asLF1PGln4a2dHR3t1P/hwVvns9T9pGJMHBInLjLZ/ngEG5D8vzFJwGW6N3TJnh9Cs6QUXGgY=@vger.kernel.org
X-Gm-Message-State: AFuF++nbQxEThHLLzWG6DDMoUeU3hk5N2qq5BKqrQJ4gR9cUHJMKdGVc
	xlKzwmtdZnqtAtAcKaLVGQrwUR09uG16T2tf/zL3oyDK51vLlPXSlu+KpU1IBc/sUUtF6Wl+9al
	2LHIvvgKe5A8ufCe+kOk5m16W5Rsd54BLkKQBS+Ehug==
X-Gm-Gg: AYBFou13Hu3xYzcw17xUvHsoFqMn/1+2NBvx6Lpb344p/aEKArLHqHEJ47oD2V5w6aR
	j/Ct9+z1fkmprw4w/QHEq5qUhKADFvyMsqt8HqZQdHZilz+1oxbaPL2Qdpd0/zKUXDTbN05UXru
	UBgnfnkegPcW1BSc2LA1+L48jQiQc9pY1+Q3EN18xACKVeqbbP37X67srxM82xd0KA0DY4PLBX1
	uhSKM0jDlTkJGE7nh8nufu90vR/4YBBU5QaasQltOVCuJOy0+eYoFOxI+JmRa6dZtBxHqgCUpfx
	IIRuZrk0M1TEvnXqaYZHyOPeDxewIInBfotHijOFwhpBVpYQHhFbt5w=
X-Received: by 2002:a05:7301:1522:b0:351:6b56:6627 with SMTP id
 5a478bee46e88-3537e0f5b7bmr297127eec.40.1791498192795; Thu, 08 Oct 2026
 15:23:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008220256.1844072-1-jkain@nuro.ai> <179149781385.2527009.3611488194198236417@kernel.org>
In-Reply-To: <179149781385.2527009.3611488194198236417@kernel.org>
From: Joseph Kain <jkain@nuro.ai>
Date: Thu, 8 Oct 2026 15:23:00 -0700
X-Gm-Features: AclHuK_Ra0QaGiegHrPWZPoYKlS9D9eX_jvak8xFNq9tYhv-FeTeUsvK1RI3pXs
Message-ID: <CA+Y90PgfrfJa2057FwbW5=9LRBOqh0EwgWW9kPqynWoFhp7-Fg@mail.gmail.com>
Subject: Re: [PATCH net v2] net: do not let defer_count outlive an empty defer_list
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, edumazet@kernel.org, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, bigeasy@linutronix.de, 
	clrkwllms@kernel.org, rostedt@goodmis.org, linux-rt-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 3:16=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

  Manual code inspection, LLM-assisted, during a backport -- not hit in
  production.  I hit the heavy contention on sd->defer_lock in
production and had Claude Opus

  The context: an arm64 PREEMPT_RT system hit the sd->defer_lock convoy tha=
t
  844c9db7f7f5 removes, where a descheduled lock holder queued every other
  consumer of that NIC's skbs behind it. While backporting that conversion
  to 6.1 I read through the new code and found the absorbing state this
  patch fixes.


>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
