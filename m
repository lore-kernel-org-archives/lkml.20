Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C3330568F
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790267007; cv=pass; b=ZIyCpXxJ8OKK6ISh7A5S3YlRJ2dfdddNIEAWe9MTg1AzhYZYOUTUAIh2h4kZPH2MwPnBZw3CLd3wBBbrljN3Xhk2gNZchOaOQt4Co/IYtGEmj+mkSLT+LMFvoZXp4v00G9ZA8Mgwr2pJ4AZmr1Nj/JiA2ZDvJ7F4vKTj21Wgr6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790267007; c=relaxed/simple;
	bh=6LYnEnDjDCPLg9ek+kfbdZFOATFZrCp/gleIZE32Nis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iYuRzNCAY9RaT8q29LhmTrYAImtHpBnEtwpZa+VAXoVhdhuPlAgbk10kLjvnacMz+kpt6+A1zK5ZUHV8JJdDcRsoS08Q6uAdVUtDPKfuFmmOHS9vwu/rBpq4Fd3snR8xg8M01NQ7iFlRj/tEgIBf6wF3Hh8hX/qGz46Lr39r8qI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=cTz5jQ8i; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="cTz5jQ8i"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85f0fc1fd8eso54964b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:23:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790267006; cv=none;
        d=google.com; s=arc-20260327;
        b=d5r7La9mrlsr2xflB7zmPBfuQa0P8sNcGfibvjKwqTZivbDTy5flo663PcaFw/WjYX
         G7PfdAqkh9KiEnPYnI0z6VSs8j+Bup+xWRzuqS2vWW8reZcGbKt3ure3ViREyB1jpBxb
         +5ovlcVZHGDWn/BHIyTfb5M7H/z3n5jYe1btW/C4N//bJxDq6tSl/IJ5/MvW3dhepRaH
         rvlb9By5DbII0y785JMcGanCELsaCCm/NKP8IFhwoWJQQcMGgGCXsVc0Evhm7HvxGBCO
         Jr17LgxA64A/+NlF2NfgptXY1E262FAYojHXGEim2qaUfN/ODvljtbXIgV6/Spv0JR9p
         IqbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PPib6yxoB1FRZrRWxa+lTjPODBOKUXazi7+OtJhcpow=;
        fh=xwDMtypnVJXxCAspdNcbp9ek3HrlndfYFY4zakgfA70=;
        b=g+fZz4XiZuZrARtGPA2K6ybpUea82CVHVnYdi9IplZjZ6fFpjP1Cf1CGlPmUXySyKN
         vsX7JLFL3pCsxKXr6rLGxVZE2GwGbvvavd/gEoiOeOrj0tjrbjUrY8gM817JmvuJJa/b
         qQTjwVegZWN53U0/6mvvHZ+dal1pXsg1nwyeOcDtxmpcHyPGublQcQX9EF/wm/5CPwG0
         tG7YSM86xmfsAJ3+MMAS1iOyVbP9IzKBFDXifiuq4fZ4uGhTdDHOZb6RSyw7woToj0Pb
         lu8ZTeSYhzb5bH1lzDhIz/eZLkUBwf27SoA37uiWkhEIBUJkUTUd7Azxl+JfGoOZ70jb
         ls6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1790267006; x=1790871806; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PPib6yxoB1FRZrRWxa+lTjPODBOKUXazi7+OtJhcpow=;
        b=cTz5jQ8iQ8Z9m+yXT+w/DVEkFGVLoFOwj/jk81451eLJn0jC7GwZZbvS5wmuVRufQj
         dHoFR63IaxWdYn5AJ0o5etk08HxBSFwhE1A7n2a/X+bB20HE5ewODe0OVYs0mFIFCllN
         L3D8NFr7b+B2YUUnS7uuMgwQZSpW8VeNdYFUAptQqMlZHDRPp+0RZKANON0ZQnMklqEV
         lkGGopNJFt9uhiNSDahESzw/5u53RzQQg5s+Je6/fRuf92h2aW+WYLLHBq5cb4wAGJV7
         C02xfMr45vFDqWJBAqwEI0GejAxWvAKuWYiRSYPHtv9Lk4TMCuO/sDeAIC/Ii17rS8Er
         tPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790267006; x=1790871806;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PPib6yxoB1FRZrRWxa+lTjPODBOKUXazi7+OtJhcpow=;
        b=l+UeIMMCa2/uiyb+1lNXbDn1jSeDntJC4QGmTtgq1ZeLYTeIpCqzd7w73BoX3PR9pV
         ll0wQbF5zGXGqlYWfG8QtlvpVhW7bWqa6PrdoZL5cKoam3I/GvVl1Plnv4adZWGDC9At
         HuA5MpmO8eQThd+woZ1fMwgJZIBc5BnLsa5tNMlWg1OWVzeEYBkJd2FgEM8ZO8yoTV2Z
         akN2SehP9aR+o6XRPx0SKanTDE3FDLcRMLCLE9why3sXCF09IBFPOzcRCysDvG64VeRu
         NVRMwS3kC0gPnpI7bCyVBbdPd5QMgvHf24fncRnx3GRamlhUgl0SYGUd1dNYbcCnPdDc
         HOsg==
X-Forwarded-Encrypted: i=1; AKwUvBwW5uiUoVZtK093xQGNVEf9yIgx3DJxTDj1ULfuHzXqlWWW2rivx350rJB2yKIqtIwMPcqH3Yv0A89OLDs=@vger.kernel.org
X-Gm-Message-State: AFuF++l+dpGTEARP8c9MBZprUsDX9SuJzqfCUogjVDBi8jr8/ugnl8w2
	Xj8wWiV3rroMqmINsnb1xD9koSkLRjP0SdPU8u6w+FVNfAlPuT2fIo2pnkiX87Zt3K9lt61d7Jg
	teEd3e5GAR/8o2LTQREIxiicIl5cMPEbEYO2qUXBp
X-Gm-Gg: AYBFou0Dx+opLC9Ss7nYfXIsGI9aVktryBHkVjHW0nDGPJIQh17gtUrYMZgwa9LGc7r
	WZmIUsigli/cjtHZizHr9pN8f18+R0cTExzZaUKqZcdR2j4dURYuEywIWDE74P17MVDmV9HxQkV
	x7d7FyShMZ73tYz/10JxQ3quDxGeZaeE19wQ77JSiC+vve9NBCmVUMSainLxbYdHHqrgu+hg5kF
	6oyW4eAwZWeV4cYDPb0PfyRRW+IUrvNYFAnHrW+9AC1LSyDIfZuxGp12Drhf8jhZk9ZJrST2JO6
	CP3gFLCJDfBlOC8hKfxL4UNAcrO/lKmav+dFgMwO2cFPhP8EClWPMzuCSlH8LMCVfAbfqFiPT+5
	189CQ5KC7AKwfYG/t8yCnfw==
X-Received: by 2002:a05:6a00:bb91:b0:878:3773:81fb with SMTP id
 d2e1a72fcca58-87e9cd0e721mr2840299b3a.55.1790267005739; Thu, 24 Sep 2026
 09:23:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915150739.284189-1-daniel@iogearbox.net> <20260915150739.284189-5-daniel@iogearbox.net>
 <CAHC9VhR2Zp9LzDRwDOZoesOC7o8hretfgRH-PRqQRXA0EES2vA@mail.gmail.com>
 <CAEXv5_g1XQAwsydnbu9SUvxNBdYQf+xXjPaZMeC8hxgfThP+pw@mail.gmail.com> <arVKSpezisxe3pkr@suesslenovo>
In-Reply-To: <arVKSpezisxe3pkr@suesslenovo>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 24 Sep 2026 12:23:13 -0400
X-Gm-Features: AclHuK_6WIHuuAde2rO_dJRZdDgeEWTftPypXMJBnjHVfzkE8DO4K6tdHmMf_Bs
Message-ID: <CAHC9VhSwbHF8tZkZ00JM40VTBeXVgcVdoBt7NcX0XKaKSARWug@mail.gmail.com>
Subject: Re: [PATCH bpf-next 4/8] bpf, lsm: Let BPF LSM provide xattrs at
 inode creation
To: Justin Suess <utilityemal77@gmail.com>
Cc: David Windsor <dwindsor@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	alexei.starovoitov@gmail.com, brauner@kernel.org, john.fastabend@gmail.com, 
	memxor@gmail.com, kpsingh@kernel.org, matt@bobrowski.net, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 12:15=E2=80=AFPM Justin Suess <utilityemal77@gmail.=
com> wrote:
> On Wed, Sep 23, 2026 at 03:14:28PM -0400, David Windsor wrote:
> > On Wed, Sep 23, 2026 at 12:57=E2=80=AFPM Paul Moore <paul@paul-moore.co=
m> wrote:
> > > @David, simply for my own understanding, did you ask Daniel to do
> > > this, or was Daniel operating on his own with this patchset?
> > >
> >
> > Daniel and I work together and both have things written on top of this
> > kfunc. He reached out to collaborate, I agreed. We're also going to
> > send bpf_set_file_xattr shortly.
> >
> > This implementation was chosen due to its immediate mergeability (it
> > only touches security/bpf), but was actually suggested by Kumar in v1
> > or so of my original series.
> >
> > That said, sorry for any confusion about this appearing as a new
> > series rather than as v7 of my previous one.
>
> Howdy all,
>
> Hope you all are doing well and having a good Thursday.
>
> These patches are excellent and useful, and have been in the pipeline
> for a while.
>
> In the interest of moving forward:
>
> Would you both be able to live with the following: provide a security hoo=
k
> for lsm_get_xattr_slot or another proper interface with the necessary
> abstraction, and keep the kfunc where it is in fs/?

That still doesn't change the fundamentals around the kfunc: it is
really only a valid to call it from within the LSM inode_init_security
callback, it populates a LSM framework managed buffer, and that buffer
is then used to by the LSM framework code in
security_inode_init_security() to do the xattr initialization using
the values from the BPF LSM as well as all of the other configured
LSMs.  It's very hard to see this as anything other than an LSM kfunc.
I worked with David over several revisions of his patchset to review
the code and get it in a good place, I'm supportive of the basic
ideas, but this really needs to be located in
security/bpf_lsm_kfuncs.c as it is an LSM kfunc.  As we've seen there
is precedence for subsystem specific kfuncs located in the associated
subsystem's directory, things should be no different here.

--=20
paul-moore.com
