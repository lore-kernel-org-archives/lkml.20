Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793474373;
	b=Bz5s1JAHMzPpHG+toveeror8a9v8pBNZ6ApTUQ4fzSEDUvjvgdzKc8goup6lhrqOTnHA
	 epnMj8JdneahjX+IDuB7FW/X9MF/pLn0Ana5SOObqmJHwcYu/RpnJ34jdIW9JsmJIcg5A
	 jXF9qJDze+8XKEhQZz4EWgPF1Wa+WOftZ+J4TILZfSAJKisDmvi53zmlX80V4IGS25qNk
	 CuKCdYBwkt2HuziOgOumy2j0YzisOr27y+zLRLU8dmSc8oEPjtkHqkadb5DieEzp7mLyY
	 xQete5aYJiT/G3WPgz1B7Mrs8qo1VbyOkeUBvrrvvAzLplfYMH3+KFcQYzqok4Z2oSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793474373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=vO3HThbkCXfsYRdOOJuHx02vFiRb8+0/6uSuLI3orr4=;
	b=2Ax9CELYrdAPbomFQVZORmMslmitG20jg2vVre1Trf4b58JjP53fMizvhhfPp/hc+z1V
	 38lxW6QuaOxXVjK8JayPW/1y5q3gwsPu7PnL0l2rayG6elCReY8c2nVeYO+tMJ2MMD6to
	 OaK2tRg+FoTjlFk1tzqni7m7dbJ4cuajO/mQVMbl2Fgodr8lmcWrhhnZUgnMCxYLQYeld
	 DuSH6mb2OrfhjT03ykG2DkQkmU6w3iINyAMczIT4XqCv2qoYWIhEpDCZLIJXzbJ8rSgeZ
	 hqrxE1u1lr0Vr/4DPhJK8yKE+5uzR6FOOvt+HYIZKajzpya5AMUD0MBq3BR7sgLuapQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=JEQcpO1l;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEC8606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 19:19:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EEC8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=JEQcpO1l
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c34bff61551so317064866b.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 12:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793474370; x=1794079170; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vO3HThbkCXfsYRdOOJuHx02vFiRb8+0/6uSuLI3orr4=;
        b=JEQcpO1lsoVhh55et0PGNoSMZf/DIFfc9jgerfcIb0ckUPc2VwG5P1OEW1wjywWiZ+
         UtCKXlGc1Pmp3vNKq9bT+DG/pUjBmsIrQOrBv/o1SpTxcIuz6whZKKiIpZIoL1jh8t4u
         fa4IUH3BhZ25ftFvY5OBvb+qlJd602ClOOTpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793474370; x=1794079170;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vO3HThbkCXfsYRdOOJuHx02vFiRb8+0/6uSuLI3orr4=;
        b=UwxUI1LfSIGVjd4kOAHzAZ5CuVWLfY3UOqaOyF/MdZJjFBTvzhavQg4q9Nbwo7FyDS
         AfAzhAhoCROSDs4qlo3sMi6kizz38X4JXqpXemHwyshwcrxIRRy3X/sxHe8WYmtmTCA4
         nvxS/TftPyb+woO8EEOtAWBpF3lWVckzaM74nCsTBZVribz+2uLsU5LLGBeEYVlsKdzL
         aOrG0+E6Nz6kyN/3zimcZcpYx5H5WR8qL93GeyYFrCtTyxM0Y7jV+O4A0iT32gFCigni
         4BLZQnuogqi6Ql9XBvcbcbmsqH648X1pjim0Tvt1J/b8kXAz2swZm/ZringgEhRz3vvY
         0O8g==
X-Forwarded-Encrypted: i=1; AKwUvBxJiG5d+/idVybe7r5UQxX46Igxen9XDb5wEkM8gsVJtBAuth7r6h0IuCFfY8Lmc2UBU+sLKLLhuohZb/w=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4p7iDtlwpxRJIzweAJEyrLXopHCeylCw3R4yQIfTRbty9Qz1c
	bcfVb/7LgwgTQ3I7qIeauoYF3P1qvwmOs/6fd2laqJDYVR59SAVqhSlS0p+8qdiwuCLAoaBFvfp
	Iyad8j8o=
X-Gm-Gg: AYBFou3X1hBlZ9F25T0Dkf1ydh/gvvYUOukHjkHqgiVbDypTlPSp+EI979IvSjcKP3n
	tIYvVcSZnBJ9o5iTwt0MbsmeNK7zGQGKR5usZiueqmyH270tPt09Rua6bchhHG7XZnydUDppg1D
	HyRIhIKAud6XWzINL1Md34xPaj4XjxJKMMM1ZCUnOkMVqTrccE8EVAcIIj89pUwVKg4q5nsNQ3Q
	n6IS5F1K4r3nwRCp4OLnwfas8GAcCxysoBCnU71MtLiaTzNRdFqii2j66eOhFdEmWaxla/siO3T
	Cc4bfRx1yfJgpn7bycdJz0EPYWptHf/ajznE3rby+SX5XyNqiAdJre6qyssjJc251pRDb8ZTXK4
	dHwTu+jsrzVW6lD9N0VWCNm6+Ib13gR7w1Qyt3qIyp/6vi0g8DRA9zH9Pf5NfAjzDvNqPi3sggV
	N7N/MxAl2oyhwZiah+x+syleM/U1XnroJM/8B+K9XWPuu/rqj6QiL4p20+0QMQm5NqjSd3tqfZj
	F2lskA8dS0Oe7V87qJaFIYO0m6VvV1j0534yX1cLOvKJgYDHgNieFsy0RiUmtjU7jvxqxwgm2Wp
	ssEvClmH9vusem9W0IRT9xc1/A6QqOORXaX4m5Ibf8g+42AlkJETQzfFc3R+Vz+z91rABb7U+TJ
	CC+FzT6D8PZw2j2e7+qa2MwWf
X-Received: by 2002:a17:907:3e1e:b0:c48:a838:c188 with SMTP id a640c23a62f3a-c4ca7a4b3b4mr547893866b.13.1793474369624;
        Sat, 31 Oct 2026 12:19:29 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cb092c042sm176817366b.82.2026.10.31.12.19.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 12:19:28 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c34bff61551so317063066b.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 12:19:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxZEQvNe1HXiN0WLb5dD97jHb5VzG3btEOS7iaIDWmL2luuNOOschoOD+rxv/rXtCvdyyQke0cxf66CnqM=@vger.kernel.org
X-Received: by 2002:a17:906:99c4:b0:c2a:34fe:ea4d with SMTP id
 a640c23a62f3a-c4ca7a72f91mr479545066b.25.1793474368439; Sat, 31 Oct 2026
 12:19:28 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031095716.3030288-1-amir73il@gmail.com>
In-Reply-To: <20261031095716.3030288-1-amir73il@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 31 Oct 2026 12:19:11 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiPhTLn1p0ZHx-7SMdk4_zazqDK1k7MMEn9scRfqeDgtw@mail.gmail.com>
X-Gm-Features: AclHuK9zjNsLEbEE0A6J67WckQomYHLmgnHUgeBFdLi9wQ3HXJJ7-2Kt1ScuFM4
Message-ID: <CAHk-=wiPhTLn1p0ZHx-7SMdk4_zazqDK1k7MMEn9scRfqeDgtw@mail.gmail.com>
Subject: Re: [GIT PULL] overlayfs fixes for 7.3
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-unionfs@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000a55bbb065f27ca49"

--000000000000a55bbb065f27ca49
Content-Type: text/plain; charset="UTF-8"

On Sat, 31 Oct 2026 at 02:57, Amir Goldstein <amir73il@gmail.com> wrote:
>
> Amir Goldstein (6):
>       vfs: add try_take_dentry_name_snapshot()

I've pulled this, but I detest this particular commit. It just
"smells" wrong to me.

I don't doubt that it fixes a real bug in overlayfs, but I think the
fix is entriely wrong. It is wrong in two ways:

 - it incorrectly fails when the issue is a race with a rename (this
is harmless for overlayfs and will just result in -ECHILD)

 - it adds a bogus new "try" helper that I don't believe should be
needed or exist

I think the proper fix would be to just say that the
!atomic_inc_not_zero() can indeed fail, and we should never retry
based on that.

But if we should *always* retry based on dentry->d_seq.

And once you retry correctly based on dentry->d_seq, now the "we
didn't get a name reference" is reliable: if it happened despite d_seq
being stable, it's because we really don't have a name any more, and
so we should return failure.

Put another way: I think we should have just one
"take_dentry_name_snapshot()" function, and it should return a
boolean, and look somethign like this:

  bool take_dentry_name_snapshot(struct name_snapshot *name, struct
dentry *dentry)
  {
        unsigned seq;
        const unsigned char *s;

        rcu_read_lock();
  retry:
        seq = read_seqcount_begin(&dentry->d_seq);
        s = READ_ONCE(dentry->d_name.name);
        name->name.hash_len = dentry->d_name.hash_len;
        name->name.name = name->inline_name.string;
        if (likely(s == dentry->d_shortname.string)) {
                name->inline_name = dentry->d_shortname;
                if (read_seqcount_retry(&dentry->d_seq, seq))
                        goto retry;
        } else {
                struct external_name *p;
                p = container_of(s, struct external_name, name[0]);

                // Try to get a valid reference
                if (unlikely(!atomic_inc_not_zero(&p->count))) {
                        if (read_seqcount_retry(&dentry->d_seq, seq))
                                goto retry;
                        rcu_read_unlock();
                        return false;
                }

                // Ok, we have a name reference. Make sure it is still valid
                if (read_seqcount_retry(&dentry->d_seq, seq)) {
                        release_dentry_name_snapshot(name);
                        goto retry;
                }

                name->name.name = s;
        }
        rcu_read_unlock();
        return true;
  }
  EXPORT_SYMBOL(take_dentry_name_snapshot);

(Note that in this version, if it fails it will just reutn the
shortname in name->name.name, but it should never fail for a dentry
that you hold a reference to afaik).

Attached it an ENTIRELY UNTESTED patch that does all the other changes
too to make overlayfs use this version.

Again: ENTIRELY UNTESTED. Maybe I'm missing something and I'm just
wrong on this. But I really don't like that nasty
try_take_dentry_name_snapshot() thing. It really looks wrong to me,
both conceptually and in being actively buggy and racing with renames.

Hmm? Comments?

                 Linus

--000000000000a55bbb065f27ca49
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_mvwsa2ds0>
X-Attachment-Id: f_mvwsa2ds0

IGZzL2RjYWNoZS5jICAgICAgICAgICAgfCAzOCArKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQogZnMvb3ZlcmxheWZzL3N1cGVyLmMgICB8ICA5ICsrKy0tLS0tLQogaW5jbHVk
ZS9saW51eC9kY2FjaGUuaCB8ICAzICstLQogMyBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25z
KCspLCAzMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9mcy9kY2FjaGUuYyBiL2ZzL2RjYWNo
ZS5jCmluZGV4IDQwOWY4NDFlMDU4ZS4uZmUwMzdhODc2ZDc2IDEwMDY0NAotLS0gYS9mcy9kY2Fj
aGUuYworKysgYi9mcy9kY2FjaGUuYwpAQCAtMzU5LDggKzM1OSw3IEBAIHN0YXRpYyBpbmxpbmUg
aW50IGRuYW1lX2V4dGVybmFsKGNvbnN0IHN0cnVjdCBkZW50cnkgKmRlbnRyeSkKIAlyZXR1cm4g
ZGVudHJ5LT5kX25hbWUubmFtZSAhPSBkZW50cnktPmRfc2hvcnRuYW1lLnN0cmluZzsKIH0KIAot
c3RhdGljIGJvb2wgX190YWtlX2RlbnRyeV9uYW1lX3NuYXBzaG90KHN0cnVjdCBuYW1lX3NuYXBz
aG90ICpuYW1lLAotCQkJCQlzdHJ1Y3QgZGVudHJ5ICpkZW50cnksIGJvb2wgcmV0cnkpCitib29s
IHRha2VfZGVudHJ5X25hbWVfc25hcHNob3Qoc3RydWN0IG5hbWVfc25hcHNob3QgKm5hbWUsIHN0
cnVjdCBkZW50cnkgKmRlbnRyeSkKIHsKIAl1bnNpZ25lZCBzZXE7CiAJY29uc3QgdW5zaWduZWQg
Y2hhciAqczsKQEAgLTM3Myw0NCArMzcyLDMzIEBAIHN0YXRpYyBib29sIF9fdGFrZV9kZW50cnlf
bmFtZV9zbmFwc2hvdChzdHJ1Y3QgbmFtZV9zbmFwc2hvdCAqbmFtZSwKIAluYW1lLT5uYW1lLm5h
bWUgPSBuYW1lLT5pbmxpbmVfbmFtZS5zdHJpbmc7CiAJaWYgKGxpa2VseShzID09IGRlbnRyeS0+
ZF9zaG9ydG5hbWUuc3RyaW5nKSkgewogCQluYW1lLT5pbmxpbmVfbmFtZSA9IGRlbnRyeS0+ZF9z
aG9ydG5hbWU7CisJCWlmIChyZWFkX3NlcWNvdW50X3JldHJ5KCZkZW50cnktPmRfc2VxLCBzZXEp
KQorCQkJZ290byByZXRyeTsKIAl9IGVsc2UgewogCQlzdHJ1Y3QgZXh0ZXJuYWxfbmFtZSAqcDsK
IAkJcCA9IGNvbnRhaW5lcl9vZihzLCBzdHJ1Y3QgZXh0ZXJuYWxfbmFtZSwgbmFtZVswXSk7Ci0J
CS8vIGdldCBhIHZhbGlkIHJlZmVyZW5jZQorCisJCS8vIFRyeSB0byBnZXQgYSB2YWxpZCByZWZl
cmVuY2UKIAkJaWYgKHVubGlrZWx5KCFhdG9taWNfaW5jX25vdF96ZXJvKCZwLT5jb3VudCkpKSB7
Ci0JCQlpZiAocmV0cnkpCisJCQlpZiAocmVhZF9zZXFjb3VudF9yZXRyeSgmZGVudHJ5LT5kX3Nl
cSwgc2VxKSkKIAkJCQlnb3RvIHJldHJ5OwogCQkJcmN1X3JlYWRfdW5sb2NrKCk7CiAJCQlyZXR1
cm4gZmFsc2U7CiAJCX0KKworCQkvLyBPaywgd2UgaGF2ZSBhIG5hbWUgcmVmZXJlbmNlLiBNYWtl
IHN1cmUgaXQgaXMgc3RpbGwgdmFsaWQKKwkJaWYgKHJlYWRfc2VxY291bnRfcmV0cnkoJmRlbnRy
eS0+ZF9zZXEsIHNlcSkpIHsKKwkJCXJlbGVhc2VfZGVudHJ5X25hbWVfc25hcHNob3QobmFtZSk7
CisJCQlnb3RvIHJldHJ5OworCQl9CisKIAkJbmFtZS0+bmFtZS5uYW1lID0gczsKIAl9Ci0JaWYg
KHJlYWRfc2VxY291bnRfcmV0cnkoJmRlbnRyeS0+ZF9zZXEsIHNlcSkpIHsKLQkJcmVsZWFzZV9k
ZW50cnlfbmFtZV9zbmFwc2hvdChuYW1lKTsKLQkJZ290byByZXRyeTsKLQl9CiAJcmN1X3JlYWRf
dW5sb2NrKCk7CiAJcmV0dXJuIHRydWU7CiB9Ci0KLXZvaWQgdGFrZV9kZW50cnlfbmFtZV9zbmFw
c2hvdChzdHJ1Y3QgbmFtZV9zbmFwc2hvdCAqbmFtZSwgc3RydWN0IGRlbnRyeSAqZGVudHJ5KQot
ewotCV9fdGFrZV9kZW50cnlfbmFtZV9zbmFwc2hvdChuYW1lLCBkZW50cnksIHRydWUpOwotfQog
RVhQT1JUX1NZTUJPTCh0YWtlX2RlbnRyeV9uYW1lX3NuYXBzaG90KTsKIAotLyoKLSAqIEZvciBh
IGNhbGxlciB0aGF0IGhvbGRzIG5vIHJlZmVyZW5jZSBvbiBAZGVudHJ5LCBlLmcuIGluIFJDVSB3
YWxrLgotICogVGhlIGV4dGVybmFsIG5hbWUgb2YgYSBkZWFkIGRlbnRyeSBoYXMgYSB6ZXJvIHJl
ZmNvdW50IGZvcmV2ZXIsIHNvCi0gKiB0YWtlX2RlbnRyeV9uYW1lX3NuYXBzaG90KCkgd291bGQg
cmV0cnkgd2l0aG91dCBlbmQuICBGYWlsIGluc3RlYWQuCi0gKi8KLWJvb2wgdHJ5X3Rha2VfZGVu
dHJ5X25hbWVfc25hcHNob3Qoc3RydWN0IG5hbWVfc25hcHNob3QgKm5hbWUsCi0JCQkJICAgc3Ry
dWN0IGRlbnRyeSAqZGVudHJ5KQotewotCXJldHVybiBfX3Rha2VfZGVudHJ5X25hbWVfc25hcHNo
b3QobmFtZSwgZGVudHJ5LCBmYWxzZSk7Ci19Ci1FWFBPUlRfU1lNQk9MKHRyeV90YWtlX2RlbnRy
eV9uYW1lX3NuYXBzaG90KTsKLQogdm9pZCByZWxlYXNlX2RlbnRyeV9uYW1lX3NuYXBzaG90KHN0
cnVjdCBuYW1lX3NuYXBzaG90ICpuYW1lKQogewogCWlmICh1bmxpa2VseShuYW1lLT5uYW1lLm5h
bWUgIT0gbmFtZS0+aW5saW5lX25hbWUuc3RyaW5nKSkgewpkaWZmIC0tZ2l0IGEvZnMvb3Zlcmxh
eWZzL3N1cGVyLmMgYi9mcy9vdmVybGF5ZnMvc3VwZXIuYwppbmRleCAwODY5NWE5OWY0ZjkuLjJl
MTYwYjdkY2ZlNyAxMDA2NDQKLS0tIGEvZnMvb3ZlcmxheWZzL3N1cGVyLmMKKysrIGIvZnMvb3Zl
cmxheWZzL3N1cGVyLmMKQEAgLTEwMCwxNyArMTAwLDE0IEBAIHN0YXRpYyBpbnQgb3ZsX3JldmFs
aWRhdGVfcmVhbChzdHJ1Y3QgZGVudHJ5ICpkLCB1bnNpZ25lZCBpbnQgZmxhZ3MsIGJvb2wgd2Vh
aykKIAkJCWRpciA9IGRfaW5vZGVfcmN1KHBhcmVudCk7CiAJCQlpZiAoIWRpcikKIAkJCQlyZXR1
cm4gLUVDSElMRDsKLQkJCS8qCi0JCQkgKiBOb3RoaW5nIHBpbnMgZCBpbiBSQ1Ugd2FsazogZXZp
Y3Rpb24gb2YgdGhlIG92ZXJsYXkKLQkJCSAqIGlub2RlIG1heSBkcm9wIHRoZSBsYXN0IHJlZmVy
ZW5jZSBhdCBhbnkgdGltZS4KLQkJCSAqLwotCQkJaWYgKCF0cnlfdGFrZV9kZW50cnlfbmFtZV9z
bmFwc2hvdCgmbiwgZCkpCi0JCQkJcmV0dXJuIC1FQ0hJTEQ7CiAJCX0gZWxzZSB7CiAJCQlwYXJl
bnQgPSBkZ2V0X3BhcmVudChkKTsKIAkJCWRpciA9IGRfaW5vZGUocGFyZW50KTsKIAkJCXRha2Vf
ZGVudHJ5X25hbWVfc25hcHNob3QoJm4sIGQpOwogCQl9CisJCS8vIEluIFJDVSB3YWxrIHRoZSBk
ZW50cnkgbmFtZSBtYXkgZ28gYXdheSBhdCBhbnkgdGltZQorCQlpZiAoIXRha2VfZGVudHJ5X25h
bWVfc25hcHNob3QoJm4sIGQpKQorCQkJcmV0dXJuIC1FQ0hJTEQ7CiAJCXJldCA9IGQtPmRfb3At
PmRfcmV2YWxpZGF0ZShkaXIsICZuLm5hbWUsIGQsIGZsYWdzKTsKIAkJcmVsZWFzZV9kZW50cnlf
bmFtZV9zbmFwc2hvdCgmbik7CiAJCWlmICghKGZsYWdzICYgTE9PS1VQX1JDVSkpCmRpZmYgLS1n
aXQgYS9pbmNsdWRlL2xpbnV4L2RjYWNoZS5oIGIvaW5jbHVkZS9saW51eC9kY2FjaGUuaAppbmRl
eCA4NGIwY2ZlNGVkMGUuLmFhYTRiYTdhMTI5OSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9k
Y2FjaGUuaAorKysgYi9pbmNsdWRlL2xpbnV4L2RjYWNoZS5oCkBAIC02NjQsOCArNjY0LDcgQEAg
c3RydWN0IG5hbWVfc25hcHNob3QgewogCXN0cnVjdCBxc3RyIG5hbWU7CiAJdW5pb24gc2hvcnRu
YW1lX3N0b3JlIGlubGluZV9uYW1lOwogfTsKLXZvaWQgdGFrZV9kZW50cnlfbmFtZV9zbmFwc2hv
dChzdHJ1Y3QgbmFtZV9zbmFwc2hvdCAqLCBzdHJ1Y3QgZGVudHJ5ICopOwotYm9vbCB0cnlfdGFr
ZV9kZW50cnlfbmFtZV9zbmFwc2hvdChzdHJ1Y3QgbmFtZV9zbmFwc2hvdCAqLCBzdHJ1Y3QgZGVu
dHJ5ICopOworYm9vbCB0YWtlX2RlbnRyeV9uYW1lX3NuYXBzaG90KHN0cnVjdCBuYW1lX3NuYXBz
aG90ICosIHN0cnVjdCBkZW50cnkgKik7CiB2b2lkIHJlbGVhc2VfZGVudHJ5X25hbWVfc25hcHNo
b3Qoc3RydWN0IG5hbWVfc25hcHNob3QgKik7CiAKIHN0YXRpYyBpbmxpbmUgc3RydWN0IGRlbnRy
eSAqZF9maXJzdF9jaGlsZChjb25zdCBzdHJ1Y3QgZGVudHJ5ICpkZW50cnkpCg==
--000000000000a55bbb065f27ca49--
