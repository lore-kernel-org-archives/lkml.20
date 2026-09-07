Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A807D435EEA
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788775646; cv=pass; b=TpvxQhs8/zrWxeVVfqun44zPwa/Hp4bmDEVUVkyUSGd3j+/ubhGmhdyOvgzSMkmDAq4vM3G83QUchJJTLJgrBl7oCTPZMMaTYIfFv7G9j8WgKl3bQWT6IxR8At5rT2t8r0ypB+oKrKgB6p7teYLPrHM73xgM6qdyTqcKcMzb9xs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788775646; c=relaxed/simple;
	bh=li9OHi/1KZ+MO1jLAtKSiKtJhswUzJtMKgd5bNPdvz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gnW4Y89gbnTXZSTiOKbJfwT6HPy/kdpmfJGGuY3HAouM9Nqe/0v3/H21knVx1SzsS/9LsQaQonfAyzsRAM4qhKzUbHIWzDfG9KQbxlVxqCuOieSj/k3IxfgUb+sON1f0CK9rid7fmp6xrAemLnzzYIBcbQMD2KX4Ez1jNux3eFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qua7TdDB; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qua7TdDB"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b159850b16so3302795e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:07:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788775641; cv=none;
        d=google.com; s=arc-20260327;
        b=HCCopJdStW3ANRXfUmMfJjknuaVXdkUAVxaMiB7ai9z6bu+oMVcgGBTmO62kTuRPUW
         fxU8XiHF4K0XBhumHy5aMx70diNtt3SYMv+yttxW7tKM1u9gE3aUHCpiJflrxj/tFPwh
         IyBp4ZhxTTYq4D94ZMoASAO5ENgfEyegNu7fuGVxqfaZxMMMtxSms6GYl4Rz3DPqlcmx
         2LxOh9rHREBesxe6MaN9aF1Usom6egkJlP1qJUEnbFKrome2jL7nR6rPAKRzsPOf2RpU
         fKu7w/c7VxEIhhXVfUlmhAja8ltPKRX8Ul/0SmxzmkpfYe2PmBZvJIUaWJ/lUEH/Cwab
         JWuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CToFehcXgP2N1u+eQHsGtY0ToS/tNrPHiiF///4RSho=;
        fh=9DpvKhdggKN6Xyq7mKOfC0hUY0hlcWmLEuLtg6XaHYE=;
        b=JD/EcMO0WZofOmtXFRn0Wy+ticRXFGYkp0w9DX522Y31lr5Ydu+VHeokz767n0KtUN
         zTXNz/D/yp3etGsU35VwKCmjZOGBfsmp/aqNh25vJ1fSdzABayAEmghJCtQoQOn0PhHq
         IizAVmZ5eQkMjXShr8sSzT9ve0+11Jrj6HrxattZdWkdQxVrBIliNw8iGnn3lzaRt0ye
         v8714GGgak00j4bhAz4X+kIV84m6GIlmA4sZ9pFW07MmuZ28wn+zpcgijeAXTZScVkH5
         ZIYF2qZjWJtZbN90rZG2U6106n6sa/u8v1uiJMuttOsJLEmtP6Fv+PZHsbrzomZOkLYp
         RF6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788775641; x=1789380441; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CToFehcXgP2N1u+eQHsGtY0ToS/tNrPHiiF///4RSho=;
        b=Qua7TdDBmLuJs1eFTUwNH56ekILqaBId2FXMFKyG80r/+4o1KB5Kk3fsccQwzxwpEg
         FgeTiRhe4FJHuRDXFdmLqW73TtaVIdEc6XMMGdUUO/YVmHyGor67Ync33Dy00wXWuEpN
         7LWTw/cCjDGKxJfMnxkbFCLxKWAGZyVvTiIC/r6KD2V3p9JMM0K2159R1nRCh8gfhcta
         EoeDIaR5haLOorgzFKKJXxI+VMklU9vMv9sg60GKRUonPlrSm46KqvAs8C4hGGAO8X1V
         MjDffJhUH8+GowZxbJlcBkO8m2hnyBcD9Ga+aztoCxkDmOPRG5A2pYJVH6F/tuwlujyI
         N8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788775641; x=1789380441;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CToFehcXgP2N1u+eQHsGtY0ToS/tNrPHiiF///4RSho=;
        b=FQ6GVnk2O7OL+JpnkR6CIPorkrDOEVhFjJI/GtU4jrbLTu4rmA8lP9pABbf+LUpATK
         EGCombphvyPQYDKsmYZZesizMYSiDmVXdv5+KBtslcRX1L0TeACus6qO8K6xCQlBFth7
         bWVOwb/swm+3alna9uIY4wNPlapMXO4CA5Ah3JgezjbTBah796kd5knP3+tzXbM+M/Ta
         Oonlo7bAyclOwRs9b4kVn8ri7Qy9UIby6IDpodpXube4Y8v9JEOB46mj5wWcKGwgq9Kv
         o12uaAQk4qduCelIniSEeSJ3QUMXrAhEGRqselpt7NXPNY8ozykMfNTbxkFLELkMpPtZ
         Hydg==
X-Forwarded-Encrypted: i=1; AKwUvBx7Shg/lO5kVEzuj98mS9UBb4ReYrhj09tYma3KfsNc6ujcqKdfqsmUhl9woZvuKNpy7+DVQMQBoE1n4Fw=@vger.kernel.org
X-Gm-Message-State: AFuF++llwLNMxlc2Gp1hWvdyFh5XBmPb4uvj+ybjvSGtM5ihRuhi5lx8
	t4VcAxpt0zHAjP3ivTgrhDWpSNGQlVv8b/rKWdtXU/pL9WnArdOlCoVyivpAxBT5WV2zYL0dNsh
	lU5akljvWQmVWGF6u15M6OgR24gH93ylhWA==
X-Gm-Gg: AYBFou0fOMf9iQruMFfOcWd6RgMCO51sXu5lnKcIYrcvwv964ZEz79qANDMdMh27kyY
	Gd45N59HcAnAa5YE6VBTXeyxQ/KJ02HXZt/WQ5wUA8v2msULlSn9e/3xDv0SeLnea6SZSLIZP2q
	6gnlHW6vTNUFZZfuDe9q1qSmNI+W1/QKL9u2K5yRH+cK9M0rs7fEVW1TF7KKmS7fqpCZkSM5h75
	qVEMDhIPnbOvlD42PzGbPEjeLGsOybsNO2UcZH07DXw9O2E9yJMWVUhCLpjBnLmfihQz7j9EURP
	Ku539iNiAsvfIDtNZTjY5wE5t9VBTuacz7ywuaANP2FA
X-Received: by 2002:a05:6512:3a8d:b0:5b6:7fa:e96b with SMTP id
 2adb3069b0e04-5b616f075bdmr7180946e87.14.1788775641072; Mon, 07 Sep 2026
 03:07:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907030044.3649349-1-liubaolin12138@163.com>
In-Reply-To: <20260907030044.3649349-1-liubaolin12138@163.com>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Mon, 7 Sep 2026 19:07:08 +0900
X-Gm-Features: AcwNN1XT1dhp1-gThFirTpL8jAO-9ay29AKWExO5r7pkZClAHMltwKA7PIJI3Ns
Message-ID: <CANFS6bZLth9iSJWt7B5QaBH-th8HxMXEWevO4vPjMnFw09YD1w@mail.gmail.com>
Subject: Re: [PATCH v3] ntfs: fix error handling in ntfs_extent_inode_open and
 propagate errors
To: Baolin Liu <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 9=EC=9B=94 7=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 12:01, B=
aolin Liu <liubaolin12138@163.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:

>
> From: Baolin Liu <liubaolin@kylinos.cn>
>
> ntfs_extent_inode_open() has two issues:
>
> 1. When map_mft_record() fails or a stale extent reference is found,
>    it returns the non-NULL 'ni' pointer instead of an error, causing
>    the caller to treat the failure as success.
>
> 2. For allocation failures, it returns NULL, losing information about
>    what actually went wrong (-ENOMEM).
>
> Fix both by converting the function to return ERR_PTR() on error, and
> update the single caller (ntfs_inode_attach_all_extents) to check with
> IS_ERR() and propagate the actual error code with PTR_ERR().
>
> Fixes: af0db57d4293 ("ntfs: update inode operations")
> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

--
Thanks,
Hyunchul
