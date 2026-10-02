Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FDC3451A7
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 05:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790918696; cv=pass; b=MX0WLIZjYO84IXEXyOXllPLOIeT/mrtFkVXSdun/Z1MJM1KW4UwESwqlnNLyqI/XCzUaNPPqvv7pn6WEA6/Uz1QpKyaC59iAq/T5XuvzfCjNbdtouJ8mYPqZil6KJGeVEza+39va6clFCeoQ1CL61lJXzbWANOvPVWjQYDGud+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790918696; c=relaxed/simple;
	bh=AgbjDsS5lsfyMARcwlscp79r02AMFNcwmrlRSUCHz2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J1LaAxYVC+P00OAMB+8/XO+luxf2eUKtHMIZKcVtfBEDGG60c8Q4JYNqkQXBQxka6+iZ/vYicn96He9JsARrpCoIfqOd8t0hKPxnWARMsGlXIkOuO7pvyA8sWPABDUfajOUMonBkUSy2kS238YPFCDPyc3bqjo3ZqmmRY7r1YEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cyzRReIj; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cyzRReIj"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-533202fe429so204081cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 22:24:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790918694; cv=none;
        d=google.com; s=arc-20260327;
        b=E9bPmDXGUlUqHzvmUeRlng4af16W6UjncSyLPzrcj/2+rPg9iU0m9UNGpfHyg4ly9E
         0eV/1b4vaAkGxouTKkMsF9Hx+HkVt1lvCqCyGsimqO+RfCgGaBVM5/XuihCo3HRGy3Qs
         Yp99dfWxVktjBvDxgzAdqpWfQeLDTYY9NmWuFPvr+WUIv5QqJl15Vgibj9BaG9Tqvc/E
         HURSJiNQSkoRnzF7UTI/3G0Nbr2ivW/8D6KWGLRYTudrfcg1Nlq1zyJsDXdn6DQa/Ba8
         Q3+so5ZZs6xv0m0TDCqgHPcTMi+rXLz4YatS6ueUx17cxDKmmAlfloSamfwGdav9ZX+T
         DYeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9Gmik/JH3KYpHeHcblH+j+Dkl3JiyUyYaTbyhIO5zOQ=;
        fh=6dw3UDNOpmNILAoay3a5P4zLGyFT4JbwBFijQyaoRfk=;
        b=kS98tR5z/jRM5tEk9cVCDinbV0ICnegzwhDc1rV9tV/YYG3eGM5DoM+Lbr8E3BsxrT
         z2K2Zm91gBBlcpF7ZClSLtW1Kn9pYC/L5V0YyWBnPY6sgRAeRCi4r4+4WXMBArCfWjbP
         x9dY7sxmsnCM8+4l4LFu3XE4x/oBl8EPTtcw8gVTEq0wlb3rD52P21Os3Z+Jr146HFJk
         75HQ36YUnSk/G5gD6BPfpss+TuR+Gk77L5wx9e+l4HyR6BI9Aza32cjZgC+UZP/sIZcV
         KeDr1o89XXrVThQruKeu4ZeWubMPgtApQ1Qs7J46WuVMGg1O1ogVNbaRDSg0NW39K4rz
         dHxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790918694; x=1791523494; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9Gmik/JH3KYpHeHcblH+j+Dkl3JiyUyYaTbyhIO5zOQ=;
        b=cyzRReIj1f7iRpHdg8kV7YaayBQNi/mXhx0NkhTmlBgk82Fc9XPkzAsXQYMS4JPoLL
         f8ZWkmtHo1CnGT6q6nSciAr3kP2YSJ/cinAOoHidcJ999p4FpiOdsUzQz7c4AbEyYVYR
         TFpRXuVI/Ff5cPt5FJQ9AbD5nHhIbLMdEC6koBjzz1GsIAA9Koz2HhY72H8ZP7q0UQAc
         LA9VovtkL3/l67qNlENtPTuZYd0XEW76j+STqc8wf9bNf0kSsuH8IWLBkkKjS8iBxZ6U
         MAaKZdK2a8XS2T1gyAjF/JRQkwH94a3QLmKrZXGFn83TGZ31FueJuF5hiL4UPCOL9SXQ
         0yGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790918694; x=1791523494;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Gmik/JH3KYpHeHcblH+j+Dkl3JiyUyYaTbyhIO5zOQ=;
        b=B2dhUzwzFJXdGVQnEL9q46pW5KZ3unrvRYOQQJmw1AfPeh+J+HGJV8xgjyGQa3kX+E
         +kZmqgiW6sSOlR87WRxg8Ke7hYmRYl+/y7zoQbNxPizPX2AdK42duRKeE/a27ZItZcCl
         jWVXogyymdaFWGNnfJ/4iquC2XcZPaLtL4E/bQlocURwv5PQ/DbMIHkZ18MPu4AiaKE2
         TE4GU5O0281eI9qYHkJzSY5mgEc5r4qEcKmUuh0zBCHp95RaQYOU+LBLCFiqNLBlYfR6
         ZnN6MfodTda4PNNP9GAbB+8ylK/i3VlpkMQTbKd44FwLPveOS5dHBEBAfzYj7EiTVwio
         46Sg==
X-Forwarded-Encrypted: i=1; AKwUvByZ7F65pK+ZZjZrXV6w1Ya3qpxM2QIPjXqIe9bF9ZWUJckIpKPzqMgAN2qkAHMDPtzzO9uO67PLsk/JcWI=@vger.kernel.org
X-Gm-Message-State: AFuF++mS60Q6tKVjT3m57eS97bQeqonil0GxRKbqg7JhVtXLJcbl1HaJ
	+6/iMaGWdJU43MMZ6viIS80xxa9XXWl4T8bmqoFdlf6YbdaTDVgnU78Vg0BO85yxM2NNiAtFVnU
	kTdxqKT5XovWuqAD3JoItd78A4hGiguIViiofhfof
X-Gm-Gg: AYBFou1T3q8sO501yiXdUG1r5NrkenS5NiaT8u7o84RVocbvI1wJ4AnF1JcqaYnGUvc
	SF6XWpxgGYLZs/IdxbbEdWo7SDc2GqZm/0q2lmZgqzzUDb62haAyV34qWIVbN4yxpAm7A0Kbvor
	V2BAWZUJDsR/BOxCwsJuV+WZwG7XgCxPJItNdTkwhheUAIVnJHAfXAHZ6TpekrgHJApEdbn65HU
	QxCaSFJGjBTFcp7KVNWAqD2v8R6SyL0zQNSLzjDiHOg9psBKsSZjJh3Et5NVR/ltALM5sA02hCK
	VF5U/mzpTesurGM0TgCQEWLsr48bRELm/a4trLRStMqou6CwVMPvNTZn
X-Received: by 2002:a05:622a:a589:b0:532:9003:35b1 with SMTP id
 d75a77b69052e-53415907a70mr7003641cf.2.1790918693454; Thu, 01 Oct 2026
 22:24:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001182004.1160406-1-stephen.s.brennan@oracle.com>
In-Reply-To: <20261001182004.1160406-1-stephen.s.brennan@oracle.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 1 Oct 2026 22:24:41 -0700
X-Gm-Features: AclHuK8mubcw7BhJ75MV7VJWnxC4pQdcA1lTTatey5BiecspBFY39lU4gOqswrA
Message-ID: <CAP-5=fVkoy6ZJ_3Y3E2s=7ccdQd3aUz_g-e6ivX68=aHBsmnkg@mail.gmail.com>
Subject: Re: [PATCH 0/2] perf script flamegraph: Fix input file name errors
To: Stephen Brennan <stephen.s.brennan@oracle.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Namhyung Kim <namhyung@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, 
	James Clark <james.clark@linaro.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jiri Olsa <jolsa@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org, 
	Alice <alice.mei.rogers@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 11:20=E2=80=AFAM Stephen Brennan
<stephen.s.brennan@oracle.com> wrote:
>
> The flamegraph.py script has a "-i" option which it uses in an attempt to
> know the input file name for the data it is processing. But perf itself i=
s
> using that flag and not forwarding its value to the script, so the entire
> strategy won't work. It's further complicated by how the option processin=
g
> is handled in the flamegraph-report script -- details in patch 2.
>
> This series introduces a helper to allow python scripts to see the input
> file name, and then fixes flamegraph.py. Testing with a variety of option=
s
> like below shows that it is using the correct input files in most use cas=
es
> I can think of:
>
> $ export PERF_EXEC_PATH=3D$(pwd)/tools/perf
>
> $ sudo -E tools/perf/perf script flamegraph -a -F999 -- sleep 1
> dumping data to flamegraph.html
>
> $ sudo -E tools/perf/perf script record flamegraph \
>                           -o myfile.data -a -F999 -- sleep 1
> [ perf record: Woken up 1 times to write data ]
> [ perf record: Captured and wrote 2.891 MB myfile.data (1832 samples) ]
>
> $ sudo -E tools/perf/perf script report flamegraph -i myfile.data \
>                                  -- -o myfile.html
> dumping data to myfile.html
>
> $ sudo -E tools/perf/perf script \
>        -s tools/perf/scripts/python/flamegraph.py -i myfile.data
> dumping data to flamegraph.html
>
> $ sudo -E tools/perf/perf script record flamegraph \
>        -o - -a -F999 -- sleep 1 \
>     | tools/perf/perf script report flamegraph -i - -- -o manual.html
> [ perf record: Woken up 1 times to write data ]
> [ perf record: Captured and wrote 2.936 MB - ]
> dumping data to manual.html

Hi Stephen,

Thank you for the contribution! Unfortunately we recently deleted all
of this code in this series:
https://lore.kernel.org/linux-perf-users/20260926062029.800743-1-irogers@go=
ogle.com/
You can find the latest code in the perf-tools-next branch:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/
The flamegraph code that now uses perf's python module is here:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/python/flamegraph.py?h=3Dperf-tools-next
and we even have some tests now:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/tests/shell/test_flamegraph_python.sh?h=3Dperf-tools-next

You may also like to play with the console flamegraph that is part of trepo=
rt:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/python/treport.py?h=3Dperf-tools-next

Thanks,
Ian


> Stephen Brennan (2):
>   tools: perf: add perf_input_name() helper
>   tools: perf: flamegraph.py: fix "Error reading report header"
>
>  .../perf/Documentation/perf-script-python.txt |  1 +
>  .../scripts/python/Perf-Trace-Util/Context.c  | 16 ++++++++++++++
>  tools/perf/scripts/python/flamegraph.py       | 22 +++++++++----------
>  3 files changed, 27 insertions(+), 12 deletions(-)
>
> --
> 2.52.0
>
