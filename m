Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792977449;
	b=VpDmCSMHFUMGPgpIQkyrJFwiQD4v2GJaAGY61MCeKP39wQ79CWlHboxzR3pSZ6hcecXT
	 NUzfb+oW6Zm9fz5PVFDx0JlRI2d6V/iHrvPACpDosf/wkMCCp1E0V8NkBbGlkagtettDi
	 Ata0SLOPnIZ1x/1u4iJ6bZPdmhxfsrb9F9bGYy0JhR3dD02JVvg22kjnIl1Su/kaYotFR
	 0GvItfOJVFqGIaSUjdvOqrfQ6nKCDRdL5AwBY+lbc3ErFf5VjxTDWg8hH5ztF0xPE0b6Z
	 dLUF+ys/EBX34joR4Yh/KjR5u9xvMVLbbmhC8rfBlAnxOV2TkDKv9H0NhEbvdVVZNMQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792977449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3JHKNZG3E5vHMpYqgouUpuv8xtxZ/WRsL+FJ8mE54ZM=;
	b=ZLCc9xhIxWioUCKbA5JlmznfFCqEnkD8zolv58w9QpeeIyvTyhcVO8TZ+0Yf4Q8tAGZo
	 bR7vay5mVFvxyf0a20XGe1McKXmv3wwmrtgYcCSffYla3I6ZVJKuA/dR5niakwGrMvHmG
	 +RRrlOdF0eZ3RAfr6uAJ51ux5JlKPtCayGGk88c0g9uDEQdo5mJf9/wvGRocErN5AzP/u
	 EAcwNbtUU7/lp5l3L0/rRQYWmkcGDBwVGT3GHbrEvpxxiV9+fMoVvJs51ZwSQmjo2w4CG
	 qTMn3vCG8Vf841FjGaDBcHVEyL1YBW7D6f03O6RdHNNw3lt0TEd2FQ+MAKWcjBPPMIQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=BQy1fTrT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9915606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9915606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=BQy1fTrT
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b2232d8ef5so4224027a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:17:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792977447; cv=none;
        d=google.com; s=arc-20260327;
        b=WX/UGl4LVJo0mAgftSlRo48tE51vSkNgJn63kZVhmqz1mKE4ik+H3rNXdlbeHRACjB
         3pYIXnlhq+D4+Uu7dT9lHAicrTCGeIOnJjKZ2oKGe9qVEcrSlHCLEdMDwJhXB00atAd+
         dCuvzSQQjOWRjXEaxOB0SXh84R5KHLy2tPtdoP/YbHjl75JAvBklH6lkujZ6NGbuGSiE
         OhDQuvAMgRAVxyKngi3unS65l2+sbnukHv8KUEjZ4mU9S7lCsw9UU53vP8Rmvxx3fM9/
         0zsBXihbYVCwc6q3u5RjSBKniEUL402B+V19FDZMJMyKx9Wc3heCHzMYf/aDbatYfA9C
         Z9gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3JHKNZG3E5vHMpYqgouUpuv8xtxZ/WRsL+FJ8mE54ZM=;
        fh=hhjVT3yjVIKykEz0sjWtWkLAh6SdSBTikpCJ7YMPDj0=;
        b=noYKLyn+iaSZGtfAm7MsUcpL34Holy9qjJfmJaxDYRy+lblx09dn0CDOt1X/adQ30L
         A55ppoDvAfjCUic5LscAQGk/sSYmOJVLVQtWdObZuXWv+s6sSUzMhbLdtwgvuuF9crrd
         fK6JgymvlRAm7ql94fLMg246erWU6zOPZP2r1juU0tYoRMxHLjotgmxonsq5TkM6rKQo
         /uviDGWrhECzum0/8HIXfIEh3vdCMbOGfis/X9Ac5jazkgIGqK04N4OqD7dmKVmiZGY3
         QdH4BN8DV3PnwlJnMyrGwR8/2s64uR3HwYY3EvsRSGsJ8oiSx+JD4mYDK0Mspm0F5tbr
         y07g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792977447; x=1793582247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3JHKNZG3E5vHMpYqgouUpuv8xtxZ/WRsL+FJ8mE54ZM=;
        b=BQy1fTrTJ2nFZ2mZPKWUnmKNciPcXdHliwxaU3A+xn+79lW5SUCZk+0xpyi6S2ZW+v
         amstcN1WQI5TZwT2t22w4cxM7a5K2qfU9UzvWyFV93IRpdE026go4TRj5Npvggxwms6K
         WMfItGr7lhebDSt3APxTpQP3THpxyXoR6nqb7UjIUoguYLiBi0eDTCVTNRnBmj49eUlu
         6rYo7fRFMAuFjhyIVixzBbe34XVo+Mf1bZ4yqRAjkFcb0EzTpOfhhV6D/BT4oLE5aSPE
         XRvNCaALYWZxLj4hDOb6LFtIK4iUvdS+asR8hBQ0i6VLg0B2Z2yC1mP2hg7Wk0RmCGnt
         3F0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792977447; x=1793582247;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3JHKNZG3E5vHMpYqgouUpuv8xtxZ/WRsL+FJ8mE54ZM=;
        b=vo3Ibg735fprpf5pMZgVOxZulFXilewhVVfty6EBrsu9MEQkx6zcZgWiU3NY1Hb8/P
         d36u7OjokIeNkDppf94NJSqIBsB0ITWWBmwrSz3KXPmGergUBTUjbLV2LP5O4Y73qMvF
         TqWWCoYNLLP70WIj4a8rrB+fFD2rzNsoM2Odoe7Ci0PCdDSPQEVZaw7+uRTV/Ihp4T8T
         3KJeJ4t11HOVU9Ai4evouDyBGeNhAsMDuE68c/W5QumyigG07Y08njhFX6tw9pCzGP25
         NiO4Do69jR4LXbzRAy8llReVREpODPGwv3FSRfD8y+xQ3jzfkQgYXqkA7Sy5Zk+WmQ17
         V8UQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKsDn+0pBXmhTVnKvDTW+oiBW5aW5ux2l2ZCp1uXI0o05lIyqTQjZXpLsm0R4RpwE1yqGcvIkatVt7UTA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI68/U0xVt+lzhHTUuo6SW60Tv4MQPrDCBu1J+RrUEmPxmq/0vm
	g/u+9hnAvr2mdnpyZG9D+brSss05j++331LeTmHF6F/graCtexFOQaQWtkEMWVkhGk3jJ74VfrE
	f6s/JyONX7CG7ub7GW6gDbag6qKB7Q8tT5ly674LfPA==
X-Gm-Gg: AYBFou0D4QY+e/J8izd9n0qgsluj08SUh3POCWkT/5e+hrMFi+Sras0aSOyLWQspmc4
	2TEq3sZdElrXC5CRzSiel07eVLqPGQGtpbZxqDTUncLYd5V9Af3Bhfm2e9+euvMRhaAk6fzhXlS
	3QnYfwO1XA1PqySW9Eaa/PxtIuJCWH0zfj6/gOt5FsTqNJPvFrNqOGZkch0rtpccjoBxS6b7OCr
	g9J9RRNGB8CRfvZa4FLeT+03Hi8cpMI6zcJnDQMLsZ7jyy0enjbmKBZf8OIWfKQnpMT2G4Thtge
	FAmBd6dRv+vRVxQQTEcVWNm5IfxMENU5Z/QIyN2RUrDLia6pwLlVG5vl2PjkHCAwoy3B0AJBEF1
	LlT7uajgpKWD3UGYU+NiGUKB3mXScy3tjdwwrAld7HPOj20rsm8UrxvTF1hUvwl0L1vLs
X-Received: by 2002:a05:6402:234e:b0:6b4:31c5:bb2b with SMTP id
 4fb4d7f45d1cf-6b4430016b5mr6666492a12.41.1792977447040; Sun, 25 Oct 2026
 18:17:27 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020144710.4154339-1-pasha.tatashin@soleen.com>
 <20261020144710.4154339-3-pasha.tatashin@soleen.com> <atsM_WTjuZNl1EGG@kernel.org>
In-Reply-To: <atsM_WTjuZNl1EGG@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sun, 25 Oct 2026 21:16:50 -0400
X-Gm-Features: AclHuK98Gj1W6ZSJdFU1t2f67xVGq0_oZ919Xy4QT-Ox4HmUEuoqqii467TmLm8
Message-ID: <CA+CK2bBXCPBiZ+ek3+PiOHR_8obXkpJmJ=iqcXC4kxO23b8yuA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] selftests: liveupdate: Add tests for LIVEUPDATE_SESSION_FREEZE
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kselftest@vger.kernel.org, shuah@kernel.org, 
	akpm@linux-foundation.org, linux-mm@kvack.org, vipinsh@google.com, 
	linux-kernel@vger.kernel.org, dmatlack@google.com, kexec@lists.infradead.org, 
	pratyush@kernel.org, graf@amazon.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 3:30=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Tue, Oct 20, 2026 at 10:47:04AM -0400, Pasha Tatashin wrote:
> > Provide luo_session_freeze() in the liveupdate test library and add uni=
t
> > tests in liveupdate.c covering the LIVEUPDATE_SESSION_FREEZE ioctl. The
> > tests verify that non-zero reserved bits are rejected with -EINVAL, an
> > outgoing session with preserved files can be frozen early, freezing an
> > already frozen session returns -EBUSY, and attempting to preserve an
> > additional file descriptor into a frozen session fails with -EBUSY.
>
> Please teach your LLM to use shorter paragraphs :)

For selftests, I usually let it express itself :-)))

>
> Do we need the entire list of what the test checks in the changelog?

Will fix.

>
> > Also freeze the test session early in luo_kexec_simple.c to exercise
> > LIVEUPDATE_SESSION_FREEZE across a kexec reboot, and verify that
> > attempting to freeze a retrieved incoming session returns -EINVAL.
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > ---
> >  .../liveupdate/lib/include/libliveupdate.h    |  1 +
> >  .../selftests/liveupdate/lib/lu_utils.c       | 10 ++++
> >  .../testing/selftests/liveupdate/liveupdate.c | 49 +++++++++++++++++++
> >  .../selftests/liveupdate/luo_kexec_simple.c   |  8 +++
> >  4 files changed, 68 insertions(+)
>
> --
> Sincerely yours,
> Mike.
