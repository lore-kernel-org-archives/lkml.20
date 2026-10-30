Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379685;
	b=wjvsmMV3mbYwHvTuBQTlACaTJB+uf7/pYYbjgRfpcPbhEailSmxA6CY+ibcM/LNGJQ8s
	 KC33puxtqVAFp2waYY4mVGe25/cyWF7ocEfgOAnqj4MRc+/XrOZ2UTO6DcatbESA+4/cd
	 NFr9U3YRq2MbBAO3mCxXgkzIS8gddS588zE24hbZimhJ6lHO+0PqDYELZDcC7bGGCrDck
	 pNHJ6BhNTTnuqS4OgnJv1oqkCcHiBBFIXvd0REvhl6f/pztl7PSZQGF/UZyAApJBirK03
	 pkr7cuvRXh5AUVwOgUAmgyPNU16MErjS3UzuhZuLm321ZTw3kKwwfBRZ3rPdubzzZ5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379685;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Subject:From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:X-Provags-ID:
	 X-Spam-Flag:UI-OutboundReport;
	bh=s9cX1gFD+Bkpd+UNN+SfPrifSgjVPXj9Sgn1HdQ/tGE=;
	b=nze3O/sEsmbFBuOrrQUAHfNWJ+kwk4I4dOWW6wmUc4z3tk0VrZjV0IDCvQqO0AOxPt0G
	 dhUzIY7hEmsAG9/AXrqrk8oD8k/Ko+sHaD4g6zHp9dHLMjlRySFM8o5dadtMnDZJSizGx
	 TWOyjKfX/o/uOJnSpaYzif4VMgk7VLjwxRLIttEjD6yXdZMpuWT1+wtIH13vs3GyvPhkT
	 xX3tTfVx/FwRDle92cBTRtU2U/K0Gzq6pXXpp8up8jnB2BT+jqf3gXPcUuGKTJEdu/rsj
	 Tv76l8u5Nf1UZmFrWLNVsfo32RT4sfpNzUOlts3bRwuYcWEhMPwQmXPfxO/nBUs0cXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=efault@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=RMhhYJHl;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91222606A324
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:01:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91222606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=efault@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=RMhhYJHl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1793379673; x=1793984473; i=efault@gmx.de;
	bh=s9cX1gFD+Bkpd+UNN+SfPrifSgjVPXj9Sgn1HdQ/tGE=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=RMhhYJHlpcRW96ntX5m37HCj7PqYqHAM1QJj2JAuOPHYUCliluMPYfSs+lUArYVC
	 B8+CjGsmqoH2GIHmyFLVPH1mp+KnhX/ueR3yDpa5G+8W9acikn0fzzjRpNy6nN1ZH
	 ynw3GJUIfiGXH61kJ+UI5OfMDFdYFSMo4yf9S6qClpRzGRTmfRyLj3THHUJCCNatp
	 ck807bHrXNrqC6Hab0DTYMTsTMxL5SYvR6T0KFVZABJzzhh2UXj/EpYHw3feFmOP8
	 XTm46fqukCPszrHphuC6aAsXBazAUHZqy5PW5hellxjw+qS8h1BVJ/iLUiR8m4EaZ
	 BF0MIoHLVaLP/WkO3w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N5VHG-1wUEK31Mdu-00w0Ps; Fri, 30
 Oct 2026 18:01:13 +0100
Message-ID: <5ab06e4740bb0fd177a96e0a31f933a27d081012.camel@gmx.de>
Subject: Re: [PATCH v3 7/7] sched/eevdf: Move to a single runqueue
From: Mike Galbraith <efault@gmx.de>
To: Chengfeng Lin <lin2530632123@gmail.com>, Vincent Guittot
	 <vincent.guittot@linaro.org>, Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, 
	linux-kernel@vger.kernel.org
Date: Fri, 30 Oct 2026 18:01:12 +0100
In-Reply-To: <CANGjgd=yr4Zy+SMUsDnBSw05hhn9086NVc9g9SaG0y804=WWrg@mail.gmail.com>
References: 
	<CANGjgd=yr4Zy+SMUsDnBSw05hhn9086NVc9g9SaG0y804=WWrg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Provags-ID: V03:K1:hJpkW40HkwBUg/7TIocFzWlAnJHKl1Eg8/cXIDOm4RAnIYonq36
 Hg8ayTmg+ygj+gyiLvuhdLQ7lOBhbKauFqXLz4mj1ZXZvPSMTj3SLAeEffbgyt3OapsVdl+
 3Q2bSHCT3/yJG0GJhxgEmxFdLRNRaJ862XBEWP03sAcCUqDw3DfxoCKk2z+tcQThu8LQ1FC
 O0erCO0jcP1B+Kz7m/9hQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4EXphsqUL/U=;y1HS8X/3R5k9gTgbpCaPycxIlV6
 1bOM2OGAvE9hWii6MWUHruwUoKDA67468ltSxr9uEs2Xp9x6Are41M2s1/34GDctoMDmMQhHa
 skiqVi+FDvoBEMt2fmh+OoofWcFzZn+YTIIuUZ/p4vgpt88c+Vsc8S5hL/W63c3v/FypCpT04
 AMFP7fYpdyMj6ytQQ2wUsSC6/cHl28UUzG9tIiB/Jp27zvtmQUeRYjMbk5hnO+e/MBREG5L6X
 wYG/4FO+yhhcnl85Szxt2/RrRcI+XEF9jpn4a66e1Lp1y70TtHHI9s6f34z1w795NV7trL4S6
 FGHvUO3NHC7M+7UfyPZ40/JCbT4ePqFSd9iNdWH0Y/OyotsVhPem4suy44HKR7ks3N9tD8Dqv
 frRbv4R5UkVJzEECinBPd1ZqXgq3chOjY6hmWtwE5ZLoZ4ST+Ba4okW3KLVdYYX5quBm9gaar
 G8+oBwj0X5FH2mCOnVSXGA8efU1xicDWEq0pc+9G8aOeprEdIjHKPvEiFE3Z/dBT+m924+8MW
 iHC1YPN7rSxJFl0aAScsPkhwlWhMmUnw8pU05sYEp+tGb91lo4n0wVsj9YH7DO9WPIZSyIYDR
 s0a4fQuCJrc/N4wbSPGLxcW2tvIvRTBj4vIJq1dSYRLVYYXNA2xpEhedlHdAo0A3iIzCWoAeV
 8IQqBfZdjAg5//IByJo4e4fuO3grsnW9U+0W6TUHRe9HqNsNTQiT+viSviROEhp5FQwdmHQPk
 0JZcgkBobEsuOBp+B0nSvuKnb3i7GmPufy+gMkWA4I3FHntlMpHgylSaC58Dfbl6qJigbhkKi
 XVuRY7Fr1tExlAQO2rqvJmNieWoGPlVNaVnemqHbjPlVVMIje7ReaWfiKn/v31MjsoVjsZals
 y0R2y1Mn8qVskY4dUMdG5NCyccZG7Dlw42bqNNaPY10TJPlMDykF4PGsqty/3iwarKd99owyF
 CmYEa0lp5xQGfhQatjUCToYeUo2DcUcM/+Eg4mvmklAonVd6ZxbmQno2kG/cbYY9P7/i1QBrp
 2WS6fmNi6I9W2jv91U0pnsJ8sUv9+/RqpdBjYwHceYuf5R2QR8kYvjsaFDbk9eTMEDkrPiG0T
 xpE/cPWS3RzMyhHJwH0WaBDNjhRXVl+EL27AgebGEHZWZcY2pttBcbtd/TGvbj1731A+tb7D3
 GyLp1cWj9QthypvYs/HZJV5p8ZF5PN/k96La4nglldyCyFdDgJUiLMxo//ETVEZYj9ZVKhkUF
 SfLe7JdOKpqHJRGxmP69F4Ml3jtnGcjwo23dJEUNKqiRsNf2iyFIuVBSdWRBIInO5eJz2sh1s
 sersZBMAqcry5+KeCmaXXkhrEf7CRp0+bH9ldBcn3+uMXd8HCYoSCbPIJeQuAYX+i+O+oLsgk
 zI9i8gEhAhOSswj7AYMORnVx+eBju6yp+F7H727ULK4TeuVONn1b4i2z6dwfQGun9e4dzknjy
 BXtKCtAHNhqz+rg21Ml3Q3gFuGk/nV6qe4pHGoxm4jItUoKrdN0BCAz9XDk5ZsCAaE2Lc48SN
 1ZNkJ10pCfik/8ePDEbnkvErELJQH6Nlq6pLGJpe+PsjJdwLqxDNeofyWO1rfKltbV1RFt305
 /x1nSMtSKywd4zIfITQh8ZfgkKpKGeG9pFtpQa3I6aNfULPRD/uRtPKnm3/L/7J6WIZW9TH7L
 2xlx71e7dyLZcdRiEiNrUgo98hnSsNptqTwhPficMeIzea7ljXaGeDzBIqTf7VlvsKZbK5Wzt
 9iOPCZy/hTnuwuWXq1aYyiixBHexCYltgmViSEKTgopPa+naPdXHg03QCEsPTbzas7rxRR6zb
 XMtCX0BY9tI4dOtGcVop5dlcVhrmvLQeOuvoF7NqlvqIKczwgkBVkYABSETAW3vINK+kcjJeS
 QKUT7BWFWXzNX99EeFg1Q0yXHOur/w01MQlBK8k0oHCyjcEtqfR7iiz15hbVUIjIJpi6BSxun
 rxdEkMWNc0JGxZ2h87duMiHtBZJLdg0EgcvUSgNXESEhsmyYt9uq/jfZTeDUpof2RZEJvtrdi
 0M7J6EAL7jXE0dAbH9FbgJS9L26piAHFd6Lxxav9tcPWZFVY7heE2aRK4oD2YqEMJJQG5c/1B
 7D7ymlfvgILuoiXxSMFpHcOz5hs5czBMwBklq4GHxZI+fozX527WgydLxtZavMkhicB/JEUBT
 TsFwUwEEmud0HUTacDCuUZpmlqbJUrI4X7SpcVrBmEZ5xN4iB3sr7L6Qw2AJI99FJfRa2EEGF
 l2AYPF6YHvm2RzxBF1tPM0WN1kUNAnJne4ahW+/E6VoVRdxyYXELpmZMnWdGf32UlB/tjcguZ
 j/2NpTkPzkvvHWzu15wiNh5wyaMzAacd0atEY9klZQH/eIYuJ3i4LANyGKVhKtKEs7dgenKjF
 rtJXmhhULN+9ZBJX6giSCJBCEW1T+X5ZhrIVXUQjHS7rROUOPIHxnCr0CRPYqJcvBG4l3eNQm
 YiM5dMuVmJ92Dw/iPdqm/e9281+7+P6ZMS2QnUu87xEudhbYz+vy17xe+4ZPw+7nGNLiTrrxG
 IuKhmMzSrUYckeWHbhuMz4bk42wIvgwOkLBhqZdDhzH14MCXoO90x14684TMZ8xzDiS6x9w/j
 QuPswkZ9m3nuW7sxBhxWWqxkGkXFlRzOcFCh8oF1y3Ffd7Eua0udHDMvM02j89cmfRVKNMMp1
 mjuJv8qW+CSDR/NTmRwqIADIg2pPtH8IAR8gcGoEvE+qj4oGcGOqKNVeMcQaThVFdcBu54zix
 iZGgMQbU2aZYfN6lZ6UVokPsrlNYy44jLPNFGrh0zrCTj+H/gajh4zPE/6C/WGH2swgI216fB
 lHU0qS5CqirQ2UeD+Kkv7nD81ssGbGBnA8lEsiDIJS21/K6cvb1e8rHZtlxM21UR3foYrzeOv
 MKbXaQkiGICCMEVodeWCmY8BrBi+U2ksoq/dmx7paiGr5TEnF3u21eq4QpX/FxzD778Xp8Box
 zoB8BYXpHBbdxNm0lSZDbKeYZ37RvTBk2CTP4YlyzPU8EPaxleEGQhb/1dbPjB1m4YoPc6loh
 lvgBKFS/BOLF5dXhZurd2PoUA7v4lG6VyVNKjD5L5XXD65q9N7/NifwWOXmauB2JDbGHjZUNB
 qZeR3fP+bV1xon0lEKy/FaHRiMfOmyEfhFwEGX/qEcjfZI8bXYAuX4ydeCgey36Cs+tiLID1I
 7NGhlqABd+2nBrIaz526/dUEiOfWdmeqpNidvfUUbQaEA4VSzNI4X2bq6sykoCvyUinod02bu
 JRBZirpo8vccs0H6DHY50w2stNmh23PMlbTa+rcGboI0IRtbsysJC4/pJTf1lWoVyPHsyJbpE
 ywKq73bBQeRYB9XjiVpqv/ymOJuTe+uQEehYg61wf25/Njmja/UCH9efNr3TRnj5tHLvInD4f
 qAGnW4eWurjOvMFw2Ngnfe+7ZwAPmddRb9wM0kX+QpFrkCnEvWK2jhdMoGt0dlVmqf1qDoygi
 gYszK+1v91BuZBout3OxiiPuMeuOx0UhvGDsfAn17uns92i5SdIA3ZZ+1Ic8qgZmXBLD4G1gv
 aVHzNiRVxTngQA9xiHKwhQ4wIRk7jCrFqCCjFp9+G7WUouO2sNhmFgBwL+PVHFWhPq08Sx4co
 vCY3XFfT+vltUuKnZmAZ5MTvZXjFAyBukTHV/yqqS6hAug9ByuJGRMzfGjs8H/F0hejeVXWlq
 8sD2UR2gLzOkc+gAsUcqnsTKnt4eaFde12vRyDWfk9Xz81qWcmnGblnNJnE8dDkk5rhOqKsl1
 I22doOuLfp0k2Fd8oEFwXoX5exzSXiT/D6v3B22dgJZhb0JvQ82PrEARv0nOZs3YT2/Da8Zke
 b43ujM04GeKJXPti7FGnglHw6wgZa13FWd/mYRFiw4YmLz9cRLweSLOhsSIvpMgbQfsXNZJYG
 WfDUZ8yhNbCFtEQI6HUzbHBypjU8TFUhblX75lZg3aOrwlQmHPiBahaXV5n7VYtX8C2LYyyht
 w6mHxmdDML27RepJEktIJcPhlYH+7812wIluENy0gOmK/VfPm1s+FiKu1gxu4WP+hHnNO3XAR
 l7fRQlj3KJvtcM5QKIS+lffJWAfhw1avbfkJTwyyiud+9B/YHQK6ZrhF9QmHt32nyMVigD9Qj
 f7evONnVTDydANC7wwvGn9g+LyjlHkhSYe0DcXjvHK86COEuD1ldaGCHtZYf5z7S5uNalEeiW
 Wj67bLsB+UqTqzd+i7zzlS2T0WFvh8VTSqGzOMk8CpRWl1V4ZD/ZEMSsJ0EmU4Mbe6/Pp0wbe
 nZ7Yt5Lj6oE9fEkOzw1zA7RfVhC8lcXJeLEY9MZ0ValV+03uRGFCzZWFL/7k5NHrZyMMdOP9k
 ld+hpKn46JHQi8E6kBFd5yBWkCYlIbJ9cBF90EaUvH60E+CjZCJv50OTI7Hdm3km1lDTjOPks
 vqo6eqmzX0vefeNyRKVtPsRpBOwMdJFkVOhmAAJWAwTah50OxjPG9vIZG43XyoR4cbFvl2PlH
 mlZPb1jWyTmxaCU9PYr3R5MuDXdS9qfsy82RSl7V1juXCJ57QecFZUwMeHP4rpEC8rRedfF7c
 7Q3HigYqqrU2tpVkr83BdlZZVTxE2g9ZInKlydaYgyDOFWZLxjfVpKpfHYelVPsq1zBQJziKk
 FlPO7U2c27vzDz/X4QCVuZWIINWcn6zxH4x4SqIXGtRGV84xoUKy+N4JI+uyZffthsSiBaNbC
 58iKJd19aUaw/5Gb+sPDTCdrOyR/5kFZyN1MafHMhpdaO9zXMKMwiHn8EPGSwR1sy/I/sEO65
 Oha/VpDn2VSiCpObhoHCsRhcf7NPdV5nDC8iowT8piKyN6lS7SxSHm36ss7cuupEL7dMejyh2
 aqvSMmONoId46z37uwb20DpVO8tIOdBvC7QKUkjDW7l8lKuDB7rPC2Urjdf8xIVULTjRMDCP1
 Ly6NAPqLA4IYzSeUaPvw0n1jF4uy2mCWZsy6KcPm/ws9t2F7xroS3r4MGkh9uxOloQ/w3DWKZ
 brlC+hOAz71RMMaI1WPLXQm3eoLjAGQxp5fXMKC52Ndnw0q0NbTEyeK8rxtvtjp20dbMo65aN
 0P5OTE3bK9yP6nH6Ox+mg0T4Hn9nxu/yLELe6iZrpSX715HbHm854Z3hqM52OgTLBcHbwb1YI
 RDyxIUO2THTYTxGkXYMq8JfXncyzSHnSggI/D6tkvnsLehOiF/2Kjigf8+z/G7nQsm6n7BdcO
 OvWfHh1Wg6B3yCddNOZx7/451tG5zXi/+2GULmtjN11gZ+Hdtt3aS4uO+lN6Gixwj6mi5nQkC
 3aFJAMkT2gyvFCv43BX/S3/NpK0LDSZLIyM/SNOfWjfYoli4lynJBENQYFtWhA/FL4pQKi76I
 TF2W/W00EBcsx09KPVOjH11uzpdMxM2E0i56K6xm+OQsh2QvIzNDQ2oWVtpD5dMST2UAI7sv0
 UGw1ANjEgzfZfbeqvYzYWfh9A+LgJmOOVfrNj9kEIM4dmPEoD1WQuUU9woHtg+qR2bPVMgsya
 tmBZ7P7btsrV9pSK7OI8XVbXMx8o5K+BbC2FSTLacdtG8vCkenJYzt3XJedv6kJN/EqPgGyKj
 /NiOYE1rmpjkpkmcqaKjGdSWog6jgJHAlyA6nIqEw/v6Km3thb1XWiIwh12sbZrY2MYywmjSa
 ecCK6tfpJq5FwGfv0r89PILdRA2HBnrhDjbb+kSBedKiIlPhp0RPu279gPd2YvDKlNleSaUI7
 t7ILtblZftoMAZe26S35Mk1QKdCin/o0EbNMnribq3ASJG8u0Sh+lEvl1KAP+l2/WjCKAXHxX
 mHe8sQdChXVdeSdTPj3R9NVYCzTzbc5kY66x9YifljcQtfUBi34KeN4CnQNrKzAPvkwirExpg
 TJ1tfB5xHvdxkjC2ok0qlsTycdAvxPSXN4zJods63YAn3mBWWJo9aaSgTunazyuW0d8SJeoFW
 +bvYCQACxvys0Y7d62F66623gbRmNwPg6WLJa4tp+eHTHpWoWHQjlarxRCfOUR9ziqpmLaPGK
 c6hpKvBYbBEJCrq4GqbObFJCASBaKUjW48yqK96Jd0zvi5tX+PXHp9RPV8HKGIBqlouTsLt52
 PUxdjMKJ1bx8I+qB/fULS2gi+H9J7VtP44634XsM2tRbQzbpns1gzqkReWl8pbZGQ6epQQalS
 93aa71Z8m1Jpk/LE6ZvJY8uJ1VL22GSS4fry2cErVaYo5mXI2ghNplJL/Ypy6P6VdussSS7c3
 6tON6C4ws34ldrdwqga3qVVdfE5Akz1UqxmjxGgXN37Cu2sdmvBbNGYPqZYs+ZBVeNrWR5gtr
 cbS0QX7/qGRtdrHt+KBm+eijrPhZLOjSH9qHPGNR2Wcn+aVdNNo6fipynl2LprLoI81SGmrto
 WvAxcR4w7N7h2W6iPSDGPKRJoM0SzZYV6ljOVnnQ2frc9dsjS4ZCWWgDuWAjaMMxknFig45oS
 P8QrIhzoffEuIONIhbo6c5EAMYpWPSUourXYCYAV6xHxVjWta/6jlRojABs5Y3MHnb6NTZ2f6
 YJ3oMiL2A/js71TkeXaXAOKFLR1VHfuih4ulG9l9GycO2PK34A1scoPL4HQ/OU2xjYvfJQ4Vn
 j8/JUSKAVxSAoKSUJTdnXShv6PaufpLlruDJD5yAZhbU9h5N8AsZ8qE4gWC29wS8jH/I48dlZ
 cik+hoGAsy8n5YjRM6jX46sivbRB0cafDu9/iox6nWJhlnO2pj3g6rr5FPUx3C/0Y5NCvhzVb
 Q0SN66jyNpdOAemKFHLL5ZdnUnaTXzgyXEB4KKLYxRJdTfCsTJai3q5C6M8WDgFPH108+pD4z
 upTqPlohF6xOG7gkJxVHfHffN2TTx5KemHtKuUKutrv/4NV3XXKkVGhSXBD7P+wrVd2mG9OuY
 R9I1+RylnxGtTUnD9vOOSKM8nI3Eh7xwZOYFYJ8SL9HNx2XXKDBLHSmpYemXDtXEpBqGkB//9
 5ndo1A8ZVgmeOZPzoyepUHzm39+mAJJGJJKsNH78gvc3y1CtZiXDKG6gH10g/QhBsvIH5fnO9
 qNDl+w4YaDt1i/ImdDb39XVrIDpN48ZxcJM4B8QMoODazA3APAYMXAYmAFder7ZPCD5p+OMRQ
 1QMOf8WC++GHTlqKv6a2PQkEDH9eQwJsFu/HCO3wRqmLBisLuhud5Wog2NO5ybeleb2xnt8tP
 Odyu86BWqgoWZmwG7VgtabdmFqE7H/YUH5Zlup4932OZZPVE0K8/SfIxxOH1XJBsU6mKYKJvj
 iDM3dRJSHv0MeM3575RLkgS6CbLhytegNlQQ7U7Flaa6OBzGz9M8ylcnaGdLjS4qDzb//1Ybi
 1iiLCDOeptVlA0xwEiCLa/DaeXWYFwenZOl87ELsoX52f2+jqmPxs2B67iMLtmaB+F5I/aesV
 5h2NcxtVD+lk+P2xDA4gwKJacX9ry1nibGRccYw0w2/x2qtZkP9lj8BgCQ=

On Fri, 2026-10-30 at 21:03 +0800, Chengfeng Lin wrote:
> Hi Vincent, Mike, Peter,
>=20
> I have additional pipe-handoff throughput results for 333238da9a19
> ("sched: Update time before requeueing delayed entities"), which Mike
> identified in his wakeup-jitter test [1]. With 15 workers, will-it-scale
> throughput on v7.3 is 15.69% lower than v7.1.3 in thread mode and 14.82%
> lower in process mode. Reverting this commit on v7.2 in a separate contro=
lled
> comparison improves 15-worker thread throughput by 13.65%; the 2-worker
> control changes by -0.48%.

After much crawling over trees etc, and way more yacking than intended
for a datapoint, I think I know what's up, and it's simple: there's a
good reason those "now" updates are event driven.  That one was added
in the DELAY_DEQUEUE machinery, where it expends and *banks* precious
fastpath cycles, shifting bean counting enough to make DELAY_DEQUEUE
measurably less effective.  It looks completely broken with a 20% util
probe, but more measurement shows that it's not dead, just a bit sad.

Test probe sent another signal in virgin flat in __dequeue_task(), and
I think it's valid for that update_curr() too. It seems to be in
keeping with placement strategy, but with flat changes, we just updated
the cfs_rq where all the action is, and hierarchy update is right below
it.. looks like redundant overhead.

	-Mike
