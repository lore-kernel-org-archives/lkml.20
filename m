Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202861;
	b=LGSwW9hIfYEmJCopcwLi5aJes/4DeSuUxqRAcCtndAXJiHCCWkG4F2/tU7qShZ/nftgh
	 ee7pDOd5xsaHTrD7oYEGTZ0ks5PViVCq7igGM1aGLi1/HJyjKQhpLCgzR6J0vf6gKnJW4
	 W5Nyowya0HirL0kfpz5UZl0KRIIjQt6ovPSZLW/Ds05r/zIxBWufAEkdnqKvBXhaZZtWW
	 arIVz5ecs4Jz0R3z/mB/i7x2xAzEQ3YIDElwHSHPGDFJBDpz4sL3lJwt7ubhNi2WZb6ZD
	 8sbxY5mt6zhNEU+SvBNGsJFR9qnsdVhXaCwN8D/crqMLwXU9r1tsWFNPLKvgAI/lUvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202861;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gANX9w/0wruJvkwVULFIrrl4yranIWLJJeagbYk81/w=;
	b=wyLV+49OYKOQqqh5eCz4V6/ux7WJCKPZ1/tRdFosuabymIXDaHOnfDiT9NE+bMpvfxYF
	 v8VwIgvclDUW2JkHGpvcyk3XMvO7A9QAWgA2quodLTDN9U8Sk/9sVD0zRXdEo34OBnI3g
	 P3XPGgoVQHQc4DhM7Fd4pfguSj0Ng9gmBx//FLh1CCxzNMYkO1rc8M/YrkzHgk/Qp7OiO
	 Ijol3H/qr8sq9hkfOokXPnY9lOnEnXBJgKv1kfe2u7tQUZLvgKjLUR1gMFiuit/nrA2am
	 wln3zZFwG0JSDcp5IhXTEornp+uQZ1tfCJqGkEb6ridNzqhEWUq7JbBw0klDSyMHb3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CUug+QZV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EC2606A329
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CUug+QZV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 107C21F031F0
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793202861;
	bh=gANX9w/0wruJvkwVULFIrrl4yranIWLJJeagbYk81/w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CUug+QZVCctl0wiSptzHfiUvSnNJOdKbn/BOEyCFL2AyFSBZHq3uluQ1cyrQ+1k8H
	 VNJQlI0XoBnqFQ7UJjYM07XqOhv5uaHApY4WQaHdETlQEe4LFCHJXtUhhgSEv3Ff9y
	 ezz40K5db8MlennFMiimDJiul7kLrxGKWO3ICExEAa74aAh7q1Sr3QhtENnnmF0OAU
	 trAsV5LQURowif2lfe9YjsSn2W2wbDbfJWgxyz2BFdP/9i23/7CU7MN2c68hKhKQe1
	 Tzq/e60tmNQ0UdsOoAEBBrNL0BOF2H8ocxxskCd+7p/1hvziNeqJwkJTuU3l6H/ctG
	 h6K8XbXmgmh4g==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bfbc67991cso915513e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:54:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzldUSP422tDvkUttOmHvSac9ahkSEk1a2pznsY9y7UNXwydfvWHv1/B+lQ7LEYKVF98gkfaIeBI3KvwA4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLoldaJsoesFG6BzzIfP76kHutXMY0hN+tfz6GHOIb5RCRVlMFm
	ME+hQEiZYkZostg43shFC22JFzmikDdQ4WselWuL3DmX8S5YXX+GmPNWOlg1zWQN85QhG1l/Hpb
	Nobji5h+t7er9edpJpYJrZHr/X3oSz1Y=
X-Received: by 2002:a05:6512:688b:20b0:5bf:d063:608 with SMTP id
 2adb3069b0e04-5bfd06308afmr270261e87.17.1793202859544; Wed, 28 Oct 2026
 08:54:19 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027143725.3763827-1-zakbrightonknight@gmail.com>
 <001101dd6631$6167dbd0$24379370$@telus.net> <CAJZ5v0gVkYuZAh7H8KFakN+vHkJTjzvmZsLrUVP0MXkaKLVoCA@mail.gmail.com>
 <004401dd665c$97eda060$c7c8e120$@telus.net>
In-Reply-To: <004401dd665c$97eda060$c7c8e120$@telus.net>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 28 Oct 2026 16:54:07 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gvruWF7VhVuLrn4AgV9_n6Ayektrh+jB=eLY79ufw4UA@mail.gmail.com>
X-Gm-Features: AclHuK-Icinm4JvJ45RiL5mDQBZ5mfoMZRC5LyoKV_3cvcCC7oWf9BvwWeYFo_Y
Message-ID: <CAJZ5v0gvruWF7VhVuLrn4AgV9_n6Ayektrh+jB=eLY79ufw4UA@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: intel_pstate: Restore P-state request on resume
 without HWP
To: Doug Smythies <dsmythies@telus.net>
Cc: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>, Zak <zakbrightonknight@gmail.com>, 
	linux-pm@vger.kernel.org, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 10:46=E2=80=AFPM Doug Smythies <dsmythies@telus.net=
> wrote:
>
> On 2026.10.27 Rafael wrote:
> > On Tue, Oct 27, 2026 at 5:36=E2=80=AFPM Doug Smythies <dsmythies@telus.=
net> wrote:>
> >> On 2026.10.27 07:37 Zak Brighton Knight wrote:
>
> ...
>
> >> I confirm your findings and tested your proposed patch. It all worked =
fine.
> >> I had not seen Rafaels's reply about a possible race condition until n=
ow.
> >>
> >> Test computer: i5-10600K, 6 cores, 12 CPUs, HWP disabled.
> >
> > Passive or active mode?
>
> Apologies for the incomplete report.

No worries.

> Passive mode has the issue. Active mode was fine without the need for the=
 patch.

Thanks for the update.

Please check the patch I've just posted if poss.
