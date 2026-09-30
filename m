Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1862F3D25B2
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.234
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790795994; cv=pass; b=BH3lLWST/U9c59xe6nx/A+/H0RFXW+HuHPVdowQ1/ZXJcwOBwiwxGb82gry0Aky4uDFPDcAV7b2jKQ5uhb2Rmy6QGi8An1oDxY9cSUlTNR5cTFac6jDiyG6FUmqdxiUOqUO+wjfI1s+DcR41hw4pfu8mwVF67FZuh6Goa3YXkkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790795994; c=relaxed/simple;
	bh=DateFYEM8RUPCqkCJj0bcYedClzNO/Bshld4N7qd/Wg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R+yh8ujfTqosiPiZd+23ppYEgrrPO2493yqkPOe3OKQni+TMjZsR9PbZr/jtO6NNHaDMuk/z2cZUR5GAmkzc0jBqm2v5e0Lwdp+ACkLxnqzcvrD6uiou9fNEzT26FmXL8NfOIAR2ZkR5sXZmfiQhFkAVGZlhuIvuz6gH5YcTHGY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SJ3Sv9uN; arc=pass smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SJ3Sv9uN"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-53320dc09f3so45406271cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:19:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790795992; cv=none;
        d=google.com; s=arc-20260327;
        b=f5uf0erQqtYIUuszPmNsZFFKDcbE4EDWQHfm0RqBsw/pXqx/z5nCZPnUnLOFm8ImRJ
         1zDX4CpZNE5aVJy4CrEe1qQWZViAd+SSEl1ol9IaSGmfD/Su9ex8T1wfjnCrbf1wO6d6
         AtUJMEhrrmcqfejT03HTYR8WKyDDZ7R1RIVz690dCzxdbxp9llCQprMedJABVBQqeUnK
         yXXhl6s5eaijKMxmIkV4PGTwa7oLewu1OnvNDFq1cnuHuC+vLhFRST7/ndlOsCK5GaYt
         hf0NFt8YqMg89ukEryTZd1/25+qIISjhDSW8JLav/GfcUFx/oBDm1KIMyKOyllj7couO
         +dYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DateFYEM8RUPCqkCJj0bcYedClzNO/Bshld4N7qd/Wg=;
        fh=3iSQYj/YcIoxd0B8+v3c3IhIXGxuX/ktMsA08d/EwVg=;
        b=ZH7qbuieh3ajGhK1ll9PsjwZJtx2nBt8tSS76M9xDdd5FEtMXPVAzc+NOXsM0w+Zm1
         Rnhm4oL/qmxj4kF8qHqV2+HvMoxShw9+1yIhDV8Tla8eP0Za/L0pjSgJEDdjHfAzCGAD
         Ip4Cqtp/WV6HyLKc9jGgdeq4QcgN263gZCQOhhiaHquWUE1tGW/3RpEjF4o8IKHXy2En
         jspQc/qVG3VFHj0ZOFstnlj/dKrFELe+EKD0VYmn5jWvsMwrNzG1tI2fxtSDAlg/0gc3
         1e4+3l1W2sEIbFNa3DOg6v4H9vCcpNXe6ttP55nFRXV314HuZK9Y59vNa9RFY1zYliDG
         Nycg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790795992; x=1791400792; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DateFYEM8RUPCqkCJj0bcYedClzNO/Bshld4N7qd/Wg=;
        b=SJ3Sv9uNhnpIWRPLoH7HhGJYsfwfZyhe7O2vcwCPdOJ066HUByEwRFAbMsmDJbklV6
         l11RIdRoDHb6g9zxLwpRvP/ZiUTLsMhREnGcTKN8oElK0/sI2NyApbXWMQ+E8Fno6U1N
         6umLoYcNew4OzosHScwcdzxSRjA2HV/ECca16NudHWFZmGbg86xCbJiO2XS96Oc1aWip
         AvaXWSuY7kwCzzap0eStlT9Pnqb3CdleVCeE6JiIWmdiDu1oR4Vw6U4lXqhVAUtkawaa
         L0lRML+YxexT3M7pN8jQVyWD4r66CHEcBT5MSP5tGPXeLK3AORlrz6kMWvUH0wRtayz1
         iKIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790795992; x=1791400792;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DateFYEM8RUPCqkCJj0bcYedClzNO/Bshld4N7qd/Wg=;
        b=zRNDFICCYEIZeKzC53Wz/z0xtbxBVgwKWSfHKmZxW7pVVo+kff47qfvWHEx0a0weV0
         o1apSkJvl7mI/TVCjE8cQa+DQ/6za6OMamHwaRfrg8XGjc/XFp7evJJBAC3uC7Qh0DGL
         lMPRFqD/htbUGmBib0/4cZg7YZvJWEV1ANK5ZOqhKvGVNNy5K18ibQqzqQ5sReJHB+o2
         soA8vRMOJqkjofWSb/Tfo9WwkJMCXTtbAamJ++n6fHrPCZFAtRClHdFcE+xTz4cUtshN
         jboYnYogds2y3+yp9ZrxSGNj1a/vuEdlmG6kIoQv+s0btEY/oJhzLCJbDulcj6rr7Bdf
         Cqug==
X-Forwarded-Encrypted: i=1; AKwUvBzfYll2Zh3daUU/6XC3UT5Fb7U/lDHW3y0874OyVxZmxWP960qxqzWpYFcORezpE39DuJpW8xMzerHsEYw=@vger.kernel.org
X-Gm-Message-State: AFuF++lgoMmqNFp1A4xJsSiUApkWW1VGgURggIf54bNKiWyLopDxXZBw
	AVQWkE6L0v/TyH1zjwwwo51pUIAfJ+QsQABvo6Rj1fiCQLaMOqmviZuqBEmeI97G2CzdoXGIzza
	UUcKtYB/YeP2UI+S3ZaQ3aptbNL/8IM/l2jc2V5sL
X-Gm-Gg: AYBFou0sss19p0weRZzdAGZEzJbZliiEVN8WSUNGJtWjEEz+lr56CdMCtX+Mi3F247E
	ZQGKjK+fVg/rlInOEUeeyu2AftPCBcS/xmJr8Yl+t/ld1dVe2gh1zlsXNNs/5joVrn2dv17VVdE
	bDVW+qtvci2ukBEaoieU5+ZAMF/eZQEbA6VvL+PJsjX+T+BSXnb7hmhQyyP7bJK51m6aTJ364x3
	FtoFYbRRVDGa0f6EUxNN3lEBnYmULVwkXNjktijcmmDhVli6yy6VEDeElAaEjbiy4fLjAeEVzL+
	9GNbJouwM56AO9Lw1Qx4lM7ZjVgECh+HPpr0FHGDK77FQfQw6FZAN3rpD/GVOS6WWfDLV/unRpX
	qnzLpubkVHYz32ZZGIS1qPy5wBny4l3H3lQTgy8EkZS3Bjpe6Ye3Ip6VvCtijZ3w2iCuU
X-Received: by 2002:ac8:588e:0:b0:533:370c:75fe with SMTP id
 d75a77b69052e-53374be3ee5mr46752231cf.34.1790795990138; Wed, 30 Sep 2026
 12:19:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930181106.271547-1-nicoyip.dev@gmail.com>
In-Reply-To: <20260930181106.271547-1-nicoyip.dev@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 30 Sep 2026 21:19:38 +0200
X-Gm-Features: AclHuK92DSJl986_dvvpkYAOimgT3MaQg3DtlnvZZM1zBmoeCA_G_FvqALGK5WQ
Message-ID: <CANn89iLvY+GUVDQi0HLf6GSes9trxDWq_JRTiSBPTjjLib9pog@mail.gmail.com>
Subject: Re: [PATCH net v2] net-sysfs: release queue trackers before allowing reuse
To: Chengfeng Ye <nicoyip.dev@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, Antoine Tenart <atenart@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 8:11=E2=80=AFPM Chengfeng Ye <nicoyip.dev@gmail.com=
> wrote:
>
> An interrupted sysfs_rtnl_lock() can drop the last kobject reference to a
> removed TX queue without holding RTNL. netdev_queue_release() clears the
> kobject before releasing queue->dev_tracker, allowing the queue to be
> re-added while the old release still needs the shared tracker slot:
>
>
> RX queues have the same ordering. Their removal and re-addition are
> normally serialized by RTNL, but CONFIG_DEBUG_KOBJECT_RELEASE can defer t=
he
> release callback to workqueue context and expose the same reuse window.
>
> Release each tracker before clearing its kobject. Pair full memory barrie=
rs
> on the release and add sides so that an add which observes
> state_initialized clear cannot install a new tracker before the old relea=
se
> has finished accessing the shared tracker slot. Keep the numeric device
> reference until after the reset so that the queue storage remains alive
> throughout the callback's accesses.
>
> Fixes: b0b6fcfa6ad8 ("net-sysfs: remove rtnl_trylock from queue attribute=
s")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
