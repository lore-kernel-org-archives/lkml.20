Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389EF47044C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984527; cv=none; b=P3r6K2z7fSHZiCEAuKt6Jn4FX7MPECSodJ5Nr1FnC4o56MB+1zt4oudd6LV5MWPhcp3VjQUklwQCYDuQcS/7Wh+Sbd3GqYwPcV0jQcO2xN3FLLcyPzGH8BqE+8bcXERo28zjbaQJpMsNAfVnNRfgL90bN5GejDeKlVPVXCl10t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984527; c=relaxed/simple;
	bh=uJyNkQhn4tJamgvNk2KKxgs4znJUgdgO/5IJHFSdLj0=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dcY6wXzRR73SjxsE2BJ1K06V2CEPWWm2FgM8JKJCWGQOYZR6sFvEiuKvLCVdiEiAekuuWXhpjlLQ1tibBMK5kLtluwGsKvH7QfoDlhcVeIevU3xvABClN4VTqjuKyrzplVDDpU/B6lBOjJjRO05/O9Np+9xHezh9O+Bcnv8o05A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SgkHC+n2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SgkHC+n2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 093A91F0089C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789984526;
	bh=uJyNkQhn4tJamgvNk2KKxgs4znJUgdgO/5IJHFSdLj0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=SgkHC+n2FUyYXxe2gG87EmAlH3C2uAYXDUS0XWzQha8mA81TdE8KZ29+iNjQorbYZ
	 OO/UML5qhcpx9R1KLRVHMK2/ZftMP19u80iY7fbomfu4gLqG4apFV57nT1x7KSIHeA
	 H8DUjDYM8XNnOQzTF1zkWJ+M/UZtd+wqG34cyBefOvyYKaOsiIKEmTPxP7VhAnuXXM
	 f096I3Z1fPk4hP4S+hZ3Xky8LkVqQkHnk3EkIUbDB82rTH7aKTKc0+vOVA6LODj4Vg
	 C5VaEdD9QCmGCGQASxxeD4YISAZ02d5kcf/qxhR6EXKav0JtMjb7abShQSE63z3FuC
	 CjWbBnCLULYdg==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff00b8d8so21834501fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:55:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByrDN3+6L1F5pvV3HHOhCgecSe2Sw5uWblD66CEyZ1UkbIME5GCkrukzUVKnxsZaTEPjqvaZc7ooudWaIM=@vger.kernel.org
X-Gm-Message-State: AFuF++lQU+cCzEQAva2NYc67usXeoZOPxVfkImgKlO4PCbzLSnywnrCF
	i/kDLyHKMB9HJOtp0M/Y3tSSygFcWETlJBHGc+j1PD6c87+pPNgZWbG8uXlrRAk7LP5PTSoutdg
	5CWd69a1GxBI33s+DpXUDin3Va0a+NLS5xcIY/A1tsg==
X-Received: by 2002:a05:6512:2506:b0:5b6:1a7c:fd81 with SMTP id
 2adb3069b0e04-5b8c1955fa1mr3046002e87.39.1789984524630; Mon, 21 Sep 2026
 02:55:24 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 05:55:22 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 05:55:22 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <aq1OLkLiIL58V8aK@QCOM-aGQu4IUr3Y>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915014447.282121-1-shengchao.guo@oss.qualcomm.com>
 <20260915014447.282121-2-shengchao.guo@oss.qualcomm.com> <CAMRc=McgPQe0x3bWYArqoyprh1ZF9owf3Etop1hqMt67nBXgnA@mail.gmail.com>
 <aq1OLkLiIL58V8aK@QCOM-aGQu4IUr3Y>
Date: Mon, 21 Sep 2026 05:55:22 -0400
X-Gmail-Original-Message-ID: <CAMRc=MfJJb7gv-+ZQB4nRWVXrR9WYA7nSChuQm2653AvZvhwOg@mail.gmail.com>
X-Gm-Features: AcwNN1Uqvhd_siw1NE1E8ubYU-CZ0buJEhBdNNqGGcUsrVMhanvGmB1cDGLuXQw
Message-ID: <CAMRc=MfJJb7gv-+ZQB4nRWVXrR9WYA7nSChuQm2653AvZvhwOg@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: shared-proxy: track direction instead of
 reading it back
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Yu Zhang <yu.zhang@oss.qualcomm.com>, 
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 18 Sep 2026 16:43:58 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> On Wed, Sep 16, 2026 at 04:00:01AM -0500, Bartosz Golaszewski wrote:
>>
>> I think sashiko is correct about the GPIOD_ASIS use-case.
>
> I didn't receive any comments from sashiko. Could you point me to it?
>

Here: https://sashiko.dev/#/patchset/20260915014447.282121-1-shengchao.guo%40oss.qualcomm.com?part=1

Bart
