Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B31B4E50D1
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791553426; cv=pass; b=dF7xkW6J5uPJ5H8wL1Eu46pS2gbrm2NM09PMDCryeUSQG58ySPqISjLq/4keaw2rSPJ/poPwTEcv6yaJooDuZHr4Lu5fnZb5dz5PQbVK2A1djUJWJYtFTO2l1iK3zarJAwTohKFEo7L48t95Kvnv3RAriu8z6S2Xl8HRnxlo9AI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791553426; c=relaxed/simple;
	bh=LQYO10lBY8YucsXcJTd6r+9tll/gYfDwC9yXCQh2QM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gEAHMTyDca/3kJz6sauXFF7bdheUeQL0khFNUh06ImxoKznyH/TMc5cYfW3tpF3C501HCnp4S2dcBoHRREaRu0XKgHq7YzaU74uujfk7Gmu2qyAfca2QoNbqiPNNv1kqPBgiLeX0tL9IiWjtLFGRaccNKkjtR3HWjPCoZZGtH10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=KK/LlfF5; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="KK/LlfF5"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-354ba08cfd1so680671eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:43:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791553423; cv=none;
        d=google.com; s=arc-20260327;
        b=XuH9N4Z5pm1nI5/UU3uJ5nwFzIStxIcJHYeOTV/Lmi9njLGEHOzLx/cirwkVJbdoT/
         aCqh33zEW/Q3/CxgGxCZCcvQI/jiIHV3SuPCzxOtM9BcVx3mGcARSW9aH0EiN8IjyHMw
         P009NOJCSE7EsfdKilPWJw21YS1X2DLcpgEAR4WYCSoN22p5VK213EAjU/JE24OifXAR
         +Dy96YuU1wuTh/PlbafS1P5I0trTKMcbbyG095gExKP/NWWGnW3QLOdog2XPb17LxJED
         omekjIEbOvxZTwbQUU96sPYf/jjmlIc2qpAZYogdZu+Lyi8YRPdThV/OwtzvcxnGUT2U
         XQbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cr53QXzLPPnzzAYL9+Ow9RuREkmHHvveZLDzlgyx6as=;
        fh=qOynfICJDMnLXkvbadFq66XmMW19yVnls8f/X6WKCCs=;
        b=I5N8rygU3hbW2eTxZtYE/CiC6S3b4hq9hzAK1gO772GATnfJVr3P2KwthrRfxofecH
         uU4fbXK5jMUEkqV8JmNgSG0idFE8bhegP69/qAJQEK2N41uOLv2qs896yun/8SQMurQx
         6iCayPaPNL+Qx51ZzEUx46nDCmqdZFqKs77OmyNOkDxmA6LUOg5DFr0lIcZrmjx+0M5S
         lRuvbMQ9gAGKFALV7GVENIr93wOfOyRF+X9e3M6fWtfeHQrD2y6n9VtjfCF+K/DMxJVN
         BE8QsveJCZYFKu/+fP2YC3zvzAAdBDkmCWyh+18t/zVE/DwVjnA+1sFLbQn6h0drHuLL
         Sudw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791553423; x=1792158223; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cr53QXzLPPnzzAYL9+Ow9RuREkmHHvveZLDzlgyx6as=;
        b=KK/LlfF500M9HKvvEgwUZaMtwopK0KJsc7zlInv3lmgORbkZwrgh1WDGJoxJHLO40o
         pHVo62d91gMPpJ3soaq1BiMrYr0AizMjjPyqCIBkIC4w7gjHvTfLXybRAUnI5Po67+ie
         n137UHeoo/KUHK5CaLCeN98pBwDFobrzY5qzA/8N0CnbljkinGekpq6jiakTio/VeKRu
         uZQBtUFGx4xjW+G3Qg29Fz00i5EgI3yHysYnN5n5UAl/a272zYo6fcBrghJk14YL9/ot
         Spbh2FcFdSnRMUlw5oad4QAPXxpc2UICU9dzngX3csn5Koj5Xd9VcWaEv6Qq+EplAiAf
         BntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791553423; x=1792158223;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cr53QXzLPPnzzAYL9+Ow9RuREkmHHvveZLDzlgyx6as=;
        b=oIuSolpGFT7sJDG+zjKZih5WIFt6ApoV77g1vM+H4Sgyg00YwBDtxGqoVzbKrG/lJb
         3OVnh38OQ0O6zl+10xg3lHhRw+dPV8/bViJkIRiuU+P3xFEn5VnuS4t02ks4kGNeNvau
         0bNFSex8f/fK6MxDA0Ku69kKiRgObBRSloH5pkS/7TyQly4lOOxwIh8to9qZChi3sRPD
         zy3bxQMcxBwwjan3Kc/hAr+LA+/neqor2JrguXH8IcdEmzNeOgdL3HSr6IdcuvKsUTXm
         exDl+QVgViE60rIVgfsdz1/dYaBoiiKffBYF2odNKfpUKNxtw069nET6J34MghcpZ3UJ
         suMw==
X-Forwarded-Encrypted: i=1; AKwUvBwaCzErYC1uCdTCDInMfW/MeFV5GPOC2GMrJhGPM42rWZ7+mPMUyA7SzX+0cpBCNFef3FHlpjYGKAGjI0g=@vger.kernel.org
X-Gm-Message-State: AFuF++l4//aL69eMsGD7USUpeAY7FpoED2M319cN3B+ef3Vbkgn91GcH
	HTnjhB48SYL3mdut+L4H+T4peJBOAIxM3xfh1PjH1ZJpErf0HbEZJ20LCusYPLkzlSo2fFvUzeI
	ucBVb0TomBOn6bZA3kI/RNtvERXnJPldtWs4QFtt1NQ==
X-Gm-Gg: AYBFou20ccwQUDB1RyTX25Zwsz9VPA9i8lgyw6Sk64NqpQb2TacFs0eUyCXlu7cwd9d
	GDJByiRc49x1X+e2x8jJbVisK+4Uu9UClY6uSz7Ee3+DRhA3pHUsykdFXJiUlfZ16LfUT9/D2z0
	Lwmn+RPEQz2rYKQQLLqmYkqLH4w4V8DqP7Q9/r3bjzq7VZ1a5ysVDauAPKGhjoUKE1ItSD4Us31
	mg69SX2KavXaEcD8vI0UIXOMhrynE+ZPxcvN415Khsgw/qAQMfmazwjDlfNYl+gqJeMJzxYDlLU
	aayysn8wOrPTQutd0ct3ODaCpCUAB5/0rU6Kao4qLvLStYPAAQe/U4t1sw/fX0n+vaCAPIdElXG
	yZWfcTWk29hfPcQ==
X-Received: by 2002:a05:7301:6e98:b0:33c:e74:4624 with SMTP id
 5a478bee46e88-3537e112919mr2778982eec.27.1791553422908; Fri, 09 Oct 2026
 06:43:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008-b4-pskb-pull-tail-drivers-v2-0-8f2bd9bee138@toxicpanda.com>
 <20261008141131.0ac356dd@kernel.org>
In-Reply-To: <20261008141131.0ac356dd@kernel.org>
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 9 Oct 2026 09:43:31 -0400
X-Gm-Features: AclHuK9i2kH_QiKyGXflCaQStHSk6ronnlxME5kUtzkQ0rs0GpgdrjH4gnmAJRI
Message-ID: <CAEzrpqfgBrvwy0Q_AX8X1s3ogq3g1U=JmpqHAM8QUmMHAqWPsw@mail.gmail.com>
Subject: Re: [PATCH net-next v2 00/10] net: stop calling __pskb_pull_tail()
 from drivers
To: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, Mark Bloch <mbloch@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Manish Chopra <manishc@marvell.com>, 
	Rahul Verma <rahulv@marvell.com>, GR-Linux-NIC-Dev@marvell.com, 
	Shahed Shaikh <shshaikh@marvell.com>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, 
	xen-devel@lists.xenproject.org, intel-wired-lan@lists.osuosl.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 5:11=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Thu, 08 Oct 2026 21:02:47 +0000 Josef Bacik wrote:
> > v1->v2:
> > - New 1/10: skb_drop_empty_frags(). xen-netfront, netxen and qlcnic
> >   relied on __pskb_pull_tail() releasing zero-length frags even when
> >   there's nothing to pull, which pskb_may_pull() doesn't do (Sashiko).
> > - xen-netfront, netxen, qlcnic: call skb_drop_empty_frags() after
> >   pskb_may_pull().
> > - skb_drop_empty_frags() checked with a boot-time test under KASAN and
> >   kmemleak, on cloned and uncloned skbs.
>
> Please keep in mind that we ask people to limit themselves to 15
> outstanding patches per tree. You have 18 right now.
> (200 active netdev contributors + an LLM) x 20 patches =3D=3D insanity :/

Eesh sorry Jakub, the skbuff BUG_ON() removal series is the more
important one, this series is the followup so I can finish that work.
By outstanding do you mean per-merge window or once I get
notifications for things being merged I'm good to send the next batch?
 Thanks,

Josef
