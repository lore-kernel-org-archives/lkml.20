Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794797093;
	b=r2/RjPVoOk2MoUvDm1WYKEBqFZtwQ2ckJjQCPS20CeHHlmrz2ULWrU+SF0zLVdJoPi2X
	 ePtTBTO7pdWPvDcUnROarFRPVJAje5Au0Ic8TB/93QO7f1z5W3bhsIkHGs+bXQQ5Cz9gO
	 TtUXkL/czAkCgGspJRO9GMrzQIEskRbLEK3EIhiHuLlIFc122jATDxqf93bJXcjvq7xQY
	 c64WzkSeXpenROca6uWvL1JoDLgaqyRd03wqgtyRHcHJ6SmxGneUDKC9EDlRRkexJz5/k
	 /u+rdOWfhL5e4EqKhsK/Sho+N7hcl1UDd4aPducXzXlRXOwoocT9q3TCpQP9d+47F0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794797093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9Kly0eM9XbBDovJgfRouCKU4R9pr6Wk5hOGGnjCgSkY=;
	b=ZKZiLVnzmbUd00F1kfG5G5XyouriSWhVY8k0NkADv9vDYmkgqyMv/QipipasD2tYJFfo
	 1fxQaKriLrOf5WnDYUCR4qqCBTQKnk97bcsEqihXZ4zD4dAXIQRDLaHgE147QwwnnaCOf
	 +LmpJ8dEtFVgn65wUguldPzA22On7rIyg5nVytjcqOA4U2zr2wMa2aBpfwjWwx+PICeJW
	 pGpYtjgqVb0CN6v+m5vC7tuXGfc8k7Sy+CmCeKKXlW1R+iinC17IVOGv0Vug7Aj43Kydo
	 nY74/bcFDXClzjWx1gpJHC/ntmKbl9tawtA6HvbkVc8mcuwbkWEJi+Bpaq31LIXoCXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nFGwJvQR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE760606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE760606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nFGwJvQR
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-54492d8a988so226111cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:44:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794797092; cv=none;
        d=google.com; s=arc-20260327;
        b=L+hpF87yLQYH+Cup5B+GwohMcAn1iuPIT77opAUeqPdw0E0A5pwYiClRxro700MENh
         mRR0UC+xpTWaWFFRODRUCnNiV7Fog+OsX6Tr/fB8FF/iUg1JbbKjY/PqtNmIjJNCkul4
         pyWrfhnO1WzArNyTRiJWvapZOe8+aZ/bDsphgrNzKYz/GlTH/K1tTYgLIActL59+K9RY
         PS6F+5sxRS35dNPzxu0LXBdCQoInGZQHmR7xdan9sQLEK+JDiwE5+52WkYuuIMei6v/U
         DaD5mkkdE96ChznEiV89tvwnxYXlB8IFMu+XEeZuvINj7LlwSUs7+xjwe+6bXdpof2/f
         w3iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9Kly0eM9XbBDovJgfRouCKU4R9pr6Wk5hOGGnjCgSkY=;
        fh=PnzlQAa2a0nyf7r7b5RhHtPNTu5cljrUb6/FmCPnKp0=;
        b=JC2bThcaoEWxG2Mhg2vY9Uwtfxicem9HbqKkAB2Mq3gLXs51RJ4aqyB3SH+/QtYpR8
         Y28QNbmOVoHzFn6AiLus/2DxDp62mVqyL5PnB+oerHeFKdNPM7dPdCqI7/VfMVpKzH2H
         Xv83Q6Z/2Y6i2/mD6l3MyMwRcH8EIJDhSyQX/J4LH1yAw6xOWbB7soZGlKgpAqbbxf3u
         xfJeMTEfoeoTJ2Nj6BcnyTtoCaLfSKw9EP3KeMO+9QIwzEiXmAlplh37ViNjl8VPm1gm
         mVUUnnb2sRj97tKT84tIIsOqfsjWQCXKKob+BMeeeI90GPU5ZLmihdScBgRIXHLmCHAy
         If3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794797092; x=1795401892; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9Kly0eM9XbBDovJgfRouCKU4R9pr6Wk5hOGGnjCgSkY=;
        b=nFGwJvQRRsHhvwfmdSvYfqBZw+cwMsVDENRdiit92dHTa+7O+OiIcMa1sFUe5aj+gV
         0arE70K4hM2KQEnQeyVZ3KwVQ7LSUSlFUphhAo8u/ggapG0bMwsQPeKcDnoGP0F55hDp
         4YgoLKjJcLaqOl3iwtNpCKzM3pTB9gqovF2Tfe85YMJiKuPCSgUFSqB1VvncglChRX4Z
         DnxE1h7MeVn/c1AgAC3Bt5zC7nov/mhM9bTKbn7r9TPAfAZ+qRZRQdTetJ3Xtj55ocS4
         3SmNPRvTlmMZS1B1sWIAVj5WbHuhzjvrKl+4LOf1YMHMVRouDTiyQfv14TVJzdW2x7Dy
         GRVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794797092; x=1795401892;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Kly0eM9XbBDovJgfRouCKU4R9pr6Wk5hOGGnjCgSkY=;
        b=js3HvDOlaiKHukM7LlHab/VmmP3VRr0gOHrSHviL6vEi670Zm33SuuBns6mGFwd1gq
         BvO17wQ+u+0d5B0a9x1GZFRXQyzlvm+aj4d+QvP4+QpXPKWEiQzdXuTcy5o10Yn0k3tD
         GtP8uf19W6qXNJBcO+a6XlYAKW3CqXyCs/seyF4KBzn2S90Ftqndz6N1bFWGLGOU3Uog
         gwUfzDx9ELx4qI6GVanFlfUSaFTQOgoHuHROp1Dcy/EzECdMVgY2JHybguls9tOzOVDd
         K/E4Bq7IEUeJ87Y/C/n6ZUtb24PAPPImSjJNERJ8ZB/qgC9fZyuBjNU299w9oHd/LPf2
         XoDA==
X-Forwarded-Encrypted: i=1; AL+hErE4jAY7xh1O29lb95O3hchvasCkk1t1dJLZIXavLWflyMD8wG/fmNhWqkyLyOeZxQHenJtnLC/EwaENTTk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nK8cbgW8KVYulDqYBFP91mEr5P3VlCtH/6+9uwAOKByLGyfdU
	9bXEDvMz0dQkJFoUtMbXZt8lchFwU5Sldf2NNqJG/jJbajJq3QtnER5qoFNFsz6JMilx4dDPN1L
	+o4nygDnVMpEQxp4lG8lKeBD4/maNQtPQ8heHlI5km1mMpxFeCC/5HDQI
X-Gm-Gg: AYBFou3P9z2Lez8TfoiUHR67ripGLsZyJxbngqCcKYWqIHEwOUPuzkC8qX4stkG9BAF
	cdx/9NpCX4uGVo591uJSSYFrR+sLw6hLAUjPjsrRz2SLTqpoDU9gtU4qNjLiPloo6r3MWhUnTop
	pq6nMN084SBqO0ZsGILY5ThNK8JL8K4Cm2qZUa47T3tykpyLSfGn5I98rlQSQkaZulVO/QFg5Hj
	gzsFWHTkEVyY0td/axIEcNE2F6u7Qeesfbssqb0q6EFro2z0gKr/dfn5qpcjUehrxHEGuoOP1e+
	5NWdAhaFlmJl0GsWPD5YA1DVIsa/Oi+iPxSqiuJrk/ONbh0007ZMqAu89Bd3pri6GPGLT7afyn4
	kYHLO/K9Dvr7yq5WaX+aeGhggG/L1sEpklFk=
X-Received: by 2002:a05:622a:a06:b0:52f:9ed4:8d76 with SMTP id
 d75a77b69052e-55c682a8a6emr25827851cf.14.1794797091092; Sun, 15 Nov 2026
 18:44:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-main-v1-1-7011cd84e54a@xsightlabs.com>
In-Reply-To: <20261115-main-v1-1-7011cd84e54a@xsightlabs.com>
From: Wei Wang <weiwan@google.com>
Date: Sun, 15 Nov 2026 18:44:40 -0800
X-Gm-Features: Aa3M54o-0Vkofupcnn38JmSI-OGkOkHMmrH1O9tJZwmSDKKBsdojHT-nKCZT5IQ
Message-ID: <CAEA6p_CXNCgmq0bz_mfuehPGaEx-GwcHxdNVBSBAAtqB0nfMrw@mail.gmail.com>
Subject: Re: [PATCH net] selftests: drv-net: psp: skip unsupported versions in
 netkit data test
To: alexeys@xsightlabs.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, guyt@xsightlabs.com, 
	Lior Yizchak <liory@xsightlabs.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 5:03=E2=80=AFAM Alexey Skidanov via B4 Relay
<devnull+alexeys.xsightlabs.com@kernel.org> wrote:
>
> From: Alexey Skidanov <alexeys@xsightlabs.com>
>
> data_basic_send_netkit_psp_assoc() runs for PSP versions 0-3. The
> non-netkit data path already skips versions the device does not
> advertise in psp-versions-cap. The netkit path does not, so those
> cases fail instead of skipping.
>
> Version 0 stays mandatory. Skip an unadvertised version before opening
> the PSP connection.
>
> Fixes: 43cf629700fa ("selftests/net: psp: add dev-assoc data path test")
> Signed-off-by: Alexey Skidanov <alexeys@xsightlabs.com>
> Signed-off-by: Lior Yizchak <liory@xsightlabs.com>
> ---

Reviewed-by: Wei Wang <weiwan@google.com>

>  tools/testing/selftests/drivers/net/psp.py | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/s=
elftests/drivers/net/psp.py
> index c114d2245135..7c8fb2200b39 100755
> --- a/tools/testing/selftests/drivers/net/psp.py
> +++ b/tools/testing/selftests/drivers/net/psp.py
> @@ -728,6 +728,12 @@ def _data_basic_send_netkit_psp_assoc(cfg, version, =
ipver):
>      """
>      _assoc_nk_guest(cfg)
>
> +    # Version 0 is required by spec, don't let it skip
> +    if version:
> +        name =3D cfg.pspnl.consts["version"].entries_by_val[version].nam=
e
> +        if name not in cfg.psp_info['psp-versions-cap']:
> +            raise KsftSkipEx("PSP version not supported", name)
> +
>      # Enter guest namespace (netns) to run PSP test
>      with NetNSEnter(cfg.netns.name):
>          cfg.pspnl =3D PSPFamily()
>
> ---
> base-commit: aa40afa831ebfe45e40a23721711059f2ac584d4
> change-id: 20261115-main-0b37fbe5e1d2
>
> Best regards,
> --
> Alexey Skidanov <alexeys@xsightlabs.com>
>
>
