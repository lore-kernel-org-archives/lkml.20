Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792790502;
	b=C62+I145o27/+SEs6rHD2SU4Yl9C6T/PJ4v7I4TFmmH+WB3ymmniE24SLoD6YODTOeHn
	 HLBMa7XQx8xB/km7GOUaq3oRWUbhx4tVB6x3JkOBCR4+AUmQsSVgu3Bhownwy/OYL1Hd4
	 9G+76w3yUeUrwFThRYIZIZ7OCSnWyhGYdnRwmvebg1z+rW9gQSUJwSGLkhoOyt2TM9o+E
	 C2V7c8LfxGt37DWx1n2egKHe+QG+e5GA8uTIJlHUoJDndwzHXo301/5SGrk9WEH8oUhxc
	 FWZ09nABjL6mq9OvICKZVtBcr9/XzuJC8VCEuxHkPVDzNUnr257gXHZEsCDwzM/ybIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792790502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AE0GbBfNma+sNfNfxTvMZspamc+IJ62E4ebI4HKJzHI=;
	b=R0dzLT0s76F9l7j5sM6fduvq1UdIvFg97V/1kyCkYZ4xpollvni/+jkJQdISGGvhvwy3
	 n4WlZbP4lae0xBc+zatcpRlA7cwzNKKu/M58tIfS2t9BSX83keOmy47YQYivx3B5IAWOW
	 S2I/rUiNYJo0k36KZrvvr4/EEA9zcB0m8gVPVEJw8RdOejC94D6ETcqb3wJl9mb8p/hXC
	 6G9KWC5/AH2vk33hpQ2/UPkFHpRG3Tu0gRaed8YGrXL60Fl+zeOKrooCLJosKEP5yxlXl
	 J8agWU6ToTngUfKpOXnblzmM2munXZkuc+qhL/EbMi4xxboBdbDhdBR2GTvb6IdbcSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LNibhi+i;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FA8606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 21:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88FA8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LNibhi+i
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b413b0a974so1448112a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:21:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792790501; cv=none;
        d=google.com; s=arc-20260327;
        b=CtVgA+GNrKdSnA1Wit0VYZsxWESXmB88O2meQMpZYDCcZ4bGcggj0E4oUvSQ2Bb9bi
         xF5bX1QNDnAXfCmWvOb3rII7cXp9h0gHekgGUOstCueTiAdcnKf9AHJlQ40Z+FTXUn7/
         kdD0vJPdCBdfH98g4204vKV+3hA737YuGG95ttrGIzMBoicdZbV0LCB3MyCnd4CmiBjF
         gdA6ZNweXOXdL34uFa7fNWHJMjQGzs4Djp5vOPOfYgoiRFwEWu1rBziAg4WHWSCoppZB
         +tAPRM0r60iNa6+K3RCfxa+1IdULos9rvQz2QiEoY9R5nKcg6vzVsPOV/zOy7NhZ8Dfq
         brPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AE0GbBfNma+sNfNfxTvMZspamc+IJ62E4ebI4HKJzHI=;
        fh=At6wdW2ilCrLTx3ye3Uw1NqGAQ9R4P4sEFzdylL4rBE=;
        b=GpWazY24FH0QrWhx+oU+r+CCcusQm0HoxablMDyTgcCHhf/cWAQJ9BCAzpSq0fLKpD
         B038QYdlsxxynKTU1fM1frGBgDZx0mtxF/iGOoZ1d9M7Q02QzqCZMHypeLmiSFLZCoyD
         7LZAZXa6NW50f18+AT+cNCeCRWUZltTq/0Fa68aWkpxCrZQvpMGYDts6gHxJl/StRPr4
         T0NEb/8iaVyraMoKQgI3o/qyE6yEIzQRp8c5CLZh8VOA0zxiG/9XRfs2Dm8QyFcgVtCc
         Bedtk444fnuWPaY+lqseYNq4maaenQsNXztQkf6qUpdj03aTZ1TawR1k2RXtZ9yomLjy
         yWvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792790501; x=1793395301; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AE0GbBfNma+sNfNfxTvMZspamc+IJ62E4ebI4HKJzHI=;
        b=LNibhi+ilzYWV0TvVwj/ILgZRg3O8BNOUVlDKMjYBbf2alSGrhFE1ImXw0sfRqOrlW
         3tAwPIgjpg87VEAhnE/KWA8GzYxTANeK7+NOvkfGQc2CVED32HVR+a9GSDQdHyudUEGQ
         QoJicWJqQngB8VOuawmYrCUD0dsArr7awxJgAoZZJ63udfxlxKKpLXzrSiIK6ih9VDe1
         vAKuP35JnKk66f33Qg9xjFzX/HHw30ohXb4Cp4T1ahHuz6pfTV5JVwO3U1ITbHx7ISt1
         x2ZiOK0EfWDd792YmowRViLqOzzTH6wOa2hF9F1Dz2AD+3rbCof+k6BSSj2p0whsLliN
         99cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792790501; x=1793395301;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AE0GbBfNma+sNfNfxTvMZspamc+IJ62E4ebI4HKJzHI=;
        b=puxomCdvsgP8iyZqIh769h1MVxKw8zvFELMDucJQeyoGwGLpFhlS6rWlLjCgEGw08W
         atberYFogxcgqZrPpB7pDcx2UpsMBT10u899byea3EAW2/T7seAB5RNUOmyb8X2vlNHN
         uA9DJiy2NLmGel95W3hZKAhP3Nj4JFYokTspPHl1YSfUiyZbgblxi9RmqPhNhdP1o+lM
         E+C3Qa6QXHC2rnklEMunJpha+z0ICNenRtdfp/IN7DGLsqqfMryR6Y35NmQq3zb1BUcy
         QMTgUBk7KcTPG8sVuPQ9szugTgbKQHhnoE2+CGXKqDWM3rFVjEcixP04q5WXzyfdVNrG
         n+Ew==
X-Forwarded-Encrypted: i=1; AKwUvBwAwOH0omUpFUdApeTzHwjfUOn5t3QbSD3/Ol+WhdX7tHaq3uUpbr9ARXzu3E7rW8HmJlmXP8o74itcYog=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCQm0F9FWr0znzgOdxc3qgH3crnHu+VnDFpLsfppGzR8ey9nrO
	YAYSDtI/VjY6vNJTz46Gb20681j793r6/lwWItysrVuo7Il3G4sksRoVdj7iHSVei0XAtZNPMhm
	+BOL14zkjAGm5SeS8xSLnewDJHubraOI=
X-Gm-Gg: AYBFou2PbEMMBBZDo36G6w+z1b6xC5trjCJbkigERed/R9gPcaCxvIxW8JDm6qo1mxl
	PoyFL6bqMd3ehMFBz1iW7nV2i1y7LJW+QsYrdSRQbZPjNS+EcYLGyhXmK+BS608np74FSDTK8hF
	KZewXbOedxqdTTAnHWZvTZi6DIPbpYyyqs5lqLSuPN8njTHyoiXHBALcNXHdN+NjYid/ie2p6Ae
	Tfd1czlYR0atCzjMybv0zDSc/f9Rt4hQdVszLscemGUB2dVYO/G1ADAVX6NsSyUX2UlwNyOF8jK
	elEPbbR8J4U++LgkSPX8jGbT/S2Pd992vohMNO1emLRkI7Ky0hMdhV0qoEEZY0oUlMoN0Pj1xFR
	dpLCbN+WZK7b0DdVlTGEH8R9KKjDxaZ5pitsep/fOoPjg0Eknh29mbq8gDPazDjO4ElPdF2wF/0
	O+rOP/Zw3td2WWxYEIRd7xW/tdp7jmWZ17hSs9QsnTdGrnrUyx8/pcqQBqMMyvL85STYTrf8HjW
	4qOEb2RRenNO6dkZUwAPmsg9G/BsrJ0DDaDqJsQ/hjVp3Sx/A==
X-Received: by 2002:a05:6402:1cc4:b0:6ac:bd53:d29a with SMTP id
 4fb4d7f45d1cf-6b442a80c06mr508793a12.3.1792790500756; Fri, 23 Oct 2026
 14:21:40 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023190653.70741-1-rosenp@gmail.com> <20261023221424.2722795e@barney>
 <20261023224140.465903eb@barney> <CAKxU2N_1XgjVPdSrCMYzZx4Rb6yjgEe7kBZYyG4RASyBv5BtMw@mail.gmail.com>
 <20261023225745.696eef3c@barney>
In-Reply-To: <20261023225745.696eef3c@barney>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 23 Oct 2026 14:21:27 -0700
X-Gm-Features: AclHuK9GRIFtl9lqIXhWNWjMucByyfNnLezcnXbef4n3dCMQ4w9XYcqaCpFWgVM
Message-ID: <CAKxU2N9i6Dn1yKmd-_9DvET6P_GNctTywWgOBXYd2tWoWKY=Sg@mail.gmail.com>
Subject: Re: [PATCH wireless] wifi: b43: map the RX buffers DMA_BIDIRECTIONAL
To: =?UTF-8?Q?Michael_B=C3=BCsch?= <m@bues.ch>
Cc: linux-wireless@vger.kernel.org, 
	"open list:B43 WIRELESS DRIVER" <b43-dev@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 1:58=E2=80=AFPM Michael B=C3=BCsch <m@bues.ch> wrot=
e:
>
> On Fri, 23 Oct 2026 13:44:44 -0700
> Rosen Penev <rosenp@gmail.com> wrote:
>
> > All code is tested on an Asus RT-N16. It runs on non-coherent MIPS.
>
> Ok.
>
> Describe your development process in human language during patch submissi=
on.
I assume that would mostly be appropriate for a cover letter.
> What has been tested?
> What has not been tested?
> What was wrong?
> What has been fixed?
> Why is this needed?
> Why do we need bidirectional DMA and most important why wasn't it necessa=
ry before?
Because the codepath is not fatal. One or two duplicated frames. Big deal.
>
> AI is great for code generation, bug finding, etc.
> But for patch submission, pull requests and commit messages it's absolute=
ly unusable.
> Please don't do it.
> Write your commit messages manually, please.
I've been burned by this many times before where maintainers ask me to
reword or mention something. It's not practical and wastes everyone's
time, which is why I'm almost banned from netdev.
>
> Please make your commit message be to the point and easy to review.
> And please slow the process down.
> You don't need to submit patches right away. Keep them in a queue and STA=
BILIZE them LOCALLY.
I figure since wireless doesn't depend on the merge window unlike
wireless-next I can send them whenever.
>
> Please do a little bit of research whom to To and Cc. There are scripts f=
or that.
Yeah. All of this goes through ./scripts/get_maintainer.pl

Do note this is an orphaned driver. I expect feature patches to get
clogged up and Fixes: to get in a bit easier.
>
> Thanks a lot.
>
> --
> Michael B=C3=BCsch
> https://bues.ch/
