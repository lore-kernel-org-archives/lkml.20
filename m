Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026D349481D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790257473; cv=pass; b=A7iHnYwPBWLdQh0nVpsugu2kvCMCCPenAzgRCcfecCTRr/M8j5d4z+cVWGn+De6lWyoJdhUXlBEzrNWCxQmJ9bMKDtI9UcnEla+DKe/05GEAiL4ld6PL7Cilttc8Dso8QscahTIck2Zde0RRwftTdCJxAFFp86lKln1pFB8hBRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790257473; c=relaxed/simple;
	bh=cFauOgA8z3U9PqAuxzmKGox+cZOoW7I+JwbiyAJGnfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S6ZZrbU49+DoCuvnwWGw+uO0ChKwlXBFhLFGOfdRmxl9uRlzwDshidNcIGy1oUKUp0vRx/CVZxR5fCL+GHZD2kJwVcKosXjbrjryFSfR5kSaf+c6zYXPEdnnFmbs587UPE4tu+tfdfAVWOMasokNLhmwa4sAmqfKp2SBw7MkYUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SXp8GWtP; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SXp8GWtP"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4aa0f1766so1336750a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:44:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790257467; cv=none;
        d=google.com; s=arc-20260327;
        b=RcceFtxJlQiu0aJ1aJmnCCU5oqfVpL6mFAfBEEj6MTeHkaVa8ZKkl8kGChxmuD48Wr
         xRa5egZnGA6l1w8xfdZqaLB2dlXo/IneDmcwzON9N4mjQ+m8Gth9CbMlWe8XXBWOV4s9
         zXQhrQme0HEkVD8+kDnQHyEuU5T8TC7IC3qfcerig4NiaReZfNc9MkuecjloO00KaQvk
         MJVkBg2Fa0ZyFfuEZ0YG58Nn57ZzTkZbPWuQycsaU9n8IRpYZpNX8WTBzhcfkmxpHY50
         fhzUBK9+W6dLOiCJuB9n/DeGNh4IOf14wX5VYZcuRewb8iGZVJf2Felke9TE4b8Ex85I
         egpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nlngpjoJXsEVxEuj2gq7hM2g/yYyiiwaQMo7R6hUNyI=;
        fh=6staV6mYIg09HA8wHG1oMdwL3AOhD4tiZSIrVKQgxVQ=;
        b=scah4OaRYbIuLQYFiUkwZ478B2kmMNIq7I3WdRAgXe5rfKhYwDScXiIRkE0VNtDc/O
         nPhBbkZ1/slP3nbTJwrvDh8GUAJe2URFO8mU1SiUMmSUYgfcTkCjPyDHR73k/5cz9Wl8
         Hy81vVtxclESTYiabShmSfpB3R3M64YlcCEuMQP5poM1w1+xKYqIHIVxnRLsXMrJAuvB
         XW9WEpQjsdLzVISvtjCZANNPtldLSjDCPmABvTwxIzcRks/4i2J/eUZeB3YZvdfUdyCi
         rR5Z6x9qll7z7/k9yxOCAu4h3j6uPlo6lcHiyugXCNTcecFKxeOc+HzQ3l0iM3fUer1o
         En/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790257467; x=1790862267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nlngpjoJXsEVxEuj2gq7hM2g/yYyiiwaQMo7R6hUNyI=;
        b=SXp8GWtPMjoV9qkWkWx8Qa+9vDPPN5DessE0/O7/1AcXVzrgDft4U9eYgx6+Rh4g8q
         qGGbiLPh/WiGhqva63M66QptrjdqHv8OOmH9ZSWurw3CPNu565s62WwLNHIwai6TyteG
         UcWe+Ww1+v3QL9dSwXLjql5sK36P96rOinmbl9IrAymGgZpaneu0XUYvkBndmdAgub9i
         5sQnSjtUFSSx5GtYkpTN4VKRdHngxBqzyluO9z1Xik9GVCtsqP1ZQeOn7Q91sBIrf8Dk
         mbZWjAEynFhLBebnza6CpMQzH1+sz+MMPAt3cRnbf/tmIh0ztx2iFroRus6gYJTpIMqR
         w89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790257467; x=1790862267;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nlngpjoJXsEVxEuj2gq7hM2g/yYyiiwaQMo7R6hUNyI=;
        b=CFIyZTTMN1aX+73OWIqGlUGSQgUJ5vS/CYg5VWV03aORHwGYGRwcGL2aE+shEh+s6E
         BvvGQllM3Xs5Vf1CzNlRdc+SKNsAdbAeKa1MHL5ls2kfQrH8zc9zxE70ozwf4P/GsCnK
         6J26L4XhawkOWM+sd1ZvXALPTNPW3V9iy9+UilPX970F5hTXn+MNUsymBqvS5riSyTdh
         gD4LDrajiCtzzFeuDLX8gcRdICx0EIU7oVoZhUUt6uud016CE97JxGeJ1fnboclDpJQB
         Eh3B/KnleOSrjc9Zxyodjezajfqj9CLCvVy2XiWkG0RDW9Mb1AoMpvvCLYTjRAga0EKR
         TEEg==
X-Forwarded-Encrypted: i=1; AKwUvByZSZFx9AMHl5LsrR+sRfWb5mUc2fCWLza9qDJd+Vbkn/XEGcPBQKQWJL7OYZTdacrrSyqlnf8ziUa16P0=@vger.kernel.org
X-Gm-Message-State: AFuF++myCEoutTm9OBFzQc6vwTrk4FqDXb16VDF4qQguWGLOR450y+Oy
	DkArlL6BzR6LsJqaILcgTSVkXDrkR8wN8bn0KQtrXFPMhl0vdwWdmYXUt1qLnc0RQpFrLESbEvt
	kp+AV1yq57jsAchLgWjPtpZUJGg9xQNk=
X-Gm-Gg: AYBFou3N/Y4cHFn3eZGmOHU6otE5hEaF2VGsEif2flrmdbPcSwGERpQy7j+TNwpxV8+
	HsYyLOXB4Xd4itZJCfha58Ou0sjDyBpKASGIJNlyK/tg7qXuVpWEitwOz8mu0yhKGFDv4xsNxTB
	N4E6keZHIhd0KJWM3NBwriaLixBiV7618y2ukOrKUYsXycdYmrBWeMD8gpy100bcqhgv+klWHtM
	Eu0WJ6KhlaBAs+Ouo8ImWo05R4mpt3X5EM3m1Y9DhQt1aqaIx4yX0BACuUVmzN8PPt358p5pGa0
	MyZuW/MbbZMLgiYMaxRYn+X3SVq2IBmDkpCoEDmfgdmvn9fZWSTtPQOzPPOEsARYDhf+I5pwt+j
	YIxV0S0s2AB9cMn9twfO71n9rkAhMgIJ9vkDEUJod5K7Lo3Hocg+a2A==
X-Received: by 2002:a05:6a20:1f28:b0:3dd:a196:69e1 with SMTP id
 adf61e73a8af0-3de0ea1cec2mr2440252637.60.1790257466883; Thu, 24 Sep 2026
 06:44:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919213634.3314055-1-benquike@gmail.com> <4745a390-6859-4a5e-8ee1-ab9634b3bc10@redhat.com>
In-Reply-To: <4745a390-6859-4a5e-8ee1-ab9634b3bc10@redhat.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 24 Sep 2026 09:44:13 -0400
X-Gm-Features: AclHuK8jtpDrFAVJeOq2D55eedj6RdtFuoTdSF_mfwp1fcThXvzJ0oWBMiBjo5M
Message-ID: <CADvbK_c0+KxZ-AZA4vhWpOT1DFBic-iy9gfrd18s0KQAdskvTA@mail.gmail.com>
Subject: Re: [PATCH] sctp: copy zeroed stats to user in sctp_getsockopt_pr_streamstatus()
 when !streamoute
To: Paolo Abeni <pabeni@redhat.com>
Cc: Hui Peng <benquike@gmail.com>, marcelo.leitner@gmail.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, linux-sctp@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 6:14=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 9/19/26 23:36, Hui Peng wrote:
> > @@ -7589,6 +7585,8 @@ static int sctp_getsockopt_pr_streamstatus(struct=
 sock *sk, int len,
> >                       streamoute->abandoned_sent[__SCTP_PR_INDEX(policy=
)];
> >       }
> >
> > +     retval =3D 0;
> > +
>
> AFAICS the above is not needed; retval will be zeroed later, if in case o=
f
> no errors.
Agree.

>
> Also this is IMHO net-next material with no fixes tag.
>
If users call getsockopt(SCTP_PR_STREAM_STATUS, &param) without zeroing
param, the kernel should still initialize the output fields when the call
succeeds (return 0).

So we may think of it as a Fix.

Thanks.
