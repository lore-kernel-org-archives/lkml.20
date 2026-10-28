Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793201687;
	b=Sx6tytreGd2OfWc/uOtlJugrm3qQZ06Weo5hrcig/lVhIGrHO5Tgl2JRS4wlwq0mzDy/
	 wmwa2uPdmksF/xQ5NAjNpuVzi+/iQKcLD1QtSqeaXxrwU4rTGnqun/C8juzNp3XeyQoZu
	 iJG4LUoH7uF41uAMJuC/wx9FtPZYGOjiUDR8UlyG2AglWAn4mYRMEXO3kNzCNzvxp1bfx
	 OiKI/OvtJzG5Oycjtdkh52VfI2V3gcll257fWHKsYTfl8I3pAcRnrdaIYNo31DQyfw0xh
	 yFLHPKZXkbZHIaYGGtMWEtoca1DmoMIkUrKFGohPCj8c+MLal42AN6JtBHOlaI4Q5nw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201687;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JNFgtKDp87voFFR8yXktG0LWODrSokHg8hARj7IkQYg=;
	b=lBe5hqEHVKD2d6tvICf60jSR7j1mNej7tIwhAvlNbmpzujs2inbaKLvqJxK+JQYkJ3+v
	 yNgMIc1MBr8HdqZA8rUpVJ/2fsVMFv8frv1wlVpdv1sDPb6osNYYoyVTjrbj4ivORXZ4K
	 ARv2KFShCRZGUz5P6m/FnuEgz/z9VeSdYSOqKU0ZlYGz/xhs5u/MSQuSt/2MLNE4pU0cw
	 Kd0fpoiz2XWQleMz2EvTvdKM57+zERuuEkr3AGgCUSLqJ/fzIfNyiGzTKhC1l6CwhTVjj
	 MMGk6mz9oaD2iSO0cO95aA7rxHCTQ5Wp0IuwR5BYuqyRjR8qCCSPMzOVALJiuef4CBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ef7UxKVo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DFE606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:34:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35DFE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ef7UxKVo
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-845788309b4so549810a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:34:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793201686; cv=none;
        d=google.com; s=arc-20260327;
        b=nPsyGZ+7T5VSEKlaMIp7g/y53IONpi8ddnQhfBNOOoERvHUdEscBFijCYFdw/2dOLZ
         WYNO5nUxVQ7PrSBt2vqhkYkhNx6St2xyDSjr1ou6DZkaAGLHAL4imTH2XRH8XbibSmqO
         29KI5NfL6+NRMBZMjOgr69PNA1NAXYFVovqlSr79jJ5K48pSBY8Np+6whPtnLUxNWTt5
         Xt6f42nWSPlvVVbH4GfcdQIA6lU50U+zs7P0q91tR/k+zrOQf60hQR0h9628DGkGEsn1
         JI51B8ZrOv/vJ/9jwJarCvaIdaPyNQKujvn6NPBIpCzT0CPZOpKqlfdbkGweRk0ThYRL
         BTzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JNFgtKDp87voFFR8yXktG0LWODrSokHg8hARj7IkQYg=;
        fh=DPLhPC0VKRLt/xHbEgROTcubwvJQITYJ30pypR7dspA=;
        b=jxiPnhhFiAzAJ5Rz5lpO1QKLX4kn+XH3lF6QOWrowfGMVFsMnhLIeUpK3mmrYMhv5N
         QwLQ5sObA1xrrt5f9vjZUX0br3Rxln279fbxdkPcjWuYpWrNstuW6JvUIGjLyk4zTrfR
         foYi7TZ7ycwWja6xIrqnP0lXgFE3hMlRFa1KJs5e8mzCBZFrIQBqpT6yPtIbNExaQQG2
         XDY67MlCB4q2m4Ccm01gUO/6/+nQF61U4nTeIPoOhHDGoxQ1CAnoPNSneNp/zIaMtDMA
         7SwpoUs0CNecDw8sMujwOEmC/vZoa0KZZNe8xGx2ZbJgpjChLB/ENnJ8WN8y15hnpF+w
         EYNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793201686; x=1793806486; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JNFgtKDp87voFFR8yXktG0LWODrSokHg8hARj7IkQYg=;
        b=Ef7UxKVoG+4kGFp5uykkaUkiMgN1G+lhfRLa/HcMnDuSiZ5htbI+UAqy9Z2N2Vu5x2
         AH+7Nu3jLP/OrYD/VNcTT6FgiRmooO5freMk6bEYmgd57MDL+PIpGjMbnDuc0PsaShxU
         5/3RUNC4r0BI+PdMJjPh9SHdp3hIH597VpChTatGqzIJSzF5YmFX4jXsJFMoU91acv3O
         Ue52hoB1ApBbbh+Buda7XrIKg8nxxtjLMGB26NWAc+iJw/l+fGBuodmpm0fGIbJAA621
         BxIqhM70bRBAAqgrfBdZuKZ1qmZlS/oXwRLDwosHR8d6uPolfMNbRlKOIi4wUlj1PVRO
         cGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201686; x=1793806486;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JNFgtKDp87voFFR8yXktG0LWODrSokHg8hARj7IkQYg=;
        b=uTpDtjZuYsfOZ9ce90eMvgGUXHI59AxFX4osxloEfkxnnoFKil7RnDfi3lUWsv5TaM
         BpjtGZSMi5PQuzNPdetjVxl9yenp3whuwzMriHlfW4Cr16VFc3kKMwGvC569sEqsWTOw
         pjmwtCYTNo+5Wgh7jRBRpKYQu1BNjd8+fcB+SDuiVdmgIKX49R7VuUB8X/nFcjtLdo6T
         JwJyesLcR5slDUj9pA21xjYwvDOEe5zEoyuH2WfKsWh3TGymFCX4LZNN5wF40NKWyShX
         34k+EA2o9A546xziY+JrEVXjA6f1wgLYZ4DT80TX8rCSuRjBu8udJm6WlWGUavXU7wJx
         CU2g==
X-Forwarded-Encrypted: i=1; AKwUvBwHqBGJu3gU4KSjM3fG4DpK0Lo3PjrYgF7XK32tCiK1FLNKSIAeFDEwZaqqcY0XYdyNAQJqyl+5sfU+ac4=@vger.kernel.org
X-Gm-Message-State: AFq9FYISTI8ZYIwki/fxQtgS7E5iqL3MPKMfFbp9WpDhQNjGd1XdnLjD
	XnikoUjp99znd+71+FfM09NuNr5jnB0AqfSyxrgC1kewMKpmNl19vcQbZ5iH8aU6BuwfG5Z2EKg
	fSmHlTVK4yXEKjqRkSMwqIkrSMpzw0kc=
X-Gm-Gg: AYBFou0kzdd8GJaSc+cs+BxbDmm/vDnOge7ZYsbgf6Ifezy+RQhG5NTtCBG++Rxyfgh
	NuuI8f++dehuyM5/UGbyxlv19XJTvL85vhgAwSWYAy3jVStmlHgDDqZUQ0+aL61WiEsgJHNTH+f
	jng7X9GoNus4m7RsSk19vAGEDJbUb9O7OM4C7H8IRDDh4lZn1gfykyG5i5vy/wDfFzbTaX0j0ub
	S9q2yng6dLt3RcnLwr0ZxU420JzvzYAlVNFG95Jmay4jKzZM1WQkyFIotP0eAwU0b3d/CqaNshV
	+GBd7VYzu+WZ5gMhE53tFWjZk5x+50W/Jc8bsssmZC8Wppxr4Wc6dwXdjSHOBraStzb5fFW8Tjf
	H/udDZnn2RRL0OGL6xAVzGApi4j8PspgjGNw=
X-Received: by 2002:a05:6830:2304:b0:846:e5a3:c8bb with SMTP id
 46e09a7af769-85ac012e9bamr2225801a34.15.1793201686073; Wed, 28 Oct 2026
 08:34:46 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793094611.git.chris@chrisdown.name>
In-Reply-To: <cover.1793094611.git.chris@chrisdown.name>
From: Andrei Vagin <avagin@gmail.com>
Date: Wed, 28 Oct 2026 08:34:34 -0700
X-Gm-Features: AclHuK81v527zBLgjPgT7UgeAn0ZRsnw4w8kJ2Fr9s5y5HrZvwNULUli5C61ZOA
Message-ID: <CANaxB-zEaaDaaR2Fszx0D4TAcKAapOfcxQ2MzZbFVAhR2n3SOA@mail.gmail.com>
Subject: Re: [PATCH 0/3] mseal sysmap: Choose system mapping sealing at boot
To: Chris Down <chris@chrisdown.name>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Kees Cook <kees@kernel.org>, 
	Jeff Xu <jeffxu@chromium.org>, Alexander Mikhalitsyn <alexander@mihalicyn.com>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-mm@kvack.org, linux-hardening@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 4:42=E2=80=AFAM Chris Down <chris@chrisdown.name> w=
rote:
>
> System mapping sealing is currently a build time choice. Hosts which
> want it and hosts which need to move or unmap these mappings therefore
> need separate kernels, which is not ideal. Let's allow the administrator
> to choose at boot time.
>
> Chris Down (3):
>   mseal sysmap: Add mseal_system_mappings=3D boot parameter
>   mseal sysmap: Allow with CHECKPOINT_RESTORE, default off

This isn't just about CRIU. For example, gVisor does not depend on
CHECKPOINT_RESTORE, but it still needs to unmap the vDSO. Other
sandboxing solutions likely need to manipulate vDSO mappings as well. I
think this toggle should be off by default, regardless of
CHECKPOINT_RESTORE.

Thanks,
Andrei
