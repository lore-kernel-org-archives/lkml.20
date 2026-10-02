Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E4046AA6F
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 23:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790983811; cv=pass; b=OzE4dBlLvgq1o8Xk4QMLnp9UWKDolHPEJsYCgr3Ub5S3F30JbOjT5JhzjBkwUnEheFXTPPoqmzN90CiJzpUAzoV1+rURt+KgqaE//9Qo2kY2EOsR8SeDXocCqW9HTKryCxjCBtU3yGq3Y0Kr28u2LKnrDBpH/MNAZBNPZdUuZzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790983811; c=relaxed/simple;
	bh=snqRonrcNq5P7WTqs9GlYErkgGy6D6z56m9XMyLBhs8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ovWR1xkHg5U2nL6ULPQbHZkzRCWRqCouxEC+tKY/vhMm2XEZGVl+Gv90/gDUTFUdRhGerbtK/Jw6FT2jHHwd1n52OcD7BcvWp7YqFEk0eUO+uiixCWU5G2hC0/WGZM6uuWlGou1VfKT4w9Yc3QXBQ386985C2lKfBSGntcsarO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ThgtdGLb; arc=pass smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ThgtdGLb"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93e55db58cfso1315085a.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 16:30:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790983809; cv=none;
        d=google.com; s=arc-20260327;
        b=Lz5c2KvbAKjNhRtKVd9Bhz7T6z39r5l37JJ39J5mLTW3N64AwA6hkGTAxWse9lpkXl
         W23+EL94jm3SjPk3uPm9qVF5mtOPEo9gDdIMen5hRfBBhHxyvb51NRwwTR/TDds9n5Ty
         5jZBaWlUQOBVprmWDo+PzZt+gDjTrUp4Q2iw0z/XM22kB5VlEVQ4wNxPdXkd8VsXyiDD
         UIYoXYLtesXdXGD36Yp+xskiD8ST8ABz968yYih4biJyCGznShWW8kYdzCckyZZcyrzT
         FFv698JtGFRSM8KVbOUJtd7Sk7QoRdf3lQ/o12wSF1errdotD3kjiezHhU63gB4CTFTE
         L5CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Bovas2WAEGD9Xsa1cngl8uKLJL1gfGRL2y54+LLnPkg=;
        fh=chLGFjfBBNdOEcnBEEZDmTsztP6uNKwfWGjUI9GQFqQ=;
        b=iMtr+PpvPqbZnzswjLV/+0Fy+LZl2oIblKrO6wGu1szk8kbbA1/zcXqSxAFoVXdboh
         DGZq44n99F4GIXnY4S+sBg+iqnp0aqR7ilESw5ivzP/+wiNZFDsZv4Ot3pegVSCyolpV
         D0nrnYWKEnPoF8HzH6r1IjB+yaPscyrSW4Cc+Zu1OLuaAzOYnvqeQzrBtKwUDKKSSU29
         TT2tYPG7yx2L5HdKp47sTwyuNjH3nhzWlnRrty1bKVMs2ck6ToQbktysJHwZax6LYwST
         Gko5sMOX4g89vNik4ihBJMb6DBWl0D1z2JwLcGHuHKbcYQni3QgXwkcdl76nauEEf6FT
         k+Xg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790983809; x=1791588609; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bovas2WAEGD9Xsa1cngl8uKLJL1gfGRL2y54+LLnPkg=;
        b=ThgtdGLbjSS/19VNGE9inkEYExs1vtu60gAuUZ0Xsjm1xkJIRq8s9BvM1r8//t1tmh
         8K+kFvIa8MlqDbuWOIZnMBMpClflIc9mm3aGZRm2fMmdE9A/xs0MledfePOYDUzGqNEK
         pTOfIcXOGgj4iBxm14vCough+b5LZr9iSuAqViBsNxOIU32NlPhX4viTeJesOF7XuxrB
         eSUh6YTIyqR8jRXBCXURnbm33kNKwDiDxOnIqPKOq65gE7I7LMjyTaAJ8wDWxEle3pWn
         H9dIjM4hkR9mn2bI1dO4/P+HNeFESb/Yq04Pnm6a0EBhJdcfsV3R9xJcVjTmZAj8WZii
         jq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790983809; x=1791588609;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Bovas2WAEGD9Xsa1cngl8uKLJL1gfGRL2y54+LLnPkg=;
        b=DnkQkUxD5v7DwHewkyAg9ZGbQFhwD0N8d6NpKK3Vb7wQ6Jo94GUQ+WYJvmUbOSMYtl
         leuZVyvMbyrp7ckL2ZIUtR99jfYwSXkX42jepd9eqKxxMwbeJ2353oy8u4WiK4fpubtv
         7v4S4gKkjSxNiNOEZveGQLm9VTxgxWObI0pAA5yW/ObE4HQ6sOSMCOSCHrPwd0NAsIXr
         3IKkvbpUfEi81oHGhJHlPkA/nyjHxM4TtnKYl85++8ZaDCfqOaWojDufzXufxmpXr4c6
         3uH7SzMA6+xEFpnxCeu7zFJo3ya0G3jVI/EthH/1GSyLvXYYRpkqz+V0+rcQWYlpMWDW
         PBIQ==
X-Forwarded-Encrypted: i=1; AKwUvByH1Ka1PbzZBnp25EhYLdsTHLB6CYYjMswKVyexBezaDRhfjG3ffX8bt9tBWj8xOCvJcEJWtZlG6XWUrNo=@vger.kernel.org
X-Gm-Message-State: AFuF++nH2eohi73FJm0uURtUgF4Bg0EXeiyXrlUhU8SMEMMsXS13hGLU
	WaDbvM4l5qbKbZTqgB5CYZ8ZomJH5txoDw68Vf/SWksBeiwD2GR7nLkXbs/LwBTOXOQ6Fa3N+zi
	ITxdyzJf1B4FTurndamhgf/xi7MbAkvc=
X-Gm-Gg: AYBFou1KeECnQpkblUlHzJgfj8B85BN/88Fnsh0d9XSFmV/qps1xAkpmAlYp7/ho09y
	+5FYtgWVjexqOZhlnpTuB/hXMNkDl6i6IgNP06nRJGv2hYAXp2RjzbJ2JKB7sztigapD6TEhger
	l/Mj9Kl2chucV+g53i5KLmWwfyp3HF/6FssmP9gNRrPgxg33O2h2BZAvyXb6zMey09a3Lko+L5M
	8PEDhP2vaKVa6PzNyuW8FwpHyeB9W+uC5t6Hd+R/jHBUyq7LSgsK1SJZmue5slMdCQ6r766yMlg
	rHhQ4OFZDXzSrXlGa9JZHkryOSA2cJSCQUQ1s7ojaF2AN0QOPs6kC7EpDg/f9yECLk5BgSwoC0E
	y9PciCFrtpMe6GdhK5/DdCpoj2VSM71Fh68Dtq31KGg==
X-Received: by 2002:a05:620a:172b:b0:93a:2e8:5afa with SMTP id
 af79cd13be357-93e50feb9ccmr188518785a.30.1790983808980; Fri, 02 Oct 2026
 16:30:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002212833.9674-1-fzeruhn@icloud.com>
In-Reply-To: <20261002212833.9674-1-fzeruhn@icloud.com>
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 3 Oct 2026 09:29:56 +1000
X-Gm-Features: AclHuK9rjOUUMpjG387IHnEilLqBy4AfDp78Y1XLf07vnG-EkqsHFL56vRwAE6c
Message-ID: <CAPM=9tw91hPiAfwRP=y6Dr=CFgYboO+Z94_1dVwt41exGokj5w@mail.gmail.com>
Subject: Re: [PATCH] drm/dp: keep MOT set between messages when no_zero_sized
 is set
To: Finn Zeruhn <fzeruhn@icloud.com>
Cc: dri-devel@lists.freedesktop.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 3 Oct 2026 at 07:28, Finn Zeruhn <fzeruhn@icloud.com> wrote:
>
> When aux->no_zero_sized is set, drm_dp_i2c_xfer() cannot use a bare
> address packet to close the transaction, so it clears MOT on the last
> data packet instead. The check only looks at the position within the
> current i2c_msg, so MOT is cleared at the end of every message and each
> one is terminated by an I2C stop.
>
> This breaks E-DDC reads of EDID blocks 2 and up. Those are read as three
> messages: a write of the segment pointer to 0x30, a write of the offset
> to 0x50, and the read. The stop after the first message resets the
> segment pointer, so the read returns segment 0 again.
>
> On a Pimax Dream Air (three EDID blocks, native timings in a DisplayID
> extension in block 2) connected to an RTX 5070 Ti with nouveau, block 2
> reads back as a copy of block 0. The checksum is valid, so nothing is
> reported, and the connector only offers fallback modes.
>
> Clear MOT only on the last packet of the last message, as the commit
> that added the option describes. With this, block 2 reads correctly and
> the native 7104x3840 modes are listed for the Dream Air.
>
> The same problem was pointed out by the Sashiko review of the patch that
> sets no_zero_sized for all DisplayPort connectors in nouveau.

nice catch,

Reviwed-by Dave Airlie <airlied@redhat.com>
>
> Fixes: f0ddbb1eed18 ("drm/dp: add option to disable zero sized address only transactions.")
> Link: https://lore.kernel.org/all/20260827015758.0B4FB1F000E9@smtp.kernel.org/
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Finn Zeruhn <fzeruhn@icloud.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index 488fd123a01a..7676285c19f8 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2192,7 +2192,8 @@ static int drm_dp_i2c_xfer(struct i2c_adapter *adapter, struct i2c_msg *msgs,
>                         msg.buffer = msgs[i].buf + j;
>                         msg.size = min(transfer_size, msgs[i].len - j);
>
> -                       if (j + msg.size == msgs[i].len && aux->no_zero_sized)
> +                       if (aux->no_zero_sized && i == num - 1 &&
> +                           j + msg.size == msgs[i].len)
>                                 msg.request &= ~DP_AUX_I2C_MOT;
>                         err = drm_dp_i2c_drain_msg(aux, &msg);
>
>
> base-commit: bca45af5998a05f34b13a2ef11e639bac9c62643
> --
> 2.56.0
>
