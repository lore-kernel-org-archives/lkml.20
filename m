Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8308D39A048
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 01:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789780252; cv=pass; b=Hk17zToxEd8pi03o4qQejR/wyfAaZSUCG1ZaxrnF/L0U4nAjd5tY7o6Dt15JOy5NT+emrzYzVMdYd8xCWcK7VHwxwx832wzWFyYa45Zlf13scadwRo93bmzNMOJ0pR1IYGOx/uF+BsuWuXBQxKvzp7USYyAPUyV4At8kQKu/U6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789780252; c=relaxed/simple;
	bh=iGzdbSllr8QjJeo+SoUN85/5fREjJOEUukH1vTN+KoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gDt6jynaqLQd8p6N+R2QER408tdgmqk84mJNrtSEEynXKMO4dZFA7vQyDdFMI+/GgUuALjCOEt4ZQWNLlZgURsiBYv20XeQuvLg5jjBSPE1zxRTrIzgBg4mmQHQkqbJCl3ztCdzi2xdoQrglEfUjO79r8FgS9cH05Q6rXl/WUnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ku5ZZPbI; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ku5ZZPbI"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b7be8dbabfso1267718e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:10:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789780247; cv=none;
        d=google.com; s=arc-20260327;
        b=D8awSJmsId0R4iMYWsIUR2vrXIRh4DuByZSE78SIz7BjrQXzYDf4mcmomlzYBBpdvC
         XUZAoYy6u7knNHhxHVluOoVNyvZtlLIbEK1o/COPSButJ7Ev++Sx73hOpfrkrf7IYOVK
         0aCaWluvLBajheWmQCvX0vVeroq1IQM+7Ud0pHFZykCDN8LrKkTvaxhYZ/Ud6NZgJdAU
         mf/mx/9u+Ipq+qC/cgudAnEk3MbgcEn8cnfrn+hQS/EltSIN8uqqKkNbU1LQO1YQukd7
         KgnaoEw3I1rJMdvbAK35hApMuHMNjo5I+EQVcPa9NqO4q7YcUadhYmqliYCGIy6n2plp
         UQDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DGdaTY1YJtwZ1uBv2RCa5jny+whMo/kcQ9jtBIf3Fls=;
        fh=/ACIaCAxyudzAa/aTQeQI3zNEt+v9VKAFVBimXEhZXk=;
        b=UwdPcH0QnMXbcsSTZL82rj1tzWErVVAXO192YOvHDsJ3GMkfmKh0zyMYpcFNQHGO0u
         vj4Aclb56dBk8JOMLdTOVybyCjRKkKG1eW7BS5xi09QFEaVHeTxPlyXww3ym30osxnFf
         vsLyhjn+X6NV2cIfal5R5YMZPRLMzuu3IN0zFXTN+/QMNcLibiXtKTs6YXGzOb5eEdj7
         KAaI+Nv4BFnP16cKkg3ja660dBD6pUSXfRZdoplxM2EUq+Vh0k730wumEu2D/d/OBRJj
         gLWL6sbouFVHyQaJWMjz/8ZEEYUxN8vsluijcDQyXFnH3epCQRbwh1GnB9r7sKexwwmt
         mgTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789780247; x=1790385047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DGdaTY1YJtwZ1uBv2RCa5jny+whMo/kcQ9jtBIf3Fls=;
        b=Ku5ZZPbIm91w7kzyXvKcmdkfmlSKPDj+ikn3KeiK/GwOGSBJ9mpq3nBJSMHiNnbYPt
         jyvMl0IoC8odxWRjDmCAXDRycZmZ2CocvDLMlm/tWUGO4AnE8jyB5KrDg5qKVYyPBfiU
         QBncdpuJhP0zSi2lsJUhfKphm6zsyLbw4MEMCOh9wqzNGEACdz+tpekBeMPb75WaHsx7
         8ZZFNBJKwmZUsjroh7HXTWscFxfrrfdphl+Z/Z2WCEDAvozgjb5q/9IcVtadvjAfTykn
         azh900vhnQ2ZhpP9jPgu6C5PG3g0TSRClPqhk0iKVbKXwsuBY9nAOVj6P6+h6SMSUJYa
         vxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789780247; x=1790385047;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DGdaTY1YJtwZ1uBv2RCa5jny+whMo/kcQ9jtBIf3Fls=;
        b=RRcvpltmKP/pzi6gsY1Mxjx1XaiMbio7QWCixoNN3BA0H9HV81swLt8WKZa08LKeUL
         TJWBhH8448xpXNjNuQFPyV3vN81VuDnIXXfQhS7iIWkhoZdppWgBtgNz0a3mAwzlhMG4
         00E8Hu/25LeeWmqyBJqSFpbbZXckdboEru/Rad/f7dB4CFU0gnyS4rL0EUZkD5y2nkm4
         HsBUUc6/yw7Rpg8Kh7qQZu9yKFqIr0Stt76SmA3DgziH3aZnWCwNetx56az1AQQvuGSf
         lFelvpA1E9ik6pjk3vC3ggLlU62lUUiuR25hhKUhDIpKGfygRcjTv9iyVnRGSNrndUwE
         fs2Q==
X-Forwarded-Encrypted: i=1; AKwUvByRWgPV9VhEkAA4qo2JLxQgeCUYLrODcM83RDc9zEHQx/6hTkAASyzWteRffr6R+rjEvP2rQ9jim1rLY9Q=@vger.kernel.org
X-Gm-Message-State: AFuF++m84PZo5g0BLzmWfaSKjYen8jqf4h0QD9oIF0v/3oTuMflmO6Nv
	jH/9Et1RYfaSVGovTMD4a+z1SVYUX8jVfggJJywGZ5QqMJX+6hnV9gSVoyJqwlPiXnx5XLWIAze
	oPFxZnoFXw+LGTwT8fa9obodH5vkZ/R4=
X-Gm-Gg: AYBFou06Qx+W21nHwhSBVHfpMg6jbpif9zMjs0lAFoSF8he07S/Cz0Ztj/4WcKbw/m2
	CNJD/3F/sgujtmJjjcT3B3hhjne9cIMIDKibToZ5J4x/8Xi3//K4zSwwDsRXWBNo/kOVf357ipP
	FKPFZR2AwLA2wSPoAUla9tK6RP20aOR6UFf6uWYO4vQELiaPoxedOTRRXdaZAkoW6tYQVZxsdRb
	Ij4KceXT50RQ0gff0+gurA3BpWW8M86zSO3jyGQKKd4X0RgRc6GjLp2hR19LvL51u06ewDPReOc
	zEN0Tg1s1IeKewL2Bh0O20xBqaOd0Y5n0vi2ee3sPMJ30G5qXy5prQ/iltOTKQJIAKUxABSaGhH
	7LBkDiqzTxNNhjD5cES1UOAnSpT3RSNJdECD0dB4fKkmxjQGEaWu2SjM=
X-Received: by 2002:a05:6512:3e14:b0:5b4:a8c3:d26f with SMTP id
 2adb3069b0e04-5b8c1809b8cmr1360063e87.23.1789780246375; Fri, 18 Sep 2026
 18:10:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914014539.5015-1-sigefriedhyy@gmail.com> <20260914014539.5015-5-sigefriedhyy@gmail.com>
 <20260916185405.2ccc6aa3@kernel.org>
In-Reply-To: <20260916185405.2ccc6aa3@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Sat, 19 Sep 2026 10:10:36 +0900
X-Gm-Features: AcwNN1V9shfXHkJcE1WXlFxXnTZCibrBttUB3lePMBgN9N4dGzTVVWcdAubNumo
Message-ID: <CA+7S2vJXBAz61SOu+rUt5aqbnsZ-_G_KYt8wXXbqzD0FCSh5eQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 4/4] selftests: net: test AF_PACKET multicast dumps
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Ido Schimmel <idosch@nvidia.com>, 
	Jacob Keller <jacob.e.keller@intel.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Nicolas Dichtel <nicolas.dichtel@6wind.com>, Nikolaos Gkarlis <nickgarlis@gmail.com>, 
	Paolo Abeni <pabeni@redhat.com>, Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 10:54=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> w=
rote:
>
> On Mon, 14 Sep 2026 10:45:39 +0900 Yuyang Huang wrote:
> > +        try:
> > +            addresses =3D rtnl.getmulticast(
> > +                {"ifa-family": socket.AF_PACKET, "ifa-index": dev_idx}=
,
> > +                dump=3DTrue)
> > +        except NlError as e:
> > +            if e.error =3D=3D errno.EOPNOTSUPP:
> > +                raise KsftSkipEx(
> > +                    "kernel does not support AF_PACKET multicast dump"=
)
>
> What's the point of catching this exception?
> The error for ENOPNOTSUPP will be both very rare (not sure I understand
> where you expect it to come from TBH), and also about as meaningful as
> the skip. Just let the exception propagate, it's fine.
>
> Otherwise Pylint complains:
> W0707: Consider explicitly re-raising using 'raise KsftSkipEx('kernel doe=
s not support AF_PACKET multicast dump') from e' (raise-missing-from)
>
>
> > +            raise

Thanks for the review, I will fix it in the next patchset.
