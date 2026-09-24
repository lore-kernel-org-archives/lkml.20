Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A76F3E40F3
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790269290; cv=pass; b=LQK5qSf4SOGfFfI/gddBRgc6GJTDvzdQndurOTZ4TLO8CsaPW0IsNhbNO5EcBNKrhJoVMsWO2VxT2zl5bJwa/nDZ1nu4dIGqmY7McnZm34ILxbquCIbPs08P7XqK5DVk0YaL6iwR51OOOV+g6xAUl0NhcNQmpZG9FfaOR79xsmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790269290; c=relaxed/simple;
	bh=FYlHjbstV5Sd9Herez9JRdAceBTSbQU0R6HQ6b+oRbI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dq9SdQVPuKJHPPlTcNPYAt61AnE2mT0wh4sbdbkRNsmYIvCWM9gIPDG8qUahhOoGvMRn+63w4gS7w3u7qntbKaaCl9iXcjS4Ea7CQj+MEV9uBcyiIMJCxwKliY/8B/4BOfKDwUU4xsDY+7sXYe55qwuVTka2tj9GypQXG8mrGQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I68gZQU2; arc=pass smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I68gZQU2"
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-7911e4349d3so3185137.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:01:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790269288; cv=none;
        d=google.com; s=arc-20260327;
        b=G1NqQrOZrtApXzAAUOpi3TbzcmOLkFfcfKqLFninMIhXHW2UQwzPYjl553oI2uQ9aU
         JUWHLdqvZU2wtT3yLtiHSykQoTbq+z/d8mlpzPdMi7TBTCzC895t250U05TjdxsA2fGV
         TxCNYH83JqzVYnbeGKbJx2N76SztCu9/tOuM8wIq2OAKbfhRnfQ29iDo8AK2ZsvD1q6J
         7H0GAduFGNUuZVc2UqY1WIVQLpw6+qCPuJGO8oJVK2cWVr+Ys7NfT8VK7Da78lzITquw
         w+bOlFw4Z0GjTrwPiAKU7zgx/UPaWPILOXIYSpZ0Dwtt2d2RVxUBB4+/Ro0lpkNniXHD
         zN2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D5ljw2mEpVXr9ieEEvEb5LWcwn4WHLTgoxmgT17xzL0=;
        fh=xUSZCO6FJbEVCS+osBFtkDTFoiVHbxGEXuavZHRlUoQ=;
        b=RKXyz7AgxlNAVRhMgzrYGNPdGvDo1N9SGLk+BSXEi8oK6Vf9Fu9McRInuDQyfB4W/p
         zaYhP9TM9GI/v7ETf9nGvSXAou69hRfe0NycZ9sKy851z6qioHMGk8f/Bto5CZxRFj2b
         7GScjW9QdSuQi/yrpfXf8U7P6WwRb1/F+n8XGwnnL/iQRh33yuMu7sscHI0h7sYFGLXB
         1DePs2LdN2F+DxOZX0X/M8PIZ88gAryAViRFLlaL1SmvITxgLZrTHvPVzijYj2f/Dg7e
         fbYUT50bZpnMQvl4hdP5/I+TXSQJ8F3qlcmj9YFEOIQsI6+N262xhwBAKSQDU+B44BQS
         7Pzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790269288; x=1790874088; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D5ljw2mEpVXr9ieEEvEb5LWcwn4WHLTgoxmgT17xzL0=;
        b=I68gZQU2IZh/BtaSGpvz0V2JvqUNmdfpmWiJfEFF6dhljaWyK0NebdIYzSr8qi2oXt
         H1VMD2FfO3zH+k+qsGcxDuokr/0e44kL8gTf+eviqn7KYNTQ9wyjkVjS171ADpBVVHtx
         nBQUJOGJ7sD/Qll02HxeUexy4A4BeSzHMUk6d6ptDpTA8n5rV7t13nvyIChVEstlZ1/P
         OuBrUOo2ZBLFe/3XiuhyY1VvjnYaKlPscwFdhCPw6dKwSqndtNnf0wULMNo/tu6OaKHu
         tZokNf0QlfnTPIqjgZqzaUdaXcHX0mnV90SARFJF2pEz0jg1kddzNsYi1bU5C0DQheiO
         b+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790269288; x=1790874088;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D5ljw2mEpVXr9ieEEvEb5LWcwn4WHLTgoxmgT17xzL0=;
        b=2qw1oySL0TdW//pZqQN+3YgL7sCxRqhADxFQbcM0d+iSoX08UCyOyORPZ9D4nrsVOo
         F21FhvGQXpqSuqnhB2GfIIgBFdn4FVd7+wZtQT4QGrIwKRsWsbhvE3RsY18XAsjhDbFv
         rM5bqvVO5JXLde3qrJH4hqYYf11sYcpopVLTd0MxULszd/m4YcWMiX6UXvllqyKTNrST
         kW2czFJ6D/ntT/ww5WVhreaOBzexTAaGnZDOIJN8kR/QRnNET20h9+iGtmfX/A/K/A2q
         05NxmtMED8N88l/8oZ4E99qdwFLJY9AozbtkxSKDEG9m7zAc8TFXNQ2zDXVAC0dm1rkI
         hhLg==
X-Forwarded-Encrypted: i=1; AKwUvBy/OVGtv1kZffjPYLLyAOJFud4oSiDSwgliO76ipxERF+AI4oepbGU6QNBoud3K0vHFbzoZFUECIzRQi+Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lQQYX6fBFT5kMF6xYF7WRLSI/hlYOzQnsue6U9vWHDe5P2/YJq
	7ItnLaT3jezDFC0AVhcH07HGOCjKFljBIETeGOBSG9UsiDSHq4m7SFB7ijGWRlPKeIJZUl6Mgzt
	0KET/U5RKbnhZMnXlg0s923scjfVCuHUir5VC
X-Gm-Gg: AYBFou1YP3yRdZNBM+glu56Et2mOsjH+w4nbyAfDgamxfb+/V+VBWJthtpMRCmgHbna
	3Taijdh0Yiq6hv1IoS6BmVvSEm4L+TGHRdgM+o0sr4LkDQXrXeql54ZVKrOCsjuZXwMrQbJIrZt
	P1qQ1HQbL8HxM4bUep/1If/gVNQmaPZes+IxbAjcQkfAV9b6W0AUjX5AGq2W7wACb0WFhdsWtR9
	iNyLjycGivf8/rGswT4W3oWF9Fgr37aVnGaiK5Ku6K9PzVE4Lv6vrU1H9gGSrlRu6Ck6RJKyJ4Y
	Junl5xjnkMPNF9ATCGngmqN7fWgmvNJ86vD2IIccrNvqtiFijM9LQMgjMChbImJSEZ3fcZasnN1
	LsfoyOjrhXcTVaFCEQHv7a6O+T2c88dgvHMgh7PnAgd4=
X-Received: by 2002:a05:6102:41a6:b0:7af:8089:2732 with SMTP id
 ada2fe7eead31-7b081f90cc0mr199413137.1.1790269288232; Thu, 24 Sep 2026
 10:01:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <arPTRF4qS6o1Q3vD@sirena.co.uk> <CADnq5_NUH1MBU15Vs287by4P37YV+6F1Q3J1e4Q4KuOvPwK9Fw@mail.gmail.com>
 <arPhsTaiqXPgCqAU@sirena.co.uk> <CADnq5_OJ=kP+0=iXbpcjsWbTx8=sNfov0wLSW53qLcFU0fmVVg@mail.gmail.com>
 <4ddbd29e-3524-4f4c-b6d7-1e2e677641b5@sirena.org.uk>
In-Reply-To: <4ddbd29e-3524-4f4c-b6d7-1e2e677641b5@sirena.org.uk>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 24 Sep 2026 13:01:15 -0400
X-Gm-Features: AclHuK8HFMIivaONWoB38lW5QaLLooQ-XLkF8rwfu_UiMAlST0T85q6tMsApcAo
Message-ID: <CADnq5_OPPnSs9Bv8LxRp104Cejf3H3JFkBE4XSfiTYgkdmjbHg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Mark Brown <broonie@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, 
	DRI <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 12:54=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Wed, Sep 23, 2026 at 05:57:24PM -0400, Alex Deucher wrote:
>
> > Your reports are valuable and we always take them seriously even if I
> > don't reply as quickly as I should.  For the issues at hand they
> > should all be fixed with the following patches:
>
> > https://patchwork.freedesktop.org/patch/755725/?series=3D174828&rev=3D1
> > https://patchwork.freedesktop.org/patch/755741/?series=3D174834&rev=3D1
> > https://patchwork.freedesktop.org/patch/755769/?series=3D172614&rev=3D2
>
> > I'll push a new -next branch with those fixes later today.
>
> I'm still seeing at least:
>
> /home/broonie/git/next/sfr/next/drivers/gpu/drm/amd/amdgpu/../display/dc/=
dml/dcn30/display_mode_vba_30.c: In function =E2=80=98UseMinimumDCFCLK=E2=
=80=99:
> /home/broonie/git/next/sfr/next/drivers/gpu/drm/amd/amdgpu/../display/dc/=
dml/dcn30/display_mode_vba_30.c:6666:1: error: the frame size of 2064 bytes=
 is larger than 2048 bytes [-Werror=3Dframe-larger-than=3D]
>  6666 | }
>       | ^
> /home/broonie/git/next/sfr/next/drivers/gpu/drm/amd/amdgpu/../display/dc/=
dml/dcn31/display_mode_vba_31.c: In function =E2=80=98UseMinimumDCFCLK=E2=
=80=99:
> /home/broonie/git/next/sfr/next/drivers/gpu/drm/amd/amdgpu/../display/dc/=
dml/dcn31/display_mode_vba_31.c:7460:1: error: the frame size of 2128 bytes=
 is larger than 2048 bytes [-Werror=3Dframe-larger-than=3D]
>  7460 | }
>       | ^
> /home/broonie/git/next/sfr/next/drivers/gpu/drm/amd/amdgpu/../display/dc/=
dml/dcn32/display_mode_vba_util_32.c: In function =E2=80=98dml32_UseMinimum=
DCFCLK=E2=80=99:
> /home/broonie/git/next/sfr/next/drivers/gpu/drm/amd/amdgpu/../display/dc/=
dml/dcn32/display_mode_vba_util_32.c:3278:1: error: the frame size of 2176 =
bytes is larger than 2048 bytes [-Werror=3Dframe-larger-than=3D]
>  3278 | }
>       | ^
> /home/broonie/git/next/sfr/next/drivers/gpu/drm/amd/amdgpu/../display/dc/=
dml/dcn314/display_mode_vba_314.c: In function =E2=80=98UseMinimumDCFCLK=E2=
=80=99:
> /home/broonie/git/next/sfr/next/drivers/gpu/drm/amd/amdgpu/../display/dc/=
dml/dcn314/display_mode_vba_314.c:7546:1: error: the frame size of 2128 byt=
es is larger than 2048 bytes [-Werror=3Dframe-larger-than=3D]
>  7546 | }
>       | ^
> cc1: all warnings being treated as errors
> make[7]: *** [/home/broonie/git/next/sfr/next/scripts/Makefile.build:290:=
 drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_util_3=
2.o] Error 1
> make[7]: *** Waiting for unfinished jobs....
> /home/broonie/git/next/sfr/next/drivers/gpu/drm/amd/amdgpu/../display/dc/=
dml2_0/display_mode_core.c: In function =E2=80=98dml_prefetch_check=E2=80=
=99:
> /home/broonie/git/next/sfr/next/drivers/gpu/drm/amd/amdgpu/../display/dc/=
dml2_0/display_mode_core.c:6821:1: error: the frame size of 2160 bytes is l=
arger than 2056 bytes [-Werror=3Dframe-larger-than=3D]
>  6821 | }
>       | ^

Does this patch fix it?
https://patchwork.freedesktop.org/patch/755883/?series=3D174861&rev=3D1

Alex

>
> after merging amdgpu today, note that this is in the -next merge and not
> just the amdgpu tree in isolation.  I am currently holding drm and
> drm-misc at next-20260921, there is a conflict with the old version of
> them though that was just comments but they'll be in the history at the
> point I'm building so possibly whatever git did with the merge is
> causing issues.
>
> Any fixes will also need to propagate into drm and drm-misc.>
> I'm also still carrying a build fix marking the display KUnit tests as
> BROKEN due to the issues with the conflicting changes with drm-misc
> which several people have noticed, for example there's this from Arnd
> last week:
>
>    https://lore.kernel.org/r/20260915201006.3526945-1-arnd@kernel.org
>
> None of the mails I saw about that or the issues resulting from my
> mismerge got any response either.
