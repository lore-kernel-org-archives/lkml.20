Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181A83DAAC2
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789439993; cv=pass; b=tnG2g8uXeeD5k4gQo8Z8qzi09GlDsk14vypQayNLXiAC5YlIUKzR1UPfIg+mrqKx6XW1L1IQWj/Mj5x1YDRnP8Buy5vRSTaj4en6UNgFzP5SQqMxGPdYo6QyJO0bYNuY63ZMOqk1GvUdIY5FBJBTK2/S9HLntRcqYDxUPDgSYCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789439993; c=relaxed/simple;
	bh=eKLUaFl3MY3wwrqb6j5IuVvJPNafZ/2V9PYh3wKn53U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jl8zimQw5XxGvY1ZxvyM/evN9BhAOpBIfoyMZ8OKYLe0ruQ375ZEE50V7sU4am4+0j5YNfJcRzMVLDVIMpkj6nUwtIWrws4HhE4/K9WlsFjwFqqTSDepECt/IujDRUy4A2eCKIF2ObDpBaE7PF4qIGrfBLZJpHhsMRMNRtcd6e0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CGvxsD2n; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CGvxsD2n"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso31453295e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:39:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789439987; cv=none;
        d=google.com; s=arc-20260327;
        b=aJR5lpjjnkxwjlh1TRHQx6bxf/MmQeWkNmbFTXQuvOcYegPJHSsaAgeXUpyMgzxkEx
         Faa5CH9Cf9WwePJlu2hIQ91/ZcKBMlq81UNrp1LX8nwCFVonCecbAssDZoW8uAcIWqfi
         7bhTWjhpv6n0HJLbMZ0LeQFRuIKgNMyKGkNh/RTwEL1JHenWn/ML34VltbH0I3aj9k/h
         91q+bpWzZkLqclec7zhpWmSKphzYvcB/0S7umxYyMDbecb61pG8zQl2LgEww0Bg+uzNy
         B2tdoPSXSopVBNNbo8OGJzbcXfdYEKwxW8l1Mpc+GgM/Ea/XB6Nkx6dscO53QQ+r1dvB
         KD3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2jmDylHBt6Z/mwGiXz/nmJJJ0KqybZ3pQ4MP3rJZ7V4=;
        fh=J8WL85smZXKJKFSSJv3rm0xR2qWmxc/e76h4ZNg+pjI=;
        b=k/JJEpYh38bu5CvODV4PFnWfLbERaajuUsgDZIQsB8DmFBtxZbhWhzpVBhfiyior6O
         HXRJ5ySSD37BfL6Ca5AFGHk1XfNf6plm14FLvpC2RBa4T1KifVE7qZnbL58+HeZePF2H
         vKlk1Rol+Ryga3tPyFpb8i4Hblg3QpBYvVzVjSs9sPtbo+edAGETiBF0zXDxj77bj0aM
         tQoR/jvRsfSgMe3khDlcPaQUR5GiEFDa1jkODJuNftVQr6DKifode/QMnYj7QERIusU4
         LOPWPILDB2wA9wQIvlhf+3hVc7Drw2zhDN73OX2y1P/adrskJ1x4aZ10cwwTqcz5qYfI
         lKUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789439987; x=1790044787; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2jmDylHBt6Z/mwGiXz/nmJJJ0KqybZ3pQ4MP3rJZ7V4=;
        b=CGvxsD2n83clqF7sc7Tr0a7didOvx4GKvoBLp1q4SsTezvDMOs3c/MabkBDz/4gmsU
         NeQjdSLOq7ES+C2UA3uMuqz+KvbhlTjSQ7Ct0tYyK/5tmHuqJaeTdUtZTPaitpv7+B+m
         gZF9ujeBQdqIOS4V68Uqv2hIwrpa1kSTuxNupD8hCsc40qSS2KD/rYztposZLQdZvz5I
         vcf/0TDpbQryq2W3eieY3lqkaxu5CHYUUUVwbUriEy6APC8BMgi76vi+C/dYLmbQGbvm
         NJV11zUzKXQHQmOaxG6DgLAjQN7NxxRpkcGEZiuLYSaQ4fNywvDq2zbFERMh6D2c6oBW
         AcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789439987; x=1790044787;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2jmDylHBt6Z/mwGiXz/nmJJJ0KqybZ3pQ4MP3rJZ7V4=;
        b=HlwW2dCqrT199V1g7s3ANRoh4sOuPm8R64FBeq5DaZTqQaYFZvKDcNB7Rzpf9nMKiS
         ED8oUJnJpEbN+Qo57j/20t4Rh26KGzSVGUJau99NWytY8ToaBWvVsaHzd4geWhdV8ARJ
         /9VyMBYrchLZHz9Mnjkxbv/3rlI1SMVBPLcY3bRc3PmrAGjDvsoC68c87Z/iveTwm+QI
         lLqLH7b3JnRSWMBhh2yj5TJjDe7nFS2OzAu8kkJ7h9dM5Y6po0COi3kJsalgGScirhEg
         X3hSh7vEjvFaK2y+a9+Vi44O86OYMxi8MWwLXx2S1fZr5UAUYGdYYC8Lnxj+ZQpXMvG4
         OqbA==
X-Forwarded-Encrypted: i=1; AKwUvBxNXizHNJkcBxmtqMojfauK4x3CWmtjZL3sE2wy0WRPojlk2qR11fSo4J7w/lgwxrhYcTCZvT9bDhxHs0o=@vger.kernel.org
X-Gm-Message-State: AFuF++lYSqCAX7adpnFsHTtG6iTsYDc/aMwRC11m3jkvp9JoJiAYgr/D
	7YAquCaePbjOvbl/jpwzeR5h6AbU1Vv5b9P7Wf+CMCYlRGGhU8bSgXO3UXqPXEbfEg54ZuLSXaL
	hEm0HJiL4lDGE8d43t85ubrQdvXgmXKc=
X-Gm-Gg: AYBFou1LvlBJR7Nr2K/3JghdUdrhBpRReL435gcHVUepzz1SET6hf4VaYRArwS+qNvP
	SqHPLmxaKEbDPlEpuTZe7Yy7SN8Hnqx17aD9LY1BIqtIjJnaVVhzKCbg9C7YQFi1Cndn35XmWS2
	i2eOMKOFfjyj/ceJDa6R8IGVYrrHH7FinxFPNYdgi3EBkGdZjEQqWkEnM1rEZJa+8hTJms/aI11
	zzrXRB4ffH+Gkk30rzatuWktblScXViuzgGnWFGHloaCdlFLULU2cuAleDssnc6KPRZZtgZZWY8
	30JLy22nGXAM0AYf4ERAqYUihGs/RDHF0w7Omvo+dN8G59H18DJTSqZdyKpaDdH8dsw3Xxmug5o
	Ze/Zj/N6E8cAEOJE5N56XuBXX
X-Received: by 2002:a05:600c:3548:b0:49e:602a:b4ec with SMTP id
 5b1f17b1804b1-49e7a656bf6mr108019915e9.8.1789439986429; Mon, 14 Sep 2026
 19:39:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914155729.1518105-1-kunwu.chan@gmail.com> <20260914234924.100335-1-sj@kernel.org>
In-Reply-To: <20260914234924.100335-1-sj@kernel.org>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Tue, 15 Sep 2026 10:39:35 +0800
X-Gm-Features: AcwNN1Uk_DUdhz76I0hRVSRZulITZWPos7_upPjkw2hrucXG5m-I4GLxm605D_A
Message-ID: <CAN_Opa-cJDOOtQo+24kSrO6E9khoJuD3wzHZxcgAWZrrSOOSqw@mail.gmail.com>
Subject: Re: [RFC PATCH 8/8] mm/damon/core-kunit: test invalid damos filter commits
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@davidgow.net>, damon@lists.linux.dev, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, lianux.mm@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 7:49=E2=80=AFAM SJ Park <sj@kernel.org> wrote:
>
> Hi Kunwu,
>
> On Mon, 14 Sep 2026 23:57:27 +0800 Kunwu Chan <kunwu.chan@gmail.com> wrot=
e:
>
> > On Sat, 12 Sep 2026 12:18:06 -0700 SJ Park <sj@kernel.org> wrote:
> >
> > > Add test cases for testing the validation of damos filter arguments i=
n
> > > commit time.
> [...]
> > Could we also test an invalid PROBE_HITS_WSUM range here?
> >
> > Patch 4 adds the same max < min validation for
> > DAMOS_FILTER_TYPE_PROBE_HITS_WSUM, but this test only covers
> > ADDR and HUGEPAGE_SIZE.
>
> I agree it is better to add a test.  But not necessarily together with th=
is
> series, in my humble opinion.  I am separately working on the test.

Thanks, SJ. Sounds good to me.

>
>
> Thanks,
> SJ
>
> [...]
