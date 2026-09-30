Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44C23624DB
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766124; cv=pass; b=dlj5gYKu2ZXV+Qac30kaw8VMC+HSYTsIB6Wb4xEjV51FhbOQ+Pq3tsrfe7++g13Hhcet9GoslfDN7BqHIY79aAsyt+G70eE4wwYn2cxvxkT2AArXe9/BP26lN7vgoMSYcofcN87d04CWyhqwdaDDj+ogacglkPz0D5tI4WKtK2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766124; c=relaxed/simple;
	bh=Wn3tCGPYKvL/ZOB5BVe+yvOS9MKXjB6jsJiC136C6AM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iE52G9JPEfQMqD0IGnpprvSBuCAAP2oRVlHJ+NvowW6QSm3CGLe8ASqmMEqoWmFPoTOG1VQfKItfV5rwwpZuH1PT7BGMbmRuaPz9TF/Q1ydtkT9JV9f3c9c89XdWxVhoewi6wY9YnNnFJDP8hA+QRIGhbnhNjtuhr3lrewZQ6pY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=atyNziQZ; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="atyNziQZ"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d8fd7a3f38so27445ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:01:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790766116; cv=none;
        d=google.com; s=arc-20260327;
        b=GCj1j3yUEYrfwYff2XlyB5/4EqDuuEAQQXaG5j2LTNT1S0Psy6gUxTZhs8ah3nmNMO
         34cMQdP3UIhbxND3EVNeO1Fi7Ri68WymsqEk38TlXgla0KYu0ZOkV1Dk7UBxn8wVP4Gv
         1SxBenvTZXlmGUDWmp7i+deHTctt0zXRf7CI5KSAldWRGcARhJpVJcYLiDrsXHA1GLQz
         BJ2idAmNG97wzRx3q/UGh+WY/5fAw69VwDTUNbEZ6GmSxXfvpZnh3JeCnRKlbdRlv/fn
         zFB9NNSUZhkkTbDC8V4AJjtUSSredIOr7mu62VCO+bK2qjIwS8ax9M9ITxmcUNdAezmy
         dC7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZQ6Sc+nIdBskUWJpt20A28izei+92PV5/80vRS67SI0=;
        fh=+JEmDMyMC8SOtzC7H5G7d7d+RjbPMM3+CAjPs4D0lF8=;
        b=r7jRMydcT/6CoS2nowTnzNwPFSZ2SmAQnCDsC0DVywic2BC0s3HmwEeIVO6kRPgwAo
         9iOr1oK18y4VpEvbatLgw7TL1VCehL5TQi3qrUiRmA7eoENnzuCi+dtWVXPGp8OS67Jn
         U7SEmT7ys0fI07XUNagb1CxrcD4sKRgat7p75/0nC3yRkbDCZSYnuJyIYbYGngkLfe+O
         /prx7JAFTz9Z5UTxl+Rfx6coDTZ5UFgrrHriFZAhkWpOYpib0SdwbkXIK/WnBz1c1Ejv
         1W90gt29abwN/lQtZ6bASsNPbe4TuiNlatmqfewpHM8mbHRGUBZ4soNvw006d2YmwK2K
         didg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790766116; x=1791370916; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZQ6Sc+nIdBskUWJpt20A28izei+92PV5/80vRS67SI0=;
        b=atyNziQZEeTxEc43NMDlV9JFYHvT5bv/NfqqKty+zU1LwBClXXDeyF7OtX67+0aCu5
         dhf1CYF28/79y7Dr30cPs4IssV5pzabSZnTHhp8KMjs8ocLnrXTzYPhTXlxHXYb1/JSV
         NxMoUos8WzhQYTSuo/Z+VSW6uWzCf4APO10W//yDw7sT/xR4uCqsTFlx3de8tLdiL/mX
         6lwj7dpWYEToFDGipmCa5IPkSC7u7HbRCabCPieqKebkKDn2qXEFSn4QLygQ1CiSQ0s4
         qFgn1myRmVEBSLsUcUhRcFo2IxDjNHE2e6HpRtdV0ZMdBDOGJFLbDA4mfywzdNT80RIB
         Tpig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790766116; x=1791370916;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZQ6Sc+nIdBskUWJpt20A28izei+92PV5/80vRS67SI0=;
        b=vRpf7IeFf5uubE/dgXL+c/2Q4MFJcji25FMPGn52vqply1tnR7l4JIZK42G0sHbCif
         AdisXkMIsDeV3B3EnC2b3YZg1orVx5HlOTgv4DH8sxeog8j0DgifrQl5wrFFCqKV/bD+
         I+5KEFrcbhw+gROvYUkkcjoR20bY0Sn/nGwU/eW+fJJLJfIIvoJhbPyTdgwl9iyVrgfU
         VtCnRYTnr2wunPu1DnPDbqaFa6X/F8V8q06hGU6bYHTkxA6qRFrn/azhiZXFi883ZAUj
         2J2zfOEb+nilI0bl+BoIjfOYJY8jSaefVrUhuPKaGsCbMFaroZFxJHqTKGlcRIgmqZHJ
         R0fA==
X-Forwarded-Encrypted: i=1; AKwUvBxtgg+JD2TVpN+kHhM9qa5saPL+hcAxFRqMPNxdh5W6lbpz37fSysyu2YxqKNbWXxWIcHOgAOCEzKpIO+0=@vger.kernel.org
X-Gm-Message-State: AFq9FYInnHdZL0DyNEoFV5SLR/LLHla1mXfV3Kg14MJnFvGlz/Qk56E3
	LbQHBPpSZD9wJUF+gYTdUU3GlbCyxjCvtrziAxwv5b33fP/hj90+bORoSgRVvGg5LxJhvINYbA8
	TE2BFz31MAf7GHC8I0FTasjuVSohwNW8HjsizpFuK
X-Gm-Gg: AYBFou2SSdnm6AKMWQ8QEUCepVRHDpSaCCvJC1XmoEpGyA2X2H1rh5/bCme2hJ9hcMD
	akXTqXJKbPgqfBGuGO7zfYloHh7+ohAxAFpNc0sh888UR5Oyw62Ho5QtIwyH3Q2CCvFETTfcsRL
	/Xh+WWZjKdrydl/UJK9qMEvkwTv38gDXvgY9cKCcDOW+Mctg+iJzqLIOPKMFNm+mBH/UA+1Lcv9
	9SAcw6MKNLIZJrx3QsCsRHp8Jh/z5xvvzT7wvEf50Afed+U7/ZE0LmJRvNnnDDr/UBAXps1tdH8
	2qLYX18LRzAhaHvozvwUOJYoRyOVBB5TCM6xAREBXqggYwT6ud80BxeTimtbN33Sxy96D2XJjHi
	acK5a/53n2tc6ohxumw12pIhsxsTi9ufAR422qEaWUtzShL71YcBG
X-Received: by 2002:a17:903:2983:b0:2d3:153d:acae with SMTP id
 d9443c01a7336-2e2dc66931emr4275215ad.0.1790766115044; Wed, 30 Sep 2026
 04:01:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810-x86-kvm-setpagedirty-v1-1-85f180892d4f@google.com> <ann8aPLSgLzz_6L_@google.com>
In-Reply-To: <ann8aPLSgLzz_6L_@google.com>
From: Jann Horn <jannh@google.com>
Date: Wed, 30 Sep 2026 13:01:16 +0200
X-Gm-Features: AclHuK9FmeMYO8yhU3NfYnwkiXvx1GxFB7BRt8bYYt-pk5cFlRrTKYGllQj5ghw
Message-ID: <CAG48ez0zfaEgWoFiLyVLu_ZU8XtJoKVoyMrnxMcLX6e+3j0jgw@mail.gmail.com>
Subject: Re: [PATCH] KVM: SEV: Fix page dirtying in sev_gmem_post_populate()
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Ackerley Tng <ackerleytng@google.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 6:29=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
> On Mon, Aug 10, 2026, Jann Horn wrote:
> > set_page_dirty() requires that the caller holds some kind of lock to
> > ensure that the page's mapping does not concurrently go away.
> > That is not the case for a random page we got from get_user_pages_fast(=
),
> > so use set_page_dirty_lock().
>
> FWIW, I verified that __kvm_gmem_populate() unlocks the destination folio=
 before
> post_populate(), so we shouldn't run into deadlock when in-place conversi=
on comes
> along and userspace does something odd.
>
> > Fixes: 97cd21d57e9b ("KVM: SEV: Mark source page dirty when writing bac=
k CPUID data on failure")
> > Signed-off-by: Jann Horn <jannh@google.com>
> > ---
> > Note that I have only convinced myself that this is a UAF bug by readin=
g
> > the source code, and I have only compile-tested this patch; I do not
> > have SEV-SNP hardware to actually test this.
> >
> > This bug was introduced in v7.2-rc1, so if we can get the fix in before
> > the 7.2 release, this won't require a stable backport.
>
> Ya, that would be lovely.  Paolo?

Ping?
I still don't see this in mainline or in next.
