Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FDE349CF0
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789964861; cv=pass; b=LR6OvMlxgbw6RF2O8PGxSSl1eaXgSbxlJfUiWXcKQ+xMWhYCitxnogVy+VOPWbBMzKv3ckOX/6CRjOgj0TdxpstRYEMlk2VO6p4mvD4wUuuDyluPdn98IcDnhRyJGcRJXzTsthMheT7nB4yUkBEVvS5Trzs/fYX6mYQgUa8r1hY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789964861; c=relaxed/simple;
	bh=OXHlmbHqYZPoffpzb4G+f1JwyrrSRzIC2VXrKgbZDkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oqzv22YCrLI8+SZvE4ghgc34S5CafWwfxATxKCLVHhV4yvdm1Q6bm50lOCWMnOzrwcxV7AtMSfy+TZ3g+1bC6ZkLLlnxeXE2AhyLnXgQNtFOmj/Xh0LqtrNK66eXwMAOMeGQxF1CJ4TB2WG/wLQsQazlm5xZfimD4zI4y5+Yz+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com; spf=fail smtp.mailfrom=uber.com; dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.b=VRWMS9G1; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=uber.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.b="VRWMS9G1"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab201ebso1734257d50.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 21:27:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789964859; cv=none;
        d=google.com; s=arc-20260327;
        b=CVelZh1x/za1rAQpq0e+gfUH4GP10mgKQ9UKx+g4Wu9k8Np7mKF97nvPjFsxZ0B9pg
         bKcZs/waFwrbk7Z12vFwizlAP6vW7lZU0mGt1mxGEJNdZgyFUUJ/5TtfMbjWRevznGTz
         11/7pddqntvS3ulsJn9zomlm++N9fW9us5ssBFAlY3YCA1p+JkJa81M3MAH7GX3L426y
         avnseUK2Fw4YzI3F+d/cq36JndAFeX/iew+tPUO8b0bsj3AeoZnm6eF0QMNsR+N+PmA6
         UVDnxa1iQUY/V757A5hkCBoUCtwruYFqIrwe5c/O7oo3AXIfx4Rcqxmaz+F6XLDUc/O7
         Eyqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vHXcPbrTNAxtI04gX/24blX4z6iN9+N0kM3fkVzoCUc=;
        fh=pgMS2mQ6Uo2lLT/lVhmu7F+UbDvo1dQPaCKAaKlv5jE=;
        b=NA8GLfcQZjNwO986ZgrsoMg70f7Hu7yKLKrL7wfOt8NCmwVN9FHAKnmmvRHqUpWbUc
         cyxIYlVQ8r85fHjkGnatT54Zj3+EmoE118nC67YyqFdVahTL7oYF21VLnWeATvLmlF0D
         jI7JZq7x3R6s2JPy1pu9qtN6mhSR9Swchy9v0OEfYfyvvBBuVB4NwKxPcaTewDQqBwOA
         70faZE4S+48wy6xhObqn6pADpQ58anYJ9+n3uxBlQLLU9H+VMqWN3zBO9hjqxlIrFOxe
         WYtfDcOYwoIAA5+LBsR/uFt4gvmz20lqm/zQyHJTNmT9dwofWVFw8OuoYdacKqe5/2So
         rmQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google; t=1789964859; x=1790569659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vHXcPbrTNAxtI04gX/24blX4z6iN9+N0kM3fkVzoCUc=;
        b=VRWMS9G1Cq1IpDDpM99kgry6sBiqFNEKa2J8Nen3ORd4d+LcJmugpiEvns6O9Sg0yr
         JyGqbov2q8/Ld4KSbFQla5BCLvbNYr/HCbBL4Tn0tbXap20YmEqxn2UlUCenS5P/XUCR
         uAW2VVwT8Rk1hM3u/WWaQpl+uMp6XeC79basU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789964859; x=1790569659;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vHXcPbrTNAxtI04gX/24blX4z6iN9+N0kM3fkVzoCUc=;
        b=RHC/mATccIpcU6v9gBUvBM01aU7CHgkxvvGyEiu1Luk18CjYVSV9Oxd4FQiUu6niZn
         BPL6FnuLnv+6XXkOHJXLI9n4szOiY/8z3ccSSwaFAlRGDl7f0WxFG7/4hGody+GrPgyG
         FIp66lEWOGI4FhmC2gLHdLGEVdHaU49MZPtXCgZv4z3PM4AHJkPDK7BUB1nRtXDpAip9
         rWIcG3GVtj/aBdAKb2k1Nsvr7gjz+gjeJt3ppselEVkxW0ZfOaQfwhcYlrZTUQlPsrCh
         +ywyYaFAF0ZOwwCMq8MgHMZss2b/YWGTV4qzIsB/md7AnOo3KZzi7bvxrxVghbfW0wMm
         dtNg==
X-Forwarded-Encrypted: i=1; AKwUvByqriW6lz3hFxqRldDgNIEgaR+3sS3gx3zvLaPg3XUfxlVnqfaDbO7+kvMbAp9a1ZNZUXbLnayJdd5np/M=@vger.kernel.org
X-Gm-Message-State: AFuF++kW7KwZvMRpJnRRROGsmhVABeImthDQJqJ5alPyAPeakH3tE1vO
	Pokx/GVKgcUIbUwayxDemW5GtNJjXj3wo74RQXQys/w1Pl09aoBjjttDTUls+c5iZ2TWmUlFEBB
	pHsxyncon3ed+ZEbKoZQeMpTdNbPEJVoD+OFyLJ5Iiw==
X-Gm-Gg: AYBFou2UoV8+98e+8+oecQ0W3JeM8lOnlM6Oiw63XDfTSxtjkuNGUFhpJSCenpSarzv
	6NZFai1HbJcVc2xBVcpWnrRI7jliViVkN+GhHZf5OwvK1sOk16wB7jXo9Xd7AEuL+1E+8D8eotc
	yAD2buR75NPph3KcJayV0jqfxOXB6NgmundG7kb2ahrp3vggED7w9amJOvMaIKkOoaYn0Shn5lk
	YEl7fE4Yar8vVzsADD9ye9NzjHbXbNFfO/DFz0oXjIuaL0mtPK//Qeo2GAey5QMG/tdfA9hxjF5
	qA4Qt761c4+kc1SUC+7zZot3bbUXDHHLLC7r1V1Olid7qei2WlX9zKJluwhFRnS/9livW1gArCA
	rzz0R+On/U3c=
X-Received: by 2002:a05:690e:11c9:b0:66f:b1e4:f158 with SMTP id
 956f58d0204a3-6717fdab5b1mr2698964d50.46.1789964858081; Sun, 20 Sep 2026
 21:27:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919-perf-symbol-memory-send-v2-0-495b8f00ad7c@uber.com>
 <20260919-perf-symbol-memory-send-v2-2-495b8f00ad7c@uber.com> <arB0RCpi9szb5d_R@z2>
In-Reply-To: <arB0RCpi9szb5d_R@z2>
From: Alireza Haghdoost <haghdoost@uber.com>
Date: Sun, 20 Sep 2026 21:27:22 -0700
X-Gm-Features: AcwNN1XQbDYRv7d1MBZTRlnAPAQksPbSbaIYVIK2RGcLdF2_Normr9MWW17F3cE
Message-ID: <CA+w=M=Te46a3918scFJrZ=KB5O5idGRFZL6LXH24srqPM2xC+w@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] perf script: Add --max-symbol-bytes to bound ELF
 symbol memory
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andriin@fb.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> > @@ -90,7 +90,7 @@ struct symbol {
> >       u64             start;
> >       u64             end;
> >       /** Length of the string name. */
> > -     u16             namelen;
> > +     u32             namelen;
>
> Why is this needed?  Do you have symbols with a really long name?
> Anyway, it should be a separate change then.
>

I will drop this change in the v3.  This is a theoretical edge case
and I don=E2=80=99t have a real workload
that hits it.
