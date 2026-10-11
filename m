Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E622848BE
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 01:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791681479; cv=pass; b=MoLEaHiHTitljeDBCQCxdvYPBvuSsv7oEtYR73XrcyY/1UbR3sf4LSlw48tVudqTU1KmZnytvs8ObQy5xHKFjpzJ1F1THW81UKJQHATfzhIgDGbBloUfO4ladX6v1sQcK0/ZJCsm/EUlUProjFa4y9yAEIYIGk+JaoYJyDxh6I0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791681479; c=relaxed/simple;
	bh=fnuiAUzH8i1RXzJbjDNXAl12hhVXicwYx/CWz3s49ps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fCyGcycTLryhzQR0GhKDlBHMwIlMnQrew3Xij8nckei+Ghs7f5JYnj0Pxi2UITulGAtd/bdD4j5oQGRLfGcPFRzU4GZOEgf+jt6T582qkC/sTZPV9IVrjWAngjwfDgx59TIBvuLaStIR4fgNi9RBixJlCbouWApgvzj5GXDsBW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sladewatkins.com; spf=pass smtp.mailfrom=sladewatkins.com; dkim=pass (2048-bit key) header.d=sladewatkins.com header.i=@sladewatkins.com header.b=m/O6ffgE; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sladewatkins.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sladewatkins.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sladewatkins.com header.i=@sladewatkins.com header.b="m/O6ffgE"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-678febd9307so698956d50.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 18:17:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791681477; cv=none;
        d=google.com; s=arc-20260327;
        b=cLuaI8wnCJIPu7/djQtNy6Dg0pW45QhwID4bb/CnasbBKdLJ6qbF/YvV/pyxy5Pyfj
         dWitrWQzmc+mjQ+vzn2tkeMRpMYxhfLlTKt38JCTV6vZ18IR700SR09GV+1d3hIMzgxF
         HN0+SHFHTjETfMM9vRIBBLx6rENF4UeUZtR8LT1A2YtnRFhhyej3khw/Uk+Uv5zlsFmq
         9ACOGsVoX0QnIk3txu6byF+2RUIL4OQLNmKqNJ7GOmCcpBHICnclXFP9Zpy52JqJ19aM
         B9xYUVn2htdBF3DEbz2K3Gb0ZTEjAOj+zFSUjnMdrOLzChDVfm8RLVrqzJmvVrlXhi6R
         DPTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bzVBreIIkdPuKDnn/qisn7+R+ttNV+LZ3ilnD4kWs40=;
        fh=N2rTgMnhR5nifZNnIrxujtd6F511h3/rT6jrLGK5Y68=;
        b=rdGRpYtwRy6VnV0LaBjXPCS0bueiZnfptuoTrF/38cdT+vilylGrj4IEuCx4wnO6TP
         yOyob4071Woo5TaVkxIWcAZTDAPw77+YWANOOTDqFmH0XIqjUuEnQRemTG/8bw/9pjlk
         lLKzXJeg2GA8PifV5GBjvvNPrUTyBkQeneUYpIl0pceFB6IArIxqs/Dht0b6mi7L9j/S
         tAyLe1ZxBVwzXjStX/iY0iH9Y60TyXcx4g1UVcBt6JXFg60bsnTLR38x24NJGckOEx+b
         33C4mi9hO4UDitfipAleVzPK/tnt73ZFoQ0Y4CJJ3RFZdmfeAMFNd8HR6R4NWoaO1JV+
         kfBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sladewatkins.com; s=google; t=1791681477; x=1792286277; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bzVBreIIkdPuKDnn/qisn7+R+ttNV+LZ3ilnD4kWs40=;
        b=m/O6ffgEwlymbGYeEO0z0/7tbBmFlMxQI2JdomPUPSui+Tx7Qv4LcrbyUMk/jw3XNX
         z7+PHfREREt9cFtkcO6xI2hd49eAE0wmCQ+AqxdzC5hymwq0XIgqQU1zgcLDUlU/k06d
         o7Tra68cReB9SqZwRS1kQrK34G8xrxL+VOyLlHawi5VxLlDqNamy9hXWKKBz7+UeXIFD
         oKX+lvCd6fxBgAM3JwBNbPHdAipGJBA8YFq1AmN6xC0X1wZyFFJmmctLnagPJquOoP2n
         if2qUQxLQQ8bW+HrZO0EoxkdoVS+QN4hcIckVeCOGw5PnHsOOUwfSGUzlxShtB3bCxGj
         Sg0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791681477; x=1792286277;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bzVBreIIkdPuKDnn/qisn7+R+ttNV+LZ3ilnD4kWs40=;
        b=vIQSEXpeXTkskvJ+m8dXmn4C1IdqusWFI7RdxzAo4nbb70geC1sRnoYpis3cdm0KaA
         36T/7nc0wu/U0ztReugEWvskGWmnSFA6eLsswPXnSn1OKrLkOVY/0Vbn9etoVJZxzLZq
         3H7jeQMbwxER0R/SXeFeip+MkalOp18HnpeHiNqNG7NR0DxouBRV6Q/uOmtM/ef4UsCu
         3xMLXkH2eQomH2GGHvGZDU5GjveniWq13n5Ec+p2qH3dgICZEwh/SJN4UpHiz/F34MTx
         7/NbcGyVZUAr7pntZk3TEJG5rnHtgu0anOq2Faet9C+sgGwwzM+dPz+KHOHgUW2EmoJv
         A/Sg==
X-Forwarded-Encrypted: i=1; AKwUvBwy/A6qo9TE6CvOKgB6K1e2Bbf52YJIuYDXc6+5Fyhf+FvHNc/oU+LR+MZux8kuKdcZLKiSBop02djP6Tg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpNMShjhS3ihxqowQvvxXYY27AGdLYJJHFqunUC418dYRx75fl
	YWMJ9ZQ7iZmbwAKprm/jrBako1NFge+D8x1boqukNSj8mTK+A8Cb0DwYPqdujhrX6ReFHBitBdw
	DhngvCOavB7ImdL/1DWUDCciXPzBflfEqbUArLF7EQYRwFB5dQvP/O94KOdk17fXsjPsij0z2rp
	cG6O9M/JYRFlDBO0gZgSNsqUH/uDC+TIbgiAY=
X-Gm-Gg: AYBFou1vJttB4iqAkuswFXVy4cQ4FleWKx8SdaJBsHOKMj0P7ock6ms2ioULd0m3qld
	MxL6DWexn8wMfm+DugD5Q3YxeyhphtJNdkI+d3/cbzCXvjOGFgm+VzAFQBsAGpCma0gCo8X7K3O
	H5BOk/sV9jFtc4vf62/ctQ+CGY7v2NvphH3tgAW8r5ibOazs07F8IZ6eY3JURTV29BT+K4e0t2X
	jMeFqQNJ3ar2JvNd2/BVaFqnYXzIB0YE+Btq26xKPqxPak1dIKceKXpNmq8aBwjzf2o+brce+5K
	4aC+YATMFtHc8gZEsi4ip4qoMeB+bnMOas191YHLumHzDU4MS2JEIgBXNgD18Wr4yt0LZwgZqsy
	husq4yUX3TQ==
X-Received: by 2002:a05:690e:190e:b0:677:d35f:c4d1 with SMTP id
 956f58d0204a3-679369f7abemr1942202d50.55.1791681477199; Sat, 10 Oct 2026
 18:17:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009140952.119038291@linuxfoundation.org>
In-Reply-To: <20261009140952.119038291@linuxfoundation.org>
From: Slade Watkins <sr@sladewatkins.com>
Date: Sat, 10 Oct 2026 21:17:46 -0400
X-Gm-Features: AclHuK-o_Bx3fweFB3qoGz-32K9Zbv921ZKMnF-L8na-GXc5lR3Y1ZGIdt8C0w4
Message-ID: <CAMC4fzL3rK3pdiZLpnVv_gju0dSUYp24AWnk1VTHHvch1xmVBg@mail.gmail.com>
Subject: Re: [PATCH 6.18 000/403] 6.18.56-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@nabladev.com, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org, 
	achill@achill.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rogueport-AntispamServ: glowwhale.rogueportmedia.com
X-Rogueport-AntispamVer: Reporting (SpamAssassin 4.0.2-sladew)

On Fri, Oct 9, 2026 at 10:13=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.18.56 release.
> There are 403 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sun, 11 Oct 2026 14:08:27 +0000.
> Anything received after that time might be too late.

Hi Greg,

6.18.56-rc1 built and run on my aarch64 test system. No errors or regressio=
ns.

Tested-by: Slade Watkins <sr@sladewatkins.com>

Cheers,
Slade
