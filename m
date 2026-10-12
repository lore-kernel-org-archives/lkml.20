Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DA93BCD2B
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813562; cv=pass; b=D/cNCQBRZm9UolS72KwFbfW2O6uBZ3Yt377bfMk35OoodIbbt7SkalR+X2+CLi7GJ4JZr/8/S1DDUVxFHGdrCytGQBH96Sw8zk97q+xfDl+WxlP/y+fKxFpene7Hr8M7n6eECEvyUTcQUKYfE2jjcJxNrpYGwGacGR2IQ89H+GE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813562; c=relaxed/simple;
	bh=7+FqPZlbKzDBVAJi5KEqpaoN9YJA+O6TweFmTWZcY/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RWUiFS/ElE11AVrjX0dQjwzo+v1epY2GkDXPz9BFSeaTsq3DJmdPxL7Y764HrE7FEEdXvaS91YjzpP9OyG+JfQ1aYP2ErS6R1kXIe4Mcjcda2wBsfrdTb/NlxJ5TKeOb7qStWh7Mql97Ushjq4e0OrMK5JPkDSwz5Y5MyYW5P5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l59ictqP; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l59ictqP"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6756a01fa01so1660045d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:59:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791813560; cv=none;
        d=google.com; s=arc-20260327;
        b=Bz8/nJHTlt4Pydqn6E/UuLSH6De1voIXw2GoGZPOp+WvxK2CTwVB+1MmXBJl4+AZQ6
         s9dwXT9K1QStBvHDmFfDWVJMmj/f/wPyPxRKOlhpEIZdO65hhrwlh4L9cUu595zuGGFU
         mRdTtl+1MfjmJO6OMROdkt/qGIUlH6mBcWEFj8CCpob4KJFYAr8MVHl4BOqLC27sfdOJ
         OnXiAYbzictN0u6gOAXIhxLoK0VXdx3TueFRoMdr8Tqt4Qem3hkt5AYXgv8H8WivjoBF
         p6c+V0XAYyj42OLmnvFPPlhMTwadIcofMT3SsQt0MB8AuvuJ9mvl0H+9nrNv2isbJKy6
         zxGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7+FqPZlbKzDBVAJi5KEqpaoN9YJA+O6TweFmTWZcY/g=;
        fh=hN/HoIWbgSJqqy2f8jeihBDRdY8C4MXPlUN+y3qrdQ0=;
        b=i46m+4b6921gzyKOW4tXqBvihJ8Gxo6bS22Jl4l7vSQIhncdmi6sodzQiLS3xAJSrN
         Ct7soI0EK4Su5K6ZiPG6n2eVQI/inca1j9g0LxPuK5A9zMcHNEyZWXwH6q4XrGms/zO4
         liT3b+pssTG0wfKzjHQI2GzuRseqNrqRLfpaAxjFVEddAyyFOuRIwfMaZT1CXmaGadKe
         +483w84btrTF7VD6ts6q274X94GptmdGK9PohDCF01KJKePXUTZJOdosGcr5WxzlMYF7
         OefwRrnguYHlwi1VGcxmjkH8J/C6JYfNRim/gKpJ6b7yM/2UrH1mvR5ENlm/Yf1wEUeQ
         sLGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791813560; x=1792418360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7+FqPZlbKzDBVAJi5KEqpaoN9YJA+O6TweFmTWZcY/g=;
        b=l59ictqPvgtSdXxtxQityvioB3NKtTTy1otYtzB3WjkLh3dOWALB1x5GdqX4it6MNl
         4+Oi9gs7LgfRIBPGHP1kg/D2HSW1OfPsQ5jR8arpqYn2rpTptOPR4UuHhYycFFF8ICTX
         opUk0g0/pCRuHzS3atuvN8UWp5X9/7VD9OtSUc9VtqdBlujlncAaY2SHRMkH3Q5LXpkZ
         dpGrKeABWrefOeZs7Z16WBcfapLnlh4LTGAcAICSOjsMENWO5a+uFhJfsKnUGAse20D1
         RGOx5qHzOH+fDHDquWyESnHWVy9R7s4BUm9iFhh7Hkm1ep1Mo4tQVldW3IC9W1FI3J/4
         I1Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813560; x=1792418360;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7+FqPZlbKzDBVAJi5KEqpaoN9YJA+O6TweFmTWZcY/g=;
        b=d8i3VDYBUI8v+o9sJv8lrWqv2ucnmh8d+lrCYv99vMPZHA1sC2ijofyEh0d8KIrjV+
         HBHU1mcQe0kcEFGNFjKA3WWzqFVn0gFw7ApBWmnM2wjj0g7ci6mqbcrfd8XuNEixazcx
         tI2zUFbfQgI4+LwaEVLVD22gudcSgNzVyMVM6+WL099ypqqvdGjVOKspu7OHGVXeXMKO
         a4UqjGyA7ejUHp0Ms6q/3C28kFNYWAd4QfhrThtiolMOuwHgAXn0ho/TpqPz452xD6Im
         GjYo4KaRtk4J1yjyGAk+kidp9k/rI1Zrs9pkKF7MjLYBhzWSzztMH2ygtiiPMiJBUx0C
         WaNA==
X-Forwarded-Encrypted: i=1; AKwUvBztR7BATFcEjrmOfQeD9v+cuF8diapF10m1PpXhG6nQ7Yb0fEnzsOvT4cITONEBmraqKjiV8fLLxTbQqS8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhE/0wiFSdv1ky1CjGFUitJ/jsTXaRRVVV7o8oKyLiALS2sKke
	a+j+2Uu+aGppa46dIYXy+E9EpUT68r+vMWVHdSVdaev/UBdrKifDfJc7xE8Q6iLcpm+vToEm3kw
	bAZO4BfP4QFBxhRM4yoW/gtjeDPzJ2Nk=
X-Gm-Gg: AYBFou1SkiE7lK5pMvGrhcEmHdFrp7Ns04LslRA92y5ZEuSsX4ZUJ2LylqdFRYYZ5Ua
	fDF0aJRI5rDDbhpF9Pr725IyRZj0WmPQTz2CYhFpf3y3/5s5uqpLQXISk3E+LyB0l48KiS1mlY/
	IBHTctP0a/o53vBFro8GgMRF+JOB/4d1iLk6DzsLMR+kF8o7BFmLCPV+hjgtRvzK4/5TRSsVzlT
	DGOwQZZfMx5os83npMG2ttsITu4Taet5S/sJWLyZ4h4TtG5RZubIUyVhHynzlGW6b4O53xzk0Ro
	wIgIbERIwbRe2dAy343BBI/Mux6XIOCmaXIdYpyvZkg8HwFEHrdIiiBL7w==
X-Received: by 2002:a53:ac90:0:b0:675:3c10:28a7 with SMTP id
 956f58d0204a3-67936acfd88mr2947207d50.94.1791813559834; Mon, 12 Oct 2026
 06:59:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-key-management-objects-candidate-0001-v6-9876bf3e2116d47c065e@gmail.com>
 <aszZ3KPvMMHLEJ0s@kernel.org> <aszalro6U6BFO_D3@kernel.org>
 <CAFRLqsUB0MQRoCHg8cXmyofWqbDGyvAr7vV07i0jUpMnSaksVQ@mail.gmail.com> <aszlg2R3E7zqR75r@kernel.org>
In-Reply-To: <aszlg2R3E7zqR75r@kernel.org>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Mon, 12 Oct 2026 21:59:09 +0800
X-Gm-Features: AclHuK_Z8o-xqZg0jqZI76nVd64T9lr82nl3wJ3vcrRD5bolIQP_kt4ypa7iRSI
Message-ID: <CAFRLqsW7HEn1=BjHsVNpvqT+Uf8hnxaY=ktsx+5S151KM7mKsw@mail.gmail.com>
Subject: Re: [PATCH] KEYS: Protect user key quota access during instantiation
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: dhowells@redhat.com, paul@paul-moore.com, jmorris@namei.org, 
	serge@hallyn.com, akpm@osdl.org, keyrings@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jarkko Sakkinen <jarkko@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=8812=E6=
=97=A5=E5=91=A8=E4=B8=80 21:49=E5=86=99=E9=81=93=EF=BC=9A
>
> While AI assistance is allowed, if this happens as a pattern, it is
> misuse and eager way to credit without due. I.e., you've done 50%
> of the work but ignored the human part.
>
> I.e., you also must understand without AI assistance what
> the patch does. If you do, it should not a problem to write
> a commit message tht simply describes what it does.
>
> To summarize:
>
> 1. Actual mistakes are fine and then patch just needs to be iterated.
> 2. Skipping work is not mistake and it is not cool.
>
> Hope this clears things up.
>

Thanks for the guidance. I=E2=80=99ll keep it in mind.

Best regards,
Cen
