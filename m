Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793983859E2
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788532683; cv=none; b=t+9GXZzjW15KwcWNlFjZw9RGKK2wlsG6m0r8F3neWV8JJD6eYFTet6m5G9vZbsmC+o+TZDvzCybGO5h6wd6trWEIPG3ny2uj3yL34t4dDXBdXPg73tQ1PgOI9l3180uI1tq554bZyL1yNWZ+9gMz56sWC8EFKWdnL1tjeXnXoBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788532683; c=relaxed/simple;
	bh=VIKMGOABbmGORlaALDqzUfvqMWhZh9adDdBOyKk2I7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hcXeXuZkcf4k0PjvaMFGzyCSJANM7OHgwu09xqWmgq5ff3/wtWbHoefULBiMziRxpbY6ARUql+VhNj1yJXv+LxxYmQFr0swWBOCNzgLJp7QCsy24n/yEQh+Vjiu01nx+8UNK0sl7CXVKqOWAilnLx8Z2Gbc6b8GEyLovWZXfJOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N6NTM0Lu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N6NTM0Lu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE0621F00ACA
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788532682;
	bh=Q7BGRg8LCxGXSnhUr8e0NA7RBh6XartT5oLwBHQ7kS4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=N6NTM0Lus4vWw1IASnLW+FZQUBEAYP3MRabFRRouNclKK9BkiSLYALsZuOWtmFIWx
	 f/QIopiwpcGc9P8YF+a3GfT8ec+JMKCxjIKY8ngf1ok7QOfXObVBg1kZ8KRuQb8EzB
	 xlX2mo43dHF+LcyLDS5CApdEkKGNgdKi0fhwZa7qA1J3MkPhgRUxfdfe4gXeVBxANx
	 ELAHT/2HsQ6huxpzOi5LrjeEolSj6jeW4tItlQaCR1aJNO5mPoFJgFuP6qBM370nAd
	 V/AA+5Vt8azcXm4MFQrvp7sznfE4sYWZ45nRrWIggLUG7N3WIr32mclWBUm7vrIFS7
	 c1Vd5gbca0l6w==
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5bf9506704fso495727e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:38:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwJc0AHXfuRuJfwjlU1JZJjrfblt6kdyRttayofA8xtMW1A5/1Zod1iFKrUFUypLYRrr61HsEa3hn8LmoI=@vger.kernel.org
X-Gm-Message-State: AFuF++mRxkcpRK6DkI1d/X/lLOf2+yMydg/3w+p1G0NqWNA3AGd0U3td
	E6KLVH2lPDsRtotw02YXGmgEBgcR97xty1Q+f7MqkTKZnywlpbzo/iRXAbpVQ3XhRn98dOX4tSv
	NERdfrRWVIjrErwnTqM7Fd2JeP9dSkGA=
X-Received: by 2002:a05:6122:e189:b0:5c7:a9ee:dcfb with SMTP id
 71dfb90a1353d-5c7ed3d6e40mr2833424e0c.5.1788532681171; Fri, 04 Sep 2026
 07:38:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819174122.1184364-1-sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20260819174122.1184364-1-sathyanarayanan.kuppuswamy@linux.intel.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 4 Sep 2026 16:36:58 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gdO41izSghgyCY_-kfMPWz0MyZxzA-Y_F8DMypBc26qQ@mail.gmail.com>
X-Gm-Features: AcwNN1UKLpohgs8WM7lD-jdP4W-3Phfu0YSWy464nrPfyEpJuOf_2vntJEnnCN0
Message-ID: <CAJZ5v0gdO41izSghgyCY_-kfMPWz0MyZxzA-Y_F8DMypBc26qQ@mail.gmail.com>
Subject: Re: [PATCH v1] thermal: intel: intel_tcc_cooling: Add rugged Panther
 Lake support
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Lukasz Luba <lukasz.luba@arm.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Zhang Rui <rui.zhang@intel.com>, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 7:41=E2=80=AFPM Kuppuswamy Sathyanarayanan
<sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
>
> From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
>
> Add TCC cooling support to rugged Panther Lake.
>
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> ---
>  drivers/thermal/intel/intel_tcc_cooling.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/thermal/intel/intel_tcc_cooling.c b/drivers/thermal/=
intel/intel_tcc_cooling.c
> index 52ea4f7fc9f9..75f6fbec2530 100644
> --- a/drivers/thermal/intel/intel_tcc_cooling.c
> +++ b/drivers/thermal/intel/intel_tcc_cooling.c
> @@ -69,6 +69,7 @@ static const struct x86_cpu_id tcc_ids[] __initconst =
=3D {
>         X86_MATCH_VFM(INTEL_ARROWLAKE_U, NULL),
>         X86_MATCH_VFM(INTEL_ARROWLAKE_H, NULL),
>         X86_MATCH_VFM(INTEL_PANTHERLAKE_L, NULL),
> +       X86_MATCH_VFM(INTEL_PANTHERLAKE_R, NULL),
>         X86_MATCH_VFM(INTEL_WILDCATLAKE_L, NULL),
>         X86_MATCH_VFM(INTEL_NOVALAKE, NULL),
>         X86_MATCH_VFM(INTEL_NOVALAKE_L, NULL),
> --

Applied as 7.4 material, thanks!
