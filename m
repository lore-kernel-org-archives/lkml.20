Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38A73859C3
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788852973; cv=pass; b=oF178dE+LA5aiZzBspMQU8iLWCekd1nIT/mWmmvI37tQ8To3B0NvhwMstaBpUuRcDkXXXZMb7R2G4/rcKkxiBBq2qhxnEgQ4ddNBSocm/vzcNqa8hl+i69cnQ/yvRfTKaZoYnjVqehOXsykX+sFfqpY9op0hXejV/GNpCsWsv4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788852973; c=relaxed/simple;
	bh=TXP8H2J1oJEnyX14qzcCtqrehHnVK+c0H/VLlSeJFyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XeOAqm2yPXg4Gwz7G1eIQopfXjD0CVIhXo/Th5FarPhpwZhi6xmjXS700Ovs5y8yR02e0jg+H7qd+v4MX2BpXZ6KDdnriLo46ZPnf4UAHqyk2UdlhFCZUD/obqjwil7i1MLTVokLybnCtOGoGBqnKGCMnDXlt7fmN/xvQFlSl+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=APMIMY56; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="APMIMY56"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b4a0e5aefeso4563345e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 00:36:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788852969; cv=none;
        d=google.com; s=arc-20260327;
        b=XzxgsHGXoJNI8A8O7Y0um2CdIC3iQqp7N37WP2qrRvhXaGTM8r1M3UVgSISm/eWmRs
         oQCBIsElOaJC/0RuZf6Fm4hX0Ei7uzpTWd7FUi6AKSumJVzvpuHO/rowTSRIvHUX4YcV
         Cn0v+MBlwYx1Uf7I+gw2wq53prj4Hc1+kpI0+rl0FOxmKUhvyfk38ojWJIN9VgNRND/b
         LxnglcYS9zWkmUpqLrRbg9phzBl0mi3HORsiwvAtlQTRCE57uY1lu1P0CNg8ehPD9oae
         8CgfpGWULbXDC00nhewu4R5Ajg5L7lJ+Jp8WBp6vD7WcwTcYLA47BkixK3gCk6d5UazF
         wyow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F1v6XQ7TbQj4QNfNrTJXkLDmDiu9hFvm+f9X7FTcy3k=;
        fh=3Vg+FIuulLxY/6oomWrjXjGBfOLDnRJQS7tumuUGB7g=;
        b=nkaz0GapC6ajj5QpPBYaDjNgce93jLj2GDqA/7vAoU9JFTvt1MnA8y8aaZjzZf0TI3
         LO2u2YWn+a3JUJHvS+DICUJL2RrO3yKrfibtdID1oN2P8/xk6H5dNNcrsinI+44Bjb4N
         MI5OH1UfasvMuQnIbkDTCTyzWh1O6zaKbNawOnbT8E1z33+tJVZ1jNqOpeiot0C/NxfW
         C0aXSU7LWyfPj4qs1O402HQyXd05BxZUEHHmLGXRSE+cWMTldzlEZFBUX6agngDDhhYc
         aZanQwZvtLl+VGEg0Noq67ESCY7w3ychphV+UkAzZTBSAXSyCL6VkWao2QNs6obZvpf4
         C57A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788852969; x=1789457769; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F1v6XQ7TbQj4QNfNrTJXkLDmDiu9hFvm+f9X7FTcy3k=;
        b=APMIMY56LA3spLNYenIqbmylPYA+zKFNK8tiqYin+a64sOJiLtoZuAWhrMA2sJqAwI
         6NAU46LNsfws9z5LgBy9UrLeeKowoKwHPP4cBs6scqrKnF4BX+cS/UR4PzgLCl4xzpJC
         tqVJ5Az4MN0RPBN6hNlLzj+7vd4fNp3KToNMck67eAmi4odebVmjpzPzL+HiOs4MMkwA
         rkZiJ74+EK5u1cg0gdAZl7X2J45Qy4FCnay8tudOC8j7yMfGUPTOCN7MiKumXCRpuxa/
         qSTCREUi17lPn3GRkgrqNhR1xCl0tqKdarBhQREZzHEkALNNXwr4BPxZZTpsjpEIT3kc
         lMmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788852969; x=1789457769;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F1v6XQ7TbQj4QNfNrTJXkLDmDiu9hFvm+f9X7FTcy3k=;
        b=NuGirtCeBj99Qbo58Vr/G6yIl/KVUc89P1kMm0BMXXOUWk7o8GNw65g3DydTlPGd08
         MRi9paNWyb6BLTPnt8/0gFqUDeZs9CD343m3nBkwic22CEznEVxhgWEaiLIxuMkvVaZo
         csomkVjWSi4MHwBK73uxEQNSpuH19/nF3j9xTvtvPRpbFmmJvumqae5BML/lsj6LbeS0
         zgLcKiVZ6Agcort7cWlm1r43DonaoqjdYqN37uved/qWVDVnkf0rILLX+jmqvIoGDj/N
         hu1IO6TBzurZpRg2M7zIONa4rF1ydkrtWQavI6VSm4RTxP74zqNJFWJ8gINJD2YtXMCc
         OKNw==
X-Gm-Message-State: AFuF++mFesfUnLpww7M836l3GPQdUv0gJ2qw0mM7ACtTJgKrkq9ANjJi
	iuFnRI8y4a365k2QPQ3cHW+4btyzprUUaQHlgB9KVYf5B9WnEMqkG98WvbJxfInQxXRnAePA1aR
	zS03LAdBQDXUyybEI7BqFtVytQ2IAPwnuC2o0Tq4JWw==
X-Gm-Gg: AYBFou0DLyp72NFsJ3Pykoct2187p8UMnx1vK3/Hnt2cSw3ZZM0rco39c4PMAynbwuR
	5OPsweXbYqWrVkfwi6c67zzMEGdW9V3EuswrtMFHXCPmpvteaxH0TnyfwKXQaVZexe0mRrVUvAE
	DSx+Ch5TBCIA4BDSdrRzfkpNMxcSPCDK6vAlOEXREiPQvUr5DM0spf0RKV+p8WsNojHmRWp4ei3
	8AYIS40+NPGZ/ts6G4OOTSvPPJTA/YYMZAvK11S0P+PX6TocYGT7Ks8b9X583NIFZ/Ol19fpsY/
	UE5eSAkp17r76zX7lqGuW7UT22meK1LVN9bKCWGDCkQmpXuiQ7XHRqus4BUWyrxnhKdZVrydb8U
	k60quHrQaX9Fq
X-Received: by 2002:ac2:5684:0:b0:5b6:4ae:5b80 with SMTP id
 2adb3069b0e04-5b617081f7amr4126010e87.30.1788852969626; Tue, 08 Sep 2026
 00:36:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902092434.85096-1-marco.crivellari@suse.com> <878q5dovqc.fsf@trenco.lwn.net>
In-Reply-To: <878q5dovqc.fsf@trenco.lwn.net>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 8 Sep 2026 09:35:57 +0200
X-Gm-Features: AcwNN1X0tgHVErGnWNTAtj-AwHFXSO2JZlSTWOTODULdjQcefAhwNCFCUN_CUiU
Message-ID: <CAAofZF6rNRbapgEUokgj1x=Q2AKb1XqMYv-9vXvELmHPHn58zg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] doc: Rename dynticks-testing to cpunoise
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Michal Hocko <mhocko@suse.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Valentin Schneider <vschneid@redhat.com>, Waiman Long <longman@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 6:46=E2=80=AFPM Jonathan Corbet <corbet@lwn.net> wro=
te:
> [...]
> > Marco Crivellari (2):
> >   doc: Change dynticks-testing repository name
> >   Documentation/no_hz: Change dynticks-testing repository name
> >
> >  Documentation/admin-guide/cpu-isolation.rst | 4 ++--
> >  Documentation/timers/no_hz.rst              | 4 ++--
> >  2 files changed, 4 insertions(+), 4 deletions(-)
>
> Applied, thanks.

Many thanks!

--=20

Marco Crivellari

SUSE Labs
