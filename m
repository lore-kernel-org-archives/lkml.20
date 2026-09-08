Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E7C5328CD
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788887688; cv=pass; b=jno4vtT8H1gPSqO8+TOSt3jiEgUv43gxhDUFqpEbR7tJUkhu8xZy2It67AQMDJd+w4LLrm3TjI4XnVh2U+eZbiCqmp5T/15lNad7wtjyqujYKLOGLCoshjrdc0VqXJAOVNpqOrWOXCKhQDB4R28Ry3CGz/qpCUgqMWMbQvTtPfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788887688; c=relaxed/simple;
	bh=XS2DOsAZdUoMv3cfbY4kaZFDPxLymXshnMS4j/7nPkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iRFD28sCpV2SnnfPLl9NFUjioAzdck9RxrnRY9Q7MMWcYrIVw7rnQFwZ5bUwd/muUDDu4R1CDUfPcwrqYgiLscXKjyRAI2VNGt+ppS+dNiNMiOIhvZKM8tx4EFRTjUrBlCkz+/cl+iSKR708I1GLm6NWXXccThKkVkVeuNSBRm0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NjFl2YMd; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NjFl2YMd"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5307425f44bso612991cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:14:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788887685; cv=none;
        d=google.com; s=arc-20260327;
        b=KSEBYrIUUAitMwrWa1OxHh16Jv03WMhGHri+Gjmq12dku5IgfHWR6AXlSU2sz/bs/4
         9il/VLCvQgbW9zQJv8VTqfYp2KGmW9gVSEtANpdhZ1J9N+hD71TtAbYtHH6M+K01prX4
         mqVXpDbCOBtzsYmM0oxNVq1NTUWKE9CLL00eK/5AUUMKa1K5DBztDh8ysVfesYLzwQXJ
         m1d4XS026x1sBxSTs/YveQMBwgKELyLD0xCc0xKCNhjvuBWph3irBY80WGQcbW61GzsZ
         y+4dvnV8cd6o/B9qrcnZ/Gb88Ol/gBvfC7sfohx5d18VTX06icx+d1+Q+TuYeAfaaN9j
         5GMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CXI7gwxxGgVVUavBiXahE7l6pKPePlATykxGcqw8prc=;
        fh=BCd5pNR6AcP3BEDCdEt5FLBdO4ZA1oSuGNCAKYUvZNo=;
        b=KUVgreQxzPDwqox6eYbgGFj+9WNRXyEs6PMChyvPZGBhUBfCZV1IIc0xg0RwQvoQoG
         2oBtVPQXhl65uPD0hsvlHLS/GjteWkKctFDYGQ/KxriLGQQeMDv6vkmZoDkcRK37vPOu
         b0SiTJBXDG+A7900wxEpUBf0dMm3897uFVIHj2IV43GsH6411m/35vHQBGUTj/LLVOkr
         hoM1AcJ9qGwv/68+ybM9sIBZL7CAeleEJVKWdYNLhR0i6abO0QWSfUjpN0gt5rDQ+8W4
         TJmHbMuzlLV7roMwlCdzCFV10SLVGONMC/68QMpQ2/M0Dz0wEjLl1ZfE4wIXTv6mDxFz
         ZrVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788887685; x=1789492485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CXI7gwxxGgVVUavBiXahE7l6pKPePlATykxGcqw8prc=;
        b=NjFl2YMdng4Ul0CqANObzunllAAmdwdxP8uxmg/To7hME7Nz/lUgEo94xKUQUHyvan
         jz95BxDD+l2LSupellFtuDV3dkh75U5SydfCf9F3zUqebaxNAng6y3omanSnRvb7tZgs
         LlK6PHINt9X29aF+W1r7snBQhZe0W8+oZztmhhthvU3TnwjaJ3sGi7afVcxnrQouBLx0
         /oUpGvdZ/ax8P7pdv+FVf+1T9fLbJ0uEGe2pGD3QLoKhop+CethsYvZQBB6Q1KJROLkv
         EmPNx0PC2pQt4ZtvleZ02+fT1W7iD/3Jf3s4QmO/J/M31h4Tli/aWsyduYqQvBt/P4B7
         jXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887685; x=1789492485;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CXI7gwxxGgVVUavBiXahE7l6pKPePlATykxGcqw8prc=;
        b=P8X2x/PuWNFEhIn321AiqHuUkHl8x+Fx9OzH27wvBVk2y1MXC2G4rc2rCom9FJ8L1+
         aUbOAfMbjv3Ue2gr9GjpkGaOfqBiOiJOJKq12UpREMwnkllHkJLTv+0phqlqOpax6UCv
         c8I27KVXOWGwcu0cXBexu+uyv7jSeEdfkK9wzN5sb7QTxqoLlHRYfvcZH7uCjbAixLxd
         ivKgg7VWvDeNgqvSPSDhw95FId5UtjdEjGGS0VqveYS4ky4xn2uYWg4ioG11quE1covW
         b5NKwb9dmshTqAGHXBhiroyd9WRNAyGb3wQ1JXfx5gQ2cpg70HgK9BiHJAy5leMWdQ9R
         98OA==
X-Forwarded-Encrypted: i=1; AKwUvByzjJfL7QwIBfuKcbMAlt2+6FxGtr2m2kk9J2vPzSwsazK7rDsYsUvWhM4XFUST2ysIpydcoUqYTEIRgxU=@vger.kernel.org
X-Gm-Message-State: AFuF++l+JRQkQeBv3aTXo/wmEop9I8PcVd/nX3FCC5PEpsqInS2np8l1
	XGr38vLO6OF5Yr3N3IzF3SuydxYfrZz8n2y5N002JXK0dEcvVOY4mWaoYUKZWH+/dsDPkZzcpIw
	aJjDif3gP3Azs6oEgls6F3II1oCBswU5sYEEBXpnE
X-Gm-Gg: AYBFou16lgScy1b0NgFry3vQVMMW7AfW14fIDVzvDiqnUO8UdfFHNKU3fCF3FOJs6QT
	qlKuHQAmYpiP2PHqOtZikwzgYToKvyHfggrjTq7LYrZXeKqOLrlSDruSki1I0K+Ae4g+JIQK5zx
	6Wa6N5JT4IPso2jFgDjr2PdsxFYpeOEnUVAyYiZkV3dowuRUppyY21W2FIguxWacasTMNeHHums
	Ekh86CWaR18i8Miuz4nd2m9o1rAC+ILc/yBgEQDfl+XtaWVEfoqeEIy5pKwwnlLC2lxJXaXXlmw
	6cQUejdaz6dFdFud3hmo5Hfm0tMeFf6/TXv9RfSzazvNdeHvAK3TL1auaDXAh3dZQ3Q3u4BPSsT
	oW0RZ1tws
X-Received: by 2002:a05:622a:248a:b0:530:4381:e745 with SMTP id
 d75a77b69052e-53065e09975mr57662611cf.10.1788887680279; Tue, 08 Sep 2026
 10:14:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908152053.192830-1-adrian.hunter@intel.com>
In-Reply-To: <20260908152053.192830-1-adrian.hunter@intel.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 8 Sep 2026 10:14:29 -0700
X-Gm-Features: AcwNN1XltQf19Ey6oq449cA6CXMDbtRn39Dr-pAV5hAwRRGJUgEcpH4Z84Ojdh0
Message-ID: <CAP-5=fUY9H-26_CAE6yLXr9ci6F4Wia3BsFJjeDqbPo1qcO7Eg@mail.gmail.com>
Subject: Re: [PATCH] perf test: waiting.sh: Replace timestamp polling with sleep
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 8:21=E2=80=AFAM Adrian Hunter <adrian.hunter@intel.c=
om> wrote:
>
> The waiting helpers implement timeouts using:
>
>   date +%s%1N
>
> This relies on GNU coreutils date truncating %N to the specified width,
> so %1N yields tenths of a second.
>
> Rust coreutils (uutils) interprets the width differently and does not
> truncate the nanoseconds field.  Consequently "date +%1N" returns all
> nine nanosecond digits, causing the elapsed-time calculation to be done
> in nanoseconds while timeout values remain in tenths of a second.
>
> As a result, timeout comparisons succeed immediately and the waiting
> helpers time out on their first iteration.  This causes
> test_intel_pt.sh to fail on systems using uutils "date".
>
> Avoid implementation-specific date formatting entirely.  Instead, wait
> for 100 ms on each iteration and count the timeout down.  Besides fixing
> the portability issue, this removes the busy-waiting behaviour in
> wait_for_perf_to_start(), which could otherwise consume CPU while
> waiting for perf record to start.
>
> Since the timeout is now based on repeated sleeps, it is only
> approximate.  Update the comments accordingly.  Also make is_running()
> wait for exactly the documented number of tenths by changing its timeout
> test from -gt to the new logic, and quote tm_out in the modified code.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/tests/shell/lib/waiting.sh | 34 +++++++++++++--------------
>  1 file changed, 16 insertions(+), 18 deletions(-)
>
> diff --git a/tools/perf/tests/shell/lib/waiting.sh b/tools/perf/tests/she=
ll/lib/waiting.sh
> index 3a152892e077..43f4322dbe9e 100644
> --- a/tools/perf/tests/shell/lib/waiting.sh
> +++ b/tools/perf/tests/shell/lib/waiting.sh
> @@ -1,77 +1,75 @@
>  #!/bin/bash
>  # SPDX-License-Identifier: GPL-2.0
>
> -tenths=3Ddate\ +%s%1N
> -
>  # Wait for PID $1 to have $2 number of threads started
> -# Time out after $3 tenths of a second or 5 seconds if $3 is ""
> +# Time out after approx. $3 tenths of a second or 5 seconds if $3 is ""
>  wait_for_threads()
>  {
>         tm_out=3D$3 ; [ -n "${tm_out}" ] || tm_out=3D50
> -       start_time=3D$($tenths)
>         while [ -e "/proc/$1/task" ] ; do
>                 th_cnt=3D$(find "/proc/$1/task" -mindepth 1 -maxdepth 1 -=
printf x | wc -c)
>                 if [ "${th_cnt}" -ge "$2" ] ; then
>                         return 0
>                 fi
> -               # Wait at most tm_out tenths of a second
> -               if [ $(($($tenths) - start_time)) -ge $tm_out ] ; then
> +               if [ "${tm_out}" -le 0 ] ; then
>                         echo "PID $1 does not have $2 threads"
>                         return 1
>                 fi
> +               sleep 0.1
> +               tm_out=3D$((tm_out - 1))
>         done
>         return 1
>  }
>
>  # Wait for perf record -vvv 2>$2 with PID $1 to start by looking at file=
 $2
>  # It depends on capturing perf record debug message "perf record has sta=
rted"
> -# Time out after $3 tenths of a second or 5 seconds if $3 is ""
> +# Time out after approx. $3 tenths of a second or 5 seconds if $3 is ""
>  wait_for_perf_to_start()
>  {
>         tm_out=3D$3 ; [ -n "${tm_out}" ] || tm_out=3D50
>         echo "Waiting for \"perf record has started\" message"
> -       start_time=3D$($tenths)
>         while [ -e "/proc/$1" ] ; do
>                 if grep -q "perf record has started" "$2" ; then
>                         echo OK
>                         break
>                 fi
> -               # Wait at most tm_out tenths of a second
> -               if [ $(($($tenths) - start_time)) -ge $tm_out ] ; then
> +               if [ "${tm_out}" -le 0 ] ; then
>                         echo "perf recording did not start"
>                         return 1
>                 fi
> +               sleep 0.1
> +               tm_out=3D$((tm_out - 1))
>         done
>         return 0
>  }
>
>  # Wait for process PID %1 to exit
> -# Time out after $2 tenths of a second or 5 seconds if $2 is ""
> +# Time out after approx. $2 tenths of a second or 5 seconds if $2 is ""
>  wait_for_process_to_exit()
>  {
>         tm_out=3D$2 ; [ -n "${tm_out}" ] || tm_out=3D50
> -       start_time=3D$($tenths)
>         while [ -e "/proc/$1" ] ; do
> -               # Wait at most tm_out tenths of a second
> -               if [ $(($($tenths) - start_time)) -ge $tm_out ] ; then
> +               if [ "${tm_out}" -le 0 ] ; then
>                         echo "PID $1 did not exit as expected"
>                         return 1
>                 fi
> +               sleep 0.1
> +               tm_out=3D$((tm_out - 1))
>         done
>         return 0
>  }
>
> -# Check if PID $1 is still running after $2 tenths of a second
> +# Check if PID $1 is still running after approx. $2 tenths of a second
>  # or 0.3 seconds if $2 is ""
>  is_running()
>  {
>         tm_out=3D$2 ; [ -n "${tm_out}" ] || tm_out=3D3
> -       start_time=3D$($tenths)
>         while [ -e "/proc/$1" ] ; do
> -               # Check for at least tm_out tenths of a second
> -               if [ $(($($tenths) - start_time)) -gt $tm_out ] ; then
> +               if [ "${tm_out}" -le 0 ] ; then
>                         return 0
>                 fi
> +               sleep 0.1
> +               tm_out=3D$((tm_out - 1))
>         done
>         echo "PID $1 exited prematurely"
>         return 1
> --
> 2.53.0
>
