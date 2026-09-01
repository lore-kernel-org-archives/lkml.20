Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8902F3D3D11
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788273567; cv=pass; b=n72m5Arpf3cPFge/mnWjaf5Sw0hBctDnqdDyjDikgaduMKpz9lKQTbM9DjInhOkGfZVHvLgxx1ri/ew/rwJrt4w/aJ41Mijd8Ybr73txMz8PViNFymChXWVLyCJbXx+V7htnra66ZcBI6aW3Kss5b682yzhFt9JZ/7cCtMekhVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788273567; c=relaxed/simple;
	bh=ezB1u13ZiW2aWn0+EIDTWrRL1Wtrd/zkMqdzWSmMzUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uRFj6JrmYizOKlyMhKJ+QhRhne1Q61ELMp7Y30+xiAZbAqlz0hfONGTivZencdc5mqPiSoLSZy6lvdocrPFV4WhCGH9EtT4PJbGck3cFTKnZJGBgecokG56COS2yYTG/1mgMx8jpX9a+f+BzxoqJy/aShhkPaiY83uQKI9k5LfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XJtt3x2i; arc=pass smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XJtt3x2i"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3a305310ddaso39302361fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:39:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788273563; cv=none;
        d=google.com; s=arc-20260327;
        b=QdFYrnh0jxNlKmTaG5/QM1ly6+wfKRaQE+Lfow4KzdgbfrGDDgEMEm+Buqg7BSX+Dk
         mnsn9K8kfrwJNAoidCcy9UJxpLvOZCeKxk+ot5vlZmMOT+BSnzbcrWafyPucazbCd+Yt
         xLunQLUPEjwzQmxwT+0EixZ0lCkCwXRraM4rP1m7YfUnYLwhv7kYSvw074yGsExal7Ag
         1yAR/xVphc1Wd9u2ZzbLbUlBHjfZohceeMdqTp4Vsoig9/5kLXHNFvJJdKFv/7+DpS+l
         Gle5d1TFn7HUXZU2GiYRTk+ktuf6t11WwDfPgC2QumsiJGpI8gxjuC5GKxF38dguBdW/
         wFkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4zXL6SZO7LbfgCv91B19FUnmIBBFOrbIlFHnTQGchwQ=;
        fh=0w5mna54IwGprKOzpO9S7hQ1YunjdXLvFGk5cNfCH+k=;
        b=kpcM+XJLdCjgYm7E+Md+/bR3GaZT7QWQsaa4YMPVdsW29zsmfA3ZjguUEIHSD03d9c
         YBsO2p2zILu9YCtZAfZGRsnECR2YCNtziVnqBmQdt8+CjPv668rS7HwiOi/LACtEhhdq
         nFpK5yeDLKo0dJsCNwnjtyASxOhR0k697MwOz2ZBXhzsoDaoLA2Ja0yDAf6Z0BuS7BgI
         NDiw8ZRROqFxCc3b0E1Kt8bM5VKS/qH/P91rQTRN1YHIDxzWO5EhDa3pLb4/73iNqhwm
         nx3frSAIAd+QiVsD9O7J3dZEdgmgCSZA+tQbSr99FJC+4aQg3SAGG1itwVzjDX0EiuQq
         Nmew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788273563; x=1788878363; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4zXL6SZO7LbfgCv91B19FUnmIBBFOrbIlFHnTQGchwQ=;
        b=XJtt3x2iPSreqz/DeEMb3BZTiUTaSlYYV8BR7ylWi6OItGGYLVexHvdAKFsIGbj+ms
         xRYZhgxhEtu8PuKR8cWElI1IBlXWLMdo3baBjJaTQSQ4KicTLCO4/A8vR3btW4cWH+ks
         vQ1YKEcI+NjrPDxcdeedPTqizQEqDxabnhnmT/6BibD99ULm0uqMtEubLWkqBDEgRut4
         XRvKjiDqQKKjxLXTG7f07GFkrYqn1taWY00kGq12aZmQPN0Z3OGFezAbx5hENMajNXVw
         HDEATuekEhdHMoetDpaRRoJcP9e13gAsI81cWgu1HgyF5iS8nhZHcU4vNhNlyuFWDLbt
         RzCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788273563; x=1788878363;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4zXL6SZO7LbfgCv91B19FUnmIBBFOrbIlFHnTQGchwQ=;
        b=WueXeQjYlorFSfHG5XYdNpbrcx1QZ7Zp7AFfqwHHntzkXquEv4hG4JqVJFK0zCx9jO
         0Uy6X5+tEI/BgVfLbjVRYXa5NcQz0Ertbpfq9Pob8PjZZ0nMq4+4tcAzIGoKwTo1z61I
         6Xs0G3Fr0jjg/PBfKNgT2+bDgydToy8SmER4VrYPDT0pQSjelZFcuWww/5FkusWP8Fng
         OwUy3AXp3RnK6y1bjRfl9hZy+ScfvDPmm6B6keuyEAkJPC9tPzfAl23BxrNn7uqTmT9a
         oGyT/XqMNQ7pFRGD0J54ZfSOrvw9WUpNn8MJ8Z8ywEMWRbOhJbIpfapCOxK85nxcRdiJ
         O29A==
X-Gm-Message-State: AFuF++l1tjZd1qDZpo21h5LMUzfvdOqlpmAmOEn9pFAg8eTmsPHvV6Xj
	XRFuq4p4wyR2ViNI8Hhy+JgU16TuY12M74Ui3E+3NHwdjMcQsJ1dQkpjpdz8XJ4AVkxZRN/iB4Z
	FDu/KfdHAiG/B2afV1KvQATqAmEXd8nWEIv63FllfeGjBe+3PnO4hPkQ=
X-Gm-Gg: AYBFou3qRMXiUjkxEq62v6hkKRgrF998tEc56gyuDWiNl+TeunodzY3gl2lDAEsbBQc
	psvVG3enLrB5pA2TOHX1qLi/q0sM2fp/AfOcZTXgHJeAsZbeVys3JDHeZLVRRMAMFm5SMq20mcL
	MHY4t/k5tRl04AV11y/IHuDMqugUiLXIQQ1OLrSqdQnZRd9RTfZcm2RbxvPcbRnimnXKF7MelgI
	FM0+4D8kMjfCxYPhHasPSaAH4qboH2B339FpIKpTbT/NCguB1YPk9qswVmrtN5GlmlFDAWEqAy+
	TEb/I1qUMPHfJwA5uykHZodjwJg+A0FTzmHJ5b7o3D4ASL4fbpGrh5gEpeljAIRA6u0/566uq4f
	adg==
X-Received: by 2002:a05:651c:a0a:b0:3a3:405f:9668 with SMTP id
 38308e7fff4ca-3a3405f992cmr12000371fa.8.1788273562981; Tue, 01 Sep 2026
 07:39:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831092118.124576-1-marco.crivellari@suse.com>
 <20260831092118.124576-2-marco.crivellari@suse.com> <20260831110721.2o3u-edi@linutronix.de>
In-Reply-To: <20260831110721.2o3u-edi@linutronix.de>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 1 Sep 2026 16:39:11 +0200
X-Gm-Features: AcwNN1XdNVMYFOSZMjCDjBBbWQv689CK9XwNG1dJn9Z6nd_mz_4j8iFMayB1rmg
Message-ID: <CAAofZF4+es1uS=9wOEnrXZ54qhR9C6aHZxwXGLS65ZTzy3=00Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] doc: Replace dunticks-testing ocurrences with cpunoise
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Michal Hocko <mhocko@suse.com>, 
	Valentin Schneider <vschneid@redhat.com>, Waiman Long <longman@redhat.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 1:07=E2=80=AFPM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>  [...]
> > -- dynticks-testing does something similar to rtla-osnoise but in users=
pace. It is available
> > -  at git://git.kernel.org/pub/scm/linux/kernel/git/frederic/dynticks-t=
esting.git
> > +- cpunoise does something similar to rtla-osnoise but in userspace. It=
 is available
> > +  at git://git.kernel.org/pub/scm/linux/kernel/git/frederic/cpunoise.g=
it
>
> We usually do https:// here ;)
>
> Sebastian

I will fix it, thanks! :-)

--

Marco Crivellari

SUSE Labs
