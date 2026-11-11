Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794431322;
	b=lBjUbrXI35z/TDqQ63zlX0hHqRe54NLJ+8Dtyntk44rJ6R27YBbO1Inm27wOeLIEPegu
	 IA50H+mEyvL2in2nzeetzhspANtOnP1WgJUtdjr4CMTnqbmspkn67xNM6G6FR0x6v2ElY
	 L74LsVaKsWTo9q/MrOSs1mQgXMwoIP/WfM260jpbK22MRQh/ekYm80jZ5xqd/Q8NjgTF6
	 NBQULiH5HpCWsoAutvDgw25G6MimA2APa5+fHhGXC6xtgNdUEgWN8x3gK6LB7YdOpCHDH
	 pVgrRXkXRQBXZYf8ApwXg2WqiBr/Se8ZWLLGnB5AVLe3o+A45j27n8NdHK07KBYCRDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794431322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=btDrkYTYNJ0PoGfoU0vNHJPAv57DG39AtPHvIg5EYYI=;
	b=L6tsTbJtXCzvweZRjLgg6lg+lC5cqc6VWwWtx2b9Sz1Qa/h3fq3Gmh/TcNtTZtyiMDts
	 hYGVZgae6wqTg6OK8SrWic1UeY9OvAL9kHpB+j+8AyvjLGsvEUR7nMfABaMwleWHTFBzD
	 D3vG3OdBuo/aQd7sWYLF/AZH1l3fjzdHh4SkuyCZlqNqT6seu7spuDdsta6CbuKdQlTJU
	 Jtz3IXW8GpcHmqlye6rWzgndkycVNHEeP277gbxcr9dp23MWM7AVsJZ3VoF/itMIDDvq9
	 S0bHVvmcpqHzoLzRHTMP6jojhQwPo5b+0PgYo2PDhKUuckBUrnuP0oYdKBUhNR+hZgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=bQ+l9VVo;
	arc=none smtp.remote-ip=209.85.222.41
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3240E606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3240E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=bQ+l9VVo
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-996eeadfbeaso1841468241.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794431321; x=1795036121; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=btDrkYTYNJ0PoGfoU0vNHJPAv57DG39AtPHvIg5EYYI=;
        b=bQ+l9VVoMwvAm/CKFZgdLB2QydP5aWKXNvnAuRgO7SaPeutgpV7zl6BX4179rQZg48
         ZV422cFKzeEEenQuviO7fzqLfdEAJrZqNkxCUmgzDhFOrFBXYoqhQkBnRCkt4NAN2Tmf
         E+w6NsOSrf/Np+SEOkqdA7z52ETjOzKDkDzQ1Pow+VrZmLFAetPIFsK2vGPn6GZjJ8kb
         PVSZqcryXLm4jIPf34OloxwEtRHMsZ9XDOZzW3kSR0vgGB8SxqYOmzuOV7vWn6Ch+lPL
         MVnwmggm63D/Gv5FomqIr5b/eUgN9HWBbgn7rzYLaLo/IOG4tqYrV98AGbIp4D/L9UEl
         Uk3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794431321; x=1795036121;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btDrkYTYNJ0PoGfoU0vNHJPAv57DG39AtPHvIg5EYYI=;
        b=ZurWAGntzuGZmN2vAjwWpgT/YlU5Kh8t6pGgn+t7mx+dydcT2mpYRfkXxg+lhtcZSb
         CWbd8nHtZvwUe7kF3HaPKynK//coIO7IiG703Q+odeOwIu/85Ivt35J1npUl/c3K3IGY
         WIAD0XK6kCRM0cWRBujr3oeGFdg7hr4N9kbWlYKayYARWqBED25K2FscJB34kzaIZmCK
         TiceTcP8ubDZKsyQ72cX8+THsERi8Dq92Ub5+A4SysrBcOUNLkeoskLqMK9UMPRgwlgx
         O2/Iq1MWNH+wrHRvuaNILE8kP5+wQbsuwa21l7rIuhqnTMgHLAEgh4E3yq1TkksFz7Vn
         oRnw==
X-Forwarded-Encrypted: i=1; AL+hErHqzat0kIGUK27HrwB0qDcGA3x06V5I36WFvebLMWYw5MBKKIIpOr48XKjOlp16nm2X6yvwFVLfi8A/hgo=@vger.kernel.org
X-Gm-Message-State: APuU4Z80OmkluT/rqLtjwrzHhn6GV5tMqldMjpWWym+In+PgskDufXC0
	vl3lFY739AH4XB21thj2KWrzPkfDsP3EUvTSHC0dn7/lO7mLHOHLQcpgmv1qrMotj1U=
X-Gm-Gg: AYBFou0oOaMpxmQa6pS1/uVt7nlhXCFfvaOcUgdIdPnfNC7abYLYdX46RuMzxleC5Sb
	s7+nkO1GCcLwPHcg3gS2UEQ6a9znXjEWxsB+gfkM2xiVCA38CUCp10R62GHBXMGGcdRxVEk8zbZ
	SQ+1+7kCNL/4dbTP5jl4PIBE2gwKXMW65it0Kg0SUNPjQR748IkjSEl53rEoL25OTlaz3gNOFiW
	yYIyenUX7aVUI87NMErAZMS6xpKUFMU+zFoTvCDPqwgNj9nhN465C7QMV4AK1o2advx+2okmqsR
	c4cpVDznOwNDwq1b0cCn0Ylrb3AIJUi8AgOX3vvynRF8A1+lxHaRNWGSDngToxvP2A/yS72t+i+
	LkGPV29tJPsgSfYyMpac9B+JRu2RABOCu3AaKAWAaiMx3kLaP2/WkXLfl15wCxX3IFWPraYyxEy
	UAZmzEXq7aCHerMVi0IelQIfGBMlq9NHI701NjxdeWO7GdzaunS/Ek4qyzdkqWHExA0yPYMV040
	5aq+IPJG0D8536CVTnzwWgnd1m6omd3CL/ghr+WlYL/QmcevsBZ+Q0PcDCOCa5xI+E+FJ4D+Dag
	3JQVlcZ/u9ZipCVqJuCKH6tYc6aoVLmcluRthC/Is6NdrxS5cuRpDZvyEa3hWzVSOvWh3K5aibx
	kj+YFTt4+BpR4C8LCWhojoINNNKyt9CmdXdJD6BjZ+z4RraVWYQ==
X-Received: by 2002:a67:e7cc:0:b0:7cc:2bb7:1335 with SMTP id ada2fe7eead31-7d50619786fmr1721867137.33.1794431320983;
        Wed, 11 Nov 2026 13:08:40 -0800 (PST)
Received: from localhost (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d302239188sm4464461137.2.2026.11.11.13.08.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 13:08:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 16:08:39 -0500
Message-Id: <DMSOTBXD71F7.1EJSHUFZLZH39@soleen.com>
Cc: <linux-kselftest@vger.kernel.org>, <shuah@kernel.org>,
 <linux-mm@kvack.org>, <skhan@linuxfoundation.org>,
 <linux-doc@vger.kernel.org>, <vipinsh@google.com>,
 <linux-kernel@vger.kernel.org>, <corbet@lwn.net>, <dmatlack@google.com>,
 <kexec@lists.infradead.org>, <pratyush@kernel.org>,
 <rdunlap@infradead.org>, <graf@amazon.com>
Subject: Re: [PATCH v5 4/6] liveupdate: luo_flb: support incremental
 outgoing FLB publication
From: "Pasha Tatashin" <pasha.tatashin@soleen.com>
To: "Mike Rapoport" <rppt@kernel.org>, "Pasha Tatashin"
 <pasha.tatashin@soleen.com>
X-Mailer: aerc 0.22.0-39-g5d7784875be2
References: <20261105050053.3063001-1-pasha.tatashin@soleen.com>
 <20261105050053.3063001-5-pasha.tatashin@soleen.com>
 <179439592041.425130.7284974054491864276.b4-review@b4>
In-Reply-To: <179439592041.425130.7284974054491864276.b4-review@b4>

On Wed Nov 11, 2026 at 6:18 AM EST, Mike Rapoport wrote:
> Hi,
>
>> When a session is published to KHO via luo_session_publish_one() ahead
>> of reboot, any FLBs that its preserved files depend on must already be
>> present in the outgoing KHO FLB array so the KHO tree remains
>> self-consistent.
>>=20
>> Currently, outgoing FLB metadata in luo_ser->flbs_pa is populated only
>> during reboot by luo_flb_serialize(), leaving luo_ser->flbs_pa empty
>> when sessions are published earlier.
>>=20
>> Publish outgoing FLBs from luo_session_publish_one() via
>> luo_file_publish_flbs() -> luo_flb_file_publish() ->
>> luo_flb_ser_publish_one(), and drop the now-redundant
>> luo_flb_serialize() pass from liveupdate_reboot(). For each published
>
> Oh, my :(
> Why do we care about exact long call sequence here?
>
>> file, luo_flb_ser_publish_one() either appends a new luo_flb_ser entry
>> with count =3D 1 using smp_store_release() on header_ser->count or
>> increments the existing entry's count in place, keeping the serialized
>> count equal to the exact number of published files in KHO without
>> including uncommitted sessions or transient
>> liveupdate_flb_get_outgoing() references.
>
> Got tired here, the prose needs a lot of human touch.
>
>> FLB publication is one-way and never needs to unpublish: before reboot
>> it runs only when a session is committed, and a committed session never
>> unpreserves its files, keeping private->outgoing.count >=3D 1 until
>> reboot so flb->ops->unpreserve() is never called on a published FLB.
>> If more FDs using an already-published FLB are preserved later,
>> flb->ops->preserve() is not called again; file handlers update the
>> shared live object via liveupdate_flb_get_outgoing(). Consequently, FLB
>> handlers must:
>> - return a stable root KHO handle in argp->data from .preserve() whose
>>   address does not change as FDs are added later;
>> - synchronize concurrent mutations to outgoing.obj with their own lock;
>> - support per-FD rollback when uncommitted sessions close without
>>   disturbing already-committed entries.
>>=20
>> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
>> ---
>>  kernel/liveupdate/luo_core.c     |  10 +--
>>  kernel/liveupdate/luo_file.c     |  16 +++++
>>  kernel/liveupdate/luo_flb.c      | 111 ++++++++++++++++++++-----------
>>  kernel/liveupdate/luo_internal.h |   3 +-
>>  kernel/liveupdate/luo_session.c  |   2 +
>>  5 files changed, 95 insertions(+), 47 deletions(-)
>>
>> diff --git a/kernel/liveupdate/luo_core.c b/kernel/liveupdate/luo_core.c
>> index 1b2bda22902d2..9fef5161a1f3d 100644
>> --- a/kernel/liveupdate/luo_core.c
>> +++ b/kernel/liveupdate/luo_core.c
>> @@ -219,18 +219,10 @@ late_initcall(luo_late_startup);
>>   */
>>  int liveupdate_reboot(void)
>>  {
>> -	int err;
>> -
>>  	if (!liveupdate_enabled())
>>  		return 0;
>> =20
>> -	err =3D luo_session_serialize();
>> -	if (err)
>> -		return err;
>> -
>> -	luo_flb_serialize();
>> -
>> -	return 0;
>> +	return luo_session_serialize();
>
> I suppose the wall of text above describes why you change this.

Yes, FLBs are now serialized as each session is serialized, so the separate=
 luo_flb_serialize() pass in liveupdate_reboot() goes away. I will make tha=
t clear and short in the commit message.

>
>>  }
>> =20
>>  /**
>> diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
>> index 988eb313a135f..611b9967a3a91 100644
>> --- a/kernel/liveupdate/luo_file.c
>> +++ b/kernel/liveupdate/luo_file.c
>> @@ -380,6 +380,22 @@ void luo_file_unpreserve_files(struct luo_file_set =
*file_set)
>>  	kho_block_set_destroy(&file_set->block_set);
>>  }
>> =20
>> +/**
>> + * luo_file_publish_flbs - Publish FLBs for all preserved files in a fi=
le_set.
>> + * @file_set: The file_set being published to the outgoing KHO subtree.
>> + *
>> + * Iterates through all preserved files in @file_set and ensures their
>> + * associated FLB metadata is published in the outgoing KHO FLB array b=
efore
>> + * the session itself becomes visible in KHO.
>> + */
>> +void luo_file_publish_flbs(struct luo_file_set *file_set)
>> +{
>> +	struct luo_file *luo_file;
>> +
>> +	list_for_each_entry(luo_file, &file_set->files_list, list)
>> +		luo_flb_file_publish(luo_file->fh);
>> +}
>> +
>>  static int luo_file_freeze_one(struct luo_file_set *file_set,
>>  			       struct luo_file *luo_file)
>>  {
>> diff --git a/kernel/liveupdate/luo_flb.c b/kernel/liveupdate/luo_flb.c
>> index cd715a7c1d992..6cd87a9f8307d 100644
>> --- a/kernel/liveupdate/luo_flb.c
>> +++ b/kernel/liveupdate/luo_flb.c
>> @@ -34,6 +34,15 @@
>>   * This reference-counted approach ensures that shared state is saved e=
xactly
>>   * once and restored exactly once, regardless of how many files depend =
on it,
>>   * and that its lifecycle is correctly managed across the kexec transit=
ion.
>> + *
>> + * Serialization: Outgoing FLB metadata is published into the KHO FLB a=
rray
>> + * incrementally as sessions are published to KHO (when committed early=
 via
>> + * LIVEUPDATE_SESSION_FREEZE_COMMIT or during reboot). Because a commit=
ted
>> + * session never unpreserves its files, FLB publication is one-way: onc=
e
>> + * published, the FLB's .unpreserve() callback is never invoked and its=
 root
>> + * KHO handle from .preserve() remains immutable in KHO, while later se=
ssions
>> + * may still add or remove per-FD state in the shared live object under=
 the FLB
>> + * handler's own synchronization.
>>   */
>
>
>> =20
>>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> @@ -72,6 +81,13 @@ static struct luo_flb_global luo_flb_global =3D {
>>  	.list =3D LIST_HEAD_INIT(luo_flb_global.list),
>>  };
>> =20
>> +/*
>> + * Serializes updates to luo_flb_global.outgoing.header_ser and .ser[].
>> + * Lock hierarchy:
>> + *   luo_register_rwlock -> private->outgoing.lock -> luo_flb_ser_lock
>> + */
>> +static DEFINE_MUTEX(luo_flb_ser_lock);
>> +
>>  /*
>>   * struct luo_flb_link - Links an FLB definition to a file handler's in=
ternal
>>   * list of dependencies.
>> @@ -104,6 +120,36 @@ static struct luo_flb_private *luo_flb_get_private(=
struct liveupdate_flb *flb)
>>  	return private;
>>  }
>> =20
>> +static void luo_flb_ser_publish_one(const struct liveupdate_flb *flb, u=
64 data)
>> +{
>> +	struct luo_flb_header *fh =3D &luo_flb_global.outgoing;
>> +	u64 nr;
>> +
>> +	guard(mutex)(&luo_flb_ser_lock);
>> +	if (!fh->active)
>> +		return;
>> +
>> +	nr =3D fh->header_ser->count;
>> +	for (u64 i =3D 0; i < nr; i++) {
>> +		if (!strcmp(fh->ser[i].name, flb->compatible)) {
>> +			WRITE_ONCE(fh->ser[i].count, fh->ser[i].count + 1);
>
> An LLM says:
>
>   Why the WRITE_ONCE()? All writers hold luo_flb_ser_lock, and nobody rea=
ds
>   this before kexec.

Same kho-ro prep as in patch 2, will switch to fh->ser[i].count++ in v6=20
and move the concurrent reader bits to the kho-ro or luo-ro series.

>
>> +			return;
>> +		}
>> +	}
>> +
>> +	if (WARN_ON_ONCE(nr >=3D LUO_FLB_MAX))
>> +		return;
>> +
>> +	strscpy(fh->ser[nr].name, flb->compatible, sizeof(fh->ser[nr].name));
>> +	fh->ser[nr].data =3D data;
>> +	fh->ser[nr].count =3D 1;
>> +	/*
>> +	 * Ensure the serialized FLB entry is visible before exposing the
>> +	 * incremented count to concurrent KHO readers.
>> +	 */
>> +	smp_store_release(&fh->header_ser->count, nr + 1);
>
> An LLM says:
>
>   And this release store pairs with nothing.

ditto

--=20
Pasha

