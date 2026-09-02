Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40649369D6F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 18:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788374856; cv=none; b=ZxYpDHh1BAnIthP3pwi0J9MSbwWkkwwnFD+fJYw8RO9gQDnO9qSidQpkFAl9X/w9ie37N+9Y8G3C+C44zOE4suLhy2+kTeIFMSDnRKjwbdGN5TfmHgJDpaYGbYx0iMTdcQejY5Gfh39tU87orRRmisdyL1a3FlUiwiL6rEFC89A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788374856; c=relaxed/simple;
	bh=EKFYkxW33JQakAeWcdMhEomjNk4xgLKTRBDk38OiwiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xi+wKomp0eLXQacXQtqai31tBsiIMpbJKo8BDnGHynLSgCue4h6CZiMVcurfx86m4ndfr5Lu8pwhpVq87R5lvqbBk7bBPucG0F0eGR+GY6xcPkVmG1PYW4SqBGHeiKSjKTN3SIjdx3S9/nrkM6G1EeneS/3qaUSjYNKI0CKvxFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AFCKenhk; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AFCKenhk"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so10800465e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 11:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788374852; x=1788979652; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IdCJ7DhUlcSYo5R128c9LaTPAZTDWZg8qrvo1ipn3/A=;
        b=AFCKenhkUuhZMDVClNVR+mQwMovkD+fOyQIeToFLjgXHkw/v7jaixe2GYZImeCFR1t
         eDK4cy8eSbh+sDwcN8anJfAzgbHqW6HrL+g6c2nnpbM33ZzdI39Rj29CbnSdNT9Hfre6
         aQeeWG7044G8sdWLTABpZ7gVZIlkQxj9Ml+b5tQKU+/523OUVhX/4eqqiEOZMDeznApp
         N6PrPVitkLZqhh7i9XHdEQ3eAKOcD7gB1Nn373NEctcyY3zHBeanuawi0C8S1yiz2l0c
         tH/MGNqbM7YVqmXF8lOQVNrQOP7TKqDwWk4p6sGzel4Rnt//CsZoa2ZS9KPK2Vts/31I
         v0Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788374852; x=1788979652;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IdCJ7DhUlcSYo5R128c9LaTPAZTDWZg8qrvo1ipn3/A=;
        b=sQkB0c8p4fomZfI00SJECND4mN7rmgg+tDNxb5LENrqrojWAXEWOq/AMscM2bqIzM6
         od+nhYM5Epv3jGgCU50tsnsBYaRUVARQlO/btHVD6ZqjFmeUkadGzOoYJEYNSjHXXKnA
         5bRIwmvlLMaVy0n8Np6S024ohZTQbOPh++MK+EmcdxwX1E6DLB85ft/Klf7SbDehewWg
         7UXda713RGZABcgKUJ/dLtPhtkdWk/ZNa2uGcg0Z4ExVmvZHexQuAiqpmLwp7fcMSJcm
         aFhOdqvA9Hu7rxcaONLdmV9V14wywwv4I7BY2mKJOp6Em6OuZLA6z6LOnJCnevbMmRzf
         cWnA==
X-Forwarded-Encrypted: i=1; AKwUvBzg0MiyXX9HZv8uAlF+EWq1v+TD9Ur45fieoyqWyx23qKhWoA/vyVfWoBSFBfS38HjAZDWslxDOLPzYXVI=@vger.kernel.org
X-Gm-Message-State: AFuF++lHeYdTCvNeMMIZ3sngJ5EBx5aP760y/co1W6UGzTVbRk4pxpFG
	2W88Ana/KGHPSE8O6VF7rox1KJp3AQmLRJfURcWwkh+VoZM7gCLx8f6hyCa/YgjO1jY=
X-Gm-Gg: AYBFou1eW5i+q4aO1jWhpakVIVcvHXtVSm1cJ5PnE2+NAz6DPIDTrBOuCkvItrSPIuj
	wqk9aneJIzWKzEoeNyK+xVDSo9jr1oL4LomgAybbmG+N1sXsY6oQcUgmNwg/tSkMqm58aT+V+/S
	HnI6HC6nSvo06E3NSOIn0SgBW/zIVDcmBlgOR4zDndfpZzBwGp1aI4W5+jg+VupwSbg7WgQJoIp
	oC7vyqDeqHTGsT/SIOxDPnaGAX5wRgK8xruIwzLzl1Hsoo18JaMVtU4PeEaL01bzZdLPMS78cAR
	gTeKNMqy6PhCJUuVKe4OtJN++z+WvrbnoRBgXEDBbosj7dx0XOHXGWb36QRGij3OMTh6bpOjzc2
	CH0fU5JOYW7dZtv1I/fSAF7SXA0f8HqwtUf+s7xpdrBFRFwwpWcKzmSOkDDKWVARCZjAlLBAD/I
	vxo+6+HhqzUaQZMf8BHBLkvGrrjf7DVvCtFkJfcIVnUjt7JVWMG7Hl/33LiukVeGkDjTUnu0zfS
	A==
X-Received: by 2002:a05:600c:3b25:b0:49c:cfae:34d2 with SMTP id 5b1f17b1804b1-49ce55fb5f7mr127189595e9.4.1788374852065;
        Wed, 02 Sep 2026 11:47:32 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d2019sm11290985e9.2.2026.09.02.11.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 11:47:31 -0700 (PDT)
Date: Wed, 2 Sep 2026 20:47:29 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Tao Cui <cui.tao@linux.dev>
Cc: Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Ziyang Men <ziyang.meme@gmail.com>, 
	Tao Cui <cuitao@kylinos.cn>
Subject: Re: [PATCH v5] selftests/cgroup: add PSI pressure trigger and
 validation tests
Message-ID: <aphkAGKpg3dgFc6c@localhost.localdomain>
References: <20260902040725.877155-1-cui.tao@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k7dsd4vdmhwtmf2v"
Content-Disposition: inline
In-Reply-To: <20260902040725.877155-1-cui.tao@linux.dev>


--k7dsd4vdmhwtmf2v
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v5] selftests/cgroup: add PSI pressure trigger and
 validation tests
MIME-Version: 1.0

Hello Tao.

On Wed, Sep 02, 2026 at 12:07:25PM +0800, Tao Cui <cui.tao@linux.dev> wrote:
> +/* PSI triggers are written with a trailing NUL the kernel parser expects. */
> +static ssize_t write_trigger(int fd, const char *trigger)
> +{
> +	return write(fd, trigger, strlen(trigger) + 1);
> +}

Hyrum's law. It all works for me: NUL, \n or just write(2) the exact
length of the string.
For conventionality, I'd prefer the simple literals and plain strlen() +
0. (I reckon cg_write() cannot be used because of FD access.)

> +
> +static int pressure_open(const char *resource)
> +{
> +	char path[PATH_MAX];
> +	int fd;
> +
> +	snprintf(path, sizeof(path), "/proc/pressure/%s", resource);
> +	fd = open(path, O_RDWR);
> +	if (fd < 0)
> +		ksft_perror(path);

This outputs:
| # /proc/pressure/irq: No such file or directory (2)
| #      SKIP      /proc/pressure/irq unavailable

I.e. similar message is printed twice.
Since strace is a companion of cgroup selftests, I'd keep this helper
silent.

> +	return fd;
> +}
> +
> +FIXTURE(psi)
> +{
> +	char root[PATH_MAX];
> +	char *cg;
> +};
> +
> +FIXTURE_SETUP(psi)
> +{
> +	int psi_fd;
> +
> +	if (cg_find_unified_root(self->root, sizeof(self->root), NULL))
> +		SKIP(return, "cgroup v2 isn't mounted");
> +
> +	/* PSI must be enabled (CONFIG_PSI=y, not disabled on the cmdline). */
> +	psi_fd = open("/proc/pressure/memory", O_RDONLY);
> +	if (psi_fd < 0)
> +		SKIP(return, "PSI unavailable (CONFIG_PSI=n or psi=0)");
> +	close(psi_fd);
> +
> +	self->cg = cg_name(self->root, "psi_trigger_test");
> +	if (!self->cg)
> +		SKIP(return, "failed to allocate cgroup name");
> +	if (cg_create(self->cg))
> +		SKIP(return, "failed to create cgroup: %s", strerror(errno));

Why are these two SKIPs (not failures)?

> +TEST_F(psi, cgroup_trigger_fire)
> +{
> +	char *cpupress;
> +	struct pollfd pfd = { .events = POLLPRI };
> +	long ncpus;
> +	int fd;
> +	int i;
> +
> +	cpupress = cg_control(self->cg, "cpu.pressure");
> +	ASSERT_NE(NULL, cpupress);
> +	fd = open(cpupress, O_RDWR);
> +	free(cpupress);
> +	ASSERT_GE(fd, 0);
> +	pfd.fd = fd;
> +
> +	/*
> +	 * 1usec threshold over a 2s window: any CPU stall fires it. The 2s
> +	 * window is the smallest unprivileged users are allowed to arm.
> +	 */
> +	ASSERT_GT(write_trigger(fd, "some 1 2000000"), 0);

The selftest rarely can be run as unprivileged user (even test cgroup
creation needs privileges), so this comment is irrelevant. (But it's
fine to test with that value.)

On the more abstract level -- I was playing with this and thinking about
a value that'd test both sides, i.e. false triggers as well as false
non-triggers. I'd find that to be the half of the window and the number
of tasks should be then (3*ncpus + 1) / 2.
Or perhaps test two thresholds, one tiny like you did and one maximum
(whole window) with same amount tasks but expect trigger, no trigger
respectively.


> +
> +	ncpus = sysconf(_SC_NPROCESSORS_ONLN);
> +	if (ncpus == -1)
> +		TH_LOG("sysconf(_SC_NPROCESSORS_ONLN): %s", strerror(errno));
> +	ASSERT_NE(-1, ncpus);

Same as messages from pressure_open() above. Simply assert.

> +
> +	/* ncpus+1 hogs guarantee CPU contention inside the cgroup. */
> +	for (i = 0; i < ncpus + 1; i++)
> +		ASSERT_GE(cg_run_nowait(self->cg, hog_cpu, NULL), 0);
> +
> +	ASSERT_EQ(1, poll(&pfd, 1, PSI_POLL_TIMEOUT_MS));
> +	ASSERT_NE(0, pfd.revents & POLLPRI);
> +	close(fd);
> +}
> +
> +TEST_HARNESS_MAIN

All in all, this looks so much better than the initial version, well
done. Just a few polishing touches.

Michal

--k7dsd4vdmhwtmf2v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaphvPRsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AiKJwD+PqtkHd3blRPy13sFyLqF
8DxwZSomQ1H3UCKVICDOT/8A/A56P4uCIa6DGF+2hWa4rtwuRod+M+rCD4tqo/Cf
mVQH
=xP5B
-----END PGP SIGNATURE-----

--k7dsd4vdmhwtmf2v--
