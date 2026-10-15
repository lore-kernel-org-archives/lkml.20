Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB45B51CF73
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792065638; cv=none; b=BV+/1e68S5EW/TG7E/lufWprEwnY3AvDRMrSMpxcf/ZXMh/gwoCUCV3YvYwt1Ppw+l/MVnNPHRt3soqZVCSfOFGagNHaSLqLRsho9hsMlAeCAFWyUQXuLFKML8GGOs/vywa0W4JtGvXiPgWgWnBHERYR4+ybOFd71wCSPGMbAPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792065638; c=relaxed/simple;
	bh=tIpzMX0ed87RbWCUBQdI+L/dobaMBHzfyYjdtMSgfg0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=POigU0k3pWVf6ig+pvoXQ7mqErqi1aqpGpgR+oRSc/vzfJRMVDkVRx96RG6oPYAP5TnioEUOxwUg/U0gqdVFUj9i9/JdiQOuFpEDljs5ih97IKuvXq1qZMewUJoXk1vvV8gQ29r0DfY68HiFscMxB44XfUwnl6MP6DQFyWwXJek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ocnMMy5U; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ocnMMy5U"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-88b8f0a1bcdso4047368b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792065637; x=1792670437; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tIpzMX0ed87RbWCUBQdI+L/dobaMBHzfyYjdtMSgfg0=;
        b=ocnMMy5Ueg8b/rCi0wKwyumgDaR2EEfopzoXf9BXfUVocCnwfrdPVWOtS1N3tZZ6Br
         XiaU3yaVKyrUXLiNmzK5sX5czTtFQLnBkNk4t2IbLH9zMlOUZzEknjhBU7LPJSIsor+4
         39yVmWwc2ImieuAV0OocifoDiop7/hdRNrDfokkRHOhJKfJ2EWbyJwFZhXwDQxRT2/Fg
         alMRoAeOsTDIA4p5iCjSuis9t65gtPRX5ufSp4K0RV/3qtarxJy8Sn6/RjMlikE7ytmw
         4fWfR0FRpKsOnIpCyGjmtu/a8W594VVAkrXDUIH03oadPenY7HCIp3A46+NJBXlLpGeA
         pd3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792065637; x=1792670437;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tIpzMX0ed87RbWCUBQdI+L/dobaMBHzfyYjdtMSgfg0=;
        b=IG/YoudAxaueziZmoi3teFMGgvqBUYvY4mwIZ2PSgQMOoHI2PRVIV9VEfqx543RUbJ
         qWIutOnhMkd6ALjp+drQZMibCYRugY7ElXwLh+kwL66u7sgZY9tD1OKYgApkd/c/5Pa5
         NKZQPeQzI2WG3jWT2KbWltPmBzzalxoRY3ii3cl8L0JjHx1nhmeCRVVXuHlbWNmWuuwc
         8X1ogbtOq4dhc5n0ifFDwGIsrNOdglVSml3pM5qNo63VsBwzUc8d/LoJHc6TgWW68Hhq
         M/qDcHxGdogHycl36baPGio0IJ0ovUyijbp4plbwlvoRKgQas89Wayu369UVWmuDuUkg
         qR1g==
X-Forwarded-Encrypted: i=1; AKwUvBwpBsCraPFqcuIJwPQ3ELhcAemmcymhegcUXpRsVWImbeDetO5lXKnFmlgTM1QhBGgmNVHLDr7o8zdevsg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkLpHPWdZQqO58Rxb0tAXFPsIScneYBwj2mL8EQwu1BP89/NsG
	4YQMGdN6dX7t/1kP4t++xfZVRKsTcEiTp74Hxa7kDGMcR9VCFQgFh6Lu
X-Gm-Gg: AYBFou0buBXmICqsMEyCOeNck04IE24dZTTRSNwaIJNAbGUHhXQJGOFfCJhKas9GF5e
	TjH2nPeAcaQXJLiafo4hISCmsK9CFnM9QuUKluTCKOQwwMoUu91Yon0uxLJNpcb4YArYgu9Rwkh
	Y/+m3SGufNmw7Mg0T//fQ2cbioewfCcHCFt84t+/dxHj9uCeLEWCX3kZldG4RaeV0dSLlxO1J8B
	h/kTJVjSibAVeXZiIVgjDOJxAkQa4vqF3DXjH0oBvCC6U2GUm6fbd7Z77GVyy3m3QnL3QimZD+p
	oQHqnewPL6QgMak2CwYnr7nO8ENCDdA0B9vwqX7E2mN+Ir6QiPM5pIlJllG99YXb+WsHcQDjq9q
	9SCHwtvxUdQZDDQL1AqNrDK2t4hM0WEqN9yF9XMPu5thg97zLFkXWac40QGc9SmqnFZS+CT29uq
	FDmR0xMurNd3tIorzxYZObYpruNXm/aD2MrfAPX6Qul3lt01IV4g2KQ6Acah85qSQ=
X-Received: by 2002:a05:6a00:4295:b0:874:706d:856a with SMTP id d2e1a72fcca58-897c79daa3bmr16075631b3a.27.1792065636791;
        Thu, 15 Oct 2026 05:00:36 -0700 (PDT)
Received: from smtpclient.apple ([2a05:dfc1:8bc4:feda::10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d802a42f8sm2318032b3a.10.2026.10.15.05.00.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Oct 2026 05:00:35 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v2] sched/cache: Avoid publishing partial LLC utilization
From: Jemmy Wong <jemmywong512@gmail.com>
In-Reply-To: <98a75f35d1f382e35f19a6cca87935ca41339c66.camel@linux.intel.com>
Date: Thu, 15 Oct 2026 20:00:08 +0800
Cc: Jemmy Wong <jemmywong512@gmail.com>,
 mingo@redhat.com,
 peterz@infradead.org,
 kprateek.nayak@amd.com,
 yu.c.chen@intel.com,
 juri.lelli@redhat.com,
 vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com,
 rostedt@goodmis.org,
 bsegall@google.com,
 mgorman@suse.de,
 vschneid@redhat.com,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <8105C521-9372-4E1D-8C2B-F44D9F8DD287@gmail.com>
References: <20261013084338.55100-1-jemmywong512@gmail.com>
 <98a75f35d1f382e35f19a6cca87935ca41339c66.camel@linux.intel.com>
To: Tim Chen <tim.c.chen@linux.intel.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Oct 14, 2026, at 1:11=E2=80=AFAM, Tim Chen =
<tim.c.chen@linux.intel.com> wrote:
>=20
> [=E2=80=A6]
>=20
> BTW, I think this is also a candidate for 7.2.x stable.
>=20
> Tim

Hi Tim,

Thanks for the review and the stable suggestion. Should I send a v3 with
`Cc: stable@vger.kernel.org # 7.2.x`, along with the comment =
clarification
suggested by Chen Yu and the Reviewed-by tags?

Thanks,
Jemmy=
