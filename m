Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792785681;
	b=tCWv9uGGehyKszvRRaH3u2NpacssovCAdGt2K2AHm6GZW6AV3px7ABWS3Ba0EAaufUfP
	 AkziQ+RvsKggAvzDNIPd7CUiFQEvp53NUkQVDoB/K08Q6FmDNQ2rTIDnkDsO4pHlBzPLZ
	 NDTAyj9PGUZs6tjYa1mVrwxk5y6f7cHOYMtc+ogdwn6qQ1FvwZbYK8D0nfjmQ+aeUeGbI
	 WU0p/w30OQ418m0RozL2Z+px+n1ne9vWTKIx0fuZyrltyuZG1u3cncfnS1CyeYePvLTut
	 42sqipd2WbbtBVqerXkAo2jnq3LhY9Thx68zKxA8XPVR1PiAik6xhAsNhhLRs8ptS/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=R6P232PvLRYTH0fZdfO+3AJcU5WVHpT1tzKpJhoLyzQ=;
	b=TyjafTZIBjqJZ5UlaU9MJB35EKKL0LHbxF0/yrVvTQDby6MHhnfQFm16PNdyLgYrF28q
	 PZPC6fO3wD2hHw0ov34Mzz6LvslxCN/ypbYSIc+zKqm23IsQSRTb0sBEHxVJUA1gMx07Y
	 ScZExjASqxXdsihGo25u/83S1m4FpgIAYeKbK8/v0XAfknf6GClyDsyGRDqicpYkO4dCb
	 oRpX1GpG3Tf4IGqqxLuINEUBfXBtHGZjv+8NmHVNlNlxkncBIrYfdbA0UrOHXf4A51vSX
	 JIGOQnVFATO8sGpoKuJ1PhjbtcizKfTpti3LbSmhjNO897+iXT1ww3XsSEjnKuJZqPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=NhRUecM0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FA360A2639
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:01:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11FA360A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=NhRUecM0
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-194d0c31715so2285c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:01:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792785680; cv=none;
        d=google.com; s=arc-20260327;
        b=kjKLhZQ0ifcgHPMveYaAa2xD+WcetKYKuaLzbHrkn2jNrph3h/ohAARot+Npc+xO43
         4V8c2fAlNNKWG0K2ydtqbGMc5kFa31P/hvqA+53yEj7JDMZJeSNK4uN2TdA4fLtaAIyf
         +2ZnIz7qEcAtHpJhGGEhS07q5KQWRtphcOPN3niciTQIblslDR2FBlnALW5LUZVBnj2G
         4OUtqPURsX1bKWBndQzVdpysgDZ+jrc1bwYLJMcSLZr+Mgt0qCPs2GvO1KY/UvQ24631
         ZqlSjSlUYPhYGK8tIZ1ymaOE4XRMnb7hIUAhweXszE3g+rJdf4SZUMASE/2dFzaU3+oX
         6etA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R6P232PvLRYTH0fZdfO+3AJcU5WVHpT1tzKpJhoLyzQ=;
        fh=p8UsocBDw36BgHrZ7qdJDUh8kx0uZ+GPt26S7CK/91s=;
        b=R043HoiFvOpN54GJZ81n2hAvpGfRPPje25eYn0t5Ik+fgpfDqMURA79B/wVyMQcw1N
         hZeMXm6ebYk+qGo05ejlf9lznVTFqjH6B2QXPF6BBRhJOhYNpofMnKhGw9eEUD/DzcuR
         HCCJgg7U14Pxwku9C6USAc9/JCFzHa5mKRghZRSVfMEJHtM4+VHqoqGaWknoS8S8W+e+
         iMfX5k1EnAVOkYEBMa7WQfI85tD65Eoj6FT00nL61mQf8eU7jXFM8eZ0m1cnsIBUnwUI
         FyPf1wRHBVXygYwau4jbSNPPjQ7NKsAr6MbYaPY52U/yVstqUUrLZjQ4/BQilNro/c3m
         fgDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792785680; x=1793390480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R6P232PvLRYTH0fZdfO+3AJcU5WVHpT1tzKpJhoLyzQ=;
        b=NhRUecM0MaSyL188/UhVkiKrlBbJzWi/BNVMU7d5YPBuZ4iNj3orcUODsTyxrukgQ0
         sshE9V3b3hpWy4yz5rTLrpU/3T/i7yiZemoOjtjAulVcVzmeu/+uUKXmFKRrbGV8DWhI
         ikhmpS8Z9Mn7sdgQlSNsC0RxuXXxhwIwObzqNeKh07tyr+63U8OQgBmFE4mockOozkgA
         PAdYIBVKieKprNJuM1Pvbqcymrtd+kJp6cXgA8iSY9nDhe9RlfG2ie2TZtH0ORW8F6sT
         xplVtIhXO2sZNExMdYq02R2Ax6WZmI4WYtHnZTJHSjY1I86x9aF4mAg70ShzvwGFSOk3
         yU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792785680; x=1793390480;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R6P232PvLRYTH0fZdfO+3AJcU5WVHpT1tzKpJhoLyzQ=;
        b=I82RZekoPPHfB/X2TjnTEQgB9aZiGc8f9QDQpCldSuiNMDueOmgBPppFq02BZSzbxg
         Cg0YeEYMgHijI1AdOIPgIWjaLQXRslVC6mlIbmSBgA4neK96Xvn2NNr6l1MGY9Zc4m8t
         wcU0dc0B/WJtnua8XiKOw2+IcGLHsH7lFwo8lMUaq0vpBefBE6vJOJm42xi63FWCBJz6
         be8/jBWCI53gTS7W8usfIKSYNnNkY2vh/Jqs1kHJO2boEutsqaoI7dw/VKdVloQLMme3
         m2o///rXuLUbK7bqyYiTQZtNnXA6DKR2UM/mvl7HUC6txqzqAoFZ4o1q3Lc75B5rHLSL
         vsHA==
X-Forwarded-Encrypted: i=1; AKwUvBy3P4fUhJUINBoGqIZMvQQk1Pl7Hgl4HyeuseEZ0YYgY//z+G7wyuWnkuRJhlEa4pF+mlNcHe7DjJeSiMk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmsUiTQX6sMRkTXESMXZ3dcGetUxjw+ig9CdEpbSgzLVgcVa3Q
	Dmuz4792vAIQNctbKjmx/zM8MfjHFokv39YoMNxf9tHZi6/GcM87z7CflruLb7dKtJUZr8KFg8b
	ut2d7Ov9CRWP543Jpr0WvEIMhAEcRuhOZ30QrkHYA
X-Gm-Gg: AYBFou1wRbYGMKl5hc0dieJQjmDcO/yg/IbQoZYRRBGNd0QBLuy8ifW4Vp1BB2qlYcj
	Pcx0bq6ZI/yQARVPzUXlzWODgJSleHmL3nWqWmQ/tVA8S51Bqxhoxuy/NZpmZ6NrQJmMjKkIjXo
	TSTE9a6tnUn1KOTGIeBRJTK8kUdpzjAkWlt8DibxEn0UtRye4F/IM3IT6KZk892hsmzJVM8ZLAj
	0j0tvru5XUKlyV6JK0+/1Io5aO9BLvXkBi59MbC8gzQycVH8DDWdvIfS2loK4bkvhsluhORsttp
	fblwaYKzAdOB6+Og5xOyKqlgoVYv+ECVkzgL5JPgxSLViR3wbSdCIvq3jSXUHpBGvnj3O8gl+sI
	m+xm7HKogwWOsXOi2hGyY+YukHyHKfJ18ntQT
X-Received: by 2002:a05:7022:4587:b0:184:6afb:b26c with SMTP id
 a92af1059eb24-1993fe82542mr15165c88.18.1792785679160; Fri, 23 Oct 2026
 13:01:19 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015163915.1166043-1-almasrymina@google.com>
 <20261015163915.1166043-4-almasrymina@google.com> <20261020121858.3b9107c5@kernel.org>
 <CAHS8izPwWT+vbgAe49m5vXsRxT3unbfjLTkVZBScgAPdQTo2dQ@mail.gmail.com>
 <20261021132304.23e0a4e7@kernel.org> <CAHS8izN_N25mm9vALax+P+W45gyxVoMbZoTXW3r6nPC2Z0A7JQ@mail.gmail.com>
 <20261022181911.5d19ff13@kernel.org>
In-Reply-To: <20261022181911.5d19ff13@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 23 Oct 2026 13:01:04 -0700
X-Gm-Features: AclHuK-uP7Gir6yY-QN4sOQ103425f3gALMoJmdo_Tw66r7N7gb2W22rdmAKl0w
Message-ID: <CAHS8izOTLYU=5sfJvpwB57Bp3tJ=xt7Gwws5xCVqABFw4T3WUA@mail.gmail.com>
Subject: Re: [PATCH net v4 3/4] netdevsim: support devmem RX and TX bindings
To: Jakub Kicinski <kuba@kernel.org>
Cc: Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, 
	Stanislav Fomichev <sdf@fomichev.me>, Taehee Yoo <ap420073@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Tariq Toukan <tariqt@nvidia.com>, 
	Kaifeng Wang <kaifengw@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 6:19=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Thu, 22 Oct 2026 08:41:43 -0700 Mina Almasry wrote:
> > On Wed, Oct 21, 2026 at 1:23=E2=80=AFPM Jakub Kicinski <kuba@kernel.org=
> wrote:
> > > On Tue, 20 Oct 2026 23:17:34 -0700 Mina Almasry wrote:
> > > > But on the other hand the test coverage is nice, and maybe one day =
if
> > > > we add enough devmem support in netdevsim we'll be able to fuzz the
> > > > data path or something. Is there a way to get the best of both worl=
ds?
> > > > Like put a comment on top of netdevsim that this is test simulator
> > > > device and any missing functionality and/or bugs in it should be
> > > > medium criticality max or something? Or is it too much trouble and =
I
> > > > should drop the netdevsim support and tests?
> > >
> > > I already strip Fixes tags and apply the patches to net-next.
> > > But it's still a burden. If you're signing up to fix the issues /
> > > review the slop we can try.
> >
> > I'm more than happy to help but I'm not sure what you have
> > specifically in mind. What I was going to do is put a comment/readme
> > in drivers/net/netdevsim with a note to sashiko and LLMs, "this is a
> > netdev simulator, used for testing; do not call out missing or
> > incomplete functionality as bugs." And then hope that the LLMs and
> > sashiko pick the directive. If not, I can tell patch submitters to
> > ignore sashiko code review bug findings in netdevsim. Is that
> > sufficient, or do you need something else from me?
>
> No, the fact that it's a test harness only impacts whether fixes
> got to net & stable, not whether bugs need to be fixed.

Ack, I meant like if the bots start to consider missing/incomplete
functionality as 'bugs' when it's actually missing from netdevsim on
purpose because we don't need it for testing.

> I was expecting you to keep an eye on the list and review any fixes
> that come, basically.
>

OK, I'll add netdevsim to my email filters for patches to review and
see how it goes.

--=20
Thanks,
Mina
