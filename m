Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F95743551C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789126589; cv=pass; b=DsdNNI55fUWWLwEcuISieMxTaeHlVzyjm8RbzT6p5jLf/Tb23jpd9mBiWfkTLA4sft8qlccWlx0DdQg2mGdDk7OSM+eQOyVEz8areoKwo2KbmvsDc/ABoDoU5oX6uyHav4REKx0lFuoaS9gBBAV5gzLW1247g2Ag2Jonlv2kudI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789126589; c=relaxed/simple;
	bh=dlYAfz8JIaoF6dqy0I64LhGBYYDTxZis2ec/p8KwdX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uQRTrk4kBqk2oMmYigDI5V97LuT+mT1cW0FAQZ7//Y72WDi0sVQrrnkUuqEIWP44m5tNV6jngXaFz/yD3J95jBnJfmQf8z24Y3AVj2AgivoLAx44PSo56RAbyZ+yo2nHsd0xeV3+iU9kzMRFk1C/PZH29uk8vgZl0rrZxZuZO1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uUhuqgzd; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uUhuqgzd"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-530dcadb4f5so1867731cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 04:36:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789126586; cv=none;
        d=google.com; s=arc-20260327;
        b=EHD062limIAGM/9cQHk2WfGemTVPR3NULKPtGSizRQy+wFKPSD3jLh1+PMut28rENw
         pgHc5DBNxZs6gsf6kQxaHhvbZ3TYqT+u1Pq0ap6FwvU5EuoAg7P/RKVGMM+nPbm5nmYa
         WgWOqCeTwmoiAblLWVbQuz5EoXZrSFP6460OzXkPVdk9ZD++Uk/9ljVa5oyDdEsle76Q
         UBU153fNLvR6kk7OpbrhbuFLe8R0rSjCfOOiLFx0AzbbHkQKQkloccPwVaeymzVDKdjR
         rD99EWmZjC1HwT0wrrKJNO0MRJTztwzC0iycqJBfQfE6GGb+IuVZK9nSeWUl02CtExpb
         oavw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dlYAfz8JIaoF6dqy0I64LhGBYYDTxZis2ec/p8KwdX4=;
        fh=B+BksGSeicaKQ+FR709nmcBfvT+kD/R+9FNFDT2yDG8=;
        b=C0L7jE4fmIl5Rv2KpurxgXqcTCG121qNCWjbbTs4OSFlDis3Y1LniyiqSJOv6zRVZZ
         1BRi7kY0Y3GDu84FtP3XQoJzOrs2/6RvyCbfUhSB9MSOXenJM/6urWloplUh4YdKPkNY
         QLHyRmUQydHMCUUbsO+mc8R6VMIRYu+rGROEBtYoclUBOOPR/XoED+p703yrvFwnd0Dv
         MTCoX3TGUAPiNDEjeseJNRcpFOSZ6k7sAJvewo+DH9B1GBYnlQYkdl/A002nMn09fmYH
         7CQlC5F+z86S/1sIMi/mrQmcW46J7eUHSXFHpikccUNghX1nxl2lsDybN73qqgfHh3+2
         Wb/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789126586; x=1789731386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dlYAfz8JIaoF6dqy0I64LhGBYYDTxZis2ec/p8KwdX4=;
        b=uUhuqgzdUZVhsd97lIBCRv7aFhlZ/EDK1ieS2nPzXY1pumfbwLMJF/cQ/4KfJaEWL9
         gz2WSH1+YzcuXLFEq5VX7PTtrYMQDL452RLet4hp1wDJtTL5fXdQU7Zhn7OjVEoOAWB9
         tg8MUNPO7GIiRAmBpESnAJSYXShVZivzw9GfNaHlRR42Bck7yRQim8SroqTOZK9uo16+
         07GP6TC9lLQfJqXy+Fp0APPaFMANTuKmtZmwMs2T4ZDcMp49nOUB9R0lIGJvYVGkmlsV
         NATZvrot81qgD/2PDVTrFCx9jOeojFVkFBOPXrBVcvrOwBq0Pt/LHe90Z7t5hku/M8Qx
         d3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789126586; x=1789731386;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dlYAfz8JIaoF6dqy0I64LhGBYYDTxZis2ec/p8KwdX4=;
        b=YsQDLqpTyHltd8LEj4HOLYIcO/2omg2mu+4KhO5jPmnGM0A6431fMg0UOQ2xx5AdEz
         crlK5mNhie1oNl5l++jQ+n1NH0oW284rJVfCHoYCb8ggfh5NPqMc/vkiOwvUV3Rky1FD
         l7G0OaLPuBCSpw12bBH+Uj6a7lkhl2NnzyvxHu30KDMuIUGFcJj3d+voB63WFE4wrcg7
         1FCWYBQpl1uOUeuRjtOznN3hPP96EF8UV5oT6/PNpVB+PwVMrht/LWqRv+3/QAZYbfC8
         WyY/wgKSzRXXM88ikeo26spRThgmt2Aju0IkSqSJS+NRZqFmi+SPvX8ByLZ/UA9m62G3
         Ekwg==
X-Forwarded-Encrypted: i=1; AKwUvBwFyIBkhlHmpB3vlkZ1+Oa+2n5erEUUe3CMbA3RKnN9g9gNnR7I4YOaw5tiBVQf9FQdhcVvMRjKYIsPXiA=@vger.kernel.org
X-Gm-Message-State: AFuF++mqHe5dSSYXbicDLpnJmJj80DrzfpqZtZEKiW+ipe3MMWZz+GpF
	pDeyOMW6czaTeP35mpTgLLPT27dJ7IKOsDqmnPSKJDOJIKgTwi7lBZ543M0JOSO4wE6AwxLMzOY
	oVnEEuphTn8x3aIzzSBXbT6G6eqcOveJyae4mrbtL
X-Gm-Gg: AYBFou29/7ktcl5wcaNLLkB2sqSn3jXN3V4fpcBS/X4FdYebxs2PEVwXGchVDYgD41n
	Szdrb4COZcRqCiiywU54YPGKpINxD2f3JcUlCbT6xdvEbeIriiOm30HxJxkAJCg2K6R0OXhFWJo
	3NV0EcfoV6+A2439YgL2sVcxBcKHv/lLJJ879BMJngKPQgO5xpkH1NkEBqaMfEBdw26h5Ujm1lu
	1KwGJXQCntfmX4IpV03lKuZedEMPnKt3Ek0lhu8ur0ZcSnLrtdt2TlpPpcShe2PDOW8tfQKPFP3
	f1kF0EgZAW2ofO8J1VydktnkqDRVVHgbpzySVaZ+LEaXrYlDPEwZTWz460sEvLkJyEJ6Y20FkSw
	XTOtzm/I1uaWDQLLiKUazNg4Cj8omcXJEPlG9HcRA8iWSWYaG+XXsE4SQD3iOHx5k8uc=
X-Received: by 2002:a05:622a:598e:b0:530:7e29:bbd3 with SMTP id
 d75a77b69052e-530c8239c5fmr56322481cf.0.1789126580861; Fri, 11 Sep 2026
 04:36:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911102418.157071-1-xuanqiang.luo@linux.dev>
In-Reply-To: <20260911102418.157071-1-xuanqiang.luo@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 11 Sep 2026 04:36:09 -0700
X-Gm-Features: AcwNN1VlD8vfT-AQMygbfiq5AMX4J1WQ9HGjOGKXWFyqcwIWdH1u7L5bOueS0HI
Message-ID: <CANn89i+GwOcPgGLv-7uWEhh4ZG33s251UGOjJmGagzYiVqOAAg@mail.gmail.com>
Subject: Re: [PATCH net-next v1 0/2] ipv6: make IPV6_FREEBIND and
 IPV6_TRANSPARENT lockless
To: Xuanqiang Luo <xuanqiang.luo@linux.dev>
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	linux-kernel@vger.kernel.org, Xuanqiang Luo <luoxuanqiang@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 3:24=E2=80=AFAM Xuanqiang Luo <xuanqiang.luo@linux.=
dev> wrote:
>
> From: Xuanqiang Luo <luoxuanqiang@kylinos.cn>
>
> Move both IPv6 setters to the lockless setsockopt path.
>
> Patch 1 handles IPV6_FREEBIND.
>
> Patch 2 handles IPV6_TRANSPARENT.
>

The changes are fine, they simply align IPv6 with what IP_FREEBIND and
IP_TRANSPARENT have been doing in ip_sockglue.c already.

However, both patches touch the same switch() in the same function and
do exactly the same thing. Please squash them into a single patch in
v2, no cover letter needed then.

Thanks!

pw-bot: cr
