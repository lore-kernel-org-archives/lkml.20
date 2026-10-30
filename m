Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.117
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793340374;
	b=LSJJJAyFkBEUr++xSj/Ckl91yJ3N2U9OfQrefhDgnOBrWjwDFHXkbWvF6CTbbHuQEbSv
	 90OFmNnVrrhyichCfXrjEkdiSd7otdCMPUnuBW5dJF3lMTB+tlatT/4riEzd6+K7jRl7g
	 zdGT/a5wa9nV+TMIZDtLA5YslfNnjCia1ae0VY0ydL6c9UCmAHYa8c09Lc3p08sW2jlpO
	 5E+SzAt+tSBgbuATAkqNCUhUG5ScIG+IOBKHvgDB450bjywepIZDsoULKA0RVbA9Qlv2W
	 fYg2kdyNXQ5c425dEPZHSlI6kHCDE4l0qi3sDtC94lrNzEtkfLKIeGSWwXkdVDZJBFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793340374;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Content-Transfer-Encoding:
	 Mime-Version:Subject:From:In-Reply-To:Date:Cc:Message-Id:References:
	 To:X-Mailer;
	bh=fbxoQX/plT7MQ1IcvaeIBbt38pbNjazi3Wk4GqeaYLY=;
	b=rOus+ydrs5jhsBB90GfKwPixhuW4MtAyyeb+RbaSuaFvoEiFs3kcPOHjv2qISt7qT6xw
	 RTto5gjMq8/XIFXunKG2lkwRICnseNKS6CkvQp7xIkKrax6RTDXkilfFOXQZE+NyVRhRs
	 aBTEwzt7lx7sb5qrspEEXkkSrWyc1BKSiYCfuZs5qHMyTqelxlRdZhv+tKpfNnx5VDiGI
	 SJUF6TjxwCVEP+w/4zI4KBNR7Uv/N6SZmANPndgWgRj/3HBnW2dJVZfcpWEJ6+MGsnLor
	 Llk9CZXcpNAsG0Ug13lRxzr4lJk/iJok1sYhPLlbOXFu1yPzTQmH/SzF8ze/5rw3FcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=t0v8f46z;
	arc=none smtp.remote-ip=91.218.175.117
Received: from mta0.migadu.com (out-117.mta0.migadu.com [91.218.175.117])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43722606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:06:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43722606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=t0v8f46z
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=WkTwqX/0WclNwP9VVkIpT9VytTtOvvnnIOTZf6eqCbs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793340370; v=1; x=1793945170;
 b=t0v8f46z1mKbxTItQepNAtSI47ayWXEAaP+PY8lg8jqxIdr7G3U6RsRtPH6ssB50JfFIw5k2
 Ss7W+Z/NZVb/M4I1vsFrjo4MvRdV2OmuHSK3QQJR45zylFcAnH3PInz9gORBiBQwN7YOUkO5hiO
 d73EuxQdrK+sDU6Vfg+KsyBg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 70b245d929eee882;
	Fri, 30 Oct 2026 06:06:10 +0000
X-Mizu-Trace-ID: 70b245d929eee882
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (1.0)
Subject: Re: [RFC PATCH 0/3] mm, memcg: isolate deprecated v1 state from struct mem_cgroup
From: Roman Gushchin <roman.gushchin@linux.dev>
In-Reply-To: <b36ab4a7-b692-49e8-92b5-1dc4d76dee00@linux.dev>
Date: Thu, 29 Oct 2026 23:05:53 -0700
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@suse.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, muchun.song@linux.dev,
 cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Tao Cui <cuitao@kylinos.cn>, cui.tao@linux.dev
Message-Id: <0BEF7489-16EC-44EE-847B-A6AA380BE11F@linux.dev>
References: <b36ab4a7-b692-49e8-92b5-1dc4d76dee00@linux.dev>
To: Tao Cui <cui.tao@linux.dev>
X-Mailer: iPad Mail (23G90)

I believe we want to delete this code sooner than later, why would we rewrit=
e it before that?

> On Oct 29, 2026, at 10:40=E2=80=AFPM, Tao Cui <cui.tao@linux.dev> wrote:
>=20
> =EF=BB=BFHi Johannes, Shakeel, Michal,
>=20
>> =E5=9C=A8 2026/9/19 00:24, Johannes Weiner =E5=86=99=E9=81=93:
>>> On Fri, Sep 18, 2026 at 11:41:09AM +0200, Michal Hocko wrote:
>>> On Thu 17-09-26 13:26:40, Shakeel Butt wrote:
>>>> On Wed, Sep 16, 2026 at 08:57:34PM +0800, Tao Cui wrote:
>>>>> From: Tao Cui <cuitao@kylinos.cn>
>>>>>=20
>>>>> The legacy cgroup v1 memory controller has already been moved out of
>>>>> the shared implementation at the file level (mm/memcontrol-v1.c) and a=
t
>>>>> the Kconfig level (CONFIG_MEMCG_V1, default n since 6.11).  Its
>>>>> per-cgroup state, however, still sits as individual members inside
>>>>> struct mem_cgroup, guarded by #ifdefs.
>>>>>=20
>>>>> This series isolates the deprecated implementation from the shared hot=

>>>>> structure: all v1-only members are grouped into a dedicated
>>>>> struct mem_cgroup_v1, and every access goes through memcg->v1.X.
>>>>>=20
>>>>> With this in place the v1 implementation is self-contained: its
>>>>> interface in mm/memcontrol-v1.c, its state in struct mem_cgroup_v1, an=
d
>>>>> its eventual removal becomes a localized deletion of this struct
>>>>> together with mm/memcontrol-v1.c, instead of unwinding
>>>>> ifdef-scattered members across the shared header.
>>>>=20
>>>> Sorry I don't see any benefit of this code churn. The code is already b=
ehind
>>>> config. What exactly this code churn is giving us?
>>>=20
>>> The only arguable upside is that this would make it ever so slightly
>>> easier to track v1 specific stuff (once that s@v1@memcg1@ or similar).
>>=20
>> I had the same thought. It's kiiind of nice to see which members are
>> completely specific to memcg1.
>>=20
>>> I am not convinced this is sufficient to justify the churn either.
>>=20
>> IMO it helps that it's mostly in memcontrol-v1.c where the chances of
>> interfering with other work are pretty slim.
>>=20
>> The patch 1 + patch 2 split is a bit bothersome: indenting everything
>> into a union, only to then move it out in the next patch.
>>=20
>> Tao, if you folded these two patches to make it one clean extraction
>> and changed over the sites at the same time, I would probably lean
>> supportive on this.
>=20
> Sorry for the late reply.
>=20
> Thanks for the feedback.  Looking back, I think Johannes' point about
> the patch split is fair.  I split the first two patches to keep the
> initial step semantically neutral, but it also made the series look
> like churn for the sake of churn.
>=20
> I'll fold the first two patches into a single extraction in the next
> revision.  That should present the change more directly and hopefully
> make it easier to judge whether the resulting boundary is worthwhile.
>=20
> Thanks,
> Tao
>=20
>=20
