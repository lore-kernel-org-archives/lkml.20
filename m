Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794779195;
	b=vUr7ps7Tpx4y3qYEWQOYxslLb/h3SNsE6VBRiP/sxWGyOMcIot7cvzsuHnDUdkfnhMlq
	 FJNtT9wxtSNaGDQrBtDSjz6AWnRu91glqzrjtQsC/UqvGGuX00EV43P1OPsIZaEKHB9YU
	 AyveMUalIlDernOjJC/LfLb61rRdbVwMfan5APvc0vX4xsuE5mLaUTCUt+Zf/QGNNR0mV
	 DpSFuXNWs5W6E+S12q4KV+9l12gp8IE7ETxbvYmZkU7ROa2+ChyAu3iq/QXcJTI0NKenh
	 VbriQDmvRKk+uZ3lLMKKbLAxjomz+3B7QGHtWkshxzwQC4V383wOmxdsD1T9/dC/BVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=p5PzHnNL2AEJDBpXqAy/+xT9oZldjEjDYa8FAcA8TRk=;
	b=xCeqnMKSPImRrYZgHpy/cizAQ4SSULbTtr9kue8MrFbZW/IlYDhppYy1hG/3+xEuT+hz
	 d0UFD0bU4eDZc62/jgz+YhwbUE66TsMudkiIGtvAao0OL0mPPlGP11Qc2qFuTU0lyYx4t
	 cLexW7MGMD5M0RK4saIDAJa2/vG7JvW/hGBqBqu61sp9ChAI7wVZ0kNrQt83G1OpjQbVg
	 AdjsgvaP95CfeNE0y/MgqbIbipoJWKFhfSe74ZBLVuWNRHCpKso30ZGzvGmXRkSmc9zU3
	 YaqrN4mYyOi8MXOy162xIRWwoiuhZG8myi5t9b+cik5l42BgBExlLGqz/0ybAigWxfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="SbISZ/Tp";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79C1606A32F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:46:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B79C1606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SbISZ/Tp
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-55c7445cf85so208231cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:46:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794779194; cv=none;
        d=google.com; s=arc-20260327;
        b=pPsxp5LaOc/sZeLf0CFEZwE0+qP6dfuN7bgvxsOR9mrUJp7wWzwKJbmlOU8beTPk6K
         62vKUmQ+FgugBYHUnq37hJ/pz5MwDANYK7rC/GEaupeUEfmgDWrY5GuhL6UZi/1DpA8K
         dIK+hzDwYLSreWJ9BLG2/pwKWM6Q3WbxfpV7IvmykrbRfnkx/A4QvjSiCWs6c7nDF1d5
         z8pznP1RO3o9pLEe7Ak8qdszqisFVHNMdZhwH092zol55EFKddlolS31K5GPfmavvDJg
         u6utF77PMhEQ3JwmKmwh6DwBfQxsZbfYkcKhP2Ock8nXpJuF3d4FafHXIrJ80Q3nVkwM
         1J0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p5PzHnNL2AEJDBpXqAy/+xT9oZldjEjDYa8FAcA8TRk=;
        fh=HrpGl023Knkd6zGBWn/TTu6IguDokOV/5NvL6kvqO5A=;
        b=ZrIx4j1v6KqUrKbXygFzYdnCMV/C8nbWe1lX5stbwkko5AUoJhrI/yhbsn+sHoqshM
         0O2rhTJ1GYL0aZG9UGZhv2v4pZI8I3A2bjF6U/fjloxSQVCj7V9Y7Ac/gypE8tOwlWAM
         qabBROZaCD6pxL80bowlS6rFyEHURLRrLyTjXha02n9fq7Tg2A+74fHqxYgHrWAOBw8/
         nRt66pS4Ig5sR2fALgQzDiWkFD2Qspa4gtZ9/jeCpvtp7ASjv+1hpnR9/Ve5WoWnm52b
         roCInsqzZ3UJepVhV6oOOHkrpeHvRMsbstaJDa7kygMEfB4cWIgPHIbYY1HO+UN+mNAb
         bHMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794779194; x=1795383994; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p5PzHnNL2AEJDBpXqAy/+xT9oZldjEjDYa8FAcA8TRk=;
        b=SbISZ/TpilfJE2cBh5ZJg73aBd0d5UTTauVJ3r21HFKQH1YANNxDTDoSUGAxdv9yDw
         m5Hr7oQf0cBym6nKOmDgB9JIwzqU+MU+GarsrbWFlxEX2Lnoql76TCOMgqNc0QjbzxRa
         VQOLUcqDCH6xAoEWp/MoUkFAVfL8C/V4L/UDPwPzmRpnEyy1P0sGzHEG/tTgnocOfx34
         XjHnCS/74myuwgDNHbypGgXAmL86XV/F+2PuorFIzm31WLvubkkrYnQF0YGdcoy56EfD
         x/I06x6uYlHA8FJd8eCkpvPq3V/21wg439JuW/XB17EtINq5M5UtNRiKzwgCEVqiyBBi
         3RCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794779194; x=1795383994;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p5PzHnNL2AEJDBpXqAy/+xT9oZldjEjDYa8FAcA8TRk=;
        b=dD02fi3SdQ21bva4/jWSD/7X3EnRn/EUnLSJVJZpr7ebw4/VSekxnpV2HIB3Xw1EDQ
         +i4DxW0WxAaszTLE7ctMLNdXMOvbZXhRc3ypQFfp0EyCmtvZld9pFqbS07x1WUU7NmRP
         PaI3n3opP9fhYR1lL2eIcz40PCvH4HntQnxj179IgfCNbGry0UfzaNvfHO+o3T7lbcXb
         QtLTaO6O54dvTBoSw+VITCeVNFx6s2EwHr1iXjypWViWMZchPIeaeEfYHV6Ty5XLZaYo
         BE4faw3ooJaV1FrJDCKOmafPOO105Ekt+7ZUnF5tMrJdMXAq55cqNvAZSFA66Y1OZ4CX
         PuvQ==
X-Forwarded-Encrypted: i=1; AL+hErETnG6K4TW6g2hTKCZKLqQkBthML/HBxT3gIMSiRTds6MYVONRndckvjfBZUeP/9XFZsNqeFSanTHBUzSw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uvv23Kh1tEbzgcV/OT2sfWL3Q9QRVOdbPyu7mCnpMp+CDJDLr
	Ykp0zaLe5jvVC01OMN3eNpHu8FhXExjiR/7OKHSf9mgJxA470myMiAox23C+fxxEQ4irjuV+pf7
	GFF54RWvVb9UK+rJ70qhG7yUTZQe7mUE1+cqcv7xN9Jl5i+u4KfrBzXnFRgE=
X-Gm-Gg: AYBFou2qtDXi8gCdBbwhZSy7QDy+cOB0wnWKsnkFijIhWo9ToMZLtKKqgA7gkZ/f/p9
	xZ+/zaIqQzEKpo9lO6nwMpt5CcNnII9FReNC/TErre7MD/i9U0znub7+uzUb5en0GjhPPCyJVtd
	KnovMDiIEpEl3/WZjc5RQOhVocdoMD8bm7XWysu6HJBUE6IQG/jGik4trB1PYG1N1XARO50DHs6
	K0qB/NScq85Z9hnfjYt4fgYuovwrN/s+kqumJx2NGYU6ujNQ+VSmCsva4y8Mdnnl7072xBNIvWo
	EqEKC82fH8uvXj3TaUaWMBfe2CQzzjud0/1oXAM+GuzwivszVJDwYRzZs3hykP4q6f0ur7LKlAA
	UyIonq81FMddiMp3/jeMS/L+aZCkYHZiexShi
X-Received: by 2002:ac8:6908:0:b0:55b:ce7e:e65 with SMTP id
 d75a77b69052e-55c67fb2932mr26805921cf.12.1794779193017; Sun, 15 Nov 2026
 13:46:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115014102.2879372-1-acme@kernel.org> <20261115014102.2879372-6-acme@kernel.org>
In-Reply-To: <20261115014102.2879372-6-acme@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Sun, 15 Nov 2026 13:46:21 -0800
X-Gm-Features: AclHuK-OZ98Z-2CBlkFK4sBbd5Z6EYX3vCLucxTQFymZZgfWe-XBmvmtvZVlbSQ
Message-ID: <CAP-5=fVGaJ8OKcMiVLrm1Q7LK_n67xUXhMVJ99gp=Oj2qfy00g@mail.gmail.com>
Subject: Re: [PATCH v3 05/12] perf annotate-data: Count flexible array
 accesses for the whole struct
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, James Clark <james.clark@linaro.org>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Clark Williams <williams@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 5:41=E2=80=AFPM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> The per-member percentage sums the histogram entries in the member's
> own [offset, offset + size) range.  A flexible array member is resolved
> past the end of its struct, so the struct row only covered its declared
> size and showed 0.00% while the member row showed 100.00% and the
> header said N samples.
>
> Take a member's extent as the end of its last child as well, so the
> struct counts what was resolved past it.  Union members all start at
> offset 0, so a plain union keeps its size; a member that is itself a
> struct with a flexible array extends the union too.  The TUI browser
> accounts the members the same way, use the extent there as well.
>
> Extend tests/shell/data_type_flex_array.sh to check that the accesses
> count for the struct in the percent, samples and period columns.
>
> Fixes: aaca646915a1bb53 ("perf annotate-data: Adjust type offset for flex=
-array")
> Cc: Namhyung Kim <namhyung@kernel.org>
> Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  .../perf/tests/shell/data_type_flex_array.sh  | 40 ++++++++++++++++++-
>  tools/perf/ui/browsers/annotate-data.c        |  7 ++--
>  tools/perf/util/annotate-data.c               | 24 ++++++++++-
>  tools/perf/util/annotate-data.h               |  8 ++++
>  4 files changed, 72 insertions(+), 7 deletions(-)
>
> diff --git a/tools/perf/tests/shell/data_type_flex_array.sh b/tools/perf/=
tests/shell/data_type_flex_array.sh
> index 8d6b277991aea96e..c8e8ccd130abd771 100755
> --- a/tools/perf/tests/shell/data_type_flex_array.sh
> +++ b/tools/perf/tests/shell/data_type_flex_array.sh
> @@ -66,5 +66,43 @@ if ! grep -Fq "# data-type: struct flex +0x4 (data)" "=
$perfout"; then
>         exit 1
>  fi
>
> -echo "flexible array member resolved"
> +# The accesses to the flexible array are resolved past the end of the
> +# struct: they must count for the struct, not only for the member.
> +if ! perf annotate --data-type -i "$perfdata" --stdio > "$perfout" 2>/de=
v/null; then
> +       echo "FAIL: perf annotate --data-type"
> +       cleanup
> +       exit 1
> +fi
> +
> +if ! awk '
> +       $1 + 0 =3D=3D 100.00 && /struct flex/ { struct_ok =3D 1 }
> +       $1 + 0 =3D=3D 100.00 && /char\[\]/ && /data;/ { data_ok =3D 1 }
> +       $1 + 0 =3D=3D 0.00 && /int/ && /len;/ { len_ok =3D 1 }
> +       END { exit !(struct_ok && data_ok && len_ok) }
> +' <(sed -n "/^Annotate type: 'struct flex' in/,/^Annotate type: /p" "$pe=
rfout"); then
> +       echo "FAIL: --data-type does not count the flexible array accesse=
s"
> +       cleanup
> +       exit 1
> +fi
> +
> +# Same with the samples and period columns, the other two display modes.
> +for mode in --show-nr-samples --show-total-period; do
> +       if ! perf annotate --data-type -i "$perfdata" --stdio "$mode" > "=
$perfout" 2>/dev/null; then
> +               echo "FAIL: perf annotate --data-type $mode"
> +               cleanup
> +               exit 1
> +       fi
> +
> +       if ! awk '
> +               $1 + 0 > 0 && /struct flex/ { total =3D $1 + 0 }
> +               /char\[\]/ && /data;/ { data =3D $1 + 0 }
> +               END { exit !(total > 0 && total =3D=3D data) }
> +       ' <(sed -n "/^Annotate type: 'struct flex' in/,/^Annotate type: /=
p" "$perfout"); then
> +               echo "FAIL: --data-type $mode does not count the flexible=
 array accesses"
> +               cleanup
> +               exit 1
> +       fi
> +done
> +
> +echo "flexible array member resolved and counted"
>  cleanup
> diff --git a/tools/perf/ui/browsers/annotate-data.c b/tools/perf/ui/brows=
ers/annotate-data.c
> index 0f778788df4a934b..e4047e97e8a943a4 100644
> --- a/tools/perf/ui/browsers/annotate-data.c
> +++ b/tools/perf/ui/browsers/annotate-data.c
> @@ -53,12 +53,11 @@ static int get_member_overhead(struct annotated_data_=
type *adt,
>                                struct evsel *leader)
>  {
>         struct annotated_member *member =3D entry->data;
> -       int i, k;
> +       int i, k, end =3D annotated_member__extent(member);
>
> -       for (i =3D 0; i < member->size; i++) {
> +       for (i =3D member->offset; i < end; i++) {
>                 struct type_hist *h;
>                 struct evsel *evsel;
> -               int offset =3D member->offset + i;
>
>                 k =3D 0;
>                 for_each_group_evsel(evsel, leader) {
> @@ -69,7 +68,7 @@ static int get_member_overhead(struct annotated_data_ty=
pe *adt,
>                                 continue;
>
>                         h =3D &adt->histograms[evsel->core.idx];
> -                       if (hashmap__find(&h->samples, offset, &hist))
> +                       if (hashmap__find(&h->samples, i, &hist))
>                                 update_hist_entry(&entry->hists[k], hist)=
;
>                         k++;
>                 }
> diff --git a/tools/perf/util/annotate-data.c b/tools/perf/util/annotate-d=
ata.c
> index d8d00646ef63b30f..a74f894cbda70f5d 100644
> --- a/tools/perf/util/annotate-data.c
> +++ b/tools/perf/util/annotate-data.c
> @@ -2237,6 +2237,25 @@ static void print_annotated_data_value(struct type=
_hist *h, u64 period, int nr_s
>                 color_fprintf(stdout, color, " %7.2f", percent);
>  }
>
> +/*
> + * A flexible array member is resolved past the end of its parent, so th=
e
> + * parent's samples are not bounded by its size.
> + */
> +int annotated_member__extent(struct annotated_member *member)
> +{
> +       struct annotated_member *child;
> +       int end =3D member->offset + member->size;
> +
> +       list_for_each_entry(child, &member->children, node) {
> +               int child_end =3D annotated_member__extent(child);
> +
> +               if (child_end > end)
> +                       end =3D child_end;
> +       }
> +
> +       return end;
> +}
> +
>  static void print_annotated_data_type(struct annotated_data_type *mem_ty=
pe,
>                                       struct annotated_member *member,
>                                       struct evsel *evsel, int indent)
> @@ -2244,6 +2263,7 @@ static void print_annotated_data_type(struct annota=
ted_data_type *mem_type,
>         struct annotated_member *child;
>         struct type_hist *h;
>         int i, nr_events =3D 0, samples =3D 0;
> +       int end =3D annotated_member__extent(member);
>         u64 period =3D 0;
>         int width =3D symbol_conf.show_total_period ? 11 : 7;
>         struct evsel *pos;
> @@ -2257,10 +2277,10 @@ static void print_annotated_data_type(struct anno=
tated_data_type *mem_type,
>
>                 samples =3D 0;
>                 period =3D 0;
> -               for (i =3D 0; i < member->size; i++) {
> +               for (i =3D member->offset; i < end; i++) {
>                         struct type_hist_entry *entry;
>
> -                       if (!hashmap__find(&h->samples, member->offset + =
i, &entry))
> +                       if (!hashmap__find(&h->samples, i, &entry))
>                                 continue;
>
>                         samples +=3D entry->nr_samples;
> diff --git a/tools/perf/util/annotate-data.h b/tools/perf/util/annotate-d=
ata.h
> index 184262c7356213fa..6e0d410929651426 100644
> --- a/tools/perf/util/annotate-data.h
> +++ b/tools/perf/util/annotate-data.h
> @@ -260,6 +260,9 @@ void global_var_type__tree_delete(struct rb_root *roo=
t);
>  /* Print data type annotation (including members) on stdout */
>  int hist_entry__annotate_data_tty(struct hist_entry *he, struct evsel *e=
vsel);
>
> +/* End offset of a member, including a flexible array's children */
> +int annotated_member__extent(struct annotated_member *member);
> +
>  /* Get name of member field at the given offset in the data type */
>  int annotated_data_type__get_member_name(struct annotated_data_type *adt=
,
>                                          char *buf, size_t sz, int member=
_offset);
> @@ -316,6 +319,11 @@ static inline int hist_entry__annotate_data_tty(stru=
ct hist_entry *he __maybe_un
>         return -1;
>  }
>
> +static inline int annotated_member__extent(struct annotated_member *memb=
er)
> +{
> +       return member->offset + member->size;
> +}
> +
>  static inline int annotated_data_type__get_member_name(struct annotated_=
data_type *adt __maybe_unused,
>                                                        char *buf __maybe_=
unused,
>                                                        size_t sz __maybe_=
unused,
> --
> 2.56.0
>
