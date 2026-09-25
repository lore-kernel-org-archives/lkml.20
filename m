Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE3A4CDA3C
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790350675; cv=pass; b=YB57YBsd86NVWVqIVG1PpwcWD6nEmG0zTjyjLWfpxI8ccEYhbeQMDQ0RmYnGqeRAAGVvyBBLdOts09ENboU7i8yC1+ao0ium1GuMAgaE2VQ7dFM1RG/JCygw5aED1UbByVuKi/KBOhQ4H03rx3pgKt5+DgqsTTXs/tNW5TQ2kM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790350675; c=relaxed/simple;
	bh=mKPQQujZxMNfUh0m5fG/9Me1zmKiPoB+4IPB+e75ce0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c1jgNBPmCEBY4HKUAWrf6gw1CW2d/CBaGhF8OzDIzDszFRFrBVPTbGkWgsSSp0AT4uUbNGtUnG1Qgw5m0JEb7EEgdpS82TtrZcR99H/5aqeWE6661Kg3uykxoVR3pY+Q7ij/d4sOTf5+fbys2Zqh+AHfohy6jmtGC7IoTD+2O40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vrXkCbzi; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vrXkCbzi"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-532e9ad9a1eso343871cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:37:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790350672; cv=none;
        d=google.com; s=arc-20260327;
        b=JxE6+J4+eiGLnjswgEvQXDcIKqj45Wn6EWezpPSD52R3zzRjqefm9iYVj+sgD3E+M/
         srnvbo6HvOq0dq3QR12ikehMXrvx3+RsiXfVhPSW27IPqgvf0UOeQWkuvo7k3WLmYNta
         jhCqRp9ny35dVGnL8rXxnrvsMH7jRcurjFbQ4fqggdFAvrCV1YtuD7Ji+c/dqfSzjWVB
         P3XyrrGVjzIeRNBgUJvDen6UX7HH7bdZszNH/Ti0kZIGoExOIvNQ7yyc7219Tb6GRylP
         siHdJbO8axpeLGXCsdYkUuRUH/m9Kmhcc1cfY/VJ7IoN9NvJ0uUoZSZHhFod7E6oHn0d
         Cafg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aRZHv9paNXwOCV+6sSsc+HnzJsuWsikfddWiWitjUqw=;
        fh=xP/ZgKM5G26ycznR0MmzRNco3wLsEV59RzVx7hGlDGM=;
        b=QD8LkbtezvHUsCiR3ZDDnYwa+HT75caa/rvsVyrBWdgjFd3xAKLvhaQnfdV+p6jtm7
         pbmYMCzcZ1oGwyNTVaNOALJjtE/O1YVNC3fLloeXNPl02vGEdVKEq/asmgJzFqGtvmzn
         NQxlEfD+fbM8uO94l0erTGjmWZRFciqyANAvCMqVcxCK3r5dGyY/EJPtJA4McDt1bRsF
         cQUcNBIjBKPuO+y01il83lzT2ddETWkslydnm3yoTY/6JG6UJVDobKtTW2XdP54+m33u
         RtLrG1FS9wegUt6/pO34QusEoXLDwS3rUwTicgbgODujSy+SMaE/NnRHQmdDMUX6EGFy
         lfgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790350672; x=1790955472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aRZHv9paNXwOCV+6sSsc+HnzJsuWsikfddWiWitjUqw=;
        b=vrXkCbziKUarU9/Jl1BRoGoM1ZwWCfT/QrowiWXle9CXJ7eyKRDLU8Mo7Jnc2SxInJ
         /b6T53i/SpX2wjIYU99YVS4OM7oVYmx4K9kHag+mhwhheQ8V5v6APuUIPeMbLDpceB0p
         FVA9XaMhuCdck+taPKELTpbe0P5LLOCSscl+ExhzNKaF5dr1atB8UD8LIiXVL8y1tOJ3
         chqD99H1+sldXrSkxledA4K6p42HUaNZofQZf4P1vijriOb2snv7eHhHg7GoSM5uYAgA
         pEzrxFketDWqBd+XjeNhuY/LGfxc/P9z4VZmBALwraoaHCrV157pb272YNjblGKeLhO6
         LYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790350672; x=1790955472;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aRZHv9paNXwOCV+6sSsc+HnzJsuWsikfddWiWitjUqw=;
        b=iTcq5NcTHRBqS3c5sO/bvfQMtMPLJeX4A6mFSBNeDIl8Shb74OXY+lsAeV2szAn43V
         bbaNPeuSYdHh2PzatLieryGv9kwtM5II8BaekaGBv7L59c412GEQxBleC/fyM36TCk9w
         gARs5IynMJrHtIJIvk7XkGQz2QDlRKK248s9UMheKvS2qg5Tgp9VhzizXVuXHpqQLcKe
         I9v4TQQEI0YJc4C3Ikmp4WupiPuEdSlTX87g7USKxcXVbgi5PR0PPUHomnAaVKF+qFeE
         guMZf1DT6HiIE9JCOAA4/L4aSUjTlPIIqdcfrlpbLSkWYJilmpfpPNnUcQW8TKlOmONs
         CpOw==
X-Forwarded-Encrypted: i=1; AKwUvBxV5W4ukPmbLkN5nTHdpHsMZM1F5fHFd3UJhWyQAubp5IKSt408rNp8WDKwINU6NBzt+vUPiJx2pGHLUuw=@vger.kernel.org
X-Gm-Message-State: AFuF++nrexkPWAEL2GKdh50Kz7+wSc4sNaSxWsG/Vm8iOg01dwXeontu
	aCZuuw2SP0xLj0Iz+s7y04yxsbFVAo13RKDD2lvMrLku+/N2/15n/VxVBOJv1GM58aDAYQce4P3
	X6tnpQZMoWIG6zwDRALETsKZK/hnTiyVP4uaP9G2w
X-Gm-Gg: AYBFou1o/9/62tHHiCe+RQWbrrvZle1MTJR9Hnzomg/WLlw86IGJadoB51XS17DMoq+
	QqzIyc6I6GOGE+ZkVtb1FvV5FEUc/xv3xxwBkLhzOzM4QNaohtC0Z2YBjzzPUdmyMbFUTsnPrzK
	yh8vSOhyHtvxc9DQB1/tyy2Jk1GQV43ATULUlWwlOLxRQRgxzADpsC8fBy3+/hLlPtW8r10kwWb
	E8ejFD+kvQ5IjYma2z99Uub8hykGxymW12+H9Jgp5fT7ZqLvS5k1ZbshtF9p4Cff1IpWiT62Z/X
	um3PcqUAai9ay28mvy2r6XdrOwndw6CfrdX2L+3yu9RMlpDUsIHr+MdzS9S7uMqHFoudjj3M1oo
	fgmfaIvJk8BA=
X-Received: by 2002:a05:622a:310:b0:532:d72d:3e9c with SMTP id
 d75a77b69052e-5331a7c270cmr3451761cf.6.1790350670909; Fri, 25 Sep 2026
 08:37:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925150657.1826942-1-acme@kernel.org> <20260925150657.1826942-5-acme@kernel.org>
In-Reply-To: <20260925150657.1826942-5-acme@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Fri, 25 Sep 2026 08:37:39 -0700
X-Gm-Features: AclHuK_rcMejODDQ1Icc7aDakCpLrkuQwxU-ufilDnYr9qtqZfMuP9kDEQauYJg
Message-ID: <CAP-5=fVAekxsEGy91FHXsHmvpCyx48q-8UetLJ2B7cU8sYRaUg@mail.gmail.com>
Subject: Re: [PATCH 4/6] perf annotate-data: Bound the member nesting recursion
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, James Clark <james.clark@linaro.org>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Clark Williams <williams@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 8:07=E2=80=AFAM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> From: Arnaldo Carvalho de Melo <acme@redhat.com>
>
> Members are added recursively, and a broken DIE can make a member's
> type point back at one of its own ancestors, recursing until the stack
> is gone; nothing usable comes out of nesting members 32 deep anyway, so
> stop there, marking the member as truncated and giving up on member
> types that don't resolve.
>
> The check is where the children of an aggregate would be expanded, so
> only struct/union members are marked as truncated.
>
> Assisted-by: LLM
> Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/util/annotate-data.c | 20 ++++++++++++++++++--
>  tools/perf/util/annotate-data.h |  3 +++
>  2 files changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/tools/perf/util/annotate-data.c b/tools/perf/util/annotate-d=
ata.c
> index bc9698abc6a9e055..19a6ecd67f28719d 100644
> --- a/tools/perf/util/annotate-data.c
> +++ b/tools/perf/util/annotate-data.c
> @@ -222,6 +222,12 @@ static bool data_type_less(struct rb_node *node_a, c=
onst struct rb_node *node_b)
>         return strcmp(a->self.type_name, b->self.type_name) < 0;
>  }
>
> +/*
> + * A broken type can point back at one of its own ancestors: bound the
> + * nesting so it doesn't recurse until the stack is gone.
> + */
> +#define MAX_MEMBER_DEPTH 32
> +
>  /* Recursively add new members for struct/union */
>  static int __add_member_cb(Dwarf_Die *die, void *arg)
>  {
> @@ -236,6 +242,9 @@ static int __add_member_cb(Dwarf_Die *die, void *arg)
>         if (dwarf_tag(die) !=3D DW_TAG_member)
>                 return DIE_FIND_CB_SIBLING;
>
> +       if (die_get_real_type(die, &die_mem) =3D=3D NULL)
> +               return DIE_FIND_CB_SIBLING;
> +
>         member =3D zalloc(sizeof(*member));
>         if (member =3D=3D NULL)
>                 return DIE_FIND_CB_END;
> @@ -248,8 +257,6 @@ static int __add_member_cb(Dwarf_Die *die, void *arg)
>         if (die_get_typename(die, &sb) < 0)
>                 strbuf_add(&sb, "(unknown type)", 14);
>
> -       die_get_real_type(die, &die_mem);
> -
>         if (dwarf_aggregate_size(&die_mem, &size) < 0 || size =3D=3D 0) {
>                 if (dwarf_tag(&die_mem) =3D=3D DW_TAG_array_type) { /* fl=
ex-array? */
>                         die_get_real_type(&die_mem, &die_mem);
> @@ -299,6 +306,7 @@ static int __add_member_cb(Dwarf_Die *die, void *arg)
>         }
>         member->size =3D size;
>         member->offset =3D loc + parent->offset;
> +       member->depth =3D parent->depth + 1;
>         INIT_LIST_HEAD(&member->children);
>
>         list_for_each_entry_reverse(prev, &parent->children, node) {
> @@ -313,6 +321,14 @@ static int __add_member_cb(Dwarf_Die *die, void *arg=
)
>                 member->is_union =3D true;
>                 /* fall through */
>         case DW_TAG_structure_type:
> +               /* Only aggregates have children to expand, so only they =
get truncated. */
> +               if (member->depth >=3D MAX_MEMBER_DEPTH) {
> +                       /* Consumed by the JSON exporter added in a later=
 series. */
> +                       member->truncated =3D true;
> +                       pr_debug_dtp("member nesting limit reached at %s\=
n",
> +                                    member->type_name ?: "(unknown type)=
");
> +                       break;
> +               }
>                 die_find_child(&die_mem, __add_member_cb, member, &die_me=
m);
>                 break;
>         default:
> diff --git a/tools/perf/util/annotate-data.h b/tools/perf/util/annotate-d=
ata.h
> index 14b8113521a927cf..ca0abfb2a036d229 100644
> --- a/tools/perf/util/annotate-data.h
> +++ b/tools/perf/util/annotate-data.h
> @@ -61,6 +61,9 @@ struct annotated_member {
>         int size;
>         bool is_union;
>         bool is_flex_array;
> +       unsigned int depth;
> +       /* Children not expanded because the nesting limit was reached */
> +       bool truncated;
>  };
>
>  /**
> --
> 2.53.0
>
