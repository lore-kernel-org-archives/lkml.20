Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978169;
	b=fIktgCW8TOTUZRhN3XsQpLTq764KNBfxjK2mmNXD7E3CUzLaPAyh6k5WKq1d5p82KoTH
	 mV96iErpvP5NMySzAH5VinO+nb8wmNY0BQ+WttC7e5TeOyqwnwIQP2s65B1B9Dy3UpcC1
	 6A+B0U3QYSsJpyCXGCrx09YGcHxAXDFy1QKJRR+8iykU9v665DlHX170II8hgCYk//IYZ
	 p7nSBo5vlJBx3S4cDVXWf8fyac+Ua/7tMaMabU1oT7VFc+3X1t0AzLO9Az2GezaRnpGT6
	 +VLPYSBvLM7Fwcx8vXTz7sNZ7TLiTXIloM5WhLim6i/0Zv6QhiZYDRC31a8Nf6zItFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978169;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rZMDk9Fl24riUrNB7K+XznxHCLVlnKCyKDI+soAjJ0k=;
	b=OHfx7FWWzJj9HVdvhkmwrHP6wj8XZJJkU2aUsqPJyTGLVR2HjoNjD6oZl/OEi4jjptoZ
	 XQlIBundNbQ10swgaHmDz96StOVtxU9+9Wc6Btbn1LWpOyhS5nwDbv3cyXO9985ZZJ+n2
	 QLcRRmxTH0hBannxXm3mEiYeVNBZW3yB3cvVDnedYjcba/ZThn75NaEpXUY4s3vqfZVYc
	 FL+L84GUDtJvmUmX2a5WfOse2xqdlTQyQO6TRHeoRnp6HpXvW875kYuM995zefZJ54OeA
	 jjZESABbzWfI6fWxg1dHI5QJtsaFOdEKaEVGmc18oQPdlh6KE9xGq8xQYg8vNUudsdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f6qAAugl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88845606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f6qAAugl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61ABC1F00902
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793978169;
	bh=rZMDk9Fl24riUrNB7K+XznxHCLVlnKCyKDI+soAjJ0k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=f6qAAuglGC1uHVECHvbaSqkxUJhisHonx3wyaXi3lx5Zxge8vwM6JvVxHtQzl+ycR
	 hEowG0rcVavX1faMCYlcdEu4avo3JBs9YOm2eK1XtdliC3tek2eJGSCjfAGNeofxWC
	 /HAel4bJ+mkweEy4aQbJE+VQPuA5F6wsgRd3omW1MRdqUJV8OtqwqmZD/NAuCBxMnD
	 nDvfPTcFpu2P99iAdnH18hFOBi+diT40Y3yhJ8Q6BjXosJEfMITp1imgAyGDGTZHKl
	 CHX8rMY5QbSis/JlMFQ5TyzkVEC61XdEhFZEv+QzghMABavVZ/tFES729FFvIomhJq
	 y+RGsRtpEv4rQ==
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5ec6f271883so555776e0c.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:16:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwPJD4+jfDTzUAoFXhxYi44km77rhpM00eQjxJt6wZkO9Eb6iRQ4xy6CqiACF4ZOeZsVKw1mYRcf7L2iLE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LncChJyOc7ZQGKyhalEZd9zWyU7xtlBbiVAoqeJm4a+S5+WsL
	z3ESGxUPN1si1pNnZCS5mFHFtY6ST2rSYVHVAWXox4mTusfLLUrljsxBtbLHn13lZ2nGob8gktj
	fh3Lk5Hym/69SpDYb/b4b2cXOco6qYOw=
X-Received: by 2002:a05:6122:32cb:b0:5ea:b712:8281 with SMTP id
 71dfb90a1353d-5ecc44220c0mr1534700e0c.18.1793978163673; Fri, 06 Nov 2026
 07:16:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-em-rank-boost-separately-v2-1-5a13d1b38d37@oss.qualcomm.com>
In-Reply-To: <20261103-em-rank-boost-separately-v2-1-5a13d1b38d37@oss.qualcomm.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 6 Nov 2026 16:15:48 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hy1D7anTe=CXNXZyMNSN_yHh5hOt6B0bEHTEONRJFMhQ@mail.gmail.com>
X-Gm-Features: AclHuK_kUFfE3cOrH15OQGXo65djIyEnQZhDGCnHMwtbYyC5w3H5uHm6PDEzr0Y
Message-ID: <CAJZ5v0hy1D7anTe=CXNXZyMNSN_yHh5hOt6B0bEHTEONRJFMhQ@mail.gmail.com>
Subject: Re: [PATCH v2] PM: EM: Exclude boost frequencies from inefficiency ranking
To: Guo Chen <guo.chen@oss.qualcomm.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Lukasz Luba <lukasz.luba@arm.com>, Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
	Vincent Donnefort <vincent.donnefort@arm.com>, Matthias Kaehlcke <mka@chromium.org>, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	xin.liu@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com, 
	tengfei.fan@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 12:21=E2=80=AFPM Guo Chen <guo.chen@oss.qualcomm.com=
> wrote:
>
> em_compute_costs() ranks all the frequencies of the table, boost ones
> included. A non-boost frequency can be marked inefficient only because
> a faster boost frequency has a lower or equal cost, e.g.
>
>   3.9 GHz  4.0 GHz (cost C)  4.1 GHz (boost, cost C)
>
> With boost disabled 4.1 GHz cannot be selected, but 4.0 GHz is still
> skipped by governors rounding down to efficient frequencies (e.g.
> ondemand with CPUFREQ_RELATION_HE), which land on 3.9 GHz instead of
> the best selectable frequency. Several frequencies can be affected.
>
> Exclude the boost frequencies from the ranking in em_compute_costs() and
> keep them all efficient, using the highest non-boost frequency of the
> CPUFreq table, returned by the new helper
> cpufreq_table_max_nonboost_freq(), as the boundary.
>
> Fixes: c8ed99533dbc ("PM: EM: Mark inefficient states")
> Signed-off-by: Guo Chen <guo.chen@oss.qualcomm.com>

Please see Sashiko's feedback regarding this patch

https://sashiko.dev/#/patchset/20261103-em-rank-boost-separately-v2-1-5a13d=
1b38d37%40oss.qualcomm.com

and tell me what you think about it.

Thanks!

> ---
> Changes in v2:
> - Drop prev_boost and keep all boost states efficient by resetting
>   prev_cost for them, as suggested by Lukasz. Boost states are no
>   longer ranked against each other.
> - Retitle the patch to match the new behaviour (was "Rank boost and
>   non-boost frequencies separately") and reword the commit message.
>
> Link to v1: https://lore.kernel.org/all/20261030-em-rank-boost-separately=
-v1-1-238a6b2bb888@oss.qualcomm.com/
> ---
>  include/linux/cpufreq.h     | 24 ++++++++++++++++++++++++
>  kernel/power/energy_model.c | 16 ++++++++++++++++
>  2 files changed, 40 insertions(+)
>
> diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
> index d3d0d9d02aa4..c93316141a11 100644
> --- a/include/linux/cpufreq.h
> +++ b/include/linux/cpufreq.h
> @@ -1155,6 +1155,24 @@ cpufreq_table_set_inefficient(struct cpufreq_polic=
y *policy,
>         return -EINVAL;
>  }
>
> +static inline unsigned int
> +cpufreq_table_max_nonboost_freq(struct cpufreq_policy *policy)
> +{
> +       struct cpufreq_frequency_table *pos;
> +       unsigned int max =3D 0;
> +
> +       if (!policy->freq_table)
> +               return 0;
> +
> +       /* The table may be unsorted, scan all of it for the highest one.=
 */
> +       cpufreq_for_each_valid_entry(pos, policy->freq_table) {
> +               if (!(pos->flags & CPUFREQ_BOOST_FREQ) && pos->frequency =
> max)
> +                       max =3D pos->frequency;
> +       }
> +
> +       return max;
> +}
> +
>  static inline int parse_perf_domain(int cpu, const char *list_name,
>                                     const char *cell_name,
>                                     struct of_phandle_args *args)
> @@ -1219,6 +1237,12 @@ cpufreq_table_set_inefficient(struct cpufreq_polic=
y *policy,
>         return -EINVAL;
>  }
>
> +static inline unsigned int
> +cpufreq_table_max_nonboost_freq(struct cpufreq_policy *policy)
> +{
> +       return 0;
> +}
> +
>  static inline int of_perf_domain_get_sharing_cpumask(int pcpu, const cha=
r *list_name,
>                                                      const char *cell_nam=
e, struct cpumask *cpumask,
>                                                      struct of_phandle_ar=
gs *pargs)
> diff --git a/kernel/power/energy_model.c b/kernel/power/energy_model.c
> index d19a65461ae8..5b1d095fd376 100644
> --- a/kernel/power/energy_model.c
> +++ b/kernel/power/energy_model.c
> @@ -255,15 +255,24 @@ static int em_compute_costs(struct device *dev, str=
uct em_perf_state *table,
>                             unsigned long flags)
>  {
>         unsigned long prev_cost =3D ULONG_MAX;
> +       struct cpufreq_policy *policy;
> +       unsigned int max_nonboost =3D 0;
>         int i, ret;
>
>         /* This is needed only for CPUs and EAS skip other devices */
>         if (!_is_cpu_device(dev))
>                 return 0;
>
> +       policy =3D cpufreq_cpu_get(dev->id);
> +       if (policy) {
> +               max_nonboost =3D cpufreq_table_max_nonboost_freq(policy);
> +               cpufreq_cpu_put(policy);
> +       }
> +
>         /* Compute the cost of each performance state. */
>         for (i =3D nr_states - 1; i >=3D 0; i--) {
>                 unsigned long power_res, cost;
> +               bool boost =3D max_nonboost && table[i].frequency > max_n=
onboost;
>
>                 if ((flags & EM_PERF_DOMAIN_ARTIFICIAL) && cb->get_cost) =
{
>                         ret =3D cb->get_cost(dev, table[i].frequency, &co=
st);
> @@ -284,6 +293,13 @@ static int em_compute_costs(struct device *dev, stru=
ct em_perf_state *table,
>                         table[i].flags =3D EM_PERF_STATE_INEFFICIENT;
>                         dev_dbg(dev, "EM: OPP:%lu is inefficient\n",
>                                 table[i].frequency);
> +               } else if (boost) {
> +                       /*
> +                        * Keep all boost states efficient. Resetting pre=
v_cost
> +                        * also keeps the highest non-boost state efficie=
nt,
> +                        * then rank the rest on their own.
> +                        */
> +                       prev_cost =3D ULONG_MAX;
>                 } else {
>                         prev_cost =3D table[i].cost;
>                 }
>
> ---
> base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
> base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.=
git master
> change-id: 20261029-em-rank-boost-separately-a7e7c7d78058
>
> Best regards,
> --
> Guo Chen <guo.chen@oss.qualcomm.com>
