Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793813578;
	b=MzsXcJ3EcLXp2vDzfWVwkG1twXBQbTix4em8gjYPOT9S3yD3CoePYvuQZjR28yTijo/O
	 +md1KS7oj3SM2PMQXnHcXiHHnBKx6T/Jqb0P/1XTEyBXlG8gBbOWMph/AH2QdBVLf1u7M
	 WAjN0MtQATktMXbeFsm835oYjOLI/nypkW4TIZNEugCJVK0xSYTxfwzf7LnFf67Hn/PF3
	 OMEL4oqfryC6NQKz2VLPVbz+Efda+LWIOaV1z+Yyu9LawjGZhfHKey7gcPFfgJPWLS0u6
	 +UUaA9R3MP2QudWm9+mCNuDKbz/GBkRUQxb4WxOWHhaCYsMOMeNhUkvLFnh1oTTTS0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793813578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Mu/e4yaFN9LQNUfDEaiq9ZKyo7jmvn2P77FadrJquUg=;
	b=WJz6Ro+FDraFIcqCyPhZRhAB74mBeO/GS37EZ1eERaPHaN6vg5cEjLS74xS5n6Oc18pQ
	 ZIKlWvoZupalnwPUYIGi2N8ZaetYpAau7L50OrSPOU+iaMZ1RvkOqiUSSUB8bzuABzSqg
	 +uTbrS+wjBXePxBwWV8PfAel1r2ZVk6oGzJnbRiew1ThIuSsTlCBaoHFkPWzOCC8aoZnW
	 BO9DB6MGvFf/KzAolV91qscIoGfwWG647AA9QcEkDP8XJI6qkDRfU41KcKVTuSi3udcnN
	 0gT/9CvAcJyhcmJuemDNDaBoiU0faexkynTn5wnnZL0v68tG7sdGqzdn58Cix6mcK1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RJnLh6xj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA3E606B90B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCA3E606B90B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RJnLh6xj
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b4a13789b0so1147665a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 09:32:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793813576; cv=none;
        d=google.com; s=arc-20260327;
        b=lPAQcD37vCIJSiH6TfJfWZLX7DnNKpF+b3CIQbUeRAnKvfLTzN8Qmvx0FEJi3yLfjA
         HqstXAk6rHopzMA89pN1/m/b3yjYeFFhpDZp5bIR3xipknqRIX15SHitLAoIFN+Q8WIx
         pvl7w7zPV0QG0AVTmw/S5zTjpsC3MWa3zHPoSFUomas2owzN9lH9r+I8gqJ/kybxRKnf
         9qtSxj9RPBXznq/R1FhxWGLV+K4EUlkIEsAw6guN09IJLD/Q+E83d6dTMB6hz07ywUfE
         nitoH7vP3zb73o+QC4CpVKwRIZAjhdrT5s2Wov/RqsM0hsQ+iE79qvfuKEUlLBZxcbc8
         8emQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mu/e4yaFN9LQNUfDEaiq9ZKyo7jmvn2P77FadrJquUg=;
        fh=229Lh9cfWHL17b3zeOMiD206sKjd4Grxv6nvl2OiTpk=;
        b=DCCX1YhFK2pmtaPROJmQYwmlsP9PNOH2+JrUR8IP3omWvJpW5DB1di1K4u7g3w9bAu
         cz2691xVHQnQuGy3CAJunK/ThYRCXyOGD8WuODqaDImxpB57kVXxHbu2UAvtbfTuerTB
         nwCTkXKiFdTmLu62skmyRVH1BXZKzheDKodl+ozKM2b/VI3fTiQ404neOKECDhGkPiyT
         hEZMAsqro8/vG6GgEIqIU9sCUJmxuSfe9uyqwA4s0xqt0670WkcgsnNsUHfIbpNQnZAt
         gnV+kqvwnH2tfop479MUjtoexQ7GKSddUjelCVecSM7GrxTgXQIZWwSVXQlkPjsj9Trq
         rsMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793813576; x=1794418376; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mu/e4yaFN9LQNUfDEaiq9ZKyo7jmvn2P77FadrJquUg=;
        b=RJnLh6xjfbqaIIUDfw3cp3McuWfIdf2Ng2nJ5Ww1CApa4eS9uV78kIXmxus5ZTu2tP
         XkFuwuHq3tUtk4RL4mVf0fg1DlOOrKI8y8iMjoP7SABOdttcvg6tVw70LLyZwXp+NMni
         /HVHw4kqnvbrlmj0TPZH9t/vrXFZKg5ERUKPagYIguYD198G0LQetCq60OCmm4NnTCnm
         l4r8fVPFB3CcitRtJIFBMYBLczSn3LDbvWb4iIS/A84aKXMaITJfXZwra2iGK3f9NRyL
         V511JRnoi7mHQG58uBq3gpLAVtj+UX8yo/wrCmjgIYhVK3XCMUDEwQCOpbL2BTdbXmgN
         FpyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793813576; x=1794418376;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mu/e4yaFN9LQNUfDEaiq9ZKyo7jmvn2P77FadrJquUg=;
        b=NzEyH25IL+YpK5/EuAnI3/iarNGpK5hhSgDz/P3OeuMpIcWLfct1iOWXEAfV5JdZFg
         kPKDJfZ+4e64EMH7FcuzQwarkPnaIzeOPObyqfvRziM9GC+Jzghh+jmAO3u+XGfmvgyk
         9PGWhz6r45IkqxF742p1cV5vsVp4eRxpHF/N+PzcVSROGL93KEXsFRj0V1WrxEdiURVW
         x5DTLAFrtJwfTbkL5Xl8MDKyhKGGZdkj5Kv5fGJPVQydXz7UY2pc4hfMMwSzyNhUyQwU
         ifKsCepQqObWTQQSidViA1JkVOLY6G8Q/H63+ohoHn8f/Yg8usQ6VPkzZnJPLeerh95f
         uaTA==
X-Forwarded-Encrypted: i=1; AKwUvBxhmhQDGhzSy6vIq+/d9EYjwl8wfgN5IswD3SbeKCxve7CzwAXuLUtv0U++ZjXHp/A7R5oESYRU0cNygx8=@vger.kernel.org
X-Gm-Message-State: APuU4Z++Aw8kPMolMhqraMwePuoilCfFeXbX972tXpEpn6Vb/VqlSJyR
	6DHwhG9cKnmUVdmNNdVuLmIBb+j7ASdlBorGX0/a+S8edjbfoTWsMvy6rmo7LZqnvB0WaBBm/2+
	A/EFf6qk6ibAEPTXYR0t0TdcaCpyNx8t3hMaZ
X-Gm-Gg: AYBFou26+7JA7PStoR2gQ2KvQi7GkeRWbnTPF47HOJ8iT9CyZ74LOwiLdmmmjcU2p3Y
	nk+8kOXv+FNWAFyMPqlOqrNO3KtPPSMUe8Sbgn+lnzKv7H7UsZfs8BUdjp1cfN+p2BCCFbhmfx+
	qwVybv5aCQT9UWbTeGF4euU9pTB4Dpg3tbvaVGStxhxm9OmoTTMnLHysBjSajbGWPhIR6omelHY
	LU4pvKI0wlh0N8HaqgxAXkd2sSOC/8ke6uRWwNRamkAmX3KPTApoAaX5dANJ5FVvAqzVTVnF3Qv
	f5RaK5tlqRTVorhkhaoSkRUj3HOKpBgGfU5k50bGYz/L6H0nlTVATsrZhfzqnzrdEEJy9wViK89
	IYgGRyZ5htPb7crg0E4r4Bb47g1UJlnksfEquWTojDYmgbDvnQdfsIAneO000uKO3qTpd5Q==
X-Received: by 2002:a05:6402:5187:b0:6b5:6c8f:22c with SMTP id
 4fb4d7f45d1cf-6b577183624mr170574a12.5.1793813575918; Wed, 04 Nov 2026
 09:32:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-b4-ovl-containerized-sync-v2-0-4e9f08e4a052@toxicpanda.com>
 <CAOQ4uxhWy2aQV6g7VJcV+NDLPTSoGyR4Rag8uvAwN=LWnApaJA@mail.gmail.com> <b9d94891c6bbb0a18176424eadf6ff88.josef@toxicpanda.com>
In-Reply-To: <b9d94891c6bbb0a18176424eadf6ff88.josef@toxicpanda.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 4 Nov 2026 18:32:43 +0100
X-Gm-Features: AclHuK_59wvajkPMd500vbmbA1AMyOdJVXBnQNeByyLMSA4U6W7ked8knU-c4rc
Message-ID: <CAOQ4uxid3ig6M_k4W+wXh8K+P5jiCpuYRNoq+CHnzHfYjwihug@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] ovl: only sync what was written through the overlay
To: Josef Bacik <josef@toxicpanda.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Christoph Hellwig <hch@infradead.org>, Chris Mason <mason@kernel.org>, 
	Chengguang Xu <cgxu519@mykernel.net>, linux-unionfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chengguang Xu <charliecgxu@tencent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 6:22=E2=80=AFPM Josef Bacik <josef@toxicpanda.com> w=
rote:
>
> On Mon, Nov 2, 2026 at 11:14 AM Amir Goldstein <amir73il@gmail.com> wrote=
:
> > I think this is over engineering.
> >
> > What is our goal here?
> >
> > Make overlayfs behave better for the (many) containers use case.
> >
> > Who in their right mind uses a host filesystem which is not one of the
> > big three?
>
> I mean I'm good to say if you use something other than the big three
> you're on your own. I built it out this way because I assumed my
> attitude of "I only care about 3 file systems" wasn't acceptable, I'm so
> happy to find I was wrong.

Well no mean to disrespect any filesystem but I was referring to the use
case or running a multitude of containers.

Who does that not on a proper distro or on their own in house distro with
a proven server host filesystem?

I am asking genuinely. I don't think that the use case exists.

It doesn't even have to be the big three, it could be out of tree ZFS
or bcachefs, but as long as you trust your host filesystem to hold
massive server workloads it cannot be a toy and it has to have
a balance between performance and durability which implies that
fsync=3Drelaxed should be good.

Hand waving reasoning indeed, but if someone doesn't like it
they are free to choose any from the available fsync modes
for their system.

Thanks,
Amir.
