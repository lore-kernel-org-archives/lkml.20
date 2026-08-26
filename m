Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F09744238D
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787753403; cv=pass; b=iU7/CF/thHC7phA5GXHKVV0o5yFQWyxo2lS/MkmHn3ZjgZzBYqi++3OAaqqYqGvbClEYFMTX7Ea5NVTwJymMDDemY+ZuMbfmSzilEFPgT6o4VZZT1MWZ2EmJ0ye2ETftXvI/9NeaUuYLKoBx2xeqDCATrsW2hnVYrWiga9fCyog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787753403; c=relaxed/simple;
	bh=vNabcFVQbSYbIKL2cVYsp6TxHVTpkQci7HKCA5Lwa8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o8Hu2kMwyC3gSS/p6IJz7D7x7+s2z6OPUu44mbmogomlJdt2qVH7THNVT9jHPWlpeUlAR2RUmKlem1a400HeHDLOw1Cz+mfIPW8PQ8zGqmam5Ny4ivl9ChSW63IxB9k05RRAqLzzUg4TAxdshH/LPYe6bMl+cOMLDFOacuzVsdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=asZZWodO; arc=pass smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="asZZWodO"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7e9ef0c26ddso80886a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 07:09:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787753397; cv=none;
        d=google.com; s=arc-20260327;
        b=b8lEz32c2fbAWsa+ArRhzeaui+8aRUbn45wcXkBv65C7lBw6MUQ1QQB66Mes7jR6eo
         32NfMj/wl4PPiOY+112hF35/9h0sQnhmLO81BNcUHKYBw43gckqwlvbOXcZ0y7vDtfPW
         fsru/g2KI9+3UK7N8kXuBHpzJsrBZdh/Na9tlBpmQ+K/CNQ7i4Juw8oYimdlY4NKdmbL
         SeAuiAKq0In39uyjTeDwzLqyym4YNoXB2NFDZr4m7eQ0/5miG9JozfaXSoZv/sz2Qt1g
         MXBHiiCcLMch+7CFy6akHZISYNfhqBjR14MxHkAZDdW6QeBGPZzO3I68EtzcWt1LinFT
         BLBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vNabcFVQbSYbIKL2cVYsp6TxHVTpkQci7HKCA5Lwa8c=;
        fh=qRTp0w8QoTo9Ut6sscJLV1/xroxs4YIa8va0K6Zb82c=;
        b=PImahYqi7BDLIg+yyFWm2x9It1p56CZXBlEpGmmby2CrTv9j01B5PV8+3arZMbq5NK
         S2J/wQMtDT1XSotHf6qdqqmn4MXuDB37eMGqy7T07bujdOcMgwDlpxhiHWt/EtU26LSn
         /DrRYo948mz+DJav1g13LIV1pY0vwFHME0XKG5ghDFZY1X9Kht4JC7LEZHAb3eJTh5kF
         rU03rU3DkreP2jBXPpnOGa2YHabUYdWODgh6M98CGKqZgQxb7PuocfLYY9OfiZwG0sQZ
         ljSkZ2GNdW9bPKEy7U6oMsDp7p82r65uosbhewacdih7lxGoqdKELMDYQF7XJyl78LRk
         Licg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787753397; x=1788358197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vNabcFVQbSYbIKL2cVYsp6TxHVTpkQci7HKCA5Lwa8c=;
        b=asZZWodOE5fYVzvlMZNhtDMVa3aCEXFQuoEWxejOeoU8A3TN/pIWBeMW7afixWwHPx
         FBIRtVg2knR3Hbvu5rZ8xIo0+4xX8BmIJMgVsnTqSTqexxWw026r2QcBWJM2npXyi8LS
         TWQDji6dAAWjxBjc6YGhGfVdHQpmMir8D6h4FibmKPuJUodjstRAvcriVym71NbCYFrR
         hQ2XiVH/Mh0LkVMVTiXkk2+9Gcki91gMEdAwfW2ScMUsx7pMqMDjdPga0Z7QJxLWrj8Q
         TikfsQ99sg86424aZ+8u46dm0S+ugzkO/Z7JK953VGsP8xARA9ruLUCgMh+2HqFWwjbq
         iW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787753397; x=1788358197;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vNabcFVQbSYbIKL2cVYsp6TxHVTpkQci7HKCA5Lwa8c=;
        b=dh0HsJe6vGPccuXUHazpm8I/VNFrqXKA5fwBIaojDPDq+zhTHwN40A5kuQPd0Wb2ig
         XqwnjcrrEXh4ynw2ezGRrSUoGiffXCskvcRm7CWs8t49XsEhMnp6Kc3fdko6zN//y67T
         7W/b3d/cIBPsAwMAHKCozHGndDT0igcnySIc1zmN8KqTW442l7GFT8Q+VPxH8iyE0xYd
         s7N7QqcP+6m1hnIxiiyb8PF/N5jcRwIifn3dZYfriuLZ5HVpR3W3zNVonFXDBLzR59Za
         0tnJBQYkX2D08bjHwSXcAD9dTkMhFR+mfgfizbGm7vFgFiKsdm43U+P8TgsusgXGf17i
         GaUg==
X-Forwarded-Encrypted: i=1; AHgh+RpQX8pQ9RMaLiAFsPgzS1Wiu+OxNOa3ZvxkXPbzHyLKnvkmoWcmfvS8gt0zdeotUegYlQR8EoJlpEJcwyg=@vger.kernel.org
X-Gm-Message-State: AFuF++li5E/V/TDuu6pX15nJPWMgRrqxpwpOrGQt5fk/sRbgTCR2ErvG
	srll8JQFaM/Yvi5mfokrWsASoinl3r+U3zqp0E3zOxaZEIoPTwuc+xksdufDySoUhHFMh1/PRNe
	L5HFb3KQkyyl44HDZqKuooAzlWYfEZDk=
X-Gm-Gg: AR+sD12Dx5RY86tIJ/pxgPX91jLSXQZAgTCP+GGXya0ebEpp4ZOyJ4dLUJiVy4S09kE
	vDVQXb/ViLLf/7x9RCgCaUt6sEx2zpRCszVOkJGduy5STrEg9og79KbGZe55wIA+tQu8MQOXMrw
	J/Q4mMHanflJ2qGiWcDGasYvFdXMSJZO5dvxBOFP0wC4SgHWkALJzfX6a11ngv+4lVFld00IIJs
	IdZElAMqPAEgeFWWaVs0vn+O3XJJIcVH3ey+H66zn/e0kXHRKqdU8Yp9EOBoQDR6ykSgK9TfTEv
	gdmovtJaaUdBlXignz4RAv21IYiSHrw9SZbxHk8XiW7Ns88jmarU0KLLRRcaHbdgORiWRiEX7e7
	PpEIwXYGubh7Jp2AX1cCSaF4+8my8/si5Vx51RD6I9DhoHr6rGxzW4yjzTvFY
X-Received: by 2002:a05:6820:4206:b0:6b1:95fb:7d3 with SMTP id
 006d021491bc7-6b1a01f7ff9mr2702848eaf.0.1787753396788; Wed, 26 Aug 2026
 07:09:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818084633.1673214-1-zhiw@nvidia.com> <20260818084633.1673214-2-zhiw@nvidia.com>
 <DKYU6ELNN060.154BHE2QG442C@nvidia.com> <DKYUBX3TU66J.1P5UZ908CCKBX@kernel.org>
 <CANiq72m3pGr+sywbZ=woVnpbHW616VN2sG+RKYZWbWHAehRvvA@mail.gmail.com> <DKYWYZPPYZNU.32R4UV9WLNZ60@kernel.org>
In-Reply-To: <DKYWYZPPYZNU.32R4UV9WLNZ60@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 26 Aug 2026 16:09:41 +0200
X-Gm-Features: AcwNN1UJDnIsDK3s-Xz74AoPxa-_z4dXNrN8ZtRzT0xk3LN05nkWqoC5E2b1vr8
Message-ID: <CANiq72k+-fNWZCwGuQ=FTchxgm-X-f6WR=tG=Ercn19ic1edQg@mail.gmail.com>
Subject: Re: [PATCH v8 1/1] rust: pci: add extended capability and SR-IOV support
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, aliceryhl@google.com, 
	bhelgaas@google.com, kwilczynski@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	markus.probst@posteo.de, cjia@nvidia.com, smitra@nvidia.com, 
	ankita@nvidia.com, aniketa@nvidia.com, kwankhede@nvidia.com, 
	targupta@nvidia.com, kjaju@nvidia.com, alkumar@nvidia.com, 
	joelagnelf@nvidia.com, jhubbard@nvidia.com, zhiwang@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, work@onurozkan.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 3:36=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Sure, that works as well. But in that case I think I'd rather have the re=
gular
> as-cast intermediately (unless your idea is to go for the full three cycl=
e dance
> of "introduce new API, convert users, remove old API").

I meant adding the new interface now instead of replacing; and then
later migrating. 2 cycles should be enough, since we don't really have
users.

Cheers,
Miguel
