Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794489227;
	b=L8e5xtI3GRukg9eNbvRFruVbdm/So3ZD9zgX/xNZHwbSYO1jofTS8EeuFbr0gDoixv2N
	 kL7DIiui7IFbMviuhtyn+F8ffNmUWNZcSwQ7FSwVIqJhsZNvP0qjJPNVXcPUz9DkxtPMz
	 vZ1u5vDLB0lpxKnNRpvpEmBD34roopyVf6+lJiXuNod/wSsjot/IwG+P1jxRBuJ6ogrK5
	 w1Per4GA0zOiIZtWnXPDqtaP2SzWYiKdrd2zn7kPbfDIU/IRvaYsPN31jUPGqeR8t5Ge8
	 NQR3agP5xXh2wC4TkQ5t2VHWTZLku4PfoCZ9A/3Xkt9CfdEeioPefBNsLoFv3mUlxUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tt+WFRdvrZSXnzZAVznwgbf/IavQw06AhCrvauaK6GQ=;
	b=0Xlj0lbypCokAIR6eBz6gHXGyPdVQmf9G8SImjFGzZsi4RxwdMJhfFDLSP993nNIe0jV
	 753Nx3djsPS/Rj4huNIhxwgLEN1nWvUP5ma4jXPRKeaA1oX/eHVLTvgPEfLxpVCXAoDO9
	 GiPOdjBKUEF9zNBDSAGp42uf5QgqaVLjZC6LUfm2M8UCxkkEzToi6GMpGPQGkQtQ9KGvZ
	 enPEjIoCzaaXva4AiZCBZA0XPB2XY/fBMY0QrQ/4AfnOe0POyaOaK0SMT7ONV4XnqznO0
	 8OuY/+gzPcyXJaTIuzx/wSQgIh43cC0sBln4x/cS2cO5dny1eMirhHTL1eSfB1zNTsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=UIJzlhY6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F665606A334
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:13:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F665606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=UIJzlhY6
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so668993866b.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:13:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794489226; cv=none;
        d=google.com; s=arc-20260327;
        b=Imswsb8EcqG+jCXyg1y1RD0Qb4+ZaQM9950iOCv4TNV5J9OFPvwBNdWuUJ1Ig/cSkd
         EWgVBjDwBmHZ/SQNbkzaeV9yzOlCdP193A5eNjLeywJw+gsEZ8iBoxAAlyRT4+LxsVqm
         /fL/5RJ3kGys8PImB8GENkK9Ctcta33+33xQ6wK3MzH9QPLBqxqi9Wu/k7qxiMPclDvD
         uvElt3d5LiM9fh0fC7QQhqL1k0ZtzKrqfwv45diG6dcZ9URDPH1CU1S1dCPq3ThCXMI/
         RbrhXVEX5ZbAGwRxzpoA/xQOK2JLtcYAKqSZdzEx6Y1qq0HxaaYQhSeG23SyLUKjwMME
         RYWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tt+WFRdvrZSXnzZAVznwgbf/IavQw06AhCrvauaK6GQ=;
        fh=MnB/YbFG670e6X7m0od5Yb0YNTiDbZWizs1TUlaK7Nk=;
        b=mI4CDriVRvniMZcdBrJlnEwIlA+x3WSa1naea9YGxC+P93KHyaAesQSB/wBfKL/7bc
         8JHaITCk2Wx+LbHfEIyiWkLsm4yegEvQsXyBkOyIjzSX9VL4ISJflAsagP5raW2onzWJ
         KiZu6CsKb1k2sXwuPvVPajLDYNHugcmSuHZJu1BSsJAp1MuuLCUCcyd7pfwKzZ41P43J
         Q+Ca+siejMHUxNha0VZEDWheH55rv5NDm/JcBRDxqQXbl1atpb1356YuNPJeu2T/8McK
         6KFmCB1V1AqDt+xxBMn0JCHmVqkCKANLjQQjnh2c++u2dXCxFfWWUl1Qz/qT0DG0AmzL
         v2Cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794489226; x=1795094026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tt+WFRdvrZSXnzZAVznwgbf/IavQw06AhCrvauaK6GQ=;
        b=UIJzlhY69Bayr+gzpIOO2ecPVg/Dl5b/ElSR55In6aKYxCYITsRRmqHQkg2aGzopck
         XhZkbzsGBlmiJCKQJaArVHr90KBvTEU/MPReiE3eLnbdIQ47IeB6LEp2REoi6imJG9Uy
         exptp/08eh/urHnv+EN3OTfET0zGOKipFDPWHJJn9wBNaKpmrGQZHcDomLzvBKmO+utO
         TYPDbm34/J0/pW+/HNQJK4nW7o+obIIvJk0vmKX0HZ22pFcRwKG/HEHln+4Kpzo/wtHj
         U7KgVz1pc41IG+o3pLhH7hn0tIwXhqIg5hAlbrxyLp2FCFPNpUFDTCiYPparpbP1Oqtj
         clZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489226; x=1795094026;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tt+WFRdvrZSXnzZAVznwgbf/IavQw06AhCrvauaK6GQ=;
        b=Xr0V1LK1K02AdE52B4E8GMO74JwtjaLzNyArXcpcQVTAk09HThEG9E2r31JHUmuwDC
         aAtvxBlFlTSOhcx1woFw8ONE0khTF2wBsdVfM32aGUDqB8JY5AGwtkNoICDHOMOqxuPN
         faGvdYlX3NYsTO7kZ+Zl6qhqVdjPEBXrTtU3J0k13vxKX1fwmsiJGvh2Jo6GpUbKSJ2O
         lpiMoAKv10ozS02B+7TqMeYhM5Rn5SfyQczwAQ0VvlneWW6Vw9yrYdKtqKjm6lJLA54F
         H2p3M5odeTwBaqkVzDG098+A9qnF+BAISnx4hsOE8aw3GeyH38J8FSKiwM7f33oh7lIa
         Oldw==
X-Forwarded-Encrypted: i=1; AL+hErHzZkvNwL81iFCcBOxdCrhYIw6C6iTtPQC9NATh+Xhrn1FJaeyb3GOpurKMQFBQai06OfQaoa6hXzy3QZE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BsqUbTo598JPYyzMMhewKlvaC7v662YBYa7EpgKUfPle/prnn
	bj6pdpb2r1f5BM4Ccmjc1eJOqqINGoB6sWpEZNyrwCXeTyLHUAly5ZlzPJK2CqDNhqnyTMnzDjB
	7Qsbhi8Vt9qEgJz3KuejZFT3/IEIMZ/fuRabxkwLarg==
X-Gm-Gg: AYBFou1OX5jXO1+8EjX1SM/o4jJvgbYtSK1e5TIbw91T9ESwhmH9dbAPC+yPC01kgir
	UKCIbZKPdBxTTS48JrnfTOXGUB2rXxFVVfPVn0lkUZhru0H8vN7wv/GYepb5QZfU9qAPGIvjVTy
	m/guk80Rtknx0i2CALQpquBk+IXno93CTdJchsYwGCzjsrsccDWJO6Y9y9UTufIArqJKX0uWEY6
	KOaYBJ5YyRJ/Okv6kt1b/oaDtIvf+jrOVZ6RAsRjiRe8IlBDuOf1CK/rLqsLYMbAhevsIij6We6
	cibW4z3gGg+VMih1Ql+uDLOExDOC2Toy1pR7u45Gd9UL3R1ecPdq54lfNCefJVjLi+w5nenGHhG
	oZdB4BnyyFkt5iRxn4iKz/Rm2nsJY0m3vpSxSJBo2+uG9TRBHsQxan2I=
X-Received: by 2002:a17:907:2d9e:b0:c41:6de7:7dee with SMTP id
 a640c23a62f3a-c506685458fmr461873166b.7.1794489225737; Thu, 12 Nov 2026
 05:13:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-ufs-rpmb-bus-v1-1-b07100e53f6c@flipper.net> <b2338a8e84366980f648b0e321e9f8edaaf633a9.camel@iokpp.de>
In-Reply-To: <b2338a8e84366980f648b0e321e9f8edaaf633a9.camel@iokpp.de>
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 12 Nov 2026 17:13:34 +0400
X-Gm-Features: AclHuK83OfRmcNSAr3yNNJR2smWwrfyR_yt7neFWx9UxX0YmCS3qGDuhZxsxCk0
Message-ID: <CAKTNdwHcCA6taSrwmJ79KYSBREkOZgWrhcnCPG0M6=5XOw7pgQ@mail.gmail.com>
Subject: Re: [PATCH] scsi: ufs: core: Register the RPMB bus before adding
 devices to it
To: Bean Huo <beanhuo@iokpp.de>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
	Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Avri Altman <avri.altman@sandisk.com>, 
	Can Guo <can.guo@oss.qualcomm.com>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bean,

On Wed, Nov 11, 2026 at 10:43=E2=80=AFPM Bean Huo <beanhuo@iokpp.de> wrote:
>
>
> Hi Alexey,
>
> Thanks. The code is correct, but this exact failure is already fixed in
> Stanley's series, which has been on the list since September:
> https://lore.kernel.org/all/20260914144910.931518-1-stanleyjhu@google.com
>
> The order there matters. Once ufs_rpmb devices register again, which is w=
hat
> your patch does, two bugs come back: a use-after-free on host unbind, and
> concurrent RPMB requests that get each other's responses. Stanley measure=
d both
> with KASAN. Patches 1/3 and 2/3 fix them, and 3/3 turns registration back=
 on
> last. Taking this patch first would open that window again in mainline an=
d in
> stable.
>
> So I would prefer to drop this one in favour of the series. If you have a=
 board
> where RPMB fails today, a Tested-by on v5 would help, please have a try
> Stanley's patches. thanks

Thanks a lot for pointing this out, I hadn't seen Stanley's series
before, and it indeed covers my case and more. I've sent my tested-by
on Stanley's v6 thread. Let's drop this patch in favor of Stanley's
series.

Best regards,
Alexey
