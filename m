Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792676120;
	b=RMT6WfdhdA8EtCaWQhKzRdgUpb428KVELcHifpr1WtrtzdBQEIR/6KFMJT5ZofIP6P68
	 gZebe3nMwKmtaeADbO4RWEoQr0SQ95xqyGhsILObKHKjohidjKel1IXABRx8c7t74dWjz
	 8Lj5CnKwILVLIVLZpbLCtWTnygfDuKjiYPwX5Qtc1e6WU9NmoH57qq54NTdBLG4g3D64F
	 ULH4mL8YGxiBzvlNcKVCw7fCyEXr/Hb0IZTTiuxKkmoP58W+OVqlWdc/gq9hnzxGEbc1u
	 K1iv7qtyLcQ6Ot2OMf0I7yPL1SDwdNSMjeiNdcylDIZT6vlf3v4WzfLJbLAkWAdYzbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:In-Reply-To:
	 References:Subject:Message-ID:Content-Transfer-Encoding:Date:
	 MIME-Version:Content-Type;
	bh=9ymqfdl1jZATM/FkaJLRY1iq5WTfWLIc1I8BevTEss4=;
	b=xFlHgTLh+cPKcjBh05w+RGxKOp2HaY5BvpwL9HO0r4NxS/5CSftkwBZvJmauNVea6900
	 ysJCQFzuMMz2+4s1ZhX7kFdSDrwTWwpy7zxh9nBdztWBimNqOPesYp+PwlcoCypimEe9b
	 3l4SvPJLnyKLd6BF+lto19nGSL3yxYbCCGpwng3nFuk8OALw7hRWHnAuswfUi6REZPBqQ
	 uZwSvkRUCJMQv7WMFTmmVvqrGGn5/1gm5LkaTvjy4hJixKc6GFDH4nfBwKIZ2sLDN0lCc
	 V+5lg1RJe7iYmsgEXe0GBuDD2fOqwjylkJJKJyLPYH2ZLRpM1K1TDAQT4/DYrU1RhHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=replytech.co;
	spf=pass smtp.mailfrom=replytech.co;
	dkim=pass header.d=replytech.co header.i=@replytech.co header.a=rsa-sha256 header.s=google header.b=QiJ6U17O;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B72606A329
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:35:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90B72606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=replytech.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=replytech.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=replytech.co header.i=@replytech.co header.a=rsa-sha256 header.s=google header.b=QiJ6U17O
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-89ff475a152so687610b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=replytech.co; s=google; t=1792676119; x=1793280919; darn=vger.kernel.org;
        h=content-type:mime-version:date:content-transfer-encoding:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ymqfdl1jZATM/FkaJLRY1iq5WTfWLIc1I8BevTEss4=;
        b=QiJ6U17O+YnhhVUoztZy2xIwoeTCSOy5CgnLD4d6ElHxjJa1aP+yg3o5yH5v/F4c9x
         CoZxhUQhh37O++vYj0C9VoUv4kJVT4PLyxa0QAKOHKyyRipEGVw+3cgnM24FiRSetfd0
         wQliEqHbRkAsLOhfpHcon6qwGp3JfmNagfbJ5g+dCmq54e66kqWhSTgHx+L4snIc/YpN
         xUY94z5vTnt8TYXusR76iMnaMr/rZiMCuCorXc0bziHJcLI8VBcl50MlqVuvYFeQMiNU
         r0vgJgQspbBTpvJzKyNj/5rMDV7qm83QASveI2Nf6A0H/nH5wOINk5w7/QLqLfTX3nwN
         rwGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792676119; x=1793280919;
        h=content-type:mime-version:date:content-transfer-encoding:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ymqfdl1jZATM/FkaJLRY1iq5WTfWLIc1I8BevTEss4=;
        b=Ga31uGIfMREnu5DVLLCA1CfBgT/COW8SUcXDpn5duo5Fz328atqYdZSO1oSCdGC7OZ
         MIG2Fqfdz0aYx23q13Sm1+r0agCI7HKPp/av0olS0/9vAePS1+A5nD3ndDxbbHGCJjWH
         rCpsbrm4TgohQtfA7uJSUc3jhj+eniHAAazpuZW+D6TEDrgoAgA0qMFLMi4HLd8EeVB+
         739mt0I+56nvkovqMdDtNWQOwKv7mBlLAxoORLHMbU/Qwy8+Bh0O9KQ3mfVVjk4raE6c
         wXD2SbI+jMEHWOjnyiHbN2qynlTS/4JwSrGbUmT+/QBGCn6X3VoHpL7s/ed7bcm5kxZo
         d9aw==
X-Gm-Message-State: AFq9FYIlpcTORyMPY/a0i1xu5VxWh7a96Fpon/wJGoZ2IPZ+F3ON0m7b
	mrkWhHtvGmOdYkUpwr6FmxaCFQq8VbeSchc3XpqIDilhiPN1bY730Uh6LNWEuXJdITtftaeCaza
	1CZH7FQ==
X-Gm-Gg: AYBFou2bo0jEJyYVdeky8XInrKVedrA45q9s0vHuLQ39vWJvF4gdNpygdNodb5OUfK8
	lZFTO8LN/wSBK1uYvDRuA4uWUlkQIDox9A0db6tU9++zRlahVmOehuuH1sd1nGrrS0zrdl1Ipi4
	fCt1JxnxBAxPxcIRGQS/E/dumKIQVPBw1UtJ7GBkYi7yG7hti4V5HRTw40voO81A0pvQ7Ag8S4c
	EvUjTLiJK2iW6kwZHvL7iGN/D/lhgONHrYm/HgoVozwrJIZP377o4qSRevlZfbPzE+CVWAhCfDO
	v+yEL22eoT6AsPxelQ1kVjlG5MCzmKMxscpMcqd18LMvKwU2WferyzDIGmkTs0rtEq++0uCTB0z
	mFk8Lj9hOd633RShkFO8oMEsrRuI7my877eB3goi06r+2faDCYWhCIC+mIbKv5mApB/+XAc+vFd
	xdPI/rHtwhtHCCS11LaQX2UgF4pnMplkJnUMCetMPPtS6bbx8FW7DVY96d0qXx9BYutte582bf0
	U0/tk17c7I16IHtKKAVfeGFjeOYPLH5kkOrSgHbVfUvCIKI62gTp/jDO24TvlW3juTfL00SRGt1
	isda4TFx0weHQSb2UFfe5MpL25N4OYVYpiQWGL6V3az2n08=
X-Received: by 2002:a05:6a00:4612:b0:8a0:4807:456b with SMTP id d2e1a72fcca58-8a089f5bca8mr4197088b3a.37.1792676118789;
        Thu, 22 Oct 2026 06:35:18 -0700 (PDT)
Received: from replytech.co (ec2-15-168-14-174.ap-northeast-3.compute.amazonaws.com. [15.168.14.174])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895e6b14sm2212341b3a.43.2026.10.22.06.35.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:35:18 -0700 (PDT)
From: John Brooks <john@replytech.co>
To: linux-kernel@vger.kernel.org
In-Reply-To: <55e084b1-365f-48c1-88dc-548319021338@replytech.co>
References: <55e084b1-365f-48c1-88dc-548319021338@replytech.co>
Subject: RE: Publishing Sponsored Articles on somoslibres.org
Message-ID: <5f29bd69-9781-4032-afe5-38187fbd9148@replytech.co>
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 13:35:16 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8

Hello again,

I know you are very busy these days.

But, I would be so glad if you can take a quick look at my last mail.

Thank you for your interest in advance.

On Wed, Oct 21, 2026 at 01:22 PM =
UTC John Brooks <john@replytech.co> wrote:

> Hello somoslibres.org Team,
>=20
>=20
> I hope you=E2=80=99re doing well.
>=20
>=20
> I=E2=80=99m contacting you from PressWhizz=C2=AE, a marketing and SEO =
agency based in the US. Our clients regularly publish sponsored articles on=
 websites relevant to their industries.
>=20
>=20
> We would be interested =
in publishing content on somoslibres.org if possible. Could you please =
share your pricing details and any guidelines we should follow?
>=20
>=20
> Also, please let me know whether you accept content from niches like =
casino, CBD, or other restricted categories, and the pricing for those =
placements if available.
>=20
>=20
> Thank you for your time, and I look =
forward to your reply.
>=20
>=20
> Best regards,
