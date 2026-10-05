Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F8248CD48
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 13:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791206741; cv=pass; b=tfn60zNLZ8Qxx16w+foJ8RyXu4XPt0FNoSgwTF1CmxxakjZb7kuaAznFvVrddH9Y/YLMUTrfF8Wq7yTVLZU3M4iwKOfyIUzkxtNAWeWGT2mZID0DCYEhrOYfKlrOoeVgxoKAzMZUkxvcQo2BRayd7ogujPEJdGdhyDH2X/bRZ9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791206741; c=relaxed/simple;
	bh=wMm4+8IRfPPcvvBENvkGYtZvw+exf4jHBcuNGRKviqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KepQBaDhib+t8fzw1S1Mzj/3BrsbpaC47KqJq6osHyKhCI9LihkExatdrJ+aBK4uOg4jrQoptjEzCynXOHPEA7nz0gTeEUIJVVivURuftoRDxn5rnL78lZ60S2CP+RI4nwGAkljmW/P6HFytuevnO/5yUFkJk1XvALky0WwbA2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cellusys.com; spf=pass smtp.mailfrom=cellusys.com; dkim=pass (2048-bit key) header.d=cellusys.com header.i=@cellusys.com header.b=cFyvQCLj; arc=pass smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cellusys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cellusys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cellusys.com header.i=@cellusys.com header.b="cFyvQCLj"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a6124046f0so18214231fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 06:25:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791206677; cv=none;
        d=google.com; s=arc-20260327;
        b=YW/p6lJk867M8/afdKtzNtbu5+HFTbjhOGJJsNiCuYL0fsVPoqcQmIBIx8ImGZ3tjO
         m/4sCYnRUmJk+mA9trIoBEyaT5T+BnFbiXxlO1N0ntFCpwY0KOiswZDLhfETwyhO2PBh
         bRXR1R7K7LxslE3AQrcLSeMueg1rSAE42VAmBlFtSWFljxik/SXp9ntTaEH2OsmuBp5T
         FcBWGeOkKhcemB4kV38Ud7bD1uXhg2561Q6cP6gpk7pVHYyeYJSyRWlQrSOcZx5frYhA
         yqPDwxfZ4/wfJPIzjVCWDSNP2le1ONXOhNoMbGQL8/PUNSmsyYUz/skUTGhEinFSs5oX
         vnIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wMm4+8IRfPPcvvBENvkGYtZvw+exf4jHBcuNGRKviqk=;
        fh=geoZ8e+7+SSdWe7MpWxI95r052hDMsk/Hb1m0zFvsfU=;
        b=ckrYPBSpfRRqNM3urjN9eJFXDZuED29n0p7f5ivakK3FHhKUjMp2nd79kG1VPAyoWx
         oyj4CJ1Y/ALNziGC3pixtkAUShIZNJaUfkijQGLRE8fpCc2FP4TA26AoqfxDt3iWA1YZ
         bYsTIdh9EbSDPO96UsiqSHbYSzA1Vv19ZpkKcq6+XLreMN2pdjQa7WzHqVUHzTxl8xSe
         skRHg8dBYzE5odAD5i3lVJ0+804pnfmRE3BvH0ssM9AyhJUafT1f/k5yNTh7V9IeQxkL
         U1XTiZwtW7SF6zZMkAkt8F8BMbES1r1hvqetKZ/v93ZzuHqvkIBoFu3q7j6DIaJ3BGj5
         m/XA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cellusys.com; s=google; t=1791206677; x=1791811477; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wMm4+8IRfPPcvvBENvkGYtZvw+exf4jHBcuNGRKviqk=;
        b=cFyvQCLjUypgXcmsl0fZCDaFYajMu8sADXXu+TiJuRALLKmP4XgkIenuBaNzG9ZeDL
         Cf35oe1gO321Dr/V/lBNdtIAdmTyqHtDI8t7XResfKJXkfjV+Me+M0j04p2QzynGF22A
         g4oA0O4cbiH0QTEDQBonFdhxR9HibewcM7T7EGt6fv214ieZyYsm+GQa7UaglUXVrUmo
         4R1PoBuSsgeXkn0m3jH5X8Jnguywjz9NBKHuu6KKJElwZh6FUykY3jkz4d+jzR/ELplv
         Y9YdmJJ1r1W0uTBventWqIoWnGbkpW1DcewtD9fCvy5qUEBaRs7SWHj4j6dBwwS+YX66
         xdjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791206677; x=1791811477;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wMm4+8IRfPPcvvBENvkGYtZvw+exf4jHBcuNGRKviqk=;
        b=KusL0ZfTdxeXNEd98DEU3X33evOp5w1ngw7Gg2E+PoQkink5X8hSbujA9pRsO0XSrM
         lWHnT0HZbAWyMsn1Zl0HG6aYeqr5Mw6vdMW5pwocis688keOdK2UgG/6yeQZ0YLe87EB
         VdhmB8G4czYMiXjs/ColhBx6Tbg5sKKlPmpj/66mLQ9LTYFrvxpu8XrtEMWCSjsVYfev
         MIlB7EYNC45i3DPgMb0cenWA5R+9HEpMFaPJrInsPMckkrkz7Q2tEh3YWlM+Xu2wtL5e
         M1JywJgJltAnJ3H33l2/Z6SKkduZ5T8lA6bIGlvW2IIAgNwXflxE2xBI1vbeoVjddU6U
         WmTw==
X-Forwarded-Encrypted: i=1; AKwUvBytZQcdEOEbfOZx8+8S1aa8X4LO6jbZN6BqM/nOqDG6mJHFk4jjiQpmQSwl1ToD8CKEqB3BNpN0y4MzkiA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1KmA96fD7CD9Z4fQ20D/Bx1lZW2Q4c+wVg87X1VAzB5L69xP6
	fvhY6Tm9YVMLbKYWXygncNnroWdrllTOx6EE6/srunPDPfSzn8QZOHu0vQNpZp/TQ8bRyfHc8Ug
	HHRoDgzEPKpjnyibNrVFKrNQUpJ3ClYSVB/Kn88ckdQ==
X-Gm-Gg: AYBFou2VqziCQ4RSFxOP7a4Yp8Anq1Q96xv+C4xfRAAX3qLSsn3+HyK6CfL5oge05bD
	y5B00YoQJY7zR9mz6oSKXOGmvDJwC3s1QhSSNWm0opdjX0sLAZBZb8qpHpnJmqKyqee6uTGMBLJ
	lXkpviETW4Vy1hIl41lp2LAotT7OMCVY7PlmtFTCJksuzNtUVNbplUULgESXyGAR/vHtuzOzJ6E
	60oaMh5qKFhK5acp6kckEX9kuT9FQ6CfMgu8GEtSTcYBOWk0J4q9mCCtPjz3fE6GDfK6GzLB/Ri
	O3Zxly/4znR6qNhmtMugwVg2mhXz3ivWWGlIfgwZXA06kEB0hJaSa6uw5I/FvK+zLA==
X-Received: by 2002:a05:651c:15c1:10b0:3a9:8546:ee13 with SMTP id
 38308e7fff4ca-3a98546efc0mr6805921fa.19.1791206677180; Mon, 05 Oct 2026
 06:24:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928190401.1641260-1-wbriggs@cellusys.com>
 <179083835206.434549.7959555054670908229@kernel.org> <CADvbK_fps4LrNX36j-MBpFmc-S5bQXhqkBgz+HC2RRuCvhdBXg@mail.gmail.com>
In-Reply-To: <CADvbK_fps4LrNX36j-MBpFmc-S5bQXhqkBgz+HC2RRuCvhdBXg@mail.gmail.com>
From: Warren Briggs <wbriggs@cellusys.com>
Date: Mon, 5 Oct 2026 09:24:26 -0400
X-Gm-Features: AclHuK8ql_DkcT0uZ-eQZibVFIA9uOYVqWoejjFf20pjZd3FIRsV8Zs4rsgIXHg
Message-ID: <CACjaXw61gk_5OFcaq4SxNCWqZJEx9j0U80_J7F83BAmHRxkD0A@mail.gmail.com>
Subject: Re: [PATCH net v4] sctp: carry peer capabilities across an INIT collision
To: Xin Long <lucien.xin@gmail.com>
Cc: netdev-bot+sashiko@kernel.org, marcelo.leitner@gmail.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, linux-sctp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xin,

On Thu, 1 Oct 2026 at 12:11, Xin Long <lucien.xin@gmail.com> wrote:
>
> On Thu, Oct 1, 2026 at 3:05=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wr=
ote:
> >
> > [Severity: Low]
> > The commit message describes this as an INIT collision fix, but doesn't
> > the same code also run on a peer restart?
> >
> > Could the commit message describe the restart path too, and could that
> > path be tested?

Yes. The commit message will cover both callers, the INIT collision
(dupcook_b) and the peer restart (dupcook_a). The v4 testing covered the
collision only; v5 will add a peer restart test, with ASCONF and
RE-CONFIG sent from the surviving association after the restart, and v4
run as the control. I may need a couple of weeks to get to this.

> > [Severity: Medium]
> > On the peer restart path (sctp_sf_do_dupcook_a()->sctp_assoc_update(),
> > state >=3D SCTP_STATE_ESTABLISHED), only the inbound counters are
> > re-derived here. Shouldn't the outbound counters asoc->addip_serial and
> > asoc->strreset_outseq be updated as well?
> >
> > Should the ESTABLISHED branch take addip_serial and strreset_outseq fro=
m
> > new, next to next_tsn?
> >
> This looks a legit one.
>
> Since asoc->peer.asconf_capable and asoc->peer.reconf_capable are updated=
,
> we should address it in the same patch.
>
> So please follow the report above to update addip_serial and strreset_out=
seq in
> the ESTABLISHED branch.

Agreed. v5 will take asoc->addip_serial and asoc->strreset_outseq from
new in the ESTABLISHED branch, next to next_tsn. On restart
sctp_tietags_populate() keeps our initial_tsn and sctp_unpack_cookie()
bases both counters on it, so new already holds the values the
restarted peer expects.

pw-bot: cr

Warren
