Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794835419;
	b=gljjaHl4HCdtynpBA8AjlPW7IZ8P0tS6DaD4EM1VTpQ4pTM2UBjWs0i/5EHoBF7DFMdW
	 1cZ0YqoVQlmrJAFQIodc3zEi2V4ZJyGK1vP9B6IUvRC4T0sS9ePczcWTQ+W/yh6q/cJdF
	 iSEziEjdn+wLG+BLYRpEydjGZdJIXoBAgUX14Ia9RNJEl/Qv1saahs0l+2QPDJM7oUH4J
	 aNUqAQgBpybQiLrjopbnF3muo9B2A8V6ICfGe5THNchKyLKHMXQ5+TE7pJ9+xVlKU709+
	 ox2ypXNlkOL9iR35BzDoE2HzYVjs7OX38TINUOCQDzjC44uIZTSUnmfLwfumIMzSTnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835419;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=RYsoqp1/ev3IQtXwEiYuYGJMaPKWP9H5BcryrcsazBw=;
	b=mUTLgLaTpH5qnBfXi7z/CFfcLgA/Ef7C6tpKAp8QMN9RwKPQswSwAeH6AAZyiRZcG300
	 WkbLveWMMf51EICGsBsXKjnGi+stGmWcygIKLQpsBTCHYXTkhYI0Y10gZCazCiPAaaKOy
	 h5NmbvJMz3BcVhPjyBj2c+JJ8AaSrPEs8iykoMGzCYL2UCbhgSlj7LTC1MiO+r32hdWOS
	 iELLfAQxZW316bmUyHJtjDHpJMmD/x/yw+UDSWOcPf7mgDPFumNP5/xxieS7VmBqxNJJB
	 YSdQHlcWcOlbXajVY8zjvAkZEAf4u7AThoRYl1lx+Kbz5ZgPxfGMIIEdAbFxYfwth0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L9kEuVTk;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=JHpFSz3P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DC9606A330
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:23:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38DC9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L9kEuVTk;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=JHpFSz3P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794835417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RYsoqp1/ev3IQtXwEiYuYGJMaPKWP9H5BcryrcsazBw=;
	b=L9kEuVTkL2hwFu0iykCgmX5eVz5QG6svzfBcqXHP6KyouHq+uD7/r6hyd+leCO4xbE2hY+
	5f6xQipjdsDOwqpU8O/S+xv/vQX5LxIQGr4bZsipyUVSwNxX3tn6iWhBYSD47Xv1cnZl5h
	5sueR1wDtIivBirpuG9QddVN5BQXnRI=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-3IJY4BCGMX6McWnpnJogCw-1; Mon, 16 Nov 2026 08:23:35 -0500
X-MC-Unique: 3IJY4BCGMX6McWnpnJogCw-1
X-Mimecast-MFC-AGG-ID: 3IJY4BCGMX6McWnpnJogCw_1794835415
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b647bbf87aso2623303b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:23:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794835415; cv=none;
        d=google.com; s=arc-20260327;
        b=mGmX1BwQuZGrYrsuRt416rqNqXitTlbQLXpAHjAUmh4J3FtXWMnKpZn8wwlTgDK257
         8vVby7HGbMfoma1ip4khcB38Lqvc/sKCZAY961s0L5JLwQI9obRqHwJc+qq3u6vYHvq8
         lExRzhJyYdYONUFuv5bnDwttH5fVpXWignxrlLFwWNyNSpz0QSovG+dqoeFdg3oQPIZ4
         leLHJuwtm4iOmWjdjoh5gC3s2sx04BGLaKoJIoGMpA2dg1KHR5Wxo1zABpeN7UTCK1dv
         EVRECc9zb+tiEspzriiXCdvYtnX2BL0jScop5LvLqDM2t1xyz1rBZEeI5hEE/zwHYt8Y
         upwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RYsoqp1/ev3IQtXwEiYuYGJMaPKWP9H5BcryrcsazBw=;
        fh=Uo8MUwFrFH7OW4yI3bGINszIBVCoJy3/QFjpZGdcts0=;
        b=W05UfsyVC0f7wC+P4uXOUKruVcfx4U4EJcUDL3a2zFwFi1sSt7Xe04MY6aqmuhkhu+
         H4v25S9WFx4JkeebaAc1K9+lxp2sqOYEyfXmGyHeDFu8FNEbcFjQOXtSWR3iUHn6r6Sz
         zsKwCTtFuZ9YJoYg35zTUSfDRw3jOgCvxbrwzwoXxRUwRHP34kGf7em39VwQPHqypGMN
         43ThIND52Ubo4K2f7qS99PLFfN1dtyLP4oVZcZhjbqHWlgsh8yIjGfmtcrMODrMI8tz2
         0Ubk0x2/DivP3uIXsGKSY0KVjhWVenRVhn2yRElkdqwxl5Y5rqRWIOcG5XRrrPfWJg6P
         O9ew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794835415; x=1795440215; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RYsoqp1/ev3IQtXwEiYuYGJMaPKWP9H5BcryrcsazBw=;
        b=JHpFSz3PZhSrnn4NMSgJtNYnZaAUC2S9z5v2Oj/EDCloYeCTBqP4HJT35vWOivpqn6
         vuAKYrIgYyyGLw7klnJ625aPN2LRYYeGbnV4QUAEOSa/2Am6qcWy97Nn5Dl3lEriamGI
         33Hwomp4CCBC1Uk5pXRGiY++Fn0Yp+mQdddfiu5uXKcFjETAjO97wUE/FQecetastNVU
         vYsvxEOka1UHJ9OpFtNwFIXd2GiKGXV7F44qosHcexpGDb4c4QZyeCtjp53ByUwR3hX3
         Qt2sAZ3DYFShNuXMwuELxgc7nXyv0nT675YblggaygYZxvFhTsGrYsBTWFxOUTOrO1uE
         v94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835415; x=1795440215;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RYsoqp1/ev3IQtXwEiYuYGJMaPKWP9H5BcryrcsazBw=;
        b=KPoEajgcuLTcaCw6avcd+6QgHUWzP/SxAsBKCo0ytus6oQ311UyNlC3p0HivWrRO1f
         MoaApTsCllp90ZH5Oz+85QOGTI2KZ5zPHs0THL2EMrkmcnFDiMbSK0eDi2jSg7N9zrEc
         oL0Bf0W7gPQLF7AtCCAOqgXYtz0aD3sNvq8lOciyatX7bappKkex3POwiO+0N6RYOYO3
         c1BBx2rn+WjQB6YCdFoIGSGq2gA3vho5ApNulFgH/OvKeoYltWg+y/NWXa82Zajs521m
         prZJ9/zOe+G+MwFo1fxEbk8nJRFJU4zL2gHda0ncZb5VJVcJ91YEYULJJyRqOXqLWeFL
         6xcQ==
X-Forwarded-Encrypted: i=1; AL+hErHTtJJuId4pIwuE1njK5FkqkvzShi9mVnABRbhU6l7uwFtoIQRhgOxQYaoTIcO2pUfmMV3lJOQFxKXxJpc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LCDJdl6gbb9f71Y62fs6ASR0wjRfbvAKNcIFzHqfH/lkZhV3R
	sko5w10EHPBffUOJXYZ6dCw38ECIKGrruBkH8ZvqHjIDjVP39znJAMJZFLu7w8+SvvRMgpIVrvD
	rTkbLQDAJwoXmnUEnNFgGFl8A7s7fFopQvgBGUTp2LriofzoW/FSIVwXfC8PSEt7JO7Nkb0R4jG
	ifnnCuaQPq5O/CHJ2UE54TNzGNSz3+zcSXwmqSS70c
X-Gm-Gg: AYBFou2YSigSblKALyBhpYYiX76gqGraET4MlftvCXjWjYYppuBRvBynyCTGm1vXSwj
	b3OKUc8aSb5UgZrKYTNLlKtfy81qDLgANCQmZbj6uJ5IVEcKrA7dDcq98NeVjWnR4+tyXtOgdzU
	tHcZ7Id7BnXWD/+O383vTsso0AZ7v3hCNwLKbkg0p5AnyFyAeYGN/fcOUba9sFMqqapmN2PfGid
	P6mBTNynPGTnQk=
X-Received: by 2002:a05:6a00:1995:b0:88d:6375:af06 with SMTP id d2e1a72fcca58-8beb59bfd02mr9986391b3a.23.1794835414393;
        Mon, 16 Nov 2026 05:23:34 -0800 (PST)
X-Received: by 2002:a05:6a00:1995:b0:88d:6375:af06 with SMTP id
 d2e1a72fcca58-8beb59bfd02mr9986356b3a.23.1794835413681; Mon, 16 Nov 2026
 05:23:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <1794300001.11111.1234567890@gmail.com>
In-Reply-To: <1794300001.11111.1234567890@gmail.com>
From: Tomas Glozar <tglozar@redhat.com>
Date: Mon, 16 Nov 2026 14:23:22 +0100
X-Gm-Features: AclHuK8jBP4ZIgmZqIP4dayGkNXHhFTEB8vBvk0AIJ3GdDPCfwsCt91XQXXmej8
Message-ID: <CAP4=nvRt+dXpQG0TRH8XcXU7TCPkttM+aKLA_GGw_+edhHyPBg@mail.gmail.com>
Subject: Re: [PATCH v2] rtla: clean up tracefs instances on SIGTERM, and test
 the abnormal exits
To: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
Cc: linux-trace-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 7:29=E2=80=AFAM Chaosheng Qu
<chaosheng.qu.linux@gmail.com> wrote:
>
> rtla: clean up tracefs instances on SIGTERM, and test the abnormal exits
>

The commit summary is taken from the email's subject (without the
"[PATCH]" prefix), thus, it should not be repeated in the body. If I
apply this using "git am", I will get:

    rtla: clean up tracefs instances on SIGTERM, and test the abnormal exit=
s

    rtla: clean up tracefs instances on SIGTERM, and test the abnormal exit=
s

    rtla creates a tracefs instance for each run and removes it on the norm=
al
    exit path. If the process is interrupted, killed by its own -d timer, o=
r if
    an --on-threshold shell action fails, the instance is left behind and t=
he
    next invocation finds it in use.
    ...

i.e. the commit summary duplicated.

> rtla creates a tracefs instance for each run and removes it on the normal
> exit path. If the process is interrupted, killed by its own -d timer, or =
if
> an --on-threshold shell action fails, the instance is left behind and the
> next invocation finds it in use.
>
> Install a SIGTERM handler next to the existing SIGINT one, so the same
> cleanup runs for both, and add a test that walks each of those paths and
> checks that the instance is gone afterwards.
>

I am confused. Interrupting the process and the "-d" timer send SIGINT
or SIGALRM respectively. As far as I am aware, those signals are
already handled correctly:

[root@cs9 tmp]# rtla timerlat top -q -c 0 -d 1s
                                     Timer Latency
  0 00:00:03   |          IRQ Timer Latency (us)        |
Thread Timer Latency (us)      |    Ret user Timer Latency (us)
CPU COUNT      |      cur       min       avg       max |      cur
  min       avg       max |      cur       min       avg       max
  0 #1000      |        0         0         0        18 |        2
    2         3        22 |        3         2         4        30
---------------|----------------------------------------|------------------=
----------------------|---------------------------------------
ALL #1000   e0 |                  0         0        18 |
    2         3        22 |                  2         4        30
[root@cs9 tmp]# ls /sys/kernel/tracing/instances/
[root@cs9 tmp]#
[root@cs9 tmp]# rtla timerlat top -q -c 0 -d 1s -T 1 --on-threshold
shell,command=3Dfalse
                                     Timer Latency
  0 00:00:01   |          IRQ Timer Latency (us)        |
Thread Timer Latency (us)      |    Ret user Timer Latency (us)
CPU COUNT      |      cur       min       avg       max |      cur
  min       avg       max |      cur       min       avg       max
  0 #1         |        1         1         1         1 |        7
    7         7         7 |        -         -         -         -
---------------|----------------------------------------|------------------=
----------------------|---------------------------------------
ALL #1      e0 |                  1         1         1 |
    7         7         7 |                  -         -         -
|[root@cs9 tmp]#
[root@cs9 tmp]# ls /sys/kernel/tracing/instances/
[root@cs9 tmp]#
[root@cs9 tmp]# rtla timerlat top -q -c 0
^C                                     Timer Latency
  0 00:00:02   |          IRQ Timer Latency (us)        |
Thread Timer Latency (us)      |    Ret user Timer Latency (us)
CPU COUNT      |      cur       min       avg       max |      cur
  min       avg       max |      cur       min       avg       max
  0 #605       |        1         0         5      2148 |        5
    2         8      2159 |        6         2         9      2179
---------------|----------------------------------------|------------------=
----------------------|---------------------------------------
ALL #605    e0 |                  0         5      2148 |
    2         8      2159 |                  2         9      2179
[root@cs9 tmp]# ls /sys/kernel/tracing/instances/
[root@cs9 tmp]#

SIGTERM is not related to either (but see my comment about SIGTERM down bel=
ow).

> The test harness had two bugs, both reported by sashiko:
>
>   - The availability probe ran "$RTLA" --version. rtla has no --version:
>     main() only understands -h/--help and the three subcommands, and
>     anything else falls through to rtla_usage(), which exits 129. The pro=
be
>     therefore always failed and the whole suite reported SKIP, so none of
>     these cases ever ran. Probe --help instead, require exit 129 and the
>     version banner, which is what the other rtla tests already do.
>
>   - The TAP wrapper treated any line starting with "SKIP: " from the help=
er
>     as a group-level skip. A subtest that could not cross the threshold o=
n
>     an idle machine printed one of those, which marked the entire test as
>     skipped and left the loop below it unreachable. Per-case skips now sa=
y
>     "note:", and only real group-level skips keep the SKIP: prefix.
>

Does this refer to fixes of bugs Sashiko found in the previous version
of the patch? If so, it shouldn't go into the commit description, but
below the "---" line, so that it won't be picked into the final commit
message.

> Assisted-by: LLM
> Signed-off-by: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
>
> ---

Please add a link to the previous version of your patch (see here [1]
for an example), especially in cases like this one where the follow-up
patch has a different subject. I assume this supersedes both patches
in this thread [2]. Is that correct?

It appears to me that a portion of the information got dropped from
the commit message of [2] and it got replaced by a change log
referencing bugs found in v2 by Sashiko. A patch submission should
include all necessary information for review, including clear
references to older versions of itself.

[1] https://lore.kernel.org/linux-trace-kernel/20260929142944.1841462-1-tgl=
ozar@redhat.com/
[2] https://lore.kernel.org/linux-trace-kernel/20261017122359.402696-1-chao=
sheng.qu.linux@gmail.com/

> diff --git a/tools/tracing/rtla/src/common.c b/tools/tracing/rtla/src/com=
mon.c
> index 8c7f5e7..b86a600 100644
> --- a/tools/tracing/rtla/src/common.c
> +++ b/tools/tracing/rtla/src/common.c
> @@ -39,6 +39,7 @@ static void stop_trace(int sig)
>  static void set_signals(struct common_params *params)
>  {
>         signal(SIGINT, stop_trace);
> +       signal(SIGTERM, stop_trace);
>         if (params->duration) {
>                 signal(SIGALRM, stop_trace);
>                 alarm(params->duration);
> @@ -51,6 +52,7 @@ static void set_signals(struct common_params *params)
>  static void unset_signals(struct common_params *params)
>  {
>         signal(SIGINT, SIG_DFL);
> +       signal(SIGTERM, SIG_DFL);
>         if (params->duration) {
>                 alarm(0);
>                 signal(SIGALRM, SIG_DFL);

I agree with also handling SIGTERM, which is sent for example by the
operating system using shutdown; for debugging purposes, SIGQUIT can
be used.

> diff --git a/tools/tracing/rtla/tests/cleanup.t b/tools/tracing/rtla/test=
s/cleanup.t
> new file mode 100644
> index 0000000..176b1a9
> --- /dev/null
> +++ b/tools/tracing/rtla/tests/cleanup.t
> @@ -0,0 +1,70 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Verify that rtla removes the tracefs instance it created on the abnorm=
al
> +# exit paths users actually hit:
> +#
> +#   - SIGINT during a run            (interactive Ctrl-C)
> +#   - SIGTERM during a run
> +#   - rtla's own -d/--duration timer
> +#   - a failing --on-threshold shell action
> +#   - several interrupted runs in a row, followed by a normal run
> +#
> +# A leaked instance pollutes the next invocation.
> +source tests/engine.sh
> +test_begin
> +
> +set_timeout 2m
> +
> +#
> +# These cases need to run rtla in the background and signal it, which
> +# engine.sh's check() (one foreground command) cannot express.
> +#
> +run_cleanup_cases() {
> +       local helper=3D"$testdir/scripts/check-cleanup.sh"
> +       local out rc timeout_cmd skip
> +
> +       ctr=3D$((ctr + 1))
> +       [ -z "$TEST_COUNT" ] && return
> +
> +       if [ ! -x "$helper" ]; then
> +               echo "not ok $ctr - cleanup helper is not executable"
> +               return
> +       fi
> +
> +       # check() normally does this before every test. Do the same here,=
 both to
> +       # leave a clean tracer state and to make a hung helper terminate.
> +       reset_osnoise || {
> +               echo "ok $ctr - instances cleaned up on SIGINT, timeout a=
nd action failure # SKIP tracefs is not writable"
> +               return
> +       }
> +       timeout_cmd=3D${TIMEOUT:-timeout -v -k 15s 2m}
> +
> +       out=3D$($timeout_cmd "$helper" "$RTLA" 2>&1)
> +       rc=3D$?
> +       if [ $rc -eq 0 ]; then
> +               # "SKIP:" is what the helper prints when it could not run=
 at all
> +               # (no writable tracefs, or the binary is unusable); a per=
-case skip
> +               # says "note:" instead. So the first SKIP: line means not=
hing ran.
> +               skip=3D$(printf '%s\n' "$out" | sed -n 's/^SKIP: //p' | h=
ead -n 1)
> +               if [ -n "$skip" ]; then
> +                       echo "ok $ctr - instances cleaned up on SIGINT, t=
imeout and action failure # SKIP $skip"
> +                       return
> +               fi
> +               printf '%s\n' "$out" | sed -n 's/^note: /# note: /p'
> +               echo "ok $ctr - instances cleaned up on SIGINT, timeout a=
nd action failure"
> +       elif [ $rc -eq 124 ] || [ $rc -eq 137 ]; then
> +               echo "not ok $ctr - instances cleaned up on SIGINT, timeo=
ut and action failure"
> +               echo "# helper timed out after 2m"
> +       else
> +               echo "not ok $ctr - instances cleaned up on SIGINT, timeo=
ut and action failure"
> +               echo "# helper exited $rc"
> +               printf '%s\n' "$out" | while read -r line; do
> +                       echo "# $line"
> +               done
> +       fi
> +}
> +
> +run_cleanup_cases
> +
> +test_end
> diff --git a/tools/tracing/rtla/tests/scripts/check-cleanup.sh b/tools/tr=
acing/rtla/tests/scripts/check-cleanup.sh
> new file mode 100755
> index 0000000..c27db96
> --- /dev/null
> +++ b/tools/tracing/rtla/tests/scripts/check-cleanup.sh
> @@ -0,0 +1,211 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Verify that rtla removes the tracefs instances it created, even when i=
t is
> +# interrupted (SIGINT/SIGTERM), killed by its own timeout, or when a she=
ll
> +# action fails.
> +#
> +# This is a *test* for tools/tracing/rtla; it does not change rtla behav=
iour.
> +#
> +# Requires: root, tracefs mounted at /sys/kernel/tracing, CONFIG_OSNOISE=
_TRACER.
> +# Usage: rtla_cleanup_test.sh /path/to/rtla
> +
> +RTLA=3D${1:-rtla}
> +TRACEFS=3D${TRACEFS:-/sys/kernel/tracing}
> +INSTANCES=3D$TRACEFS/instances
> +FAIL=3D0
> +PASS=3D0
> +
> +log()  { printf '%s\n' "$*"; }
> +pass() { PASS=3D$((PASS+1)); log "PASS: $*"; }
> +fail() { FAIL=3D$((FAIL+1)); log "FAIL: $*"; }
> +cleanup_all() {
> +       for i in osnoise_top osnoise_hist timerlat_top timerlat_hist hwno=
ise_top; do
> +               [ -d "$INSTANCES/$i" ] && rmdir "$INSTANCES/$i" 2>/dev/nu=
ll
> +       done
> +}
> +
> +# Wait up to $2 ms for $1 to disappear.
> +wait_gone() {
> +       _path=3D$1
> +       _ms=3D${2:-5000}
> +       _i=3D0
> +       while [ -d "$_path" ] && [ $_i -lt $_ms ]; do
> +               sleep 0.05
> +               _i=3D$((_i+50))
> +       done
> +       [ ! -d "$_path" ]
> +}
> +
> +# Wait until $1 exists (up to $2 ms).
> +wait_present() {
> +       _path=3D$1
> +       _ms=3D${2:-10000}
> +       _i=3D0
> +       while [ ! -d "$_path" ] && [ $_i -lt $_ms ]; do
> +               sleep 0.05
> +               _i=3D$((_i+50))
> +       done
> +       [ -d "$_path" ]
> +}
> +
> +if [ ! -d "$INSTANCES" ] || [ ! -w "$INSTANCES" ] ||
> +   [ ! -d "$TRACEFS/osnoise" ]; then
> +       log "SKIP: tracefs, writable instances or CONFIG_OSNOISE_TRACER u=
navailable"
> +       exit 0
> +fi
> +
> +# Leave nothing behind from the test before it starts, and make sure the
> +# command under test is actually usable.
> +#
> +# rtla has no --version: main() only knows -h/--help and -usage, and any=
thing
> +# else falls through to rtla_usage(), which exits 129 after printing the
> +# version banner. Probing --version therefore always failed and the whol=
e test
> +# suite silently reported SKIP. Accept 129 as "this binary works".
> +cleanup_all
> +if [ ! -x "$RTLA" ]; then
> +       log "SKIP: $RTLA is not executable"
> +       exit 0
> +fi
> +help_out=3D$("$RTLA" --help 2>&1)
> +rtla_rc=3D$?
> +if [ "$rtla_rc" -ne 129 ] ||
> +   ! printf '%s\n' "$help_out" | grep -q 'rtla version'; then
> +       log "SKIP: $RTLA is not usable (--help exited $rtla_rc, no versio=
n banner)"
> +       exit 0
> +fi
> +
> +# Kill a background rtla if a case fails before reaping it.
> +stop_pid() {
> +       [ -n "$1" ] || return
> +       kill -KILL "$1" 2>/dev/null
> +       wait "$1" 2>/dev/null
> +}
> +
> +# Wait for an rtla instance and its signal handler.  The instance appear=
s
> +# before set_signals() runs, so wait for rtla to start its workload (or =
at
> +# least for it to survive a short grace period) before sending SIGINT.
> +wait_running() {
> +       _path=3D$1
> +       _pid=3D$2
> +       wait_present "$_path" 10000 || return 1
> +       sleep 1
> +       kill -0 "$_pid" 2>/dev/null
> +}
> +
> +# ----------------------------------------------------------------------=
-----
> +# 1. SIGINT during a long run
> +# ----------------------------------------------------------------------=
-----
> +cleanup_all
> +$RTLA osnoise top -q -d 30s -P F:1 >/dev/null 2>&1 &
> +pid=3D$!
> +if ! wait_running "$INSTANCES/osnoise_top" "$pid"; then
> +       fail "SIGINT: instance was never created (rtla did not start?)"
> +       stop_pid "$pid"
> +else
> +       kill -INT "$pid" 2>/dev/null
> +       wait "$pid" 2>/dev/null
> +       if wait_gone "$INSTANCES/osnoise_top"; then
> +               pass "SIGINT: instance removed after interrupt"
> +       else
> +               fail "SIGINT: instance still present after interrupt"
> +       fi
> +fi
> +
> +# ----------------------------------------------------------------------=
-----
> +# 2. SIGTERM during a long run
> +# ----------------------------------------------------------------------=
-----
> +cleanup_all
> +$RTLA osnoise top -q -d 30s -P F:1 >/dev/null 2>&1 &
> +pid=3D$!
> +if ! wait_running "$INSTANCES/osnoise_top" "$pid"; then
> +       fail "SIGTERM: instance was never created (rtla did not start)"
> +       stop_pid "$pid"
> +else
> +       kill -TERM "$pid" 2>/dev/null
> +       wait "$pid" 2>/dev/null
> +       if wait_gone "$INSTANCES/osnoise_top"; then
> +               pass "SIGTERM: instance removed after terminate"
> +       else
> +               fail "SIGTERM: instance still present after terminate"
> +       fi
> +fi
> +
> +# ----------------------------------------------------------------------=
-----
> +# 3. rtla's own -d timeout path
> +# ----------------------------------------------------------------------=
-----
> +cleanup_all
> +$RTLA osnoise top -q -d 2s -P F:1 >/dev/null 2>&1
> +rc=3D$?
> +if [ "$rc" -ne 0 ]; then
> +       fail "self-timeout: rtla failed to start or run (exit=3D$rc)"
> +elif wait_gone "$INSTANCES/osnoise_top"; then
> +       pass "self-timeout: instance removed (exit=3D$rc)"
> +else
> +       fail "self-timeout: instance still present (exit=3D$rc)"
> +fi
> +
> +# ----------------------------------------------------------------------=
-----
> +# 4. shell action failure (-a / --on-threshold shell,command=3D...)
> +# ----------------------------------------------------------------------=
-----
> +# -S is the stop-total threshold and yields exit 2 when the action fails=
.
> +# A shell action only runs if that threshold is crossed; an idle machine=
 may
> +# never do so.  Do not call the no-threshold case a pass.
> +cleanup_all
> +action_rc=3D0
> +for n in 1 2 3; do
> +       $RTLA osnoise top -q -d 5s -P F:1 -r 900000 -S 1 \
> +               --on-threshold 'shell,command=3D"/bin/false"' >/dev/null =
2>&1
> +       rc=3D$?
> +       action_rc=3D$rc
> +       [ "$rc" -eq 2 ] && break
> +done
> +if [ "$action_rc" -eq 0 ]; then
> +       # Not a group-level skip: the other cases still ran. Prefix it so=
 the
> +       # TAP wrapper does not report the whole test as skipped.
> +       log "note: action-failure: stop-total threshold was not crossed"
> +elif [ "$action_rc" -ne 2 ]; then
> +       fail "action-failure: unexpected exit=3D$action_rc (wanted 2)"
> +elif wait_gone "$INSTANCES/osnoise_top"; then
> +       pass "action-failure: instance removed (exit=3D$action_rc)"
> +else
> +       fail "action-failure: instance still present (exit=3D$action_rc)"
> +fi
> +
> +# ----------------------------------------------------------------------=
-----
> +# 5. repeated interrupted runs must not poison the next run
> +# ----------------------------------------------------------------------=
-----
> +cleanup_all
> +for n in 1 2 3; do
> +       $RTLA osnoise top -q -d 20s -P F:1 >/dev/null 2>&1 &
> +       pid=3D$!
> +       if ! wait_running "$INSTANCES/osnoise_top" "$pid"; then
> +               fail "repeated interrupts: run $n never created an instan=
ce"
> +               stop_pid "$pid"
> +               continue
> +       fi
> +       kill -INT "$pid" 2>/dev/null
> +       wait "$pid" 2>/dev/null
> +       if ! wait_gone "$INSTANCES/osnoise_top"; then
> +               fail "repeated interrupts: run $n left an instance behind=
"
> +               cleanup_all
> +       fi
> +done
> +
> +$RTLA osnoise top -q -d 2s -P F:1 >/dev/null 2>&1
> +rc=3D$?
> +if [ "$rc" -eq 0 ]; then
> +       pass "repeated interrupts: following run still succeeds"
> +else
> +       fail "repeated interrupts: following run failed (exit=3D$rc)"
> +fi
> +if wait_gone "$INSTANCES/osnoise_top"; then
> +       pass "repeated interrupts: no leftover instance"
> +else
> +       fail "repeated interrupts: leftover instance"
> +fi
> +
> +cleanup_all
> +log ""
> +log "SUMMARY: $PASS passed, $FAIL failed"
> +[ "$FAIL" -eq 0 ]
>

Please send the test changes in their own commit so I can review them
separately.

Thanks,
Tomas

