Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B213C377566
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 06:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790317907; cv=pass; b=nKHxEa4huFGm3KXZuGZNQ/yQGscEVZFn5F+VXfVAmEdEfsfSRVwE2gXgvujmjCBpjx8bkdvvWjRPIojz7AvCQxjG2M8YVYhMLlmhprbX5n9k3u7FQfil29g8HuBd50NqkZP7N94eMrHwVrL0ypQ3FaqVfK68es48YaKXjA+AdgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790317907; c=relaxed/simple;
	bh=hFhKrEvSZBpW410acqJJcTqqpIltVfjmIiS3oeslrDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FP8AxTgT60u5faxOiW4XQVWfYJmio/OLBsqRr8mPun9a9vNWsKElwq1Af8ti6s/FGseGg2fvvO5ozGIsh4na9YwKliwN7zGHrHNh5akiO85uFW0liD5szx7vuQ4umkho2zIjSNU3NkaFwPE95pI7HURUJWvHtx2wzQYsYmflID0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O3UorOf1; arc=pass smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O3UorOf1"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-33bf5a1c4d9so529687eec.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 23:31:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790317899; cv=none;
        d=google.com; s=arc-20260327;
        b=g76jTSXWUBcXeHjfWzSewHBdZYiXvKssIuZCWdKWFc+xWoJpFH45eeaIAOPT4aGAeo
         m4i+TKjKZNAZcJW8WP3eUj8stc2YIyU9B10HAiF+mRsSzUHvN6S4oLXbZ2bnN9Ri7GoX
         G3YC+2RBhI3ZzvYE73gO6HvgH8gUJcS4GKMLd5o4vjr49gpevpqNrjwJBYIcTz8kSD04
         oTPPZVBBQ/hT/IB8v4JXLH9D50d8e4Kc9PHlCgsVfsLtIolse9+JKnBCBNagUaVk4ayx
         PwPx+fJQA9TmmSJuHQsUGPZ5S0fmNI2YNN4sc9pUudr5ckiDbiSuCqA7HfeF+6YO6ZUA
         prNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5w5yxx9oXlIPFCQHU1ihbBkwH62nsll6yBXPYXhhP5Q=;
        fh=XWcB53LuVAAhHTYVZKYFKgNtlYLOgKHpj9Quo+VhnKc=;
        b=Qc9KwaFbQMZMKMaSt1CVKGhnw7Qas8yxSpRJp5+boQ04DV/aHrK9SQhyaoHUqvWOqO
         1a5eH4Pgcaf4rxy0jPoA+0DiALtNTL6YC8z0HNVvCphBJn9gMS6OQVnpds0sm0zGPVLS
         fAhkhv4ohakCFI/Qj0lgABOuzZZVXeHifWOQpkHw3OpfJiGsXTNc+BgLiUIpBILCTHZc
         AqaJv+IOKQl3ATdRHttTGuUmBp0PJmDyH/+mrfWVDYMCbJ/26+gWyv0jA1twOEtvPPvr
         iYDDuucrFUpZR+ivAYgOFNlNFdVn4jW6M4k4E6ipWFpSIlxI4uvaYeCZBCByglMO2qDS
         Eo7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790317899; x=1790922699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5w5yxx9oXlIPFCQHU1ihbBkwH62nsll6yBXPYXhhP5Q=;
        b=O3UorOf1qV5JIsqsIqmitfKsyx84ASkf1290p06d2IASL8ooh/gp9ytTZRi7eBojlB
         hUdMfuRfNMsuSlTMU4ekxduvpje/WFQ6uXygRVEz6nF5dp1S+B5sQSfHeSQIMbMJ797R
         +V3C+PGyufpBLMdmhuTO1NPm38ukbFqyog57snL/J2q7+v2Ye7UyFdfJPPnaSE0ENePa
         8VydY8L/xNvtQ2GUZwieMlqtNgLy5N737t/xV8IvaBJ9AtVTDHAa9dBVL7iSX1cRemJZ
         Em46WIeCMNi5L7ft9vaYvzkzp1/1eWWdYJ264lPkb/RsZdZL3DrEzD1HeL9rbmnLshJc
         HSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790317899; x=1790922699;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5w5yxx9oXlIPFCQHU1ihbBkwH62nsll6yBXPYXhhP5Q=;
        b=EsQPYTykBONEYysqTtxC6b0fu1wvUvYKXAVUr2VHBshxazWhYhpbMh+UG6Ypbozcmk
         J+fLy6YzY4YTY7RzsqjIgx+g+8z9xCokUQRFCsbHAN2gvj6Xe046LJhoghpIf1+tFqJM
         4o4SLxcsYKaxfQ73ciCFuSuP8Vt/duvIrTvlvx3glrViQ+NL3FJmULLI3kjtswXDpfsq
         y0/u+SjwWcL9thtI5av3dBMAfyN0dbX2hhyi7+NhFqOvBGjoDOyRjeCW3tRXukrtmW1R
         XM8NPo+hfPLUYjSFxIO8keRa5gbPVZ8lX9e8O/LW79VTYPzEPAQ/hfBV/7137BlPfUpk
         XwWw==
X-Forwarded-Encrypted: i=1; AKwUvBx+cq2SMzPT42vxfSRPpWmREtIyHQBkJRcPcCd9J4dzcA/S7+8xjC9fAFgwewZ06b5U3SkN1gEYTqIrTHs=@vger.kernel.org
X-Gm-Message-State: AFuF++nJ2mYrSQrzCBSY3NDZzJ8Hbe35l8XJmVewvNQZEhT73aFdjjW1
	W46FCv17sxOk2gfIo8yCH/0Ua65ae4Jhm51Cf62I2zWPCm7Hjs70mZN5jLxgpKqtPpVPKdAV7Fs
	4US/3wxGOPbAk1u3liskUwn/aaoDNa64=
X-Gm-Gg: AYBFou3amPLt5A8TGah4V74Z4yadX0yoWbn1Lf93TCNh+VG+tejVl/DXrG3ADy8KjE7
	6vgCOurdhvgAT50tAC0qLP0VnzsidAnu/dEwJRuG8cjsCuiIsRJk8I42ld0IiFflJzMhkBIsdA0
	BfVykPpnZ8vZdJx6O6uFSLQy9vFqW3T5s5+x7s/yfxozonkLks8tRn5WJzBL1Phn83RFC71iLjH
	NJqUa/mlNfx+rJU9HLOS3OFkWInPbyGlfSm0NhA/EDFsEreL8/k3KZvxkQ3T1XLlXN4U3WBDxWR
	vVcsiuPNpgrsCHOL1Pamrgzx0CClPB/X+D9lf7NEnzQJ0xyz6xPeQqFD
X-Received: by 2002:a05:7300:169b:b0:340:dca6:f34e with SMTP id
 5a478bee46e88-340dca6f75fmr2420984eec.40.1790317899352; Thu, 24 Sep 2026
 23:31:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921065702.93196-1-Ashish.Yadav@infineon.com>
In-Reply-To: <20260921065702.93196-1-Ashish.Yadav@infineon.com>
From: ashish yadav <ashishyadav78@gmail.com>
Date: Fri, 25 Sep 2026 12:01:28 +0530
X-Gm-Features: AclHuK-KyM2-sTWnkjehqT7295KW9AXgH1dDi83R9qL68ibmWBqVLHdfx79TEc0
Message-ID: <CAJKbuCZ1733m5UKXNwOV-3WBYNOFbgUA7QUfhAY51yskv6z-Aw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add support for Infineon Digital Multi-phase
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ashish Yadav <ashish.yadav@infineon.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

I hope you are doing well.
When you have a moment, could you please look into the patch to add
support for the XDPE1A2G7C voltage regulator?
I would highly appreciate your review, feedback, or any guidance on
next steps when your schedule allows.
Thank you very much for your time and continued support.

Best Regards,
Ashish Yadav


On Mon, Sep 21, 2026 at 12:27=E2=80=AFPM ASHISH YADAV <ashishyadav78@gmail.=
com> wrote:
>
> From: Ashish Yadav <ashish.yadav@infineon.com>
>
> Hi,
>
> These patches extend the existing driver xdpe1a2g7b with support
> of xdpe1a2g7c model.
>
> With Best Regards,
>  Ashish Yadav
>
> Ashish Yadav (2):
>   dt-bindings: trivial-devices: Add support for XDPE1A2G7C
>   hwmon:(pmbus/xdpe1a2g7b) Add support for xdpe1a2g7c controller
>
>  Documentation/devicetree/bindings/trivial-devices.yaml |  1 +
>  drivers/hwmon/pmbus/Kconfig                            |  4 ++--
>  drivers/hwmon/pmbus/xdpe1a2g7b.c                       | 10 ++++++----
>  3 files changed, 9 insertions(+), 6 deletions(-)
>
> --
> 2.39.5
>
