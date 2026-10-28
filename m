Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793217564;
	b=umzuRwBRiKV+/R7GHsxov5NISsb/mF2Cm+JZ4Dc7/fAT7ToEsMJDlitt0kDUXxi1E9zZ
	 txFtHxoPWbqj1ts2ABU2aiIOosPZ2hqTnzuPwnpfwDoPPDWsw5kw5DLuh31b5RRAVD0af
	 Fm6utMn9hGWxQzBRdmGdabEWVqAWkK44f43G70LPzke0ybncOpn8xcT5hc4N0+0PKBJOD
	 BYlD+D7ZEZOZciIy4UeLBKkz5fbHB7/CLBj0XSB4aDawITNnN+DLLuMyNe44ibMV3DLWU
	 fv6/E5KzzsaFH+jqQAEQ3VXTKmzD2AZvwYh/yrAO9hqo+DIg7qZhbrxbEuhQbz3UZFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793217564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KNPolz4ZvstX96ia0adxYWJ+Q8YCwfoUsBDxmY4GZ/g=;
	b=PL+QV7wFKebglLthES8jyOz655HSbaqI+1/n6n3G1HC5oRP6a6XGt/Cq0YKoybU6jGrW
	 B/wBPqSKNV3wCHbahAcTgyFw32KGkiNcjwYkwC9XpyRwjiao9ifqCq8xiYya+EKLmfXH5
	 QzLUyFs9HdiVMjof2ZVhdLrzArmSt+H0rWF3ll9RWeJHlBl4niWMIRLKUPDOn+XNv31cV
	 zdPjsPwXCcLtC/2VSmpH3SMpQ21FcMM/cx9b5Rnm33USR5m1mGn1fySpgr6MF4SzxxfJx
	 38BnPi6kisRYKyn5GyhmTK4qCKCzNqLdFwoAf5gnKlWcDZ+R9HW4/xwdTdrys+PT5bw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gCjriWQL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED594606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:59:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED594606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gCjriWQL
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-535f598d126so8831cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:59:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793217563; cv=none;
        d=google.com; s=arc-20260327;
        b=ejQVMFBVlfs2vvnbG6F1NDTUJ50vGS4/BH9hhQ6mjt9O8/l5XjKU6SOWfmoD1LbEKT
         J92y4IK6cPd/OniRkxMJGxI44FvXcF4dDyooqdPl7iuWgP1Z0ITLa5IBaY51ipmmFH02
         By0lK73lYv4T1w+Zk4PMomIXtx1NHg6HokbkXGMi9/eLcRo0uclp+OczZPnsmJsoNF4s
         OdLQVAhUA2uJrD+B6TeyXD//3Wy2HVJyYyGMvwapRXqe4w2oAebM2bbSMMs4hqNWIIvH
         sI8NmkbyxytP9P+MtSwgGW3t+JRCq2mWDMkM3AiLvh/D5vOKluD8MzCluBGG6aY9Jg8s
         TR9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KNPolz4ZvstX96ia0adxYWJ+Q8YCwfoUsBDxmY4GZ/g=;
        fh=M0tP/nr3g9KPL9We3QVkooe6M7h/T/WVaMmdKBwNBu8=;
        b=NmAXdUTcMhGSd/aeSOhsFDM5H5y4ly0UsYCpUwJsaRqJ6tEXZ+aJNxsNaWQUPcYGVQ
         2127hSwB3deBtyL7YtwVB6r+ywxyqB2gpM41zVK6iqKM0tA4o6GIBO1TVGutfvrFtG+M
         AHsPp6B6gi+xvXdjlMYOpJUpxXBzzYEs2rulQsG3gWvBo4kDkSnzKsP1muIQtEydWqxj
         t/V904UzxcXxPSeVcqpCJ938Z4H27VbiK2IC2uVqUBEjubEB8BF8+HWyDqN5MllOzgoF
         2LroOWpzuev40cHCbhEjSbBP+z4uIh5mGSAxA9vt2VCQUMjRjfcMoiocr3YWzmjJlCkF
         nQ+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793217563; x=1793822363; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KNPolz4ZvstX96ia0adxYWJ+Q8YCwfoUsBDxmY4GZ/g=;
        b=gCjriWQLQo2QvHH5JTfWBFdwWXcomYNyjYW7ZcE4DfNTnnabubGbcuv5TLXSpg9Cgc
         WX5X8EXcCS64I8UTPo+5tYP1xFIrho21VEn5ITbIPcwa5MlX3TNi2HEUH9xAG/uIh0p+
         /CFb6qZJ28eo8GCSMNw6be/XK86w47lT+ZGGezFfXnuvOGdoWMuP3bexz8+YZdjw63Gg
         BiD5nkw10JRLzR/s64bohuksvrG8P3Eqhk/p/8lpvPVBBghyvYaWQjQbi7rtyWc3Kz7B
         pFh1x3lH1zeYVdHOjyLbVvYJgYgUnAOIrVL0E0kuocfo7/urV+TDqxqpa/APfSlLh9vL
         GC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793217563; x=1793822363;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KNPolz4ZvstX96ia0adxYWJ+Q8YCwfoUsBDxmY4GZ/g=;
        b=ihU/wig3eTLbIZ+zwKtDJv7cuNJe/g2OVlQIIZTocP7jeb7OVTekrc8TJ4xV11rmkf
         ryR52rKg+6XblpLD/FfAI8XL3yw8rYu7wT8Uk4bRU/onb2vLCb8sP3QED+vg9wzCI44n
         zd7Xl7kzLC724Wv7ZsqpjInIemvJUPIZF7I1mlbTmlzGXKBO3xVar6k459M5jVCI423g
         CAjNkNbgIOkCVsPH/BC/OmQVnxp39U535mjjofTpjUSTAdDlgQNEwjDvSwjI/4iM2X6B
         yqeufQp5+vKDmH4ECeDJu4qfagEZCtMPsbtbAz5nfUwCbX3wgBZwo8dXHZbfuyEtUo2e
         hWWA==
X-Forwarded-Encrypted: i=1; AKwUvByj2aWy7GErzHfn1pRo7H/FPeUzudTRjCGyK9Z8LJFQngZKtx28FsMw9MUBT8B/uFstzjCLaWUtsMjnQl0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+ru5Dz3e5ZbXR6YxwpL56q//ZuynkVVpVroLhYGViFzTfpDO/
	VSbjtBiUU1IFKS8FA8AaK35Vw/Ns6lnIHcSJbSnQdyoFfldd/edpgG2qWoTzl92LXqPbMuOnbHB
	LuyFe17JuE1fBpwpC7UgygEKy3BxJkDIavSTbrOSt
X-Gm-Gg: AYBFou0sdndAN2UjxyMjGWx763GuhchWiRe/WQ3b/TSyhFF0VI+EMQxhyd2Zfb11mMj
	OR+sSlTAhh1HIAG58OxtKZbBQc1LNTKzffXJeAUDhySwhXIssXcYK5lPL5O9NGb+baBakvt9GJc
	MGH2iwePohVeu4iXW3MMtOMD0OqIXY5P//NDKQTHK6xFgGRICWVipIdPZukW+UKndjtbWdUruza
	XC1AD9PH81UbDv5zuMEuW+3TSqTmYYdlt2Zvwv/ZDMCtTOOTY2+sw8HNgp8App/7PuqbN2km6gM
	NA26pbZA6mV75swSEAp2xe1DnWcEtWuD89PC9iQFMFziqhyWJxezasfcp/x/80jbZwz3Qf7vKCj
	4zcqATnrXRv+DQsMRwGtutpabR65fzEb3rWab7ebf862CRt0JWiki7j5cRWYBbSXk0A==
X-Received: by 2002:ac8:690d:0:b0:534:b7b2:634f with SMTP id
 d75a77b69052e-5414d92c15bmr762701cf.8.1793217562021; Wed, 28 Oct 2026
 12:59:22 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028051312.1505295-1-surenb@google.com> <auHK3k-W4gfL_MhI@pedro-suse.tail5790ac.ts.net>
 <auJO9al4lmAczLAu@pedro-suse.tail5790ac.ts.net>
In-Reply-To: <auJO9al4lmAczLAu@pedro-suse.tail5790ac.ts.net>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 28 Oct 2026 12:59:10 -0700
X-Gm-Features: AclHuK9-6O7OXV5NH16IYTfE9EYxAq4xHV33LgQLBVE22ks0KWFvxZhPdcny1CQ
Message-ID: <CAJuCfpHAFXDXs4ZBrd8C=8hkQdJxcWCz+DER5BG_Ki0ndGpf9w@mail.gmail.com>
Subject: Re: [PATCH 1/1] selftests/proc: use RSS in /proc/pid/smaps_rollup
 tearing tests
To: Pedro Falcato <pfalcato@suse.de>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	jannh@google.com, liam@infradead.org, willy@infradead.org, paulmck@kernel.org, 
	usama.arif@linux.dev, vbabka@kernel.org, linux-fsdevel@vger.kernel.org, 
	yi1.lai@intel.com, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 12:42=E2=80=AFPM Pedro Falcato <pfalcato@suse.de> w=
rote:
>
> On Wed, Oct 28, 2026 at 10:14:19AM +0000, Pedro Falcato wrote:
> > On Tue, Oct 27, 2026 at 10:13:12PM -0700, Suren Baghdasaryan wrote:
> > > Pss metrics can be affected by map count even if VMA tree stays uncha=
nged,
> > > therefore test checking VMA tree integrity can't use them. Use Rss in=
stead
> > > and pre-populate the VMAs so that Rss changes if a VMA gets skipped o=
r
> > > double-counted.
> > >
> > > Fixes: ca5480fb53fa ("selftests/proc: add /proc/pid/smaps_rollup tear=
ing tests")
> > > Reported-by: kernel test robot <yi1.lai@intel.com>
> > > Closes: https://lore.kernel.org/oe-lkp/202610271934.fd287c3f-lkp@inte=
l.com
> > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> >
> > Reviewed-by: Pedro Falcato <pfalcato@suse.de>
>
> Actually, now I'm wondering: isn't Rss also flaky if memory pressure occu=
rs?

True. Sashiko's findings are also interesting, so I'll need to figure
out more robust ways to test smaps_rollup. I will post an update once
I figure it out.
Andrew, if this test failure is causing issues in the meantime, please
feel free to remove the ca5480fb53fa patch until I get a better
version out.
Thanks!

>
> --
> Pedro
