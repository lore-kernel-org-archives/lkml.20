Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8DF49EC4E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141997; cv=pass; b=EtJ0p9b59dYeCHNq1J+WN5l9Zrob8rBLHyRUezr5Filu7028ziC5ZJ5RX7RgIs7ukJlb3ERJBdpnqiV7vfmAbCt5ArnOJQJsUnnjErkLk74hlJ+g6WXtx+V90iFG0BwGciwlTr/jKEVVpC+Gw3t/39KT+7DZxQmnoDqxbdjfac8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141997; c=relaxed/simple;
	bh=Isnr+k3W8HxLA6E/Gz/qk3n08kGP4pNs8ypyyBdSk9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hmRc+Iiu6AGI+RpwDOY+AX2CUxSsq9XlLuSqjzj6QDsAFCiHUCp2oZpBp/Mu6zULnXItCiyU6ctqXCmNuPQhCkaI6W0NKgpM8su4VRcY+nVaardjEUuWUqpUxNtamg0XQ2epOYG4Outo1Fy+LJjXMg00dPjngnYFjSJS9s7KmTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dtU1p42f; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dtU1p42f"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d6ff3aca07so5715ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:53:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789141995; cv=none;
        d=google.com; s=arc-20260327;
        b=EnsyDc2n5RkkDVUDpDlwlORfF0MqWITL7+2ycsFdvhFhm3BEOzW91dlO5k3ZgWiSZF
         MZq03rSGstjOGzR47nnsuZgdtEpjWBDaDSEQpRVMpG5FW/SGZv0edIr+HK0qiYbqcZcK
         ePGXH0JImidCIUCw7YtUkEynSqSBSVJSl0HS6Wxj+g9qSCJFCWn5qjV1MeGtaoE+fWMw
         BfLGJw9XnnFLqAtznriYE5nUqhIgjcbmFW8AJA1c/BfxbA6pgKafcc6WE4p/HuZvMS3N
         7dAGDVkf2NnhdvrQ2kjJ+1hz6ANLAfB8GmVT2swiVlrqY9ADKklKcDeWi9p5qGvzZ0yc
         lVzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Isnr+k3W8HxLA6E/Gz/qk3n08kGP4pNs8ypyyBdSk9E=;
        fh=6GIJpX2deRt3gcm3FOZ5THjEpQmDhyfC8tPBsl2wj7I=;
        b=sKOMu/rYe30S2EhIg85wjPmw99E8GN5Boap7Lca69/tMMnjXPo4UfKfHSgJWJHXKzX
         c00AHVdDxWC9ArKlfSpRrnnPHZh7sIen1Hp7kR/Iqy9QgDccQxkDlJFY+WchsjqKRKUK
         qfk+kEuCI9ZreAwd7arM+c9cqWInwh1tHabiElCazuuBjkjyruOMZEj0/eQIX7Wi/i5n
         kD/ICsj0Wm3DWCmmA96jXKiWTMaO1KFFpd9yIM+6seCOFhUrz/I9Pk5dLkH2WTXPYb0J
         QsbNqPpwHY49TTWaINuj4HtRpficNDCv48sYYRnMVyaEL7RklhYT1ZOUi7QCsyaTZE7w
         gT4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789141995; x=1789746795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Isnr+k3W8HxLA6E/Gz/qk3n08kGP4pNs8ypyyBdSk9E=;
        b=dtU1p42fcC5IxTqlB9Qc3t1SnG6cNz5EegmwpuJXs5RZ5XKQPVZkUjiscDCWgZ8ih/
         MKWJJHjh0VoC4QcS9gNPrQUryy4zUGVt+R3gtUzIWG6hLRHoQyvz411jcMJ9FKl3Dz6/
         tCvLqL4LrDA0nymZrBlvFEIhNQCfwvahukJu6KgD0mugJa7IQ3V2ZPSGu8PU7THy193L
         5pwRMN4FOWh+WtTx256m0m5hd1tZx0oJctILsmLFl594HSaUsI+ZSMpi2nf3JxMm39D6
         wIYRPKGizx+WKFEMZlbHLdMR7CKQqIEGdzrDBVEoUhJkkYScsIoj6Y/CzasfrwNHKF9s
         aroA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141995; x=1789746795;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Isnr+k3W8HxLA6E/Gz/qk3n08kGP4pNs8ypyyBdSk9E=;
        b=RvNg8UWIYowFKgnsk8Ba2X1wZtaJHcBpkwtWXNWx4SeMqWJnQGfHFGfeZ4ArJATsJR
         w4geNtRyy2LCGDeX20w3sXSMqfxPDtM7a+z7y24/p88ywFlb2oCcNINeNG5gLtFb6XJU
         131o373FXgS7aoIlLilRH4bYiah3BLdXvrWLH31joKp2JD+ZmMIVdSNV4z/v57z3oyZN
         VpJNl29bClwdbtvfTBw0x3lYH67cF84PsIRwB63pSfS1DWVGJ/0y4RnSZkCUH0bsWMsN
         eq5L7FpKwQ7l/6309x3ElnRg21Q5qUCLBwKGQ9GouME+60RuR0Pke//BOO9F6n5UdHYp
         tvUA==
X-Forwarded-Encrypted: i=1; AKwUvByJIV9mx5srC5sEi4Gbug6q5QApjE8RndTD3YAqse4DVTrs99KZ79sj6tmmtagQJk31XEmRNyOXx3B0q2Y=@vger.kernel.org
X-Gm-Message-State: AFuF++n1kWxwemT42oPZiSwE3Yo/hnNKkd0Bvb4CY3NMQVdW7+gcNnPi
	hpqmWSkrYfkuC138fgyEPQsMTwDILTOlmBrflXN2RUan3EsdL/QBKlIa4ynnSH5aIZMmKf1o4jW
	HorM8gwBnrLxAEY0pBMI38fuS6XFAVB6ffI3+cJLc
X-Gm-Gg: AYBFou3qErkI0spHV+5mFq/4hoFTdBg+YQyqp9TvnqvVThtVBanbg9RZV/mgXejwsAJ
	U6886fv40YdFogYVJDtzDsSPZ5/dJrjCUgGUN80/aszChr20hrnul7oTPqRao2IYFb9ru2Q4qa8
	/3nioVJVZ+lYNJuUmSUKeMFKM43msrwFsS7KEWCI2wA7DEViUTPsnlNyk/EvOgQTvlNZA7dnhii
	OQoluK+9qA6earDi716V0Y2JYLece6Mum/VxQ6WrPr4RjPS4LO14yppM2dJMGXO1AVoDMKQMvTc
	L/CjTSQiY++6waDHOxa8zrIKi1BXksMW5Y4qdHektPCvhJBjj60YXydDjnEf17WEdHN0vNMIjoZ
	12lZUnmAaI/8a1ThKn52uK6wCRQB0O4mvRy5GseLpM19422vc8V6j
X-Received: by 2002:a17:902:cecd:b0:2d7:2a35:d14 with SMTP id
 d9443c01a7336-2dd2f56c2acmr4256765ad.11.1789141994232; Fri, 11 Sep 2026
 08:53:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-uring-fdinfo-tighten-v1-1-47c62a154aca@google.com>
 <CAG48ez1dbEXQgvvAxchiiakym7KJntGFJ3f_obfnDwFouYZQnQ@mail.gmail.com> <5a656a9a-afff-4309-9007-2fcb6d3ae1f8@kernel.dk>
In-Reply-To: <5a656a9a-afff-4309-9007-2fcb6d3ae1f8@kernel.dk>
From: Jann Horn <jannh@google.com>
Date: Fri, 11 Sep 2026 17:52:37 +0200
X-Gm-Features: AcwNN1X5POQcXKEYTUYARlopKaBVUQhEVDC4xGhc1P6zKPSFd5VbX0gIb_i24Zw
Message-ID: <CAG48ez2J-MwLCS1NHV1+Yu12JpxiiL7_qfN6+37CAdeVZ8wJRQ@mail.gmail.com>
Subject: Re: [PATCH] io_uring/fdinfo: ignore IORING_CQE_F_32 in last CQ array slot
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dominik Maier <dmnk+artist@google.com>, stable+noautosel@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 5:50=E2=80=AFPM Jens Axboe <axboe@kernel.dk> wrote:
> I did spot that as well, thanks for finishing it. Your fdinfo idea keeps
> on giving, at least this one doesn't really matter :-)

Ugh, yes. I hope it is at least somewhat useful for debugging, and
doesn't _just_ cause lots of bugs?
