Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F09434EF04
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 20:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787776641; cv=pass; b=mOP3khS0EkOUSoGAJ3VK0TSJXRKP6rzVFtbfQzr8/Cwb1sh67PuVjtayHvUfNxLrcKhUOQ418PSKvP+WbcUZpiDchwRr+i85YUlr5yNrdIueNgOUkFwtpDCUwWZNHiZ1mEdQdhGMO/9+q0YSCZu85AL+fMlKMVqMcZfjUduT/io=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787776641; c=relaxed/simple;
	bh=zGDCPZAr8rIObhQUZ6eIXhwp3IZGO3y+WOrn01qU5BY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CUQ2f5CNHAtHrcChuKO7Km4f+Q9ZusGIWcwn3AcH+gWEsJWiVbOqRNjl43tIKkstD2Cc8kLocSn6t9OwF8R+Lei8TPbavc5RPQQ1Cx0khR6Pp/mv/+OTN+oeZnHVN0P8D4BRZrs6XW2kc1Emj675VPivG2MUA9m4fu42dG9XcvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BC930g/R; arc=pass smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BC930g/R"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-97cc700fcf5so235015241.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:37:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787776639; cv=none;
        d=google.com; s=arc-20260327;
        b=dPCBOdIBdRCLBMFUzw5MjPUngXiy1/5k22aYHsUGM282RYnU2A5InQrn6EqaQStC4y
         bvjx8kuijlz2UQPbCtJIU6RzCCXiYqTCCtB10yW5xTsUL/eXO+s2fpbh/hJQMqSMcI9n
         FoA5vGa54XlWRrD5g4C8Yf24ke/4xWmhQ0enqYQ9HeTW6ipuy20Fkj37HOHBFTmg1gv+
         ZMuvCGJtBT0YxKJmXfqzrZpeulBJavv6DtEIkSiX6aCd8kEYvSmQItPIDMWMH/fRLY0G
         +Znm3uB9GtEvDH6ce6rZbiNQSr4Ono05ZH5CGjOOIWl32bf8+6Oq1I+b4nJ2mZo3JtnS
         9N/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WHNWMVjvIwfjCOhWDbjhiGpUoUnFKyqrLr/E6gLJdRE=;
        fh=KjMblDOEdVYWCzAsGfvmj3NrKfKk6MBIk7VGoBhHNCo=;
        b=flSmD/Z1r9uf7oOkXMqxcrR5K2Z8Lrk9XOjBb0hehiJ7HT4jg7SZ5L2WMxOwEHpntI
         2Vrh7SdgpeANHlbpadwGgjY7DGK0nnvZPavK/auW8rvTZk2OmqDSzH115Th3gZkNKRee
         gqFZ2fpAqHAvjI/CYzkPXsEvTSxbI2tLaVNkXebfks9vinfpwSkahhusTqLcIqUCsUNt
         1ToNa34sF18buY+k0vp61u+jqMZjolXj/Q2Shctwsh71q0EC4AchRTf0tndSSXlA5HLn
         ua04KlvrlrOYt6H3jQlS+SECvqhD0Q5OCEHqJmhtEx0a01EZxCAVNzyQo6lPkTpNSxbX
         D27w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787776639; x=1788381439; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WHNWMVjvIwfjCOhWDbjhiGpUoUnFKyqrLr/E6gLJdRE=;
        b=BC930g/R8F8+FYfuh3XSluLUbmbCkt5MQhqsy8ecRhbEAVEHKY4MXXe5OFpxYc6lOX
         RBnK07y0hvXuYST3nEQ78cBKwjwuLy0yFV0pQYFp5FnL00hCuZadDtKyiyy/G+79S3gc
         WH9Cm6xqvnrK7PRe+lDc7z/LMWUMR0jBW+SgZtzbgimtmzTWrSfl0ItHXVF56XDC4yT7
         Nxu9qzDgmw34YvfYwPvmFWG4MPdlp07vGGzZE1oo4UiHD40w4GbDBtr6Pfun5ImvJXhl
         WRmUuiQm3DYxfSWUtKohwaXSrawaDLrLT/iYQdfk59+ZYa+ET2iZ2+AQQb8uWvzUledL
         5o8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787776639; x=1788381439;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WHNWMVjvIwfjCOhWDbjhiGpUoUnFKyqrLr/E6gLJdRE=;
        b=OK7sq3Assy6G/TwbrnelxzHmhv9PXToooOIn/FurTCZRwOLkr9F4n3BDeKWlQRVmKC
         vTSIsfpmBwUjBZo5+ZKYIC+pzbj2XIt35MTlvfKKlFtTN13PRz4ZdhqNVaiHpnzU2Sg5
         kriDaQuehETkgUgMID9YOM5YI2OhPe9junRGm+AKoF5rsD/iRAJJ9uhRhKjaXWwQolau
         1HMwyE2f5blS3x/CaPbbgNf+bN1/yFkS+LPYAODJN4GsaOWm/Aun0JPno6ZJUzuxsOYZ
         5mRPjENKIA8fDhUqNILdd8HoZ/DFS1B0pVs+SvvmVP4ncOYjpbsyfTgWBXCmpeYhHx/v
         6a6A==
X-Forwarded-Encrypted: i=1; AHgh+RoZzGLeCw8dEeOHkwgdBU4tnb2R4GrWOI3L6f5N9WdqpSIJzAjkglsS5cihPMK83QxI1FdvF7yOO25WvZQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l977INOPiFZTd5LuKFodS82CA8r4pEYi8TbZXcOILMTzauQAnq
	+0uZhXgdG7cSIQ1WoGr+Gn2LyWC1aRoyfk07LSEOrQNJ6l11fcDybfkBpbNmkwthzrztdRvHVyM
	3EarJ+8VEu4CWgKoBEepRB0walQb7lgRUq8ukab2r0+IlA5i7U5QxZHU=
X-Gm-Gg: AR+sD125HE022LATwOn3kmSwIhOYit2BgWFO99ySpfp4Cz5BPj/W/W5+1+mNqFPhaBD
	zA9xihUDVgi6IrwMNnKaZWOZn+tdsA1SgU5txT8oeCQF6kB9lZW1dRUh4tmgx9uIppkef8rq8Ix
	/Cc+G7YWMVYU/1UvAS71iEAjBCNR9LYEeLKXY9MO5O8Pzhn/xTBGijR1pfK3tAD8l0C0hR1Am4x
	5OxDpUNr5MOjSZUOBNQKJia8eQTwsujc761G8ewewllQJ1SWu/CSKriGRaCeYzTfUlrE47ElG1N
	2T7ZIFPJFwYLUOOTIveISUJ0eHzagAW3YIKUqoCSL537zv/qhDAXykxe70SoJoHY71NaNhGK1fD
	C+gOke1GBpYzUgv+eOkJsNupyoy2dCga2h/ZydzzKBw==
X-Received: by 2002:a05:6102:4189:b0:781:1ac:8242 with SMTP id
 ada2fe7eead31-7841e499c4amr399338137.7.1787776638614; Wed, 26 Aug 2026
 13:37:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260823125155.1136740-3-morbo@google.com> <F22B12C6-D4C2-4A7D-8C81-B5FF6443DDF0@grrlz.net>
In-Reply-To: <F22B12C6-D4C2-4A7D-8C81-B5FF6443DDF0@grrlz.net>
From: Bill Wendling <morbo@google.com>
Date: Wed, 26 Aug 2026 13:37:01 -0700
X-Gm-Features: AcwNN1U2GfMiyaQAStNs4u0GCHfGLBgKVLjjqzt3ZTdw2vtbVUFLjQn8h9N2Kws
Message-ID: <CAGG=3QXeUoxFqHO=Cs726tyubfeG5+0SdGfrbNJ7svDyejid4w@mail.gmail.com>
Subject: Re: [PATCH 2/2] userns: Add KUnit test suite for uid_gid_map
To: Bradley Morgan <include@grrlz.net>
Cc: aliceryhl@google.com, brauner@kernel.org, 
	codemender-patching+linux@google.com, cyphar@cyphar.com, 
	dianders@chromium.org, gary@garyguo.net, gustavoars@kernel.org, jack@suse.cz, 
	kees@kernel.org, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux.amoon@gmail.com, nathan@kernel.org, 
	nsc@kernel.org, ojeda@kernel.org, oleg@redhat.com, tglx@kernel.org, 
	thomas.weissschuh@linutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bradley,

On Sun, Aug 23, 2026 at 6:48=E2=80=AFAM Bradley Morgan <include@grrlz.net> =
wrote:
>
> Hi Bill,
>
> > +config USER_NAMESPACE_KUNIT_TEST
> > + tristate "KUnit test for user namespace map insertion" if !KUNIT_ALL_=
TESTS
> > + depends on USER_NS && KUNIT
>
> The test is #include'd into user_namespace.c, which is builtin (USER_NS
> is a bool), so =3Dm here still compiles the suite into vmlinux. With
> KUNIT=3Dm that calls kunit symbols that live in a module, and the link
> fails. Make it bool and depend on KUNIT=3Dy, like EXEC_KUNIT_TEST:
>
>  bool "KUnit test for user namespace map insertion" if !KUNIT_ALL_TESTS
>  depends on USER_NS && KUNIT=3Dy
>
Okay.

> > + /* Verify sorting is correct */
> > + for (i =3D 0; i < map.nr_extents; i++) {
> > +  KUNIT_EXPECT_EQ(test, map.forward[i].count, 5);
> > +  KUNIT_EXPECT_EQ(test, map.reverse[i].count, 5);
> > + }
>
> This doesn't verify any sorting. Every extent was inserted with count
> 5, so the loop passes even if sort_idmaps() did nothing. Either assert
> that forward is ordered by .first and reverse by .lower_first, or drop
> the sorting claim from the changelog.
>
Good call. I added in checking for actual values.

> > + /* Clean up allocations to avoid leaks */
> > + kfree(map.forward);
> > + kfree(map.reverse);
>
> Nice.
>
> No tag, add me into V2, please?
>
Done!

-bw
