Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4A523EAAF
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 11:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791717821; cv=pass; b=Fcc7v8PmJRQewkvrfq+8e5MP/jJ0oZZg5o7P/r5rcH/XF2Tkkvc49QdR+6lHbzOi8j2GkyG6+uG6PLZ5BepHdmqBMcOuztqqGz1JChm8oFOP/a/R2m6DVeSc07mvnbD5b1O4guwjYOhLmij4Bj6a6apjjqS5Z15Pl1uAC0Ryi9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791717821; c=relaxed/simple;
	bh=6S5nM0TeHpy1xxJuI9ztdTyKwNfI3pGJlDOe1fVvLUc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NXi3mxwPFw8b4y/wsQradOk1kkvL/AP3bXOstg9uR6iTxssM9kSlwfBxNVBt34guzo7ccyExUxF4nnaGsDwV0DMfYBSVROrhck57r+zb2eGMBtnLMoHy5wup1lVTOaV+VBSsHeaM7zPQ1xjnA2etsvU87g8mAm8y76j8nhPuqEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MNM9a+ex; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MNM9a+ex"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-53397325663so12092381cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 04:23:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791717819; cv=none;
        d=google.com; s=arc-20260327;
        b=ES43GzmVSqZB7Bz8hDGjKOoNbOBuLYzRZer5kK0x33Ddm81WuM9Nz6u8jpbIVwvp7A
         HsNeEKg0cqaP0nrvQY4EEGGNaQNTDjKqfxSRfXZuEyUaGLxxhjih6YX1ORnCyX7GagOk
         49GhwmSh2D5qZEr6I9m9bIXVUM3qrxMWkVIS40XTltDKcmi/miVNIzUEn8fUNBi9kLG9
         yyCUoFz5eM8qrlfLXTasSUr7raTUgjsC3+LPYS9nn5e1beTfkeVhKedB0jWGUa0O5Rco
         uO5U/AFw3MPerjp2AszVj8P0M2awMNYvs8mvxFsCwJ1x5s7PkTgKa3HFcPJjIRcSLLwf
         vcFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HQtrELtPHcUM2E6UeVj7fPemFu8C3adgNKDbLbY/Hok=;
        fh=A6yXHxHZeiCc3oSnfBSHhyl1swbT1phQ8PWdIV7K6Uw=;
        b=mspkfmiFZSoEXUzdFgLCXKyBexYXgITeJrWsspydGNXs2WAivN46ZGiAmcoP8SdTFH
         TQm4nbyTeInQ2rciKzaS9ajrw+ucDdWyt5Be8Uxyf+4iOzU1EnSfmYcOuIvgT/OIu4xB
         /5I6WOmWLICQ875rNOXsyDuQTQs0KFriEhzrYeJTnQYIDKJxKP4IshO/nEAVLi3jdhZM
         e0VTPnC3p72P3Iuwo+mSI+nZ87xICS34MoKKnIlzs8426/WLoDl6DPYY40GXFJmGJD+h
         gCh3wouTLXAjMZuY0wVfFIHlPjRwQh95o7gGm/55FyKICg2WaXxC1o8w1WnDSa3jIcye
         MtOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791717819; x=1792322619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HQtrELtPHcUM2E6UeVj7fPemFu8C3adgNKDbLbY/Hok=;
        b=MNM9a+exiO3VtIzFn/qEN6fePbhN1AQpY3dNq+AnLajWsAqiAbPGTtOb4FWNBtf/DH
         R7gUYrXzzzgLYfgbyTgloJvOr9dKwT1tpVkwvuFw9qRYocCmBhuAYug07WmAAKFzGvNE
         7hBdOn2VWvUdNx4E+MZ0B0auGjlSzKt6dEwvgXKS61h/v2OkmhHPXAej1Tt+FYy+ahjQ
         UWMI2JoUjRBJZPJYKBDSMeoKQJlkux4Hoem3j93cGQsWMDysYDl04Opoxw7Jswkg6Er3
         VtrNdNYh3LTdpsa1NLB5N08+LXA8WUiU/LLxbjJvTqAvu+xQa+W5gFfok0lk41jJmNPm
         7V6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791717819; x=1792322619;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HQtrELtPHcUM2E6UeVj7fPemFu8C3adgNKDbLbY/Hok=;
        b=d+RrlSeJ3DhLKMf5b0IlVoHuGXRlbC+6jl2ESiY/HiLOlFiw/2MqRZ3qUNjzPbnEMK
         wO56dtoA6DN3cY4+FvEIJK5ffA0tOc+IAOfeLRxyusL8Pfaw1DZvMxM0ZUndPwBn939/
         YED2BQK3hPE9zEG1DJQszS3rkoGk7B67CXlLiTs41MFMmDORJo2rQbkKxiVjmhP0gllo
         yu4WLdT3ytQsCCKl0JnRQm+wmI44iVrCfgCv4BWX6gwN+e0/hWM3hz71DMKjtRXMii5Q
         LoifMkcKG6Sd2nNIOiBb6ecrH/moWdFlExsGa8ihbcusfxZdLAm4nbBHPrOoRq4n+/s0
         MxQg==
X-Forwarded-Encrypted: i=1; AKwUvByxjddjYyzASKDOPkj4XeBDQyZztH26tGTTog9CZOcImSBJYf3edempphjyS0eWdfGlUlVOejmW4rVnC2w=@vger.kernel.org
X-Gm-Message-State: AFq9FYILVs2WnUMDv/zWUKy4SYpBEwEf5dkTstqhXbWMLD9ofYTHhNa/
	Pu0pEAL4VSEVZvH3VNaBlaKGl+Te5RbSed53joyccUQnxVNZU/QvWrSmuTazJHhZXhGdfR792uy
	4/L1PtcuPx5vzvXf1X0ecwE7ehy6eXq6fgbeg+fAoUA==
X-Gm-Gg: AYBFou2o5tLhz1knTykD+7TjbYOPApkM8Q7KQGEoLo5tKkTiKRjBcBO8/cS3qDzRwFC
	s/IEXltVu6HBa3hdefyflJBtyRs8dR6F9c3JsrCGw/BK2Qc+E6kIHbRRNwV/R6LJ9Nv+7wU+WoC
	uDcUmvZXiKBPM7Ul4lqmz+/y5qnO4E75SJuOv0m1bRNmayiVpkZYZy6aHaim/o5iUctN3Zv9tbR
	95haGNIg+fHVut3IGlOs9mvq5F5QmGD6dAFQx6ma+iBUgP5lK7mSS0NsDwXc+yrTUDrfeCK6fPB
	nogL2dePhZQl5XkQuXug96ebbicLpQqFM0ZhU81DODMiv7gtDWotPi5yak7As1I3h+TF3Y7R6D7
	+VyW6oju1VXZLgFpPUvnpb/0cFUgPmS+hIh5zH+HGpVhJN7OnlH+3XBsavuJGn41Bvw7HF7IlhW
	1Wye3Agw7ZgzatBNmQXRns3BlhMrljAP0Tiy3r6ebUl9kdKLczSOf6oPC+NMvultNTxqZoQVbcd
	HeQ3+i/pASOhGWSwf8XQYaHGm0VKIPU
X-Received: by 2002:ac8:5f0c:0:b0:533:d98b:d373 with SMTP id
 d75a77b69052e-5359fae8d9emr116437321cf.20.1791717819231; Sun, 11 Oct 2026
 04:23:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011111606.14753-1-jain.sm@gmail.com> <179171754826.2527009.561712354727529429@kernel.org>
In-Reply-To: <179171754826.2527009.561712354727529429@kernel.org>
From: shashank Jain <jain.sm@gmail.com>
Date: Sun, 11 Oct 2026 16:53:28 +0530
X-Gm-Features: AclHuK9Bae3Zu4tNFkM32AdKSdWX51c1yCKllaI73dhcI0T3jtwCSZvSTD7PBRc
Message-ID: <CA+FWx=nC--v=9KHH-1BSt13EAnCu2hwXQzA_=a3Gd_=RUyrTzw@mail.gmail.com>
Subject: Re: [PATCH net-next 0/2] tcp: keep the route window on the SYN when
 SO_RCVBUF is set before connect
To: netdev-bot+sinfo@kernel.org
Cc: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Kuniyuki Iwashima <kuniyu@google.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026, netdev-bot+sinfo@kernel.org wrote:
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>  - How the issue was discovered ...

Found by manual code inspection assisted by an LLM (Claude Code, Claude
Opus) while reviewing the networking changes that set window_clamp on
unconnected sockets, then confirmed before posting with the packetdrill
test included as patch 2/2 and a veth/netns reproducer. The patches
carry an "Assisted-by: LLM" tag for that reason.

Thanks,
Shashank

On Sun, Oct 11, 2026 at 4:49=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
