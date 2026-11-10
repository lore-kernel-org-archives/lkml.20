Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318849;
	b=0bCw0kK+0GpkmamQ9C+/UGfZZxChkMF/aUnXmjvuRty15jVqCIikRohnkFUtH0pEMZBS
	 ir2TcjyxUZeX8stzBoEDktnPyl3F7pLqXrV2P89XW9sY4X53g3r/Y2kA3RrFMMpOAD1uq
	 Be3YOhQ56X47PVpUnjAlIqF+t2834rQmw61sDu3DZyfX7bxLefgHVik0914sOQVBkoWs+
	 wLx2+6hDPz9FTLkpy37JM+1MZAem43fkDTiLpKyeWgGBvCYvBeu1NkKtWP/QPCS9/d+qI
	 J5V8upWrk/h9A7ZxxatC0yj3uAHzp48sU5dQIQ/Mt9GWsEDKvoDT7Jo/qmRi7ARGcCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318849;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=afOauq29YyzAQV1cQ4sSotUY3ZBtY/Xgdqao80whYC8=;
	b=sTIFxBu5bZyUR+cfLTPBVvYQnCl1AqXHB6xWl9+wzRCVzD9tnE8vcMxPucCUbXoN+7G1
	 d8q+wRtC4xbtFDs4Z5U/iWOfKD8mtgHqepnqg1rBsYnYynlfxNvu7sOkWt86itNW/crNA
	 NqHku0fuQgBT/edxqrlcXavOtJXiTKNoIqwXm3i74skWJ2gqkv3LIRrimXGOehLd/iNzU
	 kvDFm/Ae7EPD03wRVMhnrmsJxvxtoctgScuucsr3RZ/bbEaR9OKZyatcVUe9l9yIYcvXx
	 ZzpjB3B/3DKWrdNz4+EA2rHwuF4/AUZW3EQfFAyXSbMvg4bfc4EM5rpWa7OcsoRzVYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XEm6idkq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C50606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XEm6idkq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BC321F0089F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794318848;
	bh=afOauq29YyzAQV1cQ4sSotUY3ZBtY/Xgdqao80whYC8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XEm6idkqmcShtl0VEKBM5aa9vwWvVRtlg3uyM3pU7okM9BXA0aV1ztPxMpX0c/QdG
	 rBpusGSvQn5gQHi2Dw+hkUIDSfvnbO6MXOayxdCmpwZiR7ERhERIxNxOrhWj5VwR6+
	 G5ljrQr3NZNwgXLucTuexhw2uITlcWor4gq446VITPK66dE0eG2sBmgrBQxnOHhk+e
	 7MfV6QQ5bdwKQWxorxmmLxI+V5L/Gl9SQVN5Nap2YIrHazQkBNFHeIUwThDvcNt6It
	 1/Dy3DlR8cKB3vCLJYl9oXMwzKcFXspT0ywgYQorYODkGCcHzpVDwN+QTlrd/DniOQ
	 BrnthuSvTZ0OQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso2538272e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:54:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFkmFIje57I2HlHG5hRfkDIEfk+JFcj5JbeqgCcRrhyxKsHUmFJqt80MUs3lpgPSwwHn59b+Nxk7eOQUU4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ci/72Px47N+MFJRFgr/gmMnwktSInJ2xxHuTWtKlJUnA2P4nv
	vsP/uLfcdHvwiDSNvpngxbfA0JxXYXd7HfNDOKfQGD20l1Fe1EBwmLed6Tm1zbGNGNrFd84yggn
	dKckr2G9E59hDpxqRHwHBP/noWHgw2Ho=
X-Received: by 2002:a05:6512:a87:b0:5be:4754:2297 with SMTP id
 2adb3069b0e04-5c156ee6348mr875909e87.58.1794318846876; Tue, 10 Nov 2026
 05:54:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028-acpi-thermal-stale-limit-v1-1-4b0ab3230f01@ashtonantila.com>
In-Reply-To: <20261028-acpi-thermal-stale-limit-v1-1-4b0ab3230f01@ashtonantila.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Tue, 10 Nov 2026 14:53:54 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gb4AmXJxS5URSSJezE1_o6=pVij+q6w2Jx1Ky0y3zKcw@mail.gmail.com>
X-Gm-Features: AclHuK9dqerjRxFqtrcC-O6iWqdGCncLHLlui7XbBZcA7O2_gAnU3Mlx1rtWIKg
Message-ID: <CAJZ5v0gb4AmXJxS5URSSJezE1_o6=pVij+q6w2Jx1Ky0y3zKcw@mail.gmail.com>
Subject: Re: [PATCH] ACPI: processor: thermal: Do not leave a stale limit when
 not throttling
To: me@ashtonantila.com
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 6:57=E2=80=AFPM Ashton A. via B4 Relay
<devnull+me.ashtonantila.com@kernel.org> wrote:
>
> From: "Ashton A." <me@ashtonantila.com>
>
> cpufreq_update_thermal_limit() sets thermal_req to cpuinfo.max_freq
> scaled by the reduction step, also at step 0, when no throttling is
> requested. cpuinfo.max_freq drops to the nominal frequency while boost
> is disabled (amd-pstate, and intel_pstate with no_turbo), so a cooling
> state update in that window leaves thermal_req at the nominal frequency
> after boost is enabled again. The CPU then stays at its base clock
> until the next cooling state change.
>
> On systems with an ACPI thermal zone that has a passive trip (_PSV)
> with the processors in its _PSL, such an update happens on every
> resume, when the zone is re-initialized and step_wise re-applies the
> cooling state. Suspending with boost disabled, e.g. in
> power-profiles-daemon's "power-saver" profile, and switching back to
> "performance" after resume is enough to hit this.
>
> Before commit d15ce412737a ("ACPI: cpufreq: Switch to QoS requests
> instead of cpufreq notifier"), the limit was recomputed on every policy
> update and could not go stale.
>
> Use FREQ_QOS_MAX_DEFAULT_VALUE at step 0, the value the request is
> created with. ->verify() already clamps policy limits to
> cpuinfo.max_freq, so this only drops the stale limit.
>
> Reproducer on v7.3, ASUS ROG Flow Z13 (Ryzen AI MAX+ 395, amd-pstate
> active), with N being any "Processor" cooling device:
>
>   echo 0 > /sys/devices/system/cpu/cpufreq/boost
>   cat /sys/class/thermal/cooling_deviceN/cur_state \
>     > /sys/class/thermal/cooling_deviceN/cur_state
>   echo 1 > /sys/devices/system/cpu/cpufreq/boost
>   cat /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq
>
> This prints 3000000 instead of 5187500. With this patch it prints
> 5187500, also after the power-profiles-daemon suspend and resume
> sequence above.
>
> Bug 221795 reports the same symptom on another ASUS laptop with the
> same kind of ACPI thermal zone.
>
> The issue was diagnosed and this patch drafted with an AI coding
> assistant (Claude Code, Claude Opus 5.5). I have reviewed the cause
> and fix, and I take full responsibility for this commit and the fix
> included.
>
> Fixes: d15ce412737a ("ACPI: cpufreq: Switch to QoS requests instead of cp=
ufreq notifier")
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D221795
> Signed-off-by: Ashton A. <me@ashtonantila.com>

Please address Sashiko's feedback on this:

https://sashiko.dev/#/patchset/20261028-acpi-thermal-stale-limit-v1-1-4b0ab=
3230f01%40ashtonantila.com

> ---
>  drivers/acpi/processor_thermal.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/acpi/processor_thermal.c b/drivers/acpi/processor_th=
ermal.c
> index 11036f0d2b9..3663a54c043 100644
> --- a/drivers/acpi/processor_thermal.c
> +++ b/drivers/acpi/processor_thermal.c
> @@ -97,8 +97,15 @@ static bool cpufreq_update_thermal_limit(unsigned int =
cpu, struct acpi_processor
>         if (!policy)
>                 return false;
>
> -       max_freq =3D (policy->cpuinfo.max_freq *
> -               (100 - reduction_step(cpu) * cpufreq_thermal_reduction_pc=
tg)) / 100;
> +       /*
> +        * cpuinfo.max_freq changes when boost is toggled, so storing it =
when
> +        * no reduction is requested would leave a stale limit behind.
> +        */
> +       if (!reduction_step(cpu))
> +               max_freq =3D FREQ_QOS_MAX_DEFAULT_VALUE;
> +       else
> +               max_freq =3D (policy->cpuinfo.max_freq *
> +                       (100 - reduction_step(cpu) * cpufreq_thermal_redu=
ction_pctg)) / 100;
>
>         ret =3D freq_qos_update_request(&pr->thermal_req, max_freq);
>         if (ret < 0) {
>
> ---
> base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
> change-id: 20261028-acpi-thermal-stale-limit-7a1b102a1bdb
>
> Best regards,
> --
> Ashton A. <me@ashtonantila.com>
>
>
