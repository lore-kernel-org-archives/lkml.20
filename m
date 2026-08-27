Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EA44570E3
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787835872; cv=pass; b=e33GoueoqfxyNMpIP8sEzv5/643qrhO6XUTVBjzN/mEN0Mll/HdJIZ4vlgtowD70huO3nnPoA029g8PFEa3q1dBUEeh0R9P2lU/HRsUbNK3cZ6WNIl6/GJzr2mi9aQv1ppKNW04OAn8ICzmSW3+yLaotwNzfZ8TOLi1KkSVFY/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787835872; c=relaxed/simple;
	bh=vknyyVbgIXnt4i0FpUHU48h5wAnKScSuFas7HDAsAoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X0nZUJAP4+iBRG1SXxBURt7xIzS5vpMlZdT+vRAsGDghjCCwYaCtk2B5V6VN+rteVfMmH/nb2zGXOUtaiGqwpgy3wFyP6iJRvbMGNnZWLr5Wh8iFFHSbHMoh2uu0g/AKQa6I+Jx+IbBgdLdCeLLNVdHGeARAA+hCn9go6nuBER0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YwQWyzqE; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YwQWyzqE"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47fecbb7000so1005582f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:04:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787835852; cv=none;
        d=google.com; s=arc-20260327;
        b=GtY06xuo9kY0b5vf31WKTAXD3bZGz3Q7k4Az5oJAlUp40v0PbcbSYN9SUTbupA+VEB
         V3gNOhCnXYEOPM9Z0OV32eEGLHxToaNgdukDkejO5xztDJeS3gHhc88n82GB5K3m5jn0
         5S5PmhZJxfjlIFr5kvNLEy3hxwsgGRJTiUCH3xj+tjRU/Aoahr8I6vn8A+9ZDjtonfXT
         KV/Mk5ktKAakhgb2wSqZ1Wc1cNvmUYayfE5WZ65hZU4LnRQSSb2OYeGtYXRAbxcgXN2F
         i9OfJrhZ4A2EiJo7jABZTHrVxwJmQBjoLVyu/3X5fo0IUXJGvpfQpsALAhlCp8GJk99H
         4k6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vknyyVbgIXnt4i0FpUHU48h5wAnKScSuFas7HDAsAoM=;
        fh=KQLfxQdUb+bGWvw/GHV6RHDdsO+pJVE/gQUNWanrvoM=;
        b=Vjh2pPzby9F4pDm+GYCRkyRBmKlhjqMP9NBoJJiFhJlAu3SpA2eP13wlSK7iWRlqWq
         eIa9VEzgniT29qB5KNMBJKhj5sUFBci7uYrv2eDJUSAayhiZXDdjvvqlROJ6x0POessW
         PRbUKZKsN7Wqg030H9JB4pWF0/5bzSGlQLjwUdxvWPNEhw+BWmsivb2HM9UJCtWveysN
         XmW/SHQ9wE9KdhVTQLUl9Y2gcSQj8o3iEI94n6BDYGGqM7nqt+D2z8ggIcK7LVN6L/Ay
         b2RzynKI53PSICnrI94s/4YUXwyjTJHVVKBQEfEuuJw1n2k9k1GL7QvqpHvF8EW8BRRn
         zdQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787835852; x=1788440652; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vknyyVbgIXnt4i0FpUHU48h5wAnKScSuFas7HDAsAoM=;
        b=YwQWyzqEPbscGfC2UtHHRRoGnzpZgdNkQuxPVsBiPU8n8wmSoPO2hUdvDLJQY6vx/r
         61qAQGcGzBz8mnzOBMAEm1taHwgPW9S5/cd0I1dj9yYukEzXQ+qnijXVpKb/mwYVsAnY
         g6uT0OCVEj2wyz/bMGz5kkdZIw8NpAGcYDkb01qi9hLhJArO1ayXE/vh8aSF2eyKiZIZ
         /8+y7b6FagecIt4W80w36AijAcd94WhAs9ObGI97Eirsky20jkG6YWsspCUFwqw37ELn
         PQhSVj7u1Q1M3j/GxbuGdMG0ogx5yAPNGVm2BqdJI6mRyVtCX7j5s3I4FZemLYUYIUgk
         D7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787835852; x=1788440652;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vknyyVbgIXnt4i0FpUHU48h5wAnKScSuFas7HDAsAoM=;
        b=Hs5TY6XKej7f2oex02vxj2Q/uCJBtiq9AzfSjNPXiM0E9AZq6VcIl0LNunMt4kLCWd
         ukPn/ExDwXZOleEgC2jG1ljiRzdtjLCYmGqnhrCdb7RrxX8qVkuOVYKX2XdHcdGMsrTQ
         aubG3Q+YH5V33JCw5sM9i7MJ/sXDkVzczPx5lJ2EKvB1Gz46/0dl3n28eqOvAn8nTZLi
         Vng4BNzslPp2q0lZ3rzukz1izz6jVlaxW+Q4BM1BaBi47j5qbOCXLTl/s+NxIW1nMoxy
         T0/RbbAGHcBCfF6IjXKi3ZERwtlUe2B1SOcYBn0wXVA7xqo/oXIWqRNDJ7uBRnHUGLz8
         IWag==
X-Forwarded-Encrypted: i=1; AHgh+RoOzJbCKtWfOotVqPd4VWiqeINsfC3AvCPBZg0i2f/ugygSEBxeH/BuhaDqO2giKHOkY4CaXeOXhriRUdk=@vger.kernel.org
X-Gm-Message-State: AFuF++mRyFPBRbDae+K7bm6aH5kprcz4hNoHenDwMPNf3hza8THeghmN
	Rx9ndElP2Kls/mA+cXj1ohkClqvbtv5XIfDqyfbQZLVw7+sv6IdHHhWRFfgi9VOKWdylExIqyOt
	7orpwNCbbqanmDWdyvVKXrQwxEoxNnsEbj6RJnjkz
X-Gm-Gg: AR+sD114BEcHeqo3uukOhuPoJ/d8RFc6bAg7f+DZwMeWlbT21MyJ3wRh0louaO47MTl
	fqcgNiItMRlATJVZzsc7+AeasK3czoPa7E8dQlJeLa/vHK1obsmyfTtN0lzAE3Cvk3lMOkP6Fk8
	zlGl3/tKf+v5e6DduxYf4QTPdxCY/83tAbOZ2yUf5SieHwF0qmLy99Jwozw5wHQT3jWHJQnEnpE
	LrSb8yaPvq+jtELhGgh64hWwELBaEwGBQ6rklELvbZhpWI8KW1z7ouPBwmrWuP+xpUFQQMkpb1D
	1v8P8bG+93+C6M3IvBmo2g0XcAVnfUv4IXFF1ObnBGFVv5S4LDT8E5A3aVMfCToitdV3yQRIcNS
	uDZ/iifG1cGDTHnkbsLRoAMNto06ZFfI=
X-Received: by 2002:a05:6000:382:b0:481:5167:abda with SMTP id
 ffacd0b85a97d-482e26c844fmr20467651f8f.9.1787835850895; Thu, 27 Aug 2026
 06:04:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826132729.3281308-1-dakr@kernel.org>
In-Reply-To: <20260826132729.3281308-1-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 27 Aug 2026 15:03:58 +0200
X-Gm-Features: AcwNN1UcN2vg8RVpmOZyLR4-8awrlzpmXi8yWI9hVIjWmlnx2_hDjuyNvwryYNc
Message-ID: <CAH5fLgg9j8k8fsZWyT-_traR5YVSsLa2x2YcmmGK0vU1eqGKdg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add Alice Ryhl as co-maintainer for Rust [ALLOC]
To: Danilo Krummrich <dakr@kernel.org>
Cc: ljs@kernel.org, vbabka@kernel.org, liam@infradead.org, urezki@gmail.com, 
	ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 3:28=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Add Alice as co-maintainer for the Rust alloc module to share
> maintenance responsibility. This is also a natural fit, as some of the
> alloc code overlaps with the mm subsystem.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Thanks Danilo!

Acked-by: Alice Ryhl <aliceryhl@google.com>
