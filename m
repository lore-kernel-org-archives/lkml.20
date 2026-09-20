Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B913E0C5F
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 21:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789938837; cv=pass; b=aPhLwTdmWHlrWy94HRQOJHW09GgmhQcVtyeX09RrQEZvKt6fCVVuT2TPo97/BfHa2edRJ0TspHba9/ym+dkO4t7X7B30iFIdKuzAIUZPfWxfHLVjXcM60Q55AnaShNF6B1BgX1YCA+wG6tz8cQoFV6Yy2moe5BcPaUpf66+PIis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789938837; c=relaxed/simple;
	bh=ERyn8NtnNgljLAbF7o+FMaSrrj0xAAg4crkAr7XiMn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lq8nPYdv4ldMMNT6pBYKmsj0E9RX8o3GqehDRWxdF6OZ694qzL6xy8f6+DmU7Du8G83NRNXsDFdCcqHdmt9pSiY4EEVCAsLl6gYUU4eCFFxCBmhWWjG7KYygWH0LvVM47Twl7AW6jsvSS6wgwMrIQvD87s74OD7f7+kxDWeynvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B86AkbOT; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B86AkbOT"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d6ff2f2c4eso4886005ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:13:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789938835; cv=none;
        d=google.com; s=arc-20260327;
        b=Gb5nDrb2x27E9VJcich1XY/erSLeoWbq/1kAXFgug750gNGcNRcVTtPsUdG6K1w0sP
         JexobT6eIcbWHKdsqCL+SO9RRN0Dqctc3xtO1uYPlRjgI3iA5lKqUVncasTY7Fa85lD5
         7XCFw9bWvnaba2Tgml3HqfB6fIi1l8+rqun50Jj4voRySZ11jm0GMtLHlKk23t7yXVyw
         Z6QTYCGn9CRW2GdpSv/PmW04wDzEib450MqjJlig6/Y1U64FGryDZudjzTe10e1+VpYE
         ooYNEjqHW9nSuEIjPb1TVSwrIGYzT9awMb0fSex1zlIYkIt+lOGqgIxJjYZBakgzeGQD
         WdYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ERyn8NtnNgljLAbF7o+FMaSrrj0xAAg4crkAr7XiMn0=;
        fh=K7GG4BCHGKIuTMvo1d9YokAv0D1j5PcjXXpaeBUEuCo=;
        b=jn8Fa9zb/m4pizg5ff25qU7RRjv2ttjA/cHT4qFJkDnmTshakGPvXLFHcCi/O1wB4e
         XCJwbUM1TxrhrYaZF7A2TQ8YqteMwjp0B1BxeGu5Nh+I67Ss/By5GSnxLVabsTvVrDuB
         sQ3tgAaRQHyfCC+Z2nzE1Q5VsyCRIzMsqJhbUK+wLwKy4yEaXhjmmHTNoNX4wxVE3Zkp
         nsWcHdUKccG6ZZvc66lOOGVx1gJcjl9r+W6OOEpdz0dyyKKY2lzox2ADdllLjh32wHpH
         fpcqHu7xXj+XNpV/RItoNd/Jfb9zsCGg6/3RI3RIj8vrsF41LyK3i4Mji4xW7ny5bCXW
         uDaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789938835; x=1790543635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ERyn8NtnNgljLAbF7o+FMaSrrj0xAAg4crkAr7XiMn0=;
        b=B86AkbOTEtGatdYajaYeLdQlCQhJna5J4tA25aQJWOkPlRHNTKg2Kh2geHUPcBoTGN
         szvnMfmf8zq/aoz2dtjblZsS6uzS0RyMwGwdirrCzeRf4ojqh3/23VJpqPqsL3yFkRpD
         UA5gi7o2uPnG3v/jcg/874nVCr3e40CkMuQJ1Cmojm0zgFUzEWBJBz0wjFuIkbR1Q52g
         BM66OBg/fH90SJZlCEvMliiRNCM3jM2Ionu2HnRfiw0oh42tByE0/Fo+DqGFb2RDuV6Y
         IVAc8RbH65brIyr8o/PEY4XaU+z/x65jh7UPzs6h0WPf6nIvzJ9hT8GmWF4mjn7OdZJp
         38rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789938835; x=1790543635;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ERyn8NtnNgljLAbF7o+FMaSrrj0xAAg4crkAr7XiMn0=;
        b=vwo15p8BzXynmqOyfD6lvCZjId/7HILsgy5CC7tCqb/z+cBmSfqyyEg3KGs7aqGsfH
         TG6FH47J9qxgZWLvAEx+FpHbpMzfILlCHqU9CB1bLC/IfpAvGxLh2JxPRgMpoie50T0b
         eGagaf1zAnlbHUjaT+3WjyPfX9SinkXgUh/+VHz8gt6bMNcc2WKcfWugP0EpAKmukdGW
         bCZ3ro/8rrjdFpfCRWcx8tMGesuiI9rUU975I6gZADPrFqsI42p5iJHfU6wOzI7qFQnh
         zaFRM1ram/wkvyibq+9NROeSAdsGuaHfClXfuokCmyBgkfKrMsrtlhv8h8AUomarDIOs
         KALw==
X-Forwarded-Encrypted: i=1; AKwUvBymK2EiZXKkkq9GIlSc9d77mK7cdxMk+hjAlrhBaxiCW7GM/Rq+r6PEGMxiM4CcBwo1FbfwUM+MyvQU12A=@vger.kernel.org
X-Gm-Message-State: AFuF++kG8voBjVrR9YEiYWccPoZ/ROgyBdudXCviojYhZSS7fqenBSPn
	OnNqq8X8T+UFfuYRAuvgZB+2Ga8rVbV6qUwcZT2D+0snVzenh+Sz5I1xEtCDkNfxMWQSIgY8k2w
	ducGnoRr6Y+zm5xROzQ0s2xpAvnsHylM=
X-Gm-Gg: AYBFou2Kaiza+ckOhG4r3ZPxTHD5Bdx0w4ZnKkkoMiElytJSKp4PAuiqSb+9af2s5Mn
	lmR56w32VNV/RTX2Rwy8Pohn0Jfn+1WGIx9gf98cclCK/WQ8DizheblwrEG2gNKc/G5TqQLHKtV
	aioYdX+PCVvNiqWwIsap4hzUxycaRsqq0ilwMq6zM8UVkq7KeynIas7sT7anWpQNIT9lXkJkOUE
	PHQKfSzspGjCcTCmi8nnSmUq85iHfrBBzyIEuSrwiUWkeUTv+2ECcNcGjrRjNrHkCZn3TW2xUmv
	ZK2Aqi45Cc7S6qCVjUcJ5DG4VEDj8hXJI7oU47WP3xMxXvjQDHu/tVxIi/kVwwnvOpqOthJZj+X
	1Aa4L25XpqUvDNQyjv6Wa5oD1OFXwHHAJoQGrAN7I0uX1WWhG1U4JKyNw0CBbvEvEO5krfojq3g
	FkaZmu7B9dhU4fLjhSLx6CSBTpzo50+HErrpauh0q/ZfxVdUEoi78=
X-Received: by 2002:a17:902:d482:b0:2da:dd0a:99e0 with SMTP id
 d9443c01a7336-2ddb69d813amr157911745ad.2.1789938834978; Sun, 20 Sep 2026
 14:13:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113192949.689834-1-lorenzo.stoakes@oracle.com>
 <20260917041453.1029362-1-springbreeze@stu.pku.edu.cn> <CANiq72ko6sGmmUhN4bSfmmmnDjo966_D6ro8y=EGhAw11ZVCzQ@mail.gmail.com>
In-Reply-To: <CANiq72ko6sGmmUhN4bSfmmmnDjo966_D6ro8y=EGhAw11ZVCzQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 20 Sep 2026 22:13:41 +0100
X-Gm-Features: AcwNN1UF2OK4koMxfuVb-f2s0ZLXbtaVivf1KWcwd41G2Lkymw99mRpzMbx8-i0
Message-ID: <CANiq72=vKg0c4CL_h7PcZ8gSZ4U-KgZVXJ1kNA8HNha86+wEEA@mail.gmail.com>
Subject: Re: [PATCH] rust: fix typo in bindings
To: Chunfeng Song <springbreeze@stu.pku.edu.cn>, Lorenzo Stoakes <ljs@kernel.org>, 
	Chris Mason <mason@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Alice Ryhl <aliceryhl@google.com>, wang lian <lianux.mm@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 10:54=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Sep 17, 2026 at 6:15=E2=80=AFAM Chunfeng Song
> <springbreeze@stu.pku.edu.cn> wrote:
> >
> > Since the fix already has three Reviewed-by tags, I assume it just fell
> > through the cracks. Would a resend help? I am happy to send one -- I ju=
st did
> > not want to post a duplicate of your patch without checking with you fi=
rst.
>
> I am happy to pick it up as well.

Cc'ing new addresses for you since I got some bounces -- hopefully that hel=
ps :)

Cheers,
Miguel
