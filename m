Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261CF42B327
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 07:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790925842; cv=pass; b=Szwco+eHs2tEo1WybCiMApfYff+/m6vvjdceR1MYZB5zvt9avT4Nh1lipg/fQNK9nsqJWwXTTmmlZp8DyImdusWsQbMuDT6bBg1p+Ndg9G3GQHjp3I0DtMBRsglY2mnUMIOMEO4l+Qp+lSBzI38SV3kHsrWybWWbuW7Zma3mTOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790925842; c=relaxed/simple;
	bh=gMHdH4oSim886Jg3aR+R9K9dB1KrAhno1lvgyTvcx4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P3Epw1DxDF7qRLmygr7IuIXB3bU4zcz+n5E6T9kn4GVpxRm4GAfyP7SE00P9kl2EBMMQ5p11lsCVTDfwnesUvUeW/u5st80l56P1IPm2PFf5t+Wh+9p99wRgZOH0tJUW7T7oqWBrJpjKf1+hLKeom0l7aZjQ+6qX+VZHTxy7lyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hjJ6CvZF; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hjJ6CvZF"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e4e75342aso590635eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 00:23:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790925834; cv=none;
        d=google.com; s=arc-20260327;
        b=IZGZHyTohx57DEkS+WSPbVy1NZrLROGV/wBOTKGF2kG/gW9TPD6FmdMdXkEA3E3+hO
         XSj3b+t8QgtDw4zrRqPAu7fmpYLjnjwZpTHn261IGOZYOwcnSkUs0HfFl4edaOc2EM8Z
         pFE6tluxAnV3lGN2Tc8D3vcfP0S7aJDLGF0u/36sBP9Nn0dWBkOghW70ZtzZHaL/jrgo
         h5aUlbmMF9anYtWvkYJkeFYhYM2Qqq+DYg0f5HpBIp2IdoLd/67AHcOxwdQagqbyANeO
         P5Qi8sEMFwrS0E2bvIfvV67IUBuzyZ2+BAzG2rqnVXsHCj97kBX0Cr8X6NmU9lxyWlMh
         7ImA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9NxKNLanM+8Plqp7YrFfXpx/mVglpC1q1g8CPCCyRHM=;
        fh=ScOjJiMFpnSdYnaRItfqWlNq1EwHUblzk4bfwmM1zio=;
        b=aAjoe4xMtcJxfNtnNdHgAJzypU4GOeufRLaIQzGHbEEincPLXenDzlsalguS8qo7vd
         afcT9d/rv5kb4e0Eb7oP0QGR1Lk2mGEkcMt2N3+/UEv4hjH+NdeUXnJ1Km57the1QCtv
         r+hBhcj5IALUlZ/RsYWSKP1Via0FU9y0kcP/VkSUpLTQzmVbSWq9/t8nCWfwc2IQDt5l
         7XBGQyYj3aHLW7odn5eDxYl1DLb5yBhueh5o1ItCOjNIQsqpR0phaH8d3SZuIy2jlhon
         2VwEgvRHSwfCwjxezdWK5gn2ogon5IqHRQ4rVKyyj3ZU4kjTdfbcylIaCx2GMGek4dur
         IH6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790925833; x=1791530633; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9NxKNLanM+8Plqp7YrFfXpx/mVglpC1q1g8CPCCyRHM=;
        b=hjJ6CvZFMLteYkenvz+VQWDCilRxX4dnHzf4YEOlVkZwynRWITlkulTelKwv6ig5bD
         Ds/bYPjOfo+4W/RJIwTu1FxcQL+Cw9TE9H56MNfYuo1QREYt9eXfWJebL5cUjdvGGfDQ
         vIeJ85DUNf/vCGnrZT+ook4QG9nNc2t24CDW9YvmCpeUnLmEF9xS+iocEAtPK9IF7oLM
         KXLPsIrzEqMCnOkbtLap2rFGGinToAYApouMPWtnglKC6z51Dkl+41WSeY7PANh87sZK
         wpJ1MIAlBFDc4fhHMUeJ7K7qkk1q7O5E5wxePagptfEv5Iv07QRp01h9TuPnLeQYQRU7
         vB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790925834; x=1791530634;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9NxKNLanM+8Plqp7YrFfXpx/mVglpC1q1g8CPCCyRHM=;
        b=ZF96aTggkNlfCdmAgGizKal2zDRHfalPKukqB2tIntatf/tRBTkag81qDUiNCEnhCw
         Vs0xfT4IbxMXcui7iTdmLwLooBoGd6qNnmPIRpw8XjrBfYEphh7F8bKyDVq8bNvJwbp2
         4SQeoelRV+8pD8z5lH/p6O4cnS5UQWYQcNWG6Uz9axFHjCZxq4IEwLtOb2YQZiDuROff
         cgewf4d6ctnLD16GiI79vDhv6L+7jYVmKkq/9zCYKIMxkxQPjnIUdeD6NEBkuHxBQd9D
         ccaMeTlFufuNf58gcINJOgAL1RCP9Dk+8AjC1Xg4o54nt9sRJxFfhfJoF49Txuyro82E
         yLpA==
X-Forwarded-Encrypted: i=1; AKwUvBxg6WbQlU/9AAK+D4M+RecR/jzb3K/BDFYw19GqnUzWAtko3xbYKctWQtPmJJTBMcUxr+xuTlQ9uvwqoKc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLH6OGjAu7lD0oV2fiiBc31trjrXii8K8tkDRiC29cNHr2d8NZv
	2ibF8wJe4LxRHT8ifrNOiUfAdelycZFv5VANysRH2Eb0lhEapc9uXUaiVfGpfYnsHX3SL3WCD9w
	MlfkTNRwy9gFyvKTDTB0D8fSf5vzL/m8=
X-Gm-Gg: AYBFou3YxwoLDN/tsVO2MkyRVymgKgSPE0ioJNPklJw7EhuXMDtBX+LkvYSrHOCW4V/
	Ks2UyQu92clePI+WrgULXztHsJ4WQR8kiPNxlKl+f2JoF6UlQ14y3mnDlQPsZWzOCH7+WCF/aPK
	zG1uJKRmUr+7KaZcEavEUnr+BnueqQjDcIc717d8wo5+Z9xSy5jT7YYYy8RFQt9FQ3aSd3TqoeU
	zLo1FFUwdWZAAixR00RPMZMa4wTMXric8uW6VeuFK147x7kubzdVkVnYtFhZdhxnTBA6YMEhwpX
	5VNpS/nY1FAf6L47gkE3XlQqTYZ9aQyi56dCPiMulGDxMyiQLZccdiklTcbwZHmo4QTblK1x9vy
	HmKtVEMazCgd3acZZkr7elZiSSHecfqhJqz1ixT9ekucuHqtnjuNyfae8BMawM7L0X1s7XuEe3Q
	7uSkOoCq+0QK2fs1j+RKC1ToUJuk5xykXaT3mGrh9GX0n7o6bNIAI=
X-Received: by 2002:a05:7301:9a83:b0:34c:f181:85e4 with SMTP id
 5a478bee46e88-34f14ffa69cmr3405035eec.1.1790925833461; Fri, 02 Oct 2026
 00:23:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610-const-align-v2-1-ccd12f0aedb7@garyguo.net>
In-Reply-To: <20260610-const-align-v2-1-ccd12f0aedb7@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Oct 2026 09:23:41 +0200
X-Gm-Features: AclHuK9UJjTIF00IX77HZfG0i2ZSfMN7JXWcd1eIDxRPA96mgfzo5pEnXFRoENU
Message-ID: <CANiq72kB9vFf6x6KD9SX_LJqq55hENN6wxD6Ef8irUq36+MvBQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: mem: add `Align` type
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 1:51=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Rust's `repr(align())` only works with integers. Add an `Align` type so i=
t
> can also be specified via const generics.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to `rust-next` -- thanks!

    [ Adjusted the title of the new module to match the one used in patch
      "rust: mem: add `transmute` with deferred size check" (landing via
      driver-core), which is also closer to the upstream standard library
      title. - Miguel ]

Cheers,
Miguel
