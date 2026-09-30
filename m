Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EC437DE8D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790783128; cv=pass; b=ea+x9iTU8gjanYdz1oQ+o6TFH0aJasUKyO7cRIh0g3//MVIB4JoYzMBojHdk/4zIS7l0ex3snR6HSkCaIjxUwJN57UR3mq9ODTaIb+mnVwlaP8HHzsyPJR2XA+kzLTtf5Yxpz3XQB7QHm/twwhdpDLLdUjK02qwMTpHUvdoRfik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790783128; c=relaxed/simple;
	bh=i6GmaXuuU+zwtj2v1bb6dDRelxF99MNSWJOfop71WYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WNKUnmYf1QHx/yW2Vha3ZzddL8r9bNfHcMuM4zDPFA3mkV7qizi/DqHFEWH+xjyhS9K6EyR4tqcJo7zeM4NgAFHag60O6g1DW4hYX7Ttzf9+tYNiFxH0Su71oaBLfMepga7j5p8js3Wu+LIM3FZwqBugFasl6+k7g5qCjWJndMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qRC3q1U4; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qRC3q1U4"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34c99260bd9so102013eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:45:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790783119; cv=none;
        d=google.com; s=arc-20260327;
        b=gxexk7vb3J6BYx21m6UXVZt8CjAJlKYEQEARGi0yclnINlfLavjdu07Y8AvoD822qu
         wjc7pRBtDqd00VdYDrasRM1X3k3XU2L501fSYd8/2/CoFBpeDZiN/+QbAO1//fAossdA
         RjycReffj1RaV+ST20SGI6pUakri0n6E+0maafq3n0mvkY+jphnEKXHg89RYa/i1oRfx
         CzRXIex/wdlj9eHIl8N5dsvd6HvvUZ8ZXAtZ45SkcbZR7Gz1NZ2bkSn3jMHdRBHy2DN9
         BS/tt4nuDl4Yc08xg31ymCw4ZNxLLe9mS9RHCvuav2ba83OzQtKH78I4I3hVXgFGiIGA
         iC8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i6GmaXuuU+zwtj2v1bb6dDRelxF99MNSWJOfop71WYo=;
        fh=bZaDat32H9jM/ZH+rNU3qoK/4hYptxlJMjlFDzgT4l8=;
        b=QDWZKFl8TblyajC+IyzTpslOjGlObF5VZOvsbwAKu0cgRI149OKHBs4YCzcg/sB9Ep
         XDflZJA5VSxBZ2yIFxpV/2XB9nkajp6ZXLcIPos8j3YfiYXtHl4M9xPuJzobH/aRtsip
         tMk2j2eAjUZ0h12/4a7LIx6V3cV26VzPWuiFo9LhWTWoZVuaR7iNIxAV/QQHqATa0r0J
         dQLYzPlYO12vzlHX35eaEKHbu59Af1alqA2cFMEFYstOfBjAfvDd+eW/mx0r2djxWfY6
         KaLI+QhocrfclkLdM6TKKX683jytWNC3gTRzJ0k8ua3OUyzbFTMJ5Z1g4fgYkMSynnGe
         7EXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790783119; x=1791387919; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i6GmaXuuU+zwtj2v1bb6dDRelxF99MNSWJOfop71WYo=;
        b=qRC3q1U4Jm+Zu721GKeU5MDnP/B/YfgcHDimuBO5GEsiNU3VKKWDkCTZEnb9l6VNdg
         2uX4rKqKKIRYnLId3f6QSACrT1BuYB+/v103uivfoG2uzHbF0YZOsIgq69yeNBh1I3e3
         HAnHMqj/wY9foUx+zI4vVlmTk8XcjO0FPDfuf+0XeGg5BWx0ousOEhzuYVoipo3y4Q+J
         B6+oL/hSVZ7tOHagecfCogIYPBI4rR8fabNJ6k8iGEETNQhY9vxiznMyv47p1Haz+9ym
         0WgLUCer3Z/1LejsxDM2pZNMPbS2DRBHB4tfobW3hNvGxxVKmqG24dXqTo/5yhxOO47S
         LQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790783119; x=1791387919;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i6GmaXuuU+zwtj2v1bb6dDRelxF99MNSWJOfop71WYo=;
        b=1m06hLqdwcEatb2f2dUJ0hTvhKTEKbUqvOTExF7g4JwEUjhTf4huDl8Z52C04h9NYt
         lIq/awYSATN9tb4dXQra9eIKkoHHR80g6n9LlsfHwhi03zoorBN0gxmK+Gh9PCKU7EMs
         f8lvjaCsXYA4wT8OEvL6Ms8xZq5LIdxgmi9xQwchVqPB8aNS5E+PlQFHnTEu2EbiWINd
         AxxUtzH/OPstIChkPE8qdpc7nkKyLFRmboWlGr2/6u9UBSRT6sjD4jrTWkzRm6CdDX8q
         t6i66VwIK8WRTDFqpIb7aLF+RvsuMBvDPhvvSs3N18gMCKbiXwedOS9rAX+TTW3ZQPit
         r02w==
X-Forwarded-Encrypted: i=1; AKwUvBx1D83noJ9lx/s5sN/B4+pgYnv1eD/s9ZtsQ4lEmkbEzxJDgGRXouCN0+yihouvhEx9Mq1T/ATTUnzzTPg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJaMbKWmMGsB5zDFzYI5S3iyAR0MG23vIvXvIr91ixKfFOqOtTo
	aCpIAIWnjn/2TEDIXqLpLRl1rZ7cY4WDOedgtQ7ozlWTYFeB58CVslEh0gwzZns0KhbS+O2mF3y
	IJRM8CEcFeFd6zLtkFNRcqzSip/AlbXA=
X-Gm-Gg: AYBFou1QW5B0XDLae13PNcKRnQsr72rakFKy+mo00t4Hq6ybshgVMMRo2CTZqtORX3N
	ooCW0mhKkExOUbO6AeG/Rm8Bcc2b525UY5hidSjKxyhxOxjMvnU6bbkHELXjans2lQS2++Dg6eL
	Qu1FDPqbeHWBYdfLd6fCqPRdyOMqnAbHTnvOUHBcaDLYDQrLdKArcdvfL6yVAahu/fPWKSQ2UTL
	/SwRyg6OOj4T5+c5sM+YvU0DM5xr8Inr9M8wiDsNmrIy5HP37n+ttfVm1wndLeh0wEojQAn7nRa
	0ZGm6f1E0DfSDbMMfoNBHa0FtDyn/+vVa6LvEs8E3jeRQwu5Sq+S/JZc1JkwPZfqt1VZJXDT14G
	qXNBGr0WlBlMv/P1RWNr9i9NQqGF1xvHxINW3HuVA4SgEEVHJHmBHf3AYOsgm0vS7KWAkPLozqH
	6MiIUJu1Z6GnEkdOfuBxLKQUGxfHsc9dtG2Jj2vgMLb/QZY94xNOo=
X-Received: by 2002:a05:7300:e9c9:10b0:34b:7c9c:9a69 with SMTP id
 5a478bee46e88-34cd8795e5fmr3668963eec.0.1790783119173; Wed, 30 Sep 2026
 08:45:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917051147.98775-1-tweek@google.com> <CANiq72nRLF7PmqqVUrAiw_M3dYZCr9ifoo+Q4SuXfBQsAFH-pQ@mail.gmail.com>
 <DLSOH1EVCWKD.XEIME3CYEYYJ@garyguo.net> <CANiq72m=rhBDJSSPBZ3yXb_r0jiCq7f8KOy+Fs1k8SzWJUwkhw@mail.gmail.com>
 <DLSRGVBPWMXX.1LAWUQHDYKLCV@garyguo.net>
In-Reply-To: <DLSRGVBPWMXX.1LAWUQHDYKLCV@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 17:45:06 +0200
X-Gm-Features: AclHuK-xcuO0mR7ZCevwePsscH8hBfb4GfEBBZrYNyFBbqkPe1_OxY6I5DHFIUw
Message-ID: <CANiq72mi-9xCyX0VfgbXwvSQsfvowzOdsTGVF1HpKy_h8eHesg@mail.gmail.com>
Subject: Re: [PATCH] rust: macros: allow non-ASCII characters in `authors`
To: Gary Guo <gary@garyguo.net>, Andreas Hindborg <a.hindborg@kernel.org>
Cc: =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 5:37=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Ah, that's my patch. It had been completely paged out from my memory. In =
that
> case this is indeed a fix.

Thanks for confirming!

> I don't think it's worth tagging stable though. It's not something worth =
putting
> effort backporting, but if AUTOSEL picked it via the fixes tag it doesn't=
 hurt
> either.

Yeah, I think it doesn't matter either way. I can remove the Cc. If
someone needs it, we can backport it later on.

Cheers,
Miguel
