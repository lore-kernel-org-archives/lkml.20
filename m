Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43FD34DB4A
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 18:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788026475; cv=pass; b=F1VDgT7d58vS6DrNSJi63Hm2g4uVE5QafKhIhCXiXLwzBnzbhvxPglaXYoKgOZOHZpS1w0GVpSLDdYyf4RpS6F6euR7oqmvitsFW+Xbc7HuK2kswxKL/LSSP2z2kdXMqxtib3ok5mTsW0iVYlxtMW5MWCPq/EXYOXCQRad6SRes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788026475; c=relaxed/simple;
	bh=1sRd5a9TSWmSja6VRlyotOK7ik2WNHK6l/Mz8aJuXu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BeaX4J7vs3vRB3ucYJ6t5EsJJEmXhdyLV6GxLKVThsZHyBcwBq2henh/rivN/1znOjghVlOLjD3Pwm58XaWNGcgbfO3g2m1VWw6QMDwG9TxWL6ijZCkxW9BWPg6yTxYTS2Cizk6gZzkkeqTkkns4L5LkJHff2H9RxB+FujOi+w4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lam2fuRR; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lam2fuRR"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-855a66e5b5dso20897837b3.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 11:01:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788026473; cv=none;
        d=google.com; s=arc-20260327;
        b=ZkR/2ahsasU+3OsRyZzrsRpqWOJKKbbCUB732WRd3YgPr1vqMns8KLy0k1tW4WC4vj
         GUov37rY2p7WQiLGZy957JAGlaw/BjkEDnsSKCDnH4T5Z5HtQXtnLujOxRO0RIruwVvR
         Yc+9hqQEU1ucUQGhTDKBOtoa+y+HJEwmEsR+N0LUA7V5PNtR2aJ16t+9TsNki7iT96H3
         g1utT3t7XKODXAUZ9bD1UpsdqsMmE9mGg1Ipy4pYIvpvuAd2GGzjuRkyJfm8/SclvuSS
         HxWIMFJxi1AInschDZIPaGzoPYvuoDbkRE6bXsdtbr+6JcWCHlt1hN8DK7hEOhaTkwlu
         2TBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zyAXQp/4jyOBzaaoOvY2wevc4HK2X1KILrGcqriZeX0=;
        fh=qunqOR0H9OLD5yxnWVhZuBiVDDBvrtAG3b9ZRDWturU=;
        b=Zlo3Ta8ChyZofSMrqwLQx3zJsTxP/Od2i/JB11iTob/dNxWut8zN8byH9vNyw5KhuB
         ncH59Jc+cJVl031xlvmfg+NZYmfPU95wIFWc1I2W/7Hm7NTlmukLt7Fq3UXkprZjRPGt
         6C8rVLwBajjcCqR9W0TooGkuW9Z4FRMw/hoGwaZjgJZnhcMeGckKy1Lm/9OijCHlbFDn
         Dbs2V2K6PLWD4ie+Tt+BO6E7pl4iPKfGbJN8JbxxqJtB45B5UUq0zG7I7w09vThJEoT9
         fKsqjgNVlVUlf92NUKAPggplfhD4NGIJRIuEcxD8JvGo+p+2O+1XXKA1rYO0GfgGBaS3
         aKZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788026473; x=1788631273; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zyAXQp/4jyOBzaaoOvY2wevc4HK2X1KILrGcqriZeX0=;
        b=lam2fuRRCI1SABi3A+o7S3CBLkN52fBTZNtGvjrgyhoiP+vhyT9heOMbMbMBgqn1DX
         GQ6QvcXxWKPKmOo1uuqSv9UhRnevGTN2fafvhe2Lw538xFc14JkrR9UoX/EpNQ70ss4J
         0puWW5MRGr9i9IyN2nOjN6dtcMMk0hPvnMmaJuTvvrn7O+DbojgWMNJ1QHCUTI0ushmp
         0pBkc5mGbq+jTSLi0NIaTAYvWcclv1MfaKQMlTcycU3+tr2qX6wzWY0IzJgJz4Op2YXx
         CMUFwIsvXWy8X9BjoY25n8Biyw29meTMNxX9aoKvCBusW4imzFESfecfLPkECPYG14mV
         s9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788026473; x=1788631273;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zyAXQp/4jyOBzaaoOvY2wevc4HK2X1KILrGcqriZeX0=;
        b=Awpv7QvA5DYdflkW6XcUgXH8ScWhkXFGpk4IY+8KwdLmQY55briANrE/3VHH/6/Nsa
         rvagl4L5eEm/wLIzFy7lvGUwhBS/pgJzxTWJcwMY8kk3PIn2zcG1wXZI+vNmhKNdW3ow
         +DITZ8vPr8/J+dq6+g2B0IzoH4RlqIw+UPUZa3MmOYzdPLMqmGCRJQlr7P3XJGvGNvWR
         qql/iMd/2nlP3LuY21v0FJhA/4YConCp1cm0LnZve1IsiITcIfFYQhgAFWQf9jPrkNVI
         eVmUQCAoQCDSGREHD7JyCla/wGIM1Y4zAGt7ZqOYKB8c9SywIh78KOHXjzLLVtVUe1AF
         SsSg==
X-Gm-Message-State: AFuF++n4MXpU+EAFE8Zid9NbSflKcdBZweGBc0kok2bZRmR/s/RUFmLb
	7VUI8+y5TIzQOkpE11dO5A+C4SX9Oyh6Sv22uH1xOuI9SgSqYYCOYeiIKRFyns8Of1Yunt6vOVl
	PHYSeSOWwjdim7INyNVfJQTll9R0xx+Te/BPL
X-Gm-Gg: AYBFou1+9jcnC+q1lvq1z2O9m66c8Q9D6hCmfuKW2HVXhTgNqgsK7WVhNn1AAmiRmy/
	dNkAd76L43yqYqR8dIGaODgSZEbeVz1okzGAwiwMUlKNJcSZebCCeUAT5UtzYQwcb7ZhT98CEM6
	W08+d+Xh3g+XppCn9Palx+LFrcCTWvqB2RrWAkxNko0cuosZv5Vx/DA4eEKKjtYJ7NVmRYR1L2q
	fohylsXFzg1MRSCYcIIlizuZQw6aC4KDRB7K9ICOk7Ulnj/2w9ovO4A4zsC/z5U4Jk4oCBJrQUa
	VME7WMsWjbjMEO9IsXoJzvI1suLN9dNqE9XODayL2lo=
X-Received: by 2002:a05:690c:e3e8:b0:833:801:f715 with SMTP id
 00721157ae682-85d6cfc1a79mr59152097b3.18.1788026472590; Sat, 29 Aug 2026
 11:01:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829164313.20905-1-sumeet4linux@gmail.com>
In-Reply-To: <20260829164313.20905-1-sumeet4linux@gmail.com>
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
Date: Sat, 29 Aug 2026 23:31:00 +0530
X-Gm-Features: AcwNN1WYnr1uptvCdY81tIYvIva0raUvmVHygkBNedNaoKNTLwZKfsJtCDX3RAA
Message-ID: <CAJ9orWSAYpCe1jq5aPNQ9H+ikt73+mZDTKbe-5MkVGJXihjEOA@mail.gmail.com>
Subject: Re: [PATCH] powercap: intel_rapl: Fix rapl_packages list corruption
To: rafael@kernel.org, linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Added linux-pm mailing list now. Earlier by mistake I sent it to acpi
mailing list.


On Sat, Aug 29, 2026 at 10:13=E2=80=AFPM Sumeet Pawnikar <sumeet4linux@gmai=
l.com> wrote:
>
> The rapl_packages list was previously documented as being guarded by the
> CPU hotplug lock (cpus_read_lock()). However, cpus_read_lock() is a
> reader-writer semaphore taken for shared read access. This provides zero
> mutual exclusion between multiple concurrent callers.
>
> Because auxiliary device probes (such as intel_rapl_tpmi_probe) can
> execute concurrently on different CPUs, multiple packages can race on
> list operations (list_add and list_del) inside
> rapl_add_package_cpuslocked() and rapl_remove_package_cpuslocked(),
> leading to list corruption.
>
> Introduce a dedicated rapl_packages_lock mutex to protect all additions,
> removals and iterations of the rapl_packages list.
>
> Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
> ---
>  drivers/powercap/intel_rapl_common.c | 29 ++++++++++++++++++++++++----
>  1 file changed, 25 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/powercap/intel_rapl_common.c b/drivers/powercap/inte=
l_rapl_common.c
> index 70cab5f08bc6..e544629dbe30 100644
> --- a/drivers/powercap/intel_rapl_common.c
> +++ b/drivers/powercap/intel_rapl_common.c
> @@ -175,7 +175,8 @@ static u64 rapl_unit_xlate(struct rapl_domain *rd,
>                            enum unit_type type, u64 value, int to_raw);
>  static void package_power_limit_irq_save(struct rapl_package *rp);
>
> -static LIST_HEAD(rapl_packages);       /* guarded by CPU hotplug lock */
> +static DEFINE_MUTEX(rapl_packages_lock);
> +static LIST_HEAD(rapl_packages);       /* guarded by rapl_packages_lock =
*/
>
>  static const char *const rapl_domain_names[] =3D {
>         "package",
> @@ -1360,12 +1361,14 @@ static int rapl_pmu_event_init(struct perf_event =
*event)
>                 return -EINVAL;
>
>         /* Find out which Package the event belongs to */
> +       mutex_lock(&rapl_packages_lock);
>         list_for_each_entry(pos, &rapl_packages, plist) {
>                 if (is_rp_pmu_cpu(pos, event->cpu)) {
>                         rp =3D pos;
>                         break;
>                 }
>         }
> +       mutex_unlock(&rapl_packages_lock);
>         if (!rp)
>                 return -ENODEV;
>
> @@ -1445,9 +1448,11 @@ static ssize_t cpumask_show(struct device *dev,
>         cpumask_clear(cpu_mask);
>
>         /* Choose a cpu for each RAPL Package */
> +       mutex_lock(&rapl_packages_lock);
>         list_for_each_entry(rp, &rapl_packages, plist) {
>                 set_pmu_cpumask(rp, cpu_mask);
>         }
> +       mutex_unlock(&rapl_packages_lock);
>         cpus_read_unlock();
>
>         ret =3D sysfs_emit(buf, "%*pbl\n", cpumask_pr_args(cpu_mask));
> @@ -1655,11 +1660,15 @@ void rapl_package_remove_pmu_locked(struct rapl_p=
ackage *rp)
>         if (!rp->has_pmu)
>                 return;
>
> +       mutex_lock(&rapl_packages_lock);
>         list_for_each_entry(pos, &rapl_packages, plist) {
>                 /* PMU is still needed */
> -               if (pos->has_pmu && pos !=3D rp)
> +               if (pos->has_pmu && pos !=3D rp) {
> +                       mutex_unlock(&rapl_packages_lock);
>                         return;
> +               }
>         }
> +       mutex_unlock(&rapl_packages_lock);
>
>         if (rapl_pmu.registered)
>                 perf_pmu_unregister(&rapl_pmu.pmu);
> @@ -1704,7 +1713,9 @@ void rapl_remove_package_cpuslocked(struct rapl_pac=
kage *rp)
>         /* do parent zone last */
>         powercap_unregister_zone(rp->priv->control_type,
>                                  &rd_package->power_zone);
> +       mutex_lock(&rapl_packages_lock);
>         list_del(&rp->plist);
> +       mutex_unlock(&rapl_packages_lock);
>         kfree(rp);
>  }
>  EXPORT_SYMBOL_NS_GPL(rapl_remove_package_cpuslocked, "INTEL_RAPL");
> @@ -1749,11 +1760,15 @@ struct rapl_package *rapl_find_package_domain_cpu=
slocked(int id, struct rapl_if_
>         else
>                 uid =3D id;
>
> +       mutex_lock(&rapl_packages_lock);
>         list_for_each_entry(rp, &rapl_packages, plist) {
> -               if (rp->id =3D=3D uid
> -                   && rp->priv->control_type =3D=3D priv->control_type)
> +               if (rp->id =3D=3D uid &&
> +                   rp->priv->control_type =3D=3D priv->control_type) {
> +                       mutex_unlock(&rapl_packages_lock);
>                         return rp;
> +               }
>         }
> +       mutex_unlock(&rapl_packages_lock);
>
>         return NULL;
>  }
> @@ -1810,7 +1825,9 @@ struct rapl_package *rapl_add_package_cpuslocked(in=
t id, struct rapl_if_priv *pr
>         ret =3D rapl_package_register_powercap(rp);
>         if (!ret) {
>                 INIT_LIST_HEAD(&rp->plist);
> +               mutex_lock(&rapl_packages_lock);
>                 list_add(&rp->plist, &rapl_packages);
> +               mutex_unlock(&rapl_packages_lock);
>                 return rp;
>         }
>
> @@ -1835,6 +1852,7 @@ static void power_limit_state_save(void)
>         int ret, i;
>
>         cpus_read_lock();
> +       mutex_lock(&rapl_packages_lock);
>         list_for_each_entry(rp, &rapl_packages, plist) {
>                 if (!rp->power_zone)
>                         continue;
> @@ -1846,6 +1864,7 @@ static void power_limit_state_save(void)
>                                 rd->rpl[i].last_power_limit =3D 0;
>                 }
>         }
> +       mutex_unlock(&rapl_packages_lock);
>         cpus_read_unlock();
>  }
>
> @@ -1856,6 +1875,7 @@ static void power_limit_state_restore(void)
>         int i;
>
>         cpus_read_lock();
> +       mutex_lock(&rapl_packages_lock);
>         list_for_each_entry(rp, &rapl_packages, plist) {
>                 if (!rp->power_zone)
>                         continue;
> @@ -1865,6 +1885,7 @@ static void power_limit_state_restore(void)
>                                 rapl_write_pl_data(rd, i, PL_LIMIT,
>                                                rd->rpl[i].last_power_limi=
t);
>         }
> +       mutex_unlock(&rapl_packages_lock);
>         cpus_read_unlock();
>  }
>
> --
> 2.43.0
>
