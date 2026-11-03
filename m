Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793731709;
	b=ZyL7rIlr68bo5gkkF0U4XTxhDVXtnfdjWJrG1byailZaInqZv+tXI6bQoBQh+K0xR/Ui
	 mD1WiENUCE/EM5kVhMmWVV2EgTGRjZODJJxsJr8QmFFtk5xJ8eKv8lKcos2XVOJSGRavS
	 Pcb/GHUDW76tb5FH2fDfVQoIFnZfKYMHp081QlWKbNSyv0ufyvFG5KHOQ2I16MB40g+zD
	 t1HlscuZDUv1pZilt5Wp2OH+fTxtpGhGuYgtdBCbKEGZHxGyrDT64LbWHSVbRx8tqkTNZ
	 7GRFYeiGsHJEEz/cdKhuPJFf5WMXz7okNcpeKVTtF+VKZDQSno6zB/ySLysYzhx3g/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793731709;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zYzKUo8I7hQ360UTcDEoe2J2pbxyPaIjHYeY1PW54UE=;
	b=ktU5kz83QaYk+dvksmSZ8e6NRwYTaQY1ssoTNQsS/Oot3rmy8H3A9Qnrng53v8lHXEFN
	 74YRw0ClTFKADp7biDZaPvPeYlIISU84+283zVlx58/JdFQg+ABuassaIrKe2FIcEUmd5
	 iPfIiWgkRZ8xkuCByekwcx/2Bn44ay+KLPmw1f9AKkxgO6+YPSU7EN00hLqnlCqF+y8Lh
	 QH+o11d7gYnBwDt/tOJiYDc9pe1PboWD+CPhviXELYnq2vzrAeENOgSQjM5/XewNrBvRd
	 PfFo0QFTTc+FTypkqY1h/vGsPbgSAyK4ecTg5vaCqThtPsJcc+5z5k3phIjyNAy6DyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GuZvIFpE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784EE606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GuZvIFpE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F0BF1F00A15
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793731709;
	bh=zYzKUo8I7hQ360UTcDEoe2J2pbxyPaIjHYeY1PW54UE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GuZvIFpEsJEG5cempsuhux7eXElMyYr+x7Krj8aGdVvydnIROcjFthaHh2V8XynQw
	 lM5Hn32hEo2H0m/g/6HN0sN10CBuLogujJ3Y3SHJpk+VCbeUoSaUZGwT/uPVpuULKN
	 iLLw3qG0mm4OJ10ooRZVwL0eC92I9tdHv6299P5s/9+8sooGBRVnnJNBdRDom8sq0U
	 GPdbmwQkrZLm2pQ/Zim8bbae4XLoJDHUr0rTDPlNV9QiUmEdGK/37mRmYfefO7yrIk
	 TbBBeGZ7GOR7RQc0fIGZFgAA1USclb4JlGphrNlfinW9VeI+ob4wBnz6bvETadGlgt
	 cA8aMhLrpwrwg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bfc3292d90so3308936e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:48:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBx0F//lV/K2Gu2UtqXIHaEbU2Du3PCg1mFWMjyu0ujEjud9jWqavSJEkNsKOMQyIqFmiZ8mq0CKyl/Cxx4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2/iUqE0ZhivUJUqYPD/UijsRJ/Ki5Hn+PupjMMtEIlbBpC4/J
	+GWK+9Df7yawQxr/CYUs4GJmcyLL0dWKdkZOhpnV/kg107Id0m+036C6MljkurG6dI40XEH+J2R
	/Mu/xQge0nOZiewOpKzY1jjazKyPZhbg=
X-Received: by 2002:a05:6512:1106:b0:5bf:d127:b83c with SMTP id
 2adb3069b0e04-5bfd95620f4mr4622652e87.10.1793731707475; Tue, 03 Nov 2026
 10:48:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <be3739f8-e668-4711-912c-91459d77ed35@arm.com>
In-Reply-To: <be3739f8-e668-4711-912c-91459d77ed35@arm.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Tue, 3 Nov 2026 19:48:14 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0haTqW+2t8C=b2oQQe4_3=HEHn-dgsMTWUNf-9mb33uqg@mail.gmail.com>
X-Gm-Features: AclHuK9tW9Ft1zPpw0vX-JKr6OrbrLqHyY1YmjHLwBm9NVABET22Nf4m43jETLY
Message-ID: <CAJZ5v0haTqW+2t8C=b2oQQe4_3=HEHn-dgsMTWUNf-9mb33uqg@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: Hold the policy write lock when changing boost state
To: Christian Loehle <christian.loehle@arm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Mario Limonciello <superm1@kernel.org>, Sumit Gupta <sumitg@nvidia.com>, 
	Jie Zhan <zhanjie9@hisilicon.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-pm <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 7:19=E2=80=AFPM Christian Loehle
<christian.loehle@arm.com> wrote:
>
> The per-policy boost sysfs handler calls policy_set_boost() under
> policy->rwsem, but the global boost handler and cpufreq_online() do not.
> Consequently, global and per-policy boost changes can concurrently
> update policy->boost_enabled, invoke the driver callback and update the
> boost frequency QoS request. The driver callbacks also access policy
> state, e.g. CPPC updates cpuinfo.max_freq that assumes policy->rw_sem
> held.
>
> Take policy->rwsem around policy_set_boost() in both unlocked
> callers. Keep locking at the call sites because the per-policy sysfs
> handler already holds the lock.
>
> Fixes: 218a06a79d9a ("cpufreq: Support per-policy performance boost")
> Signed-off-by: Christian Loehle <christian.loehle@arm.com>
> ---
>  drivers/cpufreq/cpufreq.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 54dde8419bdc..015962e6c1fe 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -576,6 +576,8 @@ static int policy_set_boost(struct cpufreq_policy *po=
licy, bool enable)
>  {
>         int ret;
>
> +       lockdep_assert_held_write(&policy->rwsem);
> +
>         if (policy->boost_enabled =3D=3D enable)
>                 return 0;
>
> @@ -1629,6 +1631,8 @@ static int cpufreq_online(unsigned int cpu)
>          */
>         if (cpufreq_driver->set_boost && policy->boost_supported &&
>             (new_policy || !cpufreq_boost_enabled())) {
> +               guard(cpufreq_policy_write)(policy);
> +
>                 ret =3D policy_set_boost(policy, cpufreq_boost_enabled())=
;
>                 if (ret) {
>                         /* If the set_boost fails, the online operation i=
s not affected */
> @@ -2830,6 +2834,8 @@ static int cpufreq_boost_trigger_state(int state)
>                 if (!policy->boost_supported)
>                         continue;
>
> +               guard(cpufreq_policy_write)(policy);
> +
>                 ret =3D policy_set_boost(policy, state);
>                 if (unlikely(ret))
>                         break;
> --

Applied as 7.4-rc material, thanks!
