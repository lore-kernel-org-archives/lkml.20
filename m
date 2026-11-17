Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794891263;
	b=PrW9dSwOqx/2E5CQbUIZ1w2q5jxQutqwAAcBDbinbbo56xn0F88jpzWgOB9c3IjPI0N3
	 JlzS23RoI+hklYGtUKRuMKVSwz18qh6oEiMbqw7F+b9seezt8irerY8qPXSLMIulizU0c
	 lTPvIKw1EHgJl+Wft5rqW7kZmUmwJFB8c2N/gkj8oeD4v8xB1pSCbs9ur/u7naXa1a97A
	 XxGTj4kvoIk9BpKOWWlmOsF6IKbFjWiLFa/4HovCrtLRI87pPMHg2NngBuLGPAAOkbWp7
	 PfkJO/p7+mBt2LmkYEAxgYFi5BoX3rSIBBz5pD7GdgZTTxP+YQwN4DSRv4RTIQf3jmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794891263;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=Q7H2nc9bosJoZgL9qNmHTOhIFvJBNvNVcBjiUkQrllk=;
	b=4AzxuIwfAKMcYTipSEULpCSU7MvEE3kA4faEg/ynoJkh/CTNycWqOBvegByNjZV1bdvk
	 7phTJfzxxlhpG+R2dNjAJb3INBPmBnn6tP8fa+FOIDWIuNBqnOVGmlqYApUucDXLE8GVP
	 8rbKtLU4FFZATh8kjpzcTQOd1Xag9rWiL2NeBT50N+N1fci7TmNcI5RRZLSK6hEj7uObl
	 pKblup8SkJtrE87pr7pOJTk2qbjceTvv/btC+wbxc+SrPtuIS4HywPPqnr4TTLl38hhTR
	 7txSqnMUlaFMURvA3wu5glm0GH+6ovocXiuNFnCdW0Rn2yYJbqw/pYtOPocbfXwenCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="JnA1+Ve/";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=TWQrGf+u;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4904606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:54:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4904606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JnA1+Ve/;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=TWQrGf+u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794891261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q7H2nc9bosJoZgL9qNmHTOhIFvJBNvNVcBjiUkQrllk=;
	b=JnA1+Ve/I0d34dOrmhtyrObZviO8kAgbYLze+QBs41MYugotaNVnKCwWNMc/+PIH+ZWG5K
	5ctE6VPTjGllUUqJAU30rGro/kKCrvsddDyXVQcOQ9IPr37cIZx1ZsxFfVuocBSTijbxl/
	dWUSJHe7nU4Nypx+7OmgRSBS7/utWkU=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-q2qCev5gMAWTcufRDWIAhw-1; Mon, 16 Nov 2026 23:54:20 -0500
X-MC-Unique: q2qCev5gMAWTcufRDWIAhw-1
X-Mimecast-MFC-AGG-ID: q2qCev5gMAWTcufRDWIAhw_1794891259
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-3ad907ca4b3so20551101fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:54:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794891259; cv=none;
        d=google.com; s=arc-20260327;
        b=mEoVPfXYTCKUZWO/mGT7opXST/LSvhLE/wUN9Dxnh5FX/2VP1Q97wKVmiqjVRerjFP
         sHOpv96GUfobsgeg5WsRnjdlEmkNVnHUv7WzNvrq6F2mQqy2YyIfQdn+cSneNOQwuHia
         u8OOusT4KDlQ2fI79LOdWugM5UwsvPWr+ejFJOa/h/IC6WlvYfgSnbzdVGxJc1OX5zSs
         FsoE1+f+G0Ra/j1GpHKilTkPMrm9ZBCFCWZfVmn2SUSc9d9Kef02wUwTos8Djv3CnrKY
         LPi6uoyR/WHTvsVkaNtUFoXB0sYcI0lrqswhZz2zP4E73zjysOASsvtAZUj8krFveCA1
         F1ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q7H2nc9bosJoZgL9qNmHTOhIFvJBNvNVcBjiUkQrllk=;
        fh=lyQu/3J3InS8dqQ6DdwN895RwgjH/0LZVFnTEVjUVqQ=;
        b=jDGIEH8jsikH+aF2GEaDRAXlAgcPxArtE7TVvvgpfO23vLS3kN2fcTOY0fw0kecWK4
         OYza+nr+RaqR2dgFK4AggzXJSLPPvOFYdwQ98BfOvzSi88VlP8vuYF4ptGFZRod0y0g7
         kbUwFUGXUJemF8cSXvFEpjtpISbD2t+uff/TxKXcjW2nahJ0u1G4Bf9KRLXY3PTHwvH5
         hC7WfTunu8CPh3UHgmEzzhg7E2+6ItzjhIciq/Dgc3+RE95A6QkXe1+IHlkWzlqNDKUH
         kYJbzbFYNYlnu1oXXa8stn5BdnDh9plzQ0rtJbcXu088TKXgBVlklCUGsF4PTKlxeLcR
         vX1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794891259; x=1795496059; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q7H2nc9bosJoZgL9qNmHTOhIFvJBNvNVcBjiUkQrllk=;
        b=TWQrGf+uw77ERx8o5aTVlknNoHPWQcBmMxnagdbbTFiXwXt0p2UpdP/6pF94B57mz8
         hxdljtnp8TUKJBYj1cEAJL0lJmOpIzjlBS8GuzQMmLjbZIW13adyo3/VzW0+u7cW6joB
         HQx9PWS7sPAF0DTmMS7J00TRae1RSEh3A7L/nOBiBCVfL89JsCacoiTs29Vs+D4I9vly
         cjnFhojLM/eRwMiiSqOMV5jGmaIhMdNBRvTTawC+/H39MMJDl5GcxuQk5DcrOVAvs+0Y
         zF6dw8d/92CsF9w0I9VLKPu1mfwi81te8W/D+JyByduaRax7omBkfX4PZRlZfcFW0hml
         +fqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794891259; x=1795496059;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q7H2nc9bosJoZgL9qNmHTOhIFvJBNvNVcBjiUkQrllk=;
        b=kZa/u18xWBgGmyCfTroeGYr1G667X9t4zRkEs0NbuQOuJE0Ic2LMSHML12Dmq9x2oc
         xrEelcOS74J0SVjIjrRW8zq3+GdR/YjL5nw2RRTagnYZikFAosp+SCw+nqYqLH7/srlt
         NAXzOYtv00oO4Rqlsvy43j5+ohWM3AXHlzA/yXwybwqLJiraGJohJmR9fpqomiI4v3dZ
         qtvt4JBEzhtYN1LwIM+x9PSobb/3E14DEJdi2fNlXjYvX6oMh5LZDL8kt8uSgSBQSxhI
         +c2jem4NtihfWmgz1X/Vbrp5Hqt5yySuY8D2sYWPEpfWkdz8fFkGkZ0adAzAye4OKn6+
         COMw==
X-Forwarded-Encrypted: i=1; AL+hErGayxQIwozoaexDNBlAxNT79zeIbktVW0X1qy9cNL/uQbELONY/b8TrpAnpwpohWbqgoyzepWQxZjfo44w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Z+sZVZeTHGoLC5DjFjBr8Jfw9xnIGPc1PBu27vl5iE3R0HWtB
	bJx7Xno45QNjh4wX6diNR8Jd/HYTKnNnfZO+Znb396UKyvFMp+ZSXglPbsAAbFDpuT/2OOjHUfG
	tncHS6GGLc8/9b7kdciLnjeku6ZxzlYKa/c7PfF665zV4uxbtYoYuDVI5W8ZMmbJHQCxftgnTML
	MYqP4zGbNu5+ut43LEvMwQoeNOGWXHG15PdVh3dkg=
X-Gm-Gg: AYBFou2QaBQurc1njM7m2frXfAXVjEMtHNC1wMVwoLQau27z4M8U7oGYhjrpqbC0Iqz
	V4tiNb+Wg5dAfRDr7zrA+7h8yqynLMhdtiSxLeN2ipMxR/GXAPl67lDMMfidyhqHLoeLN1R5Ovf
	qFJE2h6Kw7t3MNB1VMNOuqbC7b1zAgOcROHc/t14hsC/KOBY54+vL9fszhA0DGIVoR/JDuaQiHC
	kniX6PYiQukmB9JV91s5R9nXxOsWe1dRdIxhETwOJDzu6mR3jvqZ/vyXQCpRN4bcIFDzgafaJo=
X-Received: by 2002:a05:651c:987:b0:3ae:25db:8a10 with SMTP id 38308e7fff4ca-3ae2b50dc54mr38699691fa.18.1794891258864;
        Mon, 16 Nov 2026 20:54:18 -0800 (PST)
X-Received: by 2002:a05:651c:987:b0:3ae:25db:8a10 with SMTP id
 38308e7fff4ca-3ae2b50dc54mr38699631fa.18.1794891258476; Mon, 16 Nov 2026
 20:54:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CALKjhPewyFB0=2tfyNVuDPosTAisDD2YcejTpX+0iiKRXdsGaw@mail.gmail.com>
 <f9266fcb-d030-dd16-e16f-0569b93bf4b6@redhat.com>
In-Reply-To: <f9266fcb-d030-dd16-e16f-0569b93bf4b6@redhat.com>
From: Ming Hung Tsai <mtsai@redhat.com>
Date: Tue, 17 Nov 2026 12:54:06 +0800
X-Gm-Features: AclHuK_jpXwqt8GjPaIqf_AW3r_cm6NLbWKbBwBxrR01hq8PTlb885wJw1OdM4g
Message-ID: <CALjSBEsCVz5h55GtN_s5cf96qT6T8RqYiL6A4och+SHJOeiaSQ@mail.gmail.com>
Subject: Re: [PATCH] dm btree: Remove redundant index condition
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: Donut Oreo Computer I <donut.oreo.computer@gmail.com>, dm-devel@lists.linux.dev, 
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
	Benjamin Marzinski <bmarzins@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 4:07=E2=80=AFAM Mikulas Patocka <mpatocka@redhat.co=
m> wrote:
>
>
>
> On Fri, 6 Nov 2026, Donut Oreo Computer I wrote:
>
> > The index is unsigned, so checking whether i is non-negative is
> > unnecessary.
>
> Really?
>
> In the caller, there is
>
> "unsigned int level, index =3D -1, last_level =3D info->levels - 1;"
>
> In btree_insert_raw, there is "int r, i =3D *index, top =3D 1;"
>
> If you cast -1 to unsigned int and then cast it back to int, you get -1.
>
> So, it doesn't seem like an obvious dead code to me.
>
> Mikulas
>
> > Signed-off-by: Donut Oreo Computer <donut.oreo.computer@gmail.com>
> > ---
> >  drivers/md/persistent-data/dm-btree.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/md/persistent-data/dm-btree.c
> > b/drivers/md/persistent-data/dm-btree.c
> > index dd02eee4a23c..b7ac2f6d1d71 100644
> > --- a/drivers/md/persistent-data/dm-btree.c
> > +++ b/drivers/md/persistent-data/dm-btree.c
> > @@ -1108,7 +1108,7 @@ static int btree_insert_raw(struct shadow_spine
> > *s, dm_block_t root,
> >                  * see a way to do this automatically as part of the sp=
ine
> >                  * op.
> >                  */
> > -               if (shadow_has_parent(s) && i >=3D 0) { /* FIXME: secon=
d
> > clause unness. */
> > +               if (shadow_has_parent(s)) {
> >                         __le64 location =3D
> > cpu_to_le64(dm_block_location(shadow_current(s)));
> >
> >                         __dm_bless_for_disk(&location);
> > --
> > 2.56.0
> >
>

The commit message is not accurate. It's not that "the variable i is
always greater than zero", it's "the variable i cannot be negative if
shadow_has_parent() returns true". The reason is how the variable i
relates to the shadow spine. 'i' is the slot in the parent node that
points to the current node. It is initialized to -1 only on the first
btree_insert_raw() call, when the shadow_spine is empty and
shadow_has_parent() returns false (because the top-level root doesn't
have a parent). After shadowing the second node along the path and
shadow_has_parent(s) returns true, the variable i must be
non-negative.

For multi-level btrees, the index passed to remove_raw() means the
slot of the previous level's leaf, hence 'i' is always >=3D 0 on subtree
roots.

With the invariant "index =3D=3D -1 only when the shadow_spine is empty",
it should be safe to remove the i >=3D 0 check. remove_raw() and
remove_nearest() in dm-btree-remove.c alrealy rely on the same rule,
without the extra check.

__btree_get_overwrite_leaf() has the same redundant check. I'll handle
it in a separate patch after testing.


Hank

