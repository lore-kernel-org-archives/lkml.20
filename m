Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793810503;
	b=K4Ektm8h4HjJdsd06xJDlIVw79A4bghD7g7WUqyV/x2R8if25aly65bm0ropEYC+iw3o
	 evW4/JcnW5vS3hDpB2I+7Ja6tPWQ1zZbXdj9mtUeBazGh34ZgbdEVRMV4pZ4kuzGQC19V
	 wv6ii20HxI7gi9RVxYkiaaB8WCX+ieCvSrs/spmt2B2G7pM3LGsZmvXFUWOoiss4nkJQ9
	 +0KhMg/1WMXqVZX4UDOaZ3ipgqrk34qBKLtqoqQ4lVaaFzIHyJ6rk3w/XwRzgHnq77wzX
	 JiIuNhQwb654bYGMmPNLiYhzcETOPCMe9/b3tSuATmXL0lw8OtRajVFjGGHeZ7R5uEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810503;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ku2UnsviuHOTDYdvHM/Ud8HrJciSPINrWDXnS5vQ5OI=;
	b=N8/x/7l1LiFZAl9Xm77TR3UkGCQ6odTav4DLuZG9hVmW4eLegxxMrmYkj6qSKc/nPicf
	 YwOd2KCr9iwanVEZVMm+328Jb9XB+wrJc0P2QgR2sn/TObYnYwWytvgmqhC/yd1tB0xCJ
	 +ql7KIC0Xp5Mc3fg49WVkWyMTg2glwx97XHfFJ8GTPfb34meoXzAr6HJje2UOUwAaADd1
	 5hi1Nez2+7+Y/bohAuAz1J/1zVMajvvR+ig2beDjFNEC0s61P1teKVU077/FLIhCGSjcl
	 fBki+4wLK40zH7YhHa5ObK2Vp+djS+4xZenj02Af9ycT8MGoU7dJuNFQeHE8xgBinfw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Ze/MFpOz";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599BF606A336
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:41:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 599BF606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ze/MFpOz
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so7309415e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:41:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793810502; cv=none;
        d=google.com; s=arc-20260327;
        b=fe1pA//tcDsFqHl30yPMElORve7Gu/HsVAbiIrdspn/0UwQLKetD9UcaONGj4jCvGc
         gOMeG3IlbfRqdqYDBzI2oYRE+BaRP1AOfJTrRuOiVDgGV+sOrTlPFZzD3GevTWwkxH0B
         FTEjr/mGLipvyYsUKbT53FTDmpUjQCOJJaWDVmxdNltQu1v09+nz5A0DyWYzlmsBDoRk
         5IyTC4nq8X4BXZzTax+1tIF++/vrU+pEYocGS3kNqBOAcLQsMv2UNUM6W/W7YHL7BgOY
         oRKKWGXG6FsJ61q7YvU4mK5/w4lku0CrijNtqZjJ1jVchHDVvACCKPh6zVn4Z66rcYJ5
         EuNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ku2UnsviuHOTDYdvHM/Ud8HrJciSPINrWDXnS5vQ5OI=;
        fh=0fTQyVlAgRGb+UhDBlpYUQUIw4v4CcDgImRN9eYLNLo=;
        b=VaUTBGdUoX2Ik2saAq20KeyMosXVWtbDQr0W3fNbQqU7c15gnHU+s3NAON2WrkNoAW
         F0WzoTNZopE3nph/OjwGb6zpyeu7Q39NRg/mOCFyVIBFVVFh7C/45btf1yumuuzIktHR
         KG/czvlv5lauFstlTa3YVRVkopW9jmx8Wtom5t7+trN3GkjIV5wjFdHGJzNt6biOJJpk
         0z5gJhuhdlOqNcGZnFr/DBy5TVQXD3RKzxNthmjc7KeSh8i+bNu22krFI8QiNDG9ZJj6
         RzQBPTa78i519/NAe/c7OMd6zwP3QrLIlGwSe3EjfSNvLnrHXYwVvNWTouUIwjJWcVG7
         wpsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793810502; x=1794415302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ku2UnsviuHOTDYdvHM/Ud8HrJciSPINrWDXnS5vQ5OI=;
        b=Ze/MFpOzmjjr5edV4VsDrD5Wp/jwgO3YIqy3D6/ahUIj30rRjsX/rJ8UkOvVxYfb5Q
         wNEiqIdDGmhjM6wiK870AIO+yIIpHOpE0eQZQWl01yQssCxsz5YLFymZgVHixRq1vREv
         PqvEX/rRqEaYSySytuN0+Zj+UiWGSIf/Yqkd2pIoVs8L3tNzeU1dekFw2lpnLErB/s/G
         UlbiuUd1z6q1kGvabLolTAXiXmjHqGKKduEjy8TjxzxhUuDVlydKQQa0T9bybNDJ/ulU
         BZit1AVxYsU0hYS4t8o9sDTbnxcCY8TiKgkcn1g7PVRDL1pjf4p5GSWWiKpSc0NQYbmz
         p3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810502; x=1794415302;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ku2UnsviuHOTDYdvHM/Ud8HrJciSPINrWDXnS5vQ5OI=;
        b=jiTGAXfHJDPc4Rhbq+mrAsGlGtivf64uTAz68VZTE/O6nR60rz6MLpy8aAJzAJvgL/
         FM/WtS2hnF8zCLX1hXPO6skrR/bsNKAhwqK4YG7z4zQbRdQ9NZO+r+fZk5vwUJR/FsOC
         CxflWxJNuN/jXVVPVjPUdJic3DzD8O0rb+vI0w+YsLMB1b28E/op/vekAn0q6UTDDz6p
         oFRI+JHHC9L/mFF3sd19C43q8kWQQweNxw6RG3rZX6JmMKj9zTFLk9zO3y9/BmJ3HIwH
         9XS9z2/ntPUFae9H5Xm4H5Ct5lWBikJEIT96f8i7MMqvS+b8ZFHJC2KJMdcDmUkfbCZg
         kqOg==
X-Forwarded-Encrypted: i=1; AKwUvBzkRIUhDdKWbnwfpWQ2jSsRvI3+7I17IEkGYEWQO7J5PeZStOBbx7W+Sjz821dS+clpcMz2f1KIBr05a8A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+dr5ZRi+qPf4cKSd9pbFjwsS6LkswoN0ZKCtKSX1rXni/JRaO
	N3u0ENVTqV4PQ9v5dFXw9ar5zI5WbbXDcIPfGhG5qVkHoQioMkW6oblQxRdqzr3RbtF1aXbvfc2
	k8NqQ/mKsGb9l9ooWHdmE/9wGcoYS9tw=
X-Gm-Gg: AYBFou0vAnsu2blJdLOkIJWjNwQXZZEF2H/rgY8hdC+xjH+aFWTlIEgMnmyAuBwVeqI
	FytHS7K9nuZVjBvV/LQshXuPW+tGyfWk6TjA9PUT+HBO1yP7doGZn795okJ9kHbEbb0eLMUEy2f
	/qQImk1+Osl/OqviwbbNnHbMp9DWOY0lL9zMryOJ/qnl8RsjFOYvT9+hafxYfQ14wj4gdt8ZYnh
	pQ4SzyuIJXYQI4RCRUK+IWA+uZ4rjReDP1RLBcQAufapqyXsqq3kewjSnticD0p1nKied/I4ZjG
	F6Hr51UBWghpZhal3SRTvWB1Hy6MZos9BdUXdgz0eAAUkmGI31JfM/QV+gUZYzVxkYhVU1mjADp
	yFQ+2kiE3LUCblnrq4JDqIy7hYz7nFXl9H5Oy7hOVtm0aLe8MHGzun6z8BC22rLSUrTW/zeLxD0
	t1S1TvWdpzeIY1h6RwEcpRyX4Tt5DVJls1O3qtcNDKYKF9lBWr+M4e
X-Received: by 2002:a05:600c:64c5:b0:4a2:150f:1613 with SMTP id
 5b1f17b1804b1-4ac17a367edmr385395375e9.7.1793810501682; Wed, 04 Nov 2026
 08:41:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-swap-hibernation-slots-v4-0-0ba9393609e1@tencent.com> <20261104-swap-hibernation-slots-v4-3-0ba9393609e1@tencent.com>
In-Reply-To: <20261104-swap-hibernation-slots-v4-3-0ba9393609e1@tencent.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 4 Nov 2026 09:41:29 -0700
X-Gm-Features: AclHuK-TAkBJYjCRFl11en6u7op_vk6E20BwjEFAr3odRFFXaGm9rD6s17cs0UU
Message-ID: <CAKEwX=PMnYYBfODbQZJCz0jSPSHy7Y3CkKeDWzxKe3VsROBDeQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] mm, swap: drop the swap cache guard and reclaim in swap_free_hibernation_slot()
To: kasong@tencent.com
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Chris Li <chrisl@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Jianyue Wu <wujianyue000@gmail.com>, Youngjun Park <youngjun.park@lge.com>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Kairui Song <ryncsn@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 9:25=E2=80=AFAM Kairui Song via B4 Relay
<devnull+kasong.tencent.com@kernel.org> wrote:
>
> From: Youngjun Park <youngjun.park@lge.com>
>
> Both are there for a folio that readahead might have put on the slot.  A
> hibernation entry is not a shadow and has no swap count, so the swap cach=
e
> turns it away and no such folio can exist.
>
> Signed-off-by: Youngjun Park <youngjun.park@lge.com>
> Acked-by: Kairui Song <kasong@tencent.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>

Reviewed-by: Nhat Pham <nphamcs@gmail.com>
