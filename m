Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794341296;
	b=aedj88WMuqgDmRJLVGsPnk+ZZW0W9QRNkX10eYyfzeFvGcOBvXy5EL14JJWmxu9yoqyE
	 13SCiXkD9JsbIU6POb5fm7aM/SJ4LYlncvzmPWrZJSBOaPj2yzDKtMY1LxSCicSQKsBp9
	 GEQOYIKYzJFFHYZ0YggYijjr0YRV7nkM8dSGLGlNrdVIjz+3nmGU0KLwiO3BcmM8bSErk
	 byHcRZANpA1C4qFbMYwq/Mcs5c90fz8VSHXGMyvy16uYNP2ha33rHGGrRIOpiab+Xtcah
	 afgNAuG63J+4qY87xIW5er+iBP6kvsASZTz/Ta79nF1M/Cswu42Lh6/H0DIvodZzIWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794341296;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aZHkO6bQKS08fSFgnDFG2tKeYq7/D8f27wfiKMAH7bU=;
	b=GDde3UbqTvWvzTgm8p9GuXCgXWzCPGF9vGm5dI1CUQRjtOwtQJ13CJiZjBnj/sGvcC/V
	 CPRr44WslXjkCD2M6GPvrknA2FPmdJnf9GhsMsB4dq4eXVYPR8w/VTBx/tJbswnae51uU
	 5H+hcUoJ3pF7s/tQBpZ6358v3iMm1dQ69RfLBVvJ1mak0sXxX6HSvPUrBVVg+j1S5glKm
	 fPJ/mS6R1YUM89cSRresOnc62PIfTjBtayihUNWH4nZRm0x4ezNu+B5mob8U2vLIhrPJm
	 jMneQNjBbwqQ5w+sZkbmGlxcwOT4ah4bzKsk1xEQExHEvA52gJmtnULpm95wtneR9Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QtAi854F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0365606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QtAi854F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A235B1F0089F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794341295;
	bh=aZHkO6bQKS08fSFgnDFG2tKeYq7/D8f27wfiKMAH7bU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QtAi854F3laJGtshXjSl+ghMmjgdlvCeQILg+iErmB1QHd8olXUIpvP0uickvlvBn
	 iKDi8ttQSIELEYSrsKv7xrgzLdoEifyDrjud8AZhtdcDJJob45fT38fj4OLHz6hG4a
	 FVp41Ux+VG2+l9qKEZdt7ayGCNsT4gJKfXcvlNZpqiClS6PfTNaqEaT4g+eA6/yNL/
	 g/FVZgAYZlzV+uLTkLu+nbm4ccWs/Wefeej5daavYNEGj7mjjpWqAI1mVubThEGEYe
	 5Pjmo/4WAdlJskWdhSnPO+nxwOvPwDC9isXwMQwn/4TfwQWgwBzDta3ZqOmZexXhva
	 yjDKqchlk3kYQ==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3adfed9a887so11963071fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:08:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEtLK3N5OA762ja8MRgP6QpDCxv3WCqG3HPHP4D6bhZsD47/4K2l7BwfwHXo+yhj1g0cH+0NQoQ/QpxlfU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oTgUjl8iU9d6UotlcyB/97GTUN5qSnSEPoLZ1wN1tW22u/gE5
	x6DVNZSQ5sijW4bF92VkXdBkhjVfnpTMG/JYZqwn8lPWWRgU4BLoHxNIesMiEc3mhsTwhVOngJP
	cdDm0UxYNBnpJ7sopOwXDg/NgTVdb9lo=
X-Received: by 2002:a2e:be21:0:b0:3a9:d70c:f75e with SMTP id
 38308e7fff4ca-3ae096315e6mr7823711fa.7.1794341294060; Tue, 10 Nov 2026
 12:08:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030104213.2030283-1-xiongyining1480@phytium.com.cn> <a6840be7-bd50-4e64-af1b-0ab9334d8ec7@oss.qualcomm.com>
In-Reply-To: <a6840be7-bd50-4e64-af1b-0ab9334d8ec7@oss.qualcomm.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Tue, 10 Nov 2026 21:08:00 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jWW6Dg5fgMnj1R4eBOtKmGZYmj-5qTBzjtYQ7q9e4=ZQ@mail.gmail.com>
X-Gm-Features: AclHuK_x7n05SR8j9DhdHMfZxJ7deHY9ClNLJVZNgAl_LZFa8GIt_2FxgsIBC-E
Message-ID: <CAJZ5v0jWW6Dg5fgMnj1R4eBOtKmGZYmj-5qTBzjtYQ7q9e4=ZQ@mail.gmail.com>
Subject: Re: [PATCH v3] selftests: cpufreq: stop CPU hotplug loop after
 cpufreq update test
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, 
	xiong yining <xiongyining1480@phytium.com.cn>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Shuah Khan <shuah@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chenbaozi@phytium.com.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 4:12=E2=80=AFPM Zhongqiu Han
<zhongqiu.han@oss.qualcomm.com> wrote:
>
> On 10/30/2026 6:42 PM, xiong yining wrote:
> > Original test uses a fixed 5000 iteration loop to trigger CPU hotplug
> > for verifying cpufreq synchronization between CPU hotplug and sysfs
> > writes.
> >
> > Two issues exist:
> > 1. Background hotplug task keeps running after test completes, causing
> > redundant CPU on/offline operations.
> > 2. When cpufreq frequency setup is slow, the hotplug loop may exit
> > before frequency updates finish, which breaks test purpose.
> >
> > Use signal notification to terminate the infinite hotplug loop, and
> > add an EXIT trap to clean up the hotplug child when this test function
> > terminates abnormally.
> >
> > This makes hotplug run only during cpufreq sysfs write test,
> > align with test objective.
> >
> > Signed-off-by: xiong yining <xiongyining1480@phytium.com.cn>
>
> Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>

Applied as 7.5 material, thanks!

> > ---
> > Changes in v3:
> > - Start the hotplug child after governor switch and sysfs frequency rea=
ds,
> > to avoid -EBUSY errors when the target CPU is offline.
> >
> > Changes in v2:
> > - Stop the hotplug child process by signal notification instead of
> > a stop file, avoiding the predictable temporary path.
> > - Add an exit trap so the hotplug child is also cleaned up when the
> > main shell terminates abnormally.
> > - Link to v1:
> > https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2662696.ht=
ml
> >
> > This addresses the security and robustness concerns raised by Sashiko.
> > ---
> >   .../selftests/cpufreq/special-tests.sh        | 30 +++++++++++++++---=
-
> >   1 file changed, 24 insertions(+), 6 deletions(-)
> >
> > diff --git a/tools/testing/selftests/cpufreq/special-tests.sh b/tools/t=
esting/selftests/cpufreq/special-tests.sh
> > index e87ed7c8e5e5..0665da8f2444 100755
> > --- a/tools/testing/selftests/cpufreq/special-tests.sh
> > +++ b/tools/testing/selftests/cpufreq/special-tests.sh
> > @@ -16,6 +16,8 @@ source cpu.sh
> >   source cpufreq.sh
> >   source governor.sh
> >
> > +HOTPLUG_PID=3D""
> > +
> >   # Test 1
> >   # $1: policy
> >   __simple_lockdep()
> > @@ -92,6 +94,16 @@ governor_race()
> >       restore_all_governors
> >   }
> >
> > +hotplug_cleanup()
> > +{
> > +     if [[ -n "$HOTPLUG_PID" ]]; then
> > +             kill -s SIGTERM "$HOTPLUG_PID"
> > +             wait "$HOTPLUG_PID"
> > +
> > +             HOTPLUG_PID=3D""
> > +     fi
> > +}
> > +
> >   # Test 4
> >   # $1: cpu
> >   hotplug_with_updates_cpu()
> > @@ -101,14 +113,18 @@ hotplug_with_updates_cpu()
> >       # switch to ondemand
> >       __switch_governor_for_cpu $1 "ondemand"
> >
> > -     for i in `seq 1 5000`
> > -     do
> > -             reboot_cpu $1
> > -     done &
> > -
> >       local freqs=3D$(cat $filepath/scaling_available_frequencies)
> >       local oldfreq=3D$(cat $filepath/scaling_min_freq)
> >
> > +     (
> > +             local quit=3D0
> > +             trap 'quit=3D1' SIGTERM
> > +             while [ "$quit" -eq 0 ]; do
> > +                     reboot_cpu "$1"
> > +             done
> > +     ) &
> > +     HOTPLUG_PID=3D$!
> > +
> >       for j in `seq 1 5000`
> >       do
> >               # Set all frequencies one-by-one
> > @@ -117,14 +133,16 @@ hotplug_with_updates_cpu()
> >               done
> >       done
> >
> > +     hotplug_cleanup
> > +
> >       # restore old freq
> >       echo $oldfreq > $filepath/scaling_min_freq
> >   }
> >
> >   hotplug_with_updates()
> >   {
> > +     trap 'hotplug_cleanup' EXIT
> >       save_all_governors
> >       for_each_non_boot_cpu hotplug_with_updates_cpu
> > -     wait
> >       restore_all_governors
> >   }
>
>
> --
> Thx and BRs,
> Zhongqiu Han
