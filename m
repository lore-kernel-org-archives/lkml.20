Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044CA548573
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790084684; cv=none; b=JUfyVrv3IuxBjX6aBym1bhjoX5rUN80U2Bw477dIm8Gz93QaAuo+jFWo/XFdeWDgoo9g7CYPfBsCyiHgjiPpvvWd/uEnX84NGwVGcUE/aUtt0d5/lXn9+IyJFq7kpT0Avrggn8WuQzPBC+AXvbqlGEHv8fNkqwNRQe4zqo7avC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790084684; c=relaxed/simple;
	bh=0SFlIh2a1t3j3rT/bk6IJh8ffwrgGJ66xEj1bDplnm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dr+HBjsj2vmj3aayElbytouHrcUl7n2FQDJ8UJUV1lSeUlbBP8XnMKIz44RxVb6z/jby2y5b5oHVwGz1ZFSP+R1kVMrrtCQ0M7r6ZloK4Uy7VDvberFjLPQpmXwilgfMe7g6mp7/FyedK2Wu/hVMmdBTpObV/+UU3Kaa/3E37tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FG4fpRXF; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FG4fpRXF"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1ca5b0d6so31034495e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790084681; x=1790689481; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4EtP8Gib+oGUfFDioYcMAZLGT/7xIaokAymk9C8xEMA=;
        b=FG4fpRXFBPatSwHxsYfQSy0pnlWABIGE7/vTfeI5uP7FQoa6mxknWHjLYgdRO058e1
         fcgqXSB7kMUphrk21mipLbo8VZryb36WwtcH1zQKj0AMCcMUJFiV2dzC2w3yb1ODJ4hb
         kgT+cW6LvXNvOfDcofgnG2kSQpkX5XSHb9Pjxq2gCUMm0YMwuFy/QqzxDe3OHjKEZiuQ
         5fo6yOe30L2MUqtG7fjjCJtUx3oekSWTDubtoPEFnprtEIc7k/ktYBjhlwAIy956C50P
         Tks9iJsFgXFrU9SiF7t8ClxvP0wqEjeoZxv+SYAPxARsnji2dvghLBR9LHhnnT2uWNdl
         54ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790084681; x=1790689481;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4EtP8Gib+oGUfFDioYcMAZLGT/7xIaokAymk9C8xEMA=;
        b=q+WTF82EFP0FBgHG03BQqonCjvVjZF9Vb++H8m7YOMwCkveUVIWNAKCWntwdgGN7MF
         /jS3rUY7t3cNpswT9ffT9EmHx7YEoKILtuIFVEirqsOq5cME6EsjypGZh0GSgvJmVXEf
         qBMVT/6IgGg4rYkwYMkTSd2lEmkiQanNMa1KXTjEWElv87ZZBZLEjtNjZdotzh2TyVHd
         1IzvrIaePLR20BdbPq64z1sTMjJwwWWAuQGzSwRijC0gHyLuAluypa3exJMXQKHdITCj
         kpdgMvwtj6bJRi7XIp9iMoivH9b9+izekBvrLa8FYR0dfqUUvlctRKj7iwdomafyZsA2
         TQfQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxt26uAOQftUi9zB8DzhMd2kuUgspv+NvsJ/ibThStdyCT1Rrh8qzTSZ1so7KVIdQ4fYhHQnGLghFaeec=@vger.kernel.org
X-Gm-Message-State: AFuF++ljsXi+FHf7609q/R36VEEQ1jBb84kjmdtutKucGd1828yHdFkx
	0Jjif8CFIyks1udfFeDWjsTZkRH/RST0u9YHNpx0gsJ6V0YlTzE6IP504zRk1Zr/I5Q=
X-Gm-Gg: AYBFou0ts0M4GrotDz7kPOfFt1z1rroO+lBJ7B4lp6vjVbduCZsNzt7/2GrDAnWDD78
	RKRfE+OGXKXQfYAtU6wbNn02PwokvNZH1aupo294zHO7FYeEXOzZXPR9RGwMUT7XAQWdYKzbJhj
	W+DGxautA1XE+vsXZcCWVo+gz+OqKh9Z9Fzt8V8YtpMrbHs3rSxT0XgT/rZeIVyzEAeg9/XMKhF
	EXp/A2ipkQ7C5LJSqeHnsLMZQlZyVKPfuqtlcVavmSUu+vKx/jf2vbt12KEGxPTrGZ6mWK5ek4J
	IkJzRqlYAwUo7JvasdVjfTuJBUown2qE5P5dNYzT3hoaVDZ4EmBQL6Zv7wF5cgg5ZWsSxgkkgxk
	1Qh0tXTAoTRl0S//wOWoQ0VnfXGfMIAvSsxy/AABrGVbXpmauPMBu4ExaaFYch4j7qm7fLFKywX
	97F7u1RzyRYuLF1Jqz7S4yUlQ3ce5e2enLpDO7NIxy36Y2ir8+TUuYwZtb555vCT1OUkkbsoCse
	g==
X-Received: by 2002:a05:600c:474e:b0:49e:7cff:f8ca with SMTP id 5b1f17b1804b1-49fc5743c69mr189508785e9.29.1790084681055;
        Tue, 22 Sep 2026 06:44:41 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdad2a3e0sm72269425e9.5.2026.09.22.06.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 06:44:40 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:44:38 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	James Houghton <jthoughton@google.com>, Will Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>, 
	kvm@vger.kernel.org, kvmarm@lists.linux.dev, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] selftests/cgroup: Make the object directory an
 order-only prerequisite
Message-ID: <arKFe3JRF3n2h-26@localhost.localdomain>
References: <20260922071945.693714-1-fuad.tabba@linux.dev>
 <20260922071945.693714-3-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wz67vp63rqm7k2iu"
Content-Disposition: inline
In-Reply-To: <20260922071945.693714-3-fuad.tabba@linux.dev>


--wz67vp63rqm7k2iu
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/2] selftests/cgroup: Make the object directory an
 order-only prerequisite
MIME-Version: 1.0

On Tue, Sep 22, 2026 at 08:19:45AM +0100, Fuad Tabba <fuad.tabba@linux.dev>=
 wrote:
> libcgroup.mk names $(LIBCGROUP_O_DIRS) as a regular prerequisite of
> cgroup_util.o. The directory's mtime moves whenever an object is
> created or replaced in it, so an incremental KVM selftests build that
> rebuilt anything in lib/ recompiles cgroup_util.o and relinks every
> test on the following run.

I'd expect the other test would recompile stuff in lib/ but not in
cgroup/lib/, however that distinction is likely lost when $(OUTPUT) is
expanded from the included *.mk file.

> Make the directory order-only, as libvfio.mk does.

Sensible approach given that vfio.

>=20
> Fixes: 2c754a84ff16a ("cgroup: selftests: Move cgroup_util into its own l=
ibrary")
> Assisted-by: LLM
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  tools/testing/selftests/cgroup/lib/libcgroup.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Michal Koutn=FD <mkoutny@suse.com>

--wz67vp63rqm7k2iu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCarKGQhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+Ah2DgEA8Xdl3JGOJIGtK6hwQh4u
Jb+PcelMIF9Zbpm+LvcVQysA/2EdCxDp5Lq6779UZxftUj9At2iFIuFnLA5vHe4p
ZbcI
=BJVd
-----END PGP SIGNATURE-----

--wz67vp63rqm7k2iu--
