Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932334D17BD
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789666051; cv=pass; b=L4fezXTUjwL8hErgXNRQeqGKx2+KBJSaiZsPhRm7L1EHJe0nayERbpxKaV44BdjkJ99gleb9go1nFDA0Sgm2dabQrI+iOKufhPgr21cBEWkFP2ssXoUMeiVlcxpFxbRE/U3tB7Pj9Su+nVq9cJhViJbNZEK/iGM4OWkQBbXGkjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789666051; c=relaxed/simple;
	bh=rnjJ2IzL4qK8F+LMB5D40jZ72KTwVoNqdK2RH6FWOTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KfsdUKUdGdZaOBet7CRE6cDw2+agVqKk4uVPqYQgO6tedNAGD8J0bWDG3LH8zl/turyatWb288Zy0A+4h3auA2PIQcex+ygX/qTD+8l9iYCQ/Bdbmzje1PSMUw4c3Xxc9eYejG1D6U8GyqqMPaiM6lw4a28MjxUTL09AlHYNGaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P/EOIUFV; arc=pass smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P/EOIUFV"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccb1a990so1013115a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:27:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789666049; cv=none;
        d=google.com; s=arc-20260327;
        b=bhIqfz5FBcR9TC8l+UDfIm+1Jg6o5nkuNrwcNUrZMI+K22YMxlZyzTI7PNu2YuXBPn
         6T1tqX+7O9hz0+UEr2CdXKq0bbxAVfYr4nURLrIxBTlbP/7wV8Y14mewC5Couqhn6Zct
         F71nXvsMx5o1auqHP/FVwXYsU5SWkmgVPFI7q2HYSDSh2qMc+Pid/3IPZQ0BADe0va22
         qWp9O0Rt5iDVDZDM07yEVu04IGWqYdxuWGNbhIFXSiYRG5kPot2iSjE1UgtyLd+Ip4PU
         mPoeaEwzjsgc0g8NqBcQLQbhY3q6QTfW13mu7p0xrrdo7AmF7UuUgT6vnZ6dUJwx5V23
         OEKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rnjJ2IzL4qK8F+LMB5D40jZ72KTwVoNqdK2RH6FWOTI=;
        fh=Mgh6k8p+gyxS1zklaO800jqvep3D2EqYPHlQN4nbI/M=;
        b=AZ2xAz2FrswGIuNA3tAqBq1Ohkg4L3XAC0vmDrbLiuY0imB+0dbZ9RYi4UdjhZLZWC
         /pdLl8EasFTnnBVLb+/f8PI33UPp/PTUqKq65rGgXoXonWPy0eGKf2ysLBZyXRWJSWxF
         wW5AG6Vw5PpYs9wzScH8HuDLCHgQoRSHiH99+d4+w1yLWj8WtAqrWGmVtyZ+Yyf+5UsA
         VX/1kdbqlGM6CG9C/whafPVLEytjS01T6rMD+hHPy1KUGGbYc/e3XZ3sdjdW3iqf5sXy
         Im6GCQ+yP78fCobQsaz/dLIRf1kPgm24wQgHaPgBSYHHOvsFXmjETYQqtSMtNoe4Y0M/
         Mlvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789666049; x=1790270849; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rnjJ2IzL4qK8F+LMB5D40jZ72KTwVoNqdK2RH6FWOTI=;
        b=P/EOIUFVamxgwK6SDy+zh7t1x8RRYudJFaA10XcXxnzn85VO5e6+5LMlq/sjnkAXaV
         YfcxlYkIH1J8pTcsV8p0lBy4D8QNSr1Q7l/z+lDKi6f11Wmg4g3hxhHuPZEwvNzqwshz
         PLR2wa8jYqTM0YFcIX6qZoyrH9g61a9Td9C06GaEWscC4pEb/TJRzRqtlSRFKz967Bjr
         A5Bzn/FeuEs3qh5cVKUGd2siTLAozBSZNqGGnugPTgx4lFTU9fjUZ9Pg1F4wABGJvXf4
         HSaewfc3A7MmUNRW8Ls2QygEZF8Q4cYLJwqD9KI7QagOgys18+j8YdB/2kOPAIel607G
         TlPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789666049; x=1790270849;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rnjJ2IzL4qK8F+LMB5D40jZ72KTwVoNqdK2RH6FWOTI=;
        b=rRwyjcX6Vgtv7P+hpyrPV0qGQ9zoX7yvPmbgF9ApmHtm/qib5mgtwVjjUgmEFxWidG
         pY0DJazY6BsdOy0ByyLunNfxMpZq01qS2AKASL6WEb7xxuJHRXch+IhJGvZOdDmqJiId
         4MBJG5c14tkqd+Uxl+W7EFKVggu63khV5KF2fWGRgeMYiyMFPpLkj5IoKIai4u/6t9qf
         sH5sGIl3TjycXoQ9hdGA/Cgk4dlzJD1GV8LzDPKGQnvOYW0cAJnOK6ZnQ6eAXR3lFazp
         OmDFYqlZnm0gdIS/q1V4sRnFYT3G9P8nQy9aLuV5pBblOJo8Zb6Fp4ylRV2X3e4wEPjv
         tJ+g==
X-Forwarded-Encrypted: i=1; AKwUvBzwCqR3cWZWDj4j6uhrOZwosH2Kdbtn87WAiXzh86xwGlz9UsVHI89DjdhUfs1/AwvP5hzNPLEjndGC5+M=@vger.kernel.org
X-Gm-Message-State: AFuF++mDTTm2luoymUz8ibJoFDy1EfKJUuVQ8eAVt2rj/DvJEO+dpY1r
	QedXwL8Ueefk6uh08lqXBsJp+Fxbyc9waaqweUybWcHvPKyL8+G9iARNEzwH4fHgtmkzYiGfdVO
	fHAqQA1x14MxPJAMhxVyHbObUwtA3hHU=
X-Gm-Gg: AYBFou0pLHKcBjsiTOM/cqTKbHb2B522oZcWL9OrN6+IBKRWVIkD41ZdJZmV5MtopJn
	FaBIFAMME+Rbw8OyP5mO1lmyoEuPTNF0SQsIdlczaJal+slV2lc/CvyHYQ6hDc7z+vpup4g4CoO
	l9Atpvje8hmQOS5w3RRqjX9LDqhTpbhbkE9ClSuYWRMyF+E6C8gNTnq2VGGPE58g3FuiqSqsttx
	qf3u3VvhvH9DxUj+ayci0/xApC0NseEMysZvHza45WiQaW26zF7vPWZ21PZTI//ulOb2ig9YdSR
	kCWDif7Ij0T0Kcb7kl73D9SoGMEM9hHHTM9tCG5Rm8gBLvsJehZEBMroYgFdbrWjJYi4+fTet+k
	N3wVByd3CmAn+fM7NveWWCR2PkntvDORJ/K5mcRDV8IrDby/9dPLWFqS50L2jJsg=
X-Received: by 2002:a17:90b:1b03:b0:39e:3558:f925 with SMTP id
 98e67ed59e1d1-39e3558fa6bmr9227481a91.24.1789666048912; Thu, 17 Sep 2026
 10:27:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aqvBPVcN__UX8P85@sirena.org.uk> <DLHJEZ0K0FV1.SCQLJJQNS1ES@gmail.com>
 <66d3f5cd-12df-4000-8459-360ba57cea12@sirena.org.uk> <DLHJUSTDSQ05.28VUGOV7YPS6V@gmail.com>
 <ec2acd16-40e3-46b7-b120-ce9eec70e942@sirena.org.uk> <DLHK013DCY3J.19Y8X3Z0RTWCI@gmail.com>
 <9d668d7c-8f85-49ad-bdb9-5cb81fb6f60d@sirena.org.uk> <c80c4e2aee9502d781fb52bcd5c0972ccd3bc7e4.camel@gmail.com>
In-Reply-To: <c80c4e2aee9502d781fb52bcd5c0972ccd3bc7e4.camel@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 17 Sep 2026 10:27:13 -0700
X-Gm-Features: AcwNN1V_0iUx8qs13fNseQxj5RN_q6E_gTGBE2XuMqNGKhunfH4trjoxSpweNWY
Message-ID: <CAEf4BzYp0YAbhkdkKJn1FR0pjUF3JXUxqXkZtWqKiSVPT4=qOA@mail.gmail.com>
Subject: Re: Missing signoff in the bpf tree
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, bpf <bpf@vger.kernel.org>, 
	Networking <netdev@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 10:08=E2=80=AFAM Eduard Zingerman <eddyz87@gmail.co=
m> wrote:
>
> On Thu, 2026-09-17 at 16:03 +0100, Mark Brown wrote:
> > On Thu, Sep 17, 2026 at 01:27:01PM +0200, Kumar Kartikeya Dwivedi wrote=
:
> > > On Thu Sep 17, 2026 at 1:23 PM CEST, Mark Brown wrote:
> >
> > > > Do you have a full list of the current committers, I guess there's =
been
> > > > more bitrot than just this?
> >
> > > It's me and Eduard, apart from Alexei, Daniel, and Andrii.
> >
> > I've added you and Eduard.
>
> Apologies, that's on me, some issue with scripts configuration again.
> What would you like me to do? Force push with SOBs?

rebase preserving merges, and add your SOB for all commits that you
rebased, including "xsk: Use a 32-bit compare in xsk_map_gen_lookup"
which you didn't apply, you still need to add your SOB
