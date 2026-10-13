Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8A93CA4B6
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791935936; cv=none; b=ehIBluX6DRLRj+zYAYTRBPXCViMzeVPe9WSQlZKHTEZrFHN9aELEN2U15FHItsdBj4LbrpzR5dnJGWskzFojTbNTq5VrIAGik8WATQTZbDsjIaI2kF0iS6IXjs9F0L4SV6aEHGM0y6NovdSgrUIcXx2OAnn8KiwuLyYvp/pzmTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791935936; c=relaxed/simple;
	bh=G3UadvuxpedZ6Sgp4MUxB3QiyEWnAlMw7DA3dg4ylSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tr8U/BqcPrf5akDcjuZDJmvkl7nDEBYbifcp7YRZ/dCMGogfaYSYfWr+8OJ59JRLx5QQoJln9lKo7rftHdWh7oX2yVuOysEEZsVeDw/G4vFGA+m8EyZr7wgqp4x/Q9CCK/PV+l+WmzN7Snz6Ah1mqqrFNMvUjSierc8yGKP5kSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iYEvClCM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iYEvClCM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 234601F00899
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791935935;
	bh=G3UadvuxpedZ6Sgp4MUxB3QiyEWnAlMw7DA3dg4ylSM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iYEvClCMG0yOZPockDInzIJhmb1X/vt9b1LIZ5aQ0dkb7Ccuuz8vkS2K+lxLkm6WW
	 6WTCjUmg6+fYAjw7b/aDiYBv97cPoTQoSo8Q8XtR1oOz7A8UrNVYhBhLpKMLC/NAU1
	 qI/qDD34RdZK3tGxDue2EKfkEAB9FDfxgqES0xw4R+6kxoLmsgDH6cbf1LONLUsp4k
	 1Yg1Fr5x/Ca6NlUVLc12Ak5ohDfgPYAeb2b7lK/g4TL+CoetKNYIxg6B6iH8nkKTu3
	 Z3kprvqc7oLzXrUwTHkkpLp9bpaUVI77vxsODBoFnXkN5p5j56c699s1cFjUc3L1dT
	 4OickcSBIyE5w==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bcd17f3a93so3041520e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:58:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwgCVhjXCsq9pymGp4HaBht34RUfmxmzbX5bbMcooDzKg84jAtJLBBQ467u6Sj0b8AZhZPnroMKCnrmUJM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdbVq2gOMvIR+ehKEcGHZMF5LNWMdNLSTTKdxgzZGIH7VmivQ6
	5fAS0lUACr8mJfjmvt4ee8gBZ+D3bY0c6YnIyXkhmsvKh0976JPQ2fZ1PeqdkfNAIa8om/Z9b/5
	uKoAgGwDkzkMDBYPeRVXV13oNBryZAvw=
X-Received: by 2002:a05:6512:3dab:b0:5bb:7aca:4cad with SMTP id
 2adb3069b0e04-5bcde357b84mr5362664e87.2.1791935933869; Tue, 13 Oct 2026
 16:58:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260725091452.1875627-1-ruanjinjie@huawei.com>
 <amSFfCPV2jWfhGq0@shell.armlinux.org.uk> <864b868e-04b5-4187-9b93-72d476390906@huawei.com>
 <d3554be2-7fb6-4116-a9c7-1bcea4bf3b67@huawei.com>
In-Reply-To: <d3554be2-7fb6-4116-a9c7-1bcea4bf3b67@huawei.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 14 Oct 2026 01:58:41 +0200
X-Gmail-Original-Message-ID: <CAD++jLnE9O7nDU9E=Y=1VQUAny-wvs4F_QiDNKvsTm0-4BY7Vg@mail.gmail.com>
X-Gm-Features: AclHuK9Y8ArjRQTB221BKeLMNOVgZ6pikZFIrq9p3QIbQUqS4Mc4aLsDffEo_0E
Message-ID: <CAD++jLnE9O7nDU9E=Y=1VQUAny-wvs4F_QiDNKvsTm0-4BY7Vg@mail.gmail.com>
Subject: Re: [PATCH] ARM: ptrace: keep ARM_ORIG_r0 consistent with ARM_r0
 after ptrace writes
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Russell King <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>, oleg@redhat.com, 
	wade_farnsworth@mentor.com, will@kernel.org, stevenrwalter@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 4:14=E2=80=AFAM Jinjie Ruan <ruanjinjie@huawei.com> =
wrote:

> Is there any new thoughts or opinions? Any feedback or suggestions would
> be greatly appreciated.

I think your long explanation holds, please extend the commit message
with the elaborate explanation, resend and put it in Russell's
patch tracker for consideration.

Yours,
Linus Walleij
