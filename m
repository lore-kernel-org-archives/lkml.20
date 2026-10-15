Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3943519DFE
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792073171; cv=pass; b=cFOTlFgy15ToyfSY4kDkpzlhAcr5+sUFvfWRH9TZ5ohwURw4b4TWaeGdYKi2oJh8lswpfLDX7twaSGWxEG1FiT9HL7ObpF0dPdLjmSw129AKphLql1xWs85Ax4QDz+jLn+eyzYkX5attjYR9pbdUtZusFMNTP+qsu2BXkQxuv8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792073171; c=relaxed/simple;
	bh=Ult2wbEPNmy3iN+NrU+/md6eFZJXKg3OExFz3pyUCCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BXL+kbPYsVjaL6i/Uw4B9ODYkz+4lxPErI5Su9P6I6OK/Vs/Kof+TrjyW11omegVlC+7Gjozz01tV20fydyxpwzBvchZazegAPQrubtyj5hCLMhYKO3kaXVGEoPcT4QoanPfFHL6xOuv5P/P5LpdeDGdVnVOzCBzbsRJmQRDbmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sGTJx7r+; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sGTJx7r+"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-355724d032fso604927eec.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:06:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792073170; cv=none;
        d=google.com; s=arc-20260327;
        b=oJZ/OSu8sFKnIHMgYU88Xa8HNjb+WI6ZhSPtDWoOh/3qBqE5oSnyuxgRWimLtryx6w
         RpXdFYxe4/140n0L3W4AWSjO+0usl4ex/5Bk7cnU3AzTpVnN8yWSGERMDUCan85OtYOb
         Y4COYQDoRpzuIo+PRkzm5qZ0be7kYbwFCtAcWkOg5rMfnMV++8DbPjfV5XyZbSMYIBnd
         Zc+TEmKkT/mTTFuChrhX3zMV46lTl5na9ottoxTgDF1DO8CNls9LKXmGL4cPUt9sovcQ
         r3nwIvYUi+IhKm0IuF9XTM2JE4BzF9mBY2gYcJEByNEdtyQ6YS54UlVhL8DPCQuBvn6O
         WMLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P2P5MXeugorL2l1zb5x+FuUUdQZHK5/NjbEjCV7Jqx8=;
        fh=7QetDfqehSFK7Ss1g7beCrH1qEJYsoCo2sEWR/s9Bro=;
        b=dl2kJ8XoFv9TpIEhvo8yPcYuIKS7eNVBbiYJqPwmd5ev5n1UxwMJJVrKPjYwbwQC7M
         OWB/BjNml45CGBZQURkTe4kkHJxpZylcaXsmy78XcDbISR6Qc7imS12Gfxy0NBf8dM60
         FDUZVA97X4lINE58uOOFs8CRSOkjGDVLBpAZ7vwz9sm42CuIIW/CYqWyb5MflXtCK6hM
         DVDxoy/XEf57paySoQSRrtkkJWFGAtObjPPPiWaPgytXUgQtgauJzEQYBHM9aqr3BlYc
         gN9u5R87E7jyaeec0EHQkPk/EdVFK2U3xEWeRSbYut69bt3+ldIew0Mm7D1UdC6031il
         WfVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792073170; x=1792677970; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P2P5MXeugorL2l1zb5x+FuUUdQZHK5/NjbEjCV7Jqx8=;
        b=sGTJx7r+Z/9MQgXtI+uX30PqChS/HjVj4TBPitiO6AGLwjxb4ZpboK2FMm8bfHrNWv
         ae/G/fiBt61LhUAWib9tvRvALWdKfIcn+1akZQV7d7sS3HP/QMm4ytNVQFpvs+DaWyWX
         8ionMm9eApSxnOMg3DY21jGWBrifL3DHZhhXbUGy3yuLlQnCQ6Rt6oXy9ugFXmyRlQXp
         Ow2lFgCd8it8ms4RcNlbyL3XKjgmRPdyhPA0KtIKUKSBQuB6ijQDRMdahBZpTk3sQW3H
         1rEPjZU3wEe/Rd6U5tZIO8p5bGwBGcTvb628/MGlXV1ppir/dmfiezui6FiW1IkHoWCU
         nIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792073170; x=1792677970;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P2P5MXeugorL2l1zb5x+FuUUdQZHK5/NjbEjCV7Jqx8=;
        b=NPqU3TCOWP5uxCSQ4ihf+K+DVIauq/Cs0hRJTS9m5fRvMvGxFY+04/ivMJGqDdMvoe
         CqM5dPNArILfRfDKGCeryfcOUHxjEOsgCa2A2qPudEl5xrAm45pRnjTZ/htRFoElumH4
         Wmi9nabPjY3oRoFVzmUYg3LmM17aCAuYXjnr/UvFatqjtONczgF0Q5C5RRR3tggHXW23
         PeUryoe7hVmroUlkpCNynxY10JFa7U70d67cjWETT5iinAg6JGX8BErsia9Vfe6VKACm
         OwMvgtSYuB4YUjOoE37y0CqqMx9HCSduCHhh7ihmQEB8+H1vK/3j6fcF33OZ3EfkCnkq
         ggqw==
X-Forwarded-Encrypted: i=1; AKwUvBzqDdJHAY0dfDl/K7Jw5QZt/nVSRZh9jDKWHlSRDrdnCLuXi9LsHZHKi/0dyVFzPAohLCGHfmpgCP+sI8A=@vger.kernel.org
X-Gm-Message-State: AFq9FYIP12whUy+Epk1oa0z0oU2QubGK3/EVHArxoAk0iFujSJowtXyv
	YY+ZzL2TODNX/k1m0M4KaYnSyDTbXq6IzmTZWyHOo6WLr7iyeOnfNi5fdG8GlA+OCqD3jFv6DkG
	6OhwLv2X0xF7BUM2o7mj8uJS+b+zKnqc=
X-Gm-Gg: AYBFou3Zcthv0iEQ8HQpUnCBTKSDp8GpgNBXyR2F8ZWmS5Sc91fiuHJrmZNzH1/c3Ul
	Nd8wrK+rkhG861CU8E/8wlHwuw7+KatN3LT93iypxVt1hatLZAMnsUXXUO6kN9dRPee+YuadNST
	czsfG/9aVh3ln/lPngEZb5eF0koaqj+spen2iAFfiYJOO6jGO6UZfXFUjJjSL4B8fXOWKqyesW5
	yAL6y4P96nSrPyJGat2fG7HYfw57jofAkRHnVF2FJTzAgQ6/nmZLczYGVdVEEdiXtuyj3Yba844
	UwEbmnxQ9/VtBtyrtb5qqrh5Cn5ikFr2Vns2PVl35Jr1GpScNhs5kRD99dZ3OyCNfl48wmg+0Xd
	IulP9M01WPBeo1dgvaSRaeMhhwrwBAijcDunjstJDtvCsRWYz1cz8oUAGu8f8Z5ohhp11M0iH2K
	rQl30UoIqm+z1iTHfqjRtcrwqYPngm/hYV1DE0Ymc0Gvx7kqdLwo8=
X-Received: by 2002:a05:7300:c8c5:b0:351:7e15:9c59 with SMTP id
 5a478bee46e88-3537dc89f58mr38177586eec.0.1792073169449; Thu, 15 Oct 2026
 07:06:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1791499378.git.sashal@kernel.org> <20261014174838.114990-1-ojeda@kernel.org>
 <as_Cr4FhzyAh-kC4@laps> <CANiq72m6okeCHuR8BCGENTw=wJhfXXZbXZtJq8xtoeVfvfo3TQ@mail.gmail.com>
 <atDYWe9L0tv90Xjk@laps> <CANiq72mgS15ZKwd-u1t1xvAaNf3ivpXdUMmVDfmGRyq1OewLvw@mail.gmail.com>
 <87jynjrrqo.fsf@trenco.lwn.net>
In-Reply-To: <87jynjrrqo.fsf@trenco.lwn.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 15 Oct 2026 16:05:56 +0200
X-Gm-Features: AclHuK_RBJcp0X4oQoi_VtfEgbv-ao9LCjdidR0Z2ASFU3BEFBe0eg2AJEUSzpQ
Message-ID: <CANiq72=raWNCedXQW9dSDwxQTE0hfs9ecyGChRPnWqO6DUvbOw@mail.gmail.com>
Subject: Re: [PATCH 0/2] agents: add portable agent skills and Fixes attribution
To: Jonathan Corbet <corbet@lwn.net>
Cc: Sasha Levin <sashal@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, broonie@kernel.org, 
	ksummit@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rdunlap@infradead.org, 
	skhan@linuxfoundation.org, tytso@mit.edu, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 3:57=E2=80=AFPM Jonathan Corbet <corbet@lwn.net> wr=
ote:
>
> For all that we hear about how smart these tools are, are they really
> incapable of dealing with two only slightly different markup formats?  I
> would really hate to bring in a separate format for this stuff...

I think it would work fine in practice. But it means that we have to
split every "skill" into two files (and reformat when we may want to
move details from one to the other), unless I am missing something.

So if we keep the files rendered and so on (possibly in
`Documentation/`), and make use of `.rst` features etc., then I think
it is worth doing it. If not, i.e. if we just use it as a place to
"dump text", then I think Markdown may be simpler.

Cheers,
Miguel
