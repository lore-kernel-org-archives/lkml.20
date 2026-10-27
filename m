Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793095283;
	b=liIBt8TESy+F3sdP4WbJWiYB8l8ON9hqL3BSn0l2XmVZVccrGcHAtaWfnBw9wF9tiOMG
	 WeS0UdB8yzw8LXY2pk1mpuofISgSoHDbu2W7iVG9dC3LE1LQNZHLi2iH2gnJRddQUHVTv
	 +AEs7uKV11lQhxujY3zgBgNQErQcc80TQ9zH27g6d4XAekXdw/jWeWd3DBWNYGM/AFb7s
	 EYZB+Khtsw6rYaFzIhviAGcVOm6jbGw1SPl4UuUDd2BFDQw/imVPEobLU19P0GyVAe0va
	 iXlbZ1SUOJRzfLiZZSHpW/GM77JJCs4GGn8XUJn3jzCB5r2h8JU/jehuWqTNKPyE71Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793095283;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=L+gSpaQUQPt7P5ywYyn2q+jrj5cBWW+lBXUYhbSdfvo=;
	b=IpnWdVV8CTtqjvGfsKGmzDdfwJo6YsomifduE9PEEqXUUjROK0S0OdxSXIari2stOPw1
	 3irBcNG2IfjaUQFvvp4BakR89DbmaEfPr8lK2ZDZKJOaFaSF8twvqDnCQIrj3/jZOXzgK
	 nqA3QU7o4AUcMfWjMmhxIrC+p294XZQ6/IEkbPHikwbwg70XDclKgRsnkPJcI0ihZQmXx
	 xh/mfl7uPnSvNSqgUza/VOGWdiRhm7dq1vq8pDgOlDaAkvNoZZOScpdbJWxgvRUDRNhdZ
	 s2dRCrZosIDkHDCMi+8P0n9ydaUWZzMe3/sL7H92co/oed15wlOu/e7+AEu4lBaUdmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rdiS49OP;
	arc=none smtp.remote-ip=91.218.175.14
Received: from mta0.migadu.com (out-14.mta0.migadu.com [91.218.175.14])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A28606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24A28606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rdiS49OP
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=0cM0mfrta2wbBP3arklI3bzBS+q6bMYED+sSee7wFis=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793095280; v=1; x=1793700080;
 b=rdiS49OPxH+ER7Nfn1HSUDjk51CifKZYcuNZqOeCdwHssIavSy43pSYc63qFmh/NUUELy8ct
 LGslXsNp3gbINh0X7lBv8DxDGcPc1Um27FMrHI5fp6MOiawyYG1AIpDYsm48vhh27dmxbLLCH2X
 AI3fK3j3FX5fNlgzxDyBqNfc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8db34f6421d02374;
	Tue, 27 Oct 2026 10:01:20 +0000
X-Mizu-Trace-ID: 8db34f6421d02374
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 27 Oct 2026 10:01:19 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <5c3f973b90b90271771f6deaa8748f8ece50b370@linux.dev>
TLS-Required: No
Subject: Re: [PATCH wireless] wifi: mac80211: abort chanswitch when leaving
 an IBSS
To: "Mehmet Fide" <mehmet.fide@gmail.com>
Cc: "Johannes Berg" <johannes@sipsolutions.net>,
 "=?utf-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?=" <toke@toke.dk>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 mehmet.fide@screeningeagle.com
In-Reply-To: <20261026152543.1272978-1-mehmet.fide@gmail.com>
References: <20261026152543.1272978-1-mehmet.fide@gmail.com>

October 26, 2026 at 4:25 PM, "Mehmet Fide" <mehmet.fide@gmail.com> wrote:


>=20
>=20Hi Luka,
>=20
>=20>=20
>=20> So if I read it right, after leaving mid countdown and joining agai=
n, the
> >  next switch with a countdown now gets past mac80211 and runs into th=
is in
> >  ath9k_htc_channel_switch_beacon():
> >=20
>=20You read it right, I reproduced it on an AR9271 with this patch. A me=
sh
> point hits the same WARN already without it, since ieee80211_stop_mesh(=
)
> aborts the switch the same way.
>=20
>=20Dropping csa_vif whenever beaconing stops is too much though: off
> channel, e.g. a scan during the countdown, beaconing stops with the
> switch still active, and the switch then never completes. So the fix
> drops it only when the switch is no longer active, sent as "wifi:
> ath9k_htc: clear csa_vif when a switch is aborted". This patch should
> go in with or after that one.
>=20
>=20Mehmet
>

Thanks for sending the patch, for this one:

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
