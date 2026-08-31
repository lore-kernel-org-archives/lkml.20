Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B3A3D3334
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788179860; cv=pass; b=qF3mnA93xpeeKthNA3OmRFlUS+Xrta0lfXTjJPMlB50/Ai5WUTTpqO+9ZJpRJRx3c8ZFkI1IDan/t9B7Rv1dGFSyPP5XGEN5C5itLdv7b3ds+p9k734e/j94Ebxe6wwYDKg6NZmAu5z1UeogD4YCrKStFhtp7sk2fSQl/x4WUr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788179860; c=relaxed/simple;
	bh=4TkzY0PNIukGzQU/HvHTJpI4EhpchSo6Xivc/3Xy1nc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P012bJzIW5aSIykzGkiEiwvG6t69hskBbnqRz8bYwboTNpo3It7Ji+7hUSYIT3FMgjx2hU5cskWv0qqIckkyE76pvwGnRv5Bdu2JMs039AgqSRWlbwyUUXTbFVar+Viy8Iy1MvRqZlNfnbBqTQT5TVQ/M0ezc/IGJKOn3SlsifU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fALxXGwq; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fALxXGwq"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51c2a818fc4so33324581cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:37:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788179858; cv=none;
        d=google.com; s=arc-20260327;
        b=Chf3pPrw8NgZElhvDVLF2Dc8CKdeEQESER2EvbePyHn6UJVpsV9iTkRGm8Muiai98f
         w8V5p6NspQYVWFtNp6FOn5E7s9sgBxxiLtAFrpNDaDkK/KL1B0dSEbIZjoFlqSpvfR6V
         G1/vcPkPDvk8XGmg5FPCJ6mxzx+5slvvjRTfjQXT4H6fV+Ug7thGvR1Eha0v89BfKnmJ
         ZdVtMzbqeNHOUbDAuFOguQkAw8p9Z790ir+3M4auhd4BGqL+OHbWi4RChOa9Se9IxSmw
         CFVizJPoLQAbBrBffts8vAo89gJY2nzEa9dNJ5zvLQ2IMcAbfWHntxuvreMlkyqHg30w
         5qzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vTAJybLgasuL9SWtgUU3Pc8kAU+RKh+ET+sJRnphEoc=;
        fh=K3G8KzgwJVNzA0xtKeg3lf27KQKzHFQEbR+Cqxcag8c=;
        b=SesymAEbfnse6IBlCa7FQdf4IOtYjDzRtOWsWPYmEIBwul8eg27iQfxU1kG+0CSMNs
         bcTaxXgWThIinASA5o0slH6BS182F261hgsjfeZkV5AbtXHolXSjXDtV7JXJcBnlxjZs
         fnyjcgODPqAb16HqWd33mVl61kyhsu93Ed5Nke9LftoahTSsdDwfqJBKFtEu3ScvSLKp
         Af4MHzMz1D10ZPUo/kAdIIHIv3/UxBhafY00h2iaeao2uqAJ/H319nFVOFpzgSqAguSa
         /wKVFV76hpl1WELe4YFRD40LFM2oIY5+bERlLB8auEXeiSSIA1j/5LcvwiuWzPEdj6V2
         5I3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788179858; x=1788784658; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vTAJybLgasuL9SWtgUU3Pc8kAU+RKh+ET+sJRnphEoc=;
        b=fALxXGwqXgZ41CIATWYACFvfJgfI58WbEK+n87qODl8PshriI7wWq94ady3W7ne/oH
         uCOXEz0jAlYACi5OlsEymZpu9FP5Er/8my1px8vKt3Zws1suT6+QV8oluRFLzXb2ZMco
         isvidiRgTQOi2z7YFsMNBi1akVVffoe7ZHvwvwSuuRI5GTT5v+sb+tKMnbDpIWVfL1Bd
         k4if3nhPAAidoYPO1AlfPvC1QR2q/qjwZk8BAlaI4wlN1s5V/iQboGKdSYWZDWMyNvXb
         6wZhaAOXTmxEk86d41oi7Pqgo2x0bMo+Ku4QxHzVYRLWJgfjpP4P6riHw3qV5FiAnlh3
         ymvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788179858; x=1788784658;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vTAJybLgasuL9SWtgUU3Pc8kAU+RKh+ET+sJRnphEoc=;
        b=A0hWxJHjY83k+bz+81sjJWXLaAITP4W1/YxzjJeYcd+j+E+L2y+5N5K2jbDgoitvpA
         e1MYusLv8UoPQ9Ob1BPQPHbOYYUGSgJ5P8+KdBILzFwb2bvjDvJCdvImr2/9pVSbGN8M
         JQEP3Yh1nvE5GMPbiv36hZT3qrp+wfbPxotREmygVH042lbyh1KhCZn/Bf+iflFByse/
         Bx5tg7cAc/2Cy9gF6VasPcW1NTvzm8K8O8ZtKTZ9G3gcFN5hr7pA35vhpZp1WSOaq3AK
         RKIu3ItxxKjUKFkjV1Dl2bdNdQIRyiT8UzBDVen4JCUZrkqtjS5tqWP/OenBwOGMgPRM
         auKQ==
X-Forwarded-Encrypted: i=1; AHgh+RrLj8U9eRtLdmEGaqYkbpJQBem0ha67vZM8i84HZUWUpqw6E1c0/nbnRmeMmdiiPO9TCHwI4gOJVWTMbDE=@vger.kernel.org
X-Gm-Message-State: AFuF++nzauQ5dhnFfhHGAVDDKUyJNDOaia6ya+s7y8586LCWI/ZglgiQ
	1odmqrg3CMFqC+BxbVCtJ6zy1Dvsp4xCr3+hIaL/9BOKgQrOogjSJyL96ZbN4piHr35dUnD0XdC
	DB8SAs/NdHmPewniuXBDUvm7mOAJod48=
X-Gm-Gg: AR+sD122s670z1eP3cuEWe/RKjxJBuWJ3PQPj/C0YLgmqQLCTmOqRLyh/a7l06UDaCT
	UFrrP1UiyNvAYP1E7Bo9Nkm4K0AJeCml7lGQ6eSxTCeQpy3GZpf4B4q3Fnjpgry+q+jA582os04
	KivZukQENaDJXBXAETcCW4mksWVu0wyCtgqWCoS9SFmbHc8G4qDrRTCUaZUdy1MbgC/U+bbrJlg
	U+sez+kOxE4OETC33dAmNIvuhIlMg+UNzERT5VWDJyvOFpsd2kLQORNsEV9kQ40ekzcfU9UIAzE
	nOJUvReD2FkPYhweSIVFCdwAtAkspHNgamhPYJvSg2XXc6cm4wHB1lAZ4nZmB+ZDP80C6aujiJk
	I6QLxtnaxNO6hwgpjlOsolG8bd3iSC99Bf4f6eb/nVIW8cgj5APkXUAdwHw==
X-Received: by 2002:ac8:5746:0:b0:52f:ae65:8996 with SMTP id
 d75a77b69052e-52fb9429e44mr282624691cf.13.1788179857700; Mon, 31 Aug 2026
 05:37:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830205912.478358-1-lucasadramalho@gmail.com>
In-Reply-To: <20260830205912.478358-1-lucasadramalho@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 31 Aug 2026 09:37:26 -0300
X-Gm-Features: AcwNN1U-qSLrMr-Ev-gB9jr0rby74fRwVIe5XEvQygjeB9LJ1rqblXpk4mafRWQ
Message-ID: <CAMAsx6d458V3ByxwgP54mPvC6VZO2O8kBFjUiq-55r3UnhpKWQ@mail.gmail.com>
Subject: Re: [PATCH] docs: translations: pt_BR: translate volatile-considered-harmful.rst
To: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em dom., 30 de ago. de 2026 =C3=A0s 18:00, Lucas Adryell Ramalho
<lucasadramalho@gmail.com> escreveu:
>
> Translate volatile-considered-harmful.rst into Brazilian Portuguese and
> add it to the pt_BR process documentation index.
>
> Assisted-by: ChatGPT:GPT-5.5
> Signed-off-by: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
> ---
>  .../translations/pt_BR/process/index.rst      |   1 +
>  .../process/volatile-considered-harmful.rst   | 130 ++++++++++++++++++
>  2 files changed, 131 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/volatile-con=
sidered-harmful.rst
>

Hi Lucas,

    I have reviewed the entire translation and it looks perfect. The techni=
cal
  terminology was very well adapted to Portuguese and the original meaning =
is
  fully preserved.

    I also ran checkpatch.pl and make htmldocs, and everything compiled smo=
othly
  without any errors. Excellent work!

    Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>
