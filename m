Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6371352759A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790067934; cv=pass; b=S5wxJ7H/dNaUY4W4R6Wmf33HPJi8ergk3fzby42Oq+qdezEPOPYvRxgqLAz/9AALdMwskG9szvJIAzFJ4qDc00smwI3ct3ORFOl28ZiVWu8Ar3VPcRVhSyqWMYka1xdV5KhBn1/bAiQ6NQfsOs5L85V3U2LlJKQkZJydzwjpKCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790067934; c=relaxed/simple;
	bh=6VxrMknAVb1vDWNanfZgZOBYSwjkUtQT3TOXrqHvrks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oQ8lUNVvakuhyQkrjs46uIImb3eEnmE/e2KW319ot+t1CNEgVYBN6SPfvIiBlfrgcySDDyz8qYd6h2CkvoleiW5oqJawL6M+kBvbmiv5586oMVBllXx6D/yPmyMoK1zu/0AqKntEzEYVt5CwPoop6eBGr21nWrattEv4oGjiZu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b+J0/W8O; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+J0/W8O"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f56039dso511842466b.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:05:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790067930; cv=none;
        d=google.com; s=arc-20260327;
        b=JU0kL6Zmh/47KdFUg9MCOaSAhVWu12zL4fmTyzIpyVGMJ1uwBHMVgnCKXHgbht+2te
         4CUbNw+wjqjwJDkZWBZeUxHDyMhqDf95/yy6aHOqq5CG/55ED57aVC9QImbKP6DOFFUt
         OuzBzIPr0OCcEFFajp538RosMcvGuu6OzGPHliksZYz6WEgBfFZ0Rv+cLQDz+LNWC9al
         WUy+RYToNyBAx2XoXTZE7XQ6she+q1sQuXVxmPCgIsrVNTJeJHbJicbl5gl199UsOlR8
         /EIPI39Uz1Eu2PB6WMJM54xp4zsYgYpy+ZqQSO9NdhRM+VxEpq4zgbnn9TyDCQ/+BBcO
         WdYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6VxrMknAVb1vDWNanfZgZOBYSwjkUtQT3TOXrqHvrks=;
        fh=RGATnLh/SEu+mHqkpNcBKKnG2fnVwWick71bvcI+LuA=;
        b=Uk09MnAzNYep5dfE626V0p8v07weirAfMkPRm0O7+U72cGWhXoXG4eAUfCAaDS7jjt
         VULGschIAwX176FDQIkE08dTiDj4SAgQre47iNeHv6/s6ETFQvvZGu5k9xTjl5pi4Tb5
         nMGQdPeK9m+UHlraLyrkrMXB9mzmtlt3d27XFN9xl19OG0vPvCq8qpa6KfrpzTotxwLM
         fy5zt019vJziqAYOyWZdvg7B9oV4EQ+aqAmj8Y/wyNpCgq6Qv4foZk36Oln4wzgRf4A9
         jHHVoiLAjC/wECV6lnl3aQzUbVShxWbBgzUWWwubP1bX5INqINOZH6ol5IrxWNetfZ8x
         VqGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790067930; x=1790672730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6VxrMknAVb1vDWNanfZgZOBYSwjkUtQT3TOXrqHvrks=;
        b=b+J0/W8O+194uMJCZtlLWUWNcTzaoRLF9m7me91BpuFxnE0bcySpQmlrrLOSCBfPNG
         ixldLOZd90yWi0jRTFDD3Iv8KeXrd8syp9MHOIaGb8Wbimq00JWH2djDWKAHnG5uNC7K
         w1yh7EJnOdhjXA7ppmXdBiZFZusH8KUp77mdEYnUVyv94KBNm6sUhW5Z6u8fa3/DVVxu
         Hq1XzHwe/vZG/8Stdst213sCA7yL2MiMtH9xfa7WVbcFgdgtvYhDY2PNunNRUxmNpOHa
         xsk82i7rt5ZSeQ2YZ/ZnpVlPINX3ezqqqN/GPYa2XbIcF5Z1RUXTCcBA4uv6r7n7GJ5T
         jzcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790067930; x=1790672730;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6VxrMknAVb1vDWNanfZgZOBYSwjkUtQT3TOXrqHvrks=;
        b=azZmJzCghRPH5Z3NBC7gxyJmJN15nVK5S5BTMi8dcgDJdym1GjaZTZ3DGrG5vn93Xa
         rinSM430uiYLVZepi+1w/mhbaNJ6rWuRzkWfqJRjrurMJoWvOUyScarfCdyfvuXm6MPP
         s0S6tRL46cq5DxpGw5TGsPu0u7kvy9QTCr17l+v1IRJKOZJPkEn4+vw2JPhHCG2mf8So
         Pwl7XbJSVRUcb/bOD2xwZTA8iVfuJugl3eUwPDyBOsPnaHWbhRr3dL0o6boEfoFQWlcR
         etghWc2VF7Nte51bFzLTZtn3Par+cEdQvMAnmPXbB37WGExNnsemiMvfOElHMQlu/bws
         zKOQ==
X-Forwarded-Encrypted: i=1; AKwUvBylzUJwk+AVpfJ4W/4T3tWR+LmpXhRapmAhB7S6YZHQy1MsQATmZrIK0iDPpuqmoHltGyr8xNL1ttdZsuM=@vger.kernel.org
X-Gm-Message-State: AFuF++mI429Hx5k2dBBwGnjgNGgnIi0fXYoRlrNcsuH9fPS6P+rnn3Fw
	xGnzZ3rUpT07lh48Kx5g5VNb42XmxNuScbsh+BIrXtpaAtXuJODwOXIynoGcu4fYbuAv1kOeaLa
	ngC8CNmEy1qgpWfvJ7S4ocQHCd5fGOHY=
X-Gm-Gg: AYBFou0HLbqZC5Gl8TTVfgsUyQD9qAiA4t4f9MBE9rFcXt9OXhtNruTEefNdUovp7r1
	Bo8zTtE+mpE/YzxsTvsG0wIqFcTnvWOohwV18LexHhlkC+SfK6ufe07nR/iPpudQQqd0pzqqtkg
	EX+++IAWbO+LCE4WJFD4oRKcOyP/rbYQNzKBrKtnaUOOFCuzBQJxKWrKUJ5ZtgsuyMsQzYCTjcU
	JEe6z+Wk+zSSE+/EEt/6bWcwJ5HSHFRd3ftWoHMZFPD2aQuVLU6mVTYT/0/uhNB4R7JILo99W8e
	ALgpwwm8412zCmsFGZGRUDygm00qUuTPwLIB3JQfhsFy8IOBhQIwdI6gAQtDN9wL4N12BImYRH0
	h9Efplt5Jd+I7ggd7MahM4E+KC5aS0bkHkJNwrhWiB3JJeeSiOx/aR7/ZsESOamKspBWZWSfAU/
	tJ/Fo5RE3oHITaZ3MdGGe1hzH1N2WA24GkwxVxDcvuhCaLr/Kteh8d
X-Received: by 2002:a17:906:c10b:b0:c26:19de:9139 with SMTP id
 a640c23a62f3a-c2a15cf8ea1mr1261725566b.44.1790067930361; Tue, 22 Sep 2026
 02:05:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921183313.92795-1-hikarialiyev@gmail.com>
In-Reply-To: <20260921183313.92795-1-hikarialiyev@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 22 Sep 2026 11:04:53 +0200
X-Gm-Features: AcwNN1X5O3CnNVl33I3dVh03PNniNtuSKukKjtL-OpPtcpVg5gCiGP8Rn-l-Dyo
Message-ID: <CAHp75Ve=Wxe=2VjuEyMaeigskU=CmWDLN0baFbxwJ54pKDponw@mail.gmail.com>
Subject: Re: [PATCH v2] staging: fbtft: fbtft-bus: remove space before close parenthesis
To: UgwuRhema <hikarialiyev@gmail.com>
Cc: gregkh@linuxfoundation.org, Andy Shevchenko <andy@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 8:33=E2=80=AFPM UgwuRhema <hikarialiyev@gmail.com> =
wrote:
>
> Fix checkpatch.pl errors regarding prohibited spaces before closing
> parentheses in fbtft-bus.c while retaining trailing commas required
> by macro definitions.

It makes no sense. It's a false positive of checkpatch.

--=20
With Best Regards,
Andy Shevchenko
