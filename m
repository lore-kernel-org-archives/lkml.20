Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101433E8C77
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792043178; cv=pass; b=edaqRGX0gl1UQNXJpPWwTf2Omp3IFJPrO/vvOgS1p9HtlFUIQ68uUt4NHWvQ2pmTDzcVCTw/9x3TFpLeGJneisMvZqEfqTQqtdkQ6WPO5eVzlZyLJo0Qsyvop4zFyud5CYNOC8ROXIt6+gI+JrBWZXUhg3vGw/oJASyhs7ei0dI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792043178; c=relaxed/simple;
	bh=qezJc4NEIZrhsd5+TuSsc3OnyYFh7Gr+9COlR9C28hQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QHT5Z/44YccDGz3loheQINhocppt3LbCQTOcAEur+VTmwbVXHBwDLuoflDrxYGkF/4dm3xnff3Vry/4DaEFYjYDQLc7Pm2E7R06I6/89Ev/BiVMDqImb/cLfUpqLtu5A6Bb6okWTg89+7c+TwJv4p8W//RwvvmZb1JmqjaYzba8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bqRhXJAz; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bqRhXJAz"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33c30fcf33fso595756eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:46:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792043176; cv=none;
        d=google.com; s=arc-20260327;
        b=ZL2dAizJr9RQs27IXGkg3jHXrVFk51sop4w/N4k4Om6yotpPGQ60gXlIgCNCIkWGzx
         y/T2SFDn8ulo7cNqQQ0+tkUhVGvHpzNe8Vd1/mbEDJTm3Ez9uIMtM4U9vyJaUPkuVZIa
         BaQWP8yxwhI9DhGTUabMK/u3w0TphcTvmCRc1eC6iYvo5V1GS16ZcUBm+KTsRxRn9zu1
         x1xz6s0jSfxkuyS7r6HgIzLc/xyuSJTTxNA+dEAd3pG4jTECc2nOTv10MFPjM1YvLoTv
         KCjQhUV+Fquv9qp3BopZx+ePTf4S3svmvpJZsb69fVoq7ZEaR9gj3w4ja+pHpMS+KKiA
         gJoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HeI0uiM52DuAwWHa/ijjOCM64Bu6o2GU+woYi97808c=;
        fh=0ubtHdgnppyZ2aeLg+aZrgLYhnfydNd7Fwl/G+wQrHA=;
        b=V83hIDDa6eo0A/x3IFenIGxwXKe2TIgiBT/iGj8wd4AkmXPBygwxgz5y8QAsFWA/K6
         vcokhYycQHlKISTtH9zussSZb02PYf5nNE1PH7SGBXajNSj4DAmEBdzIK9JSYPX9NNpx
         llwKmjNHBJeE8fzigz6czHCKdi3lEuxUPtfHfiX+ASBJCt0JykjtNcJ2vX5ksdPcHRjz
         SvZ3XEkBkUEY9IvVXrZL4bgd3FxQKRxZe9D+t2jbyVSeevkVa+3rxSsgvUJxRHnNd953
         hZGkYs7r2GQl3kqONkjUtRRjeU7IPjLwep+pJi0fOOVdbxyjiYYbeRPhBsjxPboANgmm
         g+Jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043176; x=1792647976; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HeI0uiM52DuAwWHa/ijjOCM64Bu6o2GU+woYi97808c=;
        b=bqRhXJAza1Yrp2/eRNvbssEp5MR0j3Z/JI6FUrVfNY9dB94rODj2a6opuA8FeB1lnP
         nWsNTv0PFeu1CizxuP073ENOufz4/5n6swZ7YKDdtXRLjJUM1cUUaqmSloNMv231Ghia
         GNAYBURTZmV6CgAnEy8jyHM5PFLdB69dwRgunXDAdb1QlRbMmtemCVXyd77WY+j2SnLA
         LZhEFVSC5BC+RMjchcp4rBJXfw0NoxEbyxn9WVk0QuBV5K7BrcRTljhRao4KosOAgdFZ
         Qe2BGExLNhFW886eY327ysw+o6yt2ZiqqM6EUAANOMIMN1qWGPGryd0JtzFXw1gj9q2b
         PJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043176; x=1792647976;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HeI0uiM52DuAwWHa/ijjOCM64Bu6o2GU+woYi97808c=;
        b=Y97eeT1LMqlG538XSYbMn41clOr5xehwsVfmpFcDUYKlM1gAIJo+muoid7StyvbTeO
         fVMqW4y7D5cW3uIgzpqCxMXNbAuhGuTpCh7WI45rq+VkS6363tKKNp3B2TV7Cdf8/2wk
         bsjCzsPVuaVHgcMofbbvICVXi1zSzRJjqOWJaIcjFiO4oGLRUzgcBy9aZ81W7Dk+RZl5
         NWyk2kbgJy47BKN0Cheu0boRzxzNeBG5DDH04EGFTEUgGtdiM4efvi+NIQsm9NYxV6SI
         3RJmLS565dvMv8wAVY9nq5xUe9IRxtgUTqiKd1ZqaCh9oZZ0Mupp77GZY5lqjB3wggi8
         Jdkg==
X-Forwarded-Encrypted: i=1; AKwUvBx4XQGpS4a5NRHpzd14AB1LYlb1WFuqeZA2avyccL/p8t/q8JB2qmt0sVa666yZBWdqZuEt0PNt8TyRfm4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIB+qs8AUT0EyjblLMpXzFGJBWc4aKGnhouwRGX6UQGufFaVZ/z
	SUIkYQoAtZWp48jRlKRrQm546O13hcMCpQbkQZwP7ayh4VfWFFqa56YL5xFlyOnboaOtv6xBzkT
	dOyJ4icdyOjAE1aK1cQOMojSkjGUmZig=
X-Gm-Gg: AYBFou0eS3jpjoCqaHpvlEv1L7wsiN6BLnZCYZTr84fqYGROKyjNT2l1nD4Ji2zsqQ/
	47MYmSJHivP28hdwKgSR4Ka5U1RW+s0PcWYC6CfIIFfuLRO8tmSX+7KLUejJpmOTXRjpRuBtpEY
	ZXqDCQ09U4V31Y9dxdahA70wbR4v3rQ52aqDfKpQTHB8U4l7bD4HIJbp0QH7IBX6PanV1uYByRy
	RDhzYA0s75azr2lRRQQ+cK9LqG2kpd7rp0eiMKrmT/Ab6RoEwzHPqBwtdLu+GxOjsGl9EQUmG6a
	cMQt8DATF80JpvqRieRrV6LLZ9hpoKJSpNrbYVr0ylbuBE/x3fkSshryscz0dcUHeQxHU0bZ4Iw
	mmQW18h/G474O97s24McYovRnpI6ZHxwho3r9Poe7SrOT/Dy5vltzyHL880gT8vSk0aUWSeggdD
	Thig69wllmKd4ffoEcQlg0PaZORacQDvHHTREOIFlayn2Vw81yTU8=
X-Received: by 2002:a05:7300:da12:b0:35d:4c5b:766c with SMTP id
 5a478bee46e88-35d4c5b7a5cmr10711045eec.2.1792043176087; Wed, 14 Oct 2026
 22:46:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014225811.i.852-kees@kernel.org> <20261014225818.3457479-2-kees@kernel.org>
 <2026101517-profane-opponent-4523@gregkh>
In-Reply-To: <2026101517-profane-opponent-4523@gregkh>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 15 Oct 2026 07:46:02 +0200
X-Gm-Features: AclHuK9JUbZ8Kk1BEvh1a9rSCsQ_67UzDaXAR0CwzEKJckJP8Us1pVzDHAMPGB4
Message-ID: <CANiq72m_iyquf4Lc8AWvbsBp++ASz4+C_MQ5iYQW-fHd_MNDxA@mail.gmail.com>
Subject: Re: [PATCH 2/2] seq_file: Require explicit initialization of struct seq_operations
To: Greg KH <greg@kroah.com>
Cc: Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-fsdevel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 7:21=E2=80=AFAM Greg KH <greg@kroah.com> wrote:
>
> Anyway, I don't know.  I like this feature, and maybe it's going to be
> used so infrequently it's not a big deal, but feels clunky.

Perhaps we could call it something shorter, like `__explicit_init` or
similar -- I don't see that substring (even without the double
underscores) used anywhere.

Cheers,
Miguel
