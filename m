Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF837515997
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902437; cv=pass; b=YLTki/323C/ED4FPUKWpB3Js2LffqPoya1AXCkH4O9CDisxPGEJnsBhe4kjChg+5L5EJEDKSS+1C/CiyEVZjDAQdFNhDbobrPQ/SiBvqelPmJbKqWNMLHxlpXXMj9rjkb6IC6l8GBnhj7iWB0ShbHyB1B4mUqanRut+tPp6MgM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902437; c=relaxed/simple;
	bh=vIyuNaXPf/fVqFdgVoqBwfybiukFL5Xa7TqVJcyhTKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j4Bf+ek3Gw3uADKmz+vU/m1sAX1BjY4ccQ4zlWttWePYJa3JviBLQhWqVQqCde51q2Y8ap270ugeWf9pvxrnkJTA6EwwUqC7GmhlGyc+ZScpl92Aykj4ej7J+9YObiTyDdCtn04lkQ9U87ywlsWHLJlKlGrt97qluVqLeDA1pC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R1fhVwD+; arc=pass smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1fhVwD+"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-917a4b69a79so38541776d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:40:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791902435; cv=none;
        d=google.com; s=arc-20260327;
        b=UZb21CC6RuL5IzZQc+LmwYhqqlXAElmCVi8rSmEiOEpH9rUsajBpmGZILopqGKwk/d
         o6ZwHKMABOk7XQIIbAqw81nAjR7UkulDLVtzSRpH3KdqW6Vg7GE+ESukdtPXwKai2gdb
         JlbRJtm7tq7xftliZgRDJn0qEJse+aPR2LVX1i+50fSW2/zKhFCNpIRyMOozAgpb0Dot
         jfM6r73ABcprrTb+g1R2VLrgPBaIzSnQ1Y7Z1AphPxeQqwrxwZjEEtZmtAndRuCJFsjK
         M+LCdVkgO+7iRFg4yBvl96x9Besu5Qs+bike0gC2SioFnwX37n8WosGbpCG8r+wZDCOz
         k5OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ur+fFzVvYF32ak9xx0wg1tr3/ez5Zf6MlIl+DWpbg80=;
        fh=qfM9DoqK6u3S5+DyeKXYke7fMDKq30Vw/9O//AK9DsE=;
        b=sgIyffcP0CvKPcd7Gj3LMTTqGRbeMw17VpMfLPZbjYTH5+OpFTDctklVW2W+gRpjte
         sSZt2SOukHq4qqMEs0rRHZITJLevSclauRy296x5EKMZaTqT/Bg8YNazkEyseUva5RJ7
         sq/dx/zVg/7iy4SdlpVJNH3plL1xQVWAyGOo1qDzF6SjbBxBnxDT/0tD7O/bqeMfs+kW
         R8cAICjDzpeo9Xlq2kr8oCn6Opp/fA6AKl8yFC0G7W0T+S/OFUMu6lkMr+dg3dGkA4aa
         i3ckPv8acjzN31kADpja2UMnjKtLK7PWhHMoiyRkMFuATy32bE6FqWpIGduGqb4q/D7D
         xO9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791902435; x=1792507235; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ur+fFzVvYF32ak9xx0wg1tr3/ez5Zf6MlIl+DWpbg80=;
        b=R1fhVwD+nBftut0ooyBiU9QLzlQ7+UC70po/m7xipubAJ2Tn4tWJi9YL0rwcJHgQMn
         +irR2ZpX6SGFfRdxoVER4cJDg0TOS2wOp/xBbVeIQu543d9zWsUoL0+6bzQ24VdlxG/S
         HEWPKVB/LTzjTbanAtUuOgJDeWFKKpmsXXwcRm8nXeUBrE46jwhSGPISJJT51bFSiv9w
         vVZR0Er3qvczaOdPKVVU3O6P4f0EtkzZFd4IsgFAgSHiA0noIG+AACwp2TWnsHntnGgc
         bAQdI3HAUkhjtyGo19pzDTojH0mJH0yJu0zHqTDmCd7/ZR+7PK6nJ5f3M7IXFpsEeWVg
         FtVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791902435; x=1792507235;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ur+fFzVvYF32ak9xx0wg1tr3/ez5Zf6MlIl+DWpbg80=;
        b=ki8kD0LaUzWCUe4NwHGI75682GH0aejWY9p+v+zww3zR0657rx6ctFF6Wdk3CDnhKV
         OnY7jO4MRM6THtzR+MHVLWxrhXZ3o1Se2aiXhdb7NmgFqJs8QxXfy5UqqCZG5MKZzLXK
         IhYPsSSWWGsinlCOjv6z23AuzrDWiOCuZ7KF1eGNWhhCscx+dlKQodzcGizr8COt50WD
         x6D2uQs+t6XrucE7hond0HhrY0BJyNM+CBIR9KrifCQ4/UqnI6G4vMqgwAwbW5W1vf8T
         HLHn4SyTJcaX637+LyqOKVC+PvIHEB6Q9J6yqHoC1MC6CXALCGmK8mX04HLp2ffgbRDe
         a3Dg==
X-Forwarded-Encrypted: i=1; AKwUvBz4upg1QUG6NxLq/Rjnqh35VvSdXgMRRTgzCpB93cfdz8d2s3l5YLDVLXy1ARdVWCT8QqAD6vIeQJVJRHY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbWRVWKZeixn1Witong4GaRSJUAg46ThwEyRth5tOiJsoXX4hW
	FO9EHJDwVE+XhH4vqAxGbDZucQCyAEnEEHnXWZX2k8DD0la1BaXrcLXtPfDeorMv8NCV4zQJ9tP
	EWXcR8ExFv9DZfvUS5QncKAblawpKmgo=
X-Gm-Gg: AYBFou2n+9xhnxPzjPr1e6aeYT+3Z10O25nl2rSVsH95OMplxl73Agj8bfy0CQGQMfX
	ih0MwUv4dmmdgLEfYmaiE88qjvngCEWNhZW43E9Syo2JbpSEbWh1mAMkTy3D1PnUIkAgfy46g88
	W5Twf5uMiy15M3quQcwtrfzWSwkybtd1PxhMYopcUpetV/k9YZVhrHuzzFlKS4W7xbxbbnX//He
	Fa/iutOqZPeJ7i7fpQ9nh+RIGhXvtblQCpg0mEkj8xpSNuU5YVDQ73u8x5IcjfRbpsrARUEWXuj
	hCd2xlO0O9FsoxvZ7a19GGksDSVTuslHZvHkoiOyRc9G4ONxr+1VVFzyaddgMCzTw1Qa/3AMcWr
	Q68RXui5EIv4Wq+6HSQpLnvh8kYlIDwFQn2Vxt1rJQ0x+3gK+9+ZGdWypKuNZGVQxQD6n
X-Received: by 2002:a05:6214:401a:b0:914:7df6:ca52 with SMTP id
 6a1803df08f44-91b555788ffmr233587636d6.9.1791902434413; Tue, 13 Oct 2026
 07:40:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013125825.3080-1-efraimvander64@gmail.com>
In-Reply-To: <20261013125825.3080-1-efraimvander64@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 13 Oct 2026 11:40:22 -0300
X-Gm-Features: AclHuK8jJ9JCEsX4JMkok-vG9E5rUqlzPeYagnBj5-Emes070Nban37h84QOnpQ
Message-ID: <CAMAsx6cNwhdZGWa87ZcXhcbKvT5bPu+_MEK11D0rfiEV1_9vkg@mail.gmail.com>
Subject: Re: [PATCH] docs: translations: pt_BR: translate cpu-load.rst
To: "Efraim E. Vander" <efraimvander64@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "Efraim E . Vander" <fraimvander64@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 09:59, Efraim E. Vander
<efraimvander64@gmail.com> wrote:
>
> Translate cpu-load.rst into Brazilian Portuguese and
> add it to the pt_BR admin-guide documentation index.

The patch doesn't change pt_BR/admin-guide/index.rst. To be added to
the index, cpu-load should be moved from the "Todolist" to the toctree,
next to README and devices.

> Assisted-by: LLM
>
> Signed-off-by: Efraim E. Vander <efraimvander64@gmail.com>

Please keep both tags together, without a blank line between them.

> ---
>  .../pt_BR/admin-guide/cpu-load.rst            | 126 +++++++++---------
>  1 file changed, 65 insertions(+), 61 deletions(-)
>
> diff --git a/Documentation/translations/pt_BR/admin-guide/cpu-load.rst b/=
Documentation/translations/pt_BR/admin-guide/cpu-load.rst
> index 0c76acabe..f0bb48e82 100644
> --- a/Documentation/translations/pt_BR/admin-guide/cpu-load.rst
> +++ b/Documentation/translations/pt_BR/admin-guide/cpu-load.rst

This patch doesn't apply to docs-next. pt_BR/admin-guide/cpu-load.rst
doesn't exist in the tree yet, but the patch modifies it instead of
creating it. That's why it has removed lines: it seems it was generated
from a second local commit on top of a first draft, so the "-" lines
refer to text that only exists in your tree.

Please squash your commits (or generate the patch against docs-next),
so that the file is created from scratch ("new file mode",
"--- /dev/null", only "+" lines).

> +O Linux exporta diversas informa=C3=A7=C3=B5es por meio de `/proc/stat` =
e `/proc/uptime`, que ferramentas do espa=C3=A7o do usu=C3=A1rio (*userland=
*), como `top(1)`, utilizam para calcular o tempo m=C3=A9dio que o sistema =
passou em determinado estado, por exemplo::

The original uses ``/proc/stat`` and ``/proc/uptime`` (double
backquotes, rendered as literals). With single backquotes they become
interpreted text and render differently. The same applies to the other
occurrences in the file.

Also, please wrap the lines as in the original document, instead of
keeping each paragraph in a single line.

> +=C3=89 poss=C3=ADvel imaginar muitas outras situa=C3=A7=C3=B5es em que e=
sse comportamento do kernel pode gerar informa=C3=A7=C3=B5es bastante incon=
sistentes em `/proc/stat`:
>
>
> +    /* gcc -o hog smallhog.c */
> +    #include <time.h>

The original ends this sentence with "::", which starts the literal
block. With a single ":", the program below is rendered as a block
quote, not as code.

Also, please keep the example program exactly as in the original
(indented with tabs, same formatting). It is code, so it shouldn't be
changed by the translation.

Before sending a v2, please apply it with "git am" on top of docs-next
and check the result with "make htmldocs".

Thanks,
Daniel

Em ter., 13 de out. de 2026 =C3=A0s 09:59, Efraim E. Vander
<efraimvander64@gmail.com> escreveu:
>
> Translate cpu-load.rst into Brazilian Portuguese and
> add it to the pt_BR admin-guide documentation index.
>
> Assisted-by: LLM
>
> Signed-off-by: Efraim E. Vander <efraimvander64@gmail.com>
> ---
>  .../pt_BR/admin-guide/cpu-load.rst            | 126 +++++++++---------
>  1 file changed, 65 insertions(+), 61 deletions(-)
>
> diff --git a/Documentation/translations/pt_BR/admin-guide/cpu-load.rst b/=
Documentation/translations/pt_BR/admin-guide/cpu-load.rst
> index 0c76acabe..f0bb48e82 100644
> --- a/Documentation/translations/pt_BR/admin-guide/cpu-load.rst
> +++ b/Documentation/translations/pt_BR/admin-guide/cpu-load.rst
> @@ -1,27 +1,26 @@
> -
> -
>  .. SPDX-License-Identifier: GPL-2.0
>
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  Carga da CPU
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -O Linux exporta diversas informa=C3=A7=C3=B5es por meio de `/proc/stat` =
e `/proc/uptime`, que ferramentas do espa=C3=A7o do usu=C3=A1rio (*userland=
*), como `top(1)`, utilizam para calcular o tempo m=C3=A9dio que o sistema =
passou em determinado estado. Por exemplo:
> -
>
> -$ iostat
> -Linux 2.6.18.3-exp (linmac)     02/20/2007
> +O Linux exporta diversas informa=C3=A7=C3=B5es por meio de `/proc/stat` =
e `/proc/uptime`, que ferramentas do espa=C3=A7o do usu=C3=A1rio (*userland=
*), como `top(1)`, utilizam para calcular o tempo m=C3=A9dio que o sistema =
passou em determinado estado, por exemplo::
>
> -avg-cpu:  %user   %nice %system %iowait  %steal   %idle
> -           10.01    0.00    2.92    5.44    0.00   81.63
> +    $ iostat
> +    Linux 2.6.18.3-exp (linmac)     02/20/2007
>
> +    avg-cpu:  %user   %nice %system %iowait  %steal   %idle
> +               10.01    0.00    2.92    5.44    0.00   81.63
>
> -Nesse caso, o sistema considera que, durante o per=C3=ADodo de amostrage=
m padr=C3=A3o, passou 10,01% do tempo executando tarefas no espa=C3=A7o do =
usu=C3=A1rio, 2,92% no kernel e permaneceu ocioso durante 81,63% do tempo t=
otal.
> +Nesse caso, o sistema considera que, durante o per=C3=ADodo de amostrage=
m padr=C3=A3o, passou 10,01% do tempo executando tarefas no espa=C3=A7o do =
usu=C3=A1rio, 2,92% no kernel e permaneceu ocioso durante 81,63% do tempo.
>
> -Na maioria dos casos, as informa=C3=A7=C3=B5es de `/proc/stat` refletem =
a realidade com bastante precis=C3=A3o. No entanto, devido =C3=A0 natureza =
da forma como e do momento em que o kernel coleta esses dados, =C3=A0s veze=
s essas informa=C3=A7=C3=B5es n=C3=A3o s=C3=A3o confi=C3=A1veis.
> +Na maioria dos casos, as informa=C3=A7=C3=B5es de `/proc/stat` refletem =
a realidade com bastante precis=C3=A3o. No entanto, devido =C3=A0 natureza =
da forma como e do momento em que os dados s=C3=A3o coletados, esses valore=
s podem apresentar imprecis=C3=B5es.
>
>  Ent=C3=A3o, como essas informa=C3=A7=C3=B5es s=C3=A3o coletadas?
> -Sempre que uma interrup=C3=A7=C3=A3o do temporizador (*timer interrupt*)=
 =C3=A9 sinalizada, o kernel verifica que tipo de tarefa estava em execu=C3=
=A7=C3=A3o naquele instante e incrementa o contador correspondente ao tipo =
ou estado dessa tarefa.
> -O problema =C3=A9 que o sistema pode ter alternado entre v=C3=A1rios est=
ados diversas vezes entre duas interrup=C3=A7=C3=B5es do temporizador. Aind=
a assim, o contador =C3=A9 incrementado apenas para o =C3=BAltimo estado ob=
servado.
> +
> +Sempre que uma interrup=C3=A7=C3=A3o do temporizador (*timer interrupt*)=
 =C3=A9 sinalizada, o kernel verifica que tipo de tarefa estava em execu=C3=
=A7=C3=A3o naquele instante e incrementa o contador correspondente.
> +
> +O problema =C3=A9 que o sistema pode ter alternado entre v=C3=A1rios est=
ados diversas vezes entre duas interrup=C3=A7=C3=B5es do temporizador. Aind=
a assim, o contador =C3=A9 incrementado apenas uma vez, de acordo com o est=
ado observado no instante da interrup=C3=A7=C3=A3o.
>
>  Exemplo
>  -------
> @@ -35,67 +34,72 @@ Imagine um sistema com uma =C3=BAnica tarefa que, per=
iodicamente, consome ciclos de
>      |_ algo come=C3=A7a a trabalhar             |_ algo entra em suspens=
=C3=A3o
>                                                (mas =C3=A9 despertado pou=
co depois)
>
> -
> -Na situa=C3=A7=C3=A3o acima, de acordo com `/proc/stat`, a carga do sist=
ema ser=C3=A1 de 0%, pois a interrup=C3=A7=C3=A3o do temporizador sempre oc=
orrer=C3=A1 quando o sistema estiver executando o tratador de ociosidade (*=
idle handler*).
> +Na situa=C3=A7=C3=A3o acima, de acordo com `/proc/stat`, a carga do sist=
ema ser=C3=A1 de 0%, pois a interrup=C3=A7=C3=A3o do temporizador sempre oc=
orrer=C3=A1 quando o sistema estiver executando a tarefa ociosa.
>
>  Na realidade, por=C3=A9m, a carga estar=C3=A1 mais pr=C3=B3xima de 99%.
>
>  =C3=89 poss=C3=ADvel imaginar muitas outras situa=C3=A7=C3=B5es em que e=
sse comportamento do kernel pode gerar informa=C3=A7=C3=B5es bastante incon=
sistentes em `/proc/stat`:
>
>
> -        /* gcc -o hog smallhog.c */
> -
> -        #include <time.h>
> -        #include <limits.h>
> -        #include <signal.h>
> -        #include <sys/time.h>
> -        #define HIST 10
>
> -        static volatile sig_atomic_t stop;
> +    /* gcc -o hog smallhog.c */
> +    #include <time.h>
> +    #include <limits.h>
> +    #include <signal.h>
> +    #include <sys/time.h>
>
> -        static void sighandler(int signr)
> -        {
> -                (void) signr;
> -                stop =3D 1;
> -        }
> +    #define HIST 10
>
> -        static unsigned long hog (unsigned long niters)
> -        {
> -                stop =3D 0;
> -                while (!stop && --niters);
> -                return niters;
> -        }
> +    static volatile sig_atomic_t stop;
>
> -        int main (void)
> -        {
> -                int i;
> -                struct itimerval it =3D {
> -                        .it_interval =3D { .tv_sec =3D 0, .tv_usec =3D 1=
 },
> -                        .it_value    =3D { .tv_sec =3D 0, .tv_usec =3D 1=
 } };
> -                sigset_t set;
> -                unsigned long v[HIST];
> -                double tmp =3D 0.0;
> -                unsigned long n;
> -                signal(SIGALRM, &sighandler);
> -                setitimer(ITIMER_REAL, &it, NULL);
> -
> -                hog (ULONG_MAX);
> -                for (i =3D 0; i < HIST; ++i) v[i] =3D ULONG_MAX - hog(UL=
ONG_MAX);
> -                for (i =3D 0; i < HIST; ++i) tmp +=3D v[i];
> -                tmp /=3D HIST;
> -                n =3D tmp - (tmp / 3.0);
> -
> -                sigemptyset(&set);
> -                sigaddset(&set, SIGALRM);
> -
> -                for (;;) {
> -                        hog(n);
> -                        sigwait(&set, &i);
> -                }
> -                return 0;
> -        }
> +    static void sighandler(int signr)
> +    {
> +        (void) signr;
> +        stop =3D 1;
> +    }
>
> +    static unsigned long hog(unsigned long niters)
> +    {
> +        stop =3D 0;
> +        while (!stop && --niters);
> +        return niters;
> +    }
> +
> +    int main(void)
> +    {
> +        int i;
> +        struct itimerval it =3D {
> +            .it_interval =3D { .tv_sec =3D 0, .tv_usec =3D 1 },
> +            .it_value    =3D { .tv_sec =3D 0, .tv_usec =3D 1 }
> +        };
> +        sigset_t set;
> +        unsigned long v[HIST];
> +        double tmp =3D 0.0;
> +        unsigned long n;
> +
> +        signal(SIGALRM, &sighandler);
> +        setitimer(ITIMER_REAL, &it, NULL);
> +
> +        hog(ULONG_MAX);
> +        for (i =3D 0; i < HIST; ++i)
> +            v[i] =3D ULONG_MAX - hog(ULONG_MAX);
> +
> +        for (i =3D 0; i < HIST; ++i)
> +            tmp +=3D v[i];
> +
> +        tmp /=3D HIST;
> +        n =3D tmp - (tmp / 3.0);
> +
> +        sigemptyset(&set);
> +        sigaddset(&set, SIGALRM);
> +
> +        for (;;) {
> +            hog(n);
> +            sigwait(&set, &i);
> +        }
>
> +        return 0;
> +    }
>
>  Refer=C3=AAncias
>  -----------
> --
> 2.43.0
>
