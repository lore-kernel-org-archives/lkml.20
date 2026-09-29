Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E964E77F3
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688930; cv=pass; b=aXm/Nu2lgvD3BQQqoluChwqurA5r3IPDp3uiCZa2NJKkdUhiPS+R4kgQzug1I4o8PZ9eFAobjIKt8wDIM2CE8M9GZGZVGKqtU9MPSYrZ+T2ur5+uONL1hHdITP7TEpnFLgpIayGgQwuZORtQOG5WtyzZbjfVP2shHkC66sMvjNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688930; c=relaxed/simple;
	bh=Pr5ObivNdgC6TpXZVCnYFfdYZPpZOxjA6yMjAIcM9dc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jTB2Xm/onPhClFiKK9wfIn2c3h3rg/ygA1liWNFen06fd2o7q1+WowVAHQrIbfT/eBXsxjDIXkg4FFjx8affkzYTO7vPUsvuBaT6QH4g5b/0DivI9Z77RXhE22/mPrZqQ9ZPg8UGmPkqD8PfMZB8bQ5dw8K/zvyoyB9oeBr7z/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EvEmHdbc; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EvEmHdbc"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ffe817151so16560325e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:35:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790688927; cv=none;
        d=google.com; s=arc-20260327;
        b=V7O9e0rUVIknFFtzUjiyQn2xOhTQr/2m3uNV8x1jwUc64GrjqZRQR9EELKF7fEXoIT
         HGUaOJG8iAWrMAGJcJN9KohDO6dX50i0ruaXjOU031JhpHIyJNCEzNVbqqUjmhaKU646
         ITz/IwLWF0DjhQI/QXlZtgRt47MftOC1xPe2f0IUIsrc8A8bkLpULexyqABvxE4l9zig
         rnQMcwAVfTxgGkgHypMtYg9Dn9fDd+nVPzAk+mh/oBoU7DTnnJOOSVGj5qB8z7sef4WZ
         VdB7/clCDIFeVnHpXNLTdLhVkT58v2hObBSnzPUDYkEumSeDkbXKdSRfnLBxCWsjesuh
         Apiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KO35IpzQU2wUiVLnR02rlEk4h+IQIikt7twWTAwFAKQ=;
        fh=TLiYoGCEF4+2vca/rogpBwt1vxchsCwORUWgSs8urLY=;
        b=DOA6obQ+uyfwFXmsYFo+SCDZCjDWU6fAlvknO1WFcrqKuEIJbC6+prjNt5MJfglJ6F
         JqzbSHCm9phY0J/Gf9lZXNA8NDUkQ853RdHwCtKAgUBBmdYqdDp7XfNIdjeecn7m69W1
         35kd8b25URMK07a8RoBRuvmRQRg1lxJYnyISPf/JRq9wWWcUNzpmJpQkTdHNEW+z5zoz
         BKbcAJC5QhcchYlrqF/3lpNh8UbAKuwWvw7aiqP7iqmjfDxghMXCn53fpOHaFzEgZsj1
         zMMgNQq92bDlKLNdJpJzvbf1TQqhdWtBHhq3litlUUJA9szsSc3sU7xbQR1Mf044k0hV
         MetA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790688927; x=1791293727; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KO35IpzQU2wUiVLnR02rlEk4h+IQIikt7twWTAwFAKQ=;
        b=EvEmHdbcZDRHlEJ1LoV5GlDXcMmhPdyd0VSyzRrMHlI6gmcvwvnLcqcWWim2wZkPMQ
         6ZMcYREQOZR8VX+PYbb4a0Fj1+5fZVGQM6Aid1DH80mbLCbc1jWrRNSN3Ac3L/3Q7BQn
         uSlp02A8tYtW0MVceWT5UhlV0VVRb1gNZLVVzTG21ibrkkNdLa0DKYm1xCD58HVsaiMh
         46YsaIkQS0T8gWe0XcIqrczCr2fQywNarlVffqqhl7DAEF/LeFZ2TNpWdlmcvBMG94Qc
         RqBzigkbtX6H2f7/Pu6jZejNTf/xb2ZGe+8t7WQyLVQ7BbwLozY3ma964vcsmQH21Sm3
         wNBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790688927; x=1791293727;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KO35IpzQU2wUiVLnR02rlEk4h+IQIikt7twWTAwFAKQ=;
        b=0VRSBsT7PgHNiTxnAb1I8eEq7zohEzhL6XoAMb5kXDXV7p08/QTW3DL8e8/r4AleVT
         aHuFuYDE597t0LrxHhuvEmVjOgF0Zoz3oQ5WA2Xdu3hpGsr2S9eoql2Qf4zZj3G1ngiN
         wpyQ8nzHsaiOeUMiXOcsLCJlxEtSwbebnlN5IRPc7HjUtKI/AAGI09ED8z54Bjd2lKW0
         g7aO5cNUe0YjU3lLebnIUskf3D3cbFqC3myUOC68kY20/S0Umh6xTRpaxC+IfQMQYcxv
         d657XT5UEOLmn+1pRFa3pN3U6yagValkMimgN/VDeLR5BWEVAR/KXL3DsOWXVroz/SJf
         Pz5g==
X-Forwarded-Encrypted: i=1; AKwUvBwYuVLK8YniVeOIogUQmMAYdXLcqJWTujm1PD3rTfkgHA4vVqCEDmo/+1k5UbJvrbQgPoWFTlGHBsfqSRY=@vger.kernel.org
X-Gm-Message-State: AFuF++nMP1ArEdP0pVe6/XAuZWmbx0Po7cRZq7MZ4Xabek/S08RuBdnI
	+N/YL+N+qYpWT1TVU+T81iMh4JBJ4RWJ2GI5aftziM28ulYi16UMT+ZcPacl2DO/7Q1nYhzYckw
	4pQ/8+1fdkE30kLib8stQ3T9HLy1cGF9HbAvFiGzi
X-Gm-Gg: AYBFou1BA8q6RoicL/C+pzUJD+odwvo5ne3bT90OmOZ1FJ5kdxYJ0L1R0OzRkUnpMTJ
	M1aqgDnATMYlBOja57yMlxlkLsKClRAjuc1G0BLWAm5U4BL3WgKKzBWQ2+uEcnTy4vv52gXkAbt
	obrIYFeHY8mcIgmakIVdouaVRHwqgMztf1bhxKuQs8SoAPSrXJjWioOh2Dzi0q5ZIe42QLVflX2
	+MKszndTcID3pocBxop0grZgcjWgH153OCXklqPze9UaTGM0JFAOZmEkAm4tvbfzeONDuB6HfAW
	NqngO0J9P5xUmq64WeZ2WGtSh1D6Re6HY/uHqIDNddp1uOEu46b14sIy3KPtHQklluOydvb3iTB
	a5VPByi3hD7WWNI7uvPWT5Er4qWnBPXpnCdbjRNSS7+pph5qfFFqj
X-Received: by 2002:a05:600c:4e08:b0:49e:817a:ca7 with SMTP id
 5b1f17b1804b1-49fe66d05cbmr252109515e9.8.1790688926718; Tue, 29 Sep 2026
 06:35:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923022339.3340694-1-georgeandrout13@gmail.com>
 <arThye_219ruNbM2@google.com> <20260925-stellen-brummen-festrede-266af0305ac7@brauner>
 <20260929044843.GA3909609@ZenIV> <art7swUNAa3AyUrL@google.com> <20260929132839.GA989762@ZenIV>
In-Reply-To: <20260929132839.GA989762@ZenIV>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 29 Sep 2026 15:35:13 +0200
X-Gm-Features: AclHuK8Z-kW-zwNhccfDW8-lP45SgDWDrvmNfYKPjY5D3ROZthqWW7EWiceXvYE
Message-ID: <CAH5fLgis-9ibYAEK-shQtwg_08Le-JDYChS77LugEhgZ=T+z8Q@mail.gmail.com>
Subject: Re: [PATCH v2] rust: file: handle fd table teardown in file
 descriptor APIs
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>, 
	Georgios Androutsopoulos <georgeandrout13@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Jan Kara <jack@suse.cz>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-fsdevel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 3:28=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk> w=
rote:
>
> On Tue, Sep 29, 2026 at 08:49:55AM +0000, Alice Ryhl wrote:
>
> > So, I previously wrote some code that could invoke filp_close() to clos=
e
> > a given fd ... from a workqueue. This was in the scenario where the
> > process dies and the usual cleanup function gets called deferred from a
> > workqueue instead of from the ioctl like usual.
>
> Huh?
>
> 1) filp_close(file, NULL) doesn't do _anything_ to any descriptor tables;
> the only requirements are that it should happen in _some_ thread context
> (workqueue is fine) and that caller should not be holding any locks that
> might be taken by ->flush() of the file in question (for a workqueue
> callback it's fine as long as the callback itself is not holding any
> of those).
>
> 2) any caller of filp_close(file, files_struct) must obviously guarantee
> that files_struct won't be freed under it; passing current->files from
> workqueue is safe in that respect, but obviously bogus.  Note that
> descriptor table in question will *still* not be accessed; it serves
> only as an opaque tag that identifies POSIX locks (and dnotify_struct
> instances) related to the descriptor table in question.  IF you have
> just manually removed the file in question from descriptor table
> (file_close_fd()), you must call filp_close() passing it the same
> descriptor table while that descriptor table is still guaranteed to
> be alive.
>
> Rationale is memory safety, actually - for POSIX locks descriptor table
> serves as lock owner; the reference is opaque, but we don't want to have
> it outlive freeing and reuse of the object it's pointing to.  So anything
> that removes some file reference from a descriptor table is responsible
> for corresponding filp_close() call done *before* the descriptor table
> is gone.
>
> Note that we only need to take care of the reference we remove from
> descriptor table; files_struct destructor will call filp_close() for
> anything still referenced from it.
>
> Places where file reference is removed from the table:
>         * do_close_on_exec(); filp_close() called in the same loop as
> clearing the descriptor table slot.
>         * do_dup2() in case the new slot had already been in use;
> filp_close() called just before return.
>         * file_close_fd_locked() callers. Three of those call filp_close(=
)
> as soon as they drop ->files_lock (close_fd(), __range_close() and
> io_uring io_close()).  Remaining caller (close_fd_locked()) leaves that t=
o
> _its_ callers (binder_deferred_fd_close() and its equivalent Rust-side).
>
> Again, normally both removal from descriptor table and filp_close() are
> done by the same primitive...
>
> > In this case the correct behavior was just to do nothing.
>
> ... leaking an opened file?  IDGI...
>
> > It was a very easy mistake to make, and if such mistakes lead to null
> > ptr derefs or worse, then I think it's worth doing something to reduce
> > the bad consequences from this kind of mistake.

Sorry I mixed it up ... the code called file_close_fd() and then
filp_close() with current->files. The important call here is the
file_close_fd() one, not the filp_close() one.

Alice
