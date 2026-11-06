Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793994595;
	b=vgpWFGTaYPADw/B61rYe3pGGOCWxnZDGpBE4ncm6A8PVtxQ+zO9AcguUjlgMdZc34qSV
	 S4w0e9hQtWAWQqQO8zlSEfRIA2B5GtWXhshgFnOHky9NNh/9Fwt+XLt/vFZ96wobJ8IjM
	 sc3ke2j0NVgxOY2cMAeijFmHv1fLtkwqIsnA/GmP40MfSUl47Gxp5bw5t+ehHkxx2GFnH
	 w82FKblVEC28KbnTL/17IMmLo3neA5M/sGIUgGsGy2zNKP69wvcLyXhuqK7bzanKMN15x
	 Yh11DltyqoTOUSB70sD/1Jr1WNavJH87JP59RBx2HWucXHykpYZwcjcDQA7Qb84iIXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=b8v+/nVV3ssXYzzzdSdzKOO8zOsYTPEGfi/d2I/edOo=;
	b=28PjUaUdGtZB1jkfoVet+OKrrzt3RrTGpD17fGKb29oIYaHJQNEBeS7Mhfno1j2jeI2R
	 VLHimPdZkJ8Zis/ZYOLR4US8OHwUgsjYYzEtTA0dqGUIbg66N+9+WE05dr46GRgkDLeCp
	 m/anDTjD795kGG/kC1BGPra+rz4p3TgXXsMd06kqFfRkFQfS73aWHmTf/hY0/oZx/bvGp
	 yB/UrOmZxHm2Ae1htsPKr9Jftzgc2loFBRVDDqzb6zLGq9R+EPVDq1F6Svs6EDMl3m78u
	 QvY/v+ciemDJxwgxLViJCodAYT79doDwBoDJCHhxXBlBVRzZ9TASLzLyDyhjAzz/XFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iiP4XVRy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8F4606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:49:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB8F4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iiP4XVRy
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e9d7791b00so7349035ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:49:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793994594; cv=none;
        d=google.com; s=arc-20260327;
        b=SVCkqYM/agEYhYzlR6Xww3zvpI/vc+2NbWmsC5JMN79rZrDBtlbp6RXLJhI/5KMM79
         VqjdAVnWpJy3KzXiPZE/JfLrVliF7stHDGCR5wpSuIfCF2+tlqXylIs7/5wTPDMHMls7
         XfpRhTZLwz4Z4lEuNqEKPXk1DZOUwGdJ/9EpEGrsrgN5PPL6453ZJCpY9YJwxSxOUpIm
         jnk5L0lEjLcGdVjd8Xn8LjOtOmagI4OpBd6yLTMV7dRb81xDrtNzWAXiPmA7AbbjsOep
         tbQfhD0yauqM69DPinco0CRO/wnBNQbJwJ0j/WdN7jyUuBZZAC/Mebi7WkmASioiicI+
         3HYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b8v+/nVV3ssXYzzzdSdzKOO8zOsYTPEGfi/d2I/edOo=;
        fh=1h2IQUdFVSML3bbATfh7ZuueWzQHt1srja40mr3vHp8=;
        b=B7meSJq36vzaa/ySVqghfK5LwV3JsZoUiV6SlnvDchNs7gVIZyHUgev8Pj8r8b/GRs
         ENZCUwDGcGBc9R78Qokp6NK3bI6KkDPqn4uXwkSOGFKxuycc7qh6JnSmMBxhmR6HcpQJ
         EZzNNOWk+bMwlS/A143N5XpLMNmVSkCBkR/xLUDNWQVpbrObeK1akViEkctUJ2Z2bJej
         uHD2btVzmvFVCcl1aapFQRyntN8Fkx77M4Iz1iOdHZsCVXvQUg3KNDNLcYxauDZUfRI8
         s2BhGB9yU+UYxD/yDonrexbL9S48XT89kHFAaqq9ZzBk+9JgYVGUpec4amYbqZt3d9cj
         1DfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793994594; x=1794599394; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b8v+/nVV3ssXYzzzdSdzKOO8zOsYTPEGfi/d2I/edOo=;
        b=iiP4XVRy+wXLIk4ARRYrY/94n6DfGcCtjqVZaf5AZDIxvtyNzlbQByMucXKDgDdWuW
         aVrkp0uz8Yo9gCb3NGwi8LoIldgrelj18hbXKhbc9A0JDNmmNDZQkmlvm9wVA3Y0Wb1o
         wGSj22bUwypJdk9fKsGIu1PPkqaGDeLm1BmyLdRbmppvsmHKPTyYxyBFMxnNH7lSmHtn
         iu8jRYK6BQrIdrXwFXdAKoP1sjw+K1Ni46AYielh2K3m2zuPfo5STxBrt/xb+aWLpmBY
         xaIhKOTpItzeTLeXxqlI9MF4kNF9h/K2RFD3uTjeeGFFv2ZspqvZ52M9/iUehgdSfig3
         EM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994594; x=1794599394;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b8v+/nVV3ssXYzzzdSdzKOO8zOsYTPEGfi/d2I/edOo=;
        b=csn4dbPmKZ12xAPLVkwqkR+YVainjC/jYpR+t6zG0VCo9bS9/cRoqUxrMt/8aeUYt7
         AH/+ayuXOvjDeZ+izq1nBR5v7SVge2dQF0lJnGc3PA5dfxm4G8Ku3LWCrJT+pcrrZ0vT
         /jxJCFWarDSjO2yUtwhZW9Vi2WeTQ2+qvbNCe4nDwTvYrXZAAB+N+4N3H6lun8ZuO9qc
         7ihA96DeSk4ejHaJxg4a18fpfUq4K15LgfC0ny+pYC/MD9p6Jcb5vR53tCYk4+mdWnMD
         /m5rbZMS/LcGEeCXe8Cn2o5N27Z9FL+LT5DMw6Q+a4PQ8BjtBUM1vlY/uhas4n4jWGS8
         /Lrg==
X-Forwarded-Encrypted: i=1; AL+hErFX2G3KH0Y34UtWugkLjDtahWS88CeLqdVbFcOch25SfH1nrXhDI4VcscxFUYQVGAoOoWNFgYGIqMZO4sE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OzDOIuZIYjygWxWO60KA4piCMKN1LniupzkInn5sAXrwmR853
	ZosKNf7UmkLUcPHjq79L7paioh4z04SrI0hzE50W/KPjTC2IXYUaHvg9BiUNK1GLvc6zKMsaVXL
	RLpofBfft+VpqycVD4HfohVPqAxMBOdU=
X-Gm-Gg: AYBFou03Opw3iu6xLmKqwLAaiKvMGmYaFs4K8Y4i/zCbKS3/II5Jkj73w6zevA3fk57
	1Zfy9NUTHpCiV8eZJqzn9VjSOTKCX0pYhB7rttN4oi7pa9ITI0bvFYOG0aoT0P5cOVedScp13qY
	MX6z0eGb72kz12Lcf9y2FkToMbRr6UJvP7Mhp3Orn9RSBU2w3TxMhcTk9nU/eRE4YQu7L+guPTN
	gQrW8+qiaHVEYBwXwSVB4eX7bPT/ItMqtPqhRgUGAjKJm1vC+TJ0WNGMJA+BDdwoBRrQI2Cn+/O
	MNpLKBPeGGOq7AXWVGEMDWqFnE/danoAg61ioL5yidyRN8d+DQ77avam53Xh87X1InNVVj/vlG4
	vKQfyeSBor0l0e5zuXwVVFoyaNaYAKFM/04Jvu52aws8qXthTdnHRiwY1Za7AzW7x/NFV8JUo08
	EZPj4NRMBtKbg0HD7V0g==
X-Received: by 2002:a17:902:ce03:b0:2dd:ad73:5b6f with SMTP id
 d9443c01a7336-2ed40bdca7cmr42581615ad.31.1793994593947; Fri, 06 Nov 2026
 11:49:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101103221.51534-1-dennylin0707@gmail.com>
 <20261101103221.51534-3-dennylin0707@gmail.com> <CAEf4BzaES0KDyhHhk7UguLmRKVWxGoiEXhNvp7QHpeJSZSjbYA@mail.gmail.com>
 <CAGEkeHf9d6BuQWsaqiresmbPNWAVZRbzZv03kfJisT6SQD8aAg@mail.gmail.com>
In-Reply-To: <CAGEkeHf9d6BuQWsaqiresmbPNWAVZRbzZv03kfJisT6SQD8aAg@mail.gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 6 Nov 2026 11:49:37 -0800
X-Gm-Features: AclHuK-D1ZOSyHMac2tfkJx6j69nnEJP0Zd6RBV1HfjXz9rX2igCRXKdBHWZqjQ
Message-ID: <CAEf4BzY-7XH+XzWzcr6ew5+CFQL_=FxJLZpDNw=ZdPqeA8O6VA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 2/3] bpftool: Preserve unsigned enum values in
 data dumps
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: ast@kernel.org, bpf@vger.kernel.org, andrii@kernel.org, qmo@kernel.org, 
	daniel@iogearbox.net, yonghong.song@linux.dev, eddyz87@gmail.com, 
	ihor.solodrai@linux.dev, shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 5:03=E2=80=AFPM Hungyu Lin <dennylin0707@gmail.com> =
wrote:
>
> > how old by now are those btf produces that do not emit kflag=3D1 for
> > signed enums? should we even care at this point or just assume that
> > kflag is set correctly?
>
> LLVM 14 and earlier, and pahole before 1.24, for example. Signed
> enum kflag support was added in pahole 1.24 (August 2022) and
> LLVM 15 (September 2022), about four years ago.
>
> libbpf still clears enum kflag when loading BTF into kernels without
> enum64 support, though. bpftool map dump reads that BTF back from
> the kernel, so this also happens with newer compilers.

BTF enum64 support (BTF_KIND_ENUM64) first shipped in Linux 6.0, which
was released on October 2, 2022. So those kernels are old as well.

>
> Dropping the legacy comparison would lose existing negative-enumerator
> name matches for 1-, 2- and 8-byte ENUMs in bpftool, and the 8-byte
> case in libbpf. In the proposed code, 4-byte ENUMs match through the
> helper with or without the legacy comparison.
>
> I'd keep the legacy comparison to preserve those existing name
> matches. Would you prefer to drop it and rely on kflag alone?
>

Yes, we should simplify stuff instead of adding more quirks and
workarounds. I think it's fair to assume kflag is meaningful by now.

> Thanks,
> Hungyu
