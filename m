Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1E9361DBA
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790734129; cv=pass; b=jjcr+fRMqYdIA8YflusiTyJh8k7oC45SY7uFIl4YF28OUDaXh/E2km9hq/+iBSa7tQsk19vVYGRCcOhVKUC0G95psu4qNhnnCr3m0iqEc5ovlvLbuYZY9ooI9Vi/iPBXfRBMa4qeZSFCSBkua3P2021IHsEae9csoJk8kgT5aP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790734129; c=relaxed/simple;
	bh=cHLQbGT9PXI0kmTGgvdCK4575npp2vblOC3chIxwSP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jj1tRPYVww7iQJmHOUEZUNAhw2nY4TTDNyn48ouUa7kgSiAzte+bkJTgNKKUGWPo1NPhkOByqr2iN4Yf3PDerrveTzz3atn2i4/DdymcIkYiVvRwFUM05tSxdDHlPGFxb00fp0yFwtlUIavJbGlQ9oJgZCY/t4H2ibFNX9j9VRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n67kha2O; arc=pass smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n67kha2O"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a76b373063so8781461fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 19:08:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790734126; cv=none;
        d=google.com; s=arc-20260327;
        b=Yo8kI+LxwZ0bVZNeVqrgXy5o5ftNF3DKnN2WrP/engK6zMh8wzRkKsWSjGLYUCIAQY
         oCCBAdH/pPlF5yrYDQSn8k7vPO4443v0agj/dXix8IIwtODEYs093VPjRDdwPiuYZJgX
         avOLKqqpBNCM7YddtOyB2y8zLrP1Mi5k5p42FWF0+nbuZR4zFdrRbCEVDg1+bbfB3S/g
         09XNiutU4KkDUW+IMAmEYnOGLlJKvI2FVv7SugjNWGwhy4Gotv4PHKbJ7szT1zMNoJSI
         IADPGO0U07ukz7y+fIdThZ/zvhclte6waGYLKNr2rUr5O9McT/VXEQSBGV0Ssh3/dzvV
         CaTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/XpGo+Qr9OCMDAzBQXslhcLH2BJM+ZWKFH/nT0r3qdg=;
        fh=sQ2Ne/5natz1RZWKuUeUIj0dFY/ht/OaUDpTncTXcfk=;
        b=ZVGRvOiNlUvKfkwB3oxUeXD1hm4u7rGzMpuaZLciaV0LFWx5sgD6xiU854FTZ/OL5K
         W0qTs8oph+K+XxDa4RjHJvnbvj2/yucGInMHMZ/ykVbcVrfAfbx57e1YbVV1c7UfAUnX
         SvqrDllN0LBPtEDUnTW/qhI3utge7HP7LzwBF/ILfdFOdHGAFYpY5AVYZby09ujaw0ZV
         sEVLqnnOeAzyxehUDCfPvAFvqpgMkn/H8NSw/Kt0nILVS1i2VoG+wZpzeBaKN5fJeqlY
         vaUPK9rKvWqs4mWDbMq3elW+kZi0y9RYt3PEYt/wP0L2pdC/Ns0/OfDUDhxyatuM4kM8
         P9fA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790734126; x=1791338926; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/XpGo+Qr9OCMDAzBQXslhcLH2BJM+ZWKFH/nT0r3qdg=;
        b=n67kha2O3eRTAu/+9aajfOHbrfd1Pswfutj9JWRNNeH7FuRlIB4YYhJqkzkI1ee4sm
         WcApItTS+PrFM3Vf1eRBo4nGuRXMxnHOlIVIEuECOmFU28w3ImzedT1vbb6+L3oP5v2i
         7SvlJjF7iX3t6lOGk70a3mTVpguQSqnDdmdbS9YxKeZnIggBOHHr1//7CMXT5h892B85
         ouKOxmhMOEpb6HHVLV6VBss6G4YVVHUoy/IGS4Az5zvMczzVvGbZIVpTO0jDcetFxLLh
         xLkNOh0AchftufNtBDO9s+umtZvs+Kgb62TE5Jt9Gz4P9FtfJtbFX3B7NXEbWwBA+P0i
         Mo/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790734126; x=1791338926;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/XpGo+Qr9OCMDAzBQXslhcLH2BJM+ZWKFH/nT0r3qdg=;
        b=wjbT5SsXJcRw9hVn1jlSkpTiWdJzkLXi9/Zf5kRNoWx5PRCzTouVOfc8bLHPttoNkW
         8oYDPjXdKjrYODWTGO/a1gd+OjMWiflLselH+MzbfMVSDtdgdTRoMy40f2XOPxSDe4u5
         Ry7hR8w3W9FTWrfBZW+VwgFm5zsJmVKhVmrQ8FyNKxVDM1MErJSyx1sgfKM/xDVZ8y5i
         hDM+qB1NeLUypf4HODvl0XNjLyTVAErTElY++rSQ1S56i09eEX6dDSgmZB2sw3Q6MUVJ
         mBxKKXycRdqwbpF7LkPjiMFnMab5v/5GRJioCZ6pbXQCRRJdeu3nqu15/NsS7WPIt6DX
         iAqg==
X-Forwarded-Encrypted: i=1; AKwUvBxti1KtfwutgEX7sGMIp1Q+f+g9+WzC7l73o9zRRTcxN08dCfBhvCeZhvOa0ujl4ucvMLn0JDnZKdSPscc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAHW1RmjmikzguEnpg6izrMzPOqFuPvVoqJhG0q5feJwNTrtTD
	zML87mo/RwtASpi8QxIF68D3U40m50Y65Sq3Fr2TC5/HCHqvpezJinFAp9Rr3XvCdttsD9c9bxo
	Q4tUK/TtR1X3JzcokX4zxk1GxV3Ad8zs=
X-Gm-Gg: AYBFou1Hm1X28xZz/nHYwDKN553a48Q/WtRjEs8n8QArYfXWvAAZKvXfWM8JcbhC8ui
	9dMjA5FMMaQAcPgAnWRWtubgBX375CnID2CPHlziVO5yxXyPJnw4fmxL+5+hxRNkPjDkp52Fcd/
	J50++x7xy1dcUM3SaJgRz+uiF1V0sM+SMRC7h8kH68Xj86sFCnTseCj0R++SNkVzeVXbk1/E7jB
	DD7XmYqMLqUm2J6tKlYrGbz0gNKBNudXUrxtgy337oa9AMlIaMHeXv/T983zvVmoEhyZH536yxm
	x6m9Dt6+mj8dzNAM7mE/UxR5jlYnxUeDOUWWX8Ak1wLgY3fROm0SXf/6OxUNjkAyxt+VaxrTURI
	7qahySbI=
X-Received: by 2002:a05:651c:b12:b0:3a3:749e:31a1 with SMTP id
 38308e7fff4ca-3a77924b77amr186021fa.21.1790734125697; Tue, 29 Sep 2026
 19:08:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929064742.576651-1-liushike123@gmail.com>
 <179066487225.31693.13001631968601791232@kernel.org> <CAL9mPHsf_10zX4Z_2WFHNJob7Tkfnaw6sp03q2+ujnTygn1Ucg@mail.gmail.com>
In-Reply-To: <CAL9mPHsf_10zX4Z_2WFHNJob7Tkfnaw6sp03q2+ujnTygn1Ucg@mail.gmail.com>
From: shike liu <liushike123@gmail.com>
Date: Wed, 30 Sep 2026 10:08:34 +0800
X-Gm-Features: AclHuK-Qp4hFCJIT-_w2B4gFyJoXlAvyzEx2aVeUJ5RKp0h3YBXE-WkFgycO1fk
Message-ID: <CAL9mPHuyOrK4WN4ZSWRFSYWpeTQBGjqXLDiy_Wr9AtEahL9KYw@mail.gmail.com>
Subject: Re: [RFC net-next 0/2] tipc: notify pending connects of peer node loss
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, jmaloy@redhat.com, tung.quang.nguyen@est.tech, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, shuah@kernel.org, tipc-discussion@lists.sourceforge.net, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The issue was first observed on actual network devices operating in a
  cluster. The client was waiting in connect() for the server to accept the
  connection. When contact with the peer node was lost, the pending
  connect did not return promptly and instead continued waiting for its
  connection timeout.

  I subsequently investigated the TIPC connection setup and node-loss
  paths with LLM assistance. The analysis showed that pending connects
  were not registered in the peer node's conn_sks list, so
  node_lost_contact() did not notify them. The initial report came from
  the observed device failure, rather than an LLM or static-analysis scan.

  I then reproduced the behavior using the same final selftest on the
  unmodified base kernel and on that base with this series applied, in
  x86_64 QEMU/KVM guests. The tests use two network namespaces connected
  by veth pairs and disable TIPC Ethernet bearers to simulate loss of
  connectivity.

  On the unmodified kernel, 8 tests passed and 10 failed. With the series
  applied, all 18 tests passed, covering SOCK_STREAM and SOCK_SEQPACKET.
  The node-loss cases check completion within two seconds and the
  expected EHOSTUNREACH error.

  I will include this discovery background in the commit message if a
  revised series is needed. I am not reposting the series solely for this
  clarification.

  Regards,
  liushike

shike liu <liushike123@gmail.com> =E4=BA=8E2026=E5=B9=B49=E6=9C=8830=E6=97=
=A5=E5=91=A8=E4=B8=89 10:01=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
>   > - How the issue was discovered, e.g. hit in production, hit during
>   >   development, syzbot report, manual code inspection, LLM or static
>   >   analysis tool scan.
>
>   The issue was first observed on actual network devices operating in a
>   cluster. The client was waiting in connect() for the server to accept t=
he
>   connection. When contact with the peer node was lost, the pending
>   connect did not return promptly and instead continued waiting for its
>   connection timeout.
>
>   I subsequently investigated the TIPC connection setup and node-loss
>   paths with LLM assistance. The analysis showed that pending connects
>   were not registered in the peer node's conn_sks list, so
>   node_lost_contact() did not notify them. The initial report came from
>   the observed device failure, rather than an LLM or static-analysis scan=
.
>
>   I then reproduced the behavior using the same final selftest on the
>   unmodified base kernel and on that base with this series applied, in
>   x86_64 QEMU/KVM guests. The tests use two network namespaces connected
>   by veth pairs and disable TIPC Ethernet bearers to simulate loss of
>   connectivity.
>
>   On the unmodified kernel, 8 tests passed and 10 failed. With the series
>   applied, all 18 tests passed, covering SOCK_STREAM and SOCK_SEQPACKET.
>   The node-loss cases check completion within two seconds and the
>   expected EHOSTUNREACH error.
>
>   I will include this discovery background in the commit message if a
>   revised series is needed. I am not reposting the series solely for this
>   clarification.
>
>   Regards,
>   liushike
>
> <netdev-bot+sinfo@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8829=E6=97=A5=
=E5=91=A8=E4=BA=8C 14:54=E5=86=99=E9=81=93=EF=BC=9A
>>
>> Hi!
>>
>> This is an automated message. This series looks like a fix, but its
>> commit messages seem to be missing some information:
>>
>>  - How the issue was discovered, e.g. hit in production, hit during
>>    development, syzbot report, manual code inspection, LLM or static
>>    analysis tool scan.
>>
>> Please do not repost the series just to address the above. Instead,
>> reply to this email with the missing information, so that reviewers
>> can take it into account. If the series needs another revision for
>> other reasons, please include the information in the commit messages
>> then.
>>
>> The evaluation is done by an LLM so it may be wrong, if you think
>> that is the case please reply and explain.
