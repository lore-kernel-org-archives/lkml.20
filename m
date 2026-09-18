Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BE7348C6B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 21:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789766600; cv=pass; b=XOph4tt/IBARaRGFqX7xAYw0Dt12TXNiUXUXh2qsl8mKVPXp0TbYyq6VZk28TdgeUwR3Uaymmpw97hOPFQxqaVwtqU/tB2uv1notuwvwvkmX6FCQdAXs+0AetjFWQEaZ3fs1gabF3OTRtebLdQXmQ+1HUpFznCkQFvHtbKYw5X0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789766600; c=relaxed/simple;
	bh=1YGNr9g/BFJtvxMbyKM+Wp26VZkmOBeBi9Y30NUsztE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X2Mac2iqI3XCDJwcC82svJ2Vh3YFBjEi+PmnUn1KQn1pV2kIR0vfc1/yLJ3JN09Uf5kLjNI49DogxJdcr7KQbjpjwi+W/vYwicRO8WnDdjDO/oGp/oFNJ57n4JOgT3kG79DlwX+38nwWIAD4iDJCnaAkByJ9b8q827mXVe7P62k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oO699ECa; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oO699ECa"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-9106feddbdfso10587406d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:23:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789766598; cv=none;
        d=google.com; s=arc-20260327;
        b=Z/sKAVTtBGF+HY/nwXc1eGH3Po83M7f0USP2dPfOXrQmIjczt2A5UeAV5KZriFYNAZ
         tm5njmss2/EKsVdFpy9YZXtGWkVYvove6iZ+fu89BmCMJ0zBMNOf0JIwj1aU0PbK8jQd
         rPV7AnbOxVpk4dDhtMp1IM4V9ke7Un74uNX8v9RSGZvRVSA51hTAOFNX990Num0Ummmu
         sMtwbwCQWItvLjQkSzSNAFdV56r4VKxirzEM1O3rvWk/ZSEfAs6nIKnezWh+EmbpcUib
         kwh2URiqswZp2Qp6mbxem4aB56t2ja44OzMxgsoKjpyK/l8lQ8apLBq8IrxLeq9GUKSM
         6Org==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0eXnGz0srvrxX++zhKhQ4P/04p9aKnhwE4Xq1r2tq1s=;
        fh=pRMARzCUBVPiI7Ji9JXTC0sTuz4d7N4xEwLSrJ5rnrU=;
        b=NGD/8xxnjvtUkUaspVD6vaPPnrhoWNDv1ibr1qqR8CmxeOxiWzTbjRHuwLgds4PgkS
         Fc478gVJ1JfVRnfc+DGRkkmdFdnICZ35tsx/M32SG0UjdUXJcnk4Ydz6baPgMPQCv1su
         4XdEZEBkFpwq4YwaI1nLs1J77f7adn2iHrqo3HytQ+3+4Y4QEJpo+Ymc+1Ky42dq2kEs
         J3Mt6uTp4eOcfmv9uJc/wYGXcmWAKZ5tCOT8smMowSRzARJ10JeXFylswesYZzKtN4od
         5ZecGxN86zQFnig3dC/99LVITSWPK0SLIASyCqJvRMrjWYbQ1NMQq0lHPSOyJLV818J8
         9cWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789766598; x=1790371398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0eXnGz0srvrxX++zhKhQ4P/04p9aKnhwE4Xq1r2tq1s=;
        b=oO699ECaU2AxraTVCpGJuRgNdllaXsMJdWxgOBCtPulEioNKl2htbJNTKFJ6Q9/052
         6qzxchZcJFXHV9RCH6erfo1waUSZeBZTFs+zVGLmUH95RnHVt4pc3FBIml2A2uYYS/5G
         v6UPKYYTGj2IC7+HzKooUx4zVFRW8d6RommgTNfRsT/ymoJxd0IDYYbNYdmE19adKuZ8
         h3ygprplJPsUSZ9ZZPk8T3SNMguDmwuASOUaDMT+j5c4pBKVxhHuY+/wCv4cHrU3Dxnx
         6KFntUzhWiHIYEHnTC05/QHlttMJ5efaMILeHr7lhExKFjdZgTPxcxwFlcm386XcZDNP
         TRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789766598; x=1790371398;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0eXnGz0srvrxX++zhKhQ4P/04p9aKnhwE4Xq1r2tq1s=;
        b=pTFhkjaJZ+XxNEhC8EGmg8RCdlG/7/XYthBA9i33VsWt7c26qGjm0hSqQLW9ypkB22
         nUrR28niTVoZpHe6GtqZ/VNsIwQT91XwpWpT3T7CmIA6rBbUlLqGSWMlAXaeSllMiXL3
         un6sGVu/2o/+i/mUXg4RMUrXoigXhVVYA57RwgLSZptQBs9eC+NHAmF2K6PpD43gG1SI
         QoVNxFd5LWTtWZyf4JrVCrHxyDwXtI6CYbNnt1FAO6NhYWSS8jsDhErd/so9x9yUvlH/
         NgGw6u+b6QJIWuE5nZJg9goWl6wtdl52Oats4Gts/RE4b2UTzAIzc/2bn6ezSy6hnhHb
         wSSw==
X-Forwarded-Encrypted: i=1; AKwUvBwdH5b4vffh3xmrnYamj5ifZafgVJcuXBle8doQAU3FI4AuSHt5rgKVCFzBoEbsXsFlnjc2E6ZaQ1CX02o=@vger.kernel.org
X-Gm-Message-State: AFuF++lUNj1J/Q12dX5/wMiXIIdRrbkdUR84AX+YCg5ka3ipGCbjWiI8
	P7zDz4E+dbKZkspWCEbYke4HZ3bkCLb4uLh3g2hCldBAp+dUotuf2lFcT2brtpa8yNugD0Z1UIq
	5kCJkgMp+3NElaOPnbcCk+x+Z2T91v4rhGaKfp1Fuzg==
X-Gm-Gg: AYBFou1Uu1fJ5W2wXsEMMKON/KdvlHmdP+/5bt09lOQ3cCfTIQ1QxkpW20TqEPcZThL
	45zJ8MMlCIwhPtB98Zr+QbG6X/N5xhiHaQubG4GVq+Wi8jziiNXz7yOLpN9YyLqAYwTmgse6pPS
	vpxj3zrq0ph+kqKnGd1Brnb+0aK2VthncueG4m9OWZwC5T6cK31fqO/IdrcQXPCMFwoSlFDhAFX
	N0fuFHN57dVnebeRKiQT3Nv3Vhs9rcLwB01ia+FTGvzMYjt3Q0SNiGLI6vN58bGehD9Db35Y9L1
	9BZdXYp8Z2BDs1pFXKx10vGE8wGAyGsYQNdfBEbKhR5Ul2JZbcxQbnAdt6ygz+8HugAmvEVDxp+
	X3XnumO3Xm8Ww
X-Received: by 2002:a05:6214:2dc3:b0:910:6f61:f912 with SMTP id
 6a1803df08f44-91254c9b0e0mr63870416d6.33.1789766597608; Fri, 18 Sep 2026
 14:23:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917181312.12473-1-claire.m.dusoleil@gmail.com>
 <ac19e380-e93d-470d-841c-7bd3f2b0b86a@broadcom.com> <CAEcBvW0+SqM2zHbaDS+JycXxc-ztzvixKtHVSVQby9viVH=+eA@mail.gmail.com>
In-Reply-To: <CAEcBvW0+SqM2zHbaDS+JycXxc-ztzvixKtHVSVQby9viVH=+eA@mail.gmail.com>
From: Claire DuSoleil <claire.m.dusoleil@gmail.com>
Date: Fri, 18 Sep 2026 14:23:05 -0700
X-Gm-Features: AcwNN1X5eSKW7ajEZ6zTzJv5nQKV6x4J3x4seSYzTJNYYKKJqhIyS9cqM98ziC4
Message-ID: <CAEcBvW10sKwD2+Ro6o8Fq_9oLwsedq405f=gjQ+OMbY72=+VFA@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Fix GEM_CLOSE returning -EINVAL for
 PRIME-imported surfaces
To: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Cc: Zack Rusin <zack.rusin@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I had Claude Code generate this patch so I could run Omarchy in a
VMWare virtual machine.  Without the fix, all I see is black screen.
It is currently working but I have to re-apply the patch after every
Omarchy system update.

Claude originally identified the issue as a Hyprland bug but after
further digging, it's really in vmwgfx.  However Mesa has coded around
it and I also had a Hyprland fix that worked as well.  It seemed the
best place to fix it was vmwgfx.

Claire

On Fri, Sep 18, 2026 at 2:17=E2=80=AFPM Claire DuSoleil
<claire.m.dusoleil@gmail.com> wrote:
>
> I had Claude Code generate this patch so I could run Omarchy in a VMWare =
virtual machine.  Without the fix, all I see is black screen.  It is curren=
tly working but I have to re-apply the patch after every Omarchy system upd=
ate.
>
> Claude originally identified the issue as a Hyprland bug but after furthe=
r digging, it's really in vmwgfx.  However Mesa has coded around it and I a=
lso had a Hyprland fix that worked as well.  It seemed the best place to fi=
x it was vmwgfx.
>
> I thought the patch had already been rejected so I do not understand why =
anyone is still looking at it, especially since this has been a known probl=
em for many years.
>
> Claire
>
> On Fri, Sep 18, 2026 at 1:56=E2=80=AFPM Maaz Mombasawala <maaz.mombasawal=
a@broadcom.com> wrote:
>>
>> Hi,
>> This looks llm generated, can you disclose the llm that you have used?
>>
>> As for the patch itself, it is too overly verbose for human review.
>> Could you just describe the issue you were facing and what is the fix yo=
u have done?
>> Describing the current behaviour and the overly narrative style is not n=
ecessary.
>>
>> --
>> Maaz Mombasawala <maaz.mombasawala@broadcom.com>
