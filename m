Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794614325;
	b=kVE9/2+nEw2vHWIZ8jOEGmgDz8lQbHNGVwhrFsb4DvaCHg1VkoAceKmYX63/YnRZsN57
	 9qH8bo+SX44j82kO0H5i6Xac8m4B0zFYKO3E2XAZbC/sw86IJFLjci8bMNGwLAvd97UC4
	 PNxaHAOsRIuWITV78YRA0torvEiSel46c48jpo8Nw7v6yNj/nFeVqNJwGpKN5FE9bVpDd
	 L2UCS114MtA1B870nin5VdFfxTrwAT+O/VCi6jXrWb3J8xTDglj1UdNdmBF9RSaf/oxXT
	 wL5cvk/2bxw0SzPIc0+O/1fZ5x9FiApJrl46kfZcjNmTCoWETl7PfTLni7gZTpvSs4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794614325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:CC:Subject:User-Agent:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=n/DGsb4Q4UQJAUdjwRmLwDE8lUxnn6ZgFmpe2GZ5h9I=;
	b=lkGBUr6WKdMg/oeUZgE9//nbffE5aTBogkHQR7zrAxAQxkZG9+qseI5kb7/A00N9GFcY
	 YF0p1ykLHpST4D6k8xpyPHGmE2A0i7js1gTwioDYeQlyxVeh4mYNsZksghGNDk6GPNbMg
	 008sKVGsbxmTus6AGc0hjWXWJ+iJBVMiFc43QOtJdJ4H/pHnHsg2JLVFMC0ZkyTxM2RVm
	 +QqXhZ08/pSO6IQuIVAA5Im89RAOt+fS9TqDFOoWYYhx3lhvkhU4TGEkEZQtbWzFxdnDw
	 +e52lzLIaYV/ip+fMCn8V6YZpkAEuzO8dsTpvFOrNhnpXuGavGEftBZ2cbRs3RhxHxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=larqWjJS;
	arc=none smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456F8606A89D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:58:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 456F8606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=larqWjJS
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67c6f1019a3so1958061d50.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794614324; x=1795219124; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=n/DGsb4Q4UQJAUdjwRmLwDE8lUxnn6ZgFmpe2GZ5h9I=;
        b=larqWjJSglw1WgxLVg6fCbke/Es+wTZfPspGID0y2pFG0aOQ8y5VCehHOkP51MP+2z
         sEITXV3nZya4uweQjw7fCZVHa66kZXArsfb2BHwlSsOQpE5y6Jfc7suNWObrJJ4P15Ah
         6Mwf87Ts24bKSgRbwilkfl+vY49QF3rSgh2Uc5wZpH9JjLic4BaMEfBEEolCKPuOEuuP
         AocufNuX+lNBbguaAuf/iyIwSaDm9VYcy0xosATiRSugt05wRzed81Tbb4dpvW3Z1D/9
         3+JCGAgyIBlCOyHNMm+zfxjptjtj+mV/A6J/ICBJ+JdB9nW4/UiKD3i4XnEA34nKbX9p
         rZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794614324; x=1795219124;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n/DGsb4Q4UQJAUdjwRmLwDE8lUxnn6ZgFmpe2GZ5h9I=;
        b=WsyL+1V5mrVurRGqJXBiMGQpPfK2xBocU74YRE/nBoAhryLvlvKSvl8tpU3P5WivwT
         oyOo2EEe1eMa0dLClvp5e2hGHFljPJZivS10Hvug8jtTwT5odZz02WtAY2Tbcl/Tf5Ls
         VU50tOCEIzCbnpiQSG1v5+ryuwDxw8ge5Mz55bFJvVCXO9e/7U0o2uBR/4uUHPrIAcRD
         d8MquSrilzF7fWo/lgThmLO3AOc9OKlapzERKinVohqUGe65+3+ohbaqu1MsuABLLJL6
         oKFPx7rnuAI1swLvYISj27EWYyGm0zTl29z5z7oXWLgEVOZo4CEv1/EmWTfvtWTZNih7
         IGOw==
X-Forwarded-Encrypted: i=1; AL+hErFU+n8/R9Je+EHYPykfLWwuVNOKprTeXYwUOlBvV5THscc5pt2BuTRAI5F9GDwPCtcbQZPCnxILwePGlbU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+M/mhxBQR4NolvYy6NZ2bkbuD1vDxLkUeCpdeKY/YZNRpU8cA
	T7TglcvWHtzvjwLxny6UhT9sy38i+TBCSEcrQa0QV8cz8KL0OKI5VKJLMHXKUA==
X-Gm-Gg: AYBFou1k0nDN/2cN8o/+2i+Qso7O7Azz7HjcJHZYW+HcdWZvQkPZp2aouADp9tHiS2e
	l+i1IIh6yYusIUqgwR5Evvj5b8B6OqHumKInrLkYF/9sq+cIkHanpuADBemAuw8RFWXAEJJHMci
	M4mp9udNoRCpIr331nMxkiWDVxkryu2dWmrAWIZEm5t+VH7jAeHRjoKTZX7+rBQeToqzWbAq+HW
	Ftawq4LsITnVG2CYxJvhw3E0R3/jJSW2PTySVjwTwgw+NUam5xKps3VtM8Sw8/LKbRBVrSBc/YE
	XDxIUJFmtGto0QsSuW5BbQ0CYiBONOIFFggAgFAO+QK6ip/a1U0eK/DOTkldUNP/k2W6pn80v95
	JW3YHpS7Iy+A9w2yKPq7kbDJa8k0S7kaWmlvuJnGVBuzHyBPLVGmNyl8hHbiaLvv/n4AMcKsG+r
	rON0zs18GNRKbdVaC5oSwKQBzUjQNSMvJbBYnxEBM8cLYW2o4epDB4HUXWHMgVu4YuOjK0DZlE6
	QClXn1Gm3SLQsFqJ5GXCqhED2Vqda8ua0TrrPHrQSD0LFlTkzpkVHjGRStKQMCh8FDw4AOgSTY2
	TRyObqnEqNnFyMUl6xm3iC45dtQ4ZLncC3JvDypOPncmFg==
X-Received: by 2002:a05:690e:13cc:b0:67c:56a:f173 with SMTP id 956f58d0204a3-67d897bb534mr1772721d50.160.1794614324075;
        Fri, 13 Nov 2026 15:58:44 -0800 (PST)
Received: from ehlo.thunderbird.net ([2804:2bf0:60e7:ae00:c9b7:cb5f:2bf4:1b2e])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a555c15sm3462796d50.8.2026.11.13.15.58.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 15:58:43 -0800 (PST)
Date: Fri, 13 Nov 2026 20:58:38 -0300
From: Arnaldo Melo <arnaldo.melo@gmail.com>
To: Ian Rogers <irogers@google.com>, Arnaldo Carvalho de Melo <acme@kernel.org>
CC: Namhyung Kim <namhyung@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, James Clark <james.clark@linaro.org>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Clark Williams <williams@redhat.com>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_0/11=5D_perf_coverage=3A_A_h?=
 =?US-ASCII?Q?arness_for_perf=2C_and_the_fixes_it_found?=
User-Agent: Thunderbird for Android
In-Reply-To: <CAP-5=fV1FRJcyCHg7vNjptZU996PBXcEcve5m3sYkUtdWSmT8w@mail.gmail.com>
References: <20261113200850.2803460-1-acme@kernel.org> <CAP-5=fV1FRJcyCHg7vNjptZU996PBXcEcve5m3sYkUtdWSmT8w@mail.gmail.com>
Message-ID: <DEB65601-1A5C-4585-894E-EDF6B99BC8B6@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On November 13, 2026 7:16:05 PM GMT-03:00, Ian Rogers <irogers@google=2Eco=
m> wrote:

>Thanks for working on this! Patches 2, 3 and 5 add small C programs
>compiled in a shell test=2E These are a pain for our CI framework; could
>we add them as perf test workloads?


Sure, will do in V3=2E

- Arnaldo 
