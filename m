Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792437134;
	b=0J7R96hA++H9GcpcUcE/URUh4tOVGRIuHaf4P8Umqa4q4Q26o+wVFVGWNrle2kLD3njS
	 LiV0PkvkXC4XjwHwZsyphkU7+jQSdTpsNmFcpIJuXX+/F37JkYHuapCttv+hwmpte3gG0
	 6KYGsORJOhTcycKGt6Ygzp30z0tJWhOGB5irXtNmwXzTaL99YUUXzt79qNkF6WL55KQk/
	 wMiaOsE+4tJNKZVOiK2e8fPxdNuO8juPDvahCT1h+YUK6smjfNI542mln9UfnJy1veAi+
	 E4C/rFk+X3ivrMDlFpvvVI3npmIDVuqoxV4NQF2C1EYrH6oz1oXW28MFQkjpLsuxXTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792437134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=brXSmDy6U/oRKvH40grJe8uDEK1S7rGaavMW9jk3fYA=;
	b=qJJ+QC2xEVwjB3YaabapqSGqv6IC886cfk6gAfVVj0JMliFTnDkT9lVOyL5y/9OQwTgK
	 jjghyEDW19utjHaTCLfTQbivLB5epAukpiDpBVmsrCth4DtgiYo0tusALJPwc6WKfzvvf
	 REDHOhqJelwW3upcUS1FvWRAMTqE7mVpnTNwbegqjUAW4S+heZJFaVNWSZnmPSdgmsfu+
	 CrW3CzhamrFVRPel8/lHFkq8crIu7E7uLOiIK/BSuKA5iN4CXjsHjH2fZnBP/fyxoskDi
	 DgJHhqHyNP/sNs8/n65bLEzSfjM9pjRVpWXrR0zCsRlNY7Pm5q3UBxxEYhwmb3CTS7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b="U/c9xgEk";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1924606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:12:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1924606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=U/c9xgEk
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b2232d8ef5so3711797a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:12:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792437132; cv=none;
        d=google.com; s=arc-20260327;
        b=nJPyTRhYO5kWZSrZsb4t8oIHk3bcGPzgJLdzuo2Cyodpf05FukcuZHunw+lhQaSvUa
         LZ/W6C/RW5wMwrg42xxH7DTznXCsAEzcDzpqFrYklMeldsmUa7uIjRq0lOts775u54Ic
         q2PKl9u5OwazpuHCa5bZTod7owHK+C+qWPVcjDKks28ohYhFabwQ4tNEa06YIarRhzg2
         uIRf4y5y3frBcvk2CmYG8COv2qR6zsthTO5VoMnevK6VoA9HVIoGiALhNZf0zUP46Dck
         Y4y9+u5lECxkYlNbTe366WUuLBHLV/MlM2vLHdn2V7zaSEyvwV8aucBEKxG5eTTrp8Zt
         CHDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=brXSmDy6U/oRKvH40grJe8uDEK1S7rGaavMW9jk3fYA=;
        fh=YsmXH9TmJ5DPXzfvVF8gmwMlXh0TPF1L8WLO/OTjjVo=;
        b=bKkQL56ngEyBcnVobDvLWzczwhAT2aWepXFa0Ydtz47gVKRJvMJkfDK8PoJZ8FWbet
         2Ze0n82D55V818LDAQXlNXFMTTXYnO8+7o5c2DmlYQVzwP6N2EbylQ/45IeNG/WSl8+d
         wjQ/DohGFfU+a8s1akFFFZxuHaD5EnE0EeWNsz3KCxwA06YPe1YnsOjp537fuA1kRLYI
         VPLaf+BoDXSrLoMqRku6gXYM6a3SoCtXiqA1EpuVLhB3q4yJ++0mFS8cMH7y9C2fgBhT
         vpWlooA+NncmTZtcYiG0dYsOzn2XfRFFcgQmkYkxjmGVzO5zQXFzVmXOJ8lWtJs9kAUc
         iXtw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792437132; x=1793041932; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=brXSmDy6U/oRKvH40grJe8uDEK1S7rGaavMW9jk3fYA=;
        b=U/c9xgEk3/Yk28zW/sfw2QYvml8TEfstWHoaPBquHhyY6UjwLmbpz7aQwVI8wYL8jx
         zgstEWorkWpU26FA+0IPmZV+xJOVpD+WfTIGCkjgN64xf9JJLpG9EFFFX3iZ2R7yaBsk
         7OiYgsYg7i24gbhDaiAETBXKZc5mnWw0Clct7eDsNODBQauPSNqEL6Q9FS/szQa+9KWN
         aHWyF7tdw7bVfvTicTuox6CL0URzzeJ6BuOpiwRXt5jOdcAtcNBvG1rAGVwC5E0w411Y
         UqqYwO97E9moWWPlsq+cQhGxFzQzfqxJYgiuHOm9wBR93rRwd/vd27CAVityd/i3Vg2n
         GJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792437132; x=1793041932;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=brXSmDy6U/oRKvH40grJe8uDEK1S7rGaavMW9jk3fYA=;
        b=AtjtihIy3tQQtt8nMSKZcWM8Rntm0Q4O7zrYprWL/yU+AOHedvgeDuoIfMaiSarbzv
         ryy7KRTU2BIuBcIB4jcAd8jUl3klNxTlnQpiICBhznh123yENUCGHW92qvjMb5E/gxHp
         /0rD5tkQqgM9ciJVWrY1KrKhuHSuk0pDXL7n46vqE1r+gneuZWs6nNVqY4dCt+H/w4Cm
         de9kgEPrmMnExawoGwZGiY7Z4+hlEII3oP9/xjFrg1kBFn7GP8LTXtYIT4L4AU0JyFvV
         i20j1gHw/zsi0//o5GAR9Tg5b4m/iD0RaLskWSrhjWb3uJC6ITKMW1e/9vF1Bh5u7kSa
         cYAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfHoTIYNbUafG8i0MC2zjYIf4VTCIRO8dey9FnZphxZCQfIdsODmKOVmWbSIf/fDHEpK2tOLiiwQMpZus=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2IbdFC1Wvpp2/Hu1INaqVd7LxTyhXDl1hbckOeM9kAbt3+mm0
	dVl/O6PFn0TZDRP4eeSR5LLpeuUg35uBOZwpjsO2bcD/eSUAGTX1NXHPcTziBOfBLsU9vAJ5I1P
	DUjlZhuIv4b2+9QHVyWafSahKhdHTZDH789GFn/zVjg==
X-Gm-Gg: AYBFou2LOXDW0vviV/InF7934Lu5hiCQKaCRfsCBpbjDqP7b8m9eFcqAcsHZYsjLIP1
	CSUJzFOCx9rpTJBax7MhggyLBpCjjOk9OT/mt6TQI/UlWbF21ccWSERJzCo34TMlRBCWOSon5OH
	t9xRJB5G4CYezrV4FIfU9CsMeyDoV4wPQ4JMb1X55PPLmrUSGIjfdQrfeTE55BfI1+8uc+Efgj5
	af9dQJtjcU2Ld59zewq0Z1nemmlMQXB2eeBHKgpfuftpTgOC68H+KIl6mMHetJOJwjdVEIMlkZ0
	N5ELnOfh3wXw4b/QKedw/nAakwu/XwUy/5Pu+GMdq9Nqeg5I/L5a56cV6hbA8JqoynUkZDTYvMk
	IvVSVWrz2GP1E3DLNoWXsTU+j/KmfP7LNwb3qgbBNP59XNpm5GiSP5xwGI8dGUOzlLBjXOqveDk
	m4M1S5jY5ciJOU
X-Received: by 2002:a05:6402:a295:20b0:6b1:c6ad:ae3f with SMTP id
 4fb4d7f45d1cf-6b3a8199b12mr3606189a12.35.1792437131823; Mon, 19 Oct 2026
 12:12:11 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019011446.834487-1-pasha.tatashin@soleen.com> <SJ1PR11MB608365E406C4DA7CB91858A4FC982@SJ1PR11MB6083.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB608365E406C4DA7CB91858A4FC982@SJ1PR11MB6083.namprd11.prod.outlook.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Mon, 19 Oct 2026 15:11:32 -0400
X-Gm-Features: AclHuK81i0D--1zvoLFLDSEjKdb8OtLyg3_R_Omdu6BLSuefBq3mveb_0VEz-04
Message-ID: <CA+CK2bAQr=Ak1u-Aiwbw=DZ22Nk8oRDqnC2AnRaez7nOyJj0-w@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] x86, sched, mm: Speed up CPU hotplug on large systems
To: "Luck, Tony" <tony.luck@intel.com>
Cc: "kees@kernel.org" <kees@kernel.org>, "rppt@kernel.org" <rppt@kernel.org>, 
	"juri.lelli@redhat.com" <juri.lelli@redhat.com>, "nik.borisov@suse.com" <nik.borisov@suse.com>, 
	"tglx@kernel.org" <tglx@kernel.org>, "vschneid@redhat.com" <vschneid@redhat.com>, 
	"kprateek.nayak@amd.com" <kprateek.nayak@amd.com>, 
	"vincent.guittot@linaro.org" <vincent.guittot@linaro.org>, "bp@alien8.de" <bp@alien8.de>, 
	"jpoimboe@kernel.org" <jpoimboe@kernel.org>, "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>, 
	"david@kernel.org" <david@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"seanjc@google.com" <seanjc@google.com>, "ljs@kernel.org" <ljs@kernel.org>, 
	"zhangguopeng@kylinos.cn" <zhangguopeng@kylinos.cn>, 
	"dietmar.eggemann@arm.com" <dietmar.eggemann@arm.com>, "mhocko@suse.com" <mhocko@suse.com>, 
	"Gomes, Vinicius" <vinicius.gomes@intel.com>, "vbabka@kernel.org" <vbabka@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"peterz@infradead.org" <peterz@infradead.org>, "surenb@google.com" <surenb@google.com>, 
	"hpa@zytor.com" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>, 
	"dmatlack@google.com" <dmatlack@google.com>, 
	"tim.c.chen@linux.intel.com" <tim.c.chen@linux.intel.com>, 
	"kexec@lists.infradead.org" <kexec@lists.infradead.org>, "pratyush@kernel.org" <pratyush@kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, 
	"gmonaco@redhat.com" <gmonaco@redhat.com>, "jgross@suse.com" <jgross@suse.com>, 
	"mgorman@suse.de" <mgorman@suse.de>, "Graf, Alexander" <graf@amazon.com>, 
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "liam@infradead.org" <liam@infradead.org>, 
	"ridong.chen@linux.dev" <ridong.chen@linux.dev>, "blum@kernel.org" <blum@kernel.org>, 
	"longman@redhat.com" <longman@redhat.com>, "bsegall@google.com" <bsegall@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 2:22=E2=80=AFPM Luck, Tony <tony.luck@intel.com> wr=
ote:
>
> > Benchmark workload (mean of 10 runs per step):
> >
> >  # echo 1 > /sys/kernel/rcu_expedited
> >  # for i in {1..N}; do echo 0 > /sys/devices/system/cpu/cpu$i/online; d=
one
>
> Side question. Have you had issues with this step failing on large system=
s with "smart" I/O
> devices that support many interrupt vectors?
>
> Some validation folks inside Intel had some tests that looped taking all =
CPUs offline and
> bringing them back. They complained starting around Sapphire Rapids this =
their test
> would get down to just CPU 0 and CPU 1 and fail to take CPU 1 offline bec=
ause there
> were too many interrupts to fit into just a single CPUs available vectors=
.
>
> It was a while ago, so maybe something changed in interrupt code to handl=
e this.

Hi Tony,

I didn't encounter that issue while collecting the benchmark data.

For the Live Update work I'm currently doing, I leave 8 CPUs on the
host to perform kexec while the AP CPUs are removed from the
scheduler. In the future, I plan to leave only one host CPU and have
the remaining CPUs manage the VMs in Caretaker mode.

Best,
Pasha

>
> -Tony
>
>
>
